
_threadtest:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
    100f:	8d 5d f4             	lea    -0xc(%ebp),%ebx
    1012:	83 ec 18             	sub    $0x18,%esp
    1015:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
    101c:	68 52 19 00 00       	push   $0x1952
    1021:	6a 01                	push   $0x1
    1023:	e8 08 07 00 00       	call   1730 <printf>
    1028:	58                   	pop    %eax
    1029:	5a                   	pop    %edx
    102a:	53                   	push   %ebx
    102b:	68 10 11 00 00       	push   $0x1110
    1030:	e8 4b 05 00 00       	call   1580 <thread_create>
    1035:	e8 96 03 00 00       	call   13d0 <thread_join>
    103a:	59                   	pop    %ecx
    103b:	58                   	pop    %eax
    103c:	53                   	push   %ebx
    103d:	68 60 10 00 00       	push   $0x1060
    1042:	e8 39 05 00 00       	call   1580 <thread_create>
    1047:	e8 84 03 00 00       	call   13d0 <thread_join>
    104c:	58                   	pop    %eax
    104d:	5a                   	pop    %edx
    104e:	68 90 19 00 00       	push   $0x1990
    1053:	6a 01                	push   $0x1
    1055:	e8 d6 06 00 00       	call   1730 <printf>
    105a:	e8 4a 05 00 00       	call   15a9 <exit>
    105f:	90                   	nop

00001060 <Omar>:
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	83 ec 10             	sub    $0x10,%esp
    1066:	68 20 19 00 00       	push   $0x1920
    106b:	6a 01                	push   $0x1
    106d:	e8 be 06 00 00       	call   1730 <printf>
    1072:	e8 32 05 00 00       	call   15a9 <exit>
    1077:	89 f6                	mov    %esi,%esi
    1079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001080 <Hafez>:
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	83 ec 10             	sub    $0x10,%esp
    1086:	68 33 19 00 00       	push   $0x1933
    108b:	6a 01                	push   $0x1
    108d:	e8 9e 06 00 00       	call   1730 <printf>
    1092:	8b 45 08             	mov    0x8(%ebp),%eax
    1095:	83 c4 0c             	add    $0xc,%esp
    1098:	ff 30                	pushl  (%eax)
    109a:	68 4b 19 00 00       	push   $0x194b
    109f:	6a 01                	push   $0x1
    10a1:	e8 8a 06 00 00       	call   1730 <printf>
    10a6:	58                   	pop    %eax
    10a7:	5a                   	pop    %edx
    10a8:	6a 00                	push   $0x0
    10aa:	68 60 10 00 00       	push   $0x1060
    10af:	e8 cc 04 00 00       	call   1580 <thread_create>
    10b4:	e8 17 03 00 00       	call   13d0 <thread_join>
    10b9:	e8 eb 04 00 00       	call   15a9 <exit>
    10be:	66 90                	xchg   %ax,%ax

000010c0 <fib>:
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
    10c5:	53                   	push   %ebx
    10c6:	31 f6                	xor    %esi,%esi
    10c8:	83 ec 1c             	sub    $0x1c,%esp
    10cb:	8b 45 08             	mov    0x8(%ebp),%eax
    10ce:	83 f8 01             	cmp    $0x1,%eax
    10d1:	7e 2e                	jle    1101 <fib+0x41>
    10d3:	8d 50 fe             	lea    -0x2(%eax),%edx
    10d6:	8d 78 fd             	lea    -0x3(%eax),%edi
    10d9:	8d 58 ff             	lea    -0x1(%eax),%ebx
    10dc:	89 d0                	mov    %edx,%eax
    10de:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    10e1:	83 e0 fe             	and    $0xfffffffe,%eax
    10e4:	29 c7                	sub    %eax,%edi
    10e6:	83 ec 0c             	sub    $0xc,%esp
    10e9:	53                   	push   %ebx
    10ea:	83 eb 02             	sub    $0x2,%ebx
    10ed:	e8 ce ff ff ff       	call   10c0 <fib>
    10f2:	83 c4 10             	add    $0x10,%esp
    10f5:	01 c6                	add    %eax,%esi
    10f7:	39 fb                	cmp    %edi,%ebx
    10f9:	75 eb                	jne    10e6 <fib+0x26>
    10fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10fe:	83 e0 01             	and    $0x1,%eax
    1101:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1104:	01 f0                	add    %esi,%eax
    1106:	5b                   	pop    %ebx
    1107:	5e                   	pop    %esi
    1108:	5f                   	pop    %edi
    1109:	5d                   	pop    %ebp
    110a:	c3                   	ret    
    110b:	90                   	nop
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001110 <AdelShakal>:
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	53                   	push   %ebx
    1114:	31 db                	xor    %ebx,%ebx
    1116:	83 ec 1c             	sub    $0x1c,%esp
    1119:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
    1120:	68 70 19 00 00       	push   $0x1970
    1125:	6a 01                	push   $0x1
    1127:	e8 04 06 00 00       	call   1730 <printf>
    112c:	83 c4 10             	add    $0x10,%esp
    112f:	b9 1d 00 00 00       	mov    $0x1d,%ecx
    1134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1138:	83 ec 0c             	sub    $0xc,%esp
    113b:	51                   	push   %ecx
    113c:	e8 7f ff ff ff       	call   10c0 <fib>
    1141:	83 e9 02             	sub    $0x2,%ecx
    1144:	83 c4 10             	add    $0x10,%esp
    1147:	01 c3                	add    %eax,%ebx
    1149:	83 f9 ff             	cmp    $0xffffffff,%ecx
    114c:	75 ea                	jne    1138 <AdelShakal+0x28>
    114e:	83 ec 04             	sub    $0x4,%esp
    1151:	53                   	push   %ebx
    1152:	68 4e 19 00 00       	push   $0x194e
    1157:	6a 01                	push   $0x1
    1159:	e8 d2 05 00 00       	call   1730 <printf>
    115e:	58                   	pop    %eax
    115f:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1162:	5a                   	pop    %edx
    1163:	50                   	push   %eax
    1164:	68 80 10 00 00       	push   $0x1080
    1169:	e8 12 04 00 00       	call   1580 <thread_create>
    116e:	e8 5d 02 00 00       	call   13d0 <thread_join>
    1173:	e8 31 04 00 00       	call   15a9 <exit>
    1178:	66 90                	xchg   %ax,%ax
    117a:	66 90                	xchg   %ax,%ax
    117c:	66 90                	xchg   %ax,%ax
    117e:	66 90                	xchg   %ax,%ax

