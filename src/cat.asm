
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  }
}

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	be 01 00 00 00       	mov    $0x1,%esi
    1016:	83 ec 18             	sub    $0x18,%esp
    1019:	8b 01                	mov    (%ecx),%eax
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1021:	83 f8 01             	cmp    $0x1,%eax
{
    1024:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(argc <= 1){
    1027:	7e 54                	jle    107d <main+0x7d>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 3d 05 00 00       	call   1579 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	85 c0                	test   %eax,%eax
    1041:	89 c7                	mov    %eax,%edi
    1043:	78 24                	js     1069 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    1045:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
    1048:	83 c6 01             	add    $0x1,%esi
    104b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
    104e:	50                   	push   %eax
    104f:	e8 3c 00 00 00       	call   1090 <cat>
    close(fd);
    1054:	89 3c 24             	mov    %edi,(%esp)
    1057:	e8 05 05 00 00       	call   1561 <close>
  for(i = 1; i < argc; i++){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1062:	75 cc                	jne    1030 <main+0x30>
  }
  exit();
    1064:	e8 d0 04 00 00       	call   1539 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
    1069:	50                   	push   %eax
    106a:	ff 33                	pushl  (%ebx)
    106c:	68 d3 18 00 00       	push   $0x18d3
    1071:	6a 01                	push   $0x1
    1073:	e8 48 06 00 00       	call   16c0 <printf>
      exit();
    1078:	e8 bc 04 00 00       	call   1539 <exit>
    cat(0);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	6a 00                	push   $0x0
    1082:	e8 09 00 00 00       	call   1090 <cat>
    exit();
    1087:	e8 ad 04 00 00       	call   1539 <exit>
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <cat>:
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	53                   	push   %ebx
    1095:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    1098:	eb 1d                	jmp    10b7 <cat+0x27>
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	53                   	push   %ebx
    10a4:	68 40 1c 00 00       	push   $0x1c40
    10a9:	6a 01                	push   $0x1
    10ab:	e8 a9 04 00 00       	call   1559 <write>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	39 d8                	cmp    %ebx,%eax
    10b5:	75 26                	jne    10dd <cat+0x4d>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10b7:	83 ec 04             	sub    $0x4,%esp
    10ba:	68 00 02 00 00       	push   $0x200
    10bf:	68 40 1c 00 00       	push   $0x1c40
    10c4:	56                   	push   %esi
    10c5:	e8 87 04 00 00       	call   1551 <read>
    10ca:	83 c4 10             	add    $0x10,%esp
    10cd:	83 f8 00             	cmp    $0x0,%eax
    10d0:	89 c3                	mov    %eax,%ebx
    10d2:	7f cc                	jg     10a0 <cat+0x10>
  if(n < 0){
    10d4:	75 1b                	jne    10f1 <cat+0x61>
}
    10d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d9:	5b                   	pop    %ebx
    10da:	5e                   	pop    %esi
    10db:	5d                   	pop    %ebp
    10dc:	c3                   	ret    
      printf(1, "cat: write error\n");
    10dd:	83 ec 08             	sub    $0x8,%esp
    10e0:	68 b0 18 00 00       	push   $0x18b0
    10e5:	6a 01                	push   $0x1
    10e7:	e8 d4 05 00 00       	call   16c0 <printf>
      exit();
    10ec:	e8 48 04 00 00       	call   1539 <exit>
    printf(1, "cat: read error\n");
    10f1:	50                   	push   %eax
    10f2:	50                   	push   %eax
    10f3:	68 c2 18 00 00       	push   $0x18c2
    10f8:	6a 01                	push   $0x1
    10fa:	e8 c1 05 00 00       	call   16c0 <printf>
    exit();
    10ff:	e8 35 04 00 00       	call   1539 <exit>
    1104:	66 90                	xchg   %ax,%ax
    1106:	66 90                	xchg   %ax,%ax
    1108:	66 90                	xchg   %ax,%ax
    110a:	66 90                	xchg   %ax,%ax
    110c:	66 90                	xchg   %ax,%ax
    110e:	66 90                	xchg   %ax,%ax

00001110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	53                   	push   %ebx
    1114:	8b 45 08             	mov    0x8(%ebp),%eax
    1117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    111a:	89 c2                	mov    %eax,%edx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1120:	83 c1 01             	add    $0x1,%ecx
    1123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1127:	83 c2 01             	add    $0x1,%edx
    112a:	84 db                	test   %bl,%bl
    112c:	88 5a ff             	mov    %bl,-0x1(%edx)
    112f:	75 ef                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    1131:	5b                   	pop    %ebx
    1132:	5d                   	pop    %ebp
    1133:	c3                   	ret    
    1134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    113a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114a:	0f b6 02             	movzbl (%edx),%eax
    114d:	0f b6 19             	movzbl (%ecx),%ebx
    1150:	84 c0                	test   %al,%al
    1152:	75 1c                	jne    1170 <strcmp+0x30>
    1154:	eb 2a                	jmp    1180 <strcmp+0x40>
    1156:	8d 76 00             	lea    0x0(%esi),%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1160:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1163:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1166:	83 c1 01             	add    $0x1,%ecx
    1169:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    116c:	84 c0                	test   %al,%al
    116e:	74 10                	je     1180 <strcmp+0x40>
    1170:	38 d8                	cmp    %bl,%al
    1172:	74 ec                	je     1160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1174:	29 d8                	sub    %ebx,%eax
}
    1176:	5b                   	pop    %ebx
    1177:	5d                   	pop    %ebp
    1178:	c3                   	ret    
    1179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1182:	29 d8                	sub    %ebx,%eax
}
    1184:	5b                   	pop    %ebx
    1185:	5d                   	pop    %ebp
    1186:	c3                   	ret    
    1187:	89 f6                	mov    %esi,%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <strlen>:

uint
strlen(const char *s)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1196:	80 39 00             	cmpb   $0x0,(%ecx)
    1199:	74 15                	je     11b0 <strlen+0x20>
    119b:	31 d2                	xor    %edx,%edx
    119d:	8d 76 00             	lea    0x0(%esi),%esi
    11a0:	83 c2 01             	add    $0x1,%edx
    11a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11a7:	89 d0                	mov    %edx,%eax
    11a9:	75 f5                	jne    11a0 <strlen+0x10>
    ;
  return n;
}
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    11b0:	31 c0                	xor    %eax,%eax
}
    11b2:	5d                   	pop    %ebp
    11b3:	c3                   	ret    
    11b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	57                   	push   %edi
    11c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cd:	89 d7                	mov    %edx,%edi
    11cf:	fc                   	cld    
    11d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11d2:	89 d0                	mov    %edx,%eax
    11d4:	5f                   	pop    %edi
    11d5:	5d                   	pop    %ebp
    11d6:	c3                   	ret    
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <strchr>:

char*
strchr(const char *s, char c)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	8b 45 08             	mov    0x8(%ebp),%eax
    11e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11ea:	0f b6 10             	movzbl (%eax),%edx
    11ed:	84 d2                	test   %dl,%dl
    11ef:	74 1d                	je     120e <strchr+0x2e>
    if(*s == c)
    11f1:	38 d3                	cmp    %dl,%bl
    11f3:	89 d9                	mov    %ebx,%ecx
    11f5:	75 0d                	jne    1204 <strchr+0x24>
    11f7:	eb 17                	jmp    1210 <strchr+0x30>
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	38 ca                	cmp    %cl,%dl
    1202:	74 0c                	je     1210 <strchr+0x30>
  for(; *s; s++)
    1204:	83 c0 01             	add    $0x1,%eax
    1207:	0f b6 10             	movzbl (%eax),%edx
    120a:	84 d2                	test   %dl,%dl
    120c:	75 f2                	jne    1200 <strchr+0x20>
      return (char*)s;
  return 0;
    120e:	31 c0                	xor    %eax,%eax
}
    1210:	5b                   	pop    %ebx
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret    
    1213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <gets>:

char*
gets(char *buf, int max)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	57                   	push   %edi
    1224:	56                   	push   %esi
    1225:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1226:	31 f6                	xor    %esi,%esi
    1228:	89 f3                	mov    %esi,%ebx
{
    122a:	83 ec 1c             	sub    $0x1c,%esp
    122d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1230:	eb 2f                	jmp    1261 <gets+0x41>
    1232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1238:	8d 45 e7             	lea    -0x19(%ebp),%eax
    123b:	83 ec 04             	sub    $0x4,%esp
    123e:	6a 01                	push   $0x1
    1240:	50                   	push   %eax
    1241:	6a 00                	push   $0x0
    1243:	e8 09 03 00 00       	call   1551 <read>
    if(cc < 1)
    1248:	83 c4 10             	add    $0x10,%esp
    124b:	85 c0                	test   %eax,%eax
    124d:	7e 1c                	jle    126b <gets+0x4b>
      break;
    buf[i++] = c;
    124f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1253:	83 c7 01             	add    $0x1,%edi
    1256:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1259:	3c 0a                	cmp    $0xa,%al
    125b:	74 23                	je     1280 <gets+0x60>
    125d:	3c 0d                	cmp    $0xd,%al
    125f:	74 1f                	je     1280 <gets+0x60>
  for(i=0; i+1 < max; ){
    1261:	83 c3 01             	add    $0x1,%ebx
    1264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1267:	89 fe                	mov    %edi,%esi
    1269:	7c cd                	jl     1238 <gets+0x18>
    126b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    126d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1270:	c6 03 00             	movb   $0x0,(%ebx)
}
    1273:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1276:	5b                   	pop    %ebx
    1277:	5e                   	pop    %esi
    1278:	5f                   	pop    %edi
    1279:	5d                   	pop    %ebp
    127a:	c3                   	ret    
    127b:	90                   	nop
    127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1280:	8b 75 08             	mov    0x8(%ebp),%esi
    1283:	8b 45 08             	mov    0x8(%ebp),%eax
    1286:	01 de                	add    %ebx,%esi
    1288:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    128a:	c6 03 00             	movb   $0x0,(%ebx)
}
    128d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1290:	5b                   	pop    %ebx
    1291:	5e                   	pop    %esi
    1292:	5f                   	pop    %edi
    1293:	5d                   	pop    %ebp
    1294:	c3                   	ret    
    1295:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012a0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12a5:	83 ec 08             	sub    $0x8,%esp
    12a8:	6a 00                	push   $0x0
    12aa:	ff 75 08             	pushl  0x8(%ebp)
    12ad:	e8 c7 02 00 00       	call   1579 <open>
  if(fd < 0)
    12b2:	83 c4 10             	add    $0x10,%esp
    12b5:	85 c0                	test   %eax,%eax
    12b7:	78 27                	js     12e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12b9:	83 ec 08             	sub    $0x8,%esp
    12bc:	ff 75 0c             	pushl  0xc(%ebp)
    12bf:	89 c3                	mov    %eax,%ebx
    12c1:	50                   	push   %eax
    12c2:	e8 ca 02 00 00       	call   1591 <fstat>
  close(fd);
    12c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12ca:	89 c6                	mov    %eax,%esi
  close(fd);
    12cc:	e8 90 02 00 00       	call   1561 <close>
  return r;
    12d1:	83 c4 10             	add    $0x10,%esp
}
    12d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12d7:	89 f0                	mov    %esi,%eax
    12d9:	5b                   	pop    %ebx
    12da:	5e                   	pop    %esi
    12db:	5d                   	pop    %ebp
    12dc:	c3                   	ret    
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12e5:	eb ed                	jmp    12d4 <stat+0x34>
    12e7:	89 f6                	mov    %esi,%esi
    12e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012f0 <atoi>:

int
atoi(const char *s)
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	53                   	push   %ebx
    12f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12f7:	0f be 11             	movsbl (%ecx),%edx
    12fa:	8d 42 d0             	lea    -0x30(%edx),%eax
    12fd:	3c 09                	cmp    $0x9,%al
  n = 0;
    12ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1304:	77 1f                	ja     1325 <atoi+0x35>
    1306:	8d 76 00             	lea    0x0(%esi),%esi
    1309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1310:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1313:	83 c1 01             	add    $0x1,%ecx
    1316:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    131a:	0f be 11             	movsbl (%ecx),%edx
    131d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1320:	80 fb 09             	cmp    $0x9,%bl
    1323:	76 eb                	jbe    1310 <atoi+0x20>
  return n;
}
    1325:	5b                   	pop    %ebx
    1326:	5d                   	pop    %ebp
    1327:	c3                   	ret    
    1328:	90                   	nop
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	56                   	push   %esi
    1334:	53                   	push   %ebx
    1335:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1338:	8b 45 08             	mov    0x8(%ebp),%eax
    133b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    133e:	85 db                	test   %ebx,%ebx
    1340:	7e 14                	jle    1356 <memmove+0x26>
    1342:	31 d2                	xor    %edx,%edx
    1344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    134c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    134f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1352:	39 d3                	cmp    %edx,%ebx
    1354:	75 f2                	jne    1348 <memmove+0x18>
  return vdst;
}
    1356:	5b                   	pop    %ebx
    1357:	5e                   	pop    %esi
    1358:	5d                   	pop    %ebp
    1359:	c3                   	ret    
    135a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001360 <thread_join>:
  
  return clone(start_routine, arg, stack);
}

