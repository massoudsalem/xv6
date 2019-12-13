
_lotterytest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(0, "\n");
    gettime(&end);
    printf(0, "spin with %d tickets ended at %d hours %d minutes %d seconds\n", tix, end.hour, end.minute, end.second);
}

int main() {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
    int pid1;
    int pid2;
    struct rtcdate start;
    gettime(&start);
   e:	8d 45 e0             	lea    -0x20(%ebp),%eax
int main() {
  11:	83 ec 30             	sub    $0x30,%esp
    gettime(&start);
  14:	50                   	push   %eax
  15:	e8 00 04 00 00       	call   41a <gettime>
    printf(0, "starting test at %d hours %d minutes %d seconds\n", start.hour, start.minute, start.second);
  1a:	58                   	pop    %eax
  1b:	ff 75 e0             	pushl  -0x20(%ebp)
  1e:	ff 75 e4             	pushl  -0x1c(%ebp)
  21:	ff 75 e8             	pushl  -0x18(%ebp)
  24:	68 94 08 00 00       	push   $0x894
  29:	6a 00                	push   $0x0
  2b:	e8 a0 04 00 00       	call   4d0 <printf>
    if ((pid1 = fork()) == 0) {
  30:	83 c4 20             	add    $0x20,%esp
  33:	e8 32 03 00 00       	call   36a <fork>
  38:	85 c0                	test   %eax,%eax
  3a:	75 1a                	jne    56 <main+0x56>
        settickets(20);
  3c:	83 ec 0c             	sub    $0xc,%esp
  3f:	6a 14                	push   $0x14
  41:	e8 dc 03 00 00       	call   422 <settickets>
        spin(20,1);
  46:	59                   	pop    %ecx
  47:	58                   	pop    %eax
  48:	6a 01                	push   $0x1
  4a:	6a 14                	push   $0x14
  4c:	e8 3f 00 00 00       	call   90 <spin>
        exit();
  51:	e8 1c 03 00 00       	call   372 <exit>
    }
    else if ((pid2 = fork()) == 0) {
  56:	e8 0f 03 00 00       	call   36a <fork>
  5b:	85 c0                	test   %eax,%eax
  5d:	75 1a                	jne    79 <main+0x79>
        settickets(80);
  5f:	83 ec 0c             	sub    $0xc,%esp
  62:	6a 50                	push   $0x50
  64:	e8 b9 03 00 00       	call   422 <settickets>
        spin(80,2);
  69:	58                   	pop    %eax
  6a:	5a                   	pop    %edx
  6b:	6a 02                	push   $0x2
  6d:	6a 50                	push   $0x50
  6f:	e8 1c 00 00 00       	call   90 <spin>
        exit();
  74:	e8 f9 02 00 00       	call   372 <exit>
    }
    // Go to sleep and wait for subprocesses to finish
    wait();
  79:	e8 fc 02 00 00       	call   37a <wait>
    wait();
  7e:	e8 f7 02 00 00       	call   37a <wait>
    exit();
  83:	e8 ea 02 00 00       	call   372 <exit>
  88:	66 90                	xchg   %ax,%ax
  8a:	66 90                	xchg   %ax,%ax
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <spin>:
void spin(int tix, int process) {
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	57                   	push   %edi
  94:	56                   	push   %esi
  95:	53                   	push   %ebx
  96:	bf 32 00 00 00       	mov    $0x32,%edi
  9b:	83 ec 2c             	sub    $0x2c,%esp
  9e:	8b 75 0c             	mov    0xc(%ebp),%esi
  a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	printf(0, "p%d ", process);
  a8:	83 ec 04             	sub    $0x4,%esp
  ab:	bb 05 00 00 00       	mov    $0x5,%ebx
  b0:	56                   	push   %esi
  b1:	68 48 08 00 00       	push   $0x848
  b6:	6a 00                	push   $0x0
  b8:	e8 13 04 00 00       	call   4d0 <printf>
  bd:	83 c4 10             	add    $0x10,%esp
	    printf(0, "c%d ", process);
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	56                   	push   %esi
  c4:	68 4d 08 00 00       	push   $0x84d
  c9:	6a 00                	push   $0x0
  cb:	e8 00 04 00 00       	call   4d0 <printf>
        while (y < 5) {
  d0:	83 c4 10             	add    $0x10,%esp
  d3:	83 eb 01             	sub    $0x1,%ebx
  d6:	75 e8                	jne    c0 <spin+0x30>
    while (x < 50) { // Changed from 100000
  d8:	83 ef 01             	sub    $0x1,%edi
  db:	75 cb                	jne    a8 <spin+0x18>
    printf(0, "\n");
  dd:	83 ec 08             	sub    $0x8,%esp
  e0:	68 52 08 00 00       	push   $0x852
  e5:	6a 00                	push   $0x0
  e7:	e8 e4 03 00 00       	call   4d0 <printf>
    gettime(&end);
  ec:	8d 45 d0             	lea    -0x30(%ebp),%eax
  ef:	89 04 24             	mov    %eax,(%esp)
  f2:	e8 23 03 00 00       	call   41a <gettime>
    printf(0, "spin with %d tickets ended at %d hours %d minutes %d seconds\n", tix, end.hour, end.minute, end.second);
  f7:	58                   	pop    %eax
  f8:	5a                   	pop    %edx
  f9:	ff 75 d0             	pushl  -0x30(%ebp)
  fc:	ff 75 d4             	pushl  -0x2c(%ebp)
  ff:	ff 75 d8             	pushl  -0x28(%ebp)
 102:	ff 75 08             	pushl  0x8(%ebp)
 105:	68 54 08 00 00       	push   $0x854
 10a:	6a 00                	push   $0x0
 10c:	e8 bf 03 00 00       	call   4d0 <printf>
}
 111:	83 c4 20             	add    $0x20,%esp
 114:	8d 65 f4             	lea    -0xc(%ebp),%esp
 117:	5b                   	pop    %ebx
 118:	5e                   	pop    %esi
 119:	5f                   	pop    %edi
 11a:	5d                   	pop    %ebp
 11b:	c3                   	ret    
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12a:	89 c2                	mov    %eax,%edx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	83 c1 01             	add    $0x1,%ecx
 133:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 137:	83 c2 01             	add    $0x1,%edx
 13a:	84 db                	test   %bl,%bl
 13c:	88 5a ff             	mov    %bl,-0x1(%edx)
 13f:	75 ef                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 141:	5b                   	pop    %ebx
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 14a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	0f b6 19             	movzbl (%ecx),%ebx
 160:	84 c0                	test   %al,%al
 162:	75 1c                	jne    180 <strcmp+0x30>
 164:	eb 2a                	jmp    190 <strcmp+0x40>
 166:	8d 76 00             	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 170:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 173:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 176:	83 c1 01             	add    $0x1,%ecx
 179:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 17c:	84 c0                	test   %al,%al
 17e:	74 10                	je     190 <strcmp+0x40>
 180:	38 d8                	cmp    %bl,%al
 182:	74 ec                	je     170 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 184:	29 d8                	sub    %ebx,%eax
}
 186:	5b                   	pop    %ebx
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 192:	29 d8                	sub    %ebx,%eax
}
 194:	5b                   	pop    %ebx
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	89 f6                	mov    %esi,%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 39 00             	cmpb   $0x0,(%ecx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 d2                	xor    %edx,%edx
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1c0:	31 c0                	xor    %eax,%eax
}
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
 1c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	89 d0                	mov    %edx,%eax
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	74 1d                	je     21e <strchr+0x2e>
    if(*s == c)
 201:	38 d3                	cmp    %dl,%bl
 203:	89 d9                	mov    %ebx,%ecx
 205:	75 0d                	jne    214 <strchr+0x24>
 207:	eb 17                	jmp    220 <strchr+0x30>
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 210:	38 ca                	cmp    %cl,%dl
 212:	74 0c                	je     220 <strchr+0x30>
  for(; *s; s++)
 214:	83 c0 01             	add    $0x1,%eax
 217:	0f b6 10             	movzbl (%eax),%edx
 21a:	84 d2                	test   %dl,%dl
 21c:	75 f2                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
 21e:	31 c0                	xor    %eax,%eax
}
 220:	5b                   	pop    %ebx
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 236:	31 f6                	xor    %esi,%esi
 238:	89 f3                	mov    %esi,%ebx
{
 23a:	83 ec 1c             	sub    $0x1c,%esp
 23d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 240:	eb 2f                	jmp    271 <gets+0x41>
 242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 248:	8d 45 e7             	lea    -0x19(%ebp),%eax
 24b:	83 ec 04             	sub    $0x4,%esp
 24e:	6a 01                	push   $0x1
 250:	50                   	push   %eax
 251:	6a 00                	push   $0x0
 253:	e8 32 01 00 00       	call   38a <read>
    if(cc < 1)
 258:	83 c4 10             	add    $0x10,%esp
 25b:	85 c0                	test   %eax,%eax
 25d:	7e 1c                	jle    27b <gets+0x4b>
      break;
    buf[i++] = c;
 25f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 263:	83 c7 01             	add    $0x1,%edi
 266:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 269:	3c 0a                	cmp    $0xa,%al
 26b:	74 23                	je     290 <gets+0x60>
 26d:	3c 0d                	cmp    $0xd,%al
 26f:	74 1f                	je     290 <gets+0x60>
  for(i=0; i+1 < max; ){
 271:	83 c3 01             	add    $0x1,%ebx
 274:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 277:	89 fe                	mov    %edi,%esi
 279:	7c cd                	jl     248 <gets+0x18>
 27b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 280:	c6 03 00             	movb   $0x0,(%ebx)
}
 283:	8d 65 f4             	lea    -0xc(%ebp),%esp
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5f                   	pop    %edi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret    
 28b:	90                   	nop
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 290:	8b 75 08             	mov    0x8(%ebp),%esi
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	01 de                	add    %ebx,%esi
 298:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 29a:	c6 03 00             	movb   $0x0,(%ebx)
}
 29d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a0:	5b                   	pop    %ebx
 2a1:	5e                   	pop    %esi
 2a2:	5f                   	pop    %edi
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    
 2a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b5:	83 ec 08             	sub    $0x8,%esp
 2b8:	6a 00                	push   $0x0
 2ba:	ff 75 08             	pushl  0x8(%ebp)
 2bd:	e8 f0 00 00 00       	call   3b2 <open>
  if(fd < 0)
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	78 27                	js     2f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	ff 75 0c             	pushl  0xc(%ebp)
 2cf:	89 c3                	mov    %eax,%ebx
 2d1:	50                   	push   %eax
 2d2:	e8 f3 00 00 00       	call   3ca <fstat>
  close(fd);
 2d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2da:	89 c6                	mov    %eax,%esi
  close(fd);
 2dc:	e8 b9 00 00 00       	call   39a <close>
  return r;
 2e1:	83 c4 10             	add    $0x10,%esp
}
 2e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e7:	89 f0                	mov    %esi,%eax
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2f5:	eb ed                	jmp    2e4 <stat+0x34>
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 307:	0f be 11             	movsbl (%ecx),%edx
 30a:	8d 42 d0             	lea    -0x30(%edx),%eax
 30d:	3c 09                	cmp    $0x9,%al
  n = 0;
 30f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 314:	77 1f                	ja     335 <atoi+0x35>
 316:	8d 76 00             	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 320:	8d 04 80             	lea    (%eax,%eax,4),%eax
 323:	83 c1 01             	add    $0x1,%ecx
 326:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 32a:	0f be 11             	movsbl (%ecx),%edx
 32d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	5b                   	pop    %ebx
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	90                   	nop
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
 345:	8b 5d 10             	mov    0x10(%ebp),%ebx
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34e:	85 db                	test   %ebx,%ebx
 350:	7e 14                	jle    366 <memmove+0x26>
 352:	31 d2                	xor    %edx,%edx
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 358:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 35c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 35f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 362:	39 d3                	cmp    %edx,%ebx
 364:	75 f2                	jne    358 <memmove+0x18>
  return vdst;
}
 366:	5b                   	pop    %ebx
 367:	5e                   	pop    %esi
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    

