
_usertests:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 0c             	sub    $0xc,%esp
    1011:	68 de 5d 00 00       	push   $0x5dde
    1016:	6a 01                	push   $0x1
    1018:	e8 e3 3b 00 00       	call   4c00 <printf>
    101d:	59                   	pop    %ecx
    101e:	58                   	pop    %eax
    101f:	6a 00                	push   $0x0
    1021:	68 f2 5d 00 00       	push   $0x5df2
    1026:	e8 8e 3a 00 00       	call   4ab9 <open>
    102b:	83 c4 10             	add    $0x10,%esp
    102e:	85 c0                	test   %eax,%eax
    1030:	78 13                	js     1045 <main+0x45>
    1032:	52                   	push   %edx
    1033:	52                   	push   %edx
    1034:	68 5c 65 00 00       	push   $0x655c
    1039:	6a 01                	push   $0x1
    103b:	e8 c0 3b 00 00       	call   4c00 <printf>
    1040:	e8 34 3a 00 00       	call   4a79 <exit>
    1045:	50                   	push   %eax
    1046:	50                   	push   %eax
    1047:	68 00 02 00 00       	push   $0x200
    104c:	68 f2 5d 00 00       	push   $0x5df2
    1051:	e8 63 3a 00 00       	call   4ab9 <open>
    1056:	89 04 24             	mov    %eax,(%esp)
    1059:	e8 43 3a 00 00       	call   4aa1 <close>
    105e:	e8 5d 35 00 00       	call   45c0 <argptest>
    1063:	e8 a8 11 00 00       	call   2210 <createdelete>
    1068:	e8 63 1a 00 00       	call   2ad0 <linkunlink>
    106d:	e8 5e 17 00 00       	call   27d0 <concreate>
    1072:	e8 99 0f 00 00       	call   2010 <fourfiles>
    1077:	e8 d4 0d 00 00       	call   1e50 <sharedfd>
    107c:	e8 ff 31 00 00       	call   4280 <bigargtest>
    1081:	e8 6a 23 00 00       	call   33f0 <bigwrite>
    1086:	e8 f5 31 00 00       	call   4280 <bigargtest>
    108b:	e8 70 31 00 00       	call   4200 <bsstest>
    1090:	e8 9b 2c 00 00       	call   3d30 <sbrktest>
    1095:	e8 b6 30 00 00       	call   4150 <validatetest>
    109a:	e8 51 03 00 00       	call   13f0 <opentest>
    109f:	e8 dc 03 00 00       	call   1480 <writetest>
    10a4:	e8 b7 05 00 00       	call   1660 <writetest1>
    10a9:	e8 82 07 00 00       	call   1830 <createtest>
    10ae:	e8 3d 02 00 00       	call   12f0 <openiputtest>
    10b3:	e8 48 01 00 00       	call   1200 <exitiputtest>
    10b8:	e8 63 00 00 00       	call   1120 <iputtest>
    10bd:	e8 be 0c 00 00       	call   1d80 <mem>
    10c2:	e8 49 09 00 00       	call   1a10 <pipe1>
    10c7:	e8 e4 0a 00 00       	call   1bb0 <preempt>
    10cc:	e8 1f 0c 00 00       	call   1cf0 <exitwait>
    10d1:	e8 0a 27 00 00       	call   37e0 <rmdot>
    10d6:	e8 c5 25 00 00       	call   36a0 <fourteen>
    10db:	e8 f0 23 00 00       	call   34d0 <bigfile>
    10e0:	e8 2b 1c 00 00       	call   2d10 <subdir>
    10e5:	e8 d6 14 00 00       	call   25c0 <linktest>
    10ea:	e8 41 13 00 00       	call   2430 <unlinkread>
    10ef:	e8 6c 28 00 00       	call   3960 <dirfile>
    10f4:	e8 67 2a 00 00       	call   3b60 <iref>
    10f9:	e8 82 2b 00 00       	call   3c80 <forktest>
    10fe:	e8 dd 1a 00 00       	call   2be0 <bigdir>
    1103:	e8 48 34 00 00       	call   4550 <uio>
    1108:	e8 b3 08 00 00       	call   19c0 <exectest>
    110d:	e8 67 39 00 00       	call   4a79 <exit>
    1112:	66 90                	xchg   %ax,%ax
    1114:	66 90                	xchg   %ax,%ax
    1116:	66 90                	xchg   %ax,%ax
    1118:	66 90                	xchg   %ax,%ax
    111a:	66 90                	xchg   %ax,%ax
    111c:	66 90                	xchg   %ax,%ax
    111e:	66 90                	xchg   %ax,%ax

00001120 <iputtest>:
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	83 ec 10             	sub    $0x10,%esp
    1126:	68 84 4e 00 00       	push   $0x4e84
    112b:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1131:	e8 ca 3a 00 00       	call   4c00 <printf>
    1136:	c7 04 24 17 4e 00 00 	movl   $0x4e17,(%esp)
    113d:	e8 9f 39 00 00       	call   4ae1 <mkdir>
    1142:	83 c4 10             	add    $0x10,%esp
    1145:	85 c0                	test   %eax,%eax
    1147:	78 58                	js     11a1 <iputtest+0x81>
    1149:	83 ec 0c             	sub    $0xc,%esp
    114c:	68 17 4e 00 00       	push   $0x4e17
    1151:	e8 93 39 00 00       	call   4ae9 <chdir>
    1156:	83 c4 10             	add    $0x10,%esp
    1159:	85 c0                	test   %eax,%eax
    115b:	0f 88 85 00 00 00    	js     11e6 <iputtest+0xc6>
    1161:	83 ec 0c             	sub    $0xc,%esp
    1164:	68 14 4e 00 00       	push   $0x4e14
    1169:	e8 5b 39 00 00       	call   4ac9 <unlink>
    116e:	83 c4 10             	add    $0x10,%esp
    1171:	85 c0                	test   %eax,%eax
    1173:	78 5a                	js     11cf <iputtest+0xaf>
    1175:	83 ec 0c             	sub    $0xc,%esp
    1178:	68 39 4e 00 00       	push   $0x4e39
    117d:	e8 67 39 00 00       	call   4ae9 <chdir>
    1182:	83 c4 10             	add    $0x10,%esp
    1185:	85 c0                	test   %eax,%eax
    1187:	78 2f                	js     11b8 <iputtest+0x98>
    1189:	83 ec 08             	sub    $0x8,%esp
    118c:	68 bc 4e 00 00       	push   $0x4ebc
    1191:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1197:	e8 64 3a 00 00       	call   4c00 <printf>
    119c:	83 c4 10             	add    $0x10,%esp
    119f:	c9                   	leave  
    11a0:	c3                   	ret    
    11a1:	50                   	push   %eax
    11a2:	50                   	push   %eax
    11a3:	68 f0 4d 00 00       	push   $0x4df0
    11a8:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    11ae:	e8 4d 3a 00 00       	call   4c00 <printf>
    11b3:	e8 c1 38 00 00       	call   4a79 <exit>
    11b8:	50                   	push   %eax
    11b9:	50                   	push   %eax
    11ba:	68 3b 4e 00 00       	push   $0x4e3b
    11bf:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    11c5:	e8 36 3a 00 00       	call   4c00 <printf>
    11ca:	e8 aa 38 00 00       	call   4a79 <exit>
    11cf:	52                   	push   %edx
    11d0:	52                   	push   %edx
    11d1:	68 1f 4e 00 00       	push   $0x4e1f
    11d6:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    11dc:	e8 1f 3a 00 00       	call   4c00 <printf>
    11e1:	e8 93 38 00 00       	call   4a79 <exit>
    11e6:	51                   	push   %ecx
    11e7:	51                   	push   %ecx
    11e8:	68 fe 4d 00 00       	push   $0x4dfe
    11ed:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    11f3:	e8 08 3a 00 00       	call   4c00 <printf>
    11f8:	e8 7c 38 00 00       	call   4a79 <exit>
    11fd:	8d 76 00             	lea    0x0(%esi),%esi

00001200 <exitiputtest>:
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	83 ec 10             	sub    $0x10,%esp
    1206:	68 4b 4e 00 00       	push   $0x4e4b
    120b:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1211:	e8 ea 39 00 00       	call   4c00 <printf>
    1216:	e8 56 38 00 00       	call   4a71 <fork>
    121b:	83 c4 10             	add    $0x10,%esp
    121e:	85 c0                	test   %eax,%eax
    1220:	0f 88 82 00 00 00    	js     12a8 <exitiputtest+0xa8>
    1226:	75 48                	jne    1270 <exitiputtest+0x70>
    1228:	83 ec 0c             	sub    $0xc,%esp
    122b:	68 17 4e 00 00       	push   $0x4e17
    1230:	e8 ac 38 00 00       	call   4ae1 <mkdir>
    1235:	83 c4 10             	add    $0x10,%esp
    1238:	85 c0                	test   %eax,%eax
    123a:	0f 88 96 00 00 00    	js     12d6 <exitiputtest+0xd6>
    1240:	83 ec 0c             	sub    $0xc,%esp
    1243:	68 17 4e 00 00       	push   $0x4e17
    1248:	e8 9c 38 00 00       	call   4ae9 <chdir>
    124d:	83 c4 10             	add    $0x10,%esp
    1250:	85 c0                	test   %eax,%eax
    1252:	78 6b                	js     12bf <exitiputtest+0xbf>
    1254:	83 ec 0c             	sub    $0xc,%esp
    1257:	68 14 4e 00 00       	push   $0x4e14
    125c:	e8 68 38 00 00       	call   4ac9 <unlink>
    1261:	83 c4 10             	add    $0x10,%esp
    1264:	85 c0                	test   %eax,%eax
    1266:	78 28                	js     1290 <exitiputtest+0x90>
    1268:	e8 0c 38 00 00       	call   4a79 <exit>
    126d:	8d 76 00             	lea    0x0(%esi),%esi
    1270:	e8 0c 38 00 00       	call   4a81 <wait>
    1275:	83 ec 08             	sub    $0x8,%esp
    1278:	68 6e 4e 00 00       	push   $0x4e6e
    127d:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1283:	e8 78 39 00 00       	call   4c00 <printf>
    1288:	83 c4 10             	add    $0x10,%esp
    128b:	c9                   	leave  
    128c:	c3                   	ret    
    128d:	8d 76 00             	lea    0x0(%esi),%esi
    1290:	83 ec 08             	sub    $0x8,%esp
    1293:	68 1f 4e 00 00       	push   $0x4e1f
    1298:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    129e:	e8 5d 39 00 00       	call   4c00 <printf>
    12a3:	e8 d1 37 00 00       	call   4a79 <exit>
    12a8:	51                   	push   %ecx
    12a9:	51                   	push   %ecx
    12aa:	68 31 5d 00 00       	push   $0x5d31
    12af:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    12b5:	e8 46 39 00 00       	call   4c00 <printf>
    12ba:	e8 ba 37 00 00       	call   4a79 <exit>
    12bf:	50                   	push   %eax
    12c0:	50                   	push   %eax
    12c1:	68 5a 4e 00 00       	push   $0x4e5a
    12c6:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    12cc:	e8 2f 39 00 00       	call   4c00 <printf>
    12d1:	e8 a3 37 00 00       	call   4a79 <exit>
    12d6:	52                   	push   %edx
    12d7:	52                   	push   %edx
    12d8:	68 f0 4d 00 00       	push   $0x4df0
    12dd:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    12e3:	e8 18 39 00 00       	call   4c00 <printf>
    12e8:	e8 8c 37 00 00       	call   4a79 <exit>
    12ed:	8d 76 00             	lea    0x0(%esi),%esi

000012f0 <openiputtest>:
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	83 ec 10             	sub    $0x10,%esp
    12f6:	68 80 4e 00 00       	push   $0x4e80
    12fb:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1301:	e8 fa 38 00 00       	call   4c00 <printf>
    1306:	c7 04 24 8f 4e 00 00 	movl   $0x4e8f,(%esp)
    130d:	e8 cf 37 00 00       	call   4ae1 <mkdir>
    1312:	83 c4 10             	add    $0x10,%esp
    1315:	85 c0                	test   %eax,%eax
    1317:	0f 88 88 00 00 00    	js     13a5 <openiputtest+0xb5>
    131d:	e8 4f 37 00 00       	call   4a71 <fork>
    1322:	85 c0                	test   %eax,%eax
    1324:	0f 88 92 00 00 00    	js     13bc <openiputtest+0xcc>
    132a:	75 34                	jne    1360 <openiputtest+0x70>
    132c:	83 ec 08             	sub    $0x8,%esp
    132f:	6a 02                	push   $0x2
    1331:	68 8f 4e 00 00       	push   $0x4e8f
    1336:	e8 7e 37 00 00       	call   4ab9 <open>
    133b:	83 c4 10             	add    $0x10,%esp
    133e:	85 c0                	test   %eax,%eax
    1340:	78 5e                	js     13a0 <openiputtest+0xb0>
    1342:	83 ec 08             	sub    $0x8,%esp
    1345:	68 14 5e 00 00       	push   $0x5e14
    134a:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1350:	e8 ab 38 00 00       	call   4c00 <printf>
    1355:	e8 1f 37 00 00       	call   4a79 <exit>
    135a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1360:	83 ec 0c             	sub    $0xc,%esp
    1363:	6a 01                	push   $0x1
    1365:	e8 9f 37 00 00       	call   4b09 <sleep>
    136a:	c7 04 24 8f 4e 00 00 	movl   $0x4e8f,(%esp)
    1371:	e8 53 37 00 00       	call   4ac9 <unlink>
    1376:	83 c4 10             	add    $0x10,%esp
    1379:	85 c0                	test   %eax,%eax
    137b:	75 56                	jne    13d3 <openiputtest+0xe3>
    137d:	e8 ff 36 00 00       	call   4a81 <wait>
    1382:	83 ec 08             	sub    $0x8,%esp
    1385:	68 b8 4e 00 00       	push   $0x4eb8
    138a:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1390:	e8 6b 38 00 00       	call   4c00 <printf>
    1395:	83 c4 10             	add    $0x10,%esp
    1398:	c9                   	leave  
    1399:	c3                   	ret    
    139a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13a0:	e8 d4 36 00 00       	call   4a79 <exit>
    13a5:	51                   	push   %ecx
    13a6:	51                   	push   %ecx
    13a7:	68 95 4e 00 00       	push   $0x4e95
    13ac:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    13b2:	e8 49 38 00 00       	call   4c00 <printf>
    13b7:	e8 bd 36 00 00       	call   4a79 <exit>
    13bc:	52                   	push   %edx
    13bd:	52                   	push   %edx
    13be:	68 31 5d 00 00       	push   $0x5d31
    13c3:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    13c9:	e8 32 38 00 00       	call   4c00 <printf>
    13ce:	e8 a6 36 00 00       	call   4a79 <exit>
    13d3:	50                   	push   %eax
    13d4:	50                   	push   %eax
    13d5:	68 a9 4e 00 00       	push   $0x4ea9
    13da:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    13e0:	e8 1b 38 00 00       	call   4c00 <printf>
    13e5:	e8 8f 36 00 00       	call   4a79 <exit>
    13ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013f0 <opentest>:
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	83 ec 10             	sub    $0x10,%esp
    13f6:	68 ca 4e 00 00       	push   $0x4eca
    13fb:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1401:	e8 fa 37 00 00       	call   4c00 <printf>
    1406:	58                   	pop    %eax
    1407:	5a                   	pop    %edx
    1408:	6a 00                	push   $0x0
    140a:	68 d5 4e 00 00       	push   $0x4ed5
    140f:	e8 a5 36 00 00       	call   4ab9 <open>
    1414:	83 c4 10             	add    $0x10,%esp
    1417:	85 c0                	test   %eax,%eax
    1419:	78 36                	js     1451 <opentest+0x61>
    141b:	83 ec 0c             	sub    $0xc,%esp
    141e:	50                   	push   %eax
    141f:	e8 7d 36 00 00       	call   4aa1 <close>
    1424:	5a                   	pop    %edx
    1425:	59                   	pop    %ecx
    1426:	6a 00                	push   $0x0
    1428:	68 ed 4e 00 00       	push   $0x4eed
    142d:	e8 87 36 00 00       	call   4ab9 <open>
    1432:	83 c4 10             	add    $0x10,%esp
    1435:	85 c0                	test   %eax,%eax
    1437:	79 2f                	jns    1468 <opentest+0x78>
    1439:	83 ec 08             	sub    $0x8,%esp
    143c:	68 18 4f 00 00       	push   $0x4f18
    1441:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1447:	e8 b4 37 00 00       	call   4c00 <printf>
    144c:	83 c4 10             	add    $0x10,%esp
    144f:	c9                   	leave  
    1450:	c3                   	ret    
    1451:	50                   	push   %eax
    1452:	50                   	push   %eax
    1453:	68 da 4e 00 00       	push   $0x4eda
    1458:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    145e:	e8 9d 37 00 00       	call   4c00 <printf>
    1463:	e8 11 36 00 00       	call   4a79 <exit>
    1468:	50                   	push   %eax
    1469:	50                   	push   %eax
    146a:	68 fa 4e 00 00       	push   $0x4efa
    146f:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1475:	e8 86 37 00 00       	call   4c00 <printf>
    147a:	e8 fa 35 00 00       	call   4a79 <exit>
    147f:	90                   	nop

00001480 <writetest>:
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	56                   	push   %esi
    1484:	53                   	push   %ebx
    1485:	83 ec 08             	sub    $0x8,%esp
    1488:	68 26 4f 00 00       	push   $0x4f26
    148d:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1493:	e8 68 37 00 00       	call   4c00 <printf>
    1498:	58                   	pop    %eax
    1499:	5a                   	pop    %edx
    149a:	68 02 02 00 00       	push   $0x202
    149f:	68 37 4f 00 00       	push   $0x4f37
    14a4:	e8 10 36 00 00       	call   4ab9 <open>
    14a9:	83 c4 10             	add    $0x10,%esp
    14ac:	85 c0                	test   %eax,%eax
    14ae:	0f 88 88 01 00 00    	js     163c <writetest+0x1bc>
    14b4:	83 ec 08             	sub    $0x8,%esp
    14b7:	89 c6                	mov    %eax,%esi
    14b9:	31 db                	xor    %ebx,%ebx
    14bb:	68 3d 4f 00 00       	push   $0x4f3d
    14c0:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    14c6:	e8 35 37 00 00       	call   4c00 <printf>
    14cb:	83 c4 10             	add    $0x10,%esp
    14ce:	66 90                	xchg   %ax,%ax
    14d0:	83 ec 04             	sub    $0x4,%esp
    14d3:	6a 0a                	push   $0xa
    14d5:	68 74 4f 00 00       	push   $0x4f74
    14da:	56                   	push   %esi
    14db:	e8 b9 35 00 00       	call   4a99 <write>
    14e0:	83 c4 10             	add    $0x10,%esp
    14e3:	83 f8 0a             	cmp    $0xa,%eax
    14e6:	0f 85 d9 00 00 00    	jne    15c5 <writetest+0x145>
    14ec:	83 ec 04             	sub    $0x4,%esp
    14ef:	6a 0a                	push   $0xa
    14f1:	68 7f 4f 00 00       	push   $0x4f7f
    14f6:	56                   	push   %esi
    14f7:	e8 9d 35 00 00       	call   4a99 <write>
    14fc:	83 c4 10             	add    $0x10,%esp
    14ff:	83 f8 0a             	cmp    $0xa,%eax
    1502:	0f 85 d6 00 00 00    	jne    15de <writetest+0x15e>
    1508:	83 c3 01             	add    $0x1,%ebx
    150b:	83 fb 64             	cmp    $0x64,%ebx
    150e:	75 c0                	jne    14d0 <writetest+0x50>
    1510:	83 ec 08             	sub    $0x8,%esp
    1513:	68 8a 4f 00 00       	push   $0x4f8a
    1518:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    151e:	e8 dd 36 00 00       	call   4c00 <printf>
    1523:	89 34 24             	mov    %esi,(%esp)
    1526:	e8 76 35 00 00       	call   4aa1 <close>
    152b:	5b                   	pop    %ebx
    152c:	5e                   	pop    %esi
    152d:	6a 00                	push   $0x0
    152f:	68 37 4f 00 00       	push   $0x4f37
    1534:	e8 80 35 00 00       	call   4ab9 <open>
    1539:	83 c4 10             	add    $0x10,%esp
    153c:	85 c0                	test   %eax,%eax
    153e:	89 c3                	mov    %eax,%ebx
    1540:	0f 88 b1 00 00 00    	js     15f7 <writetest+0x177>
    1546:	83 ec 08             	sub    $0x8,%esp
    1549:	68 95 4f 00 00       	push   $0x4f95
    154e:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1554:	e8 a7 36 00 00       	call   4c00 <printf>
    1559:	83 c4 0c             	add    $0xc,%esp
    155c:	68 d0 07 00 00       	push   $0x7d0
    1561:	68 c0 96 00 00       	push   $0x96c0
    1566:	53                   	push   %ebx
    1567:	e8 25 35 00 00       	call   4a91 <read>
    156c:	83 c4 10             	add    $0x10,%esp
    156f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    1574:	0f 85 94 00 00 00    	jne    160e <writetest+0x18e>
    157a:	83 ec 08             	sub    $0x8,%esp
    157d:	68 c9 4f 00 00       	push   $0x4fc9
    1582:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1588:	e8 73 36 00 00       	call   4c00 <printf>
    158d:	89 1c 24             	mov    %ebx,(%esp)
    1590:	e8 0c 35 00 00       	call   4aa1 <close>
    1595:	c7 04 24 37 4f 00 00 	movl   $0x4f37,(%esp)
    159c:	e8 28 35 00 00       	call   4ac9 <unlink>
    15a1:	83 c4 10             	add    $0x10,%esp
    15a4:	85 c0                	test   %eax,%eax
    15a6:	78 7d                	js     1625 <writetest+0x1a5>
    15a8:	83 ec 08             	sub    $0x8,%esp
    15ab:	68 f1 4f 00 00       	push   $0x4ff1
    15b0:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    15b6:	e8 45 36 00 00       	call   4c00 <printf>
    15bb:	83 c4 10             	add    $0x10,%esp
    15be:	8d 65 f8             	lea    -0x8(%ebp),%esp
    15c1:	5b                   	pop    %ebx
    15c2:	5e                   	pop    %esi
    15c3:	5d                   	pop    %ebp
    15c4:	c3                   	ret    
    15c5:	83 ec 04             	sub    $0x4,%esp
    15c8:	53                   	push   %ebx
    15c9:	68 38 5e 00 00       	push   $0x5e38
    15ce:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    15d4:	e8 27 36 00 00       	call   4c00 <printf>
    15d9:	e8 9b 34 00 00       	call   4a79 <exit>
    15de:	83 ec 04             	sub    $0x4,%esp
    15e1:	53                   	push   %ebx
    15e2:	68 5c 5e 00 00       	push   $0x5e5c
    15e7:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    15ed:	e8 0e 36 00 00       	call   4c00 <printf>
    15f2:	e8 82 34 00 00       	call   4a79 <exit>
    15f7:	51                   	push   %ecx
    15f8:	51                   	push   %ecx
    15f9:	68 ae 4f 00 00       	push   $0x4fae
    15fe:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1604:	e8 f7 35 00 00       	call   4c00 <printf>
    1609:	e8 6b 34 00 00       	call   4a79 <exit>
    160e:	52                   	push   %edx
    160f:	52                   	push   %edx
    1610:	68 f5 52 00 00       	push   $0x52f5
    1615:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    161b:	e8 e0 35 00 00       	call   4c00 <printf>
    1620:	e8 54 34 00 00       	call   4a79 <exit>
    1625:	50                   	push   %eax
    1626:	50                   	push   %eax
    1627:	68 dc 4f 00 00       	push   $0x4fdc
    162c:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1632:	e8 c9 35 00 00       	call   4c00 <printf>
    1637:	e8 3d 34 00 00       	call   4a79 <exit>
    163c:	50                   	push   %eax
    163d:	50                   	push   %eax
    163e:	68 58 4f 00 00       	push   $0x4f58
    1643:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1649:	e8 b2 35 00 00       	call   4c00 <printf>
    164e:	e8 26 34 00 00       	call   4a79 <exit>
    1653:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001660 <writetest1>:
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	56                   	push   %esi
    1664:	53                   	push   %ebx
    1665:	83 ec 08             	sub    $0x8,%esp
    1668:	68 05 50 00 00       	push   $0x5005
    166d:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1673:	e8 88 35 00 00       	call   4c00 <printf>
    1678:	58                   	pop    %eax
    1679:	5a                   	pop    %edx
    167a:	68 02 02 00 00       	push   $0x202
    167f:	68 7f 50 00 00       	push   $0x507f
    1684:	e8 30 34 00 00       	call   4ab9 <open>
    1689:	83 c4 10             	add    $0x10,%esp
    168c:	85 c0                	test   %eax,%eax
    168e:	0f 88 61 01 00 00    	js     17f5 <writetest1+0x195>
    1694:	89 c6                	mov    %eax,%esi
    1696:	31 db                	xor    %ebx,%ebx
    1698:	90                   	nop
    1699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16a0:	83 ec 04             	sub    $0x4,%esp
    16a3:	89 1d c0 96 00 00    	mov    %ebx,0x96c0
    16a9:	68 00 02 00 00       	push   $0x200
    16ae:	68 c0 96 00 00       	push   $0x96c0
    16b3:	56                   	push   %esi
    16b4:	e8 e0 33 00 00       	call   4a99 <write>
    16b9:	83 c4 10             	add    $0x10,%esp
    16bc:	3d 00 02 00 00       	cmp    $0x200,%eax
    16c1:	0f 85 b3 00 00 00    	jne    177a <writetest1+0x11a>
    16c7:	83 c3 01             	add    $0x1,%ebx
    16ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
    16d0:	75 ce                	jne    16a0 <writetest1+0x40>
    16d2:	83 ec 0c             	sub    $0xc,%esp
    16d5:	56                   	push   %esi
    16d6:	e8 c6 33 00 00       	call   4aa1 <close>
    16db:	5b                   	pop    %ebx
    16dc:	5e                   	pop    %esi
    16dd:	6a 00                	push   $0x0
    16df:	68 7f 50 00 00       	push   $0x507f
    16e4:	e8 d0 33 00 00       	call   4ab9 <open>
    16e9:	83 c4 10             	add    $0x10,%esp
    16ec:	85 c0                	test   %eax,%eax
    16ee:	89 c6                	mov    %eax,%esi
    16f0:	0f 88 e8 00 00 00    	js     17de <writetest1+0x17e>
    16f6:	31 db                	xor    %ebx,%ebx
    16f8:	eb 1d                	jmp    1717 <writetest1+0xb7>
    16fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1700:	3d 00 02 00 00       	cmp    $0x200,%eax
    1705:	0f 85 9f 00 00 00    	jne    17aa <writetest1+0x14a>
    170b:	a1 c0 96 00 00       	mov    0x96c0,%eax
    1710:	39 d8                	cmp    %ebx,%eax
    1712:	75 7f                	jne    1793 <writetest1+0x133>
    1714:	83 c3 01             	add    $0x1,%ebx
    1717:	83 ec 04             	sub    $0x4,%esp
    171a:	68 00 02 00 00       	push   $0x200
    171f:	68 c0 96 00 00       	push   $0x96c0
    1724:	56                   	push   %esi
    1725:	e8 67 33 00 00       	call   4a91 <read>
    172a:	83 c4 10             	add    $0x10,%esp
    172d:	85 c0                	test   %eax,%eax
    172f:	75 cf                	jne    1700 <writetest1+0xa0>
    1731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
    1737:	0f 84 86 00 00 00    	je     17c3 <writetest1+0x163>
    173d:	83 ec 0c             	sub    $0xc,%esp
    1740:	56                   	push   %esi
    1741:	e8 5b 33 00 00       	call   4aa1 <close>
    1746:	c7 04 24 7f 50 00 00 	movl   $0x507f,(%esp)
    174d:	e8 77 33 00 00       	call   4ac9 <unlink>
    1752:	83 c4 10             	add    $0x10,%esp
    1755:	85 c0                	test   %eax,%eax
    1757:	0f 88 af 00 00 00    	js     180c <writetest1+0x1ac>
    175d:	83 ec 08             	sub    $0x8,%esp
    1760:	68 a6 50 00 00       	push   $0x50a6
    1765:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    176b:	e8 90 34 00 00       	call   4c00 <printf>
    1770:	83 c4 10             	add    $0x10,%esp
    1773:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1776:	5b                   	pop    %ebx
    1777:	5e                   	pop    %esi
    1778:	5d                   	pop    %ebp
    1779:	c3                   	ret    
    177a:	83 ec 04             	sub    $0x4,%esp
    177d:	53                   	push   %ebx
    177e:	68 2f 50 00 00       	push   $0x502f
    1783:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1789:	e8 72 34 00 00       	call   4c00 <printf>
    178e:	e8 e6 32 00 00       	call   4a79 <exit>
    1793:	50                   	push   %eax
    1794:	53                   	push   %ebx
    1795:	68 80 5e 00 00       	push   $0x5e80
    179a:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    17a0:	e8 5b 34 00 00       	call   4c00 <printf>
    17a5:	e8 cf 32 00 00       	call   4a79 <exit>
    17aa:	83 ec 04             	sub    $0x4,%esp
    17ad:	50                   	push   %eax
    17ae:	68 83 50 00 00       	push   $0x5083
    17b3:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    17b9:	e8 42 34 00 00       	call   4c00 <printf>
    17be:	e8 b6 32 00 00       	call   4a79 <exit>
    17c3:	52                   	push   %edx
    17c4:	68 8b 00 00 00       	push   $0x8b
    17c9:	68 66 50 00 00       	push   $0x5066
    17ce:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    17d4:	e8 27 34 00 00       	call   4c00 <printf>
    17d9:	e8 9b 32 00 00       	call   4a79 <exit>
    17de:	51                   	push   %ecx
    17df:	51                   	push   %ecx
    17e0:	68 4d 50 00 00       	push   $0x504d
    17e5:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    17eb:	e8 10 34 00 00       	call   4c00 <printf>
    17f0:	e8 84 32 00 00       	call   4a79 <exit>
    17f5:	50                   	push   %eax
    17f6:	50                   	push   %eax
    17f7:	68 15 50 00 00       	push   $0x5015
    17fc:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1802:	e8 f9 33 00 00       	call   4c00 <printf>
    1807:	e8 6d 32 00 00       	call   4a79 <exit>
    180c:	50                   	push   %eax
    180d:	50                   	push   %eax
    180e:	68 93 50 00 00       	push   $0x5093
    1813:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1819:	e8 e2 33 00 00       	call   4c00 <printf>
    181e:	e8 56 32 00 00       	call   4a79 <exit>
    1823:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001830 <createtest>:
    1830:	55                   	push   %ebp
    1831:	89 e5                	mov    %esp,%ebp
    1833:	53                   	push   %ebx
    1834:	bb 30 00 00 00       	mov    $0x30,%ebx
    1839:	83 ec 0c             	sub    $0xc,%esp
    183c:	68 a0 5e 00 00       	push   $0x5ea0
    1841:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1847:	e8 b4 33 00 00       	call   4c00 <printf>
    184c:	c6 05 c0 b6 00 00 61 	movb   $0x61,0xb6c0
    1853:	c6 05 c2 b6 00 00 00 	movb   $0x0,0xb6c2
    185a:	83 c4 10             	add    $0x10,%esp
    185d:	8d 76 00             	lea    0x0(%esi),%esi
    1860:	83 ec 08             	sub    $0x8,%esp
    1863:	88 1d c1 b6 00 00    	mov    %bl,0xb6c1
    1869:	83 c3 01             	add    $0x1,%ebx
    186c:	68 02 02 00 00       	push   $0x202
    1871:	68 c0 b6 00 00       	push   $0xb6c0
    1876:	e8 3e 32 00 00       	call   4ab9 <open>
    187b:	89 04 24             	mov    %eax,(%esp)
    187e:	e8 1e 32 00 00       	call   4aa1 <close>
    1883:	83 c4 10             	add    $0x10,%esp
    1886:	80 fb 64             	cmp    $0x64,%bl
    1889:	75 d5                	jne    1860 <createtest+0x30>
    188b:	c6 05 c0 b6 00 00 61 	movb   $0x61,0xb6c0
    1892:	c6 05 c2 b6 00 00 00 	movb   $0x0,0xb6c2
    1899:	bb 30 00 00 00       	mov    $0x30,%ebx
    189e:	66 90                	xchg   %ax,%ax
    18a0:	83 ec 0c             	sub    $0xc,%esp
    18a3:	88 1d c1 b6 00 00    	mov    %bl,0xb6c1
    18a9:	83 c3 01             	add    $0x1,%ebx
    18ac:	68 c0 b6 00 00       	push   $0xb6c0
    18b1:	e8 13 32 00 00       	call   4ac9 <unlink>
    18b6:	83 c4 10             	add    $0x10,%esp
    18b9:	80 fb 64             	cmp    $0x64,%bl
    18bc:	75 e2                	jne    18a0 <createtest+0x70>
    18be:	83 ec 08             	sub    $0x8,%esp
    18c1:	68 c8 5e 00 00       	push   $0x5ec8
    18c6:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    18cc:	e8 2f 33 00 00       	call   4c00 <printf>
    18d1:	83 c4 10             	add    $0x10,%esp
    18d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    18d7:	c9                   	leave  
    18d8:	c3                   	ret    
    18d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000018e0 <dirtest>:
    18e0:	55                   	push   %ebp
    18e1:	89 e5                	mov    %esp,%ebp
    18e3:	83 ec 10             	sub    $0x10,%esp
    18e6:	68 b4 50 00 00       	push   $0x50b4
    18eb:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    18f1:	e8 0a 33 00 00       	call   4c00 <printf>
    18f6:	c7 04 24 c0 50 00 00 	movl   $0x50c0,(%esp)
    18fd:	e8 df 31 00 00       	call   4ae1 <mkdir>
    1902:	83 c4 10             	add    $0x10,%esp
    1905:	85 c0                	test   %eax,%eax
    1907:	78 58                	js     1961 <dirtest+0x81>
    1909:	83 ec 0c             	sub    $0xc,%esp
    190c:	68 c0 50 00 00       	push   $0x50c0
    1911:	e8 d3 31 00 00       	call   4ae9 <chdir>
    1916:	83 c4 10             	add    $0x10,%esp
    1919:	85 c0                	test   %eax,%eax
    191b:	0f 88 85 00 00 00    	js     19a6 <dirtest+0xc6>
    1921:	83 ec 0c             	sub    $0xc,%esp
    1924:	68 65 56 00 00       	push   $0x5665
    1929:	e8 bb 31 00 00       	call   4ae9 <chdir>
    192e:	83 c4 10             	add    $0x10,%esp
    1931:	85 c0                	test   %eax,%eax
    1933:	78 5a                	js     198f <dirtest+0xaf>
    1935:	83 ec 0c             	sub    $0xc,%esp
    1938:	68 c0 50 00 00       	push   $0x50c0
    193d:	e8 87 31 00 00       	call   4ac9 <unlink>
    1942:	83 c4 10             	add    $0x10,%esp
    1945:	85 c0                	test   %eax,%eax
    1947:	78 2f                	js     1978 <dirtest+0x98>
    1949:	83 ec 08             	sub    $0x8,%esp
    194c:	68 fd 50 00 00       	push   $0x50fd
    1951:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1957:	e8 a4 32 00 00       	call   4c00 <printf>
    195c:	83 c4 10             	add    $0x10,%esp
    195f:	c9                   	leave  
    1960:	c3                   	ret    
    1961:	50                   	push   %eax
    1962:	50                   	push   %eax
    1963:	68 f0 4d 00 00       	push   $0x4df0
    1968:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    196e:	e8 8d 32 00 00       	call   4c00 <printf>
    1973:	e8 01 31 00 00       	call   4a79 <exit>
    1978:	50                   	push   %eax
    1979:	50                   	push   %eax
    197a:	68 e9 50 00 00       	push   $0x50e9
    197f:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    1985:	e8 76 32 00 00       	call   4c00 <printf>
    198a:	e8 ea 30 00 00       	call   4a79 <exit>
    198f:	52                   	push   %edx
    1990:	52                   	push   %edx
    1991:	68 d8 50 00 00       	push   $0x50d8
    1996:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    199c:	e8 5f 32 00 00       	call   4c00 <printf>
    19a1:	e8 d3 30 00 00       	call   4a79 <exit>
    19a6:	51                   	push   %ecx
    19a7:	51                   	push   %ecx
    19a8:	68 c5 50 00 00       	push   $0x50c5
    19ad:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    19b3:	e8 48 32 00 00       	call   4c00 <printf>
    19b8:	e8 bc 30 00 00       	call   4a79 <exit>
    19bd:	8d 76 00             	lea    0x0(%esi),%esi

