
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	8b 01                	mov    (%ecx),%eax
  15:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  18:	83 f8 01             	cmp    $0x1,%eax
  1b:	7e 2c                	jle    49 <main+0x49>
  1d:	8d 5a 04             	lea    0x4(%edx),%ebx
  20:	8d 34 82             	lea    (%edx,%eax,4),%esi
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 33                	pushl  (%ebx)
  2d:	83 c3 04             	add    $0x4,%ebx
  30:	e8 0b 02 00 00       	call   240 <atoi>
  35:	89 04 24             	mov    %eax,(%esp)
  38:	e8 a5 02 00 00       	call   2e2 <kill>
  for(i=1; i<argc; i++)
  3d:	83 c4 10             	add    $0x10,%esp
  40:	39 f3                	cmp    %esi,%ebx
  42:	75 e4                	jne    28 <main+0x28>
  exit();
  44:	e8 69 02 00 00       	call   2b2 <exit>
    printf(2, "usage: kill pid...\n");
  49:	50                   	push   %eax
  4a:	50                   	push   %eax
  4b:	68 98 07 00 00       	push   $0x798
  50:	6a 02                	push   $0x2
  52:	e8 c9 03 00 00       	call   420 <printf>
    exit();
  57:	e8 56 02 00 00       	call   2b2 <exit>
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 45 08             	mov    0x8(%ebp),%eax
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6a:	89 c2                	mov    %eax,%edx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  70:	83 c1 01             	add    $0x1,%ecx
  73:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  77:	83 c2 01             	add    $0x1,%edx
  7a:	84 db                	test   %bl,%bl
  7c:	88 5a ff             	mov    %bl,-0x1(%edx)
  7f:	75 ef                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  81:	5b                   	pop    %ebx
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    
  84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	0f b6 19             	movzbl (%ecx),%ebx
  a0:	84 c0                	test   %al,%al
  a2:	75 1c                	jne    c0 <strcmp+0x30>
  a4:	eb 2a                	jmp    d0 <strcmp+0x40>
  a6:	8d 76 00             	lea    0x0(%esi),%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  b6:	83 c1 01             	add    $0x1,%ecx
  b9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  bc:	84 c0                	test   %al,%al
  be:	74 10                	je     d0 <strcmp+0x40>
  c0:	38 d8                	cmp    %bl,%al
  c2:	74 ec                	je     b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  c4:	29 d8                	sub    %ebx,%eax
}
  c6:	5b                   	pop    %ebx
  c7:	5d                   	pop    %ebp
  c8:	c3                   	ret    
  c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	89 f6                	mov    %esi,%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 39 00             	cmpb   $0x0,(%ecx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 d2                	xor    %edx,%edx
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c2 01             	add    $0x1,%edx
  f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  f7:	89 d0                	mov    %edx,%eax
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
  fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 100:	31 c0                	xor    %eax,%eax
}
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    
 104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 10a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	74 1d                	je     15e <strchr+0x2e>
    if(*s == c)
 141:	38 d3                	cmp    %dl,%bl
 143:	89 d9                	mov    %ebx,%ecx
 145:	75 0d                	jne    154 <strchr+0x24>
 147:	eb 17                	jmp    160 <strchr+0x30>
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 150:	38 ca                	cmp    %cl,%dl
 152:	74 0c                	je     160 <strchr+0x30>
  for(; *s; s++)
 154:	83 c0 01             	add    $0x1,%eax
 157:	0f b6 10             	movzbl (%eax),%edx
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strchr+0x20>
      return (char*)s;
  return 0;
 15e:	31 c0                	xor    %eax,%eax
}
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
 175:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 176:	31 f6                	xor    %esi,%esi
 178:	89 f3                	mov    %esi,%ebx
{
 17a:	83 ec 1c             	sub    $0x1c,%esp
 17d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 180:	eb 2f                	jmp    1b1 <gets+0x41>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 188:	8d 45 e7             	lea    -0x19(%ebp),%eax
 18b:	83 ec 04             	sub    $0x4,%esp
 18e:	6a 01                	push   $0x1
 190:	50                   	push   %eax
 191:	6a 00                	push   $0x0
 193:	e8 32 01 00 00       	call   2ca <read>
    if(cc < 1)
 198:	83 c4 10             	add    $0x10,%esp
 19b:	85 c0                	test   %eax,%eax
 19d:	7e 1c                	jle    1bb <gets+0x4b>
      break;
    buf[i++] = c;
 19f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a3:	83 c7 01             	add    $0x1,%edi
 1a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1a9:	3c 0a                	cmp    $0xa,%al
 1ab:	74 23                	je     1d0 <gets+0x60>
 1ad:	3c 0d                	cmp    $0xd,%al
 1af:	74 1f                	je     1d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b7:	89 fe                	mov    %edi,%esi
 1b9:	7c cd                	jl     188 <gets+0x18>
 1bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 1c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	90                   	nop
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d0:	8b 75 08             	mov    0x8(%ebp),%esi
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	01 de                	add    %ebx,%esi
 1d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1da:	c6 03 00             	movb   $0x0,(%ebx)
}
 1dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e0:	5b                   	pop    %ebx
 1e1:	5e                   	pop    %esi
 1e2:	5f                   	pop    %edi
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    
 1e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 f0 00 00 00       	call   2f2 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	pushl  0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f3 00 00 00       	call   30a <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 b9 00 00 00       	call   2da <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
  n = 0;
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 254:	77 1f                	ja     275 <atoi+0x35>
 256:	8d 76 00             	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 260:	8d 04 80             	lea    (%eax,%eax,4),%eax
 263:	83 c1 01             	add    $0x1,%ecx
 266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 26a:	0f be 11             	movsbl (%ecx),%edx
 26d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	5b                   	pop    %ebx
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
 285:	8b 5d 10             	mov    0x10(%ebp),%ebx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 db                	test   %ebx,%ebx
 290:	7e 14                	jle    2a6 <memmove+0x26>
 292:	31 d2                	xor    %edx,%edx
 294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 29c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 29f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2a2:	39 d3                	cmp    %edx,%ebx
 2a4:	75 f2                	jne    298 <memmove+0x18>
  return vdst;
}
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    

