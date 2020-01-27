
_wc:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
    1027:	7e 56                	jle    107f <main+0x7f>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 d6 03 00 00       	call   1412 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	85 c0                	test   %eax,%eax
    1041:	89 c7                	mov    %eax,%edi
    1043:	78 26                	js     106b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    1045:	83 ec 08             	sub    $0x8,%esp
    1048:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
    104a:	83 c6 01             	add    $0x1,%esi
    wc(fd, argv[i]);
    104d:	50                   	push   %eax
    104e:	83 c3 04             	add    $0x4,%ebx
    1051:	e8 4a 00 00 00       	call   10a0 <wc>
    close(fd);
    1056:	89 3c 24             	mov    %edi,(%esp)
    1059:	e8 9c 03 00 00       	call   13fa <close>
  for(i = 1; i < argc; i++){
    105e:	83 c4 10             	add    $0x10,%esp
    1061:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1064:	75 ca                	jne    1030 <main+0x30>
  }
  exit();
    1066:	e8 67 03 00 00       	call   13d2 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
    106b:	50                   	push   %eax
    106c:	ff 33                	pushl  (%ebx)
    106e:	68 db 18 00 00       	push   $0x18db
    1073:	6a 01                	push   $0x1
    1075:	e8 c6 04 00 00       	call   1540 <printf>
      exit();
    107a:	e8 53 03 00 00       	call   13d2 <exit>
    wc(0, "");
    107f:	52                   	push   %edx
    1080:	52                   	push   %edx
    1081:	68 cd 18 00 00       	push   $0x18cd
    1086:	6a 00                	push   $0x0
    1088:	e8 13 00 00 00       	call   10a0 <wc>
    exit();
    108d:	e8 40 03 00 00       	call   13d2 <exit>
    1092:	66 90                	xchg   %ax,%ax
    1094:	66 90                	xchg   %ax,%ax
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <wc>:
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	57                   	push   %edi
    10a4:	56                   	push   %esi
    10a5:	53                   	push   %ebx
  l = w = c = 0;
    10a6:	31 db                	xor    %ebx,%ebx
{
    10a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
    10ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
    10b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    10b9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10c0:	83 ec 04             	sub    $0x4,%esp
    10c3:	68 00 02 00 00       	push   $0x200
    10c8:	68 00 1c 00 00       	push   $0x1c00
    10cd:	ff 75 08             	pushl  0x8(%ebp)
    10d0:	e8 15 03 00 00       	call   13ea <read>
    10d5:	83 c4 10             	add    $0x10,%esp
    10d8:	83 f8 00             	cmp    $0x0,%eax
    10db:	89 c6                	mov    %eax,%esi
    10dd:	7e 61                	jle    1140 <wc+0xa0>
    for(i=0; i<n; i++){
    10df:	31 ff                	xor    %edi,%edi
    10e1:	eb 13                	jmp    10f6 <wc+0x56>
    10e3:	90                   	nop
    10e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        inword = 0;
    10e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
    10ef:	83 c7 01             	add    $0x1,%edi
    10f2:	39 fe                	cmp    %edi,%esi
    10f4:	74 42                	je     1138 <wc+0x98>
      if(buf[i] == '\n')
    10f6:	0f be 87 00 1c 00 00 	movsbl 0x1c00(%edi),%eax
        l++;
    10fd:	31 c9                	xor    %ecx,%ecx
    10ff:	3c 0a                	cmp    $0xa,%al
    1101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
    1104:	83 ec 08             	sub    $0x8,%esp
    1107:	50                   	push   %eax
    1108:	68 b8 18 00 00       	push   $0x18b8
        l++;
    110d:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
    110f:	e8 3c 01 00 00       	call   1250 <strchr>
    1114:	83 c4 10             	add    $0x10,%esp
    1117:	85 c0                	test   %eax,%eax
    1119:	75 cd                	jne    10e8 <wc+0x48>
      else if(!inword){
    111b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    111e:	85 d2                	test   %edx,%edx
    1120:	75 cd                	jne    10ef <wc+0x4f>
    for(i=0; i<n; i++){
    1122:	83 c7 01             	add    $0x1,%edi
        w++;
    1125:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
    1129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
    1130:	39 fe                	cmp    %edi,%esi
    1132:	75 c2                	jne    10f6 <wc+0x56>
    1134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1138:	01 75 e0             	add    %esi,-0x20(%ebp)
    113b:	eb 83                	jmp    10c0 <wc+0x20>
    113d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
    1140:	75 24                	jne    1166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
    1142:	83 ec 08             	sub    $0x8,%esp
    1145:	ff 75 0c             	pushl  0xc(%ebp)
    1148:	ff 75 e0             	pushl  -0x20(%ebp)
    114b:	ff 75 dc             	pushl  -0x24(%ebp)
    114e:	53                   	push   %ebx
    114f:	68 ce 18 00 00       	push   $0x18ce
    1154:	6a 01                	push   $0x1
    1156:	e8 e5 03 00 00       	call   1540 <printf>
}
    115b:	83 c4 20             	add    $0x20,%esp
    115e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1161:	5b                   	pop    %ebx
    1162:	5e                   	pop    %esi
    1163:	5f                   	pop    %edi
    1164:	5d                   	pop    %ebp
    1165:	c3                   	ret    
    printf(1, "wc: read error\n");
    1166:	50                   	push   %eax
    1167:	50                   	push   %eax
    1168:	68 be 18 00 00       	push   $0x18be
    116d:	6a 01                	push   $0x1
    116f:	e8 cc 03 00 00       	call   1540 <printf>
    exit();
    1174:	e8 59 02 00 00       	call   13d2 <exit>
    1179:	66 90                	xchg   %ax,%ax
    117b:	66 90                	xchg   %ax,%ax
    117d:	66 90                	xchg   %ax,%ax
    117f:	90                   	nop

00001180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	53                   	push   %ebx
    1184:	8b 45 08             	mov    0x8(%ebp),%eax
    1187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    118a:	89 c2                	mov    %eax,%edx
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1190:	83 c1 01             	add    $0x1,%ecx
    1193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1197:	83 c2 01             	add    $0x1,%edx
    119a:	84 db                	test   %bl,%bl
    119c:	88 5a ff             	mov    %bl,-0x1(%edx)
    119f:	75 ef                	jne    1190 <strcpy+0x10>
    ;
  return os;
}
    11a1:	5b                   	pop    %ebx
    11a2:	5d                   	pop    %ebp
    11a3:	c3                   	ret    
    11a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
    11b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    11ba:	0f b6 02             	movzbl (%edx),%eax
    11bd:	0f b6 19             	movzbl (%ecx),%ebx
    11c0:	84 c0                	test   %al,%al
    11c2:	75 1c                	jne    11e0 <strcmp+0x30>
    11c4:	eb 2a                	jmp    11f0 <strcmp+0x40>
    11c6:	8d 76 00             	lea    0x0(%esi),%esi
    11c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    11d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    11d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    11d6:	83 c1 01             	add    $0x1,%ecx
    11d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    11dc:	84 c0                	test   %al,%al
    11de:	74 10                	je     11f0 <strcmp+0x40>
    11e0:	38 d8                	cmp    %bl,%al
    11e2:	74 ec                	je     11d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    11e4:	29 d8                	sub    %ebx,%eax
}
    11e6:	5b                   	pop    %ebx
    11e7:	5d                   	pop    %ebp
    11e8:	c3                   	ret    
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    11f2:	29 d8                	sub    %ebx,%eax
}
    11f4:	5b                   	pop    %ebx
    11f5:	5d                   	pop    %ebp
    11f6:	c3                   	ret    
    11f7:	89 f6                	mov    %esi,%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <strlen>:

uint
strlen(const char *s)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1206:	80 39 00             	cmpb   $0x0,(%ecx)
    1209:	74 15                	je     1220 <strlen+0x20>
    120b:	31 d2                	xor    %edx,%edx
    120d:	8d 76 00             	lea    0x0(%esi),%esi
    1210:	83 c2 01             	add    $0x1,%edx
    1213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1217:	89 d0                	mov    %edx,%eax
    1219:	75 f5                	jne    1210 <strlen+0x10>
    ;
  return n;
}
    121b:	5d                   	pop    %ebp
    121c:	c3                   	ret    
    121d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1220:	31 c0                	xor    %eax,%eax
}
    1222:	5d                   	pop    %ebp
    1223:	c3                   	ret    
    1224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    122a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001230 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1237:	8b 4d 10             	mov    0x10(%ebp),%ecx
    123a:	8b 45 0c             	mov    0xc(%ebp),%eax
    123d:	89 d7                	mov    %edx,%edi
    123f:	fc                   	cld    
    1240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1242:	89 d0                	mov    %edx,%eax
    1244:	5f                   	pop    %edi
    1245:	5d                   	pop    %ebp
    1246:	c3                   	ret    
    1247:	89 f6                	mov    %esi,%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <strchr>:

char*
strchr(const char *s, char c)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	8b 45 08             	mov    0x8(%ebp),%eax
    1257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    125a:	0f b6 10             	movzbl (%eax),%edx
    125d:	84 d2                	test   %dl,%dl
    125f:	74 1d                	je     127e <strchr+0x2e>
    if(*s == c)
    1261:	38 d3                	cmp    %dl,%bl
    1263:	89 d9                	mov    %ebx,%ecx
    1265:	75 0d                	jne    1274 <strchr+0x24>
    1267:	eb 17                	jmp    1280 <strchr+0x30>
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1270:	38 ca                	cmp    %cl,%dl
    1272:	74 0c                	je     1280 <strchr+0x30>
  for(; *s; s++)
    1274:	83 c0 01             	add    $0x1,%eax
    1277:	0f b6 10             	movzbl (%eax),%edx
    127a:	84 d2                	test   %dl,%dl
    127c:	75 f2                	jne    1270 <strchr+0x20>
      return (char*)s;
  return 0;
    127e:	31 c0                	xor    %eax,%eax
}
    1280:	5b                   	pop    %ebx
    1281:	5d                   	pop    %ebp
    1282:	c3                   	ret    
    1283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001290 <gets>:

char*
gets(char *buf, int max)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	57                   	push   %edi
    1294:	56                   	push   %esi
    1295:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1296:	31 f6                	xor    %esi,%esi
    1298:	89 f3                	mov    %esi,%ebx
{
    129a:	83 ec 1c             	sub    $0x1c,%esp
    129d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    12a0:	eb 2f                	jmp    12d1 <gets+0x41>
    12a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    12a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    12ab:	83 ec 04             	sub    $0x4,%esp
    12ae:	6a 01                	push   $0x1
    12b0:	50                   	push   %eax
    12b1:	6a 00                	push   $0x0
    12b3:	e8 32 01 00 00       	call   13ea <read>
    if(cc < 1)
    12b8:	83 c4 10             	add    $0x10,%esp
    12bb:	85 c0                	test   %eax,%eax
    12bd:	7e 1c                	jle    12db <gets+0x4b>
      break;
    buf[i++] = c;
    12bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12c3:	83 c7 01             	add    $0x1,%edi
    12c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    12c9:	3c 0a                	cmp    $0xa,%al
    12cb:	74 23                	je     12f0 <gets+0x60>
    12cd:	3c 0d                	cmp    $0xd,%al
    12cf:	74 1f                	je     12f0 <gets+0x60>
  for(i=0; i+1 < max; ){
    12d1:	83 c3 01             	add    $0x1,%ebx
    12d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12d7:	89 fe                	mov    %edi,%esi
    12d9:	7c cd                	jl     12a8 <gets+0x18>
    12db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    12dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    12e0:	c6 03 00             	movb   $0x0,(%ebx)
}
    12e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12e6:	5b                   	pop    %ebx
    12e7:	5e                   	pop    %esi
    12e8:	5f                   	pop    %edi
    12e9:	5d                   	pop    %ebp
    12ea:	c3                   	ret    
    12eb:	90                   	nop
    12ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12f0:	8b 75 08             	mov    0x8(%ebp),%esi
    12f3:	8b 45 08             	mov    0x8(%ebp),%eax
    12f6:	01 de                	add    %ebx,%esi
    12f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    12fa:	c6 03 00             	movb   $0x0,(%ebx)
}
    12fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1300:	5b                   	pop    %ebx
    1301:	5e                   	pop    %esi
    1302:	5f                   	pop    %edi
    1303:	5d                   	pop    %ebp
    1304:	c3                   	ret    
    1305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001310 <stat>:

int
stat(const char *n, struct stat *st)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	56                   	push   %esi
    1314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1315:	83 ec 08             	sub    $0x8,%esp
    1318:	6a 00                	push   $0x0
    131a:	ff 75 08             	pushl  0x8(%ebp)
    131d:	e8 f0 00 00 00       	call   1412 <open>
  if(fd < 0)
    1322:	83 c4 10             	add    $0x10,%esp
    1325:	85 c0                	test   %eax,%eax
    1327:	78 27                	js     1350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1329:	83 ec 08             	sub    $0x8,%esp
    132c:	ff 75 0c             	pushl  0xc(%ebp)
    132f:	89 c3                	mov    %eax,%ebx
    1331:	50                   	push   %eax
    1332:	e8 f3 00 00 00       	call   142a <fstat>
  close(fd);
    1337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    133a:	89 c6                	mov    %eax,%esi
  close(fd);
    133c:	e8 b9 00 00 00       	call   13fa <close>
  return r;
    1341:	83 c4 10             	add    $0x10,%esp
}
    1344:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1347:	89 f0                	mov    %esi,%eax
    1349:	5b                   	pop    %ebx
    134a:	5e                   	pop    %esi
    134b:	5d                   	pop    %ebp
    134c:	c3                   	ret    
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1350:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1355:	eb ed                	jmp    1344 <stat+0x34>
    1357:	89 f6                	mov    %esi,%esi
    1359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001360 <atoi>:

int
atoi(const char *s)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1367:	0f be 11             	movsbl (%ecx),%edx
    136a:	8d 42 d0             	lea    -0x30(%edx),%eax
    136d:	3c 09                	cmp    $0x9,%al
  n = 0;
    136f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1374:	77 1f                	ja     1395 <atoi+0x35>
    1376:	8d 76 00             	lea    0x0(%esi),%esi
    1379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1380:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1383:	83 c1 01             	add    $0x1,%ecx
    1386:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    138a:	0f be 11             	movsbl (%ecx),%edx
    138d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1390:	80 fb 09             	cmp    $0x9,%bl
    1393:	76 eb                	jbe    1380 <atoi+0x20>
  return n;
}
    1395:	5b                   	pop    %ebx
    1396:	5d                   	pop    %ebp
    1397:	c3                   	ret    
    1398:	90                   	nop
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	56                   	push   %esi
    13a4:	53                   	push   %ebx
    13a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13a8:	8b 45 08             	mov    0x8(%ebp),%eax
    13ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13ae:	85 db                	test   %ebx,%ebx
    13b0:	7e 14                	jle    13c6 <memmove+0x26>
    13b2:	31 d2                	xor    %edx,%edx
    13b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    13b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    13bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    13bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    13c2:	39 d3                	cmp    %edx,%ebx
    13c4:	75 f2                	jne    13b8 <memmove+0x18>
  return vdst;
}
    13c6:	5b                   	pop    %ebx
    13c7:	5e                   	pop    %esi
    13c8:	5d                   	pop    %ebp
    13c9:	c3                   	ret    

000013ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13ca:	b8 01 00 00 00       	mov    $0x1,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <exit>:
SYSCALL(exit)
    13d2:	b8 02 00 00 00       	mov    $0x2,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <wait>:
SYSCALL(wait)
    13da:	b8 03 00 00 00       	mov    $0x3,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <pipe>:
SYSCALL(pipe)
    13e2:	b8 04 00 00 00       	mov    $0x4,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <read>:
SYSCALL(read)
    13ea:	b8 05 00 00 00       	mov    $0x5,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <write>:
SYSCALL(write)
    13f2:	b8 10 00 00 00       	mov    $0x10,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <close>:
SYSCALL(close)
    13fa:	b8 15 00 00 00       	mov    $0x15,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <kill>:
SYSCALL(kill)
    1402:	b8 06 00 00 00       	mov    $0x6,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <exec>:
SYSCALL(exec)
    140a:	b8 07 00 00 00       	mov    $0x7,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    

00001412 <open>:
SYSCALL(open)
    1412:	b8 0f 00 00 00       	mov    $0xf,%eax
    1417:	cd 40                	int    $0x40
    1419:	c3                   	ret    

0000141a <mknod>:
SYSCALL(mknod)
    141a:	b8 11 00 00 00       	mov    $0x11,%eax
    141f:	cd 40                	int    $0x40
    1421:	c3                   	ret    

00001422 <unlink>:
SYSCALL(unlink)
    1422:	b8 12 00 00 00       	mov    $0x12,%eax
    1427:	cd 40                	int    $0x40
    1429:	c3                   	ret    

0000142a <fstat>:
SYSCALL(fstat)
    142a:	b8 08 00 00 00       	mov    $0x8,%eax
    142f:	cd 40                	int    $0x40
    1431:	c3                   	ret    

00001432 <link>:
SYSCALL(link)
    1432:	b8 13 00 00 00       	mov    $0x13,%eax
    1437:	cd 40                	int    $0x40
    1439:	c3                   	ret    

0000143a <mkdir>:
SYSCALL(mkdir)
    143a:	b8 14 00 00 00       	mov    $0x14,%eax
    143f:	cd 40                	int    $0x40
    1441:	c3                   	ret    

00001442 <chdir>:
SYSCALL(chdir)
    1442:	b8 09 00 00 00       	mov    $0x9,%eax
    1447:	cd 40                	int    $0x40
    1449:	c3                   	ret    

0000144a <dup>:
SYSCALL(dup)
    144a:	b8 0a 00 00 00       	mov    $0xa,%eax
    144f:	cd 40                	int    $0x40
    1451:	c3                   	ret    

00001452 <getpid>:
SYSCALL(getpid)
    1452:	b8 0b 00 00 00       	mov    $0xb,%eax
    1457:	cd 40                	int    $0x40
    1459:	c3                   	ret    

0000145a <sbrk>:
SYSCALL(sbrk)
    145a:	b8 0c 00 00 00       	mov    $0xc,%eax
    145f:	cd 40                	int    $0x40
    1461:	c3                   	ret    