00001180 <strcpy>:
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	53                   	push   %ebx
    1184:	8b 45 08             	mov    0x8(%ebp),%eax
    1187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    118a:	89 c2                	mov    %eax,%edx
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1190:	83 c1 01             	add    $0x1,%ecx
    1193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1197:	83 c2 01             	add    $0x1,%edx
    119a:	84 db                	test   %bl,%bl
    119c:	88 5a ff             	mov    %bl,-0x1(%edx)
    119f:	75 ef                	jne    1190 <strcpy+0x10>
    11a1:	5b                   	pop    %ebx
    11a2:	5d                   	pop    %ebp
    11a3:	c3                   	ret    
    11a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011b0 <strcmp>:
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
    11b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    11ba:	0f b6 02             	movzbl (%edx),%eax
    11bd:	0f b6 19             	movzbl (%ecx),%ebx
    11c0:	84 c0                	test   %al,%al
    11c2:	75 1c                	jne    11e0 <strcmp+0x30>
    11c4:	eb 2a                	jmp    11f0 <strcmp+0x40>
    11c6:	8d 76 00             	lea    0x0(%esi),%esi
    11c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    11d0:	83 c2 01             	add    $0x1,%edx
    11d3:	0f b6 02             	movzbl (%edx),%eax
    11d6:	83 c1 01             	add    $0x1,%ecx
    11d9:	0f b6 19             	movzbl (%ecx),%ebx
    11dc:	84 c0                	test   %al,%al
    11de:	74 10                	je     11f0 <strcmp+0x40>
    11e0:	38 d8                	cmp    %bl,%al
    11e2:	74 ec                	je     11d0 <strcmp+0x20>
    11e4:	29 d8                	sub    %ebx,%eax
    11e6:	5b                   	pop    %ebx
    11e7:	5d                   	pop    %ebp
    11e8:	c3                   	ret    
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11f0:	31 c0                	xor    %eax,%eax
    11f2:	29 d8                	sub    %ebx,%eax
    11f4:	5b                   	pop    %ebx
    11f5:	5d                   	pop    %ebp
    11f6:	c3                   	ret    
    11f7:	89 f6                	mov    %esi,%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001200 <strlen>:
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1206:	80 39 00             	cmpb   $0x0,(%ecx)
    1209:	74 15                	je     1220 <strlen+0x20>
    120b:	31 d2                	xor    %edx,%edx
    120d:	8d 76 00             	lea    0x0(%esi),%esi
    1210:	83 c2 01             	add    $0x1,%edx
    1213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1217:	89 d0                	mov    %edx,%eax
    1219:	75 f5                	jne    1210 <strlen+0x10>
    121b:	5d                   	pop    %ebp
    121c:	c3                   	ret    
    121d:	8d 76 00             	lea    0x0(%esi),%esi
    1220:	31 c0                	xor    %eax,%eax
    1222:	5d                   	pop    %ebp
    1223:	c3                   	ret    
    1224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    122a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001230 <memset>:
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	8b 55 08             	mov    0x8(%ebp),%edx
    1237:	8b 4d 10             	mov    0x10(%ebp),%ecx
    123a:	8b 45 0c             	mov    0xc(%ebp),%eax
    123d:	89 d7                	mov    %edx,%edi
    123f:	fc                   	cld    
    1240:	f3 aa                	rep stos %al,%es:(%edi)
    1242:	89 d0                	mov    %edx,%eax
    1244:	5f                   	pop    %edi
    1245:	5d                   	pop    %ebp
    1246:	c3                   	ret    
    1247:	89 f6                	mov    %esi,%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <strchr>:
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	8b 45 08             	mov    0x8(%ebp),%eax
    1257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    125a:	0f b6 10             	movzbl (%eax),%edx
    125d:	84 d2                	test   %dl,%dl
    125f:	74 1d                	je     127e <strchr+0x2e>
    1261:	38 d3                	cmp    %dl,%bl
    1263:	89 d9                	mov    %ebx,%ecx
    1265:	75 0d                	jne    1274 <strchr+0x24>
    1267:	eb 17                	jmp    1280 <strchr+0x30>
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1270:	38 ca                	cmp    %cl,%dl
    1272:	74 0c                	je     1280 <strchr+0x30>
    1274:	83 c0 01             	add    $0x1,%eax
    1277:	0f b6 10             	movzbl (%eax),%edx
    127a:	84 d2                	test   %dl,%dl
    127c:	75 f2                	jne    1270 <strchr+0x20>
    127e:	31 c0                	xor    %eax,%eax
    1280:	5b                   	pop    %ebx
    1281:	5d                   	pop    %ebp
    1282:	c3                   	ret    
    1283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001290 <gets>:
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	57                   	push   %edi
    1294:	56                   	push   %esi
    1295:	53                   	push   %ebx
    1296:	31 f6                	xor    %esi,%esi
    1298:	89 f3                	mov    %esi,%ebx
    129a:	83 ec 1c             	sub    $0x1c,%esp
    129d:	8b 7d 08             	mov    0x8(%ebp),%edi
    12a0:	eb 2f                	jmp    12d1 <gets+0x41>
    12a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    12ab:	83 ec 04             	sub    $0x4,%esp
    12ae:	6a 01                	push   $0x1
    12b0:	50                   	push   %eax
    12b1:	6a 00                	push   $0x0
    12b3:	e8 09 03 00 00       	call   15c1 <read>
    12b8:	83 c4 10             	add    $0x10,%esp
    12bb:	85 c0                	test   %eax,%eax
    12bd:	7e 1c                	jle    12db <gets+0x4b>
    12bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12c3:	83 c7 01             	add    $0x1,%edi
    12c6:	88 47 ff             	mov    %al,-0x1(%edi)
    12c9:	3c 0a                	cmp    $0xa,%al
    12cb:	74 23                	je     12f0 <gets+0x60>
    12cd:	3c 0d                	cmp    $0xd,%al
    12cf:	74 1f                	je     12f0 <gets+0x60>
    12d1:	83 c3 01             	add    $0x1,%ebx
    12d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12d7:	89 fe                	mov    %edi,%esi
    12d9:	7c cd                	jl     12a8 <gets+0x18>
    12db:	89 f3                	mov    %esi,%ebx
    12dd:	8b 45 08             	mov    0x8(%ebp),%eax
    12e0:	c6 03 00             	movb   $0x0,(%ebx)
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
    12fa:	c6 03 00             	movb   $0x0,(%ebx)
    12fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1300:	5b                   	pop    %ebx
    1301:	5e                   	pop    %esi
    1302:	5f                   	pop    %edi
    1303:	5d                   	pop    %ebp
    1304:	c3                   	ret    
    1305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001310 <stat>:
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	56                   	push   %esi
    1314:	53                   	push   %ebx
    1315:	83 ec 08             	sub    $0x8,%esp
    1318:	6a 00                	push   $0x0
    131a:	ff 75 08             	pushl  0x8(%ebp)
    131d:	e8 c7 02 00 00       	call   15e9 <open>
    1322:	83 c4 10             	add    $0x10,%esp
    1325:	85 c0                	test   %eax,%eax
    1327:	78 27                	js     1350 <stat+0x40>
    1329:	83 ec 08             	sub    $0x8,%esp
    132c:	ff 75 0c             	pushl  0xc(%ebp)
    132f:	89 c3                	mov    %eax,%ebx
    1331:	50                   	push   %eax
    1332:	e8 ca 02 00 00       	call   1601 <fstat>
    1337:	89 1c 24             	mov    %ebx,(%esp)
    133a:	89 c6                	mov    %eax,%esi
    133c:	e8 90 02 00 00       	call   15d1 <close>
    1341:	83 c4 10             	add    $0x10,%esp
    1344:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1347:	89 f0                	mov    %esi,%eax
    1349:	5b                   	pop    %ebx
    134a:	5e                   	pop    %esi
    134b:	5d                   	pop    %ebp
    134c:	c3                   	ret    
    134d:	8d 76 00             	lea    0x0(%esi),%esi
    1350:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1355:	eb ed                	jmp    1344 <stat+0x34>
    1357:	89 f6                	mov    %esi,%esi
    1359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001360 <atoi>:
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1367:	0f be 11             	movsbl (%ecx),%edx
    136a:	8d 42 d0             	lea    -0x30(%edx),%eax
    136d:	3c 09                	cmp    $0x9,%al
    136f:	b8 00 00 00 00       	mov    $0x0,%eax
    1374:	77 1f                	ja     1395 <atoi+0x35>
    1376:	8d 76 00             	lea    0x0(%esi),%esi
    1379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1380:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1383:	83 c1 01             	add    $0x1,%ecx
    1386:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
    138a:	0f be 11             	movsbl (%ecx),%edx
    138d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1390:	80 fb 09             	cmp    $0x9,%bl
    1393:	76 eb                	jbe    1380 <atoi+0x20>
    1395:	5b                   	pop    %ebx
    1396:	5d                   	pop    %ebp
    1397:	c3                   	ret    
    1398:	90                   	nop
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013a0 <memmove>:
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	56                   	push   %esi
    13a4:	53                   	push   %ebx
    13a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13a8:	8b 45 08             	mov    0x8(%ebp),%eax
    13ab:	8b 75 0c             	mov    0xc(%ebp),%esi
    13ae:	85 db                	test   %ebx,%ebx
    13b0:	7e 14                	jle    13c6 <memmove+0x26>
    13b2:	31 d2                	xor    %edx,%edx
    13b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    13bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    13bf:	83 c2 01             	add    $0x1,%edx
    13c2:	39 d3                	cmp    %edx,%ebx
    13c4:	75 f2                	jne    13b8 <memmove+0x18>
    13c6:	5b                   	pop    %ebx
    13c7:	5e                   	pop    %esi
    13c8:	5d                   	pop    %ebp
    13c9:	c3                   	ret    
    13ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013d0 <thread_join>:
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	83 ec 24             	sub    $0x24,%esp
    13d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13d9:	50                   	push   %eax
    13da:	e8 a2 02 00 00       	call   1681 <join>
    13df:	c9                   	leave  
    13e0:	c3                   	ret    
    13e1:	eb 0d                	jmp    13f0 <free>
    13e3:	90                   	nop
    13e4:	90                   	nop
    13e5:	90                   	nop
    13e6:	90                   	nop
    13e7:	90                   	nop
    13e8:	90                   	nop
    13e9:	90                   	nop
    13ea:	90                   	nop
    13eb:	90                   	nop
    13ec:	90                   	nop
    13ed:	90                   	nop
    13ee:	90                   	nop
    13ef:	90                   	nop

