
_protection_test:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"
#include "mmu.h"
int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx

  char *brk = sbrk(0);
    100f:	83 ec 0c             	sub    $0xc,%esp
    1012:	6a 00                	push   $0x0
    1014:	e8 91 03 00 00       	call   13aa <sbrk>
  sbrk(PGROUNDUP((uint)brk) - (uint)brk);
    1019:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
    101f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    1025:	29 c2                	sub    %eax,%edx
    1027:	89 14 24             	mov    %edx,(%esp)
    102a:	e8 7b 03 00 00       	call   13aa <sbrk>
  char *start = sbrk(0);
    102f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1036:	e8 6f 03 00 00       	call   13aa <sbrk>
    103b:	89 c3                	mov    %eax,%ebx
  sbrk(PGSIZE * 1);
    103d:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    1044:	e8 61 03 00 00       	call   13aa <sbrk>
  *start=100;
    1049:	c6 03 64             	movb   $0x64,(%ebx)
  mprotect(start, 1) ;
    104c:	59                   	pop    %ecx
    104d:	58                   	pop    %eax
    104e:	6a 01                	push   $0x1
    1050:	53                   	push   %ebx
    1051:	e8 8c 03 00 00       	call   13e2 <mprotect>
  int child=fork();
    1056:	e8 bf 02 00 00       	call   131a <fork>
  if(child==0){
    105b:	83 c4 10             	add    $0x10,%esp
    105e:	83 f8 00             	cmp    $0x0,%eax
    1061:	74 30                	je     1093 <main+0x93>
  munprotect(start, 1) ;  
  *start=5;
  printf(1, "After unprotecting the value became = %d\n",*start); 
  exit();
  }
else if(child>0){
    1063:	7e 29                	jle    108e <main+0x8e>
wait();
    1065:	e8 c0 02 00 00       	call   132a <wait>
 printf(1, "\nWatch this,I'll trap now\n"); 
    106a:	50                   	push   %eax
    106b:	50                   	push   %eax
    106c:	68 2e 18 00 00       	push   $0x182e
    1071:	6a 01                	push   $0x1
    1073:	e8 28 04 00 00       	call   14a0 <printf>
 *start=5; 
    1078:	c6 03 05             	movb   $0x5,(%ebx)
 printf(1, "\nThis statement will not be printed\n");
    107b:	5a                   	pop    %edx
    107c:	59                   	pop    %ecx
    107d:	68 78 18 00 00       	push   $0x1878
    1082:	6a 01                	push   $0x1
    1084:	e8 17 04 00 00       	call   14a0 <printf>
exit(); 
    1089:	e8 94 02 00 00       	call   1322 <exit>
}   
 exit();
    108e:	e8 8f 02 00 00       	call   1322 <exit>
  printf(1, "protected value = %d\n",*start); 
    1093:	50                   	push   %eax
    1094:	0f be 03             	movsbl (%ebx),%eax
    1097:	50                   	push   %eax
    1098:	68 18 18 00 00       	push   $0x1818
    109d:	6a 01                	push   $0x1
    109f:	e8 fc 03 00 00       	call   14a0 <printf>
  munprotect(start, 1) ;  
    10a4:	58                   	pop    %eax
    10a5:	5a                   	pop    %edx
    10a6:	6a 01                	push   $0x1
    10a8:	53                   	push   %ebx
    10a9:	e8 3c 03 00 00       	call   13ea <munprotect>
  printf(1, "After unprotecting the value became = %d\n",*start); 
    10ae:	83 c4 0c             	add    $0xc,%esp
  *start=5;
    10b1:	c6 03 05             	movb   $0x5,(%ebx)
  printf(1, "After unprotecting the value became = %d\n",*start); 
    10b4:	6a 05                	push   $0x5
    10b6:	68 4c 18 00 00       	push   $0x184c
    10bb:	6a 01                	push   $0x1
    10bd:	e8 de 03 00 00       	call   14a0 <printf>
  exit();
    10c2:	e8 5b 02 00 00       	call   1322 <exit>
    10c7:	66 90                	xchg   %ax,%ax
    10c9:	66 90                	xchg   %ax,%ax
    10cb:	66 90                	xchg   %ax,%ax
    10cd:	66 90                	xchg   %ax,%ax
    10cf:	90                   	nop

