
_sched_test:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "user.h"
#include "date.h"
int main(int argc, char* argv[]){
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 10             	sub    $0x10,%esp
    1011:	8b 41 04             	mov    0x4(%ecx),%eax
    
    int tickets_number = atoi(argv[1]);
    1014:	ff 70 04             	pushl  0x4(%eax)
    1017:	e8 f4 01 00 00       	call   1210 <atoi>
    settickets(tickets_number);
    101c:	89 04 24             	mov    %eax,(%esp)
    101f:	e8 0e 03 00 00       	call   1332 <settickets>
    1024:	83 c4 10             	add    $0x10,%esp
    1027:	eb fe                	jmp    1027 <main+0x27>
    1029:	66 90                	xchg   %ax,%ax
    102b:	66 90                	xchg   %ax,%ax
    102d:	66 90                	xchg   %ax,%ax
    102f:	90                   	nop

00001030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	53                   	push   %ebx
    1034:	8b 45 08             	mov    0x8(%ebp),%eax
    1037:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    103a:	89 c2                	mov    %eax,%edx
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1040:	83 c1 01             	add    $0x1,%ecx
    1043:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1047:	83 c2 01             	add    $0x1,%edx
    104a:	84 db                	test   %bl,%bl
    104c:	88 5a ff             	mov    %bl,-0x1(%edx)
    104f:	75 ef                	jne    1040 <strcpy+0x10>
    ;
  return os;
}
    1051:	5b                   	pop    %ebx
    1052:	5d                   	pop    %ebp
    1053:	c3                   	ret    
    1054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    105a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 55 08             	mov    0x8(%ebp),%edx
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    106a:	0f b6 02             	movzbl (%edx),%eax
    106d:	0f b6 19             	movzbl (%ecx),%ebx
    1070:	84 c0                	test   %al,%al
    1072:	75 1c                	jne    1090 <strcmp+0x30>
    1074:	eb 2a                	jmp    10a0 <strcmp+0x40>
    1076:	8d 76 00             	lea    0x0(%esi),%esi
    1079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1080:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1083:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1086:	83 c1 01             	add    $0x1,%ecx
    1089:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    108c:	84 c0                	test   %al,%al
    108e:	74 10                	je     10a0 <strcmp+0x40>
    1090:	38 d8                	cmp    %bl,%al
    1092:	74 ec                	je     1080 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1094:	29 d8                	sub    %ebx,%eax
}
    1096:	5b                   	pop    %ebx
    1097:	5d                   	pop    %ebp
    1098:	c3                   	ret    
    1099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10a2:	29 d8                	sub    %ebx,%eax
}
    10a4:	5b                   	pop    %ebx
    10a5:	5d                   	pop    %ebp
    10a6:	c3                   	ret    
    10a7:	89 f6                	mov    %esi,%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010b0 <strlen>:

uint
strlen(const char *s)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10b6:	80 39 00             	cmpb   $0x0,(%ecx)
    10b9:	74 15                	je     10d0 <strlen+0x20>
    10bb:	31 d2                	xor    %edx,%edx
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    10c0:	83 c2 01             	add    $0x1,%edx
    10c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10c7:	89 d0                	mov    %edx,%eax
    10c9:	75 f5                	jne    10c0 <strlen+0x10>
    ;
  return n;
}
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    10d0:	31 c0                	xor    %eax,%eax
}
    10d2:	5d                   	pop    %ebp
    10d3:	c3                   	ret    
    10d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ed:	89 d7                	mov    %edx,%edi
    10ef:	fc                   	cld    
    10f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10f2:	89 d0                	mov    %edx,%eax
    10f4:	5f                   	pop    %edi
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strchr>:

char*
strchr(const char *s, char c)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	8b 45 08             	mov    0x8(%ebp),%eax
    1107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    110a:	0f b6 10             	movzbl (%eax),%edx
    110d:	84 d2                	test   %dl,%dl
    110f:	74 1d                	je     112e <strchr+0x2e>
    if(*s == c)
    1111:	38 d3                	cmp    %dl,%bl
    1113:	89 d9                	mov    %ebx,%ecx
    1115:	75 0d                	jne    1124 <strchr+0x24>
    1117:	eb 17                	jmp    1130 <strchr+0x30>
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1120:	38 ca                	cmp    %cl,%dl
    1122:	74 0c                	je     1130 <strchr+0x30>
  for(; *s; s++)
    1124:	83 c0 01             	add    $0x1,%eax
    1127:	0f b6 10             	movzbl (%eax),%edx
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strchr+0x20>
      return (char*)s;
  return 0;
    112e:	31 c0                	xor    %eax,%eax
}
    1130:	5b                   	pop    %ebx
    1131:	5d                   	pop    %ebp
    1132:	c3                   	ret    
    1133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <gets>:

char*
gets(char *buf, int max)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
    1145:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1146:	31 f6                	xor    %esi,%esi
    1148:	89 f3                	mov    %esi,%ebx
{
    114a:	83 ec 1c             	sub    $0x1c,%esp
    114d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1150:	eb 2f                	jmp    1181 <gets+0x41>
    1152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1158:	8d 45 e7             	lea    -0x19(%ebp),%eax
    115b:	83 ec 04             	sub    $0x4,%esp
    115e:	6a 01                	push   $0x1
    1160:	50                   	push   %eax
    1161:	6a 00                	push   $0x0
    1163:	e8 32 01 00 00       	call   129a <read>
    if(cc < 1)
    1168:	83 c4 10             	add    $0x10,%esp
    116b:	85 c0                	test   %eax,%eax
    116d:	7e 1c                	jle    118b <gets+0x4b>
      break;
    buf[i++] = c;
    116f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1173:	83 c7 01             	add    $0x1,%edi
    1176:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1179:	3c 0a                	cmp    $0xa,%al
    117b:	74 23                	je     11a0 <gets+0x60>
    117d:	3c 0d                	cmp    $0xd,%al
    117f:	74 1f                	je     11a0 <gets+0x60>
  for(i=0; i+1 < max; ){
    1181:	83 c3 01             	add    $0x1,%ebx
    1184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1187:	89 fe                	mov    %edi,%esi
    1189:	7c cd                	jl     1158 <gets+0x18>
    118b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    118d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1190:	c6 03 00             	movb   $0x0,(%ebx)
}
    1193:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1196:	5b                   	pop    %ebx
    1197:	5e                   	pop    %esi
    1198:	5f                   	pop    %edi
    1199:	5d                   	pop    %ebp
    119a:	c3                   	ret    
    119b:	90                   	nop
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11a0:	8b 75 08             	mov    0x8(%ebp),%esi
    11a3:	8b 45 08             	mov    0x8(%ebp),%eax
    11a6:	01 de                	add    %ebx,%esi
    11a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11aa:	c6 03 00             	movb   $0x0,(%ebx)
}
    11ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11b0:	5b                   	pop    %ebx
    11b1:	5e                   	pop    %esi
    11b2:	5f                   	pop    %edi
    11b3:	5d                   	pop    %ebp
    11b4:	c3                   	ret    
    11b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	56                   	push   %esi
    11c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11c5:	83 ec 08             	sub    $0x8,%esp
    11c8:	6a 00                	push   $0x0
    11ca:	ff 75 08             	pushl  0x8(%ebp)
    11cd:	e8 f0 00 00 00       	call   12c2 <open>
  if(fd < 0)
    11d2:	83 c4 10             	add    $0x10,%esp
    11d5:	85 c0                	test   %eax,%eax
    11d7:	78 27                	js     1200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11d9:	83 ec 08             	sub    $0x8,%esp
    11dc:	ff 75 0c             	pushl  0xc(%ebp)
    11df:	89 c3                	mov    %eax,%ebx
    11e1:	50                   	push   %eax
    11e2:	e8 f3 00 00 00       	call   12da <fstat>
  close(fd);
    11e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11ea:	89 c6                	mov    %eax,%esi
  close(fd);
    11ec:	e8 b9 00 00 00       	call   12aa <close>
  return r;
    11f1:	83 c4 10             	add    $0x10,%esp
}
    11f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11f7:	89 f0                	mov    %esi,%eax
    11f9:	5b                   	pop    %ebx
    11fa:	5e                   	pop    %esi
    11fb:	5d                   	pop    %ebp
    11fc:	c3                   	ret    
    11fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1200:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1205:	eb ed                	jmp    11f4 <stat+0x34>
    1207:	89 f6                	mov    %esi,%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <atoi>:

int
atoi(const char *s)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1217:	0f be 11             	movsbl (%ecx),%edx
    121a:	8d 42 d0             	lea    -0x30(%edx),%eax
    121d:	3c 09                	cmp    $0x9,%al
  n = 0;
    121f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1224:	77 1f                	ja     1245 <atoi+0x35>
    1226:	8d 76 00             	lea    0x0(%esi),%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1230:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1233:	83 c1 01             	add    $0x1,%ecx
    1236:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    123a:	0f be 11             	movsbl (%ecx),%edx
    123d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1240:	80 fb 09             	cmp    $0x9,%bl
    1243:	76 eb                	jbe    1230 <atoi+0x20>
  return n;
}
    1245:	5b                   	pop    %ebx
    1246:	5d                   	pop    %ebp
    1247:	c3                   	ret    
    1248:	90                   	nop
    1249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	56                   	push   %esi
    1254:	53                   	push   %ebx
    1255:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1258:	8b 45 08             	mov    0x8(%ebp),%eax
    125b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    125e:	85 db                	test   %ebx,%ebx
    1260:	7e 14                	jle    1276 <memmove+0x26>
    1262:	31 d2                	xor    %edx,%edx
    1264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1268:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    126c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    126f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1272:	39 d3                	cmp    %edx,%ebx
    1274:	75 f2                	jne    1268 <memmove+0x18>
  return vdst;
}
    1276:	5b                   	pop    %ebx
    1277:	5e                   	pop    %esi
    1278:	5d                   	pop    %ebp
    1279:	c3                   	ret    

0000127a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    127a:	b8 01 00 00 00       	mov    $0x1,%eax
    127f:	cd 40                	int    $0x40
    1281:	c3                   	ret    

00001282 <exit>:
SYSCALL(exit)
    1282:	b8 02 00 00 00       	mov    $0x2,%eax
    1287:	cd 40                	int    $0x40
    1289:	c3                   	ret    

0000128a <wait>:
SYSCALL(wait)
    128a:	b8 03 00 00 00       	mov    $0x3,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <pipe>:
SYSCALL(pipe)
    1292:	b8 04 00 00 00       	mov    $0x4,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <read>:
SYSCALL(read)
    129a:	b8 05 00 00 00       	mov    $0x5,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <write>:
SYSCALL(write)
    12a2:	b8 10 00 00 00       	mov    $0x10,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <close>:
SYSCALL(close)
    12aa:	b8 15 00 00 00       	mov    $0x15,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <kill>:
SYSCALL(kill)
    12b2:	b8 06 00 00 00       	mov    $0x6,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <exec>:
SYSCALL(exec)
    12ba:	b8 07 00 00 00       	mov    $0x7,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <open>:
SYSCALL(open)
    12c2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <mknod>:
SYSCALL(mknod)
    12ca:	b8 11 00 00 00       	mov    $0x11,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <unlink>:
SYSCALL(unlink)
    12d2:	b8 12 00 00 00       	mov    $0x12,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <fstat>:
SYSCALL(fstat)
    12da:	b8 08 00 00 00       	mov    $0x8,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <link>:
SYSCALL(link)
    12e2:	b8 13 00 00 00       	mov    $0x13,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <mkdir>:
SYSCALL(mkdir)
    12ea:	b8 14 00 00 00       	mov    $0x14,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <chdir>:
SYSCALL(chdir)
    12f2:	b8 09 00 00 00       	mov    $0x9,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <dup>:
SYSCALL(dup)
    12fa:	b8 0a 00 00 00       	mov    $0xa,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <getpid>:
SYSCALL(getpid)
    1302:	b8 0b 00 00 00       	mov    $0xb,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <sbrk>:
SYSCALL(sbrk)
    130a:	b8 0c 00 00 00       	mov    $0xc,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <sleep>:
SYSCALL(sleep)
    1312:	b8 0d 00 00 00       	mov    $0xd,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <uptime>:
SYSCALL(uptime)
    131a:	b8 0e 00 00 00       	mov    $0xe,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <getreadcount>:
SYSCALL(getreadcount)
    1322:	b8 16 00 00 00       	mov    $0x16,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <gettime>:
SYSCALL(gettime)
    132a:	b8 17 00 00 00       	mov    $0x17,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <settickets>:
SYSCALL(settickets)
    1332:	b8 18 00 00 00       	mov    $0x18,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <getpinfo>:
SYSCALL(getpinfo)
    133a:	b8 19 00 00 00       	mov    $0x19,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <mprotect>:
SYSCALL(mprotect)
    1342:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <munprotect>:
    134a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    
    1352:	66 90                	xchg   %ax,%ax
    1354:	66 90                	xchg   %ax,%ax
    1356:	66 90                	xchg   %ax,%ax
    1358:	66 90                	xchg   %ax,%ax
    135a:	66 90                	xchg   %ax,%ax
    135c:	66 90                	xchg   %ax,%ax
    135e:	66 90                	xchg   %ax,%ax

00001360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	57                   	push   %edi
    1364:	56                   	push   %esi
    1365:	53                   	push   %ebx
    1366:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1369:	85 d2                	test   %edx,%edx
{
    136b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    136e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1370:	79 76                	jns    13e8 <printint+0x88>
    1372:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1376:	74 70                	je     13e8 <printint+0x88>
    x = -xx;
    1378:	f7 d8                	neg    %eax
    neg = 1;
    137a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1381:	31 f6                	xor    %esi,%esi
    1383:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1386:	eb 0a                	jmp    1392 <printint+0x32>
    1388:	90                   	nop
    1389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1390:	89 fe                	mov    %edi,%esi
    1392:	31 d2                	xor    %edx,%edx
    1394:	8d 7e 01             	lea    0x1(%esi),%edi
    1397:	f7 f1                	div    %ecx
    1399:	0f b6 92 80 17 00 00 	movzbl 0x1780(%edx),%edx
  }while((x /= base) != 0);
    13a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    13a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    13a5:	75 e9                	jne    1390 <printint+0x30>
  if(neg)
    13a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13aa:	85 c0                	test   %eax,%eax
    13ac:	74 08                	je     13b6 <printint+0x56>
    buf[i++] = '-';
    13ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    13b3:	8d 7e 02             	lea    0x2(%esi),%edi
    13b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    13ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
    13bd:	8d 76 00             	lea    0x0(%esi),%esi
    13c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    13c3:	83 ec 04             	sub    $0x4,%esp
    13c6:	83 ee 01             	sub    $0x1,%esi
    13c9:	6a 01                	push   $0x1
    13cb:	53                   	push   %ebx
    13cc:	57                   	push   %edi
    13cd:	88 45 d7             	mov    %al,-0x29(%ebp)
    13d0:	e8 cd fe ff ff       	call   12a2 <write>

  while(--i >= 0)
    13d5:	83 c4 10             	add    $0x10,%esp
    13d8:	39 de                	cmp    %ebx,%esi
    13da:	75 e4                	jne    13c0 <printint+0x60>
    putc(fd, buf[i]);
}
    13dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13df:	5b                   	pop    %ebx
    13e0:	5e                   	pop    %esi
    13e1:	5f                   	pop    %edi
    13e2:	5d                   	pop    %ebp
    13e3:	c3                   	ret    
    13e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13ef:	eb 90                	jmp    1381 <printint+0x21>
    13f1:	eb 0d                	jmp    1400 <printf>
    13f3:	90                   	nop
    13f4:	90                   	nop
    13f5:	90                   	nop
    13f6:	90                   	nop
    13f7:	90                   	nop
    13f8:	90                   	nop
    13f9:	90                   	nop
    13fa:	90                   	nop
    13fb:	90                   	nop
    13fc:	90                   	nop
    13fd:	90                   	nop
    13fe:	90                   	nop
    13ff:	90                   	nop

