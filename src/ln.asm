
_ln:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
  if(argc != 3){
    1007:	83 39 03             	cmpl   $0x3,(%ecx)
{
    100a:	ff 71 fc             	pushl  -0x4(%ecx)
    100d:	55                   	push   %ebp
    100e:	89 e5                	mov    %esp,%ebp
    1010:	53                   	push   %ebx
    1011:	51                   	push   %ecx
    1012:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
    1015:	74 13                	je     102a <main+0x2a>
    printf(2, "Usage: ln old new\n");
    1017:	52                   	push   %edx
    1018:	52                   	push   %edx
    1019:	68 a8 17 00 00       	push   $0x17a8
    101e:	6a 02                	push   $0x2
    1020:	e8 0b 04 00 00       	call   1430 <printf>
    exit();
    1025:	e8 88 02 00 00       	call   12b2 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
    102a:	50                   	push   %eax
    102b:	50                   	push   %eax
    102c:	ff 73 08             	pushl  0x8(%ebx)
    102f:	ff 73 04             	pushl  0x4(%ebx)
    1032:	e8 db 02 00 00       	call   1312 <link>
    1037:	83 c4 10             	add    $0x10,%esp
    103a:	85 c0                	test   %eax,%eax
    103c:	78 05                	js     1043 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
    103e:	e8 6f 02 00 00       	call   12b2 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
    1043:	ff 73 08             	pushl  0x8(%ebx)
    1046:	ff 73 04             	pushl  0x4(%ebx)
    1049:	68 bb 17 00 00       	push   $0x17bb
    104e:	6a 02                	push   $0x2
    1050:	e8 db 03 00 00       	call   1430 <printf>
    1055:	83 c4 10             	add    $0x10,%esp
    1058:	eb e4                	jmp    103e <main+0x3e>
    105a:	66 90                	xchg   %ax,%ax
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 45 08             	mov    0x8(%ebp),%eax
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    106a:	89 c2                	mov    %eax,%edx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1070:	83 c1 01             	add    $0x1,%ecx
    1073:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1077:	83 c2 01             	add    $0x1,%edx
    107a:	84 db                	test   %bl,%bl
    107c:	88 5a ff             	mov    %bl,-0x1(%edx)
    107f:	75 ef                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    1081:	5b                   	pop    %ebx
    1082:	5d                   	pop    %ebp
    1083:	c3                   	ret    
    1084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    108a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	8b 55 08             	mov    0x8(%ebp),%edx
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    109a:	0f b6 02             	movzbl (%edx),%eax
    109d:	0f b6 19             	movzbl (%ecx),%ebx
    10a0:	84 c0                	test   %al,%al
    10a2:	75 1c                	jne    10c0 <strcmp+0x30>
    10a4:	eb 2a                	jmp    10d0 <strcmp+0x40>
    10a6:	8d 76 00             	lea    0x0(%esi),%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10b6:	83 c1 01             	add    $0x1,%ecx
    10b9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10bc:	84 c0                	test   %al,%al
    10be:	74 10                	je     10d0 <strcmp+0x40>
    10c0:	38 d8                	cmp    %bl,%al
    10c2:	74 ec                	je     10b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10c4:	29 d8                	sub    %ebx,%eax
}
    10c6:	5b                   	pop    %ebx
    10c7:	5d                   	pop    %ebp
    10c8:	c3                   	ret    
    10c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10d2:	29 d8                	sub    %ebx,%eax
}
    10d4:	5b                   	pop    %ebx
    10d5:	5d                   	pop    %ebp
    10d6:	c3                   	ret    
    10d7:	89 f6                	mov    %esi,%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010e0 <strlen>:

uint
strlen(const char *s)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10e6:	80 39 00             	cmpb   $0x0,(%ecx)
    10e9:	74 15                	je     1100 <strlen+0x20>
    10eb:	31 d2                	xor    %edx,%edx
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
    10f0:	83 c2 01             	add    $0x1,%edx
    10f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10f7:	89 d0                	mov    %edx,%eax
    10f9:	75 f5                	jne    10f0 <strlen+0x10>
    ;
  return n;
}
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1100:	31 c0                	xor    %eax,%eax
}
    1102:	5d                   	pop    %ebp
    1103:	c3                   	ret    
    1104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    110a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001110 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1117:	8b 4d 10             	mov    0x10(%ebp),%ecx
    111a:	8b 45 0c             	mov    0xc(%ebp),%eax
    111d:	89 d7                	mov    %edx,%edi
    111f:	fc                   	cld    
    1120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1122:	89 d0                	mov    %edx,%eax
    1124:	5f                   	pop    %edi
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <strchr>:

char*
strchr(const char *s, char c)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
    1134:	8b 45 08             	mov    0x8(%ebp),%eax
    1137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    113a:	0f b6 10             	movzbl (%eax),%edx
    113d:	84 d2                	test   %dl,%dl
    113f:	74 1d                	je     115e <strchr+0x2e>
    if(*s == c)
    1141:	38 d3                	cmp    %dl,%bl
    1143:	89 d9                	mov    %ebx,%ecx
    1145:	75 0d                	jne    1154 <strchr+0x24>
    1147:	eb 17                	jmp    1160 <strchr+0x30>
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1150:	38 ca                	cmp    %cl,%dl
    1152:	74 0c                	je     1160 <strchr+0x30>
  for(; *s; s++)
    1154:	83 c0 01             	add    $0x1,%eax
    1157:	0f b6 10             	movzbl (%eax),%edx
    115a:	84 d2                	test   %dl,%dl
    115c:	75 f2                	jne    1150 <strchr+0x20>
      return (char*)s;
  return 0;
    115e:	31 c0                	xor    %eax,%eax
}
    1160:	5b                   	pop    %ebx
    1161:	5d                   	pop    %ebp
    1162:	c3                   	ret    
    1163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <gets>:

char*
gets(char *buf, int max)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	57                   	push   %edi
    1174:	56                   	push   %esi
    1175:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1176:	31 f6                	xor    %esi,%esi
    1178:	89 f3                	mov    %esi,%ebx
{
    117a:	83 ec 1c             	sub    $0x1c,%esp
    117d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1180:	eb 2f                	jmp    11b1 <gets+0x41>
    1182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1188:	8d 45 e7             	lea    -0x19(%ebp),%eax
    118b:	83 ec 04             	sub    $0x4,%esp
    118e:	6a 01                	push   $0x1
    1190:	50                   	push   %eax
    1191:	6a 00                	push   $0x0
    1193:	e8 32 01 00 00       	call   12ca <read>
    if(cc < 1)
    1198:	83 c4 10             	add    $0x10,%esp
    119b:	85 c0                	test   %eax,%eax
    119d:	7e 1c                	jle    11bb <gets+0x4b>
      break;
    buf[i++] = c;
    119f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11a3:	83 c7 01             	add    $0x1,%edi
    11a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11a9:	3c 0a                	cmp    $0xa,%al
    11ab:	74 23                	je     11d0 <gets+0x60>
    11ad:	3c 0d                	cmp    $0xd,%al
    11af:	74 1f                	je     11d0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11b1:	83 c3 01             	add    $0x1,%ebx
    11b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11b7:	89 fe                	mov    %edi,%esi
    11b9:	7c cd                	jl     1188 <gets+0x18>
    11bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11c0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11c6:	5b                   	pop    %ebx
    11c7:	5e                   	pop    %esi
    11c8:	5f                   	pop    %edi
    11c9:	5d                   	pop    %ebp
    11ca:	c3                   	ret    
    11cb:	90                   	nop
    11cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11d0:	8b 75 08             	mov    0x8(%ebp),%esi
    11d3:	8b 45 08             	mov    0x8(%ebp),%eax
    11d6:	01 de                	add    %ebx,%esi
    11d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11da:	c6 03 00             	movb   $0x0,(%ebx)
}
    11dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11e0:	5b                   	pop    %ebx
    11e1:	5e                   	pop    %esi
    11e2:	5f                   	pop    %edi
    11e3:	5d                   	pop    %ebp
    11e4:	c3                   	ret    
    11e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011f0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	56                   	push   %esi
    11f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f5:	83 ec 08             	sub    $0x8,%esp
    11f8:	6a 00                	push   $0x0
    11fa:	ff 75 08             	pushl  0x8(%ebp)
    11fd:	e8 f0 00 00 00       	call   12f2 <open>
  if(fd < 0)
    1202:	83 c4 10             	add    $0x10,%esp
    1205:	85 c0                	test   %eax,%eax
    1207:	78 27                	js     1230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1209:	83 ec 08             	sub    $0x8,%esp
    120c:	ff 75 0c             	pushl  0xc(%ebp)
    120f:	89 c3                	mov    %eax,%ebx
    1211:	50                   	push   %eax
    1212:	e8 f3 00 00 00       	call   130a <fstat>
  close(fd);
    1217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    121a:	89 c6                	mov    %eax,%esi
  close(fd);
    121c:	e8 b9 00 00 00       	call   12da <close>
  return r;
    1221:	83 c4 10             	add    $0x10,%esp
}
    1224:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1227:	89 f0                	mov    %esi,%eax
    1229:	5b                   	pop    %ebx
    122a:	5e                   	pop    %esi
    122b:	5d                   	pop    %ebp
    122c:	c3                   	ret    
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1230:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1235:	eb ed                	jmp    1224 <stat+0x34>
    1237:	89 f6                	mov    %esi,%esi
    1239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001240 <atoi>:

int
atoi(const char *s)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1247:	0f be 11             	movsbl (%ecx),%edx
    124a:	8d 42 d0             	lea    -0x30(%edx),%eax
    124d:	3c 09                	cmp    $0x9,%al
  n = 0;
    124f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1254:	77 1f                	ja     1275 <atoi+0x35>
    1256:	8d 76 00             	lea    0x0(%esi),%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1260:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1263:	83 c1 01             	add    $0x1,%ecx
    1266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    126a:	0f be 11             	movsbl (%ecx),%edx
    126d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1270:	80 fb 09             	cmp    $0x9,%bl
    1273:	76 eb                	jbe    1260 <atoi+0x20>
  return n;
}
    1275:	5b                   	pop    %ebx
    1276:	5d                   	pop    %ebp
    1277:	c3                   	ret    
    1278:	90                   	nop
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
    1285:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1288:	8b 45 08             	mov    0x8(%ebp),%eax
    128b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    128e:	85 db                	test   %ebx,%ebx
    1290:	7e 14                	jle    12a6 <memmove+0x26>
    1292:	31 d2                	xor    %edx,%edx
    1294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    129c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    129f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12a2:	39 d3                	cmp    %edx,%ebx
    12a4:	75 f2                	jne    1298 <memmove+0x18>
  return vdst;
}
    12a6:	5b                   	pop    %ebx
    12a7:	5e                   	pop    %esi
    12a8:	5d                   	pop    %ebp
    12a9:	c3                   	ret    

