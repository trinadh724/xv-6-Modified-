
_testit:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
  exit();
}

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  if(argc!=3)
   f:	83 39 03             	cmpl   $0x3,(%ecx)
{
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc!=3)
  15:	0f 85 9d 00 00 00    	jne    b8 <main+0xb8>
  {
      printf(1,"Invalid command\n");
      printf(1,"It should be of form testit num1 num2 where num1 is number of processes and num2 is 1 if you what I/O bound processes 2 if you want cpu bound proceses and 3 if you want to exectute given benchmark and 4 to execute mixed process and 5 to print an optimized process among other which dont  which uses MLFQ efficiently.\n");
      exit();
  }
  number_of_processes=atoi(argv[1]);
  1b:	83 ec 0c             	sub    $0xc,%esp
  1e:	ff 73 04             	pushl  0x4(%ebx)
  21:	e8 7a 07 00 00       	call   7a0 <atoi>
  // printf(1,"%d\n",number_of_processes);
  if(number_of_processes==0)
  26:	83 c4 10             	add    $0x10,%esp
  29:	85 c0                	test   %eax,%eax
  number_of_processes=atoi(argv[1]);
  2b:	a3 e4 11 00 00       	mov    %eax,0x11e4
  if(number_of_processes==0)
  30:	0f 84 bc 00 00 00    	je     f2 <main+0xf2>
  {
      printf(1,"Should be a number in arg 1\n");
      exit();
  }
  if(atoi(argv[2])==1)
  36:	83 ec 0c             	sub    $0xc,%esp
  39:	ff 73 08             	pushl  0x8(%ebx)
  3c:	e8 5f 07 00 00       	call   7a0 <atoi>
  41:	83 c4 10             	add    $0x10,%esp
  44:	83 f8 01             	cmp    $0x1,%eax
  47:	0f 84 a0 00 00 00    	je     ed <main+0xed>
  {
      io();
  }
  else if(atoi(argv[2])==2)
  4d:	83 ec 0c             	sub    $0xc,%esp
  50:	ff 73 08             	pushl  0x8(%ebx)
  53:	e8 48 07 00 00       	call   7a0 <atoi>
  58:	83 c4 10             	add    $0x10,%esp
  5b:	83 f8 02             	cmp    $0x2,%eax
  5e:	0f 84 84 00 00 00    	je     e8 <main+0xe8>
  {
      cpu();
  }
  else if(atoi(argv[2])==3)
  64:	83 ec 0c             	sub    $0xc,%esp
  67:	ff 73 08             	pushl  0x8(%ebx)
  6a:	e8 31 07 00 00       	call   7a0 <atoi>
  6f:	83 c4 10             	add    $0x10,%esp
  72:	83 f8 03             	cmp    $0x3,%eax
  75:	74 6c                	je     e3 <main+0xe3>
  {
      benchmark();
  }
  else if(atoi(argv[2])==4)
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	ff 73 08             	pushl  0x8(%ebx)
  7d:	e8 1e 07 00 00       	call   7a0 <atoi>
  82:	83 c4 10             	add    $0x10,%esp
  85:	83 f8 04             	cmp    $0x4,%eax
  88:	74 54                	je     de <main+0xde>
  {
      mixed();
  }
  else if(atoi(argv[2])==5)
  8a:	83 ec 0c             	sub    $0xc,%esp
  8d:	ff 73 08             	pushl  0x8(%ebx)
  90:	e8 0b 07 00 00       	call   7a0 <atoi>
  95:	83 c4 10             	add    $0x10,%esp
  98:	83 f8 05             	cmp    $0x5,%eax
  9b:	74 3c                	je     d9 <main+0xd9>
  {
    optimized();
  }
  else
  {
      printf(1,"Second argument should be integer\n");
  9d:	83 ec 08             	sub    $0x8,%esp
  a0:	68 68 0e 00 00       	push   $0xe68
  a5:	6a 01                	push   $0x1
  a7:	e8 c4 08 00 00       	call   970 <printf>
  }
}
  ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
  af:	31 c0                	xor    %eax,%eax
  b1:	59                   	pop    %ecx
  b2:	5b                   	pop    %ebx
  b3:	5d                   	pop    %ebp
  b4:	8d 61 fc             	lea    -0x4(%ecx),%esp
  b7:	c3                   	ret    
      printf(1,"Invalid command\n");
  b8:	52                   	push   %edx
  b9:	52                   	push   %edx
  ba:	68 d5 0c 00 00       	push   $0xcd5
  bf:	6a 01                	push   $0x1
  c1:	e8 aa 08 00 00       	call   970 <printf>
      printf(1,"It should be of form testit num1 num2 where num1 is number of processes and num2 is 1 if you what I/O bound processes 2 if you want cpu bound proceses and 3 if you want to exectute given benchmark and 4 to execute mixed process and 5 to print an optimized process among other which dont  which uses MLFQ efficiently.\n");
  c6:	59                   	pop    %ecx
  c7:	5b                   	pop    %ebx
  c8:	68 28 0d 00 00       	push   $0xd28
  cd:	6a 01                	push   $0x1
  cf:	e8 9c 08 00 00       	call   970 <printf>
      exit();
  d4:	e8 39 07 00 00       	call   812 <exit>
    optimized();
  d9:	e8 d2 03 00 00       	call   4b0 <optimized>
      mixed();
  de:	e8 cd 02 00 00       	call   3b0 <mixed>
      benchmark();
  e3:	e8 28 00 00 00       	call   110 <benchmark>
      cpu();
  e8:	e8 e3 01 00 00       	call   2d0 <cpu>
      io();
  ed:	e8 1e 01 00 00       	call   210 <io>
      printf(1,"Should be a number in arg 1\n");
  f2:	50                   	push   %eax
  f3:	50                   	push   %eax
  f4:	68 e6 0c 00 00       	push   $0xce6
  f9:	6a 01                	push   $0x1
  fb:	e8 70 08 00 00       	call   970 <printf>
      exit();
 100:	e8 0d 07 00 00       	call   812 <exit>
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <benchmark>:
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	83 ec 14             	sub    $0x14,%esp
    for (int j = 0; j < number_of_processes; j++)
 117:	a1 e4 11 00 00       	mov    0x11e4,%eax
 11c:	85 c0                	test   %eax,%eax
 11e:	7e 3b                	jle    15b <benchmark+0x4b>
 120:	31 db                	xor    %ebx,%ebx
 122:	eb 11                	jmp    135 <benchmark+0x25>
 124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (pid == 0)
 128:	74 5f                	je     189 <benchmark+0x79>
    for (int j = 0; j < number_of_processes; j++)
 12a:	83 c3 01             	add    $0x1,%ebx
 12d:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 133:	7e 26                	jle    15b <benchmark+0x4b>
    int pid = fork();
 135:	e8 d0 06 00 00       	call   80a <fork>
    if (pid < 0)
 13a:	85 c0                	test   %eax,%eax
 13c:	79 ea                	jns    128 <benchmark+0x18>
      printf(1, "Fork failed\n");
 13e:	83 ec 08             	sub    $0x8,%esp
    for (int j = 0; j < number_of_processes; j++)
 141:	83 c3 01             	add    $0x1,%ebx
      printf(1, "Fork failed\n");
 144:	68 c8 0c 00 00       	push   $0xcc8
 149:	6a 01                	push   $0x1
 14b:	e8 20 08 00 00       	call   970 <printf>
      continue;
 150:	83 c4 10             	add    $0x10,%esp
    for (int j = 0; j < number_of_processes; j++)
 153:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 159:	7f da                	jg     135 <benchmark+0x25>
  for (int j = 0; j < number_of_processes+5; j++)
 15b:	83 3d e4 11 00 00 fc 	cmpl   $0xfffffffc,0x11e4
 162:	7c 20                	jl     184 <benchmark+0x74>
 164:	31 db                	xor    %ebx,%ebx
 166:	8d 76 00             	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    wait();
 170:	e8 a5 06 00 00       	call   81a <wait>
  for (int j = 0; j < number_of_processes+5; j++)
 175:	a1 e4 11 00 00       	mov    0x11e4,%eax
 17a:	83 c3 01             	add    $0x1,%ebx
 17d:	83 c0 04             	add    $0x4,%eax
 180:	39 d8                	cmp    %ebx,%eax
 182:	7d ec                	jge    170 <benchmark+0x60>
  exit();
 184:	e8 89 06 00 00       	call   812 <exit>
      for (volatile int k = 0; k < number_of_processes; k++)
 189:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 190:	8b 45 f4             	mov    -0xc(%ebp),%eax
 193:	3b 05 e4 11 00 00    	cmp    0x11e4,%eax
 199:	7c 29                	jl     1c4 <benchmark+0xb4>
 19b:	eb 58                	jmp    1f5 <benchmark+0xe5>
 19d:	8d 76 00             	lea    0x0(%esi),%esi
          sleep(200); //io time
 1a0:	83 ec 0c             	sub    $0xc,%esp
 1a3:	68 c8 00 00 00       	push   $0xc8
 1a8:	e8 f5 06 00 00       	call   8a2 <sleep>
 1ad:	83 c4 10             	add    $0x10,%esp
      for (volatile int k = 0; k < number_of_processes; k++)
 1b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b3:	83 c0 01             	add    $0x1,%eax
 1b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 1b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1bc:	3b 05 e4 11 00 00    	cmp    0x11e4,%eax
 1c2:	7d 31                	jge    1f5 <benchmark+0xe5>
        if (k <= j)
 1c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c7:	39 d8                	cmp    %ebx,%eax
 1c9:	7e d5                	jle    1a0 <benchmark+0x90>
          for (i = 0; i < 100000000; i++)
 1cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1d5:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 1da:	7f d4                	jg     1b0 <benchmark+0xa0>
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1e3:	83 c0 01             	add    $0x1,%eax
 1e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 1e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1ec:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 1f1:	7e ed                	jle    1e0 <benchmark+0xd0>
 1f3:	eb bb                	jmp    1b0 <benchmark+0xa0>
      printf(1, "Process: %d with PID: %d Finished\n", j,getpid());
 1f5:	e8 98 06 00 00       	call   892 <getpid>
 1fa:	50                   	push   %eax
 1fb:	53                   	push   %ebx
 1fc:	68 04 0d 00 00       	push   $0xd04
 201:	6a 01                	push   $0x1
 203:	e8 68 07 00 00       	call   970 <printf>
      exit();
 208:	e8 05 06 00 00       	call   812 <exit>
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <io>:
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	83 ec 14             	sub    $0x14,%esp
      for (j = 0; j < number_of_processes; j++)
 217:	a1 e4 11 00 00       	mov    0x11e4,%eax
 21c:	85 c0                	test   %eax,%eax
 21e:	7e 3b                	jle    25b <io+0x4b>
 220:	31 db                	xor    %ebx,%ebx
 222:	eb 11                	jmp    235 <io+0x25>
 224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (pid == 0)
 228:	74 5f                	je     289 <io+0x79>
      for (j = 0; j < number_of_processes; j++)
 22a:	83 c3 01             	add    $0x1,%ebx
 22d:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 233:	7e 26                	jle    25b <io+0x4b>
    int pid = fork();
 235:	e8 d0 05 00 00       	call   80a <fork>
    if (pid < 0)
 23a:	85 c0                	test   %eax,%eax
 23c:	79 ea                	jns    228 <io+0x18>
      printf(1, "Fork failed\n");
 23e:	83 ec 08             	sub    $0x8,%esp
      for (j = 0; j < number_of_processes; j++)
 241:	83 c3 01             	add    $0x1,%ebx
      printf(1, "Fork failed\n");
 244:	68 c8 0c 00 00       	push   $0xcc8
 249:	6a 01                	push   $0x1
 24b:	e8 20 07 00 00       	call   970 <printf>
      continue;
 250:	83 c4 10             	add    $0x10,%esp
      for (j = 0; j < number_of_processes; j++)
 253:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 259:	7f da                	jg     235 <io+0x25>
  for (j = 0; j < number_of_processes+5; j++)
 25b:	83 3d e4 11 00 00 fc 	cmpl   $0xfffffffc,0x11e4
 262:	7c 20                	jl     284 <io+0x74>
 264:	31 db                	xor    %ebx,%ebx
 266:	8d 76 00             	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    wait();
 270:	e8 a5 05 00 00       	call   81a <wait>
  for (j = 0; j < number_of_processes+5; j++)
 275:	a1 e4 11 00 00       	mov    0x11e4,%eax
 27a:	83 c3 01             	add    $0x1,%ebx
 27d:	83 c0 04             	add    $0x4,%eax
 280:	39 d8                	cmp    %ebx,%eax
 282:	7d ec                	jge    270 <io+0x60>
      exit();
 284:	e8 89 05 00 00       	call   812 <exit>
      for (volatile int k = 0; k < number_of_processes; k++)
 289:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 290:	8b 45 f4             	mov    -0xc(%ebp),%eax
 293:	39 05 e4 11 00 00    	cmp    %eax,0x11e4
 299:	7e e9                	jle    284 <io+0x74>
 29b:	90                   	nop
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
          sleep(300); //io time
 2a0:	83 ec 0c             	sub    $0xc,%esp
 2a3:	68 2c 01 00 00       	push   $0x12c
 2a8:	e8 f5 05 00 00       	call   8a2 <sleep>
      for (volatile int k = 0; k < number_of_processes; k++)
 2ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b0:	83 c4 10             	add    $0x10,%esp
 2b3:	83 c0 01             	add    $0x1,%eax
 2b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 2b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2bc:	3b 05 e4 11 00 00    	cmp    0x11e4,%eax
 2c2:	7c dc                	jl     2a0 <io+0x90>
 2c4:	eb be                	jmp    284 <io+0x74>
 2c6:	8d 76 00             	lea    0x0(%esi),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <cpu>:
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	83 ec 14             	sub    $0x14,%esp
      for (j = 0; j < number_of_processes; j++)
 2d7:	a1 e4 11 00 00       	mov    0x11e4,%eax
 2dc:	85 c0                	test   %eax,%eax
 2de:	7e 3b                	jle    31b <cpu+0x4b>
 2e0:	31 db                	xor    %ebx,%ebx
 2e2:	eb 11                	jmp    2f5 <cpu+0x25>
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (pid == 0)
 2e8:	74 5f                	je     349 <cpu+0x79>
      for (j = 0; j < number_of_processes; j++)
 2ea:	83 c3 01             	add    $0x1,%ebx
 2ed:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 2f3:	7e 26                	jle    31b <cpu+0x4b>
    int pid = fork();
 2f5:	e8 10 05 00 00       	call   80a <fork>
    if (pid < 0)
 2fa:	85 c0                	test   %eax,%eax
 2fc:	79 ea                	jns    2e8 <cpu+0x18>
      printf(1, "Fork failed\n");
 2fe:	83 ec 08             	sub    $0x8,%esp
      for (j = 0; j < number_of_processes; j++)
 301:	83 c3 01             	add    $0x1,%ebx
      printf(1, "Fork failed\n");
 304:	68 c8 0c 00 00       	push   $0xcc8
 309:	6a 01                	push   $0x1
 30b:	e8 60 06 00 00       	call   970 <printf>
      continue;
 310:	83 c4 10             	add    $0x10,%esp
      for (j = 0; j < number_of_processes; j++)
 313:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 319:	7f da                	jg     2f5 <cpu+0x25>
  for (j = 0; j < number_of_processes+5; j++)
 31b:	83 3d e4 11 00 00 fc 	cmpl   $0xfffffffc,0x11e4
 322:	7c 20                	jl     344 <cpu+0x74>
 324:	31 db                	xor    %ebx,%ebx
 326:	8d 76 00             	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    wait();
 330:	e8 e5 04 00 00       	call   81a <wait>
  for (j = 0; j < number_of_processes+5; j++)
 335:	a1 e4 11 00 00       	mov    0x11e4,%eax
 33a:	83 c3 01             	add    $0x1,%ebx
 33d:	83 c0 04             	add    $0x4,%eax
 340:	39 d8                	cmp    %ebx,%eax
 342:	7d ec                	jge    330 <cpu+0x60>
      exit();
 344:	e8 c9 04 00 00       	call   812 <exit>
      for (volatile int k = 0; k < number_of_processes; k++)
 349:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 350:	8b 45 f4             	mov    -0xc(%ebp),%eax
 353:	39 05 e4 11 00 00    	cmp    %eax,0x11e4
 359:	7e e9                	jle    344 <cpu+0x74>
 35b:	90                   	nop
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
          for (i = 0; i < 100000000; i++)
 360:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 367:	8b 45 f0             	mov    -0x10(%ebp),%eax
 36a:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 36f:	7f 1a                	jg     38b <cpu+0xbb>
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 378:	8b 45 f0             	mov    -0x10(%ebp),%eax
 37b:	83 c0 01             	add    $0x1,%eax
 37e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 381:	8b 45 f0             	mov    -0x10(%ebp),%eax
 384:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 389:	7e ed                	jle    378 <cpu+0xa8>
          sleep(15);
 38b:	83 ec 0c             	sub    $0xc,%esp
 38e:	6a 0f                	push   $0xf
 390:	e8 0d 05 00 00       	call   8a2 <sleep>
      for (volatile int k = 0; k < number_of_processes; k++)
 395:	8b 45 f4             	mov    -0xc(%ebp),%eax
 398:	83 c4 10             	add    $0x10,%esp
 39b:	83 c0 01             	add    $0x1,%eax
 39e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a4:	3b 05 e4 11 00 00    	cmp    0x11e4,%eax
 3aa:	7c b4                	jl     360 <cpu+0x90>
 3ac:	eb 96                	jmp    344 <cpu+0x74>
 3ae:	66 90                	xchg   %ax,%ax

