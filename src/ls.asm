
_ls:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  close(fd);
}

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

  if(argc < 2){
    1018:	83 f8 01             	cmp    $0x1,%eax
    101b:	7e 24                	jle    1041 <main+0x41>
    101d:	8d 5a 04             	lea    0x4(%edx),%ebx
    1020:	8d 34 82             	lea    (%edx,%eax,4),%esi
    1023:	90                   	nop
    1024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	ff 33                	pushl  (%ebx)
    102d:	83 c3 04             	add    $0x4,%ebx
    1030:	e8 cb 00 00 00       	call   1100 <ls>
  for(i=1; i<argc; i++)
    1035:	83 c4 10             	add    $0x10,%esp
    1038:	39 f3                	cmp    %esi,%ebx
    103a:	75 ec                	jne    1028 <main+0x28>
  exit();
    103c:	e8 41 05 00 00       	call   1582 <exit>
    ls(".");
    1041:	83 ec 0c             	sub    $0xc,%esp
    1044:	68 c0 1a 00 00       	push   $0x1ac0
    1049:	e8 b2 00 00 00       	call   1100 <ls>
    exit();
    104e:	e8 2f 05 00 00       	call   1582 <exit>
    1053:	66 90                	xchg   %ax,%ax
    1055:	66 90                	xchg   %ax,%ax
    1057:	66 90                	xchg   %ax,%ax
    1059:	66 90                	xchg   %ax,%ax
    105b:	66 90                	xchg   %ax,%ax
    105d:	66 90                	xchg   %ax,%ax
    105f:	90                   	nop

00001060 <fmtname>:
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	56                   	push   %esi
    1064:	53                   	push   %ebx
    1065:	8b 5d 08             	mov    0x8(%ebp),%ebx
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    1068:	83 ec 0c             	sub    $0xc,%esp
    106b:	53                   	push   %ebx
    106c:	e8 3f 03 00 00       	call   13b0 <strlen>
    1071:	83 c4 10             	add    $0x10,%esp
    1074:	01 d8                	add    %ebx,%eax
    1076:	73 0f                	jae    1087 <fmtname+0x27>
    1078:	eb 12                	jmp    108c <fmtname+0x2c>
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1080:	83 e8 01             	sub    $0x1,%eax
    1083:	39 c3                	cmp    %eax,%ebx
    1085:	77 05                	ja     108c <fmtname+0x2c>
    1087:	80 38 2f             	cmpb   $0x2f,(%eax)
    108a:	75 f4                	jne    1080 <fmtname+0x20>
  p++;
    108c:	8d 58 01             	lea    0x1(%eax),%ebx
  if(strlen(p) >= DIRSIZ)
    108f:	83 ec 0c             	sub    $0xc,%esp
    1092:	53                   	push   %ebx
    1093:	e8 18 03 00 00       	call   13b0 <strlen>
    1098:	83 c4 10             	add    $0x10,%esp
    109b:	83 f8 0d             	cmp    $0xd,%eax
    109e:	77 4a                	ja     10ea <fmtname+0x8a>
  memmove(buf, p, strlen(p));
    10a0:	83 ec 0c             	sub    $0xc,%esp
    10a3:	53                   	push   %ebx
    10a4:	e8 07 03 00 00       	call   13b0 <strlen>
    10a9:	83 c4 0c             	add    $0xc,%esp
    10ac:	50                   	push   %eax
    10ad:	53                   	push   %ebx
    10ae:	68 ec 1d 00 00       	push   $0x1dec
    10b3:	e8 98 04 00 00       	call   1550 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10b8:	89 1c 24             	mov    %ebx,(%esp)
    10bb:	e8 f0 02 00 00       	call   13b0 <strlen>
    10c0:	89 1c 24             	mov    %ebx,(%esp)
    10c3:	89 c6                	mov    %eax,%esi
  return buf;
    10c5:	bb ec 1d 00 00       	mov    $0x1dec,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10ca:	e8 e1 02 00 00       	call   13b0 <strlen>
    10cf:	ba 0e 00 00 00       	mov    $0xe,%edx
    10d4:	83 c4 0c             	add    $0xc,%esp
    10d7:	05 ec 1d 00 00       	add    $0x1dec,%eax
    10dc:	29 f2                	sub    %esi,%edx
    10de:	52                   	push   %edx
    10df:	6a 20                	push   $0x20
    10e1:	50                   	push   %eax
    10e2:	e8 f9 02 00 00       	call   13e0 <memset>
  return buf;
    10e7:	83 c4 10             	add    $0x10,%esp
}
    10ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10ed:	89 d8                	mov    %ebx,%eax
    10ef:	5b                   	pop    %ebx
    10f0:	5e                   	pop    %esi
    10f1:	5d                   	pop    %ebp
    10f2:	c3                   	ret    
    10f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <ls>:
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	57                   	push   %edi
    1104:	56                   	push   %esi
    1105:	53                   	push   %ebx
    1106:	81 ec 64 02 00 00    	sub    $0x264,%esp
    110c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
    110f:	6a 00                	push   $0x0
    1111:	57                   	push   %edi
    1112:	e8 ab 04 00 00       	call   15c2 <open>
    1117:	83 c4 10             	add    $0x10,%esp
    111a:	85 c0                	test   %eax,%eax
    111c:	78 52                	js     1170 <ls+0x70>
  if(fstat(fd, &st) < 0){
    111e:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
    1124:	83 ec 08             	sub    $0x8,%esp
    1127:	89 c3                	mov    %eax,%ebx
    1129:	56                   	push   %esi
    112a:	50                   	push   %eax
    112b:	e8 aa 04 00 00       	call   15da <fstat>
    1130:	83 c4 10             	add    $0x10,%esp
    1133:	85 c0                	test   %eax,%eax
    1135:	0f 88 c5 00 00 00    	js     1200 <ls+0x100>
  switch(st.type){
    113b:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
    1142:	66 83 f8 01          	cmp    $0x1,%ax
    1146:	0f 84 84 00 00 00    	je     11d0 <ls+0xd0>
    114c:	66 83 f8 02          	cmp    $0x2,%ax
    1150:	74 3e                	je     1190 <ls+0x90>
  close(fd);
    1152:	83 ec 0c             	sub    $0xc,%esp
    1155:	53                   	push   %ebx
    1156:	e8 4f 04 00 00       	call   15aa <close>
    115b:	83 c4 10             	add    $0x10,%esp
}
    115e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1161:	5b                   	pop    %ebx
    1162:	5e                   	pop    %esi
    1163:	5f                   	pop    %edi
    1164:	5d                   	pop    %ebp
    1165:	c3                   	ret    
    1166:	8d 76 00             	lea    0x0(%esi),%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "ls: cannot open %s\n", path);
    1170:	83 ec 04             	sub    $0x4,%esp
    1173:	57                   	push   %edi
    1174:	68 78 1a 00 00       	push   $0x1a78
    1179:	6a 02                	push   $0x2
    117b:	e8 80 05 00 00       	call   1700 <printf>
    return;
    1180:	83 c4 10             	add    $0x10,%esp
}
    1183:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1186:	5b                   	pop    %ebx
    1187:	5e                   	pop    %esi
    1188:	5f                   	pop    %edi
    1189:	5d                   	pop    %ebp
    118a:	c3                   	ret    
    118b:	90                   	nop
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    1190:	83 ec 0c             	sub    $0xc,%esp
    1193:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
    1199:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
    119f:	57                   	push   %edi
    11a0:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
    11a6:	e8 b5 fe ff ff       	call   1060 <fmtname>
    11ab:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
    11b1:	59                   	pop    %ecx
    11b2:	5f                   	pop    %edi
    11b3:	52                   	push   %edx
    11b4:	56                   	push   %esi
    11b5:	6a 02                	push   $0x2
    11b7:	50                   	push   %eax
    11b8:	68 a0 1a 00 00       	push   $0x1aa0
    11bd:	6a 01                	push   $0x1
    11bf:	e8 3c 05 00 00       	call   1700 <printf>
    break;
    11c4:	83 c4 20             	add    $0x20,%esp
    11c7:	eb 89                	jmp    1152 <ls+0x52>
    11c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
    11d0:	83 ec 0c             	sub    $0xc,%esp
    11d3:	57                   	push   %edi
    11d4:	e8 d7 01 00 00       	call   13b0 <strlen>
    11d9:	83 c0 10             	add    $0x10,%eax
    11dc:	83 c4 10             	add    $0x10,%esp
    11df:	3d 00 02 00 00       	cmp    $0x200,%eax
    11e4:	76 42                	jbe    1228 <ls+0x128>
      printf(1, "ls: path too long\n");
    11e6:	83 ec 08             	sub    $0x8,%esp
    11e9:	68 ad 1a 00 00       	push   $0x1aad
    11ee:	6a 01                	push   $0x1
    11f0:	e8 0b 05 00 00       	call   1700 <printf>
      break;
    11f5:	83 c4 10             	add    $0x10,%esp
    11f8:	e9 55 ff ff ff       	jmp    1152 <ls+0x52>
    11fd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot stat %s\n", path);
    1200:	83 ec 04             	sub    $0x4,%esp
    1203:	57                   	push   %edi
    1204:	68 8c 1a 00 00       	push   $0x1a8c
    1209:	6a 02                	push   $0x2
    120b:	e8 f0 04 00 00       	call   1700 <printf>
    close(fd);
    1210:	89 1c 24             	mov    %ebx,(%esp)
    1213:	e8 92 03 00 00       	call   15aa <close>
    return;
    1218:	83 c4 10             	add    $0x10,%esp
}
    121b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    121e:	5b                   	pop    %ebx
    121f:	5e                   	pop    %esi
    1220:	5f                   	pop    %edi
    1221:	5d                   	pop    %ebp
    1222:	c3                   	ret    
    1223:	90                   	nop
    1224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    strcpy(buf, path);
    1228:	83 ec 08             	sub    $0x8,%esp
    122b:	57                   	push   %edi
    122c:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
    1232:	57                   	push   %edi
    1233:	e8 f8 00 00 00       	call   1330 <strcpy>
    p = buf+strlen(buf);
    1238:	89 3c 24             	mov    %edi,(%esp)
    123b:	e8 70 01 00 00       	call   13b0 <strlen>
    1240:	01 f8                	add    %edi,%eax
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    1242:	83 c4 10             	add    $0x10,%esp
    *p++ = '/';
    1245:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
    1248:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
    124e:	c6 00 2f             	movb   $0x2f,(%eax)
    1251:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
    1257:	89 f6                	mov    %esi,%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    1260:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
    1266:	83 ec 04             	sub    $0x4,%esp
    1269:	6a 10                	push   $0x10
    126b:	50                   	push   %eax
    126c:	53                   	push   %ebx
    126d:	e8 28 03 00 00       	call   159a <read>
    1272:	83 c4 10             	add    $0x10,%esp
    1275:	83 f8 10             	cmp    $0x10,%eax
    1278:	0f 85 d4 fe ff ff    	jne    1152 <ls+0x52>
      if(de.inum == 0)
    127e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
    1285:	00 
    1286:	74 d8                	je     1260 <ls+0x160>
      memmove(p, de.name, DIRSIZ);
    1288:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
    128e:	83 ec 04             	sub    $0x4,%esp
    1291:	6a 0e                	push   $0xe
    1293:	50                   	push   %eax
    1294:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
    129a:	e8 b1 02 00 00       	call   1550 <memmove>
      p[DIRSIZ] = 0;
    129f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    12a5:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
    12a9:	58                   	pop    %eax
    12aa:	5a                   	pop    %edx
    12ab:	56                   	push   %esi
    12ac:	57                   	push   %edi
    12ad:	e8 0e 02 00 00       	call   14c0 <stat>
    12b2:	83 c4 10             	add    $0x10,%esp
    12b5:	85 c0                	test   %eax,%eax
    12b7:	78 5f                	js     1318 <ls+0x218>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    12b9:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
    12c0:	83 ec 0c             	sub    $0xc,%esp
    12c3:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
    12c9:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
    12cf:	57                   	push   %edi
    12d0:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
    12d6:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
    12dc:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    12e2:	e8 79 fd ff ff       	call   1060 <fmtname>
    12e7:	5a                   	pop    %edx
    12e8:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
    12ee:	59                   	pop    %ecx
    12ef:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
    12f5:	51                   	push   %ecx
    12f6:	52                   	push   %edx
    12f7:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
    12fd:	50                   	push   %eax
    12fe:	68 a0 1a 00 00       	push   $0x1aa0
    1303:	6a 01                	push   $0x1
    1305:	e8 f6 03 00 00       	call   1700 <printf>
    130a:	83 c4 20             	add    $0x20,%esp
    130d:	e9 4e ff ff ff       	jmp    1260 <ls+0x160>
    1312:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, "ls: cannot stat %s\n", buf);
    1318:	83 ec 04             	sub    $0x4,%esp
    131b:	57                   	push   %edi
    131c:	68 8c 1a 00 00       	push   $0x1a8c
    1321:	6a 01                	push   $0x1
    1323:	e8 d8 03 00 00       	call   1700 <printf>
        continue;
    1328:	83 c4 10             	add    $0x10,%esp
    132b:	e9 30 ff ff ff       	jmp    1260 <ls+0x160>