0000036a <fork>:
 36a:	b8 01 00 00 00       	mov    $0x1,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <exit>:
 372:	b8 02 00 00 00       	mov    $0x2,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <wait>:
 37a:	b8 03 00 00 00       	mov    $0x3,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <pipe>:
 382:	b8 04 00 00 00       	mov    $0x4,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <read>:
 38a:	b8 05 00 00 00       	mov    $0x5,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <write>:
 392:	b8 10 00 00 00       	mov    $0x10,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <close>:
 39a:	b8 15 00 00 00       	mov    $0x15,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <kill>:
 3a2:	b8 06 00 00 00       	mov    $0x6,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <exec>:
 3aa:	b8 07 00 00 00       	mov    $0x7,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <open>:
 3b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <mknod>:
 3ba:	b8 11 00 00 00       	mov    $0x11,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <unlink>:
 3c2:	b8 12 00 00 00       	mov    $0x12,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <fstat>:
 3ca:	b8 08 00 00 00       	mov    $0x8,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <link>:
 3d2:	b8 13 00 00 00       	mov    $0x13,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <mkdir>:
 3da:	b8 14 00 00 00       	mov    $0x14,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <chdir>:
 3e2:	b8 09 00 00 00       	mov    $0x9,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <dup>:
 3ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <getpid>:
 3f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <sbrk>:
 3fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <sleep>:
 402:	b8 0d 00 00 00       	mov    $0xd,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <uptime>:
 40a:	b8 0e 00 00 00       	mov    $0xe,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <getreadcount>:
 412:	b8 16 00 00 00       	mov    $0x16,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <gettime>:
 41a:	b8 17 00 00 00       	mov    $0x17,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <settickets>:
 422:	b8 18 00 00 00       	mov    $0x18,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    
 42a:	66 90                	xchg   %ax,%ax
 42c:	66 90                	xchg   %ax,%ax
 42e:	66 90                	xchg   %ax,%ax