000010d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	8b 45 08             	mov    0x8(%ebp),%eax
    10d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10da:	89 c2                	mov    %eax,%edx
    10dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10e0:	83 c1 01             	add    $0x1,%ecx
    10e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    10e7:	83 c2 01             	add    $0x1,%edx
    10ea:	84 db                	test   %bl,%bl
    10ec:	88 5a ff             	mov    %bl,-0x1(%edx)
    10ef:	75 ef                	jne    10e0 <strcpy+0x10>
    ;
  return os;
}
    10f1:	5b                   	pop    %ebx
    10f2:	5d                   	pop    %ebp
    10f3:	c3                   	ret    
    10f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001100 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	8b 55 08             	mov    0x8(%ebp),%edx
    1107:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    110a:	0f b6 02             	movzbl (%edx),%eax
    110d:	0f b6 19             	movzbl (%ecx),%ebx
    1110:	84 c0                	test   %al,%al
    1112:	75 1c                	jne    1130 <strcmp+0x30>
    1114:	eb 2a                	jmp    1140 <strcmp+0x40>
    1116:	8d 76 00             	lea    0x0(%esi),%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1120:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1123:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1126:	83 c1 01             	add    $0x1,%ecx
    1129:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    112c:	84 c0                	test   %al,%al
    112e:	74 10                	je     1140 <strcmp+0x40>
    1130:	38 d8                	cmp    %bl,%al
    1132:	74 ec                	je     1120 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1134:	29 d8                	sub    %ebx,%eax
}
    1136:	5b                   	pop    %ebx
    1137:	5d                   	pop    %ebp
    1138:	c3                   	ret    
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1140:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1142:	29 d8                	sub    %ebx,%eax
}
    1144:	5b                   	pop    %ebx
    1145:	5d                   	pop    %ebp
    1146:	c3                   	ret    
    1147:	89 f6                	mov    %esi,%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001150 <strlen>:

uint
strlen(const char *s)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1156:	80 39 00             	cmpb   $0x0,(%ecx)
    1159:	74 15                	je     1170 <strlen+0x20>
    115b:	31 d2                	xor    %edx,%edx
    115d:	8d 76 00             	lea    0x0(%esi),%esi
    1160:	83 c2 01             	add    $0x1,%edx
    1163:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1167:	89 d0                	mov    %edx,%eax
    1169:	75 f5                	jne    1160 <strlen+0x10>
    ;
  return n;
}
    116b:	5d                   	pop    %ebp
    116c:	c3                   	ret    
    116d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1170:	31 c0                	xor    %eax,%eax
}
    1172:	5d                   	pop    %ebp
    1173:	c3                   	ret    
    1174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    117a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001180 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1187:	8b 4d 10             	mov    0x10(%ebp),%ecx
    118a:	8b 45 0c             	mov    0xc(%ebp),%eax
    118d:	89 d7                	mov    %edx,%edi
    118f:	fc                   	cld    
    1190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1192:	89 d0                	mov    %edx,%eax
    1194:	5f                   	pop    %edi
    1195:	5d                   	pop    %ebp
    1196:	c3                   	ret    
    1197:	89 f6                	mov    %esi,%esi
    1199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011a0 <strchr>:

char*
strchr(const char *s, char c)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	53                   	push   %ebx
    11a4:	8b 45 08             	mov    0x8(%ebp),%eax
    11a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11aa:	0f b6 10             	movzbl (%eax),%edx
    11ad:	84 d2                	test   %dl,%dl
    11af:	74 1d                	je     11ce <strchr+0x2e>
    if(*s == c)
    11b1:	38 d3                	cmp    %dl,%bl
    11b3:	89 d9                	mov    %ebx,%ecx
    11b5:	75 0d                	jne    11c4 <strchr+0x24>
    11b7:	eb 17                	jmp    11d0 <strchr+0x30>
    11b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11c0:	38 ca                	cmp    %cl,%dl
    11c2:	74 0c                	je     11d0 <strchr+0x30>
  for(; *s; s++)
    11c4:	83 c0 01             	add    $0x1,%eax
    11c7:	0f b6 10             	movzbl (%eax),%edx
    11ca:	84 d2                	test   %dl,%dl
    11cc:	75 f2                	jne    11c0 <strchr+0x20>
      return (char*)s;
  return 0;
    11ce:	31 c0                	xor    %eax,%eax
}
    11d0:	5b                   	pop    %ebx
    11d1:	5d                   	pop    %ebp
    11d2:	c3                   	ret    
    11d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <gets>:

char*
gets(char *buf, int max)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	56                   	push   %esi
    11e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11e6:	31 f6                	xor    %esi,%esi
    11e8:	89 f3                	mov    %esi,%ebx
{
    11ea:	83 ec 1c             	sub    $0x1c,%esp
    11ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11f0:	eb 2f                	jmp    1221 <gets+0x41>
    11f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11fb:	83 ec 04             	sub    $0x4,%esp
    11fe:	6a 01                	push   $0x1
    1200:	50                   	push   %eax
    1201:	6a 00                	push   $0x0
    1203:	e8 32 01 00 00       	call   133a <read>
    if(cc < 1)
    1208:	83 c4 10             	add    $0x10,%esp
    120b:	85 c0                	test   %eax,%eax
    120d:	7e 1c                	jle    122b <gets+0x4b>
      break;
    buf[i++] = c;
    120f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1213:	83 c7 01             	add    $0x1,%edi
    1216:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1219:	3c 0a                	cmp    $0xa,%al
    121b:	74 23                	je     1240 <gets+0x60>
    121d:	3c 0d                	cmp    $0xd,%al
    121f:	74 1f                	je     1240 <gets+0x60>
  for(i=0; i+1 < max; ){
    1221:	83 c3 01             	add    $0x1,%ebx
    1224:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1227:	89 fe                	mov    %edi,%esi
    1229:	7c cd                	jl     11f8 <gets+0x18>
    122b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    122d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1230:	c6 03 00             	movb   $0x0,(%ebx)
}
    1233:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1236:	5b                   	pop    %ebx
    1237:	5e                   	pop    %esi
    1238:	5f                   	pop    %edi
    1239:	5d                   	pop    %ebp
    123a:	c3                   	ret    
    123b:	90                   	nop
    123c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1240:	8b 75 08             	mov    0x8(%ebp),%esi
    1243:	8b 45 08             	mov    0x8(%ebp),%eax
    1246:	01 de                	add    %ebx,%esi
    1248:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    124a:	c6 03 00             	movb   $0x0,(%ebx)
}
    124d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1250:	5b                   	pop    %ebx
    1251:	5e                   	pop    %esi
    1252:	5f                   	pop    %edi
    1253:	5d                   	pop    %ebp
    1254:	c3                   	ret    
    1255:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <stat>:

int
stat(const char *n, struct stat *st)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	56                   	push   %esi
    1264:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1265:	83 ec 08             	sub    $0x8,%esp
    1268:	6a 00                	push   $0x0
    126a:	ff 75 08             	pushl  0x8(%ebp)
    126d:	e8 f0 00 00 00       	call   1362 <open>
  if(fd < 0)
    1272:	83 c4 10             	add    $0x10,%esp
    1275:	85 c0                	test   %eax,%eax
    1277:	78 27                	js     12a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1279:	83 ec 08             	sub    $0x8,%esp
    127c:	ff 75 0c             	pushl  0xc(%ebp)
    127f:	89 c3                	mov    %eax,%ebx
    1281:	50                   	push   %eax
    1282:	e8 f3 00 00 00       	call   137a <fstat>
  close(fd);
    1287:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    128a:	89 c6                	mov    %eax,%esi
  close(fd);
    128c:	e8 b9 00 00 00       	call   134a <close>
  return r;
    1291:	83 c4 10             	add    $0x10,%esp
}
    1294:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1297:	89 f0                	mov    %esi,%eax
    1299:	5b                   	pop    %ebx
    129a:	5e                   	pop    %esi
    129b:	5d                   	pop    %ebp
    129c:	c3                   	ret    
    129d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12a5:	eb ed                	jmp    1294 <stat+0x34>
    12a7:	89 f6                	mov    %esi,%esi
    12a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012b0 <atoi>:

int
atoi(const char *s)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	53                   	push   %ebx
    12b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12b7:	0f be 11             	movsbl (%ecx),%edx
    12ba:	8d 42 d0             	lea    -0x30(%edx),%eax
    12bd:	3c 09                	cmp    $0x9,%al
  n = 0;
    12bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    12c4:	77 1f                	ja     12e5 <atoi+0x35>
    12c6:	8d 76 00             	lea    0x0(%esi),%esi
    12c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    12d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12d3:	83 c1 01             	add    $0x1,%ecx
    12d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    12da:	0f be 11             	movsbl (%ecx),%edx
    12dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12e0:	80 fb 09             	cmp    $0x9,%bl
    12e3:	76 eb                	jbe    12d0 <atoi+0x20>
  return n;
}
    12e5:	5b                   	pop    %ebx
    12e6:	5d                   	pop    %ebp
    12e7:	c3                   	ret    
    12e8:	90                   	nop
    12e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	56                   	push   %esi
    12f4:	53                   	push   %ebx
    12f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12f8:	8b 45 08             	mov    0x8(%ebp),%eax
    12fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12fe:	85 db                	test   %ebx,%ebx
    1300:	7e 14                	jle    1316 <memmove+0x26>
    1302:	31 d2                	xor    %edx,%edx
    1304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    130c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    130f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1312:	39 d3                	cmp    %edx,%ebx
    1314:	75 f2                	jne    1308 <memmove+0x18>
  return vdst;
}
    1316:	5b                   	pop    %ebx
    1317:	5e                   	pop    %esi
    1318:	5d                   	pop    %ebp
    1319:	c3                   	ret    

0000131a <fork>:
    131a:	b8 01 00 00 00       	mov    $0x1,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <exit>:
    1322:	b8 02 00 00 00       	mov    $0x2,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <wait>:
    132a:	b8 03 00 00 00       	mov    $0x3,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <pipe>:
    1332:	b8 04 00 00 00       	mov    $0x4,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <read>:
    133a:	b8 05 00 00 00       	mov    $0x5,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <write>:
    1342:	b8 10 00 00 00       	mov    $0x10,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <close>:
    134a:	b8 15 00 00 00       	mov    $0x15,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <kill>:
    1352:	b8 06 00 00 00       	mov    $0x6,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <exec>:
    135a:	b8 07 00 00 00       	mov    $0x7,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <open>:
    1362:	b8 0f 00 00 00       	mov    $0xf,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <mknod>:
    136a:	b8 11 00 00 00       	mov    $0x11,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <unlink>:
    1372:	b8 12 00 00 00       	mov    $0x12,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <fstat>:
    137a:	b8 08 00 00 00       	mov    $0x8,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <link>:
    1382:	b8 13 00 00 00       	mov    $0x13,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <mkdir>:
    138a:	b8 14 00 00 00       	mov    $0x14,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <chdir>:
    1392:	b8 09 00 00 00       	mov    $0x9,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <dup>:
    139a:	b8 0a 00 00 00       	mov    $0xa,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <getpid>:
    13a2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <sbrk>:
    13aa:	b8 0c 00 00 00       	mov    $0xc,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <sleep>:
    13b2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <uptime>:
    13ba:	b8 0e 00 00 00       	mov    $0xe,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <getreadcount>:
    13c2:	b8 16 00 00 00       	mov    $0x16,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <gettime>:
    13ca:	b8 17 00 00 00       	mov    $0x17,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <settickets>:
    13d2:	b8 18 00 00 00       	mov    $0x18,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <getpinfo>:
    13da:	b8 19 00 00 00       	mov    $0x19,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <mprotect>:
    13e2:	b8 1a 00 00 00       	mov    $0x1a,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <munprotect>:
    13ea:	b8 1b 00 00 00       	mov    $0x1b,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    
    13f2:	66 90                	xchg   %ax,%ax
    13f4:	66 90                	xchg   %ax,%ax
    13f6:	66 90                	xchg   %ax,%ax
    13f8:	66 90                	xchg   %ax,%ax
    13fa:	66 90                	xchg   %ax,%ax
    13fc:	66 90                	xchg   %ax,%ax
    13fe:	66 90                	xchg   %ax,%ax

