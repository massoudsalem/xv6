
_ps:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "user.h"
#include "pstat.h"

int main(int argc, char* argv[]){
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	8d b5 e8 fb ff ff    	lea    -0x418(%ebp),%esi
    1017:	8d bd e8 fc ff ff    	lea    -0x318(%ebp),%edi
    101d:	81 ec 08 04 00 00    	sub    $0x408,%esp
    1023:	90                   	nop
    1024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct pstat ps;
  while(1){
    getpinfo(&ps);
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	89 f3                	mov    %esi,%ebx
    102d:	56                   	push   %esi
    102e:	e8 77 03 00 00       	call   13aa <getpinfo>
    printf(1, "\nPID\t|\tUSED?\t|\tTickets\t|\tticks\n");
    1033:	58                   	pop    %eax
    1034:	5a                   	pop    %edx
    1035:	68 e8 17 00 00       	push   $0x17e8
    103a:	6a 01                	push   $0x1
    103c:	e8 2f 04 00 00       	call   1470 <printf>
    1041:	83 c4 10             	add    $0x10,%esp
    1044:	eb 11                	jmp    1057 <main+0x57>
    1046:	8d 76 00             	lea    0x0(%esi),%esi
    1049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1050:	83 c3 04             	add    $0x4,%ebx
    for (int i = 0; i < sizeof(ps.pid)/sizeof(ps.pid[0]); i++)
    1053:	39 fb                	cmp    %edi,%ebx
    1055:	74 32                	je     1089 <main+0x89>
    {
      if(ps.pid[i])
    1057:	8b 83 00 02 00 00    	mov    0x200(%ebx),%eax
    105d:	85 c0                	test   %eax,%eax
    105f:	74 ef                	je     1050 <main+0x50>
        printf(1, "%d\t|\t%d\t|\t%d\t|\t%d\n", ps.pid[i], ps.inuse[i], ps.tickets[i], ps.ticks[i]);
    1061:	83 ec 08             	sub    $0x8,%esp
    1064:	ff b3 00 03 00 00    	pushl  0x300(%ebx)
    106a:	ff b3 00 01 00 00    	pushl  0x100(%ebx)
    1070:	ff 33                	pushl  (%ebx)
    1072:	50                   	push   %eax
    1073:	83 c3 04             	add    $0x4,%ebx
    1076:	68 08 18 00 00       	push   $0x1808
    107b:	6a 01                	push   $0x1
    107d:	e8 ee 03 00 00       	call   1470 <printf>
    1082:	83 c4 20             	add    $0x20,%esp
    for (int i = 0; i < sizeof(ps.pid)/sizeof(ps.pid[0]); i++)
    1085:	39 fb                	cmp    %edi,%ebx
    1087:	75 ce                	jne    1057 <main+0x57>
    }
    sleep(200);
    1089:	83 ec 0c             	sub    $0xc,%esp
    108c:	68 c8 00 00 00       	push   $0xc8
    1091:	e8 ec 02 00 00       	call   1382 <sleep>
    getpinfo(&ps);
    1096:	83 c4 10             	add    $0x10,%esp
    1099:	eb 8d                	jmp    1028 <main+0x28>
    109b:	66 90                	xchg   %ax,%ax
    109d:	66 90                	xchg   %ax,%ax
    109f:	90                   	nop

000010a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	53                   	push   %ebx
    10a4:	8b 45 08             	mov    0x8(%ebp),%eax
    10a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10aa:	89 c2                	mov    %eax,%edx
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10b0:	83 c1 01             	add    $0x1,%ecx
    10b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    10b7:	83 c2 01             	add    $0x1,%edx
    10ba:	84 db                	test   %bl,%bl
    10bc:	88 5a ff             	mov    %bl,-0x1(%edx)
    10bf:	75 ef                	jne    10b0 <strcpy+0x10>
    ;
  return os;
}
    10c1:	5b                   	pop    %ebx
    10c2:	5d                   	pop    %ebp
    10c3:	c3                   	ret    
    10c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	8b 55 08             	mov    0x8(%ebp),%edx
    10d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10da:	0f b6 02             	movzbl (%edx),%eax
    10dd:	0f b6 19             	movzbl (%ecx),%ebx
    10e0:	84 c0                	test   %al,%al
    10e2:	75 1c                	jne    1100 <strcmp+0x30>
    10e4:	eb 2a                	jmp    1110 <strcmp+0x40>
    10e6:	8d 76 00             	lea    0x0(%esi),%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10f0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10f6:	83 c1 01             	add    $0x1,%ecx
    10f9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    10fc:	84 c0                	test   %al,%al
    10fe:	74 10                	je     1110 <strcmp+0x40>
    1100:	38 d8                	cmp    %bl,%al
    1102:	74 ec                	je     10f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1104:	29 d8                	sub    %ebx,%eax
}
    1106:	5b                   	pop    %ebx
    1107:	5d                   	pop    %ebp
    1108:	c3                   	ret    
    1109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1110:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1112:	29 d8                	sub    %ebx,%eax
}
    1114:	5b                   	pop    %ebx
    1115:	5d                   	pop    %ebp
    1116:	c3                   	ret    
    1117:	89 f6                	mov    %esi,%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001120 <strlen>:

uint
strlen(const char *s)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1126:	80 39 00             	cmpb   $0x0,(%ecx)
    1129:	74 15                	je     1140 <strlen+0x20>
    112b:	31 d2                	xor    %edx,%edx
    112d:	8d 76 00             	lea    0x0(%esi),%esi
    1130:	83 c2 01             	add    $0x1,%edx
    1133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1137:	89 d0                	mov    %edx,%eax
    1139:	75 f5                	jne    1130 <strlen+0x10>
    ;
  return n;
}
    113b:	5d                   	pop    %ebp
    113c:	c3                   	ret    
    113d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1140:	31 c0                	xor    %eax,%eax
}
    1142:	5d                   	pop    %ebp
    1143:	c3                   	ret    
    1144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    114a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001150 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1157:	8b 4d 10             	mov    0x10(%ebp),%ecx
    115a:	8b 45 0c             	mov    0xc(%ebp),%eax
    115d:	89 d7                	mov    %edx,%edi
    115f:	fc                   	cld    
    1160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1162:	89 d0                	mov    %edx,%eax
    1164:	5f                   	pop    %edi
    1165:	5d                   	pop    %ebp
    1166:	c3                   	ret    
    1167:	89 f6                	mov    %esi,%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <strchr>:

char*
strchr(const char *s, char c)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	8b 45 08             	mov    0x8(%ebp),%eax
    1177:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    117a:	0f b6 10             	movzbl (%eax),%edx
    117d:	84 d2                	test   %dl,%dl
    117f:	74 1d                	je     119e <strchr+0x2e>
    if(*s == c)
    1181:	38 d3                	cmp    %dl,%bl
    1183:	89 d9                	mov    %ebx,%ecx
    1185:	75 0d                	jne    1194 <strchr+0x24>
    1187:	eb 17                	jmp    11a0 <strchr+0x30>
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1190:	38 ca                	cmp    %cl,%dl
    1192:	74 0c                	je     11a0 <strchr+0x30>
  for(; *s; s++)
    1194:	83 c0 01             	add    $0x1,%eax
    1197:	0f b6 10             	movzbl (%eax),%edx
    119a:	84 d2                	test   %dl,%dl
    119c:	75 f2                	jne    1190 <strchr+0x20>
      return (char*)s;
  return 0;
    119e:	31 c0                	xor    %eax,%eax
}
    11a0:	5b                   	pop    %ebx
    11a1:	5d                   	pop    %ebp
    11a2:	c3                   	ret    
    11a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011b0 <gets>:

char*
gets(char *buf, int max)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
    11b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11b6:	31 f6                	xor    %esi,%esi
    11b8:	89 f3                	mov    %esi,%ebx
{
    11ba:	83 ec 1c             	sub    $0x1c,%esp
    11bd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11c0:	eb 2f                	jmp    11f1 <gets+0x41>
    11c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11cb:	83 ec 04             	sub    $0x4,%esp
    11ce:	6a 01                	push   $0x1
    11d0:	50                   	push   %eax
    11d1:	6a 00                	push   $0x0
    11d3:	e8 32 01 00 00       	call   130a <read>
    if(cc < 1)
    11d8:	83 c4 10             	add    $0x10,%esp
    11db:	85 c0                	test   %eax,%eax
    11dd:	7e 1c                	jle    11fb <gets+0x4b>
      break;
    buf[i++] = c;
    11df:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11e3:	83 c7 01             	add    $0x1,%edi
    11e6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11e9:	3c 0a                	cmp    $0xa,%al
    11eb:	74 23                	je     1210 <gets+0x60>
    11ed:	3c 0d                	cmp    $0xd,%al
    11ef:	74 1f                	je     1210 <gets+0x60>
  for(i=0; i+1 < max; ){
    11f1:	83 c3 01             	add    $0x1,%ebx
    11f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11f7:	89 fe                	mov    %edi,%esi
    11f9:	7c cd                	jl     11c8 <gets+0x18>
    11fb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11fd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1200:	c6 03 00             	movb   $0x0,(%ebx)
}
    1203:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1206:	5b                   	pop    %ebx
    1207:	5e                   	pop    %esi
    1208:	5f                   	pop    %edi
    1209:	5d                   	pop    %ebp
    120a:	c3                   	ret    
    120b:	90                   	nop
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1210:	8b 75 08             	mov    0x8(%ebp),%esi
    1213:	8b 45 08             	mov    0x8(%ebp),%eax
    1216:	01 de                	add    %ebx,%esi
    1218:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    121a:	c6 03 00             	movb   $0x0,(%ebx)
}
    121d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1220:	5b                   	pop    %ebx
    1221:	5e                   	pop    %esi
    1222:	5f                   	pop    %edi
    1223:	5d                   	pop    %ebp
    1224:	c3                   	ret    
    1225:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <stat>:

int
stat(const char *n, struct stat *st)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	56                   	push   %esi
    1234:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1235:	83 ec 08             	sub    $0x8,%esp
    1238:	6a 00                	push   $0x0
    123a:	ff 75 08             	pushl  0x8(%ebp)
    123d:	e8 f0 00 00 00       	call   1332 <open>
  if(fd < 0)
    1242:	83 c4 10             	add    $0x10,%esp
    1245:	85 c0                	test   %eax,%eax
    1247:	78 27                	js     1270 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1249:	83 ec 08             	sub    $0x8,%esp
    124c:	ff 75 0c             	pushl  0xc(%ebp)
    124f:	89 c3                	mov    %eax,%ebx
    1251:	50                   	push   %eax
    1252:	e8 f3 00 00 00       	call   134a <fstat>
  close(fd);
    1257:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    125a:	89 c6                	mov    %eax,%esi
  close(fd);
    125c:	e8 b9 00 00 00       	call   131a <close>
  return r;
    1261:	83 c4 10             	add    $0x10,%esp
}
    1264:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1267:	89 f0                	mov    %esi,%eax
    1269:	5b                   	pop    %ebx
    126a:	5e                   	pop    %esi
    126b:	5d                   	pop    %ebp
    126c:	c3                   	ret    
    126d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1270:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1275:	eb ed                	jmp    1264 <stat+0x34>
    1277:	89 f6                	mov    %esi,%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001280 <atoi>:

int
atoi(const char *s)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	53                   	push   %ebx
    1284:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1287:	0f be 11             	movsbl (%ecx),%edx
    128a:	8d 42 d0             	lea    -0x30(%edx),%eax
    128d:	3c 09                	cmp    $0x9,%al
  n = 0;
    128f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1294:	77 1f                	ja     12b5 <atoi+0x35>
    1296:	8d 76 00             	lea    0x0(%esi),%esi
    1299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    12a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12a3:	83 c1 01             	add    $0x1,%ecx
    12a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    12aa:	0f be 11             	movsbl (%ecx),%edx
    12ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12b0:	80 fb 09             	cmp    $0x9,%bl
    12b3:	76 eb                	jbe    12a0 <atoi+0x20>
  return n;
}
    12b5:	5b                   	pop    %ebx
    12b6:	5d                   	pop    %ebp
    12b7:	c3                   	ret    
    12b8:	90                   	nop
    12b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	56                   	push   %esi
    12c4:	53                   	push   %ebx
    12c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12c8:	8b 45 08             	mov    0x8(%ebp),%eax
    12cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ce:	85 db                	test   %ebx,%ebx
    12d0:	7e 14                	jle    12e6 <memmove+0x26>
    12d2:	31 d2                	xor    %edx,%edx
    12d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12e2:	39 d3                	cmp    %edx,%ebx
    12e4:	75 f2                	jne    12d8 <memmove+0x18>
  return vdst;
}
    12e6:	5b                   	pop    %ebx
    12e7:	5e                   	pop    %esi
    12e8:	5d                   	pop    %ebp
    12e9:	c3                   	ret    

