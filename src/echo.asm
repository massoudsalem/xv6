
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
    1028:	68 b8 17 00 00       	push   $0x17b8
    102d:	50                   	push   %eax
    102e:	68 ba 17 00 00       	push   $0x17ba
    1033:	6a 01                	push   $0x1
    1035:	e8 06 04 00 00       	call   1440 <printf>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	83 c3 04             	add    $0x4,%ebx
    1040:	8b 43 fc             	mov    -0x4(%ebx),%eax
    1043:	39 f3                	cmp    %esi,%ebx
    1045:	75 e1                	jne    1028 <main+0x28>
    1047:	68 bf 17 00 00       	push   $0x17bf
    104c:	50                   	push   %eax
    104d:	68 ba 17 00 00       	push   $0x17ba
    1052:	6a 01                	push   $0x1
    1054:	e8 e7 03 00 00       	call   1440 <printf>
    1059:	83 c4 10             	add    $0x10,%esp
  exit();
    105c:	e8 61 02 00 00       	call   12c2 <exit>
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
    11a3:	e8 32 01 00 00       	call   12da <read>
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
    120d:	e8 f0 00 00 00       	call   1302 <open>
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
    1222:	e8 f3 00 00 00       	call   131a <fstat>
  close(fd);
    1227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    122a:	89 c6                	mov    %eax,%esi
  close(fd);
    122c:	e8 b9 00 00 00       	call   12ea <close>
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

000012ba <fork>:
    12ba:	b8 01 00 00 00       	mov    $0x1,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <exit>:
    12c2:	b8 02 00 00 00       	mov    $0x2,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <wait>:
    12ca:	b8 03 00 00 00       	mov    $0x3,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <pipe>:
    12d2:	b8 04 00 00 00       	mov    $0x4,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <read>:
    12da:	b8 05 00 00 00       	mov    $0x5,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <write>:
    12e2:	b8 10 00 00 00       	mov    $0x10,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <close>:
    12ea:	b8 15 00 00 00       	mov    $0x15,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <kill>:
    12f2:	b8 06 00 00 00       	mov    $0x6,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <exec>:
    12fa:	b8 07 00 00 00       	mov    $0x7,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <open>:
    1302:	b8 0f 00 00 00       	mov    $0xf,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <mknod>:
    130a:	b8 11 00 00 00       	mov    $0x11,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <unlink>:
    1312:	b8 12 00 00 00       	mov    $0x12,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <fstat>:
    131a:	b8 08 00 00 00       	mov    $0x8,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <link>:
    1322:	b8 13 00 00 00       	mov    $0x13,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <mkdir>:
    132a:	b8 14 00 00 00       	mov    $0x14,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <chdir>:
    1332:	b8 09 00 00 00       	mov    $0x9,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <dup>:
    133a:	b8 0a 00 00 00       	mov    $0xa,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <getpid>:
    1342:	b8 0b 00 00 00       	mov    $0xb,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <sbrk>:
    134a:	b8 0c 00 00 00       	mov    $0xc,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <sleep>:
    1352:	b8 0d 00 00 00       	mov    $0xd,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <uptime>:
    135a:	b8 0e 00 00 00       	mov    $0xe,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <getreadcount>:
    1362:	b8 16 00 00 00       	mov    $0x16,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <gettime>:
    136a:	b8 17 00 00 00       	mov    $0x17,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <settickets>:
    1372:	b8 18 00 00 00       	mov    $0x18,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <getpinfo>:
    137a:	b8 19 00 00 00       	mov    $0x19,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <mprotect>:
    1382:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <munprotect>:
    138a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    
    1392:	66 90                	xchg   %ax,%ax
    1394:	66 90                	xchg   %ax,%ax
    1396:	66 90                	xchg   %ax,%ax
    1398:	66 90                	xchg   %ax,%ax
    139a:	66 90                	xchg   %ax,%ax
    139c:	66 90                	xchg   %ax,%ax
    139e:	66 90                	xchg   %ax,%ax