00001330 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	53                   	push   %ebx
    1334:	8b 45 08             	mov    0x8(%ebp),%eax
    1337:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    133a:	89 c2                	mov    %eax,%edx
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1340:	83 c1 01             	add    $0x1,%ecx
    1343:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1347:	83 c2 01             	add    $0x1,%edx
    134a:	84 db                	test   %bl,%bl
    134c:	88 5a ff             	mov    %bl,-0x1(%edx)
    134f:	75 ef                	jne    1340 <strcpy+0x10>
    ;
  return os;
}
    1351:	5b                   	pop    %ebx
    1352:	5d                   	pop    %ebp
    1353:	c3                   	ret    
    1354:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    135a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	8b 55 08             	mov    0x8(%ebp),%edx
    1367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    136a:	0f b6 02             	movzbl (%edx),%eax
    136d:	0f b6 19             	movzbl (%ecx),%ebx
    1370:	84 c0                	test   %al,%al
    1372:	75 1c                	jne    1390 <strcmp+0x30>
    1374:	eb 2a                	jmp    13a0 <strcmp+0x40>
    1376:	8d 76 00             	lea    0x0(%esi),%esi
    1379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1380:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1383:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1386:	83 c1 01             	add    $0x1,%ecx
    1389:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    138c:	84 c0                	test   %al,%al
    138e:	74 10                	je     13a0 <strcmp+0x40>
    1390:	38 d8                	cmp    %bl,%al
    1392:	74 ec                	je     1380 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1394:	29 d8                	sub    %ebx,%eax
}
    1396:	5b                   	pop    %ebx
    1397:	5d                   	pop    %ebp
    1398:	c3                   	ret    
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    13a2:	29 d8                	sub    %ebx,%eax
}
    13a4:	5b                   	pop    %ebx
    13a5:	5d                   	pop    %ebp
    13a6:	c3                   	ret    
    13a7:	89 f6                	mov    %esi,%esi
    13a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000013b0 <strlen>:

uint
strlen(const char *s)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    13b6:	80 39 00             	cmpb   $0x0,(%ecx)
    13b9:	74 15                	je     13d0 <strlen+0x20>
    13bb:	31 d2                	xor    %edx,%edx
    13bd:	8d 76 00             	lea    0x0(%esi),%esi
    13c0:	83 c2 01             	add    $0x1,%edx
    13c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    13c7:	89 d0                	mov    %edx,%eax
    13c9:	75 f5                	jne    13c0 <strlen+0x10>
    ;
  return n;
}
    13cb:	5d                   	pop    %ebp
    13cc:	c3                   	ret    
    13cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    13d0:	31 c0                	xor    %eax,%eax
}
    13d2:	5d                   	pop    %ebp
    13d3:	c3                   	ret    
    13d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000013e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	57                   	push   %edi
    13e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    13e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    13ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ed:	89 d7                	mov    %edx,%edi
    13ef:	fc                   	cld    
    13f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    13f2:	89 d0                	mov    %edx,%eax
    13f4:	5f                   	pop    %edi
    13f5:	5d                   	pop    %ebp
    13f6:	c3                   	ret    
    13f7:	89 f6                	mov    %esi,%esi
    13f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001400 <strchr>:

char*
strchr(const char *s, char c)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	53                   	push   %ebx
    1404:	8b 45 08             	mov    0x8(%ebp),%eax
    1407:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    140a:	0f b6 10             	movzbl (%eax),%edx
    140d:	84 d2                	test   %dl,%dl
    140f:	74 1d                	je     142e <strchr+0x2e>
    if(*s == c)
    1411:	38 d3                	cmp    %dl,%bl
    1413:	89 d9                	mov    %ebx,%ecx
    1415:	75 0d                	jne    1424 <strchr+0x24>
    1417:	eb 17                	jmp    1430 <strchr+0x30>
    1419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1420:	38 ca                	cmp    %cl,%dl
    1422:	74 0c                	je     1430 <strchr+0x30>
  for(; *s; s++)
    1424:	83 c0 01             	add    $0x1,%eax
    1427:	0f b6 10             	movzbl (%eax),%edx
    142a:	84 d2                	test   %dl,%dl
    142c:	75 f2                	jne    1420 <strchr+0x20>
      return (char*)s;
  return 0;
    142e:	31 c0                	xor    %eax,%eax
}
    1430:	5b                   	pop    %ebx
    1431:	5d                   	pop    %ebp
    1432:	c3                   	ret    
    1433:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001440 <gets>:

char*
gets(char *buf, int max)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	57                   	push   %edi
    1444:	56                   	push   %esi
    1445:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1446:	31 f6                	xor    %esi,%esi
    1448:	89 f3                	mov    %esi,%ebx
{
    144a:	83 ec 1c             	sub    $0x1c,%esp
    144d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1450:	eb 2f                	jmp    1481 <gets+0x41>
    1452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1458:	8d 45 e7             	lea    -0x19(%ebp),%eax
    145b:	83 ec 04             	sub    $0x4,%esp
    145e:	6a 01                	push   $0x1
    1460:	50                   	push   %eax
    1461:	6a 00                	push   $0x0
    1463:	e8 32 01 00 00       	call   159a <read>
    if(cc < 1)
    1468:	83 c4 10             	add    $0x10,%esp
    146b:	85 c0                	test   %eax,%eax
    146d:	7e 1c                	jle    148b <gets+0x4b>
      break;
    buf[i++] = c;
    146f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1473:	83 c7 01             	add    $0x1,%edi
    1476:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1479:	3c 0a                	cmp    $0xa,%al
    147b:	74 23                	je     14a0 <gets+0x60>
    147d:	3c 0d                	cmp    $0xd,%al
    147f:	74 1f                	je     14a0 <gets+0x60>
  for(i=0; i+1 < max; ){
    1481:	83 c3 01             	add    $0x1,%ebx
    1484:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1487:	89 fe                	mov    %edi,%esi
    1489:	7c cd                	jl     1458 <gets+0x18>
    148b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    148d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1490:	c6 03 00             	movb   $0x0,(%ebx)
}
    1493:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1496:	5b                   	pop    %ebx
    1497:	5e                   	pop    %esi
    1498:	5f                   	pop    %edi
    1499:	5d                   	pop    %ebp
    149a:	c3                   	ret    
    149b:	90                   	nop
    149c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14a0:	8b 75 08             	mov    0x8(%ebp),%esi
    14a3:	8b 45 08             	mov    0x8(%ebp),%eax
    14a6:	01 de                	add    %ebx,%esi
    14a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    14aa:	c6 03 00             	movb   $0x0,(%ebx)
}
    14ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b0:	5b                   	pop    %ebx
    14b1:	5e                   	pop    %esi
    14b2:	5f                   	pop    %edi
    14b3:	5d                   	pop    %ebp
    14b4:	c3                   	ret    
    14b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000014c0 <stat>:

int
stat(const char *n, struct stat *st)
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
    14c3:	56                   	push   %esi
    14c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14c5:	83 ec 08             	sub    $0x8,%esp
    14c8:	6a 00                	push   $0x0
    14ca:	ff 75 08             	pushl  0x8(%ebp)
    14cd:	e8 f0 00 00 00       	call   15c2 <open>
  if(fd < 0)
    14d2:	83 c4 10             	add    $0x10,%esp
    14d5:	85 c0                	test   %eax,%eax
    14d7:	78 27                	js     1500 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    14d9:	83 ec 08             	sub    $0x8,%esp
    14dc:	ff 75 0c             	pushl  0xc(%ebp)
    14df:	89 c3                	mov    %eax,%ebx
    14e1:	50                   	push   %eax
    14e2:	e8 f3 00 00 00       	call   15da <fstat>
  close(fd);
    14e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    14ea:	89 c6                	mov    %eax,%esi
  close(fd);
    14ec:	e8 b9 00 00 00       	call   15aa <close>
  return r;
    14f1:	83 c4 10             	add    $0x10,%esp
}
    14f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    14f7:	89 f0                	mov    %esi,%eax
    14f9:	5b                   	pop    %ebx
    14fa:	5e                   	pop    %esi
    14fb:	5d                   	pop    %ebp
    14fc:	c3                   	ret    
    14fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1500:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1505:	eb ed                	jmp    14f4 <stat+0x34>
    1507:	89 f6                	mov    %esi,%esi
    1509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001510 <atoi>:

int
atoi(const char *s)
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	53                   	push   %ebx
    1514:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1517:	0f be 11             	movsbl (%ecx),%edx
    151a:	8d 42 d0             	lea    -0x30(%edx),%eax
    151d:	3c 09                	cmp    $0x9,%al
  n = 0;
    151f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1524:	77 1f                	ja     1545 <atoi+0x35>
    1526:	8d 76 00             	lea    0x0(%esi),%esi
    1529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1530:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1533:	83 c1 01             	add    $0x1,%ecx
    1536:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    153a:	0f be 11             	movsbl (%ecx),%edx
    153d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1540:	80 fb 09             	cmp    $0x9,%bl
    1543:	76 eb                	jbe    1530 <atoi+0x20>
  return n;
}
    1545:	5b                   	pop    %ebx
    1546:	5d                   	pop    %ebp
    1547:	c3                   	ret    
    1548:	90                   	nop
    1549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001550 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1550:	55                   	push   %ebp
    1551:	89 e5                	mov    %esp,%ebp
    1553:	56                   	push   %esi
    1554:	53                   	push   %ebx
    1555:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1558:	8b 45 08             	mov    0x8(%ebp),%eax
    155b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    155e:	85 db                	test   %ebx,%ebx
    1560:	7e 14                	jle    1576 <memmove+0x26>
    1562:	31 d2                	xor    %edx,%edx
    1564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1568:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    156c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    156f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1572:	39 d3                	cmp    %edx,%ebx
    1574:	75 f2                	jne    1568 <memmove+0x18>
  return vdst;
}
    1576:	5b                   	pop    %ebx
    1577:	5e                   	pop    %esi
    1578:	5d                   	pop    %ebp
    1579:	c3                   	ret    