00000430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 439:	85 d2                	test   %edx,%edx
{
 43b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 43e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 440:	79 76                	jns    4b8 <printint+0x88>
 442:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 446:	74 70                	je     4b8 <printint+0x88>
    x = -xx;
 448:	f7 d8                	neg    %eax
    neg = 1;
 44a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 451:	31 f6                	xor    %esi,%esi
 453:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 456:	eb 0a                	jmp    462 <printint+0x32>
 458:	90                   	nop
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 460:	89 fe                	mov    %edi,%esi
 462:	31 d2                	xor    %edx,%edx
 464:	8d 7e 01             	lea    0x1(%esi),%edi
 467:	f7 f1                	div    %ecx
 469:	0f b6 92 d0 08 00 00 	movzbl 0x8d0(%edx),%edx
  }while((x /= base) != 0);
 470:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 472:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 475:	75 e9                	jne    460 <printint+0x30>
  if(neg)
 477:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 47a:	85 c0                	test   %eax,%eax
 47c:	74 08                	je     486 <printint+0x56>
    buf[i++] = '-';
 47e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 483:	8d 7e 02             	lea    0x2(%esi),%edi
 486:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 48a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
 490:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 493:	83 ec 04             	sub    $0x4,%esp
 496:	83 ee 01             	sub    $0x1,%esi
 499:	6a 01                	push   $0x1
 49b:	53                   	push   %ebx
 49c:	57                   	push   %edi
 49d:	88 45 d7             	mov    %al,-0x29(%ebp)
 4a0:	e8 ed fe ff ff       	call   392 <write>

  while(--i >= 0)
 4a5:	83 c4 10             	add    $0x10,%esp
 4a8:	39 de                	cmp    %ebx,%esi
 4aa:	75 e4                	jne    490 <printint+0x60>
    putc(fd, buf[i]);
}
 4ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4af:	5b                   	pop    %ebx
 4b0:	5e                   	pop    %esi
 4b1:	5f                   	pop    %edi
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret    
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4b8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4bf:	eb 90                	jmp    451 <printint+0x21>
 4c1:	eb 0d                	jmp    4d0 <printf>
 4c3:	90                   	nop
 4c4:	90                   	nop
 4c5:	90                   	nop
 4c6:	90                   	nop
 4c7:	90                   	nop
 4c8:	90                   	nop
 4c9:	90                   	nop
 4ca:	90                   	nop
 4cb:	90                   	nop
 4cc:	90                   	nop
 4cd:	90                   	nop
 4ce:	90                   	nop
 4cf:	90                   	nop

