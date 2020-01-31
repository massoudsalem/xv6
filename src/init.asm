
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    100f:	83 ec 08             	sub    $0x8,%esp
    1012:	6a 02                	push   $0x2
    1014:	68 90 18 00 00       	push   $0x1890
    1019:	e8 3b 05 00 00       	call   1559 <open>
    101e:	83 c4 10             	add    $0x10,%esp
    1021:	85 c0                	test   %eax,%eax
    1023:	0f 88 9f 00 00 00    	js     10c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1029:	83 ec 0c             	sub    $0xc,%esp
    102c:	6a 00                	push   $0x0
    102e:	e8 5e 05 00 00       	call   1591 <dup>
  dup(0);  // stderr
    1033:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    103a:	e8 52 05 00 00       	call   1591 <dup>
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    1048:	83 ec 08             	sub    $0x8,%esp
    104b:	68 98 18 00 00       	push   $0x1898
    1050:	6a 01                	push   $0x1
    1052:	e8 49 06 00 00       	call   16a0 <printf>
    pid = fork();
    1057:	e8 b5 04 00 00       	call   1511 <fork>
    if(pid < 0){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	85 c0                	test   %eax,%eax
    pid = fork();
    1061:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1063:	78 2c                	js     1091 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    1065:	74 3d                	je     10a4 <main+0xa4>
    1067:	89 f6                	mov    %esi,%esi
    1069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1070:	e8 ac 04 00 00       	call   1521 <wait>
    1075:	85 c0                	test   %eax,%eax
    1077:	78 cf                	js     1048 <main+0x48>
    1079:	39 c3                	cmp    %eax,%ebx
    107b:	74 cb                	je     1048 <main+0x48>
      printf(1, "zombie!\n");
    107d:	83 ec 08             	sub    $0x8,%esp
    1080:	68 d7 18 00 00       	push   $0x18d7
    1085:	6a 01                	push   $0x1
    1087:	e8 14 06 00 00       	call   16a0 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 ab 18 00 00       	push   $0x18ab
    1098:	6a 01                	push   $0x1
    109a:	e8 01 06 00 00       	call   16a0 <printf>
      exit();
    109f:	e8 75 04 00 00       	call   1519 <exit>
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 d0 1b 00 00       	push   $0x1bd0
    10ab:	68 be 18 00 00       	push   $0x18be
    10b0:	e8 9c 04 00 00       	call   1551 <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 c1 18 00 00       	push   $0x18c1
    10bc:	6a 01                	push   $0x1
    10be:	e8 dd 05 00 00       	call   16a0 <printf>
      exit();
    10c3:	e8 51 04 00 00       	call   1519 <exit>
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 90 18 00 00       	push   $0x1890
    10d2:	e8 8a 04 00 00       	call   1561 <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 90 18 00 00       	push   $0x1890
    10e0:	e8 74 04 00 00       	call   1559 <open>
    10e5:	83 c4 10             	add    $0x10,%esp
    10e8:	e9 3c ff ff ff       	jmp    1029 <main+0x29>
    10ed:	66 90                	xchg   %ax,%ax
    10ef:	90                   	nop

000010f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	53                   	push   %ebx
    10f4:	8b 45 08             	mov    0x8(%ebp),%eax
    10f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10fa:	89 c2                	mov    %eax,%edx
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1100:	83 c1 01             	add    $0x1,%ecx
    1103:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1107:	83 c2 01             	add    $0x1,%edx
    110a:	84 db                	test   %bl,%bl
    110c:	88 5a ff             	mov    %bl,-0x1(%edx)
    110f:	75 ef                	jne    1100 <strcpy+0x10>
    ;
  return os;
}
    1111:	5b                   	pop    %ebx
    1112:	5d                   	pop    %ebp
    1113:	c3                   	ret    
    1114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    111a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
    1127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    112a:	0f b6 02             	movzbl (%edx),%eax
    112d:	0f b6 19             	movzbl (%ecx),%ebx
    1130:	84 c0                	test   %al,%al
    1132:	75 1c                	jne    1150 <strcmp+0x30>
    1134:	eb 2a                	jmp    1160 <strcmp+0x40>
    1136:	8d 76 00             	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1140:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1143:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1146:	83 c1 01             	add    $0x1,%ecx
    1149:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    114c:	84 c0                	test   %al,%al
    114e:	74 10                	je     1160 <strcmp+0x40>
    1150:	38 d8                	cmp    %bl,%al
    1152:	74 ec                	je     1140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1154:	29 d8                	sub    %ebx,%eax
}
    1156:	5b                   	pop    %ebx
    1157:	5d                   	pop    %ebp
    1158:	c3                   	ret    
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1162:	29 d8                	sub    %ebx,%eax
}
    1164:	5b                   	pop    %ebx
    1165:	5d                   	pop    %ebp
    1166:	c3                   	ret    
    1167:	89 f6                	mov    %esi,%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <strlen>:

uint
strlen(const char *s)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1176:	80 39 00             	cmpb   $0x0,(%ecx)
    1179:	74 15                	je     1190 <strlen+0x20>
    117b:	31 d2                	xor    %edx,%edx
    117d:	8d 76 00             	lea    0x0(%esi),%esi
    1180:	83 c2 01             	add    $0x1,%edx
    1183:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1187:	89 d0                	mov    %edx,%eax
    1189:	75 f5                	jne    1180 <strlen+0x10>
    ;
  return n;
}
    118b:	5d                   	pop    %ebp
    118c:	c3                   	ret    
    118d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1190:	31 c0                	xor    %eax,%eax
}
    1192:	5d                   	pop    %ebp
    1193:	c3                   	ret    
    1194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    119a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ad:	89 d7                	mov    %edx,%edi
    11af:	fc                   	cld    
    11b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11b2:	89 d0                	mov    %edx,%eax
    11b4:	5f                   	pop    %edi
    11b5:	5d                   	pop    %ebp
    11b6:	c3                   	ret    
    11b7:	89 f6                	mov    %esi,%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <strchr>:

char*
strchr(const char *s, char c)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	53                   	push   %ebx
    11c4:	8b 45 08             	mov    0x8(%ebp),%eax
    11c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11ca:	0f b6 10             	movzbl (%eax),%edx
    11cd:	84 d2                	test   %dl,%dl
    11cf:	74 1d                	je     11ee <strchr+0x2e>
    if(*s == c)
    11d1:	38 d3                	cmp    %dl,%bl
    11d3:	89 d9                	mov    %ebx,%ecx
    11d5:	75 0d                	jne    11e4 <strchr+0x24>
    11d7:	eb 17                	jmp    11f0 <strchr+0x30>
    11d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11e0:	38 ca                	cmp    %cl,%dl
    11e2:	74 0c                	je     11f0 <strchr+0x30>
  for(; *s; s++)
    11e4:	83 c0 01             	add    $0x1,%eax
    11e7:	0f b6 10             	movzbl (%eax),%edx
    11ea:	84 d2                	test   %dl,%dl
    11ec:	75 f2                	jne    11e0 <strchr+0x20>
      return (char*)s;
  return 0;
    11ee:	31 c0                	xor    %eax,%eax
}
    11f0:	5b                   	pop    %ebx
    11f1:	5d                   	pop    %ebp
    11f2:	c3                   	ret    
    11f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <gets>:

char*
gets(char *buf, int max)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	57                   	push   %edi
    1204:	56                   	push   %esi
    1205:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1206:	31 f6                	xor    %esi,%esi
    1208:	89 f3                	mov    %esi,%ebx
{
    120a:	83 ec 1c             	sub    $0x1c,%esp
    120d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1210:	eb 2f                	jmp    1241 <gets+0x41>
    1212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1218:	8d 45 e7             	lea    -0x19(%ebp),%eax
    121b:	83 ec 04             	sub    $0x4,%esp
    121e:	6a 01                	push   $0x1
    1220:	50                   	push   %eax
    1221:	6a 00                	push   $0x0
    1223:	e8 09 03 00 00       	call   1531 <read>
    if(cc < 1)
    1228:	83 c4 10             	add    $0x10,%esp
    122b:	85 c0                	test   %eax,%eax
    122d:	7e 1c                	jle    124b <gets+0x4b>
      break;
    buf[i++] = c;
    122f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1233:	83 c7 01             	add    $0x1,%edi
    1236:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1239:	3c 0a                	cmp    $0xa,%al
    123b:	74 23                	je     1260 <gets+0x60>
    123d:	3c 0d                	cmp    $0xd,%al
    123f:	74 1f                	je     1260 <gets+0x60>
  for(i=0; i+1 < max; ){
    1241:	83 c3 01             	add    $0x1,%ebx
    1244:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1247:	89 fe                	mov    %edi,%esi
    1249:	7c cd                	jl     1218 <gets+0x18>
    124b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    124d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1250:	c6 03 00             	movb   $0x0,(%ebx)
}
    1253:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1256:	5b                   	pop    %ebx
    1257:	5e                   	pop    %esi
    1258:	5f                   	pop    %edi
    1259:	5d                   	pop    %ebp
    125a:	c3                   	ret    
    125b:	90                   	nop
    125c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1260:	8b 75 08             	mov    0x8(%ebp),%esi
    1263:	8b 45 08             	mov    0x8(%ebp),%eax
    1266:	01 de                	add    %ebx,%esi
    1268:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    126a:	c6 03 00             	movb   $0x0,(%ebx)
}
    126d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1270:	5b                   	pop    %ebx
    1271:	5e                   	pop    %esi
    1272:	5f                   	pop    %edi
    1273:	5d                   	pop    %ebp
    1274:	c3                   	ret    
    1275:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001280 <stat>:

int
stat(const char *n, struct stat *st)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1285:	83 ec 08             	sub    $0x8,%esp
    1288:	6a 00                	push   $0x0
    128a:	ff 75 08             	pushl  0x8(%ebp)
    128d:	e8 c7 02 00 00       	call   1559 <open>
  if(fd < 0)
    1292:	83 c4 10             	add    $0x10,%esp
    1295:	85 c0                	test   %eax,%eax
    1297:	78 27                	js     12c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1299:	83 ec 08             	sub    $0x8,%esp
    129c:	ff 75 0c             	pushl  0xc(%ebp)
    129f:	89 c3                	mov    %eax,%ebx
    12a1:	50                   	push   %eax
    12a2:	e8 ca 02 00 00       	call   1571 <fstat>
  close(fd);
    12a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12aa:	89 c6                	mov    %eax,%esi
  close(fd);
    12ac:	e8 90 02 00 00       	call   1541 <close>
  return r;
    12b1:	83 c4 10             	add    $0x10,%esp
}
    12b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12b7:	89 f0                	mov    %esi,%eax
    12b9:	5b                   	pop    %ebx
    12ba:	5e                   	pop    %esi
    12bb:	5d                   	pop    %ebp
    12bc:	c3                   	ret    
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12c5:	eb ed                	jmp    12b4 <stat+0x34>
    12c7:	89 f6                	mov    %esi,%esi
    12c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012d0 <atoi>:

int
atoi(const char *s)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	53                   	push   %ebx
    12d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12d7:	0f be 11             	movsbl (%ecx),%edx
    12da:	8d 42 d0             	lea    -0x30(%edx),%eax
    12dd:	3c 09                	cmp    $0x9,%al
  n = 0;
    12df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    12e4:	77 1f                	ja     1305 <atoi+0x35>
    12e6:	8d 76 00             	lea    0x0(%esi),%esi
    12e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    12f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12f3:	83 c1 01             	add    $0x1,%ecx
    12f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    12fa:	0f be 11             	movsbl (%ecx),%edx
    12fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1300:	80 fb 09             	cmp    $0x9,%bl
    1303:	76 eb                	jbe    12f0 <atoi+0x20>
  return n;
}
    1305:	5b                   	pop    %ebx
    1306:	5d                   	pop    %ebp
    1307:	c3                   	ret    
    1308:	90                   	nop
    1309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	56                   	push   %esi
    1314:	53                   	push   %ebx
    1315:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1318:	8b 45 08             	mov    0x8(%ebp),%eax
    131b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    131e:	85 db                	test   %ebx,%ebx
    1320:	7e 14                	jle    1336 <memmove+0x26>
    1322:	31 d2                	xor    %edx,%edx
    1324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    132c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    132f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1332:	39 d3                	cmp    %edx,%ebx
    1334:	75 f2                	jne    1328 <memmove+0x18>
  return vdst;
}
    1336:	5b                   	pop    %ebx
    1337:	5e                   	pop    %esi
    1338:	5d                   	pop    %ebp
    1339:	c3                   	ret    
    133a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001340 <thread_join>:
  
  return clone(start_routine, arg, stack);
}

int thread_join()
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    1346:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1349:	50                   	push   %eax
    134a:	e8 a2 02 00 00       	call   15f1 <join>
  return x;
}
    134f:	c9                   	leave  
    1350:	c3                   	ret    
    1351:	eb 0d                	jmp    1360 <free>
    1353:	90                   	nop
    1354:	90                   	nop
    1355:	90                   	nop
    1356:	90                   	nop
    1357:	90                   	nop
    1358:	90                   	nop
    1359:	90                   	nop
    135a:	90                   	nop
    135b:	90                   	nop
    135c:	90                   	nop
    135d:	90                   	nop
    135e:	90                   	nop
    135f:	90                   	nop

