
_echo:     file format elf32-i386


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
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
    100f:	51                   	push   %ecx
    1010:	83 ec 0c             	sub    $0xc,%esp
    1013:	8b 01                	mov    (%ecx),%eax
    1015:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  for(i = 1; i < argc; i++)
    1018:	83 f8 01             	cmp    $0x1,%eax
    101b:	7e 3f                	jle    105c <main+0x5c>
    101d:	8d 5a 04             	lea    0x4(%edx),%ebx
    1020:	8d 34 82             	lea    (%edx,%eax,4),%esi
    1023:	eb 18                	jmp    103d <main+0x3d>
    1025:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
    1028:	68 10 18 00 00       	push   $0x1810
    102d:	50                   	push   %eax
    102e:	68 12 18 00 00       	push   $0x1812
    1033:	6a 01                	push   $0x1
    1035:	e8 e6 05 00 00       	call   1620 <printf>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	83 c3 04             	add    $0x4,%ebx
    1040:	8b 43 fc             	mov    -0x4(%ebx),%eax
    1043:	39 f3                	cmp    %esi,%ebx
    1045:	75 e1                	jne    1028 <main+0x28>
    1047:	68 17 18 00 00       	push   $0x1817
    104c:	50                   	push   %eax
    104d:	68 12 18 00 00       	push   $0x1812
    1052:	6a 01                	push   $0x1
    1054:	e8 c7 05 00 00       	call   1620 <printf>
    1059:	83 c4 10             	add    $0x10,%esp
  exit();
    105c:	e8 38 04 00 00       	call   1499 <exit>
    1061:	66 90                	xchg   %ax,%ax
    1063:	66 90                	xchg   %ax,%ax
    1065:	66 90                	xchg   %ax,%ax
    1067:	66 90                	xchg   %ax,%ax
    1069:	66 90                	xchg   %ax,%ax
    106b:	66 90                	xchg   %ax,%ax
    106d:	66 90                	xchg   %ax,%ax
    106f:	90                   	nop

00001070 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	53                   	push   %ebx
    1074:	8b 45 08             	mov    0x8(%ebp),%eax
    1077:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    107a:	89 c2                	mov    %eax,%edx
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1080:	83 c1 01             	add    $0x1,%ecx
    1083:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1087:	83 c2 01             	add    $0x1,%edx
    108a:	84 db                	test   %bl,%bl
    108c:	88 5a ff             	mov    %bl,-0x1(%edx)
    108f:	75 ef                	jne    1080 <strcpy+0x10>
    ;
  return os;
}
    1091:	5b                   	pop    %ebx
    1092:	5d                   	pop    %ebp
    1093:	c3                   	ret    
    1094:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    109a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	53                   	push   %ebx
    10a4:	8b 55 08             	mov    0x8(%ebp),%edx
    10a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10aa:	0f b6 02             	movzbl (%edx),%eax
    10ad:	0f b6 19             	movzbl (%ecx),%ebx
    10b0:	84 c0                	test   %al,%al
    10b2:	75 1c                	jne    10d0 <strcmp+0x30>
    10b4:	eb 2a                	jmp    10e0 <strcmp+0x40>
    10b6:	8d 76 00             	lea    0x0(%esi),%esi
    10b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10c0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10c6:	83 c1 01             	add    $0x1,%ecx
    10c9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10cc:	84 c0                	test   %al,%al
    10ce:	74 10                	je     10e0 <strcmp+0x40>
    10d0:	38 d8                	cmp    %bl,%al
    10d2:	74 ec                	je     10c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10d4:	29 d8                	sub    %ebx,%eax
}
    10d6:	5b                   	pop    %ebx
    10d7:	5d                   	pop    %ebp
    10d8:	c3                   	ret    
    10d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10e2:	29 d8                	sub    %ebx,%eax
}
    10e4:	5b                   	pop    %ebx
    10e5:	5d                   	pop    %ebp
    10e6:	c3                   	ret    
    10e7:	89 f6                	mov    %esi,%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010f0 <strlen>:

uint
strlen(const char *s)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10f6:	80 39 00             	cmpb   $0x0,(%ecx)
    10f9:	74 15                	je     1110 <strlen+0x20>
    10fb:	31 d2                	xor    %edx,%edx
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
    1100:	83 c2 01             	add    $0x1,%edx
    1103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1107:	89 d0                	mov    %edx,%eax
    1109:	75 f5                	jne    1100 <strlen+0x10>
    ;
  return n;
}
    110b:	5d                   	pop    %ebp
    110c:	c3                   	ret    
    110d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1110:	31 c0                	xor    %eax,%eax
}
    1112:	5d                   	pop    %ebp
    1113:	c3                   	ret    
    1114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    111a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001120 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1127:	8b 4d 10             	mov    0x10(%ebp),%ecx
    112a:	8b 45 0c             	mov    0xc(%ebp),%eax
    112d:	89 d7                	mov    %edx,%edi
    112f:	fc                   	cld    
    1130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1132:	89 d0                	mov    %edx,%eax
    1134:	5f                   	pop    %edi
    1135:	5d                   	pop    %ebp
    1136:	c3                   	ret    
    1137:	89 f6                	mov    %esi,%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <strchr>:

char*
strchr(const char *s, char c)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 45 08             	mov    0x8(%ebp),%eax
    1147:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    114a:	0f b6 10             	movzbl (%eax),%edx
    114d:	84 d2                	test   %dl,%dl
    114f:	74 1d                	je     116e <strchr+0x2e>
    if(*s == c)
    1151:	38 d3                	cmp    %dl,%bl
    1153:	89 d9                	mov    %ebx,%ecx
    1155:	75 0d                	jne    1164 <strchr+0x24>
    1157:	eb 17                	jmp    1170 <strchr+0x30>
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1160:	38 ca                	cmp    %cl,%dl
    1162:	74 0c                	je     1170 <strchr+0x30>
  for(; *s; s++)
    1164:	83 c0 01             	add    $0x1,%eax
    1167:	0f b6 10             	movzbl (%eax),%edx
    116a:	84 d2                	test   %dl,%dl
    116c:	75 f2                	jne    1160 <strchr+0x20>
      return (char*)s;
  return 0;
    116e:	31 c0                	xor    %eax,%eax
}
    1170:	5b                   	pop    %ebx
    1171:	5d                   	pop    %ebp
    1172:	c3                   	ret    
    1173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001180 <gets>:

char*
gets(char *buf, int max)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
    1185:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1186:	31 f6                	xor    %esi,%esi
    1188:	89 f3                	mov    %esi,%ebx
{
    118a:	83 ec 1c             	sub    $0x1c,%esp
    118d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1190:	eb 2f                	jmp    11c1 <gets+0x41>
    1192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1198:	8d 45 e7             	lea    -0x19(%ebp),%eax
    119b:	83 ec 04             	sub    $0x4,%esp
    119e:	6a 01                	push   $0x1
    11a0:	50                   	push   %eax
    11a1:	6a 00                	push   $0x0
    11a3:	e8 09 03 00 00       	call   14b1 <read>
    if(cc < 1)
    11a8:	83 c4 10             	add    $0x10,%esp
    11ab:	85 c0                	test   %eax,%eax
    11ad:	7e 1c                	jle    11cb <gets+0x4b>
      break;
    buf[i++] = c;
    11af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11b3:	83 c7 01             	add    $0x1,%edi
    11b6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11b9:	3c 0a                	cmp    $0xa,%al
    11bb:	74 23                	je     11e0 <gets+0x60>
    11bd:	3c 0d                	cmp    $0xd,%al
    11bf:	74 1f                	je     11e0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11c1:	83 c3 01             	add    $0x1,%ebx
    11c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11c7:	89 fe                	mov    %edi,%esi
    11c9:	7c cd                	jl     1198 <gets+0x18>
    11cb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11cd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11d0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11d6:	5b                   	pop    %ebx
    11d7:	5e                   	pop    %esi
    11d8:	5f                   	pop    %edi
    11d9:	5d                   	pop    %ebp
    11da:	c3                   	ret    
    11db:	90                   	nop
    11dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e0:	8b 75 08             	mov    0x8(%ebp),%esi
    11e3:	8b 45 08             	mov    0x8(%ebp),%eax
    11e6:	01 de                	add    %ebx,%esi
    11e8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11ea:	c6 03 00             	movb   $0x0,(%ebx)
}
    11ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11f0:	5b                   	pop    %ebx
    11f1:	5e                   	pop    %esi
    11f2:	5f                   	pop    %edi
    11f3:	5d                   	pop    %ebp
    11f4:	c3                   	ret    
    11f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <stat>:

int
stat(const char *n, struct stat *st)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	56                   	push   %esi
    1204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1205:	83 ec 08             	sub    $0x8,%esp
    1208:	6a 00                	push   $0x0
    120a:	ff 75 08             	pushl  0x8(%ebp)
    120d:	e8 c7 02 00 00       	call   14d9 <open>
  if(fd < 0)
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	85 c0                	test   %eax,%eax
    1217:	78 27                	js     1240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1219:	83 ec 08             	sub    $0x8,%esp
    121c:	ff 75 0c             	pushl  0xc(%ebp)
    121f:	89 c3                	mov    %eax,%ebx
    1221:	50                   	push   %eax
    1222:	e8 ca 02 00 00       	call   14f1 <fstat>
  close(fd);
    1227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    122a:	89 c6                	mov    %eax,%esi
  close(fd);
    122c:	e8 90 02 00 00       	call   14c1 <close>
  return r;
    1231:	83 c4 10             	add    $0x10,%esp
}
    1234:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1237:	89 f0                	mov    %esi,%eax
    1239:	5b                   	pop    %ebx
    123a:	5e                   	pop    %esi
    123b:	5d                   	pop    %ebp
    123c:	c3                   	ret    
    123d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1240:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1245:	eb ed                	jmp    1234 <stat+0x34>
    1247:	89 f6                	mov    %esi,%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <atoi>:

int
atoi(const char *s)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1257:	0f be 11             	movsbl (%ecx),%edx
    125a:	8d 42 d0             	lea    -0x30(%edx),%eax
    125d:	3c 09                	cmp    $0x9,%al
  n = 0;
    125f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1264:	77 1f                	ja     1285 <atoi+0x35>
    1266:	8d 76 00             	lea    0x0(%esi),%esi
    1269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1270:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1273:	83 c1 01             	add    $0x1,%ecx
    1276:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    127a:	0f be 11             	movsbl (%ecx),%edx
    127d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1280:	80 fb 09             	cmp    $0x9,%bl
    1283:	76 eb                	jbe    1270 <atoi+0x20>
  return n;
}
    1285:	5b                   	pop    %ebx
    1286:	5d                   	pop    %ebp
    1287:	c3                   	ret    
    1288:	90                   	nop
    1289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	56                   	push   %esi
    1294:	53                   	push   %ebx
    1295:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1298:	8b 45 08             	mov    0x8(%ebp),%eax
    129b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    129e:	85 db                	test   %ebx,%ebx
    12a0:	7e 14                	jle    12b6 <memmove+0x26>
    12a2:	31 d2                	xor    %edx,%edx
    12a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12b2:	39 d3                	cmp    %edx,%ebx
    12b4:	75 f2                	jne    12a8 <memmove+0x18>
  return vdst;
}
    12b6:	5b                   	pop    %ebx
    12b7:	5e                   	pop    %esi
    12b8:	5d                   	pop    %ebp
    12b9:	c3                   	ret    
    12ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012c0 <thread_join>:
  }*/
  return clone(start_routine, arg1, arg2, stack);
}

int thread_join()
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    12c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    12c9:	50                   	push   %eax
    12ca:	e8 a2 02 00 00       	call   1571 <join>
  //free(stackPtr);
  return x;
}
    12cf:	c9                   	leave  
    12d0:	c3                   	ret    
    12d1:	eb 0d                	jmp    12e0 <free>
    12d3:	90                   	nop
    12d4:	90                   	nop
    12d5:	90                   	nop
    12d6:	90                   	nop
    12d7:	90                   	nop
    12d8:	90                   	nop
    12d9:	90                   	nop
    12da:	90                   	nop
    12db:	90                   	nop
    12dc:	90                   	nop
    12dd:	90                   	nop
    12de:	90                   	nop
    12df:	90                   	nop

