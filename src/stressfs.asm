
_stressfs:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
    1007:	b8 30 00 00 00       	mov    $0x30,%eax
{
    100c:	ff 71 fc             	pushl  -0x4(%ecx)
    100f:	55                   	push   %ebp
    1010:	89 e5                	mov    %esp,%ebp
    1012:	57                   	push   %edi
    1013:	56                   	push   %esi
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
    1016:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi

  for(i = 0; i < 4; i++)
    101c:	31 db                	xor    %ebx,%ebx
{
    101e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
    1024:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
    102b:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
    1032:	74 72 65 
  printf(1, "stressfs starting\n");
    1035:	68 e0 18 00 00       	push   $0x18e0
    103a:	6a 01                	push   $0x1
  char path[] = "stressfs0";
    103c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
    1043:	73 66 73 
  printf(1, "stressfs starting\n");
    1046:	e8 a5 06 00 00       	call   16f0 <printf>
  memset(data, 'a', sizeof(data));
    104b:	83 c4 0c             	add    $0xc,%esp
    104e:	68 00 02 00 00       	push   $0x200
    1053:	6a 61                	push   $0x61
    1055:	56                   	push   %esi
    1056:	e8 95 01 00 00       	call   11f0 <memset>
    105b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
    105e:	e8 fe 04 00 00       	call   1561 <fork>
    1063:	85 c0                	test   %eax,%eax
    1065:	0f 8f bf 00 00 00    	jg     112a <main+0x12a>
  for(i = 0; i < 4; i++)
    106b:	83 c3 01             	add    $0x1,%ebx
    106e:	83 fb 04             	cmp    $0x4,%ebx
    1071:	75 eb                	jne    105e <main+0x5e>
    1073:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
    1078:	83 ec 04             	sub    $0x4,%esp
    107b:	53                   	push   %ebx
    107c:	68 f3 18 00 00       	push   $0x18f3

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
    1081:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
    1086:	6a 01                	push   $0x1
    1088:	e8 63 06 00 00       	call   16f0 <printf>
  path[8] += i;
    108d:	89 f8                	mov    %edi,%eax
    108f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
    1095:	5f                   	pop    %edi
    1096:	58                   	pop    %eax
    1097:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    109d:	68 02 02 00 00       	push   $0x202
    10a2:	50                   	push   %eax
    10a3:	e8 01 05 00 00       	call   15a9 <open>
    10a8:	83 c4 10             	add    $0x10,%esp
    10ab:	89 c7                	mov    %eax,%edi
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 02 00 00       	push   $0x200
    10b8:	56                   	push   %esi
    10b9:	57                   	push   %edi
    10ba:	e8 ca 04 00 00       	call   1589 <write>
  for(i = 0; i < 20; i++)
    10bf:	83 c4 10             	add    $0x10,%esp
    10c2:	83 eb 01             	sub    $0x1,%ebx
    10c5:	75 e9                	jne    10b0 <main+0xb0>
  close(fd);
    10c7:	83 ec 0c             	sub    $0xc,%esp
    10ca:	57                   	push   %edi
    10cb:	e8 c1 04 00 00       	call   1591 <close>

  printf(1, "read\n");
    10d0:	58                   	pop    %eax
    10d1:	5a                   	pop    %edx
    10d2:	68 fd 18 00 00       	push   $0x18fd
    10d7:	6a 01                	push   $0x1
    10d9:	e8 12 06 00 00       	call   16f0 <printf>

  fd = open(path, O_RDONLY);
    10de:	59                   	pop    %ecx
    10df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    10e5:	5b                   	pop    %ebx
    10e6:	6a 00                	push   $0x0
    10e8:	50                   	push   %eax
    10e9:	bb 14 00 00 00       	mov    $0x14,%ebx
    10ee:	e8 b6 04 00 00       	call   15a9 <open>
    10f3:	83 c4 10             	add    $0x10,%esp
    10f6:	89 c7                	mov    %eax,%edi
    10f8:	90                   	nop
    10f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
    1100:	83 ec 04             	sub    $0x4,%esp
    1103:	68 00 02 00 00       	push   $0x200
    1108:	56                   	push   %esi
    1109:	57                   	push   %edi
    110a:	e8 72 04 00 00       	call   1581 <read>
  for (i = 0; i < 20; i++)
    110f:	83 c4 10             	add    $0x10,%esp
    1112:	83 eb 01             	sub    $0x1,%ebx
    1115:	75 e9                	jne    1100 <main+0x100>
  close(fd);
    1117:	83 ec 0c             	sub    $0xc,%esp
    111a:	57                   	push   %edi
    111b:	e8 71 04 00 00       	call   1591 <close>

  wait();
    1120:	e8 4c 04 00 00       	call   1571 <wait>

  exit();
    1125:	e8 3f 04 00 00       	call   1569 <exit>
    112a:	89 df                	mov    %ebx,%edi
    112c:	e9 47 ff ff ff       	jmp    1078 <main+0x78>
    1131:	66 90                	xchg   %ax,%ax
    1133:	66 90                	xchg   %ax,%ax
    1135:	66 90                	xchg   %ax,%ax
    1137:	66 90                	xchg   %ax,%ax
    1139:	66 90                	xchg   %ax,%ax
    113b:	66 90                	xchg   %ax,%ax
    113d:	66 90                	xchg   %ax,%ax
    113f:	90                   	nop

00001140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 45 08             	mov    0x8(%ebp),%eax
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    114a:	89 c2                	mov    %eax,%edx
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1150:	83 c1 01             	add    $0x1,%ecx
    1153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1157:	83 c2 01             	add    $0x1,%edx
    115a:	84 db                	test   %bl,%bl
    115c:	88 5a ff             	mov    %bl,-0x1(%edx)
    115f:	75 ef                	jne    1150 <strcpy+0x10>
    ;
  return os;
}
    1161:	5b                   	pop    %ebx
    1162:	5d                   	pop    %ebp
    1163:	c3                   	ret    
    1164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    116a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	8b 55 08             	mov    0x8(%ebp),%edx
    1177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    117a:	0f b6 02             	movzbl (%edx),%eax
    117d:	0f b6 19             	movzbl (%ecx),%ebx
    1180:	84 c0                	test   %al,%al
    1182:	75 1c                	jne    11a0 <strcmp+0x30>
    1184:	eb 2a                	jmp    11b0 <strcmp+0x40>
    1186:	8d 76 00             	lea    0x0(%esi),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1190:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1193:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1196:	83 c1 01             	add    $0x1,%ecx
    1199:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    119c:	84 c0                	test   %al,%al
    119e:	74 10                	je     11b0 <strcmp+0x40>
    11a0:	38 d8                	cmp    %bl,%al
    11a2:	74 ec                	je     1190 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    11a4:	29 d8                	sub    %ebx,%eax
}
    11a6:	5b                   	pop    %ebx
    11a7:	5d                   	pop    %ebp
    11a8:	c3                   	ret    
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    11b2:	29 d8                	sub    %ebx,%eax
}
    11b4:	5b                   	pop    %ebx
    11b5:	5d                   	pop    %ebp
    11b6:	c3                   	ret    
    11b7:	89 f6                	mov    %esi,%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <strlen>:

uint
strlen(const char *s)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    11c6:	80 39 00             	cmpb   $0x0,(%ecx)
    11c9:	74 15                	je     11e0 <strlen+0x20>
    11cb:	31 d2                	xor    %edx,%edx
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
    11d0:	83 c2 01             	add    $0x1,%edx
    11d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11d7:	89 d0                	mov    %edx,%eax
    11d9:	75 f5                	jne    11d0 <strlen+0x10>
    ;
  return n;
}
    11db:	5d                   	pop    %ebp
    11dc:	c3                   	ret    
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    11e0:	31 c0                	xor    %eax,%eax
}
    11e2:	5d                   	pop    %ebp
    11e3:	c3                   	ret    
    11e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	57                   	push   %edi
    11f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    11fd:	89 d7                	mov    %edx,%edi
    11ff:	fc                   	cld    
    1200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1202:	89 d0                	mov    %edx,%eax
    1204:	5f                   	pop    %edi
    1205:	5d                   	pop    %ebp
    1206:	c3                   	ret    
    1207:	89 f6                	mov    %esi,%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <strchr>:

char*
strchr(const char *s, char c)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	8b 45 08             	mov    0x8(%ebp),%eax
    1217:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    121a:	0f b6 10             	movzbl (%eax),%edx
    121d:	84 d2                	test   %dl,%dl
    121f:	74 1d                	je     123e <strchr+0x2e>
    if(*s == c)
    1221:	38 d3                	cmp    %dl,%bl
    1223:	89 d9                	mov    %ebx,%ecx
    1225:	75 0d                	jne    1234 <strchr+0x24>
    1227:	eb 17                	jmp    1240 <strchr+0x30>
    1229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1230:	38 ca                	cmp    %cl,%dl
    1232:	74 0c                	je     1240 <strchr+0x30>
  for(; *s; s++)
    1234:	83 c0 01             	add    $0x1,%eax
    1237:	0f b6 10             	movzbl (%eax),%edx
    123a:	84 d2                	test   %dl,%dl
    123c:	75 f2                	jne    1230 <strchr+0x20>
      return (char*)s;
  return 0;
    123e:	31 c0                	xor    %eax,%eax
}
    1240:	5b                   	pop    %ebx
    1241:	5d                   	pop    %ebp
    1242:	c3                   	ret    
    1243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <gets>:

char*
gets(char *buf, int max)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	56                   	push   %esi
    1255:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1256:	31 f6                	xor    %esi,%esi
    1258:	89 f3                	mov    %esi,%ebx
{
    125a:	83 ec 1c             	sub    $0x1c,%esp
    125d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1260:	eb 2f                	jmp    1291 <gets+0x41>
    1262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1268:	8d 45 e7             	lea    -0x19(%ebp),%eax
    126b:	83 ec 04             	sub    $0x4,%esp
    126e:	6a 01                	push   $0x1
    1270:	50                   	push   %eax
    1271:	6a 00                	push   $0x0
    1273:	e8 09 03 00 00       	call   1581 <read>
    if(cc < 1)
    1278:	83 c4 10             	add    $0x10,%esp
    127b:	85 c0                	test   %eax,%eax
    127d:	7e 1c                	jle    129b <gets+0x4b>
      break;
    buf[i++] = c;
    127f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1283:	83 c7 01             	add    $0x1,%edi
    1286:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1289:	3c 0a                	cmp    $0xa,%al
    128b:	74 23                	je     12b0 <gets+0x60>
    128d:	3c 0d                	cmp    $0xd,%al
    128f:	74 1f                	je     12b0 <gets+0x60>
  for(i=0; i+1 < max; ){
    1291:	83 c3 01             	add    $0x1,%ebx
    1294:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1297:	89 fe                	mov    %edi,%esi
    1299:	7c cd                	jl     1268 <gets+0x18>
    129b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    129d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    12a0:	c6 03 00             	movb   $0x0,(%ebx)
}
    12a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12a6:	5b                   	pop    %ebx
    12a7:	5e                   	pop    %esi
    12a8:	5f                   	pop    %edi
    12a9:	5d                   	pop    %ebp
    12aa:	c3                   	ret    
    12ab:	90                   	nop
    12ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12b0:	8b 75 08             	mov    0x8(%ebp),%esi
    12b3:	8b 45 08             	mov    0x8(%ebp),%eax
    12b6:	01 de                	add    %ebx,%esi
    12b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    12ba:	c6 03 00             	movb   $0x0,(%ebx)
}
    12bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12c0:	5b                   	pop    %ebx
    12c1:	5e                   	pop    %esi
    12c2:	5f                   	pop    %edi
    12c3:	5d                   	pop    %ebp
    12c4:	c3                   	ret    
    12c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012d0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	56                   	push   %esi
    12d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12d5:	83 ec 08             	sub    $0x8,%esp
    12d8:	6a 00                	push   $0x0
    12da:	ff 75 08             	pushl  0x8(%ebp)
    12dd:	e8 c7 02 00 00       	call   15a9 <open>
  if(fd < 0)
    12e2:	83 c4 10             	add    $0x10,%esp
    12e5:	85 c0                	test   %eax,%eax
    12e7:	78 27                	js     1310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12e9:	83 ec 08             	sub    $0x8,%esp
    12ec:	ff 75 0c             	pushl  0xc(%ebp)
    12ef:	89 c3                	mov    %eax,%ebx
    12f1:	50                   	push   %eax
    12f2:	e8 ca 02 00 00       	call   15c1 <fstat>
  close(fd);
    12f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12fa:	89 c6                	mov    %eax,%esi
  close(fd);
    12fc:	e8 90 02 00 00       	call   1591 <close>
  return r;
    1301:	83 c4 10             	add    $0x10,%esp
}
    1304:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1307:	89 f0                	mov    %esi,%eax
    1309:	5b                   	pop    %ebx
    130a:	5e                   	pop    %esi
    130b:	5d                   	pop    %ebp
    130c:	c3                   	ret    
    130d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1310:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1315:	eb ed                	jmp    1304 <stat+0x34>
    1317:	89 f6                	mov    %esi,%esi
    1319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001320 <atoi>:

int
atoi(const char *s)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	53                   	push   %ebx
    1324:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1327:	0f be 11             	movsbl (%ecx),%edx
    132a:	8d 42 d0             	lea    -0x30(%edx),%eax
    132d:	3c 09                	cmp    $0x9,%al
  n = 0;
    132f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1334:	77 1f                	ja     1355 <atoi+0x35>
    1336:	8d 76 00             	lea    0x0(%esi),%esi
    1339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1340:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1343:	83 c1 01             	add    $0x1,%ecx
    1346:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    134a:	0f be 11             	movsbl (%ecx),%edx
    134d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1350:	80 fb 09             	cmp    $0x9,%bl
    1353:	76 eb                	jbe    1340 <atoi+0x20>
  return n;
}
    1355:	5b                   	pop    %ebx
    1356:	5d                   	pop    %ebp
    1357:	c3                   	ret    
    1358:	90                   	nop
    1359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	56                   	push   %esi
    1364:	53                   	push   %ebx
    1365:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1368:	8b 45 08             	mov    0x8(%ebp),%eax
    136b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    136e:	85 db                	test   %ebx,%ebx
    1370:	7e 14                	jle    1386 <memmove+0x26>
    1372:	31 d2                	xor    %edx,%edx
    1374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1378:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    137c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    137f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1382:	39 d3                	cmp    %edx,%ebx
    1384:	75 f2                	jne    1378 <memmove+0x18>
  return vdst;
}
    1386:	5b                   	pop    %ebx
    1387:	5e                   	pop    %esi
    1388:	5d                   	pop    %ebp
    1389:	c3                   	ret    
    138a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001390 <thread_join>:
  
  return clone(start_routine, arg, stack);
}

