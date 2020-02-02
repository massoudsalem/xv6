
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

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
  forktest();
  11:	e8 3a 00 00 00       	call   50 <forktest>
  exit();
  16:	e8 5e 05 00 00       	call   579 <exit>
  1b:	66 90                	xchg   %ax,%ax
  1d:	66 90                	xchg   %ax,%ax
  1f:	90                   	nop

00000020 <printf>:
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	53                   	push   %ebx
  24:	83 ec 10             	sub    $0x10,%esp
  27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2a:	53                   	push   %ebx
  2b:	e8 a0 01 00 00       	call   1d0 <strlen>
  30:	83 c4 0c             	add    $0xc,%esp
  33:	50                   	push   %eax
  34:	53                   	push   %ebx
  35:	ff 75 08             	pushl  0x8(%ebp)
  38:	e8 5c 05 00 00       	call   599 <write>
}
  3d:	83 c4 10             	add    $0x10,%esp
  40:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  43:	c9                   	leave  
  44:	c3                   	ret    
  45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000050 <forktest>:
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  for(n=0; n<N; n++){
  54:	31 db                	xor    %ebx,%ebx
{
  56:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  59:	68 5c 06 00 00       	push   $0x65c
  5e:	e8 6d 01 00 00       	call   1d0 <strlen>
  63:	83 c4 0c             	add    $0xc,%esp
  66:	50                   	push   %eax
  67:	68 5c 06 00 00       	push   $0x65c
  6c:	6a 01                	push   $0x1
  6e:	e8 26 05 00 00       	call   599 <write>
  73:	83 c4 10             	add    $0x10,%esp
  76:	eb 19                	jmp    91 <forktest+0x41>
  78:	90                   	nop
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
  80:	0f 84 7c 00 00 00    	je     102 <forktest+0xb2>
  for(n=0; n<N; n++){
  86:	83 c3 01             	add    $0x1,%ebx
  89:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8f:	74 4f                	je     e0 <forktest+0x90>
    pid = fork();
  91:	e8 db 04 00 00       	call   571 <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 dc 04 00 00       	call   581 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 5e                	js     107 <forktest+0xb7>
  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
  if(wait() != -1){
  ae:	e8 ce 04 00 00       	call   581 <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 71                	jne    129 <forktest+0xd9>
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 8e 06 00 00       	push   $0x68e
  c0:	e8 0b 01 00 00       	call   1d0 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 8e 06 00 00       	push   $0x68e
  ce:	6a 01                	push   $0x1
  d0:	e8 c4 04 00 00       	call   599 <write>
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, s, strlen(s));
  e0:	83 ec 0c             	sub    $0xc,%esp
  e3:	68 9c 06 00 00       	push   $0x69c
  e8:	e8 e3 00 00 00       	call   1d0 <strlen>
  ed:	83 c4 0c             	add    $0xc,%esp
  f0:	50                   	push   %eax
  f1:	68 9c 06 00 00       	push   $0x69c
  f6:	6a 01                	push   $0x1
  f8:	e8 9c 04 00 00       	call   599 <write>
    exit();
  fd:	e8 77 04 00 00       	call   579 <exit>
      exit();
 102:	e8 72 04 00 00       	call   579 <exit>
  write(fd, s, strlen(s));
 107:	83 ec 0c             	sub    $0xc,%esp
 10a:	68 67 06 00 00       	push   $0x667
 10f:	e8 bc 00 00 00       	call   1d0 <strlen>
 114:	83 c4 0c             	add    $0xc,%esp
 117:	50                   	push   %eax
 118:	68 67 06 00 00       	push   $0x667
 11d:	6a 01                	push   $0x1
 11f:	e8 75 04 00 00       	call   599 <write>
      exit();
 124:	e8 50 04 00 00       	call   579 <exit>
  write(fd, s, strlen(s));
 129:	83 ec 0c             	sub    $0xc,%esp
 12c:	68 7b 06 00 00       	push   $0x67b
 131:	e8 9a 00 00 00       	call   1d0 <strlen>
 136:	83 c4 0c             	add    $0xc,%esp
 139:	50                   	push   %eax
 13a:	68 7b 06 00 00       	push   $0x67b
 13f:	6a 01                	push   $0x1
 141:	e8 53 04 00 00       	call   599 <write>
    exit();
 146:	e8 2e 04 00 00       	call   579 <exit>
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15a:	89 c2                	mov    %eax,%edx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	83 c1 01             	add    $0x1,%ecx
 163:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 167:	83 c2 01             	add    $0x1,%edx
 16a:	84 db                	test   %bl,%bl
 16c:	88 5a ff             	mov    %bl,-0x1(%edx)
 16f:	75 ef                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 171:	5b                   	pop    %ebx
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 55 08             	mov    0x8(%ebp),%edx
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 18a:	0f b6 02             	movzbl (%edx),%eax
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	84 c0                	test   %al,%al
 192:	75 1c                	jne    1b0 <strcmp+0x30>
 194:	eb 2a                	jmp    1c0 <strcmp+0x40>
 196:	8d 76 00             	lea    0x0(%esi),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1a0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1a6:	83 c1 01             	add    $0x1,%ecx
 1a9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 1ac:	84 c0                	test   %al,%al
 1ae:	74 10                	je     1c0 <strcmp+0x40>
 1b0:	38 d8                	cmp    %bl,%al
 1b2:	74 ec                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1b4:	29 d8                	sub    %ebx,%eax
}
 1b6:	5b                   	pop    %ebx
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 39 00             	cmpb   $0x0,(%ecx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 d2                	xor    %edx,%edx
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c2 01             	add    $0x1,%edx
 1e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1e7:	89 d0                	mov    %edx,%eax
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	89 d0                	mov    %edx,%eax
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	74 1d                	je     24e <strchr+0x2e>
    if(*s == c)
 231:	38 d3                	cmp    %dl,%bl
 233:	89 d9                	mov    %ebx,%ecx
 235:	75 0d                	jne    244 <strchr+0x24>
 237:	eb 17                	jmp    250 <strchr+0x30>
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 240:	38 ca                	cmp    %cl,%dl
 242:	74 0c                	je     250 <strchr+0x30>
  for(; *s; s++)
 244:	83 c0 01             	add    $0x1,%eax
 247:	0f b6 10             	movzbl (%eax),%edx
 24a:	84 d2                	test   %dl,%dl
 24c:	75 f2                	jne    240 <strchr+0x20>
      return (char*)s;
  return 0;
 24e:	31 c0                	xor    %eax,%eax
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
 265:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 266:	31 f6                	xor    %esi,%esi
 268:	89 f3                	mov    %esi,%ebx
{
 26a:	83 ec 1c             	sub    $0x1c,%esp
 26d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 270:	eb 2f                	jmp    2a1 <gets+0x41>
 272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 278:	8d 45 e7             	lea    -0x19(%ebp),%eax
 27b:	83 ec 04             	sub    $0x4,%esp
 27e:	6a 01                	push   $0x1
 280:	50                   	push   %eax
 281:	6a 00                	push   $0x0
 283:	e8 09 03 00 00       	call   591 <read>
    if(cc < 1)
 288:	83 c4 10             	add    $0x10,%esp
 28b:	85 c0                	test   %eax,%eax
 28d:	7e 1c                	jle    2ab <gets+0x4b>
      break;
    buf[i++] = c;
 28f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 293:	83 c7 01             	add    $0x1,%edi
 296:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 299:	3c 0a                	cmp    $0xa,%al
 29b:	74 23                	je     2c0 <gets+0x60>
 29d:	3c 0d                	cmp    $0xd,%al
 29f:	74 1f                	je     2c0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2a1:	83 c3 01             	add    $0x1,%ebx
 2a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2a7:	89 fe                	mov    %edi,%esi
 2a9:	7c cd                	jl     278 <gets+0x18>
 2ab:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2b0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	90                   	nop
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c0:	8b 75 08             	mov    0x8(%ebp),%esi
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	01 de                	add    %ebx,%esi
 2c8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2ca:	c6 03 00             	movb   $0x0,(%ebx)
}
 2cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d0:	5b                   	pop    %ebx
 2d1:	5e                   	pop    %esi
 2d2:	5f                   	pop    %edi
 2d3:	5d                   	pop    %ebp
 2d4:	c3                   	ret    
 2d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e5:	83 ec 08             	sub    $0x8,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	ff 75 08             	pushl  0x8(%ebp)
 2ed:	e8 c7 02 00 00       	call   5b9 <open>
  if(fd < 0)
 2f2:	83 c4 10             	add    $0x10,%esp
 2f5:	85 c0                	test   %eax,%eax
 2f7:	78 27                	js     320 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	ff 75 0c             	pushl  0xc(%ebp)
 2ff:	89 c3                	mov    %eax,%ebx
 301:	50                   	push   %eax
 302:	e8 ca 02 00 00       	call   5d1 <fstat>
  close(fd);
 307:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30a:	89 c6                	mov    %eax,%esi
  close(fd);
 30c:	e8 90 02 00 00       	call   5a1 <close>
  return r;
 311:	83 c4 10             	add    $0x10,%esp
}
 314:	8d 65 f8             	lea    -0x8(%ebp),%esp
 317:	89 f0                	mov    %esi,%eax
 319:	5b                   	pop    %ebx
 31a:	5e                   	pop    %esi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    
 31d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 320:	be ff ff ff ff       	mov    $0xffffffff,%esi
 325:	eb ed                	jmp    314 <stat+0x34>
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <atoi>:

int
atoi(const char *s)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 337:	0f be 11             	movsbl (%ecx),%edx
 33a:	8d 42 d0             	lea    -0x30(%edx),%eax
 33d:	3c 09                	cmp    $0x9,%al
  n = 0;
 33f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 344:	77 1f                	ja     365 <atoi+0x35>
 346:	8d 76 00             	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 350:	8d 04 80             	lea    (%eax,%eax,4),%eax
 353:	83 c1 01             	add    $0x1,%ecx
 356:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 35a:	0f be 11             	movsbl (%ecx),%edx
 35d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
  return n;
}
 365:	5b                   	pop    %ebx
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    
 368:	90                   	nop
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	8b 5d 10             	mov    0x10(%ebp),%ebx
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 37e:	85 db                	test   %ebx,%ebx
 380:	7e 14                	jle    396 <memmove+0x26>
 382:	31 d2                	xor    %edx,%edx
 384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 388:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 38c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 38f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 392:	39 d3                	cmp    %edx,%ebx
 394:	75 f2                	jne    388 <memmove+0x18>
  return vdst;
}
 396:	5b                   	pop    %ebx
 397:	5e                   	pop    %esi
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003a0 <thread_join>:
  }*/
  return clone(start_routine, arg1, arg2, stack);
}

