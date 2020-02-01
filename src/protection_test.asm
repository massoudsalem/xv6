
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
  
  char *start = sbrk(0);
    100f:	83 ec 0c             	sub    $0xc,%esp
    1012:	6a 00                	push   $0x0
    1014:	e8 48 05 00 00       	call   1561 <sbrk>
    1019:	89 c3                	mov    %eax,%ebx
  sbrk(PGSIZE);
    101b:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    1022:	e8 3a 05 00 00       	call   1561 <sbrk>
  *start=100;
    1027:	c6 03 64             	movb   $0x64,(%ebx)
  mprotect(start, 1) ;
    102a:	59                   	pop    %ecx
    102b:	58                   	pop    %eax
    102c:	6a 01                	push   $0x1
    102e:	53                   	push   %ebx
    102f:	e8 65 05 00 00       	call   1599 <mprotect>
  int child=fork();
    1034:	e8 98 04 00 00       	call   14d1 <fork>
  if(child==0){
    1039:	83 c4 10             	add    $0x10,%esp
    103c:	83 f8 00             	cmp    $0x0,%eax
    103f:	74 30                	je     1071 <main+0x71>
        munprotect(start, 1) ;  
        *start=5;
        printf(1, "After unprotecting the value became = %d\n",*start); 
        exit();
  }
  else if(child>0){
    1041:	7e 29                	jle    106c <main+0x6c>
        wait();
    1043:	e8 99 04 00 00       	call   14e1 <wait>
        printf(1, "\nWatch this,I'll trap now\n"); 
    1048:	50                   	push   %eax
    1049:	50                   	push   %eax
    104a:	68 66 18 00 00       	push   $0x1866
    104f:	6a 01                	push   $0x1
    1051:	e8 0a 06 00 00       	call   1660 <printf>
        *start=5; 
    1056:	c6 03 05             	movb   $0x5,(%ebx)
        printf(1, "\nThis statement will not be printed\n");
    1059:	5a                   	pop    %edx
    105a:	59                   	pop    %ecx
    105b:	68 b0 18 00 00       	push   $0x18b0
    1060:	6a 01                	push   $0x1
    1062:	e8 f9 05 00 00       	call   1660 <printf>
        exit(); 
    1067:	e8 6d 04 00 00       	call   14d9 <exit>
  printf(1,"reched here \n");
//  munprotect((void *)(((uint)arr/PGSIZE-1)*PGSIZE),1);
  arr[0]='b';
   printf(1,"\narr[0] = %d\n",arr[0]);
  */ 
 exit();
    106c:	e8 68 04 00 00       	call   14d9 <exit>
	printf(1, "protected value = %d\n",*start); 
    1071:	50                   	push   %eax
    1072:	0f be 03             	movsbl (%ebx),%eax
    1075:	50                   	push   %eax
    1076:	68 50 18 00 00       	push   $0x1850
    107b:	6a 01                	push   $0x1
    107d:	e8 de 05 00 00       	call   1660 <printf>
        munprotect(start, 1) ;  
    1082:	58                   	pop    %eax
    1083:	5a                   	pop    %edx
    1084:	6a 01                	push   $0x1
    1086:	53                   	push   %ebx
    1087:	e8 15 05 00 00       	call   15a1 <munprotect>
        printf(1, "After unprotecting the value became = %d\n",*start); 
    108c:	83 c4 0c             	add    $0xc,%esp
        *start=5;
    108f:	c6 03 05             	movb   $0x5,(%ebx)
        printf(1, "After unprotecting the value became = %d\n",*start); 
    1092:	6a 05                	push   $0x5
    1094:	68 84 18 00 00       	push   $0x1884
    1099:	6a 01                	push   $0x1
    109b:	e8 c0 05 00 00       	call   1660 <printf>
        exit();
    10a0:	e8 34 04 00 00       	call   14d9 <exit>
    10a5:	66 90                	xchg   %ax,%ax
    10a7:	66 90                	xchg   %ax,%ax
    10a9:	66 90                	xchg   %ax,%ax
    10ab:	66 90                	xchg   %ax,%ax
    10ad:	66 90                	xchg   %ax,%ax
    10af:	90                   	nop

000010b0 <strcpy>:
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	8b 45 08             	mov    0x8(%ebp),%eax
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    10ba:	89 c2                	mov    %eax,%edx
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10c0:	83 c1 01             	add    $0x1,%ecx
    10c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    10c7:	83 c2 01             	add    $0x1,%edx
    10ca:	84 db                	test   %bl,%bl
    10cc:	88 5a ff             	mov    %bl,-0x1(%edx)
    10cf:	75 ef                	jne    10c0 <strcpy+0x10>
    10d1:	5b                   	pop    %ebx
    10d2:	5d                   	pop    %ebp
    10d3:	c3                   	ret    
    10d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010e0 <strcmp>:
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	53                   	push   %ebx
    10e4:	8b 55 08             	mov    0x8(%ebp),%edx
    10e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    10ea:	0f b6 02             	movzbl (%edx),%eax
    10ed:	0f b6 19             	movzbl (%ecx),%ebx
    10f0:	84 c0                	test   %al,%al
    10f2:	75 1c                	jne    1110 <strcmp+0x30>
    10f4:	eb 2a                	jmp    1120 <strcmp+0x40>
    10f6:	8d 76 00             	lea    0x0(%esi),%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1100:	83 c2 01             	add    $0x1,%edx
    1103:	0f b6 02             	movzbl (%edx),%eax
    1106:	83 c1 01             	add    $0x1,%ecx
    1109:	0f b6 19             	movzbl (%ecx),%ebx
    110c:	84 c0                	test   %al,%al
    110e:	74 10                	je     1120 <strcmp+0x40>
    1110:	38 d8                	cmp    %bl,%al
    1112:	74 ec                	je     1100 <strcmp+0x20>
    1114:	29 d8                	sub    %ebx,%eax
    1116:	5b                   	pop    %ebx
    1117:	5d                   	pop    %ebp
    1118:	c3                   	ret    
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1120:	31 c0                	xor    %eax,%eax
    1122:	29 d8                	sub    %ebx,%eax
    1124:	5b                   	pop    %ebx
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <strlen>:
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1136:	80 39 00             	cmpb   $0x0,(%ecx)
    1139:	74 15                	je     1150 <strlen+0x20>
    113b:	31 d2                	xor    %edx,%edx
    113d:	8d 76 00             	lea    0x0(%esi),%esi
    1140:	83 c2 01             	add    $0x1,%edx
    1143:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1147:	89 d0                	mov    %edx,%eax
    1149:	75 f5                	jne    1140 <strlen+0x10>
    114b:	5d                   	pop    %ebp
    114c:	c3                   	ret    
    114d:	8d 76 00             	lea    0x0(%esi),%esi
    1150:	31 c0                	xor    %eax,%eax
    1152:	5d                   	pop    %ebp
    1153:	c3                   	ret    
    1154:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    115a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001160 <memset>:
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	57                   	push   %edi
    1164:	8b 55 08             	mov    0x8(%ebp),%edx
    1167:	8b 4d 10             	mov    0x10(%ebp),%ecx
    116a:	8b 45 0c             	mov    0xc(%ebp),%eax
    116d:	89 d7                	mov    %edx,%edi
    116f:	fc                   	cld    
    1170:	f3 aa                	rep stos %al,%es:(%edi)
    1172:	89 d0                	mov    %edx,%eax
    1174:	5f                   	pop    %edi
    1175:	5d                   	pop    %ebp
    1176:	c3                   	ret    
    1177:	89 f6                	mov    %esi,%esi
    1179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001180 <strchr>:
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	53                   	push   %ebx
    1184:	8b 45 08             	mov    0x8(%ebp),%eax
    1187:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    118a:	0f b6 10             	movzbl (%eax),%edx
    118d:	84 d2                	test   %dl,%dl
    118f:	74 1d                	je     11ae <strchr+0x2e>
    1191:	38 d3                	cmp    %dl,%bl
    1193:	89 d9                	mov    %ebx,%ecx
    1195:	75 0d                	jne    11a4 <strchr+0x24>
    1197:	eb 17                	jmp    11b0 <strchr+0x30>
    1199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11a0:	38 ca                	cmp    %cl,%dl
    11a2:	74 0c                	je     11b0 <strchr+0x30>
    11a4:	83 c0 01             	add    $0x1,%eax
    11a7:	0f b6 10             	movzbl (%eax),%edx
    11aa:	84 d2                	test   %dl,%dl
    11ac:	75 f2                	jne    11a0 <strchr+0x20>
    11ae:	31 c0                	xor    %eax,%eax
    11b0:	5b                   	pop    %ebx
    11b1:	5d                   	pop    %ebp
    11b2:	c3                   	ret    
    11b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <gets>:
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	57                   	push   %edi
    11c4:	56                   	push   %esi
    11c5:	53                   	push   %ebx
    11c6:	31 f6                	xor    %esi,%esi
    11c8:	89 f3                	mov    %esi,%ebx
    11ca:	83 ec 1c             	sub    $0x1c,%esp
    11cd:	8b 7d 08             	mov    0x8(%ebp),%edi
    11d0:	eb 2f                	jmp    1201 <gets+0x41>
    11d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11d8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11db:	83 ec 04             	sub    $0x4,%esp
    11de:	6a 01                	push   $0x1
    11e0:	50                   	push   %eax
    11e1:	6a 00                	push   $0x0
    11e3:	e8 09 03 00 00       	call   14f1 <read>
    11e8:	83 c4 10             	add    $0x10,%esp
    11eb:	85 c0                	test   %eax,%eax
    11ed:	7e 1c                	jle    120b <gets+0x4b>
    11ef:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11f3:	83 c7 01             	add    $0x1,%edi
    11f6:	88 47 ff             	mov    %al,-0x1(%edi)
    11f9:	3c 0a                	cmp    $0xa,%al
    11fb:	74 23                	je     1220 <gets+0x60>
    11fd:	3c 0d                	cmp    $0xd,%al
    11ff:	74 1f                	je     1220 <gets+0x60>
    1201:	83 c3 01             	add    $0x1,%ebx
    1204:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1207:	89 fe                	mov    %edi,%esi
    1209:	7c cd                	jl     11d8 <gets+0x18>
    120b:	89 f3                	mov    %esi,%ebx
    120d:	8b 45 08             	mov    0x8(%ebp),%eax
    1210:	c6 03 00             	movb   $0x0,(%ebx)
    1213:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1216:	5b                   	pop    %ebx
    1217:	5e                   	pop    %esi
    1218:	5f                   	pop    %edi
    1219:	5d                   	pop    %ebp
    121a:	c3                   	ret    
    121b:	90                   	nop
    121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1220:	8b 75 08             	mov    0x8(%ebp),%esi
    1223:	8b 45 08             	mov    0x8(%ebp),%eax
    1226:	01 de                	add    %ebx,%esi
    1228:	89 f3                	mov    %esi,%ebx
    122a:	c6 03 00             	movb   $0x0,(%ebx)
    122d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1230:	5b                   	pop    %ebx
    1231:	5e                   	pop    %esi
    1232:	5f                   	pop    %edi
    1233:	5d                   	pop    %ebp
    1234:	c3                   	ret    
    1235:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001240 <stat>:
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	56                   	push   %esi
    1244:	53                   	push   %ebx
    1245:	83 ec 08             	sub    $0x8,%esp
    1248:	6a 00                	push   $0x0
    124a:	ff 75 08             	pushl  0x8(%ebp)
    124d:	e8 c7 02 00 00       	call   1519 <open>
    1252:	83 c4 10             	add    $0x10,%esp
    1255:	85 c0                	test   %eax,%eax
    1257:	78 27                	js     1280 <stat+0x40>
    1259:	83 ec 08             	sub    $0x8,%esp
    125c:	ff 75 0c             	pushl  0xc(%ebp)
    125f:	89 c3                	mov    %eax,%ebx
    1261:	50                   	push   %eax
    1262:	e8 ca 02 00 00       	call   1531 <fstat>
    1267:	89 1c 24             	mov    %ebx,(%esp)
    126a:	89 c6                	mov    %eax,%esi
    126c:	e8 90 02 00 00       	call   1501 <close>
    1271:	83 c4 10             	add    $0x10,%esp
    1274:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1277:	89 f0                	mov    %esi,%eax
    1279:	5b                   	pop    %ebx
    127a:	5e                   	pop    %esi
    127b:	5d                   	pop    %ebp
    127c:	c3                   	ret    
    127d:	8d 76 00             	lea    0x0(%esi),%esi
    1280:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1285:	eb ed                	jmp    1274 <stat+0x34>
    1287:	89 f6                	mov    %esi,%esi
    1289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001290 <atoi>:
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	53                   	push   %ebx
    1294:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1297:	0f be 11             	movsbl (%ecx),%edx
    129a:	8d 42 d0             	lea    -0x30(%edx),%eax
    129d:	3c 09                	cmp    $0x9,%al
    129f:	b8 00 00 00 00       	mov    $0x0,%eax
    12a4:	77 1f                	ja     12c5 <atoi+0x35>
    12a6:	8d 76 00             	lea    0x0(%esi),%esi
    12a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    12b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12b3:	83 c1 01             	add    $0x1,%ecx
    12b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
    12ba:	0f be 11             	movsbl (%ecx),%edx
    12bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12c0:	80 fb 09             	cmp    $0x9,%bl
    12c3:	76 eb                	jbe    12b0 <atoi+0x20>
    12c5:	5b                   	pop    %ebx
    12c6:	5d                   	pop    %ebp
    12c7:	c3                   	ret    
    12c8:	90                   	nop
    12c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012d0 <memmove>:
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	56                   	push   %esi
    12d4:	53                   	push   %ebx
    12d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12d8:	8b 45 08             	mov    0x8(%ebp),%eax
    12db:	8b 75 0c             	mov    0xc(%ebp),%esi
    12de:	85 db                	test   %ebx,%ebx
    12e0:	7e 14                	jle    12f6 <memmove+0x26>
    12e2:	31 d2                	xor    %edx,%edx
    12e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12ef:	83 c2 01             	add    $0x1,%edx
    12f2:	39 d3                	cmp    %edx,%ebx
    12f4:	75 f2                	jne    12e8 <memmove+0x18>
    12f6:	5b                   	pop    %ebx
    12f7:	5e                   	pop    %esi
    12f8:	5d                   	pop    %ebp
    12f9:	c3                   	ret    
    12fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001300 <thread_join>:
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	83 ec 24             	sub    $0x24,%esp
    1306:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1309:	50                   	push   %eax
    130a:	e8 a2 02 00 00       	call   15b1 <join>
    130f:	c9                   	leave  
    1310:	c3                   	ret    
    1311:	eb 0d                	jmp    1320 <free>
    1313:	90                   	nop
    1314:	90                   	nop
    1315:	90                   	nop
    1316:	90                   	nop
    1317:	90                   	nop
    1318:	90                   	nop
    1319:	90                   	nop
    131a:	90                   	nop
    131b:	90                   	nop
    131c:	90                   	nop
    131d:	90                   	nop
    131e:	90                   	nop
    131f:	90                   	nop

00001320 <free>:
    1320:	55                   	push   %ebp
    1321:	a1 c8 1b 00 00       	mov    0x1bc8,%eax
    1326:	89 e5                	mov    %esp,%ebp
    1328:	57                   	push   %edi
    1329:	56                   	push   %esi
    132a:	53                   	push   %ebx
    132b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    132e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1338:	39 c8                	cmp    %ecx,%eax
    133a:	8b 10                	mov    (%eax),%edx
    133c:	73 32                	jae    1370 <free+0x50>
    133e:	39 d1                	cmp    %edx,%ecx
    1340:	72 04                	jb     1346 <free+0x26>
    1342:	39 d0                	cmp    %edx,%eax
    1344:	72 32                	jb     1378 <free+0x58>
    1346:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1349:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    134c:	39 fa                	cmp    %edi,%edx
    134e:	74 30                	je     1380 <free+0x60>
    1350:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1353:	8b 50 04             	mov    0x4(%eax),%edx
    1356:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1359:	39 f1                	cmp    %esi,%ecx
    135b:	74 3a                	je     1397 <free+0x77>
    135d:	89 08                	mov    %ecx,(%eax)
    135f:	a3 c8 1b 00 00       	mov    %eax,0x1bc8
    1364:	5b                   	pop    %ebx
    1365:	5e                   	pop    %esi
    1366:	5f                   	pop    %edi
    1367:	5d                   	pop    %ebp
    1368:	c3                   	ret    
    1369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1370:	39 d0                	cmp    %edx,%eax
    1372:	72 04                	jb     1378 <free+0x58>
    1374:	39 d1                	cmp    %edx,%ecx
    1376:	72 ce                	jb     1346 <free+0x26>
    1378:	89 d0                	mov    %edx,%eax
    137a:	eb bc                	jmp    1338 <free+0x18>
    137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1380:	03 72 04             	add    0x4(%edx),%esi
    1383:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1386:	8b 10                	mov    (%eax),%edx
    1388:	8b 12                	mov    (%edx),%edx
    138a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    138d:	8b 50 04             	mov    0x4(%eax),%edx
    1390:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1393:	39 f1                	cmp    %esi,%ecx
    1395:	75 c6                	jne    135d <free+0x3d>
    1397:	03 53 fc             	add    -0x4(%ebx),%edx
    139a:	a3 c8 1b 00 00       	mov    %eax,0x1bc8
    139f:	89 50 04             	mov    %edx,0x4(%eax)
    13a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    13a5:	89 10                	mov    %edx,(%eax)
    13a7:	5b                   	pop    %ebx
    13a8:	5e                   	pop    %esi
    13a9:	5f                   	pop    %edi
    13aa:	5d                   	pop    %ebp
    13ab:	c3                   	ret    
    13ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013b0 <malloc>:
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	57                   	push   %edi
    13b4:	56                   	push   %esi
    13b5:	53                   	push   %ebx
    13b6:	83 ec 0c             	sub    $0xc,%esp
    13b9:	8b 45 08             	mov    0x8(%ebp),%eax
    13bc:	8b 15 c8 1b 00 00    	mov    0x1bc8,%edx
    13c2:	8d 78 07             	lea    0x7(%eax),%edi
    13c5:	c1 ef 03             	shr    $0x3,%edi
    13c8:	83 c7 01             	add    $0x1,%edi
    13cb:	85 d2                	test   %edx,%edx
    13cd:	0f 84 9d 00 00 00    	je     1470 <malloc+0xc0>
    13d3:	8b 02                	mov    (%edx),%eax
    13d5:	8b 48 04             	mov    0x4(%eax),%ecx
    13d8:	39 cf                	cmp    %ecx,%edi
    13da:	76 6c                	jbe    1448 <malloc+0x98>
    13dc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    13e2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    13e7:	0f 43 df             	cmovae %edi,%ebx
    13ea:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13f1:	eb 0e                	jmp    1401 <malloc+0x51>
    13f3:	90                   	nop
    13f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13f8:	8b 02                	mov    (%edx),%eax
    13fa:	8b 48 04             	mov    0x4(%eax),%ecx
    13fd:	39 f9                	cmp    %edi,%ecx
    13ff:	73 47                	jae    1448 <malloc+0x98>
    1401:	39 05 c8 1b 00 00    	cmp    %eax,0x1bc8
    1407:	89 c2                	mov    %eax,%edx
    1409:	75 ed                	jne    13f8 <malloc+0x48>
    140b:	83 ec 0c             	sub    $0xc,%esp
    140e:	56                   	push   %esi
    140f:	e8 4d 01 00 00       	call   1561 <sbrk>
    1414:	83 c4 10             	add    $0x10,%esp
    1417:	83 f8 ff             	cmp    $0xffffffff,%eax
    141a:	74 1c                	je     1438 <malloc+0x88>
    141c:	89 58 04             	mov    %ebx,0x4(%eax)
    141f:	83 ec 0c             	sub    $0xc,%esp
    1422:	83 c0 08             	add    $0x8,%eax
    1425:	50                   	push   %eax
    1426:	e8 f5 fe ff ff       	call   1320 <free>
    142b:	8b 15 c8 1b 00 00    	mov    0x1bc8,%edx
    1431:	83 c4 10             	add    $0x10,%esp
    1434:	85 d2                	test   %edx,%edx
    1436:	75 c0                	jne    13f8 <malloc+0x48>
    1438:	8d 65 f4             	lea    -0xc(%ebp),%esp
    143b:	31 c0                	xor    %eax,%eax
    143d:	5b                   	pop    %ebx
    143e:	5e                   	pop    %esi
    143f:	5f                   	pop    %edi
    1440:	5d                   	pop    %ebp
    1441:	c3                   	ret    
    1442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1448:	39 cf                	cmp    %ecx,%edi
    144a:	74 54                	je     14a0 <malloc+0xf0>
    144c:	29 f9                	sub    %edi,%ecx
    144e:	89 48 04             	mov    %ecx,0x4(%eax)
    1451:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1454:	89 78 04             	mov    %edi,0x4(%eax)
    1457:	89 15 c8 1b 00 00    	mov    %edx,0x1bc8
    145d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1460:	83 c0 08             	add    $0x8,%eax
    1463:	5b                   	pop    %ebx
    1464:	5e                   	pop    %esi
    1465:	5f                   	pop    %edi
    1466:	5d                   	pop    %ebp
    1467:	c3                   	ret    
    1468:	90                   	nop
    1469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1470:	c7 05 c8 1b 00 00 cc 	movl   $0x1bcc,0x1bc8
    1477:	1b 00 00 
    147a:	c7 05 cc 1b 00 00 cc 	movl   $0x1bcc,0x1bcc
    1481:	1b 00 00 
    1484:	b8 cc 1b 00 00       	mov    $0x1bcc,%eax
    1489:	c7 05 d0 1b 00 00 00 	movl   $0x0,0x1bd0
    1490:	00 00 00 
    1493:	e9 44 ff ff ff       	jmp    13dc <malloc+0x2c>
    1498:	90                   	nop
    1499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14a0:	8b 08                	mov    (%eax),%ecx
    14a2:	89 0a                	mov    %ecx,(%edx)
    14a4:	eb b1                	jmp    1457 <malloc+0xa7>
    14a6:	8d 76 00             	lea    0x0(%esi),%esi
    14a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000014b0 <thread_create>:
    14b0:	55                   	push   %ebp
    14b1:	89 e5                	mov    %esp,%ebp
    14b3:	83 ec 14             	sub    $0x14,%esp
    14b6:	68 00 10 00 00       	push   $0x1000
    14bb:	e8 f0 fe ff ff       	call   13b0 <malloc>
    14c0:	83 c4 0c             	add    $0xc,%esp
    14c3:	50                   	push   %eax
    14c4:	ff 75 0c             	pushl  0xc(%ebp)
    14c7:	ff 75 08             	pushl  0x8(%ebp)
    14ca:	e8 da 00 00 00       	call   15a9 <clone>
    14cf:	c9                   	leave  
    14d0:	c3                   	ret    

000014d1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    14d1:	b8 01 00 00 00       	mov    $0x1,%eax
    14d6:	cd 40                	int    $0x40
    14d8:	c3                   	ret    

000014d9 <exit>:
SYSCALL(exit)
    14d9:	b8 02 00 00 00       	mov    $0x2,%eax
    14de:	cd 40                	int    $0x40
    14e0:	c3                   	ret    

000014e1 <wait>:
SYSCALL(wait)
    14e1:	b8 03 00 00 00       	mov    $0x3,%eax
    14e6:	cd 40                	int    $0x40
    14e8:	c3                   	ret    

000014e9 <pipe>:
SYSCALL(pipe)
    14e9:	b8 04 00 00 00       	mov    $0x4,%eax
    14ee:	cd 40                	int    $0x40
    14f0:	c3                   	ret    

000014f1 <read>:
SYSCALL(read)
    14f1:	b8 05 00 00 00       	mov    $0x5,%eax
    14f6:	cd 40                	int    $0x40
    14f8:	c3                   	ret    

000014f9 <write>:
SYSCALL(write)
    14f9:	b8 10 00 00 00       	mov    $0x10,%eax
    14fe:	cd 40                	int    $0x40
    1500:	c3                   	ret    

00001501 <close>:
SYSCALL(close)
    1501:	b8 15 00 00 00       	mov    $0x15,%eax
    1506:	cd 40                	int    $0x40
    1508:	c3                   	ret    

00001509 <kill>:
SYSCALL(kill)
    1509:	b8 06 00 00 00       	mov    $0x6,%eax
    150e:	cd 40                	int    $0x40
    1510:	c3                   	ret    

00001511 <exec>:
SYSCALL(exec)
    1511:	b8 07 00 00 00       	mov    $0x7,%eax
    1516:	cd 40                	int    $0x40
    1518:	c3                   	ret    

00001519 <open>:
SYSCALL(open)
    1519:	b8 0f 00 00 00       	mov    $0xf,%eax
    151e:	cd 40                	int    $0x40
    1520:	c3                   	ret    

00001521 <mknod>:
SYSCALL(mknod)
    1521:	b8 11 00 00 00       	mov    $0x11,%eax
    1526:	cd 40                	int    $0x40
    1528:	c3                   	ret    

00001529 <unlink>:
SYSCALL(unlink)
    1529:	b8 12 00 00 00       	mov    $0x12,%eax
    152e:	cd 40                	int    $0x40
    1530:	c3                   	ret    

00001531 <fstat>:
SYSCALL(fstat)
    1531:	b8 08 00 00 00       	mov    $0x8,%eax
    1536:	cd 40                	int    $0x40
    1538:	c3                   	ret    

00001539 <link>:
SYSCALL(link)
    1539:	b8 13 00 00 00       	mov    $0x13,%eax
    153e:	cd 40                	int    $0x40
    1540:	c3                   	ret    

00001541 <mkdir>:
SYSCALL(mkdir)
    1541:	b8 14 00 00 00       	mov    $0x14,%eax
    1546:	cd 40                	int    $0x40
    1548:	c3                   	ret    

00001549 <chdir>:
SYSCALL(chdir)
    1549:	b8 09 00 00 00       	mov    $0x9,%eax
    154e:	cd 40                	int    $0x40
    1550:	c3                   	ret    

00001551 <dup>:
SYSCALL(dup)
    1551:	b8 0a 00 00 00       	mov    $0xa,%eax
    1556:	cd 40                	int    $0x40
    1558:	c3                   	ret    

00001559 <getpid>:
SYSCALL(getpid)
    1559:	b8 0b 00 00 00       	mov    $0xb,%eax
    155e:	cd 40                	int    $0x40
    1560:	c3                   	ret    

00001561 <sbrk>:
SYSCALL(sbrk)
    1561:	b8 0c 00 00 00       	mov    $0xc,%eax
    1566:	cd 40                	int    $0x40
    1568:	c3                   	ret    

00001569 <sleep>:
SYSCALL(sleep)
    1569:	b8 0d 00 00 00       	mov    $0xd,%eax
    156e:	cd 40                	int    $0x40
    1570:	c3                   	ret    

00001571 <uptime>:
SYSCALL(uptime)
    1571:	b8 0e 00 00 00       	mov    $0xe,%eax
    1576:	cd 40                	int    $0x40
    1578:	c3                   	ret    

00001579 <getreadcount>:
SYSCALL(getreadcount)
    1579:	b8 16 00 00 00       	mov    $0x16,%eax
    157e:	cd 40                	int    $0x40
    1580:	c3                   	ret    

00001581 <gettime>:
SYSCALL(gettime)
    1581:	b8 17 00 00 00       	mov    $0x17,%eax
    1586:	cd 40                	int    $0x40
    1588:	c3                   	ret    

00001589 <settickets>:
SYSCALL(settickets)
    1589:	b8 18 00 00 00       	mov    $0x18,%eax
    158e:	cd 40                	int    $0x40
    1590:	c3                   	ret    

00001591 <getpinfo>:
SYSCALL(getpinfo)
    1591:	b8 19 00 00 00       	mov    $0x19,%eax
    1596:	cd 40                	int    $0x40
    1598:	c3                   	ret    

00001599 <mprotect>:
SYSCALL(mprotect)
    1599:	b8 1a 00 00 00       	mov    $0x1a,%eax
    159e:	cd 40                	int    $0x40
    15a0:	c3                   	ret    

000015a1 <munprotect>:
SYSCALL(munprotect)
    15a1:	b8 1b 00 00 00       	mov    $0x1b,%eax
    15a6:	cd 40                	int    $0x40
    15a8:	c3                   	ret    

000015a9 <clone>:
SYSCALL(clone)
    15a9:	b8 1c 00 00 00       	mov    $0x1c,%eax
    15ae:	cd 40                	int    $0x40
    15b0:	c3                   	ret    

000015b1 <join>:
    15b1:	b8 1d 00 00 00       	mov    $0x1d,%eax
    15b6:	cd 40                	int    $0x40
    15b8:	c3                   	ret    
    15b9:	66 90                	xchg   %ax,%ax
    15bb:	66 90                	xchg   %ax,%ax
    15bd:	66 90                	xchg   %ax,%ax
    15bf:	90                   	nop

000015c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    15c0:	55                   	push   %ebp
    15c1:	89 e5                	mov    %esp,%ebp
    15c3:	57                   	push   %edi
    15c4:	56                   	push   %esi
    15c5:	53                   	push   %ebx
    15c6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    15c9:	85 d2                	test   %edx,%edx
{
    15cb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    15ce:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    15d0:	79 76                	jns    1648 <printint+0x88>
    15d2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    15d6:	74 70                	je     1648 <printint+0x88>
    x = -xx;
    15d8:	f7 d8                	neg    %eax
    neg = 1;
    15da:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    15e1:	31 f6                	xor    %esi,%esi
    15e3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    15e6:	eb 0a                	jmp    15f2 <printint+0x32>
    15e8:	90                   	nop
    15e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    15f0:	89 fe                	mov    %edi,%esi
    15f2:	31 d2                	xor    %edx,%edx
    15f4:	8d 7e 01             	lea    0x1(%esi),%edi
    15f7:	f7 f1                	div    %ecx
    15f9:	0f b6 92 e0 18 00 00 	movzbl 0x18e0(%edx),%edx
  }while((x /= base) != 0);
    1600:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1602:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1605:	75 e9                	jne    15f0 <printint+0x30>
  if(neg)
    1607:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    160a:	85 c0                	test   %eax,%eax
    160c:	74 08                	je     1616 <printint+0x56>
    buf[i++] = '-';
    160e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1613:	8d 7e 02             	lea    0x2(%esi),%edi
    1616:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    161a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    161d:	8d 76 00             	lea    0x0(%esi),%esi
    1620:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1623:	83 ec 04             	sub    $0x4,%esp
    1626:	83 ee 01             	sub    $0x1,%esi
    1629:	6a 01                	push   $0x1
    162b:	53                   	push   %ebx
    162c:	57                   	push   %edi
    162d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1630:	e8 c4 fe ff ff       	call   14f9 <write>

  while(--i >= 0)
    1635:	83 c4 10             	add    $0x10,%esp
    1638:	39 de                	cmp    %ebx,%esi
    163a:	75 e4                	jne    1620 <printint+0x60>
    putc(fd, buf[i]);
}
    163c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    163f:	5b                   	pop    %ebx
    1640:	5e                   	pop    %esi
    1641:	5f                   	pop    %edi
    1642:	5d                   	pop    %ebp
    1643:	c3                   	ret    
    1644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1648:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    164f:	eb 90                	jmp    15e1 <printint+0x21>
    1651:	eb 0d                	jmp    1660 <printf>
    1653:	90                   	nop
    1654:	90                   	nop
    1655:	90                   	nop
    1656:	90                   	nop
    1657:	90                   	nop
    1658:	90                   	nop
    1659:	90                   	nop
    165a:	90                   	nop
    165b:	90                   	nop
    165c:	90                   	nop
    165d:	90                   	nop
    165e:	90                   	nop
    165f:	90                   	nop