00001360 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1360:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1361:	a1 d8 1b 00 00       	mov    0x1bd8,%eax
{
    1366:	89 e5                	mov    %esp,%ebp
    1368:	57                   	push   %edi
    1369:	56                   	push   %esi
    136a:	53                   	push   %ebx
    136b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    136e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1378:	39 c8                	cmp    %ecx,%eax
    137a:	8b 10                	mov    (%eax),%edx
    137c:	73 32                	jae    13b0 <free+0x50>
    137e:	39 d1                	cmp    %edx,%ecx
    1380:	72 04                	jb     1386 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1382:	39 d0                	cmp    %edx,%eax
    1384:	72 32                	jb     13b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1386:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1389:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    138c:	39 fa                	cmp    %edi,%edx
    138e:	74 30                	je     13c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1390:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1393:	8b 50 04             	mov    0x4(%eax),%edx
    1396:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1399:	39 f1                	cmp    %esi,%ecx
    139b:	74 3a                	je     13d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    139d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    139f:	a3 d8 1b 00 00       	mov    %eax,0x1bd8
}
    13a4:	5b                   	pop    %ebx
    13a5:	5e                   	pop    %esi
    13a6:	5f                   	pop    %edi
    13a7:	5d                   	pop    %ebp
    13a8:	c3                   	ret    
    13a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13b0:	39 d0                	cmp    %edx,%eax
    13b2:	72 04                	jb     13b8 <free+0x58>
    13b4:	39 d1                	cmp    %edx,%ecx
    13b6:	72 ce                	jb     1386 <free+0x26>
{
    13b8:	89 d0                	mov    %edx,%eax
    13ba:	eb bc                	jmp    1378 <free+0x18>
    13bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    13c0:	03 72 04             	add    0x4(%edx),%esi
    13c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    13c6:	8b 10                	mov    (%eax),%edx
    13c8:	8b 12                	mov    (%edx),%edx
    13ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13cd:	8b 50 04             	mov    0x4(%eax),%edx
    13d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13d3:	39 f1                	cmp    %esi,%ecx
    13d5:	75 c6                	jne    139d <free+0x3d>
    p->s.size += bp->s.size;
    13d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    13da:	a3 d8 1b 00 00       	mov    %eax,0x1bd8
    p->s.size += bp->s.size;
    13df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    13e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    13e5:	89 10                	mov    %edx,(%eax)
}
    13e7:	5b                   	pop    %ebx
    13e8:	5e                   	pop    %esi
    13e9:	5f                   	pop    %edi
    13ea:	5d                   	pop    %ebp
    13eb:	c3                   	ret    
    13ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	53                   	push   %ebx
    13f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    13fc:	8b 15 d8 1b 00 00    	mov    0x1bd8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1402:	8d 78 07             	lea    0x7(%eax),%edi
    1405:	c1 ef 03             	shr    $0x3,%edi
    1408:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    140b:	85 d2                	test   %edx,%edx
    140d:	0f 84 9d 00 00 00    	je     14b0 <malloc+0xc0>
    1413:	8b 02                	mov    (%edx),%eax
    1415:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1418:	39 cf                	cmp    %ecx,%edi
    141a:	76 6c                	jbe    1488 <malloc+0x98>
    141c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1422:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1427:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    142a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1431:	eb 0e                	jmp    1441 <malloc+0x51>
    1433:	90                   	nop
    1434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1438:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    143a:	8b 48 04             	mov    0x4(%eax),%ecx
    143d:	39 f9                	cmp    %edi,%ecx
    143f:	73 47                	jae    1488 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1441:	39 05 d8 1b 00 00    	cmp    %eax,0x1bd8
    1447:	89 c2                	mov    %eax,%edx
    1449:	75 ed                	jne    1438 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    144b:	83 ec 0c             	sub    $0xc,%esp
    144e:	56                   	push   %esi
    144f:	e8 4d 01 00 00       	call   15a1 <sbrk>
  if(p == (char*)-1)
    1454:	83 c4 10             	add    $0x10,%esp
    1457:	83 f8 ff             	cmp    $0xffffffff,%eax
    145a:	74 1c                	je     1478 <malloc+0x88>
  hp->s.size = nu;
    145c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    145f:	83 ec 0c             	sub    $0xc,%esp
    1462:	83 c0 08             	add    $0x8,%eax
    1465:	50                   	push   %eax
    1466:	e8 f5 fe ff ff       	call   1360 <free>
  return freep;
    146b:	8b 15 d8 1b 00 00    	mov    0x1bd8,%edx
      if((p = morecore(nunits)) == 0)
    1471:	83 c4 10             	add    $0x10,%esp
    1474:	85 d2                	test   %edx,%edx
    1476:	75 c0                	jne    1438 <malloc+0x48>
        return 0;
  }
    1478:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    147b:	31 c0                	xor    %eax,%eax
    147d:	5b                   	pop    %ebx
    147e:	5e                   	pop    %esi
    147f:	5f                   	pop    %edi
    1480:	5d                   	pop    %ebp
    1481:	c3                   	ret    
    1482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1488:	39 cf                	cmp    %ecx,%edi
    148a:	74 54                	je     14e0 <malloc+0xf0>
        p->s.size -= nunits;
    148c:	29 f9                	sub    %edi,%ecx
    148e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1491:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1494:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1497:	89 15 d8 1b 00 00    	mov    %edx,0x1bd8
    149d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    14a0:	83 c0 08             	add    $0x8,%eax
    14a3:	5b                   	pop    %ebx
    14a4:	5e                   	pop    %esi
    14a5:	5f                   	pop    %edi
    14a6:	5d                   	pop    %ebp
    14a7:	c3                   	ret    
    14a8:	90                   	nop
    14a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    14b0:	c7 05 d8 1b 00 00 dc 	movl   $0x1bdc,0x1bd8
    14b7:	1b 00 00 
    14ba:	c7 05 dc 1b 00 00 dc 	movl   $0x1bdc,0x1bdc
    14c1:	1b 00 00 
    base.s.size = 0;
    14c4:	b8 dc 1b 00 00       	mov    $0x1bdc,%eax
    14c9:	c7 05 e0 1b 00 00 00 	movl   $0x0,0x1be0
    14d0:	00 00 00 
    14d3:	e9 44 ff ff ff       	jmp    141c <malloc+0x2c>
    14d8:	90                   	nop
    14d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    14e0:	8b 08                	mov    (%eax),%ecx
    14e2:	89 0a                	mov    %ecx,(%edx)
    14e4:	eb b1                	jmp    1497 <malloc+0xa7>
    14e6:	8d 76 00             	lea    0x0(%esi),%esi
    14e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000014f0 <thread_create>:
{
    14f0:	55                   	push   %ebp
    14f1:	89 e5                	mov    %esp,%ebp
    14f3:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(4096);
    14f6:	68 00 10 00 00       	push   $0x1000
    14fb:	e8 f0 fe ff ff       	call   13f0 <malloc>
  return clone(start_routine, arg, stack);
    1500:	83 c4 0c             	add    $0xc,%esp
    1503:	50                   	push   %eax
    1504:	ff 75 0c             	pushl  0xc(%ebp)
    1507:	ff 75 08             	pushl  0x8(%ebp)
    150a:	e8 da 00 00 00       	call   15e9 <clone>
}
    150f:	c9                   	leave  
    1510:	c3                   	ret    

