
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
    1011:	e8 e3 04 00 00       	call   14f9 <getpid>

   if (fork() == 0) {
    1016:	e8 56 04 00 00       	call   1471 <fork>
    101b:	85 c0                	test   %eax,%eax
    101d:	75 15                	jne    1034 <main+0x34>
      uint * nullp = (uint*)0;
      printf(1, "null dereference: ");
    101f:	52                   	push   %edx
    1020:	52                   	push   %edx
    1021:	68 f0 17 00 00       	push   $0x17f0
    1026:	6a 01                	push   $0x1
    1028:	e8 d3 05 00 00       	call   1600 <printf>
      printf(1, "%x %x\n", nullp, *nullp);
    102d:	a1 00 00 00 00       	mov    0x0,%eax
    1032:	0f 0b                	ud2    
      // this process should be killed
      printf(1, "TEST FAILED\n");
      kill(ppid);
      exit();
   } else {
      wait();
    1034:	e8 48 04 00 00       	call   1481 <wait>
   }

   printf(1, "TEST PASSED\n");
    1039:	50                   	push   %eax
    103a:	50                   	push   %eax
    103b:	68 03 18 00 00       	push   $0x1803
    1040:	6a 01                	push   $0x1
    1042:	e8 b9 05 00 00       	call   1600 <printf>
   exit();
    1047:	e8 2d 04 00 00       	call   1479 <exit>
    104c:	66 90                	xchg   %ax,%ax
    104e:	66 90                	xchg   %ax,%ax

00001050 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
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
    1183:	e8 09 03 00 00       	call   1491 <read>
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
    11ed:	e8 c7 02 00 00       	call   14b9 <open>
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
    1202:	e8 ca 02 00 00       	call   14d1 <fstat>
  close(fd);
    1207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    120a:	89 c6                	mov    %eax,%esi
  close(fd);
    120c:	e8 90 02 00 00       	call   14a1 <close>
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
    129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012a0 <thread_join>:
  }*/
  return clone(start_routine, arg1, arg2, stack);
}

int thread_join()
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    12a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    12a9:	50                   	push   %eax
    12aa:	e8 a2 02 00 00       	call   1551 <join>
  //free(stackPtr);
  return x;
}
    12af:	c9                   	leave  
    12b0:	c3                   	ret    
    12b1:	eb 0d                	jmp    12c0 <free>
    12b3:	90                   	nop
    12b4:	90                   	nop
    12b5:	90                   	nop
    12b6:	90                   	nop
    12b7:	90                   	nop
    12b8:	90                   	nop
    12b9:	90                   	nop
    12ba:	90                   	nop
    12bb:	90                   	nop
    12bc:	90                   	nop
    12bd:	90                   	nop
    12be:	90                   	nop
    12bf:	90                   	nop