000013f0 <free>:
    13f0:	55                   	push   %ebp
    13f1:	a1 6c 1d 00 00       	mov    0x1d6c,%eax
    13f6:	89 e5                	mov    %esp,%ebp
    13f8:	57                   	push   %edi
    13f9:	56                   	push   %esi
    13fa:	53                   	push   %ebx
    13fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    13fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1408:	39 c8                	cmp    %ecx,%eax
    140a:	8b 10                	mov    (%eax),%edx
    140c:	73 32                	jae    1440 <free+0x50>
    140e:	39 d1                	cmp    %edx,%ecx
    1410:	72 04                	jb     1416 <free+0x26>
    1412:	39 d0                	cmp    %edx,%eax
    1414:	72 32                	jb     1448 <free+0x58>
    1416:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1419:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    141c:	39 fa                	cmp    %edi,%edx
    141e:	74 30                	je     1450 <free+0x60>
    1420:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1423:	8b 50 04             	mov    0x4(%eax),%edx
    1426:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1429:	39 f1                	cmp    %esi,%ecx
    142b:	74 3a                	je     1467 <free+0x77>
    142d:	89 08                	mov    %ecx,(%eax)
    142f:	a3 6c 1d 00 00       	mov    %eax,0x1d6c
    1434:	5b                   	pop    %ebx
    1435:	5e                   	pop    %esi
    1436:	5f                   	pop    %edi
    1437:	5d                   	pop    %ebp
    1438:	c3                   	ret    
    1439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1440:	39 d0                	cmp    %edx,%eax
    1442:	72 04                	jb     1448 <free+0x58>
    1444:	39 d1                	cmp    %edx,%ecx
    1446:	72 ce                	jb     1416 <free+0x26>
    1448:	89 d0                	mov    %edx,%eax
    144a:	eb bc                	jmp    1408 <free+0x18>
    144c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1450:	03 72 04             	add    0x4(%edx),%esi
    1453:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1456:	8b 10                	mov    (%eax),%edx
    1458:	8b 12                	mov    (%edx),%edx
    145a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    145d:	8b 50 04             	mov    0x4(%eax),%edx
    1460:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1463:	39 f1                	cmp    %esi,%ecx
    1465:	75 c6                	jne    142d <free+0x3d>
    1467:	03 53 fc             	add    -0x4(%ebx),%edx
    146a:	a3 6c 1d 00 00       	mov    %eax,0x1d6c
    146f:	89 50 04             	mov    %edx,0x4(%eax)
    1472:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1475:	89 10                	mov    %edx,(%eax)
    1477:	5b                   	pop    %ebx
    1478:	5e                   	pop    %esi
    1479:	5f                   	pop    %edi
    147a:	5d                   	pop    %ebp
    147b:	c3                   	ret    
    147c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001480 <malloc>:
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	57                   	push   %edi
    1484:	56                   	push   %esi
    1485:	53                   	push   %ebx
    1486:	83 ec 0c             	sub    $0xc,%esp
    1489:	8b 45 08             	mov    0x8(%ebp),%eax
    148c:	8b 15 6c 1d 00 00    	mov    0x1d6c,%edx
    1492:	8d 78 07             	lea    0x7(%eax),%edi
    1495:	c1 ef 03             	shr    $0x3,%edi
    1498:	83 c7 01             	add    $0x1,%edi
    149b:	85 d2                	test   %edx,%edx
    149d:	0f 84 9d 00 00 00    	je     1540 <malloc+0xc0>
    14a3:	8b 02                	mov    (%edx),%eax
    14a5:	8b 48 04             	mov    0x4(%eax),%ecx
    14a8:	39 cf                	cmp    %ecx,%edi
    14aa:	76 6c                	jbe    1518 <malloc+0x98>
    14ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    14b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    14b7:	0f 43 df             	cmovae %edi,%ebx
    14ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    14c1:	eb 0e                	jmp    14d1 <malloc+0x51>
    14c3:	90                   	nop
    14c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14c8:	8b 02                	mov    (%edx),%eax
    14ca:	8b 48 04             	mov    0x4(%eax),%ecx
    14cd:	39 f9                	cmp    %edi,%ecx
    14cf:	73 47                	jae    1518 <malloc+0x98>
    14d1:	39 05 6c 1d 00 00    	cmp    %eax,0x1d6c
    14d7:	89 c2                	mov    %eax,%edx
    14d9:	75 ed                	jne    14c8 <malloc+0x48>
    14db:	83 ec 0c             	sub    $0xc,%esp
    14de:	56                   	push   %esi
    14df:	e8 4d 01 00 00       	call   1631 <sbrk>
    14e4:	83 c4 10             	add    $0x10,%esp
    14e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    14ea:	74 1c                	je     1508 <malloc+0x88>
    14ec:	89 58 04             	mov    %ebx,0x4(%eax)
    14ef:	83 ec 0c             	sub    $0xc,%esp
    14f2:	83 c0 08             	add    $0x8,%eax
    14f5:	50                   	push   %eax
    14f6:	e8 f5 fe ff ff       	call   13f0 <free>
    14fb:	8b 15 6c 1d 00 00    	mov    0x1d6c,%edx
    1501:	83 c4 10             	add    $0x10,%esp
    1504:	85 d2                	test   %edx,%edx
    1506:	75 c0                	jne    14c8 <malloc+0x48>
    1508:	8d 65 f4             	lea    -0xc(%ebp),%esp
    150b:	31 c0                	xor    %eax,%eax
    150d:	5b                   	pop    %ebx
    150e:	5e                   	pop    %esi
    150f:	5f                   	pop    %edi
    1510:	5d                   	pop    %ebp
    1511:	c3                   	ret    
    1512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1518:	39 cf                	cmp    %ecx,%edi
    151a:	74 54                	je     1570 <malloc+0xf0>
    151c:	29 f9                	sub    %edi,%ecx
    151e:	89 48 04             	mov    %ecx,0x4(%eax)
    1521:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1524:	89 78 04             	mov    %edi,0x4(%eax)
    1527:	89 15 6c 1d 00 00    	mov    %edx,0x1d6c
    152d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1530:	83 c0 08             	add    $0x8,%eax
    1533:	5b                   	pop    %ebx
    1534:	5e                   	pop    %esi
    1535:	5f                   	pop    %edi
    1536:	5d                   	pop    %ebp
    1537:	c3                   	ret    
    1538:	90                   	nop
    1539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1540:	c7 05 6c 1d 00 00 70 	movl   $0x1d70,0x1d6c
    1547:	1d 00 00 
    154a:	c7 05 70 1d 00 00 70 	movl   $0x1d70,0x1d70
    1551:	1d 00 00 
    1554:	b8 70 1d 00 00       	mov    $0x1d70,%eax
    1559:	c7 05 74 1d 00 00 00 	movl   $0x0,0x1d74
    1560:	00 00 00 
    1563:	e9 44 ff ff ff       	jmp    14ac <malloc+0x2c>
    1568:	90                   	nop
    1569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1570:	8b 08                	mov    (%eax),%ecx
    1572:	89 0a                	mov    %ecx,(%edx)
    1574:	eb b1                	jmp    1527 <malloc+0xa7>
    1576:	8d 76 00             	lea    0x0(%esi),%esi
    1579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001580 <thread_create>:
    1580:	55                   	push   %ebp
    1581:	89 e5                	mov    %esp,%ebp
    1583:	83 ec 14             	sub    $0x14,%esp
    1586:	68 00 10 00 00       	push   $0x1000
    158b:	e8 f0 fe ff ff       	call   1480 <malloc>
    1590:	83 c4 0c             	add    $0xc,%esp
    1593:	50                   	push   %eax
    1594:	ff 75 0c             	pushl  0xc(%ebp)
    1597:	ff 75 08             	pushl  0x8(%ebp)
    159a:	e8 da 00 00 00       	call   1679 <clone>
    159f:	c9                   	leave  
    15a0:	c3                   	ret    

