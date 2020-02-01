
_kill:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
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
    101b:	7e 2c                	jle    1049 <main+0x49>
    101d:	8d 5a 04             	lea    0x4(%edx),%ebx
    1020:	8d 34 82             	lea    (%edx,%eax,4),%esi
    1023:	90                   	nop
    1024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	ff 33                	pushl  (%ebx)
    102d:	83 c3 04             	add    $0x4,%ebx
    1030:	e8 0b 02 00 00       	call   1240 <atoi>
    1035:	89 04 24             	mov    %eax,(%esp)
    1038:	e8 7c 04 00 00       	call   14b9 <kill>
  for(i=1; i<argc; i++)
    103d:	83 c4 10             	add    $0x10,%esp
    1040:	39 f3                	cmp    %esi,%ebx
    1042:	75 e4                	jne    1028 <main+0x28>
  exit();
    1044:	e8 40 04 00 00       	call   1489 <exit>
    printf(2, "usage: kill pid...\n");
    1049:	50                   	push   %eax
    104a:	50                   	push   %eax
    104b:	68 00 18 00 00       	push   $0x1800
    1050:	6a 02                	push   $0x2
    1052:	e8 b9 05 00 00       	call   1610 <printf>
    exit();
    1057:	e8 2d 04 00 00       	call   1489 <exit>
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <strcpy>:
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	53                   	push   %ebx
    1064:	8b 45 08             	mov    0x8(%ebp),%eax
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    106a:	89 c2                	mov    %eax,%edx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1070:	83 c1 01             	add    $0x1,%ecx
    1073:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1077:	83 c2 01             	add    $0x1,%edx
    107a:	84 db                	test   %bl,%bl
    107c:	88 5a ff             	mov    %bl,-0x1(%edx)
    107f:	75 ef                	jne    1070 <strcpy+0x10>
    1081:	5b                   	pop    %ebx
    1082:	5d                   	pop    %ebp
    1083:	c3                   	ret    
    1084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    108a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001090 <strcmp>:
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	8b 55 08             	mov    0x8(%ebp),%edx
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    109a:	0f b6 02             	movzbl (%edx),%eax
    109d:	0f b6 19             	movzbl (%ecx),%ebx
    10a0:	84 c0                	test   %al,%al
    10a2:	75 1c                	jne    10c0 <strcmp+0x30>
    10a4:	eb 2a                	jmp    10d0 <strcmp+0x40>
    10a6:	8d 76 00             	lea    0x0(%esi),%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    10b0:	83 c2 01             	add    $0x1,%edx
    10b3:	0f b6 02             	movzbl (%edx),%eax
    10b6:	83 c1 01             	add    $0x1,%ecx
    10b9:	0f b6 19             	movzbl (%ecx),%ebx
    10bc:	84 c0                	test   %al,%al
    10be:	74 10                	je     10d0 <strcmp+0x40>
    10c0:	38 d8                	cmp    %bl,%al
    10c2:	74 ec                	je     10b0 <strcmp+0x20>
    10c4:	29 d8                	sub    %ebx,%eax
    10c6:	5b                   	pop    %ebx
    10c7:	5d                   	pop    %ebp
    10c8:	c3                   	ret    
    10c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d0:	31 c0                	xor    %eax,%eax
    10d2:	29 d8                	sub    %ebx,%eax
    10d4:	5b                   	pop    %ebx
    10d5:	5d                   	pop    %ebp
    10d6:	c3                   	ret    
    10d7:	89 f6                	mov    %esi,%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010e0 <strlen>:
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10e6:	80 39 00             	cmpb   $0x0,(%ecx)
    10e9:	74 15                	je     1100 <strlen+0x20>
    10eb:	31 d2                	xor    %edx,%edx
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
    10f0:	83 c2 01             	add    $0x1,%edx
    10f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10f7:	89 d0                	mov    %edx,%eax
    10f9:	75 f5                	jne    10f0 <strlen+0x10>
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
    1100:	31 c0                	xor    %eax,%eax
    1102:	5d                   	pop    %ebp
    1103:	c3                   	ret    
    1104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    110a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001110 <memset>:
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	8b 55 08             	mov    0x8(%ebp),%edx
    1117:	8b 4d 10             	mov    0x10(%ebp),%ecx
    111a:	8b 45 0c             	mov    0xc(%ebp),%eax
    111d:	89 d7                	mov    %edx,%edi
    111f:	fc                   	cld    
    1120:	f3 aa                	rep stos %al,%es:(%edi)
    1122:	89 d0                	mov    %edx,%eax
    1124:	5f                   	pop    %edi
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <strchr>:
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
    1134:	8b 45 08             	mov    0x8(%ebp),%eax
    1137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    113a:	0f b6 10             	movzbl (%eax),%edx
    113d:	84 d2                	test   %dl,%dl
    113f:	74 1d                	je     115e <strchr+0x2e>
    1141:	38 d3                	cmp    %dl,%bl
    1143:	89 d9                	mov    %ebx,%ecx
    1145:	75 0d                	jne    1154 <strchr+0x24>
    1147:	eb 17                	jmp    1160 <strchr+0x30>
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1150:	38 ca                	cmp    %cl,%dl
    1152:	74 0c                	je     1160 <strchr+0x30>
    1154:	83 c0 01             	add    $0x1,%eax
    1157:	0f b6 10             	movzbl (%eax),%edx
    115a:	84 d2                	test   %dl,%dl
    115c:	75 f2                	jne    1150 <strchr+0x20>
    115e:	31 c0                	xor    %eax,%eax
    1160:	5b                   	pop    %ebx
    1161:	5d                   	pop    %ebp
    1162:	c3                   	ret    
    1163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <gets>:
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	57                   	push   %edi
    1174:	56                   	push   %esi
    1175:	53                   	push   %ebx
    1176:	31 f6                	xor    %esi,%esi
    1178:	89 f3                	mov    %esi,%ebx
    117a:	83 ec 1c             	sub    $0x1c,%esp
    117d:	8b 7d 08             	mov    0x8(%ebp),%edi
    1180:	eb 2f                	jmp    11b1 <gets+0x41>
    1182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1188:	8d 45 e7             	lea    -0x19(%ebp),%eax
    118b:	83 ec 04             	sub    $0x4,%esp
    118e:	6a 01                	push   $0x1
    1190:	50                   	push   %eax
    1191:	6a 00                	push   $0x0
    1193:	e8 09 03 00 00       	call   14a1 <read>
    1198:	83 c4 10             	add    $0x10,%esp
    119b:	85 c0                	test   %eax,%eax
    119d:	7e 1c                	jle    11bb <gets+0x4b>
    119f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11a3:	83 c7 01             	add    $0x1,%edi
    11a6:	88 47 ff             	mov    %al,-0x1(%edi)
    11a9:	3c 0a                	cmp    $0xa,%al
    11ab:	74 23                	je     11d0 <gets+0x60>
    11ad:	3c 0d                	cmp    $0xd,%al
    11af:	74 1f                	je     11d0 <gets+0x60>
    11b1:	83 c3 01             	add    $0x1,%ebx
    11b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11b7:	89 fe                	mov    %edi,%esi
    11b9:	7c cd                	jl     1188 <gets+0x18>
    11bb:	89 f3                	mov    %esi,%ebx
    11bd:	8b 45 08             	mov    0x8(%ebp),%eax
    11c0:	c6 03 00             	movb   $0x0,(%ebx)
    11c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11c6:	5b                   	pop    %ebx
    11c7:	5e                   	pop    %esi
    11c8:	5f                   	pop    %edi
    11c9:	5d                   	pop    %ebp
    11ca:	c3                   	ret    
    11cb:	90                   	nop
    11cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11d0:	8b 75 08             	mov    0x8(%ebp),%esi
    11d3:	8b 45 08             	mov    0x8(%ebp),%eax
    11d6:	01 de                	add    %ebx,%esi
    11d8:	89 f3                	mov    %esi,%ebx
    11da:	c6 03 00             	movb   $0x0,(%ebx)
    11dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11e0:	5b                   	pop    %ebx
    11e1:	5e                   	pop    %esi
    11e2:	5f                   	pop    %edi
    11e3:	5d                   	pop    %ebp
    11e4:	c3                   	ret    
    11e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011f0 <stat>:
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	56                   	push   %esi
    11f4:	53                   	push   %ebx
    11f5:	83 ec 08             	sub    $0x8,%esp
    11f8:	6a 00                	push   $0x0
    11fa:	ff 75 08             	pushl  0x8(%ebp)
    11fd:	e8 c7 02 00 00       	call   14c9 <open>
    1202:	83 c4 10             	add    $0x10,%esp
    1205:	85 c0                	test   %eax,%eax
    1207:	78 27                	js     1230 <stat+0x40>
    1209:	83 ec 08             	sub    $0x8,%esp
    120c:	ff 75 0c             	pushl  0xc(%ebp)
    120f:	89 c3                	mov    %eax,%ebx
    1211:	50                   	push   %eax
    1212:	e8 ca 02 00 00       	call   14e1 <fstat>
    1217:	89 1c 24             	mov    %ebx,(%esp)
    121a:	89 c6                	mov    %eax,%esi
    121c:	e8 90 02 00 00       	call   14b1 <close>
    1221:	83 c4 10             	add    $0x10,%esp
    1224:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1227:	89 f0                	mov    %esi,%eax
    1229:	5b                   	pop    %ebx
    122a:	5e                   	pop    %esi
    122b:	5d                   	pop    %ebp
    122c:	c3                   	ret    
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    1230:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1235:	eb ed                	jmp    1224 <stat+0x34>
    1237:	89 f6                	mov    %esi,%esi
    1239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001240 <atoi>:
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1247:	0f be 11             	movsbl (%ecx),%edx
    124a:	8d 42 d0             	lea    -0x30(%edx),%eax
    124d:	3c 09                	cmp    $0x9,%al
    124f:	b8 00 00 00 00       	mov    $0x0,%eax
    1254:	77 1f                	ja     1275 <atoi+0x35>
    1256:	8d 76 00             	lea    0x0(%esi),%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1260:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1263:	83 c1 01             	add    $0x1,%ecx
    1266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
    126a:	0f be 11             	movsbl (%ecx),%edx
    126d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1270:	80 fb 09             	cmp    $0x9,%bl
    1273:	76 eb                	jbe    1260 <atoi+0x20>
    1275:	5b                   	pop    %ebx
    1276:	5d                   	pop    %ebp
    1277:	c3                   	ret    
    1278:	90                   	nop
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001280 <memmove>:
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
    1285:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1288:	8b 45 08             	mov    0x8(%ebp),%eax
    128b:	8b 75 0c             	mov    0xc(%ebp),%esi
    128e:	85 db                	test   %ebx,%ebx
    1290:	7e 14                	jle    12a6 <memmove+0x26>
    1292:	31 d2                	xor    %edx,%edx
    1294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    129c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    129f:	83 c2 01             	add    $0x1,%edx
    12a2:	39 d3                	cmp    %edx,%ebx
    12a4:	75 f2                	jne    1298 <memmove+0x18>
    12a6:	5b                   	pop    %ebx
    12a7:	5e                   	pop    %esi
    12a8:	5d                   	pop    %ebp
    12a9:	c3                   	ret    
    12aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012b0 <thread_join>:
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	83 ec 24             	sub    $0x24,%esp
    12b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    12b9:	50                   	push   %eax
    12ba:	e8 a2 02 00 00       	call   1561 <join>
    12bf:	c9                   	leave  
    12c0:	c3                   	ret    
    12c1:	eb 0d                	jmp    12d0 <free>
    12c3:	90                   	nop
    12c4:	90                   	nop
    12c5:	90                   	nop
    12c6:	90                   	nop
    12c7:	90                   	nop
    12c8:	90                   	nop
    12c9:	90                   	nop
    12ca:	90                   	nop
    12cb:	90                   	nop
    12cc:	90                   	nop
    12cd:	90                   	nop
    12ce:	90                   	nop
    12cf:	90                   	nop

