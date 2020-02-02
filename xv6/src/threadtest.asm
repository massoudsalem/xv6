
_threadtest:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  exit();
}

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 1c             	sub    $0x1c,%esp
  int x = 5, y = 10;
    1011:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
    1018:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
  printf(1, "Welcome revolutionary army\n");
    101f:	68 78 19 00 00       	push   $0x1978
    1024:	6a 01                	push   $0x1
    1026:	e8 25 07 00 00       	call   1750 <printf>
  thread_create(&AdelShakal, (void *)&x, (void *)&y);
    102b:	8d 45 f4             	lea    -0xc(%ebp),%eax
    102e:	83 c4 0c             	add    $0xc,%esp
    1031:	50                   	push   %eax
    1032:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1035:	50                   	push   %eax
    1036:	68 30 11 00 00       	push   $0x1130
    103b:	e8 60 05 00 00       	call   15a0 <thread_create>
  thread_join();
    1040:	e8 ab 03 00 00       	call   13f0 <thread_join>
  thread_create(&Omar, NULL, NULL);
    1045:	83 c4 0c             	add    $0xc,%esp
    1048:	6a 00                	push   $0x0
    104a:	6a 00                	push   $0x0
    104c:	68 70 10 00 00       	push   $0x1070
    1051:	e8 4a 05 00 00       	call   15a0 <thread_create>
  thread_join();
    1056:	e8 95 03 00 00       	call   13f0 <thread_join>
  printf(1, "Thanks for watching, please press like, subscribe and give us the bonus now pleeeeeeeeeeeeeeeeeeeeeeeease\n");
    105b:	58                   	pop    %eax
    105c:	5a                   	pop    %edx
    105d:	68 b4 19 00 00       	push   $0x19b4
    1062:	6a 01                	push   $0x1
    1064:	e8 e7 06 00 00       	call   1750 <printf>
  exit();
    1069:	e8 5b 05 00 00       	call   15c9 <exit>
    106e:	66 90                	xchg   %ax,%ax