int thread_join()
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 3a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3a9:	50                   	push   %eax
 3aa:	e8 a2 02 00 00       	call   651 <join>
  //free(stackPtr);
  return x;
}
 3af:	c9                   	leave  
 3b0:	c3                   	ret    
 3b1:	eb 0d                	jmp    3c0 <free>
 3b3:	90                   	nop
 3b4:	90                   	nop
 3b5:	90                   	nop
 3b6:	90                   	nop
 3b7:	90                   	nop
 3b8:	90                   	nop
 3b9:	90                   	nop
 3ba:	90                   	nop
 3bb:	90                   	nop
 3bc:	90                   	nop
 3bd:	90                   	nop
 3be:	90                   	nop
 3bf:	90                   	nop

000003c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3c1:	a1 78 09 00 00       	mov    0x978,%eax
{
 3c6:	89 e5                	mov    %esp,%ebp
 3c8:	57                   	push   %edi
 3c9:	56                   	push   %esi
 3ca:	53                   	push   %ebx
 3cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 3ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3d8:	39 c8                	cmp    %ecx,%eax
 3da:	8b 10                	mov    (%eax),%edx
 3dc:	73 32                	jae    410 <free+0x50>
 3de:	39 d1                	cmp    %edx,%ecx
 3e0:	72 04                	jb     3e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3e2:	39 d0                	cmp    %edx,%eax
 3e4:	72 32                	jb     418 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3ec:	39 fa                	cmp    %edi,%edx
 3ee:	74 30                	je     420 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3f3:	8b 50 04             	mov    0x4(%eax),%edx
 3f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 3f9:	39 f1                	cmp    %esi,%ecx
 3fb:	74 3a                	je     437 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 3fd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 3ff:	a3 78 09 00 00       	mov    %eax,0x978
}
 404:	5b                   	pop    %ebx
 405:	5e                   	pop    %esi
 406:	5f                   	pop    %edi
 407:	5d                   	pop    %ebp
 408:	c3                   	ret    
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 410:	39 d0                	cmp    %edx,%eax
 412:	72 04                	jb     418 <free+0x58>
 414:	39 d1                	cmp    %edx,%ecx
 416:	72 ce                	jb     3e6 <free+0x26>
{
 418:	89 d0                	mov    %edx,%eax
 41a:	eb bc                	jmp    3d8 <free+0x18>
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 420:	03 72 04             	add    0x4(%edx),%esi
 423:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 426:	8b 10                	mov    (%eax),%edx
 428:	8b 12                	mov    (%edx),%edx
 42a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 42d:	8b 50 04             	mov    0x4(%eax),%edx
 430:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 433:	39 f1                	cmp    %esi,%ecx
 435:	75 c6                	jne    3fd <free+0x3d>
    p->s.size += bp->s.size;
 437:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 43a:	a3 78 09 00 00       	mov    %eax,0x978
    p->s.size += bp->s.size;
 43f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 442:	8b 53 f8             	mov    -0x8(%ebx),%edx
 445:	89 10                	mov    %edx,(%eax)
}
 447:	5b                   	pop    %ebx
 448:	5e                   	pop    %esi
 449:	5f                   	pop    %edi
 44a:	5d                   	pop    %ebp
 44b:	c3                   	ret    
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000450 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 459:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 45c:	8b 15 78 09 00 00    	mov    0x978,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 462:	8d 78 07             	lea    0x7(%eax),%edi
 465:	c1 ef 03             	shr    $0x3,%edi
 468:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 46b:	85 d2                	test   %edx,%edx
 46d:	0f 84 9d 00 00 00    	je     510 <malloc+0xc0>
 473:	8b 02                	mov    (%edx),%eax
 475:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 478:	39 cf                	cmp    %ecx,%edi
 47a:	76 6c                	jbe    4e8 <malloc+0x98>
 47c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 482:	bb 00 10 00 00       	mov    $0x1000,%ebx
 487:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 48a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 491:	eb 0e                	jmp    4a1 <malloc+0x51>
 493:	90                   	nop
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 498:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 49a:	8b 48 04             	mov    0x4(%eax),%ecx
 49d:	39 f9                	cmp    %edi,%ecx
 49f:	73 47                	jae    4e8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 4a1:	39 05 78 09 00 00    	cmp    %eax,0x978
 4a7:	89 c2                	mov    %eax,%edx
 4a9:	75 ed                	jne    498 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 4ab:	83 ec 0c             	sub    $0xc,%esp
 4ae:	56                   	push   %esi
 4af:	e8 4d 01 00 00       	call   601 <sbrk>
  if(p == (char*)-1)
 4b4:	83 c4 10             	add    $0x10,%esp
 4b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 4ba:	74 1c                	je     4d8 <malloc+0x88>
  hp->s.size = nu;
 4bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 4bf:	83 ec 0c             	sub    $0xc,%esp
 4c2:	83 c0 08             	add    $0x8,%eax
 4c5:	50                   	push   %eax
 4c6:	e8 f5 fe ff ff       	call   3c0 <free>
  return freep;
 4cb:	8b 15 78 09 00 00    	mov    0x978,%edx
      if((p = morecore(nunits)) == 0)
 4d1:	83 c4 10             	add    $0x10,%esp
 4d4:	85 d2                	test   %edx,%edx
 4d6:	75 c0                	jne    498 <malloc+0x48>
        return 0;
  }
 4d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 4db:	31 c0                	xor    %eax,%eax
 4dd:	5b                   	pop    %ebx
 4de:	5e                   	pop    %esi
 4df:	5f                   	pop    %edi
 4e0:	5d                   	pop    %ebp
 4e1:	c3                   	ret    
 4e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 4e8:	39 cf                	cmp    %ecx,%edi
 4ea:	74 54                	je     540 <malloc+0xf0>
        p->s.size -= nunits;
 4ec:	29 f9                	sub    %edi,%ecx
 4ee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 4f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 4f4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 4f7:	89 15 78 09 00 00    	mov    %edx,0x978
 4fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 500:	83 c0 08             	add    $0x8,%eax
 503:	5b                   	pop    %ebx
 504:	5e                   	pop    %esi
 505:	5f                   	pop    %edi
 506:	5d                   	pop    %ebp
 507:	c3                   	ret    
 508:	90                   	nop
 509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 510:	c7 05 78 09 00 00 7c 	movl   $0x97c,0x978
 517:	09 00 00 
 51a:	c7 05 7c 09 00 00 7c 	movl   $0x97c,0x97c
 521:	09 00 00 
    base.s.size = 0;
 524:	b8 7c 09 00 00       	mov    $0x97c,%eax
 529:	c7 05 80 09 00 00 00 	movl   $0x0,0x980
 530:	00 00 00 
 533:	e9 44 ff ff ff       	jmp    47c <malloc+0x2c>
 538:	90                   	nop
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 540:	8b 08                	mov    (%eax),%ecx
 542:	89 0a                	mov    %ecx,(%edx)
 544:	eb b1                	jmp    4f7 <malloc+0xa7>
 546:	8d 76 00             	lea    0x0(%esi),%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000550 <thread_create>:
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(PGSIZE);
 556:	68 00 10 00 00       	push   $0x1000
 55b:	e8 f0 fe ff ff       	call   450 <malloc>
  return clone(start_routine, arg1, arg2, stack);
 560:	50                   	push   %eax
 561:	ff 75 10             	pushl  0x10(%ebp)
 564:	ff 75 0c             	pushl  0xc(%ebp)
 567:	ff 75 08             	pushl  0x8(%ebp)
 56a:	e8 da 00 00 00       	call   649 <clone>
}
 56f:	c9                   	leave  
 570:	c3                   	ret    