int thread_join()
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    1366:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1369:	50                   	push   %eax
    136a:	e8 a2 02 00 00       	call   1611 <join>
  return x;
}
    136f:	c9                   	leave  
    1370:	c3                   	ret    
    1371:	eb 0d                	jmp    1380 <free>
    1373:	90                   	nop
    1374:	90                   	nop
    1375:	90                   	nop
    1376:	90                   	nop
    1377:	90                   	nop
    1378:	90                   	nop
    1379:	90                   	nop
    137a:	90                   	nop
    137b:	90                   	nop
    137c:	90                   	nop
    137d:	90                   	nop
    137e:	90                   	nop
    137f:	90                   	nop

00001380 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1380:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1381:	a1 20 1c 00 00       	mov    0x1c20,%eax
{
    1386:	89 e5                	mov    %esp,%ebp
    1388:	57                   	push   %edi
    1389:	56                   	push   %esi
    138a:	53                   	push   %ebx
    138b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    138e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1398:	39 c8                	cmp    %ecx,%eax
    139a:	8b 10                	mov    (%eax),%edx
    139c:	73 32                	jae    13d0 <free+0x50>
    139e:	39 d1                	cmp    %edx,%ecx
    13a0:	72 04                	jb     13a6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13a2:	39 d0                	cmp    %edx,%eax
    13a4:	72 32                	jb     13d8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    13a6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    13a9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    13ac:	39 fa                	cmp    %edi,%edx
    13ae:	74 30                	je     13e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    13b0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13b3:	8b 50 04             	mov    0x4(%eax),%edx
    13b6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13b9:	39 f1                	cmp    %esi,%ecx
    13bb:	74 3a                	je     13f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    13bd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    13bf:	a3 20 1c 00 00       	mov    %eax,0x1c20
}
    13c4:	5b                   	pop    %ebx
    13c5:	5e                   	pop    %esi
    13c6:	5f                   	pop    %edi
    13c7:	5d                   	pop    %ebp
    13c8:	c3                   	ret    
    13c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13d0:	39 d0                	cmp    %edx,%eax
    13d2:	72 04                	jb     13d8 <free+0x58>
    13d4:	39 d1                	cmp    %edx,%ecx
    13d6:	72 ce                	jb     13a6 <free+0x26>
{
    13d8:	89 d0                	mov    %edx,%eax
    13da:	eb bc                	jmp    1398 <free+0x18>
    13dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    13e0:	03 72 04             	add    0x4(%edx),%esi
    13e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    13e6:	8b 10                	mov    (%eax),%edx
    13e8:	8b 12                	mov    (%edx),%edx
    13ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13ed:	8b 50 04             	mov    0x4(%eax),%edx
    13f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13f3:	39 f1                	cmp    %esi,%ecx
    13f5:	75 c6                	jne    13bd <free+0x3d>
    p->s.size += bp->s.size;
    13f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    13fa:	a3 20 1c 00 00       	mov    %eax,0x1c20
    p->s.size += bp->s.size;
    13ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1402:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1405:	89 10                	mov    %edx,(%eax)
}
    1407:	5b                   	pop    %ebx
    1408:	5e                   	pop    %esi
    1409:	5f                   	pop    %edi
    140a:	5d                   	pop    %ebp
    140b:	c3                   	ret    
    140c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001410 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	56                   	push   %esi
    1415:	53                   	push   %ebx
    1416:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1419:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    141c:	8b 15 20 1c 00 00    	mov    0x1c20,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1422:	8d 78 07             	lea    0x7(%eax),%edi
    1425:	c1 ef 03             	shr    $0x3,%edi
    1428:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    142b:	85 d2                	test   %edx,%edx
    142d:	0f 84 9d 00 00 00    	je     14d0 <malloc+0xc0>
    1433:	8b 02                	mov    (%edx),%eax
    1435:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1438:	39 cf                	cmp    %ecx,%edi
    143a:	76 6c                	jbe    14a8 <malloc+0x98>
    143c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1442:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1447:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    144a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1451:	eb 0e                	jmp    1461 <malloc+0x51>
    1453:	90                   	nop
    1454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1458:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    145a:	8b 48 04             	mov    0x4(%eax),%ecx
    145d:	39 f9                	cmp    %edi,%ecx
    145f:	73 47                	jae    14a8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1461:	39 05 20 1c 00 00    	cmp    %eax,0x1c20
    1467:	89 c2                	mov    %eax,%edx
    1469:	75 ed                	jne    1458 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    146b:	83 ec 0c             	sub    $0xc,%esp
    146e:	56                   	push   %esi
    146f:	e8 4d 01 00 00       	call   15c1 <sbrk>
  if(p == (char*)-1)
    1474:	83 c4 10             	add    $0x10,%esp
    1477:	83 f8 ff             	cmp    $0xffffffff,%eax
    147a:	74 1c                	je     1498 <malloc+0x88>
  hp->s.size = nu;
    147c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    147f:	83 ec 0c             	sub    $0xc,%esp
    1482:	83 c0 08             	add    $0x8,%eax
    1485:	50                   	push   %eax
    1486:	e8 f5 fe ff ff       	call   1380 <free>
  return freep;
    148b:	8b 15 20 1c 00 00    	mov    0x1c20,%edx
      if((p = morecore(nunits)) == 0)
    1491:	83 c4 10             	add    $0x10,%esp
    1494:	85 d2                	test   %edx,%edx
    1496:	75 c0                	jne    1458 <malloc+0x48>
        return 0;
  }
    1498:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    149b:	31 c0                	xor    %eax,%eax
    149d:	5b                   	pop    %ebx
    149e:	5e                   	pop    %esi
    149f:	5f                   	pop    %edi
    14a0:	5d                   	pop    %ebp
    14a1:	c3                   	ret    
    14a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    14a8:	39 cf                	cmp    %ecx,%edi
    14aa:	74 54                	je     1500 <malloc+0xf0>
        p->s.size -= nunits;
    14ac:	29 f9                	sub    %edi,%ecx
    14ae:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    14b1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    14b4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    14b7:	89 15 20 1c 00 00    	mov    %edx,0x1c20
    14bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    14c0:	83 c0 08             	add    $0x8,%eax
    14c3:	5b                   	pop    %ebx
    14c4:	5e                   	pop    %esi
    14c5:	5f                   	pop    %edi
    14c6:	5d                   	pop    %ebp
    14c7:	c3                   	ret    
    14c8:	90                   	nop
    14c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    14d0:	c7 05 20 1c 00 00 24 	movl   $0x1c24,0x1c20
    14d7:	1c 00 00 
    14da:	c7 05 24 1c 00 00 24 	movl   $0x1c24,0x1c24
    14e1:	1c 00 00 
    base.s.size = 0;
    14e4:	b8 24 1c 00 00       	mov    $0x1c24,%eax
    14e9:	c7 05 28 1c 00 00 00 	movl   $0x0,0x1c28
    14f0:	00 00 00 
    14f3:	e9 44 ff ff ff       	jmp    143c <malloc+0x2c>
    14f8:	90                   	nop
    14f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1500:	8b 08                	mov    (%eax),%ecx
    1502:	89 0a                	mov    %ecx,(%edx)
    1504:	eb b1                	jmp    14b7 <malloc+0xa7>
    1506:	8d 76 00             	lea    0x0(%esi),%esi
    1509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001510 <thread_create>:
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(4096);
    1516:	68 00 10 00 00       	push   $0x1000
    151b:	e8 f0 fe ff ff       	call   1410 <malloc>
  return clone(start_routine, arg, stack);
    1520:	83 c4 0c             	add    $0xc,%esp
    1523:	50                   	push   %eax
    1524:	ff 75 0c             	pushl  0xc(%ebp)
    1527:	ff 75 08             	pushl  0x8(%ebp)
    152a:	e8 da 00 00 00       	call   1609 <clone>
}
    152f:	c9                   	leave  
    1530:	c3                   	ret    