000012ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12ea:	b8 01 00 00 00       	mov    $0x1,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <exit>:
SYSCALL(exit)
    12f2:	b8 02 00 00 00       	mov    $0x2,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <wait>:
SYSCALL(wait)
    12fa:	b8 03 00 00 00       	mov    $0x3,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <pipe>:
SYSCALL(pipe)
    1302:	b8 04 00 00 00       	mov    $0x4,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <read>:
SYSCALL(read)
    130a:	b8 05 00 00 00       	mov    $0x5,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <write>:
SYSCALL(write)
    1312:	b8 10 00 00 00       	mov    $0x10,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <close>:
SYSCALL(close)
    131a:	b8 15 00 00 00       	mov    $0x15,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <kill>:
SYSCALL(kill)
    1322:	b8 06 00 00 00       	mov    $0x6,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <exec>:
SYSCALL(exec)
    132a:	b8 07 00 00 00       	mov    $0x7,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <open>:
SYSCALL(open)
    1332:	b8 0f 00 00 00       	mov    $0xf,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <mknod>:
SYSCALL(mknod)
    133a:	b8 11 00 00 00       	mov    $0x11,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <unlink>:
SYSCALL(unlink)
    1342:	b8 12 00 00 00       	mov    $0x12,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <fstat>:
SYSCALL(fstat)
    134a:	b8 08 00 00 00       	mov    $0x8,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <link>:
SYSCALL(link)
    1352:	b8 13 00 00 00       	mov    $0x13,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <mkdir>:
SYSCALL(mkdir)
    135a:	b8 14 00 00 00       	mov    $0x14,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <chdir>:
SYSCALL(chdir)
    1362:	b8 09 00 00 00       	mov    $0x9,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <dup>:
SYSCALL(dup)
    136a:	b8 0a 00 00 00       	mov    $0xa,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <getpid>:
SYSCALL(getpid)
    1372:	b8 0b 00 00 00       	mov    $0xb,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <sbrk>:
SYSCALL(sbrk)
    137a:	b8 0c 00 00 00       	mov    $0xc,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <sleep>:
SYSCALL(sleep)
    1382:	b8 0d 00 00 00       	mov    $0xd,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <uptime>:
SYSCALL(uptime)
    138a:	b8 0e 00 00 00       	mov    $0xe,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <getreadcount>:
SYSCALL(getreadcount)
    1392:	b8 16 00 00 00       	mov    $0x16,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <gettime>:
SYSCALL(gettime)
    139a:	b8 17 00 00 00       	mov    $0x17,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <settickets>:
SYSCALL(settickets)
    13a2:	b8 18 00 00 00       	mov    $0x18,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <getpinfo>:
SYSCALL(getpinfo)
    13aa:	b8 19 00 00 00       	mov    $0x19,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <mprotect>:
SYSCALL(mprotect)
    13b2:	b8 1a 00 00 00       	mov    $0x1a,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <munprotect>:
    13ba:	b8 1b 00 00 00       	mov    $0x1b,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    
    13c2:	66 90                	xchg   %ax,%ax
    13c4:	66 90                	xchg   %ax,%ax
    13c6:	66 90                	xchg   %ax,%ax
    13c8:	66 90                	xchg   %ax,%ax
    13ca:	66 90                	xchg   %ax,%ax
    13cc:	66 90                	xchg   %ax,%ax
    13ce:	66 90                	xchg   %ax,%ax

