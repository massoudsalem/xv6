
_test_2:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[]) {
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	8d 75 84             	lea    -0x7c(%ebp),%esi
    int x1 = getreadcount();

    int rc = fork();
    1014:	bb a0 86 01 00       	mov    $0x186a0,%ebx
main(int argc, char *argv[]) {
    1019:	81 ec 88 00 00 00    	sub    $0x88,%esp
    int x1 = getreadcount();
    101f:	e8 25 05 00 00       	call   1549 <getreadcount>
    1024:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    int rc = fork();
    102a:	e8 72 04 00 00       	call   14a1 <fork>
    102f:	89 c7                	mov    %eax,%edi
    1031:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    int total = 0;
    int i;
    for (i = 0; i < 100000; i++) {
	char buf[100];
	(void) read(4, buf, 1);
    1038:	83 ec 04             	sub    $0x4,%esp
    103b:	6a 01                	push   $0x1
    103d:	56                   	push   %esi
    103e:	6a 04                	push   $0x4
    1040:	e8 7c 04 00 00       	call   14c1 <read>
    for (i = 0; i < 100000; i++) {
    1045:	83 c4 10             	add    $0x10,%esp
    1048:	83 eb 01             	sub    $0x1,%ebx
    104b:	75 eb                	jne    1038 <main+0x38>
    }
    // https://wiki.osdev.org/Shutdown
    // (void) shutdown();

    if (rc > 0) {
    104d:	85 ff                	test   %edi,%edi
    104f:	7e 21                	jle    1072 <main+0x72>
	(void) wait();
    1051:	e8 5b 04 00 00       	call   14b1 <wait>
	int x2 = getreadcount();
    1056:	e8 ee 04 00 00       	call   1549 <getreadcount>
	total += (x2 - x1);
    105b:	2b 85 74 ff ff ff    	sub    -0x8c(%ebp),%eax
	printf(1, "XV6_TEST_OUTPUT %d\n", total);
    1061:	52                   	push   %edx
    1062:	50                   	push   %eax
    1063:	68 20 18 00 00       	push   $0x1820
    1068:	6a 01                	push   $0x1
    106a:	e8 c1 05 00 00       	call   1630 <printf>
    106f:	83 c4 10             	add    $0x10,%esp
    }
    exit();
    1072:	e8 32 04 00 00       	call   14a9 <exit>
    1077:	66 90                	xchg   %ax,%ax
    1079:	66 90                	xchg   %ax,%ax
    107b:	66 90                	xchg   %ax,%ax
    107d:	66 90                	xchg   %ax,%ax
    107f:	90                   	nop

00001080 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	53                   	push   %ebx
    1084:	8b 45 08             	mov    0x8(%ebp),%eax
    1087:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    108a:	89 c2                	mov    %eax,%edx
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1090:	83 c1 01             	add    $0x1,%ecx
    1093:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1097:	83 c2 01             	add    $0x1,%edx
    109a:	84 db                	test   %bl,%bl
    109c:	88 5a ff             	mov    %bl,-0x1(%edx)
    109f:	75 ef                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    10a1:	5b                   	pop    %ebx
    10a2:	5d                   	pop    %ebp
    10a3:	c3                   	ret    
    10a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	8b 55 08             	mov    0x8(%ebp),%edx
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ba:	0f b6 02             	movzbl (%edx),%eax
    10bd:	0f b6 19             	movzbl (%ecx),%ebx
    10c0:	84 c0                	test   %al,%al
    10c2:	75 1c                	jne    10e0 <strcmp+0x30>
    10c4:	eb 2a                	jmp    10f0 <strcmp+0x40>
    10c6:	8d 76 00             	lea    0x0(%esi),%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10d6:	83 c1 01             	add    $0x1,%ecx
    10d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10dc:	84 c0                	test   %al,%al
    10de:	74 10                	je     10f0 <strcmp+0x40>
    10e0:	38 d8                	cmp    %bl,%al
    10e2:	74 ec                	je     10d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10e4:	29 d8                	sub    %ebx,%eax
}
    10e6:	5b                   	pop    %ebx
    10e7:	5d                   	pop    %ebp
    10e8:	c3                   	ret    
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10f2:	29 d8                	sub    %ebx,%eax
}
    10f4:	5b                   	pop    %ebx
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strlen>:

uint
strlen(const char *s)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1106:	80 39 00             	cmpb   $0x0,(%ecx)
    1109:	74 15                	je     1120 <strlen+0x20>
    110b:	31 d2                	xor    %edx,%edx
    110d:	8d 76 00             	lea    0x0(%esi),%esi
    1110:	83 c2 01             	add    $0x1,%edx
    1113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1117:	89 d0                	mov    %edx,%eax
    1119:	75 f5                	jne    1110 <strlen+0x10>
    ;
  return n;
}
    111b:	5d                   	pop    %ebp
    111c:	c3                   	ret    
    111d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1120:	31 c0                	xor    %eax,%eax
}
    1122:	5d                   	pop    %ebp
    1123:	c3                   	ret    
    1124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    112a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001130 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1137:	8b 4d 10             	mov    0x10(%ebp),%ecx
    113a:	8b 45 0c             	mov    0xc(%ebp),%eax
    113d:	89 d7                	mov    %edx,%edi
    113f:	fc                   	cld    
    1140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1142:	89 d0                	mov    %edx,%eax
    1144:	5f                   	pop    %edi
    1145:	5d                   	pop    %ebp
    1146:	c3                   	ret    
    1147:	89 f6                	mov    %esi,%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001150 <strchr>:

char*
strchr(const char *s, char c)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	53                   	push   %ebx
    1154:	8b 45 08             	mov    0x8(%ebp),%eax
    1157:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    115a:	0f b6 10             	movzbl (%eax),%edx
    115d:	84 d2                	test   %dl,%dl
    115f:	74 1d                	je     117e <strchr+0x2e>
    if(*s == c)
    1161:	38 d3                	cmp    %dl,%bl
    1163:	89 d9                	mov    %ebx,%ecx
    1165:	75 0d                	jne    1174 <strchr+0x24>
    1167:	eb 17                	jmp    1180 <strchr+0x30>
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1170:	38 ca                	cmp    %cl,%dl
    1172:	74 0c                	je     1180 <strchr+0x30>
  for(; *s; s++)
    1174:	83 c0 01             	add    $0x1,%eax
    1177:	0f b6 10             	movzbl (%eax),%edx
    117a:	84 d2                	test   %dl,%dl
    117c:	75 f2                	jne    1170 <strchr+0x20>
      return (char*)s;
  return 0;
    117e:	31 c0                	xor    %eax,%eax
}
    1180:	5b                   	pop    %ebx
    1181:	5d                   	pop    %ebp
    1182:	c3                   	ret    
    1183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <gets>:

char*
gets(char *buf, int max)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
    1195:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1196:	31 f6                	xor    %esi,%esi
    1198:	89 f3                	mov    %esi,%ebx
{
    119a:	83 ec 1c             	sub    $0x1c,%esp
    119d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11a0:	eb 2f                	jmp    11d1 <gets+0x41>
    11a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11ab:	83 ec 04             	sub    $0x4,%esp
    11ae:	6a 01                	push   $0x1
    11b0:	50                   	push   %eax
    11b1:	6a 00                	push   $0x0
    11b3:	e8 09 03 00 00       	call   14c1 <read>
    if(cc < 1)
    11b8:	83 c4 10             	add    $0x10,%esp
    11bb:	85 c0                	test   %eax,%eax
    11bd:	7e 1c                	jle    11db <gets+0x4b>
      break;
    buf[i++] = c;
    11bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11c3:	83 c7 01             	add    $0x1,%edi
    11c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11c9:	3c 0a                	cmp    $0xa,%al
    11cb:	74 23                	je     11f0 <gets+0x60>
    11cd:	3c 0d                	cmp    $0xd,%al
    11cf:	74 1f                	je     11f0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11d1:	83 c3 01             	add    $0x1,%ebx
    11d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11d7:	89 fe                	mov    %edi,%esi
    11d9:	7c cd                	jl     11a8 <gets+0x18>
    11db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11e0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11e6:	5b                   	pop    %ebx
    11e7:	5e                   	pop    %esi
    11e8:	5f                   	pop    %edi
    11e9:	5d                   	pop    %ebp
    11ea:	c3                   	ret    
    11eb:	90                   	nop
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11f0:	8b 75 08             	mov    0x8(%ebp),%esi
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	01 de                	add    %ebx,%esi
    11f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11fa:	c6 03 00             	movb   $0x0,(%ebx)
}
    11fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1200:	5b                   	pop    %ebx
    1201:	5e                   	pop    %esi
    1202:	5f                   	pop    %edi
    1203:	5d                   	pop    %ebp
    1204:	c3                   	ret    
    1205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <stat>:

int
stat(const char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	pushl  0x8(%ebp)
    121d:	e8 c7 02 00 00       	call   14e9 <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	pushl  0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 ca 02 00 00       	call   1501 <fstat>
  close(fd);
    1237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123a:	89 c6                	mov    %eax,%esi
  close(fd);
    123c:	e8 90 02 00 00       	call   14d1 <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
}
    1244:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1247:	89 f0                	mov    %esi,%eax
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1250:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1255:	eb ed                	jmp    1244 <stat+0x34>
    1257:	89 f6                	mov    %esi,%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 11             	movsbl (%ecx),%edx
    126a:	8d 42 d0             	lea    -0x30(%edx),%eax
    126d:	3c 09                	cmp    $0x9,%al
  n = 0;
    126f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1274:	77 1f                	ja     1295 <atoi+0x35>
    1276:	8d 76 00             	lea    0x0(%esi),%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1280:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1283:	83 c1 01             	add    $0x1,%ecx
    1286:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    128a:	0f be 11             	movsbl (%ecx),%edx
    128d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	5b                   	pop    %ebx
    1296:	5d                   	pop    %ebp
    1297:	c3                   	ret    
    1298:	90                   	nop
    1299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
    12a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12a8:	8b 45 08             	mov    0x8(%ebp),%eax
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 db                	test   %ebx,%ebx
    12b0:	7e 14                	jle    12c6 <memmove+0x26>
    12b2:	31 d2                	xor    %edx,%edx
    12b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12c2:	39 d3                	cmp    %edx,%ebx
    12c4:	75 f2                	jne    12b8 <memmove+0x18>
  return vdst;
}
    12c6:	5b                   	pop    %ebx
    12c7:	5e                   	pop    %esi
    12c8:	5d                   	pop    %ebp
    12c9:	c3                   	ret    
    12ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012d0 <thread_join>:
  }*/
  return clone(start_routine, arg1, arg2, stack);
}

int thread_join()
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    12d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    12d9:	50                   	push   %eax
    12da:	e8 a2 02 00 00       	call   1581 <join>
  //free(stackPtr);
  return x;
}
    12df:	c9                   	leave  
    12e0:	c3                   	ret    
    12e1:	eb 0d                	jmp    12f0 <free>
    12e3:	90                   	nop
    12e4:	90                   	nop
    12e5:	90                   	nop
    12e6:	90                   	nop
    12e7:	90                   	nop
    12e8:	90                   	nop
    12e9:	90                   	nop
    12ea:	90                   	nop
    12eb:	90                   	nop
    12ec:	90                   	nop
    12ed:	90                   	nop
    12ee:	90                   	nop
    12ef:	90                   	nop