00001070 <Omar>:
void Omar(){
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	83 ec 10             	sub    $0x10,%esp
    printf(1, "Hello Omar bymasi\n");
    1076:	68 40 19 00 00       	push   $0x1940
    107b:	6a 01                	push   $0x1
    107d:	e8 ce 06 00 00       	call   1750 <printf>
    exit();
    1082:	e8 42 05 00 00       	call   15c9 <exit>
    1087:	89 f6                	mov    %esi,%esi
    1089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001090 <Hafez>:
void Hafez(void* Ahmed, void* Mohammed){
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	83 ec 10             	sub    $0x10,%esp
    printf(1, "Hello Abo Hafez bymasi\n");
    1096:	68 53 19 00 00       	push   $0x1953
    109b:	6a 01                	push   $0x1
    109d:	e8 ae 06 00 00       	call   1750 <printf>
    printf(1, "x: %d\ny: %d\n",*(int*) Ahmed, *(int*) Mohammed);
    10a2:	8b 45 0c             	mov    0xc(%ebp),%eax
    10a5:	ff 30                	pushl  (%eax)
    10a7:	8b 45 08             	mov    0x8(%ebp),%eax
    10aa:	ff 30                	pushl  (%eax)
    10ac:	68 6b 19 00 00       	push   $0x196b
    10b1:	6a 01                	push   $0x1
    10b3:	e8 98 06 00 00       	call   1750 <printf>
    thread_create(&Omar, NULL, NULL);
    10b8:	83 c4 1c             	add    $0x1c,%esp
    10bb:	6a 00                	push   $0x0
    10bd:	6a 00                	push   $0x0
    10bf:	68 70 10 00 00       	push   $0x1070
    10c4:	e8 d7 04 00 00       	call   15a0 <thread_create>
    thread_join();
    10c9:	e8 22 03 00 00       	call   13f0 <thread_join>
    exit();
    10ce:	e8 f6 04 00 00       	call   15c9 <exit>
    10d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010e0 <fib>:
int fib(int n) {
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	56                   	push   %esi
    10e5:	53                   	push   %ebx
	if (n <= 1) {
    10e6:	31 f6                	xor    %esi,%esi
int fib(int n) {
    10e8:	83 ec 1c             	sub    $0x1c,%esp
    10eb:	8b 45 08             	mov    0x8(%ebp),%eax
	if (n <= 1) {
    10ee:	83 f8 01             	cmp    $0x1,%eax
    10f1:	7e 2e                	jle    1121 <fib+0x41>
    10f3:	8d 50 fe             	lea    -0x2(%eax),%edx
    10f6:	8d 78 fd             	lea    -0x3(%eax),%edi
    10f9:	8d 58 ff             	lea    -0x1(%eax),%ebx
    10fc:	89 d0                	mov    %edx,%eax
    10fe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    1101:	83 e0 fe             	and    $0xfffffffe,%eax
    1104:	29 c7                	sub    %eax,%edi
		return fib(n - 1) + fib(n - 2);
    1106:	83 ec 0c             	sub    $0xc,%esp
    1109:	53                   	push   %ebx
    110a:	83 eb 02             	sub    $0x2,%ebx
    110d:	e8 ce ff ff ff       	call   10e0 <fib>
    1112:	83 c4 10             	add    $0x10,%esp
    1115:	01 c6                	add    %eax,%esi
	if (n <= 1) {
    1117:	39 fb                	cmp    %edi,%ebx
    1119:	75 eb                	jne    1106 <fib+0x26>
    111b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    111e:	83 e0 01             	and    $0x1,%eax
}
    1121:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1124:	01 f0                	add    %esi,%eax
    1126:	5b                   	pop    %ebx
    1127:	5e                   	pop    %esi
    1128:	5f                   	pop    %edi
    1129:	5d                   	pop    %ebp
    112a:	c3                   	ret    
    112b:	90                   	nop
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001130 <AdelShakal>:
void AdelShakal(void* z3ama, void* na7o){
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
	printf(1, "The 30th Fibonacci number is:\n");
    1134:	31 db                	xor    %ebx,%ebx
void AdelShakal(void* z3ama, void* na7o){
    1136:	83 ec 0c             	sub    $0xc,%esp
	printf(1, "The 30th Fibonacci number is:\n");
    1139:	68 94 19 00 00       	push   $0x1994
    113e:	6a 01                	push   $0x1
    1140:	e8 0b 06 00 00       	call   1750 <printf>
    1145:	83 c4 10             	add    $0x10,%esp
    1148:	b9 1d 00 00 00       	mov    $0x1d,%ecx
    114d:	8d 76 00             	lea    0x0(%esi),%esi
		return fib(n - 1) + fib(n - 2);
    1150:	83 ec 0c             	sub    $0xc,%esp
    1153:	51                   	push   %ecx
    1154:	e8 87 ff ff ff       	call   10e0 <fib>
    1159:	83 e9 02             	sub    $0x2,%ecx
    115c:	83 c4 10             	add    $0x10,%esp
    115f:	01 c3                	add    %eax,%ebx
	if (n <= 1) {
    1161:	83 f9 ff             	cmp    $0xffffffff,%ecx
    1164:	75 ea                	jne    1150 <AdelShakal+0x20>
	printf(1, "%d\n", f);
    1166:	83 ec 04             	sub    $0x4,%esp
    1169:	53                   	push   %ebx
    116a:	68 74 19 00 00       	push   $0x1974
    116f:	6a 01                	push   $0x1
    1171:	e8 da 05 00 00       	call   1750 <printf>
  thread_create(&Hafez, z3ama, na7o);
    1176:	83 c4 0c             	add    $0xc,%esp
    1179:	ff 75 0c             	pushl  0xc(%ebp)
    117c:	ff 75 08             	pushl  0x8(%ebp)
    117f:	68 90 10 00 00       	push   $0x1090
    1184:	e8 17 04 00 00       	call   15a0 <thread_create>
  thread_join();
    1189:	e8 62 02 00 00       	call   13f0 <thread_join>
  exit();
    118e:	e8 36 04 00 00       	call   15c9 <exit>
    1193:	66 90                	xchg   %ax,%ax
    1195:	66 90                	xchg   %ax,%ax
    1197:	66 90                	xchg   %ax,%ax
    1199:	66 90                	xchg   %ax,%ax
    119b:	66 90                	xchg   %ax,%ax
    119d:	66 90                	xchg   %ax,%ax
    119f:	90                   	nop

000011a0 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	53                   	push   %ebx
    11a4:	8b 45 08             	mov    0x8(%ebp),%eax
    11a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    11aa:	89 c2                	mov    %eax,%edx
    11ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11b0:	83 c1 01             	add    $0x1,%ecx
    11b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    11b7:	83 c2 01             	add    $0x1,%edx
    11ba:	84 db                	test   %bl,%bl
    11bc:	88 5a ff             	mov    %bl,-0x1(%edx)
    11bf:	75 ef                	jne    11b0 <strcpy+0x10>
    ;
  return os;
}
    11c1:	5b                   	pop    %ebx
    11c2:	5d                   	pop    %ebp
    11c3:	c3                   	ret    
    11c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	53                   	push   %ebx
    11d4:	8b 55 08             	mov    0x8(%ebp),%edx
    11d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    11da:	0f b6 02             	movzbl (%edx),%eax
    11dd:	0f b6 19             	movzbl (%ecx),%ebx
    11e0:	84 c0                	test   %al,%al
    11e2:	75 1c                	jne    1200 <strcmp+0x30>
    11e4:	eb 2a                	jmp    1210 <strcmp+0x40>
    11e6:	8d 76 00             	lea    0x0(%esi),%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    11f0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    11f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    11f6:	83 c1 01             	add    $0x1,%ecx
    11f9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    11fc:	84 c0                	test   %al,%al
    11fe:	74 10                	je     1210 <strcmp+0x40>
    1200:	38 d8                	cmp    %bl,%al
    1202:	74 ec                	je     11f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1204:	29 d8                	sub    %ebx,%eax
}
    1206:	5b                   	pop    %ebx
    1207:	5d                   	pop    %ebp
    1208:	c3                   	ret    
    1209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1210:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1212:	29 d8                	sub    %ebx,%eax
}
    1214:	5b                   	pop    %ebx
    1215:	5d                   	pop    %ebp
    1216:	c3                   	ret    
    1217:	89 f6                	mov    %esi,%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <strlen>:

uint
strlen(const char *s)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1226:	80 39 00             	cmpb   $0x0,(%ecx)
    1229:	74 15                	je     1240 <strlen+0x20>
    122b:	31 d2                	xor    %edx,%edx
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    1230:	83 c2 01             	add    $0x1,%edx
    1233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1237:	89 d0                	mov    %edx,%eax
    1239:	75 f5                	jne    1230 <strlen+0x10>
    ;
  return n;
}
    123b:	5d                   	pop    %ebp
    123c:	c3                   	ret    
    123d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1240:	31 c0                	xor    %eax,%eax
}
    1242:	5d                   	pop    %ebp
    1243:	c3                   	ret    
    1244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    124a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001250 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1257:	8b 4d 10             	mov    0x10(%ebp),%ecx
    125a:	8b 45 0c             	mov    0xc(%ebp),%eax
    125d:	89 d7                	mov    %edx,%edi
    125f:	fc                   	cld    
    1260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1262:	89 d0                	mov    %edx,%eax
    1264:	5f                   	pop    %edi
    1265:	5d                   	pop    %ebp
    1266:	c3                   	ret    
    1267:	89 f6                	mov    %esi,%esi
    1269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001270 <strchr>:

char*
strchr(const char *s, char c)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	53                   	push   %ebx
    1274:	8b 45 08             	mov    0x8(%ebp),%eax
    1277:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    127a:	0f b6 10             	movzbl (%eax),%edx
    127d:	84 d2                	test   %dl,%dl
    127f:	74 1d                	je     129e <strchr+0x2e>
    if(*s == c)
    1281:	38 d3                	cmp    %dl,%bl
    1283:	89 d9                	mov    %ebx,%ecx
    1285:	75 0d                	jne    1294 <strchr+0x24>
    1287:	eb 17                	jmp    12a0 <strchr+0x30>
    1289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1290:	38 ca                	cmp    %cl,%dl
    1292:	74 0c                	je     12a0 <strchr+0x30>
  for(; *s; s++)
    1294:	83 c0 01             	add    $0x1,%eax
    1297:	0f b6 10             	movzbl (%eax),%edx
    129a:	84 d2                	test   %dl,%dl
    129c:	75 f2                	jne    1290 <strchr+0x20>
      return (char*)s;
  return 0;
    129e:	31 c0                	xor    %eax,%eax
}
    12a0:	5b                   	pop    %ebx
    12a1:	5d                   	pop    %ebp
    12a2:	c3                   	ret    
    12a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012b0 <gets>:

char*
gets(char *buf, int max)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	57                   	push   %edi
    12b4:	56                   	push   %esi
    12b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12b6:	31 f6                	xor    %esi,%esi
    12b8:	89 f3                	mov    %esi,%ebx
{
    12ba:	83 ec 1c             	sub    $0x1c,%esp
    12bd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    12c0:	eb 2f                	jmp    12f1 <gets+0x41>
    12c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    12c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    12cb:	83 ec 04             	sub    $0x4,%esp
    12ce:	6a 01                	push   $0x1
    12d0:	50                   	push   %eax
    12d1:	6a 00                	push   $0x0
    12d3:	e8 09 03 00 00       	call   15e1 <read>
    if(cc < 1)
    12d8:	83 c4 10             	add    $0x10,%esp
    12db:	85 c0                	test   %eax,%eax
    12dd:	7e 1c                	jle    12fb <gets+0x4b>
      break;
    buf[i++] = c;
    12df:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12e3:	83 c7 01             	add    $0x1,%edi
    12e6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    12e9:	3c 0a                	cmp    $0xa,%al
    12eb:	74 23                	je     1310 <gets+0x60>
    12ed:	3c 0d                	cmp    $0xd,%al
    12ef:	74 1f                	je     1310 <gets+0x60>
  for(i=0; i+1 < max; ){
    12f1:	83 c3 01             	add    $0x1,%ebx
    12f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12f7:	89 fe                	mov    %edi,%esi
    12f9:	7c cd                	jl     12c8 <gets+0x18>
    12fb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    12fd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1300:	c6 03 00             	movb   $0x0,(%ebx)
}
    1303:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1306:	5b                   	pop    %ebx
    1307:	5e                   	pop    %esi
    1308:	5f                   	pop    %edi
    1309:	5d                   	pop    %ebp
    130a:	c3                   	ret    
    130b:	90                   	nop
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1310:	8b 75 08             	mov    0x8(%ebp),%esi
    1313:	8b 45 08             	mov    0x8(%ebp),%eax
    1316:	01 de                	add    %ebx,%esi
    1318:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    131a:	c6 03 00             	movb   $0x0,(%ebx)
}
    131d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1320:	5b                   	pop    %ebx
    1321:	5e                   	pop    %esi
    1322:	5f                   	pop    %edi
    1323:	5d                   	pop    %ebp
    1324:	c3                   	ret    
    1325:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001330 <stat>:

int
stat(const char *n, struct stat *st)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	56                   	push   %esi
    1334:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1335:	83 ec 08             	sub    $0x8,%esp
    1338:	6a 00                	push   $0x0
    133a:	ff 75 08             	pushl  0x8(%ebp)
    133d:	e8 c7 02 00 00       	call   1609 <open>
  if(fd < 0)
    1342:	83 c4 10             	add    $0x10,%esp
    1345:	85 c0                	test   %eax,%eax
    1347:	78 27                	js     1370 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1349:	83 ec 08             	sub    $0x8,%esp
    134c:	ff 75 0c             	pushl  0xc(%ebp)
    134f:	89 c3                	mov    %eax,%ebx
    1351:	50                   	push   %eax
    1352:	e8 ca 02 00 00       	call   1621 <fstat>
  close(fd);
    1357:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    135a:	89 c6                	mov    %eax,%esi
  close(fd);
    135c:	e8 90 02 00 00       	call   15f1 <close>
  return r;
    1361:	83 c4 10             	add    $0x10,%esp
}
    1364:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1367:	89 f0                	mov    %esi,%eax
    1369:	5b                   	pop    %ebx
    136a:	5e                   	pop    %esi
    136b:	5d                   	pop    %ebp
    136c:	c3                   	ret    
    136d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1370:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1375:	eb ed                	jmp    1364 <stat+0x34>
    1377:	89 f6                	mov    %esi,%esi
    1379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001380 <atoi>:

int
atoi(const char *s)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	53                   	push   %ebx
    1384:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1387:	0f be 11             	movsbl (%ecx),%edx
    138a:	8d 42 d0             	lea    -0x30(%edx),%eax
    138d:	3c 09                	cmp    $0x9,%al
  n = 0;
    138f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1394:	77 1f                	ja     13b5 <atoi+0x35>
    1396:	8d 76 00             	lea    0x0(%esi),%esi
    1399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    13a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    13a3:	83 c1 01             	add    $0x1,%ecx
    13a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    13aa:	0f be 11             	movsbl (%ecx),%edx
    13ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
    13b0:	80 fb 09             	cmp    $0x9,%bl
    13b3:	76 eb                	jbe    13a0 <atoi+0x20>
  return n;
}
    13b5:	5b                   	pop    %ebx
    13b6:	5d                   	pop    %ebp
    13b7:	c3                   	ret    
    13b8:	90                   	nop
    13b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	56                   	push   %esi
    13c4:	53                   	push   %ebx
    13c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13c8:	8b 45 08             	mov    0x8(%ebp),%eax
    13cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13ce:	85 db                	test   %ebx,%ebx
    13d0:	7e 14                	jle    13e6 <memmove+0x26>
    13d2:	31 d2                	xor    %edx,%edx
    13d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    13d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    13dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    13df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    13e2:	39 d3                	cmp    %edx,%ebx
    13e4:	75 f2                	jne    13d8 <memmove+0x18>
  return vdst;
}
    13e6:	5b                   	pop    %ebx
    13e7:	5e                   	pop    %esi
    13e8:	5d                   	pop    %ebp
    13e9:	c3                   	ret    
    13ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013f0 <thread_join>:
  }*/
  return clone(start_routine, arg1, arg2, stack);
}