000019c0 <exectest>:
    19c0:	55                   	push   %ebp
    19c1:	89 e5                	mov    %esp,%ebp
    19c3:	83 ec 10             	sub    $0x10,%esp
    19c6:	68 0c 51 00 00       	push   $0x510c
    19cb:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    19d1:	e8 2a 32 00 00       	call   4c00 <printf>
    19d6:	5a                   	pop    %edx
    19d7:	59                   	pop    %ecx
    19d8:	68 e4 6e 00 00       	push   $0x6ee4
    19dd:	68 d5 4e 00 00       	push   $0x4ed5
    19e2:	e8 ca 30 00 00       	call   4ab1 <exec>
    19e7:	83 c4 10             	add    $0x10,%esp
    19ea:	85 c0                	test   %eax,%eax
    19ec:	78 02                	js     19f0 <exectest+0x30>
    19ee:	c9                   	leave  
    19ef:	c3                   	ret    
    19f0:	50                   	push   %eax
    19f1:	50                   	push   %eax
    19f2:	68 17 51 00 00       	push   $0x5117
    19f7:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    19fd:	e8 fe 31 00 00       	call   4c00 <printf>
    1a02:	e8 72 30 00 00       	call   4a79 <exit>
    1a07:	89 f6                	mov    %esi,%esi
    1a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001a10 <pipe1>:
    1a10:	55                   	push   %ebp
    1a11:	89 e5                	mov    %esp,%ebp
    1a13:	57                   	push   %edi
    1a14:	56                   	push   %esi
    1a15:	53                   	push   %ebx
    1a16:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1a19:	83 ec 38             	sub    $0x38,%esp
    1a1c:	50                   	push   %eax
    1a1d:	e8 67 30 00 00       	call   4a89 <pipe>
    1a22:	83 c4 10             	add    $0x10,%esp
    1a25:	85 c0                	test   %eax,%eax
    1a27:	0f 85 3e 01 00 00    	jne    1b6b <pipe1+0x15b>
    1a2d:	89 c3                	mov    %eax,%ebx
    1a2f:	e8 3d 30 00 00       	call   4a71 <fork>
    1a34:	83 f8 00             	cmp    $0x0,%eax
    1a37:	0f 84 84 00 00 00    	je     1ac1 <pipe1+0xb1>
    1a3d:	0f 8e 3b 01 00 00    	jle    1b7e <pipe1+0x16e>
    1a43:	83 ec 0c             	sub    $0xc,%esp
    1a46:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a49:	bf 01 00 00 00       	mov    $0x1,%edi
    1a4e:	e8 4e 30 00 00       	call   4aa1 <close>
    1a53:	83 c4 10             	add    $0x10,%esp
    1a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1a5d:	83 ec 04             	sub    $0x4,%esp
    1a60:	57                   	push   %edi
    1a61:	68 c0 96 00 00       	push   $0x96c0
    1a66:	ff 75 e0             	pushl  -0x20(%ebp)
    1a69:	e8 23 30 00 00       	call   4a91 <read>
    1a6e:	83 c4 10             	add    $0x10,%esp
    1a71:	85 c0                	test   %eax,%eax
    1a73:	0f 8e ab 00 00 00    	jle    1b24 <pipe1+0x114>
    1a79:	89 d9                	mov    %ebx,%ecx
    1a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
    1a7e:	f7 d9                	neg    %ecx
    1a80:	38 9c 0b c0 96 00 00 	cmp    %bl,0x96c0(%ebx,%ecx,1)
    1a87:	8d 53 01             	lea    0x1(%ebx),%edx
    1a8a:	75 1b                	jne    1aa7 <pipe1+0x97>
    1a8c:	39 f2                	cmp    %esi,%edx
    1a8e:	89 d3                	mov    %edx,%ebx
    1a90:	75 ee                	jne    1a80 <pipe1+0x70>
    1a92:	01 ff                	add    %edi,%edi
    1a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
    1a97:	b8 00 20 00 00       	mov    $0x2000,%eax
    1a9c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
    1aa2:	0f 4f f8             	cmovg  %eax,%edi
    1aa5:	eb b6                	jmp    1a5d <pipe1+0x4d>
    1aa7:	83 ec 08             	sub    $0x8,%esp
    1aaa:	68 46 51 00 00       	push   $0x5146
    1aaf:	6a 01                	push   $0x1
    1ab1:	e8 4a 31 00 00       	call   4c00 <printf>
    1ab6:	83 c4 10             	add    $0x10,%esp
    1ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1abc:	5b                   	pop    %ebx
    1abd:	5e                   	pop    %esi
    1abe:	5f                   	pop    %edi
    1abf:	5d                   	pop    %ebp
    1ac0:	c3                   	ret    
    1ac1:	83 ec 0c             	sub    $0xc,%esp
    1ac4:	ff 75 e0             	pushl  -0x20(%ebp)
    1ac7:	31 db                	xor    %ebx,%ebx
    1ac9:	be 09 04 00 00       	mov    $0x409,%esi
    1ace:	e8 ce 2f 00 00       	call   4aa1 <close>
    1ad3:	83 c4 10             	add    $0x10,%esp
    1ad6:	89 d8                	mov    %ebx,%eax
    1ad8:	89 f2                	mov    %esi,%edx
    1ada:	f7 d8                	neg    %eax
    1adc:	29 da                	sub    %ebx,%edx
    1ade:	66 90                	xchg   %ax,%ax
    1ae0:	88 84 03 c0 96 00 00 	mov    %al,0x96c0(%ebx,%eax,1)
    1ae7:	83 c0 01             	add    $0x1,%eax
    1aea:	39 d0                	cmp    %edx,%eax
    1aec:	75 f2                	jne    1ae0 <pipe1+0xd0>
    1aee:	83 ec 04             	sub    $0x4,%esp
    1af1:	68 09 04 00 00       	push   $0x409
    1af6:	68 c0 96 00 00       	push   $0x96c0
    1afb:	ff 75 e4             	pushl  -0x1c(%ebp)
    1afe:	e8 96 2f 00 00       	call   4a99 <write>
    1b03:	83 c4 10             	add    $0x10,%esp
    1b06:	3d 09 04 00 00       	cmp    $0x409,%eax
    1b0b:	0f 85 80 00 00 00    	jne    1b91 <pipe1+0x181>
    1b11:	81 eb 09 04 00 00    	sub    $0x409,%ebx
    1b17:	81 fb d3 eb ff ff    	cmp    $0xffffebd3,%ebx
    1b1d:	75 b7                	jne    1ad6 <pipe1+0xc6>
    1b1f:	e8 55 2f 00 00       	call   4a79 <exit>
    1b24:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
    1b2b:	75 29                	jne    1b56 <pipe1+0x146>
    1b2d:	83 ec 0c             	sub    $0xc,%esp
    1b30:	ff 75 e0             	pushl  -0x20(%ebp)
    1b33:	e8 69 2f 00 00       	call   4aa1 <close>
    1b38:	e8 44 2f 00 00       	call   4a81 <wait>
    1b3d:	5a                   	pop    %edx
    1b3e:	59                   	pop    %ecx
    1b3f:	68 6b 51 00 00       	push   $0x516b
    1b44:	6a 01                	push   $0x1
    1b46:	e8 b5 30 00 00       	call   4c00 <printf>
    1b4b:	83 c4 10             	add    $0x10,%esp
    1b4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b51:	5b                   	pop    %ebx
    1b52:	5e                   	pop    %esi
    1b53:	5f                   	pop    %edi
    1b54:	5d                   	pop    %ebp
    1b55:	c3                   	ret    
    1b56:	53                   	push   %ebx
    1b57:	ff 75 d4             	pushl  -0x2c(%ebp)
    1b5a:	68 54 51 00 00       	push   $0x5154
    1b5f:	6a 01                	push   $0x1
    1b61:	e8 9a 30 00 00       	call   4c00 <printf>
    1b66:	e8 0e 2f 00 00       	call   4a79 <exit>
    1b6b:	57                   	push   %edi
    1b6c:	57                   	push   %edi
    1b6d:	68 29 51 00 00       	push   $0x5129
    1b72:	6a 01                	push   $0x1
    1b74:	e8 87 30 00 00       	call   4c00 <printf>
    1b79:	e8 fb 2e 00 00       	call   4a79 <exit>
    1b7e:	50                   	push   %eax
    1b7f:	50                   	push   %eax
    1b80:	68 75 51 00 00       	push   $0x5175
    1b85:	6a 01                	push   $0x1
    1b87:	e8 74 30 00 00       	call   4c00 <printf>
    1b8c:	e8 e8 2e 00 00       	call   4a79 <exit>
    1b91:	56                   	push   %esi
    1b92:	56                   	push   %esi
    1b93:	68 38 51 00 00       	push   $0x5138
    1b98:	6a 01                	push   $0x1
    1b9a:	e8 61 30 00 00       	call   4c00 <printf>
    1b9f:	e8 d5 2e 00 00       	call   4a79 <exit>
    1ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001bb0 <preempt>:
    1bb0:	55                   	push   %ebp
    1bb1:	89 e5                	mov    %esp,%ebp
    1bb3:	57                   	push   %edi
    1bb4:	56                   	push   %esi
    1bb5:	53                   	push   %ebx
    1bb6:	83 ec 24             	sub    $0x24,%esp
    1bb9:	68 84 51 00 00       	push   $0x5184
    1bbe:	6a 01                	push   $0x1
    1bc0:	e8 3b 30 00 00       	call   4c00 <printf>
    1bc5:	e8 a7 2e 00 00       	call   4a71 <fork>
    1bca:	83 c4 10             	add    $0x10,%esp
    1bcd:	85 c0                	test   %eax,%eax
    1bcf:	75 02                	jne    1bd3 <preempt+0x23>
    1bd1:	eb fe                	jmp    1bd1 <preempt+0x21>
    1bd3:	89 c7                	mov    %eax,%edi
    1bd5:	e8 97 2e 00 00       	call   4a71 <fork>
    1bda:	85 c0                	test   %eax,%eax
    1bdc:	89 c6                	mov    %eax,%esi
    1bde:	75 02                	jne    1be2 <preempt+0x32>
    1be0:	eb fe                	jmp    1be0 <preempt+0x30>
    1be2:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1be5:	83 ec 0c             	sub    $0xc,%esp
    1be8:	50                   	push   %eax
    1be9:	e8 9b 2e 00 00       	call   4a89 <pipe>
    1bee:	e8 7e 2e 00 00       	call   4a71 <fork>
    1bf3:	83 c4 10             	add    $0x10,%esp
    1bf6:	85 c0                	test   %eax,%eax
    1bf8:	89 c3                	mov    %eax,%ebx
    1bfa:	75 46                	jne    1c42 <preempt+0x92>
    1bfc:	83 ec 0c             	sub    $0xc,%esp
    1bff:	ff 75 e0             	pushl  -0x20(%ebp)
    1c02:	e8 9a 2e 00 00       	call   4aa1 <close>
    1c07:	83 c4 0c             	add    $0xc,%esp
    1c0a:	6a 01                	push   $0x1
    1c0c:	68 49 57 00 00       	push   $0x5749
    1c11:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c14:	e8 80 2e 00 00       	call   4a99 <write>
    1c19:	83 c4 10             	add    $0x10,%esp
    1c1c:	83 e8 01             	sub    $0x1,%eax
    1c1f:	74 11                	je     1c32 <preempt+0x82>
    1c21:	50                   	push   %eax
    1c22:	50                   	push   %eax
    1c23:	68 8e 51 00 00       	push   $0x518e
    1c28:	6a 01                	push   $0x1
    1c2a:	e8 d1 2f 00 00       	call   4c00 <printf>
    1c2f:	83 c4 10             	add    $0x10,%esp
    1c32:	83 ec 0c             	sub    $0xc,%esp
    1c35:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c38:	e8 64 2e 00 00       	call   4aa1 <close>
    1c3d:	83 c4 10             	add    $0x10,%esp
    1c40:	eb fe                	jmp    1c40 <preempt+0x90>
    1c42:	83 ec 0c             	sub    $0xc,%esp
    1c45:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c48:	e8 54 2e 00 00       	call   4aa1 <close>
    1c4d:	83 c4 0c             	add    $0xc,%esp
    1c50:	68 00 20 00 00       	push   $0x2000
    1c55:	68 c0 96 00 00       	push   $0x96c0
    1c5a:	ff 75 e0             	pushl  -0x20(%ebp)
    1c5d:	e8 2f 2e 00 00       	call   4a91 <read>
    1c62:	83 c4 10             	add    $0x10,%esp
    1c65:	83 e8 01             	sub    $0x1,%eax
    1c68:	74 19                	je     1c83 <preempt+0xd3>
    1c6a:	50                   	push   %eax
    1c6b:	50                   	push   %eax
    1c6c:	68 a2 51 00 00       	push   $0x51a2
    1c71:	6a 01                	push   $0x1
    1c73:	e8 88 2f 00 00       	call   4c00 <printf>
    1c78:	83 c4 10             	add    $0x10,%esp
    1c7b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c7e:	5b                   	pop    %ebx
    1c7f:	5e                   	pop    %esi
    1c80:	5f                   	pop    %edi
    1c81:	5d                   	pop    %ebp
    1c82:	c3                   	ret    
    1c83:	83 ec 0c             	sub    $0xc,%esp
    1c86:	ff 75 e0             	pushl  -0x20(%ebp)
    1c89:	e8 13 2e 00 00       	call   4aa1 <close>
    1c8e:	58                   	pop    %eax
    1c8f:	5a                   	pop    %edx
    1c90:	68 b5 51 00 00       	push   $0x51b5
    1c95:	6a 01                	push   $0x1
    1c97:	e8 64 2f 00 00       	call   4c00 <printf>
    1c9c:	89 3c 24             	mov    %edi,(%esp)
    1c9f:	e8 05 2e 00 00       	call   4aa9 <kill>
    1ca4:	89 34 24             	mov    %esi,(%esp)
    1ca7:	e8 fd 2d 00 00       	call   4aa9 <kill>
    1cac:	89 1c 24             	mov    %ebx,(%esp)
    1caf:	e8 f5 2d 00 00       	call   4aa9 <kill>
    1cb4:	59                   	pop    %ecx
    1cb5:	5b                   	pop    %ebx
    1cb6:	68 be 51 00 00       	push   $0x51be
    1cbb:	6a 01                	push   $0x1
    1cbd:	e8 3e 2f 00 00       	call   4c00 <printf>
    1cc2:	e8 ba 2d 00 00       	call   4a81 <wait>
    1cc7:	e8 b5 2d 00 00       	call   4a81 <wait>
    1ccc:	e8 b0 2d 00 00       	call   4a81 <wait>
    1cd1:	5e                   	pop    %esi
    1cd2:	5f                   	pop    %edi
    1cd3:	68 c7 51 00 00       	push   $0x51c7
    1cd8:	6a 01                	push   $0x1
    1cda:	e8 21 2f 00 00       	call   4c00 <printf>
    1cdf:	83 c4 10             	add    $0x10,%esp
    1ce2:	eb 97                	jmp    1c7b <preempt+0xcb>
    1ce4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1cea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001cf0 <exitwait>:
    1cf0:	55                   	push   %ebp
    1cf1:	89 e5                	mov    %esp,%ebp
    1cf3:	56                   	push   %esi
    1cf4:	be 64 00 00 00       	mov    $0x64,%esi
    1cf9:	53                   	push   %ebx
    1cfa:	eb 14                	jmp    1d10 <exitwait+0x20>
    1cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1d00:	74 6f                	je     1d71 <exitwait+0x81>
    1d02:	e8 7a 2d 00 00       	call   4a81 <wait>
    1d07:	39 d8                	cmp    %ebx,%eax
    1d09:	75 2d                	jne    1d38 <exitwait+0x48>
    1d0b:	83 ee 01             	sub    $0x1,%esi
    1d0e:	74 48                	je     1d58 <exitwait+0x68>
    1d10:	e8 5c 2d 00 00       	call   4a71 <fork>
    1d15:	85 c0                	test   %eax,%eax
    1d17:	89 c3                	mov    %eax,%ebx
    1d19:	79 e5                	jns    1d00 <exitwait+0x10>
    1d1b:	83 ec 08             	sub    $0x8,%esp
    1d1e:	68 31 5d 00 00       	push   $0x5d31
    1d23:	6a 01                	push   $0x1
    1d25:	e8 d6 2e 00 00       	call   4c00 <printf>
    1d2a:	83 c4 10             	add    $0x10,%esp
    1d2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d30:	5b                   	pop    %ebx
    1d31:	5e                   	pop    %esi
    1d32:	5d                   	pop    %ebp
    1d33:	c3                   	ret    
    1d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1d38:	83 ec 08             	sub    $0x8,%esp
    1d3b:	68 d3 51 00 00       	push   $0x51d3
    1d40:	6a 01                	push   $0x1
    1d42:	e8 b9 2e 00 00       	call   4c00 <printf>
    1d47:	83 c4 10             	add    $0x10,%esp
    1d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d4d:	5b                   	pop    %ebx
    1d4e:	5e                   	pop    %esi
    1d4f:	5d                   	pop    %ebp
    1d50:	c3                   	ret    
    1d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1d58:	83 ec 08             	sub    $0x8,%esp
    1d5b:	68 e3 51 00 00       	push   $0x51e3
    1d60:	6a 01                	push   $0x1
    1d62:	e8 99 2e 00 00       	call   4c00 <printf>
    1d67:	83 c4 10             	add    $0x10,%esp
    1d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d6d:	5b                   	pop    %ebx
    1d6e:	5e                   	pop    %esi
    1d6f:	5d                   	pop    %ebp
    1d70:	c3                   	ret    
    1d71:	e8 03 2d 00 00       	call   4a79 <exit>
    1d76:	8d 76 00             	lea    0x0(%esi),%esi
    1d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001d80 <mem>:
    1d80:	55                   	push   %ebp
    1d81:	89 e5                	mov    %esp,%ebp
    1d83:	57                   	push   %edi
    1d84:	56                   	push   %esi
    1d85:	53                   	push   %ebx
    1d86:	31 db                	xor    %ebx,%ebx
    1d88:	83 ec 14             	sub    $0x14,%esp
    1d8b:	68 f0 51 00 00       	push   $0x51f0
    1d90:	6a 01                	push   $0x1
    1d92:	e8 69 2e 00 00       	call   4c00 <printf>
    1d97:	e8 5d 2d 00 00       	call   4af9 <getpid>
    1d9c:	89 c6                	mov    %eax,%esi
    1d9e:	e8 ce 2c 00 00       	call   4a71 <fork>
    1da3:	83 c4 10             	add    $0x10,%esp
    1da6:	85 c0                	test   %eax,%eax
    1da8:	74 0a                	je     1db4 <mem+0x34>
    1daa:	e9 89 00 00 00       	jmp    1e38 <mem+0xb8>
    1daf:	90                   	nop
    1db0:	89 18                	mov    %ebx,(%eax)
    1db2:	89 c3                	mov    %eax,%ebx
    1db4:	83 ec 0c             	sub    $0xc,%esp
    1db7:	68 11 27 00 00       	push   $0x2711
    1dbc:	e8 8f 2b 00 00       	call   4950 <malloc>
    1dc1:	83 c4 10             	add    $0x10,%esp
    1dc4:	85 c0                	test   %eax,%eax
    1dc6:	75 e8                	jne    1db0 <mem+0x30>
    1dc8:	85 db                	test   %ebx,%ebx
    1dca:	74 18                	je     1de4 <mem+0x64>
    1dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1dd0:	8b 3b                	mov    (%ebx),%edi
    1dd2:	83 ec 0c             	sub    $0xc,%esp
    1dd5:	53                   	push   %ebx
    1dd6:	89 fb                	mov    %edi,%ebx
    1dd8:	e8 e3 2a 00 00       	call   48c0 <free>
    1ddd:	83 c4 10             	add    $0x10,%esp
    1de0:	85 db                	test   %ebx,%ebx
    1de2:	75 ec                	jne    1dd0 <mem+0x50>
    1de4:	83 ec 0c             	sub    $0xc,%esp
    1de7:	68 00 50 00 00       	push   $0x5000
    1dec:	e8 5f 2b 00 00       	call   4950 <malloc>
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	85 c0                	test   %eax,%eax
    1df6:	74 20                	je     1e18 <mem+0x98>
    1df8:	83 ec 0c             	sub    $0xc,%esp
    1dfb:	50                   	push   %eax
    1dfc:	e8 bf 2a 00 00       	call   48c0 <free>
    1e01:	58                   	pop    %eax
    1e02:	5a                   	pop    %edx
    1e03:	68 14 52 00 00       	push   $0x5214
    1e08:	6a 01                	push   $0x1
    1e0a:	e8 f1 2d 00 00       	call   4c00 <printf>
    1e0f:	e8 65 2c 00 00       	call   4a79 <exit>
    1e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1e18:	83 ec 08             	sub    $0x8,%esp
    1e1b:	68 fa 51 00 00       	push   $0x51fa
    1e20:	6a 01                	push   $0x1
    1e22:	e8 d9 2d 00 00       	call   4c00 <printf>
    1e27:	89 34 24             	mov    %esi,(%esp)
    1e2a:	e8 7a 2c 00 00       	call   4aa9 <kill>
    1e2f:	e8 45 2c 00 00       	call   4a79 <exit>
    1e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1e38:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1e3b:	5b                   	pop    %ebx
    1e3c:	5e                   	pop    %esi
    1e3d:	5f                   	pop    %edi
    1e3e:	5d                   	pop    %ebp
    1e3f:	e9 3d 2c 00 00       	jmp    4a81 <wait>
    1e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001e50 <sharedfd>:
    1e50:	55                   	push   %ebp
    1e51:	89 e5                	mov    %esp,%ebp
    1e53:	57                   	push   %edi
    1e54:	56                   	push   %esi
    1e55:	53                   	push   %ebx
    1e56:	83 ec 34             	sub    $0x34,%esp
    1e59:	68 1c 52 00 00       	push   $0x521c
    1e5e:	6a 01                	push   $0x1
    1e60:	e8 9b 2d 00 00       	call   4c00 <printf>
    1e65:	c7 04 24 2b 52 00 00 	movl   $0x522b,(%esp)
    1e6c:	e8 58 2c 00 00       	call   4ac9 <unlink>
    1e71:	59                   	pop    %ecx
    1e72:	5b                   	pop    %ebx
    1e73:	68 02 02 00 00       	push   $0x202
    1e78:	68 2b 52 00 00       	push   $0x522b
    1e7d:	e8 37 2c 00 00       	call   4ab9 <open>
    1e82:	83 c4 10             	add    $0x10,%esp
    1e85:	85 c0                	test   %eax,%eax
    1e87:	0f 88 33 01 00 00    	js     1fc0 <sharedfd+0x170>
    1e8d:	89 c6                	mov    %eax,%esi
    1e8f:	bb e8 03 00 00       	mov    $0x3e8,%ebx
    1e94:	e8 d8 2b 00 00       	call   4a71 <fork>
    1e99:	83 f8 01             	cmp    $0x1,%eax
    1e9c:	89 c7                	mov    %eax,%edi
    1e9e:	19 c0                	sbb    %eax,%eax
    1ea0:	83 ec 04             	sub    $0x4,%esp
    1ea3:	83 e0 f3             	and    $0xfffffff3,%eax
    1ea6:	6a 0a                	push   $0xa
    1ea8:	83 c0 70             	add    $0x70,%eax
    1eab:	50                   	push   %eax
    1eac:	8d 45 de             	lea    -0x22(%ebp),%eax
    1eaf:	50                   	push   %eax
    1eb0:	e8 4b 28 00 00       	call   4700 <memset>
    1eb5:	83 c4 10             	add    $0x10,%esp
    1eb8:	eb 0b                	jmp    1ec5 <sharedfd+0x75>
    1eba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ec0:	83 eb 01             	sub    $0x1,%ebx
    1ec3:	74 29                	je     1eee <sharedfd+0x9e>
    1ec5:	8d 45 de             	lea    -0x22(%ebp),%eax
    1ec8:	83 ec 04             	sub    $0x4,%esp
    1ecb:	6a 0a                	push   $0xa
    1ecd:	50                   	push   %eax
    1ece:	56                   	push   %esi
    1ecf:	e8 c5 2b 00 00       	call   4a99 <write>
    1ed4:	83 c4 10             	add    $0x10,%esp
    1ed7:	83 f8 0a             	cmp    $0xa,%eax
    1eda:	74 e4                	je     1ec0 <sharedfd+0x70>
    1edc:	83 ec 08             	sub    $0x8,%esp
    1edf:	68 1c 5f 00 00       	push   $0x5f1c
    1ee4:	6a 01                	push   $0x1
    1ee6:	e8 15 2d 00 00       	call   4c00 <printf>
    1eeb:	83 c4 10             	add    $0x10,%esp
    1eee:	85 ff                	test   %edi,%edi
    1ef0:	0f 84 fe 00 00 00    	je     1ff4 <sharedfd+0x1a4>
    1ef6:	e8 86 2b 00 00       	call   4a81 <wait>
    1efb:	83 ec 0c             	sub    $0xc,%esp
    1efe:	31 db                	xor    %ebx,%ebx
    1f00:	31 ff                	xor    %edi,%edi
    1f02:	56                   	push   %esi
    1f03:	8d 75 e8             	lea    -0x18(%ebp),%esi
    1f06:	e8 96 2b 00 00       	call   4aa1 <close>
    1f0b:	58                   	pop    %eax
    1f0c:	5a                   	pop    %edx
    1f0d:	6a 00                	push   $0x0
    1f0f:	68 2b 52 00 00       	push   $0x522b
    1f14:	e8 a0 2b 00 00       	call   4ab9 <open>
    1f19:	83 c4 10             	add    $0x10,%esp
    1f1c:	85 c0                	test   %eax,%eax
    1f1e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1f21:	0f 88 b3 00 00 00    	js     1fda <sharedfd+0x18a>
    1f27:	89 f8                	mov    %edi,%eax
    1f29:	89 df                	mov    %ebx,%edi
    1f2b:	89 c3                	mov    %eax,%ebx
    1f2d:	8d 76 00             	lea    0x0(%esi),%esi
    1f30:	8d 45 de             	lea    -0x22(%ebp),%eax
    1f33:	83 ec 04             	sub    $0x4,%esp
    1f36:	6a 0a                	push   $0xa
    1f38:	50                   	push   %eax
    1f39:	ff 75 d4             	pushl  -0x2c(%ebp)
    1f3c:	e8 50 2b 00 00       	call   4a91 <read>
    1f41:	83 c4 10             	add    $0x10,%esp
    1f44:	85 c0                	test   %eax,%eax
    1f46:	7e 28                	jle    1f70 <sharedfd+0x120>
    1f48:	8d 45 de             	lea    -0x22(%ebp),%eax
    1f4b:	eb 15                	jmp    1f62 <sharedfd+0x112>
    1f4d:	8d 76 00             	lea    0x0(%esi),%esi
    1f50:	80 fa 70             	cmp    $0x70,%dl
    1f53:	0f 94 c2             	sete   %dl
    1f56:	0f b6 d2             	movzbl %dl,%edx
    1f59:	01 d7                	add    %edx,%edi
    1f5b:	83 c0 01             	add    $0x1,%eax
    1f5e:	39 f0                	cmp    %esi,%eax
    1f60:	74 ce                	je     1f30 <sharedfd+0xe0>
    1f62:	0f b6 10             	movzbl (%eax),%edx
    1f65:	80 fa 63             	cmp    $0x63,%dl
    1f68:	75 e6                	jne    1f50 <sharedfd+0x100>
    1f6a:	83 c3 01             	add    $0x1,%ebx
    1f6d:	eb ec                	jmp    1f5b <sharedfd+0x10b>
    1f6f:	90                   	nop
    1f70:	83 ec 0c             	sub    $0xc,%esp
    1f73:	89 d8                	mov    %ebx,%eax
    1f75:	ff 75 d4             	pushl  -0x2c(%ebp)
    1f78:	89 fb                	mov    %edi,%ebx
    1f7a:	89 c7                	mov    %eax,%edi
    1f7c:	e8 20 2b 00 00       	call   4aa1 <close>
    1f81:	c7 04 24 2b 52 00 00 	movl   $0x522b,(%esp)
    1f88:	e8 3c 2b 00 00       	call   4ac9 <unlink>
    1f8d:	83 c4 10             	add    $0x10,%esp
    1f90:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
    1f96:	75 61                	jne    1ff9 <sharedfd+0x1a9>
    1f98:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    1f9e:	75 59                	jne    1ff9 <sharedfd+0x1a9>
    1fa0:	83 ec 08             	sub    $0x8,%esp
    1fa3:	68 34 52 00 00       	push   $0x5234
    1fa8:	6a 01                	push   $0x1
    1faa:	e8 51 2c 00 00       	call   4c00 <printf>
    1faf:	83 c4 10             	add    $0x10,%esp
    1fb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fb5:	5b                   	pop    %ebx
    1fb6:	5e                   	pop    %esi
    1fb7:	5f                   	pop    %edi
    1fb8:	5d                   	pop    %ebp
    1fb9:	c3                   	ret    
    1fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1fc0:	83 ec 08             	sub    $0x8,%esp
    1fc3:	68 f0 5e 00 00       	push   $0x5ef0
    1fc8:	6a 01                	push   $0x1
    1fca:	e8 31 2c 00 00       	call   4c00 <printf>
    1fcf:	83 c4 10             	add    $0x10,%esp
    1fd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fd5:	5b                   	pop    %ebx
    1fd6:	5e                   	pop    %esi
    1fd7:	5f                   	pop    %edi
    1fd8:	5d                   	pop    %ebp
    1fd9:	c3                   	ret    
    1fda:	83 ec 08             	sub    $0x8,%esp
    1fdd:	68 3c 5f 00 00       	push   $0x5f3c
    1fe2:	6a 01                	push   $0x1
    1fe4:	e8 17 2c 00 00       	call   4c00 <printf>
    1fe9:	83 c4 10             	add    $0x10,%esp
    1fec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fef:	5b                   	pop    %ebx
    1ff0:	5e                   	pop    %esi
    1ff1:	5f                   	pop    %edi
    1ff2:	5d                   	pop    %ebp
    1ff3:	c3                   	ret    
    1ff4:	e8 80 2a 00 00       	call   4a79 <exit>
    1ff9:	53                   	push   %ebx
    1ffa:	57                   	push   %edi
    1ffb:	68 41 52 00 00       	push   $0x5241
    2000:	6a 01                	push   $0x1
    2002:	e8 f9 2b 00 00       	call   4c00 <printf>
    2007:	e8 6d 2a 00 00       	call   4a79 <exit>
    200c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002010 <fourfiles>:
    2010:	55                   	push   %ebp
    2011:	89 e5                	mov    %esp,%ebp
    2013:	57                   	push   %edi
    2014:	56                   	push   %esi
    2015:	53                   	push   %ebx
    2016:	be 56 52 00 00       	mov    $0x5256,%esi
    201b:	31 db                	xor    %ebx,%ebx
    201d:	83 ec 34             	sub    $0x34,%esp
    2020:	c7 45 d8 56 52 00 00 	movl   $0x5256,-0x28(%ebp)
    2027:	c7 45 dc 9f 53 00 00 	movl   $0x539f,-0x24(%ebp)
    202e:	68 5c 52 00 00       	push   $0x525c
    2033:	6a 01                	push   $0x1
    2035:	c7 45 e0 a3 53 00 00 	movl   $0x53a3,-0x20(%ebp)
    203c:	c7 45 e4 59 52 00 00 	movl   $0x5259,-0x1c(%ebp)
    2043:	e8 b8 2b 00 00       	call   4c00 <printf>
    2048:	83 c4 10             	add    $0x10,%esp
    204b:	83 ec 0c             	sub    $0xc,%esp
    204e:	56                   	push   %esi
    204f:	e8 75 2a 00 00       	call   4ac9 <unlink>
    2054:	e8 18 2a 00 00       	call   4a71 <fork>
    2059:	83 c4 10             	add    $0x10,%esp
    205c:	85 c0                	test   %eax,%eax
    205e:	0f 88 68 01 00 00    	js     21cc <fourfiles+0x1bc>
    2064:	0f 84 df 00 00 00    	je     2149 <fourfiles+0x139>
    206a:	83 c3 01             	add    $0x1,%ebx
    206d:	83 fb 04             	cmp    $0x4,%ebx
    2070:	74 06                	je     2078 <fourfiles+0x68>
    2072:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    2076:	eb d3                	jmp    204b <fourfiles+0x3b>
    2078:	e8 04 2a 00 00       	call   4a81 <wait>
    207d:	31 ff                	xor    %edi,%edi
    207f:	e8 fd 29 00 00       	call   4a81 <wait>
    2084:	e8 f8 29 00 00       	call   4a81 <wait>
    2089:	e8 f3 29 00 00       	call   4a81 <wait>
    208e:	c7 45 d0 56 52 00 00 	movl   $0x5256,-0x30(%ebp)
    2095:	83 ec 08             	sub    $0x8,%esp
    2098:	31 db                	xor    %ebx,%ebx
    209a:	6a 00                	push   $0x0
    209c:	ff 75 d0             	pushl  -0x30(%ebp)
    209f:	e8 15 2a 00 00       	call   4ab9 <open>
    20a4:	83 c4 10             	add    $0x10,%esp
    20a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    20aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    20b0:	83 ec 04             	sub    $0x4,%esp
    20b3:	68 00 20 00 00       	push   $0x2000
    20b8:	68 c0 96 00 00       	push   $0x96c0
    20bd:	ff 75 d4             	pushl  -0x2c(%ebp)
    20c0:	e8 cc 29 00 00       	call   4a91 <read>
    20c5:	83 c4 10             	add    $0x10,%esp
    20c8:	85 c0                	test   %eax,%eax
    20ca:	7e 26                	jle    20f2 <fourfiles+0xe2>
    20cc:	31 d2                	xor    %edx,%edx
    20ce:	66 90                	xchg   %ax,%ax
    20d0:	0f be b2 c0 96 00 00 	movsbl 0x96c0(%edx),%esi
    20d7:	83 ff 01             	cmp    $0x1,%edi
    20da:	19 c9                	sbb    %ecx,%ecx
    20dc:	83 c1 31             	add    $0x31,%ecx
    20df:	39 ce                	cmp    %ecx,%esi
    20e1:	0f 85 be 00 00 00    	jne    21a5 <fourfiles+0x195>
    20e7:	83 c2 01             	add    $0x1,%edx
    20ea:	39 d0                	cmp    %edx,%eax
    20ec:	75 e2                	jne    20d0 <fourfiles+0xc0>
    20ee:	01 c3                	add    %eax,%ebx
    20f0:	eb be                	jmp    20b0 <fourfiles+0xa0>
    20f2:	83 ec 0c             	sub    $0xc,%esp
    20f5:	ff 75 d4             	pushl  -0x2c(%ebp)
    20f8:	e8 a4 29 00 00       	call   4aa1 <close>
    20fd:	83 c4 10             	add    $0x10,%esp
    2100:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    2106:	0f 85 d3 00 00 00    	jne    21df <fourfiles+0x1cf>
    210c:	83 ec 0c             	sub    $0xc,%esp
    210f:	ff 75 d0             	pushl  -0x30(%ebp)
    2112:	e8 b2 29 00 00       	call   4ac9 <unlink>
    2117:	83 c4 10             	add    $0x10,%esp
    211a:	83 ff 01             	cmp    $0x1,%edi
    211d:	75 1a                	jne    2139 <fourfiles+0x129>
    211f:	83 ec 08             	sub    $0x8,%esp
    2122:	68 9a 52 00 00       	push   $0x529a
    2127:	6a 01                	push   $0x1
    2129:	e8 d2 2a 00 00       	call   4c00 <printf>
    212e:	83 c4 10             	add    $0x10,%esp
    2131:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2134:	5b                   	pop    %ebx
    2135:	5e                   	pop    %esi
    2136:	5f                   	pop    %edi
    2137:	5d                   	pop    %ebp
    2138:	c3                   	ret    
    2139:	8b 45 dc             	mov    -0x24(%ebp),%eax
    213c:	bf 01 00 00 00       	mov    $0x1,%edi
    2141:	89 45 d0             	mov    %eax,-0x30(%ebp)
    2144:	e9 4c ff ff ff       	jmp    2095 <fourfiles+0x85>
    2149:	83 ec 08             	sub    $0x8,%esp
    214c:	68 02 02 00 00       	push   $0x202
    2151:	56                   	push   %esi
    2152:	e8 62 29 00 00       	call   4ab9 <open>
    2157:	83 c4 10             	add    $0x10,%esp
    215a:	85 c0                	test   %eax,%eax
    215c:	89 c6                	mov    %eax,%esi
    215e:	78 59                	js     21b9 <fourfiles+0x1a9>
    2160:	83 ec 04             	sub    $0x4,%esp
    2163:	83 c3 30             	add    $0x30,%ebx
    2166:	68 00 02 00 00       	push   $0x200
    216b:	53                   	push   %ebx
    216c:	bb 0c 00 00 00       	mov    $0xc,%ebx
    2171:	68 c0 96 00 00       	push   $0x96c0
    2176:	e8 85 25 00 00       	call   4700 <memset>
    217b:	83 c4 10             	add    $0x10,%esp
    217e:	83 ec 04             	sub    $0x4,%esp
    2181:	68 f4 01 00 00       	push   $0x1f4
    2186:	68 c0 96 00 00       	push   $0x96c0
    218b:	56                   	push   %esi
    218c:	e8 08 29 00 00       	call   4a99 <write>
    2191:	83 c4 10             	add    $0x10,%esp
    2194:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    2199:	75 57                	jne    21f2 <fourfiles+0x1e2>
    219b:	83 eb 01             	sub    $0x1,%ebx
    219e:	75 de                	jne    217e <fourfiles+0x16e>
    21a0:	e8 d4 28 00 00       	call   4a79 <exit>
    21a5:	83 ec 08             	sub    $0x8,%esp
    21a8:	68 7d 52 00 00       	push   $0x527d
    21ad:	6a 01                	push   $0x1
    21af:	e8 4c 2a 00 00       	call   4c00 <printf>
    21b4:	e8 c0 28 00 00       	call   4a79 <exit>
    21b9:	51                   	push   %ecx
    21ba:	51                   	push   %ecx
    21bb:	68 f7 54 00 00       	push   $0x54f7
    21c0:	6a 01                	push   $0x1
    21c2:	e8 39 2a 00 00       	call   4c00 <printf>
    21c7:	e8 ad 28 00 00       	call   4a79 <exit>
    21cc:	53                   	push   %ebx
    21cd:	53                   	push   %ebx
    21ce:	68 31 5d 00 00       	push   $0x5d31
    21d3:	6a 01                	push   $0x1
    21d5:	e8 26 2a 00 00       	call   4c00 <printf>
    21da:	e8 9a 28 00 00       	call   4a79 <exit>
    21df:	50                   	push   %eax
    21e0:	53                   	push   %ebx
    21e1:	68 89 52 00 00       	push   $0x5289
    21e6:	6a 01                	push   $0x1
    21e8:	e8 13 2a 00 00       	call   4c00 <printf>
    21ed:	e8 87 28 00 00       	call   4a79 <exit>
    21f2:	52                   	push   %edx
    21f3:	50                   	push   %eax
    21f4:	68 6c 52 00 00       	push   $0x526c
    21f9:	6a 01                	push   $0x1
    21fb:	e8 00 2a 00 00       	call   4c00 <printf>
    2200:	e8 74 28 00 00       	call   4a79 <exit>
    2205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002210 <createdelete>:
    2210:	55                   	push   %ebp
    2211:	89 e5                	mov    %esp,%ebp
    2213:	57                   	push   %edi
    2214:	56                   	push   %esi
    2215:	53                   	push   %ebx
    2216:	31 db                	xor    %ebx,%ebx
    2218:	83 ec 44             	sub    $0x44,%esp
    221b:	68 a8 52 00 00       	push   $0x52a8
    2220:	6a 01                	push   $0x1
    2222:	e8 d9 29 00 00       	call   4c00 <printf>
    2227:	83 c4 10             	add    $0x10,%esp
    222a:	e8 42 28 00 00       	call   4a71 <fork>
    222f:	85 c0                	test   %eax,%eax
    2231:	0f 88 be 01 00 00    	js     23f5 <createdelete+0x1e5>
    2237:	0f 84 0b 01 00 00    	je     2348 <createdelete+0x138>
    223d:	83 c3 01             	add    $0x1,%ebx
    2240:	83 fb 04             	cmp    $0x4,%ebx
    2243:	75 e5                	jne    222a <createdelete+0x1a>
    2245:	8d 7d c8             	lea    -0x38(%ebp),%edi
    2248:	be ff ff ff ff       	mov    $0xffffffff,%esi
    224d:	e8 2f 28 00 00       	call   4a81 <wait>
    2252:	e8 2a 28 00 00       	call   4a81 <wait>
    2257:	e8 25 28 00 00       	call   4a81 <wait>
    225c:	e8 20 28 00 00       	call   4a81 <wait>
    2261:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    2265:	8d 76 00             	lea    0x0(%esi),%esi
    2268:	8d 46 31             	lea    0x31(%esi),%eax
    226b:	88 45 c7             	mov    %al,-0x39(%ebp)
    226e:	8d 46 01             	lea    0x1(%esi),%eax
    2271:	83 f8 09             	cmp    $0x9,%eax
    2274:	89 45 c0             	mov    %eax,-0x40(%ebp)
    2277:	0f 9f c3             	setg   %bl
    227a:	85 c0                	test   %eax,%eax
    227c:	0f 94 c0             	sete   %al
    227f:	09 c3                	or     %eax,%ebx
    2281:	88 5d c6             	mov    %bl,-0x3a(%ebp)
    2284:	bb 70 00 00 00       	mov    $0x70,%ebx
    2289:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    228d:	83 ec 08             	sub    $0x8,%esp
    2290:	88 5d c8             	mov    %bl,-0x38(%ebp)
    2293:	6a 00                	push   $0x0
    2295:	57                   	push   %edi
    2296:	88 45 c9             	mov    %al,-0x37(%ebp)
    2299:	e8 1b 28 00 00       	call   4ab9 <open>
    229e:	83 c4 10             	add    $0x10,%esp
    22a1:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    22a5:	0f 84 85 00 00 00    	je     2330 <createdelete+0x120>
    22ab:	85 c0                	test   %eax,%eax
    22ad:	0f 88 1a 01 00 00    	js     23cd <createdelete+0x1bd>
    22b3:	83 fe 08             	cmp    $0x8,%esi
    22b6:	0f 86 54 01 00 00    	jbe    2410 <createdelete+0x200>
    22bc:	83 ec 0c             	sub    $0xc,%esp
    22bf:	50                   	push   %eax
    22c0:	e8 dc 27 00 00       	call   4aa1 <close>
    22c5:	83 c4 10             	add    $0x10,%esp
    22c8:	83 c3 01             	add    $0x1,%ebx
    22cb:	80 fb 74             	cmp    $0x74,%bl
    22ce:	75 b9                	jne    2289 <createdelete+0x79>
    22d0:	8b 75 c0             	mov    -0x40(%ebp),%esi
    22d3:	83 fe 13             	cmp    $0x13,%esi
    22d6:	75 90                	jne    2268 <createdelete+0x58>
    22d8:	be 70 00 00 00       	mov    $0x70,%esi
    22dd:	8d 76 00             	lea    0x0(%esi),%esi
    22e0:	8d 46 c0             	lea    -0x40(%esi),%eax
    22e3:	bb 04 00 00 00       	mov    $0x4,%ebx
    22e8:	88 45 c7             	mov    %al,-0x39(%ebp)
    22eb:	89 f0                	mov    %esi,%eax
    22ed:	83 ec 0c             	sub    $0xc,%esp
    22f0:	88 45 c8             	mov    %al,-0x38(%ebp)
    22f3:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    22f7:	57                   	push   %edi
    22f8:	88 45 c9             	mov    %al,-0x37(%ebp)
    22fb:	e8 c9 27 00 00       	call   4ac9 <unlink>
    2300:	83 c4 10             	add    $0x10,%esp
    2303:	83 eb 01             	sub    $0x1,%ebx
    2306:	75 e3                	jne    22eb <createdelete+0xdb>
    2308:	83 c6 01             	add    $0x1,%esi
    230b:	89 f0                	mov    %esi,%eax
    230d:	3c 84                	cmp    $0x84,%al
    230f:	75 cf                	jne    22e0 <createdelete+0xd0>
    2311:	83 ec 08             	sub    $0x8,%esp
    2314:	68 bb 52 00 00       	push   $0x52bb
    2319:	6a 01                	push   $0x1
    231b:	e8 e0 28 00 00       	call   4c00 <printf>
    2320:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2323:	5b                   	pop    %ebx
    2324:	5e                   	pop    %esi
    2325:	5f                   	pop    %edi
    2326:	5d                   	pop    %ebp
    2327:	c3                   	ret    
    2328:	90                   	nop
    2329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2330:	83 fe 08             	cmp    $0x8,%esi
    2333:	0f 86 cf 00 00 00    	jbe    2408 <createdelete+0x1f8>
    2339:	85 c0                	test   %eax,%eax
    233b:	78 8b                	js     22c8 <createdelete+0xb8>
    233d:	e9 7a ff ff ff       	jmp    22bc <createdelete+0xac>
    2342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2348:	83 c3 70             	add    $0x70,%ebx
    234b:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    234f:	8d 7d c8             	lea    -0x38(%ebp),%edi
    2352:	88 5d c8             	mov    %bl,-0x38(%ebp)
    2355:	31 db                	xor    %ebx,%ebx
    2357:	eb 0f                	jmp    2368 <createdelete+0x158>
    2359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2360:	83 fb 13             	cmp    $0x13,%ebx
    2363:	74 63                	je     23c8 <createdelete+0x1b8>
    2365:	83 c3 01             	add    $0x1,%ebx
    2368:	83 ec 08             	sub    $0x8,%esp
    236b:	8d 43 30             	lea    0x30(%ebx),%eax
    236e:	68 02 02 00 00       	push   $0x202
    2373:	57                   	push   %edi
    2374:	88 45 c9             	mov    %al,-0x37(%ebp)
    2377:	e8 3d 27 00 00       	call   4ab9 <open>
    237c:	83 c4 10             	add    $0x10,%esp
    237f:	85 c0                	test   %eax,%eax
    2381:	78 5f                	js     23e2 <createdelete+0x1d2>
    2383:	83 ec 0c             	sub    $0xc,%esp
    2386:	50                   	push   %eax
    2387:	e8 15 27 00 00       	call   4aa1 <close>
    238c:	83 c4 10             	add    $0x10,%esp
    238f:	85 db                	test   %ebx,%ebx
    2391:	74 d2                	je     2365 <createdelete+0x155>
    2393:	f6 c3 01             	test   $0x1,%bl
    2396:	75 c8                	jne    2360 <createdelete+0x150>
    2398:	83 ec 0c             	sub    $0xc,%esp
    239b:	89 d8                	mov    %ebx,%eax
    239d:	d1 f8                	sar    %eax
    239f:	57                   	push   %edi
    23a0:	83 c0 30             	add    $0x30,%eax
    23a3:	88 45 c9             	mov    %al,-0x37(%ebp)
    23a6:	e8 1e 27 00 00       	call   4ac9 <unlink>
    23ab:	83 c4 10             	add    $0x10,%esp
    23ae:	85 c0                	test   %eax,%eax
    23b0:	79 ae                	jns    2360 <createdelete+0x150>
    23b2:	52                   	push   %edx
    23b3:	52                   	push   %edx
    23b4:	68 a9 4e 00 00       	push   $0x4ea9
    23b9:	6a 01                	push   $0x1
    23bb:	e8 40 28 00 00       	call   4c00 <printf>
    23c0:	e8 b4 26 00 00       	call   4a79 <exit>
    23c5:	8d 76 00             	lea    0x0(%esi),%esi
    23c8:	e8 ac 26 00 00       	call   4a79 <exit>
    23cd:	83 ec 04             	sub    $0x4,%esp
    23d0:	57                   	push   %edi
    23d1:	68 68 5f 00 00       	push   $0x5f68
    23d6:	6a 01                	push   $0x1
    23d8:	e8 23 28 00 00       	call   4c00 <printf>
    23dd:	e8 97 26 00 00       	call   4a79 <exit>
    23e2:	51                   	push   %ecx
    23e3:	51                   	push   %ecx
    23e4:	68 f7 54 00 00       	push   $0x54f7
    23e9:	6a 01                	push   $0x1
    23eb:	e8 10 28 00 00       	call   4c00 <printf>
    23f0:	e8 84 26 00 00       	call   4a79 <exit>
    23f5:	53                   	push   %ebx
    23f6:	53                   	push   %ebx
    23f7:	68 31 5d 00 00       	push   $0x5d31
    23fc:	6a 01                	push   $0x1
    23fe:	e8 fd 27 00 00       	call   4c00 <printf>
    2403:	e8 71 26 00 00       	call   4a79 <exit>
    2408:	85 c0                	test   %eax,%eax
    240a:	0f 88 b8 fe ff ff    	js     22c8 <createdelete+0xb8>
    2410:	50                   	push   %eax
    2411:	57                   	push   %edi
    2412:	68 8c 5f 00 00       	push   $0x5f8c
    2417:	6a 01                	push   $0x1
    2419:	e8 e2 27 00 00       	call   4c00 <printf>
    241e:	e8 56 26 00 00       	call   4a79 <exit>
    2423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002430 <unlinkread>:
    2430:	55                   	push   %ebp
    2431:	89 e5                	mov    %esp,%ebp
    2433:	56                   	push   %esi
    2434:	53                   	push   %ebx
    2435:	83 ec 08             	sub    $0x8,%esp
    2438:	68 cc 52 00 00       	push   $0x52cc
    243d:	6a 01                	push   $0x1
    243f:	e8 bc 27 00 00       	call   4c00 <printf>
    2444:	5b                   	pop    %ebx
    2445:	5e                   	pop    %esi
    2446:	68 02 02 00 00       	push   $0x202
    244b:	68 dd 52 00 00       	push   $0x52dd
    2450:	e8 64 26 00 00       	call   4ab9 <open>
    2455:	83 c4 10             	add    $0x10,%esp
    2458:	85 c0                	test   %eax,%eax
    245a:	0f 88 e6 00 00 00    	js     2546 <unlinkread+0x116>
    2460:	83 ec 04             	sub    $0x4,%esp
    2463:	89 c3                	mov    %eax,%ebx
    2465:	6a 05                	push   $0x5
    2467:	68 02 53 00 00       	push   $0x5302
    246c:	50                   	push   %eax
    246d:	e8 27 26 00 00       	call   4a99 <write>
    2472:	89 1c 24             	mov    %ebx,(%esp)
    2475:	e8 27 26 00 00       	call   4aa1 <close>
    247a:	58                   	pop    %eax
    247b:	5a                   	pop    %edx
    247c:	6a 02                	push   $0x2
    247e:	68 dd 52 00 00       	push   $0x52dd
    2483:	e8 31 26 00 00       	call   4ab9 <open>
    2488:	83 c4 10             	add    $0x10,%esp
    248b:	85 c0                	test   %eax,%eax
    248d:	89 c3                	mov    %eax,%ebx
    248f:	0f 88 10 01 00 00    	js     25a5 <unlinkread+0x175>
    2495:	83 ec 0c             	sub    $0xc,%esp
    2498:	68 dd 52 00 00       	push   $0x52dd
    249d:	e8 27 26 00 00       	call   4ac9 <unlink>
    24a2:	83 c4 10             	add    $0x10,%esp
    24a5:	85 c0                	test   %eax,%eax
    24a7:	0f 85 e5 00 00 00    	jne    2592 <unlinkread+0x162>
    24ad:	83 ec 08             	sub    $0x8,%esp
    24b0:	68 02 02 00 00       	push   $0x202
    24b5:	68 dd 52 00 00       	push   $0x52dd
    24ba:	e8 fa 25 00 00       	call   4ab9 <open>
    24bf:	83 c4 0c             	add    $0xc,%esp
    24c2:	89 c6                	mov    %eax,%esi
    24c4:	6a 03                	push   $0x3
    24c6:	68 3a 53 00 00       	push   $0x533a
    24cb:	50                   	push   %eax
    24cc:	e8 c8 25 00 00       	call   4a99 <write>
    24d1:	89 34 24             	mov    %esi,(%esp)
    24d4:	e8 c8 25 00 00       	call   4aa1 <close>
    24d9:	83 c4 0c             	add    $0xc,%esp
    24dc:	68 00 20 00 00       	push   $0x2000
    24e1:	68 c0 96 00 00       	push   $0x96c0
    24e6:	53                   	push   %ebx
    24e7:	e8 a5 25 00 00       	call   4a91 <read>
    24ec:	83 c4 10             	add    $0x10,%esp
    24ef:	83 f8 05             	cmp    $0x5,%eax
    24f2:	0f 85 87 00 00 00    	jne    257f <unlinkread+0x14f>
    24f8:	80 3d c0 96 00 00 68 	cmpb   $0x68,0x96c0
    24ff:	75 6b                	jne    256c <unlinkread+0x13c>
    2501:	83 ec 04             	sub    $0x4,%esp
    2504:	6a 0a                	push   $0xa
    2506:	68 c0 96 00 00       	push   $0x96c0
    250b:	53                   	push   %ebx
    250c:	e8 88 25 00 00       	call   4a99 <write>
    2511:	83 c4 10             	add    $0x10,%esp
    2514:	83 f8 0a             	cmp    $0xa,%eax
    2517:	75 40                	jne    2559 <unlinkread+0x129>
    2519:	83 ec 0c             	sub    $0xc,%esp
    251c:	53                   	push   %ebx
    251d:	e8 7f 25 00 00       	call   4aa1 <close>
    2522:	c7 04 24 dd 52 00 00 	movl   $0x52dd,(%esp)
    2529:	e8 9b 25 00 00       	call   4ac9 <unlink>
    252e:	58                   	pop    %eax
    252f:	5a                   	pop    %edx
    2530:	68 85 53 00 00       	push   $0x5385
    2535:	6a 01                	push   $0x1
    2537:	e8 c4 26 00 00       	call   4c00 <printf>
    253c:	83 c4 10             	add    $0x10,%esp
    253f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2542:	5b                   	pop    %ebx
    2543:	5e                   	pop    %esi
    2544:	5d                   	pop    %ebp
    2545:	c3                   	ret    
    2546:	51                   	push   %ecx
    2547:	51                   	push   %ecx
    2548:	68 e8 52 00 00       	push   $0x52e8
    254d:	6a 01                	push   $0x1
    254f:	e8 ac 26 00 00       	call   4c00 <printf>
    2554:	e8 20 25 00 00       	call   4a79 <exit>
    2559:	51                   	push   %ecx
    255a:	51                   	push   %ecx
    255b:	68 6c 53 00 00       	push   $0x536c
    2560:	6a 01                	push   $0x1
    2562:	e8 99 26 00 00       	call   4c00 <printf>
    2567:	e8 0d 25 00 00       	call   4a79 <exit>
    256c:	53                   	push   %ebx
    256d:	53                   	push   %ebx
    256e:	68 55 53 00 00       	push   $0x5355
    2573:	6a 01                	push   $0x1
    2575:	e8 86 26 00 00       	call   4c00 <printf>
    257a:	e8 fa 24 00 00       	call   4a79 <exit>
    257f:	56                   	push   %esi
    2580:	56                   	push   %esi
    2581:	68 3e 53 00 00       	push   $0x533e
    2586:	6a 01                	push   $0x1
    2588:	e8 73 26 00 00       	call   4c00 <printf>
    258d:	e8 e7 24 00 00       	call   4a79 <exit>
    2592:	50                   	push   %eax
    2593:	50                   	push   %eax
    2594:	68 20 53 00 00       	push   $0x5320
    2599:	6a 01                	push   $0x1
    259b:	e8 60 26 00 00       	call   4c00 <printf>
    25a0:	e8 d4 24 00 00       	call   4a79 <exit>
    25a5:	50                   	push   %eax
    25a6:	50                   	push   %eax
    25a7:	68 08 53 00 00       	push   $0x5308
    25ac:	6a 01                	push   $0x1
    25ae:	e8 4d 26 00 00       	call   4c00 <printf>
    25b3:	e8 c1 24 00 00       	call   4a79 <exit>
    25b8:	90                   	nop
    25b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000025c0 <linktest>:
    25c0:	55                   	push   %ebp
    25c1:	89 e5                	mov    %esp,%ebp
    25c3:	53                   	push   %ebx
    25c4:	83 ec 0c             	sub    $0xc,%esp
    25c7:	68 94 53 00 00       	push   $0x5394
    25cc:	6a 01                	push   $0x1
    25ce:	e8 2d 26 00 00       	call   4c00 <printf>
    25d3:	c7 04 24 9e 53 00 00 	movl   $0x539e,(%esp)
    25da:	e8 ea 24 00 00       	call   4ac9 <unlink>
    25df:	c7 04 24 a2 53 00 00 	movl   $0x53a2,(%esp)
    25e6:	e8 de 24 00 00       	call   4ac9 <unlink>
    25eb:	58                   	pop    %eax
    25ec:	5a                   	pop    %edx
    25ed:	68 02 02 00 00       	push   $0x202
    25f2:	68 9e 53 00 00       	push   $0x539e
    25f7:	e8 bd 24 00 00       	call   4ab9 <open>
    25fc:	83 c4 10             	add    $0x10,%esp
    25ff:	85 c0                	test   %eax,%eax
    2601:	0f 88 1e 01 00 00    	js     2725 <linktest+0x165>
    2607:	83 ec 04             	sub    $0x4,%esp
    260a:	89 c3                	mov    %eax,%ebx
    260c:	6a 05                	push   $0x5
    260e:	68 02 53 00 00       	push   $0x5302
    2613:	50                   	push   %eax
    2614:	e8 80 24 00 00       	call   4a99 <write>
    2619:	83 c4 10             	add    $0x10,%esp
    261c:	83 f8 05             	cmp    $0x5,%eax
    261f:	0f 85 98 01 00 00    	jne    27bd <linktest+0x1fd>
    2625:	83 ec 0c             	sub    $0xc,%esp
    2628:	53                   	push   %ebx
    2629:	e8 73 24 00 00       	call   4aa1 <close>
    262e:	5b                   	pop    %ebx
    262f:	58                   	pop    %eax
    2630:	68 a2 53 00 00       	push   $0x53a2
    2635:	68 9e 53 00 00       	push   $0x539e
    263a:	e8 9a 24 00 00       	call   4ad9 <link>
    263f:	83 c4 10             	add    $0x10,%esp
    2642:	85 c0                	test   %eax,%eax
    2644:	0f 88 60 01 00 00    	js     27aa <linktest+0x1ea>
    264a:	83 ec 0c             	sub    $0xc,%esp
    264d:	68 9e 53 00 00       	push   $0x539e
    2652:	e8 72 24 00 00       	call   4ac9 <unlink>
    2657:	58                   	pop    %eax
    2658:	5a                   	pop    %edx
    2659:	6a 00                	push   $0x0
    265b:	68 9e 53 00 00       	push   $0x539e
    2660:	e8 54 24 00 00       	call   4ab9 <open>
    2665:	83 c4 10             	add    $0x10,%esp
    2668:	85 c0                	test   %eax,%eax
    266a:	0f 89 27 01 00 00    	jns    2797 <linktest+0x1d7>
    2670:	83 ec 08             	sub    $0x8,%esp
    2673:	6a 00                	push   $0x0
    2675:	68 a2 53 00 00       	push   $0x53a2
    267a:	e8 3a 24 00 00       	call   4ab9 <open>
    267f:	83 c4 10             	add    $0x10,%esp
    2682:	85 c0                	test   %eax,%eax
    2684:	89 c3                	mov    %eax,%ebx
    2686:	0f 88 f8 00 00 00    	js     2784 <linktest+0x1c4>
    268c:	83 ec 04             	sub    $0x4,%esp
    268f:	68 00 20 00 00       	push   $0x2000
    2694:	68 c0 96 00 00       	push   $0x96c0
    2699:	50                   	push   %eax
    269a:	e8 f2 23 00 00       	call   4a91 <read>
    269f:	83 c4 10             	add    $0x10,%esp
    26a2:	83 f8 05             	cmp    $0x5,%eax
    26a5:	0f 85 c6 00 00 00    	jne    2771 <linktest+0x1b1>
    26ab:	83 ec 0c             	sub    $0xc,%esp
    26ae:	53                   	push   %ebx
    26af:	e8 ed 23 00 00       	call   4aa1 <close>
    26b4:	58                   	pop    %eax
    26b5:	5a                   	pop    %edx
    26b6:	68 a2 53 00 00       	push   $0x53a2
    26bb:	68 a2 53 00 00       	push   $0x53a2
    26c0:	e8 14 24 00 00       	call   4ad9 <link>
    26c5:	83 c4 10             	add    $0x10,%esp
    26c8:	85 c0                	test   %eax,%eax
    26ca:	0f 89 8e 00 00 00    	jns    275e <linktest+0x19e>
    26d0:	83 ec 0c             	sub    $0xc,%esp
    26d3:	68 a2 53 00 00       	push   $0x53a2
    26d8:	e8 ec 23 00 00       	call   4ac9 <unlink>
    26dd:	59                   	pop    %ecx
    26de:	5b                   	pop    %ebx
    26df:	68 9e 53 00 00       	push   $0x539e
    26e4:	68 a2 53 00 00       	push   $0x53a2
    26e9:	e8 eb 23 00 00       	call   4ad9 <link>
    26ee:	83 c4 10             	add    $0x10,%esp
    26f1:	85 c0                	test   %eax,%eax
    26f3:	79 56                	jns    274b <linktest+0x18b>
    26f5:	83 ec 08             	sub    $0x8,%esp
    26f8:	68 9e 53 00 00       	push   $0x539e
    26fd:	68 66 56 00 00       	push   $0x5666
    2702:	e8 d2 23 00 00       	call   4ad9 <link>
    2707:	83 c4 10             	add    $0x10,%esp
    270a:	85 c0                	test   %eax,%eax
    270c:	79 2a                	jns    2738 <linktest+0x178>
    270e:	83 ec 08             	sub    $0x8,%esp
    2711:	68 3c 54 00 00       	push   $0x543c
    2716:	6a 01                	push   $0x1
    2718:	e8 e3 24 00 00       	call   4c00 <printf>
    271d:	83 c4 10             	add    $0x10,%esp
    2720:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2723:	c9                   	leave  
    2724:	c3                   	ret    
    2725:	50                   	push   %eax
    2726:	50                   	push   %eax
    2727:	68 a6 53 00 00       	push   $0x53a6
    272c:	6a 01                	push   $0x1
    272e:	e8 cd 24 00 00       	call   4c00 <printf>
    2733:	e8 41 23 00 00       	call   4a79 <exit>
    2738:	50                   	push   %eax
    2739:	50                   	push   %eax
    273a:	68 20 54 00 00       	push   $0x5420
    273f:	6a 01                	push   $0x1
    2741:	e8 ba 24 00 00       	call   4c00 <printf>
    2746:	e8 2e 23 00 00       	call   4a79 <exit>
    274b:	52                   	push   %edx
    274c:	52                   	push   %edx
    274d:	68 d4 5f 00 00       	push   $0x5fd4
    2752:	6a 01                	push   $0x1
    2754:	e8 a7 24 00 00       	call   4c00 <printf>
    2759:	e8 1b 23 00 00       	call   4a79 <exit>
    275e:	50                   	push   %eax
    275f:	50                   	push   %eax
    2760:	68 02 54 00 00       	push   $0x5402
    2765:	6a 01                	push   $0x1
    2767:	e8 94 24 00 00       	call   4c00 <printf>
    276c:	e8 08 23 00 00       	call   4a79 <exit>
    2771:	51                   	push   %ecx
    2772:	51                   	push   %ecx
    2773:	68 f1 53 00 00       	push   $0x53f1
    2778:	6a 01                	push   $0x1
    277a:	e8 81 24 00 00       	call   4c00 <printf>
    277f:	e8 f5 22 00 00       	call   4a79 <exit>
    2784:	53                   	push   %ebx
    2785:	53                   	push   %ebx
    2786:	68 e0 53 00 00       	push   $0x53e0
    278b:	6a 01                	push   $0x1
    278d:	e8 6e 24 00 00       	call   4c00 <printf>
    2792:	e8 e2 22 00 00       	call   4a79 <exit>
    2797:	50                   	push   %eax
    2798:	50                   	push   %eax
    2799:	68 ac 5f 00 00       	push   $0x5fac
    279e:	6a 01                	push   $0x1
    27a0:	e8 5b 24 00 00       	call   4c00 <printf>
    27a5:	e8 cf 22 00 00       	call   4a79 <exit>
    27aa:	51                   	push   %ecx
    27ab:	51                   	push   %ecx
    27ac:	68 cb 53 00 00       	push   $0x53cb
    27b1:	6a 01                	push   $0x1
    27b3:	e8 48 24 00 00       	call   4c00 <printf>
    27b8:	e8 bc 22 00 00       	call   4a79 <exit>
    27bd:	50                   	push   %eax
    27be:	50                   	push   %eax
    27bf:	68 b9 53 00 00       	push   $0x53b9
    27c4:	6a 01                	push   $0x1
    27c6:	e8 35 24 00 00       	call   4c00 <printf>
    27cb:	e8 a9 22 00 00       	call   4a79 <exit>

