
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"
#include "pstat.h"

int main(int argc, char* argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	8d b5 e8 fb ff ff    	lea    -0x418(%ebp),%esi
  17:	8d bd e8 fc ff ff    	lea    -0x318(%ebp),%edi
  1d:	81 ec 08 04 00 00    	sub    $0x408,%esp
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct pstat ps;
  while(1){
    getpinfo(&ps);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	89 f3                	mov    %esi,%ebx
  2d:	56                   	push   %esi
  2e:	e8 77 03 00 00       	call   3aa <getpinfo>
    printf(1, "\nPID\t|\tUSED?\t|\tTickets\t|\tticks\n");
  33:	58                   	pop    %eax
  34:	5a                   	pop    %edx
  35:	68 d8 07 00 00       	push   $0x7d8
  3a:	6a 01                	push   $0x1
  3c:	e8 1f 04 00 00       	call   460 <printf>
  41:	83 c4 10             	add    $0x10,%esp
  44:	eb 11                	jmp    57 <main+0x57>
  46:	8d 76 00             	lea    0x0(%esi),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  50:	83 c3 04             	add    $0x4,%ebx
    for (int i = 0; i < sizeof(ps.pid)/sizeof(ps.pid[0]); i++)
  53:	39 fb                	cmp    %edi,%ebx
  55:	74 32                	je     89 <main+0x89>
    {
      if(ps.pid[i])
  57:	8b 83 00 02 00 00    	mov    0x200(%ebx),%eax
  5d:	85 c0                	test   %eax,%eax
  5f:	74 ef                	je     50 <main+0x50>
        printf(1, "%d\t|\t%d\t|\t%d\t|\t%d\n", ps.pid[i], ps.inuse[i], ps.tickets[i], ps.ticks[i]);
  61:	83 ec 08             	sub    $0x8,%esp
  64:	ff b3 00 03 00 00    	pushl  0x300(%ebx)
  6a:	ff b3 00 01 00 00    	pushl  0x100(%ebx)
  70:	ff 33                	pushl  (%ebx)
  72:	50                   	push   %eax
  73:	83 c3 04             	add    $0x4,%ebx
  76:	68 f8 07 00 00       	push   $0x7f8
  7b:	6a 01                	push   $0x1
  7d:	e8 de 03 00 00       	call   460 <printf>
  82:	83 c4 20             	add    $0x20,%esp
    for (int i = 0; i < sizeof(ps.pid)/sizeof(ps.pid[0]); i++)
  85:	39 fb                	cmp    %edi,%ebx
  87:	75 ce                	jne    57 <main+0x57>
    }
    sleep(200);
  89:	83 ec 0c             	sub    $0xc,%esp
  8c:	68 c8 00 00 00       	push   $0xc8
  91:	e8 ec 02 00 00       	call   382 <sleep>
    getpinfo(&ps);
  96:	83 c4 10             	add    $0x10,%esp
  99:	eb 8d                	jmp    28 <main+0x28>
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <strcpy>:
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  aa:	89 c2                	mov    %eax,%edx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	84 db                	test   %bl,%bl
  bc:	88 5a ff             	mov    %bl,-0x1(%edx)
  bf:	75 ef                	jne    b0 <strcpy+0x10>
  c1:	5b                   	pop    %ebx
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <strcmp>:
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 55 08             	mov    0x8(%ebp),%edx
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  da:	0f b6 02             	movzbl (%edx),%eax
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	84 c0                	test   %al,%al
  e2:	75 1c                	jne    100 <strcmp+0x30>
  e4:	eb 2a                	jmp    110 <strcmp+0x40>
  e6:	8d 76 00             	lea    0x0(%esi),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  f0:	83 c2 01             	add    $0x1,%edx
  f3:	0f b6 02             	movzbl (%edx),%eax
  f6:	83 c1 01             	add    $0x1,%ecx
  f9:	0f b6 19             	movzbl (%ecx),%ebx
  fc:	84 c0                	test   %al,%al
  fe:	74 10                	je     110 <strcmp+0x40>
 100:	38 d8                	cmp    %bl,%al
 102:	74 ec                	je     f0 <strcmp+0x20>
 104:	29 d8                	sub    %ebx,%eax
 106:	5b                   	pop    %ebx
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 110:	31 c0                	xor    %eax,%eax
 112:	29 d8                	sub    %ebx,%eax
 114:	5b                   	pop    %ebx
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	89 f6                	mov    %esi,%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <strlen>:
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
 126:	80 39 00             	cmpb   $0x0,(%ecx)
 129:	74 15                	je     140 <strlen+0x20>
 12b:	31 d2                	xor    %edx,%edx
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	83 c2 01             	add    $0x1,%edx
 133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 137:	89 d0                	mov    %edx,%eax
 139:	75 f5                	jne    130 <strlen+0x10>
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    
 13d:	8d 76 00             	lea    0x0(%esi),%esi
 140:	31 c0                	xor    %eax,%eax
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 14a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000150 <memset>:
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	89 d7                	mov    %edx,%edi
 15f:	fc                   	cld    
 160:	f3 aa                	rep stos %al,%es:(%edi)
 162:	89 d0                	mov    %edx,%eax
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <strchr>:
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	74 1d                	je     19e <strchr+0x2e>
 181:	38 d3                	cmp    %dl,%bl
 183:	89 d9                	mov    %ebx,%ecx
 185:	75 0d                	jne    194 <strchr+0x24>
 187:	eb 17                	jmp    1a0 <strchr+0x30>
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	38 ca                	cmp    %cl,%dl
 192:	74 0c                	je     1a0 <strchr+0x30>
 194:	83 c0 01             	add    $0x1,%eax
 197:	0f b6 10             	movzbl (%eax),%edx
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strchr+0x20>
 19e:	31 c0                	xor    %eax,%eax
 1a0:	5b                   	pop    %ebx
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <gets>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
 1b6:	31 f6                	xor    %esi,%esi
 1b8:	89 f3                	mov    %esi,%ebx
 1ba:	83 ec 1c             	sub    $0x1c,%esp
 1bd:	8b 7d 08             	mov    0x8(%ebp),%edi
 1c0:	eb 2f                	jmp    1f1 <gets+0x41>
 1c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1cb:	83 ec 04             	sub    $0x4,%esp
 1ce:	6a 01                	push   $0x1
 1d0:	50                   	push   %eax
 1d1:	6a 00                	push   $0x0
 1d3:	e8 32 01 00 00       	call   30a <read>
 1d8:	83 c4 10             	add    $0x10,%esp
 1db:	85 c0                	test   %eax,%eax
 1dd:	7e 1c                	jle    1fb <gets+0x4b>
 1df:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1e3:	83 c7 01             	add    $0x1,%edi
 1e6:	88 47 ff             	mov    %al,-0x1(%edi)
 1e9:	3c 0a                	cmp    $0xa,%al
 1eb:	74 23                	je     210 <gets+0x60>
 1ed:	3c 0d                	cmp    $0xd,%al
 1ef:	74 1f                	je     210 <gets+0x60>
 1f1:	83 c3 01             	add    $0x1,%ebx
 1f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f7:	89 fe                	mov    %edi,%esi
 1f9:	7c cd                	jl     1c8 <gets+0x18>
 1fb:	89 f3                	mov    %esi,%ebx
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	c6 03 00             	movb   $0x0,(%ebx)
 203:	8d 65 f4             	lea    -0xc(%ebp),%esp
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5f                   	pop    %edi
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    
 20b:	90                   	nop
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 210:	8b 75 08             	mov    0x8(%ebp),%esi
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	01 de                	add    %ebx,%esi
 218:	89 f3                	mov    %esi,%ebx
 21a:	c6 03 00             	movb   $0x0,(%ebx)
 21d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 220:	5b                   	pop    %ebx
 221:	5e                   	pop    %esi
 222:	5f                   	pop    %edi
 223:	5d                   	pop    %ebp
 224:	c3                   	ret    
 225:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <stat>:
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	56                   	push   %esi
 234:	53                   	push   %ebx
 235:	83 ec 08             	sub    $0x8,%esp
 238:	6a 00                	push   $0x0
 23a:	ff 75 08             	pushl  0x8(%ebp)
 23d:	e8 f0 00 00 00       	call   332 <open>
 242:	83 c4 10             	add    $0x10,%esp
 245:	85 c0                	test   %eax,%eax
 247:	78 27                	js     270 <stat+0x40>
 249:	83 ec 08             	sub    $0x8,%esp
 24c:	ff 75 0c             	pushl  0xc(%ebp)
 24f:	89 c3                	mov    %eax,%ebx
 251:	50                   	push   %eax
 252:	e8 f3 00 00 00       	call   34a <fstat>
 257:	89 1c 24             	mov    %ebx,(%esp)
 25a:	89 c6                	mov    %eax,%esi
 25c:	e8 b9 00 00 00       	call   31a <close>
 261:	83 c4 10             	add    $0x10,%esp
 264:	8d 65 f8             	lea    -0x8(%ebp),%esp
 267:	89 f0                	mov    %esi,%eax
 269:	5b                   	pop    %ebx
 26a:	5e                   	pop    %esi
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	be ff ff ff ff       	mov    $0xffffffff,%esi
 275:	eb ed                	jmp    264 <stat+0x34>
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <atoi>:
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 4d 08             	mov    0x8(%ebp),%ecx
 287:	0f be 11             	movsbl (%ecx),%edx
 28a:	8d 42 d0             	lea    -0x30(%edx),%eax
 28d:	3c 09                	cmp    $0x9,%al
 28f:	b8 00 00 00 00       	mov    $0x0,%eax
 294:	77 1f                	ja     2b5 <atoi+0x35>
 296:	8d 76 00             	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 2a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2a3:	83 c1 01             	add    $0x1,%ecx
 2a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 2aa:	0f be 11             	movsbl (%ecx),%edx
 2ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2b0:	80 fb 09             	cmp    $0x9,%bl
 2b3:	76 eb                	jbe    2a0 <atoi+0x20>
 2b5:	5b                   	pop    %ebx
 2b6:	5d                   	pop    %ebp
 2b7:	c3                   	ret    
 2b8:	90                   	nop
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002c0 <memmove>:
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	56                   	push   %esi
 2c4:	53                   	push   %ebx
 2c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2c8:	8b 45 08             	mov    0x8(%ebp),%eax
 2cb:	8b 75 0c             	mov    0xc(%ebp),%esi
 2ce:	85 db                	test   %ebx,%ebx
 2d0:	7e 14                	jle    2e6 <memmove+0x26>
 2d2:	31 d2                	xor    %edx,%edx
 2d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2df:	83 c2 01             	add    $0x1,%edx
 2e2:	39 d3                	cmp    %edx,%ebx
 2e4:	75 f2                	jne    2d8 <memmove+0x18>
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5d                   	pop    %ebp
 2e9:	c3                   	ret    

000002ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ea:	b8 01 00 00 00       	mov    $0x1,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <exit>:
SYSCALL(exit)
 2f2:	b8 02 00 00 00       	mov    $0x2,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <wait>:
SYSCALL(wait)
 2fa:	b8 03 00 00 00       	mov    $0x3,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <pipe>:
SYSCALL(pipe)
 302:	b8 04 00 00 00       	mov    $0x4,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <read>:
SYSCALL(read)
 30a:	b8 05 00 00 00       	mov    $0x5,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <write>:
SYSCALL(write)
 312:	b8 10 00 00 00       	mov    $0x10,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <close>:
SYSCALL(close)
 31a:	b8 15 00 00 00       	mov    $0x15,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <kill>:
SYSCALL(kill)
 322:	b8 06 00 00 00       	mov    $0x6,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <exec>:
SYSCALL(exec)
 32a:	b8 07 00 00 00       	mov    $0x7,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <open>:
SYSCALL(open)
 332:	b8 0f 00 00 00       	mov    $0xf,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <mknod>:
SYSCALL(mknod)
 33a:	b8 11 00 00 00       	mov    $0x11,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <unlink>:
SYSCALL(unlink)
 342:	b8 12 00 00 00       	mov    $0x12,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <fstat>:
SYSCALL(fstat)
 34a:	b8 08 00 00 00       	mov    $0x8,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <link>:
SYSCALL(link)
 352:	b8 13 00 00 00       	mov    $0x13,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <mkdir>:
SYSCALL(mkdir)
 35a:	b8 14 00 00 00       	mov    $0x14,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <chdir>:
SYSCALL(chdir)
 362:	b8 09 00 00 00       	mov    $0x9,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <dup>:
SYSCALL(dup)
 36a:	b8 0a 00 00 00       	mov    $0xa,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <getpid>:
SYSCALL(getpid)
 372:	b8 0b 00 00 00       	mov    $0xb,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <sbrk>:
SYSCALL(sbrk)
 37a:	b8 0c 00 00 00       	mov    $0xc,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <sleep>:
SYSCALL(sleep)
 382:	b8 0d 00 00 00       	mov    $0xd,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <uptime>:
SYSCALL(uptime)
 38a:	b8 0e 00 00 00       	mov    $0xe,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <getreadcount>:
SYSCALL(getreadcount)
 392:	b8 16 00 00 00       	mov    $0x16,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <gettime>:
SYSCALL(gettime)
 39a:	b8 17 00 00 00       	mov    $0x17,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <settickets>:
SYSCALL(settickets)
 3a2:	b8 18 00 00 00       	mov    $0x18,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <getpinfo>:
 3aa:	b8 19 00 00 00       	mov    $0x19,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    
 3b2:	66 90                	xchg   %ax,%ax
 3b4:	66 90                	xchg   %ax,%ax
 3b6:	66 90                	xchg   %ax,%ax
 3b8:	66 90                	xchg   %ax,%ax
 3ba:	66 90                	xchg   %ax,%ax
 3bc:	66 90                	xchg   %ax,%ax
 3be:	66 90                	xchg   %ax,%ax

000003c0 <printint>:
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 3c             	sub    $0x3c,%esp
 3c9:	85 d2                	test   %edx,%edx
 3cb:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3ce:	89 d0                	mov    %edx,%eax
 3d0:	79 76                	jns    448 <printint+0x88>
 3d2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3d6:	74 70                	je     448 <printint+0x88>
 3d8:	f7 d8                	neg    %eax
 3da:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3e1:	31 f6                	xor    %esi,%esi
 3e3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3e6:	eb 0a                	jmp    3f2 <printint+0x32>
 3e8:	90                   	nop
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f0:	89 fe                	mov    %edi,%esi
 3f2:	31 d2                	xor    %edx,%edx
 3f4:	8d 7e 01             	lea    0x1(%esi),%edi
 3f7:	f7 f1                	div    %ecx
 3f9:	0f b6 92 14 08 00 00 	movzbl 0x814(%edx),%edx
 400:	85 c0                	test   %eax,%eax
 402:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
 405:	75 e9                	jne    3f0 <printint+0x30>
 407:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 40a:	85 c0                	test   %eax,%eax
 40c:	74 08                	je     416 <printint+0x56>
 40e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 413:	8d 7e 02             	lea    0x2(%esi),%edi
 416:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 41a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
 420:	0f b6 06             	movzbl (%esi),%eax
 423:	83 ec 04             	sub    $0x4,%esp
 426:	83 ee 01             	sub    $0x1,%esi
 429:	6a 01                	push   $0x1
 42b:	53                   	push   %ebx
 42c:	57                   	push   %edi
 42d:	88 45 d7             	mov    %al,-0x29(%ebp)
 430:	e8 dd fe ff ff       	call   312 <write>
 435:	83 c4 10             	add    $0x10,%esp
 438:	39 de                	cmp    %ebx,%esi
 43a:	75 e4                	jne    420 <printint+0x60>
 43c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43f:	5b                   	pop    %ebx
 440:	5e                   	pop    %esi
 441:	5f                   	pop    %edi
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 448:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 44f:	eb 90                	jmp    3e1 <printint+0x21>
 451:	eb 0d                	jmp    460 <printf>
 453:	90                   	nop
 454:	90                   	nop
 455:	90                   	nop
 456:	90                   	nop
 457:	90                   	nop
 458:	90                   	nop
 459:	90                   	nop
 45a:	90                   	nop
 45b:	90                   	nop
 45c:	90                   	nop
 45d:	90                   	nop
 45e:	90                   	nop
 45f:	90                   	nop

00000460 <printf>:
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 2c             	sub    $0x2c,%esp
 469:	8b 75 0c             	mov    0xc(%ebp),%esi
 46c:	0f b6 1e             	movzbl (%esi),%ebx
 46f:	84 db                	test   %bl,%bl
 471:	0f 84 bf 00 00 00    	je     536 <printf+0xd6>
 477:	83 c6 01             	add    $0x1,%esi
 47a:	8d 7d 10             	lea    0x10(%ebp),%edi
 47d:	31 d2                	xor    %edx,%edx
 47f:	eb 39                	jmp    4ba <printf+0x5a>
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	83 f8 25             	cmp    $0x25,%eax
 48b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 48e:	ba 25 00 00 00       	mov    $0x25,%edx
 493:	74 1a                	je     4af <printf+0x4f>
 495:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 498:	83 ec 04             	sub    $0x4,%esp
 49b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 49e:	6a 01                	push   $0x1
 4a0:	50                   	push   %eax
 4a1:	ff 75 08             	pushl  0x8(%ebp)
 4a4:	e8 69 fe ff ff       	call   312 <write>
 4a9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4ac:	83 c4 10             	add    $0x10,%esp
 4af:	83 c6 01             	add    $0x1,%esi
 4b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4b6:	84 db                	test   %bl,%bl
 4b8:	74 7c                	je     536 <printf+0xd6>
 4ba:	85 d2                	test   %edx,%edx
 4bc:	0f be cb             	movsbl %bl,%ecx
 4bf:	0f b6 c3             	movzbl %bl,%eax
 4c2:	74 c4                	je     488 <printf+0x28>
 4c4:	83 fa 25             	cmp    $0x25,%edx
 4c7:	75 e6                	jne    4af <printf+0x4f>
 4c9:	83 f8 64             	cmp    $0x64,%eax
 4cc:	0f 84 a6 00 00 00    	je     578 <printf+0x118>
 4d2:	83 f8 6c             	cmp    $0x6c,%eax
 4d5:	0f 84 ad 00 00 00    	je     588 <printf+0x128>
 4db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4e1:	83 f9 70             	cmp    $0x70,%ecx
 4e4:	74 5a                	je     540 <printf+0xe0>
 4e6:	83 f8 73             	cmp    $0x73,%eax
 4e9:	0f 84 e1 00 00 00    	je     5d0 <printf+0x170>
 4ef:	83 f8 63             	cmp    $0x63,%eax
 4f2:	0f 84 28 01 00 00    	je     620 <printf+0x1c0>
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	74 6b                	je     568 <printf+0x108>
 4fd:	8d 45 e7             	lea    -0x19(%ebp),%eax
 500:	83 ec 04             	sub    $0x4,%esp
 503:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 507:	6a 01                	push   $0x1
 509:	50                   	push   %eax
 50a:	ff 75 08             	pushl  0x8(%ebp)
 50d:	e8 00 fe ff ff       	call   312 <write>
 512:	83 c4 0c             	add    $0xc,%esp
 515:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 518:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 51b:	6a 01                	push   $0x1
 51d:	50                   	push   %eax
 51e:	ff 75 08             	pushl  0x8(%ebp)
 521:	83 c6 01             	add    $0x1,%esi
 524:	e8 e9 fd ff ff       	call   312 <write>
 529:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 52d:	83 c4 10             	add    $0x10,%esp
 530:	31 d2                	xor    %edx,%edx
 532:	84 db                	test   %bl,%bl
 534:	75 84                	jne    4ba <printf+0x5a>
 536:	8d 65 f4             	lea    -0xc(%ebp),%esp
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5f                   	pop    %edi
 53c:	5d                   	pop    %ebp
 53d:	c3                   	ret    
 53e:	66 90                	xchg   %ax,%ax
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	b9 10 00 00 00       	mov    $0x10,%ecx
 548:	6a 00                	push   $0x0
 54a:	8b 17                	mov    (%edi),%edx
 54c:	8b 45 08             	mov    0x8(%ebp),%eax
 54f:	83 c7 04             	add    $0x4,%edi
 552:	e8 69 fe ff ff       	call   3c0 <printint>
 557:	83 c4 10             	add    $0x10,%esp
 55a:	31 d2                	xor    %edx,%edx
 55c:	e9 4e ff ff ff       	jmp    4af <printf+0x4f>
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 568:	83 ec 04             	sub    $0x4,%esp
 56b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 56e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 571:	6a 01                	push   $0x1
 573:	eb a8                	jmp    51d <printf+0xbd>
 575:	8d 76 00             	lea    0x0(%esi),%esi
 578:	83 ec 0c             	sub    $0xc,%esp
 57b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 580:	6a 01                	push   $0x1
 582:	eb c6                	jmp    54a <printf+0xea>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 588:	8b 57 04             	mov    0x4(%edi),%edx
 58b:	8b 1f                	mov    (%edi),%ebx
 58d:	85 d2                	test   %edx,%edx
 58f:	74 15                	je     5a6 <printf+0x146>
 591:	83 ec 0c             	sub    $0xc,%esp
 594:	8b 45 08             	mov    0x8(%ebp),%eax
 597:	b9 10 00 00 00       	mov    $0x10,%ecx
 59c:	6a 00                	push   $0x0
 59e:	e8 1d fe ff ff       	call   3c0 <printint>
 5a3:	83 c4 10             	add    $0x10,%esp
 5a6:	83 ec 0c             	sub    $0xc,%esp
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	89 da                	mov    %ebx,%edx
 5ae:	6a 00                	push   $0x0
 5b0:	b9 10 00 00 00       	mov    $0x10,%ecx
 5b5:	83 c7 08             	add    $0x8,%edi
 5b8:	e8 03 fe ff ff       	call   3c0 <printint>
 5bd:	83 c4 10             	add    $0x10,%esp
 5c0:	31 d2                	xor    %edx,%edx
 5c2:	e9 e8 fe ff ff       	jmp    4af <printf+0x4f>
 5c7:	89 f6                	mov    %esi,%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5d0:	8b 0f                	mov    (%edi),%ecx
 5d2:	83 c7 04             	add    $0x4,%edi
 5d5:	85 c9                	test   %ecx,%ecx
 5d7:	74 6a                	je     643 <printf+0x1e3>
 5d9:	0f b6 01             	movzbl (%ecx),%eax
 5dc:	31 d2                	xor    %edx,%edx
 5de:	89 cb                	mov    %ecx,%ebx
 5e0:	84 c0                	test   %al,%al
 5e2:	0f 84 c7 fe ff ff    	je     4af <printf+0x4f>
 5e8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5eb:	89 de                	mov    %ebx,%esi
 5ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
 5f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5f6:	83 ec 04             	sub    $0x4,%esp
 5f9:	6a 01                	push   $0x1
 5fb:	83 c6 01             	add    $0x1,%esi
 5fe:	50                   	push   %eax
 5ff:	53                   	push   %ebx
 600:	e8 0d fd ff ff       	call   312 <write>
 605:	0f b6 06             	movzbl (%esi),%eax
 608:	83 c4 10             	add    $0x10,%esp
 60b:	84 c0                	test   %al,%al
 60d:	75 e1                	jne    5f0 <printf+0x190>
 60f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 612:	31 d2                	xor    %edx,%edx
 614:	e9 96 fe ff ff       	jmp    4af <printf+0x4f>
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 620:	8b 07                	mov    (%edi),%eax
 622:	83 ec 04             	sub    $0x4,%esp
 625:	83 c7 04             	add    $0x4,%edi
 628:	6a 01                	push   $0x1
 62a:	88 45 e4             	mov    %al,-0x1c(%ebp)
 62d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 630:	50                   	push   %eax
 631:	ff 75 08             	pushl  0x8(%ebp)
 634:	e8 d9 fc ff ff       	call   312 <write>
 639:	83 c4 10             	add    $0x10,%esp
 63c:	31 d2                	xor    %edx,%edx
 63e:	e9 6c fe ff ff       	jmp    4af <printf+0x4f>
 643:	bb 0b 08 00 00       	mov    $0x80b,%ebx
 648:	b8 28 00 00 00       	mov    $0x28,%eax
 64d:	eb 99                	jmp    5e8 <printf+0x188>
 64f:	90                   	nop

00000650 <free>:
 650:	55                   	push   %ebp
 651:	a1 c4 0a 00 00       	mov    0xac4,%eax
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 65e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 668:	39 c8                	cmp    %ecx,%eax
 66a:	8b 10                	mov    (%eax),%edx
 66c:	73 32                	jae    6a0 <free+0x50>
 66e:	39 d1                	cmp    %edx,%ecx
 670:	72 04                	jb     676 <free+0x26>
 672:	39 d0                	cmp    %edx,%eax
 674:	72 32                	jb     6a8 <free+0x58>
 676:	8b 73 fc             	mov    -0x4(%ebx),%esi
 679:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 67c:	39 fa                	cmp    %edi,%edx
 67e:	74 30                	je     6b0 <free+0x60>
 680:	89 53 f8             	mov    %edx,-0x8(%ebx)
 683:	8b 50 04             	mov    0x4(%eax),%edx
 686:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 689:	39 f1                	cmp    %esi,%ecx
 68b:	74 3a                	je     6c7 <free+0x77>
 68d:	89 08                	mov    %ecx,(%eax)
 68f:	a3 c4 0a 00 00       	mov    %eax,0xac4
 694:	5b                   	pop    %ebx
 695:	5e                   	pop    %esi
 696:	5f                   	pop    %edi
 697:	5d                   	pop    %ebp
 698:	c3                   	ret    
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a0:	39 d0                	cmp    %edx,%eax
 6a2:	72 04                	jb     6a8 <free+0x58>
 6a4:	39 d1                	cmp    %edx,%ecx
 6a6:	72 ce                	jb     676 <free+0x26>
 6a8:	89 d0                	mov    %edx,%eax
 6aa:	eb bc                	jmp    668 <free+0x18>
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6b0:	03 72 04             	add    0x4(%edx),%esi
 6b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
 6b6:	8b 10                	mov    (%eax),%edx
 6b8:	8b 12                	mov    (%edx),%edx
 6ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6bd:	8b 50 04             	mov    0x4(%eax),%edx
 6c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c3:	39 f1                	cmp    %esi,%ecx
 6c5:	75 c6                	jne    68d <free+0x3d>
 6c7:	03 53 fc             	add    -0x4(%ebx),%edx
 6ca:	a3 c4 0a 00 00       	mov    %eax,0xac4
 6cf:	89 50 04             	mov    %edx,0x4(%eax)
 6d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6d5:	89 10                	mov    %edx,(%eax)
 6d7:	5b                   	pop    %ebx
 6d8:	5e                   	pop    %esi
 6d9:	5f                   	pop    %edi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret    
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006e0 <malloc>:
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 0c             	sub    $0xc,%esp
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
 6ec:	8b 15 c4 0a 00 00    	mov    0xac4,%edx
 6f2:	8d 78 07             	lea    0x7(%eax),%edi
 6f5:	c1 ef 03             	shr    $0x3,%edi
 6f8:	83 c7 01             	add    $0x1,%edi
 6fb:	85 d2                	test   %edx,%edx
 6fd:	0f 84 9d 00 00 00    	je     7a0 <malloc+0xc0>
 703:	8b 02                	mov    (%edx),%eax
 705:	8b 48 04             	mov    0x4(%eax),%ecx
 708:	39 cf                	cmp    %ecx,%edi
 70a:	76 6c                	jbe    778 <malloc+0x98>
 70c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 712:	bb 00 10 00 00       	mov    $0x1000,%ebx
 717:	0f 43 df             	cmovae %edi,%ebx
 71a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 721:	eb 0e                	jmp    731 <malloc+0x51>
 723:	90                   	nop
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 728:	8b 02                	mov    (%edx),%eax
 72a:	8b 48 04             	mov    0x4(%eax),%ecx
 72d:	39 f9                	cmp    %edi,%ecx
 72f:	73 47                	jae    778 <malloc+0x98>
 731:	39 05 c4 0a 00 00    	cmp    %eax,0xac4
 737:	89 c2                	mov    %eax,%edx
 739:	75 ed                	jne    728 <malloc+0x48>
 73b:	83 ec 0c             	sub    $0xc,%esp
 73e:	56                   	push   %esi
 73f:	e8 36 fc ff ff       	call   37a <sbrk>
 744:	83 c4 10             	add    $0x10,%esp
 747:	83 f8 ff             	cmp    $0xffffffff,%eax
 74a:	74 1c                	je     768 <malloc+0x88>
 74c:	89 58 04             	mov    %ebx,0x4(%eax)
 74f:	83 ec 0c             	sub    $0xc,%esp
 752:	83 c0 08             	add    $0x8,%eax
 755:	50                   	push   %eax
 756:	e8 f5 fe ff ff       	call   650 <free>
 75b:	8b 15 c4 0a 00 00    	mov    0xac4,%edx
 761:	83 c4 10             	add    $0x10,%esp
 764:	85 d2                	test   %edx,%edx
 766:	75 c0                	jne    728 <malloc+0x48>
 768:	8d 65 f4             	lea    -0xc(%ebp),%esp
 76b:	31 c0                	xor    %eax,%eax
 76d:	5b                   	pop    %ebx
 76e:	5e                   	pop    %esi
 76f:	5f                   	pop    %edi
 770:	5d                   	pop    %ebp
 771:	c3                   	ret    
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 778:	39 cf                	cmp    %ecx,%edi
 77a:	74 54                	je     7d0 <malloc+0xf0>
 77c:	29 f9                	sub    %edi,%ecx
 77e:	89 48 04             	mov    %ecx,0x4(%eax)
 781:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 784:	89 78 04             	mov    %edi,0x4(%eax)
 787:	89 15 c4 0a 00 00    	mov    %edx,0xac4
 78d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 790:	83 c0 08             	add    $0x8,%eax
 793:	5b                   	pop    %ebx
 794:	5e                   	pop    %esi
 795:	5f                   	pop    %edi
 796:	5d                   	pop    %ebp
 797:	c3                   	ret    
 798:	90                   	nop
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7a0:	c7 05 c4 0a 00 00 c8 	movl   $0xac8,0xac4
 7a7:	0a 00 00 
 7aa:	c7 05 c8 0a 00 00 c8 	movl   $0xac8,0xac8
 7b1:	0a 00 00 
 7b4:	b8 c8 0a 00 00       	mov    $0xac8,%eax
 7b9:	c7 05 cc 0a 00 00 00 	movl   $0x0,0xacc
 7c0:	00 00 00 
 7c3:	e9 44 ff ff ff       	jmp    70c <malloc+0x2c>
 7c8:	90                   	nop
 7c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d0:	8b 08                	mov    (%eax),%ecx
 7d2:	89 0a                	mov    %ecx,(%edx)
 7d4:	eb b1                	jmp    787 <malloc+0xa7>