000012d0 <free>:
    12d0:	55                   	push   %ebp
    12d1:	a1 08 1b 00 00       	mov    0x1b08,%eax
    12d6:	89 e5                	mov    %esp,%ebp
    12d8:	57                   	push   %edi
    12d9:	56                   	push   %esi
    12da:	53                   	push   %ebx
    12db:	8b 5d 08             	mov    0x8(%ebp),%ebx
    12de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12e8:	39 c8                	cmp    %ecx,%eax
    12ea:	8b 10                	mov    (%eax),%edx
    12ec:	73 32                	jae    1320 <free+0x50>
    12ee:	39 d1                	cmp    %edx,%ecx
    12f0:	72 04                	jb     12f6 <free+0x26>
    12f2:	39 d0                	cmp    %edx,%eax
    12f4:	72 32                	jb     1328 <free+0x58>
    12f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12fc:	39 fa                	cmp    %edi,%edx
    12fe:	74 30                	je     1330 <free+0x60>
    1300:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1303:	8b 50 04             	mov    0x4(%eax),%edx
    1306:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1309:	39 f1                	cmp    %esi,%ecx
    130b:	74 3a                	je     1347 <free+0x77>
    130d:	89 08                	mov    %ecx,(%eax)
    130f:	a3 08 1b 00 00       	mov    %eax,0x1b08
    1314:	5b                   	pop    %ebx
    1315:	5e                   	pop    %esi
    1316:	5f                   	pop    %edi
    1317:	5d                   	pop    %ebp
    1318:	c3                   	ret    
    1319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1320:	39 d0                	cmp    %edx,%eax
    1322:	72 04                	jb     1328 <free+0x58>
    1324:	39 d1                	cmp    %edx,%ecx
    1326:	72 ce                	jb     12f6 <free+0x26>
    1328:	89 d0                	mov    %edx,%eax
    132a:	eb bc                	jmp    12e8 <free+0x18>
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1330:	03 72 04             	add    0x4(%edx),%esi
    1333:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1336:	8b 10                	mov    (%eax),%edx
    1338:	8b 12                	mov    (%edx),%edx
    133a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    133d:	8b 50 04             	mov    0x4(%eax),%edx
    1340:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1343:	39 f1                	cmp    %esi,%ecx
    1345:	75 c6                	jne    130d <free+0x3d>
    1347:	03 53 fc             	add    -0x4(%ebx),%edx
    134a:	a3 08 1b 00 00       	mov    %eax,0x1b08
    134f:	89 50 04             	mov    %edx,0x4(%eax)
    1352:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1355:	89 10                	mov    %edx,(%eax)
    1357:	5b                   	pop    %ebx
    1358:	5e                   	pop    %esi
    1359:	5f                   	pop    %edi
    135a:	5d                   	pop    %ebp
    135b:	c3                   	ret    
    135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001360 <malloc>:
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	57                   	push   %edi
    1364:	56                   	push   %esi
    1365:	53                   	push   %ebx
    1366:	83 ec 0c             	sub    $0xc,%esp
    1369:	8b 45 08             	mov    0x8(%ebp),%eax
    136c:	8b 15 08 1b 00 00    	mov    0x1b08,%edx
    1372:	8d 78 07             	lea    0x7(%eax),%edi
    1375:	c1 ef 03             	shr    $0x3,%edi
    1378:	83 c7 01             	add    $0x1,%edi
    137b:	85 d2                	test   %edx,%edx
    137d:	0f 84 9d 00 00 00    	je     1420 <malloc+0xc0>
    1383:	8b 02                	mov    (%edx),%eax
    1385:	8b 48 04             	mov    0x4(%eax),%ecx
    1388:	39 cf                	cmp    %ecx,%edi
    138a:	76 6c                	jbe    13f8 <malloc+0x98>
    138c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1392:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1397:	0f 43 df             	cmovae %edi,%ebx
    139a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13a1:	eb 0e                	jmp    13b1 <malloc+0x51>
    13a3:	90                   	nop
    13a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13a8:	8b 02                	mov    (%edx),%eax
    13aa:	8b 48 04             	mov    0x4(%eax),%ecx
    13ad:	39 f9                	cmp    %edi,%ecx
    13af:	73 47                	jae    13f8 <malloc+0x98>
    13b1:	39 05 08 1b 00 00    	cmp    %eax,0x1b08
    13b7:	89 c2                	mov    %eax,%edx
    13b9:	75 ed                	jne    13a8 <malloc+0x48>
    13bb:	83 ec 0c             	sub    $0xc,%esp
    13be:	56                   	push   %esi
    13bf:	e8 4d 01 00 00       	call   1511 <sbrk>
    13c4:	83 c4 10             	add    $0x10,%esp
    13c7:	83 f8 ff             	cmp    $0xffffffff,%eax
    13ca:	74 1c                	je     13e8 <malloc+0x88>
    13cc:	89 58 04             	mov    %ebx,0x4(%eax)
    13cf:	83 ec 0c             	sub    $0xc,%esp
    13d2:	83 c0 08             	add    $0x8,%eax
    13d5:	50                   	push   %eax
    13d6:	e8 f5 fe ff ff       	call   12d0 <free>
    13db:	8b 15 08 1b 00 00    	mov    0x1b08,%edx
    13e1:	83 c4 10             	add    $0x10,%esp
    13e4:	85 d2                	test   %edx,%edx
    13e6:	75 c0                	jne    13a8 <malloc+0x48>
    13e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13eb:	31 c0                	xor    %eax,%eax
    13ed:	5b                   	pop    %ebx
    13ee:	5e                   	pop    %esi
    13ef:	5f                   	pop    %edi
    13f0:	5d                   	pop    %ebp
    13f1:	c3                   	ret    
    13f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13f8:	39 cf                	cmp    %ecx,%edi
    13fa:	74 54                	je     1450 <malloc+0xf0>
    13fc:	29 f9                	sub    %edi,%ecx
    13fe:	89 48 04             	mov    %ecx,0x4(%eax)
    1401:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1404:	89 78 04             	mov    %edi,0x4(%eax)
    1407:	89 15 08 1b 00 00    	mov    %edx,0x1b08
    140d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1410:	83 c0 08             	add    $0x8,%eax
    1413:	5b                   	pop    %ebx
    1414:	5e                   	pop    %esi
    1415:	5f                   	pop    %edi
    1416:	5d                   	pop    %ebp
    1417:	c3                   	ret    
    1418:	90                   	nop
    1419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1420:	c7 05 08 1b 00 00 0c 	movl   $0x1b0c,0x1b08
    1427:	1b 00 00 
    142a:	c7 05 0c 1b 00 00 0c 	movl   $0x1b0c,0x1b0c
    1431:	1b 00 00 
    1434:	b8 0c 1b 00 00       	mov    $0x1b0c,%eax
    1439:	c7 05 10 1b 00 00 00 	movl   $0x0,0x1b10
    1440:	00 00 00 
    1443:	e9 44 ff ff ff       	jmp    138c <malloc+0x2c>
    1448:	90                   	nop
    1449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1450:	8b 08                	mov    (%eax),%ecx
    1452:	89 0a                	mov    %ecx,(%edx)
    1454:	eb b1                	jmp    1407 <malloc+0xa7>
    1456:	8d 76 00             	lea    0x0(%esi),%esi
    1459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001460 <thread_create>:
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	83 ec 14             	sub    $0x14,%esp
    1466:	68 00 10 00 00       	push   $0x1000
    146b:	e8 f0 fe ff ff       	call   1360 <malloc>
    1470:	83 c4 0c             	add    $0xc,%esp
    1473:	50                   	push   %eax
    1474:	ff 75 0c             	pushl  0xc(%ebp)
    1477:	ff 75 08             	pushl  0x8(%ebp)
    147a:	e8 da 00 00 00       	call   1559 <clone>
    147f:	c9                   	leave  
    1480:	c3                   	ret    

