
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
    1021:	68 88 17 00 00       	push   $0x1788
    1026:	6a 01                	push   $0x1
    1028:	e8 e3 03 00 00       	call   1410 <printf>
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
    103b:	68 9b 17 00 00       	push   $0x179b
    1040:	6a 01                	push   $0x1
    1042:	e8 c9 03 00 00       	call   1410 <printf>
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
    135a:	b8 19 00 00 00       	mov    $0x19,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    
    1362:	66 90                	xchg   %ax,%ax
    1364:	66 90                	xchg   %ax,%ax
    1366:	66 90                	xchg   %ax,%ax
    1368:	66 90                	xchg   %ax,%ax
    136a:	66 90                	xchg   %ax,%ax
    136c:	66 90                	xchg   %ax,%ax
    136e:	66 90                	xchg   %ax,%ax

00001370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	57                   	push   %edi
    1374:	56                   	push   %esi
    1375:	53                   	push   %ebx
    1376:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1379:	85 d2                	test   %edx,%edx
{
    137b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    137e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1380:	79 76                	jns    13f8 <printint+0x88>
    1382:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1386:	74 70                	je     13f8 <printint+0x88>
    x = -xx;
    1388:	f7 d8                	neg    %eax
    neg = 1;
    138a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1391:	31 f6                	xor    %esi,%esi
    1393:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1396:	eb 0a                	jmp    13a2 <printint+0x32>
    1398:	90                   	nop
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    13a0:	89 fe                	mov    %edi,%esi
    13a2:	31 d2                	xor    %edx,%edx
    13a4:	8d 7e 01             	lea    0x1(%esi),%edi
    13a7:	f7 f1                	div    %ecx
    13a9:	0f b6 92 b0 17 00 00 	movzbl 0x17b0(%edx),%edx
  }while((x /= base) != 0);
    13b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    13b2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    13b5:	75 e9                	jne    13a0 <printint+0x30>
  if(neg)
    13b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13ba:	85 c0                	test   %eax,%eax
    13bc:	74 08                	je     13c6 <printint+0x56>
    buf[i++] = '-';
    13be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    13c3:	8d 7e 02             	lea    0x2(%esi),%edi
    13c6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    13ca:	8b 7d c0             	mov    -0x40(%ebp),%edi
    13cd:	8d 76 00             	lea    0x0(%esi),%esi
    13d0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    13d3:	83 ec 04             	sub    $0x4,%esp
    13d6:	83 ee 01             	sub    $0x1,%esi
    13d9:	6a 01                	push   $0x1
    13db:	53                   	push   %ebx
    13dc:	57                   	push   %edi
    13dd:	88 45 d7             	mov    %al,-0x29(%ebp)
    13e0:	e8 dd fe ff ff       	call   12c2 <write>

  while(--i >= 0)
    13e5:	83 c4 10             	add    $0x10,%esp
    13e8:	39 de                	cmp    %ebx,%esi
    13ea:	75 e4                	jne    13d0 <printint+0x60>
    putc(fd, buf[i]);
}
    13ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13ef:	5b                   	pop    %ebx
    13f0:	5e                   	pop    %esi
    13f1:	5f                   	pop    %edi
    13f2:	5d                   	pop    %ebp
    13f3:	c3                   	ret    
    13f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13f8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13ff:	eb 90                	jmp    1391 <printint+0x21>
    1401:	eb 0d                	jmp    1410 <printf>
    1403:	90                   	nop
    1404:	90                   	nop
    1405:	90                   	nop
    1406:	90                   	nop
    1407:	90                   	nop
    1408:	90                   	nop
    1409:	90                   	nop
    140a:	90                   	nop
    140b:	90                   	nop
    140c:	90                   	nop
    140d:	90                   	nop
    140e:	90                   	nop
    140f:	90                   	nop