000013a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	57                   	push   %edi
    13a4:	56                   	push   %esi
    13a5:	53                   	push   %ebx
    13a6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13a9:	85 d2                	test   %edx,%edx
{
    13ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    13ae:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    13b0:	79 76                	jns    1428 <printint+0x88>
    13b2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13b6:	74 70                	je     1428 <printint+0x88>
    x = -xx;
    13b8:	f7 d8                	neg    %eax
    neg = 1;
    13ba:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    13c1:	31 f6                	xor    %esi,%esi
    13c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13c6:	eb 0a                	jmp    13d2 <printint+0x32>
    13c8:	90                   	nop
    13c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    13d0:	89 fe                	mov    %edi,%esi
    13d2:	31 d2                	xor    %edx,%edx
    13d4:	8d 7e 01             	lea    0x1(%esi),%edi
    13d7:	f7 f1                	div    %ecx
    13d9:	0f b6 92 c8 17 00 00 	movzbl 0x17c8(%edx),%edx
  }while((x /= base) != 0);
    13e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    13e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    13e5:	75 e9                	jne    13d0 <printint+0x30>
  if(neg)
    13e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13ea:	85 c0                	test   %eax,%eax
    13ec:	74 08                	je     13f6 <printint+0x56>
    buf[i++] = '-';
    13ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    13f3:	8d 7e 02             	lea    0x2(%esi),%edi
    13f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    13fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    13fd:	8d 76 00             	lea    0x0(%esi),%esi
    1400:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1403:	83 ec 04             	sub    $0x4,%esp
    1406:	83 ee 01             	sub    $0x1,%esi
    1409:	6a 01                	push   $0x1
    140b:	53                   	push   %ebx
    140c:	57                   	push   %edi
    140d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1410:	e8 cd fe ff ff       	call   12e2 <write>

  while(--i >= 0)
    1415:	83 c4 10             	add    $0x10,%esp
    1418:	39 de                	cmp    %ebx,%esi
    141a:	75 e4                	jne    1400 <printint+0x60>
    putc(fd, buf[i]);
}
    141c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    141f:	5b                   	pop    %ebx
    1420:	5e                   	pop    %esi
    1421:	5f                   	pop    %edi
    1422:	5d                   	pop    %ebp
    1423:	c3                   	ret    
    1424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1428:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    142f:	eb 90                	jmp    13c1 <printint+0x21>
    1431:	eb 0d                	jmp    1440 <printf>
    1433:	90                   	nop
    1434:	90                   	nop
    1435:	90                   	nop
    1436:	90                   	nop
    1437:	90                   	nop
    1438:	90                   	nop
    1439:	90                   	nop
    143a:	90                   	nop
    143b:	90                   	nop
    143c:	90                   	nop
    143d:	90                   	nop
    143e:	90                   	nop
    143f:	90                   	nop

