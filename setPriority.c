#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

int main(int argc, char* argv[])
{
    if(argc<3)
    {
        printf(1,"Invalid number of arguments\n");
        exit();
    }
    for(int i=0;i<strlen(argv[1]);i++)
    {
        if(argv[1][i]<'0'||argv[1][i]>'9')
        {
            printf(1,"Invalid command\n");
            exit();
        }
    }
    int new_priority = atoi(argv[1]);
    int pid = atoi(argv[2]);
    if(pid==0)
    {
        printf(1,"Invalid pid\n");
        exit();
    }
    if(new_priority<0||new_priority>100)
    {
        printf(1,"Value of newpriority is out of bounds\n");
        exit();
    }
    set_priority(new_priority,pid);
    exit();
}