000027d0 <concreate>:
    27d0:	55                   	push   %ebp
    27d1:	89 e5                	mov    %esp,%ebp
    27d3:	57                   	push   %edi
    27d4:	56                   	push   %esi
    27d5:	53                   	push   %ebx
    27d6:	31 f6                	xor    %esi,%esi
    27d8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    27db:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
    27e0:	83 ec 64             	sub    $0x64,%esp
    27e3:	68 49 54 00 00       	push   $0x5449
    27e8:	6a 01                	push   $0x1
    27ea:	e8 11 24 00 00       	call   4c00 <printf>
    27ef:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
    27f3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    27f7:	83 c4 10             	add    $0x10,%esp
    27fa:	eb 4c                	jmp    2848 <concreate+0x78>
    27fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2800:	89 f0                	mov    %esi,%eax
    2802:	89 f1                	mov    %esi,%ecx
    2804:	f7 e7                	mul    %edi
    2806:	d1 ea                	shr    %edx
    2808:	8d 04 52             	lea    (%edx,%edx,2),%eax
    280b:	29 c1                	sub    %eax,%ecx
    280d:	83 f9 01             	cmp    $0x1,%ecx
    2810:	0f 84 ba 00 00 00    	je     28d0 <concreate+0x100>
    2816:	83 ec 08             	sub    $0x8,%esp
    2819:	68 02 02 00 00       	push   $0x202
    281e:	53                   	push   %ebx
    281f:	e8 95 22 00 00       	call   4ab9 <open>
    2824:	83 c4 10             	add    $0x10,%esp
    2827:	85 c0                	test   %eax,%eax
    2829:	78 67                	js     2892 <concreate+0xc2>
    282b:	83 ec 0c             	sub    $0xc,%esp
    282e:	83 c6 01             	add    $0x1,%esi
    2831:	50                   	push   %eax
    2832:	e8 6a 22 00 00       	call   4aa1 <close>
    2837:	83 c4 10             	add    $0x10,%esp
    283a:	e8 42 22 00 00       	call   4a81 <wait>
    283f:	83 fe 28             	cmp    $0x28,%esi
    2842:	0f 84 aa 00 00 00    	je     28f2 <concreate+0x122>
    2848:	83 ec 0c             	sub    $0xc,%esp
    284b:	8d 46 30             	lea    0x30(%esi),%eax
    284e:	53                   	push   %ebx
    284f:	88 45 ae             	mov    %al,-0x52(%ebp)
    2852:	e8 72 22 00 00       	call   4ac9 <unlink>
    2857:	e8 15 22 00 00       	call   4a71 <fork>
    285c:	83 c4 10             	add    $0x10,%esp
    285f:	85 c0                	test   %eax,%eax
    2861:	75 9d                	jne    2800 <concreate+0x30>
    2863:	89 f0                	mov    %esi,%eax
    2865:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    286a:	f7 e2                	mul    %edx
    286c:	c1 ea 02             	shr    $0x2,%edx
    286f:	8d 04 92             	lea    (%edx,%edx,4),%eax
    2872:	29 c6                	sub    %eax,%esi
    2874:	83 fe 01             	cmp    $0x1,%esi
    2877:	74 37                	je     28b0 <concreate+0xe0>
    2879:	83 ec 08             	sub    $0x8,%esp
    287c:	68 02 02 00 00       	push   $0x202
    2881:	53                   	push   %ebx
    2882:	e8 32 22 00 00       	call   4ab9 <open>
    2887:	83 c4 10             	add    $0x10,%esp
    288a:	85 c0                	test   %eax,%eax
    288c:	0f 89 28 02 00 00    	jns    2aba <concreate+0x2ea>
    2892:	83 ec 04             	sub    $0x4,%esp
    2895:	53                   	push   %ebx
    2896:	68 5c 54 00 00       	push   $0x545c
    289b:	6a 01                	push   $0x1
    289d:	e8 5e 23 00 00       	call   4c00 <printf>
    28a2:	e8 d2 21 00 00       	call   4a79 <exit>
    28a7:	89 f6                	mov    %esi,%esi
    28a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    28b0:	83 ec 08             	sub    $0x8,%esp
    28b3:	53                   	push   %ebx
    28b4:	68 59 54 00 00       	push   $0x5459
    28b9:	e8 1b 22 00 00       	call   4ad9 <link>
    28be:	83 c4 10             	add    $0x10,%esp
    28c1:	e8 b3 21 00 00       	call   4a79 <exit>
    28c6:	8d 76 00             	lea    0x0(%esi),%esi
    28c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    28d0:	83 ec 08             	sub    $0x8,%esp
    28d3:	83 c6 01             	add    $0x1,%esi
    28d6:	53                   	push   %ebx
    28d7:	68 59 54 00 00       	push   $0x5459
    28dc:	e8 f8 21 00 00       	call   4ad9 <link>
    28e1:	83 c4 10             	add    $0x10,%esp
    28e4:	e8 98 21 00 00       	call   4a81 <wait>
    28e9:	83 fe 28             	cmp    $0x28,%esi
    28ec:	0f 85 56 ff ff ff    	jne    2848 <concreate+0x78>
    28f2:	8d 45 c0             	lea    -0x40(%ebp),%eax
    28f5:	83 ec 04             	sub    $0x4,%esp
    28f8:	6a 28                	push   $0x28
    28fa:	6a 00                	push   $0x0
    28fc:	50                   	push   %eax
    28fd:	e8 fe 1d 00 00       	call   4700 <memset>
    2902:	5f                   	pop    %edi
    2903:	58                   	pop    %eax
    2904:	6a 00                	push   $0x0
    2906:	68 66 56 00 00       	push   $0x5666
    290b:	8d 7d b0             	lea    -0x50(%ebp),%edi
    290e:	e8 a6 21 00 00       	call   4ab9 <open>
    2913:	83 c4 10             	add    $0x10,%esp
    2916:	89 c6                	mov    %eax,%esi
    2918:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    291f:	90                   	nop
    2920:	83 ec 04             	sub    $0x4,%esp
    2923:	6a 10                	push   $0x10
    2925:	57                   	push   %edi
    2926:	56                   	push   %esi
    2927:	e8 65 21 00 00       	call   4a91 <read>
    292c:	83 c4 10             	add    $0x10,%esp
    292f:	85 c0                	test   %eax,%eax
    2931:	7e 3d                	jle    2970 <concreate+0x1a0>
    2933:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    2938:	74 e6                	je     2920 <concreate+0x150>
    293a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    293e:	75 e0                	jne    2920 <concreate+0x150>
    2940:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    2944:	75 da                	jne    2920 <concreate+0x150>
    2946:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    294a:	83 e8 30             	sub    $0x30,%eax
    294d:	83 f8 27             	cmp    $0x27,%eax
    2950:	0f 87 4e 01 00 00    	ja     2aa4 <concreate+0x2d4>
    2956:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    295b:	0f 85 2d 01 00 00    	jne    2a8e <concreate+0x2be>
    2961:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
    2966:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    296a:	eb b4                	jmp    2920 <concreate+0x150>
    296c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2970:	83 ec 0c             	sub    $0xc,%esp
    2973:	56                   	push   %esi
    2974:	e8 28 21 00 00       	call   4aa1 <close>
    2979:	83 c4 10             	add    $0x10,%esp
    297c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    2980:	0f 85 f5 00 00 00    	jne    2a7b <concreate+0x2ab>
    2986:	31 f6                	xor    %esi,%esi
    2988:	eb 48                	jmp    29d2 <concreate+0x202>
    298a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2990:	85 ff                	test   %edi,%edi
    2992:	74 05                	je     2999 <concreate+0x1c9>
    2994:	83 fa 01             	cmp    $0x1,%edx
    2997:	74 64                	je     29fd <concreate+0x22d>
    2999:	83 ec 0c             	sub    $0xc,%esp
    299c:	53                   	push   %ebx
    299d:	e8 27 21 00 00       	call   4ac9 <unlink>
    29a2:	89 1c 24             	mov    %ebx,(%esp)
    29a5:	e8 1f 21 00 00       	call   4ac9 <unlink>
    29aa:	89 1c 24             	mov    %ebx,(%esp)
    29ad:	e8 17 21 00 00       	call   4ac9 <unlink>
    29b2:	89 1c 24             	mov    %ebx,(%esp)
    29b5:	e8 0f 21 00 00       	call   4ac9 <unlink>
    29ba:	83 c4 10             	add    $0x10,%esp
    29bd:	85 ff                	test   %edi,%edi
    29bf:	0f 84 fc fe ff ff    	je     28c1 <concreate+0xf1>
    29c5:	83 c6 01             	add    $0x1,%esi
    29c8:	e8 b4 20 00 00       	call   4a81 <wait>
    29cd:	83 fe 28             	cmp    $0x28,%esi
    29d0:	74 7e                	je     2a50 <concreate+0x280>
    29d2:	8d 46 30             	lea    0x30(%esi),%eax
    29d5:	88 45 ae             	mov    %al,-0x52(%ebp)
    29d8:	e8 94 20 00 00       	call   4a71 <fork>
    29dd:	85 c0                	test   %eax,%eax
    29df:	89 c7                	mov    %eax,%edi
    29e1:	0f 88 80 00 00 00    	js     2a67 <concreate+0x297>
    29e7:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    29ec:	f7 e6                	mul    %esi
    29ee:	d1 ea                	shr    %edx
    29f0:	8d 04 52             	lea    (%edx,%edx,2),%eax
    29f3:	89 f2                	mov    %esi,%edx
    29f5:	29 c2                	sub    %eax,%edx
    29f7:	89 d0                	mov    %edx,%eax
    29f9:	09 f8                	or     %edi,%eax
    29fb:	75 93                	jne    2990 <concreate+0x1c0>
    29fd:	83 ec 08             	sub    $0x8,%esp
    2a00:	6a 00                	push   $0x0
    2a02:	53                   	push   %ebx
    2a03:	e8 b1 20 00 00       	call   4ab9 <open>
    2a08:	89 04 24             	mov    %eax,(%esp)
    2a0b:	e8 91 20 00 00       	call   4aa1 <close>
    2a10:	58                   	pop    %eax
    2a11:	5a                   	pop    %edx
    2a12:	6a 00                	push   $0x0
    2a14:	53                   	push   %ebx
    2a15:	e8 9f 20 00 00       	call   4ab9 <open>
    2a1a:	89 04 24             	mov    %eax,(%esp)
    2a1d:	e8 7f 20 00 00       	call   4aa1 <close>
    2a22:	59                   	pop    %ecx
    2a23:	58                   	pop    %eax
    2a24:	6a 00                	push   $0x0
    2a26:	53                   	push   %ebx
    2a27:	e8 8d 20 00 00       	call   4ab9 <open>
    2a2c:	89 04 24             	mov    %eax,(%esp)
    2a2f:	e8 6d 20 00 00       	call   4aa1 <close>
    2a34:	58                   	pop    %eax
    2a35:	5a                   	pop    %edx
    2a36:	6a 00                	push   $0x0
    2a38:	53                   	push   %ebx
    2a39:	e8 7b 20 00 00       	call   4ab9 <open>
    2a3e:	89 04 24             	mov    %eax,(%esp)
    2a41:	e8 5b 20 00 00       	call   4aa1 <close>
    2a46:	83 c4 10             	add    $0x10,%esp
    2a49:	e9 6f ff ff ff       	jmp    29bd <concreate+0x1ed>
    2a4e:	66 90                	xchg   %ax,%ax
    2a50:	83 ec 08             	sub    $0x8,%esp
    2a53:	68 ae 54 00 00       	push   $0x54ae
    2a58:	6a 01                	push   $0x1
    2a5a:	e8 a1 21 00 00       	call   4c00 <printf>
    2a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2a62:	5b                   	pop    %ebx
    2a63:	5e                   	pop    %esi
    2a64:	5f                   	pop    %edi
    2a65:	5d                   	pop    %ebp
    2a66:	c3                   	ret    
    2a67:	83 ec 08             	sub    $0x8,%esp
    2a6a:	68 31 5d 00 00       	push   $0x5d31
    2a6f:	6a 01                	push   $0x1
    2a71:	e8 8a 21 00 00       	call   4c00 <printf>
    2a76:	e8 fe 1f 00 00       	call   4a79 <exit>
    2a7b:	51                   	push   %ecx
    2a7c:	51                   	push   %ecx
    2a7d:	68 f8 5f 00 00       	push   $0x5ff8
    2a82:	6a 01                	push   $0x1
    2a84:	e8 77 21 00 00       	call   4c00 <printf>
    2a89:	e8 eb 1f 00 00       	call   4a79 <exit>
    2a8e:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2a91:	53                   	push   %ebx
    2a92:	50                   	push   %eax
    2a93:	68 91 54 00 00       	push   $0x5491
    2a98:	6a 01                	push   $0x1
    2a9a:	e8 61 21 00 00       	call   4c00 <printf>
    2a9f:	e8 d5 1f 00 00       	call   4a79 <exit>
    2aa4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2aa7:	56                   	push   %esi
    2aa8:	50                   	push   %eax
    2aa9:	68 78 54 00 00       	push   $0x5478
    2aae:	6a 01                	push   $0x1
    2ab0:	e8 4b 21 00 00       	call   4c00 <printf>
    2ab5:	e8 bf 1f 00 00       	call   4a79 <exit>
    2aba:	83 ec 0c             	sub    $0xc,%esp
    2abd:	50                   	push   %eax
    2abe:	e8 de 1f 00 00       	call   4aa1 <close>
    2ac3:	83 c4 10             	add    $0x10,%esp
    2ac6:	e9 f6 fd ff ff       	jmp    28c1 <concreate+0xf1>
    2acb:	90                   	nop
    2acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002ad0 <linkunlink>:
    2ad0:	55                   	push   %ebp
    2ad1:	89 e5                	mov    %esp,%ebp
    2ad3:	57                   	push   %edi
    2ad4:	56                   	push   %esi
    2ad5:	53                   	push   %ebx
    2ad6:	83 ec 24             	sub    $0x24,%esp
    2ad9:	68 bc 54 00 00       	push   $0x54bc
    2ade:	6a 01                	push   $0x1
    2ae0:	e8 1b 21 00 00       	call   4c00 <printf>
    2ae5:	c7 04 24 49 57 00 00 	movl   $0x5749,(%esp)
    2aec:	e8 d8 1f 00 00       	call   4ac9 <unlink>
    2af1:	e8 7b 1f 00 00       	call   4a71 <fork>
    2af6:	83 c4 10             	add    $0x10,%esp
    2af9:	85 c0                	test   %eax,%eax
    2afb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2afe:	0f 88 b6 00 00 00    	js     2bba <linkunlink+0xea>
    2b04:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    2b08:	bb 64 00 00 00       	mov    $0x64,%ebx
    2b0d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
    2b12:	19 ff                	sbb    %edi,%edi
    2b14:	83 e7 60             	and    $0x60,%edi
    2b17:	83 c7 01             	add    $0x1,%edi
    2b1a:	eb 1e                	jmp    2b3a <linkunlink+0x6a>
    2b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2b20:	83 fa 01             	cmp    $0x1,%edx
    2b23:	74 7b                	je     2ba0 <linkunlink+0xd0>
    2b25:	83 ec 0c             	sub    $0xc,%esp
    2b28:	68 49 57 00 00       	push   $0x5749
    2b2d:	e8 97 1f 00 00       	call   4ac9 <unlink>
    2b32:	83 c4 10             	add    $0x10,%esp
    2b35:	83 eb 01             	sub    $0x1,%ebx
    2b38:	74 3d                	je     2b77 <linkunlink+0xa7>
    2b3a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    2b40:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    2b46:	89 f8                	mov    %edi,%eax
    2b48:	f7 e6                	mul    %esi
    2b4a:	d1 ea                	shr    %edx
    2b4c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    2b4f:	89 fa                	mov    %edi,%edx
    2b51:	29 c2                	sub    %eax,%edx
    2b53:	75 cb                	jne    2b20 <linkunlink+0x50>
    2b55:	83 ec 08             	sub    $0x8,%esp
    2b58:	68 02 02 00 00       	push   $0x202
    2b5d:	68 49 57 00 00       	push   $0x5749
    2b62:	e8 52 1f 00 00       	call   4ab9 <open>
    2b67:	89 04 24             	mov    %eax,(%esp)
    2b6a:	e8 32 1f 00 00       	call   4aa1 <close>
    2b6f:	83 c4 10             	add    $0x10,%esp
    2b72:	83 eb 01             	sub    $0x1,%ebx
    2b75:	75 c3                	jne    2b3a <linkunlink+0x6a>
    2b77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b7a:	85 c0                	test   %eax,%eax
    2b7c:	74 4f                	je     2bcd <linkunlink+0xfd>
    2b7e:	e8 fe 1e 00 00       	call   4a81 <wait>
    2b83:	83 ec 08             	sub    $0x8,%esp
    2b86:	68 d1 54 00 00       	push   $0x54d1
    2b8b:	6a 01                	push   $0x1
    2b8d:	e8 6e 20 00 00       	call   4c00 <printf>
    2b92:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2b95:	5b                   	pop    %ebx
    2b96:	5e                   	pop    %esi
    2b97:	5f                   	pop    %edi
    2b98:	5d                   	pop    %ebp
    2b99:	c3                   	ret    
    2b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2ba0:	83 ec 08             	sub    $0x8,%esp
    2ba3:	68 49 57 00 00       	push   $0x5749
    2ba8:	68 cd 54 00 00       	push   $0x54cd
    2bad:	e8 27 1f 00 00       	call   4ad9 <link>
    2bb2:	83 c4 10             	add    $0x10,%esp
    2bb5:	e9 7b ff ff ff       	jmp    2b35 <linkunlink+0x65>
    2bba:	52                   	push   %edx
    2bbb:	52                   	push   %edx
    2bbc:	68 31 5d 00 00       	push   $0x5d31
    2bc1:	6a 01                	push   $0x1
    2bc3:	e8 38 20 00 00       	call   4c00 <printf>
    2bc8:	e8 ac 1e 00 00       	call   4a79 <exit>
    2bcd:	e8 a7 1e 00 00       	call   4a79 <exit>
    2bd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002be0 <bigdir>:
    2be0:	55                   	push   %ebp
    2be1:	89 e5                	mov    %esp,%ebp
    2be3:	57                   	push   %edi
    2be4:	56                   	push   %esi
    2be5:	53                   	push   %ebx
    2be6:	83 ec 24             	sub    $0x24,%esp
    2be9:	68 e0 54 00 00       	push   $0x54e0
    2bee:	6a 01                	push   $0x1
    2bf0:	e8 0b 20 00 00       	call   4c00 <printf>
    2bf5:	c7 04 24 ed 54 00 00 	movl   $0x54ed,(%esp)
    2bfc:	e8 c8 1e 00 00       	call   4ac9 <unlink>
    2c01:	5a                   	pop    %edx
    2c02:	59                   	pop    %ecx
    2c03:	68 00 02 00 00       	push   $0x200
    2c08:	68 ed 54 00 00       	push   $0x54ed
    2c0d:	e8 a7 1e 00 00       	call   4ab9 <open>
    2c12:	83 c4 10             	add    $0x10,%esp
    2c15:	85 c0                	test   %eax,%eax
    2c17:	0f 88 de 00 00 00    	js     2cfb <bigdir+0x11b>
    2c1d:	83 ec 0c             	sub    $0xc,%esp
    2c20:	8d 7d de             	lea    -0x22(%ebp),%edi
    2c23:	31 f6                	xor    %esi,%esi
    2c25:	50                   	push   %eax
    2c26:	e8 76 1e 00 00       	call   4aa1 <close>
    2c2b:	83 c4 10             	add    $0x10,%esp
    2c2e:	66 90                	xchg   %ax,%ax
    2c30:	89 f0                	mov    %esi,%eax
    2c32:	83 ec 08             	sub    $0x8,%esp
    2c35:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    2c39:	c1 f8 06             	sar    $0x6,%eax
    2c3c:	57                   	push   %edi
    2c3d:	68 ed 54 00 00       	push   $0x54ed
    2c42:	83 c0 30             	add    $0x30,%eax
    2c45:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    2c49:	88 45 df             	mov    %al,-0x21(%ebp)
    2c4c:	89 f0                	mov    %esi,%eax
    2c4e:	83 e0 3f             	and    $0x3f,%eax
    2c51:	83 c0 30             	add    $0x30,%eax
    2c54:	88 45 e0             	mov    %al,-0x20(%ebp)
    2c57:	e8 7d 1e 00 00       	call   4ad9 <link>
    2c5c:	83 c4 10             	add    $0x10,%esp
    2c5f:	85 c0                	test   %eax,%eax
    2c61:	89 c3                	mov    %eax,%ebx
    2c63:	75 6e                	jne    2cd3 <bigdir+0xf3>
    2c65:	83 c6 01             	add    $0x1,%esi
    2c68:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    2c6e:	75 c0                	jne    2c30 <bigdir+0x50>
    2c70:	83 ec 0c             	sub    $0xc,%esp
    2c73:	68 ed 54 00 00       	push   $0x54ed
    2c78:	e8 4c 1e 00 00       	call   4ac9 <unlink>
    2c7d:	83 c4 10             	add    $0x10,%esp
    2c80:	89 d8                	mov    %ebx,%eax
    2c82:	83 ec 0c             	sub    $0xc,%esp
    2c85:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    2c89:	c1 f8 06             	sar    $0x6,%eax
    2c8c:	57                   	push   %edi
    2c8d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    2c91:	83 c0 30             	add    $0x30,%eax
    2c94:	88 45 df             	mov    %al,-0x21(%ebp)
    2c97:	89 d8                	mov    %ebx,%eax
    2c99:	83 e0 3f             	and    $0x3f,%eax
    2c9c:	83 c0 30             	add    $0x30,%eax
    2c9f:	88 45 e0             	mov    %al,-0x20(%ebp)
    2ca2:	e8 22 1e 00 00       	call   4ac9 <unlink>
    2ca7:	83 c4 10             	add    $0x10,%esp
    2caa:	85 c0                	test   %eax,%eax
    2cac:	75 39                	jne    2ce7 <bigdir+0x107>
    2cae:	83 c3 01             	add    $0x1,%ebx
    2cb1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    2cb7:	75 c7                	jne    2c80 <bigdir+0xa0>
    2cb9:	83 ec 08             	sub    $0x8,%esp
    2cbc:	68 2f 55 00 00       	push   $0x552f
    2cc1:	6a 01                	push   $0x1
    2cc3:	e8 38 1f 00 00       	call   4c00 <printf>
    2cc8:	83 c4 10             	add    $0x10,%esp
    2ccb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2cce:	5b                   	pop    %ebx
    2ccf:	5e                   	pop    %esi
    2cd0:	5f                   	pop    %edi
    2cd1:	5d                   	pop    %ebp
    2cd2:	c3                   	ret    
    2cd3:	83 ec 08             	sub    $0x8,%esp
    2cd6:	68 06 55 00 00       	push   $0x5506
    2cdb:	6a 01                	push   $0x1
    2cdd:	e8 1e 1f 00 00       	call   4c00 <printf>
    2ce2:	e8 92 1d 00 00       	call   4a79 <exit>
    2ce7:	83 ec 08             	sub    $0x8,%esp
    2cea:	68 1a 55 00 00       	push   $0x551a
    2cef:	6a 01                	push   $0x1
    2cf1:	e8 0a 1f 00 00       	call   4c00 <printf>
    2cf6:	e8 7e 1d 00 00       	call   4a79 <exit>
    2cfb:	50                   	push   %eax
    2cfc:	50                   	push   %eax
    2cfd:	68 f0 54 00 00       	push   $0x54f0
    2d02:	6a 01                	push   $0x1
    2d04:	e8 f7 1e 00 00       	call   4c00 <printf>
    2d09:	e8 6b 1d 00 00       	call   4a79 <exit>
    2d0e:	66 90                	xchg   %ax,%ax