int thread_join()
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    1396:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1399:	50                   	push   %eax
    139a:	e8 a2 02 00 00       	call   1641 <join>
  return x;
}
    139f:	c9                   	leave  
    13a0:	c3                   	ret    
    13a1:	eb 0d                	jmp    13b0 <free>
    13a3:	90                   	nop
    13a4:	90                   	nop
    13a5:	90                   	nop
    13a6:	90                   	nop
    13a7:	90                   	nop
    13a8:	90                   	nop
    13a9:	90                   	nop
    13aa:	90                   	nop
    13ab:	90                   	nop
    13ac:	90                   	nop
    13ad:	90                   	nop
    13ae:	90                   	nop
    13af:	90                   	nop

000013b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    13b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13b1:	a1 fc 1b 00 00       	mov    0x1bfc,%eax
{
    13b6:	89 e5                	mov    %esp,%ebp
    13b8:	57                   	push   %edi
    13b9:	56                   	push   %esi
    13ba:	53                   	push   %ebx
    13bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    13be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    13c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13c8:	39 c8                	cmp    %ecx,%eax
    13ca:	8b 10                	mov    (%eax),%edx
    13cc:	73 32                	jae    1400 <free+0x50>
    13ce:	39 d1                	cmp    %edx,%ecx
    13d0:	72 04                	jb     13d6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13d2:	39 d0                	cmp    %edx,%eax
    13d4:	72 32                	jb     1408 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    13d6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    13d9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    13dc:	39 fa                	cmp    %edi,%edx
    13de:	74 30                	je     1410 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    13e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13e3:	8b 50 04             	mov    0x4(%eax),%edx
    13e6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13e9:	39 f1                	cmp    %esi,%ecx
    13eb:	74 3a                	je     1427 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    13ed:	89 08                	mov    %ecx,(%eax)
  freep = p;
    13ef:	a3 fc 1b 00 00       	mov    %eax,0x1bfc
}
    13f4:	5b                   	pop    %ebx
    13f5:	5e                   	pop    %esi
    13f6:	5f                   	pop    %edi
    13f7:	5d                   	pop    %ebp
    13f8:	c3                   	ret    
    13f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1400:	39 d0                	cmp    %edx,%eax
    1402:	72 04                	jb     1408 <free+0x58>
    1404:	39 d1                	cmp    %edx,%ecx
    1406:	72 ce                	jb     13d6 <free+0x26>
{
    1408:	89 d0                	mov    %edx,%eax
    140a:	eb bc                	jmp    13c8 <free+0x18>
    140c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1410:	03 72 04             	add    0x4(%edx),%esi
    1413:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1416:	8b 10                	mov    (%eax),%edx
    1418:	8b 12                	mov    (%edx),%edx
    141a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    141d:	8b 50 04             	mov    0x4(%eax),%edx
    1420:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1423:	39 f1                	cmp    %esi,%ecx
    1425:	75 c6                	jne    13ed <free+0x3d>
    p->s.size += bp->s.size;
    1427:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    142a:	a3 fc 1b 00 00       	mov    %eax,0x1bfc
    p->s.size += bp->s.size;
    142f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1432:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1435:	89 10                	mov    %edx,(%eax)
}
    1437:	5b                   	pop    %ebx
    1438:	5e                   	pop    %esi
    1439:	5f                   	pop    %edi
    143a:	5d                   	pop    %ebp
    143b:	c3                   	ret    
    143c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001440 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	57                   	push   %edi
    1444:	56                   	push   %esi
    1445:	53                   	push   %ebx
    1446:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1449:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    144c:	8b 15 fc 1b 00 00    	mov    0x1bfc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1452:	8d 78 07             	lea    0x7(%eax),%edi
    1455:	c1 ef 03             	shr    $0x3,%edi
    1458:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    145b:	85 d2                	test   %edx,%edx
    145d:	0f 84 9d 00 00 00    	je     1500 <malloc+0xc0>
    1463:	8b 02                	mov    (%edx),%eax
    1465:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1468:	39 cf                	cmp    %ecx,%edi
    146a:	76 6c                	jbe    14d8 <malloc+0x98>
    146c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1472:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1477:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    147a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1481:	eb 0e                	jmp    1491 <malloc+0x51>
    1483:	90                   	nop
    1484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1488:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    148a:	8b 48 04             	mov    0x4(%eax),%ecx
    148d:	39 f9                	cmp    %edi,%ecx
    148f:	73 47                	jae    14d8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1491:	39 05 fc 1b 00 00    	cmp    %eax,0x1bfc
    1497:	89 c2                	mov    %eax,%edx
    1499:	75 ed                	jne    1488 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    149b:	83 ec 0c             	sub    $0xc,%esp
    149e:	56                   	push   %esi
    149f:	e8 4d 01 00 00       	call   15f1 <sbrk>
  if(p == (char*)-1)
    14a4:	83 c4 10             	add    $0x10,%esp
    14a7:	83 f8 ff             	cmp    $0xffffffff,%eax
    14aa:	74 1c                	je     14c8 <malloc+0x88>
  hp->s.size = nu;
    14ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    14af:	83 ec 0c             	sub    $0xc,%esp
    14b2:	83 c0 08             	add    $0x8,%eax
    14b5:	50                   	push   %eax
    14b6:	e8 f5 fe ff ff       	call   13b0 <free>
  return freep;
    14bb:	8b 15 fc 1b 00 00    	mov    0x1bfc,%edx
      if((p = morecore(nunits)) == 0)
    14c1:	83 c4 10             	add    $0x10,%esp
    14c4:	85 d2                	test   %edx,%edx
    14c6:	75 c0                	jne    1488 <malloc+0x48>
        return 0;
  }
    14c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    14cb:	31 c0                	xor    %eax,%eax
    14cd:	5b                   	pop    %ebx
    14ce:	5e                   	pop    %esi
    14cf:	5f                   	pop    %edi
    14d0:	5d                   	pop    %ebp
    14d1:	c3                   	ret    
    14d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    14d8:	39 cf                	cmp    %ecx,%edi
    14da:	74 54                	je     1530 <malloc+0xf0>
        p->s.size -= nunits;
    14dc:	29 f9                	sub    %edi,%ecx
    14de:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    14e1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    14e4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    14e7:	89 15 fc 1b 00 00    	mov    %edx,0x1bfc
    14ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    14f0:	83 c0 08             	add    $0x8,%eax
    14f3:	5b                   	pop    %ebx
    14f4:	5e                   	pop    %esi
    14f5:	5f                   	pop    %edi
    14f6:	5d                   	pop    %ebp
    14f7:	c3                   	ret    
    14f8:	90                   	nop
    14f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1500:	c7 05 fc 1b 00 00 00 	movl   $0x1c00,0x1bfc
    1507:	1c 00 00 
    150a:	c7 05 00 1c 00 00 00 	movl   $0x1c00,0x1c00
    1511:	1c 00 00 
    base.s.size = 0;
    1514:	b8 00 1c 00 00       	mov    $0x1c00,%eax
    1519:	c7 05 04 1c 00 00 00 	movl   $0x0,0x1c04
    1520:	00 00 00 
    1523:	e9 44 ff ff ff       	jmp    146c <malloc+0x2c>
    1528:	90                   	nop
    1529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1530:	8b 08                	mov    (%eax),%ecx
    1532:	89 0a                	mov    %ecx,(%edx)
    1534:	eb b1                	jmp    14e7 <malloc+0xa7>
    1536:	8d 76 00             	lea    0x0(%esi),%esi
    1539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001540 <thread_create>:
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(4096);
    1546:	68 00 10 00 00       	push   $0x1000
    154b:	e8 f0 fe ff ff       	call   1440 <malloc>
  return clone(start_routine, arg, stack);
    1550:	83 c4 0c             	add    $0xc,%esp
    1553:	50                   	push   %eax
    1554:	ff 75 0c             	pushl  0xc(%ebp)
    1557:	ff 75 08             	pushl  0x8(%ebp)
    155a:	e8 da 00 00 00       	call   1639 <clone>
}
    155f:	c9                   	leave  
    1560:	c3                   	ret    