00001481 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1481:	b8 01 00 00 00       	mov    $0x1,%eax
    1486:	cd 40                	int    $0x40
    1488:	c3                   	ret    

00001489 <exit>:
SYSCALL(exit)
    1489:	b8 02 00 00 00       	mov    $0x2,%eax
    148e:	cd 40                	int    $0x40
    1490:	c3                   	ret    

00001491 <wait>:
SYSCALL(wait)
    1491:	b8 03 00 00 00       	mov    $0x3,%eax
    1496:	cd 40                	int    $0x40
    1498:	c3                   	ret    

00001499 <pipe>:
SYSCALL(pipe)
    1499:	b8 04 00 00 00       	mov    $0x4,%eax
    149e:	cd 40                	int    $0x40
    14a0:	c3                   	ret    

000014a1 <read>:
SYSCALL(read)
    14a1:	b8 05 00 00 00       	mov    $0x5,%eax
    14a6:	cd 40                	int    $0x40
    14a8:	c3                   	ret    

000014a9 <write>:
SYSCALL(write)
    14a9:	b8 10 00 00 00       	mov    $0x10,%eax
    14ae:	cd 40                	int    $0x40
    14b0:	c3                   	ret    

000014b1 <close>:
SYSCALL(close)
    14b1:	b8 15 00 00 00       	mov    $0x15,%eax
    14b6:	cd 40                	int    $0x40
    14b8:	c3                   	ret    

