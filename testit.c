
#include "types.h"
#include "user.h"

int number_of_processes;

void benchmark()
{
    for (int j = 0; j < number_of_processes; j++)
  {
    int pid = fork();
    if (pid < 0)
    {
      printf(1, "Fork failed\n");
      continue;
    }
    if (pid == 0)
    {
      volatile int i;
      for (volatile int k = 0; k < number_of_processes; k++)
      {
        if (k <= j)
        {
          sleep(200); //io time
        }
        else
        {
          for (i = 0; i < 100000000; i++)
          {
            ; //cpu time
          }
        }
      }
      #ifdef No
      printf(1, "Process: %d with PID: %d Finished\n", j,getpid());
      #endif
      exit();
    }
    else{
        ;
    #ifdef PBS
      set_priority(100-(20+j),pid); // will only matter for PBS, comment it out if not implemented yet (better priorty for more IO intensive jobs)
    #endif
    }
  }
  for (int j = 0; j < number_of_processes+5; j++)
  {
    wait();
  }
  exit();
}

void io()
{
    int j,lp=0;
      for (j = 0; j < number_of_processes; j++)
  {
    int pid = fork();
    if (pid < 0)
    {
      printf(1, "Fork failed\n");
      continue;
    }
    if (pid == 0)
    {
      for (volatile int k = 0; k < number_of_processes; k++)
      {
          sleep(300); //io time
          lp++;
      }
    //   #ifdef No
    //   printf(1, "Process: %d with PID: %d Finished\n", j,getpid());
    //   #endif
      exit();
    }
    else{
        ;
    #ifdef PBS
      set_priority(100-(20+j),pid); // will only matter for PBS, comment it out if not implemented yet (better priorty for more IO intensive jobs)
    #endif
    }
  }
  for (j = 0; j < number_of_processes+5; j++)
  {
    wait();
  }
  exit();
}

void cpu()
{
    int j;
      for (j = 0; j < number_of_processes; j++)
  {
    int pid = fork();
    if (pid < 0)
    {
      printf(1, "Fork failed\n");
      continue;
    }
    if (pid == 0)
    {
      volatile int i;
      for (volatile int k = 0; k < number_of_processes; k++)
      {
          for (i = 0; i < 100000000; i++)
          {
            ; //cpu time
          }
          sleep(15);
      }
    //   #ifdef No
    //   printf(1, "Process: %d with PID: %d Finished\n", j,getpid());
    //   #endif
      exit();
    }
    else{
        ;
    #ifdef PBS
      set_priority(100-(20+j),pid); // will only matter for PBS, comment it out if not implemented yet (better priorty for more IO intensive jobs)
    #endif
    }
  }
  for (j = 0; j < number_of_processes+5; j++)
  {
    wait();
  }
  exit();
}

void mixed()
{
  int j,lp=0;
      for (j = 0; j < number_of_processes; j++)
  {
    int pid = fork();
    if (pid < 0)
    {
      printf(1, "Fork failed\n");
      continue;
    }
    if (pid == 0)
    {
      volatile int i;
      for (volatile int k = 0; k < number_of_processes; k++)
      {
        if(j%2==0)
        {
          for (i = 0; i < 100000000; i++)
          {
            ; //cpu time
          }
          sleep(15);
        }
        else
        {
          sleep(300); //io time
          lp++;
        }
        
      }
    //   #ifdef No
    //   printf(1, "Process: %d with PID: %d Finished\n", j,getpid());
    //   #endif
      exit();
    }
    else{
        ;
    #ifdef PBS
      set_priority(100-(20+j),pid); // will only matter for PBS, comment it out if not implemented yet (better priorty for more IO intensive jobs)
    #endif
    }
  }
  for (j = 0; j < number_of_processes+5; j++)
  {
    wait();
  }
  exit();
}

void optimized()
{
   for (int j = 0; j < number_of_processes; j++)
  {
    int pid = fork();
    if (pid < 0)
    {
      printf(1, "Fork failed\n");
      continue;
    }
    if (pid == 0)
    {
      volatile int i;
      for (volatile int k = 0; k < number_of_processes; k++)
      {
        if(j==number_of_processes/2)
        {
          sleep(200);
          continue;
        }
          for (i = 0; i < 100000000; i++)
          {
            ; //cpu time
          }
          sleep(5);
      }
      #ifdef No
      printf(1, "Process: %d with PID: %d Finished\n", j,getpid());
      #endif
      exit();
    }
    else{
        ;
    #ifdef PBS
      set_priority(100-(20+j),pid); // will only matter for PBS, comment it out if not implemented yet (better priorty for more IO intensive jobs)
    #endif
    }
  }
  for (int j = 0; j < number_of_processes+5; j++)
  {
    wait();
  }
  exit();
}

int main(int argc, char *argv[])
{
  if(argc!=3)
  {
      printf(1,"Invalid command\n");
      printf(1,"It should be of form testit num1 num2 where num1 is number of processes and num2 is 1 if you what I/O bound processes 2 if you want cpu bound proceses and 3 if you want to exectute given benchmark and 4 to execute mixed process and 5 to print an optimized process among other which dont  which uses MLFQ efficiently.\n");
      exit();
  }
  number_of_processes=atoi(argv[1]);
  // printf(1,"%d\n",number_of_processes);
  if(number_of_processes==0)
  {
      printf(1,"Should be a number in arg 1\n");
      exit();
  }
  if(atoi(argv[2])==1)
  {
      io();
  }
  else if(atoi(argv[2])==2)
  {
      cpu();
  }
  else if(atoi(argv[2])==3)
  {
      benchmark();
  }
  else if(atoi(argv[2])==4)
  {
      mixed();
  }
  else if(atoi(argv[2])==5)
  {
    optimized();
  }
  else
  {
      printf(1,"Second argument should be integer\n");
  }
}