0000157a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    157a:	b8 01 00 00 00       	mov    $0x1,%eax
    157f:	cd 40                	int    $0x40
    1581:	c3                   	ret    

00001582 <exit>:
SYSCALL(exit)
    1582:	b8 02 00 00 00       	mov    $0x2,%eax
    1587:	cd 40                	int    $0x40
    1589:	c3                   	ret    

0000158a <wait>:
SYSCALL(wait)
    158a:	b8 03 00 00 00       	mov    $0x3,%eax
    158f:	cd 40                	int    $0x40
    1591:	c3                   	ret    

00001592 <pipe>:
SYSCALL(pipe)
    1592:	b8 04 00 00 00       	mov    $0x4,%eax
    1597:	cd 40                	int    $0x40
    1599:	c3                   	ret    

0000159a <read>:
SYSCALL(read)
    159a:	b8 05 00 00 00       	mov    $0x5,%eax
    159f:	cd 40                	int    $0x40
    15a1:	c3                   	ret    

000015a2 <write>:
SYSCALL(write)
    15a2:	b8 10 00 00 00       	mov    $0x10,%eax
    15a7:	cd 40                	int    $0x40
    15a9:	c3                   	ret    

000015aa <close>:
SYSCALL(close)
    15aa:	b8 15 00 00 00       	mov    $0x15,%eax
    15af:	cd 40                	int    $0x40
    15b1:	c3                   	ret    

000015b2 <kill>:
SYSCALL(kill)
    15b2:	b8 06 00 00 00       	mov    $0x6,%eax
    15b7:	cd 40                	int    $0x40
    15b9:	c3                   	ret    

000015ba <exec>:
SYSCALL(exec)
    15ba:	b8 07 00 00 00       	mov    $0x7,%eax
    15bf:	cd 40                	int    $0x40
    15c1:	c3                   	ret    

000015c2 <open>:
SYSCALL(open)
    15c2:	b8 0f 00 00 00       	mov    $0xf,%eax
    15c7:	cd 40                	int    $0x40
    15c9:	c3                   	ret    

000015ca <mknod>:
SYSCALL(mknod)
    15ca:	b8 11 00 00 00       	mov    $0x11,%eax
    15cf:	cd 40                	int    $0x40
    15d1:	c3                   	ret    

000015d2 <unlink>:
SYSCALL(unlink)
    15d2:	b8 12 00 00 00       	mov    $0x12,%eax
    15d7:	cd 40                	int    $0x40
    15d9:	c3                   	ret    

000015da <fstat>:
SYSCALL(fstat)
    15da:	b8 08 00 00 00       	mov    $0x8,%eax
    15df:	cd 40                	int    $0x40
    15e1:	c3                   	ret    

000015e2 <link>:
SYSCALL(link)
    15e2:	b8 13 00 00 00       	mov    $0x13,%eax
    15e7:	cd 40                	int    $0x40
    15e9:	c3                   	ret    

000015ea <mkdir>:
SYSCALL(mkdir)
    15ea:	b8 14 00 00 00       	mov    $0x14,%eax
    15ef:	cd 40                	int    $0x40
    15f1:	c3                   	ret    

000015f2 <chdir>:
SYSCALL(chdir)
    15f2:	b8 09 00 00 00       	mov    $0x9,%eax
    15f7:	cd 40                	int    $0x40
    15f9:	c3                   	ret    

000015fa <dup>:
SYSCALL(dup)
    15fa:	b8 0a 00 00 00       	mov    $0xa,%eax
    15ff:	cd 40                	int    $0x40
    1601:	c3                   	ret    

00001602 <getpid>:
SYSCALL(getpid)
    1602:	b8 0b 00 00 00       	mov    $0xb,%eax
    1607:	cd 40                	int    $0x40
    1609:	c3                   	ret    

0000160a <sbrk>:
SYSCALL(sbrk)
    160a:	b8 0c 00 00 00       	mov    $0xc,%eax
    160f:	cd 40                	int    $0x40
    1611:	c3                   	ret    

00001612 <sleep>:
SYSCALL(sleep)
    1612:	b8 0d 00 00 00       	mov    $0xd,%eax
    1617:	cd 40                	int    $0x40
    1619:	c3                   	ret    

0000161a <uptime>:
SYSCALL(uptime)
    161a:	b8 0e 00 00 00       	mov    $0xe,%eax
    161f:	cd 40                	int    $0x40
    1621:	c3                   	ret    

00001622 <getreadcount>:
SYSCALL(getreadcount)
    1622:	b8 16 00 00 00       	mov    $0x16,%eax
    1627:	cd 40                	int    $0x40
    1629:	c3                   	ret    

0000162a <gettime>:
SYSCALL(gettime)
    162a:	b8 17 00 00 00       	mov    $0x17,%eax
    162f:	cd 40                	int    $0x40
    1631:	c3                   	ret    

00001632 <settickets>:
SYSCALL(settickets)
    1632:	b8 18 00 00 00       	mov    $0x18,%eax
    1637:	cd 40                	int    $0x40
    1639:	c3                   	ret    

0000163a <getpinfo>:
SYSCALL(getpinfo)
    163a:	b8 19 00 00 00       	mov    $0x19,%eax
    163f:	cd 40                	int    $0x40
    1641:	c3                   	ret    

00001642 <mprotect>:
SYSCALL(mprotect)
    1642:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1647:	cd 40                	int    $0x40
    1649:	c3                   	ret    