00001462 <sleep>:
SYSCALL(sleep)
    1462:	b8 0d 00 00 00       	mov    $0xd,%eax
    1467:	cd 40                	int    $0x40
    1469:	c3                   	ret    

0000146a <uptime>:
SYSCALL(uptime)
    146a:	b8 0e 00 00 00       	mov    $0xe,%eax
    146f:	cd 40                	int    $0x40
    1471:	c3                   	ret    

00001472 <getreadcount>:
SYSCALL(getreadcount)
    1472:	b8 16 00 00 00       	mov    $0x16,%eax
    1477:	cd 40                	int    $0x40
    1479:	c3                   	ret    

0000147a <gettime>:
SYSCALL(gettime)
    147a:	b8 17 00 00 00       	mov    $0x17,%eax
    147f:	cd 40                	int    $0x40
    1481:	c3                   	ret    

00001482 <settickets>:
SYSCALL(settickets)
    1482:	b8 18 00 00 00       	mov    $0x18,%eax
    1487:	cd 40                	int    $0x40
    1489:	c3                   	ret    

0000148a <getpinfo>:
    148a:	b8 19 00 00 00       	mov    $0x19,%eax
    148f:	cd 40                	int    $0x40
    1491:	c3                   	ret    
    1492:	66 90                	xchg   %ax,%ax
    1494:	66 90                	xchg   %ax,%ax
    1496:	66 90                	xchg   %ax,%ax
    1498:	66 90                	xchg   %ax,%ax
    149a:	66 90                	xchg   %ax,%ax
    149c:	66 90                	xchg   %ax,%ax
    149e:	66 90                	xchg   %ax,%ax

000014a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
    14a4:	56                   	push   %esi
    14a5:	53                   	push   %ebx
    14a6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    14a9:	85 d2                	test   %edx,%edx
{
    14ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    14ae:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    14b0:	79 76                	jns    1528 <printint+0x88>
    14b2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    14b6:	74 70                	je     1528 <printint+0x88>
    x = -xx;
    14b8:	f7 d8                	neg    %eax
    neg = 1;
    14ba:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    14c1:	31 f6                	xor    %esi,%esi
    14c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    14c6:	eb 0a                	jmp    14d2 <printint+0x32>
    14c8:	90                   	nop
    14c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    14d0:	89 fe                	mov    %edi,%esi
    14d2:	31 d2                	xor    %edx,%edx
    14d4:	8d 7e 01             	lea    0x1(%esi),%edi
    14d7:	f7 f1                	div    %ecx
    14d9:	0f b6 92 f8 18 00 00 	movzbl 0x18f8(%edx),%edx
  }while((x /= base) != 0);
    14e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    14e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    14e5:	75 e9                	jne    14d0 <printint+0x30>
  if(neg)
    14e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    14ea:	85 c0                	test   %eax,%eax
    14ec:	74 08                	je     14f6 <printint+0x56>
    buf[i++] = '-';
    14ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    14f3:	8d 7e 02             	lea    0x2(%esi),%edi
    14f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    14fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    14fd:	8d 76 00             	lea    0x0(%esi),%esi
    1500:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1503:	83 ec 04             	sub    $0x4,%esp
    1506:	83 ee 01             	sub    $0x1,%esi
    1509:	6a 01                	push   $0x1
    150b:	53                   	push   %ebx
    150c:	57                   	push   %edi
    150d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1510:	e8 dd fe ff ff       	call   13f2 <write>

  while(--i >= 0)
    1515:	83 c4 10             	add    $0x10,%esp
    1518:	39 de                	cmp    %ebx,%esi
    151a:	75 e4                	jne    1500 <printint+0x60>
    putc(fd, buf[i]);
}
    151c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    151f:	5b                   	pop    %ebx
    1520:	5e                   	pop    %esi
    1521:	5f                   	pop    %edi
    1522:	5d                   	pop    %ebp
    1523:	c3                   	ret    
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1528:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    152f:	eb 90                	jmp    14c1 <printint+0x21>
    1531:	eb 0d                	jmp    1540 <printf>
    1533:	90                   	nop
    1534:	90                   	nop
    1535:	90                   	nop
    1536:	90                   	nop
    1537:	90                   	nop
    1538:	90                   	nop
    1539:	90                   	nop
    153a:	90                   	nop
    153b:	90                   	nop
    153c:	90                   	nop
    153d:	90                   	nop
    153e:	90                   	nop
    153f:	90                   	nop

