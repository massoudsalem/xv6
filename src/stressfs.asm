
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
    1035:	68 78 18 00 00       	push   $0x1878
    103a:	6a 01                	push   $0x1
  char path[] = "stressfs0";
    103c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
    1043:	73 66 73 
  printf(1, "stressfs starting\n");
    1046:	e8 b5 04 00 00       	call   1500 <printf>
  memset(data, 'a', sizeof(data));
    104b:	83 c4 0c             	add    $0xc,%esp
    104e:	68 00 02 00 00       	push   $0x200
    1053:	6a 61                	push   $0x61
    1055:	56                   	push   %esi
    1056:	e8 95 01 00 00       	call   11f0 <memset>
    105b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
    105e:	e8 27 03 00 00       	call   138a <fork>
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
    107c:	68 8b 18 00 00       	push   $0x188b

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
    1081:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
    1086:	6a 01                	push   $0x1
    1088:	e8 73 04 00 00       	call   1500 <printf>
  path[8] += i;
    108d:	89 f8                	mov    %edi,%eax
    108f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
    1095:	5f                   	pop    %edi
    1096:	58                   	pop    %eax
    1097:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    109d:	68 02 02 00 00       	push   $0x202
    10a2:	50                   	push   %eax
    10a3:	e8 2a 03 00 00       	call   13d2 <open>
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
    10ba:	e8 f3 02 00 00       	call   13b2 <write>
  for(i = 0; i < 20; i++)
    10bf:	83 c4 10             	add    $0x10,%esp
    10c2:	83 eb 01             	sub    $0x1,%ebx
    10c5:	75 e9                	jne    10b0 <main+0xb0>
  close(fd);
    10c7:	83 ec 0c             	sub    $0xc,%esp
    10ca:	57                   	push   %edi
    10cb:	e8 ea 02 00 00       	call   13ba <close>

  printf(1, "read\n");
    10d0:	58                   	pop    %eax
    10d1:	5a                   	pop    %edx
    10d2:	68 95 18 00 00       	push   $0x1895
    10d7:	6a 01                	push   $0x1
    10d9:	e8 22 04 00 00       	call   1500 <printf>

  fd = open(path, O_RDONLY);
    10de:	59                   	pop    %ecx
    10df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    10e5:	5b                   	pop    %ebx
    10e6:	6a 00                	push   $0x0
    10e8:	50                   	push   %eax
    10e9:	bb 14 00 00 00       	mov    $0x14,%ebx
    10ee:	e8 df 02 00 00       	call   13d2 <open>
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
    110a:	e8 9b 02 00 00       	call   13aa <read>
  for (i = 0; i < 20; i++)
    110f:	83 c4 10             	add    $0x10,%esp
    1112:	83 eb 01             	sub    $0x1,%ebx
    1115:	75 e9                	jne    1100 <main+0x100>
  close(fd);
    1117:	83 ec 0c             	sub    $0xc,%esp
    111a:	57                   	push   %edi
    111b:	e8 9a 02 00 00       	call   13ba <close>

  wait();
    1120:	e8 75 02 00 00       	call   139a <wait>

  exit();
    1125:	e8 68 02 00 00       	call   1392 <exit>
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
    1273:	e8 32 01 00 00       	call   13aa <read>
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
    12dd:	e8 f0 00 00 00       	call   13d2 <open>
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
    12f2:	e8 f3 00 00 00       	call   13ea <fstat>
  close(fd);
    12f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12fa:	89 c6                	mov    %eax,%esi
  close(fd);
    12fc:	e8 b9 00 00 00       	call   13ba <close>
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

0000138a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    138a:	b8 01 00 00 00       	mov    $0x1,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <exit>:
SYSCALL(exit)
    1392:	b8 02 00 00 00       	mov    $0x2,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <wait>:
SYSCALL(wait)
    139a:	b8 03 00 00 00       	mov    $0x3,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <pipe>:
SYSCALL(pipe)
    13a2:	b8 04 00 00 00       	mov    $0x4,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <read>:
SYSCALL(read)
    13aa:	b8 05 00 00 00       	mov    $0x5,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <write>:
SYSCALL(write)
    13b2:	b8 10 00 00 00       	mov    $0x10,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <close>:
SYSCALL(close)
    13ba:	b8 15 00 00 00       	mov    $0x15,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <kill>:
SYSCALL(kill)
    13c2:	b8 06 00 00 00       	mov    $0x6,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <exec>:
SYSCALL(exec)
    13ca:	b8 07 00 00 00       	mov    $0x7,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <open>:
SYSCALL(open)
    13d2:	b8 0f 00 00 00       	mov    $0xf,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <mknod>:
SYSCALL(mknod)
    13da:	b8 11 00 00 00       	mov    $0x11,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <unlink>:
SYSCALL(unlink)
    13e2:	b8 12 00 00 00       	mov    $0x12,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <fstat>:
SYSCALL(fstat)
    13ea:	b8 08 00 00 00       	mov    $0x8,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <link>:
SYSCALL(link)
    13f2:	b8 13 00 00 00       	mov    $0x13,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <mkdir>:
SYSCALL(mkdir)
    13fa:	b8 14 00 00 00       	mov    $0x14,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <chdir>:
SYSCALL(chdir)
    1402:	b8 09 00 00 00       	mov    $0x9,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <dup>:
SYSCALL(dup)
    140a:	b8 0a 00 00 00       	mov    $0xa,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    

00001412 <getpid>:
SYSCALL(getpid)
    1412:	b8 0b 00 00 00       	mov    $0xb,%eax
    1417:	cd 40                	int    $0x40
    1419:	c3                   	ret    

0000141a <sbrk>:
SYSCALL(sbrk)
    141a:	b8 0c 00 00 00       	mov    $0xc,%eax
    141f:	cd 40                	int    $0x40
    1421:	c3                   	ret    

00001422 <sleep>:
SYSCALL(sleep)
    1422:	b8 0d 00 00 00       	mov    $0xd,%eax
    1427:	cd 40                	int    $0x40
    1429:	c3                   	ret    

0000142a <uptime>:
SYSCALL(uptime)
    142a:	b8 0e 00 00 00       	mov    $0xe,%eax
    142f:	cd 40                	int    $0x40
    1431:	c3                   	ret    

00001432 <getreadcount>:
SYSCALL(getreadcount)
    1432:	b8 16 00 00 00       	mov    $0x16,%eax
    1437:	cd 40                	int    $0x40
    1439:	c3                   	ret    

0000143a <gettime>:
SYSCALL(gettime)
    143a:	b8 17 00 00 00       	mov    $0x17,%eax
    143f:	cd 40                	int    $0x40
    1441:	c3                   	ret    

00001442 <settickets>:
SYSCALL(settickets)
    1442:	b8 18 00 00 00       	mov    $0x18,%eax
    1447:	cd 40                	int    $0x40
    1449:	c3                   	ret    

0000144a <getpinfo>:
    144a:	b8 19 00 00 00       	mov    $0x19,%eax
    144f:	cd 40                	int    $0x40
    1451:	c3                   	ret    
    1452:	66 90                	xchg   %ax,%ax
    1454:	66 90                	xchg   %ax,%ax
    1456:	66 90                	xchg   %ax,%ax
    1458:	66 90                	xchg   %ax,%ax
    145a:	66 90                	xchg   %ax,%ax
    145c:	66 90                	xchg   %ax,%ax
    145e:	66 90                	xchg   %ax,%ax