000014b9 <kill>:
SYSCALL(kill)
    14b9:	b8 06 00 00 00       	mov    $0x6,%eax
    14be:	cd 40                	int    $0x40
    14c0:	c3                   	ret    

000014c1 <exec>:
SYSCALL(exec)
    14c1:	b8 07 00 00 00       	mov    $0x7,%eax
    14c6:	cd 40                	int    $0x40
    14c8:	c3                   	ret    

000014c9 <open>:
SYSCALL(open)
    14c9:	b8 0f 00 00 00       	mov    $0xf,%eax
    14ce:	cd 40                	int    $0x40
    14d0:	c3                   	ret    

000014d1 <mknod>:
SYSCALL(mknod)
    14d1:	b8 11 00 00 00       	mov    $0x11,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <unlink>:
SYSCALL(unlink)
    14d9:	b8 12 00 00 00       	mov    $0x12,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <fstat>:
SYSCALL(fstat)
    14e1:	b8 08 00 00 00       	mov    $0x8,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <link>:
SYSCALL(link)
    14e9:	b8 13 00 00 00       	mov    $0x13,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <mkdir>:
SYSCALL(mkdir)
    14f1:	b8 14 00 00 00       	mov    $0x14,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <chdir>:
SYSCALL(chdir)
    14f9:	b8 09 00 00 00       	mov    $0x9,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <dup>:
SYSCALL(dup)
    1501:	b8 0a 00 00 00       	mov    $0xa,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <getpid>:
SYSCALL(getpid)
    1509:	b8 0b 00 00 00       	mov    $0xb,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    

00001511 <sbrk>:
SYSCALL(sbrk)
    1511:	b8 0c 00 00 00       	mov    $0xc,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <sleep>:
SYSCALL(sleep)
    1519:	b8 0d 00 00 00       	mov    $0xd,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <uptime>:
SYSCALL(uptime)
    1521:	b8 0e 00 00 00       	mov    $0xe,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <getreadcount>:
SYSCALL(getreadcount)
    1529:	b8 16 00 00 00       	mov    $0x16,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <gettime>:
SYSCALL(gettime)
    1531:	b8 17 00 00 00       	mov    $0x17,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <settickets>:
SYSCALL(settickets)
    1539:	b8 18 00 00 00       	mov    $0x18,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <getpinfo>:
SYSCALL(getpinfo)
    1541:	b8 19 00 00 00       	mov    $0x19,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <mprotect>:
SYSCALL(mprotect)
    1549:	b8 1a 00 00 00       	mov    $0x1a,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    

00001551 <munprotect>:
SYSCALL(munprotect)
    1551:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1556:	cd 40                	int    $0x40
    1558:	c3                   	ret    