00001531 <fork>:
    1531:	b8 01 00 00 00       	mov    $0x1,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <exit>:
    1539:	b8 02 00 00 00       	mov    $0x2,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <wait>:
    1541:	b8 03 00 00 00       	mov    $0x3,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <pipe>:
    1549:	b8 04 00 00 00       	mov    $0x4,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    

00001551 <read>:
    1551:	b8 05 00 00 00       	mov    $0x5,%eax
    1556:	cd 40                	int    $0x40
    1558:	c3                   	ret    

00001559 <write>:
    1559:	b8 10 00 00 00       	mov    $0x10,%eax
    155e:	cd 40                	int    $0x40
    1560:	c3                   	ret    

00001561 <close>:
    1561:	b8 15 00 00 00       	mov    $0x15,%eax
    1566:	cd 40                	int    $0x40
    1568:	c3                   	ret    

00001569 <kill>:
    1569:	b8 06 00 00 00       	mov    $0x6,%eax
    156e:	cd 40                	int    $0x40
    1570:	c3                   	ret    

00001571 <exec>:
    1571:	b8 07 00 00 00       	mov    $0x7,%eax
    1576:	cd 40                	int    $0x40
    1578:	c3                   	ret    

00001579 <open>:
    1579:	b8 0f 00 00 00       	mov    $0xf,%eax
    157e:	cd 40                	int    $0x40
    1580:	c3                   	ret    

00001581 <mknod>:
    1581:	b8 11 00 00 00       	mov    $0x11,%eax
    1586:	cd 40                	int    $0x40
    1588:	c3                   	ret    