00001561 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1561:	b8 01 00 00 00       	mov    $0x1,%eax
    1566:	cd 40                	int    $0x40
    1568:	c3                   	ret    

00001569 <exit>:
SYSCALL(exit)
    1569:	b8 02 00 00 00       	mov    $0x2,%eax
    156e:	cd 40                	int    $0x40
    1570:	c3                   	ret    

00001571 <wait>:
SYSCALL(wait)
    1571:	b8 03 00 00 00       	mov    $0x3,%eax
    1576:	cd 40                	int    $0x40
    1578:	c3                   	ret    

00001579 <pipe>:
SYSCALL(pipe)
    1579:	b8 04 00 00 00       	mov    $0x4,%eax
    157e:	cd 40                	int    $0x40
    1580:	c3                   	ret    

00001581 <read>:
SYSCALL(read)
    1581:	b8 05 00 00 00       	mov    $0x5,%eax
    1586:	cd 40                	int    $0x40
    1588:	c3                   	ret    

00001589 <write>:
SYSCALL(write)
    1589:	b8 10 00 00 00       	mov    $0x10,%eax
    158e:	cd 40                	int    $0x40
    1590:	c3                   	ret    

00001591 <close>:
SYSCALL(close)
    1591:	b8 15 00 00 00       	mov    $0x15,%eax
    1596:	cd 40                	int    $0x40
    1598:	c3                   	ret    

00001599 <kill>:
SYSCALL(kill)
    1599:	b8 06 00 00 00       	mov    $0x6,%eax
    159e:	cd 40                	int    $0x40
    15a0:	c3                   	ret    