000013d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	57                   	push   %edi
    13d4:	56                   	push   %esi
    13d5:	53                   	push   %ebx
    13d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13d9:	85 d2                	test   %edx,%edx
{
    13db:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    13de:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    13e0:	79 76                	jns    1458 <printint+0x88>
    13e2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13e6:	74 70                	je     1458 <printint+0x88>
    x = -xx;
    13e8:	f7 d8                	neg    %eax
    neg = 1;
    13ea:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    13f1:	31 f6                	xor    %esi,%esi
    13f3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13f6:	eb 0a                	jmp    1402 <printint+0x32>
    13f8:	90                   	nop
    13f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1400:	89 fe                	mov    %edi,%esi
    1402:	31 d2                	xor    %edx,%edx
    1404:	8d 7e 01             	lea    0x1(%esi),%edi
    1407:	f7 f1                	div    %ecx
    1409:	0f b6 92 24 18 00 00 	movzbl 0x1824(%edx),%edx
  }while((x /= base) != 0);
    1410:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1412:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1415:	75 e9                	jne    1400 <printint+0x30>
  if(neg)
    1417:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    141a:	85 c0                	test   %eax,%eax
    141c:	74 08                	je     1426 <printint+0x56>
    buf[i++] = '-';
    141e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1423:	8d 7e 02             	lea    0x2(%esi),%edi
    1426:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    142a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    142d:	8d 76 00             	lea    0x0(%esi),%esi
    1430:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1433:	83 ec 04             	sub    $0x4,%esp
    1436:	83 ee 01             	sub    $0x1,%esi
    1439:	6a 01                	push   $0x1
    143b:	53                   	push   %ebx
    143c:	57                   	push   %edi
    143d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1440:	e8 cd fe ff ff       	call   1312 <write>

  while(--i >= 0)
    1445:	83 c4 10             	add    $0x10,%esp
    1448:	39 de                	cmp    %ebx,%esi
    144a:	75 e4                	jne    1430 <printint+0x60>
    putc(fd, buf[i]);
}
    144c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    144f:	5b                   	pop    %ebx
    1450:	5e                   	pop    %esi
    1451:	5f                   	pop    %edi
    1452:	5d                   	pop    %ebp
    1453:	c3                   	ret    
    1454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1458:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    145f:	eb 90                	jmp    13f1 <printint+0x21>
    1461:	eb 0d                	jmp    1470 <printf>
    1463:	90                   	nop
    1464:	90                   	nop
    1465:	90                   	nop
    1466:	90                   	nop
    1467:	90                   	nop
    1468:	90                   	nop
    1469:	90                   	nop
    146a:	90                   	nop
    146b:	90                   	nop
    146c:	90                   	nop
    146d:	90                   	nop
    146e:	90                   	nop
    146f:	90                   	nop