00001440 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	57                   	push   %edi
    1444:	56                   	push   %esi
    1445:	53                   	push   %ebx
    1446:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1449:	8b 75 0c             	mov    0xc(%ebp),%esi
    144c:	0f b6 1e             	movzbl (%esi),%ebx
    144f:	84 db                	test   %bl,%bl
    1451:	0f 84 bf 00 00 00    	je     1516 <printf+0xd6>
    1457:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    145a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    145d:	31 d2                	xor    %edx,%edx
    145f:	eb 39                	jmp    149a <printf+0x5a>
    1461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1468:	83 f8 25             	cmp    $0x25,%eax
    146b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    146e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1473:	74 1a                	je     148f <printf+0x4f>
  write(fd, &c, 1);
    1475:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1478:	83 ec 04             	sub    $0x4,%esp
    147b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    147e:	6a 01                	push   $0x1
    1480:	50                   	push   %eax
    1481:	ff 75 08             	pushl  0x8(%ebp)
    1484:	e8 59 fe ff ff       	call   12e2 <write>
    1489:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    148c:	83 c4 10             	add    $0x10,%esp
    148f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1492:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1496:	84 db                	test   %bl,%bl
    1498:	74 7c                	je     1516 <printf+0xd6>
    if(state == 0){
    149a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    149c:	0f be cb             	movsbl %bl,%ecx
    149f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14a2:	74 c4                	je     1468 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    14a4:	83 fa 25             	cmp    $0x25,%edx
    14a7:	75 e6                	jne    148f <printf+0x4f>
      if(c == 'd'){
    14a9:	83 f8 64             	cmp    $0x64,%eax
    14ac:	0f 84 a6 00 00 00    	je     1558 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    14b2:	83 f8 6c             	cmp    $0x6c,%eax
    14b5:	0f 84 ad 00 00 00    	je     1568 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    14bb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14c1:	83 f9 70             	cmp    $0x70,%ecx
    14c4:	74 5a                	je     1520 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14c6:	83 f8 73             	cmp    $0x73,%eax
    14c9:	0f 84 e1 00 00 00    	je     15b0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14cf:	83 f8 63             	cmp    $0x63,%eax
    14d2:	0f 84 28 01 00 00    	je     1600 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14d8:	83 f8 25             	cmp    $0x25,%eax
    14db:	74 6b                	je     1548 <printf+0x108>
  write(fd, &c, 1);
    14dd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14e0:	83 ec 04             	sub    $0x4,%esp
    14e3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14e7:	6a 01                	push   $0x1
    14e9:	50                   	push   %eax
    14ea:	ff 75 08             	pushl  0x8(%ebp)
    14ed:	e8 f0 fd ff ff       	call   12e2 <write>
    14f2:	83 c4 0c             	add    $0xc,%esp
    14f5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14f8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14fb:	6a 01                	push   $0x1
    14fd:	50                   	push   %eax
    14fe:	ff 75 08             	pushl  0x8(%ebp)
    1501:	83 c6 01             	add    $0x1,%esi
    1504:	e8 d9 fd ff ff       	call   12e2 <write>
  for(i = 0; fmt[i]; i++){
    1509:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    150d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1510:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1512:	84 db                	test   %bl,%bl
    1514:	75 84                	jne    149a <printf+0x5a>
    }
  }
}
    1516:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1519:	5b                   	pop    %ebx
    151a:	5e                   	pop    %esi
    151b:	5f                   	pop    %edi
    151c:	5d                   	pop    %ebp
    151d:	c3                   	ret    
    151e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	b9 10 00 00 00       	mov    $0x10,%ecx
    1528:	6a 00                	push   $0x0
    152a:	8b 17                	mov    (%edi),%edx
    152c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    152f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1532:	e8 69 fe ff ff       	call   13a0 <printint>
    1537:	83 c4 10             	add    $0x10,%esp
      state = 0;
    153a:	31 d2                	xor    %edx,%edx
    153c:	e9 4e ff ff ff       	jmp    148f <printf+0x4f>
    1541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1548:	83 ec 04             	sub    $0x4,%esp
    154b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    154e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1551:	6a 01                	push   $0x1
    1553:	eb a8                	jmp    14fd <printf+0xbd>
    1555:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1558:	83 ec 0c             	sub    $0xc,%esp
    155b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1560:	6a 01                	push   $0x1
    1562:	eb c6                	jmp    152a <printf+0xea>
    1564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1568:	8b 57 04             	mov    0x4(%edi),%edx
    156b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    156d:	85 d2                	test   %edx,%edx
    156f:	74 15                	je     1586 <printf+0x146>
    1571:	83 ec 0c             	sub    $0xc,%esp
    1574:	8b 45 08             	mov    0x8(%ebp),%eax
    1577:	b9 10 00 00 00       	mov    $0x10,%ecx
    157c:	6a 00                	push   $0x0
    157e:	e8 1d fe ff ff       	call   13a0 <printint>
    1583:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1586:	83 ec 0c             	sub    $0xc,%esp
    1589:	8b 45 08             	mov    0x8(%ebp),%eax
    158c:	89 da                	mov    %ebx,%edx
    158e:	6a 00                	push   $0x0
    1590:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1595:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1598:	e8 03 fe ff ff       	call   13a0 <printint>
    159d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15a0:	31 d2                	xor    %edx,%edx
    15a2:	e9 e8 fe ff ff       	jmp    148f <printf+0x4f>
    15a7:	89 f6                	mov    %esi,%esi
    15a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    15b0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    15b2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    15b5:	85 c9                	test   %ecx,%ecx
    15b7:	74 6a                	je     1623 <printf+0x1e3>
        while(*s != 0){
    15b9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    15bc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    15be:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    15c0:	84 c0                	test   %al,%al
    15c2:	0f 84 c7 fe ff ff    	je     148f <printf+0x4f>
    15c8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15cb:	89 de                	mov    %ebx,%esi
    15cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    15d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15d6:	83 ec 04             	sub    $0x4,%esp
    15d9:	6a 01                	push   $0x1
          s++;
    15db:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    15de:	50                   	push   %eax
    15df:	53                   	push   %ebx
    15e0:	e8 fd fc ff ff       	call   12e2 <write>
        while(*s != 0){
    15e5:	0f b6 06             	movzbl (%esi),%eax
    15e8:	83 c4 10             	add    $0x10,%esp
    15eb:	84 c0                	test   %al,%al
    15ed:	75 e1                	jne    15d0 <printf+0x190>
    15ef:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15f2:	31 d2                	xor    %edx,%edx
    15f4:	e9 96 fe ff ff       	jmp    148f <printf+0x4f>
    15f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1600:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1602:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1605:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1608:	6a 01                	push   $0x1
        putc(fd, *ap);
    160a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    160d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1610:	50                   	push   %eax
    1611:	ff 75 08             	pushl  0x8(%ebp)
    1614:	e8 c9 fc ff ff       	call   12e2 <write>
    1619:	83 c4 10             	add    $0x10,%esp
      state = 0;
    161c:	31 d2                	xor    %edx,%edx
    161e:	e9 6c fe ff ff       	jmp    148f <printf+0x4f>
          s = "(null)";
    1623:	bb c1 17 00 00       	mov    $0x17c1,%ebx
        while(*s != 0){
    1628:	b8 28 00 00 00       	mov    $0x28,%eax
    162d:	eb 99                	jmp    15c8 <printf+0x188>
    162f:	90                   	nop

00001630 <free>:
    1630:	55                   	push   %ebp
    1631:	a1 74 1a 00 00       	mov    0x1a74,%eax
    1636:	89 e5                	mov    %esp,%ebp
    1638:	57                   	push   %edi
    1639:	56                   	push   %esi
    163a:	53                   	push   %ebx
    163b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    163e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1648:	39 c8                	cmp    %ecx,%eax
    164a:	8b 10                	mov    (%eax),%edx
    164c:	73 32                	jae    1680 <free+0x50>
    164e:	39 d1                	cmp    %edx,%ecx
    1650:	72 04                	jb     1656 <free+0x26>
    1652:	39 d0                	cmp    %edx,%eax
    1654:	72 32                	jb     1688 <free+0x58>
    1656:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1659:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    165c:	39 fa                	cmp    %edi,%edx
    165e:	74 30                	je     1690 <free+0x60>
    1660:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1663:	8b 50 04             	mov    0x4(%eax),%edx
    1666:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1669:	39 f1                	cmp    %esi,%ecx
    166b:	74 3a                	je     16a7 <free+0x77>
    166d:	89 08                	mov    %ecx,(%eax)
    166f:	a3 74 1a 00 00       	mov    %eax,0x1a74
    1674:	5b                   	pop    %ebx
    1675:	5e                   	pop    %esi
    1676:	5f                   	pop    %edi
    1677:	5d                   	pop    %ebp
    1678:	c3                   	ret    
    1679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1680:	39 d0                	cmp    %edx,%eax
    1682:	72 04                	jb     1688 <free+0x58>
    1684:	39 d1                	cmp    %edx,%ecx
    1686:	72 ce                	jb     1656 <free+0x26>
    1688:	89 d0                	mov    %edx,%eax
    168a:	eb bc                	jmp    1648 <free+0x18>
    168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1690:	03 72 04             	add    0x4(%edx),%esi
    1693:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1696:	8b 10                	mov    (%eax),%edx
    1698:	8b 12                	mov    (%edx),%edx
    169a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    169d:	8b 50 04             	mov    0x4(%eax),%edx
    16a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16a3:	39 f1                	cmp    %esi,%ecx
    16a5:	75 c6                	jne    166d <free+0x3d>
    16a7:	03 53 fc             	add    -0x4(%ebx),%edx
    16aa:	a3 74 1a 00 00       	mov    %eax,0x1a74
    16af:	89 50 04             	mov    %edx,0x4(%eax)
    16b2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16b5:	89 10                	mov    %edx,(%eax)
    16b7:	5b                   	pop    %ebx
    16b8:	5e                   	pop    %esi
    16b9:	5f                   	pop    %edi
    16ba:	5d                   	pop    %ebp
    16bb:	c3                   	ret    
    16bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016c0 <malloc>:
    16c0:	55                   	push   %ebp
    16c1:	89 e5                	mov    %esp,%ebp
    16c3:	57                   	push   %edi
    16c4:	56                   	push   %esi
    16c5:	53                   	push   %ebx
    16c6:	83 ec 0c             	sub    $0xc,%esp
    16c9:	8b 45 08             	mov    0x8(%ebp),%eax
    16cc:	8b 15 74 1a 00 00    	mov    0x1a74,%edx
    16d2:	8d 78 07             	lea    0x7(%eax),%edi
    16d5:	c1 ef 03             	shr    $0x3,%edi
    16d8:	83 c7 01             	add    $0x1,%edi
    16db:	85 d2                	test   %edx,%edx
    16dd:	0f 84 9d 00 00 00    	je     1780 <malloc+0xc0>
    16e3:	8b 02                	mov    (%edx),%eax
    16e5:	8b 48 04             	mov    0x4(%eax),%ecx
    16e8:	39 cf                	cmp    %ecx,%edi
    16ea:	76 6c                	jbe    1758 <malloc+0x98>
    16ec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    16f2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16f7:	0f 43 df             	cmovae %edi,%ebx
    16fa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1701:	eb 0e                	jmp    1711 <malloc+0x51>
    1703:	90                   	nop
    1704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1708:	8b 02                	mov    (%edx),%eax
    170a:	8b 48 04             	mov    0x4(%eax),%ecx
    170d:	39 f9                	cmp    %edi,%ecx
    170f:	73 47                	jae    1758 <malloc+0x98>
    1711:	39 05 74 1a 00 00    	cmp    %eax,0x1a74
    1717:	89 c2                	mov    %eax,%edx
    1719:	75 ed                	jne    1708 <malloc+0x48>
    171b:	83 ec 0c             	sub    $0xc,%esp
    171e:	56                   	push   %esi
    171f:	e8 26 fc ff ff       	call   134a <sbrk>
    1724:	83 c4 10             	add    $0x10,%esp
    1727:	83 f8 ff             	cmp    $0xffffffff,%eax
    172a:	74 1c                	je     1748 <malloc+0x88>
    172c:	89 58 04             	mov    %ebx,0x4(%eax)
    172f:	83 ec 0c             	sub    $0xc,%esp
    1732:	83 c0 08             	add    $0x8,%eax
    1735:	50                   	push   %eax
    1736:	e8 f5 fe ff ff       	call   1630 <free>
    173b:	8b 15 74 1a 00 00    	mov    0x1a74,%edx
    1741:	83 c4 10             	add    $0x10,%esp
    1744:	85 d2                	test   %edx,%edx
    1746:	75 c0                	jne    1708 <malloc+0x48>
    1748:	8d 65 f4             	lea    -0xc(%ebp),%esp
    174b:	31 c0                	xor    %eax,%eax
    174d:	5b                   	pop    %ebx
    174e:	5e                   	pop    %esi
    174f:	5f                   	pop    %edi
    1750:	5d                   	pop    %ebp
    1751:	c3                   	ret    
    1752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1758:	39 cf                	cmp    %ecx,%edi
    175a:	74 54                	je     17b0 <malloc+0xf0>
    175c:	29 f9                	sub    %edi,%ecx
    175e:	89 48 04             	mov    %ecx,0x4(%eax)
    1761:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1764:	89 78 04             	mov    %edi,0x4(%eax)
    1767:	89 15 74 1a 00 00    	mov    %edx,0x1a74
    176d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1770:	83 c0 08             	add    $0x8,%eax
    1773:	5b                   	pop    %ebx
    1774:	5e                   	pop    %esi
    1775:	5f                   	pop    %edi
    1776:	5d                   	pop    %ebp
    1777:	c3                   	ret    
    1778:	90                   	nop
    1779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1780:	c7 05 74 1a 00 00 78 	movl   $0x1a78,0x1a74
    1787:	1a 00 00 
    178a:	c7 05 78 1a 00 00 78 	movl   $0x1a78,0x1a78
    1791:	1a 00 00 
    1794:	b8 78 1a 00 00       	mov    $0x1a78,%eax
    1799:	c7 05 7c 1a 00 00 00 	movl   $0x0,0x1a7c
    17a0:	00 00 00 
    17a3:	e9 44 ff ff ff       	jmp    16ec <malloc+0x2c>
    17a8:	90                   	nop
    17a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17b0:	8b 08                	mov    (%eax),%ecx
    17b2:	89 0a                	mov    %ecx,(%edx)
    17b4:	eb b1                	jmp    1767 <malloc+0xa7>
