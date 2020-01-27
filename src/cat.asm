
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
    1037:	e8 66 03 00 00       	call   13a2 <open>
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
    1057:	e8 2e 03 00 00       	call   138a <close>
  for(i = 1; i < argc; i++){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1062:	75 cc                	jne    1030 <main+0x30>
  }
  exit();
    1064:	e8 f9 02 00 00       	call   1362 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
    1069:	50                   	push   %eax
    106a:	ff 33                	pushl  (%ebx)
    106c:	68 6b 18 00 00       	push   $0x186b
    1071:	6a 01                	push   $0x1
    1073:	e8 58 04 00 00       	call   14d0 <printf>
      exit();
    1078:	e8 e5 02 00 00       	call   1362 <exit>
    cat(0);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	6a 00                	push   $0x0
    1082:	e8 09 00 00 00       	call   1090 <cat>
    exit();
    1087:	e8 d6 02 00 00       	call   1362 <exit>
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
    10a4:	68 a0 1b 00 00       	push   $0x1ba0
    10a9:	6a 01                	push   $0x1
    10ab:	e8 d2 02 00 00       	call   1382 <write>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	39 d8                	cmp    %ebx,%eax
    10b5:	75 26                	jne    10dd <cat+0x4d>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10b7:	83 ec 04             	sub    $0x4,%esp
    10ba:	68 00 02 00 00       	push   $0x200
    10bf:	68 a0 1b 00 00       	push   $0x1ba0
    10c4:	56                   	push   %esi
    10c5:	e8 b0 02 00 00       	call   137a <read>
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
    10e0:	68 48 18 00 00       	push   $0x1848
    10e5:	6a 01                	push   $0x1
    10e7:	e8 e4 03 00 00       	call   14d0 <printf>
      exit();
    10ec:	e8 71 02 00 00       	call   1362 <exit>
    printf(1, "cat: read error\n");
    10f1:	50                   	push   %eax
    10f2:	50                   	push   %eax
    10f3:	68 5a 18 00 00       	push   $0x185a
    10f8:	6a 01                	push   $0x1
    10fa:	e8 d1 03 00 00       	call   14d0 <printf>
    exit();
    10ff:	e8 5e 02 00 00       	call   1362 <exit>
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
    1243:	e8 32 01 00 00       	call   137a <read>
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
    12ad:	e8 f0 00 00 00       	call   13a2 <open>
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
    12c2:	e8 f3 00 00 00       	call   13ba <fstat>
  close(fd);
    12c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12ca:	89 c6                	mov    %eax,%esi
  close(fd);
    12cc:	e8 b9 00 00 00       	call   138a <close>
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

0000135a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    135a:	b8 01 00 00 00       	mov    $0x1,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <exit>:
SYSCALL(exit)
    1362:	b8 02 00 00 00       	mov    $0x2,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <wait>:
SYSCALL(wait)
    136a:	b8 03 00 00 00       	mov    $0x3,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <pipe>:
SYSCALL(pipe)
    1372:	b8 04 00 00 00       	mov    $0x4,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <read>:
SYSCALL(read)
    137a:	b8 05 00 00 00       	mov    $0x5,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <write>:
SYSCALL(write)
    1382:	b8 10 00 00 00       	mov    $0x10,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <close>:
SYSCALL(close)
    138a:	b8 15 00 00 00       	mov    $0x15,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <kill>:
SYSCALL(kill)
    1392:	b8 06 00 00 00       	mov    $0x6,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <exec>:
SYSCALL(exec)
    139a:	b8 07 00 00 00       	mov    $0x7,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <open>:
SYSCALL(open)
    13a2:	b8 0f 00 00 00       	mov    $0xf,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <mknod>:
SYSCALL(mknod)
    13aa:	b8 11 00 00 00       	mov    $0x11,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <unlink>:
SYSCALL(unlink)
    13b2:	b8 12 00 00 00       	mov    $0x12,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <fstat>:
SYSCALL(fstat)
    13ba:	b8 08 00 00 00       	mov    $0x8,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <link>:
SYSCALL(link)
    13c2:	b8 13 00 00 00       	mov    $0x13,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <mkdir>:
SYSCALL(mkdir)
    13ca:	b8 14 00 00 00       	mov    $0x14,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <chdir>:
SYSCALL(chdir)
    13d2:	b8 09 00 00 00       	mov    $0x9,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <dup>:
SYSCALL(dup)
    13da:	b8 0a 00 00 00       	mov    $0xa,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <getpid>:
SYSCALL(getpid)
    13e2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <sbrk>:
SYSCALL(sbrk)
    13ea:	b8 0c 00 00 00       	mov    $0xc,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <sleep>:
SYSCALL(sleep)
    13f2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <uptime>:
SYSCALL(uptime)
    13fa:	b8 0e 00 00 00       	mov    $0xe,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <getreadcount>:
SYSCALL(getreadcount)
    1402:	b8 16 00 00 00       	mov    $0x16,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <gettime>:
SYSCALL(gettime)
    140a:	b8 17 00 00 00       	mov    $0x17,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    

00001412 <settickets>:
SYSCALL(settickets)
    1412:	b8 18 00 00 00       	mov    $0x18,%eax
    1417:	cd 40                	int    $0x40
    1419:	c3                   	ret    

0000141a <getpinfo>:
    141a:	b8 19 00 00 00       	mov    $0x19,%eax
    141f:	cd 40                	int    $0x40
    1421:	c3                   	ret    
    1422:	66 90                	xchg   %ax,%ax
    1424:	66 90                	xchg   %ax,%ax
    1426:	66 90                	xchg   %ax,%ax
    1428:	66 90                	xchg   %ax,%ax
    142a:	66 90                	xchg   %ax,%ax
    142c:	66 90                	xchg   %ax,%ax
    142e:	66 90                	xchg   %ax,%ax

00001430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1439:	85 d2                	test   %edx,%edx
{
    143b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    143e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1440:	79 76                	jns    14b8 <printint+0x88>
    1442:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1446:	74 70                	je     14b8 <printint+0x88>
    x = -xx;
    1448:	f7 d8                	neg    %eax
    neg = 1;
    144a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1451:	31 f6                	xor    %esi,%esi
    1453:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1456:	eb 0a                	jmp    1462 <printint+0x32>
    1458:	90                   	nop
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1460:	89 fe                	mov    %edi,%esi
    1462:	31 d2                	xor    %edx,%edx
    1464:	8d 7e 01             	lea    0x1(%esi),%edi
    1467:	f7 f1                	div    %ecx
    1469:	0f b6 92 88 18 00 00 	movzbl 0x1888(%edx),%edx
  }while((x /= base) != 0);
    1470:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1472:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1475:	75 e9                	jne    1460 <printint+0x30>
  if(neg)
    1477:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    147a:	85 c0                	test   %eax,%eax
    147c:	74 08                	je     1486 <printint+0x56>
    buf[i++] = '-';
    147e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1483:	8d 7e 02             	lea    0x2(%esi),%edi
    1486:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    148a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    148d:	8d 76 00             	lea    0x0(%esi),%esi
    1490:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1493:	83 ec 04             	sub    $0x4,%esp
    1496:	83 ee 01             	sub    $0x1,%esi
    1499:	6a 01                	push   $0x1
    149b:	53                   	push   %ebx
    149c:	57                   	push   %edi
    149d:	88 45 d7             	mov    %al,-0x29(%ebp)
    14a0:	e8 dd fe ff ff       	call   1382 <write>

  while(--i >= 0)
    14a5:	83 c4 10             	add    $0x10,%esp
    14a8:	39 de                	cmp    %ebx,%esi
    14aa:	75 e4                	jne    1490 <printint+0x60>
    putc(fd, buf[i]);
}
    14ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14af:	5b                   	pop    %ebx
    14b0:	5e                   	pop    %esi
    14b1:	5f                   	pop    %edi
    14b2:	5d                   	pop    %ebp
    14b3:	c3                   	ret    
    14b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14b8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    14bf:	eb 90                	jmp    1451 <printint+0x21>
    14c1:	eb 0d                	jmp    14d0 <printf>
    14c3:	90                   	nop
    14c4:	90                   	nop
    14c5:	90                   	nop
    14c6:	90                   	nop
    14c7:	90                   	nop
    14c8:	90                   	nop
    14c9:	90                   	nop
    14ca:	90                   	nop
    14cb:	90                   	nop
    14cc:	90                   	nop
    14cd:	90                   	nop
    14ce:	90                   	nop
    14cf:	90                   	nop