000012e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12e1:	a1 0c 1b 00 00       	mov    0x1b0c,%eax
{
    12e6:	89 e5                	mov    %esp,%ebp
    12e8:	57                   	push   %edi
    12e9:	56                   	push   %esi
    12ea:	53                   	push   %ebx
    12eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12f8:	39 c8                	cmp    %ecx,%eax
    12fa:	8b 10                	mov    (%eax),%edx
    12fc:	73 32                	jae    1330 <free+0x50>
    12fe:	39 d1                	cmp    %edx,%ecx
    1300:	72 04                	jb     1306 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1302:	39 d0                	cmp    %edx,%eax
    1304:	72 32                	jb     1338 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1306:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1309:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    130c:	39 fa                	cmp    %edi,%edx
    130e:	74 30                	je     1340 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1310:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1313:	8b 50 04             	mov    0x4(%eax),%edx
    1316:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1319:	39 f1                	cmp    %esi,%ecx
    131b:	74 3a                	je     1357 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    131d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    131f:	a3 0c 1b 00 00       	mov    %eax,0x1b0c
}
    1324:	5b                   	pop    %ebx
    1325:	5e                   	pop    %esi
    1326:	5f                   	pop    %edi
    1327:	5d                   	pop    %ebp
    1328:	c3                   	ret    
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1330:	39 d0                	cmp    %edx,%eax
    1332:	72 04                	jb     1338 <free+0x58>
    1334:	39 d1                	cmp    %edx,%ecx
    1336:	72 ce                	jb     1306 <free+0x26>
{
    1338:	89 d0                	mov    %edx,%eax
    133a:	eb bc                	jmp    12f8 <free+0x18>
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1340:	03 72 04             	add    0x4(%edx),%esi
    1343:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1346:	8b 10                	mov    (%eax),%edx
    1348:	8b 12                	mov    (%edx),%edx
    134a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    134d:	8b 50 04             	mov    0x4(%eax),%edx
    1350:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1353:	39 f1                	cmp    %esi,%ecx
    1355:	75 c6                	jne    131d <free+0x3d>
    p->s.size += bp->s.size;
    1357:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    135a:	a3 0c 1b 00 00       	mov    %eax,0x1b0c
    p->s.size += bp->s.size;
    135f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1362:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1365:	89 10                	mov    %edx,(%eax)
}
    1367:	5b                   	pop    %ebx
    1368:	5e                   	pop    %esi
    1369:	5f                   	pop    %edi
    136a:	5d                   	pop    %ebp
    136b:	c3                   	ret    
    136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001370 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	57                   	push   %edi
    1374:	56                   	push   %esi
    1375:	53                   	push   %ebx
    1376:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1379:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    137c:	8b 15 0c 1b 00 00    	mov    0x1b0c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1382:	8d 78 07             	lea    0x7(%eax),%edi
    1385:	c1 ef 03             	shr    $0x3,%edi
    1388:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    138b:	85 d2                	test   %edx,%edx
    138d:	0f 84 9d 00 00 00    	je     1430 <malloc+0xc0>
    1393:	8b 02                	mov    (%edx),%eax
    1395:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1398:	39 cf                	cmp    %ecx,%edi
    139a:	76 6c                	jbe    1408 <malloc+0x98>
    139c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    13a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    13a7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    13aa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13b1:	eb 0e                	jmp    13c1 <malloc+0x51>
    13b3:	90                   	nop
    13b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    13ba:	8b 48 04             	mov    0x4(%eax),%ecx
    13bd:	39 f9                	cmp    %edi,%ecx
    13bf:	73 47                	jae    1408 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13c1:	39 05 0c 1b 00 00    	cmp    %eax,0x1b0c
    13c7:	89 c2                	mov    %eax,%edx
    13c9:	75 ed                	jne    13b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13cb:	83 ec 0c             	sub    $0xc,%esp
    13ce:	56                   	push   %esi
    13cf:	e8 4d 01 00 00       	call   1521 <sbrk>
  if(p == (char*)-1)
    13d4:	83 c4 10             	add    $0x10,%esp
    13d7:	83 f8 ff             	cmp    $0xffffffff,%eax
    13da:	74 1c                	je     13f8 <malloc+0x88>
  hp->s.size = nu;
    13dc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13df:	83 ec 0c             	sub    $0xc,%esp
    13e2:	83 c0 08             	add    $0x8,%eax
    13e5:	50                   	push   %eax
    13e6:	e8 f5 fe ff ff       	call   12e0 <free>
  return freep;
    13eb:	8b 15 0c 1b 00 00    	mov    0x1b0c,%edx
      if((p = morecore(nunits)) == 0)
    13f1:	83 c4 10             	add    $0x10,%esp
    13f4:	85 d2                	test   %edx,%edx
    13f6:	75 c0                	jne    13b8 <malloc+0x48>
        return 0;
  }
    13f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    13fb:	31 c0                	xor    %eax,%eax
    13fd:	5b                   	pop    %ebx
    13fe:	5e                   	pop    %esi
    13ff:	5f                   	pop    %edi
    1400:	5d                   	pop    %ebp
    1401:	c3                   	ret    
    1402:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1408:	39 cf                	cmp    %ecx,%edi
    140a:	74 54                	je     1460 <malloc+0xf0>
        p->s.size -= nunits;
    140c:	29 f9                	sub    %edi,%ecx
    140e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1411:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1414:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1417:	89 15 0c 1b 00 00    	mov    %edx,0x1b0c
    141d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1420:	83 c0 08             	add    $0x8,%eax
    1423:	5b                   	pop    %ebx
    1424:	5e                   	pop    %esi
    1425:	5f                   	pop    %edi
    1426:	5d                   	pop    %ebp
    1427:	c3                   	ret    
    1428:	90                   	nop
    1429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1430:	c7 05 0c 1b 00 00 10 	movl   $0x1b10,0x1b0c
    1437:	1b 00 00 
    143a:	c7 05 10 1b 00 00 10 	movl   $0x1b10,0x1b10
    1441:	1b 00 00 
    base.s.size = 0;
    1444:	b8 10 1b 00 00       	mov    $0x1b10,%eax
    1449:	c7 05 14 1b 00 00 00 	movl   $0x0,0x1b14
    1450:	00 00 00 
    1453:	e9 44 ff ff ff       	jmp    139c <malloc+0x2c>
    1458:	90                   	nop
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1460:	8b 08                	mov    (%eax),%ecx
    1462:	89 0a                	mov    %ecx,(%edx)
    1464:	eb b1                	jmp    1417 <malloc+0xa7>
    1466:	8d 76 00             	lea    0x0(%esi),%esi
    1469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001470 <thread_create>:
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(PGSIZE);
    1476:	68 00 10 00 00       	push   $0x1000
    147b:	e8 f0 fe ff ff       	call   1370 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    1480:	50                   	push   %eax
    1481:	ff 75 10             	pushl  0x10(%ebp)
    1484:	ff 75 0c             	pushl  0xc(%ebp)
    1487:	ff 75 08             	pushl  0x8(%ebp)
    148a:	e8 da 00 00 00       	call   1569 <clone>
}
    148f:	c9                   	leave  
    1490:	c3                   	ret    

