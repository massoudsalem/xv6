
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
      11:	eb 0a                	jmp    1d <main+0x1d>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	7f 76                	jg     93 <main+0x93>
      1d:	83 ec 08             	sub    $0x8,%esp
      20:	6a 02                	push   $0x2
      22:	68 99 12 00 00       	push   $0x1299
      27:	e8 26 0d 00 00       	call   d52 <open>
      2c:	83 c4 10             	add    $0x10,%esp
      2f:	85 c0                	test   %eax,%eax
      31:	79 e5                	jns    18 <main+0x18>
      33:	eb 1f                	jmp    54 <main+0x54>
      35:	8d 76 00             	lea    0x0(%esi),%esi
      38:	80 3d c2 18 00 00 20 	cmpb   $0x20,0x18c2
      3f:	74 7a                	je     bb <main+0xbb>
      41:	e8 c4 0c 00 00       	call   d0a <fork>
      46:	83 f8 ff             	cmp    $0xffffffff,%eax
      49:	74 3b                	je     86 <main+0x86>
      4b:	85 c0                	test   %eax,%eax
      4d:	74 57                	je     a6 <main+0xa6>
      4f:	e8 c6 0c 00 00       	call   d1a <wait>
      54:	83 ec 08             	sub    $0x8,%esp
      57:	6a 64                	push   $0x64
      59:	68 c0 18 00 00       	push   $0x18c0
      5e:	e8 9d 00 00 00       	call   100 <getcmd>
      63:	83 c4 10             	add    $0x10,%esp
      66:	85 c0                	test   %eax,%eax
      68:	78 37                	js     a1 <main+0xa1>
      6a:	80 3d c0 18 00 00 63 	cmpb   $0x63,0x18c0
      71:	75 ce                	jne    41 <main+0x41>
      73:	80 3d c1 18 00 00 64 	cmpb   $0x64,0x18c1
      7a:	74 bc                	je     38 <main+0x38>
      7c:	e8 89 0c 00 00       	call   d0a <fork>
      81:	83 f8 ff             	cmp    $0xffffffff,%eax
      84:	75 c5                	jne    4b <main+0x4b>
      86:	83 ec 0c             	sub    $0xc,%esp
      89:	68 22 12 00 00       	push   $0x1222
      8e:	e8 bd 00 00 00       	call   150 <panic>
      93:	83 ec 0c             	sub    $0xc,%esp
      96:	50                   	push   %eax
      97:	e8 9e 0c 00 00       	call   d3a <close>
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	eb b3                	jmp    54 <main+0x54>
      a1:	e8 6c 0c 00 00       	call   d12 <exit>
      a6:	83 ec 0c             	sub    $0xc,%esp
      a9:	68 c0 18 00 00       	push   $0x18c0
      ae:	e8 9d 09 00 00       	call   a50 <parsecmd>
      b3:	89 04 24             	mov    %eax,(%esp)
      b6:	e8 b5 00 00 00       	call   170 <runcmd>
      bb:	83 ec 0c             	sub    $0xc,%esp
      be:	68 c0 18 00 00       	push   $0x18c0
      c3:	e8 78 0a 00 00       	call   b40 <strlen>
      c8:	c7 04 24 c3 18 00 00 	movl   $0x18c3,(%esp)
      cf:	c6 80 bf 18 00 00 00 	movb   $0x0,0x18bf(%eax)
      d6:	e8 a7 0c 00 00       	call   d82 <chdir>
      db:	83 c4 10             	add    $0x10,%esp
      de:	85 c0                	test   %eax,%eax
      e0:	0f 89 6e ff ff ff    	jns    54 <main+0x54>
      e6:	50                   	push   %eax
      e7:	68 c3 18 00 00       	push   $0x18c3
      ec:	68 a1 12 00 00       	push   $0x12a1
      f1:	6a 02                	push   $0x2
      f3:	e8 88 0d 00 00       	call   e80 <printf>
      f8:	83 c4 10             	add    $0x10,%esp
      fb:	e9 54 ff ff ff       	jmp    54 <main+0x54>

00000100 <getcmd>:
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	8b 75 0c             	mov    0xc(%ebp),%esi
     108:	8b 5d 08             	mov    0x8(%ebp),%ebx
     10b:	83 ec 08             	sub    $0x8,%esp
     10e:	68 f8 11 00 00       	push   $0x11f8
     113:	6a 02                	push   $0x2
     115:	e8 66 0d 00 00       	call   e80 <printf>
     11a:	83 c4 0c             	add    $0xc,%esp
     11d:	56                   	push   %esi
     11e:	6a 00                	push   $0x0
     120:	53                   	push   %ebx
     121:	e8 4a 0a 00 00       	call   b70 <memset>
     126:	58                   	pop    %eax
     127:	5a                   	pop    %edx
     128:	56                   	push   %esi
     129:	53                   	push   %ebx
     12a:	e8 a1 0a 00 00       	call   bd0 <gets>
     12f:	83 c4 10             	add    $0x10,%esp
     132:	31 c0                	xor    %eax,%eax
     134:	80 3b 00             	cmpb   $0x0,(%ebx)
     137:	0f 94 c0             	sete   %al
     13a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     13d:	f7 d8                	neg    %eax
     13f:	5b                   	pop    %ebx
     140:	5e                   	pop    %esi
     141:	5d                   	pop    %ebp
     142:	c3                   	ret    
     143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <panic>:
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	83 ec 0c             	sub    $0xc,%esp
     156:	ff 75 08             	pushl  0x8(%ebp)
     159:	68 95 12 00 00       	push   $0x1295
     15e:	6a 02                	push   $0x2
     160:	e8 1b 0d 00 00       	call   e80 <printf>
     165:	e8 a8 0b 00 00       	call   d12 <exit>
     16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <runcmd>:
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	53                   	push   %ebx
     174:	83 ec 14             	sub    $0x14,%esp
     177:	8b 5d 08             	mov    0x8(%ebp),%ebx
     17a:	85 db                	test   %ebx,%ebx
     17c:	74 3a                	je     1b8 <runcmd+0x48>
     17e:	83 3b 05             	cmpl   $0x5,(%ebx)
     181:	0f 87 06 01 00 00    	ja     28d <runcmd+0x11d>
     187:	8b 03                	mov    (%ebx),%eax
     189:	ff 24 85 b0 12 00 00 	jmp    *0x12b0(,%eax,4)
     190:	8b 43 04             	mov    0x4(%ebx),%eax
     193:	85 c0                	test   %eax,%eax
     195:	74 21                	je     1b8 <runcmd+0x48>
     197:	52                   	push   %edx
     198:	52                   	push   %edx
     199:	8d 53 04             	lea    0x4(%ebx),%edx
     19c:	52                   	push   %edx
     19d:	50                   	push   %eax
     19e:	e8 a7 0b 00 00       	call   d4a <exec>
     1a3:	83 c4 0c             	add    $0xc,%esp
     1a6:	ff 73 04             	pushl  0x4(%ebx)
     1a9:	68 02 12 00 00       	push   $0x1202
     1ae:	6a 02                	push   $0x2
     1b0:	e8 cb 0c 00 00       	call   e80 <printf>
     1b5:	83 c4 10             	add    $0x10,%esp
     1b8:	e8 55 0b 00 00       	call   d12 <exit>
     1bd:	e8 48 0b 00 00       	call   d0a <fork>
     1c2:	83 f8 ff             	cmp    $0xffffffff,%eax
     1c5:	0f 84 cf 00 00 00    	je     29a <runcmd+0x12a>
     1cb:	85 c0                	test   %eax,%eax
     1cd:	75 e9                	jne    1b8 <runcmd+0x48>
     1cf:	83 ec 0c             	sub    $0xc,%esp
     1d2:	ff 73 04             	pushl  0x4(%ebx)
     1d5:	e8 96 ff ff ff       	call   170 <runcmd>
     1da:	83 ec 0c             	sub    $0xc,%esp
     1dd:	ff 73 14             	pushl  0x14(%ebx)
     1e0:	e8 55 0b 00 00       	call   d3a <close>
     1e5:	59                   	pop    %ecx
     1e6:	58                   	pop    %eax
     1e7:	ff 73 10             	pushl  0x10(%ebx)
     1ea:	ff 73 08             	pushl  0x8(%ebx)
     1ed:	e8 60 0b 00 00       	call   d52 <open>
     1f2:	83 c4 10             	add    $0x10,%esp
     1f5:	85 c0                	test   %eax,%eax
     1f7:	79 d6                	jns    1cf <runcmd+0x5f>
     1f9:	52                   	push   %edx
     1fa:	ff 73 08             	pushl  0x8(%ebx)
     1fd:	68 12 12 00 00       	push   $0x1212
     202:	6a 02                	push   $0x2
     204:	e8 77 0c 00 00       	call   e80 <printf>
     209:	e8 04 0b 00 00       	call   d12 <exit>
     20e:	8d 45 f0             	lea    -0x10(%ebp),%eax
     211:	83 ec 0c             	sub    $0xc,%esp
     214:	50                   	push   %eax
     215:	e8 08 0b 00 00       	call   d22 <pipe>
     21a:	83 c4 10             	add    $0x10,%esp
     21d:	85 c0                	test   %eax,%eax
     21f:	0f 88 b0 00 00 00    	js     2d5 <runcmd+0x165>
     225:	e8 e0 0a 00 00       	call   d0a <fork>
     22a:	83 f8 ff             	cmp    $0xffffffff,%eax
     22d:	74 6b                	je     29a <runcmd+0x12a>
     22f:	85 c0                	test   %eax,%eax
     231:	0f 84 ab 00 00 00    	je     2e2 <runcmd+0x172>
     237:	e8 ce 0a 00 00       	call   d0a <fork>
     23c:	83 f8 ff             	cmp    $0xffffffff,%eax
     23f:	74 59                	je     29a <runcmd+0x12a>
     241:	85 c0                	test   %eax,%eax
     243:	74 62                	je     2a7 <runcmd+0x137>
     245:	83 ec 0c             	sub    $0xc,%esp
     248:	ff 75 f0             	pushl  -0x10(%ebp)
     24b:	e8 ea 0a 00 00       	call   d3a <close>
     250:	58                   	pop    %eax
     251:	ff 75 f4             	pushl  -0xc(%ebp)
     254:	e8 e1 0a 00 00       	call   d3a <close>
     259:	e8 bc 0a 00 00       	call   d1a <wait>
     25e:	e8 b7 0a 00 00       	call   d1a <wait>
     263:	83 c4 10             	add    $0x10,%esp
     266:	e9 4d ff ff ff       	jmp    1b8 <runcmd+0x48>
     26b:	e8 9a 0a 00 00       	call   d0a <fork>
     270:	83 f8 ff             	cmp    $0xffffffff,%eax
     273:	74 25                	je     29a <runcmd+0x12a>
     275:	85 c0                	test   %eax,%eax
     277:	0f 84 52 ff ff ff    	je     1cf <runcmd+0x5f>
     27d:	e8 98 0a 00 00       	call   d1a <wait>
     282:	83 ec 0c             	sub    $0xc,%esp
     285:	ff 73 08             	pushl  0x8(%ebx)
     288:	e8 e3 fe ff ff       	call   170 <runcmd>
     28d:	83 ec 0c             	sub    $0xc,%esp
     290:	68 fb 11 00 00       	push   $0x11fb
     295:	e8 b6 fe ff ff       	call   150 <panic>
     29a:	83 ec 0c             	sub    $0xc,%esp
     29d:	68 22 12 00 00       	push   $0x1222
     2a2:	e8 a9 fe ff ff       	call   150 <panic>
     2a7:	83 ec 0c             	sub    $0xc,%esp
     2aa:	6a 00                	push   $0x0
     2ac:	e8 89 0a 00 00       	call   d3a <close>
     2b1:	5a                   	pop    %edx
     2b2:	ff 75 f0             	pushl  -0x10(%ebp)
     2b5:	e8 d0 0a 00 00       	call   d8a <dup>
     2ba:	59                   	pop    %ecx
     2bb:	ff 75 f0             	pushl  -0x10(%ebp)
     2be:	e8 77 0a 00 00       	call   d3a <close>
     2c3:	58                   	pop    %eax
     2c4:	ff 75 f4             	pushl  -0xc(%ebp)
     2c7:	e8 6e 0a 00 00       	call   d3a <close>
     2cc:	58                   	pop    %eax
     2cd:	ff 73 08             	pushl  0x8(%ebx)
     2d0:	e8 9b fe ff ff       	call   170 <runcmd>
     2d5:	83 ec 0c             	sub    $0xc,%esp
     2d8:	68 27 12 00 00       	push   $0x1227
     2dd:	e8 6e fe ff ff       	call   150 <panic>
     2e2:	83 ec 0c             	sub    $0xc,%esp
     2e5:	6a 01                	push   $0x1
     2e7:	e8 4e 0a 00 00       	call   d3a <close>
     2ec:	58                   	pop    %eax
     2ed:	ff 75 f4             	pushl  -0xc(%ebp)
     2f0:	e8 95 0a 00 00       	call   d8a <dup>
     2f5:	58                   	pop    %eax
     2f6:	ff 75 f0             	pushl  -0x10(%ebp)
     2f9:	e8 3c 0a 00 00       	call   d3a <close>
     2fe:	58                   	pop    %eax
     2ff:	ff 75 f4             	pushl  -0xc(%ebp)
     302:	e8 33 0a 00 00       	call   d3a <close>
     307:	58                   	pop    %eax
     308:	ff 73 04             	pushl  0x4(%ebx)
     30b:	e8 60 fe ff ff       	call   170 <runcmd>