000014d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	57                   	push   %edi
    14d4:	56                   	push   %esi
    14d5:	53                   	push   %ebx
    14d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14d9:	8b 75 0c             	mov    0xc(%ebp),%esi
    14dc:	0f b6 1e             	movzbl (%esi),%ebx
    14df:	84 db                	test   %bl,%bl
    14e1:	0f 84 bf 00 00 00    	je     15a6 <printf+0xd6>
    14e7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    14ea:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    14ed:	31 d2                	xor    %edx,%edx
    14ef:	eb 39                	jmp    152a <printf+0x5a>
    14f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14f8:	83 f8 25             	cmp    $0x25,%eax
    14fb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    14fe:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1503:	74 1a                	je     151f <printf+0x4f>
  write(fd, &c, 1);
    1505:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1508:	83 ec 04             	sub    $0x4,%esp
    150b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    150e:	6a 01                	push   $0x1
    1510:	50                   	push   %eax
    1511:	ff 75 08             	pushl  0x8(%ebp)
    1514:	e8 69 fe ff ff       	call   1382 <write>
    1519:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    151c:	83 c4 10             	add    $0x10,%esp
    151f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1522:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1526:	84 db                	test   %bl,%bl
    1528:	74 7c                	je     15a6 <printf+0xd6>
    if(state == 0){
    152a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    152c:	0f be cb             	movsbl %bl,%ecx
    152f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1532:	74 c4                	je     14f8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1534:	83 fa 25             	cmp    $0x25,%edx
    1537:	75 e6                	jne    151f <printf+0x4f>
      if(c == 'd'){
    1539:	83 f8 64             	cmp    $0x64,%eax
    153c:	0f 84 a6 00 00 00    	je     15e8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1542:	83 f8 6c             	cmp    $0x6c,%eax
    1545:	0f 84 ad 00 00 00    	je     15f8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    154b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1551:	83 f9 70             	cmp    $0x70,%ecx
    1554:	74 5a                	je     15b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1556:	83 f8 73             	cmp    $0x73,%eax
    1559:	0f 84 e1 00 00 00    	je     1640 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    155f:	83 f8 63             	cmp    $0x63,%eax
    1562:	0f 84 28 01 00 00    	je     1690 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1568:	83 f8 25             	cmp    $0x25,%eax
    156b:	74 6b                	je     15d8 <printf+0x108>
  write(fd, &c, 1);
    156d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1570:	83 ec 04             	sub    $0x4,%esp
    1573:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1577:	6a 01                	push   $0x1
    1579:	50                   	push   %eax
    157a:	ff 75 08             	pushl  0x8(%ebp)
    157d:	e8 00 fe ff ff       	call   1382 <write>
    1582:	83 c4 0c             	add    $0xc,%esp
    1585:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1588:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    158b:	6a 01                	push   $0x1
    158d:	50                   	push   %eax
    158e:	ff 75 08             	pushl  0x8(%ebp)
    1591:	83 c6 01             	add    $0x1,%esi
    1594:	e8 e9 fd ff ff       	call   1382 <write>
  for(i = 0; fmt[i]; i++){
    1599:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    159d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15a0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    15a2:	84 db                	test   %bl,%bl
    15a4:	75 84                	jne    152a <printf+0x5a>
    }
  }
}
    15a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15a9:	5b                   	pop    %ebx
    15aa:	5e                   	pop    %esi
    15ab:	5f                   	pop    %edi
    15ac:	5d                   	pop    %ebp
    15ad:	c3                   	ret    
    15ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    15b0:	83 ec 0c             	sub    $0xc,%esp
    15b3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15b8:	6a 00                	push   $0x0
    15ba:	8b 17                	mov    (%edi),%edx
    15bc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    15bf:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    15c2:	e8 69 fe ff ff       	call   1430 <printint>
    15c7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15ca:	31 d2                	xor    %edx,%edx
    15cc:	e9 4e ff ff ff       	jmp    151f <printf+0x4f>
    15d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    15d8:	83 ec 04             	sub    $0x4,%esp
    15db:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    15de:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    15e1:	6a 01                	push   $0x1
    15e3:	eb a8                	jmp    158d <printf+0xbd>
    15e5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15e8:	83 ec 0c             	sub    $0xc,%esp
    15eb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15f0:	6a 01                	push   $0x1
    15f2:	eb c6                	jmp    15ba <printf+0xea>
    15f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    15f8:	8b 57 04             	mov    0x4(%edi),%edx
    15fb:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    15fd:	85 d2                	test   %edx,%edx
    15ff:	74 15                	je     1616 <printf+0x146>
    1601:	83 ec 0c             	sub    $0xc,%esp
    1604:	8b 45 08             	mov    0x8(%ebp),%eax
    1607:	b9 10 00 00 00       	mov    $0x10,%ecx
    160c:	6a 00                	push   $0x0
    160e:	e8 1d fe ff ff       	call   1430 <printint>
    1613:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1616:	83 ec 0c             	sub    $0xc,%esp
    1619:	8b 45 08             	mov    0x8(%ebp),%eax
    161c:	89 da                	mov    %ebx,%edx
    161e:	6a 00                	push   $0x0
    1620:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1625:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1628:	e8 03 fe ff ff       	call   1430 <printint>
    162d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1630:	31 d2                	xor    %edx,%edx
    1632:	e9 e8 fe ff ff       	jmp    151f <printf+0x4f>
    1637:	89 f6                	mov    %esi,%esi
    1639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1640:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1642:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1645:	85 c9                	test   %ecx,%ecx
    1647:	74 6a                	je     16b3 <printf+0x1e3>
        while(*s != 0){
    1649:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    164c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    164e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1650:	84 c0                	test   %al,%al
    1652:	0f 84 c7 fe ff ff    	je     151f <printf+0x4f>
    1658:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    165b:	89 de                	mov    %ebx,%esi
    165d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1660:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1663:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1666:	83 ec 04             	sub    $0x4,%esp
    1669:	6a 01                	push   $0x1
          s++;
    166b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    166e:	50                   	push   %eax
    166f:	53                   	push   %ebx
    1670:	e8 0d fd ff ff       	call   1382 <write>
        while(*s != 0){
    1675:	0f b6 06             	movzbl (%esi),%eax
    1678:	83 c4 10             	add    $0x10,%esp
    167b:	84 c0                	test   %al,%al
    167d:	75 e1                	jne    1660 <printf+0x190>
    167f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1682:	31 d2                	xor    %edx,%edx
    1684:	e9 96 fe ff ff       	jmp    151f <printf+0x4f>
    1689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1690:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1692:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1695:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1698:	6a 01                	push   $0x1
        putc(fd, *ap);
    169a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    169d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16a0:	50                   	push   %eax
    16a1:	ff 75 08             	pushl  0x8(%ebp)
    16a4:	e8 d9 fc ff ff       	call   1382 <write>
    16a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16ac:	31 d2                	xor    %edx,%edx
    16ae:	e9 6c fe ff ff       	jmp    151f <printf+0x4f>
          s = "(null)";
    16b3:	bb 80 18 00 00       	mov    $0x1880,%ebx
        while(*s != 0){
    16b8:	b8 28 00 00 00       	mov    $0x28,%eax
    16bd:	eb 99                	jmp    1658 <printf+0x188>
    16bf:	90                   	nop

000016c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16c1:	a1 80 1b 00 00       	mov    0x1b80,%eax
{
    16c6:	89 e5                	mov    %esp,%ebp
    16c8:	57                   	push   %edi
    16c9:	56                   	push   %esi
    16ca:	53                   	push   %ebx
    16cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    16ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    16d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16d8:	39 c8                	cmp    %ecx,%eax
    16da:	8b 10                	mov    (%eax),%edx
    16dc:	73 32                	jae    1710 <free+0x50>
    16de:	39 d1                	cmp    %edx,%ecx
    16e0:	72 04                	jb     16e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16e2:	39 d0                	cmp    %edx,%eax
    16e4:	72 32                	jb     1718 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ec:	39 fa                	cmp    %edi,%edx
    16ee:	74 30                	je     1720 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16f3:	8b 50 04             	mov    0x4(%eax),%edx
    16f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16f9:	39 f1                	cmp    %esi,%ecx
    16fb:	74 3a                	je     1737 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16fd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    16ff:	a3 80 1b 00 00       	mov    %eax,0x1b80
}
    1704:	5b                   	pop    %ebx
    1705:	5e                   	pop    %esi
    1706:	5f                   	pop    %edi
    1707:	5d                   	pop    %ebp
    1708:	c3                   	ret    
    1709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1710:	39 d0                	cmp    %edx,%eax
    1712:	72 04                	jb     1718 <free+0x58>
    1714:	39 d1                	cmp    %edx,%ecx
    1716:	72 ce                	jb     16e6 <free+0x26>
{
    1718:	89 d0                	mov    %edx,%eax
    171a:	eb bc                	jmp    16d8 <free+0x18>
    171c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1720:	03 72 04             	add    0x4(%edx),%esi
    1723:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1726:	8b 10                	mov    (%eax),%edx
    1728:	8b 12                	mov    (%edx),%edx
    172a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    172d:	8b 50 04             	mov    0x4(%eax),%edx
    1730:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1733:	39 f1                	cmp    %esi,%ecx
    1735:	75 c6                	jne    16fd <free+0x3d>
    p->s.size += bp->s.size;
    1737:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    173a:	a3 80 1b 00 00       	mov    %eax,0x1b80
    p->s.size += bp->s.size;
    173f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1742:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1745:	89 10                	mov    %edx,(%eax)
}
    1747:	5b                   	pop    %ebx
    1748:	5e                   	pop    %esi
    1749:	5f                   	pop    %edi
    174a:	5d                   	pop    %ebp
    174b:	c3                   	ret    
    174c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001750 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1750:	55                   	push   %ebp
    1751:	89 e5                	mov    %esp,%ebp
    1753:	57                   	push   %edi
    1754:	56                   	push   %esi
    1755:	53                   	push   %ebx
    1756:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1759:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    175c:	8b 15 80 1b 00 00    	mov    0x1b80,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1762:	8d 78 07             	lea    0x7(%eax),%edi
    1765:	c1 ef 03             	shr    $0x3,%edi
    1768:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    176b:	85 d2                	test   %edx,%edx
    176d:	0f 84 9d 00 00 00    	je     1810 <malloc+0xc0>
    1773:	8b 02                	mov    (%edx),%eax
    1775:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1778:	39 cf                	cmp    %ecx,%edi
    177a:	76 6c                	jbe    17e8 <malloc+0x98>
    177c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1782:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1787:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    178a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1791:	eb 0e                	jmp    17a1 <malloc+0x51>
    1793:	90                   	nop
    1794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1798:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    179a:	8b 48 04             	mov    0x4(%eax),%ecx
    179d:	39 f9                	cmp    %edi,%ecx
    179f:	73 47                	jae    17e8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17a1:	39 05 80 1b 00 00    	cmp    %eax,0x1b80
    17a7:	89 c2                	mov    %eax,%edx
    17a9:	75 ed                	jne    1798 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    17ab:	83 ec 0c             	sub    $0xc,%esp
    17ae:	56                   	push   %esi
    17af:	e8 36 fc ff ff       	call   13ea <sbrk>
  if(p == (char*)-1)
    17b4:	83 c4 10             	add    $0x10,%esp
    17b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    17ba:	74 1c                	je     17d8 <malloc+0x88>
  hp->s.size = nu;
    17bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17bf:	83 ec 0c             	sub    $0xc,%esp
    17c2:	83 c0 08             	add    $0x8,%eax
    17c5:	50                   	push   %eax
    17c6:	e8 f5 fe ff ff       	call   16c0 <free>
  return freep;
    17cb:	8b 15 80 1b 00 00    	mov    0x1b80,%edx
      if((p = morecore(nunits)) == 0)
    17d1:	83 c4 10             	add    $0x10,%esp
    17d4:	85 d2                	test   %edx,%edx
    17d6:	75 c0                	jne    1798 <malloc+0x48>
        return 0;
  }
}
    17d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17db:	31 c0                	xor    %eax,%eax
}
    17dd:	5b                   	pop    %ebx
    17de:	5e                   	pop    %esi
    17df:	5f                   	pop    %edi
    17e0:	5d                   	pop    %ebp
    17e1:	c3                   	ret    
    17e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    17e8:	39 cf                	cmp    %ecx,%edi
    17ea:	74 54                	je     1840 <malloc+0xf0>
        p->s.size -= nunits;
    17ec:	29 f9                	sub    %edi,%ecx
    17ee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    17f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    17f4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    17f7:	89 15 80 1b 00 00    	mov    %edx,0x1b80
}
    17fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1800:	83 c0 08             	add    $0x8,%eax
}
    1803:	5b                   	pop    %ebx
    1804:	5e                   	pop    %esi
    1805:	5f                   	pop    %edi
    1806:	5d                   	pop    %ebp
    1807:	c3                   	ret    
    1808:	90                   	nop
    1809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1810:	c7 05 80 1b 00 00 84 	movl   $0x1b84,0x1b80
    1817:	1b 00 00 
    181a:	c7 05 84 1b 00 00 84 	movl   $0x1b84,0x1b84
    1821:	1b 00 00 
    base.s.size = 0;
    1824:	b8 84 1b 00 00       	mov    $0x1b84,%eax
    1829:	c7 05 88 1b 00 00 00 	movl   $0x0,0x1b88
    1830:	00 00 00 
    1833:	e9 44 ff ff ff       	jmp    177c <malloc+0x2c>
    1838:	90                   	nop
    1839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1840:	8b 08                	mov    (%eax),%ecx
    1842:	89 0a                	mov    %ecx,(%edx)
    1844:	eb b1                	jmp    17f7 <malloc+0xa7>