00001559 <clone>:
SYSCALL(clone)
    1559:	b8 1c 00 00 00       	mov    $0x1c,%eax
    155e:	cd 40                	int    $0x40
    1560:	c3                   	ret    

00001561 <join>:
    1561:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1566:	cd 40                	int    $0x40
    1568:	c3                   	ret    
    1569:	66 90                	xchg   %ax,%ax
    156b:	66 90                	xchg   %ax,%ax
    156d:	66 90                	xchg   %ax,%ax
    156f:	90                   	nop

00001570 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1570:	55                   	push   %ebp
    1571:	89 e5                	mov    %esp,%ebp
    1573:	57                   	push   %edi
    1574:	56                   	push   %esi
    1575:	53                   	push   %ebx
    1576:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1579:	85 d2                	test   %edx,%edx
{
    157b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    157e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1580:	79 76                	jns    15f8 <printint+0x88>
    1582:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1586:	74 70                	je     15f8 <printint+0x88>
    x = -xx;
    1588:	f7 d8                	neg    %eax
    neg = 1;
    158a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1591:	31 f6                	xor    %esi,%esi
    1593:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1596:	eb 0a                	jmp    15a2 <printint+0x32>
    1598:	90                   	nop
    1599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    15a0:	89 fe                	mov    %edi,%esi
    15a2:	31 d2                	xor    %edx,%edx
    15a4:	8d 7e 01             	lea    0x1(%esi),%edi
    15a7:	f7 f1                	div    %ecx
    15a9:	0f b6 92 1c 18 00 00 	movzbl 0x181c(%edx),%edx
  }while((x /= base) != 0);
    15b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    15b2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    15b5:	75 e9                	jne    15a0 <printint+0x30>
  if(neg)
    15b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    15ba:	85 c0                	test   %eax,%eax
    15bc:	74 08                	je     15c6 <printint+0x56>
    buf[i++] = '-';
    15be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    15c3:	8d 7e 02             	lea    0x2(%esi),%edi
    15c6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    15ca:	8b 7d c0             	mov    -0x40(%ebp),%edi
    15cd:	8d 76 00             	lea    0x0(%esi),%esi
    15d0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    15d3:	83 ec 04             	sub    $0x4,%esp
    15d6:	83 ee 01             	sub    $0x1,%esi
    15d9:	6a 01                	push   $0x1
    15db:	53                   	push   %ebx
    15dc:	57                   	push   %edi
    15dd:	88 45 d7             	mov    %al,-0x29(%ebp)
    15e0:	e8 c4 fe ff ff       	call   14a9 <write>

  while(--i >= 0)
    15e5:	83 c4 10             	add    $0x10,%esp
    15e8:	39 de                	cmp    %ebx,%esi
    15ea:	75 e4                	jne    15d0 <printint+0x60>
    putc(fd, buf[i]);
}
    15ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15ef:	5b                   	pop    %ebx
    15f0:	5e                   	pop    %esi
    15f1:	5f                   	pop    %edi
    15f2:	5d                   	pop    %ebp
    15f3:	c3                   	ret    
    15f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    15f8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    15ff:	eb 90                	jmp    1591 <printint+0x21>
    1601:	eb 0d                	jmp    1610 <printf>
    1603:	90                   	nop
    1604:	90                   	nop
    1605:	90                   	nop
    1606:	90                   	nop
    1607:	90                   	nop
    1608:	90                   	nop
    1609:	90                   	nop
    160a:	90                   	nop
    160b:	90                   	nop
    160c:	90                   	nop
    160d:	90                   	nop
    160e:	90                   	nop
    160f:	90                   	nop