000015a1 <exec>:
SYSCALL(exec)
    15a1:	b8 07 00 00 00       	mov    $0x7,%eax
    15a6:	cd 40                	int    $0x40
    15a8:	c3                   	ret    

000015a9 <open>:
SYSCALL(open)
    15a9:	b8 0f 00 00 00       	mov    $0xf,%eax
    15ae:	cd 40                	int    $0x40
    15b0:	c3                   	ret    

000015b1 <mknod>:
SYSCALL(mknod)
    15b1:	b8 11 00 00 00       	mov    $0x11,%eax
    15b6:	cd 40                	int    $0x40
    15b8:	c3                   	ret    

000015b9 <unlink>:
SYSCALL(unlink)
    15b9:	b8 12 00 00 00       	mov    $0x12,%eax
    15be:	cd 40                	int    $0x40
    15c0:	c3                   	ret    

000015c1 <fstat>:
SYSCALL(fstat)
    15c1:	b8 08 00 00 00       	mov    $0x8,%eax
    15c6:	cd 40                	int    $0x40
    15c8:	c3                   	ret    

000015c9 <link>:
SYSCALL(link)
    15c9:	b8 13 00 00 00       	mov    $0x13,%eax
    15ce:	cd 40                	int    $0x40
    15d0:	c3                   	ret    

000015d1 <mkdir>:
SYSCALL(mkdir)
    15d1:	b8 14 00 00 00       	mov    $0x14,%eax
    15d6:	cd 40                	int    $0x40
    15d8:	c3                   	ret    

000015d9 <chdir>:
SYSCALL(chdir)
    15d9:	b8 09 00 00 00       	mov    $0x9,%eax
    15de:	cd 40                	int    $0x40
    15e0:	c3                   	ret    

000015e1 <dup>:
SYSCALL(dup)
    15e1:	b8 0a 00 00 00       	mov    $0xa,%eax
    15e6:	cd 40                	int    $0x40
    15e8:	c3                   	ret    

000015e9 <getpid>:
SYSCALL(getpid)
    15e9:	b8 0b 00 00 00       	mov    $0xb,%eax
    15ee:	cd 40                	int    $0x40
    15f0:	c3                   	ret    

000015f1 <sbrk>:
SYSCALL(sbrk)
    15f1:	b8 0c 00 00 00       	mov    $0xc,%eax
    15f6:	cd 40                	int    $0x40
    15f8:	c3                   	ret    

000015f9 <sleep>:
SYSCALL(sleep)
    15f9:	b8 0d 00 00 00       	mov    $0xd,%eax
    15fe:	cd 40                	int    $0x40
    1600:	c3                   	ret    

00001601 <uptime>:
SYSCALL(uptime)
    1601:	b8 0e 00 00 00       	mov    $0xe,%eax
    1606:	cd 40                	int    $0x40
    1608:	c3                   	ret    

00001609 <getreadcount>:
SYSCALL(getreadcount)
    1609:	b8 16 00 00 00       	mov    $0x16,%eax
    160e:	cd 40                	int    $0x40
    1610:	c3                   	ret    

00001611 <gettime>:
SYSCALL(gettime)
    1611:	b8 17 00 00 00       	mov    $0x17,%eax
    1616:	cd 40                	int    $0x40
    1618:	c3                   	ret    

00001619 <settickets>:
SYSCALL(settickets)
    1619:	b8 18 00 00 00       	mov    $0x18,%eax
    161e:	cd 40                	int    $0x40
    1620:	c3                   	ret    

00001621 <getpinfo>:
SYSCALL(getpinfo)
    1621:	b8 19 00 00 00       	mov    $0x19,%eax
    1626:	cd 40                	int    $0x40
    1628:	c3                   	ret    

00001629 <mprotect>:
SYSCALL(mprotect)
    1629:	b8 1a 00 00 00       	mov    $0x1a,%eax
    162e:	cd 40                	int    $0x40
    1630:	c3                   	ret    

00001631 <munprotect>:
SYSCALL(munprotect)
    1631:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1636:	cd 40                	int    $0x40
    1638:	c3                   	ret    

00001639 <clone>:
SYSCALL(clone)
    1639:	b8 1c 00 00 00       	mov    $0x1c,%eax
    163e:	cd 40                	int    $0x40
    1640:	c3                   	ret    

00001641 <join>:
    1641:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1646:	cd 40                	int    $0x40
    1648:	c3                   	ret    
    1649:	66 90                	xchg   %ax,%ax
    164b:	66 90                	xchg   %ax,%ax
    164d:	66 90                	xchg   %ax,%ax
    164f:	90                   	nop