00000571 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 571:	b8 01 00 00 00       	mov    $0x1,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <exit>:
SYSCALL(exit)
 579:	b8 02 00 00 00       	mov    $0x2,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <wait>:
SYSCALL(wait)
 581:	b8 03 00 00 00       	mov    $0x3,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <pipe>:
SYSCALL(pipe)
 589:	b8 04 00 00 00       	mov    $0x4,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <read>:
SYSCALL(read)
 591:	b8 05 00 00 00       	mov    $0x5,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <write>:
SYSCALL(write)
 599:	b8 10 00 00 00       	mov    $0x10,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <close>:
SYSCALL(close)
 5a1:	b8 15 00 00 00       	mov    $0x15,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <kill>:
SYSCALL(kill)
 5a9:	b8 06 00 00 00       	mov    $0x6,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <exec>:
SYSCALL(exec)
 5b1:	b8 07 00 00 00       	mov    $0x7,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <open>:
SYSCALL(open)
 5b9:	b8 0f 00 00 00       	mov    $0xf,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <mknod>:
SYSCALL(mknod)
 5c1:	b8 11 00 00 00       	mov    $0x11,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <unlink>:
SYSCALL(unlink)
 5c9:	b8 12 00 00 00       	mov    $0x12,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <fstat>:
SYSCALL(fstat)
 5d1:	b8 08 00 00 00       	mov    $0x8,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <link>:
SYSCALL(link)
 5d9:	b8 13 00 00 00       	mov    $0x13,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <mkdir>:
SYSCALL(mkdir)
 5e1:	b8 14 00 00 00       	mov    $0x14,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <chdir>:
SYSCALL(chdir)
 5e9:	b8 09 00 00 00       	mov    $0x9,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <dup>:
SYSCALL(dup)
 5f1:	b8 0a 00 00 00       	mov    $0xa,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <getpid>:
SYSCALL(getpid)
 5f9:	b8 0b 00 00 00       	mov    $0xb,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <sbrk>:
SYSCALL(sbrk)
 601:	b8 0c 00 00 00       	mov    $0xc,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <sleep>:
SYSCALL(sleep)
 609:	b8 0d 00 00 00       	mov    $0xd,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <uptime>:
SYSCALL(uptime)
 611:	b8 0e 00 00 00       	mov    $0xe,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <getreadcount>:
SYSCALL(getreadcount)
 619:	b8 16 00 00 00       	mov    $0x16,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <gettime>:
SYSCALL(gettime)
 621:	b8 17 00 00 00       	mov    $0x17,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <settickets>:
SYSCALL(settickets)
 629:	b8 18 00 00 00       	mov    $0x18,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <getpinfo>:
SYSCALL(getpinfo)
 631:	b8 19 00 00 00       	mov    $0x19,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <mprotect>:
SYSCALL(mprotect)
 639:	b8 1a 00 00 00       	mov    $0x1a,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <munprotect>:
SYSCALL(munprotect)
 641:	b8 1b 00 00 00       	mov    $0x1b,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <clone>:
SYSCALL(clone)
 649:	b8 1c 00 00 00       	mov    $0x1c,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <join>:
 651:	b8 1d 00 00 00       	mov    $0x1d,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    