00001400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	56                   	push   %esi
    1405:	53                   	push   %ebx
    1406:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1409:	85 d2                	test   %edx,%edx
{
    140b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    140e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1410:	79 76                	jns    1488 <printint+0x88>
    1412:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1416:	74 70                	je     1488 <printint+0x88>
    x = -xx;
    1418:	f7 d8                	neg    %eax
    neg = 1;
    141a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1421:	31 f6                	xor    %esi,%esi
    1423:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1426:	eb 0a                	jmp    1432 <printint+0x32>
    1428:	90                   	nop
    1429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1430:	89 fe                	mov    %edi,%esi
    1432:	31 d2                	xor    %edx,%edx
    1434:	8d 7e 01             	lea    0x1(%esi),%edi
    1437:	f7 f1                	div    %ecx
    1439:	0f b6 92 a8 18 00 00 	movzbl 0x18a8(%edx),%edx
  }while((x /= base) != 0);
    1440:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1442:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1445:	75 e9                	jne    1430 <printint+0x30>
  if(neg)
    1447:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    144a:	85 c0                	test   %eax,%eax
    144c:	74 08                	je     1456 <printint+0x56>
    buf[i++] = '-';
    144e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1453:	8d 7e 02             	lea    0x2(%esi),%edi
    1456:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    145a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    145d:	8d 76 00             	lea    0x0(%esi),%esi
    1460:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1463:	83 ec 04             	sub    $0x4,%esp
    1466:	83 ee 01             	sub    $0x1,%esi
    1469:	6a 01                	push   $0x1
    146b:	53                   	push   %ebx
    146c:	57                   	push   %edi
    146d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1470:	e8 cd fe ff ff       	call   1342 <write>

  while(--i >= 0)
    1475:	83 c4 10             	add    $0x10,%esp
    1478:	39 de                	cmp    %ebx,%esi
    147a:	75 e4                	jne    1460 <printint+0x60>
    putc(fd, buf[i]);
}
    147c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    147f:	5b                   	pop    %ebx
    1480:	5e                   	pop    %esi
    1481:	5f                   	pop    %edi
    1482:	5d                   	pop    %ebp
    1483:	c3                   	ret    
    1484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1488:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    148f:	eb 90                	jmp    1421 <printint+0x21>
    1491:	eb 0d                	jmp    14a0 <printf>
    1493:	90                   	nop
    1494:	90                   	nop
    1495:	90                   	nop
    1496:	90                   	nop
    1497:	90                   	nop
    1498:	90                   	nop
    1499:	90                   	nop
    149a:	90                   	nop
    149b:	90                   	nop
    149c:	90                   	nop
    149d:	90                   	nop
    149e:	90                   	nop
    149f:	90                   	nop