00000310 <fork1>:
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	83 ec 08             	sub    $0x8,%esp
     316:	e8 ef 09 00 00       	call   d0a <fork>
     31b:	83 f8 ff             	cmp    $0xffffffff,%eax
     31e:	74 02                	je     322 <fork1+0x12>
     320:	c9                   	leave  
     321:	c3                   	ret    
     322:	83 ec 0c             	sub    $0xc,%esp
     325:	68 22 12 00 00       	push   $0x1222
     32a:	e8 21 fe ff ff       	call   150 <panic>
     32f:	90                   	nop

00000330 <execcmd>:
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	53                   	push   %ebx
     334:	83 ec 10             	sub    $0x10,%esp
     337:	6a 54                	push   $0x54
     339:	e8 c2 0d 00 00       	call   1100 <malloc>
     33e:	83 c4 0c             	add    $0xc,%esp
     341:	89 c3                	mov    %eax,%ebx
     343:	6a 54                	push   $0x54
     345:	6a 00                	push   $0x0
     347:	50                   	push   %eax
     348:	e8 23 08 00 00       	call   b70 <memset>
     34d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
     353:	89 d8                	mov    %ebx,%eax
     355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     358:	c9                   	leave  
     359:	c3                   	ret    
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000360 <redircmd>:
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 10             	sub    $0x10,%esp
     367:	6a 18                	push   $0x18
     369:	e8 92 0d 00 00       	call   1100 <malloc>
     36e:	83 c4 0c             	add    $0xc,%esp
     371:	89 c3                	mov    %eax,%ebx
     373:	6a 18                	push   $0x18
     375:	6a 00                	push   $0x0
     377:	50                   	push   %eax
     378:	e8 f3 07 00 00       	call   b70 <memset>
     37d:	8b 45 08             	mov    0x8(%ebp),%eax
     380:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
     386:	89 43 04             	mov    %eax,0x4(%ebx)
     389:	8b 45 0c             	mov    0xc(%ebp),%eax
     38c:	89 43 08             	mov    %eax,0x8(%ebx)
     38f:	8b 45 10             	mov    0x10(%ebp),%eax
     392:	89 43 0c             	mov    %eax,0xc(%ebx)
     395:	8b 45 14             	mov    0x14(%ebp),%eax
     398:	89 43 10             	mov    %eax,0x10(%ebx)
     39b:	8b 45 18             	mov    0x18(%ebp),%eax
     39e:	89 43 14             	mov    %eax,0x14(%ebx)
     3a1:	89 d8                	mov    %ebx,%eax
     3a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3a6:	c9                   	leave  
     3a7:	c3                   	ret    
     3a8:	90                   	nop
     3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003b0 <pipecmd>:
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 10             	sub    $0x10,%esp
     3b7:	6a 0c                	push   $0xc
     3b9:	e8 42 0d 00 00       	call   1100 <malloc>
     3be:	83 c4 0c             	add    $0xc,%esp
     3c1:	89 c3                	mov    %eax,%ebx
     3c3:	6a 0c                	push   $0xc
     3c5:	6a 00                	push   $0x0
     3c7:	50                   	push   %eax
     3c8:	e8 a3 07 00 00       	call   b70 <memset>
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
     3d0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
     3d6:	89 43 04             	mov    %eax,0x4(%ebx)
     3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dc:	89 43 08             	mov    %eax,0x8(%ebx)
     3df:	89 d8                	mov    %ebx,%eax
     3e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3e4:	c9                   	leave  
     3e5:	c3                   	ret    
     3e6:	8d 76 00             	lea    0x0(%esi),%esi
     3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <listcmd>:
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	53                   	push   %ebx
     3f4:	83 ec 10             	sub    $0x10,%esp
     3f7:	6a 0c                	push   $0xc
     3f9:	e8 02 0d 00 00       	call   1100 <malloc>
     3fe:	83 c4 0c             	add    $0xc,%esp
     401:	89 c3                	mov    %eax,%ebx
     403:	6a 0c                	push   $0xc
     405:	6a 00                	push   $0x0
     407:	50                   	push   %eax
     408:	e8 63 07 00 00       	call   b70 <memset>
     40d:	8b 45 08             	mov    0x8(%ebp),%eax
     410:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
     416:	89 43 04             	mov    %eax,0x4(%ebx)
     419:	8b 45 0c             	mov    0xc(%ebp),%eax
     41c:	89 43 08             	mov    %eax,0x8(%ebx)
     41f:	89 d8                	mov    %ebx,%eax
     421:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     424:	c9                   	leave  
     425:	c3                   	ret    
     426:	8d 76 00             	lea    0x0(%esi),%esi
     429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000430 <backcmd>:
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	53                   	push   %ebx
     434:	83 ec 10             	sub    $0x10,%esp
     437:	6a 08                	push   $0x8
     439:	e8 c2 0c 00 00       	call   1100 <malloc>
     43e:	83 c4 0c             	add    $0xc,%esp
     441:	89 c3                	mov    %eax,%ebx
     443:	6a 08                	push   $0x8
     445:	6a 00                	push   $0x0
     447:	50                   	push   %eax
     448:	e8 23 07 00 00       	call   b70 <memset>
     44d:	8b 45 08             	mov    0x8(%ebp),%eax
     450:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
     456:	89 43 04             	mov    %eax,0x4(%ebx)
     459:	89 d8                	mov    %ebx,%eax
     45b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     45e:	c9                   	leave  
     45f:	c3                   	ret    

