
_test_1:     file format elf32-i386


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
  int x1 = getreadcount();
  int x2 = getreadcount();
  char buf[100];
  (void) read(4, buf, 1);
    1011:	8d 75 84             	lea    -0x7c(%ebp),%esi
  int x3 = getreadcount();
    1014:	bb e8 03 00 00       	mov    $0x3e8,%ebx
main(int argc, char *argv[]) {
    1019:	81 ec 88 00 00 00    	sub    $0x88,%esp
  int x1 = getreadcount();
    101f:	e8 45 05 00 00       	call   1569 <getreadcount>
    1024:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  int x2 = getreadcount();
    102a:	e8 3a 05 00 00       	call   1569 <getreadcount>
  (void) read(4, buf, 1);
    102f:	83 ec 04             	sub    $0x4,%esp
  int x2 = getreadcount();
    1032:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
  (void) read(4, buf, 1);
    1038:	6a 01                	push   $0x1
    103a:	56                   	push   %esi
    103b:	6a 04                	push   $0x4
    103d:	e8 9f 04 00 00       	call   14e1 <read>
  int x3 = getreadcount();
    1042:	e8 22 05 00 00       	call   1569 <getreadcount>
    1047:	83 c4 10             	add    $0x10,%esp
    104a:	89 c7                	mov    %eax,%edi
    104c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for (i = 0; i < 1000; i++) {
    (void) read(4, buf, 1);
    1050:	83 ec 04             	sub    $0x4,%esp
    1053:	6a 01                	push   $0x1
    1055:	56                   	push   %esi
    1056:	6a 04                	push   $0x4
    1058:	e8 84 04 00 00       	call   14e1 <read>
  for (i = 0; i < 1000; i++) {
    105d:	83 c4 10             	add    $0x10,%esp
    1060:	83 eb 01             	sub    $0x1,%ebx
    1063:	75 eb                	jne    1050 <main+0x50>
  }
  int x4 = getreadcount();
    1065:	e8 ff 04 00 00       	call   1569 <getreadcount>
  printf(1, "XV6_TEST_OUTPUT %d %d %d\n", x2-x1, x3-x2, x4-x3);
    106a:	83 ec 0c             	sub    $0xc,%esp
    106d:	29 f8                	sub    %edi,%eax
    106f:	50                   	push   %eax
    1070:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    1076:	29 c7                	sub    %eax,%edi
    1078:	2b 85 74 ff ff ff    	sub    -0x8c(%ebp),%eax
    107e:	57                   	push   %edi
    107f:	50                   	push   %eax
    1080:	68 40 18 00 00       	push   $0x1840
    1085:	6a 01                	push   $0x1
    1087:	e8 c4 05 00 00       	call   1650 <printf>
  exit();
    108c:	83 c4 20             	add    $0x20,%esp
    108f:	e8 35 04 00 00       	call   14c9 <exit>
    1094:	66 90                	xchg   %ax,%ax
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	53                   	push   %ebx
    10a4:	8b 45 08             	mov    0x8(%ebp),%eax
    10a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10aa:	89 c2                	mov    %eax,%edx
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10b0:	83 c1 01             	add    $0x1,%ecx
    10b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    10b7:	83 c2 01             	add    $0x1,%edx
    10ba:	84 db                	test   %bl,%bl
    10bc:	88 5a ff             	mov    %bl,-0x1(%edx)
    10bf:	75 ef                	jne    10b0 <strcpy+0x10>
    ;
  return os;
}
    10c1:	5b                   	pop    %ebx
    10c2:	5d                   	pop    %ebp
    10c3:	c3                   	ret    
    10c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	8b 55 08             	mov    0x8(%ebp),%edx
    10d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10da:	0f b6 02             	movzbl (%edx),%eax
    10dd:	0f b6 19             	movzbl (%ecx),%ebx
    10e0:	84 c0                	test   %al,%al
    10e2:	75 1c                	jne    1100 <strcmp+0x30>
    10e4:	eb 2a                	jmp    1110 <strcmp+0x40>
    10e6:	8d 76 00             	lea    0x0(%esi),%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10f0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10f6:	83 c1 01             	add    $0x1,%ecx
    10f9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10fc:	84 c0                	test   %al,%al
    10fe:	74 10                	je     1110 <strcmp+0x40>
    1100:	38 d8                	cmp    %bl,%al
    1102:	74 ec                	je     10f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1104:	29 d8                	sub    %ebx,%eax
}
    1106:	5b                   	pop    %ebx
    1107:	5d                   	pop    %ebp
    1108:	c3                   	ret    
    1109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1110:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1112:	29 d8                	sub    %ebx,%eax
}
    1114:	5b                   	pop    %ebx
    1115:	5d                   	pop    %ebp
    1116:	c3                   	ret    
    1117:	89 f6                	mov    %esi,%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001120 <strlen>:

uint
strlen(const char *s)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1126:	80 39 00             	cmpb   $0x0,(%ecx)
    1129:	74 15                	je     1140 <strlen+0x20>
    112b:	31 d2                	xor    %edx,%edx
    112d:	8d 76 00             	lea    0x0(%esi),%esi
    1130:	83 c2 01             	add    $0x1,%edx
    1133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1137:	89 d0                	mov    %edx,%eax
    1139:	75 f5                	jne    1130 <strlen+0x10>
    ;
  return n;
}
    113b:	5d                   	pop    %ebp
    113c:	c3                   	ret    
    113d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1140:	31 c0                	xor    %eax,%eax
}
    1142:	5d                   	pop    %ebp
    1143:	c3                   	ret    
    1144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    114a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001150 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1157:	8b 4d 10             	mov    0x10(%ebp),%ecx
    115a:	8b 45 0c             	mov    0xc(%ebp),%eax
    115d:	89 d7                	mov    %edx,%edi
    115f:	fc                   	cld    
    1160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1162:	89 d0                	mov    %edx,%eax
    1164:	5f                   	pop    %edi
    1165:	5d                   	pop    %ebp
    1166:	c3                   	ret    
    1167:	89 f6                	mov    %esi,%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <strchr>:

char*
strchr(const char *s, char c)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	8b 45 08             	mov    0x8(%ebp),%eax
    1177:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    117a:	0f b6 10             	movzbl (%eax),%edx
    117d:	84 d2                	test   %dl,%dl
    117f:	74 1d                	je     119e <strchr+0x2e>
    if(*s == c)
    1181:	38 d3                	cmp    %dl,%bl
    1183:	89 d9                	mov    %ebx,%ecx
    1185:	75 0d                	jne    1194 <strchr+0x24>
    1187:	eb 17                	jmp    11a0 <strchr+0x30>
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1190:	38 ca                	cmp    %cl,%dl
    1192:	74 0c                	je     11a0 <strchr+0x30>
  for(; *s; s++)
    1194:	83 c0 01             	add    $0x1,%eax
    1197:	0f b6 10             	movzbl (%eax),%edx
    119a:	84 d2                	test   %dl,%dl
    119c:	75 f2                	jne    1190 <strchr+0x20>
      return (char*)s;
  return 0;
    119e:	31 c0                	xor    %eax,%eax
}
    11a0:	5b                   	pop    %ebx
    11a1:	5d                   	pop    %ebp
    11a2:	c3                   	ret    
    11a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011b0 <gets>:

char*
gets(char *buf, int max)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
    11b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11b6:	31 f6                	xor    %esi,%esi
    11b8:	89 f3                	mov    %esi,%ebx
{
    11ba:	83 ec 1c             	sub    $0x1c,%esp
    11bd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11c0:	eb 2f                	jmp    11f1 <gets+0x41>
    11c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11cb:	83 ec 04             	sub    $0x4,%esp
    11ce:	6a 01                	push   $0x1
    11d0:	50                   	push   %eax
    11d1:	6a 00                	push   $0x0
    11d3:	e8 09 03 00 00       	call   14e1 <read>
    if(cc < 1)
    11d8:	83 c4 10             	add    $0x10,%esp
    11db:	85 c0                	test   %eax,%eax
    11dd:	7e 1c                	jle    11fb <gets+0x4b>
      break;
    buf[i++] = c;
    11df:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11e3:	83 c7 01             	add    $0x1,%edi
    11e6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11e9:	3c 0a                	cmp    $0xa,%al
    11eb:	74 23                	je     1210 <gets+0x60>
    11ed:	3c 0d                	cmp    $0xd,%al
    11ef:	74 1f                	je     1210 <gets+0x60>
  for(i=0; i+1 < max; ){
    11f1:	83 c3 01             	add    $0x1,%ebx
    11f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11f7:	89 fe                	mov    %edi,%esi
    11f9:	7c cd                	jl     11c8 <gets+0x18>
    11fb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11fd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1200:	c6 03 00             	movb   $0x0,(%ebx)
}
    1203:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1206:	5b                   	pop    %ebx
    1207:	5e                   	pop    %esi
    1208:	5f                   	pop    %edi
    1209:	5d                   	pop    %ebp
    120a:	c3                   	ret    
    120b:	90                   	nop
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1210:	8b 75 08             	mov    0x8(%ebp),%esi
    1213:	8b 45 08             	mov    0x8(%ebp),%eax
    1216:	01 de                	add    %ebx,%esi
    1218:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    121a:	c6 03 00             	movb   $0x0,(%ebx)
}
    121d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1220:	5b                   	pop    %ebx
    1221:	5e                   	pop    %esi
    1222:	5f                   	pop    %edi
    1223:	5d                   	pop    %ebp
    1224:	c3                   	ret    
    1225:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <stat>:

int
stat(const char *n, struct stat *st)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	56                   	push   %esi
    1234:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1235:	83 ec 08             	sub    $0x8,%esp
    1238:	6a 00                	push   $0x0
    123a:	ff 75 08             	pushl  0x8(%ebp)
    123d:	e8 c7 02 00 00       	call   1509 <open>
  if(fd < 0)
    1242:	83 c4 10             	add    $0x10,%esp
    1245:	85 c0                	test   %eax,%eax
    1247:	78 27                	js     1270 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1249:	83 ec 08             	sub    $0x8,%esp
    124c:	ff 75 0c             	pushl  0xc(%ebp)
    124f:	89 c3                	mov    %eax,%ebx
    1251:	50                   	push   %eax
    1252:	e8 ca 02 00 00       	call   1521 <fstat>
  close(fd);
    1257:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    125a:	89 c6                	mov    %eax,%esi
  close(fd);
    125c:	e8 90 02 00 00       	call   14f1 <close>
  return r;
    1261:	83 c4 10             	add    $0x10,%esp
}
    1264:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1267:	89 f0                	mov    %esi,%eax
    1269:	5b                   	pop    %ebx
    126a:	5e                   	pop    %esi
    126b:	5d                   	pop    %ebp
    126c:	c3                   	ret    
    126d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1270:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1275:	eb ed                	jmp    1264 <stat+0x34>
    1277:	89 f6                	mov    %esi,%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001280 <atoi>:

int
atoi(const char *s)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	53                   	push   %ebx
    1284:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1287:	0f be 11             	movsbl (%ecx),%edx
    128a:	8d 42 d0             	lea    -0x30(%edx),%eax
    128d:	3c 09                	cmp    $0x9,%al
  n = 0;
    128f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1294:	77 1f                	ja     12b5 <atoi+0x35>
    1296:	8d 76 00             	lea    0x0(%esi),%esi
    1299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    12a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12a3:	83 c1 01             	add    $0x1,%ecx
    12a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    12aa:	0f be 11             	movsbl (%ecx),%edx
    12ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12b0:	80 fb 09             	cmp    $0x9,%bl
    12b3:	76 eb                	jbe    12a0 <atoi+0x20>
  return n;
}
    12b5:	5b                   	pop    %ebx
    12b6:	5d                   	pop    %ebp
    12b7:	c3                   	ret    
    12b8:	90                   	nop
    12b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	56                   	push   %esi
    12c4:	53                   	push   %ebx
    12c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12c8:	8b 45 08             	mov    0x8(%ebp),%eax
    12cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ce:	85 db                	test   %ebx,%ebx
    12d0:	7e 14                	jle    12e6 <memmove+0x26>
    12d2:	31 d2                	xor    %edx,%edx
    12d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12e2:	39 d3                	cmp    %edx,%ebx
    12e4:	75 f2                	jne    12d8 <memmove+0x18>
  return vdst;
}
    12e6:	5b                   	pop    %ebx
    12e7:	5e                   	pop    %esi
    12e8:	5d                   	pop    %ebp
    12e9:	c3                   	ret    
    12ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012f0 <thread_join>:
  }*/
  return clone(start_routine, arg1, arg2, stack);
}

int thread_join()
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    12f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    12f9:	50                   	push   %eax
    12fa:	e8 a2 02 00 00       	call   15a1 <join>
  //free(stackPtr);
  return x;
}
    12ff:	c9                   	leave  
    1300:	c3                   	ret    
    1301:	eb 0d                	jmp    1310 <free>
    1303:	90                   	nop
    1304:	90                   	nop
    1305:	90                   	nop
    1306:	90                   	nop
    1307:	90                   	nop
    1308:	90                   	nop
    1309:	90                   	nop
    130a:	90                   	nop
    130b:	90                   	nop
    130c:	90                   	nop
    130d:	90                   	nop
    130e:	90                   	nop
    130f:	90                   	nop