int thread_join()
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    13f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13f9:	50                   	push   %eax
    13fa:	e8 a2 02 00 00       	call   16a1 <join>
  //free(stackPtr);
  return x;
}
    13ff:	c9                   	leave  
    1400:	c3                   	ret    
    1401:	eb 0d                	jmp    1410 <free>
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

00001410 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1410:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1411:	a1 8c 1d 00 00       	mov    0x1d8c,%eax
{
    1416:	89 e5                	mov    %esp,%ebp
    1418:	57                   	push   %edi
    1419:	56                   	push   %esi
    141a:	53                   	push   %ebx
    141b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    141e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1428:	39 c8                	cmp    %ecx,%eax
    142a:	8b 10                	mov    (%eax),%edx
    142c:	73 32                	jae    1460 <free+0x50>
    142e:	39 d1                	cmp    %edx,%ecx
    1430:	72 04                	jb     1436 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1432:	39 d0                	cmp    %edx,%eax
    1434:	72 32                	jb     1468 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1436:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1439:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    143c:	39 fa                	cmp    %edi,%edx
    143e:	74 30                	je     1470 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1440:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1443:	8b 50 04             	mov    0x4(%eax),%edx
    1446:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1449:	39 f1                	cmp    %esi,%ecx
    144b:	74 3a                	je     1487 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    144d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    144f:	a3 8c 1d 00 00       	mov    %eax,0x1d8c
}
    1454:	5b                   	pop    %ebx
    1455:	5e                   	pop    %esi
    1456:	5f                   	pop    %edi
    1457:	5d                   	pop    %ebp
    1458:	c3                   	ret    
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1460:	39 d0                	cmp    %edx,%eax
    1462:	72 04                	jb     1468 <free+0x58>
    1464:	39 d1                	cmp    %edx,%ecx
    1466:	72 ce                	jb     1436 <free+0x26>
{
    1468:	89 d0                	mov    %edx,%eax
    146a:	eb bc                	jmp    1428 <free+0x18>
    146c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1470:	03 72 04             	add    0x4(%edx),%esi
    1473:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1476:	8b 10                	mov    (%eax),%edx
    1478:	8b 12                	mov    (%edx),%edx
    147a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    147d:	8b 50 04             	mov    0x4(%eax),%edx
    1480:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1483:	39 f1                	cmp    %esi,%ecx
    1485:	75 c6                	jne    144d <free+0x3d>
    p->s.size += bp->s.size;
    1487:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    148a:	a3 8c 1d 00 00       	mov    %eax,0x1d8c
    p->s.size += bp->s.size;
    148f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1492:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1495:	89 10                	mov    %edx,(%eax)
}
    1497:	5b                   	pop    %ebx
    1498:	5e                   	pop    %esi
    1499:	5f                   	pop    %edi
    149a:	5d                   	pop    %ebp
    149b:	c3                   	ret    
    149c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
    14a4:	56                   	push   %esi
    14a5:	53                   	push   %ebx
    14a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    14a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    14ac:	8b 15 8c 1d 00 00    	mov    0x1d8c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    14b2:	8d 78 07             	lea    0x7(%eax),%edi
    14b5:	c1 ef 03             	shr    $0x3,%edi
    14b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    14bb:	85 d2                	test   %edx,%edx
    14bd:	0f 84 9d 00 00 00    	je     1560 <malloc+0xc0>
    14c3:	8b 02                	mov    (%edx),%eax
    14c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    14c8:	39 cf                	cmp    %ecx,%edi
    14ca:	76 6c                	jbe    1538 <malloc+0x98>
    14cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    14d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    14d7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    14da:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    14e1:	eb 0e                	jmp    14f1 <malloc+0x51>
    14e3:	90                   	nop
    14e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    14e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    14ea:	8b 48 04             	mov    0x4(%eax),%ecx
    14ed:	39 f9                	cmp    %edi,%ecx
    14ef:	73 47                	jae    1538 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    14f1:	39 05 8c 1d 00 00    	cmp    %eax,0x1d8c
    14f7:	89 c2                	mov    %eax,%edx
    14f9:	75 ed                	jne    14e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    14fb:	83 ec 0c             	sub    $0xc,%esp
    14fe:	56                   	push   %esi
    14ff:	e8 4d 01 00 00       	call   1651 <sbrk>
  if(p == (char*)-1)
    1504:	83 c4 10             	add    $0x10,%esp
    1507:	83 f8 ff             	cmp    $0xffffffff,%eax
    150a:	74 1c                	je     1528 <malloc+0x88>
  hp->s.size = nu;
    150c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    150f:	83 ec 0c             	sub    $0xc,%esp
    1512:	83 c0 08             	add    $0x8,%eax
    1515:	50                   	push   %eax
    1516:	e8 f5 fe ff ff       	call   1410 <free>
  return freep;
    151b:	8b 15 8c 1d 00 00    	mov    0x1d8c,%edx
      if((p = morecore(nunits)) == 0)
    1521:	83 c4 10             	add    $0x10,%esp
    1524:	85 d2                	test   %edx,%edx
    1526:	75 c0                	jne    14e8 <malloc+0x48>
        return 0;
  }
    1528:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    152b:	31 c0                	xor    %eax,%eax
    152d:	5b                   	pop    %ebx
    152e:	5e                   	pop    %esi
    152f:	5f                   	pop    %edi
    1530:	5d                   	pop    %ebp
    1531:	c3                   	ret    
    1532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1538:	39 cf                	cmp    %ecx,%edi
    153a:	74 54                	je     1590 <malloc+0xf0>
        p->s.size -= nunits;
    153c:	29 f9                	sub    %edi,%ecx
    153e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1541:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1544:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1547:	89 15 8c 1d 00 00    	mov    %edx,0x1d8c
    154d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1550:	83 c0 08             	add    $0x8,%eax
    1553:	5b                   	pop    %ebx
    1554:	5e                   	pop    %esi
    1555:	5f                   	pop    %edi
    1556:	5d                   	pop    %ebp
    1557:	c3                   	ret    
    1558:	90                   	nop
    1559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1560:	c7 05 8c 1d 00 00 90 	movl   $0x1d90,0x1d8c
    1567:	1d 00 00 
    156a:	c7 05 90 1d 00 00 90 	movl   $0x1d90,0x1d90
    1571:	1d 00 00 
    base.s.size = 0;
    1574:	b8 90 1d 00 00       	mov    $0x1d90,%eax
    1579:	c7 05 94 1d 00 00 00 	movl   $0x0,0x1d94
    1580:	00 00 00 
    1583:	e9 44 ff ff ff       	jmp    14cc <malloc+0x2c>
    1588:	90                   	nop
    1589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1590:	8b 08                	mov    (%eax),%ecx
    1592:	89 0a                	mov    %ecx,(%edx)
    1594:	eb b1                	jmp    1547 <malloc+0xa7>
    1596:	8d 76 00             	lea    0x0(%esi),%esi
    1599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000015a0 <thread_create>:
{
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
    15a3:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(PGSIZE);
    15a6:	68 00 10 00 00       	push   $0x1000
    15ab:	e8 f0 fe ff ff       	call   14a0 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    15b0:	50                   	push   %eax
    15b1:	ff 75 10             	pushl  0x10(%ebp)
    15b4:	ff 75 0c             	pushl  0xc(%ebp)
    15b7:	ff 75 08             	pushl  0x8(%ebp)
    15ba:	e8 da 00 00 00       	call   1699 <clone>
}
    15bf:	c9                   	leave  
    15c0:	c3                   	ret    

