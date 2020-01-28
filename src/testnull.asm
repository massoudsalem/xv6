
_testnull:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 04             	sub    $0x4,%esp
   int ppid = getpid();
    1011:	e8 0c 03 00 00       	call   1322 <getpid>

   if (fork() == 0) {
    1016:	e8 7f 02 00 00       	call   129a <fork>
    101b:	85 c0                	test   %eax,%eax
    101d:	75 15                	jne    1034 <main+0x34>
      uint * nullp = (uint*)0;
      printf(1, "null dereference: ");
    101f:	52                   	push   %edx
    1020:	52                   	push   %edx
    1021:	68 98 17 00 00       	push   $0x1798
    1026:	6a 01                	push   $0x1
    1028:	e8 f3 03 00 00       	call   1420 <printf>
      printf(1, "%x %x\n", nullp, *nullp);
    102d:	a1 00 00 00 00       	mov    0x0,%eax
    1032:	0f 0b                	ud2    
      // this process should be killed
      printf(1, "TEST FAILED\n");
      kill(ppid);
      exit();
   } else {
      wait();
    1034:	e8 71 02 00 00       	call   12aa <wait>
   }

   printf(1, "TEST PASSED\n");
    1039:	50                   	push   %eax
    103a:	50                   	push   %eax
    103b:	68 ab 17 00 00       	push   $0x17ab
    1040:	6a 01                	push   $0x1
    1042:	e8 d9 03 00 00       	call   1420 <printf>
   exit();
    1047:	e8 56 02 00 00       	call   12a2 <exit>
    104c:	66 90                	xchg   %ax,%ax
    104e:	66 90                	xchg   %ax,%ax

00001050 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	53                   	push   %ebx
    1054:	8b 45 08             	mov    0x8(%ebp),%eax
    1057:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    105a:	89 c2                	mov    %eax,%edx
    105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1060:	83 c1 01             	add    $0x1,%ecx
    1063:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1067:	83 c2 01             	add    $0x1,%edx
    106a:	84 db                	test   %bl,%bl
    106c:	88 5a ff             	mov    %bl,-0x1(%edx)
    106f:	75 ef                	jne    1060 <strcpy+0x10>
    ;
  return os;
}
    1071:	5b                   	pop    %ebx
    1072:	5d                   	pop    %ebp
    1073:	c3                   	ret    
    1074:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    107a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	53                   	push   %ebx
    1084:	8b 55 08             	mov    0x8(%ebp),%edx
    1087:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    108a:	0f b6 02             	movzbl (%edx),%eax
    108d:	0f b6 19             	movzbl (%ecx),%ebx
    1090:	84 c0                	test   %al,%al
    1092:	75 1c                	jne    10b0 <strcmp+0x30>
    1094:	eb 2a                	jmp    10c0 <strcmp+0x40>
    1096:	8d 76 00             	lea    0x0(%esi),%esi
    1099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10a0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10a6:	83 c1 01             	add    $0x1,%ecx
    10a9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10ac:	84 c0                	test   %al,%al
    10ae:	74 10                	je     10c0 <strcmp+0x40>
    10b0:	38 d8                	cmp    %bl,%al
    10b2:	74 ec                	je     10a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10b4:	29 d8                	sub    %ebx,%eax
}
    10b6:	5b                   	pop    %ebx
    10b7:	5d                   	pop    %ebp
    10b8:	c3                   	ret    
    10b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10c2:	29 d8                	sub    %ebx,%eax
}
    10c4:	5b                   	pop    %ebx
    10c5:	5d                   	pop    %ebp
    10c6:	c3                   	ret    
    10c7:	89 f6                	mov    %esi,%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010d0 <strlen>:

uint
strlen(const char *s)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10d6:	80 39 00             	cmpb   $0x0,(%ecx)
    10d9:	74 15                	je     10f0 <strlen+0x20>
    10db:	31 d2                	xor    %edx,%edx
    10dd:	8d 76 00             	lea    0x0(%esi),%esi
    10e0:	83 c2 01             	add    $0x1,%edx
    10e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10e7:	89 d0                	mov    %edx,%eax
    10e9:	75 f5                	jne    10e0 <strlen+0x10>
    ;
  return n;
}
    10eb:	5d                   	pop    %ebp
    10ec:	c3                   	ret    
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    10f0:	31 c0                	xor    %eax,%eax
}
    10f2:	5d                   	pop    %ebp
    10f3:	c3                   	ret    
    10f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001100 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	57                   	push   %edi
    1104:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1107:	8b 4d 10             	mov    0x10(%ebp),%ecx
    110a:	8b 45 0c             	mov    0xc(%ebp),%eax
    110d:	89 d7                	mov    %edx,%edi
    110f:	fc                   	cld    
    1110:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1112:	89 d0                	mov    %edx,%eax
    1114:	5f                   	pop    %edi
    1115:	5d                   	pop    %ebp
    1116:	c3                   	ret    
    1117:	89 f6                	mov    %esi,%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001120 <strchr>:

char*
strchr(const char *s, char c)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 45 08             	mov    0x8(%ebp),%eax
    1127:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    112a:	0f b6 10             	movzbl (%eax),%edx
    112d:	84 d2                	test   %dl,%dl
    112f:	74 1d                	je     114e <strchr+0x2e>
    if(*s == c)
    1131:	38 d3                	cmp    %dl,%bl
    1133:	89 d9                	mov    %ebx,%ecx
    1135:	75 0d                	jne    1144 <strchr+0x24>
    1137:	eb 17                	jmp    1150 <strchr+0x30>
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1140:	38 ca                	cmp    %cl,%dl
    1142:	74 0c                	je     1150 <strchr+0x30>
  for(; *s; s++)
    1144:	83 c0 01             	add    $0x1,%eax
    1147:	0f b6 10             	movzbl (%eax),%edx
    114a:	84 d2                	test   %dl,%dl
    114c:	75 f2                	jne    1140 <strchr+0x20>
      return (char*)s;
  return 0;
    114e:	31 c0                	xor    %eax,%eax
}
    1150:	5b                   	pop    %ebx
    1151:	5d                   	pop    %ebp
    1152:	c3                   	ret    
    1153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001160 <gets>:

char*
gets(char *buf, int max)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	57                   	push   %edi
    1164:	56                   	push   %esi
    1165:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1166:	31 f6                	xor    %esi,%esi
    1168:	89 f3                	mov    %esi,%ebx
{
    116a:	83 ec 1c             	sub    $0x1c,%esp
    116d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1170:	eb 2f                	jmp    11a1 <gets+0x41>
    1172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1178:	8d 45 e7             	lea    -0x19(%ebp),%eax
    117b:	83 ec 04             	sub    $0x4,%esp
    117e:	6a 01                	push   $0x1
    1180:	50                   	push   %eax
    1181:	6a 00                	push   $0x0
    1183:	e8 32 01 00 00       	call   12ba <read>
    if(cc < 1)
    1188:	83 c4 10             	add    $0x10,%esp
    118b:	85 c0                	test   %eax,%eax
    118d:	7e 1c                	jle    11ab <gets+0x4b>
      break;
    buf[i++] = c;
    118f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1193:	83 c7 01             	add    $0x1,%edi
    1196:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1199:	3c 0a                	cmp    $0xa,%al
    119b:	74 23                	je     11c0 <gets+0x60>
    119d:	3c 0d                	cmp    $0xd,%al
    119f:	74 1f                	je     11c0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11a1:	83 c3 01             	add    $0x1,%ebx
    11a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11a7:	89 fe                	mov    %edi,%esi
    11a9:	7c cd                	jl     1178 <gets+0x18>
    11ab:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11ad:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11b0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11b6:	5b                   	pop    %ebx
    11b7:	5e                   	pop    %esi
    11b8:	5f                   	pop    %edi
    11b9:	5d                   	pop    %ebp
    11ba:	c3                   	ret    
    11bb:	90                   	nop
    11bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11c0:	8b 75 08             	mov    0x8(%ebp),%esi
    11c3:	8b 45 08             	mov    0x8(%ebp),%eax
    11c6:	01 de                	add    %ebx,%esi
    11c8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11ca:	c6 03 00             	movb   $0x0,(%ebx)
}
    11cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11d0:	5b                   	pop    %ebx
    11d1:	5e                   	pop    %esi
    11d2:	5f                   	pop    %edi
    11d3:	5d                   	pop    %ebp
    11d4:	c3                   	ret    
    11d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	56                   	push   %esi
    11e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11e5:	83 ec 08             	sub    $0x8,%esp
    11e8:	6a 00                	push   $0x0
    11ea:	ff 75 08             	pushl  0x8(%ebp)
    11ed:	e8 f0 00 00 00       	call   12e2 <open>
  if(fd < 0)
    11f2:	83 c4 10             	add    $0x10,%esp
    11f5:	85 c0                	test   %eax,%eax
    11f7:	78 27                	js     1220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11f9:	83 ec 08             	sub    $0x8,%esp
    11fc:	ff 75 0c             	pushl  0xc(%ebp)
    11ff:	89 c3                	mov    %eax,%ebx
    1201:	50                   	push   %eax
    1202:	e8 f3 00 00 00       	call   12fa <fstat>
  close(fd);
    1207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    120a:	89 c6                	mov    %eax,%esi
  close(fd);
    120c:	e8 b9 00 00 00       	call   12ca <close>
  return r;
    1211:	83 c4 10             	add    $0x10,%esp
}
    1214:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1217:	89 f0                	mov    %esi,%eax
    1219:	5b                   	pop    %ebx
    121a:	5e                   	pop    %esi
    121b:	5d                   	pop    %ebp
    121c:	c3                   	ret    
    121d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1220:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1225:	eb ed                	jmp    1214 <stat+0x34>
    1227:	89 f6                	mov    %esi,%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <atoi>:

int
atoi(const char *s)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	53                   	push   %ebx
    1234:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1237:	0f be 11             	movsbl (%ecx),%edx
    123a:	8d 42 d0             	lea    -0x30(%edx),%eax
    123d:	3c 09                	cmp    $0x9,%al
  n = 0;
    123f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1244:	77 1f                	ja     1265 <atoi+0x35>
    1246:	8d 76 00             	lea    0x0(%esi),%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1250:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1253:	83 c1 01             	add    $0x1,%ecx
    1256:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    125a:	0f be 11             	movsbl (%ecx),%edx
    125d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1260:	80 fb 09             	cmp    $0x9,%bl
    1263:	76 eb                	jbe    1250 <atoi+0x20>
  return n;
}
    1265:	5b                   	pop    %ebx
    1266:	5d                   	pop    %ebp
    1267:	c3                   	ret    
    1268:	90                   	nop
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	56                   	push   %esi
    1274:	53                   	push   %ebx
    1275:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1278:	8b 45 08             	mov    0x8(%ebp),%eax
    127b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    127e:	85 db                	test   %ebx,%ebx
    1280:	7e 14                	jle    1296 <memmove+0x26>
    1282:	31 d2                	xor    %edx,%edx
    1284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    128c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    128f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1292:	39 d3                	cmp    %edx,%ebx
    1294:	75 f2                	jne    1288 <memmove+0x18>
  return vdst;
}
    1296:	5b                   	pop    %ebx
    1297:	5e                   	pop    %esi
    1298:	5d                   	pop    %ebp
    1299:	c3                   	ret    

0000129a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    129a:	b8 01 00 00 00       	mov    $0x1,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <exit>:
SYSCALL(exit)
    12a2:	b8 02 00 00 00       	mov    $0x2,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <wait>:
SYSCALL(wait)
    12aa:	b8 03 00 00 00       	mov    $0x3,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <pipe>:
SYSCALL(pipe)
    12b2:	b8 04 00 00 00       	mov    $0x4,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <read>:
SYSCALL(read)
    12ba:	b8 05 00 00 00       	mov    $0x5,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <write>:
SYSCALL(write)
    12c2:	b8 10 00 00 00       	mov    $0x10,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <close>:
SYSCALL(close)
    12ca:	b8 15 00 00 00       	mov    $0x15,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <kill>:
SYSCALL(kill)
    12d2:	b8 06 00 00 00       	mov    $0x6,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <exec>:
SYSCALL(exec)
    12da:	b8 07 00 00 00       	mov    $0x7,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <open>:
SYSCALL(open)
    12e2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <mknod>:
SYSCALL(mknod)
    12ea:	b8 11 00 00 00       	mov    $0x11,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <unlink>:
SYSCALL(unlink)
    12f2:	b8 12 00 00 00       	mov    $0x12,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <fstat>:
SYSCALL(fstat)
    12fa:	b8 08 00 00 00       	mov    $0x8,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <link>:
SYSCALL(link)
    1302:	b8 13 00 00 00       	mov    $0x13,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <mkdir>:
SYSCALL(mkdir)
    130a:	b8 14 00 00 00       	mov    $0x14,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <chdir>:
SYSCALL(chdir)
    1312:	b8 09 00 00 00       	mov    $0x9,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <dup>:
SYSCALL(dup)
    131a:	b8 0a 00 00 00       	mov    $0xa,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <getpid>:
SYSCALL(getpid)
    1322:	b8 0b 00 00 00       	mov    $0xb,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <sbrk>:
SYSCALL(sbrk)
    132a:	b8 0c 00 00 00       	mov    $0xc,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <sleep>:
SYSCALL(sleep)
    1332:	b8 0d 00 00 00       	mov    $0xd,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <uptime>:
SYSCALL(uptime)
    133a:	b8 0e 00 00 00       	mov    $0xe,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <getreadcount>:
SYSCALL(getreadcount)
    1342:	b8 16 00 00 00       	mov    $0x16,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <gettime>:
SYSCALL(gettime)
    134a:	b8 17 00 00 00       	mov    $0x17,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <settickets>:
SYSCALL(settickets)
    1352:	b8 18 00 00 00       	mov    $0x18,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <getpinfo>:
SYSCALL(getpinfo)
    135a:	b8 19 00 00 00       	mov    $0x19,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <mprotect>:
SYSCALL(mprotect)
    1362:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <munprotect>:
    136a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    
    1372:	66 90                	xchg   %ax,%ax
    1374:	66 90                	xchg   %ax,%ax
    1376:	66 90                	xchg   %ax,%ax
    1378:	66 90                	xchg   %ax,%ax
    137a:	66 90                	xchg   %ax,%ax
    137c:	66 90                	xchg   %ax,%ax
    137e:	66 90                	xchg   %ax,%ax