00001650 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	57                   	push   %edi
    1654:	56                   	push   %esi
    1655:	53                   	push   %ebx
    1656:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1659:	85 d2                	test   %edx,%edx
{
    165b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    165e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1660:	79 76                	jns    16d8 <printint+0x88>
    1662:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1666:	74 70                	je     16d8 <printint+0x88>
    x = -xx;
    1668:	f7 d8                	neg    %eax
    neg = 1;
    166a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1671:	31 f6                	xor    %esi,%esi
    1673:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1676:	eb 0a                	jmp    1682 <printint+0x32>
    1678:	90                   	nop
    1679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1680:	89 fe                	mov    %edi,%esi
    1682:	31 d2                	xor    %edx,%edx
    1684:	8d 7e 01             	lea    0x1(%esi),%edi
    1687:	f7 f1                	div    %ecx
    1689:	0f b6 92 0c 19 00 00 	movzbl 0x190c(%edx),%edx
  }while((x /= base) != 0);
    1690:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1692:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1695:	75 e9                	jne    1680 <printint+0x30>
  if(neg)
    1697:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    169a:	85 c0                	test   %eax,%eax
    169c:	74 08                	je     16a6 <printint+0x56>
    buf[i++] = '-';
    169e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    16a3:	8d 7e 02             	lea    0x2(%esi),%edi
    16a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    16aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    16ad:	8d 76 00             	lea    0x0(%esi),%esi
    16b0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    16b3:	83 ec 04             	sub    $0x4,%esp
    16b6:	83 ee 01             	sub    $0x1,%esi
    16b9:	6a 01                	push   $0x1
    16bb:	53                   	push   %ebx
    16bc:	57                   	push   %edi
    16bd:	88 45 d7             	mov    %al,-0x29(%ebp)
    16c0:	e8 c4 fe ff ff       	call   1589 <write>

  while(--i >= 0)
    16c5:	83 c4 10             	add    $0x10,%esp
    16c8:	39 de                	cmp    %ebx,%esi
    16ca:	75 e4                	jne    16b0 <printint+0x60>
    putc(fd, buf[i]);
}
    16cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16cf:	5b                   	pop    %ebx
    16d0:	5e                   	pop    %esi
    16d1:	5f                   	pop    %edi
    16d2:	5d                   	pop    %ebp
    16d3:	c3                   	ret    
    16d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    16d8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    16df:	eb 90                	jmp    1671 <printint+0x21>
    16e1:	eb 0d                	jmp    16f0 <printf>
    16e3:	90                   	nop
    16e4:	90                   	nop
    16e5:	90                   	nop
    16e6:	90                   	nop
    16e7:	90                   	nop
    16e8:	90                   	nop
    16e9:	90                   	nop
    16ea:	90                   	nop
    16eb:	90                   	nop
    16ec:	90                   	nop
    16ed:	90                   	nop
    16ee:	90                   	nop
    16ef:	90                   	nop