00001491 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1491:	b8 01 00 00 00       	mov    $0x1,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <exit>:
SYSCALL(exit)
    1499:	b8 02 00 00 00       	mov    $0x2,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <wait>:
SYSCALL(wait)
    14a1:	b8 03 00 00 00       	mov    $0x3,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <pipe>:
SYSCALL(pipe)
    14a9:	b8 04 00 00 00       	mov    $0x4,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <read>:
SYSCALL(read)
    14b1:	b8 05 00 00 00       	mov    $0x5,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <write>:
SYSCALL(write)
    14b9:	b8 10 00 00 00       	mov    $0x10,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <close>:
SYSCALL(close)
    14c1:	b8 15 00 00 00       	mov    $0x15,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <kill>:
SYSCALL(kill)
    14c9:	b8 06 00 00 00       	mov    $0x6,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <exec>:
SYSCALL(exec)
    14d1:	b8 07 00 00 00       	mov    $0x7,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <open>:
SYSCALL(open)
    14d9:	b8 0f 00 00 00       	mov    $0xf,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <mknod>:
SYSCALL(mknod)
    14e1:	b8 11 00 00 00       	mov    $0x11,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <unlink>:
SYSCALL(unlink)
    14e9:	b8 12 00 00 00       	mov    $0x12,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <fstat>:
SYSCALL(fstat)
    14f1:	b8 08 00 00 00       	mov    $0x8,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <link>:
SYSCALL(link)
    14f9:	b8 13 00 00 00       	mov    $0x13,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <mkdir>:
SYSCALL(mkdir)
    1501:	b8 14 00 00 00       	mov    $0x14,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <chdir>:
SYSCALL(chdir)
    1509:	b8 09 00 00 00       	mov    $0x9,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    

00001511 <dup>:
SYSCALL(dup)
    1511:	b8 0a 00 00 00       	mov    $0xa,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <getpid>:
SYSCALL(getpid)
    1519:	b8 0b 00 00 00       	mov    $0xb,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <sbrk>:
SYSCALL(sbrk)
    1521:	b8 0c 00 00 00       	mov    $0xc,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <sleep>:
SYSCALL(sleep)
    1529:	b8 0d 00 00 00       	mov    $0xd,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <uptime>:
SYSCALL(uptime)
    1531:	b8 0e 00 00 00       	mov    $0xe,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <getreadcount>:
SYSCALL(getreadcount)
    1539:	b8 16 00 00 00       	mov    $0x16,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <gettime>:
SYSCALL(gettime)
    1541:	b8 17 00 00 00       	mov    $0x17,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <settickets>:
SYSCALL(settickets)
    1549:	b8 18 00 00 00       	mov    $0x18,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    

00001551 <getpinfo>:
SYSCALL(getpinfo)
    1551:	b8 19 00 00 00       	mov    $0x19,%eax
    1556:	cd 40                	int    $0x40
    1558:	c3                   	ret    

00001559 <mprotect>:
SYSCALL(mprotect)
    1559:	b8 1a 00 00 00       	mov    $0x1a,%eax
    155e:	cd 40                	int    $0x40
    1560:	c3                   	ret    

00001561 <munprotect>:
SYSCALL(munprotect)
    1561:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1566:	cd 40                	int    $0x40
    1568:	c3                   	ret    

00001569 <clone>:
SYSCALL(clone)
    1569:	b8 1c 00 00 00       	mov    $0x1c,%eax
    156e:	cd 40                	int    $0x40
    1570:	c3                   	ret    

00001571 <join>:
    1571:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1576:	cd 40                	int    $0x40
    1578:	c3                   	ret    
    1579:	66 90                	xchg   %ax,%ax
    157b:	66 90                	xchg   %ax,%ax
    157d:	66 90                	xchg   %ax,%ax
    157f:	90                   	nop

00001580 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1580:	55                   	push   %ebp
    1581:	89 e5                	mov    %esp,%ebp
    1583:	57                   	push   %edi
    1584:	56                   	push   %esi
    1585:	53                   	push   %ebx
    1586:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1589:	85 d2                	test   %edx,%edx
{
    158b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    158e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1590:	79 76                	jns    1608 <printint+0x88>
    1592:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1596:	74 70                	je     1608 <printint+0x88>
    x = -xx;
    1598:	f7 d8                	neg    %eax
    neg = 1;
    159a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    15a1:	31 f6                	xor    %esi,%esi
    15a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    15a6:	eb 0a                	jmp    15b2 <printint+0x32>
    15a8:	90                   	nop
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    15b0:	89 fe                	mov    %edi,%esi
    15b2:	31 d2                	xor    %edx,%edx
    15b4:	8d 7e 01             	lea    0x1(%esi),%edi
    15b7:	f7 f1                	div    %ecx
    15b9:	0f b6 92 20 18 00 00 	movzbl 0x1820(%edx),%edx
  }while((x /= base) != 0);
    15c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    15c2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    15c5:	75 e9                	jne    15b0 <printint+0x30>
  if(neg)
    15c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    15ca:	85 c0                	test   %eax,%eax
    15cc:	74 08                	je     15d6 <printint+0x56>
    buf[i++] = '-';
    15ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    15d3:	8d 7e 02             	lea    0x2(%esi),%edi
    15d6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    15da:	8b 7d c0             	mov    -0x40(%ebp),%edi
    15dd:	8d 76 00             	lea    0x0(%esi),%esi
    15e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    15e3:	83 ec 04             	sub    $0x4,%esp
    15e6:	83 ee 01             	sub    $0x1,%esi
    15e9:	6a 01                	push   $0x1
    15eb:	53                   	push   %ebx
    15ec:	57                   	push   %edi
    15ed:	88 45 d7             	mov    %al,-0x29(%ebp)
    15f0:	e8 c4 fe ff ff       	call   14b9 <write>

  while(--i >= 0)
    15f5:	83 c4 10             	add    $0x10,%esp
    15f8:	39 de                	cmp    %ebx,%esi
    15fa:	75 e4                	jne    15e0 <printint+0x60>
    putc(fd, buf[i]);
}
    15fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15ff:	5b                   	pop    %ebx
    1600:	5e                   	pop    %esi
    1601:	5f                   	pop    %edi
    1602:	5d                   	pop    %ebp
    1603:	c3                   	ret    
    1604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1608:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    160f:	eb 90                	jmp    15a1 <printint+0x21>
    1611:	eb 0d                	jmp    1620 <printf>
    1613:	90                   	nop
    1614:	90                   	nop
    1615:	90                   	nop
    1616:	90                   	nop
    1617:	90                   	nop
    1618:	90                   	nop
    1619:	90                   	nop
    161a:	90                   	nop
    161b:	90                   	nop
    161c:	90                   	nop
    161d:	90                   	nop
    161e:	90                   	nop
    161f:	90                   	nop