000015a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    15a1:	b8 01 00 00 00       	mov    $0x1,%eax
    15a6:	cd 40                	int    $0x40
    15a8:	c3                   	ret    

000015a9 <exit>:
SYSCALL(exit)
    15a9:	b8 02 00 00 00       	mov    $0x2,%eax
    15ae:	cd 40                	int    $0x40
    15b0:	c3                   	ret    

000015b1 <wait>:
SYSCALL(wait)
    15b1:	b8 03 00 00 00       	mov    $0x3,%eax
    15b6:	cd 40                	int    $0x40
    15b8:	c3                   	ret    

000015b9 <pipe>:
SYSCALL(pipe)
    15b9:	b8 04 00 00 00       	mov    $0x4,%eax
    15be:	cd 40                	int    $0x40
    15c0:	c3                   	ret    

000015c1 <read>:
SYSCALL(read)
    15c1:	b8 05 00 00 00       	mov    $0x5,%eax
    15c6:	cd 40                	int    $0x40
    15c8:	c3                   	ret    

000015c9 <write>:
SYSCALL(write)
    15c9:	b8 10 00 00 00       	mov    $0x10,%eax
    15ce:	cd 40                	int    $0x40
    15d0:	c3                   	ret    

000015d1 <close>:
SYSCALL(close)
    15d1:	b8 15 00 00 00       	mov    $0x15,%eax
    15d6:	cd 40                	int    $0x40
    15d8:	c3                   	ret    