000012c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12c1:	a1 fc 1a 00 00       	mov    0x1afc,%eax
{
    12c6:	89 e5                	mov    %esp,%ebp
    12c8:	57                   	push   %edi
    12c9:	56                   	push   %esi
    12ca:	53                   	push   %ebx
    12cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12d8:	39 c8                	cmp    %ecx,%eax
    12da:	8b 10                	mov    (%eax),%edx
    12dc:	73 32                	jae    1310 <free+0x50>
    12de:	39 d1                	cmp    %edx,%ecx
    12e0:	72 04                	jb     12e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12e2:	39 d0                	cmp    %edx,%eax
    12e4:	72 32                	jb     1318 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12ec:	39 fa                	cmp    %edi,%edx
    12ee:	74 30                	je     1320 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    12f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12f3:	8b 50 04             	mov    0x4(%eax),%edx
    12f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12f9:	39 f1                	cmp    %esi,%ecx
    12fb:	74 3a                	je     1337 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    12fd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    12ff:	a3 fc 1a 00 00       	mov    %eax,0x1afc
}
    1304:	5b                   	pop    %ebx
    1305:	5e                   	pop    %esi
    1306:	5f                   	pop    %edi
    1307:	5d                   	pop    %ebp
    1308:	c3                   	ret    
    1309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1310:	39 d0                	cmp    %edx,%eax
    1312:	72 04                	jb     1318 <free+0x58>
    1314:	39 d1                	cmp    %edx,%ecx
    1316:	72 ce                	jb     12e6 <free+0x26>
{
    1318:	89 d0                	mov    %edx,%eax
    131a:	eb bc                	jmp    12d8 <free+0x18>
    131c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1320:	03 72 04             	add    0x4(%edx),%esi
    1323:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1326:	8b 10                	mov    (%eax),%edx
    1328:	8b 12                	mov    (%edx),%edx
    132a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    132d:	8b 50 04             	mov    0x4(%eax),%edx
    1330:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1333:	39 f1                	cmp    %esi,%ecx
    1335:	75 c6                	jne    12fd <free+0x3d>
    p->s.size += bp->s.size;
    1337:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    133a:	a3 fc 1a 00 00       	mov    %eax,0x1afc
    p->s.size += bp->s.size;
    133f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1342:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1345:	89 10                	mov    %edx,(%eax)
}
    1347:	5b                   	pop    %ebx
    1348:	5e                   	pop    %esi
    1349:	5f                   	pop    %edi
    134a:	5d                   	pop    %ebp
    134b:	c3                   	ret    
    134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001350 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	56                   	push   %esi
    1355:	53                   	push   %ebx
    1356:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1359:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    135c:	8b 15 fc 1a 00 00    	mov    0x1afc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1362:	8d 78 07             	lea    0x7(%eax),%edi
    1365:	c1 ef 03             	shr    $0x3,%edi
    1368:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    136b:	85 d2                	test   %edx,%edx
    136d:	0f 84 9d 00 00 00    	je     1410 <malloc+0xc0>
    1373:	8b 02                	mov    (%edx),%eax
    1375:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1378:	39 cf                	cmp    %ecx,%edi
    137a:	76 6c                	jbe    13e8 <malloc+0x98>
    137c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1382:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1387:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    138a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1391:	eb 0e                	jmp    13a1 <malloc+0x51>
    1393:	90                   	nop
    1394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1398:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    139a:	8b 48 04             	mov    0x4(%eax),%ecx
    139d:	39 f9                	cmp    %edi,%ecx
    139f:	73 47                	jae    13e8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13a1:	39 05 fc 1a 00 00    	cmp    %eax,0x1afc
    13a7:	89 c2                	mov    %eax,%edx
    13a9:	75 ed                	jne    1398 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13ab:	83 ec 0c             	sub    $0xc,%esp
    13ae:	56                   	push   %esi
    13af:	e8 4d 01 00 00       	call   1501 <sbrk>
  if(p == (char*)-1)
    13b4:	83 c4 10             	add    $0x10,%esp
    13b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    13ba:	74 1c                	je     13d8 <malloc+0x88>
  hp->s.size = nu;
    13bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13bf:	83 ec 0c             	sub    $0xc,%esp
    13c2:	83 c0 08             	add    $0x8,%eax
    13c5:	50                   	push   %eax
    13c6:	e8 f5 fe ff ff       	call   12c0 <free>
  return freep;
    13cb:	8b 15 fc 1a 00 00    	mov    0x1afc,%edx
      if((p = morecore(nunits)) == 0)
    13d1:	83 c4 10             	add    $0x10,%esp
    13d4:	85 d2                	test   %edx,%edx
    13d6:	75 c0                	jne    1398 <malloc+0x48>
        return 0;
  }
    13d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    13db:	31 c0                	xor    %eax,%eax
    13dd:	5b                   	pop    %ebx
    13de:	5e                   	pop    %esi
    13df:	5f                   	pop    %edi
    13e0:	5d                   	pop    %ebp
    13e1:	c3                   	ret    
    13e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13e8:	39 cf                	cmp    %ecx,%edi
    13ea:	74 54                	je     1440 <malloc+0xf0>
        p->s.size -= nunits;
    13ec:	29 f9                	sub    %edi,%ecx
    13ee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13f4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    13f7:	89 15 fc 1a 00 00    	mov    %edx,0x1afc
    13fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1400:	83 c0 08             	add    $0x8,%eax
    1403:	5b                   	pop    %ebx
    1404:	5e                   	pop    %esi
    1405:	5f                   	pop    %edi
    1406:	5d                   	pop    %ebp
    1407:	c3                   	ret    
    1408:	90                   	nop
    1409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1410:	c7 05 fc 1a 00 00 00 	movl   $0x1b00,0x1afc
    1417:	1b 00 00 
    141a:	c7 05 00 1b 00 00 00 	movl   $0x1b00,0x1b00
    1421:	1b 00 00 
    base.s.size = 0;
    1424:	b8 00 1b 00 00       	mov    $0x1b00,%eax
    1429:	c7 05 04 1b 00 00 00 	movl   $0x0,0x1b04
    1430:	00 00 00 
    1433:	e9 44 ff ff ff       	jmp    137c <malloc+0x2c>
    1438:	90                   	nop
    1439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1440:	8b 08                	mov    (%eax),%ecx
    1442:	89 0a                	mov    %ecx,(%edx)
    1444:	eb b1                	jmp    13f7 <malloc+0xa7>
    1446:	8d 76 00             	lea    0x0(%esi),%esi
    1449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001450 <thread_create>:
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(PGSIZE);
    1456:	68 00 10 00 00       	push   $0x1000
    145b:	e8 f0 fe ff ff       	call   1350 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    1460:	50                   	push   %eax
    1461:	ff 75 10             	pushl  0x10(%ebp)
    1464:	ff 75 0c             	pushl  0xc(%ebp)
    1467:	ff 75 08             	pushl  0x8(%ebp)
    146a:	e8 da 00 00 00       	call   1549 <clone>
}
    146f:	c9                   	leave  
    1470:	c3                   	ret    

