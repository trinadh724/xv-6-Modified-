#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

int main(int argc, char* argv[])
{
    if(argc<2)
    {
        printf(1,"Invalid number of arguments\n");
        exit();
    }
    int pid=fork();
    if(pid<0)
    {
        printf(1,"fork failed\n");
        exit();
    }
    else if(pid==0)
    {
        if(exec(argv[1],argv+1)<0)
        {
            printf(1,"Invalid command\n");
            exit();
        }
    }
    else
    {
        int wtime, rtime;
        waitx(&wtime,&rtime);
        // printf(1,"%p %p\n",&wtime,&rtime);
        printf(1,"wating time: %d running time: %d\n",wtime,rtime);
    }
    exit();
}