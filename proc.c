#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"


struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->ctime=ticks;
  p->etime=0;
  p->rtime=0;
  p->wtime=0;
  p->priority=60;               // default priority
  p->state = EMBRYO;
  p->cur_q=-1;
  p->q[0]=0;
  p->q[1]=0;
  p->q[2]=0;
  p->q[3]=0;
  p->q[4]=0;
  p->lastvisit=ticks;
  p->currentslice=0;
  p->agingtime=0;
  p->n_run=0;
  p->pid = nextpid++;
  #ifdef MLFQ
  p->cur_q=0;
  #endif
  #ifdef YES
  cprintf("%d %d 0\n",ticks,p->pid);
  #endif
  if(p->pid==3)
  {
    // cprintf("%d\n",ticks);
  }
  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->etime=ticks;
  #ifdef YES
  cprintf("%d %d %d\n",ticks,curproc->pid,curproc->cur_q);
  #endif
  if(curproc->pid==3)
  {
    // cprintf("%d\n",ticks);
  }
  curproc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}

int
pow(int kk,int var)
{
  int num=1;
  while(var>0)
  {
    num=num*2;
    var--;
  }
  return num;
}

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.

void
updatetime()
{
      struct proc *p;
      acquire(&ptable.lock);
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
      {
        if(p->state==RUNNABLE)p->wtime = p->wtime+1;
        else if(p->state==RUNNING)p->rtime = p->rtime+1;
        if(p->state==SLEEPING|| p->state==RUNNING)
        {
          p->lastvisit=ticks;
        }
        p->agingtime=ticks-p->lastvisit;
        if(p->cur_q!=-1 && p->state == RUNNING)
        {
          p->currentslice=p->currentslice+1;
          p->q[p->cur_q]=p->q[p->cur_q]+1;
        }
      }
      release(&ptable.lock);
}