00002d10 <subdir>:
    2d10:	55                   	push   %ebp
    2d11:	89 e5                	mov    %esp,%ebp
    2d13:	53                   	push   %ebx
    2d14:	83 ec 0c             	sub    $0xc,%esp
    2d17:	68 3a 55 00 00       	push   $0x553a
    2d1c:	6a 01                	push   $0x1
    2d1e:	e8 dd 1e 00 00       	call   4c00 <printf>
    2d23:	c7 04 24 c3 55 00 00 	movl   $0x55c3,(%esp)
    2d2a:	e8 9a 1d 00 00       	call   4ac9 <unlink>
    2d2f:	c7 04 24 60 56 00 00 	movl   $0x5660,(%esp)
    2d36:	e8 a6 1d 00 00       	call   4ae1 <mkdir>
    2d3b:	83 c4 10             	add    $0x10,%esp
    2d3e:	85 c0                	test   %eax,%eax
    2d40:	0f 85 b3 05 00 00    	jne    32f9 <subdir+0x5e9>
    2d46:	83 ec 08             	sub    $0x8,%esp
    2d49:	68 02 02 00 00       	push   $0x202
    2d4e:	68 99 55 00 00       	push   $0x5599
    2d53:	e8 61 1d 00 00       	call   4ab9 <open>
    2d58:	83 c4 10             	add    $0x10,%esp
    2d5b:	85 c0                	test   %eax,%eax
    2d5d:	89 c3                	mov    %eax,%ebx
    2d5f:	0f 88 81 05 00 00    	js     32e6 <subdir+0x5d6>
    2d65:	83 ec 04             	sub    $0x4,%esp
    2d68:	6a 02                	push   $0x2
    2d6a:	68 c3 55 00 00       	push   $0x55c3
    2d6f:	50                   	push   %eax
    2d70:	e8 24 1d 00 00       	call   4a99 <write>
    2d75:	89 1c 24             	mov    %ebx,(%esp)
    2d78:	e8 24 1d 00 00       	call   4aa1 <close>
    2d7d:	c7 04 24 60 56 00 00 	movl   $0x5660,(%esp)
    2d84:	e8 40 1d 00 00       	call   4ac9 <unlink>
    2d89:	83 c4 10             	add    $0x10,%esp
    2d8c:	85 c0                	test   %eax,%eax
    2d8e:	0f 89 3f 05 00 00    	jns    32d3 <subdir+0x5c3>
    2d94:	83 ec 0c             	sub    $0xc,%esp
    2d97:	68 74 55 00 00       	push   $0x5574
    2d9c:	e8 40 1d 00 00       	call   4ae1 <mkdir>
    2da1:	83 c4 10             	add    $0x10,%esp
    2da4:	85 c0                	test   %eax,%eax
    2da6:	0f 85 14 05 00 00    	jne    32c0 <subdir+0x5b0>
    2dac:	83 ec 08             	sub    $0x8,%esp
    2daf:	68 02 02 00 00       	push   $0x202
    2db4:	68 96 55 00 00       	push   $0x5596
    2db9:	e8 fb 1c 00 00       	call   4ab9 <open>
    2dbe:	83 c4 10             	add    $0x10,%esp
    2dc1:	85 c0                	test   %eax,%eax
    2dc3:	89 c3                	mov    %eax,%ebx
    2dc5:	0f 88 24 04 00 00    	js     31ef <subdir+0x4df>
    2dcb:	83 ec 04             	sub    $0x4,%esp
    2dce:	6a 02                	push   $0x2
    2dd0:	68 b7 55 00 00       	push   $0x55b7
    2dd5:	50                   	push   %eax
    2dd6:	e8 be 1c 00 00       	call   4a99 <write>
    2ddb:	89 1c 24             	mov    %ebx,(%esp)
    2dde:	e8 be 1c 00 00       	call   4aa1 <close>
    2de3:	58                   	pop    %eax
    2de4:	5a                   	pop    %edx
    2de5:	6a 00                	push   $0x0
    2de7:	68 ba 55 00 00       	push   $0x55ba
    2dec:	e8 c8 1c 00 00       	call   4ab9 <open>
    2df1:	83 c4 10             	add    $0x10,%esp
    2df4:	85 c0                	test   %eax,%eax
    2df6:	89 c3                	mov    %eax,%ebx
    2df8:	0f 88 de 03 00 00    	js     31dc <subdir+0x4cc>
    2dfe:	83 ec 04             	sub    $0x4,%esp
    2e01:	68 00 20 00 00       	push   $0x2000
    2e06:	68 c0 96 00 00       	push   $0x96c0
    2e0b:	50                   	push   %eax
    2e0c:	e8 80 1c 00 00       	call   4a91 <read>
    2e11:	83 c4 10             	add    $0x10,%esp
    2e14:	83 f8 02             	cmp    $0x2,%eax
    2e17:	0f 85 3a 03 00 00    	jne    3157 <subdir+0x447>
    2e1d:	80 3d c0 96 00 00 66 	cmpb   $0x66,0x96c0
    2e24:	0f 85 2d 03 00 00    	jne    3157 <subdir+0x447>
    2e2a:	83 ec 0c             	sub    $0xc,%esp
    2e2d:	53                   	push   %ebx
    2e2e:	e8 6e 1c 00 00       	call   4aa1 <close>
    2e33:	5b                   	pop    %ebx
    2e34:	58                   	pop    %eax
    2e35:	68 fa 55 00 00       	push   $0x55fa
    2e3a:	68 96 55 00 00       	push   $0x5596
    2e3f:	e8 95 1c 00 00       	call   4ad9 <link>
    2e44:	83 c4 10             	add    $0x10,%esp
    2e47:	85 c0                	test   %eax,%eax
    2e49:	0f 85 c6 03 00 00    	jne    3215 <subdir+0x505>
    2e4f:	83 ec 0c             	sub    $0xc,%esp
    2e52:	68 96 55 00 00       	push   $0x5596
    2e57:	e8 6d 1c 00 00       	call   4ac9 <unlink>
    2e5c:	83 c4 10             	add    $0x10,%esp
    2e5f:	85 c0                	test   %eax,%eax
    2e61:	0f 85 16 03 00 00    	jne    317d <subdir+0x46d>
    2e67:	83 ec 08             	sub    $0x8,%esp
    2e6a:	6a 00                	push   $0x0
    2e6c:	68 96 55 00 00       	push   $0x5596
    2e71:	e8 43 1c 00 00       	call   4ab9 <open>
    2e76:	83 c4 10             	add    $0x10,%esp
    2e79:	85 c0                	test   %eax,%eax
    2e7b:	0f 89 2c 04 00 00    	jns    32ad <subdir+0x59d>
    2e81:	83 ec 0c             	sub    $0xc,%esp
    2e84:	68 60 56 00 00       	push   $0x5660
    2e89:	e8 5b 1c 00 00       	call   4ae9 <chdir>
    2e8e:	83 c4 10             	add    $0x10,%esp
    2e91:	85 c0                	test   %eax,%eax
    2e93:	0f 85 01 04 00 00    	jne    329a <subdir+0x58a>
    2e99:	83 ec 0c             	sub    $0xc,%esp
    2e9c:	68 2e 56 00 00       	push   $0x562e
    2ea1:	e8 43 1c 00 00       	call   4ae9 <chdir>
    2ea6:	83 c4 10             	add    $0x10,%esp
    2ea9:	85 c0                	test   %eax,%eax
    2eab:	0f 85 b9 02 00 00    	jne    316a <subdir+0x45a>
    2eb1:	83 ec 0c             	sub    $0xc,%esp
    2eb4:	68 54 56 00 00       	push   $0x5654
    2eb9:	e8 2b 1c 00 00       	call   4ae9 <chdir>
    2ebe:	83 c4 10             	add    $0x10,%esp
    2ec1:	85 c0                	test   %eax,%eax
    2ec3:	0f 85 a1 02 00 00    	jne    316a <subdir+0x45a>
    2ec9:	83 ec 0c             	sub    $0xc,%esp
    2ecc:	68 63 56 00 00       	push   $0x5663
    2ed1:	e8 13 1c 00 00       	call   4ae9 <chdir>
    2ed6:	83 c4 10             	add    $0x10,%esp
    2ed9:	85 c0                	test   %eax,%eax
    2edb:	0f 85 21 03 00 00    	jne    3202 <subdir+0x4f2>
    2ee1:	83 ec 08             	sub    $0x8,%esp
    2ee4:	6a 00                	push   $0x0
    2ee6:	68 fa 55 00 00       	push   $0x55fa
    2eeb:	e8 c9 1b 00 00       	call   4ab9 <open>
    2ef0:	83 c4 10             	add    $0x10,%esp
    2ef3:	85 c0                	test   %eax,%eax
    2ef5:	89 c3                	mov    %eax,%ebx
    2ef7:	0f 88 e0 04 00 00    	js     33dd <subdir+0x6cd>
    2efd:	83 ec 04             	sub    $0x4,%esp
    2f00:	68 00 20 00 00       	push   $0x2000
    2f05:	68 c0 96 00 00       	push   $0x96c0
    2f0a:	50                   	push   %eax
    2f0b:	e8 81 1b 00 00       	call   4a91 <read>
    2f10:	83 c4 10             	add    $0x10,%esp
    2f13:	83 f8 02             	cmp    $0x2,%eax
    2f16:	0f 85 ae 04 00 00    	jne    33ca <subdir+0x6ba>
    2f1c:	83 ec 0c             	sub    $0xc,%esp
    2f1f:	53                   	push   %ebx
    2f20:	e8 7c 1b 00 00       	call   4aa1 <close>
    2f25:	59                   	pop    %ecx
    2f26:	5b                   	pop    %ebx
    2f27:	6a 00                	push   $0x0
    2f29:	68 96 55 00 00       	push   $0x5596
    2f2e:	e8 86 1b 00 00       	call   4ab9 <open>
    2f33:	83 c4 10             	add    $0x10,%esp
    2f36:	85 c0                	test   %eax,%eax
    2f38:	0f 89 65 02 00 00    	jns    31a3 <subdir+0x493>
    2f3e:	83 ec 08             	sub    $0x8,%esp
    2f41:	68 02 02 00 00       	push   $0x202
    2f46:	68 ae 56 00 00       	push   $0x56ae
    2f4b:	e8 69 1b 00 00       	call   4ab9 <open>
    2f50:	83 c4 10             	add    $0x10,%esp
    2f53:	85 c0                	test   %eax,%eax
    2f55:	0f 89 35 02 00 00    	jns    3190 <subdir+0x480>
    2f5b:	83 ec 08             	sub    $0x8,%esp
    2f5e:	68 02 02 00 00       	push   $0x202
    2f63:	68 d3 56 00 00       	push   $0x56d3
    2f68:	e8 4c 1b 00 00       	call   4ab9 <open>
    2f6d:	83 c4 10             	add    $0x10,%esp
    2f70:	85 c0                	test   %eax,%eax
    2f72:	0f 89 0f 03 00 00    	jns    3287 <subdir+0x577>
    2f78:	83 ec 08             	sub    $0x8,%esp
    2f7b:	68 00 02 00 00       	push   $0x200
    2f80:	68 60 56 00 00       	push   $0x5660
    2f85:	e8 2f 1b 00 00       	call   4ab9 <open>
    2f8a:	83 c4 10             	add    $0x10,%esp
    2f8d:	85 c0                	test   %eax,%eax
    2f8f:	0f 89 df 02 00 00    	jns    3274 <subdir+0x564>
    2f95:	83 ec 08             	sub    $0x8,%esp
    2f98:	6a 02                	push   $0x2
    2f9a:	68 60 56 00 00       	push   $0x5660
    2f9f:	e8 15 1b 00 00       	call   4ab9 <open>
    2fa4:	83 c4 10             	add    $0x10,%esp
    2fa7:	85 c0                	test   %eax,%eax
    2fa9:	0f 89 b2 02 00 00    	jns    3261 <subdir+0x551>
    2faf:	83 ec 08             	sub    $0x8,%esp
    2fb2:	6a 01                	push   $0x1
    2fb4:	68 60 56 00 00       	push   $0x5660
    2fb9:	e8 fb 1a 00 00       	call   4ab9 <open>
    2fbe:	83 c4 10             	add    $0x10,%esp
    2fc1:	85 c0                	test   %eax,%eax
    2fc3:	0f 89 85 02 00 00    	jns    324e <subdir+0x53e>
    2fc9:	83 ec 08             	sub    $0x8,%esp
    2fcc:	68 42 57 00 00       	push   $0x5742
    2fd1:	68 ae 56 00 00       	push   $0x56ae
    2fd6:	e8 fe 1a 00 00       	call   4ad9 <link>
    2fdb:	83 c4 10             	add    $0x10,%esp
    2fde:	85 c0                	test   %eax,%eax
    2fe0:	0f 84 55 02 00 00    	je     323b <subdir+0x52b>
    2fe6:	83 ec 08             	sub    $0x8,%esp
    2fe9:	68 42 57 00 00       	push   $0x5742
    2fee:	68 d3 56 00 00       	push   $0x56d3
    2ff3:	e8 e1 1a 00 00       	call   4ad9 <link>
    2ff8:	83 c4 10             	add    $0x10,%esp
    2ffb:	85 c0                	test   %eax,%eax
    2ffd:	0f 84 25 02 00 00    	je     3228 <subdir+0x518>
    3003:	83 ec 08             	sub    $0x8,%esp
    3006:	68 fa 55 00 00       	push   $0x55fa
    300b:	68 99 55 00 00       	push   $0x5599
    3010:	e8 c4 1a 00 00       	call   4ad9 <link>
    3015:	83 c4 10             	add    $0x10,%esp
    3018:	85 c0                	test   %eax,%eax
    301a:	0f 84 a9 01 00 00    	je     31c9 <subdir+0x4b9>
    3020:	83 ec 0c             	sub    $0xc,%esp
    3023:	68 ae 56 00 00       	push   $0x56ae
    3028:	e8 b4 1a 00 00       	call   4ae1 <mkdir>
    302d:	83 c4 10             	add    $0x10,%esp
    3030:	85 c0                	test   %eax,%eax
    3032:	0f 84 7e 01 00 00    	je     31b6 <subdir+0x4a6>
    3038:	83 ec 0c             	sub    $0xc,%esp
    303b:	68 d3 56 00 00       	push   $0x56d3
    3040:	e8 9c 1a 00 00       	call   4ae1 <mkdir>
    3045:	83 c4 10             	add    $0x10,%esp
    3048:	85 c0                	test   %eax,%eax
    304a:	0f 84 67 03 00 00    	je     33b7 <subdir+0x6a7>
    3050:	83 ec 0c             	sub    $0xc,%esp
    3053:	68 fa 55 00 00       	push   $0x55fa
    3058:	e8 84 1a 00 00       	call   4ae1 <mkdir>
    305d:	83 c4 10             	add    $0x10,%esp
    3060:	85 c0                	test   %eax,%eax
    3062:	0f 84 3c 03 00 00    	je     33a4 <subdir+0x694>
    3068:	83 ec 0c             	sub    $0xc,%esp
    306b:	68 d3 56 00 00       	push   $0x56d3
    3070:	e8 54 1a 00 00       	call   4ac9 <unlink>
    3075:	83 c4 10             	add    $0x10,%esp
    3078:	85 c0                	test   %eax,%eax
    307a:	0f 84 11 03 00 00    	je     3391 <subdir+0x681>
    3080:	83 ec 0c             	sub    $0xc,%esp
    3083:	68 ae 56 00 00       	push   $0x56ae
    3088:	e8 3c 1a 00 00       	call   4ac9 <unlink>
    308d:	83 c4 10             	add    $0x10,%esp
    3090:	85 c0                	test   %eax,%eax
    3092:	0f 84 e6 02 00 00    	je     337e <subdir+0x66e>
    3098:	83 ec 0c             	sub    $0xc,%esp
    309b:	68 99 55 00 00       	push   $0x5599
    30a0:	e8 44 1a 00 00       	call   4ae9 <chdir>
    30a5:	83 c4 10             	add    $0x10,%esp
    30a8:	85 c0                	test   %eax,%eax
    30aa:	0f 84 bb 02 00 00    	je     336b <subdir+0x65b>
    30b0:	83 ec 0c             	sub    $0xc,%esp
    30b3:	68 45 57 00 00       	push   $0x5745
    30b8:	e8 2c 1a 00 00       	call   4ae9 <chdir>
    30bd:	83 c4 10             	add    $0x10,%esp
    30c0:	85 c0                	test   %eax,%eax
    30c2:	0f 84 90 02 00 00    	je     3358 <subdir+0x648>
    30c8:	83 ec 0c             	sub    $0xc,%esp
    30cb:	68 fa 55 00 00       	push   $0x55fa
    30d0:	e8 f4 19 00 00       	call   4ac9 <unlink>
    30d5:	83 c4 10             	add    $0x10,%esp
    30d8:	85 c0                	test   %eax,%eax
    30da:	0f 85 9d 00 00 00    	jne    317d <subdir+0x46d>
    30e0:	83 ec 0c             	sub    $0xc,%esp
    30e3:	68 99 55 00 00       	push   $0x5599
    30e8:	e8 dc 19 00 00       	call   4ac9 <unlink>
    30ed:	83 c4 10             	add    $0x10,%esp
    30f0:	85 c0                	test   %eax,%eax
    30f2:	0f 85 4d 02 00 00    	jne    3345 <subdir+0x635>
    30f8:	83 ec 0c             	sub    $0xc,%esp
    30fb:	68 60 56 00 00       	push   $0x5660
    3100:	e8 c4 19 00 00       	call   4ac9 <unlink>
    3105:	83 c4 10             	add    $0x10,%esp
    3108:	85 c0                	test   %eax,%eax
    310a:	0f 84 22 02 00 00    	je     3332 <subdir+0x622>
    3110:	83 ec 0c             	sub    $0xc,%esp
    3113:	68 75 55 00 00       	push   $0x5575
    3118:	e8 ac 19 00 00       	call   4ac9 <unlink>
    311d:	83 c4 10             	add    $0x10,%esp
    3120:	85 c0                	test   %eax,%eax
    3122:	0f 88 f7 01 00 00    	js     331f <subdir+0x60f>
    3128:	83 ec 0c             	sub    $0xc,%esp
    312b:	68 60 56 00 00       	push   $0x5660
    3130:	e8 94 19 00 00       	call   4ac9 <unlink>
    3135:	83 c4 10             	add    $0x10,%esp
    3138:	85 c0                	test   %eax,%eax
    313a:	0f 88 cc 01 00 00    	js     330c <subdir+0x5fc>
    3140:	83 ec 08             	sub    $0x8,%esp
    3143:	68 42 58 00 00       	push   $0x5842
    3148:	6a 01                	push   $0x1
    314a:	e8 b1 1a 00 00       	call   4c00 <printf>
    314f:	83 c4 10             	add    $0x10,%esp
    3152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3155:	c9                   	leave  
    3156:	c3                   	ret    
    3157:	50                   	push   %eax
    3158:	50                   	push   %eax
    3159:	68 df 55 00 00       	push   $0x55df
    315e:	6a 01                	push   $0x1
    3160:	e8 9b 1a 00 00       	call   4c00 <printf>
    3165:	e8 0f 19 00 00       	call   4a79 <exit>
    316a:	50                   	push   %eax
    316b:	50                   	push   %eax
    316c:	68 3a 56 00 00       	push   $0x563a
    3171:	6a 01                	push   $0x1
    3173:	e8 88 1a 00 00       	call   4c00 <printf>
    3178:	e8 fc 18 00 00       	call   4a79 <exit>
    317d:	52                   	push   %edx
    317e:	52                   	push   %edx
    317f:	68 05 56 00 00       	push   $0x5605
    3184:	6a 01                	push   $0x1
    3186:	e8 75 1a 00 00       	call   4c00 <printf>
    318b:	e8 e9 18 00 00       	call   4a79 <exit>
    3190:	50                   	push   %eax
    3191:	50                   	push   %eax
    3192:	68 b7 56 00 00       	push   $0x56b7
    3197:	6a 01                	push   $0x1
    3199:	e8 62 1a 00 00       	call   4c00 <printf>
    319e:	e8 d6 18 00 00       	call   4a79 <exit>
    31a3:	52                   	push   %edx
    31a4:	52                   	push   %edx
    31a5:	68 9c 60 00 00       	push   $0x609c
    31aa:	6a 01                	push   $0x1
    31ac:	e8 4f 1a 00 00       	call   4c00 <printf>
    31b1:	e8 c3 18 00 00       	call   4a79 <exit>
    31b6:	52                   	push   %edx
    31b7:	52                   	push   %edx
    31b8:	68 4b 57 00 00       	push   $0x574b
    31bd:	6a 01                	push   $0x1
    31bf:	e8 3c 1a 00 00       	call   4c00 <printf>
    31c4:	e8 b0 18 00 00       	call   4a79 <exit>
    31c9:	51                   	push   %ecx
    31ca:	51                   	push   %ecx
    31cb:	68 0c 61 00 00       	push   $0x610c
    31d0:	6a 01                	push   $0x1
    31d2:	e8 29 1a 00 00       	call   4c00 <printf>
    31d7:	e8 9d 18 00 00       	call   4a79 <exit>
    31dc:	50                   	push   %eax
    31dd:	50                   	push   %eax
    31de:	68 c6 55 00 00       	push   $0x55c6
    31e3:	6a 01                	push   $0x1
    31e5:	e8 16 1a 00 00       	call   4c00 <printf>
    31ea:	e8 8a 18 00 00       	call   4a79 <exit>
    31ef:	51                   	push   %ecx
    31f0:	51                   	push   %ecx
    31f1:	68 9f 55 00 00       	push   $0x559f
    31f6:	6a 01                	push   $0x1
    31f8:	e8 03 1a 00 00       	call   4c00 <printf>
    31fd:	e8 77 18 00 00       	call   4a79 <exit>
    3202:	50                   	push   %eax
    3203:	50                   	push   %eax
    3204:	68 68 56 00 00       	push   $0x5668
    3209:	6a 01                	push   $0x1
    320b:	e8 f0 19 00 00       	call   4c00 <printf>
    3210:	e8 64 18 00 00       	call   4a79 <exit>
    3215:	51                   	push   %ecx
    3216:	51                   	push   %ecx
    3217:	68 54 60 00 00       	push   $0x6054
    321c:	6a 01                	push   $0x1
    321e:	e8 dd 19 00 00       	call   4c00 <printf>
    3223:	e8 51 18 00 00       	call   4a79 <exit>
    3228:	53                   	push   %ebx
    3229:	53                   	push   %ebx
    322a:	68 e8 60 00 00       	push   $0x60e8
    322f:	6a 01                	push   $0x1
    3231:	e8 ca 19 00 00       	call   4c00 <printf>
    3236:	e8 3e 18 00 00       	call   4a79 <exit>
    323b:	50                   	push   %eax
    323c:	50                   	push   %eax
    323d:	68 c4 60 00 00       	push   $0x60c4
    3242:	6a 01                	push   $0x1
    3244:	e8 b7 19 00 00       	call   4c00 <printf>
    3249:	e8 2b 18 00 00       	call   4a79 <exit>
    324e:	50                   	push   %eax
    324f:	50                   	push   %eax
    3250:	68 27 57 00 00       	push   $0x5727
    3255:	6a 01                	push   $0x1
    3257:	e8 a4 19 00 00       	call   4c00 <printf>
    325c:	e8 18 18 00 00       	call   4a79 <exit>
    3261:	50                   	push   %eax
    3262:	50                   	push   %eax
    3263:	68 0e 57 00 00       	push   $0x570e
    3268:	6a 01                	push   $0x1
    326a:	e8 91 19 00 00       	call   4c00 <printf>
    326f:	e8 05 18 00 00       	call   4a79 <exit>
    3274:	50                   	push   %eax
    3275:	50                   	push   %eax
    3276:	68 f8 56 00 00       	push   $0x56f8
    327b:	6a 01                	push   $0x1
    327d:	e8 7e 19 00 00       	call   4c00 <printf>
    3282:	e8 f2 17 00 00       	call   4a79 <exit>
    3287:	50                   	push   %eax
    3288:	50                   	push   %eax
    3289:	68 dc 56 00 00       	push   $0x56dc
    328e:	6a 01                	push   $0x1
    3290:	e8 6b 19 00 00       	call   4c00 <printf>
    3295:	e8 df 17 00 00       	call   4a79 <exit>
    329a:	50                   	push   %eax
    329b:	50                   	push   %eax
    329c:	68 1d 56 00 00       	push   $0x561d
    32a1:	6a 01                	push   $0x1
    32a3:	e8 58 19 00 00       	call   4c00 <printf>
    32a8:	e8 cc 17 00 00       	call   4a79 <exit>
    32ad:	50                   	push   %eax
    32ae:	50                   	push   %eax
    32af:	68 78 60 00 00       	push   $0x6078
    32b4:	6a 01                	push   $0x1
    32b6:	e8 45 19 00 00       	call   4c00 <printf>
    32bb:	e8 b9 17 00 00       	call   4a79 <exit>
    32c0:	53                   	push   %ebx
    32c1:	53                   	push   %ebx
    32c2:	68 7b 55 00 00       	push   $0x557b
    32c7:	6a 01                	push   $0x1
    32c9:	e8 32 19 00 00       	call   4c00 <printf>
    32ce:	e8 a6 17 00 00       	call   4a79 <exit>
    32d3:	50                   	push   %eax
    32d4:	50                   	push   %eax
    32d5:	68 2c 60 00 00       	push   $0x602c
    32da:	6a 01                	push   $0x1
    32dc:	e8 1f 19 00 00       	call   4c00 <printf>
    32e1:	e8 93 17 00 00       	call   4a79 <exit>
    32e6:	50                   	push   %eax
    32e7:	50                   	push   %eax
    32e8:	68 5f 55 00 00       	push   $0x555f
    32ed:	6a 01                	push   $0x1
    32ef:	e8 0c 19 00 00       	call   4c00 <printf>
    32f4:	e8 80 17 00 00       	call   4a79 <exit>
    32f9:	50                   	push   %eax
    32fa:	50                   	push   %eax
    32fb:	68 47 55 00 00       	push   $0x5547
    3300:	6a 01                	push   $0x1
    3302:	e8 f9 18 00 00       	call   4c00 <printf>
    3307:	e8 6d 17 00 00       	call   4a79 <exit>
    330c:	50                   	push   %eax
    330d:	50                   	push   %eax
    330e:	68 30 58 00 00       	push   $0x5830
    3313:	6a 01                	push   $0x1
    3315:	e8 e6 18 00 00       	call   4c00 <printf>
    331a:	e8 5a 17 00 00       	call   4a79 <exit>
    331f:	52                   	push   %edx
    3320:	52                   	push   %edx
    3321:	68 1b 58 00 00       	push   $0x581b
    3326:	6a 01                	push   $0x1
    3328:	e8 d3 18 00 00       	call   4c00 <printf>
    332d:	e8 47 17 00 00       	call   4a79 <exit>
    3332:	51                   	push   %ecx
    3333:	51                   	push   %ecx
    3334:	68 30 61 00 00       	push   $0x6130
    3339:	6a 01                	push   $0x1
    333b:	e8 c0 18 00 00       	call   4c00 <printf>
    3340:	e8 34 17 00 00       	call   4a79 <exit>
    3345:	53                   	push   %ebx
    3346:	53                   	push   %ebx
    3347:	68 06 58 00 00       	push   $0x5806
    334c:	6a 01                	push   $0x1
    334e:	e8 ad 18 00 00       	call   4c00 <printf>
    3353:	e8 21 17 00 00       	call   4a79 <exit>
    3358:	50                   	push   %eax
    3359:	50                   	push   %eax
    335a:	68 ee 57 00 00       	push   $0x57ee
    335f:	6a 01                	push   $0x1
    3361:	e8 9a 18 00 00       	call   4c00 <printf>
    3366:	e8 0e 17 00 00       	call   4a79 <exit>
    336b:	50                   	push   %eax
    336c:	50                   	push   %eax
    336d:	68 d6 57 00 00       	push   $0x57d6
    3372:	6a 01                	push   $0x1
    3374:	e8 87 18 00 00       	call   4c00 <printf>
    3379:	e8 fb 16 00 00       	call   4a79 <exit>
    337e:	50                   	push   %eax
    337f:	50                   	push   %eax
    3380:	68 ba 57 00 00       	push   $0x57ba
    3385:	6a 01                	push   $0x1
    3387:	e8 74 18 00 00       	call   4c00 <printf>
    338c:	e8 e8 16 00 00       	call   4a79 <exit>
    3391:	50                   	push   %eax
    3392:	50                   	push   %eax
    3393:	68 9e 57 00 00       	push   $0x579e
    3398:	6a 01                	push   $0x1
    339a:	e8 61 18 00 00       	call   4c00 <printf>
    339f:	e8 d5 16 00 00       	call   4a79 <exit>
    33a4:	50                   	push   %eax
    33a5:	50                   	push   %eax
    33a6:	68 81 57 00 00       	push   $0x5781
    33ab:	6a 01                	push   $0x1
    33ad:	e8 4e 18 00 00       	call   4c00 <printf>
    33b2:	e8 c2 16 00 00       	call   4a79 <exit>
    33b7:	50                   	push   %eax
    33b8:	50                   	push   %eax
    33b9:	68 66 57 00 00       	push   $0x5766
    33be:	6a 01                	push   $0x1
    33c0:	e8 3b 18 00 00       	call   4c00 <printf>
    33c5:	e8 af 16 00 00       	call   4a79 <exit>
    33ca:	50                   	push   %eax
    33cb:	50                   	push   %eax
    33cc:	68 93 56 00 00       	push   $0x5693
    33d1:	6a 01                	push   $0x1
    33d3:	e8 28 18 00 00       	call   4c00 <printf>
    33d8:	e8 9c 16 00 00       	call   4a79 <exit>
    33dd:	50                   	push   %eax
    33de:	50                   	push   %eax
    33df:	68 7b 56 00 00       	push   $0x567b
    33e4:	6a 01                	push   $0x1
    33e6:	e8 15 18 00 00       	call   4c00 <printf>
    33eb:	e8 89 16 00 00       	call   4a79 <exit>