00001310 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1310:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1311:	a1 54 1b 00 00       	mov    0x1b54,%eax
{
    1316:	89 e5                	mov    %esp,%ebp
    1318:	57                   	push   %edi
    1319:	56                   	push   %esi
    131a:	53                   	push   %ebx
    131b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    131e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1328:	39 c8                	cmp    %ecx,%eax
    132a:	8b 10                	mov    (%eax),%edx
    132c:	73 32                	jae    1360 <free+0x50>
    132e:	39 d1                	cmp    %edx,%ecx
    1330:	72 04                	jb     1336 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1332:	39 d0                	cmp    %edx,%eax
    1334:	72 32                	jb     1368 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1336:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1339:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    133c:	39 fa                	cmp    %edi,%edx
    133e:	74 30                	je     1370 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1340:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1343:	8b 50 04             	mov    0x4(%eax),%edx
    1346:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1349:	39 f1                	cmp    %esi,%ecx
    134b:	74 3a                	je     1387 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    134d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    134f:	a3 54 1b 00 00       	mov    %eax,0x1b54
}
    1354:	5b                   	pop    %ebx
    1355:	5e                   	pop    %esi
    1356:	5f                   	pop    %edi
    1357:	5d                   	pop    %ebp
    1358:	c3                   	ret    
    1359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1360:	39 d0                	cmp    %edx,%eax
    1362:	72 04                	jb     1368 <free+0x58>
    1364:	39 d1                	cmp    %edx,%ecx
    1366:	72 ce                	jb     1336 <free+0x26>
{
    1368:	89 d0                	mov    %edx,%eax
    136a:	eb bc                	jmp    1328 <free+0x18>
    136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1370:	03 72 04             	add    0x4(%edx),%esi
    1373:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1376:	8b 10                	mov    (%eax),%edx
    1378:	8b 12                	mov    (%edx),%edx
    137a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    137d:	8b 50 04             	mov    0x4(%eax),%edx
    1380:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1383:	39 f1                	cmp    %esi,%ecx
    1385:	75 c6                	jne    134d <free+0x3d>
    p->s.size += bp->s.size;
    1387:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    138a:	a3 54 1b 00 00       	mov    %eax,0x1b54
    p->s.size += bp->s.size;
    138f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1392:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1395:	89 10                	mov    %edx,(%eax)
}
    1397:	5b                   	pop    %ebx
    1398:	5e                   	pop    %esi
    1399:	5f                   	pop    %edi
    139a:	5d                   	pop    %ebp
    139b:	c3                   	ret    
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	57                   	push   %edi
    13a4:	56                   	push   %esi
    13a5:	53                   	push   %ebx
    13a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    13ac:	8b 15 54 1b 00 00    	mov    0x1b54,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13b2:	8d 78 07             	lea    0x7(%eax),%edi
    13b5:	c1 ef 03             	shr    $0x3,%edi
    13b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    13bb:	85 d2                	test   %edx,%edx
    13bd:	0f 84 9d 00 00 00    	je     1460 <malloc+0xc0>
    13c3:	8b 02                	mov    (%edx),%eax
    13c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    13c8:	39 cf                	cmp    %ecx,%edi
    13ca:	76 6c                	jbe    1438 <malloc+0x98>
    13cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    13d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    13d7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    13da:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13e1:	eb 0e                	jmp    13f1 <malloc+0x51>
    13e3:	90                   	nop
    13e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    13ea:	8b 48 04             	mov    0x4(%eax),%ecx
    13ed:	39 f9                	cmp    %edi,%ecx
    13ef:	73 47                	jae    1438 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13f1:	39 05 54 1b 00 00    	cmp    %eax,0x1b54
    13f7:	89 c2                	mov    %eax,%edx
    13f9:	75 ed                	jne    13e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13fb:	83 ec 0c             	sub    $0xc,%esp
    13fe:	56                   	push   %esi
    13ff:	e8 4d 01 00 00       	call   1551 <sbrk>
  if(p == (char*)-1)
    1404:	83 c4 10             	add    $0x10,%esp
    1407:	83 f8 ff             	cmp    $0xffffffff,%eax
    140a:	74 1c                	je     1428 <malloc+0x88>
  hp->s.size = nu;
    140c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    140f:	83 ec 0c             	sub    $0xc,%esp
    1412:	83 c0 08             	add    $0x8,%eax
    1415:	50                   	push   %eax
    1416:	e8 f5 fe ff ff       	call   1310 <free>
  return freep;
    141b:	8b 15 54 1b 00 00    	mov    0x1b54,%edx
      if((p = morecore(nunits)) == 0)
    1421:	83 c4 10             	add    $0x10,%esp
    1424:	85 d2                	test   %edx,%edx
    1426:	75 c0                	jne    13e8 <malloc+0x48>
        return 0;
  }
    1428:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    142b:	31 c0                	xor    %eax,%eax
    142d:	5b                   	pop    %ebx
    142e:	5e                   	pop    %esi
    142f:	5f                   	pop    %edi
    1430:	5d                   	pop    %ebp
    1431:	c3                   	ret    
    1432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1438:	39 cf                	cmp    %ecx,%edi
    143a:	74 54                	je     1490 <malloc+0xf0>
        p->s.size -= nunits;
    143c:	29 f9                	sub    %edi,%ecx
    143e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1441:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1444:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1447:	89 15 54 1b 00 00    	mov    %edx,0x1b54
    144d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1450:	83 c0 08             	add    $0x8,%eax
    1453:	5b                   	pop    %ebx
    1454:	5e                   	pop    %esi
    1455:	5f                   	pop    %edi
    1456:	5d                   	pop    %ebp
    1457:	c3                   	ret    
    1458:	90                   	nop
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1460:	c7 05 54 1b 00 00 58 	movl   $0x1b58,0x1b54
    1467:	1b 00 00 
    146a:	c7 05 58 1b 00 00 58 	movl   $0x1b58,0x1b58
    1471:	1b 00 00 
    base.s.size = 0;
    1474:	b8 58 1b 00 00       	mov    $0x1b58,%eax
    1479:	c7 05 5c 1b 00 00 00 	movl   $0x0,0x1b5c
    1480:	00 00 00 
    1483:	e9 44 ff ff ff       	jmp    13cc <malloc+0x2c>
    1488:	90                   	nop
    1489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1490:	8b 08                	mov    (%eax),%ecx
    1492:	89 0a                	mov    %ecx,(%edx)
    1494:	eb b1                	jmp    1447 <malloc+0xa7>
    1496:	8d 76 00             	lea    0x0(%esi),%esi
    1499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000014a0 <thread_create>:
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(PGSIZE);
    14a6:	68 00 10 00 00       	push   $0x1000
    14ab:	e8 f0 fe ff ff       	call   13a0 <malloc>
  return clone(start_routine, arg1, arg2, stack);
    14b0:	50                   	push   %eax
    14b1:	ff 75 10             	pushl  0x10(%ebp)
    14b4:	ff 75 0c             	pushl  0xc(%ebp)
    14b7:	ff 75 08             	pushl  0x8(%ebp)
    14ba:	e8 da 00 00 00       	call   1599 <clone>
}
    14bf:	c9                   	leave  
    14c0:	c3                   	ret    