000015c1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    15c1:	b8 01 00 00 00       	mov    $0x1,%eax
    15c6:	cd 40                	int    $0x40
    15c8:	c3                   	ret    

000015c9 <exit>:
SYSCALL(exit)
    15c9:	b8 02 00 00 00       	mov    $0x2,%eax
    15ce:	cd 40                	int    $0x40
    15d0:	c3                   	ret    

000015d1 <wait>:
SYSCALL(wait)
    15d1:	b8 03 00 00 00       	mov    $0x3,%eax
    15d6:	cd 40                	int    $0x40
    15d8:	c3                   	ret    

000015d9 <pipe>:
SYSCALL(pipe)
    15d9:	b8 04 00 00 00       	mov    $0x4,%eax
    15de:	cd 40                	int    $0x40
    15e0:	c3                   	ret    

000015e1 <read>:
SYSCALL(read)
    15e1:	b8 05 00 00 00       	mov    $0x5,%eax
    15e6:	cd 40                	int    $0x40
    15e8:	c3                   	ret    

000015e9 <write>:
SYSCALL(write)
    15e9:	b8 10 00 00 00       	mov    $0x10,%eax
    15ee:	cd 40                	int    $0x40
    15f0:	c3                   	ret    

000015f1 <close>:
SYSCALL(close)
    15f1:	b8 15 00 00 00       	mov    $0x15,%eax
    15f6:	cd 40                	int    $0x40
    15f8:	c3                   	ret    

