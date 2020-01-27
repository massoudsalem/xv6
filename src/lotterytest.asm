
_lotterytest:     file format elf32-i386


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
    1017:	e8 24 02 00 00       	call   1240 <atoi>
    settickets(tickets_number);
    101c:	89 04 24             	mov    %eax,(%esp)
    101f:	e8 3e 03 00 00       	call   1362 <settickets>
    int rc = fork();
    1024:	e8 81 02 00 00       	call   12aa <fork>
    if(rc == 0){
    1029:	83 c4 10             	add    $0x10,%esp
    102c:	85 c0                	test   %eax,%eax
    102e:	74 17                	je     1047 <main+0x47>
        printf(1,"\nSucsses in forking.\n");
    }else if(rc < 0){
    1030:	78 02                	js     1034 <main+0x34>
    1032:	eb fe                	jmp    1032 <main+0x32>
        printf(1,"\nfail in forking.\n");
    1034:	50                   	push   %eax
    1035:	50                   	push   %eax
    1036:	68 ae 17 00 00       	push   $0x17ae
    103b:	6a 01                	push   $0x1
    103d:	e8 de 03 00 00       	call   1420 <printf>
        exit();
    1042:	e8 6b 02 00 00       	call   12b2 <exit>
        printf(1,"\nSucsses in forking.\n");
    1047:	52                   	push   %edx
    1048:	52                   	push   %edx
    1049:	68 98 17 00 00       	push   $0x1798
    104e:	6a 01                	push   $0x1
    1050:	e8 cb 03 00 00       	call   1420 <printf>
    1055:	83 c4 10             	add    $0x10,%esp
    1058:	eb d8                	jmp    1032 <main+0x32>
    105a:	66 90                	xchg   %ax,%ax
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 45 08             	mov    0x8(%ebp),%eax
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    106a:	89 c2                	mov    %eax,%edx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1070:	83 c1 01             	add    $0x1,%ecx
    1073:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1077:	83 c2 01             	add    $0x1,%edx
    107a:	84 db                	test   %bl,%bl
    107c:	88 5a ff             	mov    %bl,-0x1(%edx)
    107f:	75 ef                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    1081:	5b                   	pop    %ebx
    1082:	5d                   	pop    %ebp
    1083:	c3                   	ret    
    1084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    108a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	8b 55 08             	mov    0x8(%ebp),%edx
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    109a:	0f b6 02             	movzbl (%edx),%eax
    109d:	0f b6 19             	movzbl (%ecx),%ebx
    10a0:	84 c0                	test   %al,%al
    10a2:	75 1c                	jne    10c0 <strcmp+0x30>
    10a4:	eb 2a                	jmp    10d0 <strcmp+0x40>
    10a6:	8d 76 00             	lea    0x0(%esi),%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10b6:	83 c1 01             	add    $0x1,%ecx
    10b9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10bc:	84 c0                	test   %al,%al
    10be:	74 10                	je     10d0 <strcmp+0x40>
    10c0:	38 d8                	cmp    %bl,%al
    10c2:	74 ec                	je     10b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10c4:	29 d8                	sub    %ebx,%eax
}
    10c6:	5b                   	pop    %ebx
    10c7:	5d                   	pop    %ebp
    10c8:	c3                   	ret    
    10c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10d2:	29 d8                	sub    %ebx,%eax
}
    10d4:	5b                   	pop    %ebx
    10d5:	5d                   	pop    %ebp
    10d6:	c3                   	ret    
    10d7:	89 f6                	mov    %esi,%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010e0 <strlen>:

uint
strlen(const char *s)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10e6:	80 39 00             	cmpb   $0x0,(%ecx)
    10e9:	74 15                	je     1100 <strlen+0x20>
    10eb:	31 d2                	xor    %edx,%edx
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
    10f0:	83 c2 01             	add    $0x1,%edx
    10f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10f7:	89 d0                	mov    %edx,%eax
    10f9:	75 f5                	jne    10f0 <strlen+0x10>
    ;
  return n;
}
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1100:	31 c0                	xor    %eax,%eax
}
    1102:	5d                   	pop    %ebp
    1103:	c3                   	ret    
    1104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    110a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001110 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1117:	8b 4d 10             	mov    0x10(%ebp),%ecx
    111a:	8b 45 0c             	mov    0xc(%ebp),%eax
    111d:	89 d7                	mov    %edx,%edi
    111f:	fc                   	cld    
    1120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1122:	89 d0                	mov    %edx,%eax
    1124:	5f                   	pop    %edi
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <strchr>:

char*
strchr(const char *s, char c)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
    1134:	8b 45 08             	mov    0x8(%ebp),%eax
    1137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    113a:	0f b6 10             	movzbl (%eax),%edx
    113d:	84 d2                	test   %dl,%dl
    113f:	74 1d                	je     115e <strchr+0x2e>
    if(*s == c)
    1141:	38 d3                	cmp    %dl,%bl
    1143:	89 d9                	mov    %ebx,%ecx
    1145:	75 0d                	jne    1154 <strchr+0x24>
    1147:	eb 17                	jmp    1160 <strchr+0x30>
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1150:	38 ca                	cmp    %cl,%dl
    1152:	74 0c                	je     1160 <strchr+0x30>
  for(; *s; s++)
    1154:	83 c0 01             	add    $0x1,%eax
    1157:	0f b6 10             	movzbl (%eax),%edx
    115a:	84 d2                	test   %dl,%dl
    115c:	75 f2                	jne    1150 <strchr+0x20>
      return (char*)s;
  return 0;
    115e:	31 c0                	xor    %eax,%eax
}
    1160:	5b                   	pop    %ebx
    1161:	5d                   	pop    %ebp
    1162:	c3                   	ret    
    1163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <gets>:

char*
gets(char *buf, int max)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	57                   	push   %edi
    1174:	56                   	push   %esi
    1175:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1176:	31 f6                	xor    %esi,%esi
    1178:	89 f3                	mov    %esi,%ebx
{
    117a:	83 ec 1c             	sub    $0x1c,%esp
    117d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1180:	eb 2f                	jmp    11b1 <gets+0x41>
    1182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1188:	8d 45 e7             	lea    -0x19(%ebp),%eax
    118b:	83 ec 04             	sub    $0x4,%esp
    118e:	6a 01                	push   $0x1
    1190:	50                   	push   %eax
    1191:	6a 00                	push   $0x0
    1193:	e8 32 01 00 00       	call   12ca <read>
    if(cc < 1)
    1198:	83 c4 10             	add    $0x10,%esp
    119b:	85 c0                	test   %eax,%eax
    119d:	7e 1c                	jle    11bb <gets+0x4b>
      break;
    buf[i++] = c;
    119f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11a3:	83 c7 01             	add    $0x1,%edi
    11a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11a9:	3c 0a                	cmp    $0xa,%al
    11ab:	74 23                	je     11d0 <gets+0x60>
    11ad:	3c 0d                	cmp    $0xd,%al
    11af:	74 1f                	je     11d0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11b1:	83 c3 01             	add    $0x1,%ebx
    11b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11b7:	89 fe                	mov    %edi,%esi
    11b9:	7c cd                	jl     1188 <gets+0x18>
    11bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11c0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11c6:	5b                   	pop    %ebx
    11c7:	5e                   	pop    %esi
    11c8:	5f                   	pop    %edi
    11c9:	5d                   	pop    %ebp
    11ca:	c3                   	ret    
    11cb:	90                   	nop
    11cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11d0:	8b 75 08             	mov    0x8(%ebp),%esi
    11d3:	8b 45 08             	mov    0x8(%ebp),%eax
    11d6:	01 de                	add    %ebx,%esi
    11d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11da:	c6 03 00             	movb   $0x0,(%ebx)
}
    11dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11e0:	5b                   	pop    %ebx
    11e1:	5e                   	pop    %esi
    11e2:	5f                   	pop    %edi
    11e3:	5d                   	pop    %ebp
    11e4:	c3                   	ret    
    11e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011f0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	56                   	push   %esi
    11f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f5:	83 ec 08             	sub    $0x8,%esp
    11f8:	6a 00                	push   $0x0
    11fa:	ff 75 08             	pushl  0x8(%ebp)
    11fd:	e8 f0 00 00 00       	call   12f2 <open>
  if(fd < 0)
    1202:	83 c4 10             	add    $0x10,%esp
    1205:	85 c0                	test   %eax,%eax
    1207:	78 27                	js     1230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1209:	83 ec 08             	sub    $0x8,%esp
    120c:	ff 75 0c             	pushl  0xc(%ebp)
    120f:	89 c3                	mov    %eax,%ebx
    1211:	50                   	push   %eax
    1212:	e8 f3 00 00 00       	call   130a <fstat>
  close(fd);
    1217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    121a:	89 c6                	mov    %eax,%esi
  close(fd);
    121c:	e8 b9 00 00 00       	call   12da <close>
  return r;
    1221:	83 c4 10             	add    $0x10,%esp
}
    1224:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1227:	89 f0                	mov    %esi,%eax
    1229:	5b                   	pop    %ebx
    122a:	5e                   	pop    %esi
    122b:	5d                   	pop    %ebp
    122c:	c3                   	ret    
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1230:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1235:	eb ed                	jmp    1224 <stat+0x34>
    1237:	89 f6                	mov    %esi,%esi
    1239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001240 <atoi>:

int
atoi(const char *s)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1247:	0f be 11             	movsbl (%ecx),%edx
    124a:	8d 42 d0             	lea    -0x30(%edx),%eax
    124d:	3c 09                	cmp    $0x9,%al
  n = 0;
    124f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1254:	77 1f                	ja     1275 <atoi+0x35>
    1256:	8d 76 00             	lea    0x0(%esi),%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1260:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1263:	83 c1 01             	add    $0x1,%ecx
    1266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    126a:	0f be 11             	movsbl (%ecx),%edx
    126d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1270:	80 fb 09             	cmp    $0x9,%bl
    1273:	76 eb                	jbe    1260 <atoi+0x20>
  return n;
}
    1275:	5b                   	pop    %ebx
    1276:	5d                   	pop    %ebp
    1277:	c3                   	ret    
    1278:	90                   	nop
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
    1285:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1288:	8b 45 08             	mov    0x8(%ebp),%eax
    128b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    128e:	85 db                	test   %ebx,%ebx
    1290:	7e 14                	jle    12a6 <memmove+0x26>
    1292:	31 d2                	xor    %edx,%edx
    1294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    129c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    129f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12a2:	39 d3                	cmp    %edx,%ebx
    12a4:	75 f2                	jne    1298 <memmove+0x18>
  return vdst;
}
    12a6:	5b                   	pop    %ebx
    12a7:	5e                   	pop    %esi
    12a8:	5d                   	pop    %ebp
    12a9:	c3                   	ret    

000012aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12aa:	b8 01 00 00 00       	mov    $0x1,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <exit>:
SYSCALL(exit)
    12b2:	b8 02 00 00 00       	mov    $0x2,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <wait>:
SYSCALL(wait)
    12ba:	b8 03 00 00 00       	mov    $0x3,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <pipe>:
SYSCALL(pipe)
    12c2:	b8 04 00 00 00       	mov    $0x4,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <read>:
SYSCALL(read)
    12ca:	b8 05 00 00 00       	mov    $0x5,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <write>:
SYSCALL(write)
    12d2:	b8 10 00 00 00       	mov    $0x10,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <close>:
SYSCALL(close)
    12da:	b8 15 00 00 00       	mov    $0x15,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <kill>:
SYSCALL(kill)
    12e2:	b8 06 00 00 00       	mov    $0x6,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <exec>:
SYSCALL(exec)
    12ea:	b8 07 00 00 00       	mov    $0x7,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <open>:
SYSCALL(open)
    12f2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <mknod>:
SYSCALL(mknod)
    12fa:	b8 11 00 00 00       	mov    $0x11,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <unlink>:
SYSCALL(unlink)
    1302:	b8 12 00 00 00       	mov    $0x12,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <fstat>:
SYSCALL(fstat)
    130a:	b8 08 00 00 00       	mov    $0x8,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <link>:
SYSCALL(link)
    1312:	b8 13 00 00 00       	mov    $0x13,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <mkdir>:
SYSCALL(mkdir)
    131a:	b8 14 00 00 00       	mov    $0x14,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <chdir>:
SYSCALL(chdir)
    1322:	b8 09 00 00 00       	mov    $0x9,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <dup>:
SYSCALL(dup)
    132a:	b8 0a 00 00 00       	mov    $0xa,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <getpid>:
SYSCALL(getpid)
    1332:	b8 0b 00 00 00       	mov    $0xb,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <sbrk>:
SYSCALL(sbrk)
    133a:	b8 0c 00 00 00       	mov    $0xc,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <sleep>:
SYSCALL(sleep)
    1342:	b8 0d 00 00 00       	mov    $0xd,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <uptime>:
SYSCALL(uptime)
    134a:	b8 0e 00 00 00       	mov    $0xe,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <getreadcount>:
SYSCALL(getreadcount)
    1352:	b8 16 00 00 00       	mov    $0x16,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <gettime>:
SYSCALL(gettime)
    135a:	b8 17 00 00 00       	mov    $0x17,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <settickets>:
SYSCALL(settickets)
    1362:	b8 18 00 00 00       	mov    $0x18,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <getpinfo>:
    136a:	b8 19 00 00 00       	mov    $0x19,%eax
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
    13b9:	0f b6 92 c8 17 00 00 	movzbl 0x17c8(%edx),%edx
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
    13f0:	e8 dd fe ff ff       	call   12d2 <write>

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
    1464:	e8 69 fe ff ff       	call   12d2 <write>
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
    14cd:	e8 00 fe ff ff       	call   12d2 <write>
    14d2:	83 c4 0c             	add    $0xc,%esp
    14d5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14d8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14db:	6a 01                	push   $0x1
    14dd:	50                   	push   %eax
    14de:	ff 75 08             	pushl  0x8(%ebp)
    14e1:	83 c6 01             	add    $0x1,%esi
    14e4:	e8 e9 fd ff ff       	call   12d2 <write>
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
    15c0:	e8 0d fd ff ff       	call   12d2 <write>
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
    15f4:	e8 d9 fc ff ff       	call   12d2 <write>
    15f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15fc:	31 d2                	xor    %edx,%edx
    15fe:	e9 6c fe ff ff       	jmp    146f <printf+0x4f>
          s = "(null)";
    1603:	bb c1 17 00 00       	mov    $0x17c1,%ebx
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
    1611:	a1 6c 1a 00 00       	mov    0x1a6c,%eax
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
    164f:	a3 6c 1a 00 00       	mov    %eax,0x1a6c
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
    168a:	a3 6c 1a 00 00       	mov    %eax,0x1a6c
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
    16ac:	8b 15 6c 1a 00 00    	mov    0x1a6c,%edx
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
    16f1:	39 05 6c 1a 00 00    	cmp    %eax,0x1a6c
    16f7:	89 c2                	mov    %eax,%edx
    16f9:	75 ed                	jne    16e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16fb:	83 ec 0c             	sub    $0xc,%esp
    16fe:	56                   	push   %esi
    16ff:	e8 36 fc ff ff       	call   133a <sbrk>
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
    171b:	8b 15 6c 1a 00 00    	mov    0x1a6c,%edx
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
    1747:	89 15 6c 1a 00 00    	mov    %edx,0x1a6c
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
    1760:	c7 05 6c 1a 00 00 70 	movl   $0x1a70,0x1a6c
    1767:	1a 00 00 
    176a:	c7 05 70 1a 00 00 70 	movl   $0x1a70,0x1a70
    1771:	1a 00 00 
    base.s.size = 0;
    1774:	b8 70 1a 00 00       	mov    $0x1a70,%eax
    1779:	c7 05 74 1a 00 00 00 	movl   $0x0,0x1a74
    1780:	00 00 00 
    1783:	e9 44 ff ff ff       	jmp    16cc <malloc+0x2c>
    1788:	90                   	nop
    1789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1790:	8b 08                	mov    (%eax),%ecx
    1792:	89 0a                	mov    %ecx,(%edx)
    1794:	eb b1                	jmp    1747 <malloc+0xa7>