000003b0 <mixed>:
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	83 ec 14             	sub    $0x14,%esp
      for (j = 0; j < number_of_processes; j++)
 3b7:	a1 e4 11 00 00       	mov    0x11e4,%eax
 3bc:	85 c0                	test   %eax,%eax
 3be:	7e 3b                	jle    3fb <mixed+0x4b>
 3c0:	31 db                	xor    %ebx,%ebx
 3c2:	eb 11                	jmp    3d5 <mixed+0x25>
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (pid == 0)
 3c8:	74 5f                	je     429 <mixed+0x79>
      for (j = 0; j < number_of_processes; j++)
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 3d3:	7e 26                	jle    3fb <mixed+0x4b>
    int pid = fork();
 3d5:	e8 30 04 00 00       	call   80a <fork>
    if (pid < 0)
 3da:	85 c0                	test   %eax,%eax
 3dc:	79 ea                	jns    3c8 <mixed+0x18>
      printf(1, "Fork failed\n");
 3de:	83 ec 08             	sub    $0x8,%esp
      for (j = 0; j < number_of_processes; j++)
 3e1:	83 c3 01             	add    $0x1,%ebx
      printf(1, "Fork failed\n");
 3e4:	68 c8 0c 00 00       	push   $0xcc8
 3e9:	6a 01                	push   $0x1
 3eb:	e8 80 05 00 00       	call   970 <printf>
      continue;
 3f0:	83 c4 10             	add    $0x10,%esp
      for (j = 0; j < number_of_processes; j++)
 3f3:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 3f9:	7f da                	jg     3d5 <mixed+0x25>
  for (j = 0; j < number_of_processes+5; j++)
 3fb:	83 3d e4 11 00 00 fc 	cmpl   $0xfffffffc,0x11e4
 402:	7c 20                	jl     424 <mixed+0x74>
 404:	31 db                	xor    %ebx,%ebx
 406:	8d 76 00             	lea    0x0(%esi),%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    wait();
 410:	e8 05 04 00 00       	call   81a <wait>
  for (j = 0; j < number_of_processes+5; j++)
 415:	a1 e4 11 00 00       	mov    0x11e4,%eax
 41a:	83 c3 01             	add    $0x1,%ebx
 41d:	83 c0 04             	add    $0x4,%eax
 420:	39 d8                	cmp    %ebx,%eax
 422:	7d ec                	jge    410 <mixed+0x60>
      exit();
 424:	e8 e9 03 00 00       	call   812 <exit>
      for (volatile int k = 0; k < number_of_processes; k++)
 429:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 430:	8b 45 f4             	mov    -0xc(%ebp),%eax
 433:	3b 05 e4 11 00 00    	cmp    0x11e4,%eax
 439:	7d e9                	jge    424 <mixed+0x74>
 43b:	83 e3 01             	and    $0x1,%ebx
        if(j%2==0)
 43e:	85 db                	test   %ebx,%ebx
 440:	75 56                	jne    498 <mixed+0xe8>
 442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          for (i = 0; i < 100000000; i++)
 448:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 44f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 452:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 457:	7f 1a                	jg     473 <mixed+0xc3>
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 460:	8b 45 f0             	mov    -0x10(%ebp),%eax
 463:	83 c0 01             	add    $0x1,%eax
 466:	89 45 f0             	mov    %eax,-0x10(%ebp)
 469:	8b 45 f0             	mov    -0x10(%ebp),%eax
 46c:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 471:	7e ed                	jle    460 <mixed+0xb0>
          sleep(15);
 473:	83 ec 0c             	sub    $0xc,%esp
 476:	6a 0f                	push   $0xf
 478:	e8 25 04 00 00       	call   8a2 <sleep>
 47d:	83 c4 10             	add    $0x10,%esp
      for (volatile int k = 0; k < number_of_processes; k++)
 480:	8b 45 f4             	mov    -0xc(%ebp),%eax
 483:	83 c0 01             	add    $0x1,%eax
 486:	89 45 f4             	mov    %eax,-0xc(%ebp)
 489:	8b 45 f4             	mov    -0xc(%ebp),%eax
 48c:	3b 05 e4 11 00 00    	cmp    0x11e4,%eax
 492:	7d 90                	jge    424 <mixed+0x74>
        if(j%2==0)
 494:	85 db                	test   %ebx,%ebx
 496:	74 b0                	je     448 <mixed+0x98>
          sleep(300); //io time
 498:	83 ec 0c             	sub    $0xc,%esp
 49b:	68 2c 01 00 00       	push   $0x12c
 4a0:	e8 fd 03 00 00       	call   8a2 <sleep>
 4a5:	83 c4 10             	add    $0x10,%esp
 4a8:	eb d6                	jmp    480 <mixed+0xd0>
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004b0 <optimized>:
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	83 ec 14             	sub    $0x14,%esp
   for (int j = 0; j < number_of_processes; j++)
 4b7:	a1 e4 11 00 00       	mov    0x11e4,%eax
 4bc:	85 c0                	test   %eax,%eax
 4be:	7e 3b                	jle    4fb <optimized+0x4b>
 4c0:	31 db                	xor    %ebx,%ebx
 4c2:	eb 11                	jmp    4d5 <optimized+0x25>
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (pid == 0)
 4c8:	74 5f                	je     529 <optimized+0x79>
   for (int j = 0; j < number_of_processes; j++)
 4ca:	83 c3 01             	add    $0x1,%ebx
 4cd:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 4d3:	7e 26                	jle    4fb <optimized+0x4b>
    int pid = fork();
 4d5:	e8 30 03 00 00       	call   80a <fork>
    if (pid < 0)
 4da:	85 c0                	test   %eax,%eax
 4dc:	79 ea                	jns    4c8 <optimized+0x18>
      printf(1, "Fork failed\n");
 4de:	83 ec 08             	sub    $0x8,%esp
   for (int j = 0; j < number_of_processes; j++)
 4e1:	83 c3 01             	add    $0x1,%ebx
      printf(1, "Fork failed\n");
 4e4:	68 c8 0c 00 00       	push   $0xcc8
 4e9:	6a 01                	push   $0x1
 4eb:	e8 80 04 00 00       	call   970 <printf>
      continue;
 4f0:	83 c4 10             	add    $0x10,%esp
   for (int j = 0; j < number_of_processes; j++)
 4f3:	39 1d e4 11 00 00    	cmp    %ebx,0x11e4
 4f9:	7f da                	jg     4d5 <optimized+0x25>
  for (int j = 0; j < number_of_processes+5; j++)
 4fb:	83 3d e4 11 00 00 fc 	cmpl   $0xfffffffc,0x11e4
 502:	7c 20                	jl     524 <optimized+0x74>
 504:	31 db                	xor    %ebx,%ebx
 506:	8d 76 00             	lea    0x0(%esi),%esi
 509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    wait();
 510:	e8 05 03 00 00       	call   81a <wait>
  for (int j = 0; j < number_of_processes+5; j++)
 515:	a1 e4 11 00 00       	mov    0x11e4,%eax
 51a:	83 c3 01             	add    $0x1,%ebx
 51d:	83 c0 04             	add    $0x4,%eax
 520:	39 d8                	cmp    %ebx,%eax
 522:	7d ec                	jge    510 <optimized+0x60>
  exit();
 524:	e8 e9 02 00 00       	call   812 <exit>
      for (volatile int k = 0; k < number_of_processes; k++)
 529:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 530:	8b 15 e4 11 00 00    	mov    0x11e4,%edx
 536:	8b 45 f4             	mov    -0xc(%ebp),%eax
 539:	39 c2                	cmp    %eax,%edx
 53b:	7e 59                	jle    596 <optimized+0xe6>
 53d:	8d 76 00             	lea    0x0(%esi),%esi
        if(j==number_of_processes/2)
 540:	89 d0                	mov    %edx,%eax
 542:	c1 e8 1f             	shr    $0x1f,%eax
 545:	01 d0                	add    %edx,%eax
 547:	d1 f8                	sar    %eax
 549:	39 d8                	cmp    %ebx,%eax
 54b:	74 61                	je     5ae <optimized+0xfe>
          for (i = 0; i < 100000000; i++)
 54d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 554:	8b 45 f0             	mov    -0x10(%ebp),%eax
 557:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 55c:	7f 15                	jg     573 <optimized+0xc3>
 55e:	66 90                	xchg   %ax,%ax
 560:	8b 45 f0             	mov    -0x10(%ebp),%eax
 563:	83 c0 01             	add    $0x1,%eax
 566:	89 45 f0             	mov    %eax,-0x10(%ebp)
 569:	8b 45 f0             	mov    -0x10(%ebp),%eax
 56c:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 571:	7e ed                	jle    560 <optimized+0xb0>
          sleep(5);
 573:	83 ec 0c             	sub    $0xc,%esp
 576:	6a 05                	push   $0x5
 578:	e8 25 03 00 00       	call   8a2 <sleep>
 57d:	83 c4 10             	add    $0x10,%esp
      for (volatile int k = 0; k < number_of_processes; k++)
 580:	8b 45 f4             	mov    -0xc(%ebp),%eax
 583:	8b 15 e4 11 00 00    	mov    0x11e4,%edx
 589:	83 c0 01             	add    $0x1,%eax
 58c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 58f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 592:	39 d0                	cmp    %edx,%eax
 594:	7c aa                	jl     540 <optimized+0x90>
      printf(1, "Process: %d with PID: %d Finished\n", j,getpid());
 596:	e8 f7 02 00 00       	call   892 <getpid>
 59b:	50                   	push   %eax
 59c:	53                   	push   %ebx
 59d:	68 04 0d 00 00       	push   $0xd04
 5a2:	6a 01                	push   $0x1
 5a4:	e8 c7 03 00 00       	call   970 <printf>
      exit();
 5a9:	e8 64 02 00 00       	call   812 <exit>
          sleep(200);
 5ae:	83 ec 0c             	sub    $0xc,%esp
 5b1:	68 c8 00 00 00       	push   $0xc8
 5b6:	e8 e7 02 00 00       	call   8a2 <sleep>
          continue;
 5bb:	83 c4 10             	add    $0x10,%esp
 5be:	eb c0                	jmp    580 <optimized+0xd0>