000015f9 <kill>:
SYSCALL(kill)
    15f9:	b8 06 00 00 00       	mov    $0x6,%eax
    15fe:	cd 40                	int    $0x40
    1600:	c3                   	ret    

00001601 <exec>:
SYSCALL(exec)
    1601:	b8 07 00 00 00       	mov    $0x7,%eax
    1606:	cd 40                	int    $0x40
    1608:	c3                   	ret    

00001609 <open>:
SYSCALL(open)
    1609:	b8 0f 00 00 00       	mov    $0xf,%eax
    160e:	cd 40                	int    $0x40
    1610:	c3                   	ret    

00001611 <mknod>:
SYSCALL(mknod)
    1611:	b8 11 00 00 00       	mov    $0x11,%eax
    1616:	cd 40                	int    $0x40
    1618:	c3                   	ret    

00001619 <unlink>:
SYSCALL(unlink)
    1619:	b8 12 00 00 00       	mov    $0x12,%eax
    161e:	cd 40                	int    $0x40
    1620:	c3                   	ret    

00001621 <fstat>:
SYSCALL(fstat)
    1621:	b8 08 00 00 00       	mov    $0x8,%eax
    1626:	cd 40                	int    $0x40
    1628:	c3                   	ret    

00001629 <link>:
SYSCALL(link)
    1629:	b8 13 00 00 00       	mov    $0x13,%eax
    162e:	cd 40                	int    $0x40
    1630:	c3                   	ret    