00001470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
    1475:	53                   	push   %ebx
    1476:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1479:	8b 75 0c             	mov    0xc(%ebp),%esi
    147c:	0f b6 1e             	movzbl (%esi),%ebx
    147f:	84 db                	test   %bl,%bl
    1481:	0f 84 bf 00 00 00    	je     1546 <printf+0xd6>
    1487:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    148a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    148d:	31 d2                	xor    %edx,%edx
    148f:	eb 39                	jmp    14ca <printf+0x5a>
    1491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1498:	83 f8 25             	cmp    $0x25,%eax
    149b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    149e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    14a3:	74 1a                	je     14bf <printf+0x4f>
  write(fd, &c, 1);
    14a5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14a8:	83 ec 04             	sub    $0x4,%esp
    14ab:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    14ae:	6a 01                	push   $0x1
    14b0:	50                   	push   %eax
    14b1:	ff 75 08             	pushl  0x8(%ebp)
    14b4:	e8 59 fe ff ff       	call   1312 <write>
    14b9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    14bc:	83 c4 10             	add    $0x10,%esp
    14bf:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    14c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    14c6:	84 db                	test   %bl,%bl
    14c8:	74 7c                	je     1546 <printf+0xd6>
    if(state == 0){
    14ca:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    14cc:	0f be cb             	movsbl %bl,%ecx
    14cf:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14d2:	74 c4                	je     1498 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    14d4:	83 fa 25             	cmp    $0x25,%edx
    14d7:	75 e6                	jne    14bf <printf+0x4f>
      if(c == 'd'){
    14d9:	83 f8 64             	cmp    $0x64,%eax
    14dc:	0f 84 a6 00 00 00    	je     1588 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    14e2:	83 f8 6c             	cmp    $0x6c,%eax
    14e5:	0f 84 ad 00 00 00    	je     1598 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    14eb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14f1:	83 f9 70             	cmp    $0x70,%ecx
    14f4:	74 5a                	je     1550 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14f6:	83 f8 73             	cmp    $0x73,%eax
    14f9:	0f 84 e1 00 00 00    	je     15e0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14ff:	83 f8 63             	cmp    $0x63,%eax
    1502:	0f 84 28 01 00 00    	je     1630 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1508:	83 f8 25             	cmp    $0x25,%eax
    150b:	74 6b                	je     1578 <printf+0x108>
  write(fd, &c, 1);
    150d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1510:	83 ec 04             	sub    $0x4,%esp
    1513:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1517:	6a 01                	push   $0x1
    1519:	50                   	push   %eax
    151a:	ff 75 08             	pushl  0x8(%ebp)
    151d:	e8 f0 fd ff ff       	call   1312 <write>
    1522:	83 c4 0c             	add    $0xc,%esp
    1525:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1528:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    152b:	6a 01                	push   $0x1
    152d:	50                   	push   %eax
    152e:	ff 75 08             	pushl  0x8(%ebp)
    1531:	83 c6 01             	add    $0x1,%esi
    1534:	e8 d9 fd ff ff       	call   1312 <write>
  for(i = 0; fmt[i]; i++){
    1539:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    153d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1540:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1542:	84 db                	test   %bl,%bl
    1544:	75 84                	jne    14ca <printf+0x5a>
    }
  }
}
    1546:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1549:	5b                   	pop    %ebx
    154a:	5e                   	pop    %esi
    154b:	5f                   	pop    %edi
    154c:	5d                   	pop    %ebp
    154d:	c3                   	ret    
    154e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1550:	83 ec 0c             	sub    $0xc,%esp
    1553:	b9 10 00 00 00       	mov    $0x10,%ecx
    1558:	6a 00                	push   $0x0
    155a:	8b 17                	mov    (%edi),%edx
    155c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    155f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1562:	e8 69 fe ff ff       	call   13d0 <printint>
    1567:	83 c4 10             	add    $0x10,%esp
      state = 0;
    156a:	31 d2                	xor    %edx,%edx
    156c:	e9 4e ff ff ff       	jmp    14bf <printf+0x4f>
    1571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1578:	83 ec 04             	sub    $0x4,%esp
    157b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    157e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1581:	6a 01                	push   $0x1
    1583:	eb a8                	jmp    152d <printf+0xbd>
    1585:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1588:	83 ec 0c             	sub    $0xc,%esp
    158b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1590:	6a 01                	push   $0x1
    1592:	eb c6                	jmp    155a <printf+0xea>
    1594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1598:	8b 57 04             	mov    0x4(%edi),%edx
    159b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    159d:	85 d2                	test   %edx,%edx
    159f:	74 15                	je     15b6 <printf+0x146>
    15a1:	83 ec 0c             	sub    $0xc,%esp
    15a4:	8b 45 08             	mov    0x8(%ebp),%eax
    15a7:	b9 10 00 00 00       	mov    $0x10,%ecx
    15ac:	6a 00                	push   $0x0
    15ae:	e8 1d fe ff ff       	call   13d0 <printint>
    15b3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    15b6:	83 ec 0c             	sub    $0xc,%esp
    15b9:	8b 45 08             	mov    0x8(%ebp),%eax
    15bc:	89 da                	mov    %ebx,%edx
    15be:	6a 00                	push   $0x0
    15c0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    15c5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    15c8:	e8 03 fe ff ff       	call   13d0 <printint>
    15cd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15d0:	31 d2                	xor    %edx,%edx
    15d2:	e9 e8 fe ff ff       	jmp    14bf <printf+0x4f>
    15d7:	89 f6                	mov    %esi,%esi
    15d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    15e0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    15e2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    15e5:	85 c9                	test   %ecx,%ecx
    15e7:	74 6a                	je     1653 <printf+0x1e3>
        while(*s != 0){
    15e9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    15ec:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    15ee:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    15f0:	84 c0                	test   %al,%al
    15f2:	0f 84 c7 fe ff ff    	je     14bf <printf+0x4f>
    15f8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15fb:	89 de                	mov    %ebx,%esi
    15fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1600:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1603:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1606:	83 ec 04             	sub    $0x4,%esp
    1609:	6a 01                	push   $0x1
          s++;
    160b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    160e:	50                   	push   %eax
    160f:	53                   	push   %ebx
    1610:	e8 fd fc ff ff       	call   1312 <write>
        while(*s != 0){
    1615:	0f b6 06             	movzbl (%esi),%eax
    1618:	83 c4 10             	add    $0x10,%esp
    161b:	84 c0                	test   %al,%al
    161d:	75 e1                	jne    1600 <printf+0x190>
    161f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1622:	31 d2                	xor    %edx,%edx
    1624:	e9 96 fe ff ff       	jmp    14bf <printf+0x4f>
    1629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1630:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1632:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1635:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1638:	6a 01                	push   $0x1
        putc(fd, *ap);
    163a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    163d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1640:	50                   	push   %eax
    1641:	ff 75 08             	pushl  0x8(%ebp)
    1644:	e8 c9 fc ff ff       	call   1312 <write>
    1649:	83 c4 10             	add    $0x10,%esp
      state = 0;
    164c:	31 d2                	xor    %edx,%edx
    164e:	e9 6c fe ff ff       	jmp    14bf <printf+0x4f>
          s = "(null)";
    1653:	bb 1b 18 00 00       	mov    $0x181b,%ebx
        while(*s != 0){
    1658:	b8 28 00 00 00       	mov    $0x28,%eax
    165d:	eb 99                	jmp    15f8 <printf+0x188>
    165f:	90                   	nop

00001660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1661:	a1 d4 1a 00 00       	mov    0x1ad4,%eax
{
    1666:	89 e5                	mov    %esp,%ebp
    1668:	57                   	push   %edi
    1669:	56                   	push   %esi
    166a:	53                   	push   %ebx
    166b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    166e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1678:	39 c8                	cmp    %ecx,%eax
    167a:	8b 10                	mov    (%eax),%edx
    167c:	73 32                	jae    16b0 <free+0x50>
    167e:	39 d1                	cmp    %edx,%ecx
    1680:	72 04                	jb     1686 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1682:	39 d0                	cmp    %edx,%eax
    1684:	72 32                	jb     16b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1686:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1689:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    168c:	39 fa                	cmp    %edi,%edx
    168e:	74 30                	je     16c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1690:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1693:	8b 50 04             	mov    0x4(%eax),%edx
    1696:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1699:	39 f1                	cmp    %esi,%ecx
    169b:	74 3a                	je     16d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    169d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    169f:	a3 d4 1a 00 00       	mov    %eax,0x1ad4
}
    16a4:	5b                   	pop    %ebx
    16a5:	5e                   	pop    %esi
    16a6:	5f                   	pop    %edi
    16a7:	5d                   	pop    %ebp
    16a8:	c3                   	ret    
    16a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16b0:	39 d0                	cmp    %edx,%eax
    16b2:	72 04                	jb     16b8 <free+0x58>
    16b4:	39 d1                	cmp    %edx,%ecx
    16b6:	72 ce                	jb     1686 <free+0x26>
{
    16b8:	89 d0                	mov    %edx,%eax
    16ba:	eb bc                	jmp    1678 <free+0x18>
    16bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    16c0:	03 72 04             	add    0x4(%edx),%esi
    16c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16c6:	8b 10                	mov    (%eax),%edx
    16c8:	8b 12                	mov    (%edx),%edx
    16ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16cd:	8b 50 04             	mov    0x4(%eax),%edx
    16d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16d3:	39 f1                	cmp    %esi,%ecx
    16d5:	75 c6                	jne    169d <free+0x3d>
    p->s.size += bp->s.size;
    16d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    16da:	a3 d4 1a 00 00       	mov    %eax,0x1ad4
    p->s.size += bp->s.size;
    16df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16e5:	89 10                	mov    %edx,(%eax)
}
    16e7:	5b                   	pop    %ebx
    16e8:	5e                   	pop    %esi
    16e9:	5f                   	pop    %edi
    16ea:	5d                   	pop    %ebp
    16eb:	c3                   	ret    
    16ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	57                   	push   %edi
    16f4:	56                   	push   %esi
    16f5:	53                   	push   %ebx
    16f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16fc:	8b 15 d4 1a 00 00    	mov    0x1ad4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1702:	8d 78 07             	lea    0x7(%eax),%edi
    1705:	c1 ef 03             	shr    $0x3,%edi
    1708:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    170b:	85 d2                	test   %edx,%edx
    170d:	0f 84 9d 00 00 00    	je     17b0 <malloc+0xc0>
    1713:	8b 02                	mov    (%edx),%eax
    1715:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1718:	39 cf                	cmp    %ecx,%edi
    171a:	76 6c                	jbe    1788 <malloc+0x98>
    171c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1722:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1727:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    172a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1731:	eb 0e                	jmp    1741 <malloc+0x51>
    1733:	90                   	nop
    1734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    173a:	8b 48 04             	mov    0x4(%eax),%ecx
    173d:	39 f9                	cmp    %edi,%ecx
    173f:	73 47                	jae    1788 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1741:	39 05 d4 1a 00 00    	cmp    %eax,0x1ad4
    1747:	89 c2                	mov    %eax,%edx
    1749:	75 ed                	jne    1738 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    174b:	83 ec 0c             	sub    $0xc,%esp
    174e:	56                   	push   %esi
    174f:	e8 26 fc ff ff       	call   137a <sbrk>
  if(p == (char*)-1)
    1754:	83 c4 10             	add    $0x10,%esp
    1757:	83 f8 ff             	cmp    $0xffffffff,%eax
    175a:	74 1c                	je     1778 <malloc+0x88>
  hp->s.size = nu;
    175c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    175f:	83 ec 0c             	sub    $0xc,%esp
    1762:	83 c0 08             	add    $0x8,%eax
    1765:	50                   	push   %eax
    1766:	e8 f5 fe ff ff       	call   1660 <free>
  return freep;
    176b:	8b 15 d4 1a 00 00    	mov    0x1ad4,%edx
      if((p = morecore(nunits)) == 0)
    1771:	83 c4 10             	add    $0x10,%esp
    1774:	85 d2                	test   %edx,%edx
    1776:	75 c0                	jne    1738 <malloc+0x48>
        return 0;
  }
}
    1778:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    177b:	31 c0                	xor    %eax,%eax
}
    177d:	5b                   	pop    %ebx
    177e:	5e                   	pop    %esi
    177f:	5f                   	pop    %edi
    1780:	5d                   	pop    %ebp
    1781:	c3                   	ret    
    1782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1788:	39 cf                	cmp    %ecx,%edi
    178a:	74 54                	je     17e0 <malloc+0xf0>
        p->s.size -= nunits;
    178c:	29 f9                	sub    %edi,%ecx
    178e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1791:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1794:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1797:	89 15 d4 1a 00 00    	mov    %edx,0x1ad4
}
    179d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17a0:	83 c0 08             	add    $0x8,%eax
}
    17a3:	5b                   	pop    %ebx
    17a4:	5e                   	pop    %esi
    17a5:	5f                   	pop    %edi
    17a6:	5d                   	pop    %ebp
    17a7:	c3                   	ret    
    17a8:	90                   	nop
    17a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    17b0:	c7 05 d4 1a 00 00 d8 	movl   $0x1ad8,0x1ad4
    17b7:	1a 00 00 
    17ba:	c7 05 d8 1a 00 00 d8 	movl   $0x1ad8,0x1ad8
    17c1:	1a 00 00 
    base.s.size = 0;
    17c4:	b8 d8 1a 00 00       	mov    $0x1ad8,%eax
    17c9:	c7 05 dc 1a 00 00 00 	movl   $0x0,0x1adc
    17d0:	00 00 00 
    17d3:	e9 44 ff ff ff       	jmp    171c <malloc+0x2c>
    17d8:	90                   	nop
    17d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    17e0:	8b 08                	mov    (%eax),%ecx
    17e2:	89 0a                	mov    %ecx,(%edx)
    17e4:	eb b1                	jmp    1797 <malloc+0xa7>