000012aa <fork>:
    12aa:	b8 01 00 00 00       	mov    $0x1,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <exit>:
    12b2:	b8 02 00 00 00       	mov    $0x2,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <wait>:
    12ba:	b8 03 00 00 00       	mov    $0x3,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <pipe>:
    12c2:	b8 04 00 00 00       	mov    $0x4,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <read>:
    12ca:	b8 05 00 00 00       	mov    $0x5,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <write>:
    12d2:	b8 10 00 00 00       	mov    $0x10,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <close>:
    12da:	b8 15 00 00 00       	mov    $0x15,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <kill>:
    12e2:	b8 06 00 00 00       	mov    $0x6,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <exec>:
    12ea:	b8 07 00 00 00       	mov    $0x7,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <open>:
    12f2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <mknod>:
    12fa:	b8 11 00 00 00       	mov    $0x11,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <unlink>:
    1302:	b8 12 00 00 00       	mov    $0x12,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <fstat>:
    130a:	b8 08 00 00 00       	mov    $0x8,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <link>:
    1312:	b8 13 00 00 00       	mov    $0x13,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <mkdir>:
    131a:	b8 14 00 00 00       	mov    $0x14,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <chdir>:
    1322:	b8 09 00 00 00       	mov    $0x9,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <dup>:
    132a:	b8 0a 00 00 00       	mov    $0xa,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <getpid>:
    1332:	b8 0b 00 00 00       	mov    $0xb,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <sbrk>:
    133a:	b8 0c 00 00 00       	mov    $0xc,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <sleep>:
    1342:	b8 0d 00 00 00       	mov    $0xd,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <uptime>:
    134a:	b8 0e 00 00 00       	mov    $0xe,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <getreadcount>:
    1352:	b8 16 00 00 00       	mov    $0x16,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <gettime>:
    135a:	b8 17 00 00 00       	mov    $0x17,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <settickets>:
    1362:	b8 18 00 00 00       	mov    $0x18,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <getpinfo>:
    136a:	b8 19 00 00 00       	mov    $0x19,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <mprotect>:
    1372:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <munprotect>:
    137a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    
    1382:	66 90                	xchg   %ax,%ax
    1384:	66 90                	xchg   %ax,%ax
    1386:	66 90                	xchg   %ax,%ax
    1388:	66 90                	xchg   %ax,%ax
    138a:	66 90                	xchg   %ax,%ax
    138c:	66 90                	xchg   %ax,%ax
    138e:	66 90                	xchg   %ax,%ax

00001390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	57                   	push   %edi
    1394:	56                   	push   %esi
    1395:	53                   	push   %ebx
    1396:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1399:	85 d2                	test   %edx,%edx
{
    139b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    139e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    13a0:	79 76                	jns    1418 <printint+0x88>
    13a2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13a6:	74 70                	je     1418 <printint+0x88>
    x = -xx;
    13a8:	f7 d8                	neg    %eax
    neg = 1;
    13aa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    13b1:	31 f6                	xor    %esi,%esi
    13b3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13b6:	eb 0a                	jmp    13c2 <printint+0x32>
    13b8:	90                   	nop
    13b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    13c0:	89 fe                	mov    %edi,%esi
    13c2:	31 d2                	xor    %edx,%edx
    13c4:	8d 7e 01             	lea    0x1(%esi),%edi
    13c7:	f7 f1                	div    %ecx
    13c9:	0f b6 92 d8 17 00 00 	movzbl 0x17d8(%edx),%edx
  }while((x /= base) != 0);
    13d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    13d2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    13d5:	75 e9                	jne    13c0 <printint+0x30>
  if(neg)
    13d7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13da:	85 c0                	test   %eax,%eax
    13dc:	74 08                	je     13e6 <printint+0x56>
    buf[i++] = '-';
    13de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    13e3:	8d 7e 02             	lea    0x2(%esi),%edi
    13e6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    13ea:	8b 7d c0             	mov    -0x40(%ebp),%edi
    13ed:	8d 76 00             	lea    0x0(%esi),%esi
    13f0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    13f3:	83 ec 04             	sub    $0x4,%esp
    13f6:	83 ee 01             	sub    $0x1,%esi
    13f9:	6a 01                	push   $0x1
    13fb:	53                   	push   %ebx
    13fc:	57                   	push   %edi
    13fd:	88 45 d7             	mov    %al,-0x29(%ebp)
    1400:	e8 cd fe ff ff       	call   12d2 <write>

  while(--i >= 0)
    1405:	83 c4 10             	add    $0x10,%esp
    1408:	39 de                	cmp    %ebx,%esi
    140a:	75 e4                	jne    13f0 <printint+0x60>
    putc(fd, buf[i]);
}
    140c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    140f:	5b                   	pop    %ebx
    1410:	5e                   	pop    %esi
    1411:	5f                   	pop    %edi
    1412:	5d                   	pop    %ebp
    1413:	c3                   	ret    
    1414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1418:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    141f:	eb 90                	jmp    13b1 <printint+0x21>
    1421:	eb 0d                	jmp    1430 <printf>
    1423:	90                   	nop
    1424:	90                   	nop
    1425:	90                   	nop
    1426:	90                   	nop
    1427:	90                   	nop
    1428:	90                   	nop
    1429:	90                   	nop
    142a:	90                   	nop
    142b:	90                   	nop
    142c:	90                   	nop
    142d:	90                   	nop
    142e:	90                   	nop
    142f:	90                   	nop