00001620 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	57                   	push   %edi
    1624:	56                   	push   %esi
    1625:	53                   	push   %ebx
    1626:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1629:	8b 75 0c             	mov    0xc(%ebp),%esi
    162c:	0f b6 1e             	movzbl (%esi),%ebx
    162f:	84 db                	test   %bl,%bl
    1631:	0f 84 bf 00 00 00    	je     16f6 <printf+0xd6>
    1637:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    163a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    163d:	31 d2                	xor    %edx,%edx
    163f:	eb 39                	jmp    167a <printf+0x5a>
    1641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1648:	83 f8 25             	cmp    $0x25,%eax
    164b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    164e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1653:	74 1a                	je     166f <printf+0x4f>
  write(fd, &c, 1);
    1655:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1658:	83 ec 04             	sub    $0x4,%esp
    165b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    165e:	6a 01                	push   $0x1
    1660:	50                   	push   %eax
    1661:	ff 75 08             	pushl  0x8(%ebp)
    1664:	e8 50 fe ff ff       	call   14b9 <write>
    1669:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    166c:	83 c4 10             	add    $0x10,%esp
    166f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1672:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1676:	84 db                	test   %bl,%bl
    1678:	74 7c                	je     16f6 <printf+0xd6>
    if(state == 0){
    167a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    167c:	0f be cb             	movsbl %bl,%ecx
    167f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1682:	74 c4                	je     1648 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1684:	83 fa 25             	cmp    $0x25,%edx
    1687:	75 e6                	jne    166f <printf+0x4f>
      if(c == 'd'){
    1689:	83 f8 64             	cmp    $0x64,%eax
    168c:	0f 84 a6 00 00 00    	je     1738 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1692:	83 f8 6c             	cmp    $0x6c,%eax
    1695:	0f 84 ad 00 00 00    	je     1748 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    169b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    16a1:	83 f9 70             	cmp    $0x70,%ecx
    16a4:	74 5a                	je     1700 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16a6:	83 f8 73             	cmp    $0x73,%eax
    16a9:	0f 84 e1 00 00 00    	je     1790 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16af:	83 f8 63             	cmp    $0x63,%eax
    16b2:	0f 84 28 01 00 00    	je     17e0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    16b8:	83 f8 25             	cmp    $0x25,%eax
    16bb:	74 6b                	je     1728 <printf+0x108>
  write(fd, &c, 1);
    16bd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    16c0:	83 ec 04             	sub    $0x4,%esp
    16c3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16c7:	6a 01                	push   $0x1
    16c9:	50                   	push   %eax
    16ca:	ff 75 08             	pushl  0x8(%ebp)
    16cd:	e8 e7 fd ff ff       	call   14b9 <write>
    16d2:	83 c4 0c             	add    $0xc,%esp
    16d5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    16d8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    16db:	6a 01                	push   $0x1
    16dd:	50                   	push   %eax
    16de:	ff 75 08             	pushl  0x8(%ebp)
    16e1:	83 c6 01             	add    $0x1,%esi
    16e4:	e8 d0 fd ff ff       	call   14b9 <write>
  for(i = 0; fmt[i]; i++){
    16e9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    16ed:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    16f0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    16f2:	84 db                	test   %bl,%bl
    16f4:	75 84                	jne    167a <printf+0x5a>
    }
  }
}
    16f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16f9:	5b                   	pop    %ebx
    16fa:	5e                   	pop    %esi
    16fb:	5f                   	pop    %edi
    16fc:	5d                   	pop    %ebp
    16fd:	c3                   	ret    
    16fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1700:	83 ec 0c             	sub    $0xc,%esp
    1703:	b9 10 00 00 00       	mov    $0x10,%ecx
    1708:	6a 00                	push   $0x0
    170a:	8b 17                	mov    (%edi),%edx
    170c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    170f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1712:	e8 69 fe ff ff       	call   1580 <printint>
    1717:	83 c4 10             	add    $0x10,%esp
      state = 0;
    171a:	31 d2                	xor    %edx,%edx
    171c:	e9 4e ff ff ff       	jmp    166f <printf+0x4f>
    1721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1728:	83 ec 04             	sub    $0x4,%esp
    172b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    172e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1731:	6a 01                	push   $0x1
    1733:	eb a8                	jmp    16dd <printf+0xbd>
    1735:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1738:	83 ec 0c             	sub    $0xc,%esp
    173b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1740:	6a 01                	push   $0x1
    1742:	eb c6                	jmp    170a <printf+0xea>
    1744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1748:	8b 57 04             	mov    0x4(%edi),%edx
    174b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    174d:	85 d2                	test   %edx,%edx
    174f:	74 15                	je     1766 <printf+0x146>
    1751:	83 ec 0c             	sub    $0xc,%esp
    1754:	8b 45 08             	mov    0x8(%ebp),%eax
    1757:	b9 10 00 00 00       	mov    $0x10,%ecx
    175c:	6a 00                	push   $0x0
    175e:	e8 1d fe ff ff       	call   1580 <printint>
    1763:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1766:	83 ec 0c             	sub    $0xc,%esp
    1769:	8b 45 08             	mov    0x8(%ebp),%eax
    176c:	89 da                	mov    %ebx,%edx
    176e:	6a 00                	push   $0x0
    1770:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1775:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1778:	e8 03 fe ff ff       	call   1580 <printint>
    177d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1780:	31 d2                	xor    %edx,%edx
    1782:	e9 e8 fe ff ff       	jmp    166f <printf+0x4f>
    1787:	89 f6                	mov    %esi,%esi
    1789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1790:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1792:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1795:	85 c9                	test   %ecx,%ecx
    1797:	74 6a                	je     1803 <printf+0x1e3>
        while(*s != 0){
    1799:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    179c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    179e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    17a0:	84 c0                	test   %al,%al
    17a2:	0f 84 c7 fe ff ff    	je     166f <printf+0x4f>
    17a8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    17ab:	89 de                	mov    %ebx,%esi
    17ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
    17b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    17b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    17b6:	83 ec 04             	sub    $0x4,%esp
    17b9:	6a 01                	push   $0x1
          s++;
    17bb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    17be:	50                   	push   %eax
    17bf:	53                   	push   %ebx
    17c0:	e8 f4 fc ff ff       	call   14b9 <write>
        while(*s != 0){
    17c5:	0f b6 06             	movzbl (%esi),%eax
    17c8:	83 c4 10             	add    $0x10,%esp
    17cb:	84 c0                	test   %al,%al
    17cd:	75 e1                	jne    17b0 <printf+0x190>
    17cf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    17d2:	31 d2                	xor    %edx,%edx
    17d4:	e9 96 fe ff ff       	jmp    166f <printf+0x4f>
    17d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    17e0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    17e2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    17e5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    17e8:	6a 01                	push   $0x1
        putc(fd, *ap);
    17ea:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    17ed:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    17f0:	50                   	push   %eax
    17f1:	ff 75 08             	pushl  0x8(%ebp)
    17f4:	e8 c0 fc ff ff       	call   14b9 <write>
    17f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17fc:	31 d2                	xor    %edx,%edx
    17fe:	e9 6c fe ff ff       	jmp    166f <printf+0x4f>
          s = "(null)";
    1803:	bb 19 18 00 00       	mov    $0x1819,%ebx
        while(*s != 0){
    1808:	b8 28 00 00 00       	mov    $0x28,%eax
    180d:	eb 99                	jmp    17a8 <printf+0x188>