000005c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	53                   	push   %ebx
 5c4:	8b 45 08             	mov    0x8(%ebp),%eax
 5c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 5ca:	89 c2                	mov    %eax,%edx
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d0:	83 c1 01             	add    $0x1,%ecx
 5d3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 5d7:	83 c2 01             	add    $0x1,%edx
 5da:	84 db                	test   %bl,%bl
 5dc:	88 5a ff             	mov    %bl,-0x1(%edx)
 5df:	75 ef                	jne    5d0 <strcpy+0x10>
    ;
  return os;
}
 5e1:	5b                   	pop    %ebx
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000005f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	53                   	push   %ebx
 5f4:	8b 55 08             	mov    0x8(%ebp),%edx
 5f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 5fa:	0f b6 02             	movzbl (%edx),%eax
 5fd:	0f b6 19             	movzbl (%ecx),%ebx
 600:	84 c0                	test   %al,%al
 602:	75 1c                	jne    620 <strcmp+0x30>
 604:	eb 2a                	jmp    630 <strcmp+0x40>
 606:	8d 76 00             	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 610:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 613:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 616:	83 c1 01             	add    $0x1,%ecx
 619:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 61c:	84 c0                	test   %al,%al
 61e:	74 10                	je     630 <strcmp+0x40>
 620:	38 d8                	cmp    %bl,%al
 622:	74 ec                	je     610 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 624:	29 d8                	sub    %ebx,%eax
}
 626:	5b                   	pop    %ebx
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 630:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 632:	29 d8                	sub    %ebx,%eax
}
 634:	5b                   	pop    %ebx
 635:	5d                   	pop    %ebp
 636:	c3                   	ret    
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <strlen>:

uint
strlen(const char *s)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 646:	80 39 00             	cmpb   $0x0,(%ecx)
 649:	74 15                	je     660 <strlen+0x20>
 64b:	31 d2                	xor    %edx,%edx
 64d:	8d 76 00             	lea    0x0(%esi),%esi
 650:	83 c2 01             	add    $0x1,%edx
 653:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 657:	89 d0                	mov    %edx,%eax
 659:	75 f5                	jne    650 <strlen+0x10>
    ;
  return n;
}
 65b:	5d                   	pop    %ebp
 65c:	c3                   	ret    
 65d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 660:	31 c0                	xor    %eax,%eax
}
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 66a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000670 <memset>:

void*
memset(void *dst, int c, uint n)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 677:	8b 4d 10             	mov    0x10(%ebp),%ecx
 67a:	8b 45 0c             	mov    0xc(%ebp),%eax
 67d:	89 d7                	mov    %edx,%edi
 67f:	fc                   	cld    
 680:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 682:	89 d0                	mov    %edx,%eax
 684:	5f                   	pop    %edi
 685:	5d                   	pop    %ebp
 686:	c3                   	ret    
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000690 <strchr>:

char*
strchr(const char *s, char c)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	53                   	push   %ebx
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 69a:	0f b6 10             	movzbl (%eax),%edx
 69d:	84 d2                	test   %dl,%dl
 69f:	74 1d                	je     6be <strchr+0x2e>
    if(*s == c)
 6a1:	38 d3                	cmp    %dl,%bl
 6a3:	89 d9                	mov    %ebx,%ecx
 6a5:	75 0d                	jne    6b4 <strchr+0x24>
 6a7:	eb 17                	jmp    6c0 <strchr+0x30>
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6b0:	38 ca                	cmp    %cl,%dl
 6b2:	74 0c                	je     6c0 <strchr+0x30>
  for(; *s; s++)
 6b4:	83 c0 01             	add    $0x1,%eax
 6b7:	0f b6 10             	movzbl (%eax),%edx
 6ba:	84 d2                	test   %dl,%dl
 6bc:	75 f2                	jne    6b0 <strchr+0x20>
      return (char*)s;
  return 0;
 6be:	31 c0                	xor    %eax,%eax
}
 6c0:	5b                   	pop    %ebx
 6c1:	5d                   	pop    %ebp
 6c2:	c3                   	ret    
 6c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006d0 <gets>:

char*
gets(char *buf, int max)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6d6:	31 f6                	xor    %esi,%esi
 6d8:	89 f3                	mov    %esi,%ebx
{
 6da:	83 ec 1c             	sub    $0x1c,%esp
 6dd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 6e0:	eb 2f                	jmp    711 <gets+0x41>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 6e8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6eb:	83 ec 04             	sub    $0x4,%esp
 6ee:	6a 01                	push   $0x1
 6f0:	50                   	push   %eax
 6f1:	6a 00                	push   $0x0
 6f3:	e8 32 01 00 00       	call   82a <read>
    if(cc < 1)
 6f8:	83 c4 10             	add    $0x10,%esp
 6fb:	85 c0                	test   %eax,%eax
 6fd:	7e 1c                	jle    71b <gets+0x4b>
      break;
    buf[i++] = c;
 6ff:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 703:	83 c7 01             	add    $0x1,%edi
 706:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 709:	3c 0a                	cmp    $0xa,%al
 70b:	74 23                	je     730 <gets+0x60>
 70d:	3c 0d                	cmp    $0xd,%al
 70f:	74 1f                	je     730 <gets+0x60>
  for(i=0; i+1 < max; ){
 711:	83 c3 01             	add    $0x1,%ebx
 714:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 717:	89 fe                	mov    %edi,%esi
 719:	7c cd                	jl     6e8 <gets+0x18>
 71b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 720:	c6 03 00             	movb   $0x0,(%ebx)
}
 723:	8d 65 f4             	lea    -0xc(%ebp),%esp
 726:	5b                   	pop    %ebx
 727:	5e                   	pop    %esi
 728:	5f                   	pop    %edi
 729:	5d                   	pop    %ebp
 72a:	c3                   	ret    
 72b:	90                   	nop
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 730:	8b 75 08             	mov    0x8(%ebp),%esi
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	01 de                	add    %ebx,%esi
 738:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 73a:	c6 03 00             	movb   $0x0,(%ebx)
}
 73d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 740:	5b                   	pop    %ebx
 741:	5e                   	pop    %esi
 742:	5f                   	pop    %edi
 743:	5d                   	pop    %ebp
 744:	c3                   	ret    
 745:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000750 <stat>:

int
stat(const char *n, struct stat *st)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	56                   	push   %esi
 754:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 755:	83 ec 08             	sub    $0x8,%esp
 758:	6a 00                	push   $0x0
 75a:	ff 75 08             	pushl  0x8(%ebp)
 75d:	e8 f0 00 00 00       	call   852 <open>
  if(fd < 0)
 762:	83 c4 10             	add    $0x10,%esp
 765:	85 c0                	test   %eax,%eax
 767:	78 27                	js     790 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 769:	83 ec 08             	sub    $0x8,%esp
 76c:	ff 75 0c             	pushl  0xc(%ebp)
 76f:	89 c3                	mov    %eax,%ebx
 771:	50                   	push   %eax
 772:	e8 f3 00 00 00       	call   86a <fstat>
  close(fd);
 777:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 77a:	89 c6                	mov    %eax,%esi
  close(fd);
 77c:	e8 b9 00 00 00       	call   83a <close>
  return r;
 781:	83 c4 10             	add    $0x10,%esp
}
 784:	8d 65 f8             	lea    -0x8(%ebp),%esp
 787:	89 f0                	mov    %esi,%eax
 789:	5b                   	pop    %ebx
 78a:	5e                   	pop    %esi
 78b:	5d                   	pop    %ebp
 78c:	c3                   	ret    
 78d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 790:	be ff ff ff ff       	mov    $0xffffffff,%esi
 795:	eb ed                	jmp    784 <stat+0x34>
 797:	89 f6                	mov    %esi,%esi
 799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007a0 <atoi>:

int
atoi(const char *s)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	53                   	push   %ebx
 7a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 7a7:	0f be 11             	movsbl (%ecx),%edx
 7aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 7ad:	3c 09                	cmp    $0x9,%al
  n = 0;
 7af:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 7b4:	77 1f                	ja     7d5 <atoi+0x35>
 7b6:	8d 76 00             	lea    0x0(%esi),%esi
 7b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 7c0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 7c3:	83 c1 01             	add    $0x1,%ecx
 7c6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 7ca:	0f be 11             	movsbl (%ecx),%edx
 7cd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 7d0:	80 fb 09             	cmp    $0x9,%bl
 7d3:	76 eb                	jbe    7c0 <atoi+0x20>
  return n;
}
 7d5:	5b                   	pop    %ebx
 7d6:	5d                   	pop    %ebp
 7d7:	c3                   	ret    
 7d8:	90                   	nop
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	56                   	push   %esi
 7e4:	53                   	push   %ebx
 7e5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7e8:	8b 45 08             	mov    0x8(%ebp),%eax
 7eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 7ee:	85 db                	test   %ebx,%ebx
 7f0:	7e 14                	jle    806 <memmove+0x26>
 7f2:	31 d2                	xor    %edx,%edx
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 7f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 7fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 7ff:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 802:	39 d3                	cmp    %edx,%ebx
 804:	75 f2                	jne    7f8 <memmove+0x18>
  return vdst;
}
 806:	5b                   	pop    %ebx
 807:	5e                   	pop    %esi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret    

0000080a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 80a:	b8 01 00 00 00       	mov    $0x1,%eax
 80f:	cd 40                	int    $0x40
 811:	c3                   	ret    

00000812 <exit>:
SYSCALL(exit)
 812:	b8 02 00 00 00       	mov    $0x2,%eax
 817:	cd 40                	int    $0x40
 819:	c3                   	ret    

0000081a <wait>:
SYSCALL(wait)
 81a:	b8 03 00 00 00       	mov    $0x3,%eax
 81f:	cd 40                	int    $0x40
 821:	c3                   	ret    

00000822 <pipe>:
SYSCALL(pipe)
 822:	b8 04 00 00 00       	mov    $0x4,%eax
 827:	cd 40                	int    $0x40
 829:	c3                   	ret    

0000082a <read>:
SYSCALL(read)
 82a:	b8 05 00 00 00       	mov    $0x5,%eax
 82f:	cd 40                	int    $0x40
 831:	c3                   	ret    

00000832 <write>:
SYSCALL(write)
 832:	b8 10 00 00 00       	mov    $0x10,%eax
 837:	cd 40                	int    $0x40
 839:	c3                   	ret    

0000083a <close>:
SYSCALL(close)
 83a:	b8 15 00 00 00       	mov    $0x15,%eax
 83f:	cd 40                	int    $0x40
 841:	c3                   	ret    

00000842 <kill>:
SYSCALL(kill)
 842:	b8 06 00 00 00       	mov    $0x6,%eax
 847:	cd 40                	int    $0x40
 849:	c3                   	ret    

0000084a <exec>:
SYSCALL(exec)
 84a:	b8 07 00 00 00       	mov    $0x7,%eax
 84f:	cd 40                	int    $0x40
 851:	c3                   	ret    

00000852 <open>:
SYSCALL(open)
 852:	b8 0f 00 00 00       	mov    $0xf,%eax
 857:	cd 40                	int    $0x40
 859:	c3                   	ret    

0000085a <mknod>:
SYSCALL(mknod)
 85a:	b8 11 00 00 00       	mov    $0x11,%eax
 85f:	cd 40                	int    $0x40
 861:	c3                   	ret    

00000862 <unlink>:
SYSCALL(unlink)
 862:	b8 12 00 00 00       	mov    $0x12,%eax
 867:	cd 40                	int    $0x40
 869:	c3                   	ret    

0000086a <fstat>:
SYSCALL(fstat)
 86a:	b8 08 00 00 00       	mov    $0x8,%eax
 86f:	cd 40                	int    $0x40
 871:	c3                   	ret    

00000872 <link>:
SYSCALL(link)
 872:	b8 13 00 00 00       	mov    $0x13,%eax
 877:	cd 40                	int    $0x40
 879:	c3                   	ret    

0000087a <mkdir>:
SYSCALL(mkdir)
 87a:	b8 14 00 00 00       	mov    $0x14,%eax
 87f:	cd 40                	int    $0x40
 881:	c3                   	ret    

00000882 <chdir>:
SYSCALL(chdir)
 882:	b8 09 00 00 00       	mov    $0x9,%eax
 887:	cd 40                	int    $0x40
 889:	c3                   	ret    

0000088a <dup>:
SYSCALL(dup)
 88a:	b8 0a 00 00 00       	mov    $0xa,%eax
 88f:	cd 40                	int    $0x40
 891:	c3                   	ret    

00000892 <getpid>:
SYSCALL(getpid)
 892:	b8 0b 00 00 00       	mov    $0xb,%eax
 897:	cd 40                	int    $0x40
 899:	c3                   	ret    

0000089a <sbrk>:
SYSCALL(sbrk)
 89a:	b8 0c 00 00 00       	mov    $0xc,%eax
 89f:	cd 40                	int    $0x40
 8a1:	c3                   	ret    

000008a2 <sleep>:
SYSCALL(sleep)
 8a2:	b8 0d 00 00 00       	mov    $0xd,%eax
 8a7:	cd 40                	int    $0x40
 8a9:	c3                   	ret    

000008aa <uptime>:
SYSCALL(uptime)
 8aa:	b8 0e 00 00 00       	mov    $0xe,%eax
 8af:	cd 40                	int    $0x40
 8b1:	c3                   	ret    

000008b2 <waitx>:
SYSCALL(waitx)
 8b2:	b8 16 00 00 00       	mov    $0x16,%eax
 8b7:	cd 40                	int    $0x40
 8b9:	c3                   	ret    

000008ba <set_priority>:
SYSCALL(set_priority)
 8ba:	b8 17 00 00 00       	mov    $0x17,%eax
 8bf:	cd 40                	int    $0x40
 8c1:	c3                   	ret    

000008c2 <ps>:
SYSCALL(ps)
 8c2:	b8 18 00 00 00       	mov    $0x18,%eax
 8c7:	cd 40                	int    $0x40
 8c9:	c3                   	ret    
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 8d9:	85 d2                	test   %edx,%edx
{
 8db:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 8de:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 8e0:	79 76                	jns    958 <printint+0x88>
 8e2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 8e6:	74 70                	je     958 <printint+0x88>
    x = -xx;
 8e8:	f7 d8                	neg    %eax
    neg = 1;
 8ea:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 8f1:	31 f6                	xor    %esi,%esi
 8f3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 8f6:	eb 0a                	jmp    902 <printint+0x32>
 8f8:	90                   	nop
 8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 900:	89 fe                	mov    %edi,%esi
 902:	31 d2                	xor    %edx,%edx
 904:	8d 7e 01             	lea    0x1(%esi),%edi
 907:	f7 f1                	div    %ecx
 909:	0f b6 92 94 0e 00 00 	movzbl 0xe94(%edx),%edx
  }while((x /= base) != 0);
 910:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 912:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 915:	75 e9                	jne    900 <printint+0x30>
  if(neg)
 917:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 91a:	85 c0                	test   %eax,%eax
 91c:	74 08                	je     926 <printint+0x56>
    buf[i++] = '-';
 91e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 923:	8d 7e 02             	lea    0x2(%esi),%edi
 926:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 92a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 92d:	8d 76 00             	lea    0x0(%esi),%esi
 930:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 933:	83 ec 04             	sub    $0x4,%esp
 936:	83 ee 01             	sub    $0x1,%esi
 939:	6a 01                	push   $0x1
 93b:	53                   	push   %ebx
 93c:	57                   	push   %edi
 93d:	88 45 d7             	mov    %al,-0x29(%ebp)
 940:	e8 ed fe ff ff       	call   832 <write>

  while(--i >= 0)
 945:	83 c4 10             	add    $0x10,%esp
 948:	39 de                	cmp    %ebx,%esi
 94a:	75 e4                	jne    930 <printint+0x60>
    putc(fd, buf[i]);
}
 94c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 94f:	5b                   	pop    %ebx
 950:	5e                   	pop    %esi
 951:	5f                   	pop    %edi
 952:	5d                   	pop    %ebp
 953:	c3                   	ret    
 954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 958:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 95f:	eb 90                	jmp    8f1 <printint+0x21>
 961:	eb 0d                	jmp    970 <printf>
 963:	90                   	nop
 964:	90                   	nop
 965:	90                   	nop
 966:	90                   	nop
 967:	90                   	nop
 968:	90                   	nop
 969:	90                   	nop
 96a:	90                   	nop
 96b:	90                   	nop
 96c:	90                   	nop
 96d:	90                   	nop
 96e:	90                   	nop
 96f:	90                   	nop