000014c1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    14c1:	b8 01 00 00 00       	mov    $0x1,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <exit>:
SYSCALL(exit)
    14c9:	b8 02 00 00 00       	mov    $0x2,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <wait>:
SYSCALL(wait)
    14d1:	b8 03 00 00 00       	mov    $0x3,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <pipe>:
SYSCALL(pipe)
    14d9:	b8 04 00 00 00       	mov    $0x4,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <read>:
SYSCALL(read)
    14e1:	b8 05 00 00 00       	mov    $0x5,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <write>:
SYSCALL(write)
    14e9:	b8 10 00 00 00       	mov    $0x10,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <close>:
SYSCALL(close)
    14f1:	b8 15 00 00 00       	mov    $0x15,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <kill>:
SYSCALL(kill)
    14f9:	b8 06 00 00 00       	mov    $0x6,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <exec>:
SYSCALL(exec)
    1501:	b8 07 00 00 00       	mov    $0x7,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <open>:
SYSCALL(open)
    1509:	b8 0f 00 00 00       	mov    $0xf,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    

00001511 <mknod>:
SYSCALL(mknod)
    1511:	b8 11 00 00 00       	mov    $0x11,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <unlink>:
SYSCALL(unlink)
    1519:	b8 12 00 00 00       	mov    $0x12,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <fstat>:
SYSCALL(fstat)
    1521:	b8 08 00 00 00       	mov    $0x8,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <link>:
SYSCALL(link)
    1529:	b8 13 00 00 00       	mov    $0x13,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <mkdir>:
SYSCALL(mkdir)
    1531:	b8 14 00 00 00       	mov    $0x14,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <chdir>:
SYSCALL(chdir)
    1539:	b8 09 00 00 00       	mov    $0x9,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <dup>:
SYSCALL(dup)
    1541:	b8 0a 00 00 00       	mov    $0xa,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <getpid>:
SYSCALL(getpid)
    1549:	b8 0b 00 00 00       	mov    $0xb,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    

00001551 <sbrk>:
SYSCALL(sbrk)
    1551:	b8 0c 00 00 00       	mov    $0xc,%eax
    1556:	cd 40                	int    $0x40
    1558:	c3                   	ret    

00001559 <sleep>:
SYSCALL(sleep)
    1559:	b8 0d 00 00 00       	mov    $0xd,%eax
    155e:	cd 40                	int    $0x40
    1560:	c3                   	ret    

00001561 <uptime>:
SYSCALL(uptime)
    1561:	b8 0e 00 00 00       	mov    $0xe,%eax
    1566:	cd 40                	int    $0x40
    1568:	c3                   	ret    

00001569 <getreadcount>:
SYSCALL(getreadcount)
    1569:	b8 16 00 00 00       	mov    $0x16,%eax
    156e:	cd 40                	int    $0x40
    1570:	c3                   	ret    

00001571 <gettime>:
SYSCALL(gettime)
    1571:	b8 17 00 00 00       	mov    $0x17,%eax
    1576:	cd 40                	int    $0x40
    1578:	c3                   	ret    

00001579 <settickets>:
SYSCALL(settickets)
    1579:	b8 18 00 00 00       	mov    $0x18,%eax
    157e:	cd 40                	int    $0x40
    1580:	c3                   	ret    

00001581 <getpinfo>:
SYSCALL(getpinfo)
    1581:	b8 19 00 00 00       	mov    $0x19,%eax
    1586:	cd 40                	int    $0x40
    1588:	c3                   	ret    

00001589 <mprotect>:
SYSCALL(mprotect)
    1589:	b8 1a 00 00 00       	mov    $0x1a,%eax
    158e:	cd 40                	int    $0x40
    1590:	c3                   	ret    

00001591 <munprotect>:
SYSCALL(munprotect)
    1591:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1596:	cd 40                	int    $0x40
    1598:	c3                   	ret    

00001599 <clone>:
SYSCALL(clone)
    1599:	b8 1c 00 00 00       	mov    $0x1c,%eax
    159e:	cd 40                	int    $0x40
    15a0:	c3                   	ret    

000015a1 <join>:
    15a1:	b8 1d 00 00 00       	mov    $0x1d,%eax
    15a6:	cd 40                	int    $0x40
    15a8:	c3                   	ret    
    15a9:	66 90                	xchg   %ax,%ax
    15ab:	66 90                	xchg   %ax,%ax
    15ad:	66 90                	xchg   %ax,%ax
    15af:	90                   	nop

000015b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    15b3:	57                   	push   %edi
    15b4:	56                   	push   %esi
    15b5:	53                   	push   %ebx
    15b6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    15b9:	85 d2                	test   %edx,%edx
{
    15bb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    15be:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    15c0:	79 76                	jns    1638 <printint+0x88>
    15c2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    15c6:	74 70                	je     1638 <printint+0x88>
    x = -xx;
    15c8:	f7 d8                	neg    %eax
    neg = 1;
    15ca:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    15d1:	31 f6                	xor    %esi,%esi
    15d3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    15d6:	eb 0a                	jmp    15e2 <printint+0x32>
    15d8:	90                   	nop
    15d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    15e0:	89 fe                	mov    %edi,%esi
    15e2:	31 d2                	xor    %edx,%edx
    15e4:	8d 7e 01             	lea    0x1(%esi),%edi
    15e7:	f7 f1                	div    %ecx
    15e9:	0f b6 92 64 18 00 00 	movzbl 0x1864(%edx),%edx
  }while((x /= base) != 0);
    15f0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    15f2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    15f5:	75 e9                	jne    15e0 <printint+0x30>
  if(neg)
    15f7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    15fa:	85 c0                	test   %eax,%eax
    15fc:	74 08                	je     1606 <printint+0x56>
    buf[i++] = '-';
    15fe:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1603:	8d 7e 02             	lea    0x2(%esi),%edi
    1606:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    160a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    160d:	8d 76 00             	lea    0x0(%esi),%esi
    1610:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1613:	83 ec 04             	sub    $0x4,%esp
    1616:	83 ee 01             	sub    $0x1,%esi
    1619:	6a 01                	push   $0x1
    161b:	53                   	push   %ebx
    161c:	57                   	push   %edi
    161d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1620:	e8 c4 fe ff ff       	call   14e9 <write>

  while(--i >= 0)
    1625:	83 c4 10             	add    $0x10,%esp
    1628:	39 de                	cmp    %ebx,%esi
    162a:	75 e4                	jne    1610 <printint+0x60>
    putc(fd, buf[i]);
}
    162c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    162f:	5b                   	pop    %ebx
    1630:	5e                   	pop    %esi
    1631:	5f                   	pop    %edi
    1632:	5d                   	pop    %ebp
    1633:	c3                   	ret    
    1634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1638:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    163f:	eb 90                	jmp    15d1 <printint+0x21>
    1641:	eb 0d                	jmp    1650 <printf>
    1643:	90                   	nop
    1644:	90                   	nop
    1645:	90                   	nop
    1646:	90                   	nop
    1647:	90                   	nop
    1648:	90                   	nop
    1649:	90                   	nop
    164a:	90                   	nop
    164b:	90                   	nop
    164c:	90                   	nop
    164d:	90                   	nop
    164e:	90                   	nop
    164f:	90                   	nop

