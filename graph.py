import matplotlib.pyplot as pty

fd1=open("./output.txt",'r')
fd2 =open("./out.txt",'w+')

s=[]
flag=1;
for line in fd1:
    # flag=1;
    # for i in range(len(line)):
    #     if line[i].isdigit()==0 and i!=len(line)-1 and line[i] != ' ':
    #         flag=-1
    # if flag==1:
    #     s.append(line)
    if line[0].isdigit():
        s.append(line)
# s=s.pop(len(s)-1)
s[len(s)-1] = s[len(s)-1].strip("\n")
# print(s)

sety = set()
for line in s:
    sety.add(int(line.split(' ')[1]))
    fd2.write(line)
# print(s)    
fd1.close()
fd2.close()

with open("./out.txt") as target:
    k=map(lambda par: [int(par[0]),int(par[1]),int(par[2])],map(lambda par : par.split(" "),target.read().split("\n")))

points=list(k)
pty.yticks([0,1,2,3,4])
numberofprocess=len(sety)
pty.xlabel("Ticks")
pty.ylabel("QueueId")
for proc in range(4,numberofprocess+1):
    x=[]
    y=[]
    for line in points:
        if(line[1]==proc):
            x.append(line[0])
            y.append(line[2])
    pty.plot(x,y, linestyle='--',marker='o',label=str(proc))
pty.legend()
pty.show()