000033f0 <bigwrite>:
    33f0:	55                   	push   %ebp
    33f1:	89 e5                	mov    %esp,%ebp
    33f3:	56                   	push   %esi
    33f4:	53                   	push   %ebx
    33f5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
    33fa:	83 ec 08             	sub    $0x8,%esp
    33fd:	68 4d 58 00 00       	push   $0x584d
    3402:	6a 01                	push   $0x1
    3404:	e8 f7 17 00 00       	call   4c00 <printf>
    3409:	c7 04 24 5c 58 00 00 	movl   $0x585c,(%esp)
    3410:	e8 b4 16 00 00       	call   4ac9 <unlink>
    3415:	83 c4 10             	add    $0x10,%esp
    3418:	90                   	nop
    3419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3420:	83 ec 08             	sub    $0x8,%esp
    3423:	68 02 02 00 00       	push   $0x202
    3428:	68 5c 58 00 00       	push   $0x585c
    342d:	e8 87 16 00 00       	call   4ab9 <open>
    3432:	83 c4 10             	add    $0x10,%esp
    3435:	85 c0                	test   %eax,%eax
    3437:	89 c6                	mov    %eax,%esi
    3439:	78 7e                	js     34b9 <bigwrite+0xc9>
    343b:	83 ec 04             	sub    $0x4,%esp
    343e:	53                   	push   %ebx
    343f:	68 c0 96 00 00       	push   $0x96c0
    3444:	50                   	push   %eax
    3445:	e8 4f 16 00 00       	call   4a99 <write>
    344a:	83 c4 10             	add    $0x10,%esp
    344d:	39 d8                	cmp    %ebx,%eax
    344f:	75 55                	jne    34a6 <bigwrite+0xb6>
    3451:	83 ec 04             	sub    $0x4,%esp
    3454:	53                   	push   %ebx
    3455:	68 c0 96 00 00       	push   $0x96c0
    345a:	56                   	push   %esi
    345b:	e8 39 16 00 00       	call   4a99 <write>
    3460:	83 c4 10             	add    $0x10,%esp
    3463:	39 d8                	cmp    %ebx,%eax
    3465:	75 3f                	jne    34a6 <bigwrite+0xb6>
    3467:	83 ec 0c             	sub    $0xc,%esp
    346a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    3470:	56                   	push   %esi
    3471:	e8 2b 16 00 00       	call   4aa1 <close>
    3476:	c7 04 24 5c 58 00 00 	movl   $0x585c,(%esp)
    347d:	e8 47 16 00 00       	call   4ac9 <unlink>
    3482:	83 c4 10             	add    $0x10,%esp
    3485:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    348b:	75 93                	jne    3420 <bigwrite+0x30>
    348d:	83 ec 08             	sub    $0x8,%esp
    3490:	68 8f 58 00 00       	push   $0x588f
    3495:	6a 01                	push   $0x1
    3497:	e8 64 17 00 00       	call   4c00 <printf>
    349c:	83 c4 10             	add    $0x10,%esp
    349f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    34a2:	5b                   	pop    %ebx
    34a3:	5e                   	pop    %esi
    34a4:	5d                   	pop    %ebp
    34a5:	c3                   	ret    
    34a6:	50                   	push   %eax
    34a7:	53                   	push   %ebx
    34a8:	68 7d 58 00 00       	push   $0x587d
    34ad:	6a 01                	push   $0x1
    34af:	e8 4c 17 00 00       	call   4c00 <printf>
    34b4:	e8 c0 15 00 00       	call   4a79 <exit>
    34b9:	83 ec 08             	sub    $0x8,%esp
    34bc:	68 65 58 00 00       	push   $0x5865
    34c1:	6a 01                	push   $0x1
    34c3:	e8 38 17 00 00       	call   4c00 <printf>
    34c8:	e8 ac 15 00 00       	call   4a79 <exit>
    34cd:	8d 76 00             	lea    0x0(%esi),%esi

000034d0 <bigfile>:
    34d0:	55                   	push   %ebp
    34d1:	89 e5                	mov    %esp,%ebp
    34d3:	57                   	push   %edi
    34d4:	56                   	push   %esi
    34d5:	53                   	push   %ebx
    34d6:	83 ec 14             	sub    $0x14,%esp
    34d9:	68 9c 58 00 00       	push   $0x589c
    34de:	6a 01                	push   $0x1
    34e0:	e8 1b 17 00 00       	call   4c00 <printf>
    34e5:	c7 04 24 b8 58 00 00 	movl   $0x58b8,(%esp)
    34ec:	e8 d8 15 00 00       	call   4ac9 <unlink>
    34f1:	58                   	pop    %eax
    34f2:	5a                   	pop    %edx
    34f3:	68 02 02 00 00       	push   $0x202
    34f8:	68 b8 58 00 00       	push   $0x58b8
    34fd:	e8 b7 15 00 00       	call   4ab9 <open>
    3502:	83 c4 10             	add    $0x10,%esp
    3505:	85 c0                	test   %eax,%eax
    3507:	0f 88 5e 01 00 00    	js     366b <bigfile+0x19b>
    350d:	89 c6                	mov    %eax,%esi
    350f:	31 db                	xor    %ebx,%ebx
    3511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3518:	83 ec 04             	sub    $0x4,%esp
    351b:	68 58 02 00 00       	push   $0x258
    3520:	53                   	push   %ebx
    3521:	68 c0 96 00 00       	push   $0x96c0
    3526:	e8 d5 11 00 00       	call   4700 <memset>
    352b:	83 c4 0c             	add    $0xc,%esp
    352e:	68 58 02 00 00       	push   $0x258
    3533:	68 c0 96 00 00       	push   $0x96c0
    3538:	56                   	push   %esi
    3539:	e8 5b 15 00 00       	call   4a99 <write>
    353e:	83 c4 10             	add    $0x10,%esp
    3541:	3d 58 02 00 00       	cmp    $0x258,%eax
    3546:	0f 85 f8 00 00 00    	jne    3644 <bigfile+0x174>
    354c:	83 c3 01             	add    $0x1,%ebx
    354f:	83 fb 14             	cmp    $0x14,%ebx
    3552:	75 c4                	jne    3518 <bigfile+0x48>
    3554:	83 ec 0c             	sub    $0xc,%esp
    3557:	56                   	push   %esi
    3558:	e8 44 15 00 00       	call   4aa1 <close>
    355d:	5e                   	pop    %esi
    355e:	5f                   	pop    %edi
    355f:	6a 00                	push   $0x0
    3561:	68 b8 58 00 00       	push   $0x58b8
    3566:	e8 4e 15 00 00       	call   4ab9 <open>
    356b:	83 c4 10             	add    $0x10,%esp
    356e:	85 c0                	test   %eax,%eax
    3570:	89 c6                	mov    %eax,%esi
    3572:	0f 88 e0 00 00 00    	js     3658 <bigfile+0x188>
    3578:	31 db                	xor    %ebx,%ebx
    357a:	31 ff                	xor    %edi,%edi
    357c:	eb 30                	jmp    35ae <bigfile+0xde>
    357e:	66 90                	xchg   %ax,%ax
    3580:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    3585:	0f 85 91 00 00 00    	jne    361c <bigfile+0x14c>
    358b:	0f be 05 c0 96 00 00 	movsbl 0x96c0,%eax
    3592:	89 fa                	mov    %edi,%edx
    3594:	d1 fa                	sar    %edx
    3596:	39 d0                	cmp    %edx,%eax
    3598:	75 6e                	jne    3608 <bigfile+0x138>
    359a:	0f be 15 eb 97 00 00 	movsbl 0x97eb,%edx
    35a1:	39 d0                	cmp    %edx,%eax
    35a3:	75 63                	jne    3608 <bigfile+0x138>
    35a5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
    35ab:	83 c7 01             	add    $0x1,%edi
    35ae:	83 ec 04             	sub    $0x4,%esp
    35b1:	68 2c 01 00 00       	push   $0x12c
    35b6:	68 c0 96 00 00       	push   $0x96c0
    35bb:	56                   	push   %esi
    35bc:	e8 d0 14 00 00       	call   4a91 <read>
    35c1:	83 c4 10             	add    $0x10,%esp
    35c4:	85 c0                	test   %eax,%eax
    35c6:	78 68                	js     3630 <bigfile+0x160>
    35c8:	75 b6                	jne    3580 <bigfile+0xb0>
    35ca:	83 ec 0c             	sub    $0xc,%esp
    35cd:	56                   	push   %esi
    35ce:	e8 ce 14 00 00       	call   4aa1 <close>
    35d3:	83 c4 10             	add    $0x10,%esp
    35d6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    35dc:	0f 85 9c 00 00 00    	jne    367e <bigfile+0x1ae>
    35e2:	83 ec 0c             	sub    $0xc,%esp
    35e5:	68 b8 58 00 00       	push   $0x58b8
    35ea:	e8 da 14 00 00       	call   4ac9 <unlink>
    35ef:	58                   	pop    %eax
    35f0:	5a                   	pop    %edx
    35f1:	68 47 59 00 00       	push   $0x5947
    35f6:	6a 01                	push   $0x1
    35f8:	e8 03 16 00 00       	call   4c00 <printf>
    35fd:	83 c4 10             	add    $0x10,%esp
    3600:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3603:	5b                   	pop    %ebx
    3604:	5e                   	pop    %esi
    3605:	5f                   	pop    %edi
    3606:	5d                   	pop    %ebp
    3607:	c3                   	ret    
    3608:	83 ec 08             	sub    $0x8,%esp
    360b:	68 14 59 00 00       	push   $0x5914
    3610:	6a 01                	push   $0x1
    3612:	e8 e9 15 00 00       	call   4c00 <printf>
    3617:	e8 5d 14 00 00       	call   4a79 <exit>
    361c:	83 ec 08             	sub    $0x8,%esp
    361f:	68 00 59 00 00       	push   $0x5900
    3624:	6a 01                	push   $0x1
    3626:	e8 d5 15 00 00       	call   4c00 <printf>
    362b:	e8 49 14 00 00       	call   4a79 <exit>
    3630:	83 ec 08             	sub    $0x8,%esp
    3633:	68 eb 58 00 00       	push   $0x58eb
    3638:	6a 01                	push   $0x1
    363a:	e8 c1 15 00 00       	call   4c00 <printf>
    363f:	e8 35 14 00 00       	call   4a79 <exit>
    3644:	83 ec 08             	sub    $0x8,%esp
    3647:	68 c0 58 00 00       	push   $0x58c0
    364c:	6a 01                	push   $0x1
    364e:	e8 ad 15 00 00       	call   4c00 <printf>
    3653:	e8 21 14 00 00       	call   4a79 <exit>
    3658:	53                   	push   %ebx
    3659:	53                   	push   %ebx
    365a:	68 d6 58 00 00       	push   $0x58d6
    365f:	6a 01                	push   $0x1
    3661:	e8 9a 15 00 00       	call   4c00 <printf>
    3666:	e8 0e 14 00 00       	call   4a79 <exit>
    366b:	50                   	push   %eax
    366c:	50                   	push   %eax
    366d:	68 aa 58 00 00       	push   $0x58aa
    3672:	6a 01                	push   $0x1
    3674:	e8 87 15 00 00       	call   4c00 <printf>
    3679:	e8 fb 13 00 00       	call   4a79 <exit>
    367e:	51                   	push   %ecx
    367f:	51                   	push   %ecx
    3680:	68 2d 59 00 00       	push   $0x592d
    3685:	6a 01                	push   $0x1
    3687:	e8 74 15 00 00       	call   4c00 <printf>
    368c:	e8 e8 13 00 00       	call   4a79 <exit>
    3691:	eb 0d                	jmp    36a0 <fourteen>
    3693:	90                   	nop
    3694:	90                   	nop
    3695:	90                   	nop
    3696:	90                   	nop
    3697:	90                   	nop
    3698:	90                   	nop
    3699:	90                   	nop
    369a:	90                   	nop
    369b:	90                   	nop
    369c:	90                   	nop
    369d:	90                   	nop
    369e:	90                   	nop
    369f:	90                   	nop