000015d9 <kill>:
SYSCALL(kill)
    15d9:	b8 06 00 00 00       	mov    $0x6,%eax
    15de:	cd 40                	int    $0x40
    15e0:	c3                   	ret    

000015e1 <exec>:
SYSCALL(exec)
    15e1:	b8 07 00 00 00       	mov    $0x7,%eax
    15e6:	cd 40                	int    $0x40
    15e8:	c3                   	ret    

000015e9 <open>:
SYSCALL(open)
    15e9:	b8 0f 00 00 00       	mov    $0xf,%eax
    15ee:	cd 40                	int    $0x40
    15f0:	c3                   	ret    

000015f1 <mknod>:
SYSCALL(mknod)
    15f1:	b8 11 00 00 00       	mov    $0x11,%eax
    15f6:	cd 40                	int    $0x40
    15f8:	c3                   	ret    

000015f9 <unlink>:
SYSCALL(unlink)
    15f9:	b8 12 00 00 00       	mov    $0x12,%eax
    15fe:	cd 40                	int    $0x40
    1600:	c3                   	ret    

00001601 <fstat>:
SYSCALL(fstat)
    1601:	b8 08 00 00 00       	mov    $0x8,%eax
    1606:	cd 40                	int    $0x40
    1608:	c3                   	ret    