000012f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12f1:	a1 2c 1b 00 00       	mov    0x1b2c,%eax
{
    12f6:	89 e5                	mov    %esp,%ebp
    12f8:	57                   	push   %edi
    12f9:	56                   	push   %esi
    12fa:	53                   	push   %ebx
    12fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1308:	39 c8                	cmp    %ecx,%eax
    130a:	8b 10                	mov    (%eax),%edx
    130c:	73 32                	jae    1340 <free+0x50>
    130e:	39 d1                	cmp    %edx,%ecx
    1310:	72 04                	jb     1316 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1312:	39 d0                	cmp    %edx,%eax
    1314:	72 32                	jb     1348 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1316:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1319:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    131c:	39 fa                	cmp    %edi,%edx
    131e:	74 30                	je     1350 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1320:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1323:	8b 50 04             	mov    0x4(%eax),%edx
    1326:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1329:	39 f1                	cmp    %esi,%ecx
    132b:	74 3a                	je     1367 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    132d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    132f:	a3 2c 1b 00 00       	mov    %eax,0x1b2c
}
    1334:	5b                   	pop    %ebx
    1335:	5e                   	pop    %esi
    1336:	5f                   	pop    %edi
    1337:	5d                   	pop    %ebp
    1338:	c3                   	ret    
    1339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1340:	39 d0                	cmp    %edx,%eax
    1342:	72 04                	jb     1348 <free+0x58>
    1344:	39 d1                	cmp    %edx,%ecx
    1346:	72 ce                	jb     1316 <free+0x26>
{
    1348:	89 d0                	mov    %edx,%eax
    134a:	eb bc                	jmp    1308 <free+0x18>
    134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1350:	03 72 04             	add    0x4(%edx),%esi
    1353:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1356:	8b 10                	mov    (%eax),%edx
    1358:	8b 12                	mov    (%edx),%edx
    135a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    135d:	8b 50 04             	mov    0x4(%eax),%edx
    1360:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1363:	39 f1                	cmp    %esi,%ecx
    1365:	75 c6                	jne    132d <free+0x3d>
    p->s.size += bp->s.size;
    1367:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    136a:	a3 2c 1b 00 00       	mov    %eax,0x1b2c
    p->s.size += bp->s.size;
    136f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1372:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1375:	89 10                	mov    %edx,(%eax)
}
    1377:	5b                   	pop    %ebx
    1378:	5e                   	pop    %esi
    1379:	5f                   	pop    %edi
    137a:	5d                   	pop    %ebp
    137b:	c3                   	ret    
    137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001380 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
    1384:	56                   	push   %esi
    1385:	53                   	push   %ebx
    1386:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1389:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    138c:	8b 15 2c 1b 00 00    	mov    0x1b2c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1392:	8d 78 07             	lea    0x7(%eax),%edi
    1395:	c1 ef 03             	shr    $0x3,%edi
    1398:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    139b:	85 d2                	test   %edx,%edx
    139d:	0f 84 9d 00 00 00    	je     1440 <malloc+0xc0>
    13a3:	8b 02                	mov    (%edx),%eax
    13a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    13a8:	39 cf                	cmp    %ecx,%edi
    13aa:	76 6c                	jbe    1418 <malloc+0x98>
    13ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    13b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    13b7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    13ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13c1:	eb 0e                	jmp    13d1 <malloc+0x51>
    13c3:	90                   	nop
    13c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    13ca:	8b 48 04             	mov    0x4(%eax),%ecx
    13cd:	39 f9                	cmp    %edi,%ecx
    13cf:	73 47                	jae    1418 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13d1:	39 05 2c 1b 00 00    	cmp    %eax,0x1b2c
    13d7:	89 c2                	mov    %eax,%edx
    13d9:	75 ed                	jne    13c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13db:	83 ec 0c             	sub    $0xc,%esp
    13de:	56                   	push   %esi
    13df:	e8 4d 01 00 00       	call   1531 <sbrk>
  if(p == (char*)-1)
    13e4:	83 c4 10             	add    $0x10,%esp
    13e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    13ea:	74 1c                	je     1408 <malloc+0x88>
  hp->s.size = nu;
    13ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13ef:	83 ec 0c             	sub    $0xc,%esp
    13f2:	83 c0 08             	add    $0x8,%eax
    13f5:	50                   	push   %eax
    13f6:	e8 f5 fe ff ff       	call   12f0 <free>
  return freep;
    13fb:	8b 15 2c 1b 00 00    	mov    0x1b2c,%edx
      if((p = morecore(nunits)) == 0)
    1401:	83 c4 10             	add    $0x10,%esp
    1404:	85 d2                	test   %edx,%edx
    1406:	75 c0                	jne    13c8 <malloc+0x48>
        return 0;
  }
    1408:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    140b:	31 c0                	xor    %eax,%eax
    140d:	5b                   	pop    %ebx
    140e:	5e                   	pop    %esi
    140f:	5f                   	pop    %edi
    1410:	5d                   	pop    %ebp
    1411:	c3                   	ret    
    1412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1418:	39 cf                	cmp    %ecx,%edi
    141a:	74 54                	je     1470 <malloc+0xf0>
        p->s.size -= nunits;
    141c:	29 f9                	sub    %edi,%ecx
    141e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1421:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1424:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1427:	89 15 2c 1b 00 00    	mov    %edx,0x1b2c
    142d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1430:	83 c0 08             	add    $0x8,%eax
    1433:	5b                   	pop    %ebx
    1434:	5e                   	pop    %esi
    1435:	5f                   	pop    %edi
    1436:	5d                   	pop    %ebp
    1437:	c3                   	ret    
    1438:	90                   	nop
    1439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1440:	c7 05 2c 1b 00 00 30 	movl   $0x1b30,0x1b2c
    1447:	1b 00 00 
    144a:	c7 05 30 1b 00 00 30 	movl   $0x1b30,0x1b30
    1451:	1b 00 00 
    base.s.size = 0;
    1454:	b8 30 1b 00 00       	mov    $0x1b30,%eax
    1459:	c7 05 34 1b 00 00 00 	movl   $0x0,0x1b34
    1460:	00 00 00 
    1463:	e9 44 ff ff ff       	jmp    13ac <malloc+0x2c>
    1468:	90                   	nop
    1469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1470:	8b 08                	mov    (%eax),%ecx
    1472:	89 0a                	mov    %ecx,(%edx)
    1474:	eb b1                	jmp    1427 <malloc+0xa7>
    1476:	8d 76 00             	lea    0x0(%esi),%esi
    1479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001480 <thread_create>:
{
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(PGSIZE);
    1486:	68 00 10 00 00       	push   $0x1000
    148b:	e8 f0 fe ff ff       	call   1380 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    1490:	50                   	push   %eax
    1491:	ff 75 10             	pushl  0x10(%ebp)
    1494:	ff 75 0c             	pushl  0xc(%ebp)
    1497:	ff 75 08             	pushl  0x8(%ebp)
    149a:	e8 da 00 00 00       	call   1579 <clone>
}
    149f:	c9                   	leave  
    14a0:	c3                   	ret    

