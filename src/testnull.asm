
_testnull:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#define NULL ((void *)0)

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 08             	sub    $0x8,%esp
  a = 5;
  pi = &a;
  a = *pi;
  pi = NULL;

  printf(1, "Null Pointer value: %p\n", pi);
    1011:	6a 00                	push   $0x0
    1013:	68 68 17 00 00       	push   $0x1768
    1018:	6a 01                	push   $0x1
    101a:	e8 d1 03 00 00       	call   13f0 <printf>
  exit();
    101f:	e8 5e 02 00 00       	call   1282 <exit>
    1024:	66 90                	xchg   %ax,%ax
    1026:	66 90                	xchg   %ax,%ax
    1028:	66 90                	xchg   %ax,%ax
    102a:	66 90                	xchg   %ax,%ax
    102c:	66 90                	xchg   %ax,%ax
    102e:	66 90                	xchg   %ax,%ax

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
    133a:	b8 19 00 00 00       	mov    $0x19,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    
    1342:	66 90                	xchg   %ax,%ax
    1344:	66 90                	xchg   %ax,%ax
    1346:	66 90                	xchg   %ax,%ax
    1348:	66 90                	xchg   %ax,%ax
    134a:	66 90                	xchg   %ax,%ax
    134c:	66 90                	xchg   %ax,%ax
    134e:	66 90                	xchg   %ax,%ax

00001350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	56                   	push   %esi
    1355:	53                   	push   %ebx
    1356:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1359:	85 d2                	test   %edx,%edx
{
    135b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    135e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1360:	79 76                	jns    13d8 <printint+0x88>
    1362:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1366:	74 70                	je     13d8 <printint+0x88>
    x = -xx;
    1368:	f7 d8                	neg    %eax
    neg = 1;
    136a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1371:	31 f6                	xor    %esi,%esi
    1373:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1376:	eb 0a                	jmp    1382 <printint+0x32>
    1378:	90                   	nop
    1379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1380:	89 fe                	mov    %edi,%esi
    1382:	31 d2                	xor    %edx,%edx
    1384:	8d 7e 01             	lea    0x1(%esi),%edi
    1387:	f7 f1                	div    %ecx
    1389:	0f b6 92 88 17 00 00 	movzbl 0x1788(%edx),%edx
  }while((x /= base) != 0);
    1390:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1392:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1395:	75 e9                	jne    1380 <printint+0x30>
  if(neg)
    1397:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    139a:	85 c0                	test   %eax,%eax
    139c:	74 08                	je     13a6 <printint+0x56>
    buf[i++] = '-';
    139e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    13a3:	8d 7e 02             	lea    0x2(%esi),%edi
    13a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    13aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    13ad:	8d 76 00             	lea    0x0(%esi),%esi
    13b0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    13b3:	83 ec 04             	sub    $0x4,%esp
    13b6:	83 ee 01             	sub    $0x1,%esi
    13b9:	6a 01                	push   $0x1
    13bb:	53                   	push   %ebx
    13bc:	57                   	push   %edi
    13bd:	88 45 d7             	mov    %al,-0x29(%ebp)
    13c0:	e8 dd fe ff ff       	call   12a2 <write>

  while(--i >= 0)
    13c5:	83 c4 10             	add    $0x10,%esp
    13c8:	39 de                	cmp    %ebx,%esi
    13ca:	75 e4                	jne    13b0 <printint+0x60>
    putc(fd, buf[i]);
}
    13cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13cf:	5b                   	pop    %ebx
    13d0:	5e                   	pop    %esi
    13d1:	5f                   	pop    %edi
    13d2:	5d                   	pop    %ebp
    13d3:	c3                   	ret    
    13d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13d8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13df:	eb 90                	jmp    1371 <printint+0x21>
    13e1:	eb 0d                	jmp    13f0 <printf>
    13e3:	90                   	nop
    13e4:	90                   	nop
    13e5:	90                   	nop
    13e6:	90                   	nop
    13e7:	90                   	nop
    13e8:	90                   	nop
    13e9:	90                   	nop
    13ea:	90                   	nop
    13eb:	90                   	nop
    13ec:	90                   	nop
    13ed:	90                   	nop
    13ee:	90                   	nop
    13ef:	90                   	nop