0000164a <munprotect>:
    164a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    164f:	cd 40                	int    $0x40
    1651:	c3                   	ret    
    1652:	66 90                	xchg   %ax,%ax
    1654:	66 90                	xchg   %ax,%ax
    1656:	66 90                	xchg   %ax,%ax
    1658:	66 90                	xchg   %ax,%ax
    165a:	66 90                	xchg   %ax,%ax
    165c:	66 90                	xchg   %ax,%ax
    165e:	66 90                	xchg   %ax,%ax

00001660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	53                   	push   %ebx
    1666:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1669:	85 d2                	test   %edx,%edx
{
    166b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    166e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1670:	79 76                	jns    16e8 <printint+0x88>
    1672:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1676:	74 70                	je     16e8 <printint+0x88>
    x = -xx;
    1678:	f7 d8                	neg    %eax
    neg = 1;
    167a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1681:	31 f6                	xor    %esi,%esi
    1683:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1686:	eb 0a                	jmp    1692 <printint+0x32>
    1688:	90                   	nop
    1689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1690:	89 fe                	mov    %edi,%esi
    1692:	31 d2                	xor    %edx,%edx
    1694:	8d 7e 01             	lea    0x1(%esi),%edi
    1697:	f7 f1                	div    %ecx
    1699:	0f b6 92 cc 1a 00 00 	movzbl 0x1acc(%edx),%edx
  }while((x /= base) != 0);
    16a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    16a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    16a5:	75 e9                	jne    1690 <printint+0x30>
  if(neg)
    16a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    16aa:	85 c0                	test   %eax,%eax
    16ac:	74 08                	je     16b6 <printint+0x56>
    buf[i++] = '-';
    16ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    16b3:	8d 7e 02             	lea    0x2(%esi),%edi
    16b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    16ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
    16bd:	8d 76 00             	lea    0x0(%esi),%esi
    16c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    16c3:	83 ec 04             	sub    $0x4,%esp
    16c6:	83 ee 01             	sub    $0x1,%esi
    16c9:	6a 01                	push   $0x1
    16cb:	53                   	push   %ebx
    16cc:	57                   	push   %edi
    16cd:	88 45 d7             	mov    %al,-0x29(%ebp)
    16d0:	e8 cd fe ff ff       	call   15a2 <write>

  while(--i >= 0)
    16d5:	83 c4 10             	add    $0x10,%esp
    16d8:	39 de                	cmp    %ebx,%esi
    16da:	75 e4                	jne    16c0 <printint+0x60>
    putc(fd, buf[i]);
}
    16dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16df:	5b                   	pop    %ebx
    16e0:	5e                   	pop    %esi
    16e1:	5f                   	pop    %edi
    16e2:	5d                   	pop    %ebp
    16e3:	c3                   	ret    
    16e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    16e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    16ef:	eb 90                	jmp    1681 <printint+0x21>
    16f1:	eb 0d                	jmp    1700 <printf>
    16f3:	90                   	nop
    16f4:	90                   	nop
    16f5:	90                   	nop
    16f6:	90                   	nop
    16f7:	90                   	nop
    16f8:	90                   	nop
    16f9:	90                   	nop
    16fa:	90                   	nop
    16fb:	90                   	nop
    16fc:	90                   	nop
    16fd:	90                   	nop
    16fe:	90                   	nop
    16ff:	90                   	nop