00001610 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1610:	55                   	push   %ebp
    1611:	89 e5                	mov    %esp,%ebp
    1613:	57                   	push   %edi
    1614:	56                   	push   %esi
    1615:	53                   	push   %ebx
    1616:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1619:	8b 75 0c             	mov    0xc(%ebp),%esi
    161c:	0f b6 1e             	movzbl (%esi),%ebx
    161f:	84 db                	test   %bl,%bl
    1621:	0f 84 bf 00 00 00    	je     16e6 <printf+0xd6>
    1627:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    162a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    162d:	31 d2                	xor    %edx,%edx
    162f:	eb 39                	jmp    166a <printf+0x5a>
    1631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1638:	83 f8 25             	cmp    $0x25,%eax
    163b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    163e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1643:	74 1a                	je     165f <printf+0x4f>
  write(fd, &c, 1);
    1645:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1648:	83 ec 04             	sub    $0x4,%esp
    164b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    164e:	6a 01                	push   $0x1
    1650:	50                   	push   %eax
    1651:	ff 75 08             	pushl  0x8(%ebp)
    1654:	e8 50 fe ff ff       	call   14a9 <write>
    1659:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    165c:	83 c4 10             	add    $0x10,%esp
    165f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1662:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1666:	84 db                	test   %bl,%bl
    1668:	74 7c                	je     16e6 <printf+0xd6>
    if(state == 0){
    166a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    166c:	0f be cb             	movsbl %bl,%ecx
    166f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1672:	74 c4                	je     1638 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1674:	83 fa 25             	cmp    $0x25,%edx
    1677:	75 e6                	jne    165f <printf+0x4f>
      if(c == 'd'){
    1679:	83 f8 64             	cmp    $0x64,%eax
    167c:	0f 84 a6 00 00 00    	je     1728 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    1682:	83 f8 6c             	cmp    $0x6c,%eax
    1685:	0f 84 ad 00 00 00    	je     1738 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    168b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1691:	83 f9 70             	cmp    $0x70,%ecx
    1694:	74 5a                	je     16f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1696:	83 f8 73             	cmp    $0x73,%eax
    1699:	0f 84 e1 00 00 00    	je     1780 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    169f:	83 f8 63             	cmp    $0x63,%eax
    16a2:	0f 84 28 01 00 00    	je     17d0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    16a8:	83 f8 25             	cmp    $0x25,%eax
    16ab:	74 6b                	je     1718 <printf+0x108>
  write(fd, &c, 1);
    16ad:	8d 45 e7             	lea    -0x19(%ebp),%eax
    16b0:	83 ec 04             	sub    $0x4,%esp
    16b3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16b7:	6a 01                	push   $0x1
    16b9:	50                   	push   %eax
    16ba:	ff 75 08             	pushl  0x8(%ebp)
    16bd:	e8 e7 fd ff ff       	call   14a9 <write>
    16c2:	83 c4 0c             	add    $0xc,%esp
    16c5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    16c8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    16cb:	6a 01                	push   $0x1
    16cd:	50                   	push   %eax
    16ce:	ff 75 08             	pushl  0x8(%ebp)
    16d1:	83 c6 01             	add    $0x1,%esi
    16d4:	e8 d0 fd ff ff       	call   14a9 <write>
  for(i = 0; fmt[i]; i++){
    16d9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    16dd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    16e0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    16e2:	84 db                	test   %bl,%bl
    16e4:	75 84                	jne    166a <printf+0x5a>
    }
  }
}
    16e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16e9:	5b                   	pop    %ebx
    16ea:	5e                   	pop    %esi
    16eb:	5f                   	pop    %edi
    16ec:	5d                   	pop    %ebp
    16ed:	c3                   	ret    
    16ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    16f0:	83 ec 0c             	sub    $0xc,%esp
    16f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    16f8:	6a 00                	push   $0x0
    16fa:	8b 17                	mov    (%edi),%edx
    16fc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    16ff:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1702:	e8 69 fe ff ff       	call   1570 <printint>
    1707:	83 c4 10             	add    $0x10,%esp
      state = 0;
    170a:	31 d2                	xor    %edx,%edx
    170c:	e9 4e ff ff ff       	jmp    165f <printf+0x4f>
    1711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1718:	83 ec 04             	sub    $0x4,%esp
    171b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    171e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1721:	6a 01                	push   $0x1
    1723:	eb a8                	jmp    16cd <printf+0xbd>
    1725:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1728:	83 ec 0c             	sub    $0xc,%esp
    172b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1730:	6a 01                	push   $0x1
    1732:	eb c6                	jmp    16fa <printf+0xea>
    1734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1738:	8b 57 04             	mov    0x4(%edi),%edx
    173b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    173d:	85 d2                	test   %edx,%edx
    173f:	74 15                	je     1756 <printf+0x146>
    1741:	83 ec 0c             	sub    $0xc,%esp
    1744:	8b 45 08             	mov    0x8(%ebp),%eax
    1747:	b9 10 00 00 00       	mov    $0x10,%ecx
    174c:	6a 00                	push   $0x0
    174e:	e8 1d fe ff ff       	call   1570 <printint>
    1753:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1756:	83 ec 0c             	sub    $0xc,%esp
    1759:	8b 45 08             	mov    0x8(%ebp),%eax
    175c:	89 da                	mov    %ebx,%edx
    175e:	6a 00                	push   $0x0
    1760:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1765:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1768:	e8 03 fe ff ff       	call   1570 <printint>
    176d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1770:	31 d2                	xor    %edx,%edx
    1772:	e9 e8 fe ff ff       	jmp    165f <printf+0x4f>
    1777:	89 f6                	mov    %esi,%esi
    1779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1780:	8b 0f                	mov    (%edi),%ecx
        ap++;
    1782:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1785:	85 c9                	test   %ecx,%ecx
    1787:	74 6a                	je     17f3 <printf+0x1e3>
        while(*s != 0){
    1789:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    178c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    178e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1790:	84 c0                	test   %al,%al
    1792:	0f 84 c7 fe ff ff    	je     165f <printf+0x4f>
    1798:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    179b:	89 de                	mov    %ebx,%esi
    179d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    17a0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    17a3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    17a6:	83 ec 04             	sub    $0x4,%esp
    17a9:	6a 01                	push   $0x1
          s++;
    17ab:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    17ae:	50                   	push   %eax
    17af:	53                   	push   %ebx
    17b0:	e8 f4 fc ff ff       	call   14a9 <write>
        while(*s != 0){
    17b5:	0f b6 06             	movzbl (%esi),%eax
    17b8:	83 c4 10             	add    $0x10,%esp
    17bb:	84 c0                	test   %al,%al
    17bd:	75 e1                	jne    17a0 <printf+0x190>
    17bf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    17c2:	31 d2                	xor    %edx,%edx
    17c4:	e9 96 fe ff ff       	jmp    165f <printf+0x4f>
    17c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    17d0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    17d2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    17d5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    17d8:	6a 01                	push   $0x1
        putc(fd, *ap);
    17da:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    17dd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    17e0:	50                   	push   %eax
    17e1:	ff 75 08             	pushl  0x8(%ebp)
    17e4:	e8 c0 fc ff ff       	call   14a9 <write>
    17e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17ec:	31 d2                	xor    %edx,%edx
    17ee:	e9 6c fe ff ff       	jmp    165f <printf+0x4f>
          s = "(null)";
    17f3:	bb 14 18 00 00       	mov    $0x1814,%ebx
        while(*s != 0){
    17f8:	b8 28 00 00 00       	mov    $0x28,%eax
    17fd:	eb 99                	jmp    1798 <printf+0x188>
