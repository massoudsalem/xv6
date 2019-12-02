
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 64 02 00 00       	call   27a <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 ee 02 00 00       	call   312 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 56 02 00 00       	call   282 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
  34:	8b 45 08             	mov    0x8(%ebp),%eax
  37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  3a:	89 c2                	mov    %eax,%edx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  40:	83 c1 01             	add    $0x1,%ecx
  43:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  47:	83 c2 01             	add    $0x1,%edx
  4a:	84 db                	test   %bl,%bl
  4c:	88 5a ff             	mov    %bl,-0x1(%edx)
  4f:	75 ef                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  51:	5b                   	pop    %ebx
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    
  54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	0f b6 19             	movzbl (%ecx),%ebx
  70:	84 c0                	test   %al,%al
  72:	75 1c                	jne    90 <strcmp+0x30>
  74:	eb 2a                	jmp    a0 <strcmp+0x40>
  76:	8d 76 00             	lea    0x0(%esi),%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  80:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  83:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  86:	83 c1 01             	add    $0x1,%ecx
  89:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  8c:	84 c0                	test   %al,%al
  8e:	74 10                	je     a0 <strcmp+0x40>
  90:	38 d8                	cmp    %bl,%al
  92:	74 ec                	je     80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  94:	29 d8                	sub    %ebx,%eax
}
  96:	5b                   	pop    %ebx
  97:	5d                   	pop    %ebp
  98:	c3                   	ret    
  99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  a2:	29 d8                	sub    %ebx,%eax
}
  a4:	5b                   	pop    %ebx
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    
  a7:	89 f6                	mov    %esi,%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000b0 <strlen>:

uint
strlen(const char *s)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  b6:	80 39 00             	cmpb   $0x0,(%ecx)
  b9:	74 15                	je     d0 <strlen+0x20>
  bb:	31 d2                	xor    %edx,%edx
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	83 c2 01             	add    $0x1,%edx
  c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  c7:	89 d0                	mov    %edx,%eax
  c9:	75 f5                	jne    c0 <strlen+0x10>
    ;
  return n;
}
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  d0:	31 c0                	xor    %eax,%eax
}
  d2:	5d                   	pop    %ebp
  d3:	c3                   	ret    
  d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 d7                	mov    %edx,%edi
  ef:	fc                   	cld    
  f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f2:	89 d0                	mov    %edx,%eax
  f4:	5f                   	pop    %edi
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	53                   	push   %ebx
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 10a:	0f b6 10             	movzbl (%eax),%edx
 10d:	84 d2                	test   %dl,%dl
 10f:	74 1d                	je     12e <strchr+0x2e>
    if(*s == c)
 111:	38 d3                	cmp    %dl,%bl
 113:	89 d9                	mov    %ebx,%ecx
 115:	75 0d                	jne    124 <strchr+0x24>
 117:	eb 17                	jmp    130 <strchr+0x30>
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 120:	38 ca                	cmp    %cl,%dl
 122:	74 0c                	je     130 <strchr+0x30>
  for(; *s; s++)
 124:	83 c0 01             	add    $0x1,%eax
 127:	0f b6 10             	movzbl (%eax),%edx
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strchr+0x20>
      return (char*)s;
  return 0;
 12e:	31 c0                	xor    %eax,%eax
}
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <gets>:

char*
gets(char *buf, int max)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 146:	31 f6                	xor    %esi,%esi
 148:	89 f3                	mov    %esi,%ebx
{
 14a:	83 ec 1c             	sub    $0x1c,%esp
 14d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 150:	eb 2f                	jmp    181 <gets+0x41>
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 158:	8d 45 e7             	lea    -0x19(%ebp),%eax
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	6a 01                	push   $0x1
 160:	50                   	push   %eax
 161:	6a 00                	push   $0x0
 163:	e8 32 01 00 00       	call   29a <read>
    if(cc < 1)
 168:	83 c4 10             	add    $0x10,%esp
 16b:	85 c0                	test   %eax,%eax
 16d:	7e 1c                	jle    18b <gets+0x4b>
      break;
    buf[i++] = c;
 16f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 173:	83 c7 01             	add    $0x1,%edi
 176:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 179:	3c 0a                	cmp    $0xa,%al
 17b:	74 23                	je     1a0 <gets+0x60>
 17d:	3c 0d                	cmp    $0xd,%al
 17f:	74 1f                	je     1a0 <gets+0x60>
  for(i=0; i+1 < max; ){
 181:	83 c3 01             	add    $0x1,%ebx
 184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 187:	89 fe                	mov    %edi,%esi
 189:	7c cd                	jl     158 <gets+0x18>
 18b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 18d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 190:	c6 03 00             	movb   $0x0,(%ebx)
}
 193:	8d 65 f4             	lea    -0xc(%ebp),%esp
 196:	5b                   	pop    %ebx
 197:	5e                   	pop    %esi
 198:	5f                   	pop    %edi
 199:	5d                   	pop    %ebp
 19a:	c3                   	ret    
 19b:	90                   	nop
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	8b 75 08             	mov    0x8(%ebp),%esi
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	01 de                	add    %ebx,%esi
 1a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1aa:	c6 03 00             	movb   $0x0,(%ebx)
}
 1ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b0:	5b                   	pop    %ebx
 1b1:	5e                   	pop    %esi
 1b2:	5f                   	pop    %edi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c5:	83 ec 08             	sub    $0x8,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	ff 75 08             	pushl  0x8(%ebp)
 1cd:	e8 f0 00 00 00       	call   2c2 <open>
  if(fd < 0)
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	85 c0                	test   %eax,%eax
 1d7:	78 27                	js     200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	pushl  0xc(%ebp)
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	50                   	push   %eax
 1e2:	e8 f3 00 00 00       	call   2da <fstat>
  close(fd);
 1e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ea:	89 c6                	mov    %eax,%esi
  close(fd);
 1ec:	e8 b9 00 00 00       	call   2aa <close>
  return r;
 1f1:	83 c4 10             	add    $0x10,%esp
}
 1f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f7:	89 f0                	mov    %esi,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 200:	be ff ff ff ff       	mov    $0xffffffff,%esi
 205:	eb ed                	jmp    1f4 <stat+0x34>
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <atoi>:

int
atoi(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 217:	0f be 11             	movsbl (%ecx),%edx
 21a:	8d 42 d0             	lea    -0x30(%edx),%eax
 21d:	3c 09                	cmp    $0x9,%al
  n = 0;
 21f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 224:	77 1f                	ja     245 <atoi+0x35>
 226:	8d 76 00             	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 230:	8d 04 80             	lea    (%eax,%eax,4),%eax
 233:	83 c1 01             	add    $0x1,%ecx
 236:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 23a:	0f be 11             	movsbl (%ecx),%edx
 23d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
  return n;
}
 245:	5b                   	pop    %ebx
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
 255:	8b 5d 10             	mov    0x10(%ebp),%ebx
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 25e:	85 db                	test   %ebx,%ebx
 260:	7e 14                	jle    276 <memmove+0x26>
 262:	31 d2                	xor    %edx,%edx
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 268:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 26c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 26f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 272:	39 d3                	cmp    %edx,%ebx
 274:	75 f2                	jne    268 <memmove+0x18>
  return vdst;
}
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    

0000027a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27a:	b8 01 00 00 00       	mov    $0x1,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <exit>:
SYSCALL(exit)
 282:	b8 02 00 00 00       	mov    $0x2,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <wait>:
SYSCALL(wait)
 28a:	b8 03 00 00 00       	mov    $0x3,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <pipe>:
SYSCALL(pipe)
 292:	b8 04 00 00 00       	mov    $0x4,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <read>:
SYSCALL(read)
 29a:	b8 05 00 00 00       	mov    $0x5,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <write>:
SYSCALL(write)
 2a2:	b8 10 00 00 00       	mov    $0x10,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <close>:
SYSCALL(close)
 2aa:	b8 15 00 00 00       	mov    $0x15,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <kill>:
SYSCALL(kill)
 2b2:	b8 06 00 00 00       	mov    $0x6,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <exec>:
SYSCALL(exec)
 2ba:	b8 07 00 00 00       	mov    $0x7,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <open>:
SYSCALL(open)
 2c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <mknod>:
SYSCALL(mknod)
 2ca:	b8 11 00 00 00       	mov    $0x11,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <unlink>:
SYSCALL(unlink)
 2d2:	b8 12 00 00 00       	mov    $0x12,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <fstat>:
SYSCALL(fstat)
 2da:	b8 08 00 00 00       	mov    $0x8,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <link>:
SYSCALL(link)
 2e2:	b8 13 00 00 00       	mov    $0x13,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <mkdir>:
SYSCALL(mkdir)
 2ea:	b8 14 00 00 00       	mov    $0x14,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <chdir>:
SYSCALL(chdir)
 2f2:	b8 09 00 00 00       	mov    $0x9,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <dup>:
SYSCALL(dup)
 2fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <getpid>:
SYSCALL(getpid)
 302:	b8 0b 00 00 00       	mov    $0xb,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <sbrk>:
SYSCALL(sbrk)
 30a:	b8 0c 00 00 00       	mov    $0xc,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <sleep>:
SYSCALL(sleep)
 312:	b8 0d 00 00 00       	mov    $0xd,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <uptime>:
SYSCALL(uptime)
 31a:	b8 0e 00 00 00       	mov    $0xe,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <getreadcount>:
SYSCALL(getreadcount)
 322:	b8 16 00 00 00       	mov    $0x16,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    
 32a:	66 90                	xchg   %ax,%ax
 32c:	66 90                	xchg   %ax,%ax
 32e:	66 90                	xchg   %ax,%ax

00000330 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
 336:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 339:	85 d2                	test   %edx,%edx
{
 33b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 33e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 340:	79 76                	jns    3b8 <printint+0x88>
 342:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 346:	74 70                	je     3b8 <printint+0x88>
    x = -xx;
 348:	f7 d8                	neg    %eax
    neg = 1;
 34a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 351:	31 f6                	xor    %esi,%esi
 353:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 356:	eb 0a                	jmp    362 <printint+0x32>
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 360:	89 fe                	mov    %edi,%esi
 362:	31 d2                	xor    %edx,%edx
 364:	8d 7e 01             	lea    0x1(%esi),%edi
 367:	f7 f1                	div    %ecx
 369:	0f b6 92 30 07 00 00 	movzbl 0x730(%edx),%edx
  }while((x /= base) != 0);
 370:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 372:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 375:	75 e9                	jne    360 <printint+0x30>
  if(neg)
 377:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 37a:	85 c0                	test   %eax,%eax
 37c:	74 08                	je     386 <printint+0x56>
    buf[i++] = '-';
 37e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 383:	8d 7e 02             	lea    0x2(%esi),%edi
 386:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 38a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 38d:	8d 76 00             	lea    0x0(%esi),%esi
 390:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 393:	83 ec 04             	sub    $0x4,%esp
 396:	83 ee 01             	sub    $0x1,%esi
 399:	6a 01                	push   $0x1
 39b:	53                   	push   %ebx
 39c:	57                   	push   %edi
 39d:	88 45 d7             	mov    %al,-0x29(%ebp)
 3a0:	e8 fd fe ff ff       	call   2a2 <write>

  while(--i >= 0)
 3a5:	83 c4 10             	add    $0x10,%esp
 3a8:	39 de                	cmp    %ebx,%esi
 3aa:	75 e4                	jne    390 <printint+0x60>
    putc(fd, buf[i]);
}
 3ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3af:	5b                   	pop    %ebx
 3b0:	5e                   	pop    %esi
 3b1:	5f                   	pop    %edi
 3b2:	5d                   	pop    %ebp
 3b3:	c3                   	ret    
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3b8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3bf:	eb 90                	jmp    351 <printint+0x21>
 3c1:	eb 0d                	jmp    3d0 <printf>
 3c3:	90                   	nop
 3c4:	90                   	nop
 3c5:	90                   	nop
 3c6:	90                   	nop
 3c7:	90                   	nop
 3c8:	90                   	nop
 3c9:	90                   	nop
 3ca:	90                   	nop
 3cb:	90                   	nop
 3cc:	90                   	nop
 3cd:	90                   	nop
 3ce:	90                   	nop
 3cf:	90                   	nop