00000460 <gettoken>:
     460:	55                   	push   %ebp
     461:	89 e5                	mov    %esp,%ebp
     463:	57                   	push   %edi
     464:	56                   	push   %esi
     465:	53                   	push   %ebx
     466:	83 ec 0c             	sub    $0xc,%esp
     469:	8b 45 08             	mov    0x8(%ebp),%eax
     46c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     46f:	8b 7d 10             	mov    0x10(%ebp),%edi
     472:	8b 30                	mov    (%eax),%esi
     474:	39 de                	cmp    %ebx,%esi
     476:	72 0f                	jb     487 <gettoken+0x27>
     478:	eb 25                	jmp    49f <gettoken+0x3f>
     47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     480:	83 c6 01             	add    $0x1,%esi
     483:	39 f3                	cmp    %esi,%ebx
     485:	74 18                	je     49f <gettoken+0x3f>
     487:	0f be 06             	movsbl (%esi),%eax
     48a:	83 ec 08             	sub    $0x8,%esp
     48d:	50                   	push   %eax
     48e:	68 ac 18 00 00       	push   $0x18ac
     493:	e8 f8 06 00 00       	call   b90 <strchr>
     498:	83 c4 10             	add    $0x10,%esp
     49b:	85 c0                	test   %eax,%eax
     49d:	75 e1                	jne    480 <gettoken+0x20>
     49f:	85 ff                	test   %edi,%edi
     4a1:	74 02                	je     4a5 <gettoken+0x45>
     4a3:	89 37                	mov    %esi,(%edi)
     4a5:	0f be 06             	movsbl (%esi),%eax
     4a8:	3c 29                	cmp    $0x29,%al
     4aa:	7f 54                	jg     500 <gettoken+0xa0>
     4ac:	3c 28                	cmp    $0x28,%al
     4ae:	0f 8d c8 00 00 00    	jge    57c <gettoken+0x11c>
     4b4:	31 ff                	xor    %edi,%edi
     4b6:	84 c0                	test   %al,%al
     4b8:	0f 85 d2 00 00 00    	jne    590 <gettoken+0x130>
     4be:	8b 55 14             	mov    0x14(%ebp),%edx
     4c1:	85 d2                	test   %edx,%edx
     4c3:	74 05                	je     4ca <gettoken+0x6a>
     4c5:	8b 45 14             	mov    0x14(%ebp),%eax
     4c8:	89 30                	mov    %esi,(%eax)
     4ca:	39 de                	cmp    %ebx,%esi
     4cc:	72 09                	jb     4d7 <gettoken+0x77>
     4ce:	eb 1f                	jmp    4ef <gettoken+0x8f>
     4d0:	83 c6 01             	add    $0x1,%esi
     4d3:	39 f3                	cmp    %esi,%ebx
     4d5:	74 18                	je     4ef <gettoken+0x8f>
     4d7:	0f be 06             	movsbl (%esi),%eax
     4da:	83 ec 08             	sub    $0x8,%esp
     4dd:	50                   	push   %eax
     4de:	68 ac 18 00 00       	push   $0x18ac
     4e3:	e8 a8 06 00 00       	call   b90 <strchr>
     4e8:	83 c4 10             	add    $0x10,%esp
     4eb:	85 c0                	test   %eax,%eax
     4ed:	75 e1                	jne    4d0 <gettoken+0x70>
     4ef:	8b 45 08             	mov    0x8(%ebp),%eax
     4f2:	89 30                	mov    %esi,(%eax)
     4f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4f7:	89 f8                	mov    %edi,%eax
     4f9:	5b                   	pop    %ebx
     4fa:	5e                   	pop    %esi
     4fb:	5f                   	pop    %edi
     4fc:	5d                   	pop    %ebp
     4fd:	c3                   	ret    
     4fe:	66 90                	xchg   %ax,%ax
     500:	3c 3e                	cmp    $0x3e,%al
     502:	75 1c                	jne    520 <gettoken+0xc0>
     504:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
     508:	8d 46 01             	lea    0x1(%esi),%eax
     50b:	0f 84 a4 00 00 00    	je     5b5 <gettoken+0x155>
     511:	89 c6                	mov    %eax,%esi
     513:	bf 3e 00 00 00       	mov    $0x3e,%edi
     518:	eb a4                	jmp    4be <gettoken+0x5e>
     51a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     520:	7f 56                	jg     578 <gettoken+0x118>
     522:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     525:	80 f9 01             	cmp    $0x1,%cl
     528:	76 52                	jbe    57c <gettoken+0x11c>
     52a:	39 f3                	cmp    %esi,%ebx
     52c:	77 24                	ja     552 <gettoken+0xf2>
     52e:	eb 70                	jmp    5a0 <gettoken+0x140>
     530:	0f be 06             	movsbl (%esi),%eax
     533:	83 ec 08             	sub    $0x8,%esp
     536:	50                   	push   %eax
     537:	68 a4 18 00 00       	push   $0x18a4
     53c:	e8 4f 06 00 00       	call   b90 <strchr>
     541:	83 c4 10             	add    $0x10,%esp
     544:	85 c0                	test   %eax,%eax
     546:	75 1f                	jne    567 <gettoken+0x107>
     548:	83 c6 01             	add    $0x1,%esi
     54b:	39 f3                	cmp    %esi,%ebx
     54d:	74 51                	je     5a0 <gettoken+0x140>
     54f:	0f be 06             	movsbl (%esi),%eax
     552:	83 ec 08             	sub    $0x8,%esp
     555:	50                   	push   %eax
     556:	68 ac 18 00 00       	push   $0x18ac
     55b:	e8 30 06 00 00       	call   b90 <strchr>
     560:	83 c4 10             	add    $0x10,%esp
     563:	85 c0                	test   %eax,%eax
     565:	74 c9                	je     530 <gettoken+0xd0>
     567:	bf 61 00 00 00       	mov    $0x61,%edi
     56c:	e9 4d ff ff ff       	jmp    4be <gettoken+0x5e>
     571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     578:	3c 7c                	cmp    $0x7c,%al
     57a:	75 ae                	jne    52a <gettoken+0xca>
     57c:	0f be f8             	movsbl %al,%edi
     57f:	83 c6 01             	add    $0x1,%esi
     582:	e9 37 ff ff ff       	jmp    4be <gettoken+0x5e>
     587:	89 f6                	mov    %esi,%esi
     589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     590:	3c 26                	cmp    $0x26,%al
     592:	75 96                	jne    52a <gettoken+0xca>
     594:	eb e6                	jmp    57c <gettoken+0x11c>
     596:	8d 76 00             	lea    0x0(%esi),%esi
     599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     5a0:	8b 45 14             	mov    0x14(%ebp),%eax
     5a3:	bf 61 00 00 00       	mov    $0x61,%edi
     5a8:	85 c0                	test   %eax,%eax
     5aa:	0f 85 15 ff ff ff    	jne    4c5 <gettoken+0x65>
     5b0:	e9 3a ff ff ff       	jmp    4ef <gettoken+0x8f>
     5b5:	83 c6 02             	add    $0x2,%esi
     5b8:	bf 2b 00 00 00       	mov    $0x2b,%edi
     5bd:	e9 fc fe ff ff       	jmp    4be <gettoken+0x5e>
     5c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005d0 <peek>:
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	57                   	push   %edi
     5d4:	56                   	push   %esi
     5d5:	53                   	push   %ebx
     5d6:	83 ec 0c             	sub    $0xc,%esp
     5d9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5dc:	8b 75 0c             	mov    0xc(%ebp),%esi
     5df:	8b 1f                	mov    (%edi),%ebx
     5e1:	39 f3                	cmp    %esi,%ebx
     5e3:	72 12                	jb     5f7 <peek+0x27>
     5e5:	eb 28                	jmp    60f <peek+0x3f>
     5e7:	89 f6                	mov    %esi,%esi
     5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     5f0:	83 c3 01             	add    $0x1,%ebx
     5f3:	39 de                	cmp    %ebx,%esi
     5f5:	74 18                	je     60f <peek+0x3f>
     5f7:	0f be 03             	movsbl (%ebx),%eax
     5fa:	83 ec 08             	sub    $0x8,%esp
     5fd:	50                   	push   %eax
     5fe:	68 ac 18 00 00       	push   $0x18ac
     603:	e8 88 05 00 00       	call   b90 <strchr>
     608:	83 c4 10             	add    $0x10,%esp
     60b:	85 c0                	test   %eax,%eax
     60d:	75 e1                	jne    5f0 <peek+0x20>
     60f:	89 1f                	mov    %ebx,(%edi)
     611:	0f be 13             	movsbl (%ebx),%edx
     614:	31 c0                	xor    %eax,%eax
     616:	84 d2                	test   %dl,%dl
     618:	74 17                	je     631 <peek+0x61>
     61a:	83 ec 08             	sub    $0x8,%esp
     61d:	52                   	push   %edx
     61e:	ff 75 10             	pushl  0x10(%ebp)
     621:	e8 6a 05 00 00       	call   b90 <strchr>
     626:	83 c4 10             	add    $0x10,%esp
     629:	85 c0                	test   %eax,%eax
     62b:	0f 95 c0             	setne  %al
     62e:	0f b6 c0             	movzbl %al,%eax
     631:	8d 65 f4             	lea    -0xc(%ebp),%esp
     634:	5b                   	pop    %ebx
     635:	5e                   	pop    %esi
     636:	5f                   	pop    %edi
     637:	5d                   	pop    %ebp
     638:	c3                   	ret    
     639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000640 <parseredirs>:
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	57                   	push   %edi
     644:	56                   	push   %esi
     645:	53                   	push   %ebx
     646:	83 ec 1c             	sub    $0x1c,%esp
     649:	8b 75 0c             	mov    0xc(%ebp),%esi
     64c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     64f:	90                   	nop
     650:	83 ec 04             	sub    $0x4,%esp
     653:	68 49 12 00 00       	push   $0x1249
     658:	53                   	push   %ebx
     659:	56                   	push   %esi
     65a:	e8 71 ff ff ff       	call   5d0 <peek>
     65f:	83 c4 10             	add    $0x10,%esp
     662:	85 c0                	test   %eax,%eax
     664:	74 6a                	je     6d0 <parseredirs+0x90>
     666:	6a 00                	push   $0x0
     668:	6a 00                	push   $0x0
     66a:	53                   	push   %ebx
     66b:	56                   	push   %esi
     66c:	e8 ef fd ff ff       	call   460 <gettoken>
     671:	89 c7                	mov    %eax,%edi
     673:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     676:	50                   	push   %eax
     677:	8d 45 e0             	lea    -0x20(%ebp),%eax
     67a:	50                   	push   %eax
     67b:	53                   	push   %ebx
     67c:	56                   	push   %esi
     67d:	e8 de fd ff ff       	call   460 <gettoken>
     682:	83 c4 20             	add    $0x20,%esp
     685:	83 f8 61             	cmp    $0x61,%eax
     688:	75 51                	jne    6db <parseredirs+0x9b>
     68a:	83 ff 3c             	cmp    $0x3c,%edi
     68d:	74 31                	je     6c0 <parseredirs+0x80>
     68f:	83 ff 3e             	cmp    $0x3e,%edi
     692:	74 05                	je     699 <parseredirs+0x59>
     694:	83 ff 2b             	cmp    $0x2b,%edi
     697:	75 b7                	jne    650 <parseredirs+0x10>
     699:	83 ec 0c             	sub    $0xc,%esp
     69c:	6a 01                	push   $0x1
     69e:	68 01 02 00 00       	push   $0x201
     6a3:	ff 75 e4             	pushl  -0x1c(%ebp)
     6a6:	ff 75 e0             	pushl  -0x20(%ebp)
     6a9:	ff 75 08             	pushl  0x8(%ebp)
     6ac:	e8 af fc ff ff       	call   360 <redircmd>
     6b1:	83 c4 20             	add    $0x20,%esp
     6b4:	89 45 08             	mov    %eax,0x8(%ebp)
     6b7:	eb 97                	jmp    650 <parseredirs+0x10>
     6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6c0:	83 ec 0c             	sub    $0xc,%esp
     6c3:	6a 00                	push   $0x0
     6c5:	6a 00                	push   $0x0
     6c7:	eb da                	jmp    6a3 <parseredirs+0x63>
     6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6d0:	8b 45 08             	mov    0x8(%ebp),%eax
     6d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6d6:	5b                   	pop    %ebx
     6d7:	5e                   	pop    %esi
     6d8:	5f                   	pop    %edi
     6d9:	5d                   	pop    %ebp
     6da:	c3                   	ret    
     6db:	83 ec 0c             	sub    $0xc,%esp
     6de:	68 2c 12 00 00       	push   $0x122c
     6e3:	e8 68 fa ff ff       	call   150 <panic>
     6e8:	90                   	nop
     6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006f0 <parseexec>:
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	57                   	push   %edi
     6f4:	56                   	push   %esi
     6f5:	53                   	push   %ebx
     6f6:	83 ec 30             	sub    $0x30,%esp
     6f9:	8b 75 08             	mov    0x8(%ebp),%esi
     6fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
     6ff:	68 4c 12 00 00       	push   $0x124c
     704:	57                   	push   %edi
     705:	56                   	push   %esi
     706:	e8 c5 fe ff ff       	call   5d0 <peek>
     70b:	83 c4 10             	add    $0x10,%esp
     70e:	85 c0                	test   %eax,%eax
     710:	0f 85 92 00 00 00    	jne    7a8 <parseexec+0xb8>
     716:	89 c3                	mov    %eax,%ebx
     718:	e8 13 fc ff ff       	call   330 <execcmd>
     71d:	83 ec 04             	sub    $0x4,%esp
     720:	89 45 d0             	mov    %eax,-0x30(%ebp)
     723:	57                   	push   %edi
     724:	56                   	push   %esi
     725:	50                   	push   %eax
     726:	e8 15 ff ff ff       	call   640 <parseredirs>
     72b:	83 c4 10             	add    $0x10,%esp
     72e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     731:	eb 18                	jmp    74b <parseexec+0x5b>
     733:	90                   	nop
     734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     738:	83 ec 04             	sub    $0x4,%esp
     73b:	57                   	push   %edi
     73c:	56                   	push   %esi
     73d:	ff 75 d4             	pushl  -0x2c(%ebp)
     740:	e8 fb fe ff ff       	call   640 <parseredirs>
     745:	83 c4 10             	add    $0x10,%esp
     748:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     74b:	83 ec 04             	sub    $0x4,%esp
     74e:	68 63 12 00 00       	push   $0x1263
     753:	57                   	push   %edi
     754:	56                   	push   %esi
     755:	e8 76 fe ff ff       	call   5d0 <peek>
     75a:	83 c4 10             	add    $0x10,%esp
     75d:	85 c0                	test   %eax,%eax
     75f:	75 67                	jne    7c8 <parseexec+0xd8>
     761:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     764:	50                   	push   %eax
     765:	8d 45 e0             	lea    -0x20(%ebp),%eax
     768:	50                   	push   %eax
     769:	57                   	push   %edi
     76a:	56                   	push   %esi
     76b:	e8 f0 fc ff ff       	call   460 <gettoken>
     770:	83 c4 10             	add    $0x10,%esp
     773:	85 c0                	test   %eax,%eax
     775:	74 51                	je     7c8 <parseexec+0xd8>
     777:	83 f8 61             	cmp    $0x61,%eax
     77a:	75 6b                	jne    7e7 <parseexec+0xf7>
     77c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     77f:	8b 55 d0             	mov    -0x30(%ebp),%edx
     782:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
     786:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     789:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
     78d:	83 c3 01             	add    $0x1,%ebx
     790:	83 fb 0a             	cmp    $0xa,%ebx
     793:	75 a3                	jne    738 <parseexec+0x48>
     795:	83 ec 0c             	sub    $0xc,%esp
     798:	68 55 12 00 00       	push   $0x1255
     79d:	e8 ae f9 ff ff       	call   150 <panic>
     7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7a8:	83 ec 08             	sub    $0x8,%esp
     7ab:	57                   	push   %edi
     7ac:	56                   	push   %esi
     7ad:	e8 5e 01 00 00       	call   910 <parseblock>
     7b2:	83 c4 10             	add    $0x10,%esp
     7b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     7b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     7bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7be:	5b                   	pop    %ebx
     7bf:	5e                   	pop    %esi
     7c0:	5f                   	pop    %edi
     7c1:	5d                   	pop    %ebp
     7c2:	c3                   	ret    
     7c3:	90                   	nop
     7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     7c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7cb:	8d 04 98             	lea    (%eax,%ebx,4),%eax
     7ce:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     7d5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     7dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     7df:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7e2:	5b                   	pop    %ebx
     7e3:	5e                   	pop    %esi
     7e4:	5f                   	pop    %edi
     7e5:	5d                   	pop    %ebp
     7e6:	c3                   	ret    
     7e7:	83 ec 0c             	sub    $0xc,%esp
     7ea:	68 4e 12 00 00       	push   $0x124e
     7ef:	e8 5c f9 ff ff       	call   150 <panic>
     7f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000800 <parsepipe>:
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	57                   	push   %edi
     804:	56                   	push   %esi
     805:	53                   	push   %ebx
     806:	83 ec 14             	sub    $0x14,%esp
     809:	8b 5d 08             	mov    0x8(%ebp),%ebx
     80c:	8b 75 0c             	mov    0xc(%ebp),%esi
     80f:	56                   	push   %esi
     810:	53                   	push   %ebx
     811:	e8 da fe ff ff       	call   6f0 <parseexec>
     816:	83 c4 0c             	add    $0xc,%esp
     819:	89 c7                	mov    %eax,%edi
     81b:	68 68 12 00 00       	push   $0x1268
     820:	56                   	push   %esi
     821:	53                   	push   %ebx
     822:	e8 a9 fd ff ff       	call   5d0 <peek>
     827:	83 c4 10             	add    $0x10,%esp
     82a:	85 c0                	test   %eax,%eax
     82c:	75 12                	jne    840 <parsepipe+0x40>
     82e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     831:	89 f8                	mov    %edi,%eax
     833:	5b                   	pop    %ebx
     834:	5e                   	pop    %esi
     835:	5f                   	pop    %edi
     836:	5d                   	pop    %ebp
     837:	c3                   	ret    
     838:	90                   	nop
     839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     840:	6a 00                	push   $0x0
     842:	6a 00                	push   $0x0
     844:	56                   	push   %esi
     845:	53                   	push   %ebx
     846:	e8 15 fc ff ff       	call   460 <gettoken>
     84b:	58                   	pop    %eax
     84c:	5a                   	pop    %edx
     84d:	56                   	push   %esi
     84e:	53                   	push   %ebx
     84f:	e8 ac ff ff ff       	call   800 <parsepipe>
     854:	89 7d 08             	mov    %edi,0x8(%ebp)
     857:	89 45 0c             	mov    %eax,0xc(%ebp)
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     860:	5b                   	pop    %ebx
     861:	5e                   	pop    %esi
     862:	5f                   	pop    %edi
     863:	5d                   	pop    %ebp
     864:	e9 47 fb ff ff       	jmp    3b0 <pipecmd>
     869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000870 <parseline>:
     870:	55                   	push   %ebp
     871:	89 e5                	mov    %esp,%ebp
     873:	57                   	push   %edi
     874:	56                   	push   %esi
     875:	53                   	push   %ebx
     876:	83 ec 14             	sub    $0x14,%esp
     879:	8b 5d 08             	mov    0x8(%ebp),%ebx
     87c:	8b 75 0c             	mov    0xc(%ebp),%esi
     87f:	56                   	push   %esi
     880:	53                   	push   %ebx
     881:	e8 7a ff ff ff       	call   800 <parsepipe>
     886:	83 c4 10             	add    $0x10,%esp
     889:	89 c7                	mov    %eax,%edi
     88b:	eb 1b                	jmp    8a8 <parseline+0x38>
     88d:	8d 76 00             	lea    0x0(%esi),%esi
     890:	6a 00                	push   $0x0
     892:	6a 00                	push   $0x0
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	e8 c5 fb ff ff       	call   460 <gettoken>
     89b:	89 3c 24             	mov    %edi,(%esp)
     89e:	e8 8d fb ff ff       	call   430 <backcmd>
     8a3:	83 c4 10             	add    $0x10,%esp
     8a6:	89 c7                	mov    %eax,%edi
     8a8:	83 ec 04             	sub    $0x4,%esp
     8ab:	68 6a 12 00 00       	push   $0x126a
     8b0:	56                   	push   %esi
     8b1:	53                   	push   %ebx
     8b2:	e8 19 fd ff ff       	call   5d0 <peek>
     8b7:	83 c4 10             	add    $0x10,%esp
     8ba:	85 c0                	test   %eax,%eax
     8bc:	75 d2                	jne    890 <parseline+0x20>
     8be:	83 ec 04             	sub    $0x4,%esp
     8c1:	68 66 12 00 00       	push   $0x1266
     8c6:	56                   	push   %esi
     8c7:	53                   	push   %ebx
     8c8:	e8 03 fd ff ff       	call   5d0 <peek>
     8cd:	83 c4 10             	add    $0x10,%esp
     8d0:	85 c0                	test   %eax,%eax
     8d2:	75 0c                	jne    8e0 <parseline+0x70>
     8d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8d7:	89 f8                	mov    %edi,%eax
     8d9:	5b                   	pop    %ebx
     8da:	5e                   	pop    %esi
     8db:	5f                   	pop    %edi
     8dc:	5d                   	pop    %ebp
     8dd:	c3                   	ret    
     8de:	66 90                	xchg   %ax,%ax
     8e0:	6a 00                	push   $0x0
     8e2:	6a 00                	push   $0x0
     8e4:	56                   	push   %esi
     8e5:	53                   	push   %ebx
     8e6:	e8 75 fb ff ff       	call   460 <gettoken>
     8eb:	58                   	pop    %eax
     8ec:	5a                   	pop    %edx
     8ed:	56                   	push   %esi
     8ee:	53                   	push   %ebx
     8ef:	e8 7c ff ff ff       	call   870 <parseline>
     8f4:	89 7d 08             	mov    %edi,0x8(%ebp)
     8f7:	89 45 0c             	mov    %eax,0xc(%ebp)
     8fa:	83 c4 10             	add    $0x10,%esp
     8fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     900:	5b                   	pop    %ebx
     901:	5e                   	pop    %esi
     902:	5f                   	pop    %edi
     903:	5d                   	pop    %ebp
     904:	e9 e7 fa ff ff       	jmp    3f0 <listcmd>
     909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000910 <parseblock>:
     910:	55                   	push   %ebp
     911:	89 e5                	mov    %esp,%ebp
     913:	57                   	push   %edi
     914:	56                   	push   %esi
     915:	53                   	push   %ebx
     916:	83 ec 10             	sub    $0x10,%esp
     919:	8b 5d 08             	mov    0x8(%ebp),%ebx
     91c:	8b 75 0c             	mov    0xc(%ebp),%esi
     91f:	68 4c 12 00 00       	push   $0x124c
     924:	56                   	push   %esi
     925:	53                   	push   %ebx
     926:	e8 a5 fc ff ff       	call   5d0 <peek>
     92b:	83 c4 10             	add    $0x10,%esp
     92e:	85 c0                	test   %eax,%eax
     930:	74 4a                	je     97c <parseblock+0x6c>
     932:	6a 00                	push   $0x0
     934:	6a 00                	push   $0x0
     936:	56                   	push   %esi
     937:	53                   	push   %ebx
     938:	e8 23 fb ff ff       	call   460 <gettoken>
     93d:	58                   	pop    %eax
     93e:	5a                   	pop    %edx
     93f:	56                   	push   %esi
     940:	53                   	push   %ebx
     941:	e8 2a ff ff ff       	call   870 <parseline>
     946:	83 c4 0c             	add    $0xc,%esp
     949:	89 c7                	mov    %eax,%edi
     94b:	68 88 12 00 00       	push   $0x1288
     950:	56                   	push   %esi
     951:	53                   	push   %ebx
     952:	e8 79 fc ff ff       	call   5d0 <peek>
     957:	83 c4 10             	add    $0x10,%esp
     95a:	85 c0                	test   %eax,%eax
     95c:	74 2b                	je     989 <parseblock+0x79>
     95e:	6a 00                	push   $0x0
     960:	6a 00                	push   $0x0
     962:	56                   	push   %esi
     963:	53                   	push   %ebx
     964:	e8 f7 fa ff ff       	call   460 <gettoken>
     969:	83 c4 0c             	add    $0xc,%esp
     96c:	56                   	push   %esi
     96d:	53                   	push   %ebx
     96e:	57                   	push   %edi
     96f:	e8 cc fc ff ff       	call   640 <parseredirs>
     974:	8d 65 f4             	lea    -0xc(%ebp),%esp
     977:	5b                   	pop    %ebx
     978:	5e                   	pop    %esi
     979:	5f                   	pop    %edi
     97a:	5d                   	pop    %ebp
     97b:	c3                   	ret    
     97c:	83 ec 0c             	sub    $0xc,%esp
     97f:	68 6c 12 00 00       	push   $0x126c
     984:	e8 c7 f7 ff ff       	call   150 <panic>
     989:	83 ec 0c             	sub    $0xc,%esp
     98c:	68 77 12 00 00       	push   $0x1277
     991:	e8 ba f7 ff ff       	call   150 <panic>
     996:	8d 76 00             	lea    0x0(%esi),%esi
     999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009a0 <nulterminate>:
     9a0:	55                   	push   %ebp
     9a1:	89 e5                	mov    %esp,%ebp
     9a3:	53                   	push   %ebx
     9a4:	83 ec 04             	sub    $0x4,%esp
     9a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9aa:	85 db                	test   %ebx,%ebx
     9ac:	74 20                	je     9ce <nulterminate+0x2e>
     9ae:	83 3b 05             	cmpl   $0x5,(%ebx)
     9b1:	77 1b                	ja     9ce <nulterminate+0x2e>
     9b3:	8b 03                	mov    (%ebx),%eax
     9b5:	ff 24 85 c8 12 00 00 	jmp    *0x12c8(,%eax,4)
     9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9c0:	83 ec 0c             	sub    $0xc,%esp
     9c3:	ff 73 04             	pushl  0x4(%ebx)
     9c6:	e8 d5 ff ff ff       	call   9a0 <nulterminate>
     9cb:	83 c4 10             	add    $0x10,%esp
     9ce:	89 d8                	mov    %ebx,%eax
     9d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9d3:	c9                   	leave  
     9d4:	c3                   	ret    
     9d5:	8d 76 00             	lea    0x0(%esi),%esi
     9d8:	83 ec 0c             	sub    $0xc,%esp
     9db:	ff 73 04             	pushl  0x4(%ebx)
     9de:	e8 bd ff ff ff       	call   9a0 <nulterminate>
     9e3:	58                   	pop    %eax
     9e4:	ff 73 08             	pushl  0x8(%ebx)
     9e7:	e8 b4 ff ff ff       	call   9a0 <nulterminate>
     9ec:	89 d8                	mov    %ebx,%eax
     9ee:	83 c4 10             	add    $0x10,%esp
     9f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9f4:	c9                   	leave  
     9f5:	c3                   	ret    
     9f6:	8d 76 00             	lea    0x0(%esi),%esi
     9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     a00:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a03:	8d 43 08             	lea    0x8(%ebx),%eax
     a06:	85 c9                	test   %ecx,%ecx
     a08:	74 c4                	je     9ce <nulterminate+0x2e>
     a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a10:	8b 50 24             	mov    0x24(%eax),%edx
     a13:	83 c0 04             	add    $0x4,%eax
     a16:	c6 02 00             	movb   $0x0,(%edx)
     a19:	8b 50 fc             	mov    -0x4(%eax),%edx
     a1c:	85 d2                	test   %edx,%edx
     a1e:	75 f0                	jne    a10 <nulterminate+0x70>
     a20:	89 d8                	mov    %ebx,%eax
     a22:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a25:	c9                   	leave  
     a26:	c3                   	ret    
     a27:	89 f6                	mov    %esi,%esi
     a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     a30:	83 ec 0c             	sub    $0xc,%esp
     a33:	ff 73 04             	pushl  0x4(%ebx)
     a36:	e8 65 ff ff ff       	call   9a0 <nulterminate>
     a3b:	8b 43 0c             	mov    0xc(%ebx),%eax
     a3e:	83 c4 10             	add    $0x10,%esp
     a41:	c6 00 00             	movb   $0x0,(%eax)
     a44:	89 d8                	mov    %ebx,%eax
     a46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a49:	c9                   	leave  
     a4a:	c3                   	ret    
     a4b:	90                   	nop
     a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a50 <parsecmd>:
     a50:	55                   	push   %ebp
     a51:	89 e5                	mov    %esp,%ebp
     a53:	56                   	push   %esi
     a54:	53                   	push   %ebx
     a55:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a58:	83 ec 0c             	sub    $0xc,%esp
     a5b:	53                   	push   %ebx
     a5c:	e8 df 00 00 00       	call   b40 <strlen>
     a61:	59                   	pop    %ecx
     a62:	01 c3                	add    %eax,%ebx
     a64:	8d 45 08             	lea    0x8(%ebp),%eax
     a67:	5e                   	pop    %esi
     a68:	53                   	push   %ebx
     a69:	50                   	push   %eax
     a6a:	e8 01 fe ff ff       	call   870 <parseline>
     a6f:	89 c6                	mov    %eax,%esi
     a71:	8d 45 08             	lea    0x8(%ebp),%eax
     a74:	83 c4 0c             	add    $0xc,%esp
     a77:	68 11 12 00 00       	push   $0x1211
     a7c:	53                   	push   %ebx
     a7d:	50                   	push   %eax
     a7e:	e8 4d fb ff ff       	call   5d0 <peek>
     a83:	8b 45 08             	mov    0x8(%ebp),%eax
     a86:	83 c4 10             	add    $0x10,%esp
     a89:	39 d8                	cmp    %ebx,%eax
     a8b:	75 12                	jne    a9f <parsecmd+0x4f>
     a8d:	83 ec 0c             	sub    $0xc,%esp
     a90:	56                   	push   %esi
     a91:	e8 0a ff ff ff       	call   9a0 <nulterminate>
     a96:	8d 65 f8             	lea    -0x8(%ebp),%esp
     a99:	89 f0                	mov    %esi,%eax
     a9b:	5b                   	pop    %ebx
     a9c:	5e                   	pop    %esi
     a9d:	5d                   	pop    %ebp
     a9e:	c3                   	ret    
     a9f:	52                   	push   %edx
     aa0:	50                   	push   %eax
     aa1:	68 8a 12 00 00       	push   $0x128a
     aa6:	6a 02                	push   $0x2
     aa8:	e8 d3 03 00 00       	call   e80 <printf>
     aad:	c7 04 24 4e 12 00 00 	movl   $0x124e,(%esp)
     ab4:	e8 97 f6 ff ff       	call   150 <panic>
     ab9:	66 90                	xchg   %ax,%ax
     abb:	66 90                	xchg   %ax,%ax
     abd:	66 90                	xchg   %ax,%ax
     abf:	90                   	nop