00000970 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	57                   	push   %edi
 974:	56                   	push   %esi
 975:	53                   	push   %ebx
 976:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 979:	8b 75 0c             	mov    0xc(%ebp),%esi
 97c:	0f b6 1e             	movzbl (%esi),%ebx
 97f:	84 db                	test   %bl,%bl
 981:	0f 84 b3 00 00 00    	je     a3a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 987:	8d 45 10             	lea    0x10(%ebp),%eax
 98a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 98d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 98f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 992:	eb 2f                	jmp    9c3 <printf+0x53>
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 998:	83 f8 25             	cmp    $0x25,%eax
 99b:	0f 84 a7 00 00 00    	je     a48 <printf+0xd8>
  write(fd, &c, 1);
 9a1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 9a4:	83 ec 04             	sub    $0x4,%esp
 9a7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 9aa:	6a 01                	push   $0x1
 9ac:	50                   	push   %eax
 9ad:	ff 75 08             	pushl  0x8(%ebp)
 9b0:	e8 7d fe ff ff       	call   832 <write>
 9b5:	83 c4 10             	add    $0x10,%esp
 9b8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 9bb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 9bf:	84 db                	test   %bl,%bl
 9c1:	74 77                	je     a3a <printf+0xca>
    if(state == 0){
 9c3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 9c5:	0f be cb             	movsbl %bl,%ecx
 9c8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 9cb:	74 cb                	je     998 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9cd:	83 ff 25             	cmp    $0x25,%edi
 9d0:	75 e6                	jne    9b8 <printf+0x48>
      if(c == 'd'){
 9d2:	83 f8 64             	cmp    $0x64,%eax
 9d5:	0f 84 05 01 00 00    	je     ae0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9e1:	83 f9 70             	cmp    $0x70,%ecx
 9e4:	74 72                	je     a58 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9e6:	83 f8 73             	cmp    $0x73,%eax
 9e9:	0f 84 99 00 00 00    	je     a88 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ef:	83 f8 63             	cmp    $0x63,%eax
 9f2:	0f 84 08 01 00 00    	je     b00 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9f8:	83 f8 25             	cmp    $0x25,%eax
 9fb:	0f 84 ef 00 00 00    	je     af0 <printf+0x180>
  write(fd, &c, 1);
 a01:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a04:	83 ec 04             	sub    $0x4,%esp
 a07:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a0b:	6a 01                	push   $0x1
 a0d:	50                   	push   %eax
 a0e:	ff 75 08             	pushl  0x8(%ebp)
 a11:	e8 1c fe ff ff       	call   832 <write>
 a16:	83 c4 0c             	add    $0xc,%esp
 a19:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 a1c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 a1f:	6a 01                	push   $0x1
 a21:	50                   	push   %eax
 a22:	ff 75 08             	pushl  0x8(%ebp)
 a25:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a28:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 a2a:	e8 03 fe ff ff       	call   832 <write>
  for(i = 0; fmt[i]; i++){
 a2f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 a33:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a36:	84 db                	test   %bl,%bl
 a38:	75 89                	jne    9c3 <printf+0x53>
    }
  }
}
 a3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a3d:	5b                   	pop    %ebx
 a3e:	5e                   	pop    %esi
 a3f:	5f                   	pop    %edi
 a40:	5d                   	pop    %ebp
 a41:	c3                   	ret    
 a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 a48:	bf 25 00 00 00       	mov    $0x25,%edi
 a4d:	e9 66 ff ff ff       	jmp    9b8 <printf+0x48>
 a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 a58:	83 ec 0c             	sub    $0xc,%esp
 a5b:	b9 10 00 00 00       	mov    $0x10,%ecx
 a60:	6a 00                	push   $0x0
 a62:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 a65:	8b 45 08             	mov    0x8(%ebp),%eax
 a68:	8b 17                	mov    (%edi),%edx
 a6a:	e8 61 fe ff ff       	call   8d0 <printint>
        ap++;
 a6f:	89 f8                	mov    %edi,%eax
 a71:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a74:	31 ff                	xor    %edi,%edi
        ap++;
 a76:	83 c0 04             	add    $0x4,%eax
 a79:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 a7c:	e9 37 ff ff ff       	jmp    9b8 <printf+0x48>
 a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 a88:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a8b:	8b 08                	mov    (%eax),%ecx
        ap++;
 a8d:	83 c0 04             	add    $0x4,%eax
 a90:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 a93:	85 c9                	test   %ecx,%ecx
 a95:	0f 84 8e 00 00 00    	je     b29 <printf+0x1b9>
        while(*s != 0){
 a9b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 a9e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 aa0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 aa2:	84 c0                	test   %al,%al
 aa4:	0f 84 0e ff ff ff    	je     9b8 <printf+0x48>
 aaa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 aad:	89 de                	mov    %ebx,%esi
 aaf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ab2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 ab5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 ab8:	83 ec 04             	sub    $0x4,%esp
          s++;
 abb:	83 c6 01             	add    $0x1,%esi
 abe:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 ac1:	6a 01                	push   $0x1
 ac3:	57                   	push   %edi
 ac4:	53                   	push   %ebx
 ac5:	e8 68 fd ff ff       	call   832 <write>
        while(*s != 0){
 aca:	0f b6 06             	movzbl (%esi),%eax
 acd:	83 c4 10             	add    $0x10,%esp
 ad0:	84 c0                	test   %al,%al
 ad2:	75 e4                	jne    ab8 <printf+0x148>
 ad4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 ad7:	31 ff                	xor    %edi,%edi
 ad9:	e9 da fe ff ff       	jmp    9b8 <printf+0x48>
 ade:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 ae0:	83 ec 0c             	sub    $0xc,%esp
 ae3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 ae8:	6a 01                	push   $0x1
 aea:	e9 73 ff ff ff       	jmp    a62 <printf+0xf2>
 aef:	90                   	nop
  write(fd, &c, 1);
 af0:	83 ec 04             	sub    $0x4,%esp
 af3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 af6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 af9:	6a 01                	push   $0x1
 afb:	e9 21 ff ff ff       	jmp    a21 <printf+0xb1>
        putc(fd, *ap);
 b00:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 b03:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 b06:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 b08:	6a 01                	push   $0x1
        ap++;
 b0a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 b0d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 b10:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 b13:	50                   	push   %eax
 b14:	ff 75 08             	pushl  0x8(%ebp)
 b17:	e8 16 fd ff ff       	call   832 <write>
        ap++;
 b1c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 b1f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b22:	31 ff                	xor    %edi,%edi
 b24:	e9 8f fe ff ff       	jmp    9b8 <printf+0x48>
          s = "(null)";
 b29:	bb 8c 0e 00 00       	mov    $0xe8c,%ebx
        while(*s != 0){
 b2e:	b8 28 00 00 00       	mov    $0x28,%eax
 b33:	e9 72 ff ff ff       	jmp    aaa <printf+0x13a>
 b38:	66 90                	xchg   %ax,%ax
 b3a:	66 90                	xchg   %ax,%ax
 b3c:	66 90                	xchg   %ax,%ax
 b3e:	66 90                	xchg   %ax,%ax

00000b40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b40:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b41:	a1 d8 11 00 00       	mov    0x11d8,%eax
{
 b46:	89 e5                	mov    %esp,%ebp
 b48:	57                   	push   %edi
 b49:	56                   	push   %esi
 b4a:	53                   	push   %ebx
 b4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 b4e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b58:	39 c8                	cmp    %ecx,%eax
 b5a:	8b 10                	mov    (%eax),%edx
 b5c:	73 32                	jae    b90 <free+0x50>
 b5e:	39 d1                	cmp    %edx,%ecx
 b60:	72 04                	jb     b66 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b62:	39 d0                	cmp    %edx,%eax
 b64:	72 32                	jb     b98 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b66:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b69:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b6c:	39 fa                	cmp    %edi,%edx
 b6e:	74 30                	je     ba0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b70:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b73:	8b 50 04             	mov    0x4(%eax),%edx
 b76:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b79:	39 f1                	cmp    %esi,%ecx
 b7b:	74 3a                	je     bb7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b7d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 b7f:	a3 d8 11 00 00       	mov    %eax,0x11d8
}
 b84:	5b                   	pop    %ebx
 b85:	5e                   	pop    %esi
 b86:	5f                   	pop    %edi
 b87:	5d                   	pop    %ebp
 b88:	c3                   	ret    
 b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b90:	39 d0                	cmp    %edx,%eax
 b92:	72 04                	jb     b98 <free+0x58>
 b94:	39 d1                	cmp    %edx,%ecx
 b96:	72 ce                	jb     b66 <free+0x26>
{
 b98:	89 d0                	mov    %edx,%eax
 b9a:	eb bc                	jmp    b58 <free+0x18>
 b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 ba0:	03 72 04             	add    0x4(%edx),%esi
 ba3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ba6:	8b 10                	mov    (%eax),%edx
 ba8:	8b 12                	mov    (%edx),%edx
 baa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bad:	8b 50 04             	mov    0x4(%eax),%edx
 bb0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bb3:	39 f1                	cmp    %esi,%ecx
 bb5:	75 c6                	jne    b7d <free+0x3d>
    p->s.size += bp->s.size;
 bb7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 bba:	a3 d8 11 00 00       	mov    %eax,0x11d8
    p->s.size += bp->s.size;
 bbf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 bc2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 bc5:	89 10                	mov    %edx,(%eax)
}
 bc7:	5b                   	pop    %ebx
 bc8:	5e                   	pop    %esi
 bc9:	5f                   	pop    %edi
 bca:	5d                   	pop    %ebp
 bcb:	c3                   	ret    
 bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	57                   	push   %edi
 bd4:	56                   	push   %esi
 bd5:	53                   	push   %ebx
 bd6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bdc:	8b 15 d8 11 00 00    	mov    0x11d8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 be2:	8d 78 07             	lea    0x7(%eax),%edi
 be5:	c1 ef 03             	shr    $0x3,%edi
 be8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 beb:	85 d2                	test   %edx,%edx
 bed:	0f 84 9d 00 00 00    	je     c90 <malloc+0xc0>
 bf3:	8b 02                	mov    (%edx),%eax
 bf5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bf8:	39 cf                	cmp    %ecx,%edi
 bfa:	76 6c                	jbe    c68 <malloc+0x98>
 bfc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 c02:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c07:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 c0a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 c11:	eb 0e                	jmp    c21 <malloc+0x51>
 c13:	90                   	nop
 c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c18:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 c1a:	8b 48 04             	mov    0x4(%eax),%ecx
 c1d:	39 f9                	cmp    %edi,%ecx
 c1f:	73 47                	jae    c68 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c21:	39 05 d8 11 00 00    	cmp    %eax,0x11d8
 c27:	89 c2                	mov    %eax,%edx
 c29:	75 ed                	jne    c18 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 c2b:	83 ec 0c             	sub    $0xc,%esp
 c2e:	56                   	push   %esi
 c2f:	e8 66 fc ff ff       	call   89a <sbrk>
  if(p == (char*)-1)
 c34:	83 c4 10             	add    $0x10,%esp
 c37:	83 f8 ff             	cmp    $0xffffffff,%eax
 c3a:	74 1c                	je     c58 <malloc+0x88>
  hp->s.size = nu;
 c3c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c3f:	83 ec 0c             	sub    $0xc,%esp
 c42:	83 c0 08             	add    $0x8,%eax
 c45:	50                   	push   %eax
 c46:	e8 f5 fe ff ff       	call   b40 <free>
  return freep;
 c4b:	8b 15 d8 11 00 00    	mov    0x11d8,%edx
      if((p = morecore(nunits)) == 0)
 c51:	83 c4 10             	add    $0x10,%esp
 c54:	85 d2                	test   %edx,%edx
 c56:	75 c0                	jne    c18 <malloc+0x48>
        return 0;
  }
}
 c58:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c5b:	31 c0                	xor    %eax,%eax
}
 c5d:	5b                   	pop    %ebx
 c5e:	5e                   	pop    %esi
 c5f:	5f                   	pop    %edi
 c60:	5d                   	pop    %ebp
 c61:	c3                   	ret    
 c62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 c68:	39 cf                	cmp    %ecx,%edi
 c6a:	74 54                	je     cc0 <malloc+0xf0>
        p->s.size -= nunits;
 c6c:	29 f9                	sub    %edi,%ecx
 c6e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 c71:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 c74:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 c77:	89 15 d8 11 00 00    	mov    %edx,0x11d8
}
 c7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c80:	83 c0 08             	add    $0x8,%eax
}
 c83:	5b                   	pop    %ebx
 c84:	5e                   	pop    %esi
 c85:	5f                   	pop    %edi
 c86:	5d                   	pop    %ebp
 c87:	c3                   	ret    
 c88:	90                   	nop
 c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 c90:	c7 05 d8 11 00 00 dc 	movl   $0x11dc,0x11d8
 c97:	11 00 00 
 c9a:	c7 05 dc 11 00 00 dc 	movl   $0x11dc,0x11dc
 ca1:	11 00 00 
    base.s.size = 0;
 ca4:	b8 dc 11 00 00       	mov    $0x11dc,%eax
 ca9:	c7 05 e0 11 00 00 00 	movl   $0x0,0x11e0
 cb0:	00 00 00 
 cb3:	e9 44 ff ff ff       	jmp    bfc <malloc+0x2c>
 cb8:	90                   	nop
 cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 cc0:	8b 08                	mov    (%eax),%ecx
 cc2:	89 0a                	mov    %ecx,(%edx)
 cc4:	eb b1                	jmp    c77 <malloc+0xa7>
