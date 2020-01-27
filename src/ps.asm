
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
    1035:	68 d8 17 00 00       	push   $0x17d8
    103a:	6a 01                	push   $0x1
    103c:	e8 1f 04 00 00       	call   1460 <printf>
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
    1076:	68 f8 17 00 00       	push   $0x17f8
    107b:	6a 01                	push   $0x1
    107d:	e8 de 03 00 00       	call   1460 <printf>
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
    13aa:	b8 19 00 00 00       	mov    $0x19,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    
    13b2:	66 90                	xchg   %ax,%ax
    13b4:	66 90                	xchg   %ax,%ax
    13b6:	66 90                	xchg   %ax,%ax
    13b8:	66 90                	xchg   %ax,%ax
    13ba:	66 90                	xchg   %ax,%ax
    13bc:	66 90                	xchg   %ax,%ax
    13be:	66 90                	xchg   %ax,%ax

000013c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	57                   	push   %edi
    13c4:	56                   	push   %esi
    13c5:	53                   	push   %ebx
    13c6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13c9:	85 d2                	test   %edx,%edx
{
    13cb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    13ce:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    13d0:	79 76                	jns    1448 <printint+0x88>
    13d2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13d6:	74 70                	je     1448 <printint+0x88>
    x = -xx;
    13d8:	f7 d8                	neg    %eax
    neg = 1;
    13da:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    13e1:	31 f6                	xor    %esi,%esi
    13e3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13e6:	eb 0a                	jmp    13f2 <printint+0x32>
    13e8:	90                   	nop
    13e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    13f0:	89 fe                	mov    %edi,%esi
    13f2:	31 d2                	xor    %edx,%edx
    13f4:	8d 7e 01             	lea    0x1(%esi),%edi
    13f7:	f7 f1                	div    %ecx
    13f9:	0f b6 92 14 18 00 00 	movzbl 0x1814(%edx),%edx
  }while((x /= base) != 0);
    1400:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1402:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1405:	75 e9                	jne    13f0 <printint+0x30>
  if(neg)
    1407:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    140a:	85 c0                	test   %eax,%eax
    140c:	74 08                	je     1416 <printint+0x56>
    buf[i++] = '-';
    140e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1413:	8d 7e 02             	lea    0x2(%esi),%edi
    1416:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    141a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    141d:	8d 76 00             	lea    0x0(%esi),%esi
    1420:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1423:	83 ec 04             	sub    $0x4,%esp
    1426:	83 ee 01             	sub    $0x1,%esi
    1429:	6a 01                	push   $0x1
    142b:	53                   	push   %ebx
    142c:	57                   	push   %edi
    142d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1430:	e8 dd fe ff ff       	call   1312 <write>

  while(--i >= 0)
    1435:	83 c4 10             	add    $0x10,%esp
    1438:	39 de                	cmp    %ebx,%esi
    143a:	75 e4                	jne    1420 <printint+0x60>
    putc(fd, buf[i]);
}
    143c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    143f:	5b                   	pop    %ebx
    1440:	5e                   	pop    %esi
    1441:	5f                   	pop    %edi
    1442:	5d                   	pop    %ebp
    1443:	c3                   	ret    
    1444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1448:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    144f:	eb 90                	jmp    13e1 <printint+0x21>
    1451:	eb 0d                	jmp    1460 <printf>
    1453:	90                   	nop
    1454:	90                   	nop
    1455:	90                   	nop
    1456:	90                   	nop
    1457:	90                   	nop
    1458:	90                   	nop
    1459:	90                   	nop
    145a:	90                   	nop
    145b:	90                   	nop
    145c:	90                   	nop
    145d:	90                   	nop
    145e:	90                   	nop
    145f:	90                   	nop