000014a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    14a1:	b8 01 00 00 00       	mov    $0x1,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <exit>:
SYSCALL(exit)
    14a9:	b8 02 00 00 00       	mov    $0x2,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <wait>:
SYSCALL(wait)
    14b1:	b8 03 00 00 00       	mov    $0x3,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <pipe>:
SYSCALL(pipe)
    14b9:	b8 04 00 00 00       	mov    $0x4,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <read>:
SYSCALL(read)
    14c1:	b8 05 00 00 00       	mov    $0x5,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <write>:
SYSCALL(write)
    14c9:	b8 10 00 00 00       	mov    $0x10,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <close>:
SYSCALL(close)
    14d1:	b8 15 00 00 00       	mov    $0x15,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <kill>:
SYSCALL(kill)
    14d9:	b8 06 00 00 00       	mov    $0x6,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <exec>:
SYSCALL(exec)
    14e1:	b8 07 00 00 00       	mov    $0x7,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <open>:
SYSCALL(open)
    14e9:	b8 0f 00 00 00       	mov    $0xf,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <mknod>:
SYSCALL(mknod)
    14f1:	b8 11 00 00 00       	mov    $0x11,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <unlink>:
SYSCALL(unlink)
    14f9:	b8 12 00 00 00       	mov    $0x12,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <fstat>:
SYSCALL(fstat)
    1501:	b8 08 00 00 00       	mov    $0x8,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <link>:
SYSCALL(link)
    1509:	b8 13 00 00 00       	mov    $0x13,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    

00001511 <mkdir>:
SYSCALL(mkdir)
    1511:	b8 14 00 00 00       	mov    $0x14,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <chdir>:
SYSCALL(chdir)
    1519:	b8 09 00 00 00       	mov    $0x9,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <dup>:
SYSCALL(dup)
    1521:	b8 0a 00 00 00       	mov    $0xa,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <getpid>:
SYSCALL(getpid)
    1529:	b8 0b 00 00 00       	mov    $0xb,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <sbrk>:
SYSCALL(sbrk)
    1531:	b8 0c 00 00 00       	mov    $0xc,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <sleep>:
SYSCALL(sleep)
    1539:	b8 0d 00 00 00       	mov    $0xd,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <uptime>:
SYSCALL(uptime)
    1541:	b8 0e 00 00 00       	mov    $0xe,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <getreadcount>:
SYSCALL(getreadcount)
    1549:	b8 16 00 00 00       	mov    $0x16,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    

00001551 <gettime>:
SYSCALL(gettime)
    1551:	b8 17 00 00 00       	mov    $0x17,%eax
    1556:	cd 40                	int    $0x40
    1558:	c3                   	ret    

00001559 <settickets>:
SYSCALL(settickets)
    1559:	b8 18 00 00 00       	mov    $0x18,%eax
    155e:	cd 40                	int    $0x40
    1560:	c3                   	ret    

00001561 <getpinfo>:
SYSCALL(getpinfo)
    1561:	b8 19 00 00 00       	mov    $0x19,%eax
    1566:	cd 40                	int    $0x40
    1568:	c3                   	ret    

00001569 <mprotect>:
SYSCALL(mprotect)
    1569:	b8 1a 00 00 00       	mov    $0x1a,%eax
    156e:	cd 40                	int    $0x40
    1570:	c3                   	ret    

00001571 <munprotect>:
SYSCALL(munprotect)
    1571:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1576:	cd 40                	int    $0x40
    1578:	c3                   	ret    

00001579 <clone>:
SYSCALL(clone)
    1579:	b8 1c 00 00 00       	mov    $0x1c,%eax
    157e:	cd 40                	int    $0x40
    1580:	c3                   	ret    

00001581 <join>:
    1581:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1586:	cd 40                	int    $0x40
    1588:	c3                   	ret    
    1589:	66 90                	xchg   %ax,%ax
    158b:	66 90                	xchg   %ax,%ax
    158d:	66 90                	xchg   %ax,%ax
    158f:	90                   	nop

00001590 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	57                   	push   %edi
    1594:	56                   	push   %esi
    1595:	53                   	push   %ebx
    1596:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1599:	85 d2                	test   %edx,%edx
{
    159b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    159e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    15a0:	79 76                	jns    1618 <printint+0x88>
    15a2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    15a6:	74 70                	je     1618 <printint+0x88>
    x = -xx;
    15a8:	f7 d8                	neg    %eax
    neg = 1;
    15aa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    15b1:	31 f6                	xor    %esi,%esi
    15b3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    15b6:	eb 0a                	jmp    15c2 <printint+0x32>
    15b8:	90                   	nop
    15b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    15c0:	89 fe                	mov    %edi,%esi
    15c2:	31 d2                	xor    %edx,%edx
    15c4:	8d 7e 01             	lea    0x1(%esi),%edi
    15c7:	f7 f1                	div    %ecx
    15c9:	0f b6 92 3c 18 00 00 	movzbl 0x183c(%edx),%edx
  }while((x /= base) != 0);
    15d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    15d2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    15d5:	75 e9                	jne    15c0 <printint+0x30>
  if(neg)
    15d7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    15da:	85 c0                	test   %eax,%eax
    15dc:	74 08                	je     15e6 <printint+0x56>
    buf[i++] = '-';
    15de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    15e3:	8d 7e 02             	lea    0x2(%esi),%edi
    15e6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    15ea:	8b 7d c0             	mov    -0x40(%ebp),%edi
    15ed:	8d 76 00             	lea    0x0(%esi),%esi
    15f0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    15f3:	83 ec 04             	sub    $0x4,%esp
    15f6:	83 ee 01             	sub    $0x1,%esi
    15f9:	6a 01                	push   $0x1
    15fb:	53                   	push   %ebx
    15fc:	57                   	push   %edi
    15fd:	88 45 d7             	mov    %al,-0x29(%ebp)
    1600:	e8 c4 fe ff ff       	call   14c9 <write>

  while(--i >= 0)
    1605:	83 c4 10             	add    $0x10,%esp
    1608:	39 de                	cmp    %ebx,%esi
    160a:	75 e4                	jne    15f0 <printint+0x60>
    putc(fd, buf[i]);
}
    160c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    160f:	5b                   	pop    %ebx
    1610:	5e                   	pop    %esi
    1611:	5f                   	pop    %edi
    1612:	5d                   	pop    %ebp
    1613:	c3                   	ret    
    1614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1618:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    161f:	eb 90                	jmp    15b1 <printint+0x21>
    1621:	eb 0d                	jmp    1630 <printf>
    1623:	90                   	nop
    1624:	90                   	nop
    1625:	90                   	nop
    1626:	90                   	nop
    1627:	90                   	nop
    1628:	90                   	nop
    1629:	90                   	nop
    162a:	90                   	nop
    162b:	90                   	nop
    162c:	90                   	nop
    162d:	90                   	nop
    162e:	90                   	nop
    162f:	90                   	nop