000036a0 <fourteen>:
    36a0:	55                   	push   %ebp
    36a1:	89 e5                	mov    %esp,%ebp
    36a3:	83 ec 10             	sub    $0x10,%esp
    36a6:	68 58 59 00 00       	push   $0x5958
    36ab:	6a 01                	push   $0x1
    36ad:	e8 4e 15 00 00       	call   4c00 <printf>
    36b2:	c7 04 24 93 59 00 00 	movl   $0x5993,(%esp)
    36b9:	e8 23 14 00 00       	call   4ae1 <mkdir>
    36be:	83 c4 10             	add    $0x10,%esp
    36c1:	85 c0                	test   %eax,%eax
    36c3:	0f 85 97 00 00 00    	jne    3760 <fourteen+0xc0>
    36c9:	83 ec 0c             	sub    $0xc,%esp
    36cc:	68 50 61 00 00       	push   $0x6150
    36d1:	e8 0b 14 00 00       	call   4ae1 <mkdir>
    36d6:	83 c4 10             	add    $0x10,%esp
    36d9:	85 c0                	test   %eax,%eax
    36db:	0f 85 de 00 00 00    	jne    37bf <fourteen+0x11f>
    36e1:	83 ec 08             	sub    $0x8,%esp
    36e4:	68 00 02 00 00       	push   $0x200
    36e9:	68 a0 61 00 00       	push   $0x61a0
    36ee:	e8 c6 13 00 00       	call   4ab9 <open>
    36f3:	83 c4 10             	add    $0x10,%esp
    36f6:	85 c0                	test   %eax,%eax
    36f8:	0f 88 ae 00 00 00    	js     37ac <fourteen+0x10c>
    36fe:	83 ec 0c             	sub    $0xc,%esp
    3701:	50                   	push   %eax
    3702:	e8 9a 13 00 00       	call   4aa1 <close>
    3707:	58                   	pop    %eax
    3708:	5a                   	pop    %edx
    3709:	6a 00                	push   $0x0
    370b:	68 10 62 00 00       	push   $0x6210
    3710:	e8 a4 13 00 00       	call   4ab9 <open>
    3715:	83 c4 10             	add    $0x10,%esp
    3718:	85 c0                	test   %eax,%eax
    371a:	78 7d                	js     3799 <fourteen+0xf9>
    371c:	83 ec 0c             	sub    $0xc,%esp
    371f:	50                   	push   %eax
    3720:	e8 7c 13 00 00       	call   4aa1 <close>
    3725:	c7 04 24 84 59 00 00 	movl   $0x5984,(%esp)
    372c:	e8 b0 13 00 00       	call   4ae1 <mkdir>
    3731:	83 c4 10             	add    $0x10,%esp
    3734:	85 c0                	test   %eax,%eax
    3736:	74 4e                	je     3786 <fourteen+0xe6>
    3738:	83 ec 0c             	sub    $0xc,%esp
    373b:	68 ac 62 00 00       	push   $0x62ac
    3740:	e8 9c 13 00 00       	call   4ae1 <mkdir>
    3745:	83 c4 10             	add    $0x10,%esp
    3748:	85 c0                	test   %eax,%eax
    374a:	74 27                	je     3773 <fourteen+0xd3>
    374c:	83 ec 08             	sub    $0x8,%esp
    374f:	68 a2 59 00 00       	push   $0x59a2
    3754:	6a 01                	push   $0x1
    3756:	e8 a5 14 00 00       	call   4c00 <printf>
    375b:	83 c4 10             	add    $0x10,%esp
    375e:	c9                   	leave  
    375f:	c3                   	ret    
    3760:	50                   	push   %eax
    3761:	50                   	push   %eax
    3762:	68 67 59 00 00       	push   $0x5967
    3767:	6a 01                	push   $0x1
    3769:	e8 92 14 00 00       	call   4c00 <printf>
    376e:	e8 06 13 00 00       	call   4a79 <exit>
    3773:	50                   	push   %eax
    3774:	50                   	push   %eax
    3775:	68 cc 62 00 00       	push   $0x62cc
    377a:	6a 01                	push   $0x1
    377c:	e8 7f 14 00 00       	call   4c00 <printf>
    3781:	e8 f3 12 00 00       	call   4a79 <exit>
    3786:	52                   	push   %edx
    3787:	52                   	push   %edx
    3788:	68 7c 62 00 00       	push   $0x627c
    378d:	6a 01                	push   $0x1
    378f:	e8 6c 14 00 00       	call   4c00 <printf>
    3794:	e8 e0 12 00 00       	call   4a79 <exit>
    3799:	51                   	push   %ecx
    379a:	51                   	push   %ecx
    379b:	68 40 62 00 00       	push   $0x6240
    37a0:	6a 01                	push   $0x1
    37a2:	e8 59 14 00 00       	call   4c00 <printf>
    37a7:	e8 cd 12 00 00       	call   4a79 <exit>
    37ac:	51                   	push   %ecx
    37ad:	51                   	push   %ecx
    37ae:	68 d0 61 00 00       	push   $0x61d0
    37b3:	6a 01                	push   $0x1
    37b5:	e8 46 14 00 00       	call   4c00 <printf>
    37ba:	e8 ba 12 00 00       	call   4a79 <exit>
    37bf:	50                   	push   %eax
    37c0:	50                   	push   %eax
    37c1:	68 70 61 00 00       	push   $0x6170
    37c6:	6a 01                	push   $0x1
    37c8:	e8 33 14 00 00       	call   4c00 <printf>
    37cd:	e8 a7 12 00 00       	call   4a79 <exit>
    37d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037e0 <rmdot>:
    37e0:	55                   	push   %ebp
    37e1:	89 e5                	mov    %esp,%ebp
    37e3:	83 ec 10             	sub    $0x10,%esp
    37e6:	68 af 59 00 00       	push   $0x59af
    37eb:	6a 01                	push   $0x1
    37ed:	e8 0e 14 00 00       	call   4c00 <printf>
    37f2:	c7 04 24 bb 59 00 00 	movl   $0x59bb,(%esp)
    37f9:	e8 e3 12 00 00       	call   4ae1 <mkdir>
    37fe:	83 c4 10             	add    $0x10,%esp
    3801:	85 c0                	test   %eax,%eax
    3803:	0f 85 b0 00 00 00    	jne    38b9 <rmdot+0xd9>
    3809:	83 ec 0c             	sub    $0xc,%esp
    380c:	68 bb 59 00 00       	push   $0x59bb
    3811:	e8 d3 12 00 00       	call   4ae9 <chdir>
    3816:	83 c4 10             	add    $0x10,%esp
    3819:	85 c0                	test   %eax,%eax
    381b:	0f 85 1d 01 00 00    	jne    393e <rmdot+0x15e>
    3821:	83 ec 0c             	sub    $0xc,%esp
    3824:	68 66 56 00 00       	push   $0x5666
    3829:	e8 9b 12 00 00       	call   4ac9 <unlink>
    382e:	83 c4 10             	add    $0x10,%esp
    3831:	85 c0                	test   %eax,%eax
    3833:	0f 84 f2 00 00 00    	je     392b <rmdot+0x14b>
    3839:	83 ec 0c             	sub    $0xc,%esp
    383c:	68 65 56 00 00       	push   $0x5665
    3841:	e8 83 12 00 00       	call   4ac9 <unlink>
    3846:	83 c4 10             	add    $0x10,%esp
    3849:	85 c0                	test   %eax,%eax
    384b:	0f 84 c7 00 00 00    	je     3918 <rmdot+0x138>
    3851:	83 ec 0c             	sub    $0xc,%esp
    3854:	68 39 4e 00 00       	push   $0x4e39
    3859:	e8 8b 12 00 00       	call   4ae9 <chdir>
    385e:	83 c4 10             	add    $0x10,%esp
    3861:	85 c0                	test   %eax,%eax
    3863:	0f 85 9c 00 00 00    	jne    3905 <rmdot+0x125>
    3869:	83 ec 0c             	sub    $0xc,%esp
    386c:	68 03 5a 00 00       	push   $0x5a03
    3871:	e8 53 12 00 00       	call   4ac9 <unlink>
    3876:	83 c4 10             	add    $0x10,%esp
    3879:	85 c0                	test   %eax,%eax
    387b:	74 75                	je     38f2 <rmdot+0x112>
    387d:	83 ec 0c             	sub    $0xc,%esp
    3880:	68 21 5a 00 00       	push   $0x5a21
    3885:	e8 3f 12 00 00       	call   4ac9 <unlink>
    388a:	83 c4 10             	add    $0x10,%esp
    388d:	85 c0                	test   %eax,%eax
    388f:	74 4e                	je     38df <rmdot+0xff>
    3891:	83 ec 0c             	sub    $0xc,%esp
    3894:	68 bb 59 00 00       	push   $0x59bb
    3899:	e8 2b 12 00 00       	call   4ac9 <unlink>
    389e:	83 c4 10             	add    $0x10,%esp
    38a1:	85 c0                	test   %eax,%eax
    38a3:	75 27                	jne    38cc <rmdot+0xec>
    38a5:	83 ec 08             	sub    $0x8,%esp
    38a8:	68 56 5a 00 00       	push   $0x5a56
    38ad:	6a 01                	push   $0x1
    38af:	e8 4c 13 00 00       	call   4c00 <printf>
    38b4:	83 c4 10             	add    $0x10,%esp
    38b7:	c9                   	leave  
    38b8:	c3                   	ret    
    38b9:	50                   	push   %eax
    38ba:	50                   	push   %eax
    38bb:	68 c0 59 00 00       	push   $0x59c0
    38c0:	6a 01                	push   $0x1
    38c2:	e8 39 13 00 00       	call   4c00 <printf>
    38c7:	e8 ad 11 00 00       	call   4a79 <exit>
    38cc:	50                   	push   %eax
    38cd:	50                   	push   %eax
    38ce:	68 41 5a 00 00       	push   $0x5a41
    38d3:	6a 01                	push   $0x1
    38d5:	e8 26 13 00 00       	call   4c00 <printf>
    38da:	e8 9a 11 00 00       	call   4a79 <exit>
    38df:	52                   	push   %edx
    38e0:	52                   	push   %edx
    38e1:	68 29 5a 00 00       	push   $0x5a29
    38e6:	6a 01                	push   $0x1
    38e8:	e8 13 13 00 00       	call   4c00 <printf>
    38ed:	e8 87 11 00 00       	call   4a79 <exit>
    38f2:	51                   	push   %ecx
    38f3:	51                   	push   %ecx
    38f4:	68 0a 5a 00 00       	push   $0x5a0a
    38f9:	6a 01                	push   $0x1
    38fb:	e8 00 13 00 00       	call   4c00 <printf>
    3900:	e8 74 11 00 00       	call   4a79 <exit>
    3905:	50                   	push   %eax
    3906:	50                   	push   %eax
    3907:	68 3b 4e 00 00       	push   $0x4e3b
    390c:	6a 01                	push   $0x1
    390e:	e8 ed 12 00 00       	call   4c00 <printf>
    3913:	e8 61 11 00 00       	call   4a79 <exit>
    3918:	50                   	push   %eax
    3919:	50                   	push   %eax
    391a:	68 f4 59 00 00       	push   $0x59f4
    391f:	6a 01                	push   $0x1
    3921:	e8 da 12 00 00       	call   4c00 <printf>
    3926:	e8 4e 11 00 00       	call   4a79 <exit>
    392b:	50                   	push   %eax
    392c:	50                   	push   %eax
    392d:	68 e6 59 00 00       	push   $0x59e6
    3932:	6a 01                	push   $0x1
    3934:	e8 c7 12 00 00       	call   4c00 <printf>
    3939:	e8 3b 11 00 00       	call   4a79 <exit>
    393e:	50                   	push   %eax
    393f:	50                   	push   %eax
    3940:	68 d3 59 00 00       	push   $0x59d3
    3945:	6a 01                	push   $0x1
    3947:	e8 b4 12 00 00       	call   4c00 <printf>
    394c:	e8 28 11 00 00       	call   4a79 <exit>
    3951:	eb 0d                	jmp    3960 <dirfile>
    3953:	90                   	nop
    3954:	90                   	nop
    3955:	90                   	nop
    3956:	90                   	nop
    3957:	90                   	nop
    3958:	90                   	nop
    3959:	90                   	nop
    395a:	90                   	nop
    395b:	90                   	nop
    395c:	90                   	nop
    395d:	90                   	nop
    395e:	90                   	nop
    395f:	90                   	nop

00003960 <dirfile>:
    3960:	55                   	push   %ebp
    3961:	89 e5                	mov    %esp,%ebp
    3963:	53                   	push   %ebx
    3964:	83 ec 0c             	sub    $0xc,%esp
    3967:	68 60 5a 00 00       	push   $0x5a60
    396c:	6a 01                	push   $0x1
    396e:	e8 8d 12 00 00       	call   4c00 <printf>
    3973:	59                   	pop    %ecx
    3974:	5b                   	pop    %ebx
    3975:	68 00 02 00 00       	push   $0x200
    397a:	68 6d 5a 00 00       	push   $0x5a6d
    397f:	e8 35 11 00 00       	call   4ab9 <open>
    3984:	83 c4 10             	add    $0x10,%esp
    3987:	85 c0                	test   %eax,%eax
    3989:	0f 88 43 01 00 00    	js     3ad2 <dirfile+0x172>
    398f:	83 ec 0c             	sub    $0xc,%esp
    3992:	50                   	push   %eax
    3993:	e8 09 11 00 00       	call   4aa1 <close>
    3998:	c7 04 24 6d 5a 00 00 	movl   $0x5a6d,(%esp)
    399f:	e8 45 11 00 00       	call   4ae9 <chdir>
    39a4:	83 c4 10             	add    $0x10,%esp
    39a7:	85 c0                	test   %eax,%eax
    39a9:	0f 84 10 01 00 00    	je     3abf <dirfile+0x15f>
    39af:	83 ec 08             	sub    $0x8,%esp
    39b2:	6a 00                	push   $0x0
    39b4:	68 a6 5a 00 00       	push   $0x5aa6
    39b9:	e8 fb 10 00 00       	call   4ab9 <open>
    39be:	83 c4 10             	add    $0x10,%esp
    39c1:	85 c0                	test   %eax,%eax
    39c3:	0f 89 e3 00 00 00    	jns    3aac <dirfile+0x14c>
    39c9:	83 ec 08             	sub    $0x8,%esp
    39cc:	68 00 02 00 00       	push   $0x200
    39d1:	68 a6 5a 00 00       	push   $0x5aa6
    39d6:	e8 de 10 00 00       	call   4ab9 <open>
    39db:	83 c4 10             	add    $0x10,%esp
    39de:	85 c0                	test   %eax,%eax
    39e0:	0f 89 c6 00 00 00    	jns    3aac <dirfile+0x14c>
    39e6:	83 ec 0c             	sub    $0xc,%esp
    39e9:	68 a6 5a 00 00       	push   $0x5aa6
    39ee:	e8 ee 10 00 00       	call   4ae1 <mkdir>
    39f3:	83 c4 10             	add    $0x10,%esp
    39f6:	85 c0                	test   %eax,%eax
    39f8:	0f 84 46 01 00 00    	je     3b44 <dirfile+0x1e4>
    39fe:	83 ec 0c             	sub    $0xc,%esp
    3a01:	68 a6 5a 00 00       	push   $0x5aa6
    3a06:	e8 be 10 00 00       	call   4ac9 <unlink>
    3a0b:	83 c4 10             	add    $0x10,%esp
    3a0e:	85 c0                	test   %eax,%eax
    3a10:	0f 84 1b 01 00 00    	je     3b31 <dirfile+0x1d1>
    3a16:	83 ec 08             	sub    $0x8,%esp
    3a19:	68 a6 5a 00 00       	push   $0x5aa6
    3a1e:	68 0a 5b 00 00       	push   $0x5b0a
    3a23:	e8 b1 10 00 00       	call   4ad9 <link>
    3a28:	83 c4 10             	add    $0x10,%esp
    3a2b:	85 c0                	test   %eax,%eax
    3a2d:	0f 84 eb 00 00 00    	je     3b1e <dirfile+0x1be>
    3a33:	83 ec 0c             	sub    $0xc,%esp
    3a36:	68 6d 5a 00 00       	push   $0x5a6d
    3a3b:	e8 89 10 00 00       	call   4ac9 <unlink>
    3a40:	83 c4 10             	add    $0x10,%esp
    3a43:	85 c0                	test   %eax,%eax
    3a45:	0f 85 c0 00 00 00    	jne    3b0b <dirfile+0x1ab>
    3a4b:	83 ec 08             	sub    $0x8,%esp
    3a4e:	6a 02                	push   $0x2
    3a50:	68 66 56 00 00       	push   $0x5666
    3a55:	e8 5f 10 00 00       	call   4ab9 <open>
    3a5a:	83 c4 10             	add    $0x10,%esp
    3a5d:	85 c0                	test   %eax,%eax
    3a5f:	0f 89 93 00 00 00    	jns    3af8 <dirfile+0x198>
    3a65:	83 ec 08             	sub    $0x8,%esp
    3a68:	6a 00                	push   $0x0
    3a6a:	68 66 56 00 00       	push   $0x5666
    3a6f:	e8 45 10 00 00       	call   4ab9 <open>
    3a74:	83 c4 0c             	add    $0xc,%esp
    3a77:	89 c3                	mov    %eax,%ebx
    3a79:	6a 01                	push   $0x1
    3a7b:	68 49 57 00 00       	push   $0x5749
    3a80:	50                   	push   %eax
    3a81:	e8 13 10 00 00       	call   4a99 <write>
    3a86:	83 c4 10             	add    $0x10,%esp
    3a89:	85 c0                	test   %eax,%eax
    3a8b:	7f 58                	jg     3ae5 <dirfile+0x185>
    3a8d:	83 ec 0c             	sub    $0xc,%esp
    3a90:	53                   	push   %ebx
    3a91:	e8 0b 10 00 00       	call   4aa1 <close>
    3a96:	58                   	pop    %eax
    3a97:	5a                   	pop    %edx
    3a98:	68 3d 5b 00 00       	push   $0x5b3d
    3a9d:	6a 01                	push   $0x1
    3a9f:	e8 5c 11 00 00       	call   4c00 <printf>
    3aa4:	83 c4 10             	add    $0x10,%esp
    3aa7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3aaa:	c9                   	leave  
    3aab:	c3                   	ret    
    3aac:	50                   	push   %eax
    3aad:	50                   	push   %eax
    3aae:	68 b1 5a 00 00       	push   $0x5ab1
    3ab3:	6a 01                	push   $0x1
    3ab5:	e8 46 11 00 00       	call   4c00 <printf>
    3aba:	e8 ba 0f 00 00       	call   4a79 <exit>
    3abf:	50                   	push   %eax
    3ac0:	50                   	push   %eax
    3ac1:	68 8c 5a 00 00       	push   $0x5a8c
    3ac6:	6a 01                	push   $0x1
    3ac8:	e8 33 11 00 00       	call   4c00 <printf>
    3acd:	e8 a7 0f 00 00       	call   4a79 <exit>
    3ad2:	52                   	push   %edx
    3ad3:	52                   	push   %edx
    3ad4:	68 75 5a 00 00       	push   $0x5a75
    3ad9:	6a 01                	push   $0x1
    3adb:	e8 20 11 00 00       	call   4c00 <printf>
    3ae0:	e8 94 0f 00 00       	call   4a79 <exit>
    3ae5:	51                   	push   %ecx
    3ae6:	51                   	push   %ecx
    3ae7:	68 29 5b 00 00       	push   $0x5b29
    3aec:	6a 01                	push   $0x1
    3aee:	e8 0d 11 00 00       	call   4c00 <printf>
    3af3:	e8 81 0f 00 00       	call   4a79 <exit>
    3af8:	53                   	push   %ebx
    3af9:	53                   	push   %ebx
    3afa:	68 20 63 00 00       	push   $0x6320
    3aff:	6a 01                	push   $0x1
    3b01:	e8 fa 10 00 00       	call   4c00 <printf>
    3b06:	e8 6e 0f 00 00       	call   4a79 <exit>
    3b0b:	50                   	push   %eax
    3b0c:	50                   	push   %eax
    3b0d:	68 11 5b 00 00       	push   $0x5b11
    3b12:	6a 01                	push   $0x1
    3b14:	e8 e7 10 00 00       	call   4c00 <printf>
    3b19:	e8 5b 0f 00 00       	call   4a79 <exit>
    3b1e:	50                   	push   %eax
    3b1f:	50                   	push   %eax
    3b20:	68 00 63 00 00       	push   $0x6300
    3b25:	6a 01                	push   $0x1
    3b27:	e8 d4 10 00 00       	call   4c00 <printf>
    3b2c:	e8 48 0f 00 00       	call   4a79 <exit>
    3b31:	50                   	push   %eax
    3b32:	50                   	push   %eax
    3b33:	68 ec 5a 00 00       	push   $0x5aec
    3b38:	6a 01                	push   $0x1
    3b3a:	e8 c1 10 00 00       	call   4c00 <printf>
    3b3f:	e8 35 0f 00 00       	call   4a79 <exit>
    3b44:	50                   	push   %eax
    3b45:	50                   	push   %eax
    3b46:	68 cf 5a 00 00       	push   $0x5acf
    3b4b:	6a 01                	push   $0x1
    3b4d:	e8 ae 10 00 00       	call   4c00 <printf>
    3b52:	e8 22 0f 00 00       	call   4a79 <exit>
    3b57:	89 f6                	mov    %esi,%esi
    3b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003b60 <iref>:
    3b60:	55                   	push   %ebp
    3b61:	89 e5                	mov    %esp,%ebp
    3b63:	53                   	push   %ebx
    3b64:	bb 33 00 00 00       	mov    $0x33,%ebx
    3b69:	83 ec 0c             	sub    $0xc,%esp
    3b6c:	68 4d 5b 00 00       	push   $0x5b4d
    3b71:	6a 01                	push   $0x1
    3b73:	e8 88 10 00 00       	call   4c00 <printf>
    3b78:	83 c4 10             	add    $0x10,%esp
    3b7b:	90                   	nop
    3b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b80:	83 ec 0c             	sub    $0xc,%esp
    3b83:	68 5e 5b 00 00       	push   $0x5b5e
    3b88:	e8 54 0f 00 00       	call   4ae1 <mkdir>
    3b8d:	83 c4 10             	add    $0x10,%esp
    3b90:	85 c0                	test   %eax,%eax
    3b92:	0f 85 bb 00 00 00    	jne    3c53 <iref+0xf3>
    3b98:	83 ec 0c             	sub    $0xc,%esp
    3b9b:	68 5e 5b 00 00       	push   $0x5b5e
    3ba0:	e8 44 0f 00 00       	call   4ae9 <chdir>
    3ba5:	83 c4 10             	add    $0x10,%esp
    3ba8:	85 c0                	test   %eax,%eax
    3baa:	0f 85 b7 00 00 00    	jne    3c67 <iref+0x107>
    3bb0:	83 ec 0c             	sub    $0xc,%esp
    3bb3:	68 13 52 00 00       	push   $0x5213
    3bb8:	e8 24 0f 00 00       	call   4ae1 <mkdir>
    3bbd:	59                   	pop    %ecx
    3bbe:	58                   	pop    %eax
    3bbf:	68 13 52 00 00       	push   $0x5213
    3bc4:	68 0a 5b 00 00       	push   $0x5b0a
    3bc9:	e8 0b 0f 00 00       	call   4ad9 <link>
    3bce:	58                   	pop    %eax
    3bcf:	5a                   	pop    %edx
    3bd0:	68 00 02 00 00       	push   $0x200
    3bd5:	68 13 52 00 00       	push   $0x5213
    3bda:	e8 da 0e 00 00       	call   4ab9 <open>
    3bdf:	83 c4 10             	add    $0x10,%esp
    3be2:	85 c0                	test   %eax,%eax
    3be4:	78 0c                	js     3bf2 <iref+0x92>
    3be6:	83 ec 0c             	sub    $0xc,%esp
    3be9:	50                   	push   %eax
    3bea:	e8 b2 0e 00 00       	call   4aa1 <close>
    3bef:	83 c4 10             	add    $0x10,%esp
    3bf2:	83 ec 08             	sub    $0x8,%esp
    3bf5:	68 00 02 00 00       	push   $0x200
    3bfa:	68 48 57 00 00       	push   $0x5748
    3bff:	e8 b5 0e 00 00       	call   4ab9 <open>
    3c04:	83 c4 10             	add    $0x10,%esp
    3c07:	85 c0                	test   %eax,%eax
    3c09:	78 0c                	js     3c17 <iref+0xb7>
    3c0b:	83 ec 0c             	sub    $0xc,%esp
    3c0e:	50                   	push   %eax
    3c0f:	e8 8d 0e 00 00       	call   4aa1 <close>
    3c14:	83 c4 10             	add    $0x10,%esp
    3c17:	83 ec 0c             	sub    $0xc,%esp
    3c1a:	68 48 57 00 00       	push   $0x5748
    3c1f:	e8 a5 0e 00 00       	call   4ac9 <unlink>
    3c24:	83 c4 10             	add    $0x10,%esp
    3c27:	83 eb 01             	sub    $0x1,%ebx
    3c2a:	0f 85 50 ff ff ff    	jne    3b80 <iref+0x20>
    3c30:	83 ec 0c             	sub    $0xc,%esp
    3c33:	68 39 4e 00 00       	push   $0x4e39
    3c38:	e8 ac 0e 00 00       	call   4ae9 <chdir>
    3c3d:	58                   	pop    %eax
    3c3e:	5a                   	pop    %edx
    3c3f:	68 8c 5b 00 00       	push   $0x5b8c
    3c44:	6a 01                	push   $0x1
    3c46:	e8 b5 0f 00 00       	call   4c00 <printf>
    3c4b:	83 c4 10             	add    $0x10,%esp
    3c4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3c51:	c9                   	leave  
    3c52:	c3                   	ret    
    3c53:	83 ec 08             	sub    $0x8,%esp
    3c56:	68 64 5b 00 00       	push   $0x5b64
    3c5b:	6a 01                	push   $0x1
    3c5d:	e8 9e 0f 00 00       	call   4c00 <printf>
    3c62:	e8 12 0e 00 00       	call   4a79 <exit>
    3c67:	83 ec 08             	sub    $0x8,%esp
    3c6a:	68 78 5b 00 00       	push   $0x5b78
    3c6f:	6a 01                	push   $0x1
    3c71:	e8 8a 0f 00 00       	call   4c00 <printf>
    3c76:	e8 fe 0d 00 00       	call   4a79 <exit>
    3c7b:	90                   	nop
    3c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003c80 <forktest>:
    3c80:	55                   	push   %ebp
    3c81:	89 e5                	mov    %esp,%ebp
    3c83:	53                   	push   %ebx
    3c84:	31 db                	xor    %ebx,%ebx
    3c86:	83 ec 0c             	sub    $0xc,%esp
    3c89:	68 a0 5b 00 00       	push   $0x5ba0
    3c8e:	6a 01                	push   $0x1
    3c90:	e8 6b 0f 00 00       	call   4c00 <printf>
    3c95:	83 c4 10             	add    $0x10,%esp
    3c98:	eb 13                	jmp    3cad <forktest+0x2d>
    3c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3ca0:	74 62                	je     3d04 <forktest+0x84>
    3ca2:	83 c3 01             	add    $0x1,%ebx
    3ca5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    3cab:	74 43                	je     3cf0 <forktest+0x70>
    3cad:	e8 bf 0d 00 00       	call   4a71 <fork>
    3cb2:	85 c0                	test   %eax,%eax
    3cb4:	79 ea                	jns    3ca0 <forktest+0x20>
    3cb6:	85 db                	test   %ebx,%ebx
    3cb8:	74 14                	je     3cce <forktest+0x4e>
    3cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3cc0:	e8 bc 0d 00 00       	call   4a81 <wait>
    3cc5:	85 c0                	test   %eax,%eax
    3cc7:	78 40                	js     3d09 <forktest+0x89>
    3cc9:	83 eb 01             	sub    $0x1,%ebx
    3ccc:	75 f2                	jne    3cc0 <forktest+0x40>
    3cce:	e8 ae 0d 00 00       	call   4a81 <wait>
    3cd3:	83 f8 ff             	cmp    $0xffffffff,%eax
    3cd6:	75 45                	jne    3d1d <forktest+0x9d>
    3cd8:	83 ec 08             	sub    $0x8,%esp
    3cdb:	68 d2 5b 00 00       	push   $0x5bd2
    3ce0:	6a 01                	push   $0x1
    3ce2:	e8 19 0f 00 00       	call   4c00 <printf>
    3ce7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3cea:	c9                   	leave  
    3ceb:	c3                   	ret    
    3cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3cf0:	83 ec 08             	sub    $0x8,%esp
    3cf3:	68 40 63 00 00       	push   $0x6340
    3cf8:	6a 01                	push   $0x1
    3cfa:	e8 01 0f 00 00       	call   4c00 <printf>
    3cff:	e8 75 0d 00 00       	call   4a79 <exit>
    3d04:	e8 70 0d 00 00       	call   4a79 <exit>
    3d09:	83 ec 08             	sub    $0x8,%esp
    3d0c:	68 ab 5b 00 00       	push   $0x5bab
    3d11:	6a 01                	push   $0x1
    3d13:	e8 e8 0e 00 00       	call   4c00 <printf>
    3d18:	e8 5c 0d 00 00       	call   4a79 <exit>
    3d1d:	50                   	push   %eax
    3d1e:	50                   	push   %eax
    3d1f:	68 bf 5b 00 00       	push   $0x5bbf
    3d24:	6a 01                	push   $0x1
    3d26:	e8 d5 0e 00 00       	call   4c00 <printf>
    3d2b:	e8 49 0d 00 00       	call   4a79 <exit>