00001380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
    1384:	56                   	push   %esi
    1385:	53                   	push   %ebx
    1386:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1389:	85 d2                	test   %edx,%edx
{
    138b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    138e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1390:	79 76                	jns    1408 <printint+0x88>
    1392:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1396:	74 70                	je     1408 <printint+0x88>
    x = -xx;
    1398:	f7 d8                	neg    %eax
    neg = 1;
    139a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    13a1:	31 f6                	xor    %esi,%esi
    13a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13a6:	eb 0a                	jmp    13b2 <printint+0x32>
    13a8:	90                   	nop
    13a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    13b0:	89 fe                	mov    %edi,%esi
    13b2:	31 d2                	xor    %edx,%edx
    13b4:	8d 7e 01             	lea    0x1(%esi),%edi
    13b7:	f7 f1                	div    %ecx
    13b9:	0f b6 92 c0 17 00 00 	movzbl 0x17c0(%edx),%edx
  }while((x /= base) != 0);
    13c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    13c2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    13c5:	75 e9                	jne    13b0 <printint+0x30>
  if(neg)
    13c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13ca:	85 c0                	test   %eax,%eax
    13cc:	74 08                	je     13d6 <printint+0x56>
    buf[i++] = '-';
    13ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    13d3:	8d 7e 02             	lea    0x2(%esi),%edi
    13d6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    13da:	8b 7d c0             	mov    -0x40(%ebp),%edi
    13dd:	8d 76 00             	lea    0x0(%esi),%esi
    13e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    13e3:	83 ec 04             	sub    $0x4,%esp
    13e6:	83 ee 01             	sub    $0x1,%esi
    13e9:	6a 01                	push   $0x1
    13eb:	53                   	push   %ebx
    13ec:	57                   	push   %edi
    13ed:	88 45 d7             	mov    %al,-0x29(%ebp)
    13f0:	e8 cd fe ff ff       	call   12c2 <write>

  while(--i >= 0)
    13f5:	83 c4 10             	add    $0x10,%esp
    13f8:	39 de                	cmp    %ebx,%esi
    13fa:	75 e4                	jne    13e0 <printint+0x60>
    putc(fd, buf[i]);
}
    13fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13ff:	5b                   	pop    %ebx
    1400:	5e                   	pop    %esi
    1401:	5f                   	pop    %edi
    1402:	5d                   	pop    %ebp
    1403:	c3                   	ret    
    1404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1408:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    140f:	eb 90                	jmp    13a1 <printint+0x21>
    1411:	eb 0d                	jmp    1420 <printf>
    1413:	90                   	nop
    1414:	90                   	nop
    1415:	90                   	nop
    1416:	90                   	nop
    1417:	90                   	nop
    1418:	90                   	nop
    1419:	90                   	nop
    141a:	90                   	nop
    141b:	90                   	nop
    141c:	90                   	nop
    141d:	90                   	nop
    141e:	90                   	nop
    141f:	90                   	nop