00001589 <unlink>:
    1589:	b8 12 00 00 00       	mov    $0x12,%eax
    158e:	cd 40                	int    $0x40
    1590:	c3                   	ret    

00001591 <fstat>:
    1591:	b8 08 00 00 00       	mov    $0x8,%eax
    1596:	cd 40                	int    $0x40
    1598:	c3                   	ret    

00001599 <link>:
    1599:	b8 13 00 00 00       	mov    $0x13,%eax
    159e:	cd 40                	int    $0x40
    15a0:	c3                   	ret    

000015a1 <mkdir>:
    15a1:	b8 14 00 00 00       	mov    $0x14,%eax
    15a6:	cd 40                	int    $0x40
    15a8:	c3                   	ret    

000015a9 <chdir>:
    15a9:	b8 09 00 00 00       	mov    $0x9,%eax
    15ae:	cd 40                	int    $0x40
    15b0:	c3                   	ret    

000015b1 <dup>:
    15b1:	b8 0a 00 00 00       	mov    $0xa,%eax
    15b6:	cd 40                	int    $0x40
    15b8:	c3                   	ret    

000015b9 <getpid>:
    15b9:	b8 0b 00 00 00       	mov    $0xb,%eax
    15be:	cd 40                	int    $0x40
    15c0:	c3                   	ret    

000015c1 <sbrk>:
    15c1:	b8 0c 00 00 00       	mov    $0xc,%eax
    15c6:	cd 40                	int    $0x40
    15c8:	c3                   	ret    

000015c9 <sleep>:
    15c9:	b8 0d 00 00 00       	mov    $0xd,%eax
    15ce:	cd 40                	int    $0x40
    15d0:	c3                   	ret    

000015d1 <uptime>:
    15d1:	b8 0e 00 00 00       	mov    $0xe,%eax
    15d6:	cd 40                	int    $0x40
    15d8:	c3                   	ret    

000015d9 <getreadcount>:
    15d9:	b8 16 00 00 00       	mov    $0x16,%eax
    15de:	cd 40                	int    $0x40
    15e0:	c3                   	ret    

000015e1 <gettime>:
    15e1:	b8 17 00 00 00       	mov    $0x17,%eax
    15e6:	cd 40                	int    $0x40
    15e8:	c3                   	ret    

000015e9 <settickets>:
    15e9:	b8 18 00 00 00       	mov    $0x18,%eax
    15ee:	cd 40                	int    $0x40
    15f0:	c3                   	ret    

000015f1 <getpinfo>:
    15f1:	b8 19 00 00 00       	mov    $0x19,%eax
    15f6:	cd 40                	int    $0x40
    15f8:	c3                   	ret    

000015f9 <mprotect>:
    15f9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    15fe:	cd 40                	int    $0x40
    1600:	c3                   	ret    

00001601 <munprotect>:
    1601:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1606:	cd 40                	int    $0x40
    1608:	c3                   	ret    

00001609 <clone>:
    1609:	b8 1c 00 00 00       	mov    $0x1c,%eax
    160e:	cd 40                	int    $0x40
    1610:	c3                   	ret    

00001611 <join>:
    1611:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1616:	cd 40                	int    $0x40
    1618:	c3                   	ret    
    1619:	66 90                	xchg   %ax,%ax
    161b:	66 90                	xchg   %ax,%ax
    161d:	66 90                	xchg   %ax,%ax
    161f:	90                   	nop