00003d30 <sbrktest>:
    3d30:	55                   	push   %ebp
    3d31:	89 e5                	mov    %esp,%ebp
    3d33:	57                   	push   %edi
    3d34:	56                   	push   %esi
    3d35:	53                   	push   %ebx
    3d36:	31 ff                	xor    %edi,%edi
    3d38:	83 ec 64             	sub    $0x64,%esp
    3d3b:	68 e0 5b 00 00       	push   $0x5be0
    3d40:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    3d46:	e8 b5 0e 00 00       	call   4c00 <printf>
    3d4b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d52:	e8 aa 0d 00 00       	call   4b01 <sbrk>
    3d57:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d5e:	89 c3                	mov    %eax,%ebx
    3d60:	e8 9c 0d 00 00       	call   4b01 <sbrk>
    3d65:	83 c4 10             	add    $0x10,%esp
    3d68:	89 c6                	mov    %eax,%esi
    3d6a:	eb 06                	jmp    3d72 <sbrktest+0x42>
    3d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3d70:	89 c6                	mov    %eax,%esi
    3d72:	83 ec 0c             	sub    $0xc,%esp
    3d75:	6a 01                	push   $0x1
    3d77:	e8 85 0d 00 00       	call   4b01 <sbrk>
    3d7c:	83 c4 10             	add    $0x10,%esp
    3d7f:	39 f0                	cmp    %esi,%eax
    3d81:	0f 85 62 02 00 00    	jne    3fe9 <sbrktest+0x2b9>
    3d87:	83 c7 01             	add    $0x1,%edi
    3d8a:	c6 06 01             	movb   $0x1,(%esi)
    3d8d:	8d 46 01             	lea    0x1(%esi),%eax
    3d90:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    3d96:	75 d8                	jne    3d70 <sbrktest+0x40>
    3d98:	e8 d4 0c 00 00       	call   4a71 <fork>
    3d9d:	85 c0                	test   %eax,%eax
    3d9f:	89 c7                	mov    %eax,%edi
    3da1:	0f 88 82 03 00 00    	js     4129 <sbrktest+0x3f9>
    3da7:	83 ec 0c             	sub    $0xc,%esp
    3daa:	83 c6 02             	add    $0x2,%esi
    3dad:	6a 01                	push   $0x1
    3daf:	e8 4d 0d 00 00       	call   4b01 <sbrk>
    3db4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3dbb:	e8 41 0d 00 00       	call   4b01 <sbrk>
    3dc0:	83 c4 10             	add    $0x10,%esp
    3dc3:	39 f0                	cmp    %esi,%eax
    3dc5:	0f 85 47 03 00 00    	jne    4112 <sbrktest+0x3e2>
    3dcb:	85 ff                	test   %edi,%edi
    3dcd:	0f 84 3a 03 00 00    	je     410d <sbrktest+0x3dd>
    3dd3:	e8 a9 0c 00 00       	call   4a81 <wait>
    3dd8:	83 ec 0c             	sub    $0xc,%esp
    3ddb:	6a 00                	push   $0x0
    3ddd:	e8 1f 0d 00 00       	call   4b01 <sbrk>
    3de2:	89 c6                	mov    %eax,%esi
    3de4:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3de9:	29 f0                	sub    %esi,%eax
    3deb:	89 04 24             	mov    %eax,(%esp)
    3dee:	e8 0e 0d 00 00       	call   4b01 <sbrk>
    3df3:	83 c4 10             	add    $0x10,%esp
    3df6:	39 c6                	cmp    %eax,%esi
    3df8:	0f 85 f8 02 00 00    	jne    40f6 <sbrktest+0x3c6>
    3dfe:	83 ec 0c             	sub    $0xc,%esp
    3e01:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
    3e08:	6a 00                	push   $0x0
    3e0a:	e8 f2 0c 00 00       	call   4b01 <sbrk>
    3e0f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    3e16:	89 c6                	mov    %eax,%esi
    3e18:	e8 e4 0c 00 00       	call   4b01 <sbrk>
    3e1d:	83 c4 10             	add    $0x10,%esp
    3e20:	83 f8 ff             	cmp    $0xffffffff,%eax
    3e23:	0f 84 b6 02 00 00    	je     40df <sbrktest+0x3af>
    3e29:	83 ec 0c             	sub    $0xc,%esp
    3e2c:	6a 00                	push   $0x0
    3e2e:	e8 ce 0c 00 00       	call   4b01 <sbrk>
    3e33:	8d 96 00 f0 ff ff    	lea    -0x1000(%esi),%edx
    3e39:	83 c4 10             	add    $0x10,%esp
    3e3c:	39 d0                	cmp    %edx,%eax
    3e3e:	0f 85 84 02 00 00    	jne    40c8 <sbrktest+0x398>
    3e44:	83 ec 0c             	sub    $0xc,%esp
    3e47:	6a 00                	push   $0x0
    3e49:	e8 b3 0c 00 00       	call   4b01 <sbrk>
    3e4e:	89 c6                	mov    %eax,%esi
    3e50:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3e57:	e8 a5 0c 00 00       	call   4b01 <sbrk>
    3e5c:	83 c4 10             	add    $0x10,%esp
    3e5f:	39 c6                	cmp    %eax,%esi
    3e61:	89 c7                	mov    %eax,%edi
    3e63:	0f 85 48 02 00 00    	jne    40b1 <sbrktest+0x381>
    3e69:	83 ec 0c             	sub    $0xc,%esp
    3e6c:	6a 00                	push   $0x0
    3e6e:	e8 8e 0c 00 00       	call   4b01 <sbrk>
    3e73:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    3e79:	83 c4 10             	add    $0x10,%esp
    3e7c:	39 d0                	cmp    %edx,%eax
    3e7e:	0f 85 2d 02 00 00    	jne    40b1 <sbrktest+0x381>
    3e84:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    3e8b:	0f 84 09 02 00 00    	je     409a <sbrktest+0x36a>
    3e91:	83 ec 0c             	sub    $0xc,%esp
    3e94:	6a 00                	push   $0x0
    3e96:	e8 66 0c 00 00       	call   4b01 <sbrk>
    3e9b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ea2:	89 c6                	mov    %eax,%esi
    3ea4:	e8 58 0c 00 00       	call   4b01 <sbrk>
    3ea9:	89 d9                	mov    %ebx,%ecx
    3eab:	29 c1                	sub    %eax,%ecx
    3ead:	89 0c 24             	mov    %ecx,(%esp)
    3eb0:	e8 4c 0c 00 00       	call   4b01 <sbrk>
    3eb5:	83 c4 10             	add    $0x10,%esp
    3eb8:	39 c6                	cmp    %eax,%esi
    3eba:	0f 85 c3 01 00 00    	jne    4083 <sbrktest+0x353>
    3ec0:	be 00 00 00 80       	mov    $0x80000000,%esi
    3ec5:	e8 2f 0c 00 00       	call   4af9 <getpid>
    3eca:	89 c7                	mov    %eax,%edi
    3ecc:	e8 a0 0b 00 00       	call   4a71 <fork>
    3ed1:	85 c0                	test   %eax,%eax
    3ed3:	0f 88 93 01 00 00    	js     406c <sbrktest+0x33c>
    3ed9:	0f 84 6b 01 00 00    	je     404a <sbrktest+0x31a>
    3edf:	81 c6 50 c3 00 00    	add    $0xc350,%esi
    3ee5:	e8 97 0b 00 00       	call   4a81 <wait>
    3eea:	81 fe 80 84 1e 80    	cmp    $0x801e8480,%esi
    3ef0:	75 d3                	jne    3ec5 <sbrktest+0x195>
    3ef2:	8d 45 b8             	lea    -0x48(%ebp),%eax
    3ef5:	83 ec 0c             	sub    $0xc,%esp
    3ef8:	50                   	push   %eax
    3ef9:	e8 8b 0b 00 00       	call   4a89 <pipe>
    3efe:	83 c4 10             	add    $0x10,%esp
    3f01:	85 c0                	test   %eax,%eax
    3f03:	0f 85 2e 01 00 00    	jne    4037 <sbrktest+0x307>
    3f09:	8d 7d c0             	lea    -0x40(%ebp),%edi
    3f0c:	89 fe                	mov    %edi,%esi
    3f0e:	eb 23                	jmp    3f33 <sbrktest+0x203>
    3f10:	83 f8 ff             	cmp    $0xffffffff,%eax
    3f13:	74 14                	je     3f29 <sbrktest+0x1f9>
    3f15:	8d 45 b7             	lea    -0x49(%ebp),%eax
    3f18:	83 ec 04             	sub    $0x4,%esp
    3f1b:	6a 01                	push   $0x1
    3f1d:	50                   	push   %eax
    3f1e:	ff 75 b8             	pushl  -0x48(%ebp)
    3f21:	e8 6b 0b 00 00       	call   4a91 <read>
    3f26:	83 c4 10             	add    $0x10,%esp
    3f29:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3f2c:	83 c6 04             	add    $0x4,%esi
    3f2f:	39 c6                	cmp    %eax,%esi
    3f31:	74 4f                	je     3f82 <sbrktest+0x252>
    3f33:	e8 39 0b 00 00       	call   4a71 <fork>
    3f38:	85 c0                	test   %eax,%eax
    3f3a:	89 06                	mov    %eax,(%esi)
    3f3c:	75 d2                	jne    3f10 <sbrktest+0x1e0>
    3f3e:	83 ec 0c             	sub    $0xc,%esp
    3f41:	6a 00                	push   $0x0
    3f43:	e8 b9 0b 00 00       	call   4b01 <sbrk>
    3f48:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3f4d:	29 c2                	sub    %eax,%edx
    3f4f:	89 14 24             	mov    %edx,(%esp)
    3f52:	e8 aa 0b 00 00       	call   4b01 <sbrk>
    3f57:	83 c4 0c             	add    $0xc,%esp
    3f5a:	6a 01                	push   $0x1
    3f5c:	68 49 57 00 00       	push   $0x5749
    3f61:	ff 75 bc             	pushl  -0x44(%ebp)
    3f64:	e8 30 0b 00 00       	call   4a99 <write>
    3f69:	83 c4 10             	add    $0x10,%esp
    3f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3f70:	83 ec 0c             	sub    $0xc,%esp
    3f73:	68 e8 03 00 00       	push   $0x3e8
    3f78:	e8 8c 0b 00 00       	call   4b09 <sleep>
    3f7d:	83 c4 10             	add    $0x10,%esp
    3f80:	eb ee                	jmp    3f70 <sbrktest+0x240>
    3f82:	83 ec 0c             	sub    $0xc,%esp
    3f85:	68 00 10 00 00       	push   $0x1000
    3f8a:	e8 72 0b 00 00       	call   4b01 <sbrk>
    3f8f:	83 c4 10             	add    $0x10,%esp
    3f92:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    3f95:	8b 07                	mov    (%edi),%eax
    3f97:	83 f8 ff             	cmp    $0xffffffff,%eax
    3f9a:	74 11                	je     3fad <sbrktest+0x27d>
    3f9c:	83 ec 0c             	sub    $0xc,%esp
    3f9f:	50                   	push   %eax
    3fa0:	e8 04 0b 00 00       	call   4aa9 <kill>
    3fa5:	e8 d7 0a 00 00       	call   4a81 <wait>
    3faa:	83 c4 10             	add    $0x10,%esp
    3fad:	83 c7 04             	add    $0x4,%edi
    3fb0:	39 fe                	cmp    %edi,%esi
    3fb2:	75 e1                	jne    3f95 <sbrktest+0x265>
    3fb4:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    3fb8:	74 66                	je     4020 <sbrktest+0x2f0>
    3fba:	83 ec 0c             	sub    $0xc,%esp
    3fbd:	6a 00                	push   $0x0
    3fbf:	e8 3d 0b 00 00       	call   4b01 <sbrk>
    3fc4:	83 c4 10             	add    $0x10,%esp
    3fc7:	39 d8                	cmp    %ebx,%eax
    3fc9:	77 3c                	ja     4007 <sbrktest+0x2d7>
    3fcb:	83 ec 08             	sub    $0x8,%esp
    3fce:	68 88 5c 00 00       	push   $0x5c88
    3fd3:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    3fd9:	e8 22 0c 00 00       	call   4c00 <printf>
    3fde:	83 c4 10             	add    $0x10,%esp
    3fe1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3fe4:	5b                   	pop    %ebx
    3fe5:	5e                   	pop    %esi
    3fe6:	5f                   	pop    %edi
    3fe7:	5d                   	pop    %ebp
    3fe8:	c3                   	ret    
    3fe9:	83 ec 0c             	sub    $0xc,%esp
    3fec:	50                   	push   %eax
    3fed:	56                   	push   %esi
    3fee:	57                   	push   %edi
    3fef:	68 eb 5b 00 00       	push   $0x5beb
    3ff4:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    3ffa:	e8 01 0c 00 00       	call   4c00 <printf>
    3fff:	83 c4 20             	add    $0x20,%esp
    4002:	e8 72 0a 00 00       	call   4a79 <exit>
    4007:	83 ec 0c             	sub    $0xc,%esp
    400a:	6a 00                	push   $0x0
    400c:	e8 f0 0a 00 00       	call   4b01 <sbrk>
    4011:	29 c3                	sub    %eax,%ebx
    4013:	89 1c 24             	mov    %ebx,(%esp)
    4016:	e8 e6 0a 00 00       	call   4b01 <sbrk>
    401b:	83 c4 10             	add    $0x10,%esp
    401e:	eb ab                	jmp    3fcb <sbrktest+0x29b>
    4020:	50                   	push   %eax
    4021:	50                   	push   %eax
    4022:	68 6d 5c 00 00       	push   $0x5c6d
    4027:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    402d:	e8 ce 0b 00 00       	call   4c00 <printf>
    4032:	e8 42 0a 00 00       	call   4a79 <exit>
    4037:	52                   	push   %edx
    4038:	52                   	push   %edx
    4039:	68 29 51 00 00       	push   $0x5129
    403e:	6a 01                	push   $0x1
    4040:	e8 bb 0b 00 00       	call   4c00 <printf>
    4045:	e8 2f 0a 00 00       	call   4a79 <exit>
    404a:	0f be 06             	movsbl (%esi),%eax
    404d:	50                   	push   %eax
    404e:	56                   	push   %esi
    404f:	68 54 5c 00 00       	push   $0x5c54
    4054:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    405a:	e8 a1 0b 00 00       	call   4c00 <printf>
    405f:	89 3c 24             	mov    %edi,(%esp)
    4062:	e8 42 0a 00 00       	call   4aa9 <kill>
    4067:	e8 0d 0a 00 00       	call   4a79 <exit>
    406c:	51                   	push   %ecx
    406d:	51                   	push   %ecx
    406e:	68 31 5d 00 00       	push   $0x5d31
    4073:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4079:	e8 82 0b 00 00       	call   4c00 <printf>
    407e:	e8 f6 09 00 00       	call   4a79 <exit>
    4083:	50                   	push   %eax
    4084:	56                   	push   %esi
    4085:	68 34 64 00 00       	push   $0x6434
    408a:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4090:	e8 6b 0b 00 00       	call   4c00 <printf>
    4095:	e8 df 09 00 00       	call   4a79 <exit>
    409a:	53                   	push   %ebx
    409b:	53                   	push   %ebx
    409c:	68 04 64 00 00       	push   $0x6404
    40a1:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    40a7:	e8 54 0b 00 00       	call   4c00 <printf>
    40ac:	e8 c8 09 00 00       	call   4a79 <exit>
    40b1:	57                   	push   %edi
    40b2:	56                   	push   %esi
    40b3:	68 dc 63 00 00       	push   $0x63dc
    40b8:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    40be:	e8 3d 0b 00 00       	call   4c00 <printf>
    40c3:	e8 b1 09 00 00       	call   4a79 <exit>
    40c8:	50                   	push   %eax
    40c9:	56                   	push   %esi
    40ca:	68 a4 63 00 00       	push   $0x63a4
    40cf:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    40d5:	e8 26 0b 00 00       	call   4c00 <printf>
    40da:	e8 9a 09 00 00       	call   4a79 <exit>
    40df:	56                   	push   %esi
    40e0:	56                   	push   %esi
    40e1:	68 39 5c 00 00       	push   $0x5c39
    40e6:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    40ec:	e8 0f 0b 00 00       	call   4c00 <printf>
    40f1:	e8 83 09 00 00       	call   4a79 <exit>
    40f6:	57                   	push   %edi
    40f7:	57                   	push   %edi
    40f8:	68 64 63 00 00       	push   $0x6364
    40fd:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4103:	e8 f8 0a 00 00       	call   4c00 <printf>
    4108:	e8 6c 09 00 00       	call   4a79 <exit>
    410d:	e8 67 09 00 00       	call   4a79 <exit>
    4112:	50                   	push   %eax
    4113:	50                   	push   %eax
    4114:	68 1d 5c 00 00       	push   $0x5c1d
    4119:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    411f:	e8 dc 0a 00 00       	call   4c00 <printf>
    4124:	e8 50 09 00 00       	call   4a79 <exit>
    4129:	50                   	push   %eax
    412a:	50                   	push   %eax
    412b:	68 06 5c 00 00       	push   $0x5c06
    4130:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4136:	e8 c5 0a 00 00       	call   4c00 <printf>
    413b:	e8 39 09 00 00       	call   4a79 <exit>

00004140 <validateint>:
    4140:	55                   	push   %ebp
    4141:	89 e5                	mov    %esp,%ebp
    4143:	5d                   	pop    %ebp
    4144:	c3                   	ret    
    4145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004150 <validatetest>:
    4150:	55                   	push   %ebp
    4151:	89 e5                	mov    %esp,%ebp
    4153:	56                   	push   %esi
    4154:	53                   	push   %ebx
    4155:	31 db                	xor    %ebx,%ebx
    4157:	83 ec 08             	sub    $0x8,%esp
    415a:	68 96 5c 00 00       	push   $0x5c96
    415f:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4165:	e8 96 0a 00 00       	call   4c00 <printf>
    416a:	83 c4 10             	add    $0x10,%esp
    416d:	8d 76 00             	lea    0x0(%esi),%esi
    4170:	e8 fc 08 00 00       	call   4a71 <fork>
    4175:	85 c0                	test   %eax,%eax
    4177:	89 c6                	mov    %eax,%esi
    4179:	74 63                	je     41de <validatetest+0x8e>
    417b:	83 ec 0c             	sub    $0xc,%esp
    417e:	6a 00                	push   $0x0
    4180:	e8 84 09 00 00       	call   4b09 <sleep>
    4185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    418c:	e8 78 09 00 00       	call   4b09 <sleep>
    4191:	89 34 24             	mov    %esi,(%esp)
    4194:	e8 10 09 00 00       	call   4aa9 <kill>
    4199:	e8 e3 08 00 00       	call   4a81 <wait>
    419e:	58                   	pop    %eax
    419f:	5a                   	pop    %edx
    41a0:	53                   	push   %ebx
    41a1:	68 a5 5c 00 00       	push   $0x5ca5
    41a6:	e8 2e 09 00 00       	call   4ad9 <link>
    41ab:	83 c4 10             	add    $0x10,%esp
    41ae:	83 f8 ff             	cmp    $0xffffffff,%eax
    41b1:	75 30                	jne    41e3 <validatetest+0x93>
    41b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    41b9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    41bf:	75 af                	jne    4170 <validatetest+0x20>
    41c1:	83 ec 08             	sub    $0x8,%esp
    41c4:	68 c9 5c 00 00       	push   $0x5cc9
    41c9:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    41cf:	e8 2c 0a 00 00       	call   4c00 <printf>
    41d4:	83 c4 10             	add    $0x10,%esp
    41d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    41da:	5b                   	pop    %ebx
    41db:	5e                   	pop    %esi
    41dc:	5d                   	pop    %ebp
    41dd:	c3                   	ret    
    41de:	e8 96 08 00 00       	call   4a79 <exit>
    41e3:	83 ec 08             	sub    $0x8,%esp
    41e6:	68 b0 5c 00 00       	push   $0x5cb0
    41eb:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    41f1:	e8 0a 0a 00 00       	call   4c00 <printf>
    41f6:	e8 7e 08 00 00       	call   4a79 <exit>
    41fb:	90                   	nop
    41fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004200 <bsstest>:
    4200:	55                   	push   %ebp
    4201:	89 e5                	mov    %esp,%ebp
    4203:	83 ec 10             	sub    $0x10,%esp
    4206:	68 d6 5c 00 00       	push   $0x5cd6
    420b:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4211:	e8 ea 09 00 00       	call   4c00 <printf>
    4216:	83 c4 10             	add    $0x10,%esp
    4219:	80 3d a0 6f 00 00 00 	cmpb   $0x0,0x6fa0
    4220:	75 39                	jne    425b <bsstest+0x5b>
    4222:	b8 01 00 00 00       	mov    $0x1,%eax
    4227:	89 f6                	mov    %esi,%esi
    4229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    4230:	80 b8 a0 6f 00 00 00 	cmpb   $0x0,0x6fa0(%eax)
    4237:	75 22                	jne    425b <bsstest+0x5b>
    4239:	83 c0 01             	add    $0x1,%eax
    423c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    4241:	75 ed                	jne    4230 <bsstest+0x30>
    4243:	83 ec 08             	sub    $0x8,%esp
    4246:	68 f1 5c 00 00       	push   $0x5cf1
    424b:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4251:	e8 aa 09 00 00       	call   4c00 <printf>
    4256:	83 c4 10             	add    $0x10,%esp
    4259:	c9                   	leave  
    425a:	c3                   	ret    
    425b:	83 ec 08             	sub    $0x8,%esp
    425e:	68 e0 5c 00 00       	push   $0x5ce0
    4263:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4269:	e8 92 09 00 00       	call   4c00 <printf>
    426e:	e8 06 08 00 00       	call   4a79 <exit>
    4273:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004280 <bigargtest>:
    4280:	55                   	push   %ebp
    4281:	89 e5                	mov    %esp,%ebp
    4283:	83 ec 14             	sub    $0x14,%esp
    4286:	68 fe 5c 00 00       	push   $0x5cfe
    428b:	e8 39 08 00 00       	call   4ac9 <unlink>
    4290:	e8 dc 07 00 00       	call   4a71 <fork>
    4295:	83 c4 10             	add    $0x10,%esp
    4298:	85 c0                	test   %eax,%eax
    429a:	74 3f                	je     42db <bigargtest+0x5b>
    429c:	0f 88 c2 00 00 00    	js     4364 <bigargtest+0xe4>
    42a2:	e8 da 07 00 00       	call   4a81 <wait>
    42a7:	83 ec 08             	sub    $0x8,%esp
    42aa:	6a 00                	push   $0x0
    42ac:	68 fe 5c 00 00       	push   $0x5cfe
    42b1:	e8 03 08 00 00       	call   4ab9 <open>
    42b6:	83 c4 10             	add    $0x10,%esp
    42b9:	85 c0                	test   %eax,%eax
    42bb:	0f 88 8c 00 00 00    	js     434d <bigargtest+0xcd>
    42c1:	83 ec 0c             	sub    $0xc,%esp
    42c4:	50                   	push   %eax
    42c5:	e8 d7 07 00 00       	call   4aa1 <close>
    42ca:	c7 04 24 fe 5c 00 00 	movl   $0x5cfe,(%esp)
    42d1:	e8 f3 07 00 00       	call   4ac9 <unlink>
    42d6:	83 c4 10             	add    $0x10,%esp
    42d9:	c9                   	leave  
    42da:	c3                   	ret    
    42db:	b8 00 6f 00 00       	mov    $0x6f00,%eax
    42e0:	c7 00 58 64 00 00    	movl   $0x6458,(%eax)
    42e6:	83 c0 04             	add    $0x4,%eax
    42e9:	3d 7c 6f 00 00       	cmp    $0x6f7c,%eax
    42ee:	75 f0                	jne    42e0 <bigargtest+0x60>
    42f0:	51                   	push   %ecx
    42f1:	51                   	push   %ecx
    42f2:	68 08 5d 00 00       	push   $0x5d08
    42f7:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    42fd:	c7 05 7c 6f 00 00 00 	movl   $0x0,0x6f7c
    4304:	00 00 00 
    4307:	e8 f4 08 00 00       	call   4c00 <printf>
    430c:	58                   	pop    %eax
    430d:	5a                   	pop    %edx
    430e:	68 00 6f 00 00       	push   $0x6f00
    4313:	68 d5 4e 00 00       	push   $0x4ed5
    4318:	e8 94 07 00 00       	call   4ab1 <exec>
    431d:	59                   	pop    %ecx
    431e:	58                   	pop    %eax
    431f:	68 15 5d 00 00       	push   $0x5d15
    4324:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    432a:	e8 d1 08 00 00       	call   4c00 <printf>
    432f:	58                   	pop    %eax
    4330:	5a                   	pop    %edx
    4331:	68 00 02 00 00       	push   $0x200
    4336:	68 fe 5c 00 00       	push   $0x5cfe
    433b:	e8 79 07 00 00       	call   4ab9 <open>
    4340:	89 04 24             	mov    %eax,(%esp)
    4343:	e8 59 07 00 00       	call   4aa1 <close>
    4348:	e8 2c 07 00 00       	call   4a79 <exit>
    434d:	50                   	push   %eax
    434e:	50                   	push   %eax
    434f:	68 3e 5d 00 00       	push   $0x5d3e
    4354:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    435a:	e8 a1 08 00 00       	call   4c00 <printf>
    435f:	e8 15 07 00 00       	call   4a79 <exit>
    4364:	52                   	push   %edx
    4365:	52                   	push   %edx
    4366:	68 25 5d 00 00       	push   $0x5d25
    436b:	ff 35 e0 6e 00 00    	pushl  0x6ee0
    4371:	e8 8a 08 00 00       	call   4c00 <printf>
    4376:	e8 fe 06 00 00       	call   4a79 <exit>
    437b:	90                   	nop
    437c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004380 <fsfull>:
    4380:	55                   	push   %ebp
    4381:	89 e5                	mov    %esp,%ebp
    4383:	57                   	push   %edi
    4384:	56                   	push   %esi
    4385:	53                   	push   %ebx
    4386:	31 db                	xor    %ebx,%ebx
    4388:	83 ec 54             	sub    $0x54,%esp
    438b:	68 53 5d 00 00       	push   $0x5d53
    4390:	6a 01                	push   $0x1
    4392:	e8 69 08 00 00       	call   4c00 <printf>
    4397:	83 c4 10             	add    $0x10,%esp
    439a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    43a0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    43a5:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    43aa:	83 ec 04             	sub    $0x4,%esp
    43ad:	f7 e3                	mul    %ebx
    43af:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    43b3:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    43b7:	c1 ea 06             	shr    $0x6,%edx
    43ba:	8d 42 30             	lea    0x30(%edx),%eax
    43bd:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    43c3:	88 45 a9             	mov    %al,-0x57(%ebp)
    43c6:	89 d8                	mov    %ebx,%eax
    43c8:	29 d0                	sub    %edx,%eax
    43ca:	89 c2                	mov    %eax,%edx
    43cc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    43d1:	f7 e2                	mul    %edx
    43d3:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    43d8:	c1 ea 05             	shr    $0x5,%edx
    43db:	83 c2 30             	add    $0x30,%edx
    43de:	88 55 aa             	mov    %dl,-0x56(%ebp)
    43e1:	f7 e3                	mul    %ebx
    43e3:	89 d8                	mov    %ebx,%eax
    43e5:	c1 ea 05             	shr    $0x5,%edx
    43e8:	6b d2 64             	imul   $0x64,%edx,%edx
    43eb:	29 d0                	sub    %edx,%eax
    43ed:	f7 e1                	mul    %ecx
    43ef:	89 d8                	mov    %ebx,%eax
    43f1:	c1 ea 03             	shr    $0x3,%edx
    43f4:	83 c2 30             	add    $0x30,%edx
    43f7:	88 55 ab             	mov    %dl,-0x55(%ebp)
    43fa:	f7 e1                	mul    %ecx
    43fc:	89 d9                	mov    %ebx,%ecx
    43fe:	c1 ea 03             	shr    $0x3,%edx
    4401:	8d 04 92             	lea    (%edx,%edx,4),%eax
    4404:	01 c0                	add    %eax,%eax
    4406:	29 c1                	sub    %eax,%ecx
    4408:	89 c8                	mov    %ecx,%eax
    440a:	83 c0 30             	add    $0x30,%eax
    440d:	88 45 ac             	mov    %al,-0x54(%ebp)
    4410:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4413:	50                   	push   %eax
    4414:	68 60 5d 00 00       	push   $0x5d60
    4419:	6a 01                	push   $0x1
    441b:	e8 e0 07 00 00       	call   4c00 <printf>
    4420:	58                   	pop    %eax
    4421:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4424:	5a                   	pop    %edx
    4425:	68 02 02 00 00       	push   $0x202
    442a:	50                   	push   %eax
    442b:	e8 89 06 00 00       	call   4ab9 <open>
    4430:	83 c4 10             	add    $0x10,%esp
    4433:	85 c0                	test   %eax,%eax
    4435:	89 c7                	mov    %eax,%edi
    4437:	78 57                	js     4490 <fsfull+0x110>
    4439:	31 f6                	xor    %esi,%esi
    443b:	eb 05                	jmp    4442 <fsfull+0xc2>
    443d:	8d 76 00             	lea    0x0(%esi),%esi
    4440:	01 c6                	add    %eax,%esi
    4442:	83 ec 04             	sub    $0x4,%esp
    4445:	68 00 02 00 00       	push   $0x200
    444a:	68 c0 96 00 00       	push   $0x96c0
    444f:	57                   	push   %edi
    4450:	e8 44 06 00 00       	call   4a99 <write>
    4455:	83 c4 10             	add    $0x10,%esp
    4458:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    445d:	7f e1                	jg     4440 <fsfull+0xc0>
    445f:	83 ec 04             	sub    $0x4,%esp
    4462:	56                   	push   %esi
    4463:	68 7c 5d 00 00       	push   $0x5d7c
    4468:	6a 01                	push   $0x1
    446a:	e8 91 07 00 00       	call   4c00 <printf>
    446f:	89 3c 24             	mov    %edi,(%esp)
    4472:	e8 2a 06 00 00       	call   4aa1 <close>
    4477:	83 c4 10             	add    $0x10,%esp
    447a:	85 f6                	test   %esi,%esi
    447c:	74 28                	je     44a6 <fsfull+0x126>
    447e:	83 c3 01             	add    $0x1,%ebx
    4481:	e9 1a ff ff ff       	jmp    43a0 <fsfull+0x20>
    4486:	8d 76 00             	lea    0x0(%esi),%esi
    4489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    4490:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4493:	83 ec 04             	sub    $0x4,%esp
    4496:	50                   	push   %eax
    4497:	68 6c 5d 00 00       	push   $0x5d6c
    449c:	6a 01                	push   $0x1
    449e:	e8 5d 07 00 00       	call   4c00 <printf>
    44a3:	83 c4 10             	add    $0x10,%esp
    44a6:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    44ab:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi
    44b0:	89 d8                	mov    %ebx,%eax
    44b2:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    44b7:	83 ec 0c             	sub    $0xc,%esp
    44ba:	f7 e7                	mul    %edi
    44bc:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    44c0:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    44c4:	c1 ea 06             	shr    $0x6,%edx
    44c7:	8d 42 30             	lea    0x30(%edx),%eax
    44ca:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    44d0:	88 45 a9             	mov    %al,-0x57(%ebp)
    44d3:	89 d8                	mov    %ebx,%eax
    44d5:	29 d0                	sub    %edx,%eax
    44d7:	f7 e6                	mul    %esi
    44d9:	89 d8                	mov    %ebx,%eax
    44db:	c1 ea 05             	shr    $0x5,%edx
    44de:	83 c2 30             	add    $0x30,%edx
    44e1:	88 55 aa             	mov    %dl,-0x56(%ebp)
    44e4:	f7 e6                	mul    %esi
    44e6:	89 d8                	mov    %ebx,%eax
    44e8:	c1 ea 05             	shr    $0x5,%edx
    44eb:	6b d2 64             	imul   $0x64,%edx,%edx
    44ee:	29 d0                	sub    %edx,%eax
    44f0:	f7 e1                	mul    %ecx
    44f2:	89 d8                	mov    %ebx,%eax
    44f4:	c1 ea 03             	shr    $0x3,%edx
    44f7:	83 c2 30             	add    $0x30,%edx
    44fa:	88 55 ab             	mov    %dl,-0x55(%ebp)
    44fd:	f7 e1                	mul    %ecx
    44ff:	89 d9                	mov    %ebx,%ecx
    4501:	83 eb 01             	sub    $0x1,%ebx
    4504:	c1 ea 03             	shr    $0x3,%edx
    4507:	8d 04 92             	lea    (%edx,%edx,4),%eax
    450a:	01 c0                	add    %eax,%eax
    450c:	29 c1                	sub    %eax,%ecx
    450e:	89 c8                	mov    %ecx,%eax
    4510:	83 c0 30             	add    $0x30,%eax
    4513:	88 45 ac             	mov    %al,-0x54(%ebp)
    4516:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4519:	50                   	push   %eax
    451a:	e8 aa 05 00 00       	call   4ac9 <unlink>
    451f:	83 c4 10             	add    $0x10,%esp
    4522:	83 fb ff             	cmp    $0xffffffff,%ebx
    4525:	75 89                	jne    44b0 <fsfull+0x130>
    4527:	83 ec 08             	sub    $0x8,%esp
    452a:	68 8c 5d 00 00       	push   $0x5d8c
    452f:	6a 01                	push   $0x1
    4531:	e8 ca 06 00 00       	call   4c00 <printf>
    4536:	83 c4 10             	add    $0x10,%esp
    4539:	8d 65 f4             	lea    -0xc(%ebp),%esp
    453c:	5b                   	pop    %ebx
    453d:	5e                   	pop    %esi
    453e:	5f                   	pop    %edi
    453f:	5d                   	pop    %ebp
    4540:	c3                   	ret    
    4541:	eb 0d                	jmp    4550 <uio>
    4543:	90                   	nop
    4544:	90                   	nop
    4545:	90                   	nop
    4546:	90                   	nop
    4547:	90                   	nop
    4548:	90                   	nop
    4549:	90                   	nop
    454a:	90                   	nop
    454b:	90                   	nop
    454c:	90                   	nop
    454d:	90                   	nop
    454e:	90                   	nop
    454f:	90                   	nop

00004550 <uio>:
    4550:	55                   	push   %ebp
    4551:	89 e5                	mov    %esp,%ebp
    4553:	83 ec 10             	sub    $0x10,%esp
    4556:	68 a2 5d 00 00       	push   $0x5da2
    455b:	6a 01                	push   $0x1
    455d:	e8 9e 06 00 00       	call   4c00 <printf>
    4562:	e8 0a 05 00 00       	call   4a71 <fork>
    4567:	83 c4 10             	add    $0x10,%esp
    456a:	85 c0                	test   %eax,%eax
    456c:	74 1b                	je     4589 <uio+0x39>
    456e:	78 3d                	js     45ad <uio+0x5d>
    4570:	e8 0c 05 00 00       	call   4a81 <wait>
    4575:	83 ec 08             	sub    $0x8,%esp
    4578:	68 ac 5d 00 00       	push   $0x5dac
    457d:	6a 01                	push   $0x1
    457f:	e8 7c 06 00 00       	call   4c00 <printf>
    4584:	83 c4 10             	add    $0x10,%esp
    4587:	c9                   	leave  
    4588:	c3                   	ret    
    4589:	b8 09 00 00 00       	mov    $0x9,%eax
    458e:	ba 70 00 00 00       	mov    $0x70,%edx
    4593:	ee                   	out    %al,(%dx)
    4594:	ba 71 00 00 00       	mov    $0x71,%edx
    4599:	ec                   	in     (%dx),%al
    459a:	52                   	push   %edx
    459b:	52                   	push   %edx
    459c:	68 38 65 00 00       	push   $0x6538
    45a1:	6a 01                	push   $0x1
    45a3:	e8 58 06 00 00       	call   4c00 <printf>
    45a8:	e8 cc 04 00 00       	call   4a79 <exit>
    45ad:	50                   	push   %eax
    45ae:	50                   	push   %eax
    45af:	68 31 5d 00 00       	push   $0x5d31
    45b4:	6a 01                	push   $0x1
    45b6:	e8 45 06 00 00       	call   4c00 <printf>
    45bb:	e8 b9 04 00 00       	call   4a79 <exit>

000045c0 <argptest>:
    45c0:	55                   	push   %ebp
    45c1:	89 e5                	mov    %esp,%ebp
    45c3:	53                   	push   %ebx
    45c4:	83 ec 0c             	sub    $0xc,%esp
    45c7:	6a 00                	push   $0x0
    45c9:	68 bb 5d 00 00       	push   $0x5dbb
    45ce:	e8 e6 04 00 00       	call   4ab9 <open>
    45d3:	83 c4 10             	add    $0x10,%esp
    45d6:	85 c0                	test   %eax,%eax
    45d8:	78 39                	js     4613 <argptest+0x53>
    45da:	83 ec 0c             	sub    $0xc,%esp
    45dd:	89 c3                	mov    %eax,%ebx
    45df:	6a 00                	push   $0x0
    45e1:	e8 1b 05 00 00       	call   4b01 <sbrk>
    45e6:	83 c4 0c             	add    $0xc,%esp
    45e9:	83 e8 01             	sub    $0x1,%eax
    45ec:	6a ff                	push   $0xffffffff
    45ee:	50                   	push   %eax
    45ef:	53                   	push   %ebx
    45f0:	e8 9c 04 00 00       	call   4a91 <read>
    45f5:	89 1c 24             	mov    %ebx,(%esp)
    45f8:	e8 a4 04 00 00       	call   4aa1 <close>
    45fd:	58                   	pop    %eax
    45fe:	5a                   	pop    %edx
    45ff:	68 cd 5d 00 00       	push   $0x5dcd
    4604:	6a 01                	push   $0x1
    4606:	e8 f5 05 00 00       	call   4c00 <printf>
    460b:	83 c4 10             	add    $0x10,%esp
    460e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4611:	c9                   	leave  
    4612:	c3                   	ret    
    4613:	51                   	push   %ecx
    4614:	51                   	push   %ecx
    4615:	68 c0 5d 00 00       	push   $0x5dc0
    461a:	6a 02                	push   $0x2
    461c:	e8 df 05 00 00       	call   4c00 <printf>
    4621:	e8 53 04 00 00       	call   4a79 <exit>
    4626:	8d 76 00             	lea    0x0(%esi),%esi
    4629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004630 <rand>:
    4630:	69 05 dc 6e 00 00 0d 	imul   $0x19660d,0x6edc,%eax
    4637:	66 19 00 
    463a:	55                   	push   %ebp
    463b:	89 e5                	mov    %esp,%ebp
    463d:	5d                   	pop    %ebp
    463e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    4643:	a3 dc 6e 00 00       	mov    %eax,0x6edc
    4648:	c3                   	ret    
    4649:	66 90                	xchg   %ax,%ax
    464b:	66 90                	xchg   %ax,%ax
    464d:	66 90                	xchg   %ax,%ax
    464f:	90                   	nop