000002aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2aa:	b8 01 00 00 00       	mov    $0x1,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <exit>:
SYSCALL(exit)
 2b2:	b8 02 00 00 00       	mov    $0x2,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <wait>:
SYSCALL(wait)
 2ba:	b8 03 00 00 00       	mov    $0x3,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <pipe>:
SYSCALL(pipe)
 2c2:	b8 04 00 00 00       	mov    $0x4,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <read>:
SYSCALL(read)
 2ca:	b8 05 00 00 00       	mov    $0x5,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <write>:
SYSCALL(write)
 2d2:	b8 10 00 00 00       	mov    $0x10,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <close>:
SYSCALL(close)
 2da:	b8 15 00 00 00       	mov    $0x15,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <kill>:
SYSCALL(kill)
 2e2:	b8 06 00 00 00       	mov    $0x6,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <exec>:
SYSCALL(exec)
 2ea:	b8 07 00 00 00       	mov    $0x7,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <open>:
SYSCALL(open)
 2f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mknod>:
SYSCALL(mknod)
 2fa:	b8 11 00 00 00       	mov    $0x11,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <unlink>:
SYSCALL(unlink)
 302:	b8 12 00 00 00       	mov    $0x12,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <fstat>:
SYSCALL(fstat)
 30a:	b8 08 00 00 00       	mov    $0x8,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <link>:
SYSCALL(link)
 312:	b8 13 00 00 00       	mov    $0x13,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <mkdir>:
SYSCALL(mkdir)
 31a:	b8 14 00 00 00       	mov    $0x14,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <chdir>:
SYSCALL(chdir)
 322:	b8 09 00 00 00       	mov    $0x9,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <dup>:
SYSCALL(dup)
 32a:	b8 0a 00 00 00       	mov    $0xa,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <getpid>:
SYSCALL(getpid)
 332:	b8 0b 00 00 00       	mov    $0xb,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <sbrk>:
SYSCALL(sbrk)
 33a:	b8 0c 00 00 00       	mov    $0xc,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <sleep>:
SYSCALL(sleep)
 342:	b8 0d 00 00 00       	mov    $0xd,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <uptime>:
SYSCALL(uptime)
 34a:	b8 0e 00 00 00       	mov    $0xe,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <getreadcount>:
SYSCALL(getreadcount)
 352:	b8 16 00 00 00       	mov    $0x16,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <gettime>:
SYSCALL(gettime)
 35a:	b8 17 00 00 00       	mov    $0x17,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <settickets>:
SYSCALL(settickets)
 362:	b8 18 00 00 00       	mov    $0x18,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <getpinfo>:
 36a:	b8 19 00 00 00       	mov    $0x19,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    
 372:	66 90                	xchg   %ax,%ax
 374:	66 90                	xchg   %ax,%ax
 376:	66 90                	xchg   %ax,%ax
 378:	66 90                	xchg   %ax,%ax
 37a:	66 90                	xchg   %ax,%ax
 37c:	66 90                	xchg   %ax,%ax
 37e:	66 90                	xchg   %ax,%ax

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 389:	85 d2                	test   %edx,%edx
{
 38b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 38e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 390:	79 76                	jns    408 <printint+0x88>
 392:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 396:	74 70                	je     408 <printint+0x88>
    x = -xx;
 398:	f7 d8                	neg    %eax
    neg = 1;
 39a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3a1:	31 f6                	xor    %esi,%esi
 3a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3a6:	eb 0a                	jmp    3b2 <printint+0x32>
 3a8:	90                   	nop
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 3b0:	89 fe                	mov    %edi,%esi
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	8d 7e 01             	lea    0x1(%esi),%edi
 3b7:	f7 f1                	div    %ecx
 3b9:	0f b6 92 b4 07 00 00 	movzbl 0x7b4(%edx),%edx
  }while((x /= base) != 0);
 3c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3c2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 3c5:	75 e9                	jne    3b0 <printint+0x30>
  if(neg)
 3c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3ca:	85 c0                	test   %eax,%eax
 3cc:	74 08                	je     3d6 <printint+0x56>
    buf[i++] = '-';
 3ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3d3:	8d 7e 02             	lea    0x2(%esi),%edi
 3d6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 3da:	8b 7d c0             	mov    -0x40(%ebp),%edi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 3e3:	83 ec 04             	sub    $0x4,%esp
 3e6:	83 ee 01             	sub    $0x1,%esi
 3e9:	6a 01                	push   $0x1
 3eb:	53                   	push   %ebx
 3ec:	57                   	push   %edi
 3ed:	88 45 d7             	mov    %al,-0x29(%ebp)
 3f0:	e8 dd fe ff ff       	call   2d2 <write>

  while(--i >= 0)
 3f5:	83 c4 10             	add    $0x10,%esp
 3f8:	39 de                	cmp    %ebx,%esi
 3fa:	75 e4                	jne    3e0 <printint+0x60>
    putc(fd, buf[i]);
}
 3fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ff:	5b                   	pop    %ebx
 400:	5e                   	pop    %esi
 401:	5f                   	pop    %edi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 408:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 40f:	eb 90                	jmp    3a1 <printint+0x21>
 411:	eb 0d                	jmp    420 <printf>
 413:	90                   	nop
 414:	90                   	nop
 415:	90                   	nop
 416:	90                   	nop
 417:	90                   	nop
 418:	90                   	nop
 419:	90                   	nop
 41a:	90                   	nop
 41b:	90                   	nop
 41c:	90                   	nop
 41d:	90                   	nop
 41e:	90                   	nop
 41f:	90                   	nop

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 75 0c             	mov    0xc(%ebp),%esi
 42c:	0f b6 1e             	movzbl (%esi),%ebx
 42f:	84 db                	test   %bl,%bl
 431:	0f 84 bf 00 00 00    	je     4f6 <printf+0xd6>
 437:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
 43a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
 43d:	31 d2                	xor    %edx,%edx
 43f:	eb 39                	jmp    47a <printf+0x5a>
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 448:	83 f8 25             	cmp    $0x25,%eax
 44b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 44e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 453:	74 1a                	je     46f <printf+0x4f>
  write(fd, &c, 1);
 455:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 458:	83 ec 04             	sub    $0x4,%esp
 45b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 45e:	6a 01                	push   $0x1
 460:	50                   	push   %eax
 461:	ff 75 08             	pushl  0x8(%ebp)
 464:	e8 69 fe ff ff       	call   2d2 <write>
 469:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 46c:	83 c4 10             	add    $0x10,%esp
 46f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 472:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 476:	84 db                	test   %bl,%bl
 478:	74 7c                	je     4f6 <printf+0xd6>
    if(state == 0){
 47a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 47c:	0f be cb             	movsbl %bl,%ecx
 47f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 482:	74 c4                	je     448 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 484:	83 fa 25             	cmp    $0x25,%edx
 487:	75 e6                	jne    46f <printf+0x4f>
      if(c == 'd'){
 489:	83 f8 64             	cmp    $0x64,%eax
 48c:	0f 84 a6 00 00 00    	je     538 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
 492:	83 f8 6c             	cmp    $0x6c,%eax
 495:	0f 84 ad 00 00 00    	je     548 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
 49b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4a1:	83 f9 70             	cmp    $0x70,%ecx
 4a4:	74 5a                	je     500 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4a6:	83 f8 73             	cmp    $0x73,%eax
 4a9:	0f 84 e1 00 00 00    	je     590 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4af:	83 f8 63             	cmp    $0x63,%eax
 4b2:	0f 84 28 01 00 00    	je     5e0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	74 6b                	je     528 <printf+0x108>
  write(fd, &c, 1);
 4bd:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4c7:	6a 01                	push   $0x1
 4c9:	50                   	push   %eax
 4ca:	ff 75 08             	pushl  0x8(%ebp)
 4cd:	e8 00 fe ff ff       	call   2d2 <write>
 4d2:	83 c4 0c             	add    $0xc,%esp
 4d5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4d8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4db:	6a 01                	push   $0x1
 4dd:	50                   	push   %eax
 4de:	ff 75 08             	pushl  0x8(%ebp)
 4e1:	83 c6 01             	add    $0x1,%esi
 4e4:	e8 e9 fd ff ff       	call   2d2 <write>
  for(i = 0; fmt[i]; i++){
 4e9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 4ed:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4f0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4f2:	84 db                	test   %bl,%bl
 4f4:	75 84                	jne    47a <printf+0x5a>
    }
  }
}
 4f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f9:	5b                   	pop    %ebx
 4fa:	5e                   	pop    %esi
 4fb:	5f                   	pop    %edi
 4fc:	5d                   	pop    %ebp
 4fd:	c3                   	ret    
 4fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 500:	83 ec 0c             	sub    $0xc,%esp
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
 508:	6a 00                	push   $0x0
 50a:	8b 17                	mov    (%edi),%edx
 50c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
 50f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 512:	e8 69 fe ff ff       	call   380 <printint>
 517:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51a:	31 d2                	xor    %edx,%edx
 51c:	e9 4e ff ff ff       	jmp    46f <printf+0x4f>
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 528:	83 ec 04             	sub    $0x4,%esp
 52b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 52e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 531:	6a 01                	push   $0x1
 533:	eb a8                	jmp    4dd <printf+0xbd>
 535:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 538:	83 ec 0c             	sub    $0xc,%esp
 53b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 540:	6a 01                	push   $0x1
 542:	eb c6                	jmp    50a <printf+0xea>
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
 548:	8b 57 04             	mov    0x4(%edi),%edx
 54b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
 54d:	85 d2                	test   %edx,%edx
 54f:	74 15                	je     566 <printf+0x146>
 551:	83 ec 0c             	sub    $0xc,%esp
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	b9 10 00 00 00       	mov    $0x10,%ecx
 55c:	6a 00                	push   $0x0
 55e:	e8 1d fe ff ff       	call   380 <printint>
 563:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
 566:	83 ec 0c             	sub    $0xc,%esp
 569:	8b 45 08             	mov    0x8(%ebp),%eax
 56c:	89 da                	mov    %ebx,%edx
 56e:	6a 00                	push   $0x0
 570:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 575:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
 578:	e8 03 fe ff ff       	call   380 <printint>
 57d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 580:	31 d2                	xor    %edx,%edx
 582:	e9 e8 fe ff ff       	jmp    46f <printf+0x4f>
 587:	89 f6                	mov    %esi,%esi
 589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 590:	8b 0f                	mov    (%edi),%ecx
        ap++;
 592:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 595:	85 c9                	test   %ecx,%ecx
 597:	74 6a                	je     603 <printf+0x1e3>
        while(*s != 0){
 599:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 59c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
 59e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 5a0:	84 c0                	test   %al,%al
 5a2:	0f 84 c7 fe ff ff    	je     46f <printf+0x4f>
 5a8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5ab:	89 de                	mov    %ebx,%esi
 5ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5b6:	83 ec 04             	sub    $0x4,%esp
 5b9:	6a 01                	push   $0x1
          s++;
 5bb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5be:	50                   	push   %eax
 5bf:	53                   	push   %ebx
 5c0:	e8 0d fd ff ff       	call   2d2 <write>
        while(*s != 0){
 5c5:	0f b6 06             	movzbl (%esi),%eax
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	84 c0                	test   %al,%al
 5cd:	75 e1                	jne    5b0 <printf+0x190>
 5cf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	e9 96 fe ff ff       	jmp    46f <printf+0x4f>
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5e0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 5e2:	83 ec 04             	sub    $0x4,%esp
        ap++;
 5e5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
 5e8:	6a 01                	push   $0x1
        putc(fd, *ap);
 5ea:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 5ed:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5f0:	50                   	push   %eax
 5f1:	ff 75 08             	pushl  0x8(%ebp)
 5f4:	e8 d9 fc ff ff       	call   2d2 <write>
 5f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fc:	31 d2                	xor    %edx,%edx
 5fe:	e9 6c fe ff ff       	jmp    46f <printf+0x4f>
          s = "(null)";
 603:	bb ac 07 00 00       	mov    $0x7ac,%ebx
        while(*s != 0){
 608:	b8 28 00 00 00       	mov    $0x28,%eax
 60d:	eb 99                	jmp    5a8 <printf+0x188>
 60f:	90                   	nop

00000610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	a1 60 0a 00 00       	mov    0xa60,%eax
{
 616:	89 e5                	mov    %esp,%ebp
 618:	57                   	push   %edi
 619:	56                   	push   %esi
 61a:	53                   	push   %ebx
 61b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 61e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 628:	39 c8                	cmp    %ecx,%eax
 62a:	8b 10                	mov    (%eax),%edx
 62c:	73 32                	jae    660 <free+0x50>
 62e:	39 d1                	cmp    %edx,%ecx
 630:	72 04                	jb     636 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 632:	39 d0                	cmp    %edx,%eax
 634:	72 32                	jb     668 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 636:	8b 73 fc             	mov    -0x4(%ebx),%esi
 639:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63c:	39 fa                	cmp    %edi,%edx
 63e:	74 30                	je     670 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 640:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 643:	8b 50 04             	mov    0x4(%eax),%edx
 646:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 649:	39 f1                	cmp    %esi,%ecx
 64b:	74 3a                	je     687 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 64d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 64f:	a3 60 0a 00 00       	mov    %eax,0xa60
}
 654:	5b                   	pop    %ebx
 655:	5e                   	pop    %esi
 656:	5f                   	pop    %edi
 657:	5d                   	pop    %ebp
 658:	c3                   	ret    
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 660:	39 d0                	cmp    %edx,%eax
 662:	72 04                	jb     668 <free+0x58>
 664:	39 d1                	cmp    %edx,%ecx
 666:	72 ce                	jb     636 <free+0x26>
{
 668:	89 d0                	mov    %edx,%eax
 66a:	eb bc                	jmp    628 <free+0x18>
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 670:	03 72 04             	add    0x4(%edx),%esi
 673:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 676:	8b 10                	mov    (%eax),%edx
 678:	8b 12                	mov    (%edx),%edx
 67a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 67d:	8b 50 04             	mov    0x4(%eax),%edx
 680:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 683:	39 f1                	cmp    %esi,%ecx
 685:	75 c6                	jne    64d <free+0x3d>
    p->s.size += bp->s.size;
 687:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 68a:	a3 60 0a 00 00       	mov    %eax,0xa60
    p->s.size += bp->s.size;
 68f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 692:	8b 53 f8             	mov    -0x8(%ebx),%edx
 695:	89 10                	mov    %edx,(%eax)
}
 697:	5b                   	pop    %ebx
 698:	5e                   	pop    %esi
 699:	5f                   	pop    %edi
 69a:	5d                   	pop    %ebp
 69b:	c3                   	ret    
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ac:	8b 15 60 0a 00 00    	mov    0xa60,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b2:	8d 78 07             	lea    0x7(%eax),%edi
 6b5:	c1 ef 03             	shr    $0x3,%edi
 6b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6bb:	85 d2                	test   %edx,%edx
 6bd:	0f 84 9d 00 00 00    	je     760 <malloc+0xc0>
 6c3:	8b 02                	mov    (%edx),%eax
 6c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6c8:	39 cf                	cmp    %ecx,%edi
 6ca:	76 6c                	jbe    738 <malloc+0x98>
 6cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6d7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6da:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6e1:	eb 0e                	jmp    6f1 <malloc+0x51>
 6e3:	90                   	nop
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6ea:	8b 48 04             	mov    0x4(%eax),%ecx
 6ed:	39 f9                	cmp    %edi,%ecx
 6ef:	73 47                	jae    738 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6f1:	39 05 60 0a 00 00    	cmp    %eax,0xa60
 6f7:	89 c2                	mov    %eax,%edx
 6f9:	75 ed                	jne    6e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6fb:	83 ec 0c             	sub    $0xc,%esp
 6fe:	56                   	push   %esi
 6ff:	e8 36 fc ff ff       	call   33a <sbrk>
  if(p == (char*)-1)
 704:	83 c4 10             	add    $0x10,%esp
 707:	83 f8 ff             	cmp    $0xffffffff,%eax
 70a:	74 1c                	je     728 <malloc+0x88>
  hp->s.size = nu;
 70c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 70f:	83 ec 0c             	sub    $0xc,%esp
 712:	83 c0 08             	add    $0x8,%eax
 715:	50                   	push   %eax
 716:	e8 f5 fe ff ff       	call   610 <free>
  return freep;
 71b:	8b 15 60 0a 00 00    	mov    0xa60,%edx
      if((p = morecore(nunits)) == 0)
 721:	83 c4 10             	add    $0x10,%esp
 724:	85 d2                	test   %edx,%edx
 726:	75 c0                	jne    6e8 <malloc+0x48>
        return 0;
  }
}
 728:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 72b:	31 c0                	xor    %eax,%eax
}
 72d:	5b                   	pop    %ebx
 72e:	5e                   	pop    %esi
 72f:	5f                   	pop    %edi
 730:	5d                   	pop    %ebp
 731:	c3                   	ret    
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 738:	39 cf                	cmp    %ecx,%edi
 73a:	74 54                	je     790 <malloc+0xf0>
        p->s.size -= nunits;
 73c:	29 f9                	sub    %edi,%ecx
 73e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 741:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 744:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 747:	89 15 60 0a 00 00    	mov    %edx,0xa60
}
 74d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 750:	83 c0 08             	add    $0x8,%eax
}
 753:	5b                   	pop    %ebx
 754:	5e                   	pop    %esi
 755:	5f                   	pop    %edi
 756:	5d                   	pop    %ebp
 757:	c3                   	ret    
 758:	90                   	nop
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 760:	c7 05 60 0a 00 00 64 	movl   $0xa64,0xa60
 767:	0a 00 00 
 76a:	c7 05 64 0a 00 00 64 	movl   $0xa64,0xa64
 771:	0a 00 00 
    base.s.size = 0;
 774:	b8 64 0a 00 00       	mov    $0xa64,%eax
 779:	c7 05 68 0a 00 00 00 	movl   $0x0,0xa68
 780:	00 00 00 
 783:	e9 44 ff ff ff       	jmp    6cc <malloc+0x2c>
 788:	90                   	nop
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb b1                	jmp    747 <malloc+0xa7>
