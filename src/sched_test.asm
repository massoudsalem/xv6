
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
    101f:	e8 e5 04 00 00       	call   1509 <settickets>
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
    1163:	e8 09 03 00 00       	call   1471 <read>
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
    11cd:	e8 c7 02 00 00       	call   1499 <open>
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
    11e2:	e8 ca 02 00 00       	call   14b1 <fstat>
  close(fd);
    11e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11ea:	89 c6                	mov    %eax,%esi
  close(fd);
    11ec:	e8 90 02 00 00       	call   1481 <close>
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
    127a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001280 <thread_join>:
  
  return clone(start_routine, arg, stack);
}

int thread_join()
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    1286:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1289:	50                   	push   %eax
    128a:	e8 a2 02 00 00       	call   1531 <join>
  return x;
}
    128f:	c9                   	leave  
    1290:	c3                   	ret    
    1291:	eb 0d                	jmp    12a0 <free>
    1293:	90                   	nop
    1294:	90                   	nop
    1295:	90                   	nop
    1296:	90                   	nop
    1297:	90                   	nop
    1298:	90                   	nop
    1299:	90                   	nop
    129a:	90                   	nop
    129b:	90                   	nop
    129c:	90                   	nop
    129d:	90                   	nop
    129e:	90                   	nop
    129f:	90                   	nop