00001511 <fork>:
    1511:	b8 01 00 00 00       	mov    $0x1,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <exit>:
    1519:	b8 02 00 00 00       	mov    $0x2,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <wait>:
    1521:	b8 03 00 00 00       	mov    $0x3,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <pipe>:
    1529:	b8 04 00 00 00       	mov    $0x4,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <read>:
    1531:	b8 05 00 00 00       	mov    $0x5,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <write>:
    1539:	b8 10 00 00 00       	mov    $0x10,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <close>:
    1541:	b8 15 00 00 00       	mov    $0x15,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <kill>:
    1549:	b8 06 00 00 00       	mov    $0x6,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    

00001551 <exec>:
    1551:	b8 07 00 00 00       	mov    $0x7,%eax
    1556:	cd 40                	int    $0x40
    1558:	c3                   	ret    

00001559 <open>:
    1559:	b8 0f 00 00 00       	mov    $0xf,%eax
    155e:	cd 40                	int    $0x40
    1560:	c3                   	ret    

00001561 <mknod>:
    1561:	b8 11 00 00 00       	mov    $0x11,%eax
    1566:	cd 40                	int    $0x40
    1568:	c3                   	ret    

00001569 <unlink>:
    1569:	b8 12 00 00 00       	mov    $0x12,%eax
    156e:	cd 40                	int    $0x40
    1570:	c3                   	ret    

00001571 <fstat>:
    1571:	b8 08 00 00 00       	mov    $0x8,%eax
    1576:	cd 40                	int    $0x40
    1578:	c3                   	ret    

00001579 <link>:
    1579:	b8 13 00 00 00       	mov    $0x13,%eax
    157e:	cd 40                	int    $0x40
    1580:	c3                   	ret    