00004650 <strcpy>:
    4650:	55                   	push   %ebp
    4651:	89 e5                	mov    %esp,%ebp
    4653:	53                   	push   %ebx
    4654:	8b 45 08             	mov    0x8(%ebp),%eax
    4657:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    465a:	89 c2                	mov    %eax,%edx
    465c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4660:	83 c1 01             	add    $0x1,%ecx
    4663:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    4667:	83 c2 01             	add    $0x1,%edx
    466a:	84 db                	test   %bl,%bl
    466c:	88 5a ff             	mov    %bl,-0x1(%edx)
    466f:	75 ef                	jne    4660 <strcpy+0x10>
    4671:	5b                   	pop    %ebx
    4672:	5d                   	pop    %ebp
    4673:	c3                   	ret    
    4674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    467a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00004680 <strcmp>:
    4680:	55                   	push   %ebp
    4681:	89 e5                	mov    %esp,%ebp
    4683:	53                   	push   %ebx
    4684:	8b 55 08             	mov    0x8(%ebp),%edx
    4687:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    468a:	0f b6 02             	movzbl (%edx),%eax
    468d:	0f b6 19             	movzbl (%ecx),%ebx
    4690:	84 c0                	test   %al,%al
    4692:	75 1c                	jne    46b0 <strcmp+0x30>
    4694:	eb 2a                	jmp    46c0 <strcmp+0x40>
    4696:	8d 76 00             	lea    0x0(%esi),%esi
    4699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    46a0:	83 c2 01             	add    $0x1,%edx
    46a3:	0f b6 02             	movzbl (%edx),%eax
    46a6:	83 c1 01             	add    $0x1,%ecx
    46a9:	0f b6 19             	movzbl (%ecx),%ebx
    46ac:	84 c0                	test   %al,%al
    46ae:	74 10                	je     46c0 <strcmp+0x40>
    46b0:	38 d8                	cmp    %bl,%al
    46b2:	74 ec                	je     46a0 <strcmp+0x20>
    46b4:	29 d8                	sub    %ebx,%eax
    46b6:	5b                   	pop    %ebx
    46b7:	5d                   	pop    %ebp
    46b8:	c3                   	ret    
    46b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    46c0:	31 c0                	xor    %eax,%eax
    46c2:	29 d8                	sub    %ebx,%eax
    46c4:	5b                   	pop    %ebx
    46c5:	5d                   	pop    %ebp
    46c6:	c3                   	ret    
    46c7:	89 f6                	mov    %esi,%esi
    46c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000046d0 <strlen>:
    46d0:	55                   	push   %ebp
    46d1:	89 e5                	mov    %esp,%ebp
    46d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    46d6:	80 39 00             	cmpb   $0x0,(%ecx)
    46d9:	74 15                	je     46f0 <strlen+0x20>
    46db:	31 d2                	xor    %edx,%edx
    46dd:	8d 76 00             	lea    0x0(%esi),%esi
    46e0:	83 c2 01             	add    $0x1,%edx
    46e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    46e7:	89 d0                	mov    %edx,%eax
    46e9:	75 f5                	jne    46e0 <strlen+0x10>
    46eb:	5d                   	pop    %ebp
    46ec:	c3                   	ret    
    46ed:	8d 76 00             	lea    0x0(%esi),%esi
    46f0:	31 c0                	xor    %eax,%eax
    46f2:	5d                   	pop    %ebp
    46f3:	c3                   	ret    
    46f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    46fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00004700 <memset>:
    4700:	55                   	push   %ebp
    4701:	89 e5                	mov    %esp,%ebp
    4703:	57                   	push   %edi
    4704:	8b 55 08             	mov    0x8(%ebp),%edx
    4707:	8b 4d 10             	mov    0x10(%ebp),%ecx
    470a:	8b 45 0c             	mov    0xc(%ebp),%eax
    470d:	89 d7                	mov    %edx,%edi
    470f:	fc                   	cld    
    4710:	f3 aa                	rep stos %al,%es:(%edi)
    4712:	89 d0                	mov    %edx,%eax
    4714:	5f                   	pop    %edi
    4715:	5d                   	pop    %ebp
    4716:	c3                   	ret    
    4717:	89 f6                	mov    %esi,%esi
    4719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004720 <strchr>:
    4720:	55                   	push   %ebp
    4721:	89 e5                	mov    %esp,%ebp
    4723:	53                   	push   %ebx
    4724:	8b 45 08             	mov    0x8(%ebp),%eax
    4727:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    472a:	0f b6 10             	movzbl (%eax),%edx
    472d:	84 d2                	test   %dl,%dl
    472f:	74 1d                	je     474e <strchr+0x2e>
    4731:	38 d3                	cmp    %dl,%bl
    4733:	89 d9                	mov    %ebx,%ecx
    4735:	75 0d                	jne    4744 <strchr+0x24>
    4737:	eb 17                	jmp    4750 <strchr+0x30>
    4739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4740:	38 ca                	cmp    %cl,%dl
    4742:	74 0c                	je     4750 <strchr+0x30>
    4744:	83 c0 01             	add    $0x1,%eax
    4747:	0f b6 10             	movzbl (%eax),%edx
    474a:	84 d2                	test   %dl,%dl
    474c:	75 f2                	jne    4740 <strchr+0x20>
    474e:	31 c0                	xor    %eax,%eax
    4750:	5b                   	pop    %ebx
    4751:	5d                   	pop    %ebp
    4752:	c3                   	ret    
    4753:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004760 <gets>:
    4760:	55                   	push   %ebp
    4761:	89 e5                	mov    %esp,%ebp
    4763:	57                   	push   %edi
    4764:	56                   	push   %esi
    4765:	53                   	push   %ebx
    4766:	31 f6                	xor    %esi,%esi
    4768:	89 f3                	mov    %esi,%ebx
    476a:	83 ec 1c             	sub    $0x1c,%esp
    476d:	8b 7d 08             	mov    0x8(%ebp),%edi
    4770:	eb 2f                	jmp    47a1 <gets+0x41>
    4772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4778:	8d 45 e7             	lea    -0x19(%ebp),%eax
    477b:	83 ec 04             	sub    $0x4,%esp
    477e:	6a 01                	push   $0x1
    4780:	50                   	push   %eax
    4781:	6a 00                	push   $0x0
    4783:	e8 09 03 00 00       	call   4a91 <read>
    4788:	83 c4 10             	add    $0x10,%esp
    478b:	85 c0                	test   %eax,%eax
    478d:	7e 1c                	jle    47ab <gets+0x4b>
    478f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    4793:	83 c7 01             	add    $0x1,%edi
    4796:	88 47 ff             	mov    %al,-0x1(%edi)
    4799:	3c 0a                	cmp    $0xa,%al
    479b:	74 23                	je     47c0 <gets+0x60>
    479d:	3c 0d                	cmp    $0xd,%al
    479f:	74 1f                	je     47c0 <gets+0x60>
    47a1:	83 c3 01             	add    $0x1,%ebx
    47a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    47a7:	89 fe                	mov    %edi,%esi
    47a9:	7c cd                	jl     4778 <gets+0x18>
    47ab:	89 f3                	mov    %esi,%ebx
    47ad:	8b 45 08             	mov    0x8(%ebp),%eax
    47b0:	c6 03 00             	movb   $0x0,(%ebx)
    47b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    47b6:	5b                   	pop    %ebx
    47b7:	5e                   	pop    %esi
    47b8:	5f                   	pop    %edi
    47b9:	5d                   	pop    %ebp
    47ba:	c3                   	ret    
    47bb:	90                   	nop
    47bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    47c0:	8b 75 08             	mov    0x8(%ebp),%esi
    47c3:	8b 45 08             	mov    0x8(%ebp),%eax
    47c6:	01 de                	add    %ebx,%esi
    47c8:	89 f3                	mov    %esi,%ebx
    47ca:	c6 03 00             	movb   $0x0,(%ebx)
    47cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    47d0:	5b                   	pop    %ebx
    47d1:	5e                   	pop    %esi
    47d2:	5f                   	pop    %edi
    47d3:	5d                   	pop    %ebp
    47d4:	c3                   	ret    
    47d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    47d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000047e0 <stat>:
    47e0:	55                   	push   %ebp
    47e1:	89 e5                	mov    %esp,%ebp
    47e3:	56                   	push   %esi
    47e4:	53                   	push   %ebx
    47e5:	83 ec 08             	sub    $0x8,%esp
    47e8:	6a 00                	push   $0x0
    47ea:	ff 75 08             	pushl  0x8(%ebp)
    47ed:	e8 c7 02 00 00       	call   4ab9 <open>
    47f2:	83 c4 10             	add    $0x10,%esp
    47f5:	85 c0                	test   %eax,%eax
    47f7:	78 27                	js     4820 <stat+0x40>
    47f9:	83 ec 08             	sub    $0x8,%esp
    47fc:	ff 75 0c             	pushl  0xc(%ebp)
    47ff:	89 c3                	mov    %eax,%ebx
    4801:	50                   	push   %eax
    4802:	e8 ca 02 00 00       	call   4ad1 <fstat>
    4807:	89 1c 24             	mov    %ebx,(%esp)
    480a:	89 c6                	mov    %eax,%esi
    480c:	e8 90 02 00 00       	call   4aa1 <close>
    4811:	83 c4 10             	add    $0x10,%esp
    4814:	8d 65 f8             	lea    -0x8(%ebp),%esp
    4817:	89 f0                	mov    %esi,%eax
    4819:	5b                   	pop    %ebx
    481a:	5e                   	pop    %esi
    481b:	5d                   	pop    %ebp
    481c:	c3                   	ret    
    481d:	8d 76 00             	lea    0x0(%esi),%esi
    4820:	be ff ff ff ff       	mov    $0xffffffff,%esi
    4825:	eb ed                	jmp    4814 <stat+0x34>
    4827:	89 f6                	mov    %esi,%esi
    4829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004830 <atoi>:
    4830:	55                   	push   %ebp
    4831:	89 e5                	mov    %esp,%ebp
    4833:	53                   	push   %ebx
    4834:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4837:	0f be 11             	movsbl (%ecx),%edx
    483a:	8d 42 d0             	lea    -0x30(%edx),%eax
    483d:	3c 09                	cmp    $0x9,%al
    483f:	b8 00 00 00 00       	mov    $0x0,%eax
    4844:	77 1f                	ja     4865 <atoi+0x35>
    4846:	8d 76 00             	lea    0x0(%esi),%esi
    4849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    4850:	8d 04 80             	lea    (%eax,%eax,4),%eax
    4853:	83 c1 01             	add    $0x1,%ecx
    4856:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
    485a:	0f be 11             	movsbl (%ecx),%edx
    485d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    4860:	80 fb 09             	cmp    $0x9,%bl
    4863:	76 eb                	jbe    4850 <atoi+0x20>
    4865:	5b                   	pop    %ebx
    4866:	5d                   	pop    %ebp
    4867:	c3                   	ret    
    4868:	90                   	nop
    4869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004870 <memmove>:
    4870:	55                   	push   %ebp
    4871:	89 e5                	mov    %esp,%ebp
    4873:	56                   	push   %esi
    4874:	53                   	push   %ebx
    4875:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4878:	8b 45 08             	mov    0x8(%ebp),%eax
    487b:	8b 75 0c             	mov    0xc(%ebp),%esi
    487e:	85 db                	test   %ebx,%ebx
    4880:	7e 14                	jle    4896 <memmove+0x26>
    4882:	31 d2                	xor    %edx,%edx
    4884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4888:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    488c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    488f:	83 c2 01             	add    $0x1,%edx
    4892:	39 d3                	cmp    %edx,%ebx
    4894:	75 f2                	jne    4888 <memmove+0x18>
    4896:	5b                   	pop    %ebx
    4897:	5e                   	pop    %esi
    4898:	5d                   	pop    %ebp
    4899:	c3                   	ret    
    489a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000048a0 <thread_join>:
    48a0:	55                   	push   %ebp
    48a1:	89 e5                	mov    %esp,%ebp
    48a3:	83 ec 24             	sub    $0x24,%esp
    48a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    48a9:	50                   	push   %eax
    48aa:	e8 a2 02 00 00       	call   4b51 <join>
    48af:	c9                   	leave  
    48b0:	c3                   	ret    
    48b1:	eb 0d                	jmp    48c0 <free>
    48b3:	90                   	nop
    48b4:	90                   	nop
    48b5:	90                   	nop
    48b6:	90                   	nop
    48b7:	90                   	nop
    48b8:	90                   	nop
    48b9:	90                   	nop
    48ba:	90                   	nop
    48bb:	90                   	nop
    48bc:	90                   	nop
    48bd:	90                   	nop
    48be:	90                   	nop
    48bf:	90                   	nop

000048c0 <free>:
    48c0:	55                   	push   %ebp
    48c1:	a1 80 6f 00 00       	mov    0x6f80,%eax
    48c6:	89 e5                	mov    %esp,%ebp
    48c8:	57                   	push   %edi
    48c9:	56                   	push   %esi
    48ca:	53                   	push   %ebx
    48cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    48ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    48d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    48d8:	39 c8                	cmp    %ecx,%eax
    48da:	8b 10                	mov    (%eax),%edx
    48dc:	73 32                	jae    4910 <free+0x50>
    48de:	39 d1                	cmp    %edx,%ecx
    48e0:	72 04                	jb     48e6 <free+0x26>
    48e2:	39 d0                	cmp    %edx,%eax
    48e4:	72 32                	jb     4918 <free+0x58>
    48e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    48e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    48ec:	39 fa                	cmp    %edi,%edx
    48ee:	74 30                	je     4920 <free+0x60>
    48f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
    48f3:	8b 50 04             	mov    0x4(%eax),%edx
    48f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    48f9:	39 f1                	cmp    %esi,%ecx
    48fb:	74 3a                	je     4937 <free+0x77>
    48fd:	89 08                	mov    %ecx,(%eax)
    48ff:	a3 80 6f 00 00       	mov    %eax,0x6f80
    4904:	5b                   	pop    %ebx
    4905:	5e                   	pop    %esi
    4906:	5f                   	pop    %edi
    4907:	5d                   	pop    %ebp
    4908:	c3                   	ret    
    4909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4910:	39 d0                	cmp    %edx,%eax
    4912:	72 04                	jb     4918 <free+0x58>
    4914:	39 d1                	cmp    %edx,%ecx
    4916:	72 ce                	jb     48e6 <free+0x26>
    4918:	89 d0                	mov    %edx,%eax
    491a:	eb bc                	jmp    48d8 <free+0x18>
    491c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4920:	03 72 04             	add    0x4(%edx),%esi
    4923:	89 73 fc             	mov    %esi,-0x4(%ebx)
    4926:	8b 10                	mov    (%eax),%edx
    4928:	8b 12                	mov    (%edx),%edx
    492a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    492d:	8b 50 04             	mov    0x4(%eax),%edx
    4930:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4933:	39 f1                	cmp    %esi,%ecx
    4935:	75 c6                	jne    48fd <free+0x3d>
    4937:	03 53 fc             	add    -0x4(%ebx),%edx
    493a:	a3 80 6f 00 00       	mov    %eax,0x6f80
    493f:	89 50 04             	mov    %edx,0x4(%eax)
    4942:	8b 53 f8             	mov    -0x8(%ebx),%edx
    4945:	89 10                	mov    %edx,(%eax)
    4947:	5b                   	pop    %ebx
    4948:	5e                   	pop    %esi
    4949:	5f                   	pop    %edi
    494a:	5d                   	pop    %ebp
    494b:	c3                   	ret    
    494c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004950 <malloc>:
    4950:	55                   	push   %ebp
    4951:	89 e5                	mov    %esp,%ebp
    4953:	57                   	push   %edi
    4954:	56                   	push   %esi
    4955:	53                   	push   %ebx
    4956:	83 ec 0c             	sub    $0xc,%esp
    4959:	8b 45 08             	mov    0x8(%ebp),%eax
    495c:	8b 15 80 6f 00 00    	mov    0x6f80,%edx
    4962:	8d 78 07             	lea    0x7(%eax),%edi
    4965:	c1 ef 03             	shr    $0x3,%edi
    4968:	83 c7 01             	add    $0x1,%edi
    496b:	85 d2                	test   %edx,%edx
    496d:	0f 84 9d 00 00 00    	je     4a10 <malloc+0xc0>
    4973:	8b 02                	mov    (%edx),%eax
    4975:	8b 48 04             	mov    0x4(%eax),%ecx
    4978:	39 cf                	cmp    %ecx,%edi
    497a:	76 6c                	jbe    49e8 <malloc+0x98>
    497c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    4982:	bb 00 10 00 00       	mov    $0x1000,%ebx
    4987:	0f 43 df             	cmovae %edi,%ebx
    498a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    4991:	eb 0e                	jmp    49a1 <malloc+0x51>
    4993:	90                   	nop
    4994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4998:	8b 02                	mov    (%edx),%eax
    499a:	8b 48 04             	mov    0x4(%eax),%ecx
    499d:	39 f9                	cmp    %edi,%ecx
    499f:	73 47                	jae    49e8 <malloc+0x98>
    49a1:	39 05 80 6f 00 00    	cmp    %eax,0x6f80
    49a7:	89 c2                	mov    %eax,%edx
    49a9:	75 ed                	jne    4998 <malloc+0x48>
    49ab:	83 ec 0c             	sub    $0xc,%esp
    49ae:	56                   	push   %esi
    49af:	e8 4d 01 00 00       	call   4b01 <sbrk>
    49b4:	83 c4 10             	add    $0x10,%esp
    49b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    49ba:	74 1c                	je     49d8 <malloc+0x88>
    49bc:	89 58 04             	mov    %ebx,0x4(%eax)
    49bf:	83 ec 0c             	sub    $0xc,%esp
    49c2:	83 c0 08             	add    $0x8,%eax
    49c5:	50                   	push   %eax
    49c6:	e8 f5 fe ff ff       	call   48c0 <free>
    49cb:	8b 15 80 6f 00 00    	mov    0x6f80,%edx
    49d1:	83 c4 10             	add    $0x10,%esp
    49d4:	85 d2                	test   %edx,%edx
    49d6:	75 c0                	jne    4998 <malloc+0x48>
    49d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    49db:	31 c0                	xor    %eax,%eax
    49dd:	5b                   	pop    %ebx
    49de:	5e                   	pop    %esi
    49df:	5f                   	pop    %edi
    49e0:	5d                   	pop    %ebp
    49e1:	c3                   	ret    
    49e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    49e8:	39 cf                	cmp    %ecx,%edi
    49ea:	74 54                	je     4a40 <malloc+0xf0>
    49ec:	29 f9                	sub    %edi,%ecx
    49ee:	89 48 04             	mov    %ecx,0x4(%eax)
    49f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    49f4:	89 78 04             	mov    %edi,0x4(%eax)
    49f7:	89 15 80 6f 00 00    	mov    %edx,0x6f80
    49fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4a00:	83 c0 08             	add    $0x8,%eax
    4a03:	5b                   	pop    %ebx
    4a04:	5e                   	pop    %esi
    4a05:	5f                   	pop    %edi
    4a06:	5d                   	pop    %ebp
    4a07:	c3                   	ret    
    4a08:	90                   	nop
    4a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4a10:	c7 05 80 6f 00 00 84 	movl   $0x6f84,0x6f80
    4a17:	6f 00 00 
    4a1a:	c7 05 84 6f 00 00 84 	movl   $0x6f84,0x6f84
    4a21:	6f 00 00 
    4a24:	b8 84 6f 00 00       	mov    $0x6f84,%eax
    4a29:	c7 05 88 6f 00 00 00 	movl   $0x0,0x6f88
    4a30:	00 00 00 
    4a33:	e9 44 ff ff ff       	jmp    497c <malloc+0x2c>
    4a38:	90                   	nop
    4a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4a40:	8b 08                	mov    (%eax),%ecx
    4a42:	89 0a                	mov    %ecx,(%edx)
    4a44:	eb b1                	jmp    49f7 <malloc+0xa7>
    4a46:	8d 76 00             	lea    0x0(%esi),%esi
    4a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004a50 <thread_create>:
    4a50:	55                   	push   %ebp
    4a51:	89 e5                	mov    %esp,%ebp
    4a53:	83 ec 14             	sub    $0x14,%esp
    4a56:	68 00 10 00 00       	push   $0x1000
    4a5b:	e8 f0 fe ff ff       	call   4950 <malloc>
    4a60:	83 c4 0c             	add    $0xc,%esp
    4a63:	50                   	push   %eax
    4a64:	ff 75 0c             	pushl  0xc(%ebp)
    4a67:	ff 75 08             	pushl  0x8(%ebp)
    4a6a:	e8 da 00 00 00       	call   4b49 <clone>
    4a6f:	c9                   	leave  
    4a70:	c3                   	ret    

00004a71 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4a71:	b8 01 00 00 00       	mov    $0x1,%eax
    4a76:	cd 40                	int    $0x40
    4a78:	c3                   	ret    

00004a79 <exit>:
SYSCALL(exit)
    4a79:	b8 02 00 00 00       	mov    $0x2,%eax
    4a7e:	cd 40                	int    $0x40
    4a80:	c3                   	ret    

00004a81 <wait>:
SYSCALL(wait)
    4a81:	b8 03 00 00 00       	mov    $0x3,%eax
    4a86:	cd 40                	int    $0x40
    4a88:	c3                   	ret    

00004a89 <pipe>:
SYSCALL(pipe)
    4a89:	b8 04 00 00 00       	mov    $0x4,%eax
    4a8e:	cd 40                	int    $0x40
    4a90:	c3                   	ret    

00004a91 <read>:
SYSCALL(read)
    4a91:	b8 05 00 00 00       	mov    $0x5,%eax
    4a96:	cd 40                	int    $0x40
    4a98:	c3                   	ret    

00004a99 <write>:
SYSCALL(write)
    4a99:	b8 10 00 00 00       	mov    $0x10,%eax
    4a9e:	cd 40                	int    $0x40
    4aa0:	c3                   	ret    

00004aa1 <close>:
SYSCALL(close)
    4aa1:	b8 15 00 00 00       	mov    $0x15,%eax
    4aa6:	cd 40                	int    $0x40
    4aa8:	c3                   	ret    

00004aa9 <kill>:
SYSCALL(kill)
    4aa9:	b8 06 00 00 00       	mov    $0x6,%eax
    4aae:	cd 40                	int    $0x40
    4ab0:	c3                   	ret    

00004ab1 <exec>:
SYSCALL(exec)
    4ab1:	b8 07 00 00 00       	mov    $0x7,%eax
    4ab6:	cd 40                	int    $0x40
    4ab8:	c3                   	ret    

00004ab9 <open>:
SYSCALL(open)
    4ab9:	b8 0f 00 00 00       	mov    $0xf,%eax
    4abe:	cd 40                	int    $0x40
    4ac0:	c3                   	ret    

00004ac1 <mknod>:
SYSCALL(mknod)
    4ac1:	b8 11 00 00 00       	mov    $0x11,%eax
    4ac6:	cd 40                	int    $0x40
    4ac8:	c3                   	ret    

00004ac9 <unlink>:
SYSCALL(unlink)
    4ac9:	b8 12 00 00 00       	mov    $0x12,%eax
    4ace:	cd 40                	int    $0x40
    4ad0:	c3                   	ret    

00004ad1 <fstat>:
SYSCALL(fstat)
    4ad1:	b8 08 00 00 00       	mov    $0x8,%eax
    4ad6:	cd 40                	int    $0x40
    4ad8:	c3                   	ret    

00004ad9 <link>:
SYSCALL(link)
    4ad9:	b8 13 00 00 00       	mov    $0x13,%eax
    4ade:	cd 40                	int    $0x40
    4ae0:	c3                   	ret    

00004ae1 <mkdir>:
SYSCALL(mkdir)
    4ae1:	b8 14 00 00 00       	mov    $0x14,%eax
    4ae6:	cd 40                	int    $0x40
    4ae8:	c3                   	ret    

00004ae9 <chdir>:
SYSCALL(chdir)
    4ae9:	b8 09 00 00 00       	mov    $0x9,%eax
    4aee:	cd 40                	int    $0x40
    4af0:	c3                   	ret    

00004af1 <dup>:
SYSCALL(dup)
    4af1:	b8 0a 00 00 00       	mov    $0xa,%eax
    4af6:	cd 40                	int    $0x40
    4af8:	c3                   	ret    

00004af9 <getpid>:
SYSCALL(getpid)
    4af9:	b8 0b 00 00 00       	mov    $0xb,%eax
    4afe:	cd 40                	int    $0x40
    4b00:	c3                   	ret    

00004b01 <sbrk>:
SYSCALL(sbrk)
    4b01:	b8 0c 00 00 00       	mov    $0xc,%eax
    4b06:	cd 40                	int    $0x40
    4b08:	c3                   	ret    

00004b09 <sleep>:
SYSCALL(sleep)
    4b09:	b8 0d 00 00 00       	mov    $0xd,%eax
    4b0e:	cd 40                	int    $0x40
    4b10:	c3                   	ret    

00004b11 <uptime>:
SYSCALL(uptime)
    4b11:	b8 0e 00 00 00       	mov    $0xe,%eax
    4b16:	cd 40                	int    $0x40
    4b18:	c3                   	ret    

00004b19 <getreadcount>:
SYSCALL(getreadcount)
    4b19:	b8 16 00 00 00       	mov    $0x16,%eax
    4b1e:	cd 40                	int    $0x40
    4b20:	c3                   	ret    

00004b21 <gettime>:
SYSCALL(gettime)
    4b21:	b8 17 00 00 00       	mov    $0x17,%eax
    4b26:	cd 40                	int    $0x40
    4b28:	c3                   	ret    

00004b29 <settickets>:
SYSCALL(settickets)
    4b29:	b8 18 00 00 00       	mov    $0x18,%eax
    4b2e:	cd 40                	int    $0x40
    4b30:	c3                   	ret    

00004b31 <getpinfo>:
SYSCALL(getpinfo)
    4b31:	b8 19 00 00 00       	mov    $0x19,%eax
    4b36:	cd 40                	int    $0x40
    4b38:	c3                   	ret    

00004b39 <mprotect>:
SYSCALL(mprotect)
    4b39:	b8 1a 00 00 00       	mov    $0x1a,%eax
    4b3e:	cd 40                	int    $0x40
    4b40:	c3                   	ret    

00004b41 <munprotect>:
SYSCALL(munprotect)
    4b41:	b8 1b 00 00 00       	mov    $0x1b,%eax
    4b46:	cd 40                	int    $0x40
    4b48:	c3                   	ret    

00004b49 <clone>:
SYSCALL(clone)
    4b49:	b8 1c 00 00 00       	mov    $0x1c,%eax
    4b4e:	cd 40                	int    $0x40
    4b50:	c3                   	ret    

00004b51 <join>:
    4b51:	b8 1d 00 00 00       	mov    $0x1d,%eax
    4b56:	cd 40                	int    $0x40
    4b58:	c3                   	ret    
    4b59:	66 90                	xchg   %ax,%ax
    4b5b:	66 90                	xchg   %ax,%ax
    4b5d:	66 90                	xchg   %ax,%ax
    4b5f:	90                   	nop

00004b60 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    4b60:	55                   	push   %ebp
    4b61:	89 e5                	mov    %esp,%ebp
    4b63:	57                   	push   %edi
    4b64:	56                   	push   %esi
    4b65:	53                   	push   %ebx
    4b66:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    4b69:	85 d2                	test   %edx,%edx
{
    4b6b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    4b6e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    4b70:	79 76                	jns    4be8 <printint+0x88>
    4b72:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    4b76:	74 70                	je     4be8 <printint+0x88>
    x = -xx;
    4b78:	f7 d8                	neg    %eax
    neg = 1;
    4b7a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    4b81:	31 f6                	xor    %esi,%esi
    4b83:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    4b86:	eb 0a                	jmp    4b92 <printint+0x32>
    4b88:	90                   	nop
    4b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    4b90:	89 fe                	mov    %edi,%esi
    4b92:	31 d2                	xor    %edx,%edx
    4b94:	8d 7e 01             	lea    0x1(%esi),%edi
    4b97:	f7 f1                	div    %ecx
    4b99:	0f b6 92 90 65 00 00 	movzbl 0x6590(%edx),%edx
  }while((x /= base) != 0);
    4ba0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    4ba2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    4ba5:	75 e9                	jne    4b90 <printint+0x30>
  if(neg)
    4ba7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4baa:	85 c0                	test   %eax,%eax
    4bac:	74 08                	je     4bb6 <printint+0x56>
    buf[i++] = '-';
    4bae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    4bb3:	8d 7e 02             	lea    0x2(%esi),%edi
    4bb6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    4bba:	8b 7d c0             	mov    -0x40(%ebp),%edi
    4bbd:	8d 76 00             	lea    0x0(%esi),%esi
    4bc0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    4bc3:	83 ec 04             	sub    $0x4,%esp
    4bc6:	83 ee 01             	sub    $0x1,%esi
    4bc9:	6a 01                	push   $0x1
    4bcb:	53                   	push   %ebx
    4bcc:	57                   	push   %edi
    4bcd:	88 45 d7             	mov    %al,-0x29(%ebp)
    4bd0:	e8 c4 fe ff ff       	call   4a99 <write>

  while(--i >= 0)
    4bd5:	83 c4 10             	add    $0x10,%esp
    4bd8:	39 de                	cmp    %ebx,%esi
    4bda:	75 e4                	jne    4bc0 <printint+0x60>
    putc(fd, buf[i]);
}
    4bdc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4bdf:	5b                   	pop    %ebx
    4be0:	5e                   	pop    %esi
    4be1:	5f                   	pop    %edi
    4be2:	5d                   	pop    %ebp
    4be3:	c3                   	ret    
    4be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    4be8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    4bef:	eb 90                	jmp    4b81 <printint+0x21>
    4bf1:	eb 0d                	jmp    4c00 <printf>
    4bf3:	90                   	nop
    4bf4:	90                   	nop
    4bf5:	90                   	nop
    4bf6:	90                   	nop
    4bf7:	90                   	nop
    4bf8:	90                   	nop
    4bf9:	90                   	nop
    4bfa:	90                   	nop
    4bfb:	90                   	nop
    4bfc:	90                   	nop
    4bfd:	90                   	nop
    4bfe:	90                   	nop
    4bff:	90                   	nop

00004c00 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    4c00:	55                   	push   %ebp
    4c01:	89 e5                	mov    %esp,%ebp
    4c03:	57                   	push   %edi
    4c04:	56                   	push   %esi
    4c05:	53                   	push   %ebx
    4c06:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4c09:	8b 75 0c             	mov    0xc(%ebp),%esi
    4c0c:	0f b6 1e             	movzbl (%esi),%ebx
    4c0f:	84 db                	test   %bl,%bl
    4c11:	0f 84 bf 00 00 00    	je     4cd6 <printf+0xd6>
    4c17:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    4c1a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    4c1d:	31 d2                	xor    %edx,%edx
    4c1f:	eb 39                	jmp    4c5a <printf+0x5a>
    4c21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    4c28:	83 f8 25             	cmp    $0x25,%eax
    4c2b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    4c2e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    4c33:	74 1a                	je     4c4f <printf+0x4f>
  write(fd, &c, 1);
    4c35:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    4c38:	83 ec 04             	sub    $0x4,%esp
    4c3b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    4c3e:	6a 01                	push   $0x1
    4c40:	50                   	push   %eax
    4c41:	ff 75 08             	pushl  0x8(%ebp)
    4c44:	e8 50 fe ff ff       	call   4a99 <write>
    4c49:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4c4c:	83 c4 10             	add    $0x10,%esp
    4c4f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    4c52:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    4c56:	84 db                	test   %bl,%bl
    4c58:	74 7c                	je     4cd6 <printf+0xd6>
    if(state == 0){
    4c5a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    4c5c:	0f be cb             	movsbl %bl,%ecx
    4c5f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    4c62:	74 c4                	je     4c28 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    4c64:	83 fa 25             	cmp    $0x25,%edx
    4c67:	75 e6                	jne    4c4f <printf+0x4f>
      if(c == 'd'){
    4c69:	83 f8 64             	cmp    $0x64,%eax
    4c6c:	0f 84 a6 00 00 00    	je     4d18 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    4c72:	83 f8 6c             	cmp    $0x6c,%eax
    4c75:	0f 84 ad 00 00 00    	je     4d28 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    4c7b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    4c81:	83 f9 70             	cmp    $0x70,%ecx
    4c84:	74 5a                	je     4ce0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    4c86:	83 f8 73             	cmp    $0x73,%eax
    4c89:	0f 84 e1 00 00 00    	je     4d70 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4c8f:	83 f8 63             	cmp    $0x63,%eax
    4c92:	0f 84 28 01 00 00    	je     4dc0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    4c98:	83 f8 25             	cmp    $0x25,%eax
    4c9b:	74 6b                	je     4d08 <printf+0x108>
  write(fd, &c, 1);
    4c9d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    4ca0:	83 ec 04             	sub    $0x4,%esp
    4ca3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    4ca7:	6a 01                	push   $0x1
    4ca9:	50                   	push   %eax
    4caa:	ff 75 08             	pushl  0x8(%ebp)
    4cad:	e8 e7 fd ff ff       	call   4a99 <write>
    4cb2:	83 c4 0c             	add    $0xc,%esp
    4cb5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    4cb8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    4cbb:	6a 01                	push   $0x1
    4cbd:	50                   	push   %eax
    4cbe:	ff 75 08             	pushl  0x8(%ebp)
    4cc1:	83 c6 01             	add    $0x1,%esi
    4cc4:	e8 d0 fd ff ff       	call   4a99 <write>
  for(i = 0; fmt[i]; i++){
    4cc9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    4ccd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4cd0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    4cd2:	84 db                	test   %bl,%bl
    4cd4:	75 84                	jne    4c5a <printf+0x5a>
    }
  }
}
    4cd6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4cd9:	5b                   	pop    %ebx
    4cda:	5e                   	pop    %esi
    4cdb:	5f                   	pop    %edi
    4cdc:	5d                   	pop    %ebp
    4cdd:	c3                   	ret    
    4cde:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    4ce0:	83 ec 0c             	sub    $0xc,%esp
    4ce3:	b9 10 00 00 00       	mov    $0x10,%ecx
    4ce8:	6a 00                	push   $0x0
    4cea:	8b 17                	mov    (%edi),%edx
    4cec:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    4cef:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    4cf2:	e8 69 fe ff ff       	call   4b60 <printint>
    4cf7:	83 c4 10             	add    $0x10,%esp
      state = 0;
    4cfa:	31 d2                	xor    %edx,%edx
    4cfc:	e9 4e ff ff ff       	jmp    4c4f <printf+0x4f>
    4d01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    4d08:	83 ec 04             	sub    $0x4,%esp
    4d0b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    4d0e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    4d11:	6a 01                	push   $0x1
    4d13:	eb a8                	jmp    4cbd <printf+0xbd>
    4d15:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    4d18:	83 ec 0c             	sub    $0xc,%esp
    4d1b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4d20:	6a 01                	push   $0x1
    4d22:	eb c6                	jmp    4cea <printf+0xea>
    4d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    4d28:	8b 57 04             	mov    0x4(%edi),%edx
    4d2b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    4d2d:	85 d2                	test   %edx,%edx
    4d2f:	74 15                	je     4d46 <printf+0x146>
    4d31:	83 ec 0c             	sub    $0xc,%esp
    4d34:	8b 45 08             	mov    0x8(%ebp),%eax
    4d37:	b9 10 00 00 00       	mov    $0x10,%ecx
    4d3c:	6a 00                	push   $0x0
    4d3e:	e8 1d fe ff ff       	call   4b60 <printint>
    4d43:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    4d46:	83 ec 0c             	sub    $0xc,%esp
    4d49:	8b 45 08             	mov    0x8(%ebp),%eax
    4d4c:	89 da                	mov    %ebx,%edx
    4d4e:	6a 00                	push   $0x0
    4d50:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    4d55:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    4d58:	e8 03 fe ff ff       	call   4b60 <printint>
    4d5d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    4d60:	31 d2                	xor    %edx,%edx
    4d62:	e9 e8 fe ff ff       	jmp    4c4f <printf+0x4f>
    4d67:	89 f6                	mov    %esi,%esi
    4d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    4d70:	8b 0f                	mov    (%edi),%ecx
        ap++;
    4d72:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    4d75:	85 c9                	test   %ecx,%ecx
    4d77:	74 6a                	je     4de3 <printf+0x1e3>
        while(*s != 0){
    4d79:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    4d7c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    4d7e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    4d80:	84 c0                	test   %al,%al
    4d82:	0f 84 c7 fe ff ff    	je     4c4f <printf+0x4f>
    4d88:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    4d8b:	89 de                	mov    %ebx,%esi
    4d8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    4d90:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    4d93:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    4d96:	83 ec 04             	sub    $0x4,%esp
    4d99:	6a 01                	push   $0x1
          s++;
    4d9b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    4d9e:	50                   	push   %eax
    4d9f:	53                   	push   %ebx
    4da0:	e8 f4 fc ff ff       	call   4a99 <write>
        while(*s != 0){
    4da5:	0f b6 06             	movzbl (%esi),%eax
    4da8:	83 c4 10             	add    $0x10,%esp
    4dab:	84 c0                	test   %al,%al
    4dad:	75 e1                	jne    4d90 <printf+0x190>
    4daf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    4db2:	31 d2                	xor    %edx,%edx
    4db4:	e9 96 fe ff ff       	jmp    4c4f <printf+0x4f>
    4db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    4dc0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    4dc2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    4dc5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    4dc8:	6a 01                	push   $0x1
        putc(fd, *ap);
    4dca:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    4dcd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4dd0:	50                   	push   %eax
    4dd1:	ff 75 08             	pushl  0x8(%ebp)
    4dd4:	e8 c0 fc ff ff       	call   4a99 <write>
    4dd9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    4ddc:	31 d2                	xor    %edx,%edx
    4dde:	e9 6c fe ff ff       	jmp    4c4f <printf+0x4f>
          s = "(null)";
    4de3:	bb 88 65 00 00       	mov    $0x6588,%ebx
        while(*s != 0){
    4de8:	b8 28 00 00 00       	mov    $0x28,%eax
    4ded:	eb 99                	jmp    4d88 <printf+0x188>
