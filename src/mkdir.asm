
_mkdir:     file format elf32-i386


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
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	bf 01 00 00 00       	mov    $0x1,%edi
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 31                	mov    (%ecx),%esi
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
    1021:	83 fe 01             	cmp    $0x1,%esi
    1024:	7e 3e                	jle    1064 <main+0x64>
    1026:	8d 76 00             	lea    0x0(%esi),%esi
    1029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 33                	pushl  (%ebx)
    1035:	e8 00 03 00 00       	call   133a <mkdir>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	85 c0                	test   %eax,%eax
    103f:	78 0f                	js     1050 <main+0x50>
  for(i = 1; i < argc; i++){
    1041:	83 c7 01             	add    $0x1,%edi
    1044:	83 c3 04             	add    $0x4,%ebx
    1047:	39 fe                	cmp    %edi,%esi
    1049:	75 e5                	jne    1030 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
    104b:	e8 82 02 00 00       	call   12d2 <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
    1050:	50                   	push   %eax
    1051:	ff 33                	pushl  (%ebx)
    1053:	68 df 17 00 00       	push   $0x17df
    1058:	6a 02                	push   $0x2
    105a:	e8 f1 03 00 00       	call   1450 <printf>
      break;
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	eb e7                	jmp    104b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
    1064:	52                   	push   %edx
    1065:	52                   	push   %edx
    1066:	68 c8 17 00 00       	push   $0x17c8
    106b:	6a 02                	push   $0x2
    106d:	e8 de 03 00 00       	call   1450 <printf>
    exit();
    1072:	e8 5b 02 00 00       	call   12d2 <exit>
    1077:	66 90                	xchg   %ax,%ax
    1079:	66 90                	xchg   %ax,%ax
    107b:	66 90                	xchg   %ax,%ax
    107d:	66 90                	xchg   %ax,%ax
    107f:	90                   	nop

00001080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	53                   	push   %ebx
    1084:	8b 45 08             	mov    0x8(%ebp),%eax
    1087:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    108a:	89 c2                	mov    %eax,%edx
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1090:	83 c1 01             	add    $0x1,%ecx
    1093:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1097:	83 c2 01             	add    $0x1,%edx
    109a:	84 db                	test   %bl,%bl
    109c:	88 5a ff             	mov    %bl,-0x1(%edx)
    109f:	75 ef                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    10a1:	5b                   	pop    %ebx
    10a2:	5d                   	pop    %ebp
    10a3:	c3                   	ret    
    10a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	8b 55 08             	mov    0x8(%ebp),%edx
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ba:	0f b6 02             	movzbl (%edx),%eax
    10bd:	0f b6 19             	movzbl (%ecx),%ebx
    10c0:	84 c0                	test   %al,%al
    10c2:	75 1c                	jne    10e0 <strcmp+0x30>
    10c4:	eb 2a                	jmp    10f0 <strcmp+0x40>
    10c6:	8d 76 00             	lea    0x0(%esi),%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10d6:	83 c1 01             	add    $0x1,%ecx
    10d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10dc:	84 c0                	test   %al,%al
    10de:	74 10                	je     10f0 <strcmp+0x40>
    10e0:	38 d8                	cmp    %bl,%al
    10e2:	74 ec                	je     10d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10e4:	29 d8                	sub    %ebx,%eax
}
    10e6:	5b                   	pop    %ebx
    10e7:	5d                   	pop    %ebp
    10e8:	c3                   	ret    
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10f2:	29 d8                	sub    %ebx,%eax
}
    10f4:	5b                   	pop    %ebx
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strlen>:

uint
strlen(const char *s)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1106:	80 39 00             	cmpb   $0x0,(%ecx)
    1109:	74 15                	je     1120 <strlen+0x20>
    110b:	31 d2                	xor    %edx,%edx
    110d:	8d 76 00             	lea    0x0(%esi),%esi
    1110:	83 c2 01             	add    $0x1,%edx
    1113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1117:	89 d0                	mov    %edx,%eax
    1119:	75 f5                	jne    1110 <strlen+0x10>
    ;
  return n;
}
    111b:	5d                   	pop    %ebp
    111c:	c3                   	ret    
    111d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1120:	31 c0                	xor    %eax,%eax
}
    1122:	5d                   	pop    %ebp
    1123:	c3                   	ret    
    1124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    112a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001130 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1137:	8b 4d 10             	mov    0x10(%ebp),%ecx
    113a:	8b 45 0c             	mov    0xc(%ebp),%eax
    113d:	89 d7                	mov    %edx,%edi
    113f:	fc                   	cld    
    1140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1142:	89 d0                	mov    %edx,%eax
    1144:	5f                   	pop    %edi
    1145:	5d                   	pop    %ebp
    1146:	c3                   	ret    
    1147:	89 f6                	mov    %esi,%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001150 <strchr>:

char*
strchr(const char *s, char c)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	53                   	push   %ebx
    1154:	8b 45 08             	mov    0x8(%ebp),%eax
    1157:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    115a:	0f b6 10             	movzbl (%eax),%edx
    115d:	84 d2                	test   %dl,%dl
    115f:	74 1d                	je     117e <strchr+0x2e>
    if(*s == c)
    1161:	38 d3                	cmp    %dl,%bl
    1163:	89 d9                	mov    %ebx,%ecx
    1165:	75 0d                	jne    1174 <strchr+0x24>
    1167:	eb 17                	jmp    1180 <strchr+0x30>
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1170:	38 ca                	cmp    %cl,%dl
    1172:	74 0c                	je     1180 <strchr+0x30>
  for(; *s; s++)
    1174:	83 c0 01             	add    $0x1,%eax
    1177:	0f b6 10             	movzbl (%eax),%edx
    117a:	84 d2                	test   %dl,%dl
    117c:	75 f2                	jne    1170 <strchr+0x20>
      return (char*)s;
  return 0;
    117e:	31 c0                	xor    %eax,%eax
}
    1180:	5b                   	pop    %ebx
    1181:	5d                   	pop    %ebp
    1182:	c3                   	ret    
    1183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <gets>:

char*
gets(char *buf, int max)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
    1195:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1196:	31 f6                	xor    %esi,%esi
    1198:	89 f3                	mov    %esi,%ebx
{
    119a:	83 ec 1c             	sub    $0x1c,%esp
    119d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11a0:	eb 2f                	jmp    11d1 <gets+0x41>
    11a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11ab:	83 ec 04             	sub    $0x4,%esp
    11ae:	6a 01                	push   $0x1
    11b0:	50                   	push   %eax
    11b1:	6a 00                	push   $0x0
    11b3:	e8 32 01 00 00       	call   12ea <read>
    if(cc < 1)
    11b8:	83 c4 10             	add    $0x10,%esp
    11bb:	85 c0                	test   %eax,%eax
    11bd:	7e 1c                	jle    11db <gets+0x4b>
      break;
    buf[i++] = c;
    11bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11c3:	83 c7 01             	add    $0x1,%edi
    11c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11c9:	3c 0a                	cmp    $0xa,%al
    11cb:	74 23                	je     11f0 <gets+0x60>
    11cd:	3c 0d                	cmp    $0xd,%al
    11cf:	74 1f                	je     11f0 <gets+0x60>
  for(i=0; i+1 < max; ){
    11d1:	83 c3 01             	add    $0x1,%ebx
    11d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11d7:	89 fe                	mov    %edi,%esi
    11d9:	7c cd                	jl     11a8 <gets+0x18>
    11db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11e0:	c6 03 00             	movb   $0x0,(%ebx)
}
    11e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11e6:	5b                   	pop    %ebx
    11e7:	5e                   	pop    %esi
    11e8:	5f                   	pop    %edi
    11e9:	5d                   	pop    %ebp
    11ea:	c3                   	ret    
    11eb:	90                   	nop
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11f0:	8b 75 08             	mov    0x8(%ebp),%esi
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	01 de                	add    %ebx,%esi
    11f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11fa:	c6 03 00             	movb   $0x0,(%ebx)
}
    11fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1200:	5b                   	pop    %ebx
    1201:	5e                   	pop    %esi
    1202:	5f                   	pop    %edi
    1203:	5d                   	pop    %ebp
    1204:	c3                   	ret    
    1205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <stat>:

int
stat(const char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	pushl  0x8(%ebp)
    121d:	e8 f0 00 00 00       	call   1312 <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	pushl  0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 f3 00 00 00       	call   132a <fstat>
  close(fd);
    1237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123a:	89 c6                	mov    %eax,%esi
  close(fd);
    123c:	e8 b9 00 00 00       	call   12fa <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
}
    1244:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1247:	89 f0                	mov    %esi,%eax
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1250:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1255:	eb ed                	jmp    1244 <stat+0x34>
    1257:	89 f6                	mov    %esi,%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 11             	movsbl (%ecx),%edx
    126a:	8d 42 d0             	lea    -0x30(%edx),%eax
    126d:	3c 09                	cmp    $0x9,%al
  n = 0;
    126f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1274:	77 1f                	ja     1295 <atoi+0x35>
    1276:	8d 76 00             	lea    0x0(%esi),%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1280:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1283:	83 c1 01             	add    $0x1,%ecx
    1286:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    128a:	0f be 11             	movsbl (%ecx),%edx
    128d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	5b                   	pop    %ebx
    1296:	5d                   	pop    %ebp
    1297:	c3                   	ret    
    1298:	90                   	nop
    1299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
    12a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12a8:	8b 45 08             	mov    0x8(%ebp),%eax
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 db                	test   %ebx,%ebx
    12b0:	7e 14                	jle    12c6 <memmove+0x26>
    12b2:	31 d2                	xor    %edx,%edx
    12b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12c2:	39 d3                	cmp    %edx,%ebx
    12c4:	75 f2                	jne    12b8 <memmove+0x18>
  return vdst;
}
    12c6:	5b                   	pop    %ebx
    12c7:	5e                   	pop    %esi
    12c8:	5d                   	pop    %ebp
    12c9:	c3                   	ret    

000012ca <fork>:
    12ca:	b8 01 00 00 00       	mov    $0x1,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <exit>:
    12d2:	b8 02 00 00 00       	mov    $0x2,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <wait>:
    12da:	b8 03 00 00 00       	mov    $0x3,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <pipe>:
    12e2:	b8 04 00 00 00       	mov    $0x4,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <read>:
    12ea:	b8 05 00 00 00       	mov    $0x5,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <write>:
    12f2:	b8 10 00 00 00       	mov    $0x10,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <close>:
    12fa:	b8 15 00 00 00       	mov    $0x15,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <kill>:
    1302:	b8 06 00 00 00       	mov    $0x6,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <exec>:
    130a:	b8 07 00 00 00       	mov    $0x7,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <open>:
    1312:	b8 0f 00 00 00       	mov    $0xf,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <mknod>:
    131a:	b8 11 00 00 00       	mov    $0x11,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <unlink>:
    1322:	b8 12 00 00 00       	mov    $0x12,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <fstat>:
    132a:	b8 08 00 00 00       	mov    $0x8,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <link>:
    1332:	b8 13 00 00 00       	mov    $0x13,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <mkdir>:
    133a:	b8 14 00 00 00       	mov    $0x14,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <chdir>:
    1342:	b8 09 00 00 00       	mov    $0x9,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <dup>:
    134a:	b8 0a 00 00 00       	mov    $0xa,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <getpid>:
    1352:	b8 0b 00 00 00       	mov    $0xb,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <sbrk>:
    135a:	b8 0c 00 00 00       	mov    $0xc,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <sleep>:
    1362:	b8 0d 00 00 00       	mov    $0xd,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <uptime>:
    136a:	b8 0e 00 00 00       	mov    $0xe,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <getreadcount>:
    1372:	b8 16 00 00 00       	mov    $0x16,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <gettime>:
    137a:	b8 17 00 00 00       	mov    $0x17,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <settickets>:
    1382:	b8 18 00 00 00       	mov    $0x18,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <getpinfo>:
    138a:	b8 19 00 00 00       	mov    $0x19,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <mprotect>:
    1392:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <munprotect>:
    139a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    
    13a2:	66 90                	xchg   %ax,%ax
    13a4:	66 90                	xchg   %ax,%ax
    13a6:	66 90                	xchg   %ax,%ax
    13a8:	66 90                	xchg   %ax,%ax
    13aa:	66 90                	xchg   %ax,%ax
    13ac:	66 90                	xchg   %ax,%ax
    13ae:	66 90                	xchg   %ax,%ax