00001581 <mkdir>:
    1581:	b8 14 00 00 00       	mov    $0x14,%eax
    1586:	cd 40                	int    $0x40
    1588:	c3                   	ret    

00001589 <chdir>:
    1589:	b8 09 00 00 00       	mov    $0x9,%eax
    158e:	cd 40                	int    $0x40
    1590:	c3                   	ret    

00001591 <dup>:
    1591:	b8 0a 00 00 00       	mov    $0xa,%eax
    1596:	cd 40                	int    $0x40
    1598:	c3                   	ret    

00001599 <getpid>:
    1599:	b8 0b 00 00 00       	mov    $0xb,%eax
    159e:	cd 40                	int    $0x40
    15a0:	c3                   	ret    

000015a1 <sbrk>:
    15a1:	b8 0c 00 00 00       	mov    $0xc,%eax
    15a6:	cd 40                	int    $0x40
    15a8:	c3                   	ret    

000015a9 <sleep>:
    15a9:	b8 0d 00 00 00       	mov    $0xd,%eax
    15ae:	cd 40                	int    $0x40
    15b0:	c3                   	ret    

000015b1 <uptime>:
    15b1:	b8 0e 00 00 00       	mov    $0xe,%eax
    15b6:	cd 40                	int    $0x40
    15b8:	c3                   	ret    

000015b9 <getreadcount>:
    15b9:	b8 16 00 00 00       	mov    $0x16,%eax
    15be:	cd 40                	int    $0x40
    15c0:	c3                   	ret    

000015c1 <gettime>:
    15c1:	b8 17 00 00 00       	mov    $0x17,%eax
    15c6:	cd 40                	int    $0x40
    15c8:	c3                   	ret    

000015c9 <settickets>:
    15c9:	b8 18 00 00 00       	mov    $0x18,%eax
    15ce:	cd 40                	int    $0x40
    15d0:	c3                   	ret    

000015d1 <getpinfo>:
    15d1:	b8 19 00 00 00       	mov    $0x19,%eax
    15d6:	cd 40                	int    $0x40
    15d8:	c3                   	ret    

000015d9 <mprotect>:
    15d9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    15de:	cd 40                	int    $0x40
    15e0:	c3                   	ret    

000015e1 <munprotect>:
    15e1:	b8 1b 00 00 00       	mov    $0x1b,%eax
    15e6:	cd 40                	int    $0x40
    15e8:	c3                   	ret    

000015e9 <clone>:
    15e9:	b8 1c 00 00 00       	mov    $0x1c,%eax
    15ee:	cd 40                	int    $0x40
    15f0:	c3                   	ret    

000015f1 <join>:
    15f1:	b8 1d 00 00 00       	mov    $0x1d,%eax
    15f6:	cd 40                	int    $0x40
    15f8:	c3                   	ret    
    15f9:	66 90                	xchg   %ax,%ax
    15fb:	66 90                	xchg   %ax,%ax
    15fd:	66 90                	xchg   %ax,%ax
    15ff:	90                   	nop

00001600 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1600:	55                   	push   %ebp
    1601:	89 e5                	mov    %esp,%ebp
    1603:	57                   	push   %edi
    1604:	56                   	push   %esi
    1605:	53                   	push   %ebx
    1606:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1609:	85 d2                	test   %edx,%edx
{
    160b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    160e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1610:	79 76                	jns    1688 <printint+0x88>
    1612:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1616:	74 70                	je     1688 <printint+0x88>
    x = -xx;
    1618:	f7 d8                	neg    %eax
    neg = 1;
    161a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1621:	31 f6                	xor    %esi,%esi
    1623:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1626:	eb 0a                	jmp    1632 <printint+0x32>
    1628:	90                   	nop
    1629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1630:	89 fe                	mov    %edi,%esi
    1632:	31 d2                	xor    %edx,%edx
    1634:	8d 7e 01             	lea    0x1(%esi),%edi
    1637:	f7 f1                	div    %ecx
    1639:	0f b6 92 e8 18 00 00 	movzbl 0x18e8(%edx),%edx
  }while((x /= base) != 0);
    1640:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1642:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1645:	75 e9                	jne    1630 <printint+0x30>
  if(neg)
    1647:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    164a:	85 c0                	test   %eax,%eax
    164c:	74 08                	je     1656 <printint+0x56>
    buf[i++] = '-';
    164e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1653:	8d 7e 02             	lea    0x2(%esi),%edi
    1656:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    165a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    165d:	8d 76 00             	lea    0x0(%esi),%esi
    1660:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1663:	83 ec 04             	sub    $0x4,%esp
    1666:	83 ee 01             	sub    $0x1,%esi
    1669:	6a 01                	push   $0x1
    166b:	53                   	push   %ebx
    166c:	57                   	push   %edi
    166d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1670:	e8 c4 fe ff ff       	call   1539 <write>

  while(--i >= 0)
    1675:	83 c4 10             	add    $0x10,%esp
    1678:	39 de                	cmp    %ebx,%esi
    167a:	75 e4                	jne    1660 <printint+0x60>
    putc(fd, buf[i]);
}
    167c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    167f:	5b                   	pop    %ebx
    1680:	5e                   	pop    %esi
    1681:	5f                   	pop    %edi
    1682:	5d                   	pop    %ebp
    1683:	c3                   	ret    
    1684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1688:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    168f:	eb 90                	jmp    1621 <printint+0x21>
    1691:	eb 0d                	jmp    16a0 <printf>
    1693:	90                   	nop
    1694:	90                   	nop
    1695:	90                   	nop
    1696:	90                   	nop
    1697:	90                   	nop
    1698:	90                   	nop
    1699:	90                   	nop
    169a:	90                   	nop
    169b:	90                   	nop
    169c:	90                   	nop
    169d:	90                   	nop
    169e:	90                   	nop
    169f:	90                   	nop