000014a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
    14a4:	56                   	push   %esi
    14a5:	53                   	push   %ebx
    14a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14a9:	8b 75 0c             	mov    0xc(%ebp),%esi
    14ac:	0f b6 1e             	movzbl (%esi),%ebx
    14af:	84 db                	test   %bl,%bl
    14b1:	0f 84 bf 00 00 00    	je     1576 <printf+0xd6>
    14b7:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    14ba:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    14bd:	31 d2                	xor    %edx,%edx
    14bf:	eb 39                	jmp    14fa <printf+0x5a>
    14c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14c8:	83 f8 25             	cmp    $0x25,%eax
    14cb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    14ce:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    14d3:	74 1a                	je     14ef <printf+0x4f>
  write(fd, &c, 1);
    14d5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14d8:	83 ec 04             	sub    $0x4,%esp
    14db:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    14de:	6a 01                	push   $0x1
    14e0:	50                   	push   %eax
    14e1:	ff 75 08             	pushl  0x8(%ebp)
    14e4:	e8 59 fe ff ff       	call   1342 <write>
    14e9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    14ec:	83 c4 10             	add    $0x10,%esp
    14ef:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    14f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    14f6:	84 db                	test   %bl,%bl
    14f8:	74 7c                	je     1576 <printf+0xd6>
    if(state == 0){
    14fa:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    14fc:	0f be cb             	movsbl %bl,%ecx
    14ff:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1502:	74 c4                	je     14c8 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1504:	83 fa 25             	cmp    $0x25,%edx
    1507:	75 e6                	jne    14ef <printf+0x4f>
      if(c == 'd'){
    1509:	83 f8 64             	cmp    $0x64,%eax
    150c:	0f 84 a6 00 00 00    	je     15b8 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1512:	83 f8 6c             	cmp    $0x6c,%eax
    1515:	0f 84 ad 00 00 00    	je     15c8 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    151b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1521:	83 f9 70             	cmp    $0x70,%ecx
    1524:	74 5a                	je     1580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1526:	83 f8 73             	cmp    $0x73,%eax
    1529:	0f 84 e1 00 00 00    	je     1610 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    152f:	83 f8 63             	cmp    $0x63,%eax
    1532:	0f 84 28 01 00 00    	je     1660 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1538:	83 f8 25             	cmp    $0x25,%eax
    153b:	74 6b                	je     15a8 <printf+0x108>
  write(fd, &c, 1);
    153d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1540:	83 ec 04             	sub    $0x4,%esp
    1543:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1547:	6a 01                	push   $0x1
    1549:	50                   	push   %eax
    154a:	ff 75 08             	pushl  0x8(%ebp)
    154d:	e8 f0 fd ff ff       	call   1342 <write>
    1552:	83 c4 0c             	add    $0xc,%esp
    1555:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1558:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    155b:	6a 01                	push   $0x1
    155d:	50                   	push   %eax
    155e:	ff 75 08             	pushl  0x8(%ebp)
    1561:	83 c6 01             	add    $0x1,%esi
    1564:	e8 d9 fd ff ff       	call   1342 <write>
  for(i = 0; fmt[i]; i++){
    1569:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    156d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1570:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1572:	84 db                	test   %bl,%bl
    1574:	75 84                	jne    14fa <printf+0x5a>
    }
  }
}
    1576:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1579:	5b                   	pop    %ebx
    157a:	5e                   	pop    %esi
    157b:	5f                   	pop    %edi
    157c:	5d                   	pop    %ebp
    157d:	c3                   	ret    
    157e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	b9 10 00 00 00       	mov    $0x10,%ecx
    1588:	6a 00                	push   $0x0
    158a:	8b 17                	mov    (%edi),%edx
    158c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    158f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1592:	e8 69 fe ff ff       	call   1400 <printint>
    1597:	83 c4 10             	add    $0x10,%esp
      state = 0;
    159a:	31 d2                	xor    %edx,%edx
    159c:	e9 4e ff ff ff       	jmp    14ef <printf+0x4f>
    15a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    15a8:	83 ec 04             	sub    $0x4,%esp
    15ab:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    15ae:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    15b1:	6a 01                	push   $0x1
    15b3:	eb a8                	jmp    155d <printf+0xbd>
    15b5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15b8:	83 ec 0c             	sub    $0xc,%esp
    15bb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15c0:	6a 01                	push   $0x1
    15c2:	eb c6                	jmp    158a <printf+0xea>
    15c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    15c8:	8b 57 04             	mov    0x4(%edi),%edx
    15cb:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    15cd:	85 d2                	test   %edx,%edx
    15cf:	74 15                	je     15e6 <printf+0x146>
    15d1:	83 ec 0c             	sub    $0xc,%esp
    15d4:	8b 45 08             	mov    0x8(%ebp),%eax
    15d7:	b9 10 00 00 00       	mov    $0x10,%ecx
    15dc:	6a 00                	push   $0x0
    15de:	e8 1d fe ff ff       	call   1400 <printint>
    15e3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    15e6:	83 ec 0c             	sub    $0xc,%esp
    15e9:	8b 45 08             	mov    0x8(%ebp),%eax
    15ec:	89 da                	mov    %ebx,%edx
    15ee:	6a 00                	push   $0x0
    15f0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    15f5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    15f8:	e8 03 fe ff ff       	call   1400 <printint>
    15fd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1600:	31 d2                	xor    %edx,%edx
    1602:	e9 e8 fe ff ff       	jmp    14ef <printf+0x4f>
    1607:	89 f6                	mov    %esi,%esi
    1609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1610:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1612:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1615:	85 c9                	test   %ecx,%ecx
    1617:	74 6a                	je     1683 <printf+0x1e3>
        while(*s != 0){
    1619:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    161c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    161e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1620:	84 c0                	test   %al,%al
    1622:	0f 84 c7 fe ff ff    	je     14ef <printf+0x4f>
    1628:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    162b:	89 de                	mov    %ebx,%esi
    162d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1630:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1633:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1636:	83 ec 04             	sub    $0x4,%esp
    1639:	6a 01                	push   $0x1
          s++;
    163b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    163e:	50                   	push   %eax
    163f:	53                   	push   %ebx
    1640:	e8 fd fc ff ff       	call   1342 <write>
        while(*s != 0){
    1645:	0f b6 06             	movzbl (%esi),%eax
    1648:	83 c4 10             	add    $0x10,%esp
    164b:	84 c0                	test   %al,%al
    164d:	75 e1                	jne    1630 <printf+0x190>
    164f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1652:	31 d2                	xor    %edx,%edx
    1654:	e9 96 fe ff ff       	jmp    14ef <printf+0x4f>
    1659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1660:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1662:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1665:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1668:	6a 01                	push   $0x1
        putc(fd, *ap);
    166a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    166d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1670:	50                   	push   %eax
    1671:	ff 75 08             	pushl  0x8(%ebp)
    1674:	e8 c9 fc ff ff       	call   1342 <write>
    1679:	83 c4 10             	add    $0x10,%esp
      state = 0;
    167c:	31 d2                	xor    %edx,%edx
    167e:	e9 6c fe ff ff       	jmp    14ef <printf+0x4f>
          s = "(null)";
    1683:	bb a0 18 00 00       	mov    $0x18a0,%ebx
        while(*s != 0){
    1688:	b8 28 00 00 00       	mov    $0x28,%eax
    168d:	eb 99                	jmp    1628 <printf+0x188>
    168f:	90                   	nop

00001690 <free>:
    1690:	55                   	push   %ebp
    1691:	a1 50 1b 00 00       	mov    0x1b50,%eax
    1696:	89 e5                	mov    %esp,%ebp
    1698:	57                   	push   %edi
    1699:	56                   	push   %esi
    169a:	53                   	push   %ebx
    169b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    169e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    16a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16a8:	39 c8                	cmp    %ecx,%eax
    16aa:	8b 10                	mov    (%eax),%edx
    16ac:	73 32                	jae    16e0 <free+0x50>
    16ae:	39 d1                	cmp    %edx,%ecx
    16b0:	72 04                	jb     16b6 <free+0x26>
    16b2:	39 d0                	cmp    %edx,%eax
    16b4:	72 32                	jb     16e8 <free+0x58>
    16b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16bc:	39 fa                	cmp    %edi,%edx
    16be:	74 30                	je     16f0 <free+0x60>
    16c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
    16c3:	8b 50 04             	mov    0x4(%eax),%edx
    16c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16c9:	39 f1                	cmp    %esi,%ecx
    16cb:	74 3a                	je     1707 <free+0x77>
    16cd:	89 08                	mov    %ecx,(%eax)
    16cf:	a3 50 1b 00 00       	mov    %eax,0x1b50
    16d4:	5b                   	pop    %ebx
    16d5:	5e                   	pop    %esi
    16d6:	5f                   	pop    %edi
    16d7:	5d                   	pop    %ebp
    16d8:	c3                   	ret    
    16d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16e0:	39 d0                	cmp    %edx,%eax
    16e2:	72 04                	jb     16e8 <free+0x58>
    16e4:	39 d1                	cmp    %edx,%ecx
    16e6:	72 ce                	jb     16b6 <free+0x26>
    16e8:	89 d0                	mov    %edx,%eax
    16ea:	eb bc                	jmp    16a8 <free+0x18>
    16ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16f0:	03 72 04             	add    0x4(%edx),%esi
    16f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    16f6:	8b 10                	mov    (%eax),%edx
    16f8:	8b 12                	mov    (%edx),%edx
    16fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
    16fd:	8b 50 04             	mov    0x4(%eax),%edx
    1700:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1703:	39 f1                	cmp    %esi,%ecx
    1705:	75 c6                	jne    16cd <free+0x3d>
    1707:	03 53 fc             	add    -0x4(%ebx),%edx
    170a:	a3 50 1b 00 00       	mov    %eax,0x1b50
    170f:	89 50 04             	mov    %edx,0x4(%eax)
    1712:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1715:	89 10                	mov    %edx,(%eax)
    1717:	5b                   	pop    %ebx
    1718:	5e                   	pop    %esi
    1719:	5f                   	pop    %edi
    171a:	5d                   	pop    %ebp
    171b:	c3                   	ret    
    171c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001720 <malloc>:
    1720:	55                   	push   %ebp
    1721:	89 e5                	mov    %esp,%ebp
    1723:	57                   	push   %edi
    1724:	56                   	push   %esi
    1725:	53                   	push   %ebx
    1726:	83 ec 0c             	sub    $0xc,%esp
    1729:	8b 45 08             	mov    0x8(%ebp),%eax
    172c:	8b 15 50 1b 00 00    	mov    0x1b50,%edx
    1732:	8d 78 07             	lea    0x7(%eax),%edi
    1735:	c1 ef 03             	shr    $0x3,%edi
    1738:	83 c7 01             	add    $0x1,%edi
    173b:	85 d2                	test   %edx,%edx
    173d:	0f 84 9d 00 00 00    	je     17e0 <malloc+0xc0>
    1743:	8b 02                	mov    (%edx),%eax
    1745:	8b 48 04             	mov    0x4(%eax),%ecx
    1748:	39 cf                	cmp    %ecx,%edi
    174a:	76 6c                	jbe    17b8 <malloc+0x98>
    174c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1752:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1757:	0f 43 df             	cmovae %edi,%ebx
    175a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1761:	eb 0e                	jmp    1771 <malloc+0x51>
    1763:	90                   	nop
    1764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1768:	8b 02                	mov    (%edx),%eax
    176a:	8b 48 04             	mov    0x4(%eax),%ecx
    176d:	39 f9                	cmp    %edi,%ecx
    176f:	73 47                	jae    17b8 <malloc+0x98>
    1771:	39 05 50 1b 00 00    	cmp    %eax,0x1b50
    1777:	89 c2                	mov    %eax,%edx
    1779:	75 ed                	jne    1768 <malloc+0x48>
    177b:	83 ec 0c             	sub    $0xc,%esp
    177e:	56                   	push   %esi
    177f:	e8 26 fc ff ff       	call   13aa <sbrk>
    1784:	83 c4 10             	add    $0x10,%esp
    1787:	83 f8 ff             	cmp    $0xffffffff,%eax
    178a:	74 1c                	je     17a8 <malloc+0x88>
    178c:	89 58 04             	mov    %ebx,0x4(%eax)
    178f:	83 ec 0c             	sub    $0xc,%esp
    1792:	83 c0 08             	add    $0x8,%eax
    1795:	50                   	push   %eax
    1796:	e8 f5 fe ff ff       	call   1690 <free>
    179b:	8b 15 50 1b 00 00    	mov    0x1b50,%edx
    17a1:	83 c4 10             	add    $0x10,%esp
    17a4:	85 d2                	test   %edx,%edx
    17a6:	75 c0                	jne    1768 <malloc+0x48>
    17a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17ab:	31 c0                	xor    %eax,%eax
    17ad:	5b                   	pop    %ebx
    17ae:	5e                   	pop    %esi
    17af:	5f                   	pop    %edi
    17b0:	5d                   	pop    %ebp
    17b1:	c3                   	ret    
    17b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    17b8:	39 cf                	cmp    %ecx,%edi
    17ba:	74 54                	je     1810 <malloc+0xf0>
    17bc:	29 f9                	sub    %edi,%ecx
    17be:	89 48 04             	mov    %ecx,0x4(%eax)
    17c1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    17c4:	89 78 04             	mov    %edi,0x4(%eax)
    17c7:	89 15 50 1b 00 00    	mov    %edx,0x1b50
    17cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17d0:	83 c0 08             	add    $0x8,%eax
    17d3:	5b                   	pop    %ebx
    17d4:	5e                   	pop    %esi
    17d5:	5f                   	pop    %edi
    17d6:	5d                   	pop    %ebp
    17d7:	c3                   	ret    
    17d8:	90                   	nop
    17d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17e0:	c7 05 50 1b 00 00 54 	movl   $0x1b54,0x1b50
    17e7:	1b 00 00 
    17ea:	c7 05 54 1b 00 00 54 	movl   $0x1b54,0x1b54
    17f1:	1b 00 00 
    17f4:	b8 54 1b 00 00       	mov    $0x1b54,%eax
    17f9:	c7 05 58 1b 00 00 00 	movl   $0x0,0x1b58
    1800:	00 00 00 
    1803:	e9 44 ff ff ff       	jmp    174c <malloc+0x2c>
    1808:	90                   	nop
    1809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1810:	8b 08                	mov    (%eax),%ecx
    1812:	89 0a                	mov    %ecx,(%edx)
    1814:	eb b1                	jmp    17c7 <malloc+0xa7>