000012a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12a1:	a1 bc 1a 00 00       	mov    0x1abc,%eax
{
    12a6:	89 e5                	mov    %esp,%ebp
    12a8:	57                   	push   %edi
    12a9:	56                   	push   %esi
    12aa:	53                   	push   %ebx
    12ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12b8:	39 c8                	cmp    %ecx,%eax
    12ba:	8b 10                	mov    (%eax),%edx
    12bc:	73 32                	jae    12f0 <free+0x50>
    12be:	39 d1                	cmp    %edx,%ecx
    12c0:	72 04                	jb     12c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12c2:	39 d0                	cmp    %edx,%eax
    12c4:	72 32                	jb     12f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12cc:	39 fa                	cmp    %edi,%edx
    12ce:	74 30                	je     1300 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    12d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12d3:	8b 50 04             	mov    0x4(%eax),%edx
    12d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12d9:	39 f1                	cmp    %esi,%ecx
    12db:	74 3a                	je     1317 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    12dd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    12df:	a3 bc 1a 00 00       	mov    %eax,0x1abc
}
    12e4:	5b                   	pop    %ebx
    12e5:	5e                   	pop    %esi
    12e6:	5f                   	pop    %edi
    12e7:	5d                   	pop    %ebp
    12e8:	c3                   	ret    
    12e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12f0:	39 d0                	cmp    %edx,%eax
    12f2:	72 04                	jb     12f8 <free+0x58>
    12f4:	39 d1                	cmp    %edx,%ecx
    12f6:	72 ce                	jb     12c6 <free+0x26>
{
    12f8:	89 d0                	mov    %edx,%eax
    12fa:	eb bc                	jmp    12b8 <free+0x18>
    12fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1300:	03 72 04             	add    0x4(%edx),%esi
    1303:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1306:	8b 10                	mov    (%eax),%edx
    1308:	8b 12                	mov    (%edx),%edx
    130a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    130d:	8b 50 04             	mov    0x4(%eax),%edx
    1310:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1313:	39 f1                	cmp    %esi,%ecx
    1315:	75 c6                	jne    12dd <free+0x3d>
    p->s.size += bp->s.size;
    1317:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    131a:	a3 bc 1a 00 00       	mov    %eax,0x1abc
    p->s.size += bp->s.size;
    131f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1322:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1325:	89 10                	mov    %edx,(%eax)
}
    1327:	5b                   	pop    %ebx
    1328:	5e                   	pop    %esi
    1329:	5f                   	pop    %edi
    132a:	5d                   	pop    %ebp
    132b:	c3                   	ret    
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001330 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	56                   	push   %esi
    1335:	53                   	push   %ebx
    1336:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1339:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    133c:	8b 15 bc 1a 00 00    	mov    0x1abc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1342:	8d 78 07             	lea    0x7(%eax),%edi
    1345:	c1 ef 03             	shr    $0x3,%edi
    1348:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    134b:	85 d2                	test   %edx,%edx
    134d:	0f 84 9d 00 00 00    	je     13f0 <malloc+0xc0>
    1353:	8b 02                	mov    (%edx),%eax
    1355:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1358:	39 cf                	cmp    %ecx,%edi
    135a:	76 6c                	jbe    13c8 <malloc+0x98>
    135c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1362:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1367:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    136a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1371:	eb 0e                	jmp    1381 <malloc+0x51>
    1373:	90                   	nop
    1374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1378:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    137a:	8b 48 04             	mov    0x4(%eax),%ecx
    137d:	39 f9                	cmp    %edi,%ecx
    137f:	73 47                	jae    13c8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1381:	39 05 bc 1a 00 00    	cmp    %eax,0x1abc
    1387:	89 c2                	mov    %eax,%edx
    1389:	75 ed                	jne    1378 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    138b:	83 ec 0c             	sub    $0xc,%esp
    138e:	56                   	push   %esi
    138f:	e8 4d 01 00 00       	call   14e1 <sbrk>
  if(p == (char*)-1)
    1394:	83 c4 10             	add    $0x10,%esp
    1397:	83 f8 ff             	cmp    $0xffffffff,%eax
    139a:	74 1c                	je     13b8 <malloc+0x88>
  hp->s.size = nu;
    139c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    139f:	83 ec 0c             	sub    $0xc,%esp
    13a2:	83 c0 08             	add    $0x8,%eax
    13a5:	50                   	push   %eax
    13a6:	e8 f5 fe ff ff       	call   12a0 <free>
  return freep;
    13ab:	8b 15 bc 1a 00 00    	mov    0x1abc,%edx
      if((p = morecore(nunits)) == 0)
    13b1:	83 c4 10             	add    $0x10,%esp
    13b4:	85 d2                	test   %edx,%edx
    13b6:	75 c0                	jne    1378 <malloc+0x48>
        return 0;
  }
    13b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    13bb:	31 c0                	xor    %eax,%eax
    13bd:	5b                   	pop    %ebx
    13be:	5e                   	pop    %esi
    13bf:	5f                   	pop    %edi
    13c0:	5d                   	pop    %ebp
    13c1:	c3                   	ret    
    13c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13c8:	39 cf                	cmp    %ecx,%edi
    13ca:	74 54                	je     1420 <malloc+0xf0>
        p->s.size -= nunits;
    13cc:	29 f9                	sub    %edi,%ecx
    13ce:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13d1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13d4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    13d7:	89 15 bc 1a 00 00    	mov    %edx,0x1abc
    13dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    13e0:	83 c0 08             	add    $0x8,%eax
    13e3:	5b                   	pop    %ebx
    13e4:	5e                   	pop    %esi
    13e5:	5f                   	pop    %edi
    13e6:	5d                   	pop    %ebp
    13e7:	c3                   	ret    
    13e8:	90                   	nop
    13e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    13f0:	c7 05 bc 1a 00 00 c0 	movl   $0x1ac0,0x1abc
    13f7:	1a 00 00 
    13fa:	c7 05 c0 1a 00 00 c0 	movl   $0x1ac0,0x1ac0
    1401:	1a 00 00 
    base.s.size = 0;
    1404:	b8 c0 1a 00 00       	mov    $0x1ac0,%eax
    1409:	c7 05 c4 1a 00 00 00 	movl   $0x0,0x1ac4
    1410:	00 00 00 
    1413:	e9 44 ff ff ff       	jmp    135c <malloc+0x2c>
    1418:	90                   	nop
    1419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1420:	8b 08                	mov    (%eax),%ecx
    1422:	89 0a                	mov    %ecx,(%edx)
    1424:	eb b1                	jmp    13d7 <malloc+0xa7>
    1426:	8d 76 00             	lea    0x0(%esi),%esi
    1429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001430 <thread_create>:
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(4096);
    1436:	68 00 10 00 00       	push   $0x1000
    143b:	e8 f0 fe ff ff       	call   1330 <malloc>
  return clone(start_routine, arg, stack);
    1440:	83 c4 0c             	add    $0xc,%esp
    1443:	50                   	push   %eax
    1444:	ff 75 0c             	pushl  0xc(%ebp)
    1447:	ff 75 08             	pushl  0x8(%ebp)
    144a:	e8 da 00 00 00       	call   1529 <clone>
}
    144f:	c9                   	leave  
    1450:	c3                   	ret    

00001451 <fork>:
    1451:	b8 01 00 00 00       	mov    $0x1,%eax
    1456:	cd 40                	int    $0x40
    1458:	c3                   	ret    

00001459 <exit>:
    1459:	b8 02 00 00 00       	mov    $0x2,%eax
    145e:	cd 40                	int    $0x40
    1460:	c3                   	ret    