00001620 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	57                   	push   %edi
    1624:	56                   	push   %esi
    1625:	53                   	push   %ebx
    1626:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1629:	85 d2                	test   %edx,%edx
{
    162b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    162e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1630:	79 76                	jns    16a8 <printint+0x88>
    1632:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1636:	74 70                	je     16a8 <printint+0x88>
    x = -xx;
    1638:	f7 d8                	neg    %eax
    neg = 1;
    163a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1641:	31 f6                	xor    %esi,%esi
    1643:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1646:	eb 0a                	jmp    1652 <printint+0x32>
    1648:	90                   	nop
    1649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1650:	89 fe                	mov    %edi,%esi
    1652:	31 d2                	xor    %edx,%edx
    1654:	8d 7e 01             	lea    0x1(%esi),%edi
    1657:	f7 f1                	div    %ecx
    1659:	0f b6 92 f0 18 00 00 	movzbl 0x18f0(%edx),%edx
  }while((x /= base) != 0);
    1660:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1662:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1665:	75 e9                	jne    1650 <printint+0x30>
  if(neg)
    1667:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    166a:	85 c0                	test   %eax,%eax
    166c:	74 08                	je     1676 <printint+0x56>
    buf[i++] = '-';
    166e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1673:	8d 7e 02             	lea    0x2(%esi),%edi
    1676:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    167a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    167d:	8d 76 00             	lea    0x0(%esi),%esi
    1680:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1683:	83 ec 04             	sub    $0x4,%esp
    1686:	83 ee 01             	sub    $0x1,%esi
    1689:	6a 01                	push   $0x1
    168b:	53                   	push   %ebx
    168c:	57                   	push   %edi
    168d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1690:	e8 c4 fe ff ff       	call   1559 <write>

  while(--i >= 0)
    1695:	83 c4 10             	add    $0x10,%esp
    1698:	39 de                	cmp    %ebx,%esi
    169a:	75 e4                	jne    1680 <printint+0x60>
    putc(fd, buf[i]);
}
    169c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    169f:	5b                   	pop    %ebx
    16a0:	5e                   	pop    %esi
    16a1:	5f                   	pop    %edi
    16a2:	5d                   	pop    %ebp
    16a3:	c3                   	ret    
    16a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    16a8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    16af:	eb 90                	jmp    1641 <printint+0x21>
    16b1:	eb 0d                	jmp    16c0 <printf>
    16b3:	90                   	nop
    16b4:	90                   	nop
    16b5:	90                   	nop
    16b6:	90                   	nop
    16b7:	90                   	nop
    16b8:	90                   	nop
    16b9:	90                   	nop
    16ba:	90                   	nop
    16bb:	90                   	nop
    16bc:	90                   	nop
    16bd:	90                   	nop
    16be:	90                   	nop
    16bf:	90                   	nop

