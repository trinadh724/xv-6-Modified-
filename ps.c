#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

int main(int argc, char* argv[])
{
    if(argc!=1)
    {
        printf(1,"Invalid number of arguments!!\n");
        exit();
    }
    ps();
    exit();
}