000013f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	53                   	push   %ebx
    13f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13f9:	8b 75 0c             	mov    0xc(%ebp),%esi
    13fc:	0f b6 1e             	movzbl (%esi),%ebx
    13ff:	84 db                	test   %bl,%bl
    1401:	0f 84 bf 00 00 00    	je     14c6 <printf+0xd6>
    1407:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    140a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    140d:	31 d2                	xor    %edx,%edx
    140f:	eb 39                	jmp    144a <printf+0x5a>
    1411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1418:	83 f8 25             	cmp    $0x25,%eax
    141b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    141e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1423:	74 1a                	je     143f <printf+0x4f>
  write(fd, &c, 1);
    1425:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1428:	83 ec 04             	sub    $0x4,%esp
    142b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    142e:	6a 01                	push   $0x1
    1430:	50                   	push   %eax
    1431:	ff 75 08             	pushl  0x8(%ebp)
    1434:	e8 69 fe ff ff       	call   12a2 <write>
    1439:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    143c:	83 c4 10             	add    $0x10,%esp
    143f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1442:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1446:	84 db                	test   %bl,%bl
    1448:	74 7c                	je     14c6 <printf+0xd6>
    if(state == 0){
    144a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    144c:	0f be cb             	movsbl %bl,%ecx
    144f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1452:	74 c4                	je     1418 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1454:	83 fa 25             	cmp    $0x25,%edx
    1457:	75 e6                	jne    143f <printf+0x4f>
      if(c == 'd'){
    1459:	83 f8 64             	cmp    $0x64,%eax
    145c:	0f 84 a6 00 00 00    	je     1508 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1462:	83 f8 6c             	cmp    $0x6c,%eax
    1465:	0f 84 ad 00 00 00    	je     1518 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    146b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1471:	83 f9 70             	cmp    $0x70,%ecx
    1474:	74 5a                	je     14d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1476:	83 f8 73             	cmp    $0x73,%eax
    1479:	0f 84 e1 00 00 00    	je     1560 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    147f:	83 f8 63             	cmp    $0x63,%eax
    1482:	0f 84 28 01 00 00    	je     15b0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1488:	83 f8 25             	cmp    $0x25,%eax
    148b:	74 6b                	je     14f8 <printf+0x108>
  write(fd, &c, 1);
    148d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1490:	83 ec 04             	sub    $0x4,%esp
    1493:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1497:	6a 01                	push   $0x1
    1499:	50                   	push   %eax
    149a:	ff 75 08             	pushl  0x8(%ebp)
    149d:	e8 00 fe ff ff       	call   12a2 <write>
    14a2:	83 c4 0c             	add    $0xc,%esp
    14a5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14a8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14ab:	6a 01                	push   $0x1
    14ad:	50                   	push   %eax
    14ae:	ff 75 08             	pushl  0x8(%ebp)
    14b1:	83 c6 01             	add    $0x1,%esi
    14b4:	e8 e9 fd ff ff       	call   12a2 <write>
  for(i = 0; fmt[i]; i++){
    14b9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    14bd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14c0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14c2:	84 db                	test   %bl,%bl
    14c4:	75 84                	jne    144a <printf+0x5a>
    }
  }
}
    14c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14c9:	5b                   	pop    %ebx
    14ca:	5e                   	pop    %esi
    14cb:	5f                   	pop    %edi
    14cc:	5d                   	pop    %ebp
    14cd:	c3                   	ret    
    14ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14d0:	83 ec 0c             	sub    $0xc,%esp
    14d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14d8:	6a 00                	push   $0x0
    14da:	8b 17                	mov    (%edi),%edx
    14dc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    14df:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    14e2:	e8 69 fe ff ff       	call   1350 <printint>
    14e7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14ea:	31 d2                	xor    %edx,%edx
    14ec:	e9 4e ff ff ff       	jmp    143f <printf+0x4f>
    14f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    14f8:	83 ec 04             	sub    $0x4,%esp
    14fb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    14fe:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1501:	6a 01                	push   $0x1
    1503:	eb a8                	jmp    14ad <printf+0xbd>
    1505:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1508:	83 ec 0c             	sub    $0xc,%esp
    150b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1510:	6a 01                	push   $0x1
    1512:	eb c6                	jmp    14da <printf+0xea>
    1514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1518:	8b 57 04             	mov    0x4(%edi),%edx
    151b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    151d:	85 d2                	test   %edx,%edx
    151f:	74 15                	je     1536 <printf+0x146>
    1521:	83 ec 0c             	sub    $0xc,%esp
    1524:	8b 45 08             	mov    0x8(%ebp),%eax
    1527:	b9 10 00 00 00       	mov    $0x10,%ecx
    152c:	6a 00                	push   $0x0
    152e:	e8 1d fe ff ff       	call   1350 <printint>
    1533:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1536:	83 ec 0c             	sub    $0xc,%esp
    1539:	8b 45 08             	mov    0x8(%ebp),%eax
    153c:	89 da                	mov    %ebx,%edx
    153e:	6a 00                	push   $0x0
    1540:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1545:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1548:	e8 03 fe ff ff       	call   1350 <printint>
    154d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1550:	31 d2                	xor    %edx,%edx
    1552:	e9 e8 fe ff ff       	jmp    143f <printf+0x4f>
    1557:	89 f6                	mov    %esi,%esi
    1559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1560:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1562:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1565:	85 c9                	test   %ecx,%ecx
    1567:	74 6a                	je     15d3 <printf+0x1e3>
        while(*s != 0){
    1569:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    156c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    156e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1570:	84 c0                	test   %al,%al
    1572:	0f 84 c7 fe ff ff    	je     143f <printf+0x4f>
    1578:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    157b:	89 de                	mov    %ebx,%esi
    157d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1580:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1583:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1586:	83 ec 04             	sub    $0x4,%esp
    1589:	6a 01                	push   $0x1
          s++;
    158b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    158e:	50                   	push   %eax
    158f:	53                   	push   %ebx
    1590:	e8 0d fd ff ff       	call   12a2 <write>
        while(*s != 0){
    1595:	0f b6 06             	movzbl (%esi),%eax
    1598:	83 c4 10             	add    $0x10,%esp
    159b:	84 c0                	test   %al,%al
    159d:	75 e1                	jne    1580 <printf+0x190>
    159f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15a2:	31 d2                	xor    %edx,%edx
    15a4:	e9 96 fe ff ff       	jmp    143f <printf+0x4f>
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    15b0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    15b2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    15b5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    15b8:	6a 01                	push   $0x1
        putc(fd, *ap);
    15ba:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    15bd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15c0:	50                   	push   %eax
    15c1:	ff 75 08             	pushl  0x8(%ebp)
    15c4:	e8 d9 fc ff ff       	call   12a2 <write>
    15c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15cc:	31 d2                	xor    %edx,%edx
    15ce:	e9 6c fe ff ff       	jmp    143f <printf+0x4f>
          s = "(null)";
    15d3:	bb 80 17 00 00       	mov    $0x1780,%ebx
        while(*s != 0){
    15d8:	b8 28 00 00 00       	mov    $0x28,%eax
    15dd:	eb 99                	jmp    1578 <printf+0x188>
    15df:	90                   	nop

000015e0 <free>:
    15e0:	55                   	push   %ebp
    15e1:	a1 2c 1a 00 00       	mov    0x1a2c,%eax
    15e6:	89 e5                	mov    %esp,%ebp
    15e8:	57                   	push   %edi
    15e9:	56                   	push   %esi
    15ea:	53                   	push   %ebx
    15eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    15f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15f8:	39 c8                	cmp    %ecx,%eax
    15fa:	8b 10                	mov    (%eax),%edx
    15fc:	73 32                	jae    1630 <free+0x50>
    15fe:	39 d1                	cmp    %edx,%ecx
    1600:	72 04                	jb     1606 <free+0x26>
    1602:	39 d0                	cmp    %edx,%eax
    1604:	72 32                	jb     1638 <free+0x58>
    1606:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1609:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    160c:	39 fa                	cmp    %edi,%edx
    160e:	74 30                	je     1640 <free+0x60>
    1610:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1613:	8b 50 04             	mov    0x4(%eax),%edx
    1616:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1619:	39 f1                	cmp    %esi,%ecx
    161b:	74 3a                	je     1657 <free+0x77>
    161d:	89 08                	mov    %ecx,(%eax)
    161f:	a3 2c 1a 00 00       	mov    %eax,0x1a2c
    1624:	5b                   	pop    %ebx
    1625:	5e                   	pop    %esi
    1626:	5f                   	pop    %edi
    1627:	5d                   	pop    %ebp
    1628:	c3                   	ret    
    1629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1630:	39 d0                	cmp    %edx,%eax
    1632:	72 04                	jb     1638 <free+0x58>
    1634:	39 d1                	cmp    %edx,%ecx
    1636:	72 ce                	jb     1606 <free+0x26>
    1638:	89 d0                	mov    %edx,%eax
    163a:	eb bc                	jmp    15f8 <free+0x18>
    163c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1640:	03 72 04             	add    0x4(%edx),%esi
    1643:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1646:	8b 10                	mov    (%eax),%edx
    1648:	8b 12                	mov    (%edx),%edx
    164a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    164d:	8b 50 04             	mov    0x4(%eax),%edx
    1650:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1653:	39 f1                	cmp    %esi,%ecx
    1655:	75 c6                	jne    161d <free+0x3d>
    1657:	03 53 fc             	add    -0x4(%ebx),%edx
    165a:	a3 2c 1a 00 00       	mov    %eax,0x1a2c
    165f:	89 50 04             	mov    %edx,0x4(%eax)
    1662:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1665:	89 10                	mov    %edx,(%eax)
    1667:	5b                   	pop    %ebx
    1668:	5e                   	pop    %esi
    1669:	5f                   	pop    %edi
    166a:	5d                   	pop    %ebp
    166b:	c3                   	ret    
    166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001670 <malloc>:
    1670:	55                   	push   %ebp
    1671:	89 e5                	mov    %esp,%ebp
    1673:	57                   	push   %edi
    1674:	56                   	push   %esi
    1675:	53                   	push   %ebx
    1676:	83 ec 0c             	sub    $0xc,%esp
    1679:	8b 45 08             	mov    0x8(%ebp),%eax
    167c:	8b 15 2c 1a 00 00    	mov    0x1a2c,%edx
    1682:	8d 78 07             	lea    0x7(%eax),%edi
    1685:	c1 ef 03             	shr    $0x3,%edi
    1688:	83 c7 01             	add    $0x1,%edi
    168b:	85 d2                	test   %edx,%edx
    168d:	0f 84 9d 00 00 00    	je     1730 <malloc+0xc0>
    1693:	8b 02                	mov    (%edx),%eax
    1695:	8b 48 04             	mov    0x4(%eax),%ecx
    1698:	39 cf                	cmp    %ecx,%edi
    169a:	76 6c                	jbe    1708 <malloc+0x98>
    169c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    16a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16a7:	0f 43 df             	cmovae %edi,%ebx
    16aa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    16b1:	eb 0e                	jmp    16c1 <malloc+0x51>
    16b3:	90                   	nop
    16b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16b8:	8b 02                	mov    (%edx),%eax
    16ba:	8b 48 04             	mov    0x4(%eax),%ecx
    16bd:	39 f9                	cmp    %edi,%ecx
    16bf:	73 47                	jae    1708 <malloc+0x98>
    16c1:	39 05 2c 1a 00 00    	cmp    %eax,0x1a2c
    16c7:	89 c2                	mov    %eax,%edx
    16c9:	75 ed                	jne    16b8 <malloc+0x48>
    16cb:	83 ec 0c             	sub    $0xc,%esp
    16ce:	56                   	push   %esi
    16cf:	e8 36 fc ff ff       	call   130a <sbrk>
    16d4:	83 c4 10             	add    $0x10,%esp
    16d7:	83 f8 ff             	cmp    $0xffffffff,%eax
    16da:	74 1c                	je     16f8 <malloc+0x88>
    16dc:	89 58 04             	mov    %ebx,0x4(%eax)
    16df:	83 ec 0c             	sub    $0xc,%esp
    16e2:	83 c0 08             	add    $0x8,%eax
    16e5:	50                   	push   %eax
    16e6:	e8 f5 fe ff ff       	call   15e0 <free>
    16eb:	8b 15 2c 1a 00 00    	mov    0x1a2c,%edx
    16f1:	83 c4 10             	add    $0x10,%esp
    16f4:	85 d2                	test   %edx,%edx
    16f6:	75 c0                	jne    16b8 <malloc+0x48>
    16f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16fb:	31 c0                	xor    %eax,%eax
    16fd:	5b                   	pop    %ebx
    16fe:	5e                   	pop    %esi
    16ff:	5f                   	pop    %edi
    1700:	5d                   	pop    %ebp
    1701:	c3                   	ret    
    1702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1708:	39 cf                	cmp    %ecx,%edi
    170a:	74 54                	je     1760 <malloc+0xf0>
    170c:	29 f9                	sub    %edi,%ecx
    170e:	89 48 04             	mov    %ecx,0x4(%eax)
    1711:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1714:	89 78 04             	mov    %edi,0x4(%eax)
    1717:	89 15 2c 1a 00 00    	mov    %edx,0x1a2c
    171d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1720:	83 c0 08             	add    $0x8,%eax
    1723:	5b                   	pop    %ebx
    1724:	5e                   	pop    %esi
    1725:	5f                   	pop    %edi
    1726:	5d                   	pop    %ebp
    1727:	c3                   	ret    
    1728:	90                   	nop
    1729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1730:	c7 05 2c 1a 00 00 30 	movl   $0x1a30,0x1a2c
    1737:	1a 00 00 
    173a:	c7 05 30 1a 00 00 30 	movl   $0x1a30,0x1a30
    1741:	1a 00 00 
    1744:	b8 30 1a 00 00       	mov    $0x1a30,%eax
    1749:	c7 05 34 1a 00 00 00 	movl   $0x0,0x1a34
    1750:	00 00 00 
    1753:	e9 44 ff ff ff       	jmp    169c <malloc+0x2c>
    1758:	90                   	nop
    1759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1760:	8b 08                	mov    (%eax),%ecx
    1762:	89 0a                	mov    %ecx,(%edx)
    1764:	eb b1                	jmp    1717 <malloc+0xa7>
