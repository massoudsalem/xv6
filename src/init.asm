
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
    1014:	68 38 18 00 00       	push   $0x1838
    1019:	e8 64 03 00 00       	call   1382 <open>
    101e:	83 c4 10             	add    $0x10,%esp
    1021:	85 c0                	test   %eax,%eax
    1023:	0f 88 9f 00 00 00    	js     10c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1029:	83 ec 0c             	sub    $0xc,%esp
    102c:	6a 00                	push   $0x0
    102e:	e8 87 03 00 00       	call   13ba <dup>
  dup(0);  // stderr
    1033:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    103a:	e8 7b 03 00 00       	call   13ba <dup>
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    1048:	83 ec 08             	sub    $0x8,%esp
    104b:	68 40 18 00 00       	push   $0x1840
    1050:	6a 01                	push   $0x1
    1052:	e8 69 04 00 00       	call   14c0 <printf>
    pid = fork();
    1057:	e8 de 02 00 00       	call   133a <fork>
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
    1070:	e8 d5 02 00 00       	call   134a <wait>
    1075:	85 c0                	test   %eax,%eax
    1077:	78 cf                	js     1048 <main+0x48>
    1079:	39 c3                	cmp    %eax,%ebx
    107b:	74 cb                	je     1048 <main+0x48>
      printf(1, "zombie!\n");
    107d:	83 ec 08             	sub    $0x8,%esp
    1080:	68 7f 18 00 00       	push   $0x187f
    1085:	6a 01                	push   $0x1
    1087:	e8 34 04 00 00       	call   14c0 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 53 18 00 00       	push   $0x1853
    1098:	6a 01                	push   $0x1
    109a:	e8 21 04 00 00       	call   14c0 <printf>
      exit();
    109f:	e8 9e 02 00 00       	call   1342 <exit>
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 38 1b 00 00       	push   $0x1b38
    10ab:	68 66 18 00 00       	push   $0x1866
    10b0:	e8 c5 02 00 00       	call   137a <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 69 18 00 00       	push   $0x1869
    10bc:	6a 01                	push   $0x1
    10be:	e8 fd 03 00 00       	call   14c0 <printf>
      exit();
    10c3:	e8 7a 02 00 00       	call   1342 <exit>
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 38 18 00 00       	push   $0x1838
    10d2:	e8 b3 02 00 00       	call   138a <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 38 18 00 00       	push   $0x1838
    10e0:	e8 9d 02 00 00       	call   1382 <open>
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
    1223:	e8 32 01 00 00       	call   135a <read>
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
    128d:	e8 f0 00 00 00       	call   1382 <open>
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
    12a2:	e8 f3 00 00 00       	call   139a <fstat>
  close(fd);
    12a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12aa:	89 c6                	mov    %eax,%esi
  close(fd);
    12ac:	e8 b9 00 00 00       	call   136a <close>
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

0000133a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    133a:	b8 01 00 00 00       	mov    $0x1,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <exit>:
SYSCALL(exit)
    1342:	b8 02 00 00 00       	mov    $0x2,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <wait>:
SYSCALL(wait)
    134a:	b8 03 00 00 00       	mov    $0x3,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <pipe>:
SYSCALL(pipe)
    1352:	b8 04 00 00 00       	mov    $0x4,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <read>:
SYSCALL(read)
    135a:	b8 05 00 00 00       	mov    $0x5,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <write>:
SYSCALL(write)
    1362:	b8 10 00 00 00       	mov    $0x10,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <close>:
SYSCALL(close)
    136a:	b8 15 00 00 00       	mov    $0x15,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <kill>:
SYSCALL(kill)
    1372:	b8 06 00 00 00       	mov    $0x6,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <exec>:
SYSCALL(exec)
    137a:	b8 07 00 00 00       	mov    $0x7,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <open>:
SYSCALL(open)
    1382:	b8 0f 00 00 00       	mov    $0xf,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <mknod>:
SYSCALL(mknod)
    138a:	b8 11 00 00 00       	mov    $0x11,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <unlink>:
SYSCALL(unlink)
    1392:	b8 12 00 00 00       	mov    $0x12,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <fstat>:
SYSCALL(fstat)
    139a:	b8 08 00 00 00       	mov    $0x8,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <link>:
SYSCALL(link)
    13a2:	b8 13 00 00 00       	mov    $0x13,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <mkdir>:
SYSCALL(mkdir)
    13aa:	b8 14 00 00 00       	mov    $0x14,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <chdir>:
SYSCALL(chdir)
    13b2:	b8 09 00 00 00       	mov    $0x9,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <dup>:
SYSCALL(dup)
    13ba:	b8 0a 00 00 00       	mov    $0xa,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <getpid>:
SYSCALL(getpid)
    13c2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <sbrk>:
SYSCALL(sbrk)
    13ca:	b8 0c 00 00 00       	mov    $0xc,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <sleep>:
SYSCALL(sleep)
    13d2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <uptime>:
SYSCALL(uptime)
    13da:	b8 0e 00 00 00       	mov    $0xe,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <getreadcount>:
SYSCALL(getreadcount)
    13e2:	b8 16 00 00 00       	mov    $0x16,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <gettime>:
SYSCALL(gettime)
    13ea:	b8 17 00 00 00       	mov    $0x17,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <settickets>:
SYSCALL(settickets)
    13f2:	b8 18 00 00 00       	mov    $0x18,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <getpinfo>:
SYSCALL(getpinfo)
    13fa:	b8 19 00 00 00       	mov    $0x19,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <mprotect>:
SYSCALL(mprotect)
    1402:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <munprotect>:
    140a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    
    1412:	66 90                	xchg   %ax,%ax
    1414:	66 90                	xchg   %ax,%ax
    1416:	66 90                	xchg   %ax,%ax
    1418:	66 90                	xchg   %ax,%ax
    141a:	66 90                	xchg   %ax,%ax
    141c:	66 90                	xchg   %ax,%ax
    141e:	66 90                	xchg   %ax,%ax

00001420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1429:	85 d2                	test   %edx,%edx
{
    142b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    142e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1430:	79 76                	jns    14a8 <printint+0x88>
    1432:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1436:	74 70                	je     14a8 <printint+0x88>
    x = -xx;
    1438:	f7 d8                	neg    %eax
    neg = 1;
    143a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1441:	31 f6                	xor    %esi,%esi
    1443:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1446:	eb 0a                	jmp    1452 <printint+0x32>
    1448:	90                   	nop
    1449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1450:	89 fe                	mov    %edi,%esi
    1452:	31 d2                	xor    %edx,%edx
    1454:	8d 7e 01             	lea    0x1(%esi),%edi
    1457:	f7 f1                	div    %ecx
    1459:	0f b6 92 90 18 00 00 	movzbl 0x1890(%edx),%edx
  }while((x /= base) != 0);
    1460:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1462:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1465:	75 e9                	jne    1450 <printint+0x30>
  if(neg)
    1467:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    146a:	85 c0                	test   %eax,%eax
    146c:	74 08                	je     1476 <printint+0x56>
    buf[i++] = '-';
    146e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1473:	8d 7e 02             	lea    0x2(%esi),%edi
    1476:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    147a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    147d:	8d 76 00             	lea    0x0(%esi),%esi
    1480:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1483:	83 ec 04             	sub    $0x4,%esp
    1486:	83 ee 01             	sub    $0x1,%esi
    1489:	6a 01                	push   $0x1
    148b:	53                   	push   %ebx
    148c:	57                   	push   %edi
    148d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1490:	e8 cd fe ff ff       	call   1362 <write>

  while(--i >= 0)
    1495:	83 c4 10             	add    $0x10,%esp
    1498:	39 de                	cmp    %ebx,%esi
    149a:	75 e4                	jne    1480 <printint+0x60>
    putc(fd, buf[i]);
}
    149c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    149f:	5b                   	pop    %ebx
    14a0:	5e                   	pop    %esi
    14a1:	5f                   	pop    %edi
    14a2:	5d                   	pop    %ebp
    14a3:	c3                   	ret    
    14a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14a8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    14af:	eb 90                	jmp    1441 <printint+0x21>
    14b1:	eb 0d                	jmp    14c0 <printf>
    14b3:	90                   	nop
    14b4:	90                   	nop
    14b5:	90                   	nop
    14b6:	90                   	nop
    14b7:	90                   	nop
    14b8:	90                   	nop
    14b9:	90                   	nop
    14ba:	90                   	nop
    14bb:	90                   	nop
    14bc:	90                   	nop
    14bd:	90                   	nop
    14be:	90                   	nop
    14bf:	90                   	nop