00000ac0 <strcpy>:
     ac0:	55                   	push   %ebp
     ac1:	89 e5                	mov    %esp,%ebp
     ac3:	53                   	push   %ebx
     ac4:	8b 45 08             	mov    0x8(%ebp),%eax
     ac7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     aca:	89 c2                	mov    %eax,%edx
     acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ad0:	83 c1 01             	add    $0x1,%ecx
     ad3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     ad7:	83 c2 01             	add    $0x1,%edx
     ada:	84 db                	test   %bl,%bl
     adc:	88 5a ff             	mov    %bl,-0x1(%edx)
     adf:	75 ef                	jne    ad0 <strcpy+0x10>
     ae1:	5b                   	pop    %ebx
     ae2:	5d                   	pop    %ebp
     ae3:	c3                   	ret    
     ae4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     aea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000af0 <strcmp>:
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	53                   	push   %ebx
     af4:	8b 55 08             	mov    0x8(%ebp),%edx
     af7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     afa:	0f b6 02             	movzbl (%edx),%eax
     afd:	0f b6 19             	movzbl (%ecx),%ebx
     b00:	84 c0                	test   %al,%al
     b02:	75 1c                	jne    b20 <strcmp+0x30>
     b04:	eb 2a                	jmp    b30 <strcmp+0x40>
     b06:	8d 76 00             	lea    0x0(%esi),%esi
     b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     b10:	83 c2 01             	add    $0x1,%edx
     b13:	0f b6 02             	movzbl (%edx),%eax
     b16:	83 c1 01             	add    $0x1,%ecx
     b19:	0f b6 19             	movzbl (%ecx),%ebx
     b1c:	84 c0                	test   %al,%al
     b1e:	74 10                	je     b30 <strcmp+0x40>
     b20:	38 d8                	cmp    %bl,%al
     b22:	74 ec                	je     b10 <strcmp+0x20>
     b24:	29 d8                	sub    %ebx,%eax
     b26:	5b                   	pop    %ebx
     b27:	5d                   	pop    %ebp
     b28:	c3                   	ret    
     b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b30:	31 c0                	xor    %eax,%eax
     b32:	29 d8                	sub    %ebx,%eax
     b34:	5b                   	pop    %ebx
     b35:	5d                   	pop    %ebp
     b36:	c3                   	ret    
     b37:	89 f6                	mov    %esi,%esi
     b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b40 <strlen>:
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b46:	80 39 00             	cmpb   $0x0,(%ecx)
     b49:	74 15                	je     b60 <strlen+0x20>
     b4b:	31 d2                	xor    %edx,%edx
     b4d:	8d 76 00             	lea    0x0(%esi),%esi
     b50:	83 c2 01             	add    $0x1,%edx
     b53:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     b57:	89 d0                	mov    %edx,%eax
     b59:	75 f5                	jne    b50 <strlen+0x10>
     b5b:	5d                   	pop    %ebp
     b5c:	c3                   	ret    
     b5d:	8d 76 00             	lea    0x0(%esi),%esi
     b60:	31 c0                	xor    %eax,%eax
     b62:	5d                   	pop    %ebp
     b63:	c3                   	ret    
     b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b70 <memset>:
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	57                   	push   %edi
     b74:	8b 55 08             	mov    0x8(%ebp),%edx
     b77:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b7a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b7d:	89 d7                	mov    %edx,%edi
     b7f:	fc                   	cld    
     b80:	f3 aa                	rep stos %al,%es:(%edi)
     b82:	89 d0                	mov    %edx,%eax
     b84:	5f                   	pop    %edi
     b85:	5d                   	pop    %ebp
     b86:	c3                   	ret    
     b87:	89 f6                	mov    %esi,%esi
     b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b90 <strchr>:
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	53                   	push   %ebx
     b94:	8b 45 08             	mov    0x8(%ebp),%eax
     b97:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     b9a:	0f b6 10             	movzbl (%eax),%edx
     b9d:	84 d2                	test   %dl,%dl
     b9f:	74 1d                	je     bbe <strchr+0x2e>
     ba1:	38 d3                	cmp    %dl,%bl
     ba3:	89 d9                	mov    %ebx,%ecx
     ba5:	75 0d                	jne    bb4 <strchr+0x24>
     ba7:	eb 17                	jmp    bc0 <strchr+0x30>
     ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bb0:	38 ca                	cmp    %cl,%dl
     bb2:	74 0c                	je     bc0 <strchr+0x30>
     bb4:	83 c0 01             	add    $0x1,%eax
     bb7:	0f b6 10             	movzbl (%eax),%edx
     bba:	84 d2                	test   %dl,%dl
     bbc:	75 f2                	jne    bb0 <strchr+0x20>
     bbe:	31 c0                	xor    %eax,%eax
     bc0:	5b                   	pop    %ebx
     bc1:	5d                   	pop    %ebp
     bc2:	c3                   	ret    
     bc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bd0 <gets>:
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	57                   	push   %edi
     bd4:	56                   	push   %esi
     bd5:	53                   	push   %ebx
     bd6:	31 f6                	xor    %esi,%esi
     bd8:	89 f3                	mov    %esi,%ebx
     bda:	83 ec 1c             	sub    $0x1c,%esp
     bdd:	8b 7d 08             	mov    0x8(%ebp),%edi
     be0:	eb 2f                	jmp    c11 <gets+0x41>
     be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     be8:	8d 45 e7             	lea    -0x19(%ebp),%eax
     beb:	83 ec 04             	sub    $0x4,%esp
     bee:	6a 01                	push   $0x1
     bf0:	50                   	push   %eax
     bf1:	6a 00                	push   $0x0
     bf3:	e8 32 01 00 00       	call   d2a <read>
     bf8:	83 c4 10             	add    $0x10,%esp
     bfb:	85 c0                	test   %eax,%eax
     bfd:	7e 1c                	jle    c1b <gets+0x4b>
     bff:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c03:	83 c7 01             	add    $0x1,%edi
     c06:	88 47 ff             	mov    %al,-0x1(%edi)
     c09:	3c 0a                	cmp    $0xa,%al
     c0b:	74 23                	je     c30 <gets+0x60>
     c0d:	3c 0d                	cmp    $0xd,%al
     c0f:	74 1f                	je     c30 <gets+0x60>
     c11:	83 c3 01             	add    $0x1,%ebx
     c14:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     c17:	89 fe                	mov    %edi,%esi
     c19:	7c cd                	jl     be8 <gets+0x18>
     c1b:	89 f3                	mov    %esi,%ebx
     c1d:	8b 45 08             	mov    0x8(%ebp),%eax
     c20:	c6 03 00             	movb   $0x0,(%ebx)
     c23:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c26:	5b                   	pop    %ebx
     c27:	5e                   	pop    %esi
     c28:	5f                   	pop    %edi
     c29:	5d                   	pop    %ebp
     c2a:	c3                   	ret    
     c2b:	90                   	nop
     c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c30:	8b 75 08             	mov    0x8(%ebp),%esi
     c33:	8b 45 08             	mov    0x8(%ebp),%eax
     c36:	01 de                	add    %ebx,%esi
     c38:	89 f3                	mov    %esi,%ebx
     c3a:	c6 03 00             	movb   $0x0,(%ebx)
     c3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c40:	5b                   	pop    %ebx
     c41:	5e                   	pop    %esi
     c42:	5f                   	pop    %edi
     c43:	5d                   	pop    %ebp
     c44:	c3                   	ret    
     c45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c50 <stat>:
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	56                   	push   %esi
     c54:	53                   	push   %ebx
     c55:	83 ec 08             	sub    $0x8,%esp
     c58:	6a 00                	push   $0x0
     c5a:	ff 75 08             	pushl  0x8(%ebp)
     c5d:	e8 f0 00 00 00       	call   d52 <open>
     c62:	83 c4 10             	add    $0x10,%esp
     c65:	85 c0                	test   %eax,%eax
     c67:	78 27                	js     c90 <stat+0x40>
     c69:	83 ec 08             	sub    $0x8,%esp
     c6c:	ff 75 0c             	pushl  0xc(%ebp)
     c6f:	89 c3                	mov    %eax,%ebx
     c71:	50                   	push   %eax
     c72:	e8 f3 00 00 00       	call   d6a <fstat>
     c77:	89 1c 24             	mov    %ebx,(%esp)
     c7a:	89 c6                	mov    %eax,%esi
     c7c:	e8 b9 00 00 00       	call   d3a <close>
     c81:	83 c4 10             	add    $0x10,%esp
     c84:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c87:	89 f0                	mov    %esi,%eax
     c89:	5b                   	pop    %ebx
     c8a:	5e                   	pop    %esi
     c8b:	5d                   	pop    %ebp
     c8c:	c3                   	ret    
     c8d:	8d 76 00             	lea    0x0(%esi),%esi
     c90:	be ff ff ff ff       	mov    $0xffffffff,%esi
     c95:	eb ed                	jmp    c84 <stat+0x34>
     c97:	89 f6                	mov    %esi,%esi
     c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ca0 <atoi>:
     ca0:	55                   	push   %ebp
     ca1:	89 e5                	mov    %esp,%ebp
     ca3:	53                   	push   %ebx
     ca4:	8b 4d 08             	mov    0x8(%ebp),%ecx
     ca7:	0f be 11             	movsbl (%ecx),%edx
     caa:	8d 42 d0             	lea    -0x30(%edx),%eax
     cad:	3c 09                	cmp    $0x9,%al
     caf:	b8 00 00 00 00       	mov    $0x0,%eax
     cb4:	77 1f                	ja     cd5 <atoi+0x35>
     cb6:	8d 76 00             	lea    0x0(%esi),%esi
     cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     cc0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     cc3:	83 c1 01             	add    $0x1,%ecx
     cc6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
     cca:	0f be 11             	movsbl (%ecx),%edx
     ccd:	8d 5a d0             	lea    -0x30(%edx),%ebx
     cd0:	80 fb 09             	cmp    $0x9,%bl
     cd3:	76 eb                	jbe    cc0 <atoi+0x20>
     cd5:	5b                   	pop    %ebx
     cd6:	5d                   	pop    %ebp
     cd7:	c3                   	ret    
     cd8:	90                   	nop
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ce0 <memmove>:
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	56                   	push   %esi
     ce4:	53                   	push   %ebx
     ce5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     ce8:	8b 45 08             	mov    0x8(%ebp),%eax
     ceb:	8b 75 0c             	mov    0xc(%ebp),%esi
     cee:	85 db                	test   %ebx,%ebx
     cf0:	7e 14                	jle    d06 <memmove+0x26>
     cf2:	31 d2                	xor    %edx,%edx
     cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cf8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     cfc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     cff:	83 c2 01             	add    $0x1,%edx
     d02:	39 d3                	cmp    %edx,%ebx
     d04:	75 f2                	jne    cf8 <memmove+0x18>
     d06:	5b                   	pop    %ebx
     d07:	5e                   	pop    %esi
     d08:	5d                   	pop    %ebp
     d09:	c3                   	ret    