00001400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	56                   	push   %esi
    1405:	53                   	push   %ebx
    1406:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1409:	8b 75 0c             	mov    0xc(%ebp),%esi
    140c:	0f b6 1e             	movzbl (%esi),%ebx
    140f:	84 db                	test   %bl,%bl
    1411:	0f 84 bf 00 00 00    	je     14d6 <printf+0xd6>
    1417:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    141a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    141d:	31 d2                	xor    %edx,%edx
    141f:	eb 39                	jmp    145a <printf+0x5a>
    1421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1428:	83 f8 25             	cmp    $0x25,%eax
    142b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    142e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1433:	74 1a                	je     144f <printf+0x4f>
  write(fd, &c, 1);
    1435:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1438:	83 ec 04             	sub    $0x4,%esp
    143b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    143e:	6a 01                	push   $0x1
    1440:	50                   	push   %eax
    1441:	ff 75 08             	pushl  0x8(%ebp)
    1444:	e8 59 fe ff ff       	call   12a2 <write>
    1449:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    144c:	83 c4 10             	add    $0x10,%esp
    144f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1452:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1456:	84 db                	test   %bl,%bl
    1458:	74 7c                	je     14d6 <printf+0xd6>
    if(state == 0){
    145a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    145c:	0f be cb             	movsbl %bl,%ecx
    145f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1462:	74 c4                	je     1428 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1464:	83 fa 25             	cmp    $0x25,%edx
    1467:	75 e6                	jne    144f <printf+0x4f>
      if(c == 'd'){
    1469:	83 f8 64             	cmp    $0x64,%eax
    146c:	0f 84 a6 00 00 00    	je     1518 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1472:	83 f8 6c             	cmp    $0x6c,%eax
    1475:	0f 84 ad 00 00 00    	je     1528 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    147b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1481:	83 f9 70             	cmp    $0x70,%ecx
    1484:	74 5a                	je     14e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1486:	83 f8 73             	cmp    $0x73,%eax
    1489:	0f 84 e1 00 00 00    	je     1570 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    148f:	83 f8 63             	cmp    $0x63,%eax
    1492:	0f 84 28 01 00 00    	je     15c0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1498:	83 f8 25             	cmp    $0x25,%eax
    149b:	74 6b                	je     1508 <printf+0x108>
  write(fd, &c, 1);
    149d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14a0:	83 ec 04             	sub    $0x4,%esp
    14a3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14a7:	6a 01                	push   $0x1
    14a9:	50                   	push   %eax
    14aa:	ff 75 08             	pushl  0x8(%ebp)
    14ad:	e8 f0 fd ff ff       	call   12a2 <write>
    14b2:	83 c4 0c             	add    $0xc,%esp
    14b5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14b8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14bb:	6a 01                	push   $0x1
    14bd:	50                   	push   %eax
    14be:	ff 75 08             	pushl  0x8(%ebp)
    14c1:	83 c6 01             	add    $0x1,%esi
    14c4:	e8 d9 fd ff ff       	call   12a2 <write>
  for(i = 0; fmt[i]; i++){
    14c9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    14cd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14d0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14d2:	84 db                	test   %bl,%bl
    14d4:	75 84                	jne    145a <printf+0x5a>
    }
  }
}
    14d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14d9:	5b                   	pop    %ebx
    14da:	5e                   	pop    %esi
    14db:	5f                   	pop    %edi
    14dc:	5d                   	pop    %ebp
    14dd:	c3                   	ret    
    14de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14e0:	83 ec 0c             	sub    $0xc,%esp
    14e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14e8:	6a 00                	push   $0x0
    14ea:	8b 17                	mov    (%edi),%edx
    14ec:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    14ef:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    14f2:	e8 69 fe ff ff       	call   1360 <printint>
    14f7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14fa:	31 d2                	xor    %edx,%edx
    14fc:	e9 4e ff ff ff       	jmp    144f <printf+0x4f>
    1501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1508:	83 ec 04             	sub    $0x4,%esp
    150b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    150e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1511:	6a 01                	push   $0x1
    1513:	eb a8                	jmp    14bd <printf+0xbd>
    1515:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1518:	83 ec 0c             	sub    $0xc,%esp
    151b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1520:	6a 01                	push   $0x1
    1522:	eb c6                	jmp    14ea <printf+0xea>
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1528:	8b 57 04             	mov    0x4(%edi),%edx
    152b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    152d:	85 d2                	test   %edx,%edx
    152f:	74 15                	je     1546 <printf+0x146>
    1531:	83 ec 0c             	sub    $0xc,%esp
    1534:	8b 45 08             	mov    0x8(%ebp),%eax
    1537:	b9 10 00 00 00       	mov    $0x10,%ecx
    153c:	6a 00                	push   $0x0
    153e:	e8 1d fe ff ff       	call   1360 <printint>
    1543:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1546:	83 ec 0c             	sub    $0xc,%esp
    1549:	8b 45 08             	mov    0x8(%ebp),%eax
    154c:	89 da                	mov    %ebx,%edx
    154e:	6a 00                	push   $0x0
    1550:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1555:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1558:	e8 03 fe ff ff       	call   1360 <printint>
    155d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1560:	31 d2                	xor    %edx,%edx
    1562:	e9 e8 fe ff ff       	jmp    144f <printf+0x4f>
    1567:	89 f6                	mov    %esi,%esi
    1569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1570:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1572:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1575:	85 c9                	test   %ecx,%ecx
    1577:	74 6a                	je     15e3 <printf+0x1e3>
        while(*s != 0){
    1579:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    157c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    157e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1580:	84 c0                	test   %al,%al
    1582:	0f 84 c7 fe ff ff    	je     144f <printf+0x4f>
    1588:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    158b:	89 de                	mov    %ebx,%esi
    158d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1590:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1593:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1596:	83 ec 04             	sub    $0x4,%esp
    1599:	6a 01                	push   $0x1
          s++;
    159b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    159e:	50                   	push   %eax
    159f:	53                   	push   %ebx
    15a0:	e8 fd fc ff ff       	call   12a2 <write>
        while(*s != 0){
    15a5:	0f b6 06             	movzbl (%esi),%eax
    15a8:	83 c4 10             	add    $0x10,%esp
    15ab:	84 c0                	test   %al,%al
    15ad:	75 e1                	jne    1590 <printf+0x190>
    15af:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15b2:	31 d2                	xor    %edx,%edx
    15b4:	e9 96 fe ff ff       	jmp    144f <printf+0x4f>
    15b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    15c0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    15c2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    15c5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    15c8:	6a 01                	push   $0x1
        putc(fd, *ap);
    15ca:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    15cd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15d0:	50                   	push   %eax
    15d1:	ff 75 08             	pushl  0x8(%ebp)
    15d4:	e8 c9 fc ff ff       	call   12a2 <write>
    15d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15dc:	31 d2                	xor    %edx,%edx
    15de:	e9 6c fe ff ff       	jmp    144f <printf+0x4f>
          s = "(null)";
    15e3:	bb 78 17 00 00       	mov    $0x1778,%ebx
        while(*s != 0){
    15e8:	b8 28 00 00 00       	mov    $0x28,%eax
    15ed:	eb 99                	jmp    1588 <printf+0x188>
    15ef:	90                   	nop

000015f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f1:	a1 24 1a 00 00       	mov    0x1a24,%eax
{
    15f6:	89 e5                	mov    %esp,%ebp
    15f8:	57                   	push   %edi
    15f9:	56                   	push   %esi
    15fa:	53                   	push   %ebx
    15fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1608:	39 c8                	cmp    %ecx,%eax
    160a:	8b 10                	mov    (%eax),%edx
    160c:	73 32                	jae    1640 <free+0x50>
    160e:	39 d1                	cmp    %edx,%ecx
    1610:	72 04                	jb     1616 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1612:	39 d0                	cmp    %edx,%eax
    1614:	72 32                	jb     1648 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1616:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1619:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    161c:	39 fa                	cmp    %edi,%edx
    161e:	74 30                	je     1650 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1620:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1623:	8b 50 04             	mov    0x4(%eax),%edx
    1626:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1629:	39 f1                	cmp    %esi,%ecx
    162b:	74 3a                	je     1667 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    162d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    162f:	a3 24 1a 00 00       	mov    %eax,0x1a24
}
    1634:	5b                   	pop    %ebx
    1635:	5e                   	pop    %esi
    1636:	5f                   	pop    %edi
    1637:	5d                   	pop    %ebp
    1638:	c3                   	ret    
    1639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1640:	39 d0                	cmp    %edx,%eax
    1642:	72 04                	jb     1648 <free+0x58>
    1644:	39 d1                	cmp    %edx,%ecx
    1646:	72 ce                	jb     1616 <free+0x26>
{
    1648:	89 d0                	mov    %edx,%eax
    164a:	eb bc                	jmp    1608 <free+0x18>
    164c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1650:	03 72 04             	add    0x4(%edx),%esi
    1653:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1656:	8b 10                	mov    (%eax),%edx
    1658:	8b 12                	mov    (%edx),%edx
    165a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    165d:	8b 50 04             	mov    0x4(%eax),%edx
    1660:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1663:	39 f1                	cmp    %esi,%ecx
    1665:	75 c6                	jne    162d <free+0x3d>
    p->s.size += bp->s.size;
    1667:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    166a:	a3 24 1a 00 00       	mov    %eax,0x1a24
    p->s.size += bp->s.size;
    166f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1672:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1675:	89 10                	mov    %edx,(%eax)
}
    1677:	5b                   	pop    %ebx
    1678:	5e                   	pop    %esi
    1679:	5f                   	pop    %edi
    167a:	5d                   	pop    %ebp
    167b:	c3                   	ret    
    167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001680 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1680:	55                   	push   %ebp
    1681:	89 e5                	mov    %esp,%ebp
    1683:	57                   	push   %edi
    1684:	56                   	push   %esi
    1685:	53                   	push   %ebx
    1686:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1689:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    168c:	8b 15 24 1a 00 00    	mov    0x1a24,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1692:	8d 78 07             	lea    0x7(%eax),%edi
    1695:	c1 ef 03             	shr    $0x3,%edi
    1698:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    169b:	85 d2                	test   %edx,%edx
    169d:	0f 84 9d 00 00 00    	je     1740 <malloc+0xc0>
    16a3:	8b 02                	mov    (%edx),%eax
    16a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16a8:	39 cf                	cmp    %ecx,%edi
    16aa:	76 6c                	jbe    1718 <malloc+0x98>
    16ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    16b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16b7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    16ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    16c1:	eb 0e                	jmp    16d1 <malloc+0x51>
    16c3:	90                   	nop
    16c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16ca:	8b 48 04             	mov    0x4(%eax),%ecx
    16cd:	39 f9                	cmp    %edi,%ecx
    16cf:	73 47                	jae    1718 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16d1:	39 05 24 1a 00 00    	cmp    %eax,0x1a24
    16d7:	89 c2                	mov    %eax,%edx
    16d9:	75 ed                	jne    16c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16db:	83 ec 0c             	sub    $0xc,%esp
    16de:	56                   	push   %esi
    16df:	e8 26 fc ff ff       	call   130a <sbrk>
  if(p == (char*)-1)
    16e4:	83 c4 10             	add    $0x10,%esp
    16e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    16ea:	74 1c                	je     1708 <malloc+0x88>
  hp->s.size = nu;
    16ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16ef:	83 ec 0c             	sub    $0xc,%esp
    16f2:	83 c0 08             	add    $0x8,%eax
    16f5:	50                   	push   %eax
    16f6:	e8 f5 fe ff ff       	call   15f0 <free>
  return freep;
    16fb:	8b 15 24 1a 00 00    	mov    0x1a24,%edx
      if((p = morecore(nunits)) == 0)
    1701:	83 c4 10             	add    $0x10,%esp
    1704:	85 d2                	test   %edx,%edx
    1706:	75 c0                	jne    16c8 <malloc+0x48>
        return 0;
  }
}
    1708:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    170b:	31 c0                	xor    %eax,%eax
}
    170d:	5b                   	pop    %ebx
    170e:	5e                   	pop    %esi
    170f:	5f                   	pop    %edi
    1710:	5d                   	pop    %ebp
    1711:	c3                   	ret    
    1712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1718:	39 cf                	cmp    %ecx,%edi
    171a:	74 54                	je     1770 <malloc+0xf0>
        p->s.size -= nunits;
    171c:	29 f9                	sub    %edi,%ecx
    171e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1721:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1724:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1727:	89 15 24 1a 00 00    	mov    %edx,0x1a24
}
    172d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1730:	83 c0 08             	add    $0x8,%eax
}
    1733:	5b                   	pop    %ebx
    1734:	5e                   	pop    %esi
    1735:	5f                   	pop    %edi
    1736:	5d                   	pop    %ebp
    1737:	c3                   	ret    
    1738:	90                   	nop
    1739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1740:	c7 05 24 1a 00 00 28 	movl   $0x1a28,0x1a24
    1747:	1a 00 00 
    174a:	c7 05 28 1a 00 00 28 	movl   $0x1a28,0x1a28
    1751:	1a 00 00 
    base.s.size = 0;
    1754:	b8 28 1a 00 00       	mov    $0x1a28,%eax
    1759:	c7 05 2c 1a 00 00 00 	movl   $0x0,0x1a2c
    1760:	00 00 00 
    1763:	e9 44 ff ff ff       	jmp    16ac <malloc+0x2c>
    1768:	90                   	nop
    1769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1770:	8b 08                	mov    (%eax),%ecx
    1772:	89 0a                	mov    %ecx,(%edx)
    1774:	eb b1                	jmp    1727 <malloc+0xa7>