00001420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1429:	8b 75 0c             	mov    0xc(%ebp),%esi
    142c:	0f b6 1e             	movzbl (%esi),%ebx
    142f:	84 db                	test   %bl,%bl
    1431:	0f 84 bf 00 00 00    	je     14f6 <printf+0xd6>
    1437:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    143a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    143d:	31 d2                	xor    %edx,%edx
    143f:	eb 39                	jmp    147a <printf+0x5a>
    1441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1448:	83 f8 25             	cmp    $0x25,%eax
    144b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    144e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1453:	74 1a                	je     146f <printf+0x4f>
  write(fd, &c, 1);
    1455:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1458:	83 ec 04             	sub    $0x4,%esp
    145b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    145e:	6a 01                	push   $0x1
    1460:	50                   	push   %eax
    1461:	ff 75 08             	pushl  0x8(%ebp)
    1464:	e8 59 fe ff ff       	call   12c2 <write>
    1469:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    146c:	83 c4 10             	add    $0x10,%esp
    146f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1472:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1476:	84 db                	test   %bl,%bl
    1478:	74 7c                	je     14f6 <printf+0xd6>
    if(state == 0){
    147a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    147c:	0f be cb             	movsbl %bl,%ecx
    147f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1482:	74 c4                	je     1448 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1484:	83 fa 25             	cmp    $0x25,%edx
    1487:	75 e6                	jne    146f <printf+0x4f>
      if(c == 'd'){
    1489:	83 f8 64             	cmp    $0x64,%eax
    148c:	0f 84 a6 00 00 00    	je     1538 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1492:	83 f8 6c             	cmp    $0x6c,%eax
    1495:	0f 84 ad 00 00 00    	je     1548 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    149b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14a1:	83 f9 70             	cmp    $0x70,%ecx
    14a4:	74 5a                	je     1500 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14a6:	83 f8 73             	cmp    $0x73,%eax
    14a9:	0f 84 e1 00 00 00    	je     1590 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14af:	83 f8 63             	cmp    $0x63,%eax
    14b2:	0f 84 28 01 00 00    	je     15e0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14b8:	83 f8 25             	cmp    $0x25,%eax
    14bb:	74 6b                	je     1528 <printf+0x108>
  write(fd, &c, 1);
    14bd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14c0:	83 ec 04             	sub    $0x4,%esp
    14c3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14c7:	6a 01                	push   $0x1
    14c9:	50                   	push   %eax
    14ca:	ff 75 08             	pushl  0x8(%ebp)
    14cd:	e8 f0 fd ff ff       	call   12c2 <write>
    14d2:	83 c4 0c             	add    $0xc,%esp
    14d5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14d8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14db:	6a 01                	push   $0x1
    14dd:	50                   	push   %eax
    14de:	ff 75 08             	pushl  0x8(%ebp)
    14e1:	83 c6 01             	add    $0x1,%esi
    14e4:	e8 d9 fd ff ff       	call   12c2 <write>
  for(i = 0; fmt[i]; i++){
    14e9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    14ed:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14f0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14f2:	84 db                	test   %bl,%bl
    14f4:	75 84                	jne    147a <printf+0x5a>
    }
  }
}
    14f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14f9:	5b                   	pop    %ebx
    14fa:	5e                   	pop    %esi
    14fb:	5f                   	pop    %edi
    14fc:	5d                   	pop    %ebp
    14fd:	c3                   	ret    
    14fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1500:	83 ec 0c             	sub    $0xc,%esp
    1503:	b9 10 00 00 00       	mov    $0x10,%ecx
    1508:	6a 00                	push   $0x0
    150a:	8b 17                	mov    (%edi),%edx
    150c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    150f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1512:	e8 69 fe ff ff       	call   1380 <printint>
    1517:	83 c4 10             	add    $0x10,%esp
      state = 0;
    151a:	31 d2                	xor    %edx,%edx
    151c:	e9 4e ff ff ff       	jmp    146f <printf+0x4f>
    1521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1528:	83 ec 04             	sub    $0x4,%esp
    152b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    152e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1531:	6a 01                	push   $0x1
    1533:	eb a8                	jmp    14dd <printf+0xbd>
    1535:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1538:	83 ec 0c             	sub    $0xc,%esp
    153b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1540:	6a 01                	push   $0x1
    1542:	eb c6                	jmp    150a <printf+0xea>
    1544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1548:	8b 57 04             	mov    0x4(%edi),%edx
    154b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    154d:	85 d2                	test   %edx,%edx
    154f:	74 15                	je     1566 <printf+0x146>
    1551:	83 ec 0c             	sub    $0xc,%esp
    1554:	8b 45 08             	mov    0x8(%ebp),%eax
    1557:	b9 10 00 00 00       	mov    $0x10,%ecx
    155c:	6a 00                	push   $0x0
    155e:	e8 1d fe ff ff       	call   1380 <printint>
    1563:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1566:	83 ec 0c             	sub    $0xc,%esp
    1569:	8b 45 08             	mov    0x8(%ebp),%eax
    156c:	89 da                	mov    %ebx,%edx
    156e:	6a 00                	push   $0x0
    1570:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1575:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1578:	e8 03 fe ff ff       	call   1380 <printint>
    157d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1580:	31 d2                	xor    %edx,%edx
    1582:	e9 e8 fe ff ff       	jmp    146f <printf+0x4f>
    1587:	89 f6                	mov    %esi,%esi
    1589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1590:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1592:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1595:	85 c9                	test   %ecx,%ecx
    1597:	74 6a                	je     1603 <printf+0x1e3>
        while(*s != 0){
    1599:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    159c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    159e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    15a0:	84 c0                	test   %al,%al
    15a2:	0f 84 c7 fe ff ff    	je     146f <printf+0x4f>
    15a8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15ab:	89 de                	mov    %ebx,%esi
    15ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    15b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15b6:	83 ec 04             	sub    $0x4,%esp
    15b9:	6a 01                	push   $0x1
          s++;
    15bb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    15be:	50                   	push   %eax
    15bf:	53                   	push   %ebx
    15c0:	e8 fd fc ff ff       	call   12c2 <write>
        while(*s != 0){
    15c5:	0f b6 06             	movzbl (%esi),%eax
    15c8:	83 c4 10             	add    $0x10,%esp
    15cb:	84 c0                	test   %al,%al
    15cd:	75 e1                	jne    15b0 <printf+0x190>
    15cf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15d2:	31 d2                	xor    %edx,%edx
    15d4:	e9 96 fe ff ff       	jmp    146f <printf+0x4f>
    15d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    15e0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    15e2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    15e5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    15e8:	6a 01                	push   $0x1
        putc(fd, *ap);
    15ea:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    15ed:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15f0:	50                   	push   %eax
    15f1:	ff 75 08             	pushl  0x8(%ebp)
    15f4:	e8 c9 fc ff ff       	call   12c2 <write>
    15f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15fc:	31 d2                	xor    %edx,%edx
    15fe:	e9 6c fe ff ff       	jmp    146f <printf+0x4f>
          s = "(null)";
    1603:	bb b8 17 00 00       	mov    $0x17b8,%ebx
        while(*s != 0){
    1608:	b8 28 00 00 00       	mov    $0x28,%eax
    160d:	eb 99                	jmp    15a8 <printf+0x188>
    160f:	90                   	nop

00001610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1611:	a1 64 1a 00 00       	mov    0x1a64,%eax
{
    1616:	89 e5                	mov    %esp,%ebp
    1618:	57                   	push   %edi
    1619:	56                   	push   %esi
    161a:	53                   	push   %ebx
    161b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    161e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1628:	39 c8                	cmp    %ecx,%eax
    162a:	8b 10                	mov    (%eax),%edx
    162c:	73 32                	jae    1660 <free+0x50>
    162e:	39 d1                	cmp    %edx,%ecx
    1630:	72 04                	jb     1636 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1632:	39 d0                	cmp    %edx,%eax
    1634:	72 32                	jb     1668 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1636:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1639:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    163c:	39 fa                	cmp    %edi,%edx
    163e:	74 30                	je     1670 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1640:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1643:	8b 50 04             	mov    0x4(%eax),%edx
    1646:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1649:	39 f1                	cmp    %esi,%ecx
    164b:	74 3a                	je     1687 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    164d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    164f:	a3 64 1a 00 00       	mov    %eax,0x1a64
}
    1654:	5b                   	pop    %ebx
    1655:	5e                   	pop    %esi
    1656:	5f                   	pop    %edi
    1657:	5d                   	pop    %ebp
    1658:	c3                   	ret    
    1659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1660:	39 d0                	cmp    %edx,%eax
    1662:	72 04                	jb     1668 <free+0x58>
    1664:	39 d1                	cmp    %edx,%ecx
    1666:	72 ce                	jb     1636 <free+0x26>
{
    1668:	89 d0                	mov    %edx,%eax
    166a:	eb bc                	jmp    1628 <free+0x18>
    166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1670:	03 72 04             	add    0x4(%edx),%esi
    1673:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1676:	8b 10                	mov    (%eax),%edx
    1678:	8b 12                	mov    (%edx),%edx
    167a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    167d:	8b 50 04             	mov    0x4(%eax),%edx
    1680:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1683:	39 f1                	cmp    %esi,%ecx
    1685:	75 c6                	jne    164d <free+0x3d>
    p->s.size += bp->s.size;
    1687:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    168a:	a3 64 1a 00 00       	mov    %eax,0x1a64
    p->s.size += bp->s.size;
    168f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1692:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1695:	89 10                	mov    %edx,(%eax)
}
    1697:	5b                   	pop    %ebx
    1698:	5e                   	pop    %esi
    1699:	5f                   	pop    %edi
    169a:	5d                   	pop    %ebp
    169b:	c3                   	ret    
    169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16a0:	55                   	push   %ebp
    16a1:	89 e5                	mov    %esp,%ebp
    16a3:	57                   	push   %edi
    16a4:	56                   	push   %esi
    16a5:	53                   	push   %ebx
    16a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16ac:	8b 15 64 1a 00 00    	mov    0x1a64,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16b2:	8d 78 07             	lea    0x7(%eax),%edi
    16b5:	c1 ef 03             	shr    $0x3,%edi
    16b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    16bb:	85 d2                	test   %edx,%edx
    16bd:	0f 84 9d 00 00 00    	je     1760 <malloc+0xc0>
    16c3:	8b 02                	mov    (%edx),%eax
    16c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16c8:	39 cf                	cmp    %ecx,%edi
    16ca:	76 6c                	jbe    1738 <malloc+0x98>
    16cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    16d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16d7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    16da:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    16e1:	eb 0e                	jmp    16f1 <malloc+0x51>
    16e3:	90                   	nop
    16e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16ea:	8b 48 04             	mov    0x4(%eax),%ecx
    16ed:	39 f9                	cmp    %edi,%ecx
    16ef:	73 47                	jae    1738 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16f1:	39 05 64 1a 00 00    	cmp    %eax,0x1a64
    16f7:	89 c2                	mov    %eax,%edx
    16f9:	75 ed                	jne    16e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16fb:	83 ec 0c             	sub    $0xc,%esp
    16fe:	56                   	push   %esi
    16ff:	e8 26 fc ff ff       	call   132a <sbrk>
  if(p == (char*)-1)
    1704:	83 c4 10             	add    $0x10,%esp
    1707:	83 f8 ff             	cmp    $0xffffffff,%eax
    170a:	74 1c                	je     1728 <malloc+0x88>
  hp->s.size = nu;
    170c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    170f:	83 ec 0c             	sub    $0xc,%esp
    1712:	83 c0 08             	add    $0x8,%eax
    1715:	50                   	push   %eax
    1716:	e8 f5 fe ff ff       	call   1610 <free>
  return freep;
    171b:	8b 15 64 1a 00 00    	mov    0x1a64,%edx
      if((p = morecore(nunits)) == 0)
    1721:	83 c4 10             	add    $0x10,%esp
    1724:	85 d2                	test   %edx,%edx
    1726:	75 c0                	jne    16e8 <malloc+0x48>
        return 0;
  }
}
    1728:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    172b:	31 c0                	xor    %eax,%eax
}
    172d:	5b                   	pop    %ebx
    172e:	5e                   	pop    %esi
    172f:	5f                   	pop    %edi
    1730:	5d                   	pop    %ebp
    1731:	c3                   	ret    
    1732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1738:	39 cf                	cmp    %ecx,%edi
    173a:	74 54                	je     1790 <malloc+0xf0>
        p->s.size -= nunits;
    173c:	29 f9                	sub    %edi,%ecx
    173e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1741:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1744:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1747:	89 15 64 1a 00 00    	mov    %edx,0x1a64
}
    174d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1750:	83 c0 08             	add    $0x8,%eax
}
    1753:	5b                   	pop    %ebx
    1754:	5e                   	pop    %esi
    1755:	5f                   	pop    %edi
    1756:	5d                   	pop    %ebp
    1757:	c3                   	ret    
    1758:	90                   	nop
    1759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1760:	c7 05 64 1a 00 00 68 	movl   $0x1a68,0x1a64
    1767:	1a 00 00 
    176a:	c7 05 68 1a 00 00 68 	movl   $0x1a68,0x1a68
    1771:	1a 00 00 
    base.s.size = 0;
    1774:	b8 68 1a 00 00       	mov    $0x1a68,%eax
    1779:	c7 05 6c 1a 00 00 00 	movl   $0x0,0x1a6c
    1780:	00 00 00 
    1783:	e9 44 ff ff ff       	jmp    16cc <malloc+0x2c>
    1788:	90                   	nop
    1789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1790:	8b 08                	mov    (%eax),%ecx
    1792:	89 0a                	mov    %ecx,(%edx)
    1794:	eb b1                	jmp    1747 <malloc+0xa7>
