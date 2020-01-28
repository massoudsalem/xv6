
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
    106c:	68 7b 18 00 00       	push   $0x187b
    1071:	6a 01                	push   $0x1
    1073:	e8 68 04 00 00       	call   14e0 <printf>
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
    10e0:	68 58 18 00 00       	push   $0x1858
    10e5:	6a 01                	push   $0x1
    10e7:	e8 f4 03 00 00       	call   14e0 <printf>
      exit();
    10ec:	e8 71 02 00 00       	call   1362 <exit>
    printf(1, "cat: read error\n");
    10f1:	50                   	push   %eax
    10f2:	50                   	push   %eax
    10f3:	68 6a 18 00 00       	push   $0x186a
    10f8:	6a 01                	push   $0x1
    10fa:	e8 e1 03 00 00       	call   14e0 <printf>
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
    135a:	b8 01 00 00 00       	mov    $0x1,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <exit>:
    1362:	b8 02 00 00 00       	mov    $0x2,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <wait>:
    136a:	b8 03 00 00 00       	mov    $0x3,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <pipe>:
    1372:	b8 04 00 00 00       	mov    $0x4,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <read>:
    137a:	b8 05 00 00 00       	mov    $0x5,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <write>:
    1382:	b8 10 00 00 00       	mov    $0x10,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <close>:
    138a:	b8 15 00 00 00       	mov    $0x15,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <kill>:
    1392:	b8 06 00 00 00       	mov    $0x6,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <exec>:
    139a:	b8 07 00 00 00       	mov    $0x7,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <open>:
    13a2:	b8 0f 00 00 00       	mov    $0xf,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <mknod>:
    13aa:	b8 11 00 00 00       	mov    $0x11,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <unlink>:
    13b2:	b8 12 00 00 00       	mov    $0x12,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <fstat>:
    13ba:	b8 08 00 00 00       	mov    $0x8,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <link>:
    13c2:	b8 13 00 00 00       	mov    $0x13,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <mkdir>:
    13ca:	b8 14 00 00 00       	mov    $0x14,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <chdir>:
    13d2:	b8 09 00 00 00       	mov    $0x9,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <dup>:
    13da:	b8 0a 00 00 00       	mov    $0xa,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <getpid>:
    13e2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <sbrk>:
    13ea:	b8 0c 00 00 00       	mov    $0xc,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <sleep>:
    13f2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <uptime>:
    13fa:	b8 0e 00 00 00       	mov    $0xe,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <getreadcount>:
    1402:	b8 16 00 00 00       	mov    $0x16,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <gettime>:
    140a:	b8 17 00 00 00       	mov    $0x17,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    

00001412 <settickets>:
    1412:	b8 18 00 00 00       	mov    $0x18,%eax
    1417:	cd 40                	int    $0x40
    1419:	c3                   	ret    

0000141a <getpinfo>:
    141a:	b8 19 00 00 00       	mov    $0x19,%eax
    141f:	cd 40                	int    $0x40
    1421:	c3                   	ret    

00001422 <mprotect>:
    1422:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1427:	cd 40                	int    $0x40
    1429:	c3                   	ret    

0000142a <munprotect>:
    142a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    142f:	cd 40                	int    $0x40
    1431:	c3                   	ret    
    1432:	66 90                	xchg   %ax,%ax
    1434:	66 90                	xchg   %ax,%ax
    1436:	66 90                	xchg   %ax,%ax
    1438:	66 90                	xchg   %ax,%ax
    143a:	66 90                	xchg   %ax,%ax
    143c:	66 90                	xchg   %ax,%ax
    143e:	66 90                	xchg   %ax,%ax