00001410 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	56                   	push   %esi
    1415:	53                   	push   %ebx
    1416:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1419:	8b 75 0c             	mov    0xc(%ebp),%esi
    141c:	0f b6 1e             	movzbl (%esi),%ebx
    141f:	84 db                	test   %bl,%bl
    1421:	0f 84 bf 00 00 00    	je     14e6 <printf+0xd6>
    1427:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    142a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    142d:	31 d2                	xor    %edx,%edx
    142f:	eb 39                	jmp    146a <printf+0x5a>
    1431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1438:	83 f8 25             	cmp    $0x25,%eax
    143b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    143e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1443:	74 1a                	je     145f <printf+0x4f>
  write(fd, &c, 1);
    1445:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1448:	83 ec 04             	sub    $0x4,%esp
    144b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    144e:	6a 01                	push   $0x1
    1450:	50                   	push   %eax
    1451:	ff 75 08             	pushl  0x8(%ebp)
    1454:	e8 69 fe ff ff       	call   12c2 <write>
    1459:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    145c:	83 c4 10             	add    $0x10,%esp
    145f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1462:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1466:	84 db                	test   %bl,%bl
    1468:	74 7c                	je     14e6 <printf+0xd6>
    if(state == 0){
    146a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    146c:	0f be cb             	movsbl %bl,%ecx
    146f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1472:	74 c4                	je     1438 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1474:	83 fa 25             	cmp    $0x25,%edx
    1477:	75 e6                	jne    145f <printf+0x4f>
      if(c == 'd'){
    1479:	83 f8 64             	cmp    $0x64,%eax
    147c:	0f 84 a6 00 00 00    	je     1528 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1482:	83 f8 6c             	cmp    $0x6c,%eax
    1485:	0f 84 ad 00 00 00    	je     1538 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    148b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1491:	83 f9 70             	cmp    $0x70,%ecx
    1494:	74 5a                	je     14f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1496:	83 f8 73             	cmp    $0x73,%eax
    1499:	0f 84 e1 00 00 00    	je     1580 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    149f:	83 f8 63             	cmp    $0x63,%eax
    14a2:	0f 84 28 01 00 00    	je     15d0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14a8:	83 f8 25             	cmp    $0x25,%eax
    14ab:	74 6b                	je     1518 <printf+0x108>
  write(fd, &c, 1);
    14ad:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14b0:	83 ec 04             	sub    $0x4,%esp
    14b3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14b7:	6a 01                	push   $0x1
    14b9:	50                   	push   %eax
    14ba:	ff 75 08             	pushl  0x8(%ebp)
    14bd:	e8 00 fe ff ff       	call   12c2 <write>
    14c2:	83 c4 0c             	add    $0xc,%esp
    14c5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14c8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14cb:	6a 01                	push   $0x1
    14cd:	50                   	push   %eax
    14ce:	ff 75 08             	pushl  0x8(%ebp)
    14d1:	83 c6 01             	add    $0x1,%esi
    14d4:	e8 e9 fd ff ff       	call   12c2 <write>
  for(i = 0; fmt[i]; i++){
    14d9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    14dd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14e0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14e2:	84 db                	test   %bl,%bl
    14e4:	75 84                	jne    146a <printf+0x5a>
    }
  }
}
    14e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14e9:	5b                   	pop    %ebx
    14ea:	5e                   	pop    %esi
    14eb:	5f                   	pop    %edi
    14ec:	5d                   	pop    %ebp
    14ed:	c3                   	ret    
    14ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14f0:	83 ec 0c             	sub    $0xc,%esp
    14f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14f8:	6a 00                	push   $0x0
    14fa:	8b 17                	mov    (%edi),%edx
    14fc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    14ff:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1502:	e8 69 fe ff ff       	call   1370 <printint>
    1507:	83 c4 10             	add    $0x10,%esp
      state = 0;
    150a:	31 d2                	xor    %edx,%edx
    150c:	e9 4e ff ff ff       	jmp    145f <printf+0x4f>
    1511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1518:	83 ec 04             	sub    $0x4,%esp
    151b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    151e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1521:	6a 01                	push   $0x1
    1523:	eb a8                	jmp    14cd <printf+0xbd>
    1525:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1528:	83 ec 0c             	sub    $0xc,%esp
    152b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1530:	6a 01                	push   $0x1
    1532:	eb c6                	jmp    14fa <printf+0xea>
    1534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1538:	8b 57 04             	mov    0x4(%edi),%edx
    153b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    153d:	85 d2                	test   %edx,%edx
    153f:	74 15                	je     1556 <printf+0x146>
    1541:	83 ec 0c             	sub    $0xc,%esp
    1544:	8b 45 08             	mov    0x8(%ebp),%eax
    1547:	b9 10 00 00 00       	mov    $0x10,%ecx
    154c:	6a 00                	push   $0x0
    154e:	e8 1d fe ff ff       	call   1370 <printint>
    1553:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1556:	83 ec 0c             	sub    $0xc,%esp
    1559:	8b 45 08             	mov    0x8(%ebp),%eax
    155c:	89 da                	mov    %ebx,%edx
    155e:	6a 00                	push   $0x0
    1560:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1565:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1568:	e8 03 fe ff ff       	call   1370 <printint>
    156d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1570:	31 d2                	xor    %edx,%edx
    1572:	e9 e8 fe ff ff       	jmp    145f <printf+0x4f>
    1577:	89 f6                	mov    %esi,%esi
    1579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1580:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1582:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1585:	85 c9                	test   %ecx,%ecx
    1587:	74 6a                	je     15f3 <printf+0x1e3>
        while(*s != 0){
    1589:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    158c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    158e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1590:	84 c0                	test   %al,%al
    1592:	0f 84 c7 fe ff ff    	je     145f <printf+0x4f>
    1598:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    159b:	89 de                	mov    %ebx,%esi
    159d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15a0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    15a3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15a6:	83 ec 04             	sub    $0x4,%esp
    15a9:	6a 01                	push   $0x1
          s++;
    15ab:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    15ae:	50                   	push   %eax
    15af:	53                   	push   %ebx
    15b0:	e8 0d fd ff ff       	call   12c2 <write>
        while(*s != 0){
    15b5:	0f b6 06             	movzbl (%esi),%eax
    15b8:	83 c4 10             	add    $0x10,%esp
    15bb:	84 c0                	test   %al,%al
    15bd:	75 e1                	jne    15a0 <printf+0x190>
    15bf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15c2:	31 d2                	xor    %edx,%edx
    15c4:	e9 96 fe ff ff       	jmp    145f <printf+0x4f>
    15c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    15d0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    15d2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    15d5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    15d8:	6a 01                	push   $0x1
        putc(fd, *ap);
    15da:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    15dd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15e0:	50                   	push   %eax
    15e1:	ff 75 08             	pushl  0x8(%ebp)
    15e4:	e8 d9 fc ff ff       	call   12c2 <write>
    15e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15ec:	31 d2                	xor    %edx,%edx
    15ee:	e9 6c fe ff ff       	jmp    145f <printf+0x4f>
          s = "(null)";
    15f3:	bb a8 17 00 00       	mov    $0x17a8,%ebx
        while(*s != 0){
    15f8:	b8 28 00 00 00       	mov    $0x28,%eax
    15fd:	eb 99                	jmp    1598 <printf+0x188>
    15ff:	90                   	nop

00001600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1601:	a1 54 1a 00 00       	mov    0x1a54,%eax
{
    1606:	89 e5                	mov    %esp,%ebp
    1608:	57                   	push   %edi
    1609:	56                   	push   %esi
    160a:	53                   	push   %ebx
    160b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    160e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1618:	39 c8                	cmp    %ecx,%eax
    161a:	8b 10                	mov    (%eax),%edx
    161c:	73 32                	jae    1650 <free+0x50>
    161e:	39 d1                	cmp    %edx,%ecx
    1620:	72 04                	jb     1626 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1622:	39 d0                	cmp    %edx,%eax
    1624:	72 32                	jb     1658 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1626:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1629:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    162c:	39 fa                	cmp    %edi,%edx
    162e:	74 30                	je     1660 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1630:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1633:	8b 50 04             	mov    0x4(%eax),%edx
    1636:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1639:	39 f1                	cmp    %esi,%ecx
    163b:	74 3a                	je     1677 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    163d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    163f:	a3 54 1a 00 00       	mov    %eax,0x1a54
}
    1644:	5b                   	pop    %ebx
    1645:	5e                   	pop    %esi
    1646:	5f                   	pop    %edi
    1647:	5d                   	pop    %ebp
    1648:	c3                   	ret    
    1649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1650:	39 d0                	cmp    %edx,%eax
    1652:	72 04                	jb     1658 <free+0x58>
    1654:	39 d1                	cmp    %edx,%ecx
    1656:	72 ce                	jb     1626 <free+0x26>
{
    1658:	89 d0                	mov    %edx,%eax
    165a:	eb bc                	jmp    1618 <free+0x18>
    165c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1660:	03 72 04             	add    0x4(%edx),%esi
    1663:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1666:	8b 10                	mov    (%eax),%edx
    1668:	8b 12                	mov    (%edx),%edx
    166a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    166d:	8b 50 04             	mov    0x4(%eax),%edx
    1670:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1673:	39 f1                	cmp    %esi,%ecx
    1675:	75 c6                	jne    163d <free+0x3d>
    p->s.size += bp->s.size;
    1677:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    167a:	a3 54 1a 00 00       	mov    %eax,0x1a54
    p->s.size += bp->s.size;
    167f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1682:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1685:	89 10                	mov    %edx,(%eax)
}
    1687:	5b                   	pop    %ebx
    1688:	5e                   	pop    %esi
    1689:	5f                   	pop    %edi
    168a:	5d                   	pop    %ebp
    168b:	c3                   	ret    
    168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1690:	55                   	push   %ebp
    1691:	89 e5                	mov    %esp,%ebp
    1693:	57                   	push   %edi
    1694:	56                   	push   %esi
    1695:	53                   	push   %ebx
    1696:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1699:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    169c:	8b 15 54 1a 00 00    	mov    0x1a54,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16a2:	8d 78 07             	lea    0x7(%eax),%edi
    16a5:	c1 ef 03             	shr    $0x3,%edi
    16a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    16ab:	85 d2                	test   %edx,%edx
    16ad:	0f 84 9d 00 00 00    	je     1750 <malloc+0xc0>
    16b3:	8b 02                	mov    (%edx),%eax
    16b5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16b8:	39 cf                	cmp    %ecx,%edi
    16ba:	76 6c                	jbe    1728 <malloc+0x98>
    16bc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    16c2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16c7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    16ca:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    16d1:	eb 0e                	jmp    16e1 <malloc+0x51>
    16d3:	90                   	nop
    16d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16da:	8b 48 04             	mov    0x4(%eax),%ecx
    16dd:	39 f9                	cmp    %edi,%ecx
    16df:	73 47                	jae    1728 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16e1:	39 05 54 1a 00 00    	cmp    %eax,0x1a54
    16e7:	89 c2                	mov    %eax,%edx
    16e9:	75 ed                	jne    16d8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16eb:	83 ec 0c             	sub    $0xc,%esp
    16ee:	56                   	push   %esi
    16ef:	e8 36 fc ff ff       	call   132a <sbrk>
  if(p == (char*)-1)
    16f4:	83 c4 10             	add    $0x10,%esp
    16f7:	83 f8 ff             	cmp    $0xffffffff,%eax
    16fa:	74 1c                	je     1718 <malloc+0x88>
  hp->s.size = nu;
    16fc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16ff:	83 ec 0c             	sub    $0xc,%esp
    1702:	83 c0 08             	add    $0x8,%eax
    1705:	50                   	push   %eax
    1706:	e8 f5 fe ff ff       	call   1600 <free>
  return freep;
    170b:	8b 15 54 1a 00 00    	mov    0x1a54,%edx
      if((p = morecore(nunits)) == 0)
    1711:	83 c4 10             	add    $0x10,%esp
    1714:	85 d2                	test   %edx,%edx
    1716:	75 c0                	jne    16d8 <malloc+0x48>
        return 0;
  }
}
    1718:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    171b:	31 c0                	xor    %eax,%eax
}
    171d:	5b                   	pop    %ebx
    171e:	5e                   	pop    %esi
    171f:	5f                   	pop    %edi
    1720:	5d                   	pop    %ebp
    1721:	c3                   	ret    
    1722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1728:	39 cf                	cmp    %ecx,%edi
    172a:	74 54                	je     1780 <malloc+0xf0>
        p->s.size -= nunits;
    172c:	29 f9                	sub    %edi,%ecx
    172e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1731:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1734:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1737:	89 15 54 1a 00 00    	mov    %edx,0x1a54
}
    173d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1740:	83 c0 08             	add    $0x8,%eax
}
    1743:	5b                   	pop    %ebx
    1744:	5e                   	pop    %esi
    1745:	5f                   	pop    %edi
    1746:	5d                   	pop    %ebp
    1747:	c3                   	ret    
    1748:	90                   	nop
    1749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1750:	c7 05 54 1a 00 00 58 	movl   $0x1a58,0x1a54
    1757:	1a 00 00 
    175a:	c7 05 58 1a 00 00 58 	movl   $0x1a58,0x1a58
    1761:	1a 00 00 
    base.s.size = 0;
    1764:	b8 58 1a 00 00       	mov    $0x1a58,%eax
    1769:	c7 05 5c 1a 00 00 00 	movl   $0x0,0x1a5c
    1770:	00 00 00 
    1773:	e9 44 ff ff ff       	jmp    16bc <malloc+0x2c>
    1778:	90                   	nop
    1779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1780:	8b 08                	mov    (%eax),%ecx
    1782:	89 0a                	mov    %ecx,(%edx)
    1784:	eb b1                	jmp    1737 <malloc+0xa7>