00001430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1439:	8b 75 0c             	mov    0xc(%ebp),%esi
    143c:	0f b6 1e             	movzbl (%esi),%ebx
    143f:	84 db                	test   %bl,%bl
    1441:	0f 84 bf 00 00 00    	je     1506 <printf+0xd6>
    1447:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    144a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    144d:	31 d2                	xor    %edx,%edx
    144f:	eb 39                	jmp    148a <printf+0x5a>
    1451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1458:	83 f8 25             	cmp    $0x25,%eax
    145b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    145e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1463:	74 1a                	je     147f <printf+0x4f>
  write(fd, &c, 1);
    1465:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1468:	83 ec 04             	sub    $0x4,%esp
    146b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    146e:	6a 01                	push   $0x1
    1470:	50                   	push   %eax
    1471:	ff 75 08             	pushl  0x8(%ebp)
    1474:	e8 59 fe ff ff       	call   12d2 <write>
    1479:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    147c:	83 c4 10             	add    $0x10,%esp
    147f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1482:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1486:	84 db                	test   %bl,%bl
    1488:	74 7c                	je     1506 <printf+0xd6>
    if(state == 0){
    148a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    148c:	0f be cb             	movsbl %bl,%ecx
    148f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1492:	74 c4                	je     1458 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1494:	83 fa 25             	cmp    $0x25,%edx
    1497:	75 e6                	jne    147f <printf+0x4f>
      if(c == 'd'){
    1499:	83 f8 64             	cmp    $0x64,%eax
    149c:	0f 84 a6 00 00 00    	je     1548 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    14a2:	83 f8 6c             	cmp    $0x6c,%eax
    14a5:	0f 84 ad 00 00 00    	je     1558 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    14ab:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14b1:	83 f9 70             	cmp    $0x70,%ecx
    14b4:	74 5a                	je     1510 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14b6:	83 f8 73             	cmp    $0x73,%eax
    14b9:	0f 84 e1 00 00 00    	je     15a0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14bf:	83 f8 63             	cmp    $0x63,%eax
    14c2:	0f 84 28 01 00 00    	je     15f0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14c8:	83 f8 25             	cmp    $0x25,%eax
    14cb:	74 6b                	je     1538 <printf+0x108>
  write(fd, &c, 1);
    14cd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14d0:	83 ec 04             	sub    $0x4,%esp
    14d3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14d7:	6a 01                	push   $0x1
    14d9:	50                   	push   %eax
    14da:	ff 75 08             	pushl  0x8(%ebp)
    14dd:	e8 f0 fd ff ff       	call   12d2 <write>
    14e2:	83 c4 0c             	add    $0xc,%esp
    14e5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14e8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14eb:	6a 01                	push   $0x1
    14ed:	50                   	push   %eax
    14ee:	ff 75 08             	pushl  0x8(%ebp)
    14f1:	83 c6 01             	add    $0x1,%esi
    14f4:	e8 d9 fd ff ff       	call   12d2 <write>
  for(i = 0; fmt[i]; i++){
    14f9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    14fd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1500:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1502:	84 db                	test   %bl,%bl
    1504:	75 84                	jne    148a <printf+0x5a>
    }
  }
}
    1506:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1509:	5b                   	pop    %ebx
    150a:	5e                   	pop    %esi
    150b:	5f                   	pop    %edi
    150c:	5d                   	pop    %ebp
    150d:	c3                   	ret    
    150e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1510:	83 ec 0c             	sub    $0xc,%esp
    1513:	b9 10 00 00 00       	mov    $0x10,%ecx
    1518:	6a 00                	push   $0x0
    151a:	8b 17                	mov    (%edi),%edx
    151c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    151f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1522:	e8 69 fe ff ff       	call   1390 <printint>
    1527:	83 c4 10             	add    $0x10,%esp
      state = 0;
    152a:	31 d2                	xor    %edx,%edx
    152c:	e9 4e ff ff ff       	jmp    147f <printf+0x4f>
    1531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1538:	83 ec 04             	sub    $0x4,%esp
    153b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    153e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1541:	6a 01                	push   $0x1
    1543:	eb a8                	jmp    14ed <printf+0xbd>
    1545:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1548:	83 ec 0c             	sub    $0xc,%esp
    154b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1550:	6a 01                	push   $0x1
    1552:	eb c6                	jmp    151a <printf+0xea>
    1554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1558:	8b 57 04             	mov    0x4(%edi),%edx
    155b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    155d:	85 d2                	test   %edx,%edx
    155f:	74 15                	je     1576 <printf+0x146>
    1561:	83 ec 0c             	sub    $0xc,%esp
    1564:	8b 45 08             	mov    0x8(%ebp),%eax
    1567:	b9 10 00 00 00       	mov    $0x10,%ecx
    156c:	6a 00                	push   $0x0
    156e:	e8 1d fe ff ff       	call   1390 <printint>
    1573:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1576:	83 ec 0c             	sub    $0xc,%esp
    1579:	8b 45 08             	mov    0x8(%ebp),%eax
    157c:	89 da                	mov    %ebx,%edx
    157e:	6a 00                	push   $0x0
    1580:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1585:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1588:	e8 03 fe ff ff       	call   1390 <printint>
    158d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1590:	31 d2                	xor    %edx,%edx
    1592:	e9 e8 fe ff ff       	jmp    147f <printf+0x4f>
    1597:	89 f6                	mov    %esi,%esi
    1599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    15a0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    15a2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    15a5:	85 c9                	test   %ecx,%ecx
    15a7:	74 6a                	je     1613 <printf+0x1e3>
        while(*s != 0){
    15a9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    15ac:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    15ae:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    15b0:	84 c0                	test   %al,%al
    15b2:	0f 84 c7 fe ff ff    	je     147f <printf+0x4f>
    15b8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15bb:	89 de                	mov    %ebx,%esi
    15bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15c0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    15c3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15c6:	83 ec 04             	sub    $0x4,%esp
    15c9:	6a 01                	push   $0x1
          s++;
    15cb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    15ce:	50                   	push   %eax
    15cf:	53                   	push   %ebx
    15d0:	e8 fd fc ff ff       	call   12d2 <write>
        while(*s != 0){
    15d5:	0f b6 06             	movzbl (%esi),%eax
    15d8:	83 c4 10             	add    $0x10,%esp
    15db:	84 c0                	test   %al,%al
    15dd:	75 e1                	jne    15c0 <printf+0x190>
    15df:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15e2:	31 d2                	xor    %edx,%edx
    15e4:	e9 96 fe ff ff       	jmp    147f <printf+0x4f>
    15e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    15f0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    15f2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    15f5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    15f8:	6a 01                	push   $0x1
        putc(fd, *ap);
    15fa:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    15fd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1600:	50                   	push   %eax
    1601:	ff 75 08             	pushl  0x8(%ebp)
    1604:	e8 c9 fc ff ff       	call   12d2 <write>
    1609:	83 c4 10             	add    $0x10,%esp
      state = 0;
    160c:	31 d2                	xor    %edx,%edx
    160e:	e9 6c fe ff ff       	jmp    147f <printf+0x4f>
          s = "(null)";
    1613:	bb cf 17 00 00       	mov    $0x17cf,%ebx
        while(*s != 0){
    1618:	b8 28 00 00 00       	mov    $0x28,%eax
    161d:	eb 99                	jmp    15b8 <printf+0x188>
    161f:	90                   	nop

00001620 <free>:
    1620:	55                   	push   %ebp
    1621:	a1 80 1a 00 00       	mov    0x1a80,%eax
    1626:	89 e5                	mov    %esp,%ebp
    1628:	57                   	push   %edi
    1629:	56                   	push   %esi
    162a:	53                   	push   %ebx
    162b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    162e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1638:	39 c8                	cmp    %ecx,%eax
    163a:	8b 10                	mov    (%eax),%edx
    163c:	73 32                	jae    1670 <free+0x50>
    163e:	39 d1                	cmp    %edx,%ecx
    1640:	72 04                	jb     1646 <free+0x26>
    1642:	39 d0                	cmp    %edx,%eax
    1644:	72 32                	jb     1678 <free+0x58>
    1646:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1649:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    164c:	39 fa                	cmp    %edi,%edx
    164e:	74 30                	je     1680 <free+0x60>
    1650:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1653:	8b 50 04             	mov    0x4(%eax),%edx
    1656:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1659:	39 f1                	cmp    %esi,%ecx
    165b:	74 3a                	je     1697 <free+0x77>
    165d:	89 08                	mov    %ecx,(%eax)
    165f:	a3 80 1a 00 00       	mov    %eax,0x1a80
    1664:	5b                   	pop    %ebx
    1665:	5e                   	pop    %esi
    1666:	5f                   	pop    %edi
    1667:	5d                   	pop    %ebp
    1668:	c3                   	ret    
    1669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1670:	39 d0                	cmp    %edx,%eax
    1672:	72 04                	jb     1678 <free+0x58>
    1674:	39 d1                	cmp    %edx,%ecx
    1676:	72 ce                	jb     1646 <free+0x26>
    1678:	89 d0                	mov    %edx,%eax
    167a:	eb bc                	jmp    1638 <free+0x18>
    167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1680:	03 72 04             	add    0x4(%edx),%esi
    1683:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1686:	8b 10                	mov    (%eax),%edx
    1688:	8b 12                	mov    (%edx),%edx
    168a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    168d:	8b 50 04             	mov    0x4(%eax),%edx
    1690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1693:	39 f1                	cmp    %esi,%ecx
    1695:	75 c6                	jne    165d <free+0x3d>
    1697:	03 53 fc             	add    -0x4(%ebx),%edx
    169a:	a3 80 1a 00 00       	mov    %eax,0x1a80
    169f:	89 50 04             	mov    %edx,0x4(%eax)
    16a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16a5:	89 10                	mov    %edx,(%eax)
    16a7:	5b                   	pop    %ebx
    16a8:	5e                   	pop    %esi
    16a9:	5f                   	pop    %edi
    16aa:	5d                   	pop    %ebp
    16ab:	c3                   	ret    
    16ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016b0 <malloc>:
    16b0:	55                   	push   %ebp
    16b1:	89 e5                	mov    %esp,%ebp
    16b3:	57                   	push   %edi
    16b4:	56                   	push   %esi
    16b5:	53                   	push   %ebx
    16b6:	83 ec 0c             	sub    $0xc,%esp
    16b9:	8b 45 08             	mov    0x8(%ebp),%eax
    16bc:	8b 15 80 1a 00 00    	mov    0x1a80,%edx
    16c2:	8d 78 07             	lea    0x7(%eax),%edi
    16c5:	c1 ef 03             	shr    $0x3,%edi
    16c8:	83 c7 01             	add    $0x1,%edi
    16cb:	85 d2                	test   %edx,%edx
    16cd:	0f 84 9d 00 00 00    	je     1770 <malloc+0xc0>
    16d3:	8b 02                	mov    (%edx),%eax
    16d5:	8b 48 04             	mov    0x4(%eax),%ecx
    16d8:	39 cf                	cmp    %ecx,%edi
    16da:	76 6c                	jbe    1748 <malloc+0x98>
    16dc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    16e2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16e7:	0f 43 df             	cmovae %edi,%ebx
    16ea:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    16f1:	eb 0e                	jmp    1701 <malloc+0x51>
    16f3:	90                   	nop
    16f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16f8:	8b 02                	mov    (%edx),%eax
    16fa:	8b 48 04             	mov    0x4(%eax),%ecx
    16fd:	39 f9                	cmp    %edi,%ecx
    16ff:	73 47                	jae    1748 <malloc+0x98>
    1701:	39 05 80 1a 00 00    	cmp    %eax,0x1a80
    1707:	89 c2                	mov    %eax,%edx
    1709:	75 ed                	jne    16f8 <malloc+0x48>
    170b:	83 ec 0c             	sub    $0xc,%esp
    170e:	56                   	push   %esi
    170f:	e8 26 fc ff ff       	call   133a <sbrk>
    1714:	83 c4 10             	add    $0x10,%esp
    1717:	83 f8 ff             	cmp    $0xffffffff,%eax
    171a:	74 1c                	je     1738 <malloc+0x88>
    171c:	89 58 04             	mov    %ebx,0x4(%eax)
    171f:	83 ec 0c             	sub    $0xc,%esp
    1722:	83 c0 08             	add    $0x8,%eax
    1725:	50                   	push   %eax
    1726:	e8 f5 fe ff ff       	call   1620 <free>
    172b:	8b 15 80 1a 00 00    	mov    0x1a80,%edx
    1731:	83 c4 10             	add    $0x10,%esp
    1734:	85 d2                	test   %edx,%edx
    1736:	75 c0                	jne    16f8 <malloc+0x48>
    1738:	8d 65 f4             	lea    -0xc(%ebp),%esp
    173b:	31 c0                	xor    %eax,%eax
    173d:	5b                   	pop    %ebx
    173e:	5e                   	pop    %esi
    173f:	5f                   	pop    %edi
    1740:	5d                   	pop    %ebp
    1741:	c3                   	ret    
    1742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1748:	39 cf                	cmp    %ecx,%edi
    174a:	74 54                	je     17a0 <malloc+0xf0>
    174c:	29 f9                	sub    %edi,%ecx
    174e:	89 48 04             	mov    %ecx,0x4(%eax)
    1751:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1754:	89 78 04             	mov    %edi,0x4(%eax)
    1757:	89 15 80 1a 00 00    	mov    %edx,0x1a80
    175d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1760:	83 c0 08             	add    $0x8,%eax
    1763:	5b                   	pop    %ebx
    1764:	5e                   	pop    %esi
    1765:	5f                   	pop    %edi
    1766:	5d                   	pop    %ebp
    1767:	c3                   	ret    
    1768:	90                   	nop
    1769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1770:	c7 05 80 1a 00 00 84 	movl   $0x1a84,0x1a80
    1777:	1a 00 00 
    177a:	c7 05 84 1a 00 00 84 	movl   $0x1a84,0x1a84
    1781:	1a 00 00 
    1784:	b8 84 1a 00 00       	mov    $0x1a84,%eax
    1789:	c7 05 88 1a 00 00 00 	movl   $0x0,0x1a88
    1790:	00 00 00 
    1793:	e9 44 ff ff ff       	jmp    16dc <malloc+0x2c>
    1798:	90                   	nop
    1799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17a0:	8b 08                	mov    (%eax),%ecx
    17a2:	89 0a                	mov    %ecx,(%edx)
    17a4:	eb b1                	jmp    1757 <malloc+0xa7>