00001700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1700:	55                   	push   %ebp
    1701:	89 e5                	mov    %esp,%ebp
    1703:	57                   	push   %edi
    1704:	56                   	push   %esi
    1705:	53                   	push   %ebx
    1706:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1709:	8b 75 0c             	mov    0xc(%ebp),%esi
    170c:	0f b6 1e             	movzbl (%esi),%ebx
    170f:	84 db                	test   %bl,%bl
    1711:	0f 84 bf 00 00 00    	je     17d6 <printf+0xd6>
    1717:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    171a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    171d:	31 d2                	xor    %edx,%edx
    171f:	eb 39                	jmp    175a <printf+0x5a>
    1721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1728:	83 f8 25             	cmp    $0x25,%eax
    172b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    172e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1733:	74 1a                	je     174f <printf+0x4f>
  write(fd, &c, 1);
    1735:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1738:	83 ec 04             	sub    $0x4,%esp
    173b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    173e:	6a 01                	push   $0x1
    1740:	50                   	push   %eax
    1741:	ff 75 08             	pushl  0x8(%ebp)
    1744:	e8 59 fe ff ff       	call   15a2 <write>
    1749:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    174c:	83 c4 10             	add    $0x10,%esp
    174f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1752:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1756:	84 db                	test   %bl,%bl
    1758:	74 7c                	je     17d6 <printf+0xd6>
    if(state == 0){
    175a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    175c:	0f be cb             	movsbl %bl,%ecx
    175f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1762:	74 c4                	je     1728 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1764:	83 fa 25             	cmp    $0x25,%edx
    1767:	75 e6                	jne    174f <printf+0x4f>
      if(c == 'd'){
    1769:	83 f8 64             	cmp    $0x64,%eax
    176c:	0f 84 a6 00 00 00    	je     1818 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1772:	83 f8 6c             	cmp    $0x6c,%eax
    1775:	0f 84 ad 00 00 00    	je     1828 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    177b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1781:	83 f9 70             	cmp    $0x70,%ecx
    1784:	74 5a                	je     17e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1786:	83 f8 73             	cmp    $0x73,%eax
    1789:	0f 84 e1 00 00 00    	je     1870 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    178f:	83 f8 63             	cmp    $0x63,%eax
    1792:	0f 84 28 01 00 00    	je     18c0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1798:	83 f8 25             	cmp    $0x25,%eax
    179b:	74 6b                	je     1808 <printf+0x108>
  write(fd, &c, 1);
    179d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    17a0:	83 ec 04             	sub    $0x4,%esp
    17a3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    17a7:	6a 01                	push   $0x1
    17a9:	50                   	push   %eax
    17aa:	ff 75 08             	pushl  0x8(%ebp)
    17ad:	e8 f0 fd ff ff       	call   15a2 <write>
    17b2:	83 c4 0c             	add    $0xc,%esp
    17b5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    17b8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    17bb:	6a 01                	push   $0x1
    17bd:	50                   	push   %eax
    17be:	ff 75 08             	pushl  0x8(%ebp)
    17c1:	83 c6 01             	add    $0x1,%esi
    17c4:	e8 d9 fd ff ff       	call   15a2 <write>
  for(i = 0; fmt[i]; i++){
    17c9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    17cd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    17d0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    17d2:	84 db                	test   %bl,%bl
    17d4:	75 84                	jne    175a <printf+0x5a>
    }
  }
}
    17d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17d9:	5b                   	pop    %ebx
    17da:	5e                   	pop    %esi
    17db:	5f                   	pop    %edi
    17dc:	5d                   	pop    %ebp
    17dd:	c3                   	ret    
    17de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    17e0:	83 ec 0c             	sub    $0xc,%esp
    17e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    17e8:	6a 00                	push   $0x0
    17ea:	8b 17                	mov    (%edi),%edx
    17ec:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    17ef:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    17f2:	e8 69 fe ff ff       	call   1660 <printint>
    17f7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17fa:	31 d2                	xor    %edx,%edx
    17fc:	e9 4e ff ff ff       	jmp    174f <printf+0x4f>
    1801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1808:	83 ec 04             	sub    $0x4,%esp
    180b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    180e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1811:	6a 01                	push   $0x1
    1813:	eb a8                	jmp    17bd <printf+0xbd>
    1815:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1818:	83 ec 0c             	sub    $0xc,%esp
    181b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1820:	6a 01                	push   $0x1
    1822:	eb c6                	jmp    17ea <printf+0xea>
    1824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1828:	8b 57 04             	mov    0x4(%edi),%edx
    182b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    182d:	85 d2                	test   %edx,%edx
    182f:	74 15                	je     1846 <printf+0x146>
    1831:	83 ec 0c             	sub    $0xc,%esp
    1834:	8b 45 08             	mov    0x8(%ebp),%eax
    1837:	b9 10 00 00 00       	mov    $0x10,%ecx
    183c:	6a 00                	push   $0x0
    183e:	e8 1d fe ff ff       	call   1660 <printint>
    1843:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1846:	83 ec 0c             	sub    $0xc,%esp
    1849:	8b 45 08             	mov    0x8(%ebp),%eax
    184c:	89 da                	mov    %ebx,%edx
    184e:	6a 00                	push   $0x0
    1850:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1855:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1858:	e8 03 fe ff ff       	call   1660 <printint>
    185d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1860:	31 d2                	xor    %edx,%edx
    1862:	e9 e8 fe ff ff       	jmp    174f <printf+0x4f>
    1867:	89 f6                	mov    %esi,%esi
    1869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1870:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1872:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1875:	85 c9                	test   %ecx,%ecx
    1877:	74 6a                	je     18e3 <printf+0x1e3>
        while(*s != 0){
    1879:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    187c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    187e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1880:	84 c0                	test   %al,%al
    1882:	0f 84 c7 fe ff ff    	je     174f <printf+0x4f>
    1888:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    188b:	89 de                	mov    %ebx,%esi
    188d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1890:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1893:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1896:	83 ec 04             	sub    $0x4,%esp
    1899:	6a 01                	push   $0x1
          s++;
    189b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    189e:	50                   	push   %eax
    189f:	53                   	push   %ebx
    18a0:	e8 fd fc ff ff       	call   15a2 <write>
        while(*s != 0){
    18a5:	0f b6 06             	movzbl (%esi),%eax
    18a8:	83 c4 10             	add    $0x10,%esp
    18ab:	84 c0                	test   %al,%al
    18ad:	75 e1                	jne    1890 <printf+0x190>
    18af:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    18b2:	31 d2                	xor    %edx,%edx
    18b4:	e9 96 fe ff ff       	jmp    174f <printf+0x4f>
    18b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    18c0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    18c2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    18c5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    18c8:	6a 01                	push   $0x1
        putc(fd, *ap);
    18ca:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    18cd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    18d0:	50                   	push   %eax
    18d1:	ff 75 08             	pushl  0x8(%ebp)
    18d4:	e8 c9 fc ff ff       	call   15a2 <write>
    18d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    18dc:	31 d2                	xor    %edx,%edx
    18de:	e9 6c fe ff ff       	jmp    174f <printf+0x4f>
          s = "(null)";
    18e3:	bb c2 1a 00 00       	mov    $0x1ac2,%ebx
        while(*s != 0){
    18e8:	b8 28 00 00 00       	mov    $0x28,%eax
    18ed:	eb 99                	jmp    1888 <printf+0x188>
    18ef:	90                   	nop

000018f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    18f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18f1:	a1 fc 1d 00 00       	mov    0x1dfc,%eax
{
    18f6:	89 e5                	mov    %esp,%ebp
    18f8:	57                   	push   %edi
    18f9:	56                   	push   %esi
    18fa:	53                   	push   %ebx
    18fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    18fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1908:	39 c8                	cmp    %ecx,%eax
    190a:	8b 10                	mov    (%eax),%edx
    190c:	73 32                	jae    1940 <free+0x50>
    190e:	39 d1                	cmp    %edx,%ecx
    1910:	72 04                	jb     1916 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1912:	39 d0                	cmp    %edx,%eax
    1914:	72 32                	jb     1948 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1916:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1919:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    191c:	39 fa                	cmp    %edi,%edx
    191e:	74 30                	je     1950 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1920:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1923:	8b 50 04             	mov    0x4(%eax),%edx
    1926:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1929:	39 f1                	cmp    %esi,%ecx
    192b:	74 3a                	je     1967 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    192d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    192f:	a3 fc 1d 00 00       	mov    %eax,0x1dfc
}
    1934:	5b                   	pop    %ebx
    1935:	5e                   	pop    %esi
    1936:	5f                   	pop    %edi
    1937:	5d                   	pop    %ebp
    1938:	c3                   	ret    
    1939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1940:	39 d0                	cmp    %edx,%eax
    1942:	72 04                	jb     1948 <free+0x58>
    1944:	39 d1                	cmp    %edx,%ecx
    1946:	72 ce                	jb     1916 <free+0x26>
{
    1948:	89 d0                	mov    %edx,%eax
    194a:	eb bc                	jmp    1908 <free+0x18>
    194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1950:	03 72 04             	add    0x4(%edx),%esi
    1953:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1956:	8b 10                	mov    (%eax),%edx
    1958:	8b 12                	mov    (%edx),%edx
    195a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    195d:	8b 50 04             	mov    0x4(%eax),%edx
    1960:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1963:	39 f1                	cmp    %esi,%ecx
    1965:	75 c6                	jne    192d <free+0x3d>
    p->s.size += bp->s.size;
    1967:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    196a:	a3 fc 1d 00 00       	mov    %eax,0x1dfc
    p->s.size += bp->s.size;
    196f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1972:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1975:	89 10                	mov    %edx,(%eax)
}
    1977:	5b                   	pop    %ebx
    1978:	5e                   	pop    %esi
    1979:	5f                   	pop    %edi
    197a:	5d                   	pop    %ebp
    197b:	c3                   	ret    
    197c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001980 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1980:	55                   	push   %ebp
    1981:	89 e5                	mov    %esp,%ebp
    1983:	57                   	push   %edi
    1984:	56                   	push   %esi
    1985:	53                   	push   %ebx
    1986:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1989:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    198c:	8b 15 fc 1d 00 00    	mov    0x1dfc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1992:	8d 78 07             	lea    0x7(%eax),%edi
    1995:	c1 ef 03             	shr    $0x3,%edi
    1998:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    199b:	85 d2                	test   %edx,%edx
    199d:	0f 84 9d 00 00 00    	je     1a40 <malloc+0xc0>
    19a3:	8b 02                	mov    (%edx),%eax
    19a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    19a8:	39 cf                	cmp    %ecx,%edi
    19aa:	76 6c                	jbe    1a18 <malloc+0x98>
    19ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    19b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    19b7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    19ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    19c1:	eb 0e                	jmp    19d1 <malloc+0x51>
    19c3:	90                   	nop
    19c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    19c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    19ca:	8b 48 04             	mov    0x4(%eax),%ecx
    19cd:	39 f9                	cmp    %edi,%ecx
    19cf:	73 47                	jae    1a18 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    19d1:	39 05 fc 1d 00 00    	cmp    %eax,0x1dfc
    19d7:	89 c2                	mov    %eax,%edx
    19d9:	75 ed                	jne    19c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    19db:	83 ec 0c             	sub    $0xc,%esp
    19de:	56                   	push   %esi
    19df:	e8 26 fc ff ff       	call   160a <sbrk>
  if(p == (char*)-1)
    19e4:	83 c4 10             	add    $0x10,%esp
    19e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    19ea:	74 1c                	je     1a08 <malloc+0x88>
  hp->s.size = nu;
    19ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    19ef:	83 ec 0c             	sub    $0xc,%esp
    19f2:	83 c0 08             	add    $0x8,%eax
    19f5:	50                   	push   %eax
    19f6:	e8 f5 fe ff ff       	call   18f0 <free>
  return freep;
    19fb:	8b 15 fc 1d 00 00    	mov    0x1dfc,%edx
      if((p = morecore(nunits)) == 0)
    1a01:	83 c4 10             	add    $0x10,%esp
    1a04:	85 d2                	test   %edx,%edx
    1a06:	75 c0                	jne    19c8 <malloc+0x48>
        return 0;
  }
}
    1a08:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1a0b:	31 c0                	xor    %eax,%eax
}
    1a0d:	5b                   	pop    %ebx
    1a0e:	5e                   	pop    %esi
    1a0f:	5f                   	pop    %edi
    1a10:	5d                   	pop    %ebp
    1a11:	c3                   	ret    
    1a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1a18:	39 cf                	cmp    %ecx,%edi
    1a1a:	74 54                	je     1a70 <malloc+0xf0>
        p->s.size -= nunits;
    1a1c:	29 f9                	sub    %edi,%ecx
    1a1e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1a21:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1a24:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1a27:	89 15 fc 1d 00 00    	mov    %edx,0x1dfc
}
    1a2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1a30:	83 c0 08             	add    $0x8,%eax
}
    1a33:	5b                   	pop    %ebx
    1a34:	5e                   	pop    %esi
    1a35:	5f                   	pop    %edi
    1a36:	5d                   	pop    %ebp
    1a37:	c3                   	ret    
    1a38:	90                   	nop
    1a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1a40:	c7 05 fc 1d 00 00 00 	movl   $0x1e00,0x1dfc
    1a47:	1e 00 00 
    1a4a:	c7 05 00 1e 00 00 00 	movl   $0x1e00,0x1e00
    1a51:	1e 00 00 
    base.s.size = 0;
    1a54:	b8 00 1e 00 00       	mov    $0x1e00,%eax
    1a59:	c7 05 04 1e 00 00 00 	movl   $0x0,0x1e04
    1a60:	00 00 00 
    1a63:	e9 44 ff ff ff       	jmp    19ac <malloc+0x2c>
    1a68:	90                   	nop
    1a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1a70:	8b 08                	mov    (%eax),%ecx
    1a72:	89 0a                	mov    %ecx,(%edx)
    1a74:	eb b1                	jmp    1a27 <malloc+0xa7>