00001650 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	57                   	push   %edi
    1654:	56                   	push   %esi
    1655:	53                   	push   %ebx
    1656:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1659:	8b 75 0c             	mov    0xc(%ebp),%esi
    165c:	0f b6 1e             	movzbl (%esi),%ebx
    165f:	84 db                	test   %bl,%bl
    1661:	0f 84 bf 00 00 00    	je     1726 <printf+0xd6>
    1667:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    166a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    166d:	31 d2                	xor    %edx,%edx
    166f:	eb 39                	jmp    16aa <printf+0x5a>
    1671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1678:	83 f8 25             	cmp    $0x25,%eax
    167b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    167e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1683:	74 1a                	je     169f <printf+0x4f>
  write(fd, &c, 1);
    1685:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1688:	83 ec 04             	sub    $0x4,%esp
    168b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    168e:	6a 01                	push   $0x1
    1690:	50                   	push   %eax
    1691:	ff 75 08             	pushl  0x8(%ebp)
    1694:	e8 50 fe ff ff       	call   14e9 <write>
    1699:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    169c:	83 c4 10             	add    $0x10,%esp
    169f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    16a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    16a6:	84 db                	test   %bl,%bl
    16a8:	74 7c                	je     1726 <printf+0xd6>
    if(state == 0){
    16aa:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    16ac:	0f be cb             	movsbl %bl,%ecx
    16af:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    16b2:	74 c4                	je     1678 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    16b4:	83 fa 25             	cmp    $0x25,%edx
    16b7:	75 e6                	jne    169f <printf+0x4f>
      if(c == 'd'){
    16b9:	83 f8 64             	cmp    $0x64,%eax
    16bc:	0f 84 a6 00 00 00    	je     1768 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    16c2:	83 f8 6c             	cmp    $0x6c,%eax
    16c5:	0f 84 ad 00 00 00    	je     1778 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    16cb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    16d1:	83 f9 70             	cmp    $0x70,%ecx
    16d4:	74 5a                	je     1730 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16d6:	83 f8 73             	cmp    $0x73,%eax
    16d9:	0f 84 e1 00 00 00    	je     17c0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16df:	83 f8 63             	cmp    $0x63,%eax
    16e2:	0f 84 28 01 00 00    	je     1810 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    16e8:	83 f8 25             	cmp    $0x25,%eax
    16eb:	74 6b                	je     1758 <printf+0x108>
  write(fd, &c, 1);
    16ed:	8d 45 e7             	lea    -0x19(%ebp),%eax
    16f0:	83 ec 04             	sub    $0x4,%esp
    16f3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16f7:	6a 01                	push   $0x1
    16f9:	50                   	push   %eax
    16fa:	ff 75 08             	pushl  0x8(%ebp)
    16fd:	e8 e7 fd ff ff       	call   14e9 <write>
    1702:	83 c4 0c             	add    $0xc,%esp
    1705:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1708:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    170b:	6a 01                	push   $0x1
    170d:	50                   	push   %eax
    170e:	ff 75 08             	pushl  0x8(%ebp)
    1711:	83 c6 01             	add    $0x1,%esi
    1714:	e8 d0 fd ff ff       	call   14e9 <write>
  for(i = 0; fmt[i]; i++){
    1719:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    171d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1720:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1722:	84 db                	test   %bl,%bl
    1724:	75 84                	jne    16aa <printf+0x5a>
    }
  }
}
    1726:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1729:	5b                   	pop    %ebx
    172a:	5e                   	pop    %esi
    172b:	5f                   	pop    %edi
    172c:	5d                   	pop    %ebp
    172d:	c3                   	ret    
    172e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1730:	83 ec 0c             	sub    $0xc,%esp
    1733:	b9 10 00 00 00       	mov    $0x10,%ecx
    1738:	6a 00                	push   $0x0
    173a:	8b 17                	mov    (%edi),%edx
    173c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    173f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1742:	e8 69 fe ff ff       	call   15b0 <printint>
    1747:	83 c4 10             	add    $0x10,%esp
      state = 0;
    174a:	31 d2                	xor    %edx,%edx
    174c:	e9 4e ff ff ff       	jmp    169f <printf+0x4f>
    1751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1758:	83 ec 04             	sub    $0x4,%esp
    175b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    175e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1761:	6a 01                	push   $0x1
    1763:	eb a8                	jmp    170d <printf+0xbd>
    1765:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1768:	83 ec 0c             	sub    $0xc,%esp
    176b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1770:	6a 01                	push   $0x1
    1772:	eb c6                	jmp    173a <printf+0xea>
    1774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1778:	8b 57 04             	mov    0x4(%edi),%edx
    177b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    177d:	85 d2                	test   %edx,%edx
    177f:	74 15                	je     1796 <printf+0x146>
    1781:	83 ec 0c             	sub    $0xc,%esp
    1784:	8b 45 08             	mov    0x8(%ebp),%eax
    1787:	b9 10 00 00 00       	mov    $0x10,%ecx
    178c:	6a 00                	push   $0x0
    178e:	e8 1d fe ff ff       	call   15b0 <printint>
    1793:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1796:	83 ec 0c             	sub    $0xc,%esp
    1799:	8b 45 08             	mov    0x8(%ebp),%eax
    179c:	89 da                	mov    %ebx,%edx
    179e:	6a 00                	push   $0x0
    17a0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    17a5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    17a8:	e8 03 fe ff ff       	call   15b0 <printint>
    17ad:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17b0:	31 d2                	xor    %edx,%edx
    17b2:	e9 e8 fe ff ff       	jmp    169f <printf+0x4f>
    17b7:	89 f6                	mov    %esi,%esi
    17b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    17c0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    17c2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    17c5:	85 c9                	test   %ecx,%ecx
    17c7:	74 6a                	je     1833 <printf+0x1e3>
        while(*s != 0){
    17c9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    17cc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    17ce:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    17d0:	84 c0                	test   %al,%al
    17d2:	0f 84 c7 fe ff ff    	je     169f <printf+0x4f>
    17d8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    17db:	89 de                	mov    %ebx,%esi
    17dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    17e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    17e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    17e6:	83 ec 04             	sub    $0x4,%esp
    17e9:	6a 01                	push   $0x1
          s++;
    17eb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    17ee:	50                   	push   %eax
    17ef:	53                   	push   %ebx
    17f0:	e8 f4 fc ff ff       	call   14e9 <write>
        while(*s != 0){
    17f5:	0f b6 06             	movzbl (%esi),%eax
    17f8:	83 c4 10             	add    $0x10,%esp
    17fb:	84 c0                	test   %al,%al
    17fd:	75 e1                	jne    17e0 <printf+0x190>
    17ff:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1802:	31 d2                	xor    %edx,%edx
    1804:	e9 96 fe ff ff       	jmp    169f <printf+0x4f>
    1809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1810:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1812:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1815:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1818:	6a 01                	push   $0x1
        putc(fd, *ap);
    181a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    181d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1820:	50                   	push   %eax
    1821:	ff 75 08             	pushl  0x8(%ebp)
    1824:	e8 c0 fc ff ff       	call   14e9 <write>
    1829:	83 c4 10             	add    $0x10,%esp
      state = 0;
    182c:	31 d2                	xor    %edx,%edx
    182e:	e9 6c fe ff ff       	jmp    169f <printf+0x4f>
          s = "(null)";
    1833:	bb 5a 18 00 00       	mov    $0x185a,%ebx
        while(*s != 0){
    1838:	b8 28 00 00 00       	mov    $0x28,%eax
    183d:	eb 99                	jmp    17d8 <printf+0x188>