00001631 <mkdir>:
SYSCALL(mkdir)
    1631:	b8 14 00 00 00       	mov    $0x14,%eax
    1636:	cd 40                	int    $0x40
    1638:	c3                   	ret    

00001639 <chdir>:
SYSCALL(chdir)
    1639:	b8 09 00 00 00       	mov    $0x9,%eax
    163e:	cd 40                	int    $0x40
    1640:	c3                   	ret    

00001641 <dup>:
SYSCALL(dup)
    1641:	b8 0a 00 00 00       	mov    $0xa,%eax
    1646:	cd 40                	int    $0x40
    1648:	c3                   	ret    

00001649 <getpid>:
SYSCALL(getpid)
    1649:	b8 0b 00 00 00       	mov    $0xb,%eax
    164e:	cd 40                	int    $0x40
    1650:	c3                   	ret    

00001651 <sbrk>:
SYSCALL(sbrk)
    1651:	b8 0c 00 00 00       	mov    $0xc,%eax
    1656:	cd 40                	int    $0x40
    1658:	c3                   	ret    

00001659 <sleep>:
SYSCALL(sleep)
    1659:	b8 0d 00 00 00       	mov    $0xd,%eax
    165e:	cd 40                	int    $0x40
    1660:	c3                   	ret    

00001661 <uptime>:
SYSCALL(uptime)
    1661:	b8 0e 00 00 00       	mov    $0xe,%eax
    1666:	cd 40                	int    $0x40
    1668:	c3                   	ret    

00001669 <getreadcount>:
SYSCALL(getreadcount)
    1669:	b8 16 00 00 00       	mov    $0x16,%eax
    166e:	cd 40                	int    $0x40
    1670:	c3                   	ret    

00001671 <gettime>:
SYSCALL(gettime)
    1671:	b8 17 00 00 00       	mov    $0x17,%eax
    1676:	cd 40                	int    $0x40
    1678:	c3                   	ret    

00001679 <settickets>:
SYSCALL(settickets)
    1679:	b8 18 00 00 00       	mov    $0x18,%eax
    167e:	cd 40                	int    $0x40
    1680:	c3                   	ret    

00001681 <getpinfo>:
SYSCALL(getpinfo)
    1681:	b8 19 00 00 00       	mov    $0x19,%eax
    1686:	cd 40                	int    $0x40
    1688:	c3                   	ret    

00001689 <mprotect>:
SYSCALL(mprotect)
    1689:	b8 1a 00 00 00       	mov    $0x1a,%eax
    168e:	cd 40                	int    $0x40
    1690:	c3                   	ret    

00001691 <munprotect>:
SYSCALL(munprotect)
    1691:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1696:	cd 40                	int    $0x40
    1698:	c3                   	ret    

00001699 <clone>:
SYSCALL(clone)
    1699:	b8 1c 00 00 00       	mov    $0x1c,%eax
    169e:	cd 40                	int    $0x40
    16a0:	c3                   	ret    

000016a1 <join>:
    16a1:	b8 1d 00 00 00       	mov    $0x1d,%eax
    16a6:	cd 40                	int    $0x40
    16a8:	c3                   	ret    
    16a9:	66 90                	xchg   %ax,%ax
    16ab:	66 90                	xchg   %ax,%ax
    16ad:	66 90                	xchg   %ax,%ax
    16af:	90                   	nop