00001461 <wait>:
    1461:	b8 03 00 00 00       	mov    $0x3,%eax
    1466:	cd 40                	int    $0x40
    1468:	c3                   	ret    

00001469 <pipe>:
    1469:	b8 04 00 00 00       	mov    $0x4,%eax
    146e:	cd 40                	int    $0x40
    1470:	c3                   	ret    

00001471 <read>:
    1471:	b8 05 00 00 00       	mov    $0x5,%eax
    1476:	cd 40                	int    $0x40
    1478:	c3                   	ret    

00001479 <write>:
    1479:	b8 10 00 00 00       	mov    $0x10,%eax
    147e:	cd 40                	int    $0x40
    1480:	c3                   	ret    

00001481 <close>:
    1481:	b8 15 00 00 00       	mov    $0x15,%eax
    1486:	cd 40                	int    $0x40
    1488:	c3                   	ret    

00001489 <kill>:
    1489:	b8 06 00 00 00       	mov    $0x6,%eax
    148e:	cd 40                	int    $0x40
    1490:	c3                   	ret    

00001491 <exec>:
    1491:	b8 07 00 00 00       	mov    $0x7,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <open>:
    1499:	b8 0f 00 00 00       	mov    $0xf,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <mknod>:
    14a1:	b8 11 00 00 00       	mov    $0x11,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <unlink>:
    14a9:	b8 12 00 00 00       	mov    $0x12,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <fstat>:
    14b1:	b8 08 00 00 00       	mov    $0x8,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <link>:
    14b9:	b8 13 00 00 00       	mov    $0x13,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <mkdir>:
    14c1:	b8 14 00 00 00       	mov    $0x14,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <chdir>:
    14c9:	b8 09 00 00 00       	mov    $0x9,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <dup>:
    14d1:	b8 0a 00 00 00       	mov    $0xa,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <getpid>:
    14d9:	b8 0b 00 00 00       	mov    $0xb,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <sbrk>:
    14e1:	b8 0c 00 00 00       	mov    $0xc,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <sleep>:
    14e9:	b8 0d 00 00 00       	mov    $0xd,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <uptime>:
    14f1:	b8 0e 00 00 00       	mov    $0xe,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <getreadcount>:
    14f9:	b8 16 00 00 00       	mov    $0x16,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <gettime>:
    1501:	b8 17 00 00 00       	mov    $0x17,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <settickets>:
    1509:	b8 18 00 00 00       	mov    $0x18,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    

00001511 <getpinfo>:
    1511:	b8 19 00 00 00       	mov    $0x19,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <mprotect>:
    1519:	b8 1a 00 00 00       	mov    $0x1a,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <munprotect>:
    1521:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <clone>:
    1529:	b8 1c 00 00 00       	mov    $0x1c,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <join>:
    1531:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    
    1539:	66 90                	xchg   %ax,%ax
    153b:	66 90                	xchg   %ax,%ax
    153d:	66 90                	xchg   %ax,%ax
    153f:	90                   	nop