00001460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	57                   	push   %edi
    1464:	56                   	push   %esi
    1465:	53                   	push   %ebx
    1466:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1469:	85 d2                	test   %edx,%edx
{
    146b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    146e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1470:	79 76                	jns    14e8 <printint+0x88>
    1472:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1476:	74 70                	je     14e8 <printint+0x88>
    x = -xx;
    1478:	f7 d8                	neg    %eax
    neg = 1;
    147a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1481:	31 f6                	xor    %esi,%esi
    1483:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1486:	eb 0a                	jmp    1492 <printint+0x32>
    1488:	90                   	nop
    1489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1490:	89 fe                	mov    %edi,%esi
    1492:	31 d2                	xor    %edx,%edx
    1494:	8d 7e 01             	lea    0x1(%esi),%edi
    1497:	f7 f1                	div    %ecx
    1499:	0f b6 92 a4 18 00 00 	movzbl 0x18a4(%edx),%edx
  }while((x /= base) != 0);
    14a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    14a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    14a5:	75 e9                	jne    1490 <printint+0x30>
  if(neg)
    14a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    14aa:	85 c0                	test   %eax,%eax
    14ac:	74 08                	je     14b6 <printint+0x56>
    buf[i++] = '-';
    14ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    14b3:	8d 7e 02             	lea    0x2(%esi),%edi
    14b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    14ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
    14bd:	8d 76 00             	lea    0x0(%esi),%esi
    14c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    14c3:	83 ec 04             	sub    $0x4,%esp
    14c6:	83 ee 01             	sub    $0x1,%esi
    14c9:	6a 01                	push   $0x1
    14cb:	53                   	push   %ebx
    14cc:	57                   	push   %edi
    14cd:	88 45 d7             	mov    %al,-0x29(%ebp)
    14d0:	e8 dd fe ff ff       	call   13b2 <write>

  while(--i >= 0)
    14d5:	83 c4 10             	add    $0x10,%esp
    14d8:	39 de                	cmp    %ebx,%esi
    14da:	75 e4                	jne    14c0 <printint+0x60>
    putc(fd, buf[i]);
}
    14dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14df:	5b                   	pop    %ebx
    14e0:	5e                   	pop    %esi
    14e1:	5f                   	pop    %edi
    14e2:	5d                   	pop    %ebp
    14e3:	c3                   	ret    
    14e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    14ef:	eb 90                	jmp    1481 <printint+0x21>
    14f1:	eb 0d                	jmp    1500 <printf>
    14f3:	90                   	nop
    14f4:	90                   	nop
    14f5:	90                   	nop
    14f6:	90                   	nop
    14f7:	90                   	nop
    14f8:	90                   	nop
    14f9:	90                   	nop
    14fa:	90                   	nop
    14fb:	90                   	nop
    14fc:	90                   	nop
    14fd:	90                   	nop
    14fe:	90                   	nop
    14ff:	90                   	nop