00001471 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1471:	b8 01 00 00 00       	mov    $0x1,%eax
    1476:	cd 40                	int    $0x40
    1478:	c3                   	ret    

00001479 <exit>:
SYSCALL(exit)
    1479:	b8 02 00 00 00       	mov    $0x2,%eax
    147e:	cd 40                	int    $0x40
    1480:	c3                   	ret    

00001481 <wait>:
SYSCALL(wait)
    1481:	b8 03 00 00 00       	mov    $0x3,%eax
    1486:	cd 40                	int    $0x40
    1488:	c3                   	ret    

00001489 <pipe>:
SYSCALL(pipe)
    1489:	b8 04 00 00 00       	mov    $0x4,%eax
    148e:	cd 40                	int    $0x40
    1490:	c3                   	ret    

00001491 <read>:
SYSCALL(read)
    1491:	b8 05 00 00 00       	mov    $0x5,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <write>:
SYSCALL(write)
    1499:	b8 10 00 00 00       	mov    $0x10,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <close>:
SYSCALL(close)
    14a1:	b8 15 00 00 00       	mov    $0x15,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <kill>:
SYSCALL(kill)
    14a9:	b8 06 00 00 00       	mov    $0x6,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <exec>:
SYSCALL(exec)
    14b1:	b8 07 00 00 00       	mov    $0x7,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <open>:
SYSCALL(open)
    14b9:	b8 0f 00 00 00       	mov    $0xf,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <mknod>:
SYSCALL(mknod)
    14c1:	b8 11 00 00 00       	mov    $0x11,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <unlink>:
SYSCALL(unlink)
    14c9:	b8 12 00 00 00       	mov    $0x12,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <fstat>:
SYSCALL(fstat)
    14d1:	b8 08 00 00 00       	mov    $0x8,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <link>:
SYSCALL(link)
    14d9:	b8 13 00 00 00       	mov    $0x13,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <mkdir>:
SYSCALL(mkdir)
    14e1:	b8 14 00 00 00       	mov    $0x14,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <chdir>:
SYSCALL(chdir)
    14e9:	b8 09 00 00 00       	mov    $0x9,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <dup>:
SYSCALL(dup)
    14f1:	b8 0a 00 00 00       	mov    $0xa,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <getpid>:
SYSCALL(getpid)
    14f9:	b8 0b 00 00 00       	mov    $0xb,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <sbrk>:
SYSCALL(sbrk)
    1501:	b8 0c 00 00 00       	mov    $0xc,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <sleep>:
SYSCALL(sleep)
    1509:	b8 0d 00 00 00       	mov    $0xd,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    

00001511 <uptime>:
SYSCALL(uptime)
    1511:	b8 0e 00 00 00       	mov    $0xe,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <getreadcount>:
SYSCALL(getreadcount)
    1519:	b8 16 00 00 00       	mov    $0x16,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <gettime>:
SYSCALL(gettime)
    1521:	b8 17 00 00 00       	mov    $0x17,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <settickets>:
SYSCALL(settickets)
    1529:	b8 18 00 00 00       	mov    $0x18,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <getpinfo>:
SYSCALL(getpinfo)
    1531:	b8 19 00 00 00       	mov    $0x19,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <mprotect>:
SYSCALL(mprotect)
    1539:	b8 1a 00 00 00       	mov    $0x1a,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <munprotect>:
SYSCALL(munprotect)
    1541:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <clone>:
SYSCALL(clone)
    1549:	b8 1c 00 00 00       	mov    $0x1c,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    

00001551 <join>:
    1551:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1556:	cd 40                	int    $0x40
    1558:	c3                   	ret    
    1559:	66 90                	xchg   %ax,%ax
    155b:	66 90                	xchg   %ax,%ax
    155d:	66 90                	xchg   %ax,%ax
    155f:	90                   	nop

00001560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1560:	55                   	push   %ebp
    1561:	89 e5                	mov    %esp,%ebp
    1563:	57                   	push   %edi
    1564:	56                   	push   %esi
    1565:	53                   	push   %ebx
    1566:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1569:	85 d2                	test   %edx,%edx
{
    156b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    156e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1570:	79 76                	jns    15e8 <printint+0x88>
    1572:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1576:	74 70                	je     15e8 <printint+0x88>
    x = -xx;
    1578:	f7 d8                	neg    %eax
    neg = 1;
    157a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1581:	31 f6                	xor    %esi,%esi
    1583:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1586:	eb 0a                	jmp    1592 <printint+0x32>
    1588:	90                   	nop
    1589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1590:	89 fe                	mov    %edi,%esi
    1592:	31 d2                	xor    %edx,%edx
    1594:	8d 7e 01             	lea    0x1(%esi),%edi
    1597:	f7 f1                	div    %ecx
    1599:	0f b6 92 18 18 00 00 	movzbl 0x1818(%edx),%edx
  }while((x /= base) != 0);
    15a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    15a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    15a5:	75 e9                	jne    1590 <printint+0x30>
  if(neg)
    15a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    15aa:	85 c0                	test   %eax,%eax
    15ac:	74 08                	je     15b6 <printint+0x56>
    buf[i++] = '-';
    15ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    15b3:	8d 7e 02             	lea    0x2(%esi),%edi
    15b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    15ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
    15bd:	8d 76 00             	lea    0x0(%esi),%esi
    15c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    15c3:	83 ec 04             	sub    $0x4,%esp
    15c6:	83 ee 01             	sub    $0x1,%esi
    15c9:	6a 01                	push   $0x1
    15cb:	53                   	push   %ebx
    15cc:	57                   	push   %edi
    15cd:	88 45 d7             	mov    %al,-0x29(%ebp)
    15d0:	e8 c4 fe ff ff       	call   1499 <write>

  while(--i >= 0)
    15d5:	83 c4 10             	add    $0x10,%esp
    15d8:	39 de                	cmp    %ebx,%esi
    15da:	75 e4                	jne    15c0 <printint+0x60>
    putc(fd, buf[i]);
}
    15dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15df:	5b                   	pop    %ebx
    15e0:	5e                   	pop    %esi
    15e1:	5f                   	pop    %edi
    15e2:	5d                   	pop    %ebp
    15e3:	c3                   	ret    
    15e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    15e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    15ef:	eb 90                	jmp    1581 <printint+0x21>
    15f1:	eb 0d                	jmp    1600 <printf>
    15f3:	90                   	nop
    15f4:	90                   	nop
    15f5:	90                   	nop
    15f6:	90                   	nop
    15f7:	90                   	nop
    15f8:	90                   	nop
    15f9:	90                   	nop
    15fa:	90                   	nop
    15fb:	90                   	nop
    15fc:	90                   	nop
    15fd:	90                   	nop
    15fe:	90                   	nop
    15ff:	90                   	nop