void
scheduler(void)
{
  struct proc *p;
  struct cpu *c = mycpu();
  c->proc = 0;
  
  for(;;)
  {
    // Enable interrupts on this processor.
    sti();
    #ifdef RR
      // Loop over process table looking for process to run.
      acquire(&ptable.lock);
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        if(p->state != RUNNABLE)
          continue;
        // Switch to chosen process.  It is the process's job
        // to release ptable.lock and then reacquire it
        // before jumping back to us.
        c->proc = p;
        switchuvm(p);
        p->n_run = p->n_run +1;
        p->state = RUNNING;
        swtch(&(c->scheduler), p->context);
        switchkvm();
        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
      }
      release(&ptable.lock);
    #endif

    #ifdef FCFS
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    int current=0;                // This stores the min ctime values.
    struct proc * curr=0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)// checking if the process is RUNNABLE.
        continue;
      curr=p;                 // This loop is for finding some base current and curr value.
      current=p->ctime;
      break;
    }
    for(p=ptable.proc ; p<&ptable.proc[NPROC];p++)
    {
      if(p->state!=RUNNABLE)
        continue;
      if(current>p->ctime)      // Checking if we find a process with lesser ctime.
      {
        current = p->ctime;     // in that case we will update the current min value.
        curr=p;
      }
    }
    if(curr==0)
    {
      release(&ptable.lock);     // If we didnt find any process then we will release the lock
      continue;
    }
    p=curr;                      // else curr will the process to be run.
    // Switch to chosen process.  It is the process's job
    // to release ptable.lock and then reacquire it
    // before jumping back to us.
    c->proc = p;          
    switchuvm(p);
    p->state = RUNNING;
    p->n_run = p->n_run +1;      // Updating the number of times the process was run.
    swtch(&(c->scheduler), p->context);
    switchkvm();
    p->lastvisit=ticks;          // updating the last visit time.
    // Process is done running for now.
    // It should have changed its p->state before coming back.
    c->proc = 0;
    release(&ptable.lock);
    #endif

    #ifdef PBS    
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    int current=101;                            // This stores the highest priority number(leastnumber)
    for(p = ptable.proc; p<&ptable.proc[NPROC];p++){
      if(p->state != RUNNABLE)                  // Checking if the process is RUNNABLE.
        continue;
      current=p->priority;                      // If we found one then I set that to be the starting val.
      break;
    }
    for(p=ptable.proc ; p<&ptable.proc[NPROC];p++)
    { 
      if(p->state!=RUNNABLE)
        continue;
      if(current>p->priority)
      {
        current = p->priority;                  // changing the min if we see a better one.
      }
    }
    for(p=ptable.proc ; p<&ptable.proc[NPROC];p++)
    {
      if(p->state!=RUNNABLE)                    // checking if it is RUNNABLE.
      continue;
      int tester=0;                         
      if(p->priority==current)
      {
        // Switch to chosen process.  It is the process's job
        // to release ptable.lock and then reacquire it
        // before jumping back to us.
        c->proc = p;
        p->n_run = p->n_run +1;                 // Updating the number of times it ran in the CPU.
        p->lastvisit=ticks;
        switchuvm(p);
        p->state = RUNNING;
        swtch(&(c->scheduler), p->context);
        switchkvm();
        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
        for(p=ptable.proc;p<&ptable.proc[NPROC];p++)// looping through the ptable processes.
        {
            if(p->state!=RUNNABLE)continue;
            if(p->priority<current)             // Checking if there is any better process with better priority.
            {
              tester=-1;                        // If we find such a process then we no longer continue.
              break;
            }
        }
        if(tester==-1)                          // If we didnt find any then we will schdule based on RR
        break;                                  // Which inturn depends on the ctime.
      }                                         // so we continue to look for the process as current in the ptable and this will continue untill we find a better process or we complted looping in the ptable once.
      if(tester==-1)
      break;
    }
    release(&ptable.lock);
    #endif
  
  #ifdef MLFQ
  acquire(&ptable.lock);

  for(p=ptable.proc;p<&ptable.proc[NPROC];p++) // looping through all the process in the ptable.
  {
    if(p->state == RUNNABLE && p->cur_q!=-1&&p->cur_q!=0)// making sure that the process si Runnable.
    {// We need to check the aging time only when the process is RUNNABLE in all other cases the aging time would be 0.
      if(ticks-p->lastvisit >= 22)          // Agingtime is current time - time at which it entered the queue
      {
        p->currentslice=0;                  //  Time spent in the execution is set to 0.
        p->lastvisit=ticks;                 //  Time at which the process entered the queue is updated.
        p->agingtime=0;                     //  Time for which it was waiting is 0.
        p->cur_q=p->cur_q-1;                //  We upgraded the process to its higher priority queue.
        #ifdef YES                          //  This is used to print graph    
        cprintf("%d %d %d\n",ticks,p->pid,p->cur_q);  
        #endif
      }

    }
  }
  for(int i=0;i<5;i++)                       // looping from higher priority queues to lower.
  {
    int current=-1,flag=-1;                  // current is used to store the least visit time.
    for(p=ptable.proc;p<&ptable.proc[NPROC];p++)  // among all the processes with cur_q i.
    {                                        // looping through all the processes in the ptable.
      if(p->state != RUNNABLE)               // We will scheule the process only if it is RUNNABLE.
          continue;
      if(p->cur_q!=i)                        // Checking if the process belongs to the same queue.
          continue; 
      flag=1;                                     
      if(current==-1)                        // If this is the first process then the min will be its 
      {                                      // lastvisit.
        current = p->lastvisit;              
      }
      if(current>p->lastvisit)               // If there is a process withe last visittime before this
      {                                      // Then we will change the current.
        current=p->lastvisit;
      }
    }
    if(flag==-1)continue;                    // If we find atleast one process in the current queue then 
    for(p=ptable.proc;p<&ptable.proc[NPROC];p++)  // our job is done.
    {
      if(p->state!=RUNNABLE)                // Checking if the process is RUNNABLE.
        continue;   
      if(p->cur_q!=i)                       // Checking if it belongs to current queue of interest.
        continue;
      if(current!=p->lastvisit)             // Checking if the prcoess has the lastvisit as minimum in all
        continue;
      p->currentslice=0;                    // If we find one such process p then we will reset the time 
                                            // spent in execution environment tp 0.        
      c->proc = p;                          // We are merking that the CPU is executijng this process.
      p->n_run = p->n_run +1;               // Chenging the number of times the process ran on CPU.
      while(p->currentslice<(int)pow(2,p->cur_q)&&p->state==RUNNABLE)
      {
        p->agingtime=0;                     // While the process is RUNNONG we agingtime is 0.
        switchuvm(p);                           
        p->state = RUNNING;
        swtch(&(c->scheduler), p->context);
        switchkvm();
        p->lastvisit=ticks;                 // lastvisit of the process is aslo the current time.
        p->agingtime=0;                   
        if(p->currentslice>=(int)pow(2,p->cur_q))
        {                                   // If the time spent in current execution time is greater
          if(p->cur_q!=4&&p->cur_q>=0)
          {      
                                            // than the maximum alloted then the proces's queue is 
                                            // decremented unless it is in last queue.        
            p->cur_q=p->cur_q+1;            // Inthat case we incresed the queue.
            #ifdef YES                      // For graph plotting purpose.
            cprintf("%d %d %d\n",ticks,p->pid,p->cur_q);
            #endif
          }
          p->currentslice=0;                // Reseting the current slice.
          p->lastvisit=ticks;               // lastvisit time of the process is updated.
          p->agingtime=0;                   // aging time of the process is updated.
          // flag=2;                           
          break;
        }
        // break;   
      }
      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
      break;
    }
    break;
  }
  release(&ptable.lock);
  #endif
  }
}


// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  static char *states[] = {
  [UNUSED]    "unused",
  [EMBRYO]    "embryo",
  [SLEEPING]  "sleep ",
  [RUNNABLE]  "runble",
  [RUNNING]   "run   ",
  [ZOMBIE]    "zombie"
  };
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}


int
waitx(int* wtime, int* rtime)
{
  // cprintf("%p == %p\n",wtime,rtime);
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        // cprintf("%d %d %d %d\n",p->ctime,p->wtime,p->rtime,p->etime);
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        *wtime=p->wtime;
        *rtime=p->rtime;
        // cprintf("%p === %p\n",wtime,rtime);
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      // *wtime=curproc->wtime;
      // *rtime=curproc->rtime;
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}


int
set_priority(int new_priority,int pid)
{
  struct proc* p;
  acquire(&ptable.lock);
  for(p=ptable.proc;p< &ptable.proc[NPROC]; p++)
  {
    if(p->pid==pid)
    {
      int pre=p->priority;
      p->priority=new_priority;
      release(&ptable.lock);
      if(pre>new_priority)
      {
          yield();
      }
      return pre;
    }
  }
  cprintf("There is no such pid\n");
  release(&ptable.lock);
  return 0;
}

void
ps()
{
  struct proc* p;
  acquire(&ptable.lock);
    cprintf("PID \t Priority \t State \t \t r_time \t w_time \t n_run \t cur_q \t q0 \t q1 \t q2 \t q3 \t q4 \n");
  for(p=ptable.proc;p< &ptable.proc[NPROC]; p++)
  {
     if(p->state==UNUSED)
    continue;
    // p->agingtime=ticks - p->lastvisit;
    if(p->state==RUNNABLE)
    cprintf("%d \t %d \t \t RUNNABLE \t %d \t \t %d \t \t %d \t %d \t %d \t %d \t %d \t %d \t %d\n", p->pid, p->priority, p->rtime, p->agingtime, p->n_run,p->cur_q,p->q[0],p->q[1],p->q[2],p->q[3],p->q[4]);
    if(p->state==RUNNING)
    cprintf("%d \t %d \t \t RUNNING \t %d \t \t %d \t \t %d \t %d \t %d \t %d \t %d \t %d \t %d\n", p->pid, p->priority, p->rtime, p->agingtime, p->n_run,p->cur_q,p->q[0],p->q[1],p->q[2],p->q[3],p->q[4]);
    if(p->state==SLEEPING)
    cprintf("%d \t %d \t \t SLEEPING \t %d \t \t %d \t \t %d \t -1 \t %d \t %d \t %d \t %d \t %d\n", p->pid, p->priority, p->rtime, p->agingtime, p->n_run,p->q[0],p->q[1],p->q[2],p->q[3],p->q[4]);
    if(p->state==EMBRYO)
    cprintf("%d \t %d \t \t EMBRYO \t %d \t \t %d \t \t %d \t -1 \t %d \t %d \t %d \t %d \t %d\n", p->pid, p->priority, p->rtime, p->agingtime, p->n_run,p->q[0],p->q[1],p->q[2],p->q[3],p->q[4]);
    if(p->state==ZOMBIE)
    cprintf("%d \t %d \t \t ZOMBIE \t %d \t \t %d \t \t %d \t -1 \t %d \t %d \t %d \t %d \t %d\n", p->pid, p->priority, p->rtime, p->agingtime, p->n_run,p->q[0],p->q[1],p->q[2],p->q[3],p->q[4]);
  } 
  release(&ptable.lock);
}

// int
// waitx(int* wtime,int* rtime)
// {
//   struct proc *p;
//   int havekids, pid;
//   struct proc *curproc = myproc();
  
//   acquire(&ptable.lock);
//   for(;;){
//     // Scan through table looking for exited children.
//     havekids = 0;
//     for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
//       if(p->parent != curproc)
//         continue;
//       havekids = 1;
//       if(p->state == ZOMBIE){
//         // Found one.
//         pid = p->pid;
//         kfree(p->kstack);
//         p->kstack = 0;
//         freevm(p->pgdir);
//         p->pid = 0;
//         p->parent = 0;
//         p->name[0] = 0;
//         p->killed = 0;
//         p->state = UNUSED;
//         *wtime=p->wtime;
//         *rtime =p->rtime;
//         release(&ptable.lock);
//         return pid;
//       }
//     }

//     // No point waiting if we don't have any children.
//     if(!havekids || curproc->killed){
//       release(&ptable.lock);
//       return -1;
//     }

//     // Wait for children to exit.  (See wakeup1 call in proc_exit.)
//     sleep(curproc, &ptable.lock);  //DOC: wait-sleep
//   }
// }