00001440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	57                   	push   %edi
    1444:	56                   	push   %esi
    1445:	53                   	push   %ebx
    1446:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1449:	85 d2                	test   %edx,%edx
{
    144b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    144e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1450:	79 76                	jns    14c8 <printint+0x88>
    1452:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1456:	74 70                	je     14c8 <printint+0x88>
    x = -xx;
    1458:	f7 d8                	neg    %eax
    neg = 1;
    145a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1461:	31 f6                	xor    %esi,%esi
    1463:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1466:	eb 0a                	jmp    1472 <printint+0x32>
    1468:	90                   	nop
    1469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1470:	89 fe                	mov    %edi,%esi
    1472:	31 d2                	xor    %edx,%edx
    1474:	8d 7e 01             	lea    0x1(%esi),%edi
    1477:	f7 f1                	div    %ecx
    1479:	0f b6 92 98 18 00 00 	movzbl 0x1898(%edx),%edx
  }while((x /= base) != 0);
    1480:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1482:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1485:	75 e9                	jne    1470 <printint+0x30>
  if(neg)
    1487:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    148a:	85 c0                	test   %eax,%eax
    148c:	74 08                	je     1496 <printint+0x56>
    buf[i++] = '-';
    148e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1493:	8d 7e 02             	lea    0x2(%esi),%edi
    1496:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    149a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    149d:	8d 76 00             	lea    0x0(%esi),%esi
    14a0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    14a3:	83 ec 04             	sub    $0x4,%esp
    14a6:	83 ee 01             	sub    $0x1,%esi
    14a9:	6a 01                	push   $0x1
    14ab:	53                   	push   %ebx
    14ac:	57                   	push   %edi
    14ad:	88 45 d7             	mov    %al,-0x29(%ebp)
    14b0:	e8 cd fe ff ff       	call   1382 <write>

  while(--i >= 0)
    14b5:	83 c4 10             	add    $0x10,%esp
    14b8:	39 de                	cmp    %ebx,%esi
    14ba:	75 e4                	jne    14a0 <printint+0x60>
    putc(fd, buf[i]);
}
    14bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14bf:	5b                   	pop    %ebx
    14c0:	5e                   	pop    %esi
    14c1:	5f                   	pop    %edi
    14c2:	5d                   	pop    %ebp
    14c3:	c3                   	ret    
    14c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14c8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    14cf:	eb 90                	jmp    1461 <printint+0x21>
    14d1:	eb 0d                	jmp    14e0 <printf>
    14d3:	90                   	nop
    14d4:	90                   	nop
    14d5:	90                   	nop
    14d6:	90                   	nop
    14d7:	90                   	nop
    14d8:	90                   	nop
    14d9:	90                   	nop
    14da:	90                   	nop
    14db:	90                   	nop
    14dc:	90                   	nop
    14dd:	90                   	nop
    14de:	90                   	nop
    14df:	90                   	nop