00001600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1600:	55                   	push   %ebp
    1601:	89 e5                	mov    %esp,%ebp
    1603:	57                   	push   %edi
    1604:	56                   	push   %esi
    1605:	53                   	push   %ebx
    1606:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1609:	8b 75 0c             	mov    0xc(%ebp),%esi
    160c:	0f b6 1e             	movzbl (%esi),%ebx
    160f:	84 db                	test   %bl,%bl
    1611:	0f 84 bf 00 00 00    	je     16d6 <printf+0xd6>
    1617:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    161a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    161d:	31 d2                	xor    %edx,%edx
    161f:	eb 39                	jmp    165a <printf+0x5a>
    1621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1628:	83 f8 25             	cmp    $0x25,%eax
    162b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    162e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1633:	74 1a                	je     164f <printf+0x4f>
  write(fd, &c, 1);
    1635:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1638:	83 ec 04             	sub    $0x4,%esp
    163b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    163e:	6a 01                	push   $0x1
    1640:	50                   	push   %eax
    1641:	ff 75 08             	pushl  0x8(%ebp)
    1644:	e8 50 fe ff ff       	call   1499 <write>
    1649:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    164c:	83 c4 10             	add    $0x10,%esp
    164f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1652:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1656:	84 db                	test   %bl,%bl
    1658:	74 7c                	je     16d6 <printf+0xd6>
    if(state == 0){
    165a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    165c:	0f be cb             	movsbl %bl,%ecx
    165f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1662:	74 c4                	je     1628 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1664:	83 fa 25             	cmp    $0x25,%edx
    1667:	75 e6                	jne    164f <printf+0x4f>
      if(c == 'd'){
    1669:	83 f8 64             	cmp    $0x64,%eax
    166c:	0f 84 a6 00 00 00    	je     1718 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1672:	83 f8 6c             	cmp    $0x6c,%eax
    1675:	0f 84 ad 00 00 00    	je     1728 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    167b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1681:	83 f9 70             	cmp    $0x70,%ecx
    1684:	74 5a                	je     16e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1686:	83 f8 73             	cmp    $0x73,%eax
    1689:	0f 84 e1 00 00 00    	je     1770 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    168f:	83 f8 63             	cmp    $0x63,%eax
    1692:	0f 84 28 01 00 00    	je     17c0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1698:	83 f8 25             	cmp    $0x25,%eax
    169b:	74 6b                	je     1708 <printf+0x108>
  write(fd, &c, 1);
    169d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    16a0:	83 ec 04             	sub    $0x4,%esp
    16a3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16a7:	6a 01                	push   $0x1
    16a9:	50                   	push   %eax
    16aa:	ff 75 08             	pushl  0x8(%ebp)
    16ad:	e8 e7 fd ff ff       	call   1499 <write>
    16b2:	83 c4 0c             	add    $0xc,%esp
    16b5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    16b8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    16bb:	6a 01                	push   $0x1
    16bd:	50                   	push   %eax
    16be:	ff 75 08             	pushl  0x8(%ebp)
    16c1:	83 c6 01             	add    $0x1,%esi
    16c4:	e8 d0 fd ff ff       	call   1499 <write>
  for(i = 0; fmt[i]; i++){
    16c9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    16cd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    16d0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    16d2:	84 db                	test   %bl,%bl
    16d4:	75 84                	jne    165a <printf+0x5a>
    }
  }
}
    16d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16d9:	5b                   	pop    %ebx
    16da:	5e                   	pop    %esi
    16db:	5f                   	pop    %edi
    16dc:	5d                   	pop    %ebp
    16dd:	c3                   	ret    
    16de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    16e0:	83 ec 0c             	sub    $0xc,%esp
    16e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    16e8:	6a 00                	push   $0x0
    16ea:	8b 17                	mov    (%edi),%edx
    16ec:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    16ef:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    16f2:	e8 69 fe ff ff       	call   1560 <printint>
    16f7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16fa:	31 d2                	xor    %edx,%edx
    16fc:	e9 4e ff ff ff       	jmp    164f <printf+0x4f>
    1701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1708:	83 ec 04             	sub    $0x4,%esp
    170b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    170e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1711:	6a 01                	push   $0x1
    1713:	eb a8                	jmp    16bd <printf+0xbd>
    1715:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1718:	83 ec 0c             	sub    $0xc,%esp
    171b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1720:	6a 01                	push   $0x1
    1722:	eb c6                	jmp    16ea <printf+0xea>
    1724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1728:	8b 57 04             	mov    0x4(%edi),%edx
    172b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    172d:	85 d2                	test   %edx,%edx
    172f:	74 15                	je     1746 <printf+0x146>
    1731:	83 ec 0c             	sub    $0xc,%esp
    1734:	8b 45 08             	mov    0x8(%ebp),%eax
    1737:	b9 10 00 00 00       	mov    $0x10,%ecx
    173c:	6a 00                	push   $0x0
    173e:	e8 1d fe ff ff       	call   1560 <printint>
    1743:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1746:	83 ec 0c             	sub    $0xc,%esp
    1749:	8b 45 08             	mov    0x8(%ebp),%eax
    174c:	89 da                	mov    %ebx,%edx
    174e:	6a 00                	push   $0x0
    1750:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1755:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1758:	e8 03 fe ff ff       	call   1560 <printint>
    175d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1760:	31 d2                	xor    %edx,%edx
    1762:	e9 e8 fe ff ff       	jmp    164f <printf+0x4f>
    1767:	89 f6                	mov    %esi,%esi
    1769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1770:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1772:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1775:	85 c9                	test   %ecx,%ecx
    1777:	74 6a                	je     17e3 <printf+0x1e3>
        while(*s != 0){
    1779:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    177c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    177e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1780:	84 c0                	test   %al,%al
    1782:	0f 84 c7 fe ff ff    	je     164f <printf+0x4f>
    1788:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    178b:	89 de                	mov    %ebx,%esi
    178d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1790:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1793:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1796:	83 ec 04             	sub    $0x4,%esp
    1799:	6a 01                	push   $0x1
          s++;
    179b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    179e:	50                   	push   %eax
    179f:	53                   	push   %ebx
    17a0:	e8 f4 fc ff ff       	call   1499 <write>
        while(*s != 0){
    17a5:	0f b6 06             	movzbl (%esi),%eax
    17a8:	83 c4 10             	add    $0x10,%esp
    17ab:	84 c0                	test   %al,%al
    17ad:	75 e1                	jne    1790 <printf+0x190>
    17af:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    17b2:	31 d2                	xor    %edx,%edx
    17b4:	e9 96 fe ff ff       	jmp    164f <printf+0x4f>
    17b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    17c0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    17c2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    17c5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    17c8:	6a 01                	push   $0x1
        putc(fd, *ap);
    17ca:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    17cd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    17d0:	50                   	push   %eax
    17d1:	ff 75 08             	pushl  0x8(%ebp)
    17d4:	e8 c0 fc ff ff       	call   1499 <write>
    17d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17dc:	31 d2                	xor    %edx,%edx
    17de:	e9 6c fe ff ff       	jmp    164f <printf+0x4f>
          s = "(null)";
    17e3:	bb 10 18 00 00       	mov    $0x1810,%ebx
        while(*s != 0){
    17e8:	b8 28 00 00 00       	mov    $0x28,%eax
    17ed:	eb 99                	jmp    1788 <printf+0x188>