00000d0a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d0a:	b8 01 00 00 00       	mov    $0x1,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <exit>:
SYSCALL(exit)
     d12:	b8 02 00 00 00       	mov    $0x2,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <wait>:
SYSCALL(wait)
     d1a:	b8 03 00 00 00       	mov    $0x3,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <pipe>:
SYSCALL(pipe)
     d22:	b8 04 00 00 00       	mov    $0x4,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <read>:
SYSCALL(read)
     d2a:	b8 05 00 00 00       	mov    $0x5,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <write>:
SYSCALL(write)
     d32:	b8 10 00 00 00       	mov    $0x10,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <close>:
SYSCALL(close)
     d3a:	b8 15 00 00 00       	mov    $0x15,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <kill>:
SYSCALL(kill)
     d42:	b8 06 00 00 00       	mov    $0x6,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <exec>:
SYSCALL(exec)
     d4a:	b8 07 00 00 00       	mov    $0x7,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <open>:
SYSCALL(open)
     d52:	b8 0f 00 00 00       	mov    $0xf,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <mknod>:
SYSCALL(mknod)
     d5a:	b8 11 00 00 00       	mov    $0x11,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <unlink>:
SYSCALL(unlink)
     d62:	b8 12 00 00 00       	mov    $0x12,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <fstat>:
SYSCALL(fstat)
     d6a:	b8 08 00 00 00       	mov    $0x8,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <link>:
SYSCALL(link)
     d72:	b8 13 00 00 00       	mov    $0x13,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <mkdir>:
SYSCALL(mkdir)
     d7a:	b8 14 00 00 00       	mov    $0x14,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <chdir>:
SYSCALL(chdir)
     d82:	b8 09 00 00 00       	mov    $0x9,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <dup>:
SYSCALL(dup)
     d8a:	b8 0a 00 00 00       	mov    $0xa,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    

00000d92 <getpid>:
SYSCALL(getpid)
     d92:	b8 0b 00 00 00       	mov    $0xb,%eax
     d97:	cd 40                	int    $0x40
     d99:	c3                   	ret    

00000d9a <sbrk>:
SYSCALL(sbrk)
     d9a:	b8 0c 00 00 00       	mov    $0xc,%eax
     d9f:	cd 40                	int    $0x40
     da1:	c3                   	ret    

00000da2 <sleep>:
SYSCALL(sleep)
     da2:	b8 0d 00 00 00       	mov    $0xd,%eax
     da7:	cd 40                	int    $0x40
     da9:	c3                   	ret    

00000daa <uptime>:
SYSCALL(uptime)
     daa:	b8 0e 00 00 00       	mov    $0xe,%eax
     daf:	cd 40                	int    $0x40
     db1:	c3                   	ret    