00001540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	57                   	push   %edi
    1544:	56                   	push   %esi
    1545:	53                   	push   %ebx
    1546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1549:	8b 75 0c             	mov    0xc(%ebp),%esi
    154c:	0f b6 1e             	movzbl (%esi),%ebx
    154f:	84 db                	test   %bl,%bl
    1551:	0f 84 bf 00 00 00    	je     1616 <printf+0xd6>
    1557:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    155a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    155d:	31 d2                	xor    %edx,%edx
    155f:	eb 39                	jmp    159a <printf+0x5a>
    1561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1568:	83 f8 25             	cmp    $0x25,%eax
    156b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    156e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1573:	74 1a                	je     158f <printf+0x4f>
  write(fd, &c, 1);
    1575:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1578:	83 ec 04             	sub    $0x4,%esp
    157b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    157e:	6a 01                	push   $0x1
    1580:	50                   	push   %eax
    1581:	ff 75 08             	pushl  0x8(%ebp)
    1584:	e8 69 fe ff ff       	call   13f2 <write>
    1589:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    158c:	83 c4 10             	add    $0x10,%esp
    158f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1592:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1596:	84 db                	test   %bl,%bl
    1598:	74 7c                	je     1616 <printf+0xd6>
    if(state == 0){
    159a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    159c:	0f be cb             	movsbl %bl,%ecx
    159f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    15a2:	74 c4                	je     1568 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    15a4:	83 fa 25             	cmp    $0x25,%edx
    15a7:	75 e6                	jne    158f <printf+0x4f>
      if(c == 'd'){
    15a9:	83 f8 64             	cmp    $0x64,%eax
    15ac:	0f 84 a6 00 00 00    	je     1658 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    15b2:	83 f8 6c             	cmp    $0x6c,%eax
    15b5:	0f 84 ad 00 00 00    	je     1668 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    15bb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    15c1:	83 f9 70             	cmp    $0x70,%ecx
    15c4:	74 5a                	je     1620 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    15c6:	83 f8 73             	cmp    $0x73,%eax
    15c9:	0f 84 e1 00 00 00    	je     16b0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15cf:	83 f8 63             	cmp    $0x63,%eax
    15d2:	0f 84 28 01 00 00    	je     1700 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    15d8:	83 f8 25             	cmp    $0x25,%eax
    15db:	74 6b                	je     1648 <printf+0x108>
  write(fd, &c, 1);
    15dd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    15e0:	83 ec 04             	sub    $0x4,%esp
    15e3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    15e7:	6a 01                	push   $0x1
    15e9:	50                   	push   %eax
    15ea:	ff 75 08             	pushl  0x8(%ebp)
    15ed:	e8 00 fe ff ff       	call   13f2 <write>
    15f2:	83 c4 0c             	add    $0xc,%esp
    15f5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    15f8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    15fb:	6a 01                	push   $0x1
    15fd:	50                   	push   %eax
    15fe:	ff 75 08             	pushl  0x8(%ebp)
    1601:	83 c6 01             	add    $0x1,%esi
    1604:	e8 e9 fd ff ff       	call   13f2 <write>
  for(i = 0; fmt[i]; i++){
    1609:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    160d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1610:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1612:	84 db                	test   %bl,%bl
    1614:	75 84                	jne    159a <printf+0x5a>
    }
  }
}
    1616:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1619:	5b                   	pop    %ebx
    161a:	5e                   	pop    %esi
    161b:	5f                   	pop    %edi
    161c:	5d                   	pop    %ebp
    161d:	c3                   	ret    
    161e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1620:	83 ec 0c             	sub    $0xc,%esp
    1623:	b9 10 00 00 00       	mov    $0x10,%ecx
    1628:	6a 00                	push   $0x0
    162a:	8b 17                	mov    (%edi),%edx
    162c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    162f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1632:	e8 69 fe ff ff       	call   14a0 <printint>
    1637:	83 c4 10             	add    $0x10,%esp
      state = 0;
    163a:	31 d2                	xor    %edx,%edx
    163c:	e9 4e ff ff ff       	jmp    158f <printf+0x4f>
    1641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1648:	83 ec 04             	sub    $0x4,%esp
    164b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    164e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1651:	6a 01                	push   $0x1
    1653:	eb a8                	jmp    15fd <printf+0xbd>
    1655:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1658:	83 ec 0c             	sub    $0xc,%esp
    165b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1660:	6a 01                	push   $0x1
    1662:	eb c6                	jmp    162a <printf+0xea>
    1664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1668:	8b 57 04             	mov    0x4(%edi),%edx
    166b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    166d:	85 d2                	test   %edx,%edx
    166f:	74 15                	je     1686 <printf+0x146>
    1671:	83 ec 0c             	sub    $0xc,%esp
    1674:	8b 45 08             	mov    0x8(%ebp),%eax
    1677:	b9 10 00 00 00       	mov    $0x10,%ecx
    167c:	6a 00                	push   $0x0
    167e:	e8 1d fe ff ff       	call   14a0 <printint>
    1683:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1686:	83 ec 0c             	sub    $0xc,%esp
    1689:	8b 45 08             	mov    0x8(%ebp),%eax
    168c:	89 da                	mov    %ebx,%edx
    168e:	6a 00                	push   $0x0
    1690:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1695:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1698:	e8 03 fe ff ff       	call   14a0 <printint>
    169d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16a0:	31 d2                	xor    %edx,%edx
    16a2:	e9 e8 fe ff ff       	jmp    158f <printf+0x4f>
    16a7:	89 f6                	mov    %esi,%esi
    16a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    16b0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    16b2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    16b5:	85 c9                	test   %ecx,%ecx
    16b7:	74 6a                	je     1723 <printf+0x1e3>
        while(*s != 0){
    16b9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    16bc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    16be:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    16c0:	84 c0                	test   %al,%al
    16c2:	0f 84 c7 fe ff ff    	je     158f <printf+0x4f>
    16c8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    16cb:	89 de                	mov    %ebx,%esi
    16cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    16d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    16d6:	83 ec 04             	sub    $0x4,%esp
    16d9:	6a 01                	push   $0x1
          s++;
    16db:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    16de:	50                   	push   %eax
    16df:	53                   	push   %ebx
    16e0:	e8 0d fd ff ff       	call   13f2 <write>
        while(*s != 0){
    16e5:	0f b6 06             	movzbl (%esi),%eax
    16e8:	83 c4 10             	add    $0x10,%esp
    16eb:	84 c0                	test   %al,%al
    16ed:	75 e1                	jne    16d0 <printf+0x190>
    16ef:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    16f2:	31 d2                	xor    %edx,%edx
    16f4:	e9 96 fe ff ff       	jmp    158f <printf+0x4f>
    16f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1700:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1702:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1705:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1708:	6a 01                	push   $0x1
        putc(fd, *ap);
    170a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    170d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1710:	50                   	push   %eax
    1711:	ff 75 08             	pushl  0x8(%ebp)
    1714:	e8 d9 fc ff ff       	call   13f2 <write>
    1719:	83 c4 10             	add    $0x10,%esp
      state = 0;
    171c:	31 d2                	xor    %edx,%edx
    171e:	e9 6c fe ff ff       	jmp    158f <printf+0x4f>
          s = "(null)";
    1723:	bb ef 18 00 00       	mov    $0x18ef,%ebx
        while(*s != 0){
    1728:	b8 28 00 00 00       	mov    $0x28,%eax
    172d:	eb 99                	jmp    16c8 <printf+0x188>
    172f:	90                   	nop

00001730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1731:	a1 e0 1b 00 00       	mov    0x1be0,%eax
{
    1736:	89 e5                	mov    %esp,%ebp
    1738:	57                   	push   %edi
    1739:	56                   	push   %esi
    173a:	53                   	push   %ebx
    173b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    173e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1748:	39 c8                	cmp    %ecx,%eax
    174a:	8b 10                	mov    (%eax),%edx
    174c:	73 32                	jae    1780 <free+0x50>
    174e:	39 d1                	cmp    %edx,%ecx
    1750:	72 04                	jb     1756 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1752:	39 d0                	cmp    %edx,%eax
    1754:	72 32                	jb     1788 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1756:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1759:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    175c:	39 fa                	cmp    %edi,%edx
    175e:	74 30                	je     1790 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1760:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1763:	8b 50 04             	mov    0x4(%eax),%edx
    1766:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1769:	39 f1                	cmp    %esi,%ecx
    176b:	74 3a                	je     17a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    176d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    176f:	a3 e0 1b 00 00       	mov    %eax,0x1be0
}
    1774:	5b                   	pop    %ebx
    1775:	5e                   	pop    %esi
    1776:	5f                   	pop    %edi
    1777:	5d                   	pop    %ebp
    1778:	c3                   	ret    
    1779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1780:	39 d0                	cmp    %edx,%eax
    1782:	72 04                	jb     1788 <free+0x58>
    1784:	39 d1                	cmp    %edx,%ecx
    1786:	72 ce                	jb     1756 <free+0x26>
{
    1788:	89 d0                	mov    %edx,%eax
    178a:	eb bc                	jmp    1748 <free+0x18>
    178c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1790:	03 72 04             	add    0x4(%edx),%esi
    1793:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1796:	8b 10                	mov    (%eax),%edx
    1798:	8b 12                	mov    (%edx),%edx
    179a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    179d:	8b 50 04             	mov    0x4(%eax),%edx
    17a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    17a3:	39 f1                	cmp    %esi,%ecx
    17a5:	75 c6                	jne    176d <free+0x3d>
    p->s.size += bp->s.size;
    17a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    17aa:	a3 e0 1b 00 00       	mov    %eax,0x1be0
    p->s.size += bp->s.size;
    17af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    17b2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    17b5:	89 10                	mov    %edx,(%eax)
}
    17b7:	5b                   	pop    %ebx
    17b8:	5e                   	pop    %esi
    17b9:	5f                   	pop    %edi
    17ba:	5d                   	pop    %ebp
    17bb:	c3                   	ret    
    17bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000017c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    17c0:	55                   	push   %ebp
    17c1:	89 e5                	mov    %esp,%ebp
    17c3:	57                   	push   %edi
    17c4:	56                   	push   %esi
    17c5:	53                   	push   %ebx
    17c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    17cc:	8b 15 e0 1b 00 00    	mov    0x1be0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17d2:	8d 78 07             	lea    0x7(%eax),%edi
    17d5:	c1 ef 03             	shr    $0x3,%edi
    17d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    17db:	85 d2                	test   %edx,%edx
    17dd:	0f 84 9d 00 00 00    	je     1880 <malloc+0xc0>
    17e3:	8b 02                	mov    (%edx),%eax
    17e5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    17e8:	39 cf                	cmp    %ecx,%edi
    17ea:	76 6c                	jbe    1858 <malloc+0x98>
    17ec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    17f2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    17f7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    17fa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1801:	eb 0e                	jmp    1811 <malloc+0x51>
    1803:	90                   	nop
    1804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1808:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    180a:	8b 48 04             	mov    0x4(%eax),%ecx
    180d:	39 f9                	cmp    %edi,%ecx
    180f:	73 47                	jae    1858 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1811:	39 05 e0 1b 00 00    	cmp    %eax,0x1be0
    1817:	89 c2                	mov    %eax,%edx
    1819:	75 ed                	jne    1808 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    181b:	83 ec 0c             	sub    $0xc,%esp
    181e:	56                   	push   %esi
    181f:	e8 36 fc ff ff       	call   145a <sbrk>
  if(p == (char*)-1)
    1824:	83 c4 10             	add    $0x10,%esp
    1827:	83 f8 ff             	cmp    $0xffffffff,%eax
    182a:	74 1c                	je     1848 <malloc+0x88>
  hp->s.size = nu;
    182c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    182f:	83 ec 0c             	sub    $0xc,%esp
    1832:	83 c0 08             	add    $0x8,%eax
    1835:	50                   	push   %eax
    1836:	e8 f5 fe ff ff       	call   1730 <free>
  return freep;
    183b:	8b 15 e0 1b 00 00    	mov    0x1be0,%edx
      if((p = morecore(nunits)) == 0)
    1841:	83 c4 10             	add    $0x10,%esp
    1844:	85 d2                	test   %edx,%edx
    1846:	75 c0                	jne    1808 <malloc+0x48>
        return 0;
  }
}
    1848:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    184b:	31 c0                	xor    %eax,%eax
}
    184d:	5b                   	pop    %ebx
    184e:	5e                   	pop    %esi
    184f:	5f                   	pop    %edi
    1850:	5d                   	pop    %ebp
    1851:	c3                   	ret    
    1852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1858:	39 cf                	cmp    %ecx,%edi
    185a:	74 54                	je     18b0 <malloc+0xf0>
        p->s.size -= nunits;
    185c:	29 f9                	sub    %edi,%ecx
    185e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1861:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1864:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1867:	89 15 e0 1b 00 00    	mov    %edx,0x1be0
}
    186d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1870:	83 c0 08             	add    $0x8,%eax
}
    1873:	5b                   	pop    %ebx
    1874:	5e                   	pop    %esi
    1875:	5f                   	pop    %edi
    1876:	5d                   	pop    %ebp
    1877:	c3                   	ret    
    1878:	90                   	nop
    1879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1880:	c7 05 e0 1b 00 00 e4 	movl   $0x1be4,0x1be0
    1887:	1b 00 00 
    188a:	c7 05 e4 1b 00 00 e4 	movl   $0x1be4,0x1be4
    1891:	1b 00 00 
    base.s.size = 0;
    1894:	b8 e4 1b 00 00       	mov    $0x1be4,%eax
    1899:	c7 05 e8 1b 00 00 00 	movl   $0x0,0x1be8
    18a0:	00 00 00 
    18a3:	e9 44 ff ff ff       	jmp    17ec <malloc+0x2c>
    18a8:	90                   	nop
    18a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    18b0:	8b 08                	mov    (%eax),%ecx
    18b2:	89 0a                	mov    %ecx,(%edx)
    18b4:	eb b1                	jmp    1867 <malloc+0xa7>