00001500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	57                   	push   %edi
    1504:	56                   	push   %esi
    1505:	53                   	push   %ebx
    1506:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1509:	8b 75 0c             	mov    0xc(%ebp),%esi
    150c:	0f b6 1e             	movzbl (%esi),%ebx
    150f:	84 db                	test   %bl,%bl
    1511:	0f 84 bf 00 00 00    	je     15d6 <printf+0xd6>
    1517:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    151a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    151d:	31 d2                	xor    %edx,%edx
    151f:	eb 39                	jmp    155a <printf+0x5a>
    1521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1528:	83 f8 25             	cmp    $0x25,%eax
    152b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    152e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1533:	74 1a                	je     154f <printf+0x4f>
  write(fd, &c, 1);
    1535:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1538:	83 ec 04             	sub    $0x4,%esp
    153b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    153e:	6a 01                	push   $0x1
    1540:	50                   	push   %eax
    1541:	ff 75 08             	pushl  0x8(%ebp)
    1544:	e8 69 fe ff ff       	call   13b2 <write>
    1549:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    154c:	83 c4 10             	add    $0x10,%esp
    154f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1552:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1556:	84 db                	test   %bl,%bl
    1558:	74 7c                	je     15d6 <printf+0xd6>
    if(state == 0){
    155a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    155c:	0f be cb             	movsbl %bl,%ecx
    155f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1562:	74 c4                	je     1528 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1564:	83 fa 25             	cmp    $0x25,%edx
    1567:	75 e6                	jne    154f <printf+0x4f>
      if(c == 'd'){
    1569:	83 f8 64             	cmp    $0x64,%eax
    156c:	0f 84 a6 00 00 00    	je     1618 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1572:	83 f8 6c             	cmp    $0x6c,%eax
    1575:	0f 84 ad 00 00 00    	je     1628 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    157b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1581:	83 f9 70             	cmp    $0x70,%ecx
    1584:	74 5a                	je     15e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1586:	83 f8 73             	cmp    $0x73,%eax
    1589:	0f 84 e1 00 00 00    	je     1670 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    158f:	83 f8 63             	cmp    $0x63,%eax
    1592:	0f 84 28 01 00 00    	je     16c0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1598:	83 f8 25             	cmp    $0x25,%eax
    159b:	74 6b                	je     1608 <printf+0x108>
  write(fd, &c, 1);
    159d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    15a0:	83 ec 04             	sub    $0x4,%esp
    15a3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    15a7:	6a 01                	push   $0x1
    15a9:	50                   	push   %eax
    15aa:	ff 75 08             	pushl  0x8(%ebp)
    15ad:	e8 00 fe ff ff       	call   13b2 <write>
    15b2:	83 c4 0c             	add    $0xc,%esp
    15b5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    15b8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    15bb:	6a 01                	push   $0x1
    15bd:	50                   	push   %eax
    15be:	ff 75 08             	pushl  0x8(%ebp)
    15c1:	83 c6 01             	add    $0x1,%esi
    15c4:	e8 e9 fd ff ff       	call   13b2 <write>
  for(i = 0; fmt[i]; i++){
    15c9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    15cd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15d0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    15d2:	84 db                	test   %bl,%bl
    15d4:	75 84                	jne    155a <printf+0x5a>
    }
  }
}
    15d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15d9:	5b                   	pop    %ebx
    15da:	5e                   	pop    %esi
    15db:	5f                   	pop    %edi
    15dc:	5d                   	pop    %ebp
    15dd:	c3                   	ret    
    15de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    15e0:	83 ec 0c             	sub    $0xc,%esp
    15e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15e8:	6a 00                	push   $0x0
    15ea:	8b 17                	mov    (%edi),%edx
    15ec:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    15ef:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    15f2:	e8 69 fe ff ff       	call   1460 <printint>
    15f7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15fa:	31 d2                	xor    %edx,%edx
    15fc:	e9 4e ff ff ff       	jmp    154f <printf+0x4f>
    1601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1608:	83 ec 04             	sub    $0x4,%esp
    160b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    160e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1611:	6a 01                	push   $0x1
    1613:	eb a8                	jmp    15bd <printf+0xbd>
    1615:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1618:	83 ec 0c             	sub    $0xc,%esp
    161b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1620:	6a 01                	push   $0x1
    1622:	eb c6                	jmp    15ea <printf+0xea>
    1624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1628:	8b 57 04             	mov    0x4(%edi),%edx
    162b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    162d:	85 d2                	test   %edx,%edx
    162f:	74 15                	je     1646 <printf+0x146>
    1631:	83 ec 0c             	sub    $0xc,%esp
    1634:	8b 45 08             	mov    0x8(%ebp),%eax
    1637:	b9 10 00 00 00       	mov    $0x10,%ecx
    163c:	6a 00                	push   $0x0
    163e:	e8 1d fe ff ff       	call   1460 <printint>
    1643:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1646:	83 ec 0c             	sub    $0xc,%esp
    1649:	8b 45 08             	mov    0x8(%ebp),%eax
    164c:	89 da                	mov    %ebx,%edx
    164e:	6a 00                	push   $0x0
    1650:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1655:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1658:	e8 03 fe ff ff       	call   1460 <printint>
    165d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1660:	31 d2                	xor    %edx,%edx
    1662:	e9 e8 fe ff ff       	jmp    154f <printf+0x4f>
    1667:	89 f6                	mov    %esi,%esi
    1669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1670:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1672:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1675:	85 c9                	test   %ecx,%ecx
    1677:	74 6a                	je     16e3 <printf+0x1e3>
        while(*s != 0){
    1679:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    167c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    167e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1680:	84 c0                	test   %al,%al
    1682:	0f 84 c7 fe ff ff    	je     154f <printf+0x4f>
    1688:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    168b:	89 de                	mov    %ebx,%esi
    168d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1690:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1693:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1696:	83 ec 04             	sub    $0x4,%esp
    1699:	6a 01                	push   $0x1
          s++;
    169b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    169e:	50                   	push   %eax
    169f:	53                   	push   %ebx
    16a0:	e8 0d fd ff ff       	call   13b2 <write>
        while(*s != 0){
    16a5:	0f b6 06             	movzbl (%esi),%eax
    16a8:	83 c4 10             	add    $0x10,%esp
    16ab:	84 c0                	test   %al,%al
    16ad:	75 e1                	jne    1690 <printf+0x190>
    16af:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    16b2:	31 d2                	xor    %edx,%edx
    16b4:	e9 96 fe ff ff       	jmp    154f <printf+0x4f>
    16b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    16c0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    16c2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    16c5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    16c8:	6a 01                	push   $0x1
        putc(fd, *ap);
    16ca:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    16cd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16d0:	50                   	push   %eax
    16d1:	ff 75 08             	pushl  0x8(%ebp)
    16d4:	e8 d9 fc ff ff       	call   13b2 <write>
    16d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16dc:	31 d2                	xor    %edx,%edx
    16de:	e9 6c fe ff ff       	jmp    154f <printf+0x4f>
          s = "(null)";
    16e3:	bb 9b 18 00 00       	mov    $0x189b,%ebx
        while(*s != 0){
    16e8:	b8 28 00 00 00       	mov    $0x28,%eax
    16ed:	eb 99                	jmp    1688 <printf+0x188>
    16ef:	90                   	nop

000016f0 <free>:
    16f0:	55                   	push   %ebp
    16f1:	a1 54 1b 00 00       	mov    0x1b54,%eax
    16f6:	89 e5                	mov    %esp,%ebp
    16f8:	57                   	push   %edi
    16f9:	56                   	push   %esi
    16fa:	53                   	push   %ebx
    16fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1708:	39 c8                	cmp    %ecx,%eax
    170a:	8b 10                	mov    (%eax),%edx
    170c:	73 32                	jae    1740 <free+0x50>
    170e:	39 d1                	cmp    %edx,%ecx
    1710:	72 04                	jb     1716 <free+0x26>
    1712:	39 d0                	cmp    %edx,%eax
    1714:	72 32                	jb     1748 <free+0x58>
    1716:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1719:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    171c:	39 fa                	cmp    %edi,%edx
    171e:	74 30                	je     1750 <free+0x60>
    1720:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1723:	8b 50 04             	mov    0x4(%eax),%edx
    1726:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1729:	39 f1                	cmp    %esi,%ecx
    172b:	74 3a                	je     1767 <free+0x77>
    172d:	89 08                	mov    %ecx,(%eax)
    172f:	a3 54 1b 00 00       	mov    %eax,0x1b54
    1734:	5b                   	pop    %ebx
    1735:	5e                   	pop    %esi
    1736:	5f                   	pop    %edi
    1737:	5d                   	pop    %ebp
    1738:	c3                   	ret    
    1739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1740:	39 d0                	cmp    %edx,%eax
    1742:	72 04                	jb     1748 <free+0x58>
    1744:	39 d1                	cmp    %edx,%ecx
    1746:	72 ce                	jb     1716 <free+0x26>
    1748:	89 d0                	mov    %edx,%eax
    174a:	eb bc                	jmp    1708 <free+0x18>
    174c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1750:	03 72 04             	add    0x4(%edx),%esi
    1753:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1756:	8b 10                	mov    (%eax),%edx
    1758:	8b 12                	mov    (%edx),%edx
    175a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    175d:	8b 50 04             	mov    0x4(%eax),%edx
    1760:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1763:	39 f1                	cmp    %esi,%ecx
    1765:	75 c6                	jne    172d <free+0x3d>
    1767:	03 53 fc             	add    -0x4(%ebx),%edx
    176a:	a3 54 1b 00 00       	mov    %eax,0x1b54
    176f:	89 50 04             	mov    %edx,0x4(%eax)
    1772:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1775:	89 10                	mov    %edx,(%eax)
    1777:	5b                   	pop    %ebx
    1778:	5e                   	pop    %esi
    1779:	5f                   	pop    %edi
    177a:	5d                   	pop    %ebp
    177b:	c3                   	ret    
    177c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001780 <malloc>:
    1780:	55                   	push   %ebp
    1781:	89 e5                	mov    %esp,%ebp
    1783:	57                   	push   %edi
    1784:	56                   	push   %esi
    1785:	53                   	push   %ebx
    1786:	83 ec 0c             	sub    $0xc,%esp
    1789:	8b 45 08             	mov    0x8(%ebp),%eax
    178c:	8b 15 54 1b 00 00    	mov    0x1b54,%edx
    1792:	8d 78 07             	lea    0x7(%eax),%edi
    1795:	c1 ef 03             	shr    $0x3,%edi
    1798:	83 c7 01             	add    $0x1,%edi
    179b:	85 d2                	test   %edx,%edx
    179d:	0f 84 9d 00 00 00    	je     1840 <malloc+0xc0>
    17a3:	8b 02                	mov    (%edx),%eax
    17a5:	8b 48 04             	mov    0x4(%eax),%ecx
    17a8:	39 cf                	cmp    %ecx,%edi
    17aa:	76 6c                	jbe    1818 <malloc+0x98>
    17ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    17b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    17b7:	0f 43 df             	cmovae %edi,%ebx
    17ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    17c1:	eb 0e                	jmp    17d1 <malloc+0x51>
    17c3:	90                   	nop
    17c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17c8:	8b 02                	mov    (%edx),%eax
    17ca:	8b 48 04             	mov    0x4(%eax),%ecx
    17cd:	39 f9                	cmp    %edi,%ecx
    17cf:	73 47                	jae    1818 <malloc+0x98>
    17d1:	39 05 54 1b 00 00    	cmp    %eax,0x1b54
    17d7:	89 c2                	mov    %eax,%edx
    17d9:	75 ed                	jne    17c8 <malloc+0x48>
    17db:	83 ec 0c             	sub    $0xc,%esp
    17de:	56                   	push   %esi
    17df:	e8 36 fc ff ff       	call   141a <sbrk>
    17e4:	83 c4 10             	add    $0x10,%esp
    17e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    17ea:	74 1c                	je     1808 <malloc+0x88>
    17ec:	89 58 04             	mov    %ebx,0x4(%eax)
    17ef:	83 ec 0c             	sub    $0xc,%esp
    17f2:	83 c0 08             	add    $0x8,%eax
    17f5:	50                   	push   %eax
    17f6:	e8 f5 fe ff ff       	call   16f0 <free>
    17fb:	8b 15 54 1b 00 00    	mov    0x1b54,%edx
    1801:	83 c4 10             	add    $0x10,%esp
    1804:	85 d2                	test   %edx,%edx
    1806:	75 c0                	jne    17c8 <malloc+0x48>
    1808:	8d 65 f4             	lea    -0xc(%ebp),%esp
    180b:	31 c0                	xor    %eax,%eax
    180d:	5b                   	pop    %ebx
    180e:	5e                   	pop    %esi
    180f:	5f                   	pop    %edi
    1810:	5d                   	pop    %ebp
    1811:	c3                   	ret    
    1812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1818:	39 cf                	cmp    %ecx,%edi
    181a:	74 54                	je     1870 <malloc+0xf0>
    181c:	29 f9                	sub    %edi,%ecx
    181e:	89 48 04             	mov    %ecx,0x4(%eax)
    1821:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1824:	89 78 04             	mov    %edi,0x4(%eax)
    1827:	89 15 54 1b 00 00    	mov    %edx,0x1b54
    182d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1830:	83 c0 08             	add    $0x8,%eax
    1833:	5b                   	pop    %ebx
    1834:	5e                   	pop    %esi
    1835:	5f                   	pop    %edi
    1836:	5d                   	pop    %ebp
    1837:	c3                   	ret    
    1838:	90                   	nop
    1839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1840:	c7 05 54 1b 00 00 58 	movl   $0x1b58,0x1b54
    1847:	1b 00 00 
    184a:	c7 05 58 1b 00 00 58 	movl   $0x1b58,0x1b58
    1851:	1b 00 00 
    1854:	b8 58 1b 00 00       	mov    $0x1b58,%eax
    1859:	c7 05 5c 1b 00 00 00 	movl   $0x0,0x1b5c
    1860:	00 00 00 
    1863:	e9 44 ff ff ff       	jmp    17ac <malloc+0x2c>
    1868:	90                   	nop
    1869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1870:	8b 08                	mov    (%eax),%ecx
    1872:	89 0a                	mov    %ecx,(%edx)
    1874:	eb b1                	jmp    1827 <malloc+0xa7>