000016c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    16c0:	55                   	push   %ebp
    16c1:	89 e5                	mov    %esp,%ebp
    16c3:	57                   	push   %edi
    16c4:	56                   	push   %esi
    16c5:	53                   	push   %ebx
    16c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16c9:	8b 75 0c             	mov    0xc(%ebp),%esi
    16cc:	0f b6 1e             	movzbl (%esi),%ebx
    16cf:	84 db                	test   %bl,%bl
    16d1:	0f 84 bf 00 00 00    	je     1796 <printf+0xd6>
    16d7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    16da:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    16dd:	31 d2                	xor    %edx,%edx
    16df:	eb 39                	jmp    171a <printf+0x5a>
    16e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    16e8:	83 f8 25             	cmp    $0x25,%eax
    16eb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    16ee:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    16f3:	74 1a                	je     170f <printf+0x4f>
  write(fd, &c, 1);
    16f5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    16f8:	83 ec 04             	sub    $0x4,%esp
    16fb:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    16fe:	6a 01                	push   $0x1
    1700:	50                   	push   %eax
    1701:	ff 75 08             	pushl  0x8(%ebp)
    1704:	e8 50 fe ff ff       	call   1559 <write>
    1709:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    170c:	83 c4 10             	add    $0x10,%esp
    170f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1712:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1716:	84 db                	test   %bl,%bl
    1718:	74 7c                	je     1796 <printf+0xd6>
    if(state == 0){
    171a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    171c:	0f be cb             	movsbl %bl,%ecx
    171f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1722:	74 c4                	je     16e8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1724:	83 fa 25             	cmp    $0x25,%edx
    1727:	75 e6                	jne    170f <printf+0x4f>
      if(c == 'd'){
    1729:	83 f8 64             	cmp    $0x64,%eax
    172c:	0f 84 a6 00 00 00    	je     17d8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1732:	83 f8 6c             	cmp    $0x6c,%eax
    1735:	0f 84 ad 00 00 00    	je     17e8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    173b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1741:	83 f9 70             	cmp    $0x70,%ecx
    1744:	74 5a                	je     17a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1746:	83 f8 73             	cmp    $0x73,%eax
    1749:	0f 84 e1 00 00 00    	je     1830 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    174f:	83 f8 63             	cmp    $0x63,%eax
    1752:	0f 84 28 01 00 00    	je     1880 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1758:	83 f8 25             	cmp    $0x25,%eax
    175b:	74 6b                	je     17c8 <printf+0x108>
  write(fd, &c, 1);
    175d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1760:	83 ec 04             	sub    $0x4,%esp
    1763:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1767:	6a 01                	push   $0x1
    1769:	50                   	push   %eax
    176a:	ff 75 08             	pushl  0x8(%ebp)
    176d:	e8 e7 fd ff ff       	call   1559 <write>
    1772:	83 c4 0c             	add    $0xc,%esp
    1775:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1778:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    177b:	6a 01                	push   $0x1
    177d:	50                   	push   %eax
    177e:	ff 75 08             	pushl  0x8(%ebp)
    1781:	83 c6 01             	add    $0x1,%esi
    1784:	e8 d0 fd ff ff       	call   1559 <write>
  for(i = 0; fmt[i]; i++){
    1789:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    178d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1790:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1792:	84 db                	test   %bl,%bl
    1794:	75 84                	jne    171a <printf+0x5a>
    }
  }
}
    1796:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1799:	5b                   	pop    %ebx
    179a:	5e                   	pop    %esi
    179b:	5f                   	pop    %edi
    179c:	5d                   	pop    %ebp
    179d:	c3                   	ret    
    179e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    17a0:	83 ec 0c             	sub    $0xc,%esp
    17a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    17a8:	6a 00                	push   $0x0
    17aa:	8b 17                	mov    (%edi),%edx
    17ac:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    17af:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    17b2:	e8 69 fe ff ff       	call   1620 <printint>
    17b7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17ba:	31 d2                	xor    %edx,%edx
    17bc:	e9 4e ff ff ff       	jmp    170f <printf+0x4f>
    17c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    17c8:	83 ec 04             	sub    $0x4,%esp
    17cb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    17ce:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    17d1:	6a 01                	push   $0x1
    17d3:	eb a8                	jmp    177d <printf+0xbd>
    17d5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    17d8:	83 ec 0c             	sub    $0xc,%esp
    17db:	b9 0a 00 00 00       	mov    $0xa,%ecx
    17e0:	6a 01                	push   $0x1
    17e2:	eb c6                	jmp    17aa <printf+0xea>
    17e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    17e8:	8b 57 04             	mov    0x4(%edi),%edx
    17eb:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    17ed:	85 d2                	test   %edx,%edx
    17ef:	74 15                	je     1806 <printf+0x146>
    17f1:	83 ec 0c             	sub    $0xc,%esp
    17f4:	8b 45 08             	mov    0x8(%ebp),%eax
    17f7:	b9 10 00 00 00       	mov    $0x10,%ecx
    17fc:	6a 00                	push   $0x0
    17fe:	e8 1d fe ff ff       	call   1620 <printint>
    1803:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1806:	83 ec 0c             	sub    $0xc,%esp
    1809:	8b 45 08             	mov    0x8(%ebp),%eax
    180c:	89 da                	mov    %ebx,%edx
    180e:	6a 00                	push   $0x0
    1810:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1815:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1818:	e8 03 fe ff ff       	call   1620 <printint>
    181d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1820:	31 d2                	xor    %edx,%edx
    1822:	e9 e8 fe ff ff       	jmp    170f <printf+0x4f>
    1827:	89 f6                	mov    %esi,%esi
    1829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1830:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1832:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1835:	85 c9                	test   %ecx,%ecx
    1837:	74 6a                	je     18a3 <printf+0x1e3>
        while(*s != 0){
    1839:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    183c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    183e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1840:	84 c0                	test   %al,%al
    1842:	0f 84 c7 fe ff ff    	je     170f <printf+0x4f>
    1848:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    184b:	89 de                	mov    %ebx,%esi
    184d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1850:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1853:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1856:	83 ec 04             	sub    $0x4,%esp
    1859:	6a 01                	push   $0x1
          s++;
    185b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    185e:	50                   	push   %eax
    185f:	53                   	push   %ebx
    1860:	e8 f4 fc ff ff       	call   1559 <write>
        while(*s != 0){
    1865:	0f b6 06             	movzbl (%esi),%eax
    1868:	83 c4 10             	add    $0x10,%esp
    186b:	84 c0                	test   %al,%al
    186d:	75 e1                	jne    1850 <printf+0x190>
    186f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1872:	31 d2                	xor    %edx,%edx
    1874:	e9 96 fe ff ff       	jmp    170f <printf+0x4f>
    1879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1880:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1882:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1885:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1888:	6a 01                	push   $0x1
        putc(fd, *ap);
    188a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    188d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1890:	50                   	push   %eax
    1891:	ff 75 08             	pushl  0x8(%ebp)
    1894:	e8 c0 fc ff ff       	call   1559 <write>
    1899:	83 c4 10             	add    $0x10,%esp
      state = 0;
    189c:	31 d2                	xor    %edx,%edx
    189e:	e9 6c fe ff ff       	jmp    170f <printf+0x4f>
          s = "(null)";
    18a3:	bb e8 18 00 00       	mov    $0x18e8,%ebx
        while(*s != 0){
    18a8:	b8 28 00 00 00       	mov    $0x28,%eax
    18ad:	eb 99                	jmp    1848 <printf+0x188>