000014c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
    14c3:	57                   	push   %edi
    14c4:	56                   	push   %esi
    14c5:	53                   	push   %ebx
    14c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14c9:	8b 75 0c             	mov    0xc(%ebp),%esi
    14cc:	0f b6 1e             	movzbl (%esi),%ebx
    14cf:	84 db                	test   %bl,%bl
    14d1:	0f 84 bf 00 00 00    	je     1596 <printf+0xd6>
    14d7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    14da:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    14dd:	31 d2                	xor    %edx,%edx
    14df:	eb 39                	jmp    151a <printf+0x5a>
    14e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14e8:	83 f8 25             	cmp    $0x25,%eax
    14eb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    14ee:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    14f3:	74 1a                	je     150f <printf+0x4f>
  write(fd, &c, 1);
    14f5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14f8:	83 ec 04             	sub    $0x4,%esp
    14fb:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    14fe:	6a 01                	push   $0x1
    1500:	50                   	push   %eax
    1501:	ff 75 08             	pushl  0x8(%ebp)
    1504:	e8 59 fe ff ff       	call   1362 <write>
    1509:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    150c:	83 c4 10             	add    $0x10,%esp
    150f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1512:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1516:	84 db                	test   %bl,%bl
    1518:	74 7c                	je     1596 <printf+0xd6>
    if(state == 0){
    151a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    151c:	0f be cb             	movsbl %bl,%ecx
    151f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1522:	74 c4                	je     14e8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1524:	83 fa 25             	cmp    $0x25,%edx
    1527:	75 e6                	jne    150f <printf+0x4f>
      if(c == 'd'){
    1529:	83 f8 64             	cmp    $0x64,%eax
    152c:	0f 84 a6 00 00 00    	je     15d8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1532:	83 f8 6c             	cmp    $0x6c,%eax
    1535:	0f 84 ad 00 00 00    	je     15e8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    153b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1541:	83 f9 70             	cmp    $0x70,%ecx
    1544:	74 5a                	je     15a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1546:	83 f8 73             	cmp    $0x73,%eax
    1549:	0f 84 e1 00 00 00    	je     1630 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    154f:	83 f8 63             	cmp    $0x63,%eax
    1552:	0f 84 28 01 00 00    	je     1680 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1558:	83 f8 25             	cmp    $0x25,%eax
    155b:	74 6b                	je     15c8 <printf+0x108>
  write(fd, &c, 1);
    155d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1560:	83 ec 04             	sub    $0x4,%esp
    1563:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1567:	6a 01                	push   $0x1
    1569:	50                   	push   %eax
    156a:	ff 75 08             	pushl  0x8(%ebp)
    156d:	e8 f0 fd ff ff       	call   1362 <write>
    1572:	83 c4 0c             	add    $0xc,%esp
    1575:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1578:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    157b:	6a 01                	push   $0x1
    157d:	50                   	push   %eax
    157e:	ff 75 08             	pushl  0x8(%ebp)
    1581:	83 c6 01             	add    $0x1,%esi
    1584:	e8 d9 fd ff ff       	call   1362 <write>
  for(i = 0; fmt[i]; i++){
    1589:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    158d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1590:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1592:	84 db                	test   %bl,%bl
    1594:	75 84                	jne    151a <printf+0x5a>
    }
  }
}
    1596:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1599:	5b                   	pop    %ebx
    159a:	5e                   	pop    %esi
    159b:	5f                   	pop    %edi
    159c:	5d                   	pop    %ebp
    159d:	c3                   	ret    
    159e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    15a0:	83 ec 0c             	sub    $0xc,%esp
    15a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15a8:	6a 00                	push   $0x0
    15aa:	8b 17                	mov    (%edi),%edx
    15ac:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    15af:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    15b2:	e8 69 fe ff ff       	call   1420 <printint>
    15b7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15ba:	31 d2                	xor    %edx,%edx
    15bc:	e9 4e ff ff ff       	jmp    150f <printf+0x4f>
    15c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    15c8:	83 ec 04             	sub    $0x4,%esp
    15cb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    15ce:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    15d1:	6a 01                	push   $0x1
    15d3:	eb a8                	jmp    157d <printf+0xbd>
    15d5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15d8:	83 ec 0c             	sub    $0xc,%esp
    15db:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15e0:	6a 01                	push   $0x1
    15e2:	eb c6                	jmp    15aa <printf+0xea>
    15e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    15e8:	8b 57 04             	mov    0x4(%edi),%edx
    15eb:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    15ed:	85 d2                	test   %edx,%edx
    15ef:	74 15                	je     1606 <printf+0x146>
    15f1:	83 ec 0c             	sub    $0xc,%esp
    15f4:	8b 45 08             	mov    0x8(%ebp),%eax
    15f7:	b9 10 00 00 00       	mov    $0x10,%ecx
    15fc:	6a 00                	push   $0x0
    15fe:	e8 1d fe ff ff       	call   1420 <printint>
    1603:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1606:	83 ec 0c             	sub    $0xc,%esp
    1609:	8b 45 08             	mov    0x8(%ebp),%eax
    160c:	89 da                	mov    %ebx,%edx
    160e:	6a 00                	push   $0x0
    1610:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1615:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1618:	e8 03 fe ff ff       	call   1420 <printint>
    161d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1620:	31 d2                	xor    %edx,%edx
    1622:	e9 e8 fe ff ff       	jmp    150f <printf+0x4f>
    1627:	89 f6                	mov    %esi,%esi
    1629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1630:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1632:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1635:	85 c9                	test   %ecx,%ecx
    1637:	74 6a                	je     16a3 <printf+0x1e3>
        while(*s != 0){
    1639:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    163c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    163e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1640:	84 c0                	test   %al,%al
    1642:	0f 84 c7 fe ff ff    	je     150f <printf+0x4f>
    1648:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    164b:	89 de                	mov    %ebx,%esi
    164d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1650:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1653:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1656:	83 ec 04             	sub    $0x4,%esp
    1659:	6a 01                	push   $0x1
          s++;
    165b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    165e:	50                   	push   %eax
    165f:	53                   	push   %ebx
    1660:	e8 fd fc ff ff       	call   1362 <write>
        while(*s != 0){
    1665:	0f b6 06             	movzbl (%esi),%eax
    1668:	83 c4 10             	add    $0x10,%esp
    166b:	84 c0                	test   %al,%al
    166d:	75 e1                	jne    1650 <printf+0x190>
    166f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1672:	31 d2                	xor    %edx,%edx
    1674:	e9 96 fe ff ff       	jmp    150f <printf+0x4f>
    1679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1680:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1682:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1685:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1688:	6a 01                	push   $0x1
        putc(fd, *ap);
    168a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    168d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1690:	50                   	push   %eax
    1691:	ff 75 08             	pushl  0x8(%ebp)
    1694:	e8 c9 fc ff ff       	call   1362 <write>
    1699:	83 c4 10             	add    $0x10,%esp
      state = 0;
    169c:	31 d2                	xor    %edx,%edx
    169e:	e9 6c fe ff ff       	jmp    150f <printf+0x4f>
          s = "(null)";
    16a3:	bb 88 18 00 00       	mov    $0x1888,%ebx
        while(*s != 0){
    16a8:	b8 28 00 00 00       	mov    $0x28,%eax
    16ad:	eb 99                	jmp    1648 <printf+0x188>
    16af:	90                   	nop

000016b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b1:	a1 40 1b 00 00       	mov    0x1b40,%eax
{
    16b6:	89 e5                	mov    %esp,%ebp
    16b8:	57                   	push   %edi
    16b9:	56                   	push   %esi
    16ba:	53                   	push   %ebx
    16bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    16be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    16c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16c8:	39 c8                	cmp    %ecx,%eax
    16ca:	8b 10                	mov    (%eax),%edx
    16cc:	73 32                	jae    1700 <free+0x50>
    16ce:	39 d1                	cmp    %edx,%ecx
    16d0:	72 04                	jb     16d6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16d2:	39 d0                	cmp    %edx,%eax
    16d4:	72 32                	jb     1708 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16d6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16d9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16dc:	39 fa                	cmp    %edi,%edx
    16de:	74 30                	je     1710 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16e3:	8b 50 04             	mov    0x4(%eax),%edx
    16e6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16e9:	39 f1                	cmp    %esi,%ecx
    16eb:	74 3a                	je     1727 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16ed:	89 08                	mov    %ecx,(%eax)
  freep = p;
    16ef:	a3 40 1b 00 00       	mov    %eax,0x1b40
}
    16f4:	5b                   	pop    %ebx
    16f5:	5e                   	pop    %esi
    16f6:	5f                   	pop    %edi
    16f7:	5d                   	pop    %ebp
    16f8:	c3                   	ret    
    16f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1700:	39 d0                	cmp    %edx,%eax
    1702:	72 04                	jb     1708 <free+0x58>
    1704:	39 d1                	cmp    %edx,%ecx
    1706:	72 ce                	jb     16d6 <free+0x26>
{
    1708:	89 d0                	mov    %edx,%eax
    170a:	eb bc                	jmp    16c8 <free+0x18>
    170c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1710:	03 72 04             	add    0x4(%edx),%esi
    1713:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1716:	8b 10                	mov    (%eax),%edx
    1718:	8b 12                	mov    (%edx),%edx
    171a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    171d:	8b 50 04             	mov    0x4(%eax),%edx
    1720:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1723:	39 f1                	cmp    %esi,%ecx
    1725:	75 c6                	jne    16ed <free+0x3d>
    p->s.size += bp->s.size;
    1727:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    172a:	a3 40 1b 00 00       	mov    %eax,0x1b40
    p->s.size += bp->s.size;
    172f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1732:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1735:	89 10                	mov    %edx,(%eax)
}
    1737:	5b                   	pop    %ebx
    1738:	5e                   	pop    %esi
    1739:	5f                   	pop    %edi
    173a:	5d                   	pop    %ebp
    173b:	c3                   	ret    
    173c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1740:	55                   	push   %ebp
    1741:	89 e5                	mov    %esp,%ebp
    1743:	57                   	push   %edi
    1744:	56                   	push   %esi
    1745:	53                   	push   %ebx
    1746:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1749:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    174c:	8b 15 40 1b 00 00    	mov    0x1b40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1752:	8d 78 07             	lea    0x7(%eax),%edi
    1755:	c1 ef 03             	shr    $0x3,%edi
    1758:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    175b:	85 d2                	test   %edx,%edx
    175d:	0f 84 9d 00 00 00    	je     1800 <malloc+0xc0>
    1763:	8b 02                	mov    (%edx),%eax
    1765:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1768:	39 cf                	cmp    %ecx,%edi
    176a:	76 6c                	jbe    17d8 <malloc+0x98>
    176c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1772:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1777:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    177a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1781:	eb 0e                	jmp    1791 <malloc+0x51>
    1783:	90                   	nop
    1784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1788:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    178a:	8b 48 04             	mov    0x4(%eax),%ecx
    178d:	39 f9                	cmp    %edi,%ecx
    178f:	73 47                	jae    17d8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1791:	39 05 40 1b 00 00    	cmp    %eax,0x1b40
    1797:	89 c2                	mov    %eax,%edx
    1799:	75 ed                	jne    1788 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    179b:	83 ec 0c             	sub    $0xc,%esp
    179e:	56                   	push   %esi
    179f:	e8 26 fc ff ff       	call   13ca <sbrk>
  if(p == (char*)-1)
    17a4:	83 c4 10             	add    $0x10,%esp
    17a7:	83 f8 ff             	cmp    $0xffffffff,%eax
    17aa:	74 1c                	je     17c8 <malloc+0x88>
  hp->s.size = nu;
    17ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17af:	83 ec 0c             	sub    $0xc,%esp
    17b2:	83 c0 08             	add    $0x8,%eax
    17b5:	50                   	push   %eax
    17b6:	e8 f5 fe ff ff       	call   16b0 <free>
  return freep;
    17bb:	8b 15 40 1b 00 00    	mov    0x1b40,%edx
      if((p = morecore(nunits)) == 0)
    17c1:	83 c4 10             	add    $0x10,%esp
    17c4:	85 d2                	test   %edx,%edx
    17c6:	75 c0                	jne    1788 <malloc+0x48>
        return 0;
  }
}
    17c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17cb:	31 c0                	xor    %eax,%eax
}
    17cd:	5b                   	pop    %ebx
    17ce:	5e                   	pop    %esi
    17cf:	5f                   	pop    %edi
    17d0:	5d                   	pop    %ebp
    17d1:	c3                   	ret    
    17d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17d8:	39 cf                	cmp    %ecx,%edi
    17da:	74 54                	je     1830 <malloc+0xf0>
        p->s.size -= nunits;
    17dc:	29 f9                	sub    %edi,%ecx
    17de:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17e1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17e4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    17e7:	89 15 40 1b 00 00    	mov    %edx,0x1b40
}
    17ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17f0:	83 c0 08             	add    $0x8,%eax
}
    17f3:	5b                   	pop    %ebx
    17f4:	5e                   	pop    %esi
    17f5:	5f                   	pop    %edi
    17f6:	5d                   	pop    %ebp
    17f7:	c3                   	ret    
    17f8:	90                   	nop
    17f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1800:	c7 05 40 1b 00 00 44 	movl   $0x1b44,0x1b40
    1807:	1b 00 00 
    180a:	c7 05 44 1b 00 00 44 	movl   $0x1b44,0x1b44
    1811:	1b 00 00 
    base.s.size = 0;
    1814:	b8 44 1b 00 00       	mov    $0x1b44,%eax
    1819:	c7 05 48 1b 00 00 00 	movl   $0x0,0x1b48
    1820:	00 00 00 
    1823:	e9 44 ff ff ff       	jmp    176c <malloc+0x2c>
    1828:	90                   	nop
    1829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1830:	8b 08                	mov    (%eax),%ecx
    1832:	89 0a                	mov    %ecx,(%edx)
    1834:	eb b1                	jmp    17e7 <malloc+0xa7>