00001460 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	57                   	push   %edi
    1464:	56                   	push   %esi
    1465:	53                   	push   %ebx
    1466:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1469:	8b 75 0c             	mov    0xc(%ebp),%esi
    146c:	0f b6 1e             	movzbl (%esi),%ebx
    146f:	84 db                	test   %bl,%bl
    1471:	0f 84 bf 00 00 00    	je     1536 <printf+0xd6>
    1477:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    147a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    147d:	31 d2                	xor    %edx,%edx
    147f:	eb 39                	jmp    14ba <printf+0x5a>
    1481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1488:	83 f8 25             	cmp    $0x25,%eax
    148b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    148e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1493:	74 1a                	je     14af <printf+0x4f>
  write(fd, &c, 1);
    1495:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1498:	83 ec 04             	sub    $0x4,%esp
    149b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    149e:	6a 01                	push   $0x1
    14a0:	50                   	push   %eax
    14a1:	ff 75 08             	pushl  0x8(%ebp)
    14a4:	e8 69 fe ff ff       	call   1312 <write>
    14a9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    14ac:	83 c4 10             	add    $0x10,%esp
    14af:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    14b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    14b6:	84 db                	test   %bl,%bl
    14b8:	74 7c                	je     1536 <printf+0xd6>
    if(state == 0){
    14ba:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    14bc:	0f be cb             	movsbl %bl,%ecx
    14bf:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14c2:	74 c4                	je     1488 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    14c4:	83 fa 25             	cmp    $0x25,%edx
    14c7:	75 e6                	jne    14af <printf+0x4f>
      if(c == 'd'){
    14c9:	83 f8 64             	cmp    $0x64,%eax
    14cc:	0f 84 a6 00 00 00    	je     1578 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    14d2:	83 f8 6c             	cmp    $0x6c,%eax
    14d5:	0f 84 ad 00 00 00    	je     1588 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    14db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14e1:	83 f9 70             	cmp    $0x70,%ecx
    14e4:	74 5a                	je     1540 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14e6:	83 f8 73             	cmp    $0x73,%eax
    14e9:	0f 84 e1 00 00 00    	je     15d0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14ef:	83 f8 63             	cmp    $0x63,%eax
    14f2:	0f 84 28 01 00 00    	je     1620 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14f8:	83 f8 25             	cmp    $0x25,%eax
    14fb:	74 6b                	je     1568 <printf+0x108>
  write(fd, &c, 1);
    14fd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1500:	83 ec 04             	sub    $0x4,%esp
    1503:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1507:	6a 01                	push   $0x1
    1509:	50                   	push   %eax
    150a:	ff 75 08             	pushl  0x8(%ebp)
    150d:	e8 00 fe ff ff       	call   1312 <write>
    1512:	83 c4 0c             	add    $0xc,%esp
    1515:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1518:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    151b:	6a 01                	push   $0x1
    151d:	50                   	push   %eax
    151e:	ff 75 08             	pushl  0x8(%ebp)
    1521:	83 c6 01             	add    $0x1,%esi
    1524:	e8 e9 fd ff ff       	call   1312 <write>
  for(i = 0; fmt[i]; i++){
    1529:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    152d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1530:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1532:	84 db                	test   %bl,%bl
    1534:	75 84                	jne    14ba <printf+0x5a>
    }
  }
}
    1536:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1539:	5b                   	pop    %ebx
    153a:	5e                   	pop    %esi
    153b:	5f                   	pop    %edi
    153c:	5d                   	pop    %ebp
    153d:	c3                   	ret    
    153e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1540:	83 ec 0c             	sub    $0xc,%esp
    1543:	b9 10 00 00 00       	mov    $0x10,%ecx
    1548:	6a 00                	push   $0x0
    154a:	8b 17                	mov    (%edi),%edx
    154c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    154f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1552:	e8 69 fe ff ff       	call   13c0 <printint>
    1557:	83 c4 10             	add    $0x10,%esp
      state = 0;
    155a:	31 d2                	xor    %edx,%edx
    155c:	e9 4e ff ff ff       	jmp    14af <printf+0x4f>
    1561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1568:	83 ec 04             	sub    $0x4,%esp
    156b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    156e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1571:	6a 01                	push   $0x1
    1573:	eb a8                	jmp    151d <printf+0xbd>
    1575:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1578:	83 ec 0c             	sub    $0xc,%esp
    157b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1580:	6a 01                	push   $0x1
    1582:	eb c6                	jmp    154a <printf+0xea>
    1584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1588:	8b 57 04             	mov    0x4(%edi),%edx
    158b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    158d:	85 d2                	test   %edx,%edx
    158f:	74 15                	je     15a6 <printf+0x146>
    1591:	83 ec 0c             	sub    $0xc,%esp
    1594:	8b 45 08             	mov    0x8(%ebp),%eax
    1597:	b9 10 00 00 00       	mov    $0x10,%ecx
    159c:	6a 00                	push   $0x0
    159e:	e8 1d fe ff ff       	call   13c0 <printint>
    15a3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    15a6:	83 ec 0c             	sub    $0xc,%esp
    15a9:	8b 45 08             	mov    0x8(%ebp),%eax
    15ac:	89 da                	mov    %ebx,%edx
    15ae:	6a 00                	push   $0x0
    15b0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    15b5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    15b8:	e8 03 fe ff ff       	call   13c0 <printint>
    15bd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15c0:	31 d2                	xor    %edx,%edx
    15c2:	e9 e8 fe ff ff       	jmp    14af <printf+0x4f>
    15c7:	89 f6                	mov    %esi,%esi
    15c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    15d0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    15d2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    15d5:	85 c9                	test   %ecx,%ecx
    15d7:	74 6a                	je     1643 <printf+0x1e3>
        while(*s != 0){
    15d9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    15dc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    15de:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    15e0:	84 c0                	test   %al,%al
    15e2:	0f 84 c7 fe ff ff    	je     14af <printf+0x4f>
    15e8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15eb:	89 de                	mov    %ebx,%esi
    15ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    15f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15f6:	83 ec 04             	sub    $0x4,%esp
    15f9:	6a 01                	push   $0x1
          s++;
    15fb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    15fe:	50                   	push   %eax
    15ff:	53                   	push   %ebx
    1600:	e8 0d fd ff ff       	call   1312 <write>
        while(*s != 0){
    1605:	0f b6 06             	movzbl (%esi),%eax
    1608:	83 c4 10             	add    $0x10,%esp
    160b:	84 c0                	test   %al,%al
    160d:	75 e1                	jne    15f0 <printf+0x190>
    160f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1612:	31 d2                	xor    %edx,%edx
    1614:	e9 96 fe ff ff       	jmp    14af <printf+0x4f>
    1619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1620:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1622:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1625:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1628:	6a 01                	push   $0x1
        putc(fd, *ap);
    162a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    162d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1630:	50                   	push   %eax
    1631:	ff 75 08             	pushl  0x8(%ebp)
    1634:	e8 d9 fc ff ff       	call   1312 <write>
    1639:	83 c4 10             	add    $0x10,%esp
      state = 0;
    163c:	31 d2                	xor    %edx,%edx
    163e:	e9 6c fe ff ff       	jmp    14af <printf+0x4f>
          s = "(null)";
    1643:	bb 0b 18 00 00       	mov    $0x180b,%ebx
        while(*s != 0){
    1648:	b8 28 00 00 00       	mov    $0x28,%eax
    164d:	eb 99                	jmp    15e8 <printf+0x188>
    164f:	90                   	nop

00001650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1651:	a1 c4 1a 00 00       	mov    0x1ac4,%eax
{
    1656:	89 e5                	mov    %esp,%ebp
    1658:	57                   	push   %edi
    1659:	56                   	push   %esi
    165a:	53                   	push   %ebx
    165b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    165e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1668:	39 c8                	cmp    %ecx,%eax
    166a:	8b 10                	mov    (%eax),%edx
    166c:	73 32                	jae    16a0 <free+0x50>
    166e:	39 d1                	cmp    %edx,%ecx
    1670:	72 04                	jb     1676 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1672:	39 d0                	cmp    %edx,%eax
    1674:	72 32                	jb     16a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1676:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1679:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    167c:	39 fa                	cmp    %edi,%edx
    167e:	74 30                	je     16b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1680:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1683:	8b 50 04             	mov    0x4(%eax),%edx
    1686:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1689:	39 f1                	cmp    %esi,%ecx
    168b:	74 3a                	je     16c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    168d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    168f:	a3 c4 1a 00 00       	mov    %eax,0x1ac4
}
    1694:	5b                   	pop    %ebx
    1695:	5e                   	pop    %esi
    1696:	5f                   	pop    %edi
    1697:	5d                   	pop    %ebp
    1698:	c3                   	ret    
    1699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16a0:	39 d0                	cmp    %edx,%eax
    16a2:	72 04                	jb     16a8 <free+0x58>
    16a4:	39 d1                	cmp    %edx,%ecx
    16a6:	72 ce                	jb     1676 <free+0x26>
{
    16a8:	89 d0                	mov    %edx,%eax
    16aa:	eb bc                	jmp    1668 <free+0x18>
    16ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    16b0:	03 72 04             	add    0x4(%edx),%esi
    16b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16b6:	8b 10                	mov    (%eax),%edx
    16b8:	8b 12                	mov    (%edx),%edx
    16ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16bd:	8b 50 04             	mov    0x4(%eax),%edx
    16c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16c3:	39 f1                	cmp    %esi,%ecx
    16c5:	75 c6                	jne    168d <free+0x3d>
    p->s.size += bp->s.size;
    16c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    16ca:	a3 c4 1a 00 00       	mov    %eax,0x1ac4
    p->s.size += bp->s.size;
    16cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16d5:	89 10                	mov    %edx,(%eax)
}
    16d7:	5b                   	pop    %ebx
    16d8:	5e                   	pop    %esi
    16d9:	5f                   	pop    %edi
    16da:	5d                   	pop    %ebp
    16db:	c3                   	ret    
    16dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16e0:	55                   	push   %ebp
    16e1:	89 e5                	mov    %esp,%ebp
    16e3:	57                   	push   %edi
    16e4:	56                   	push   %esi
    16e5:	53                   	push   %ebx
    16e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16ec:	8b 15 c4 1a 00 00    	mov    0x1ac4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16f2:	8d 78 07             	lea    0x7(%eax),%edi
    16f5:	c1 ef 03             	shr    $0x3,%edi
    16f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    16fb:	85 d2                	test   %edx,%edx
    16fd:	0f 84 9d 00 00 00    	je     17a0 <malloc+0xc0>
    1703:	8b 02                	mov    (%edx),%eax
    1705:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1708:	39 cf                	cmp    %ecx,%edi
    170a:	76 6c                	jbe    1778 <malloc+0x98>
    170c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1712:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1717:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    171a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1721:	eb 0e                	jmp    1731 <malloc+0x51>
    1723:	90                   	nop
    1724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    172a:	8b 48 04             	mov    0x4(%eax),%ecx
    172d:	39 f9                	cmp    %edi,%ecx
    172f:	73 47                	jae    1778 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1731:	39 05 c4 1a 00 00    	cmp    %eax,0x1ac4
    1737:	89 c2                	mov    %eax,%edx
    1739:	75 ed                	jne    1728 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    173b:	83 ec 0c             	sub    $0xc,%esp
    173e:	56                   	push   %esi
    173f:	e8 36 fc ff ff       	call   137a <sbrk>
  if(p == (char*)-1)
    1744:	83 c4 10             	add    $0x10,%esp
    1747:	83 f8 ff             	cmp    $0xffffffff,%eax
    174a:	74 1c                	je     1768 <malloc+0x88>
  hp->s.size = nu;
    174c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    174f:	83 ec 0c             	sub    $0xc,%esp
    1752:	83 c0 08             	add    $0x8,%eax
    1755:	50                   	push   %eax
    1756:	e8 f5 fe ff ff       	call   1650 <free>
  return freep;
    175b:	8b 15 c4 1a 00 00    	mov    0x1ac4,%edx
      if((p = morecore(nunits)) == 0)
    1761:	83 c4 10             	add    $0x10,%esp
    1764:	85 d2                	test   %edx,%edx
    1766:	75 c0                	jne    1728 <malloc+0x48>
        return 0;
  }
}
    1768:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    176b:	31 c0                	xor    %eax,%eax
}
    176d:	5b                   	pop    %ebx
    176e:	5e                   	pop    %esi
    176f:	5f                   	pop    %edi
    1770:	5d                   	pop    %ebp
    1771:	c3                   	ret    
    1772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1778:	39 cf                	cmp    %ecx,%edi
    177a:	74 54                	je     17d0 <malloc+0xf0>
        p->s.size -= nunits;
    177c:	29 f9                	sub    %edi,%ecx
    177e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1781:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1784:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1787:	89 15 c4 1a 00 00    	mov    %edx,0x1ac4
}
    178d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1790:	83 c0 08             	add    $0x8,%eax
}
    1793:	5b                   	pop    %ebx
    1794:	5e                   	pop    %esi
    1795:	5f                   	pop    %edi
    1796:	5d                   	pop    %ebp
    1797:	c3                   	ret    
    1798:	90                   	nop
    1799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    17a0:	c7 05 c4 1a 00 00 c8 	movl   $0x1ac8,0x1ac4
    17a7:	1a 00 00 
    17aa:	c7 05 c8 1a 00 00 c8 	movl   $0x1ac8,0x1ac8
    17b1:	1a 00 00 
    base.s.size = 0;
    17b4:	b8 c8 1a 00 00       	mov    $0x1ac8,%eax
    17b9:	c7 05 cc 1a 00 00 00 	movl   $0x0,0x1acc
    17c0:	00 00 00 
    17c3:	e9 44 ff ff ff       	jmp    170c <malloc+0x2c>
    17c8:	90                   	nop
    17c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    17d0:	8b 08                	mov    (%eax),%ecx
    17d2:	89 0a                	mov    %ecx,(%edx)
    17d4:	eb b1                	jmp    1787 <malloc+0xa7>