000013b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	57                   	push   %edi
    13b4:	56                   	push   %esi
    13b5:	53                   	push   %ebx
    13b6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13b9:	85 d2                	test   %edx,%edx
{
    13bb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    13be:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    13c0:	79 76                	jns    1438 <printint+0x88>
    13c2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13c6:	74 70                	je     1438 <printint+0x88>
    x = -xx;
    13c8:	f7 d8                	neg    %eax
    neg = 1;
    13ca:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    13d1:	31 f6                	xor    %esi,%esi
    13d3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13d6:	eb 0a                	jmp    13e2 <printint+0x32>
    13d8:	90                   	nop
    13d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    13e0:	89 fe                	mov    %edi,%esi
    13e2:	31 d2                	xor    %edx,%edx
    13e4:	8d 7e 01             	lea    0x1(%esi),%edi
    13e7:	f7 f1                	div    %ecx
    13e9:	0f b6 92 04 18 00 00 	movzbl 0x1804(%edx),%edx
  }while((x /= base) != 0);
    13f0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    13f2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    13f5:	75 e9                	jne    13e0 <printint+0x30>
  if(neg)
    13f7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13fa:	85 c0                	test   %eax,%eax
    13fc:	74 08                	je     1406 <printint+0x56>
    buf[i++] = '-';
    13fe:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1403:	8d 7e 02             	lea    0x2(%esi),%edi
    1406:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    140a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    140d:	8d 76 00             	lea    0x0(%esi),%esi
    1410:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1413:	83 ec 04             	sub    $0x4,%esp
    1416:	83 ee 01             	sub    $0x1,%esi
    1419:	6a 01                	push   $0x1
    141b:	53                   	push   %ebx
    141c:	57                   	push   %edi
    141d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1420:	e8 cd fe ff ff       	call   12f2 <write>

  while(--i >= 0)
    1425:	83 c4 10             	add    $0x10,%esp
    1428:	39 de                	cmp    %ebx,%esi
    142a:	75 e4                	jne    1410 <printint+0x60>
    putc(fd, buf[i]);
}
    142c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    142f:	5b                   	pop    %ebx
    1430:	5e                   	pop    %esi
    1431:	5f                   	pop    %edi
    1432:	5d                   	pop    %ebp
    1433:	c3                   	ret    
    1434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1438:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    143f:	eb 90                	jmp    13d1 <printint+0x21>
    1441:	eb 0d                	jmp    1450 <printf>
    1443:	90                   	nop
    1444:	90                   	nop
    1445:	90                   	nop
    1446:	90                   	nop
    1447:	90                   	nop
    1448:	90                   	nop
    1449:	90                   	nop
    144a:	90                   	nop
    144b:	90                   	nop
    144c:	90                   	nop
    144d:	90                   	nop
    144e:	90                   	nop
    144f:	90                   	nop