000016a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    16a0:	55                   	push   %ebp
    16a1:	89 e5                	mov    %esp,%ebp
    16a3:	57                   	push   %edi
    16a4:	56                   	push   %esi
    16a5:	53                   	push   %ebx
    16a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16a9:	8b 75 0c             	mov    0xc(%ebp),%esi
    16ac:	0f b6 1e             	movzbl (%esi),%ebx
    16af:	84 db                	test   %bl,%bl
    16b1:	0f 84 bf 00 00 00    	je     1776 <printf+0xd6>
    16b7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    16ba:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    16bd:	31 d2                	xor    %edx,%edx
    16bf:	eb 39                	jmp    16fa <printf+0x5a>
    16c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    16c8:	83 f8 25             	cmp    $0x25,%eax
    16cb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    16ce:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    16d3:	74 1a                	je     16ef <printf+0x4f>
  write(fd, &c, 1);
    16d5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    16d8:	83 ec 04             	sub    $0x4,%esp
    16db:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    16de:	6a 01                	push   $0x1
    16e0:	50                   	push   %eax
    16e1:	ff 75 08             	pushl  0x8(%ebp)
    16e4:	e8 50 fe ff ff       	call   1539 <write>
    16e9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    16ec:	83 c4 10             	add    $0x10,%esp
    16ef:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    16f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    16f6:	84 db                	test   %bl,%bl
    16f8:	74 7c                	je     1776 <printf+0xd6>
    if(state == 0){
    16fa:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    16fc:	0f be cb             	movsbl %bl,%ecx
    16ff:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1702:	74 c4                	je     16c8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1704:	83 fa 25             	cmp    $0x25,%edx
    1707:	75 e6                	jne    16ef <printf+0x4f>
      if(c == 'd'){
    1709:	83 f8 64             	cmp    $0x64,%eax
    170c:	0f 84 a6 00 00 00    	je     17b8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1712:	83 f8 6c             	cmp    $0x6c,%eax
    1715:	0f 84 ad 00 00 00    	je     17c8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    171b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1721:	83 f9 70             	cmp    $0x70,%ecx
    1724:	74 5a                	je     1780 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1726:	83 f8 73             	cmp    $0x73,%eax
    1729:	0f 84 e1 00 00 00    	je     1810 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    172f:	83 f8 63             	cmp    $0x63,%eax
    1732:	0f 84 28 01 00 00    	je     1860 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1738:	83 f8 25             	cmp    $0x25,%eax
    173b:	74 6b                	je     17a8 <printf+0x108>
  write(fd, &c, 1);
    173d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1740:	83 ec 04             	sub    $0x4,%esp
    1743:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1747:	6a 01                	push   $0x1
    1749:	50                   	push   %eax
    174a:	ff 75 08             	pushl  0x8(%ebp)
    174d:	e8 e7 fd ff ff       	call   1539 <write>
    1752:	83 c4 0c             	add    $0xc,%esp
    1755:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1758:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    175b:	6a 01                	push   $0x1
    175d:	50                   	push   %eax
    175e:	ff 75 08             	pushl  0x8(%ebp)
    1761:	83 c6 01             	add    $0x1,%esi
    1764:	e8 d0 fd ff ff       	call   1539 <write>
  for(i = 0; fmt[i]; i++){
    1769:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    176d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1770:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1772:	84 db                	test   %bl,%bl
    1774:	75 84                	jne    16fa <printf+0x5a>
    }
  }
}
    1776:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1779:	5b                   	pop    %ebx
    177a:	5e                   	pop    %esi
    177b:	5f                   	pop    %edi
    177c:	5d                   	pop    %ebp
    177d:	c3                   	ret    
    177e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1780:	83 ec 0c             	sub    $0xc,%esp
    1783:	b9 10 00 00 00       	mov    $0x10,%ecx
    1788:	6a 00                	push   $0x0
    178a:	8b 17                	mov    (%edi),%edx
    178c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    178f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1792:	e8 69 fe ff ff       	call   1600 <printint>
    1797:	83 c4 10             	add    $0x10,%esp
      state = 0;
    179a:	31 d2                	xor    %edx,%edx
    179c:	e9 4e ff ff ff       	jmp    16ef <printf+0x4f>
    17a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    17a8:	83 ec 04             	sub    $0x4,%esp
    17ab:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    17ae:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    17b1:	6a 01                	push   $0x1
    17b3:	eb a8                	jmp    175d <printf+0xbd>
    17b5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    17b8:	83 ec 0c             	sub    $0xc,%esp
    17bb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    17c0:	6a 01                	push   $0x1
    17c2:	eb c6                	jmp    178a <printf+0xea>
    17c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    17c8:	8b 57 04             	mov    0x4(%edi),%edx
    17cb:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    17cd:	85 d2                	test   %edx,%edx
    17cf:	74 15                	je     17e6 <printf+0x146>
    17d1:	83 ec 0c             	sub    $0xc,%esp
    17d4:	8b 45 08             	mov    0x8(%ebp),%eax
    17d7:	b9 10 00 00 00       	mov    $0x10,%ecx
    17dc:	6a 00                	push   $0x0
    17de:	e8 1d fe ff ff       	call   1600 <printint>
    17e3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    17e6:	83 ec 0c             	sub    $0xc,%esp
    17e9:	8b 45 08             	mov    0x8(%ebp),%eax
    17ec:	89 da                	mov    %ebx,%edx
    17ee:	6a 00                	push   $0x0
    17f0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    17f5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    17f8:	e8 03 fe ff ff       	call   1600 <printint>
    17fd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1800:	31 d2                	xor    %edx,%edx
    1802:	e9 e8 fe ff ff       	jmp    16ef <printf+0x4f>
    1807:	89 f6                	mov    %esi,%esi
    1809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1810:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1812:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1815:	85 c9                	test   %ecx,%ecx
    1817:	74 6a                	je     1883 <printf+0x1e3>
        while(*s != 0){
    1819:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    181c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    181e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1820:	84 c0                	test   %al,%al
    1822:	0f 84 c7 fe ff ff    	je     16ef <printf+0x4f>
    1828:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    182b:	89 de                	mov    %ebx,%esi
    182d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1830:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1833:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1836:	83 ec 04             	sub    $0x4,%esp
    1839:	6a 01                	push   $0x1
          s++;
    183b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    183e:	50                   	push   %eax
    183f:	53                   	push   %ebx
    1840:	e8 f4 fc ff ff       	call   1539 <write>
        while(*s != 0){
    1845:	0f b6 06             	movzbl (%esi),%eax
    1848:	83 c4 10             	add    $0x10,%esp
    184b:	84 c0                	test   %al,%al
    184d:	75 e1                	jne    1830 <printf+0x190>
    184f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1852:	31 d2                	xor    %edx,%edx
    1854:	e9 96 fe ff ff       	jmp    16ef <printf+0x4f>
    1859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1860:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1862:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1865:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1868:	6a 01                	push   $0x1
        putc(fd, *ap);
    186a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    186d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1870:	50                   	push   %eax
    1871:	ff 75 08             	pushl  0x8(%ebp)
    1874:	e8 c0 fc ff ff       	call   1539 <write>
    1879:	83 c4 10             	add    $0x10,%esp
      state = 0;
    187c:	31 d2                	xor    %edx,%edx
    187e:	e9 6c fe ff ff       	jmp    16ef <printf+0x4f>
          s = "(null)";
    1883:	bb e0 18 00 00       	mov    $0x18e0,%ebx
        while(*s != 0){
    1888:	b8 28 00 00 00       	mov    $0x28,%eax
    188d:	eb 99                	jmp    1828 <printf+0x188>