00001630 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1630:	55                   	push   %ebp
    1631:	89 e5                	mov    %esp,%ebp
    1633:	57                   	push   %edi
    1634:	56                   	push   %esi
    1635:	53                   	push   %ebx
    1636:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1639:	8b 75 0c             	mov    0xc(%ebp),%esi
    163c:	0f b6 1e             	movzbl (%esi),%ebx
    163f:	84 db                	test   %bl,%bl
    1641:	0f 84 bf 00 00 00    	je     1706 <printf+0xd6>
    1647:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    164a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    164d:	31 d2                	xor    %edx,%edx
    164f:	eb 39                	jmp    168a <printf+0x5a>
    1651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1658:	83 f8 25             	cmp    $0x25,%eax
    165b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    165e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1663:	74 1a                	je     167f <printf+0x4f>
  write(fd, &c, 1);
    1665:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1668:	83 ec 04             	sub    $0x4,%esp
    166b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    166e:	6a 01                	push   $0x1
    1670:	50                   	push   %eax
    1671:	ff 75 08             	pushl  0x8(%ebp)
    1674:	e8 50 fe ff ff       	call   14c9 <write>
    1679:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    167c:	83 c4 10             	add    $0x10,%esp
    167f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1682:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1686:	84 db                	test   %bl,%bl
    1688:	74 7c                	je     1706 <printf+0xd6>
    if(state == 0){
    168a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    168c:	0f be cb             	movsbl %bl,%ecx
    168f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1692:	74 c4                	je     1658 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1694:	83 fa 25             	cmp    $0x25,%edx
    1697:	75 e6                	jne    167f <printf+0x4f>
      if(c == 'd'){
    1699:	83 f8 64             	cmp    $0x64,%eax
    169c:	0f 84 a6 00 00 00    	je     1748 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    16a2:	83 f8 6c             	cmp    $0x6c,%eax
    16a5:	0f 84 ad 00 00 00    	je     1758 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    16ab:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    16b1:	83 f9 70             	cmp    $0x70,%ecx
    16b4:	74 5a                	je     1710 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16b6:	83 f8 73             	cmp    $0x73,%eax
    16b9:	0f 84 e1 00 00 00    	je     17a0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16bf:	83 f8 63             	cmp    $0x63,%eax
    16c2:	0f 84 28 01 00 00    	je     17f0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    16c8:	83 f8 25             	cmp    $0x25,%eax
    16cb:	74 6b                	je     1738 <printf+0x108>
  write(fd, &c, 1);
    16cd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    16d0:	83 ec 04             	sub    $0x4,%esp
    16d3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16d7:	6a 01                	push   $0x1
    16d9:	50                   	push   %eax
    16da:	ff 75 08             	pushl  0x8(%ebp)
    16dd:	e8 e7 fd ff ff       	call   14c9 <write>
    16e2:	83 c4 0c             	add    $0xc,%esp
    16e5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    16e8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    16eb:	6a 01                	push   $0x1
    16ed:	50                   	push   %eax
    16ee:	ff 75 08             	pushl  0x8(%ebp)
    16f1:	83 c6 01             	add    $0x1,%esi
    16f4:	e8 d0 fd ff ff       	call   14c9 <write>
  for(i = 0; fmt[i]; i++){
    16f9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    16fd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1700:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1702:	84 db                	test   %bl,%bl
    1704:	75 84                	jne    168a <printf+0x5a>
    }
  }
}
    1706:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1709:	5b                   	pop    %ebx
    170a:	5e                   	pop    %esi
    170b:	5f                   	pop    %edi
    170c:	5d                   	pop    %ebp
    170d:	c3                   	ret    
    170e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1710:	83 ec 0c             	sub    $0xc,%esp
    1713:	b9 10 00 00 00       	mov    $0x10,%ecx
    1718:	6a 00                	push   $0x0
    171a:	8b 17                	mov    (%edi),%edx
    171c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    171f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1722:	e8 69 fe ff ff       	call   1590 <printint>
    1727:	83 c4 10             	add    $0x10,%esp
      state = 0;
    172a:	31 d2                	xor    %edx,%edx
    172c:	e9 4e ff ff ff       	jmp    167f <printf+0x4f>
    1731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1738:	83 ec 04             	sub    $0x4,%esp
    173b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    173e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1741:	6a 01                	push   $0x1
    1743:	eb a8                	jmp    16ed <printf+0xbd>
    1745:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1748:	83 ec 0c             	sub    $0xc,%esp
    174b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1750:	6a 01                	push   $0x1
    1752:	eb c6                	jmp    171a <printf+0xea>
    1754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1758:	8b 57 04             	mov    0x4(%edi),%edx
    175b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    175d:	85 d2                	test   %edx,%edx
    175f:	74 15                	je     1776 <printf+0x146>
    1761:	83 ec 0c             	sub    $0xc,%esp
    1764:	8b 45 08             	mov    0x8(%ebp),%eax
    1767:	b9 10 00 00 00       	mov    $0x10,%ecx
    176c:	6a 00                	push   $0x0
    176e:	e8 1d fe ff ff       	call   1590 <printint>
    1773:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1776:	83 ec 0c             	sub    $0xc,%esp
    1779:	8b 45 08             	mov    0x8(%ebp),%eax
    177c:	89 da                	mov    %ebx,%edx
    177e:	6a 00                	push   $0x0
    1780:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1785:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1788:	e8 03 fe ff ff       	call   1590 <printint>
    178d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1790:	31 d2                	xor    %edx,%edx
    1792:	e9 e8 fe ff ff       	jmp    167f <printf+0x4f>
    1797:	89 f6                	mov    %esi,%esi
    1799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    17a0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    17a2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    17a5:	85 c9                	test   %ecx,%ecx
    17a7:	74 6a                	je     1813 <printf+0x1e3>
        while(*s != 0){
    17a9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    17ac:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    17ae:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    17b0:	84 c0                	test   %al,%al
    17b2:	0f 84 c7 fe ff ff    	je     167f <printf+0x4f>
    17b8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    17bb:	89 de                	mov    %ebx,%esi
    17bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    17c0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    17c3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    17c6:	83 ec 04             	sub    $0x4,%esp
    17c9:	6a 01                	push   $0x1
          s++;
    17cb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    17ce:	50                   	push   %eax
    17cf:	53                   	push   %ebx
    17d0:	e8 f4 fc ff ff       	call   14c9 <write>
        while(*s != 0){
    17d5:	0f b6 06             	movzbl (%esi),%eax
    17d8:	83 c4 10             	add    $0x10,%esp
    17db:	84 c0                	test   %al,%al
    17dd:	75 e1                	jne    17c0 <printf+0x190>
    17df:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    17e2:	31 d2                	xor    %edx,%edx
    17e4:	e9 96 fe ff ff       	jmp    167f <printf+0x4f>
    17e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    17f0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    17f2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    17f5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    17f8:	6a 01                	push   $0x1
        putc(fd, *ap);
    17fa:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    17fd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1800:	50                   	push   %eax
    1801:	ff 75 08             	pushl  0x8(%ebp)
    1804:	e8 c0 fc ff ff       	call   14c9 <write>
    1809:	83 c4 10             	add    $0x10,%esp
      state = 0;
    180c:	31 d2                	xor    %edx,%edx
    180e:	e9 6c fe ff ff       	jmp    167f <printf+0x4f>
          s = "(null)";
    1813:	bb 34 18 00 00       	mov    $0x1834,%ebx
        while(*s != 0){
    1818:	b8 28 00 00 00       	mov    $0x28,%eax
    181d:	eb 99                	jmp    17b8 <printf+0x188>