000016b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    16b0:	55                   	push   %ebp
    16b1:	89 e5                	mov    %esp,%ebp
    16b3:	57                   	push   %edi
    16b4:	56                   	push   %esi
    16b5:	53                   	push   %ebx
    16b6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    16b9:	85 d2                	test   %edx,%edx
{
    16bb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    16be:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    16c0:	79 76                	jns    1738 <printint+0x88>
    16c2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    16c6:	74 70                	je     1738 <printint+0x88>
    x = -xx;
    16c8:	f7 d8                	neg    %eax
    neg = 1;
    16ca:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    16d1:	31 f6                	xor    %esi,%esi
    16d3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    16d6:	eb 0a                	jmp    16e2 <printint+0x32>
    16d8:	90                   	nop
    16d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    16e0:	89 fe                	mov    %edi,%esi
    16e2:	31 d2                	xor    %edx,%edx
    16e4:	8d 7e 01             	lea    0x1(%esi),%edi
    16e7:	f7 f1                	div    %ecx
    16e9:	0f b6 92 28 1a 00 00 	movzbl 0x1a28(%edx),%edx
  }while((x /= base) != 0);
    16f0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    16f2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    16f5:	75 e9                	jne    16e0 <printint+0x30>
  if(neg)
    16f7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    16fa:	85 c0                	test   %eax,%eax
    16fc:	74 08                	je     1706 <printint+0x56>
    buf[i++] = '-';
    16fe:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1703:	8d 7e 02             	lea    0x2(%esi),%edi
    1706:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    170a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    170d:	8d 76 00             	lea    0x0(%esi),%esi
    1710:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1713:	83 ec 04             	sub    $0x4,%esp
    1716:	83 ee 01             	sub    $0x1,%esi
    1719:	6a 01                	push   $0x1
    171b:	53                   	push   %ebx
    171c:	57                   	push   %edi
    171d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1720:	e8 c4 fe ff ff       	call   15e9 <write>

  while(--i >= 0)
    1725:	83 c4 10             	add    $0x10,%esp
    1728:	39 de                	cmp    %ebx,%esi
    172a:	75 e4                	jne    1710 <printint+0x60>
    putc(fd, buf[i]);
}
    172c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    172f:	5b                   	pop    %ebx
    1730:	5e                   	pop    %esi
    1731:	5f                   	pop    %edi
    1732:	5d                   	pop    %ebp
    1733:	c3                   	ret    
    1734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1738:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    173f:	eb 90                	jmp    16d1 <printint+0x21>
    1741:	eb 0d                	jmp    1750 <printf>
    1743:	90                   	nop
    1744:	90                   	nop
    1745:	90                   	nop
    1746:	90                   	nop
    1747:	90                   	nop
    1748:	90                   	nop
    1749:	90                   	nop
    174a:	90                   	nop
    174b:	90                   	nop
    174c:	90                   	nop
    174d:	90                   	nop
    174e:	90                   	nop
    174f:	90                   	nop