000014e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    14e0:	55                   	push   %ebp
    14e1:	89 e5                	mov    %esp,%ebp
    14e3:	57                   	push   %edi
    14e4:	56                   	push   %esi
    14e5:	53                   	push   %ebx
    14e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14e9:	8b 75 0c             	mov    0xc(%ebp),%esi
    14ec:	0f b6 1e             	movzbl (%esi),%ebx
    14ef:	84 db                	test   %bl,%bl
    14f1:	0f 84 bf 00 00 00    	je     15b6 <printf+0xd6>
    14f7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    14fa:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    14fd:	31 d2                	xor    %edx,%edx
    14ff:	eb 39                	jmp    153a <printf+0x5a>
    1501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1508:	83 f8 25             	cmp    $0x25,%eax
    150b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    150e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1513:	74 1a                	je     152f <printf+0x4f>
  write(fd, &c, 1);
    1515:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1518:	83 ec 04             	sub    $0x4,%esp
    151b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    151e:	6a 01                	push   $0x1
    1520:	50                   	push   %eax
    1521:	ff 75 08             	pushl  0x8(%ebp)
    1524:	e8 59 fe ff ff       	call   1382 <write>
    1529:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    152c:	83 c4 10             	add    $0x10,%esp
    152f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1532:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1536:	84 db                	test   %bl,%bl
    1538:	74 7c                	je     15b6 <printf+0xd6>
    if(state == 0){
    153a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    153c:	0f be cb             	movsbl %bl,%ecx
    153f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1542:	74 c4                	je     1508 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1544:	83 fa 25             	cmp    $0x25,%edx
    1547:	75 e6                	jne    152f <printf+0x4f>
      if(c == 'd'){
    1549:	83 f8 64             	cmp    $0x64,%eax
    154c:	0f 84 a6 00 00 00    	je     15f8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1552:	83 f8 6c             	cmp    $0x6c,%eax
    1555:	0f 84 ad 00 00 00    	je     1608 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    155b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1561:	83 f9 70             	cmp    $0x70,%ecx
    1564:	74 5a                	je     15c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1566:	83 f8 73             	cmp    $0x73,%eax
    1569:	0f 84 e1 00 00 00    	je     1650 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    156f:	83 f8 63             	cmp    $0x63,%eax
    1572:	0f 84 28 01 00 00    	je     16a0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1578:	83 f8 25             	cmp    $0x25,%eax
    157b:	74 6b                	je     15e8 <printf+0x108>
  write(fd, &c, 1);
    157d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1580:	83 ec 04             	sub    $0x4,%esp
    1583:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1587:	6a 01                	push   $0x1
    1589:	50                   	push   %eax
    158a:	ff 75 08             	pushl  0x8(%ebp)
    158d:	e8 f0 fd ff ff       	call   1382 <write>
    1592:	83 c4 0c             	add    $0xc,%esp
    1595:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1598:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    159b:	6a 01                	push   $0x1
    159d:	50                   	push   %eax
    159e:	ff 75 08             	pushl  0x8(%ebp)
    15a1:	83 c6 01             	add    $0x1,%esi
    15a4:	e8 d9 fd ff ff       	call   1382 <write>
  for(i = 0; fmt[i]; i++){
    15a9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    15ad:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15b0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    15b2:	84 db                	test   %bl,%bl
    15b4:	75 84                	jne    153a <printf+0x5a>
    }
  }
}
    15b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15b9:	5b                   	pop    %ebx
    15ba:	5e                   	pop    %esi
    15bb:	5f                   	pop    %edi
    15bc:	5d                   	pop    %ebp
    15bd:	c3                   	ret    
    15be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    15c0:	83 ec 0c             	sub    $0xc,%esp
    15c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15c8:	6a 00                	push   $0x0
    15ca:	8b 17                	mov    (%edi),%edx
    15cc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    15cf:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    15d2:	e8 69 fe ff ff       	call   1440 <printint>
    15d7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15da:	31 d2                	xor    %edx,%edx
    15dc:	e9 4e ff ff ff       	jmp    152f <printf+0x4f>
    15e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    15e8:	83 ec 04             	sub    $0x4,%esp
    15eb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    15ee:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    15f1:	6a 01                	push   $0x1
    15f3:	eb a8                	jmp    159d <printf+0xbd>
    15f5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15f8:	83 ec 0c             	sub    $0xc,%esp
    15fb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1600:	6a 01                	push   $0x1
    1602:	eb c6                	jmp    15ca <printf+0xea>
    1604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1608:	8b 57 04             	mov    0x4(%edi),%edx
    160b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    160d:	85 d2                	test   %edx,%edx
    160f:	74 15                	je     1626 <printf+0x146>
    1611:	83 ec 0c             	sub    $0xc,%esp
    1614:	8b 45 08             	mov    0x8(%ebp),%eax
    1617:	b9 10 00 00 00       	mov    $0x10,%ecx
    161c:	6a 00                	push   $0x0
    161e:	e8 1d fe ff ff       	call   1440 <printint>
    1623:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1626:	83 ec 0c             	sub    $0xc,%esp
    1629:	8b 45 08             	mov    0x8(%ebp),%eax
    162c:	89 da                	mov    %ebx,%edx
    162e:	6a 00                	push   $0x0
    1630:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1635:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1638:	e8 03 fe ff ff       	call   1440 <printint>
    163d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1640:	31 d2                	xor    %edx,%edx
    1642:	e9 e8 fe ff ff       	jmp    152f <printf+0x4f>
    1647:	89 f6                	mov    %esi,%esi
    1649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1650:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1652:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1655:	85 c9                	test   %ecx,%ecx
    1657:	74 6a                	je     16c3 <printf+0x1e3>
        while(*s != 0){
    1659:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    165c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    165e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1660:	84 c0                	test   %al,%al
    1662:	0f 84 c7 fe ff ff    	je     152f <printf+0x4f>
    1668:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    166b:	89 de                	mov    %ebx,%esi
    166d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1670:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1673:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1676:	83 ec 04             	sub    $0x4,%esp
    1679:	6a 01                	push   $0x1
          s++;
    167b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    167e:	50                   	push   %eax
    167f:	53                   	push   %ebx
    1680:	e8 fd fc ff ff       	call   1382 <write>
        while(*s != 0){
    1685:	0f b6 06             	movzbl (%esi),%eax
    1688:	83 c4 10             	add    $0x10,%esp
    168b:	84 c0                	test   %al,%al
    168d:	75 e1                	jne    1670 <printf+0x190>
    168f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1692:	31 d2                	xor    %edx,%edx
    1694:	e9 96 fe ff ff       	jmp    152f <printf+0x4f>
    1699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    16a0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    16a2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    16a5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    16a8:	6a 01                	push   $0x1
        putc(fd, *ap);
    16aa:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    16ad:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16b0:	50                   	push   %eax
    16b1:	ff 75 08             	pushl  0x8(%ebp)
    16b4:	e8 c9 fc ff ff       	call   1382 <write>
    16b9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16bc:	31 d2                	xor    %edx,%edx
    16be:	e9 6c fe ff ff       	jmp    152f <printf+0x4f>
          s = "(null)";
    16c3:	bb 90 18 00 00       	mov    $0x1890,%ebx
        while(*s != 0){
    16c8:	b8 28 00 00 00       	mov    $0x28,%eax
    16cd:	eb 99                	jmp    1668 <printf+0x188>
    16cf:	90                   	nop

000016d0 <free>:
    16d0:	55                   	push   %ebp
    16d1:	a1 80 1b 00 00       	mov    0x1b80,%eax
    16d6:	89 e5                	mov    %esp,%ebp
    16d8:	57                   	push   %edi
    16d9:	56                   	push   %esi
    16da:	53                   	push   %ebx
    16db:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    16e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16e8:	39 c8                	cmp    %ecx,%eax
    16ea:	8b 10                	mov    (%eax),%edx
    16ec:	73 32                	jae    1720 <free+0x50>
    16ee:	39 d1                	cmp    %edx,%ecx
    16f0:	72 04                	jb     16f6 <free+0x26>
    16f2:	39 d0                	cmp    %edx,%eax
    16f4:	72 32                	jb     1728 <free+0x58>
    16f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16fc:	39 fa                	cmp    %edi,%edx
    16fe:	74 30                	je     1730 <free+0x60>
    1700:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1703:	8b 50 04             	mov    0x4(%eax),%edx
    1706:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1709:	39 f1                	cmp    %esi,%ecx
    170b:	74 3a                	je     1747 <free+0x77>
    170d:	89 08                	mov    %ecx,(%eax)
    170f:	a3 80 1b 00 00       	mov    %eax,0x1b80
    1714:	5b                   	pop    %ebx
    1715:	5e                   	pop    %esi
    1716:	5f                   	pop    %edi
    1717:	5d                   	pop    %ebp
    1718:	c3                   	ret    
    1719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1720:	39 d0                	cmp    %edx,%eax
    1722:	72 04                	jb     1728 <free+0x58>
    1724:	39 d1                	cmp    %edx,%ecx
    1726:	72 ce                	jb     16f6 <free+0x26>
    1728:	89 d0                	mov    %edx,%eax
    172a:	eb bc                	jmp    16e8 <free+0x18>
    172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1730:	03 72 04             	add    0x4(%edx),%esi
    1733:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1736:	8b 10                	mov    (%eax),%edx
    1738:	8b 12                	mov    (%edx),%edx
    173a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    173d:	8b 50 04             	mov    0x4(%eax),%edx
    1740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1743:	39 f1                	cmp    %esi,%ecx
    1745:	75 c6                	jne    170d <free+0x3d>
    1747:	03 53 fc             	add    -0x4(%ebx),%edx
    174a:	a3 80 1b 00 00       	mov    %eax,0x1b80
    174f:	89 50 04             	mov    %edx,0x4(%eax)
    1752:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1755:	89 10                	mov    %edx,(%eax)
    1757:	5b                   	pop    %ebx
    1758:	5e                   	pop    %esi
    1759:	5f                   	pop    %edi
    175a:	5d                   	pop    %ebp
    175b:	c3                   	ret    
    175c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001760 <malloc>:
    1760:	55                   	push   %ebp
    1761:	89 e5                	mov    %esp,%ebp
    1763:	57                   	push   %edi
    1764:	56                   	push   %esi
    1765:	53                   	push   %ebx
    1766:	83 ec 0c             	sub    $0xc,%esp
    1769:	8b 45 08             	mov    0x8(%ebp),%eax
    176c:	8b 15 80 1b 00 00    	mov    0x1b80,%edx
    1772:	8d 78 07             	lea    0x7(%eax),%edi
    1775:	c1 ef 03             	shr    $0x3,%edi
    1778:	83 c7 01             	add    $0x1,%edi
    177b:	85 d2                	test   %edx,%edx
    177d:	0f 84 9d 00 00 00    	je     1820 <malloc+0xc0>
    1783:	8b 02                	mov    (%edx),%eax
    1785:	8b 48 04             	mov    0x4(%eax),%ecx
    1788:	39 cf                	cmp    %ecx,%edi
    178a:	76 6c                	jbe    17f8 <malloc+0x98>
    178c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1792:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1797:	0f 43 df             	cmovae %edi,%ebx
    179a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    17a1:	eb 0e                	jmp    17b1 <malloc+0x51>
    17a3:	90                   	nop
    17a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17a8:	8b 02                	mov    (%edx),%eax
    17aa:	8b 48 04             	mov    0x4(%eax),%ecx
    17ad:	39 f9                	cmp    %edi,%ecx
    17af:	73 47                	jae    17f8 <malloc+0x98>
    17b1:	39 05 80 1b 00 00    	cmp    %eax,0x1b80
    17b7:	89 c2                	mov    %eax,%edx
    17b9:	75 ed                	jne    17a8 <malloc+0x48>
    17bb:	83 ec 0c             	sub    $0xc,%esp
    17be:	56                   	push   %esi
    17bf:	e8 26 fc ff ff       	call   13ea <sbrk>
    17c4:	83 c4 10             	add    $0x10,%esp
    17c7:	83 f8 ff             	cmp    $0xffffffff,%eax
    17ca:	74 1c                	je     17e8 <malloc+0x88>
    17cc:	89 58 04             	mov    %ebx,0x4(%eax)
    17cf:	83 ec 0c             	sub    $0xc,%esp
    17d2:	83 c0 08             	add    $0x8,%eax
    17d5:	50                   	push   %eax
    17d6:	e8 f5 fe ff ff       	call   16d0 <free>
    17db:	8b 15 80 1b 00 00    	mov    0x1b80,%edx
    17e1:	83 c4 10             	add    $0x10,%esp
    17e4:	85 d2                	test   %edx,%edx
    17e6:	75 c0                	jne    17a8 <malloc+0x48>
    17e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17eb:	31 c0                	xor    %eax,%eax
    17ed:	5b                   	pop    %ebx
    17ee:	5e                   	pop    %esi
    17ef:	5f                   	pop    %edi
    17f0:	5d                   	pop    %ebp
    17f1:	c3                   	ret    
    17f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    17f8:	39 cf                	cmp    %ecx,%edi
    17fa:	74 54                	je     1850 <malloc+0xf0>
    17fc:	29 f9                	sub    %edi,%ecx
    17fe:	89 48 04             	mov    %ecx,0x4(%eax)
    1801:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1804:	89 78 04             	mov    %edi,0x4(%eax)
    1807:	89 15 80 1b 00 00    	mov    %edx,0x1b80
    180d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1810:	83 c0 08             	add    $0x8,%eax
    1813:	5b                   	pop    %ebx
    1814:	5e                   	pop    %esi
    1815:	5f                   	pop    %edi
    1816:	5d                   	pop    %ebp
    1817:	c3                   	ret    
    1818:	90                   	nop
    1819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1820:	c7 05 80 1b 00 00 84 	movl   $0x1b84,0x1b80
    1827:	1b 00 00 
    182a:	c7 05 84 1b 00 00 84 	movl   $0x1b84,0x1b84
    1831:	1b 00 00 
    1834:	b8 84 1b 00 00       	mov    $0x1b84,%eax
    1839:	c7 05 88 1b 00 00 00 	movl   $0x0,0x1b88
    1840:	00 00 00 
    1843:	e9 44 ff ff ff       	jmp    178c <malloc+0x2c>
    1848:	90                   	nop
    1849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1850:	8b 08                	mov    (%eax),%ecx
    1852:	89 0a                	mov    %ecx,(%edx)
    1854:	eb b1                	jmp    1807 <malloc+0xa7>