00000db2 <getreadcount>:
SYSCALL(getreadcount)
     db2:	b8 16 00 00 00       	mov    $0x16,%eax
     db7:	cd 40                	int    $0x40
     db9:	c3                   	ret    

00000dba <gettime>:
SYSCALL(gettime)
     dba:	b8 17 00 00 00       	mov    $0x17,%eax
     dbf:	cd 40                	int    $0x40
     dc1:	c3                   	ret    

00000dc2 <settickets>:
SYSCALL(settickets)
     dc2:	b8 18 00 00 00       	mov    $0x18,%eax
     dc7:	cd 40                	int    $0x40
     dc9:	c3                   	ret    

00000dca <getpinfo>:
     dca:	b8 19 00 00 00       	mov    $0x19,%eax
     dcf:	cd 40                	int    $0x40
     dd1:	c3                   	ret    
     dd2:	66 90                	xchg   %ax,%ax
     dd4:	66 90                	xchg   %ax,%ax
     dd6:	66 90                	xchg   %ax,%ax
     dd8:	66 90                	xchg   %ax,%ax
     dda:	66 90                	xchg   %ax,%ax
     ddc:	66 90                	xchg   %ax,%ax
     dde:	66 90                	xchg   %ax,%ax

00000de0 <printint>:
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	57                   	push   %edi
     de4:	56                   	push   %esi
     de5:	53                   	push   %ebx
     de6:	83 ec 3c             	sub    $0x3c,%esp
     de9:	85 d2                	test   %edx,%edx
     deb:	89 45 c0             	mov    %eax,-0x40(%ebp)
     dee:	89 d0                	mov    %edx,%eax
     df0:	79 76                	jns    e68 <printint+0x88>
     df2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     df6:	74 70                	je     e68 <printint+0x88>
     df8:	f7 d8                	neg    %eax
     dfa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     e01:	31 f6                	xor    %esi,%esi
     e03:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     e06:	eb 0a                	jmp    e12 <printint+0x32>
     e08:	90                   	nop
     e09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e10:	89 fe                	mov    %edi,%esi
     e12:	31 d2                	xor    %edx,%edx
     e14:	8d 7e 01             	lea    0x1(%esi),%edi
     e17:	f7 f1                	div    %ecx
     e19:	0f b6 92 e8 12 00 00 	movzbl 0x12e8(%edx),%edx
     e20:	85 c0                	test   %eax,%eax
     e22:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
     e25:	75 e9                	jne    e10 <printint+0x30>
     e27:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     e2a:	85 c0                	test   %eax,%eax
     e2c:	74 08                	je     e36 <printint+0x56>
     e2e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
     e33:	8d 7e 02             	lea    0x2(%esi),%edi
     e36:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
     e3a:	8b 7d c0             	mov    -0x40(%ebp),%edi
     e3d:	8d 76 00             	lea    0x0(%esi),%esi
     e40:	0f b6 06             	movzbl (%esi),%eax
     e43:	83 ec 04             	sub    $0x4,%esp
     e46:	83 ee 01             	sub    $0x1,%esi
     e49:	6a 01                	push   $0x1
     e4b:	53                   	push   %ebx
     e4c:	57                   	push   %edi
     e4d:	88 45 d7             	mov    %al,-0x29(%ebp)
     e50:	e8 dd fe ff ff       	call   d32 <write>
     e55:	83 c4 10             	add    $0x10,%esp
     e58:	39 de                	cmp    %ebx,%esi
     e5a:	75 e4                	jne    e40 <printint+0x60>
     e5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e5f:	5b                   	pop    %ebx
     e60:	5e                   	pop    %esi
     e61:	5f                   	pop    %edi
     e62:	5d                   	pop    %ebp
     e63:	c3                   	ret    
     e64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e68:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     e6f:	eb 90                	jmp    e01 <printint+0x21>
     e71:	eb 0d                	jmp    e80 <printf>
     e73:	90                   	nop
     e74:	90                   	nop
     e75:	90                   	nop
     e76:	90                   	nop
     e77:	90                   	nop
     e78:	90                   	nop
     e79:	90                   	nop
     e7a:	90                   	nop
     e7b:	90                   	nop
     e7c:	90                   	nop
     e7d:	90                   	nop
     e7e:	90                   	nop
     e7f:	90                   	nop

00000e80 <printf>:
     e80:	55                   	push   %ebp
     e81:	89 e5                	mov    %esp,%ebp
     e83:	57                   	push   %edi
     e84:	56                   	push   %esi
     e85:	53                   	push   %ebx
     e86:	83 ec 2c             	sub    $0x2c,%esp
     e89:	8b 75 0c             	mov    0xc(%ebp),%esi
     e8c:	0f b6 1e             	movzbl (%esi),%ebx
     e8f:	84 db                	test   %bl,%bl
     e91:	0f 84 bf 00 00 00    	je     f56 <printf+0xd6>
     e97:	83 c6 01             	add    $0x1,%esi
     e9a:	8d 7d 10             	lea    0x10(%ebp),%edi
     e9d:	31 d2                	xor    %edx,%edx
     e9f:	eb 39                	jmp    eda <printf+0x5a>
     ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ea8:	83 f8 25             	cmp    $0x25,%eax
     eab:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     eae:	ba 25 00 00 00       	mov    $0x25,%edx
     eb3:	74 1a                	je     ecf <printf+0x4f>
     eb5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     eb8:	83 ec 04             	sub    $0x4,%esp
     ebb:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     ebe:	6a 01                	push   $0x1
     ec0:	50                   	push   %eax
     ec1:	ff 75 08             	pushl  0x8(%ebp)
     ec4:	e8 69 fe ff ff       	call   d32 <write>
     ec9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     ecc:	83 c4 10             	add    $0x10,%esp
     ecf:	83 c6 01             	add    $0x1,%esi
     ed2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     ed6:	84 db                	test   %bl,%bl
     ed8:	74 7c                	je     f56 <printf+0xd6>
     eda:	85 d2                	test   %edx,%edx
     edc:	0f be cb             	movsbl %bl,%ecx
     edf:	0f b6 c3             	movzbl %bl,%eax
     ee2:	74 c4                	je     ea8 <printf+0x28>
     ee4:	83 fa 25             	cmp    $0x25,%edx
     ee7:	75 e6                	jne    ecf <printf+0x4f>
     ee9:	83 f8 64             	cmp    $0x64,%eax
     eec:	0f 84 a6 00 00 00    	je     f98 <printf+0x118>
     ef2:	83 f8 6c             	cmp    $0x6c,%eax
     ef5:	0f 84 ad 00 00 00    	je     fa8 <printf+0x128>
     efb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     f01:	83 f9 70             	cmp    $0x70,%ecx
     f04:	74 5a                	je     f60 <printf+0xe0>
     f06:	83 f8 73             	cmp    $0x73,%eax
     f09:	0f 84 e1 00 00 00    	je     ff0 <printf+0x170>
     f0f:	83 f8 63             	cmp    $0x63,%eax
     f12:	0f 84 28 01 00 00    	je     1040 <printf+0x1c0>
     f18:	83 f8 25             	cmp    $0x25,%eax
     f1b:	74 6b                	je     f88 <printf+0x108>
     f1d:	8d 45 e7             	lea    -0x19(%ebp),%eax
     f20:	83 ec 04             	sub    $0x4,%esp
     f23:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f27:	6a 01                	push   $0x1
     f29:	50                   	push   %eax
     f2a:	ff 75 08             	pushl  0x8(%ebp)
     f2d:	e8 00 fe ff ff       	call   d32 <write>
     f32:	83 c4 0c             	add    $0xc,%esp
     f35:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     f38:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     f3b:	6a 01                	push   $0x1
     f3d:	50                   	push   %eax
     f3e:	ff 75 08             	pushl  0x8(%ebp)
     f41:	83 c6 01             	add    $0x1,%esi
     f44:	e8 e9 fd ff ff       	call   d32 <write>
     f49:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     f4d:	83 c4 10             	add    $0x10,%esp
     f50:	31 d2                	xor    %edx,%edx
     f52:	84 db                	test   %bl,%bl
     f54:	75 84                	jne    eda <printf+0x5a>
     f56:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f59:	5b                   	pop    %ebx
     f5a:	5e                   	pop    %esi
     f5b:	5f                   	pop    %edi
     f5c:	5d                   	pop    %ebp
     f5d:	c3                   	ret    
     f5e:	66 90                	xchg   %ax,%ax
     f60:	83 ec 0c             	sub    $0xc,%esp
     f63:	b9 10 00 00 00       	mov    $0x10,%ecx
     f68:	6a 00                	push   $0x0
     f6a:	8b 17                	mov    (%edi),%edx
     f6c:	8b 45 08             	mov    0x8(%ebp),%eax
     f6f:	83 c7 04             	add    $0x4,%edi
     f72:	e8 69 fe ff ff       	call   de0 <printint>
     f77:	83 c4 10             	add    $0x10,%esp
     f7a:	31 d2                	xor    %edx,%edx
     f7c:	e9 4e ff ff ff       	jmp    ecf <printf+0x4f>
     f81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f88:	83 ec 04             	sub    $0x4,%esp
     f8b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     f8e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     f91:	6a 01                	push   $0x1
     f93:	eb a8                	jmp    f3d <printf+0xbd>
     f95:	8d 76 00             	lea    0x0(%esi),%esi
     f98:	83 ec 0c             	sub    $0xc,%esp
     f9b:	b9 0a 00 00 00       	mov    $0xa,%ecx
     fa0:	6a 01                	push   $0x1
     fa2:	eb c6                	jmp    f6a <printf+0xea>
     fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fa8:	8b 57 04             	mov    0x4(%edi),%edx
     fab:	8b 1f                	mov    (%edi),%ebx
     fad:	85 d2                	test   %edx,%edx
     faf:	74 15                	je     fc6 <printf+0x146>
     fb1:	83 ec 0c             	sub    $0xc,%esp
     fb4:	8b 45 08             	mov    0x8(%ebp),%eax
     fb7:	b9 10 00 00 00       	mov    $0x10,%ecx
     fbc:	6a 00                	push   $0x0
     fbe:	e8 1d fe ff ff       	call   de0 <printint>
     fc3:	83 c4 10             	add    $0x10,%esp
     fc6:	83 ec 0c             	sub    $0xc,%esp
     fc9:	8b 45 08             	mov    0x8(%ebp),%eax
     fcc:	89 da                	mov    %ebx,%edx
     fce:	6a 00                	push   $0x0
     fd0:	b9 10 00 00 00       	mov    $0x10,%ecx
     fd5:	83 c7 08             	add    $0x8,%edi
     fd8:	e8 03 fe ff ff       	call   de0 <printint>
     fdd:	83 c4 10             	add    $0x10,%esp
     fe0:	31 d2                	xor    %edx,%edx
     fe2:	e9 e8 fe ff ff       	jmp    ecf <printf+0x4f>
     fe7:	89 f6                	mov    %esi,%esi
     fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     ff0:	8b 0f                	mov    (%edi),%ecx
     ff2:	83 c7 04             	add    $0x4,%edi
     ff5:	85 c9                	test   %ecx,%ecx
     ff7:	74 6a                	je     1063 <printf+0x1e3>
     ff9:	0f b6 01             	movzbl (%ecx),%eax
     ffc:	31 d2                	xor    %edx,%edx
     ffe:	89 cb                	mov    %ecx,%ebx
    1000:	84 c0                	test   %al,%al
    1002:	0f 84 c7 fe ff ff    	je     ecf <printf+0x4f>
    1008:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    100b:	89 de                	mov    %ebx,%esi
    100d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1010:	88 45 e3             	mov    %al,-0x1d(%ebp)
    1013:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1016:	83 ec 04             	sub    $0x4,%esp
    1019:	6a 01                	push   $0x1
    101b:	83 c6 01             	add    $0x1,%esi
    101e:	50                   	push   %eax
    101f:	53                   	push   %ebx
    1020:	e8 0d fd ff ff       	call   d32 <write>
    1025:	0f b6 06             	movzbl (%esi),%eax
    1028:	83 c4 10             	add    $0x10,%esp
    102b:	84 c0                	test   %al,%al
    102d:	75 e1                	jne    1010 <printf+0x190>
    102f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    1032:	31 d2                	xor    %edx,%edx
    1034:	e9 96 fe ff ff       	jmp    ecf <printf+0x4f>
    1039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1040:	8b 07                	mov    (%edi),%eax
    1042:	83 ec 04             	sub    $0x4,%esp
    1045:	83 c7 04             	add    $0x4,%edi
    1048:	6a 01                	push   $0x1
    104a:	88 45 e4             	mov    %al,-0x1c(%ebp)
    104d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1050:	50                   	push   %eax
    1051:	ff 75 08             	pushl  0x8(%ebp)
    1054:	e8 d9 fc ff ff       	call   d32 <write>
    1059:	83 c4 10             	add    $0x10,%esp
    105c:	31 d2                	xor    %edx,%edx
    105e:	e9 6c fe ff ff       	jmp    ecf <printf+0x4f>
    1063:	bb e0 12 00 00       	mov    $0x12e0,%ebx
    1068:	b8 28 00 00 00       	mov    $0x28,%eax
    106d:	eb 99                	jmp    1008 <printf+0x188>
    106f:	90                   	nop