00001540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	57                   	push   %edi
    1544:	56                   	push   %esi
    1545:	53                   	push   %ebx
    1546:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1549:	85 d2                	test   %edx,%edx
{
    154b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    154e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1550:	79 76                	jns    15c8 <printint+0x88>
    1552:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1556:	74 70                	je     15c8 <printint+0x88>
    x = -xx;
    1558:	f7 d8                	neg    %eax
    neg = 1;
    155a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1561:	31 f6                	xor    %esi,%esi
    1563:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1566:	eb 0a                	jmp    1572 <printint+0x32>
    1568:	90                   	nop
    1569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1570:	89 fe                	mov    %edi,%esi
    1572:	31 d2                	xor    %edx,%edx
    1574:	8d 7e 01             	lea    0x1(%esi),%edi
    1577:	f7 f1                	div    %ecx
    1579:	0f b6 92 d8 17 00 00 	movzbl 0x17d8(%edx),%edx
  }while((x /= base) != 0);
    1580:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1582:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1585:	75 e9                	jne    1570 <printint+0x30>
  if(neg)
    1587:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    158a:	85 c0                	test   %eax,%eax
    158c:	74 08                	je     1596 <printint+0x56>
    buf[i++] = '-';
    158e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1593:	8d 7e 02             	lea    0x2(%esi),%edi
    1596:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    159a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    159d:	8d 76 00             	lea    0x0(%esi),%esi
    15a0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    15a3:	83 ec 04             	sub    $0x4,%esp
    15a6:	83 ee 01             	sub    $0x1,%esi
    15a9:	6a 01                	push   $0x1
    15ab:	53                   	push   %ebx
    15ac:	57                   	push   %edi
    15ad:	88 45 d7             	mov    %al,-0x29(%ebp)
    15b0:	e8 c4 fe ff ff       	call   1479 <write>

  while(--i >= 0)
    15b5:	83 c4 10             	add    $0x10,%esp
    15b8:	39 de                	cmp    %ebx,%esi
    15ba:	75 e4                	jne    15a0 <printint+0x60>
    putc(fd, buf[i]);
}
    15bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15bf:	5b                   	pop    %ebx
    15c0:	5e                   	pop    %esi
    15c1:	5f                   	pop    %edi
    15c2:	5d                   	pop    %ebp
    15c3:	c3                   	ret    
    15c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    15c8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    15cf:	eb 90                	jmp    1561 <printint+0x21>
    15d1:	eb 0d                	jmp    15e0 <printf>
    15d3:	90                   	nop
    15d4:	90                   	nop
    15d5:	90                   	nop
    15d6:	90                   	nop
    15d7:	90                   	nop
    15d8:	90                   	nop
    15d9:	90                   	nop
    15da:	90                   	nop
    15db:	90                   	nop
    15dc:	90                   	nop
    15dd:	90                   	nop
    15de:	90                   	nop
    15df:	90                   	nop