00001609 <link>:
SYSCALL(link)
    1609:	b8 13 00 00 00       	mov    $0x13,%eax
    160e:	cd 40                	int    $0x40
    1610:	c3                   	ret    

00001611 <mkdir>:
SYSCALL(mkdir)
    1611:	b8 14 00 00 00       	mov    $0x14,%eax
    1616:	cd 40                	int    $0x40
    1618:	c3                   	ret    

00001619 <chdir>:
SYSCALL(chdir)
    1619:	b8 09 00 00 00       	mov    $0x9,%eax
    161e:	cd 40                	int    $0x40
    1620:	c3                   	ret    

00001621 <dup>:
SYSCALL(dup)
    1621:	b8 0a 00 00 00       	mov    $0xa,%eax
    1626:	cd 40                	int    $0x40
    1628:	c3                   	ret    

00001629 <getpid>:
SYSCALL(getpid)
    1629:	b8 0b 00 00 00       	mov    $0xb,%eax
    162e:	cd 40                	int    $0x40
    1630:	c3                   	ret    

00001631 <sbrk>:
SYSCALL(sbrk)
    1631:	b8 0c 00 00 00       	mov    $0xc,%eax
    1636:	cd 40                	int    $0x40
    1638:	c3                   	ret    

00001639 <sleep>:
SYSCALL(sleep)
    1639:	b8 0d 00 00 00       	mov    $0xd,%eax
    163e:	cd 40                	int    $0x40
    1640:	c3                   	ret    

00001641 <uptime>:
SYSCALL(uptime)
    1641:	b8 0e 00 00 00       	mov    $0xe,%eax
    1646:	cd 40                	int    $0x40
    1648:	c3                   	ret    

00001649 <getreadcount>:
SYSCALL(getreadcount)
    1649:	b8 16 00 00 00       	mov    $0x16,%eax
    164e:	cd 40                	int    $0x40
    1650:	c3                   	ret    

00001651 <gettime>:
SYSCALL(gettime)
    1651:	b8 17 00 00 00       	mov    $0x17,%eax
    1656:	cd 40                	int    $0x40
    1658:	c3                   	ret    

00001659 <settickets>:
SYSCALL(settickets)
    1659:	b8 18 00 00 00       	mov    $0x18,%eax
    165e:	cd 40                	int    $0x40
    1660:	c3                   	ret    

00001661 <getpinfo>:
SYSCALL(getpinfo)
    1661:	b8 19 00 00 00       	mov    $0x19,%eax
    1666:	cd 40                	int    $0x40
    1668:	c3                   	ret    

00001669 <mprotect>:
SYSCALL(mprotect)
    1669:	b8 1a 00 00 00       	mov    $0x1a,%eax
    166e:	cd 40                	int    $0x40
    1670:	c3                   	ret    

00001671 <munprotect>:
SYSCALL(munprotect)
    1671:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1676:	cd 40                	int    $0x40
    1678:	c3                   	ret    

00001679 <clone>:
SYSCALL(clone)
    1679:	b8 1c 00 00 00       	mov    $0x1c,%eax
    167e:	cd 40                	int    $0x40
    1680:	c3                   	ret    

00001681 <join>:
    1681:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1686:	cd 40                	int    $0x40
    1688:	c3                   	ret    
    1689:	66 90                	xchg   %ax,%ax
    168b:	66 90                	xchg   %ax,%ax
    168d:	66 90                	xchg   %ax,%ax
    168f:	90                   	nop