000003d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3d9:	8b 75 0c             	mov    0xc(%ebp),%esi
 3dc:	0f b6 1e             	movzbl (%esi),%ebx
 3df:	84 db                	test   %bl,%bl
 3e1:	0f 84 b3 00 00 00    	je     49a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 3e7:	8d 45 10             	lea    0x10(%ebp),%eax
 3ea:	83 c6 01             	add    $0x1,%esi
  state = 0;
 3ed:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 3ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3f2:	eb 2f                	jmp    423 <printf+0x53>
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3f8:	83 f8 25             	cmp    $0x25,%eax
 3fb:	0f 84 a7 00 00 00    	je     4a8 <printf+0xd8>
  write(fd, &c, 1);
 401:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 404:	83 ec 04             	sub    $0x4,%esp
 407:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 40a:	6a 01                	push   $0x1
 40c:	50                   	push   %eax
 40d:	ff 75 08             	pushl  0x8(%ebp)
 410:	e8 8d fe ff ff       	call   2a2 <write>
 415:	83 c4 10             	add    $0x10,%esp
 418:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 41b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 41f:	84 db                	test   %bl,%bl
 421:	74 77                	je     49a <printf+0xca>
    if(state == 0){
 423:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 425:	0f be cb             	movsbl %bl,%ecx
 428:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 42b:	74 cb                	je     3f8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 42d:	83 ff 25             	cmp    $0x25,%edi
 430:	75 e6                	jne    418 <printf+0x48>
      if(c == 'd'){
 432:	83 f8 64             	cmp    $0x64,%eax
 435:	0f 84 05 01 00 00    	je     540 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 43b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 441:	83 f9 70             	cmp    $0x70,%ecx
 444:	74 72                	je     4b8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 446:	83 f8 73             	cmp    $0x73,%eax
 449:	0f 84 99 00 00 00    	je     4e8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 44f:	83 f8 63             	cmp    $0x63,%eax
 452:	0f 84 08 01 00 00    	je     560 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 458:	83 f8 25             	cmp    $0x25,%eax
 45b:	0f 84 ef 00 00 00    	je     550 <printf+0x180>
  write(fd, &c, 1);
 461:	8d 45 e7             	lea    -0x19(%ebp),%eax
 464:	83 ec 04             	sub    $0x4,%esp
 467:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 46b:	6a 01                	push   $0x1
 46d:	50                   	push   %eax
 46e:	ff 75 08             	pushl  0x8(%ebp)
 471:	e8 2c fe ff ff       	call   2a2 <write>
 476:	83 c4 0c             	add    $0xc,%esp
 479:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 47c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 47f:	6a 01                	push   $0x1
 481:	50                   	push   %eax
 482:	ff 75 08             	pushl  0x8(%ebp)
 485:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 488:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 48a:	e8 13 fe ff ff       	call   2a2 <write>
  for(i = 0; fmt[i]; i++){
 48f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 493:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 496:	84 db                	test   %bl,%bl
 498:	75 89                	jne    423 <printf+0x53>
    }
  }
}
 49a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49d:	5b                   	pop    %ebx
 49e:	5e                   	pop    %esi
 49f:	5f                   	pop    %edi
 4a0:	5d                   	pop    %ebp
 4a1:	c3                   	ret    
 4a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 4a8:	bf 25 00 00 00       	mov    $0x25,%edi
 4ad:	e9 66 ff ff ff       	jmp    418 <printf+0x48>
 4b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4b8:	83 ec 0c             	sub    $0xc,%esp
 4bb:	b9 10 00 00 00       	mov    $0x10,%ecx
 4c0:	6a 00                	push   $0x0
 4c2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4c5:	8b 45 08             	mov    0x8(%ebp),%eax
 4c8:	8b 17                	mov    (%edi),%edx
 4ca:	e8 61 fe ff ff       	call   330 <printint>
        ap++;
 4cf:	89 f8                	mov    %edi,%eax
 4d1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4d4:	31 ff                	xor    %edi,%edi
        ap++;
 4d6:	83 c0 04             	add    $0x4,%eax
 4d9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4dc:	e9 37 ff ff ff       	jmp    418 <printf+0x48>
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 4e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4eb:	8b 08                	mov    (%eax),%ecx
        ap++;
 4ed:	83 c0 04             	add    $0x4,%eax
 4f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 4f3:	85 c9                	test   %ecx,%ecx
 4f5:	0f 84 8e 00 00 00    	je     589 <printf+0x1b9>
        while(*s != 0){
 4fb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 4fe:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 500:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 502:	84 c0                	test   %al,%al
 504:	0f 84 0e ff ff ff    	je     418 <printf+0x48>
 50a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 50d:	89 de                	mov    %ebx,%esi
 50f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 512:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 515:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 518:	83 ec 04             	sub    $0x4,%esp
          s++;
 51b:	83 c6 01             	add    $0x1,%esi
 51e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 521:	6a 01                	push   $0x1
 523:	57                   	push   %edi
 524:	53                   	push   %ebx
 525:	e8 78 fd ff ff       	call   2a2 <write>
        while(*s != 0){
 52a:	0f b6 06             	movzbl (%esi),%eax
 52d:	83 c4 10             	add    $0x10,%esp
 530:	84 c0                	test   %al,%al
 532:	75 e4                	jne    518 <printf+0x148>
 534:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 537:	31 ff                	xor    %edi,%edi
 539:	e9 da fe ff ff       	jmp    418 <printf+0x48>
 53e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	b9 0a 00 00 00       	mov    $0xa,%ecx
 548:	6a 01                	push   $0x1
 54a:	e9 73 ff ff ff       	jmp    4c2 <printf+0xf2>
 54f:	90                   	nop
  write(fd, &c, 1);
 550:	83 ec 04             	sub    $0x4,%esp
 553:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 556:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 559:	6a 01                	push   $0x1
 55b:	e9 21 ff ff ff       	jmp    481 <printf+0xb1>
        putc(fd, *ap);
 560:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 563:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 566:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 568:	6a 01                	push   $0x1
        ap++;
 56a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 56d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 570:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 573:	50                   	push   %eax
 574:	ff 75 08             	pushl  0x8(%ebp)
 577:	e8 26 fd ff ff       	call   2a2 <write>
        ap++;
 57c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 57f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 582:	31 ff                	xor    %edi,%edi
 584:	e9 8f fe ff ff       	jmp    418 <printf+0x48>
          s = "(null)";
 589:	bb 28 07 00 00       	mov    $0x728,%ebx
        while(*s != 0){
 58e:	b8 28 00 00 00       	mov    $0x28,%eax
 593:	e9 72 ff ff ff       	jmp    50a <printf+0x13a>
 598:	66 90                	xchg   %ax,%ax
 59a:	66 90                	xchg   %ax,%ax
 59c:	66 90                	xchg   %ax,%ax
 59e:	66 90                	xchg   %ax,%ax

000005a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a1:	a1 d4 09 00 00       	mov    0x9d4,%eax
{
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	53                   	push   %ebx
 5ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b8:	39 c8                	cmp    %ecx,%eax
 5ba:	8b 10                	mov    (%eax),%edx
 5bc:	73 32                	jae    5f0 <free+0x50>
 5be:	39 d1                	cmp    %edx,%ecx
 5c0:	72 04                	jb     5c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c2:	39 d0                	cmp    %edx,%eax
 5c4:	72 32                	jb     5f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5cc:	39 fa                	cmp    %edi,%edx
 5ce:	74 30                	je     600 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5d3:	8b 50 04             	mov    0x4(%eax),%edx
 5d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5d9:	39 f1                	cmp    %esi,%ecx
 5db:	74 3a                	je     617 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5dd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5df:	a3 d4 09 00 00       	mov    %eax,0x9d4
}
 5e4:	5b                   	pop    %ebx
 5e5:	5e                   	pop    %esi
 5e6:	5f                   	pop    %edi
 5e7:	5d                   	pop    %ebp
 5e8:	c3                   	ret    
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f0:	39 d0                	cmp    %edx,%eax
 5f2:	72 04                	jb     5f8 <free+0x58>
 5f4:	39 d1                	cmp    %edx,%ecx
 5f6:	72 ce                	jb     5c6 <free+0x26>
{
 5f8:	89 d0                	mov    %edx,%eax
 5fa:	eb bc                	jmp    5b8 <free+0x18>
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 600:	03 72 04             	add    0x4(%edx),%esi
 603:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 606:	8b 10                	mov    (%eax),%edx
 608:	8b 12                	mov    (%edx),%edx
 60a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60d:	8b 50 04             	mov    0x4(%eax),%edx
 610:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 613:	39 f1                	cmp    %esi,%ecx
 615:	75 c6                	jne    5dd <free+0x3d>
    p->s.size += bp->s.size;
 617:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 61a:	a3 d4 09 00 00       	mov    %eax,0x9d4
    p->s.size += bp->s.size;
 61f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 622:	8b 53 f8             	mov    -0x8(%ebx),%edx
 625:	89 10                	mov    %edx,(%eax)
}
 627:	5b                   	pop    %ebx
 628:	5e                   	pop    %esi
 629:	5f                   	pop    %edi
 62a:	5d                   	pop    %ebp
 62b:	c3                   	ret    
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000630 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 639:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 63c:	8b 15 d4 09 00 00    	mov    0x9d4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 642:	8d 78 07             	lea    0x7(%eax),%edi
 645:	c1 ef 03             	shr    $0x3,%edi
 648:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 64b:	85 d2                	test   %edx,%edx
 64d:	0f 84 9d 00 00 00    	je     6f0 <malloc+0xc0>
 653:	8b 02                	mov    (%edx),%eax
 655:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 658:	39 cf                	cmp    %ecx,%edi
 65a:	76 6c                	jbe    6c8 <malloc+0x98>
 65c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 662:	bb 00 10 00 00       	mov    $0x1000,%ebx
 667:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 66a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 671:	eb 0e                	jmp    681 <malloc+0x51>
 673:	90                   	nop
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 678:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 67a:	8b 48 04             	mov    0x4(%eax),%ecx
 67d:	39 f9                	cmp    %edi,%ecx
 67f:	73 47                	jae    6c8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 681:	39 05 d4 09 00 00    	cmp    %eax,0x9d4
 687:	89 c2                	mov    %eax,%edx
 689:	75 ed                	jne    678 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 68b:	83 ec 0c             	sub    $0xc,%esp
 68e:	56                   	push   %esi
 68f:	e8 76 fc ff ff       	call   30a <sbrk>
  if(p == (char*)-1)
 694:	83 c4 10             	add    $0x10,%esp
 697:	83 f8 ff             	cmp    $0xffffffff,%eax
 69a:	74 1c                	je     6b8 <malloc+0x88>
  hp->s.size = nu;
 69c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 69f:	83 ec 0c             	sub    $0xc,%esp
 6a2:	83 c0 08             	add    $0x8,%eax
 6a5:	50                   	push   %eax
 6a6:	e8 f5 fe ff ff       	call   5a0 <free>
  return freep;
 6ab:	8b 15 d4 09 00 00    	mov    0x9d4,%edx
      if((p = morecore(nunits)) == 0)
 6b1:	83 c4 10             	add    $0x10,%esp
 6b4:	85 d2                	test   %edx,%edx
 6b6:	75 c0                	jne    678 <malloc+0x48>
        return 0;
  }
}
 6b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6bb:	31 c0                	xor    %eax,%eax
}
 6bd:	5b                   	pop    %ebx
 6be:	5e                   	pop    %esi
 6bf:	5f                   	pop    %edi
 6c0:	5d                   	pop    %ebp
 6c1:	c3                   	ret    
 6c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6c8:	39 cf                	cmp    %ecx,%edi
 6ca:	74 54                	je     720 <malloc+0xf0>
        p->s.size -= nunits;
 6cc:	29 f9                	sub    %edi,%ecx
 6ce:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6d1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6d4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6d7:	89 15 d4 09 00 00    	mov    %edx,0x9d4
}
 6dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6e0:	83 c0 08             	add    $0x8,%eax
}
 6e3:	5b                   	pop    %ebx
 6e4:	5e                   	pop    %esi
 6e5:	5f                   	pop    %edi
 6e6:	5d                   	pop    %ebp
 6e7:	c3                   	ret    
 6e8:	90                   	nop
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 6f0:	c7 05 d4 09 00 00 d8 	movl   $0x9d8,0x9d4
 6f7:	09 00 00 
 6fa:	c7 05 d8 09 00 00 d8 	movl   $0x9d8,0x9d8
 701:	09 00 00 
    base.s.size = 0;
 704:	b8 d8 09 00 00       	mov    $0x9d8,%eax
 709:	c7 05 dc 09 00 00 00 	movl   $0x0,0x9dc
 710:	00 00 00 
 713:	e9 44 ff ff ff       	jmp    65c <malloc+0x2c>
 718:	90                   	nop
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 720:	8b 08                	mov    (%eax),%ecx
 722:	89 0a                	mov    %ecx,(%edx)
 724:	eb b1                	jmp    6d7 <malloc+0xa7>