00001070 <free>:
    1070:	55                   	push   %ebp
    1071:	a1 24 19 00 00       	mov    0x1924,%eax
    1076:	89 e5                	mov    %esp,%ebp
    1078:	57                   	push   %edi
    1079:	56                   	push   %esi
    107a:	53                   	push   %ebx
    107b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    107e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1081:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1088:	39 c8                	cmp    %ecx,%eax
    108a:	8b 10                	mov    (%eax),%edx
    108c:	73 32                	jae    10c0 <free+0x50>
    108e:	39 d1                	cmp    %edx,%ecx
    1090:	72 04                	jb     1096 <free+0x26>
    1092:	39 d0                	cmp    %edx,%eax
    1094:	72 32                	jb     10c8 <free+0x58>
    1096:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1099:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    109c:	39 fa                	cmp    %edi,%edx
    109e:	74 30                	je     10d0 <free+0x60>
    10a0:	89 53 f8             	mov    %edx,-0x8(%ebx)
    10a3:	8b 50 04             	mov    0x4(%eax),%edx
    10a6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10a9:	39 f1                	cmp    %esi,%ecx
    10ab:	74 3a                	je     10e7 <free+0x77>
    10ad:	89 08                	mov    %ecx,(%eax)
    10af:	a3 24 19 00 00       	mov    %eax,0x1924
    10b4:	5b                   	pop    %ebx
    10b5:	5e                   	pop    %esi
    10b6:	5f                   	pop    %edi
    10b7:	5d                   	pop    %ebp
    10b8:	c3                   	ret    
    10b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10c0:	39 d0                	cmp    %edx,%eax
    10c2:	72 04                	jb     10c8 <free+0x58>
    10c4:	39 d1                	cmp    %edx,%ecx
    10c6:	72 ce                	jb     1096 <free+0x26>
    10c8:	89 d0                	mov    %edx,%eax
    10ca:	eb bc                	jmp    1088 <free+0x18>
    10cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10d0:	03 72 04             	add    0x4(%edx),%esi
    10d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    10d6:	8b 10                	mov    (%eax),%edx
    10d8:	8b 12                	mov    (%edx),%edx
    10da:	89 53 f8             	mov    %edx,-0x8(%ebx)
    10dd:	8b 50 04             	mov    0x4(%eax),%edx
    10e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10e3:	39 f1                	cmp    %esi,%ecx
    10e5:	75 c6                	jne    10ad <free+0x3d>
    10e7:	03 53 fc             	add    -0x4(%ebx),%edx
    10ea:	a3 24 19 00 00       	mov    %eax,0x1924
    10ef:	89 50 04             	mov    %edx,0x4(%eax)
    10f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    10f5:	89 10                	mov    %edx,(%eax)
    10f7:	5b                   	pop    %ebx
    10f8:	5e                   	pop    %esi
    10f9:	5f                   	pop    %edi
    10fa:	5d                   	pop    %ebp
    10fb:	c3                   	ret    
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001100 <malloc>:
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	57                   	push   %edi
    1104:	56                   	push   %esi
    1105:	53                   	push   %ebx
    1106:	83 ec 0c             	sub    $0xc,%esp
    1109:	8b 45 08             	mov    0x8(%ebp),%eax
    110c:	8b 15 24 19 00 00    	mov    0x1924,%edx
    1112:	8d 78 07             	lea    0x7(%eax),%edi
    1115:	c1 ef 03             	shr    $0x3,%edi
    1118:	83 c7 01             	add    $0x1,%edi
    111b:	85 d2                	test   %edx,%edx
    111d:	0f 84 9d 00 00 00    	je     11c0 <malloc+0xc0>
    1123:	8b 02                	mov    (%edx),%eax
    1125:	8b 48 04             	mov    0x4(%eax),%ecx
    1128:	39 cf                	cmp    %ecx,%edi
    112a:	76 6c                	jbe    1198 <malloc+0x98>
    112c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1132:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1137:	0f 43 df             	cmovae %edi,%ebx
    113a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1141:	eb 0e                	jmp    1151 <malloc+0x51>
    1143:	90                   	nop
    1144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1148:	8b 02                	mov    (%edx),%eax
    114a:	8b 48 04             	mov    0x4(%eax),%ecx
    114d:	39 f9                	cmp    %edi,%ecx
    114f:	73 47                	jae    1198 <malloc+0x98>
    1151:	39 05 24 19 00 00    	cmp    %eax,0x1924
    1157:	89 c2                	mov    %eax,%edx
    1159:	75 ed                	jne    1148 <malloc+0x48>
    115b:	83 ec 0c             	sub    $0xc,%esp
    115e:	56                   	push   %esi
    115f:	e8 36 fc ff ff       	call   d9a <sbrk>
    1164:	83 c4 10             	add    $0x10,%esp
    1167:	83 f8 ff             	cmp    $0xffffffff,%eax
    116a:	74 1c                	je     1188 <malloc+0x88>
    116c:	89 58 04             	mov    %ebx,0x4(%eax)
    116f:	83 ec 0c             	sub    $0xc,%esp
    1172:	83 c0 08             	add    $0x8,%eax
    1175:	50                   	push   %eax
    1176:	e8 f5 fe ff ff       	call   1070 <free>
    117b:	8b 15 24 19 00 00    	mov    0x1924,%edx
    1181:	83 c4 10             	add    $0x10,%esp
    1184:	85 d2                	test   %edx,%edx
    1186:	75 c0                	jne    1148 <malloc+0x48>
    1188:	8d 65 f4             	lea    -0xc(%ebp),%esp
    118b:	31 c0                	xor    %eax,%eax
    118d:	5b                   	pop    %ebx
    118e:	5e                   	pop    %esi
    118f:	5f                   	pop    %edi
    1190:	5d                   	pop    %ebp
    1191:	c3                   	ret    
    1192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1198:	39 cf                	cmp    %ecx,%edi
    119a:	74 54                	je     11f0 <malloc+0xf0>
    119c:	29 f9                	sub    %edi,%ecx
    119e:	89 48 04             	mov    %ecx,0x4(%eax)
    11a1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    11a4:	89 78 04             	mov    %edi,0x4(%eax)
    11a7:	89 15 24 19 00 00    	mov    %edx,0x1924
    11ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11b0:	83 c0 08             	add    $0x8,%eax
    11b3:	5b                   	pop    %ebx
    11b4:	5e                   	pop    %esi
    11b5:	5f                   	pop    %edi
    11b6:	5d                   	pop    %ebp
    11b7:	c3                   	ret    
    11b8:	90                   	nop
    11b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11c0:	c7 05 24 19 00 00 28 	movl   $0x1928,0x1924
    11c7:	19 00 00 
    11ca:	c7 05 28 19 00 00 28 	movl   $0x1928,0x1928
    11d1:	19 00 00 
    11d4:	b8 28 19 00 00       	mov    $0x1928,%eax
    11d9:	c7 05 2c 19 00 00 00 	movl   $0x0,0x192c
    11e0:	00 00 00 
    11e3:	e9 44 ff ff ff       	jmp    112c <malloc+0x2c>
    11e8:	90                   	nop
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11f0:	8b 08                	mov    (%eax),%ecx
    11f2:	89 0a                	mov    %ecx,(%edx)
    11f4:	eb b1                	jmp    11a7 <malloc+0xa7>