00001690 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1690:	55                   	push   %ebp
    1691:	89 e5                	mov    %esp,%ebp
    1693:	57                   	push   %edi
    1694:	56                   	push   %esi
    1695:	53                   	push   %ebx
    1696:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1699:	85 d2                	test   %edx,%edx
{
    169b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    169e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    16a0:	79 76                	jns    1718 <printint+0x88>
    16a2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    16a6:	74 70                	je     1718 <printint+0x88>
    x = -xx;
    16a8:	f7 d8                	neg    %eax
    neg = 1;
    16aa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    16b1:	31 f6                	xor    %esi,%esi
    16b3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    16b6:	eb 0a                	jmp    16c2 <printint+0x32>
    16b8:	90                   	nop
    16b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    16c0:	89 fe                	mov    %edi,%esi
    16c2:	31 d2                	xor    %edx,%edx
    16c4:	8d 7e 01             	lea    0x1(%esi),%edi
    16c7:	f7 f1                	div    %ecx
    16c9:	0f b6 92 04 1a 00 00 	movzbl 0x1a04(%edx),%edx
  }while((x /= base) != 0);
    16d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    16d2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    16d5:	75 e9                	jne    16c0 <printint+0x30>
  if(neg)
    16d7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    16da:	85 c0                	test   %eax,%eax
    16dc:	74 08                	je     16e6 <printint+0x56>
    buf[i++] = '-';
    16de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    16e3:	8d 7e 02             	lea    0x2(%esi),%edi
    16e6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    16ea:	8b 7d c0             	mov    -0x40(%ebp),%edi
    16ed:	8d 76 00             	lea    0x0(%esi),%esi
    16f0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    16f3:	83 ec 04             	sub    $0x4,%esp
    16f6:	83 ee 01             	sub    $0x1,%esi
    16f9:	6a 01                	push   $0x1
    16fb:	53                   	push   %ebx
    16fc:	57                   	push   %edi
    16fd:	88 45 d7             	mov    %al,-0x29(%ebp)
    1700:	e8 c4 fe ff ff       	call   15c9 <write>

  while(--i >= 0)
    1705:	83 c4 10             	add    $0x10,%esp
    1708:	39 de                	cmp    %ebx,%esi
    170a:	75 e4                	jne    16f0 <printint+0x60>
    putc(fd, buf[i]);
}
    170c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    170f:	5b                   	pop    %ebx
    1710:	5e                   	pop    %esi
    1711:	5f                   	pop    %edi
    1712:	5d                   	pop    %ebp
    1713:	c3                   	ret    
    1714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1718:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    171f:	eb 90                	jmp    16b1 <printint+0x21>
    1721:	eb 0d                	jmp    1730 <printf>
    1723:	90                   	nop
    1724:	90                   	nop
    1725:	90                   	nop
    1726:	90                   	nop
    1727:	90                   	nop
    1728:	90                   	nop
    1729:	90                   	nop
    172a:	90                   	nop
    172b:	90                   	nop
    172c:	90                   	nop
    172d:	90                   	nop
    172e:	90                   	nop
    172f:	90                   	nop