000016f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	57                   	push   %edi
    16f4:	56                   	push   %esi
    16f5:	53                   	push   %ebx
    16f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16f9:	8b 75 0c             	mov    0xc(%ebp),%esi
    16fc:	0f b6 1e             	movzbl (%esi),%ebx
    16ff:	84 db                	test   %bl,%bl
    1701:	0f 84 bf 00 00 00    	je     17c6 <printf+0xd6>
    1707:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    170a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    170d:	31 d2                	xor    %edx,%edx
    170f:	eb 39                	jmp    174a <printf+0x5a>
    1711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1718:	83 f8 25             	cmp    $0x25,%eax
    171b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    171e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1723:	74 1a                	je     173f <printf+0x4f>
  write(fd, &c, 1);
    1725:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1728:	83 ec 04             	sub    $0x4,%esp
    172b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    172e:	6a 01                	push   $0x1
    1730:	50                   	push   %eax
    1731:	ff 75 08             	pushl  0x8(%ebp)
    1734:	e8 50 fe ff ff       	call   1589 <write>
    1739:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    173c:	83 c4 10             	add    $0x10,%esp
    173f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1742:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1746:	84 db                	test   %bl,%bl
    1748:	74 7c                	je     17c6 <printf+0xd6>
    if(state == 0){
    174a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    174c:	0f be cb             	movsbl %bl,%ecx
    174f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1752:	74 c4                	je     1718 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1754:	83 fa 25             	cmp    $0x25,%edx
    1757:	75 e6                	jne    173f <printf+0x4f>
      if(c == 'd'){
    1759:	83 f8 64             	cmp    $0x64,%eax
    175c:	0f 84 a6 00 00 00    	je     1808 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1762:	83 f8 6c             	cmp    $0x6c,%eax
    1765:	0f 84 ad 00 00 00    	je     1818 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    176b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1771:	83 f9 70             	cmp    $0x70,%ecx
    1774:	74 5a                	je     17d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1776:	83 f8 73             	cmp    $0x73,%eax
    1779:	0f 84 e1 00 00 00    	je     1860 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    177f:	83 f8 63             	cmp    $0x63,%eax
    1782:	0f 84 28 01 00 00    	je     18b0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1788:	83 f8 25             	cmp    $0x25,%eax
    178b:	74 6b                	je     17f8 <printf+0x108>
  write(fd, &c, 1);
    178d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1790:	83 ec 04             	sub    $0x4,%esp
    1793:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1797:	6a 01                	push   $0x1
    1799:	50                   	push   %eax
    179a:	ff 75 08             	pushl  0x8(%ebp)
    179d:	e8 e7 fd ff ff       	call   1589 <write>
    17a2:	83 c4 0c             	add    $0xc,%esp
    17a5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    17a8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    17ab:	6a 01                	push   $0x1
    17ad:	50                   	push   %eax
    17ae:	ff 75 08             	pushl  0x8(%ebp)
    17b1:	83 c6 01             	add    $0x1,%esi
    17b4:	e8 d0 fd ff ff       	call   1589 <write>
  for(i = 0; fmt[i]; i++){
    17b9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    17bd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    17c0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    17c2:	84 db                	test   %bl,%bl
    17c4:	75 84                	jne    174a <printf+0x5a>
    }
  }
}
    17c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17c9:	5b                   	pop    %ebx
    17ca:	5e                   	pop    %esi
    17cb:	5f                   	pop    %edi
    17cc:	5d                   	pop    %ebp
    17cd:	c3                   	ret    
    17ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    17d0:	83 ec 0c             	sub    $0xc,%esp
    17d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    17d8:	6a 00                	push   $0x0
    17da:	8b 17                	mov    (%edi),%edx
    17dc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    17df:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    17e2:	e8 69 fe ff ff       	call   1650 <printint>
    17e7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17ea:	31 d2                	xor    %edx,%edx
    17ec:	e9 4e ff ff ff       	jmp    173f <printf+0x4f>
    17f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    17f8:	83 ec 04             	sub    $0x4,%esp
    17fb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    17fe:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1801:	6a 01                	push   $0x1
    1803:	eb a8                	jmp    17ad <printf+0xbd>
    1805:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1808:	83 ec 0c             	sub    $0xc,%esp
    180b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1810:	6a 01                	push   $0x1
    1812:	eb c6                	jmp    17da <printf+0xea>
    1814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1818:	8b 57 04             	mov    0x4(%edi),%edx
    181b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    181d:	85 d2                	test   %edx,%edx
    181f:	74 15                	je     1836 <printf+0x146>
    1821:	83 ec 0c             	sub    $0xc,%esp
    1824:	8b 45 08             	mov    0x8(%ebp),%eax
    1827:	b9 10 00 00 00       	mov    $0x10,%ecx
    182c:	6a 00                	push   $0x0
    182e:	e8 1d fe ff ff       	call   1650 <printint>
    1833:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1836:	83 ec 0c             	sub    $0xc,%esp
    1839:	8b 45 08             	mov    0x8(%ebp),%eax
    183c:	89 da                	mov    %ebx,%edx
    183e:	6a 00                	push   $0x0
    1840:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1845:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1848:	e8 03 fe ff ff       	call   1650 <printint>
    184d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1850:	31 d2                	xor    %edx,%edx
    1852:	e9 e8 fe ff ff       	jmp    173f <printf+0x4f>
    1857:	89 f6                	mov    %esi,%esi
    1859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1860:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1862:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1865:	85 c9                	test   %ecx,%ecx
    1867:	74 6a                	je     18d3 <printf+0x1e3>
        while(*s != 0){
    1869:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    186c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    186e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1870:	84 c0                	test   %al,%al
    1872:	0f 84 c7 fe ff ff    	je     173f <printf+0x4f>
    1878:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    187b:	89 de                	mov    %ebx,%esi
    187d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1880:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1883:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1886:	83 ec 04             	sub    $0x4,%esp
    1889:	6a 01                	push   $0x1
          s++;
    188b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    188e:	50                   	push   %eax
    188f:	53                   	push   %ebx
    1890:	e8 f4 fc ff ff       	call   1589 <write>
        while(*s != 0){
    1895:	0f b6 06             	movzbl (%esi),%eax
    1898:	83 c4 10             	add    $0x10,%esp
    189b:	84 c0                	test   %al,%al
    189d:	75 e1                	jne    1880 <printf+0x190>
    189f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    18a2:	31 d2                	xor    %edx,%edx
    18a4:	e9 96 fe ff ff       	jmp    173f <printf+0x4f>
    18a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    18b0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    18b2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    18b5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    18b8:	6a 01                	push   $0x1
        putc(fd, *ap);
    18ba:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    18bd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    18c0:	50                   	push   %eax
    18c1:	ff 75 08             	pushl  0x8(%ebp)
    18c4:	e8 c0 fc ff ff       	call   1589 <write>
    18c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18cc:	31 d2                	xor    %edx,%edx
    18ce:	e9 6c fe ff ff       	jmp    173f <printf+0x4f>
          s = "(null)";
    18d3:	bb 03 19 00 00       	mov    $0x1903,%ebx
        while(*s != 0){
    18d8:	b8 28 00 00 00       	mov    $0x28,%eax
    18dd:	eb 99                	jmp    1878 <printf+0x188>