00001660 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	53                   	push   %ebx
    1666:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1669:	8b 75 0c             	mov    0xc(%ebp),%esi
    166c:	0f b6 1e             	movzbl (%esi),%ebx
    166f:	84 db                	test   %bl,%bl
    1671:	0f 84 bf 00 00 00    	je     1736 <printf+0xd6>
    1677:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    167a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    167d:	31 d2                	xor    %edx,%edx
    167f:	eb 39                	jmp    16ba <printf+0x5a>
    1681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1688:	83 f8 25             	cmp    $0x25,%eax
    168b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    168e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1693:	74 1a                	je     16af <printf+0x4f>
  write(fd, &c, 1);
    1695:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1698:	83 ec 04             	sub    $0x4,%esp
    169b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    169e:	6a 01                	push   $0x1
    16a0:	50                   	push   %eax
    16a1:	ff 75 08             	pushl  0x8(%ebp)
    16a4:	e8 50 fe ff ff       	call   14f9 <write>
    16a9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    16ac:	83 c4 10             	add    $0x10,%esp
    16af:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    16b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    16b6:	84 db                	test   %bl,%bl
    16b8:	74 7c                	je     1736 <printf+0xd6>
    if(state == 0){
    16ba:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    16bc:	0f be cb             	movsbl %bl,%ecx
    16bf:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    16c2:	74 c4                	je     1688 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    16c4:	83 fa 25             	cmp    $0x25,%edx
    16c7:	75 e6                	jne    16af <printf+0x4f>
      if(c == 'd'){
    16c9:	83 f8 64             	cmp    $0x64,%eax
    16cc:	0f 84 a6 00 00 00    	je     1778 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    16d2:	83 f8 6c             	cmp    $0x6c,%eax
    16d5:	0f 84 ad 00 00 00    	je     1788 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    16db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    16e1:	83 f9 70             	cmp    $0x70,%ecx
    16e4:	74 5a                	je     1740 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16e6:	83 f8 73             	cmp    $0x73,%eax
    16e9:	0f 84 e1 00 00 00    	je     17d0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16ef:	83 f8 63             	cmp    $0x63,%eax
    16f2:	0f 84 28 01 00 00    	je     1820 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    16f8:	83 f8 25             	cmp    $0x25,%eax
    16fb:	74 6b                	je     1768 <printf+0x108>
  write(fd, &c, 1);
    16fd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1700:	83 ec 04             	sub    $0x4,%esp
    1703:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1707:	6a 01                	push   $0x1
    1709:	50                   	push   %eax
    170a:	ff 75 08             	pushl  0x8(%ebp)
    170d:	e8 e7 fd ff ff       	call   14f9 <write>
    1712:	83 c4 0c             	add    $0xc,%esp
    1715:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1718:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    171b:	6a 01                	push   $0x1
    171d:	50                   	push   %eax
    171e:	ff 75 08             	pushl  0x8(%ebp)
    1721:	83 c6 01             	add    $0x1,%esi
    1724:	e8 d0 fd ff ff       	call   14f9 <write>
  for(i = 0; fmt[i]; i++){
    1729:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    172d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1730:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1732:	84 db                	test   %bl,%bl
    1734:	75 84                	jne    16ba <printf+0x5a>
    }
  }
}
    1736:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1739:	5b                   	pop    %ebx
    173a:	5e                   	pop    %esi
    173b:	5f                   	pop    %edi
    173c:	5d                   	pop    %ebp
    173d:	c3                   	ret    
    173e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1740:	83 ec 0c             	sub    $0xc,%esp
    1743:	b9 10 00 00 00       	mov    $0x10,%ecx
    1748:	6a 00                	push   $0x0
    174a:	8b 17                	mov    (%edi),%edx
    174c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    174f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1752:	e8 69 fe ff ff       	call   15c0 <printint>
    1757:	83 c4 10             	add    $0x10,%esp
      state = 0;
    175a:	31 d2                	xor    %edx,%edx
    175c:	e9 4e ff ff ff       	jmp    16af <printf+0x4f>
    1761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1768:	83 ec 04             	sub    $0x4,%esp
    176b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    176e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1771:	6a 01                	push   $0x1
    1773:	eb a8                	jmp    171d <printf+0xbd>
    1775:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1778:	83 ec 0c             	sub    $0xc,%esp
    177b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1780:	6a 01                	push   $0x1
    1782:	eb c6                	jmp    174a <printf+0xea>
    1784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1788:	8b 57 04             	mov    0x4(%edi),%edx
    178b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    178d:	85 d2                	test   %edx,%edx
    178f:	74 15                	je     17a6 <printf+0x146>
    1791:	83 ec 0c             	sub    $0xc,%esp
    1794:	8b 45 08             	mov    0x8(%ebp),%eax
    1797:	b9 10 00 00 00       	mov    $0x10,%ecx
    179c:	6a 00                	push   $0x0
    179e:	e8 1d fe ff ff       	call   15c0 <printint>
    17a3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    17a6:	83 ec 0c             	sub    $0xc,%esp
    17a9:	8b 45 08             	mov    0x8(%ebp),%eax
    17ac:	89 da                	mov    %ebx,%edx
    17ae:	6a 00                	push   $0x0
    17b0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    17b5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    17b8:	e8 03 fe ff ff       	call   15c0 <printint>
    17bd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17c0:	31 d2                	xor    %edx,%edx
    17c2:	e9 e8 fe ff ff       	jmp    16af <printf+0x4f>
    17c7:	89 f6                	mov    %esi,%esi
    17c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    17d0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    17d2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    17d5:	85 c9                	test   %ecx,%ecx
    17d7:	74 6a                	je     1843 <printf+0x1e3>
        while(*s != 0){
    17d9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    17dc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    17de:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    17e0:	84 c0                	test   %al,%al
    17e2:	0f 84 c7 fe ff ff    	je     16af <printf+0x4f>
    17e8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    17eb:	89 de                	mov    %ebx,%esi
    17ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
    17f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    17f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    17f6:	83 ec 04             	sub    $0x4,%esp
    17f9:	6a 01                	push   $0x1
          s++;
    17fb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    17fe:	50                   	push   %eax
    17ff:	53                   	push   %ebx
    1800:	e8 f4 fc ff ff       	call   14f9 <write>
        while(*s != 0){
    1805:	0f b6 06             	movzbl (%esi),%eax
    1808:	83 c4 10             	add    $0x10,%esp
    180b:	84 c0                	test   %al,%al
    180d:	75 e1                	jne    17f0 <printf+0x190>
    180f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1812:	31 d2                	xor    %edx,%edx
    1814:	e9 96 fe ff ff       	jmp    16af <printf+0x4f>
    1819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1820:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1822:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1825:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1828:	6a 01                	push   $0x1
        putc(fd, *ap);
    182a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    182d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1830:	50                   	push   %eax
    1831:	ff 75 08             	pushl  0x8(%ebp)
    1834:	e8 c0 fc ff ff       	call   14f9 <write>
    1839:	83 c4 10             	add    $0x10,%esp
      state = 0;
    183c:	31 d2                	xor    %edx,%edx
    183e:	e9 6c fe ff ff       	jmp    16af <printf+0x4f>
          s = "(null)";
    1843:	bb d8 18 00 00       	mov    $0x18d8,%ebx
        while(*s != 0){
    1848:	b8 28 00 00 00       	mov    $0x28,%eax
    184d:	eb 99                	jmp    17e8 <printf+0x188>