00001730 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1730:	55                   	push   %ebp
    1731:	89 e5                	mov    %esp,%ebp
    1733:	57                   	push   %edi
    1734:	56                   	push   %esi
    1735:	53                   	push   %ebx
    1736:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1739:	8b 75 0c             	mov    0xc(%ebp),%esi
    173c:	0f b6 1e             	movzbl (%esi),%ebx
    173f:	84 db                	test   %bl,%bl
    1741:	0f 84 bf 00 00 00    	je     1806 <printf+0xd6>
    1747:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    174a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    174d:	31 d2                	xor    %edx,%edx
    174f:	eb 39                	jmp    178a <printf+0x5a>
    1751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1758:	83 f8 25             	cmp    $0x25,%eax
    175b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    175e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1763:	74 1a                	je     177f <printf+0x4f>
  write(fd, &c, 1);
    1765:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1768:	83 ec 04             	sub    $0x4,%esp
    176b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    176e:	6a 01                	push   $0x1
    1770:	50                   	push   %eax
    1771:	ff 75 08             	pushl  0x8(%ebp)
    1774:	e8 50 fe ff ff       	call   15c9 <write>
    1779:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    177c:	83 c4 10             	add    $0x10,%esp
    177f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1782:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1786:	84 db                	test   %bl,%bl
    1788:	74 7c                	je     1806 <printf+0xd6>
    if(state == 0){
    178a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    178c:	0f be cb             	movsbl %bl,%ecx
    178f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1792:	74 c4                	je     1758 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1794:	83 fa 25             	cmp    $0x25,%edx
    1797:	75 e6                	jne    177f <printf+0x4f>
      if(c == 'd'){
    1799:	83 f8 64             	cmp    $0x64,%eax
    179c:	0f 84 a6 00 00 00    	je     1848 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    17a2:	83 f8 6c             	cmp    $0x6c,%eax
    17a5:	0f 84 ad 00 00 00    	je     1858 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    17ab:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    17b1:	83 f9 70             	cmp    $0x70,%ecx
    17b4:	74 5a                	je     1810 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    17b6:	83 f8 73             	cmp    $0x73,%eax
    17b9:	0f 84 e1 00 00 00    	je     18a0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    17bf:	83 f8 63             	cmp    $0x63,%eax
    17c2:	0f 84 28 01 00 00    	je     18f0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    17c8:	83 f8 25             	cmp    $0x25,%eax
    17cb:	74 6b                	je     1838 <printf+0x108>
  write(fd, &c, 1);
    17cd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    17d0:	83 ec 04             	sub    $0x4,%esp
    17d3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    17d7:	6a 01                	push   $0x1
    17d9:	50                   	push   %eax
    17da:	ff 75 08             	pushl  0x8(%ebp)
    17dd:	e8 e7 fd ff ff       	call   15c9 <write>
    17e2:	83 c4 0c             	add    $0xc,%esp
    17e5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    17e8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    17eb:	6a 01                	push   $0x1
    17ed:	50                   	push   %eax
    17ee:	ff 75 08             	pushl  0x8(%ebp)
    17f1:	83 c6 01             	add    $0x1,%esi
    17f4:	e8 d0 fd ff ff       	call   15c9 <write>
  for(i = 0; fmt[i]; i++){
    17f9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    17fd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1800:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1802:	84 db                	test   %bl,%bl
    1804:	75 84                	jne    178a <printf+0x5a>
    }
  }
}
    1806:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1809:	5b                   	pop    %ebx
    180a:	5e                   	pop    %esi
    180b:	5f                   	pop    %edi
    180c:	5d                   	pop    %ebp
    180d:	c3                   	ret    
    180e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1810:	83 ec 0c             	sub    $0xc,%esp
    1813:	b9 10 00 00 00       	mov    $0x10,%ecx
    1818:	6a 00                	push   $0x0
    181a:	8b 17                	mov    (%edi),%edx
    181c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    181f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1822:	e8 69 fe ff ff       	call   1690 <printint>
    1827:	83 c4 10             	add    $0x10,%esp
      state = 0;
    182a:	31 d2                	xor    %edx,%edx
    182c:	e9 4e ff ff ff       	jmp    177f <printf+0x4f>
    1831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1838:	83 ec 04             	sub    $0x4,%esp
    183b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    183e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1841:	6a 01                	push   $0x1
    1843:	eb a8                	jmp    17ed <printf+0xbd>
    1845:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1848:	83 ec 0c             	sub    $0xc,%esp
    184b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1850:	6a 01                	push   $0x1
    1852:	eb c6                	jmp    181a <printf+0xea>
    1854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1858:	8b 57 04             	mov    0x4(%edi),%edx
    185b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    185d:	85 d2                	test   %edx,%edx
    185f:	74 15                	je     1876 <printf+0x146>
    1861:	83 ec 0c             	sub    $0xc,%esp
    1864:	8b 45 08             	mov    0x8(%ebp),%eax
    1867:	b9 10 00 00 00       	mov    $0x10,%ecx
    186c:	6a 00                	push   $0x0
    186e:	e8 1d fe ff ff       	call   1690 <printint>
    1873:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1876:	83 ec 0c             	sub    $0xc,%esp
    1879:	8b 45 08             	mov    0x8(%ebp),%eax
    187c:	89 da                	mov    %ebx,%edx
    187e:	6a 00                	push   $0x0
    1880:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1885:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1888:	e8 03 fe ff ff       	call   1690 <printint>
    188d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1890:	31 d2                	xor    %edx,%edx
    1892:	e9 e8 fe ff ff       	jmp    177f <printf+0x4f>
    1897:	89 f6                	mov    %esi,%esi
    1899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    18a0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    18a2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    18a5:	85 c9                	test   %ecx,%ecx
    18a7:	74 6a                	je     1913 <printf+0x1e3>
        while(*s != 0){
    18a9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    18ac:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    18ae:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    18b0:	84 c0                	test   %al,%al
    18b2:	0f 84 c7 fe ff ff    	je     177f <printf+0x4f>
    18b8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    18bb:	89 de                	mov    %ebx,%esi
    18bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    18c0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    18c3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    18c6:	83 ec 04             	sub    $0x4,%esp
    18c9:	6a 01                	push   $0x1
          s++;
    18cb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    18ce:	50                   	push   %eax
    18cf:	53                   	push   %ebx
    18d0:	e8 f4 fc ff ff       	call   15c9 <write>
        while(*s != 0){
    18d5:	0f b6 06             	movzbl (%esi),%eax
    18d8:	83 c4 10             	add    $0x10,%esp
    18db:	84 c0                	test   %al,%al
    18dd:	75 e1                	jne    18c0 <printf+0x190>
    18df:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    18e2:	31 d2                	xor    %edx,%edx
    18e4:	e9 96 fe ff ff       	jmp    177f <printf+0x4f>
    18e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    18f0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    18f2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    18f5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    18f8:	6a 01                	push   $0x1
        putc(fd, *ap);
    18fa:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    18fd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1900:	50                   	push   %eax
    1901:	ff 75 08             	pushl  0x8(%ebp)
    1904:	e8 c0 fc ff ff       	call   15c9 <write>
    1909:	83 c4 10             	add    $0x10,%esp
      state = 0;
    190c:	31 d2                	xor    %edx,%edx
    190e:	e9 6c fe ff ff       	jmp    177f <printf+0x4f>
          s = "(null)";
    1913:	bb fc 19 00 00       	mov    $0x19fc,%ebx
        while(*s != 0){
    1918:	b8 28 00 00 00       	mov    $0x28,%eax
    191d:	eb 99                	jmp    18b8 <printf+0x188>