00001450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	57                   	push   %edi
    1454:	56                   	push   %esi
    1455:	53                   	push   %ebx
    1456:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1459:	8b 75 0c             	mov    0xc(%ebp),%esi
    145c:	0f b6 1e             	movzbl (%esi),%ebx
    145f:	84 db                	test   %bl,%bl
    1461:	0f 84 bf 00 00 00    	je     1526 <printf+0xd6>
    1467:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    146a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    146d:	31 d2                	xor    %edx,%edx
    146f:	eb 39                	jmp    14aa <printf+0x5a>
    1471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1478:	83 f8 25             	cmp    $0x25,%eax
    147b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    147e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1483:	74 1a                	je     149f <printf+0x4f>
  write(fd, &c, 1);
    1485:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1488:	83 ec 04             	sub    $0x4,%esp
    148b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    148e:	6a 01                	push   $0x1
    1490:	50                   	push   %eax
    1491:	ff 75 08             	pushl  0x8(%ebp)
    1494:	e8 59 fe ff ff       	call   12f2 <write>
    1499:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    149c:	83 c4 10             	add    $0x10,%esp
    149f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    14a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    14a6:	84 db                	test   %bl,%bl
    14a8:	74 7c                	je     1526 <printf+0xd6>
    if(state == 0){
    14aa:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    14ac:	0f be cb             	movsbl %bl,%ecx
    14af:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14b2:	74 c4                	je     1478 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    14b4:	83 fa 25             	cmp    $0x25,%edx
    14b7:	75 e6                	jne    149f <printf+0x4f>
      if(c == 'd'){
    14b9:	83 f8 64             	cmp    $0x64,%eax
    14bc:	0f 84 a6 00 00 00    	je     1568 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    14c2:	83 f8 6c             	cmp    $0x6c,%eax
    14c5:	0f 84 ad 00 00 00    	je     1578 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    14cb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14d1:	83 f9 70             	cmp    $0x70,%ecx
    14d4:	74 5a                	je     1530 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14d6:	83 f8 73             	cmp    $0x73,%eax
    14d9:	0f 84 e1 00 00 00    	je     15c0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14df:	83 f8 63             	cmp    $0x63,%eax
    14e2:	0f 84 28 01 00 00    	je     1610 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14e8:	83 f8 25             	cmp    $0x25,%eax
    14eb:	74 6b                	je     1558 <printf+0x108>
  write(fd, &c, 1);
    14ed:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14f0:	83 ec 04             	sub    $0x4,%esp
    14f3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14f7:	6a 01                	push   $0x1
    14f9:	50                   	push   %eax
    14fa:	ff 75 08             	pushl  0x8(%ebp)
    14fd:	e8 f0 fd ff ff       	call   12f2 <write>
    1502:	83 c4 0c             	add    $0xc,%esp
    1505:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1508:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    150b:	6a 01                	push   $0x1
    150d:	50                   	push   %eax
    150e:	ff 75 08             	pushl  0x8(%ebp)
    1511:	83 c6 01             	add    $0x1,%esi
    1514:	e8 d9 fd ff ff       	call   12f2 <write>
  for(i = 0; fmt[i]; i++){
    1519:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    151d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1520:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1522:	84 db                	test   %bl,%bl
    1524:	75 84                	jne    14aa <printf+0x5a>
    }
  }
}
    1526:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1529:	5b                   	pop    %ebx
    152a:	5e                   	pop    %esi
    152b:	5f                   	pop    %edi
    152c:	5d                   	pop    %ebp
    152d:	c3                   	ret    
    152e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1530:	83 ec 0c             	sub    $0xc,%esp
    1533:	b9 10 00 00 00       	mov    $0x10,%ecx
    1538:	6a 00                	push   $0x0
    153a:	8b 17                	mov    (%edi),%edx
    153c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    153f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1542:	e8 69 fe ff ff       	call   13b0 <printint>
    1547:	83 c4 10             	add    $0x10,%esp
      state = 0;
    154a:	31 d2                	xor    %edx,%edx
    154c:	e9 4e ff ff ff       	jmp    149f <printf+0x4f>
    1551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1558:	83 ec 04             	sub    $0x4,%esp
    155b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    155e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1561:	6a 01                	push   $0x1
    1563:	eb a8                	jmp    150d <printf+0xbd>
    1565:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1568:	83 ec 0c             	sub    $0xc,%esp
    156b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1570:	6a 01                	push   $0x1
    1572:	eb c6                	jmp    153a <printf+0xea>
    1574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1578:	8b 57 04             	mov    0x4(%edi),%edx
    157b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    157d:	85 d2                	test   %edx,%edx
    157f:	74 15                	je     1596 <printf+0x146>
    1581:	83 ec 0c             	sub    $0xc,%esp
    1584:	8b 45 08             	mov    0x8(%ebp),%eax
    1587:	b9 10 00 00 00       	mov    $0x10,%ecx
    158c:	6a 00                	push   $0x0
    158e:	e8 1d fe ff ff       	call   13b0 <printint>
    1593:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1596:	83 ec 0c             	sub    $0xc,%esp
    1599:	8b 45 08             	mov    0x8(%ebp),%eax
    159c:	89 da                	mov    %ebx,%edx
    159e:	6a 00                	push   $0x0
    15a0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    15a5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    15a8:	e8 03 fe ff ff       	call   13b0 <printint>
    15ad:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15b0:	31 d2                	xor    %edx,%edx
    15b2:	e9 e8 fe ff ff       	jmp    149f <printf+0x4f>
    15b7:	89 f6                	mov    %esi,%esi
    15b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    15c0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    15c2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    15c5:	85 c9                	test   %ecx,%ecx
    15c7:	74 6a                	je     1633 <printf+0x1e3>
        while(*s != 0){
    15c9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    15cc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    15ce:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    15d0:	84 c0                	test   %al,%al
    15d2:	0f 84 c7 fe ff ff    	je     149f <printf+0x4f>
    15d8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15db:	89 de                	mov    %ebx,%esi
    15dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    15e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15e6:	83 ec 04             	sub    $0x4,%esp
    15e9:	6a 01                	push   $0x1
          s++;
    15eb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    15ee:	50                   	push   %eax
    15ef:	53                   	push   %ebx
    15f0:	e8 fd fc ff ff       	call   12f2 <write>
        while(*s != 0){
    15f5:	0f b6 06             	movzbl (%esi),%eax
    15f8:	83 c4 10             	add    $0x10,%esp
    15fb:	84 c0                	test   %al,%al
    15fd:	75 e1                	jne    15e0 <printf+0x190>
    15ff:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1602:	31 d2                	xor    %edx,%edx
    1604:	e9 96 fe ff ff       	jmp    149f <printf+0x4f>
    1609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1610:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1612:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1615:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1618:	6a 01                	push   $0x1
        putc(fd, *ap);
    161a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    161d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1620:	50                   	push   %eax
    1621:	ff 75 08             	pushl  0x8(%ebp)
    1624:	e8 c9 fc ff ff       	call   12f2 <write>
    1629:	83 c4 10             	add    $0x10,%esp
      state = 0;
    162c:	31 d2                	xor    %edx,%edx
    162e:	e9 6c fe ff ff       	jmp    149f <printf+0x4f>
          s = "(null)";
    1633:	bb fb 17 00 00       	mov    $0x17fb,%ebx
        while(*s != 0){
    1638:	b8 28 00 00 00       	mov    $0x28,%eax
    163d:	eb 99                	jmp    15d8 <printf+0x188>
    163f:	90                   	nop

00001640 <free>:
    1640:	55                   	push   %ebp
    1641:	a1 b4 1a 00 00       	mov    0x1ab4,%eax
    1646:	89 e5                	mov    %esp,%ebp
    1648:	57                   	push   %edi
    1649:	56                   	push   %esi
    164a:	53                   	push   %ebx
    164b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    164e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1658:	39 c8                	cmp    %ecx,%eax
    165a:	8b 10                	mov    (%eax),%edx
    165c:	73 32                	jae    1690 <free+0x50>
    165e:	39 d1                	cmp    %edx,%ecx
    1660:	72 04                	jb     1666 <free+0x26>
    1662:	39 d0                	cmp    %edx,%eax
    1664:	72 32                	jb     1698 <free+0x58>
    1666:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1669:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    166c:	39 fa                	cmp    %edi,%edx
    166e:	74 30                	je     16a0 <free+0x60>
    1670:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1673:	8b 50 04             	mov    0x4(%eax),%edx
    1676:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1679:	39 f1                	cmp    %esi,%ecx
    167b:	74 3a                	je     16b7 <free+0x77>
    167d:	89 08                	mov    %ecx,(%eax)
    167f:	a3 b4 1a 00 00       	mov    %eax,0x1ab4
    1684:	5b                   	pop    %ebx
    1685:	5e                   	pop    %esi
    1686:	5f                   	pop    %edi
    1687:	5d                   	pop    %ebp
    1688:	c3                   	ret    
    1689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1690:	39 d0                	cmp    %edx,%eax
    1692:	72 04                	jb     1698 <free+0x58>
    1694:	39 d1                	cmp    %edx,%ecx
    1696:	72 ce                	jb     1666 <free+0x26>
    1698:	89 d0                	mov    %edx,%eax
    169a:	eb bc                	jmp    1658 <free+0x18>
    169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16a0:	03 72 04             	add    0x4(%edx),%esi
    16a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    16a6:	8b 10                	mov    (%eax),%edx
    16a8:	8b 12                	mov    (%edx),%edx
    16aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
    16ad:	8b 50 04             	mov    0x4(%eax),%edx
    16b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16b3:	39 f1                	cmp    %esi,%ecx
    16b5:	75 c6                	jne    167d <free+0x3d>
    16b7:	03 53 fc             	add    -0x4(%ebx),%edx
    16ba:	a3 b4 1a 00 00       	mov    %eax,0x1ab4
    16bf:	89 50 04             	mov    %edx,0x4(%eax)
    16c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16c5:	89 10                	mov    %edx,(%eax)
    16c7:	5b                   	pop    %ebx
    16c8:	5e                   	pop    %esi
    16c9:	5f                   	pop    %edi
    16ca:	5d                   	pop    %ebp
    16cb:	c3                   	ret    
    16cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016d0 <malloc>:
    16d0:	55                   	push   %ebp
    16d1:	89 e5                	mov    %esp,%ebp
    16d3:	57                   	push   %edi
    16d4:	56                   	push   %esi
    16d5:	53                   	push   %ebx
    16d6:	83 ec 0c             	sub    $0xc,%esp
    16d9:	8b 45 08             	mov    0x8(%ebp),%eax
    16dc:	8b 15 b4 1a 00 00    	mov    0x1ab4,%edx
    16e2:	8d 78 07             	lea    0x7(%eax),%edi
    16e5:	c1 ef 03             	shr    $0x3,%edi
    16e8:	83 c7 01             	add    $0x1,%edi
    16eb:	85 d2                	test   %edx,%edx
    16ed:	0f 84 9d 00 00 00    	je     1790 <malloc+0xc0>
    16f3:	8b 02                	mov    (%edx),%eax
    16f5:	8b 48 04             	mov    0x4(%eax),%ecx
    16f8:	39 cf                	cmp    %ecx,%edi
    16fa:	76 6c                	jbe    1768 <malloc+0x98>
    16fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1702:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1707:	0f 43 df             	cmovae %edi,%ebx
    170a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1711:	eb 0e                	jmp    1721 <malloc+0x51>
    1713:	90                   	nop
    1714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1718:	8b 02                	mov    (%edx),%eax
    171a:	8b 48 04             	mov    0x4(%eax),%ecx
    171d:	39 f9                	cmp    %edi,%ecx
    171f:	73 47                	jae    1768 <malloc+0x98>
    1721:	39 05 b4 1a 00 00    	cmp    %eax,0x1ab4
    1727:	89 c2                	mov    %eax,%edx
    1729:	75 ed                	jne    1718 <malloc+0x48>
    172b:	83 ec 0c             	sub    $0xc,%esp
    172e:	56                   	push   %esi
    172f:	e8 26 fc ff ff       	call   135a <sbrk>
    1734:	83 c4 10             	add    $0x10,%esp
    1737:	83 f8 ff             	cmp    $0xffffffff,%eax
    173a:	74 1c                	je     1758 <malloc+0x88>
    173c:	89 58 04             	mov    %ebx,0x4(%eax)
    173f:	83 ec 0c             	sub    $0xc,%esp
    1742:	83 c0 08             	add    $0x8,%eax
    1745:	50                   	push   %eax
    1746:	e8 f5 fe ff ff       	call   1640 <free>
    174b:	8b 15 b4 1a 00 00    	mov    0x1ab4,%edx
    1751:	83 c4 10             	add    $0x10,%esp
    1754:	85 d2                	test   %edx,%edx
    1756:	75 c0                	jne    1718 <malloc+0x48>
    1758:	8d 65 f4             	lea    -0xc(%ebp),%esp
    175b:	31 c0                	xor    %eax,%eax
    175d:	5b                   	pop    %ebx
    175e:	5e                   	pop    %esi
    175f:	5f                   	pop    %edi
    1760:	5d                   	pop    %ebp
    1761:	c3                   	ret    
    1762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1768:	39 cf                	cmp    %ecx,%edi
    176a:	74 54                	je     17c0 <malloc+0xf0>
    176c:	29 f9                	sub    %edi,%ecx
    176e:	89 48 04             	mov    %ecx,0x4(%eax)
    1771:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1774:	89 78 04             	mov    %edi,0x4(%eax)
    1777:	89 15 b4 1a 00 00    	mov    %edx,0x1ab4
    177d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1780:	83 c0 08             	add    $0x8,%eax
    1783:	5b                   	pop    %ebx
    1784:	5e                   	pop    %esi
    1785:	5f                   	pop    %edi
    1786:	5d                   	pop    %ebp
    1787:	c3                   	ret    
    1788:	90                   	nop
    1789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1790:	c7 05 b4 1a 00 00 b8 	movl   $0x1ab8,0x1ab4
    1797:	1a 00 00 
    179a:	c7 05 b8 1a 00 00 b8 	movl   $0x1ab8,0x1ab8
    17a1:	1a 00 00 
    17a4:	b8 b8 1a 00 00       	mov    $0x1ab8,%eax
    17a9:	c7 05 bc 1a 00 00 00 	movl   $0x0,0x1abc
    17b0:	00 00 00 
    17b3:	e9 44 ff ff ff       	jmp    16fc <malloc+0x2c>
    17b8:	90                   	nop
    17b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17c0:	8b 08                	mov    (%eax),%ecx
    17c2:	89 0a                	mov    %ecx,(%edx)
    17c4:	eb b1                	jmp    1777 <malloc+0xa7>