000015e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    15e0:	55                   	push   %ebp
    15e1:	89 e5                	mov    %esp,%ebp
    15e3:	57                   	push   %edi
    15e4:	56                   	push   %esi
    15e5:	53                   	push   %ebx
    15e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15e9:	8b 75 0c             	mov    0xc(%ebp),%esi
    15ec:	0f b6 1e             	movzbl (%esi),%ebx
    15ef:	84 db                	test   %bl,%bl
    15f1:	0f 84 bf 00 00 00    	je     16b6 <printf+0xd6>
    15f7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    15fa:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    15fd:	31 d2                	xor    %edx,%edx
    15ff:	eb 39                	jmp    163a <printf+0x5a>
    1601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1608:	83 f8 25             	cmp    $0x25,%eax
    160b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    160e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1613:	74 1a                	je     162f <printf+0x4f>
  write(fd, &c, 1);
    1615:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1618:	83 ec 04             	sub    $0x4,%esp
    161b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    161e:	6a 01                	push   $0x1
    1620:	50                   	push   %eax
    1621:	ff 75 08             	pushl  0x8(%ebp)
    1624:	e8 50 fe ff ff       	call   1479 <write>
    1629:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    162c:	83 c4 10             	add    $0x10,%esp
    162f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1632:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1636:	84 db                	test   %bl,%bl
    1638:	74 7c                	je     16b6 <printf+0xd6>
    if(state == 0){
    163a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    163c:	0f be cb             	movsbl %bl,%ecx
    163f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1642:	74 c4                	je     1608 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1644:	83 fa 25             	cmp    $0x25,%edx
    1647:	75 e6                	jne    162f <printf+0x4f>
      if(c == 'd'){
    1649:	83 f8 64             	cmp    $0x64,%eax
    164c:	0f 84 a6 00 00 00    	je     16f8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1652:	83 f8 6c             	cmp    $0x6c,%eax
    1655:	0f 84 ad 00 00 00    	je     1708 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    165b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1661:	83 f9 70             	cmp    $0x70,%ecx
    1664:	74 5a                	je     16c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1666:	83 f8 73             	cmp    $0x73,%eax
    1669:	0f 84 e1 00 00 00    	je     1750 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    166f:	83 f8 63             	cmp    $0x63,%eax
    1672:	0f 84 28 01 00 00    	je     17a0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1678:	83 f8 25             	cmp    $0x25,%eax
    167b:	74 6b                	je     16e8 <printf+0x108>
  write(fd, &c, 1);
    167d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1680:	83 ec 04             	sub    $0x4,%esp
    1683:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1687:	6a 01                	push   $0x1
    1689:	50                   	push   %eax
    168a:	ff 75 08             	pushl  0x8(%ebp)
    168d:	e8 e7 fd ff ff       	call   1479 <write>
    1692:	83 c4 0c             	add    $0xc,%esp
    1695:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1698:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    169b:	6a 01                	push   $0x1
    169d:	50                   	push   %eax
    169e:	ff 75 08             	pushl  0x8(%ebp)
    16a1:	83 c6 01             	add    $0x1,%esi
    16a4:	e8 d0 fd ff ff       	call   1479 <write>
  for(i = 0; fmt[i]; i++){
    16a9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    16ad:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    16b0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    16b2:	84 db                	test   %bl,%bl
    16b4:	75 84                	jne    163a <printf+0x5a>
    }
  }
}
    16b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16b9:	5b                   	pop    %ebx
    16ba:	5e                   	pop    %esi
    16bb:	5f                   	pop    %edi
    16bc:	5d                   	pop    %ebp
    16bd:	c3                   	ret    
    16be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    16c0:	83 ec 0c             	sub    $0xc,%esp
    16c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    16c8:	6a 00                	push   $0x0
    16ca:	8b 17                	mov    (%edi),%edx
    16cc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    16cf:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    16d2:	e8 69 fe ff ff       	call   1540 <printint>
    16d7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16da:	31 d2                	xor    %edx,%edx
    16dc:	e9 4e ff ff ff       	jmp    162f <printf+0x4f>
    16e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    16e8:	83 ec 04             	sub    $0x4,%esp
    16eb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    16ee:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16f1:	6a 01                	push   $0x1
    16f3:	eb a8                	jmp    169d <printf+0xbd>
    16f5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16f8:	83 ec 0c             	sub    $0xc,%esp
    16fb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1700:	6a 01                	push   $0x1
    1702:	eb c6                	jmp    16ca <printf+0xea>
    1704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1708:	8b 57 04             	mov    0x4(%edi),%edx
    170b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    170d:	85 d2                	test   %edx,%edx
    170f:	74 15                	je     1726 <printf+0x146>
    1711:	83 ec 0c             	sub    $0xc,%esp
    1714:	8b 45 08             	mov    0x8(%ebp),%eax
    1717:	b9 10 00 00 00       	mov    $0x10,%ecx
    171c:	6a 00                	push   $0x0
    171e:	e8 1d fe ff ff       	call   1540 <printint>
    1723:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1726:	83 ec 0c             	sub    $0xc,%esp
    1729:	8b 45 08             	mov    0x8(%ebp),%eax
    172c:	89 da                	mov    %ebx,%edx
    172e:	6a 00                	push   $0x0
    1730:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1735:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1738:	e8 03 fe ff ff       	call   1540 <printint>
    173d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1740:	31 d2                	xor    %edx,%edx
    1742:	e9 e8 fe ff ff       	jmp    162f <printf+0x4f>
    1747:	89 f6                	mov    %esi,%esi
    1749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1750:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1752:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1755:	85 c9                	test   %ecx,%ecx
    1757:	74 6a                	je     17c3 <printf+0x1e3>
        while(*s != 0){
    1759:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    175c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    175e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1760:	84 c0                	test   %al,%al
    1762:	0f 84 c7 fe ff ff    	je     162f <printf+0x4f>
    1768:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    176b:	89 de                	mov    %ebx,%esi
    176d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1770:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1773:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1776:	83 ec 04             	sub    $0x4,%esp
    1779:	6a 01                	push   $0x1
          s++;
    177b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    177e:	50                   	push   %eax
    177f:	53                   	push   %ebx
    1780:	e8 f4 fc ff ff       	call   1479 <write>
        while(*s != 0){
    1785:	0f b6 06             	movzbl (%esi),%eax
    1788:	83 c4 10             	add    $0x10,%esp
    178b:	84 c0                	test   %al,%al
    178d:	75 e1                	jne    1770 <printf+0x190>
    178f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1792:	31 d2                	xor    %edx,%edx
    1794:	e9 96 fe ff ff       	jmp    162f <printf+0x4f>
    1799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    17a0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    17a2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    17a5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    17a8:	6a 01                	push   $0x1
        putc(fd, *ap);
    17aa:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    17ad:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    17b0:	50                   	push   %eax
    17b1:	ff 75 08             	pushl  0x8(%ebp)
    17b4:	e8 c0 fc ff ff       	call   1479 <write>
    17b9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17bc:	31 d2                	xor    %edx,%edx
    17be:	e9 6c fe ff ff       	jmp    162f <printf+0x4f>
          s = "(null)";
    17c3:	bb d0 17 00 00       	mov    $0x17d0,%ebx
        while(*s != 0){
    17c8:	b8 28 00 00 00       	mov    $0x28,%eax
    17cd:	eb 99                	jmp    1768 <printf+0x188>