00001750 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1750:	55                   	push   %ebp
    1751:	89 e5                	mov    %esp,%ebp
    1753:	57                   	push   %edi
    1754:	56                   	push   %esi
    1755:	53                   	push   %ebx
    1756:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1759:	8b 75 0c             	mov    0xc(%ebp),%esi
    175c:	0f b6 1e             	movzbl (%esi),%ebx
    175f:	84 db                	test   %bl,%bl
    1761:	0f 84 bf 00 00 00    	je     1826 <printf+0xd6>
    1767:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    176a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    176d:	31 d2                	xor    %edx,%edx
    176f:	eb 39                	jmp    17aa <printf+0x5a>
    1771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1778:	83 f8 25             	cmp    $0x25,%eax
    177b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    177e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1783:	74 1a                	je     179f <printf+0x4f>
  write(fd, &c, 1);
    1785:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1788:	83 ec 04             	sub    $0x4,%esp
    178b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    178e:	6a 01                	push   $0x1
    1790:	50                   	push   %eax
    1791:	ff 75 08             	pushl  0x8(%ebp)
    1794:	e8 50 fe ff ff       	call   15e9 <write>
    1799:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    179c:	83 c4 10             	add    $0x10,%esp
    179f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    17a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    17a6:	84 db                	test   %bl,%bl
    17a8:	74 7c                	je     1826 <printf+0xd6>
    if(state == 0){
    17aa:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    17ac:	0f be cb             	movsbl %bl,%ecx
    17af:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    17b2:	74 c4                	je     1778 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    17b4:	83 fa 25             	cmp    $0x25,%edx
    17b7:	75 e6                	jne    179f <printf+0x4f>
      if(c == 'd'){
    17b9:	83 f8 64             	cmp    $0x64,%eax
    17bc:	0f 84 a6 00 00 00    	je     1868 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    17c2:	83 f8 6c             	cmp    $0x6c,%eax
    17c5:	0f 84 ad 00 00 00    	je     1878 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    17cb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    17d1:	83 f9 70             	cmp    $0x70,%ecx
    17d4:	74 5a                	je     1830 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    17d6:	83 f8 73             	cmp    $0x73,%eax
    17d9:	0f 84 e1 00 00 00    	je     18c0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    17df:	83 f8 63             	cmp    $0x63,%eax
    17e2:	0f 84 28 01 00 00    	je     1910 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    17e8:	83 f8 25             	cmp    $0x25,%eax
    17eb:	74 6b                	je     1858 <printf+0x108>
  write(fd, &c, 1);
    17ed:	8d 45 e7             	lea    -0x19(%ebp),%eax
    17f0:	83 ec 04             	sub    $0x4,%esp
    17f3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    17f7:	6a 01                	push   $0x1
    17f9:	50                   	push   %eax
    17fa:	ff 75 08             	pushl  0x8(%ebp)
    17fd:	e8 e7 fd ff ff       	call   15e9 <write>
    1802:	83 c4 0c             	add    $0xc,%esp
    1805:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1808:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    180b:	6a 01                	push   $0x1
    180d:	50                   	push   %eax
    180e:	ff 75 08             	pushl  0x8(%ebp)
    1811:	83 c6 01             	add    $0x1,%esi
    1814:	e8 d0 fd ff ff       	call   15e9 <write>
  for(i = 0; fmt[i]; i++){
    1819:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    181d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1820:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1822:	84 db                	test   %bl,%bl
    1824:	75 84                	jne    17aa <printf+0x5a>
    }
  }
}
    1826:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1829:	5b                   	pop    %ebx
    182a:	5e                   	pop    %esi
    182b:	5f                   	pop    %edi
    182c:	5d                   	pop    %ebp
    182d:	c3                   	ret    
    182e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1830:	83 ec 0c             	sub    $0xc,%esp
    1833:	b9 10 00 00 00       	mov    $0x10,%ecx
    1838:	6a 00                	push   $0x0
    183a:	8b 17                	mov    (%edi),%edx
    183c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    183f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1842:	e8 69 fe ff ff       	call   16b0 <printint>
    1847:	83 c4 10             	add    $0x10,%esp
      state = 0;
    184a:	31 d2                	xor    %edx,%edx
    184c:	e9 4e ff ff ff       	jmp    179f <printf+0x4f>
    1851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1858:	83 ec 04             	sub    $0x4,%esp
    185b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    185e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1861:	6a 01                	push   $0x1
    1863:	eb a8                	jmp    180d <printf+0xbd>
    1865:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1868:	83 ec 0c             	sub    $0xc,%esp
    186b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1870:	6a 01                	push   $0x1
    1872:	eb c6                	jmp    183a <printf+0xea>
    1874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1878:	8b 57 04             	mov    0x4(%edi),%edx
    187b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    187d:	85 d2                	test   %edx,%edx
    187f:	74 15                	je     1896 <printf+0x146>
    1881:	83 ec 0c             	sub    $0xc,%esp
    1884:	8b 45 08             	mov    0x8(%ebp),%eax
    1887:	b9 10 00 00 00       	mov    $0x10,%ecx
    188c:	6a 00                	push   $0x0
    188e:	e8 1d fe ff ff       	call   16b0 <printint>
    1893:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1896:	83 ec 0c             	sub    $0xc,%esp
    1899:	8b 45 08             	mov    0x8(%ebp),%eax
    189c:	89 da                	mov    %ebx,%edx
    189e:	6a 00                	push   $0x0
    18a0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    18a5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    18a8:	e8 03 fe ff ff       	call   16b0 <printint>
    18ad:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18b0:	31 d2                	xor    %edx,%edx
    18b2:	e9 e8 fe ff ff       	jmp    179f <printf+0x4f>
    18b7:	89 f6                	mov    %esi,%esi
    18b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    18c0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    18c2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    18c5:	85 c9                	test   %ecx,%ecx
    18c7:	74 6a                	je     1933 <printf+0x1e3>
        while(*s != 0){
    18c9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    18cc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    18ce:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    18d0:	84 c0                	test   %al,%al
    18d2:	0f 84 c7 fe ff ff    	je     179f <printf+0x4f>
    18d8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    18db:	89 de                	mov    %ebx,%esi
    18dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    18e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    18e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    18e6:	83 ec 04             	sub    $0x4,%esp
    18e9:	6a 01                	push   $0x1
          s++;
    18eb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    18ee:	50                   	push   %eax
    18ef:	53                   	push   %ebx
    18f0:	e8 f4 fc ff ff       	call   15e9 <write>
        while(*s != 0){
    18f5:	0f b6 06             	movzbl (%esi),%eax
    18f8:	83 c4 10             	add    $0x10,%esp
    18fb:	84 c0                	test   %al,%al
    18fd:	75 e1                	jne    18e0 <printf+0x190>
    18ff:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1902:	31 d2                	xor    %edx,%edx
    1904:	e9 96 fe ff ff       	jmp    179f <printf+0x4f>
    1909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1910:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1912:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1915:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1918:	6a 01                	push   $0x1
        putc(fd, *ap);
    191a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    191d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1920:	50                   	push   %eax
    1921:	ff 75 08             	pushl  0x8(%ebp)
    1924:	e8 c0 fc ff ff       	call   15e9 <write>
    1929:	83 c4 10             	add    $0x10,%esp
      state = 0;
    192c:	31 d2                	xor    %edx,%edx
    192e:	e9 6c fe ff ff       	jmp    179f <printf+0x4f>
          s = "(null)";
    1933:	bb 20 1a 00 00       	mov    $0x1a20,%ebx
        while(*s != 0){
    1938:	b8 28 00 00 00       	mov    $0x28,%eax
    193d:	eb 99                	jmp    18d8 <printf+0x188>