000004d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4dc:	0f b6 1e             	movzbl (%esi),%ebx
 4df:	84 db                	test   %bl,%bl
 4e1:	0f 84 bf 00 00 00    	je     5a6 <printf+0xd6>
 4e7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
 4ea:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
 4ed:	31 d2                	xor    %edx,%edx
 4ef:	eb 39                	jmp    52a <printf+0x5a>
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 4fe:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 503:	74 1a                	je     51f <printf+0x4f>
  write(fd, &c, 1);
 505:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 508:	83 ec 04             	sub    $0x4,%esp
 50b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 50e:	6a 01                	push   $0x1
 510:	50                   	push   %eax
 511:	ff 75 08             	pushl  0x8(%ebp)
 514:	e8 79 fe ff ff       	call   392 <write>
 519:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 51c:	83 c4 10             	add    $0x10,%esp
 51f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 522:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 526:	84 db                	test   %bl,%bl
 528:	74 7c                	je     5a6 <printf+0xd6>
    if(state == 0){
 52a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 52c:	0f be cb             	movsbl %bl,%ecx
 52f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 532:	74 c4                	je     4f8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 534:	83 fa 25             	cmp    $0x25,%edx
 537:	75 e6                	jne    51f <printf+0x4f>
      if(c == 'd'){
 539:	83 f8 64             	cmp    $0x64,%eax
 53c:	0f 84 a6 00 00 00    	je     5e8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
 542:	83 f8 6c             	cmp    $0x6c,%eax
 545:	0f 84 ad 00 00 00    	je     5f8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
 54b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 551:	83 f9 70             	cmp    $0x70,%ecx
 554:	74 5a                	je     5b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 556:	83 f8 73             	cmp    $0x73,%eax
 559:	0f 84 e1 00 00 00    	je     640 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55f:	83 f8 63             	cmp    $0x63,%eax
 562:	0f 84 28 01 00 00    	je     690 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	74 6b                	je     5d8 <printf+0x108>
  write(fd, &c, 1);
 56d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 570:	83 ec 04             	sub    $0x4,%esp
 573:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 577:	6a 01                	push   $0x1
 579:	50                   	push   %eax
 57a:	ff 75 08             	pushl  0x8(%ebp)
 57d:	e8 10 fe ff ff       	call   392 <write>
 582:	83 c4 0c             	add    $0xc,%esp
 585:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 588:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 58b:	6a 01                	push   $0x1
 58d:	50                   	push   %eax
 58e:	ff 75 08             	pushl  0x8(%ebp)
 591:	83 c6 01             	add    $0x1,%esi
 594:	e8 f9 fd ff ff       	call   392 <write>
  for(i = 0; fmt[i]; i++){
 599:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 59d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5a0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5a2:	84 db                	test   %bl,%bl
 5a4:	75 84                	jne    52a <printf+0x5a>
    }
  }
}
 5a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a9:	5b                   	pop    %ebx
 5aa:	5e                   	pop    %esi
 5ab:	5f                   	pop    %edi
 5ac:	5d                   	pop    %ebp
 5ad:	c3                   	ret    
 5ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5b8:	6a 00                	push   $0x0
 5ba:	8b 17                	mov    (%edi),%edx
 5bc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
 5bf:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 5c2:	e8 69 fe ff ff       	call   430 <printint>
 5c7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ca:	31 d2                	xor    %edx,%edx
 5cc:	e9 4e ff ff ff       	jmp    51f <printf+0x4f>
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5d8:	83 ec 04             	sub    $0x4,%esp
 5db:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5de:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5e1:	6a 01                	push   $0x1
 5e3:	eb a8                	jmp    58d <printf+0xbd>
 5e5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5e8:	83 ec 0c             	sub    $0xc,%esp
 5eb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f0:	6a 01                	push   $0x1
 5f2:	eb c6                	jmp    5ba <printf+0xea>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
 5f8:	8b 57 04             	mov    0x4(%edi),%edx
 5fb:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
 5fd:	85 d2                	test   %edx,%edx
 5ff:	74 15                	je     616 <printf+0x146>
 601:	83 ec 0c             	sub    $0xc,%esp
 604:	8b 45 08             	mov    0x8(%ebp),%eax
 607:	b9 10 00 00 00       	mov    $0x10,%ecx
 60c:	6a 00                	push   $0x0
 60e:	e8 1d fe ff ff       	call   430 <printint>
 613:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
 616:	83 ec 0c             	sub    $0xc,%esp
 619:	8b 45 08             	mov    0x8(%ebp),%eax
 61c:	89 da                	mov    %ebx,%edx
 61e:	6a 00                	push   $0x0
 620:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 625:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
 628:	e8 03 fe ff ff       	call   430 <printint>
 62d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 630:	31 d2                	xor    %edx,%edx
 632:	e9 e8 fe ff ff       	jmp    51f <printf+0x4f>
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 640:	8b 0f                	mov    (%edi),%ecx
        ap++;
 642:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 645:	85 c9                	test   %ecx,%ecx
 647:	74 6a                	je     6b3 <printf+0x1e3>
        while(*s != 0){
 649:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 64c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
 64e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 650:	84 c0                	test   %al,%al
 652:	0f 84 c7 fe ff ff    	je     51f <printf+0x4f>
 658:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 65b:	89 de                	mov    %ebx,%esi
 65d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 660:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 663:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 666:	83 ec 04             	sub    $0x4,%esp
 669:	6a 01                	push   $0x1
          s++;
 66b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 66e:	50                   	push   %eax
 66f:	53                   	push   %ebx
 670:	e8 1d fd ff ff       	call   392 <write>
        while(*s != 0){
 675:	0f b6 06             	movzbl (%esi),%eax
 678:	83 c4 10             	add    $0x10,%esp
 67b:	84 c0                	test   %al,%al
 67d:	75 e1                	jne    660 <printf+0x190>
 67f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 682:	31 d2                	xor    %edx,%edx
 684:	e9 96 fe ff ff       	jmp    51f <printf+0x4f>
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 690:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 692:	83 ec 04             	sub    $0x4,%esp
        ap++;
 695:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
 698:	6a 01                	push   $0x1
        putc(fd, *ap);
 69a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 69d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6a0:	50                   	push   %eax
 6a1:	ff 75 08             	pushl  0x8(%ebp)
 6a4:	e8 e9 fc ff ff       	call   392 <write>
 6a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ac:	31 d2                	xor    %edx,%edx
 6ae:	e9 6c fe ff ff       	jmp    51f <printf+0x4f>
          s = "(null)";
 6b3:	bb c8 08 00 00       	mov    $0x8c8,%ebx
        while(*s != 0){
 6b8:	b8 28 00 00 00       	mov    $0x28,%eax
 6bd:	eb 99                	jmp    658 <printf+0x188>
 6bf:	90                   	nop

000006c0 <free>:
 6c0:	55                   	push   %ebp
 6c1:	a1 a0 0b 00 00       	mov    0xba0,%eax
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	57                   	push   %edi
 6c9:	56                   	push   %esi
 6ca:	53                   	push   %ebx
 6cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	39 c8                	cmp    %ecx,%eax
 6da:	8b 10                	mov    (%eax),%edx
 6dc:	73 32                	jae    710 <free+0x50>
 6de:	39 d1                	cmp    %edx,%ecx
 6e0:	72 04                	jb     6e6 <free+0x26>
 6e2:	39 d0                	cmp    %edx,%eax
 6e4:	72 32                	jb     718 <free+0x58>
 6e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ec:	39 fa                	cmp    %edi,%edx
 6ee:	74 30                	je     720 <free+0x60>
 6f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6f3:	8b 50 04             	mov    0x4(%eax),%edx
 6f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f9:	39 f1                	cmp    %esi,%ecx
 6fb:	74 3a                	je     737 <free+0x77>
 6fd:	89 08                	mov    %ecx,(%eax)
 6ff:	a3 a0 0b 00 00       	mov    %eax,0xba0
 704:	5b                   	pop    %ebx
 705:	5e                   	pop    %esi
 706:	5f                   	pop    %edi
 707:	5d                   	pop    %ebp
 708:	c3                   	ret    
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 710:	39 d0                	cmp    %edx,%eax
 712:	72 04                	jb     718 <free+0x58>
 714:	39 d1                	cmp    %edx,%ecx
 716:	72 ce                	jb     6e6 <free+0x26>
 718:	89 d0                	mov    %edx,%eax
 71a:	eb bc                	jmp    6d8 <free+0x18>
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 720:	03 72 04             	add    0x4(%edx),%esi
 723:	89 73 fc             	mov    %esi,-0x4(%ebx)
 726:	8b 10                	mov    (%eax),%edx
 728:	8b 12                	mov    (%edx),%edx
 72a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 72d:	8b 50 04             	mov    0x4(%eax),%edx
 730:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 733:	39 f1                	cmp    %esi,%ecx
 735:	75 c6                	jne    6fd <free+0x3d>
 737:	03 53 fc             	add    -0x4(%ebx),%edx
 73a:	a3 a0 0b 00 00       	mov    %eax,0xba0
 73f:	89 50 04             	mov    %edx,0x4(%eax)
 742:	8b 53 f8             	mov    -0x8(%ebx),%edx
 745:	89 10                	mov    %edx,(%eax)
 747:	5b                   	pop    %ebx
 748:	5e                   	pop    %esi
 749:	5f                   	pop    %edi
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret    
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000750 <malloc>:
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 0c             	sub    $0xc,%esp
 759:	8b 45 08             	mov    0x8(%ebp),%eax
 75c:	8b 15 a0 0b 00 00    	mov    0xba0,%edx
 762:	8d 78 07             	lea    0x7(%eax),%edi
 765:	c1 ef 03             	shr    $0x3,%edi
 768:	83 c7 01             	add    $0x1,%edi
 76b:	85 d2                	test   %edx,%edx
 76d:	0f 84 9d 00 00 00    	je     810 <malloc+0xc0>
 773:	8b 02                	mov    (%edx),%eax
 775:	8b 48 04             	mov    0x4(%eax),%ecx
 778:	39 cf                	cmp    %ecx,%edi
 77a:	76 6c                	jbe    7e8 <malloc+0x98>
 77c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 782:	bb 00 10 00 00       	mov    $0x1000,%ebx
 787:	0f 43 df             	cmovae %edi,%ebx
 78a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 791:	eb 0e                	jmp    7a1 <malloc+0x51>
 793:	90                   	nop
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 798:	8b 02                	mov    (%edx),%eax
 79a:	8b 48 04             	mov    0x4(%eax),%ecx
 79d:	39 f9                	cmp    %edi,%ecx
 79f:	73 47                	jae    7e8 <malloc+0x98>
 7a1:	39 05 a0 0b 00 00    	cmp    %eax,0xba0
 7a7:	89 c2                	mov    %eax,%edx
 7a9:	75 ed                	jne    798 <malloc+0x48>
 7ab:	83 ec 0c             	sub    $0xc,%esp
 7ae:	56                   	push   %esi
 7af:	e8 46 fc ff ff       	call   3fa <sbrk>
 7b4:	83 c4 10             	add    $0x10,%esp
 7b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ba:	74 1c                	je     7d8 <malloc+0x88>
 7bc:	89 58 04             	mov    %ebx,0x4(%eax)
 7bf:	83 ec 0c             	sub    $0xc,%esp
 7c2:	83 c0 08             	add    $0x8,%eax
 7c5:	50                   	push   %eax
 7c6:	e8 f5 fe ff ff       	call   6c0 <free>
 7cb:	8b 15 a0 0b 00 00    	mov    0xba0,%edx
 7d1:	83 c4 10             	add    $0x10,%esp
 7d4:	85 d2                	test   %edx,%edx
 7d6:	75 c0                	jne    798 <malloc+0x48>
 7d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7db:	31 c0                	xor    %eax,%eax
 7dd:	5b                   	pop    %ebx
 7de:	5e                   	pop    %esi
 7df:	5f                   	pop    %edi
 7e0:	5d                   	pop    %ebp
 7e1:	c3                   	ret    
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7e8:	39 cf                	cmp    %ecx,%edi
 7ea:	74 54                	je     840 <malloc+0xf0>
 7ec:	29 f9                	sub    %edi,%ecx
 7ee:	89 48 04             	mov    %ecx,0x4(%eax)
 7f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 7f4:	89 78 04             	mov    %edi,0x4(%eax)
 7f7:	89 15 a0 0b 00 00    	mov    %edx,0xba0
 7fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 800:	83 c0 08             	add    $0x8,%eax
 803:	5b                   	pop    %ebx
 804:	5e                   	pop    %esi
 805:	5f                   	pop    %edi
 806:	5d                   	pop    %ebp
 807:	c3                   	ret    
 808:	90                   	nop
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 810:	c7 05 a0 0b 00 00 a4 	movl   $0xba4,0xba0
 817:	0b 00 00 
 81a:	c7 05 a4 0b 00 00 a4 	movl   $0xba4,0xba4
 821:	0b 00 00 
 824:	b8 a4 0b 00 00       	mov    $0xba4,%eax
 829:	c7 05 a8 0b 00 00 00 	movl   $0x0,0xba8
 830:	00 00 00 
 833:	e9 44 ff ff ff       	jmp    77c <malloc+0x2c>
 838:	90                   	nop
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 840:	8b 08                	mov    (%eax),%ecx
 842:	89 0a                	mov    %ecx,(%edx)
 844:	eb b1                	jmp    7f7 <malloc+0xa7>
