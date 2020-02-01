
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc a0 cf 10 80       	mov    $0x8010cfa0,%esp
8010002d:	b8 30 2f 10 80       	mov    $0x80102f30,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb d4 cf 10 80       	mov    $0x8010cfd4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 20 79 10 80       	push   $0x80107920
80100051:	68 a0 cf 10 80       	push   $0x8010cfa0
80100056:	e8 45 46 00 00       	call   801046a0 <initlock>
8010005b:	c7 05 ec 16 11 80 9c 	movl   $0x8011169c,0x801116ec
80100062:	16 11 80 
80100065:	c7 05 f0 16 11 80 9c 	movl   $0x8011169c,0x801116f0
8010006c:	16 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 9c 16 11 80       	mov    $0x8011169c,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 9c 16 11 80 	movl   $0x8011169c,0x50(%ebx)
80100092:	68 27 79 10 80       	push   $0x80107927
80100097:	50                   	push   %eax
80100098:	e8 d3 44 00 00       	call   80104570 <initsleeplock>
8010009d:	a1 f0 16 11 80       	mov    0x801116f0,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d f0 16 11 80    	mov    %ebx,0x801116f0
801000b6:	3d 9c 16 11 80       	cmp    $0x8011169c,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 a0 cf 10 80       	push   $0x8010cfa0
801000e4:	e8 f7 46 00 00       	call   801047e0 <acquire>
801000e9:	8b 1d f0 16 11 80    	mov    0x801116f0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d ec 16 11 80    	mov    0x801116ec,%ebx
80100126:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 a0 cf 10 80       	push   $0x8010cfa0
80100162:	e8 39 47 00 00       	call   801048a0 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 3e 44 00 00       	call   801045b0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 dd 1f 00 00       	call   80102160 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 2e 79 10 80       	push   $0x8010792e
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 9d 44 00 00       	call   80104650 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 97 1f 00 00       	jmp    80102160 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 3f 79 10 80       	push   $0x8010793f
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 5c 44 00 00       	call   80104650 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 0c 44 00 00       	call   80104610 <releasesleep>
80100204:	c7 04 24 a0 cf 10 80 	movl   $0x8010cfa0,(%esp)
8010020b:	e8 d0 45 00 00       	call   801047e0 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 f0 16 11 80       	mov    0x801116f0,%eax
80100237:	c7 43 50 9c 16 11 80 	movl   $0x8011169c,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 f0 16 11 80       	mov    0x801116f0,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d f0 16 11 80    	mov    %ebx,0x801116f0
8010024f:	c7 45 08 a0 cf 10 80 	movl   $0x8010cfa0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 3f 46 00 00       	jmp    801048a0 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 46 79 10 80       	push   $0x80107946
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 1b 15 00 00       	call   801017a0 <iunlock>
80100285:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010028c:	e8 4f 45 00 00       	call   801047e0 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
801002a1:	8b 15 80 19 11 80    	mov    0x80111980,%edx
801002a7:	39 15 84 19 11 80    	cmp    %edx,0x80111984
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 b5 10 80       	push   $0x8010b520
801002c0:	68 80 19 11 80       	push   $0x80111980
801002c5:	e8 f6 3b 00 00       	call   80103ec0 <sleep>
801002ca:	8b 15 80 19 11 80    	mov    0x80111980,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 84 19 11 80    	cmp    0x80111984,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
801002db:	e8 c0 35 00 00       	call   801038a0 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 b5 10 80       	push   $0x8010b520
801002ef:	e8 ac 45 00 00       	call   801048a0 <release>
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 c4 13 00 00       	call   801016c0 <ilock>
801002fc:	83 c4 10             	add    $0x10,%esp
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 80 19 11 80       	mov    %eax,0x80111980
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 00 19 11 80 	movsbl -0x7feee700(%eax),%eax
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
80100329:	83 c6 01             	add    $0x1,%esi
8010032c:	83 eb 01             	sub    $0x1,%ebx
8010032f:	83 f8 0a             	cmp    $0xa,%eax
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
80100335:	74 43                	je     8010037a <consoleread+0x10a>
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 b5 10 80       	push   $0x8010b520
8010034d:	e8 4e 45 00 00       	call   801048a0 <release>
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 66 13 00 00       	call   801016c0 <ilock>
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
80100372:	89 15 80 19 11 80    	mov    %edx,0x80111980
80100378:	eb c8                	jmp    80100342 <consoleread+0xd2>
8010037a:	8b 45 10             	mov    0x10(%ebp),%eax
8010037d:	29 d8                	sub    %ebx,%eax
8010037f:	eb c1                	jmp    80100342 <consoleread+0xd2>
80100381:	eb 0d                	jmp    80100390 <panic>
80100383:	90                   	nop
80100384:	90                   	nop
80100385:	90                   	nop
80100386:	90                   	nop
80100387:	90                   	nop
80100388:	90                   	nop
80100389:	90                   	nop
8010038a:	90                   	nop
8010038b:	90                   	nop
8010038c:	90                   	nop
8010038d:	90                   	nop
8010038e:	90                   	nop
8010038f:	90                   	nop

80100390 <panic>:
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
80100398:	fa                   	cli    
80100399:	c7 05 54 b5 10 80 00 	movl   $0x0,0x8010b554
801003a0:	00 00 00 
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
801003a9:	e8 c2 23 00 00       	call   80102770 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 4d 79 10 80       	push   $0x8010794d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
801003c5:	c7 04 24 b7 82 10 80 	movl   $0x801082b7,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 e3 42 00 00       	call   801046c0 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 61 79 10 80       	push   $0x80107961
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
801003f9:	c7 05 58 b5 10 80 01 	movl   $0x1,0x8010b558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
80100410:	8b 0d 58 b5 10 80    	mov    0x8010b558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 51 5d 00 00       	call   80106190 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
80100457:	0f b6 c0             	movzbl %al,%eax
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
8010046d:	09 fb                	or     %edi,%ebx
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004bd:	89 d8                	mov    %ebx,%eax
801004bf:	c1 f8 08             	sar    $0x8,%eax
801004c2:	89 ca                	mov    %ecx,%edx
801004c4:	ee                   	out    %al,(%dx)
801004c5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004ca:	89 f2                	mov    %esi,%edx
801004cc:	ee                   	out    %al,(%dx)
801004cd:	89 d8                	mov    %ebx,%eax
801004cf:	89 ca                	mov    %ecx,%edx
801004d1:	ee                   	out    %al,(%dx)
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 9f 5c 00 00       	call   80106190 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 93 5c 00 00       	call   80106190 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 87 5c 00 00       	call   80106190 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
80100517:	83 eb 50             	sub    $0x50,%ebx
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 77 44 00 00       	call   801049a0 <memmove>
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 aa 43 00 00       	call   801048f0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 65 79 10 80       	push   $0x80107965
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 90 79 10 80 	movzbl -0x7fef8670(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 8c 11 00 00       	call   801017a0 <iunlock>
80100614:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010061b:	e8 c0 41 00 00       	call   801047e0 <acquire>
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 b5 10 80       	push   $0x8010b520
80100647:	e8 54 42 00 00       	call   801048a0 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 6b 10 00 00       	call   801016c0 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 b5 10 80       	mov    0x8010b554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100673:	0f 85 af 01 00 00    	jne    80100828 <cprintf+0x1c8>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 b7 01 00 00    	je     8010083d <cprintf+0x1dd>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
8010068c:	31 db                	xor    %ebx,%ebx
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100691:	85 c0                	test   %eax,%eax
80100693:	75 52                	jne    801006e7 <cprintf+0x87>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	0f b6 16             	movzbl (%esi),%edx
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
801006aa:	83 fa 6c             	cmp    $0x6c,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 ca 00 00 00    	je     80100780 <cprintf+0x120>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 3f 01 00 00    	je     80100800 <cprintf+0x1a0>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	75 7d                	jne    80100743 <cprintf+0xe3>
801006c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006c9:	ba 0a 00 00 00       	mov    $0xa,%edx
801006ce:	8d 48 04             	lea    0x4(%eax),%ecx
801006d1:	8b 00                	mov    (%eax),%eax
801006d3:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006d6:	b9 01 00 00 00       	mov    $0x1,%ecx
801006db:	e8 a0 fe ff ff       	call   80100580 <printint>
801006e0:	0f b6 06             	movzbl (%esi),%eax
801006e3:	85 c0                	test   %eax,%eax
801006e5:	74 29                	je     80100710 <cprintf+0xb0>
801006e7:	8d 53 01             	lea    0x1(%ebx),%edx
801006ea:	83 f8 25             	cmp    $0x25,%eax
801006ed:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f0:	74 ae                	je     801006a0 <cprintf+0x40>
801006f2:	89 55 e0             	mov    %edx,-0x20(%ebp)
801006f5:	e8 16 fd ff ff       	call   80100410 <consputc>
801006fa:	0f b6 06             	movzbl (%esi),%eax
801006fd:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100700:	89 d3                	mov    %edx,%ebx
80100702:	85 c0                	test   %eax,%eax
80100704:	75 e1                	jne    801006e7 <cprintf+0x87>
80100706:	8d 76 00             	lea    0x0(%esi),%esi
80100709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 b5 10 80       	push   $0x8010b520
8010071f:	e8 7c 41 00 00       	call   801048a0 <release>
80100724:	83 c4 10             	add    $0x10,%esp
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	0f 84 7f 00 00 00    	je     801007b8 <cprintf+0x158>
80100739:	83 fa 78             	cmp    $0x78,%edx
8010073c:	74 22                	je     80100760 <cprintf+0x100>
8010073e:	83 fa 70             	cmp    $0x70,%edx
80100741:	74 1d                	je     80100760 <cprintf+0x100>
80100743:	b8 25 00 00 00       	mov    $0x25,%eax
80100748:	89 55 e0             	mov    %edx,-0x20(%ebp)
8010074b:	e8 c0 fc ff ff       	call   80100410 <consputc>
80100750:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100753:	89 d0                	mov    %edx,%eax
80100755:	e8 b6 fc ff ff       	call   80100410 <consputc>
8010075a:	eb 84                	jmp    801006e0 <cprintf+0x80>
8010075c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100760:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100763:	ba 10 00 00 00       	mov    $0x10,%edx
80100768:	8d 48 04             	lea    0x4(%eax),%ecx
8010076b:	8b 00                	mov    (%eax),%eax
8010076d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100770:	31 c9                	xor    %ecx,%ecx
80100772:	e8 09 fe ff ff       	call   80100580 <printint>
80100777:	e9 64 ff ff ff       	jmp    801006e0 <cprintf+0x80>
8010077c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100780:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100783:	8b 08                	mov    (%eax),%ecx
80100785:	8b 40 04             	mov    0x4(%eax),%eax
80100788:	85 c0                	test   %eax,%eax
8010078a:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010078d:	74 0c                	je     8010079b <cprintf+0x13b>
8010078f:	31 c9                	xor    %ecx,%ecx
80100791:	ba 10 00 00 00       	mov    $0x10,%edx
80100796:	e8 e5 fd ff ff       	call   80100580 <printint>
8010079b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010079e:	31 c9                	xor    %ecx,%ecx
801007a0:	ba 10 00 00 00       	mov    $0x10,%edx
801007a5:	e8 d6 fd ff ff       	call   80100580 <printint>
801007aa:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
801007ae:	e9 2d ff ff ff       	jmp    801006e0 <cprintf+0x80>
801007b3:	90                   	nop
801007b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801007b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801007bb:	8b 10                	mov    (%eax),%edx
801007bd:	8d 48 04             	lea    0x4(%eax),%ecx
801007c0:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801007c3:	85 d2                	test   %edx,%edx
801007c5:	74 49                	je     80100810 <cprintf+0x1b0>
801007c7:	0f be 02             	movsbl (%edx),%eax
801007ca:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801007cd:	84 c0                	test   %al,%al
801007cf:	0f 84 0b ff ff ff    	je     801006e0 <cprintf+0x80>
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	89 d3                	mov    %edx,%ebx
801007da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007e0:	83 c3 01             	add    $0x1,%ebx
801007e3:	e8 28 fc ff ff       	call   80100410 <consputc>
801007e8:	0f be 03             	movsbl (%ebx),%eax
801007eb:	84 c0                	test   %al,%al
801007ed:	75 f1                	jne    801007e0 <cprintf+0x180>
801007ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007f2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007f8:	e9 e3 fe ff ff       	jmp    801006e0 <cprintf+0x80>
801007fd:	8d 76 00             	lea    0x0(%esi),%esi
80100800:	b8 25 00 00 00       	mov    $0x25,%eax
80100805:	e8 06 fc ff ff       	call   80100410 <consputc>
8010080a:	e9 d1 fe ff ff       	jmp    801006e0 <cprintf+0x80>
8010080f:	90                   	nop
80100810:	ba 78 79 10 80       	mov    $0x80107978,%edx
80100815:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100818:	b8 28 00 00 00       	mov    $0x28,%eax
8010081d:	89 d3                	mov    %edx,%ebx
8010081f:	eb bf                	jmp    801007e0 <cprintf+0x180>
80100821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100828:	83 ec 0c             	sub    $0xc,%esp
8010082b:	68 20 b5 10 80       	push   $0x8010b520
80100830:	e8 ab 3f 00 00       	call   801047e0 <acquire>
80100835:	83 c4 10             	add    $0x10,%esp
80100838:	e9 3c fe ff ff       	jmp    80100679 <cprintf+0x19>
8010083d:	83 ec 0c             	sub    $0xc,%esp
80100840:	68 7f 79 10 80       	push   $0x8010797f
80100845:	e8 46 fb ff ff       	call   80100390 <panic>
8010084a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100850 <consoleintr>:
80100850:	55                   	push   %ebp
80100851:	89 e5                	mov    %esp,%ebp
80100853:	57                   	push   %edi
80100854:	56                   	push   %esi
80100855:	53                   	push   %ebx
80100856:	31 f6                	xor    %esi,%esi
80100858:	83 ec 18             	sub    $0x18,%esp
8010085b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010085e:	68 20 b5 10 80       	push   $0x8010b520
80100863:	e8 78 3f 00 00       	call   801047e0 <acquire>
80100868:	83 c4 10             	add    $0x10,%esp
8010086b:	90                   	nop
8010086c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	78 48                	js     801008c0 <consoleintr+0x70>
80100878:	83 ff 10             	cmp    $0x10,%edi
8010087b:	0f 84 e7 00 00 00    	je     80100968 <consoleintr+0x118>
80100881:	7e 5d                	jle    801008e0 <consoleintr+0x90>
80100883:	83 ff 15             	cmp    $0x15,%edi
80100886:	0f 84 ec 00 00 00    	je     80100978 <consoleintr+0x128>
8010088c:	83 ff 7f             	cmp    $0x7f,%edi
8010088f:	75 54                	jne    801008e5 <consoleintr+0x95>
80100891:	a1 88 19 11 80       	mov    0x80111988,%eax
80100896:	3b 05 84 19 11 80    	cmp    0x80111984,%eax
8010089c:	74 d2                	je     80100870 <consoleintr+0x20>
8010089e:	83 e8 01             	sub    $0x1,%eax
801008a1:	a3 88 19 11 80       	mov    %eax,0x80111988
801008a6:	b8 00 01 00 00       	mov    $0x100,%eax
801008ab:	e8 60 fb ff ff       	call   80100410 <consputc>
801008b0:	ff d3                	call   *%ebx
801008b2:	85 c0                	test   %eax,%eax
801008b4:	89 c7                	mov    %eax,%edi
801008b6:	79 c0                	jns    80100878 <consoleintr+0x28>
801008b8:	90                   	nop
801008b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801008c0:	83 ec 0c             	sub    $0xc,%esp
801008c3:	68 20 b5 10 80       	push   $0x8010b520
801008c8:	e8 d3 3f 00 00       	call   801048a0 <release>
801008cd:	83 c4 10             	add    $0x10,%esp
801008d0:	85 f6                	test   %esi,%esi
801008d2:	0f 85 f8 00 00 00    	jne    801009d0 <consoleintr+0x180>
801008d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801008db:	5b                   	pop    %ebx
801008dc:	5e                   	pop    %esi
801008dd:	5f                   	pop    %edi
801008de:	5d                   	pop    %ebp
801008df:	c3                   	ret    
801008e0:	83 ff 08             	cmp    $0x8,%edi
801008e3:	74 ac                	je     80100891 <consoleintr+0x41>
801008e5:	85 ff                	test   %edi,%edi
801008e7:	74 87                	je     80100870 <consoleintr+0x20>
801008e9:	a1 88 19 11 80       	mov    0x80111988,%eax
801008ee:	89 c2                	mov    %eax,%edx
801008f0:	2b 15 80 19 11 80    	sub    0x80111980,%edx
801008f6:	83 fa 7f             	cmp    $0x7f,%edx
801008f9:	0f 87 71 ff ff ff    	ja     80100870 <consoleintr+0x20>
801008ff:	8d 50 01             	lea    0x1(%eax),%edx
80100902:	83 e0 7f             	and    $0x7f,%eax
80100905:	83 ff 0d             	cmp    $0xd,%edi
80100908:	89 15 88 19 11 80    	mov    %edx,0x80111988
8010090e:	0f 84 cc 00 00 00    	je     801009e0 <consoleintr+0x190>
80100914:	89 f9                	mov    %edi,%ecx
80100916:	88 88 00 19 11 80    	mov    %cl,-0x7feee700(%eax)
8010091c:	89 f8                	mov    %edi,%eax
8010091e:	e8 ed fa ff ff       	call   80100410 <consputc>
80100923:	83 ff 0a             	cmp    $0xa,%edi
80100926:	0f 84 c5 00 00 00    	je     801009f1 <consoleintr+0x1a1>
8010092c:	83 ff 04             	cmp    $0x4,%edi
8010092f:	0f 84 bc 00 00 00    	je     801009f1 <consoleintr+0x1a1>
80100935:	a1 80 19 11 80       	mov    0x80111980,%eax
8010093a:	83 e8 80             	sub    $0xffffff80,%eax
8010093d:	39 05 88 19 11 80    	cmp    %eax,0x80111988
80100943:	0f 85 27 ff ff ff    	jne    80100870 <consoleintr+0x20>
80100949:	83 ec 0c             	sub    $0xc,%esp
8010094c:	a3 84 19 11 80       	mov    %eax,0x80111984
80100951:	68 80 19 11 80       	push   $0x80111980
80100956:	e8 25 37 00 00       	call   80104080 <wakeup>
8010095b:	83 c4 10             	add    $0x10,%esp
8010095e:	e9 0d ff ff ff       	jmp    80100870 <consoleintr+0x20>
80100963:	90                   	nop
80100964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100968:	be 01 00 00 00       	mov    $0x1,%esi
8010096d:	e9 fe fe ff ff       	jmp    80100870 <consoleintr+0x20>
80100972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100978:	a1 88 19 11 80       	mov    0x80111988,%eax
8010097d:	39 05 84 19 11 80    	cmp    %eax,0x80111984
80100983:	75 2b                	jne    801009b0 <consoleintr+0x160>
80100985:	e9 e6 fe ff ff       	jmp    80100870 <consoleintr+0x20>
8010098a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100990:	a3 88 19 11 80       	mov    %eax,0x80111988
80100995:	b8 00 01 00 00       	mov    $0x100,%eax
8010099a:	e8 71 fa ff ff       	call   80100410 <consputc>
8010099f:	a1 88 19 11 80       	mov    0x80111988,%eax
801009a4:	3b 05 84 19 11 80    	cmp    0x80111984,%eax
801009aa:	0f 84 c0 fe ff ff    	je     80100870 <consoleintr+0x20>
801009b0:	83 e8 01             	sub    $0x1,%eax
801009b3:	89 c2                	mov    %eax,%edx
801009b5:	83 e2 7f             	and    $0x7f,%edx
801009b8:	80 ba 00 19 11 80 0a 	cmpb   $0xa,-0x7feee700(%edx)
801009bf:	75 cf                	jne    80100990 <consoleintr+0x140>
801009c1:	e9 aa fe ff ff       	jmp    80100870 <consoleintr+0x20>
801009c6:	8d 76 00             	lea    0x0(%esi),%esi
801009c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801009d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009d3:	5b                   	pop    %ebx
801009d4:	5e                   	pop    %esi
801009d5:	5f                   	pop    %edi
801009d6:	5d                   	pop    %ebp
801009d7:	e9 64 38 00 00       	jmp    80104240 <procdump>
801009dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801009e0:	c6 80 00 19 11 80 0a 	movb   $0xa,-0x7feee700(%eax)
801009e7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ec:	e8 1f fa ff ff       	call   80100410 <consputc>
801009f1:	a1 88 19 11 80       	mov    0x80111988,%eax
801009f6:	e9 4e ff ff ff       	jmp    80100949 <consoleintr+0xf9>
801009fb:	90                   	nop
801009fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100a00 <consoleinit>:
80100a00:	55                   	push   %ebp
80100a01:	89 e5                	mov    %esp,%ebp
80100a03:	83 ec 10             	sub    $0x10,%esp
80100a06:	68 88 79 10 80       	push   $0x80107988
80100a0b:	68 20 b5 10 80       	push   $0x8010b520
80100a10:	e8 8b 3c 00 00       	call   801046a0 <initlock>
80100a15:	58                   	pop    %eax
80100a16:	5a                   	pop    %edx
80100a17:	6a 00                	push   $0x0
80100a19:	6a 01                	push   $0x1
80100a1b:	c7 05 4c 23 11 80 00 	movl   $0x80100600,0x8011234c
80100a22:	06 10 80 
80100a25:	c7 05 48 23 11 80 70 	movl   $0x80100270,0x80112348
80100a2c:	02 10 80 
80100a2f:	c7 05 54 b5 10 80 01 	movl   $0x1,0x8010b554
80100a36:	00 00 00 
80100a39:	e8 d2 18 00 00       	call   80102310 <ioapicenable>
80100a3e:	83 c4 10             	add    $0x10,%esp
80100a41:	c9                   	leave  
80100a42:	c3                   	ret    
80100a43:	66 90                	xchg   %ax,%ax
80100a45:	66 90                	xchg   %ax,%ax
80100a47:	66 90                	xchg   %ax,%ax
80100a49:	66 90                	xchg   %ax,%ax
80100a4b:	66 90                	xchg   %ax,%ax
80100a4d:	66 90                	xchg   %ax,%ax
80100a4f:	90                   	nop

80100a50 <exec>:
80100a50:	55                   	push   %ebp
80100a51:	89 e5                	mov    %esp,%ebp
80100a53:	57                   	push   %edi
80100a54:	56                   	push   %esi
80100a55:	53                   	push   %ebx
80100a56:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100a5c:	e8 3f 2e 00 00       	call   801038a0 <myproc>
80100a61:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a67:	e8 c4 21 00 00       	call   80102c30 <begin_op>
80100a6c:	83 ec 0c             	sub    $0xc,%esp
80100a6f:	ff 75 08             	pushl  0x8(%ebp)
80100a72:	e8 a9 14 00 00       	call   80101f20 <namei>
80100a77:	83 c4 10             	add    $0x10,%esp
80100a7a:	85 c0                	test   %eax,%eax
80100a7c:	0f 84 99 01 00 00    	je     80100c1b <exec+0x1cb>
80100a82:	83 ec 0c             	sub    $0xc,%esp
80100a85:	89 c3                	mov    %eax,%ebx
80100a87:	50                   	push   %eax
80100a88:	e8 33 0c 00 00       	call   801016c0 <ilock>
80100a8d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a93:	6a 34                	push   $0x34
80100a95:	6a 00                	push   $0x0
80100a97:	50                   	push   %eax
80100a98:	53                   	push   %ebx
80100a99:	e8 02 0f 00 00       	call   801019a0 <readi>
80100a9e:	83 c4 20             	add    $0x20,%esp
80100aa1:	83 f8 34             	cmp    $0x34,%eax
80100aa4:	74 22                	je     80100ac8 <exec+0x78>
80100aa6:	83 ec 0c             	sub    $0xc,%esp
80100aa9:	53                   	push   %ebx
80100aaa:	e8 a1 0e 00 00       	call   80101950 <iunlockput>
80100aaf:	e8 ec 21 00 00       	call   80102ca0 <end_op>
80100ab4:	83 c4 10             	add    $0x10,%esp
80100ab7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100abc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100abf:	5b                   	pop    %ebx
80100ac0:	5e                   	pop    %esi
80100ac1:	5f                   	pop    %edi
80100ac2:	5d                   	pop    %ebp
80100ac3:	c3                   	ret    
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ac8:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100acf:	45 4c 46 
80100ad2:	75 d2                	jne    80100aa6 <exec+0x56>
80100ad4:	e8 07 68 00 00       	call   801072e0 <setupkvm>
80100ad9:	85 c0                	test   %eax,%eax
80100adb:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100ae1:	74 c3                	je     80100aa6 <exec+0x56>
80100ae3:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aea:	00 
80100aeb:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100af1:	bf 00 10 00 00       	mov    $0x1000,%edi
80100af6:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100afc:	0f 84 91 02 00 00    	je     80100d93 <exec+0x343>
80100b02:	31 f6                	xor    %esi,%esi
80100b04:	e9 81 00 00 00       	jmp    80100b8a <exec+0x13a>
80100b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100b10:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b17:	75 63                	jne    80100b7c <exec+0x12c>
80100b19:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b1f:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b25:	0f 82 86 00 00 00    	jb     80100bb1 <exec+0x161>
80100b2b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b31:	72 7e                	jb     80100bb1 <exec+0x161>
80100b33:	83 ec 04             	sub    $0x4,%esp
80100b36:	50                   	push   %eax
80100b37:	57                   	push   %edi
80100b38:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3e:	e8 bd 65 00 00       	call   80107100 <allocuvm>
80100b43:	83 c4 10             	add    $0x10,%esp
80100b46:	85 c0                	test   %eax,%eax
80100b48:	89 c7                	mov    %eax,%edi
80100b4a:	74 65                	je     80100bb1 <exec+0x161>
80100b4c:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b52:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b57:	75 58                	jne    80100bb1 <exec+0x161>
80100b59:	83 ec 0c             	sub    $0xc,%esp
80100b5c:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b62:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b68:	53                   	push   %ebx
80100b69:	50                   	push   %eax
80100b6a:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b70:	e8 cb 64 00 00       	call   80107040 <loaduvm>
80100b75:	83 c4 20             	add    $0x20,%esp
80100b78:	85 c0                	test   %eax,%eax
80100b7a:	78 35                	js     80100bb1 <exec+0x161>
80100b7c:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b83:	83 c6 01             	add    $0x1,%esi
80100b86:	39 f0                	cmp    %esi,%eax
80100b88:	7e 3d                	jle    80100bc7 <exec+0x177>
80100b8a:	89 f0                	mov    %esi,%eax
80100b8c:	6a 20                	push   $0x20
80100b8e:	c1 e0 05             	shl    $0x5,%eax
80100b91:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b97:	50                   	push   %eax
80100b98:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b9e:	50                   	push   %eax
80100b9f:	53                   	push   %ebx
80100ba0:	e8 fb 0d 00 00       	call   801019a0 <readi>
80100ba5:	83 c4 10             	add    $0x10,%esp
80100ba8:	83 f8 20             	cmp    $0x20,%eax
80100bab:	0f 84 5f ff ff ff    	je     80100b10 <exec+0xc0>
80100bb1:	83 ec 0c             	sub    $0xc,%esp
80100bb4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bba:	e8 a1 66 00 00       	call   80107260 <freevm>
80100bbf:	83 c4 10             	add    $0x10,%esp
80100bc2:	e9 df fe ff ff       	jmp    80100aa6 <exec+0x56>
80100bc7:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100bcd:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100bd3:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
80100bd9:	83 ec 0c             	sub    $0xc,%esp
80100bdc:	53                   	push   %ebx
80100bdd:	e8 6e 0d 00 00       	call   80101950 <iunlockput>
80100be2:	e8 b9 20 00 00       	call   80102ca0 <end_op>
80100be7:	83 c4 0c             	add    $0xc,%esp
80100bea:	56                   	push   %esi
80100beb:	57                   	push   %edi
80100bec:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf2:	e8 09 65 00 00       	call   80107100 <allocuvm>
80100bf7:	83 c4 10             	add    $0x10,%esp
80100bfa:	85 c0                	test   %eax,%eax
80100bfc:	89 c6                	mov    %eax,%esi
80100bfe:	75 3a                	jne    80100c3a <exec+0x1ea>
80100c00:	83 ec 0c             	sub    $0xc,%esp
80100c03:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c09:	e8 52 66 00 00       	call   80107260 <freevm>
80100c0e:	83 c4 10             	add    $0x10,%esp
80100c11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c16:	e9 a1 fe ff ff       	jmp    80100abc <exec+0x6c>
80100c1b:	e8 80 20 00 00       	call   80102ca0 <end_op>
80100c20:	83 ec 0c             	sub    $0xc,%esp
80100c23:	68 a1 79 10 80       	push   $0x801079a1
80100c28:	e8 33 fa ff ff       	call   80100660 <cprintf>
80100c2d:	83 c4 10             	add    $0x10,%esp
80100c30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c35:	e9 82 fe ff ff       	jmp    80100abc <exec+0x6c>
80100c3a:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100c40:	83 ec 08             	sub    $0x8,%esp
80100c43:	31 ff                	xor    %edi,%edi
80100c45:	89 f3                	mov    %esi,%ebx
80100c47:	50                   	push   %eax
80100c48:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c4e:	e8 2d 67 00 00       	call   80107380 <clearpteu>
80100c53:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c56:	83 c4 10             	add    $0x10,%esp
80100c59:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c5f:	8b 00                	mov    (%eax),%eax
80100c61:	85 c0                	test   %eax,%eax
80100c63:	74 70                	je     80100cd5 <exec+0x285>
80100c65:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c6b:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c71:	eb 0a                	jmp    80100c7d <exec+0x22d>
80100c73:	90                   	nop
80100c74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c78:	83 ff 20             	cmp    $0x20,%edi
80100c7b:	74 83                	je     80100c00 <exec+0x1b0>
80100c7d:	83 ec 0c             	sub    $0xc,%esp
80100c80:	50                   	push   %eax
80100c81:	e8 8a 3e 00 00       	call   80104b10 <strlen>
80100c86:	f7 d0                	not    %eax
80100c88:	01 c3                	add    %eax,%ebx
80100c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8d:	5a                   	pop    %edx
80100c8e:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c91:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c94:	e8 77 3e 00 00       	call   80104b10 <strlen>
80100c99:	83 c0 01             	add    $0x1,%eax
80100c9c:	50                   	push   %eax
80100c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100ca0:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ca3:	53                   	push   %ebx
80100ca4:	56                   	push   %esi
80100ca5:	e8 36 68 00 00       	call   801074e0 <copyout>
80100caa:	83 c4 20             	add    $0x20,%esp
80100cad:	85 c0                	test   %eax,%eax
80100caf:	0f 88 4b ff ff ff    	js     80100c00 <exec+0x1b0>
80100cb5:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cb8:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100cbf:	83 c7 01             	add    $0x1,%edi
80100cc2:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100cc8:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100ccb:	85 c0                	test   %eax,%eax
80100ccd:	75 a9                	jne    80100c78 <exec+0x228>
80100ccf:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100cd5:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100cdc:	89 d9                	mov    %ebx,%ecx
80100cde:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100ce5:	00 00 00 00 
80100ce9:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100cf0:	ff ff ff 
80100cf3:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100cf9:	29 c1                	sub    %eax,%ecx
80100cfb:	83 c0 0c             	add    $0xc,%eax
80100cfe:	29 c3                	sub    %eax,%ebx
80100d00:	50                   	push   %eax
80100d01:	52                   	push   %edx
80100d02:	53                   	push   %ebx
80100d03:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100d09:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100d0f:	e8 cc 67 00 00       	call   801074e0 <copyout>
80100d14:	83 c4 10             	add    $0x10,%esp
80100d17:	85 c0                	test   %eax,%eax
80100d19:	0f 88 e1 fe ff ff    	js     80100c00 <exec+0x1b0>
80100d1f:	8b 45 08             	mov    0x8(%ebp),%eax
80100d22:	0f b6 00             	movzbl (%eax),%eax
80100d25:	84 c0                	test   %al,%al
80100d27:	74 17                	je     80100d40 <exec+0x2f0>
80100d29:	8b 55 08             	mov    0x8(%ebp),%edx
80100d2c:	89 d1                	mov    %edx,%ecx
80100d2e:	83 c1 01             	add    $0x1,%ecx
80100d31:	3c 2f                	cmp    $0x2f,%al
80100d33:	0f b6 01             	movzbl (%ecx),%eax
80100d36:	0f 44 d1             	cmove  %ecx,%edx
80100d39:	84 c0                	test   %al,%al
80100d3b:	75 f1                	jne    80100d2e <exec+0x2de>
80100d3d:	89 55 08             	mov    %edx,0x8(%ebp)
80100d40:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100d46:	50                   	push   %eax
80100d47:	6a 10                	push   $0x10
80100d49:	ff 75 08             	pushl  0x8(%ebp)
80100d4c:	89 f8                	mov    %edi,%eax
80100d4e:	83 c0 6c             	add    $0x6c,%eax
80100d51:	50                   	push   %eax
80100d52:	e8 79 3d 00 00       	call   80104ad0 <safestrcpy>
80100d57:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
80100d5d:	89 f9                	mov    %edi,%ecx
80100d5f:	8b 7f 04             	mov    0x4(%edi),%edi
80100d62:	8b 41 18             	mov    0x18(%ecx),%eax
80100d65:	89 31                	mov    %esi,(%ecx)
80100d67:	89 51 04             	mov    %edx,0x4(%ecx)
80100d6a:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d70:	89 50 38             	mov    %edx,0x38(%eax)
80100d73:	8b 41 18             	mov    0x18(%ecx),%eax
80100d76:	89 58 44             	mov    %ebx,0x44(%eax)
80100d79:	89 0c 24             	mov    %ecx,(%esp)
80100d7c:	e8 2f 61 00 00       	call   80106eb0 <switchuvm>
80100d81:	89 3c 24             	mov    %edi,(%esp)
80100d84:	e8 d7 64 00 00       	call   80107260 <freevm>
80100d89:	83 c4 10             	add    $0x10,%esp
80100d8c:	31 c0                	xor    %eax,%eax
80100d8e:	e9 29 fd ff ff       	jmp    80100abc <exec+0x6c>
80100d93:	be 00 30 00 00       	mov    $0x3000,%esi
80100d98:	e9 3c fe ff ff       	jmp    80100bd9 <exec+0x189>
80100d9d:	66 90                	xchg   %ax,%ax
80100d9f:	90                   	nop

80100da0 <fileinit>:
80100da0:	55                   	push   %ebp
80100da1:	89 e5                	mov    %esp,%ebp
80100da3:	83 ec 10             	sub    $0x10,%esp
80100da6:	68 ad 79 10 80       	push   $0x801079ad
80100dab:	68 a0 19 11 80       	push   $0x801119a0
80100db0:	e8 eb 38 00 00       	call   801046a0 <initlock>
80100db5:	83 c4 10             	add    $0x10,%esp
80100db8:	c9                   	leave  
80100db9:	c3                   	ret    
80100dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100dc0 <filealloc>:
80100dc0:	55                   	push   %ebp
80100dc1:	89 e5                	mov    %esp,%ebp
80100dc3:	53                   	push   %ebx
80100dc4:	bb d4 19 11 80       	mov    $0x801119d4,%ebx
80100dc9:	83 ec 10             	sub    $0x10,%esp
80100dcc:	68 a0 19 11 80       	push   $0x801119a0
80100dd1:	e8 0a 3a 00 00       	call   801047e0 <acquire>
80100dd6:	83 c4 10             	add    $0x10,%esp
80100dd9:	eb 10                	jmp    80100deb <filealloc+0x2b>
80100ddb:	90                   	nop
80100ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100de0:	83 c3 18             	add    $0x18,%ebx
80100de3:	81 fb 34 23 11 80    	cmp    $0x80112334,%ebx
80100de9:	73 25                	jae    80100e10 <filealloc+0x50>
80100deb:	8b 43 04             	mov    0x4(%ebx),%eax
80100dee:	85 c0                	test   %eax,%eax
80100df0:	75 ee                	jne    80100de0 <filealloc+0x20>
80100df2:	83 ec 0c             	sub    $0xc,%esp
80100df5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dfc:	68 a0 19 11 80       	push   $0x801119a0
80100e01:	e8 9a 3a 00 00       	call   801048a0 <release>
80100e06:	89 d8                	mov    %ebx,%eax
80100e08:	83 c4 10             	add    $0x10,%esp
80100e0b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e0e:	c9                   	leave  
80100e0f:	c3                   	ret    
80100e10:	83 ec 0c             	sub    $0xc,%esp
80100e13:	31 db                	xor    %ebx,%ebx
80100e15:	68 a0 19 11 80       	push   $0x801119a0
80100e1a:	e8 81 3a 00 00       	call   801048a0 <release>
80100e1f:	89 d8                	mov    %ebx,%eax
80100e21:	83 c4 10             	add    $0x10,%esp
80100e24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e27:	c9                   	leave  
80100e28:	c3                   	ret    
80100e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e30 <filedup>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	53                   	push   %ebx
80100e34:	83 ec 10             	sub    $0x10,%esp
80100e37:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e3a:	68 a0 19 11 80       	push   $0x801119a0
80100e3f:	e8 9c 39 00 00       	call   801047e0 <acquire>
80100e44:	8b 43 04             	mov    0x4(%ebx),%eax
80100e47:	83 c4 10             	add    $0x10,%esp
80100e4a:	85 c0                	test   %eax,%eax
80100e4c:	7e 1a                	jle    80100e68 <filedup+0x38>
80100e4e:	83 c0 01             	add    $0x1,%eax
80100e51:	83 ec 0c             	sub    $0xc,%esp
80100e54:	89 43 04             	mov    %eax,0x4(%ebx)
80100e57:	68 a0 19 11 80       	push   $0x801119a0
80100e5c:	e8 3f 3a 00 00       	call   801048a0 <release>
80100e61:	89 d8                	mov    %ebx,%eax
80100e63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e66:	c9                   	leave  
80100e67:	c3                   	ret    
80100e68:	83 ec 0c             	sub    $0xc,%esp
80100e6b:	68 b4 79 10 80       	push   $0x801079b4
80100e70:	e8 1b f5 ff ff       	call   80100390 <panic>
80100e75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e80 <fileclose>:
80100e80:	55                   	push   %ebp
80100e81:	89 e5                	mov    %esp,%ebp
80100e83:	57                   	push   %edi
80100e84:	56                   	push   %esi
80100e85:	53                   	push   %ebx
80100e86:	83 ec 28             	sub    $0x28,%esp
80100e89:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e8c:	68 a0 19 11 80       	push   $0x801119a0
80100e91:	e8 4a 39 00 00       	call   801047e0 <acquire>
80100e96:	8b 43 04             	mov    0x4(%ebx),%eax
80100e99:	83 c4 10             	add    $0x10,%esp
80100e9c:	85 c0                	test   %eax,%eax
80100e9e:	0f 8e 9b 00 00 00    	jle    80100f3f <fileclose+0xbf>
80100ea4:	83 e8 01             	sub    $0x1,%eax
80100ea7:	85 c0                	test   %eax,%eax
80100ea9:	89 43 04             	mov    %eax,0x4(%ebx)
80100eac:	74 1a                	je     80100ec8 <fileclose+0x48>
80100eae:	c7 45 08 a0 19 11 80 	movl   $0x801119a0,0x8(%ebp)
80100eb5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eb8:	5b                   	pop    %ebx
80100eb9:	5e                   	pop    %esi
80100eba:	5f                   	pop    %edi
80100ebb:	5d                   	pop    %ebp
80100ebc:	e9 df 39 00 00       	jmp    801048a0 <release>
80100ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100ec8:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100ecc:	8b 3b                	mov    (%ebx),%edi
80100ece:	83 ec 0c             	sub    $0xc,%esp
80100ed1:	8b 73 0c             	mov    0xc(%ebx),%esi
80100ed4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100eda:	88 45 e7             	mov    %al,-0x19(%ebp)
80100edd:	8b 43 10             	mov    0x10(%ebx),%eax
80100ee0:	68 a0 19 11 80       	push   $0x801119a0
80100ee5:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100ee8:	e8 b3 39 00 00       	call   801048a0 <release>
80100eed:	83 c4 10             	add    $0x10,%esp
80100ef0:	83 ff 01             	cmp    $0x1,%edi
80100ef3:	74 13                	je     80100f08 <fileclose+0x88>
80100ef5:	83 ff 02             	cmp    $0x2,%edi
80100ef8:	74 26                	je     80100f20 <fileclose+0xa0>
80100efa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100efd:	5b                   	pop    %ebx
80100efe:	5e                   	pop    %esi
80100eff:	5f                   	pop    %edi
80100f00:	5d                   	pop    %ebp
80100f01:	c3                   	ret    
80100f02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f08:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100f0c:	83 ec 08             	sub    $0x8,%esp
80100f0f:	53                   	push   %ebx
80100f10:	56                   	push   %esi
80100f11:	e8 ca 24 00 00       	call   801033e0 <pipeclose>
80100f16:	83 c4 10             	add    $0x10,%esp
80100f19:	eb df                	jmp    80100efa <fileclose+0x7a>
80100f1b:	90                   	nop
80100f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f20:	e8 0b 1d 00 00       	call   80102c30 <begin_op>
80100f25:	83 ec 0c             	sub    $0xc,%esp
80100f28:	ff 75 e0             	pushl  -0x20(%ebp)
80100f2b:	e8 c0 08 00 00       	call   801017f0 <iput>
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f36:	5b                   	pop    %ebx
80100f37:	5e                   	pop    %esi
80100f38:	5f                   	pop    %edi
80100f39:	5d                   	pop    %ebp
80100f3a:	e9 61 1d 00 00       	jmp    80102ca0 <end_op>
80100f3f:	83 ec 0c             	sub    $0xc,%esp
80100f42:	68 bc 79 10 80       	push   $0x801079bc
80100f47:	e8 44 f4 ff ff       	call   80100390 <panic>
80100f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f50 <filestat>:
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	53                   	push   %ebx
80100f54:	83 ec 04             	sub    $0x4,%esp
80100f57:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f5d:	75 31                	jne    80100f90 <filestat+0x40>
80100f5f:	83 ec 0c             	sub    $0xc,%esp
80100f62:	ff 73 10             	pushl  0x10(%ebx)
80100f65:	e8 56 07 00 00       	call   801016c0 <ilock>
80100f6a:	58                   	pop    %eax
80100f6b:	5a                   	pop    %edx
80100f6c:	ff 75 0c             	pushl  0xc(%ebp)
80100f6f:	ff 73 10             	pushl  0x10(%ebx)
80100f72:	e8 f9 09 00 00       	call   80101970 <stati>
80100f77:	59                   	pop    %ecx
80100f78:	ff 73 10             	pushl  0x10(%ebx)
80100f7b:	e8 20 08 00 00       	call   801017a0 <iunlock>
80100f80:	83 c4 10             	add    $0x10,%esp
80100f83:	31 c0                	xor    %eax,%eax
80100f85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f88:	c9                   	leave  
80100f89:	c3                   	ret    
80100f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f95:	eb ee                	jmp    80100f85 <filestat+0x35>
80100f97:	89 f6                	mov    %esi,%esi
80100f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fa0 <fileread>:
80100fa0:	55                   	push   %ebp
80100fa1:	89 e5                	mov    %esp,%ebp
80100fa3:	57                   	push   %edi
80100fa4:	56                   	push   %esi
80100fa5:	53                   	push   %ebx
80100fa6:	83 ec 0c             	sub    $0xc,%esp
80100fa9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fac:	8b 75 0c             	mov    0xc(%ebp),%esi
80100faf:	8b 7d 10             	mov    0x10(%ebp),%edi
80100fb2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100fb6:	74 60                	je     80101018 <fileread+0x78>
80100fb8:	8b 03                	mov    (%ebx),%eax
80100fba:	83 f8 01             	cmp    $0x1,%eax
80100fbd:	74 41                	je     80101000 <fileread+0x60>
80100fbf:	83 f8 02             	cmp    $0x2,%eax
80100fc2:	75 5b                	jne    8010101f <fileread+0x7f>
80100fc4:	83 ec 0c             	sub    $0xc,%esp
80100fc7:	ff 73 10             	pushl  0x10(%ebx)
80100fca:	e8 f1 06 00 00       	call   801016c0 <ilock>
80100fcf:	57                   	push   %edi
80100fd0:	ff 73 14             	pushl  0x14(%ebx)
80100fd3:	56                   	push   %esi
80100fd4:	ff 73 10             	pushl  0x10(%ebx)
80100fd7:	e8 c4 09 00 00       	call   801019a0 <readi>
80100fdc:	83 c4 20             	add    $0x20,%esp
80100fdf:	85 c0                	test   %eax,%eax
80100fe1:	89 c6                	mov    %eax,%esi
80100fe3:	7e 03                	jle    80100fe8 <fileread+0x48>
80100fe5:	01 43 14             	add    %eax,0x14(%ebx)
80100fe8:	83 ec 0c             	sub    $0xc,%esp
80100feb:	ff 73 10             	pushl  0x10(%ebx)
80100fee:	e8 ad 07 00 00       	call   801017a0 <iunlock>
80100ff3:	83 c4 10             	add    $0x10,%esp
80100ff6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ff9:	89 f0                	mov    %esi,%eax
80100ffb:	5b                   	pop    %ebx
80100ffc:	5e                   	pop    %esi
80100ffd:	5f                   	pop    %edi
80100ffe:	5d                   	pop    %ebp
80100fff:	c3                   	ret    
80101000:	8b 43 0c             	mov    0xc(%ebx),%eax
80101003:	89 45 08             	mov    %eax,0x8(%ebp)
80101006:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101009:	5b                   	pop    %ebx
8010100a:	5e                   	pop    %esi
8010100b:	5f                   	pop    %edi
8010100c:	5d                   	pop    %ebp
8010100d:	e9 7e 25 00 00       	jmp    80103590 <piperead>
80101012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101018:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010101d:	eb d7                	jmp    80100ff6 <fileread+0x56>
8010101f:	83 ec 0c             	sub    $0xc,%esp
80101022:	68 c6 79 10 80       	push   $0x801079c6
80101027:	e8 64 f3 ff ff       	call   80100390 <panic>
8010102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101030 <filewrite>:
80101030:	55                   	push   %ebp
80101031:	89 e5                	mov    %esp,%ebp
80101033:	57                   	push   %edi
80101034:	56                   	push   %esi
80101035:	53                   	push   %ebx
80101036:	83 ec 1c             	sub    $0x1c,%esp
80101039:	8b 75 08             	mov    0x8(%ebp),%esi
8010103c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010103f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101043:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101046:	8b 45 10             	mov    0x10(%ebp),%eax
80101049:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010104c:	0f 84 aa 00 00 00    	je     801010fc <filewrite+0xcc>
80101052:	8b 06                	mov    (%esi),%eax
80101054:	83 f8 01             	cmp    $0x1,%eax
80101057:	0f 84 c3 00 00 00    	je     80101120 <filewrite+0xf0>
8010105d:	83 f8 02             	cmp    $0x2,%eax
80101060:	0f 85 d9 00 00 00    	jne    8010113f <filewrite+0x10f>
80101066:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101069:	31 ff                	xor    %edi,%edi
8010106b:	85 c0                	test   %eax,%eax
8010106d:	7f 34                	jg     801010a3 <filewrite+0x73>
8010106f:	e9 9c 00 00 00       	jmp    80101110 <filewrite+0xe0>
80101074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101078:	01 46 14             	add    %eax,0x14(%esi)
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
80101081:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101084:	e8 17 07 00 00       	call   801017a0 <iunlock>
80101089:	e8 12 1c 00 00       	call   80102ca0 <end_op>
8010108e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101091:	83 c4 10             	add    $0x10,%esp
80101094:	39 c3                	cmp    %eax,%ebx
80101096:	0f 85 96 00 00 00    	jne    80101132 <filewrite+0x102>
8010109c:	01 df                	add    %ebx,%edi
8010109e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010a1:	7e 6d                	jle    80101110 <filewrite+0xe0>
801010a3:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801010a6:	b8 00 06 00 00       	mov    $0x600,%eax
801010ab:	29 fb                	sub    %edi,%ebx
801010ad:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
801010b3:	0f 4f d8             	cmovg  %eax,%ebx
801010b6:	e8 75 1b 00 00       	call   80102c30 <begin_op>
801010bb:	83 ec 0c             	sub    $0xc,%esp
801010be:	ff 76 10             	pushl  0x10(%esi)
801010c1:	e8 fa 05 00 00       	call   801016c0 <ilock>
801010c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010c9:	53                   	push   %ebx
801010ca:	ff 76 14             	pushl  0x14(%esi)
801010cd:	01 f8                	add    %edi,%eax
801010cf:	50                   	push   %eax
801010d0:	ff 76 10             	pushl  0x10(%esi)
801010d3:	e8 c8 09 00 00       	call   80101aa0 <writei>
801010d8:	83 c4 20             	add    $0x20,%esp
801010db:	85 c0                	test   %eax,%eax
801010dd:	7f 99                	jg     80101078 <filewrite+0x48>
801010df:	83 ec 0c             	sub    $0xc,%esp
801010e2:	ff 76 10             	pushl  0x10(%esi)
801010e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010e8:	e8 b3 06 00 00       	call   801017a0 <iunlock>
801010ed:	e8 ae 1b 00 00       	call   80102ca0 <end_op>
801010f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010f5:	83 c4 10             	add    $0x10,%esp
801010f8:	85 c0                	test   %eax,%eax
801010fa:	74 98                	je     80101094 <filewrite+0x64>
801010fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010ff:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80101104:	89 f8                	mov    %edi,%eax
80101106:	5b                   	pop    %ebx
80101107:	5e                   	pop    %esi
80101108:	5f                   	pop    %edi
80101109:	5d                   	pop    %ebp
8010110a:	c3                   	ret    
8010110b:	90                   	nop
8010110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101110:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101113:	75 e7                	jne    801010fc <filewrite+0xcc>
80101115:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101118:	89 f8                	mov    %edi,%eax
8010111a:	5b                   	pop    %ebx
8010111b:	5e                   	pop    %esi
8010111c:	5f                   	pop    %edi
8010111d:	5d                   	pop    %ebp
8010111e:	c3                   	ret    
8010111f:	90                   	nop
80101120:	8b 46 0c             	mov    0xc(%esi),%eax
80101123:	89 45 08             	mov    %eax,0x8(%ebp)
80101126:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101129:	5b                   	pop    %ebx
8010112a:	5e                   	pop    %esi
8010112b:	5f                   	pop    %edi
8010112c:	5d                   	pop    %ebp
8010112d:	e9 4e 23 00 00       	jmp    80103480 <pipewrite>
80101132:	83 ec 0c             	sub    $0xc,%esp
80101135:	68 cf 79 10 80       	push   $0x801079cf
8010113a:	e8 51 f2 ff ff       	call   80100390 <panic>
8010113f:	83 ec 0c             	sub    $0xc,%esp
80101142:	68 d5 79 10 80       	push   $0x801079d5
80101147:	e8 44 f2 ff ff       	call   80100390 <panic>
8010114c:	66 90                	xchg   %ax,%ax
8010114e:	66 90                	xchg   %ax,%ax

80101150 <bfree>:
80101150:	55                   	push   %ebp
80101151:	89 e5                	mov    %esp,%ebp
80101153:	56                   	push   %esi
80101154:	53                   	push   %ebx
80101155:	89 d3                	mov    %edx,%ebx
80101157:	c1 ea 0c             	shr    $0xc,%edx
8010115a:	03 15 b8 23 11 80    	add    0x801123b8,%edx
80101160:	83 ec 08             	sub    $0x8,%esp
80101163:	52                   	push   %edx
80101164:	50                   	push   %eax
80101165:	e8 66 ef ff ff       	call   801000d0 <bread>
8010116a:	89 d9                	mov    %ebx,%ecx
8010116c:	c1 fb 03             	sar    $0x3,%ebx
8010116f:	ba 01 00 00 00       	mov    $0x1,%edx
80101174:	83 e1 07             	and    $0x7,%ecx
80101177:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010117d:	83 c4 10             	add    $0x10,%esp
80101180:	d3 e2                	shl    %cl,%edx
80101182:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101187:	85 d1                	test   %edx,%ecx
80101189:	74 25                	je     801011b0 <bfree+0x60>
8010118b:	f7 d2                	not    %edx
8010118d:	89 c6                	mov    %eax,%esi
8010118f:	83 ec 0c             	sub    $0xc,%esp
80101192:	21 ca                	and    %ecx,%edx
80101194:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
80101198:	56                   	push   %esi
80101199:	e8 62 1c 00 00       	call   80102e00 <log_write>
8010119e:	89 34 24             	mov    %esi,(%esp)
801011a1:	e8 3a f0 ff ff       	call   801001e0 <brelse>
801011a6:	83 c4 10             	add    $0x10,%esp
801011a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801011ac:	5b                   	pop    %ebx
801011ad:	5e                   	pop    %esi
801011ae:	5d                   	pop    %ebp
801011af:	c3                   	ret    
801011b0:	83 ec 0c             	sub    $0xc,%esp
801011b3:	68 df 79 10 80       	push   $0x801079df
801011b8:	e8 d3 f1 ff ff       	call   80100390 <panic>
801011bd:	8d 76 00             	lea    0x0(%esi),%esi

801011c0 <balloc>:
801011c0:	55                   	push   %ebp
801011c1:	89 e5                	mov    %esp,%ebp
801011c3:	57                   	push   %edi
801011c4:	56                   	push   %esi
801011c5:	53                   	push   %ebx
801011c6:	83 ec 1c             	sub    $0x1c,%esp
801011c9:	8b 0d a0 23 11 80    	mov    0x801123a0,%ecx
801011cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
801011d2:	85 c9                	test   %ecx,%ecx
801011d4:	0f 84 87 00 00 00    	je     80101261 <balloc+0xa1>
801011da:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
801011e1:	8b 75 dc             	mov    -0x24(%ebp),%esi
801011e4:	83 ec 08             	sub    $0x8,%esp
801011e7:	89 f0                	mov    %esi,%eax
801011e9:	c1 f8 0c             	sar    $0xc,%eax
801011ec:	03 05 b8 23 11 80    	add    0x801123b8,%eax
801011f2:	50                   	push   %eax
801011f3:	ff 75 d8             	pushl  -0x28(%ebp)
801011f6:	e8 d5 ee ff ff       	call   801000d0 <bread>
801011fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801011fe:	a1 a0 23 11 80       	mov    0x801123a0,%eax
80101203:	83 c4 10             	add    $0x10,%esp
80101206:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101209:	31 c0                	xor    %eax,%eax
8010120b:	eb 2f                	jmp    8010123c <balloc+0x7c>
8010120d:	8d 76 00             	lea    0x0(%esi),%esi
80101210:	89 c1                	mov    %eax,%ecx
80101212:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101215:	bb 01 00 00 00       	mov    $0x1,%ebx
8010121a:	83 e1 07             	and    $0x7,%ecx
8010121d:	d3 e3                	shl    %cl,%ebx
8010121f:	89 c1                	mov    %eax,%ecx
80101221:	c1 f9 03             	sar    $0x3,%ecx
80101224:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101229:	85 df                	test   %ebx,%edi
8010122b:	89 fa                	mov    %edi,%edx
8010122d:	74 41                	je     80101270 <balloc+0xb0>
8010122f:	83 c0 01             	add    $0x1,%eax
80101232:	83 c6 01             	add    $0x1,%esi
80101235:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010123a:	74 05                	je     80101241 <balloc+0x81>
8010123c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010123f:	77 cf                	ja     80101210 <balloc+0x50>
80101241:	83 ec 0c             	sub    $0xc,%esp
80101244:	ff 75 e4             	pushl  -0x1c(%ebp)
80101247:	e8 94 ef ff ff       	call   801001e0 <brelse>
8010124c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101253:	83 c4 10             	add    $0x10,%esp
80101256:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101259:	39 05 a0 23 11 80    	cmp    %eax,0x801123a0
8010125f:	77 80                	ja     801011e1 <balloc+0x21>
80101261:	83 ec 0c             	sub    $0xc,%esp
80101264:	68 f2 79 10 80       	push   $0x801079f2
80101269:	e8 22 f1 ff ff       	call   80100390 <panic>
8010126e:	66 90                	xchg   %ax,%ax
80101270:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101273:	83 ec 0c             	sub    $0xc,%esp
80101276:	09 da                	or     %ebx,%edx
80101278:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
8010127c:	57                   	push   %edi
8010127d:	e8 7e 1b 00 00       	call   80102e00 <log_write>
80101282:	89 3c 24             	mov    %edi,(%esp)
80101285:	e8 56 ef ff ff       	call   801001e0 <brelse>
8010128a:	58                   	pop    %eax
8010128b:	5a                   	pop    %edx
8010128c:	56                   	push   %esi
8010128d:	ff 75 d8             	pushl  -0x28(%ebp)
80101290:	e8 3b ee ff ff       	call   801000d0 <bread>
80101295:	89 c3                	mov    %eax,%ebx
80101297:	8d 40 5c             	lea    0x5c(%eax),%eax
8010129a:	83 c4 0c             	add    $0xc,%esp
8010129d:	68 00 02 00 00       	push   $0x200
801012a2:	6a 00                	push   $0x0
801012a4:	50                   	push   %eax
801012a5:	e8 46 36 00 00       	call   801048f0 <memset>
801012aa:	89 1c 24             	mov    %ebx,(%esp)
801012ad:	e8 4e 1b 00 00       	call   80102e00 <log_write>
801012b2:	89 1c 24             	mov    %ebx,(%esp)
801012b5:	e8 26 ef ff ff       	call   801001e0 <brelse>
801012ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012bd:	89 f0                	mov    %esi,%eax
801012bf:	5b                   	pop    %ebx
801012c0:	5e                   	pop    %esi
801012c1:	5f                   	pop    %edi
801012c2:	5d                   	pop    %ebp
801012c3:	c3                   	ret    
801012c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801012ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801012d0 <iget>:
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c7                	mov    %eax,%edi
801012d8:	31 f6                	xor    %esi,%esi
801012da:	bb f4 23 11 80       	mov    $0x801123f4,%ebx
801012df:	83 ec 28             	sub    $0x28,%esp
801012e2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801012e5:	68 c0 23 11 80       	push   $0x801123c0
801012ea:	e8 f1 34 00 00       	call   801047e0 <acquire>
801012ef:	83 c4 10             	add    $0x10,%esp
801012f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012f5:	eb 17                	jmp    8010130e <iget+0x3e>
801012f7:	89 f6                	mov    %esi,%esi
801012f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101300:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101306:	81 fb 14 40 11 80    	cmp    $0x80114014,%ebx
8010130c:	73 22                	jae    80101330 <iget+0x60>
8010130e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101311:	85 c9                	test   %ecx,%ecx
80101313:	7e 04                	jle    80101319 <iget+0x49>
80101315:	39 3b                	cmp    %edi,(%ebx)
80101317:	74 4f                	je     80101368 <iget+0x98>
80101319:	85 f6                	test   %esi,%esi
8010131b:	75 e3                	jne    80101300 <iget+0x30>
8010131d:	85 c9                	test   %ecx,%ecx
8010131f:	0f 44 f3             	cmove  %ebx,%esi
80101322:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101328:	81 fb 14 40 11 80    	cmp    $0x80114014,%ebx
8010132e:	72 de                	jb     8010130e <iget+0x3e>
80101330:	85 f6                	test   %esi,%esi
80101332:	74 5b                	je     8010138f <iget+0xbf>
80101334:	83 ec 0c             	sub    $0xc,%esp
80101337:	89 3e                	mov    %edi,(%esi)
80101339:	89 56 04             	mov    %edx,0x4(%esi)
8010133c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101343:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010134a:	68 c0 23 11 80       	push   $0x801123c0
8010134f:	e8 4c 35 00 00       	call   801048a0 <release>
80101354:	83 c4 10             	add    $0x10,%esp
80101357:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010135a:	89 f0                	mov    %esi,%eax
8010135c:	5b                   	pop    %ebx
8010135d:	5e                   	pop    %esi
8010135e:	5f                   	pop    %edi
8010135f:	5d                   	pop    %ebp
80101360:	c3                   	ret    
80101361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101368:	39 53 04             	cmp    %edx,0x4(%ebx)
8010136b:	75 ac                	jne    80101319 <iget+0x49>
8010136d:	83 ec 0c             	sub    $0xc,%esp
80101370:	83 c1 01             	add    $0x1,%ecx
80101373:	89 de                	mov    %ebx,%esi
80101375:	68 c0 23 11 80       	push   $0x801123c0
8010137a:	89 4b 08             	mov    %ecx,0x8(%ebx)
8010137d:	e8 1e 35 00 00       	call   801048a0 <release>
80101382:	83 c4 10             	add    $0x10,%esp
80101385:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101388:	89 f0                	mov    %esi,%eax
8010138a:	5b                   	pop    %ebx
8010138b:	5e                   	pop    %esi
8010138c:	5f                   	pop    %edi
8010138d:	5d                   	pop    %ebp
8010138e:	c3                   	ret    
8010138f:	83 ec 0c             	sub    $0xc,%esp
80101392:	68 08 7a 10 80       	push   $0x80107a08
80101397:	e8 f4 ef ff ff       	call   80100390 <panic>
8010139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801013a0 <bmap>:
801013a0:	55                   	push   %ebp
801013a1:	89 e5                	mov    %esp,%ebp
801013a3:	57                   	push   %edi
801013a4:	56                   	push   %esi
801013a5:	53                   	push   %ebx
801013a6:	89 c6                	mov    %eax,%esi
801013a8:	83 ec 1c             	sub    $0x1c,%esp
801013ab:	83 fa 0b             	cmp    $0xb,%edx
801013ae:	77 18                	ja     801013c8 <bmap+0x28>
801013b0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801013b3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801013b6:	85 db                	test   %ebx,%ebx
801013b8:	74 76                	je     80101430 <bmap+0x90>
801013ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013bd:	89 d8                	mov    %ebx,%eax
801013bf:	5b                   	pop    %ebx
801013c0:	5e                   	pop    %esi
801013c1:	5f                   	pop    %edi
801013c2:	5d                   	pop    %ebp
801013c3:	c3                   	ret    
801013c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013c8:	8d 5a f4             	lea    -0xc(%edx),%ebx
801013cb:	83 fb 7f             	cmp    $0x7f,%ebx
801013ce:	0f 87 90 00 00 00    	ja     80101464 <bmap+0xc4>
801013d4:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
801013da:	8b 00                	mov    (%eax),%eax
801013dc:	85 d2                	test   %edx,%edx
801013de:	74 70                	je     80101450 <bmap+0xb0>
801013e0:	83 ec 08             	sub    $0x8,%esp
801013e3:	52                   	push   %edx
801013e4:	50                   	push   %eax
801013e5:	e8 e6 ec ff ff       	call   801000d0 <bread>
801013ea:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
801013ee:	83 c4 10             	add    $0x10,%esp
801013f1:	89 c7                	mov    %eax,%edi
801013f3:	8b 1a                	mov    (%edx),%ebx
801013f5:	85 db                	test   %ebx,%ebx
801013f7:	75 1d                	jne    80101416 <bmap+0x76>
801013f9:	8b 06                	mov    (%esi),%eax
801013fb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801013fe:	e8 bd fd ff ff       	call   801011c0 <balloc>
80101403:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101406:	83 ec 0c             	sub    $0xc,%esp
80101409:	89 c3                	mov    %eax,%ebx
8010140b:	89 02                	mov    %eax,(%edx)
8010140d:	57                   	push   %edi
8010140e:	e8 ed 19 00 00       	call   80102e00 <log_write>
80101413:	83 c4 10             	add    $0x10,%esp
80101416:	83 ec 0c             	sub    $0xc,%esp
80101419:	57                   	push   %edi
8010141a:	e8 c1 ed ff ff       	call   801001e0 <brelse>
8010141f:	83 c4 10             	add    $0x10,%esp
80101422:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101425:	89 d8                	mov    %ebx,%eax
80101427:	5b                   	pop    %ebx
80101428:	5e                   	pop    %esi
80101429:	5f                   	pop    %edi
8010142a:	5d                   	pop    %ebp
8010142b:	c3                   	ret    
8010142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101430:	8b 00                	mov    (%eax),%eax
80101432:	e8 89 fd ff ff       	call   801011c0 <balloc>
80101437:	89 47 5c             	mov    %eax,0x5c(%edi)
8010143a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010143d:	89 c3                	mov    %eax,%ebx
8010143f:	89 d8                	mov    %ebx,%eax
80101441:	5b                   	pop    %ebx
80101442:	5e                   	pop    %esi
80101443:	5f                   	pop    %edi
80101444:	5d                   	pop    %ebp
80101445:	c3                   	ret    
80101446:	8d 76 00             	lea    0x0(%esi),%esi
80101449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101450:	e8 6b fd ff ff       	call   801011c0 <balloc>
80101455:	89 c2                	mov    %eax,%edx
80101457:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010145d:	8b 06                	mov    (%esi),%eax
8010145f:	e9 7c ff ff ff       	jmp    801013e0 <bmap+0x40>
80101464:	83 ec 0c             	sub    $0xc,%esp
80101467:	68 18 7a 10 80       	push   $0x80107a18
8010146c:	e8 1f ef ff ff       	call   80100390 <panic>
80101471:	eb 0d                	jmp    80101480 <readsb>
80101473:	90                   	nop
80101474:	90                   	nop
80101475:	90                   	nop
80101476:	90                   	nop
80101477:	90                   	nop
80101478:	90                   	nop
80101479:	90                   	nop
8010147a:	90                   	nop
8010147b:	90                   	nop
8010147c:	90                   	nop
8010147d:	90                   	nop
8010147e:	90                   	nop
8010147f:	90                   	nop

80101480 <readsb>:
80101480:	55                   	push   %ebp
80101481:	89 e5                	mov    %esp,%ebp
80101483:	56                   	push   %esi
80101484:	53                   	push   %ebx
80101485:	8b 75 0c             	mov    0xc(%ebp),%esi
80101488:	83 ec 08             	sub    $0x8,%esp
8010148b:	6a 01                	push   $0x1
8010148d:	ff 75 08             	pushl  0x8(%ebp)
80101490:	e8 3b ec ff ff       	call   801000d0 <bread>
80101495:	89 c3                	mov    %eax,%ebx
80101497:	8d 40 5c             	lea    0x5c(%eax),%eax
8010149a:	83 c4 0c             	add    $0xc,%esp
8010149d:	6a 1c                	push   $0x1c
8010149f:	50                   	push   %eax
801014a0:	56                   	push   %esi
801014a1:	e8 fa 34 00 00       	call   801049a0 <memmove>
801014a6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801014a9:	83 c4 10             	add    $0x10,%esp
801014ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
801014af:	5b                   	pop    %ebx
801014b0:	5e                   	pop    %esi
801014b1:	5d                   	pop    %ebp
801014b2:	e9 29 ed ff ff       	jmp    801001e0 <brelse>
801014b7:	89 f6                	mov    %esi,%esi
801014b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801014c0 <iinit>:
801014c0:	55                   	push   %ebp
801014c1:	89 e5                	mov    %esp,%ebp
801014c3:	53                   	push   %ebx
801014c4:	bb 00 24 11 80       	mov    $0x80112400,%ebx
801014c9:	83 ec 0c             	sub    $0xc,%esp
801014cc:	68 2b 7a 10 80       	push   $0x80107a2b
801014d1:	68 c0 23 11 80       	push   $0x801123c0
801014d6:	e8 c5 31 00 00       	call   801046a0 <initlock>
801014db:	83 c4 10             	add    $0x10,%esp
801014de:	66 90                	xchg   %ax,%ax
801014e0:	83 ec 08             	sub    $0x8,%esp
801014e3:	68 32 7a 10 80       	push   $0x80107a32
801014e8:	53                   	push   %ebx
801014e9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014ef:	e8 7c 30 00 00       	call   80104570 <initsleeplock>
801014f4:	83 c4 10             	add    $0x10,%esp
801014f7:	81 fb 20 40 11 80    	cmp    $0x80114020,%ebx
801014fd:	75 e1                	jne    801014e0 <iinit+0x20>
801014ff:	83 ec 08             	sub    $0x8,%esp
80101502:	68 a0 23 11 80       	push   $0x801123a0
80101507:	ff 75 08             	pushl  0x8(%ebp)
8010150a:	e8 71 ff ff ff       	call   80101480 <readsb>
8010150f:	ff 35 b8 23 11 80    	pushl  0x801123b8
80101515:	ff 35 b4 23 11 80    	pushl  0x801123b4
8010151b:	ff 35 b0 23 11 80    	pushl  0x801123b0
80101521:	ff 35 ac 23 11 80    	pushl  0x801123ac
80101527:	ff 35 a8 23 11 80    	pushl  0x801123a8
8010152d:	ff 35 a4 23 11 80    	pushl  0x801123a4
80101533:	ff 35 a0 23 11 80    	pushl  0x801123a0
80101539:	68 98 7a 10 80       	push   $0x80107a98
8010153e:	e8 1d f1 ff ff       	call   80100660 <cprintf>
80101543:	83 c4 30             	add    $0x30,%esp
80101546:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101549:	c9                   	leave  
8010154a:	c3                   	ret    
8010154b:	90                   	nop
8010154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101550 <ialloc>:
80101550:	55                   	push   %ebp
80101551:	89 e5                	mov    %esp,%ebp
80101553:	57                   	push   %edi
80101554:	56                   	push   %esi
80101555:	53                   	push   %ebx
80101556:	83 ec 1c             	sub    $0x1c,%esp
80101559:	83 3d a8 23 11 80 01 	cmpl   $0x1,0x801123a8
80101560:	8b 45 0c             	mov    0xc(%ebp),%eax
80101563:	8b 75 08             	mov    0x8(%ebp),%esi
80101566:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101569:	0f 86 91 00 00 00    	jbe    80101600 <ialloc+0xb0>
8010156f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101574:	eb 21                	jmp    80101597 <ialloc+0x47>
80101576:	8d 76 00             	lea    0x0(%esi),%esi
80101579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101580:	83 ec 0c             	sub    $0xc,%esp
80101583:	83 c3 01             	add    $0x1,%ebx
80101586:	57                   	push   %edi
80101587:	e8 54 ec ff ff       	call   801001e0 <brelse>
8010158c:	83 c4 10             	add    $0x10,%esp
8010158f:	39 1d a8 23 11 80    	cmp    %ebx,0x801123a8
80101595:	76 69                	jbe    80101600 <ialloc+0xb0>
80101597:	89 d8                	mov    %ebx,%eax
80101599:	83 ec 08             	sub    $0x8,%esp
8010159c:	c1 e8 03             	shr    $0x3,%eax
8010159f:	03 05 b4 23 11 80    	add    0x801123b4,%eax
801015a5:	50                   	push   %eax
801015a6:	56                   	push   %esi
801015a7:	e8 24 eb ff ff       	call   801000d0 <bread>
801015ac:	89 c7                	mov    %eax,%edi
801015ae:	89 d8                	mov    %ebx,%eax
801015b0:	83 c4 10             	add    $0x10,%esp
801015b3:	83 e0 07             	and    $0x7,%eax
801015b6:	c1 e0 06             	shl    $0x6,%eax
801015b9:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
801015bd:	66 83 39 00          	cmpw   $0x0,(%ecx)
801015c1:	75 bd                	jne    80101580 <ialloc+0x30>
801015c3:	83 ec 04             	sub    $0x4,%esp
801015c6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015c9:	6a 40                	push   $0x40
801015cb:	6a 00                	push   $0x0
801015cd:	51                   	push   %ecx
801015ce:	e8 1d 33 00 00       	call   801048f0 <memset>
801015d3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015d7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015da:	66 89 01             	mov    %ax,(%ecx)
801015dd:	89 3c 24             	mov    %edi,(%esp)
801015e0:	e8 1b 18 00 00       	call   80102e00 <log_write>
801015e5:	89 3c 24             	mov    %edi,(%esp)
801015e8:	e8 f3 eb ff ff       	call   801001e0 <brelse>
801015ed:	83 c4 10             	add    $0x10,%esp
801015f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015f3:	89 da                	mov    %ebx,%edx
801015f5:	89 f0                	mov    %esi,%eax
801015f7:	5b                   	pop    %ebx
801015f8:	5e                   	pop    %esi
801015f9:	5f                   	pop    %edi
801015fa:	5d                   	pop    %ebp
801015fb:	e9 d0 fc ff ff       	jmp    801012d0 <iget>
80101600:	83 ec 0c             	sub    $0xc,%esp
80101603:	68 38 7a 10 80       	push   $0x80107a38
80101608:	e8 83 ed ff ff       	call   80100390 <panic>
8010160d:	8d 76 00             	lea    0x0(%esi),%esi

80101610 <iupdate>:
80101610:	55                   	push   %ebp
80101611:	89 e5                	mov    %esp,%ebp
80101613:	56                   	push   %esi
80101614:	53                   	push   %ebx
80101615:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101618:	83 ec 08             	sub    $0x8,%esp
8010161b:	8b 43 04             	mov    0x4(%ebx),%eax
8010161e:	83 c3 5c             	add    $0x5c,%ebx
80101621:	c1 e8 03             	shr    $0x3,%eax
80101624:	03 05 b4 23 11 80    	add    0x801123b4,%eax
8010162a:	50                   	push   %eax
8010162b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010162e:	e8 9d ea ff ff       	call   801000d0 <bread>
80101633:	89 c6                	mov    %eax,%esi
80101635:	8b 43 a8             	mov    -0x58(%ebx),%eax
80101638:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
8010163c:	83 c4 0c             	add    $0xc,%esp
8010163f:	83 e0 07             	and    $0x7,%eax
80101642:	c1 e0 06             	shl    $0x6,%eax
80101645:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101649:	66 89 10             	mov    %dx,(%eax)
8010164c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101650:	83 c0 0c             	add    $0xc,%eax
80101653:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101657:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010165b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010165f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101663:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101667:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010166a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010166d:	6a 34                	push   $0x34
8010166f:	53                   	push   %ebx
80101670:	50                   	push   %eax
80101671:	e8 2a 33 00 00       	call   801049a0 <memmove>
80101676:	89 34 24             	mov    %esi,(%esp)
80101679:	e8 82 17 00 00       	call   80102e00 <log_write>
8010167e:	89 75 08             	mov    %esi,0x8(%ebp)
80101681:	83 c4 10             	add    $0x10,%esp
80101684:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101687:	5b                   	pop    %ebx
80101688:	5e                   	pop    %esi
80101689:	5d                   	pop    %ebp
8010168a:	e9 51 eb ff ff       	jmp    801001e0 <brelse>
8010168f:	90                   	nop

80101690 <idup>:
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	53                   	push   %ebx
80101694:	83 ec 10             	sub    $0x10,%esp
80101697:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010169a:	68 c0 23 11 80       	push   $0x801123c0
8010169f:	e8 3c 31 00 00       	call   801047e0 <acquire>
801016a4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
801016a8:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
801016af:	e8 ec 31 00 00       	call   801048a0 <release>
801016b4:	89 d8                	mov    %ebx,%eax
801016b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801016b9:	c9                   	leave  
801016ba:	c3                   	ret    
801016bb:	90                   	nop
801016bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801016c0 <ilock>:
801016c0:	55                   	push   %ebp
801016c1:	89 e5                	mov    %esp,%ebp
801016c3:	56                   	push   %esi
801016c4:	53                   	push   %ebx
801016c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016c8:	85 db                	test   %ebx,%ebx
801016ca:	0f 84 b7 00 00 00    	je     80101787 <ilock+0xc7>
801016d0:	8b 53 08             	mov    0x8(%ebx),%edx
801016d3:	85 d2                	test   %edx,%edx
801016d5:	0f 8e ac 00 00 00    	jle    80101787 <ilock+0xc7>
801016db:	8d 43 0c             	lea    0xc(%ebx),%eax
801016de:	83 ec 0c             	sub    $0xc,%esp
801016e1:	50                   	push   %eax
801016e2:	e8 c9 2e 00 00       	call   801045b0 <acquiresleep>
801016e7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ea:	83 c4 10             	add    $0x10,%esp
801016ed:	85 c0                	test   %eax,%eax
801016ef:	74 0f                	je     80101700 <ilock+0x40>
801016f1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016f4:	5b                   	pop    %ebx
801016f5:	5e                   	pop    %esi
801016f6:	5d                   	pop    %ebp
801016f7:	c3                   	ret    
801016f8:	90                   	nop
801016f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101700:	8b 43 04             	mov    0x4(%ebx),%eax
80101703:	83 ec 08             	sub    $0x8,%esp
80101706:	c1 e8 03             	shr    $0x3,%eax
80101709:	03 05 b4 23 11 80    	add    0x801123b4,%eax
8010170f:	50                   	push   %eax
80101710:	ff 33                	pushl  (%ebx)
80101712:	e8 b9 e9 ff ff       	call   801000d0 <bread>
80101717:	89 c6                	mov    %eax,%esi
80101719:	8b 43 04             	mov    0x4(%ebx),%eax
8010171c:	83 c4 0c             	add    $0xc,%esp
8010171f:	83 e0 07             	and    $0x7,%eax
80101722:	c1 e0 06             	shl    $0x6,%eax
80101725:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101729:	0f b7 10             	movzwl (%eax),%edx
8010172c:	83 c0 0c             	add    $0xc,%eax
8010172f:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101733:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101737:	66 89 53 52          	mov    %dx,0x52(%ebx)
8010173b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010173f:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101743:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101747:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010174b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010174e:	89 53 58             	mov    %edx,0x58(%ebx)
80101751:	6a 34                	push   $0x34
80101753:	50                   	push   %eax
80101754:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101757:	50                   	push   %eax
80101758:	e8 43 32 00 00       	call   801049a0 <memmove>
8010175d:	89 34 24             	mov    %esi,(%esp)
80101760:	e8 7b ea ff ff       	call   801001e0 <brelse>
80101765:	83 c4 10             	add    $0x10,%esp
80101768:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010176d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101774:	0f 85 77 ff ff ff    	jne    801016f1 <ilock+0x31>
8010177a:	83 ec 0c             	sub    $0xc,%esp
8010177d:	68 50 7a 10 80       	push   $0x80107a50
80101782:	e8 09 ec ff ff       	call   80100390 <panic>
80101787:	83 ec 0c             	sub    $0xc,%esp
8010178a:	68 4a 7a 10 80       	push   $0x80107a4a
8010178f:	e8 fc eb ff ff       	call   80100390 <panic>
80101794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010179a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801017a0 <iunlock>:
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	56                   	push   %esi
801017a4:	53                   	push   %ebx
801017a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801017a8:	85 db                	test   %ebx,%ebx
801017aa:	74 28                	je     801017d4 <iunlock+0x34>
801017ac:	8d 73 0c             	lea    0xc(%ebx),%esi
801017af:	83 ec 0c             	sub    $0xc,%esp
801017b2:	56                   	push   %esi
801017b3:	e8 98 2e 00 00       	call   80104650 <holdingsleep>
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 c0                	test   %eax,%eax
801017bd:	74 15                	je     801017d4 <iunlock+0x34>
801017bf:	8b 43 08             	mov    0x8(%ebx),%eax
801017c2:	85 c0                	test   %eax,%eax
801017c4:	7e 0e                	jle    801017d4 <iunlock+0x34>
801017c6:	89 75 08             	mov    %esi,0x8(%ebp)
801017c9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017cc:	5b                   	pop    %ebx
801017cd:	5e                   	pop    %esi
801017ce:	5d                   	pop    %ebp
801017cf:	e9 3c 2e 00 00       	jmp    80104610 <releasesleep>
801017d4:	83 ec 0c             	sub    $0xc,%esp
801017d7:	68 5f 7a 10 80       	push   $0x80107a5f
801017dc:	e8 af eb ff ff       	call   80100390 <panic>
801017e1:	eb 0d                	jmp    801017f0 <iput>
801017e3:	90                   	nop
801017e4:	90                   	nop
801017e5:	90                   	nop
801017e6:	90                   	nop
801017e7:	90                   	nop
801017e8:	90                   	nop
801017e9:	90                   	nop
801017ea:	90                   	nop
801017eb:	90                   	nop
801017ec:	90                   	nop
801017ed:	90                   	nop
801017ee:	90                   	nop
801017ef:	90                   	nop

801017f0 <iput>:
801017f0:	55                   	push   %ebp
801017f1:	89 e5                	mov    %esp,%ebp
801017f3:	57                   	push   %edi
801017f4:	56                   	push   %esi
801017f5:	53                   	push   %ebx
801017f6:	83 ec 28             	sub    $0x28,%esp
801017f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801017fc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017ff:	57                   	push   %edi
80101800:	e8 ab 2d 00 00       	call   801045b0 <acquiresleep>
80101805:	8b 53 4c             	mov    0x4c(%ebx),%edx
80101808:	83 c4 10             	add    $0x10,%esp
8010180b:	85 d2                	test   %edx,%edx
8010180d:	74 07                	je     80101816 <iput+0x26>
8010180f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101814:	74 32                	je     80101848 <iput+0x58>
80101816:	83 ec 0c             	sub    $0xc,%esp
80101819:	57                   	push   %edi
8010181a:	e8 f1 2d 00 00       	call   80104610 <releasesleep>
8010181f:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
80101826:	e8 b5 2f 00 00       	call   801047e0 <acquire>
8010182b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
8010182f:	83 c4 10             	add    $0x10,%esp
80101832:	c7 45 08 c0 23 11 80 	movl   $0x801123c0,0x8(%ebp)
80101839:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010183c:	5b                   	pop    %ebx
8010183d:	5e                   	pop    %esi
8010183e:	5f                   	pop    %edi
8010183f:	5d                   	pop    %ebp
80101840:	e9 5b 30 00 00       	jmp    801048a0 <release>
80101845:	8d 76 00             	lea    0x0(%esi),%esi
80101848:	83 ec 0c             	sub    $0xc,%esp
8010184b:	68 c0 23 11 80       	push   $0x801123c0
80101850:	e8 8b 2f 00 00       	call   801047e0 <acquire>
80101855:	8b 73 08             	mov    0x8(%ebx),%esi
80101858:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
8010185f:	e8 3c 30 00 00       	call   801048a0 <release>
80101864:	83 c4 10             	add    $0x10,%esp
80101867:	83 fe 01             	cmp    $0x1,%esi
8010186a:	75 aa                	jne    80101816 <iput+0x26>
8010186c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101872:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101875:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101878:	89 cf                	mov    %ecx,%edi
8010187a:	eb 0b                	jmp    80101887 <iput+0x97>
8010187c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101880:	83 c6 04             	add    $0x4,%esi
80101883:	39 fe                	cmp    %edi,%esi
80101885:	74 19                	je     801018a0 <iput+0xb0>
80101887:	8b 16                	mov    (%esi),%edx
80101889:	85 d2                	test   %edx,%edx
8010188b:	74 f3                	je     80101880 <iput+0x90>
8010188d:	8b 03                	mov    (%ebx),%eax
8010188f:	e8 bc f8 ff ff       	call   80101150 <bfree>
80101894:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010189a:	eb e4                	jmp    80101880 <iput+0x90>
8010189c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801018a0:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
801018a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801018a9:	85 c0                	test   %eax,%eax
801018ab:	75 33                	jne    801018e0 <iput+0xf0>
801018ad:	83 ec 0c             	sub    $0xc,%esp
801018b0:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801018b7:	53                   	push   %ebx
801018b8:	e8 53 fd ff ff       	call   80101610 <iupdate>
801018bd:	31 c0                	xor    %eax,%eax
801018bf:	66 89 43 50          	mov    %ax,0x50(%ebx)
801018c3:	89 1c 24             	mov    %ebx,(%esp)
801018c6:	e8 45 fd ff ff       	call   80101610 <iupdate>
801018cb:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801018d2:	83 c4 10             	add    $0x10,%esp
801018d5:	e9 3c ff ff ff       	jmp    80101816 <iput+0x26>
801018da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018e0:	83 ec 08             	sub    $0x8,%esp
801018e3:	50                   	push   %eax
801018e4:	ff 33                	pushl  (%ebx)
801018e6:	e8 e5 e7 ff ff       	call   801000d0 <bread>
801018eb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018f1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018f7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018fa:	83 c4 10             	add    $0x10,%esp
801018fd:	89 cf                	mov    %ecx,%edi
801018ff:	eb 0e                	jmp    8010190f <iput+0x11f>
80101901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101908:	83 c6 04             	add    $0x4,%esi
8010190b:	39 fe                	cmp    %edi,%esi
8010190d:	74 0f                	je     8010191e <iput+0x12e>
8010190f:	8b 16                	mov    (%esi),%edx
80101911:	85 d2                	test   %edx,%edx
80101913:	74 f3                	je     80101908 <iput+0x118>
80101915:	8b 03                	mov    (%ebx),%eax
80101917:	e8 34 f8 ff ff       	call   80101150 <bfree>
8010191c:	eb ea                	jmp    80101908 <iput+0x118>
8010191e:	83 ec 0c             	sub    $0xc,%esp
80101921:	ff 75 e4             	pushl  -0x1c(%ebp)
80101924:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101927:	e8 b4 e8 ff ff       	call   801001e0 <brelse>
8010192c:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101932:	8b 03                	mov    (%ebx),%eax
80101934:	e8 17 f8 ff ff       	call   80101150 <bfree>
80101939:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101940:	00 00 00 
80101943:	83 c4 10             	add    $0x10,%esp
80101946:	e9 62 ff ff ff       	jmp    801018ad <iput+0xbd>
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <iunlockput>:
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	53                   	push   %ebx
80101954:	83 ec 10             	sub    $0x10,%esp
80101957:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010195a:	53                   	push   %ebx
8010195b:	e8 40 fe ff ff       	call   801017a0 <iunlock>
80101960:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101963:	83 c4 10             	add    $0x10,%esp
80101966:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101969:	c9                   	leave  
8010196a:	e9 81 fe ff ff       	jmp    801017f0 <iput>
8010196f:	90                   	nop

80101970 <stati>:
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	8b 55 08             	mov    0x8(%ebp),%edx
80101976:	8b 45 0c             	mov    0xc(%ebp),%eax
80101979:	8b 0a                	mov    (%edx),%ecx
8010197b:	89 48 04             	mov    %ecx,0x4(%eax)
8010197e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101981:	89 48 08             	mov    %ecx,0x8(%eax)
80101984:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101988:	66 89 08             	mov    %cx,(%eax)
8010198b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010198f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101993:	8b 52 58             	mov    0x58(%edx),%edx
80101996:	89 50 10             	mov    %edx,0x10(%eax)
80101999:	5d                   	pop    %ebp
8010199a:	c3                   	ret    
8010199b:	90                   	nop
8010199c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801019a0 <readi>:
801019a0:	55                   	push   %ebp
801019a1:	89 e5                	mov    %esp,%ebp
801019a3:	57                   	push   %edi
801019a4:	56                   	push   %esi
801019a5:	53                   	push   %ebx
801019a6:	83 ec 1c             	sub    $0x1c,%esp
801019a9:	8b 45 08             	mov    0x8(%ebp),%eax
801019ac:	8b 75 0c             	mov    0xc(%ebp),%esi
801019af:	8b 7d 14             	mov    0x14(%ebp),%edi
801019b2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
801019b7:	89 75 e0             	mov    %esi,-0x20(%ebp)
801019ba:	89 45 d8             	mov    %eax,-0x28(%ebp)
801019bd:	8b 75 10             	mov    0x10(%ebp),%esi
801019c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801019c3:	0f 84 a7 00 00 00    	je     80101a70 <readi+0xd0>
801019c9:	8b 45 d8             	mov    -0x28(%ebp),%eax
801019cc:	8b 40 58             	mov    0x58(%eax),%eax
801019cf:	39 c6                	cmp    %eax,%esi
801019d1:	0f 87 ba 00 00 00    	ja     80101a91 <readi+0xf1>
801019d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019da:	89 f9                	mov    %edi,%ecx
801019dc:	01 f1                	add    %esi,%ecx
801019de:	0f 82 ad 00 00 00    	jb     80101a91 <readi+0xf1>
801019e4:	89 c2                	mov    %eax,%edx
801019e6:	29 f2                	sub    %esi,%edx
801019e8:	39 c8                	cmp    %ecx,%eax
801019ea:	0f 43 d7             	cmovae %edi,%edx
801019ed:	31 ff                	xor    %edi,%edi
801019ef:	85 d2                	test   %edx,%edx
801019f1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801019f4:	74 6c                	je     80101a62 <readi+0xc2>
801019f6:	8d 76 00             	lea    0x0(%esi),%esi
801019f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101a00:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101a03:	89 f2                	mov    %esi,%edx
80101a05:	c1 ea 09             	shr    $0x9,%edx
80101a08:	89 d8                	mov    %ebx,%eax
80101a0a:	e8 91 f9 ff ff       	call   801013a0 <bmap>
80101a0f:	83 ec 08             	sub    $0x8,%esp
80101a12:	50                   	push   %eax
80101a13:	ff 33                	pushl  (%ebx)
80101a15:	e8 b6 e6 ff ff       	call   801000d0 <bread>
80101a1a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101a1d:	89 c2                	mov    %eax,%edx
80101a1f:	89 f0                	mov    %esi,%eax
80101a21:	25 ff 01 00 00       	and    $0x1ff,%eax
80101a26:	b9 00 02 00 00       	mov    $0x200,%ecx
80101a2b:	83 c4 0c             	add    $0xc,%esp
80101a2e:	29 c1                	sub    %eax,%ecx
80101a30:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a34:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a37:	29 fb                	sub    %edi,%ebx
80101a39:	39 d9                	cmp    %ebx,%ecx
80101a3b:	0f 46 d9             	cmovbe %ecx,%ebx
80101a3e:	53                   	push   %ebx
80101a3f:	50                   	push   %eax
80101a40:	01 df                	add    %ebx,%edi
80101a42:	ff 75 e0             	pushl  -0x20(%ebp)
80101a45:	01 de                	add    %ebx,%esi
80101a47:	e8 54 2f 00 00       	call   801049a0 <memmove>
80101a4c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a4f:	89 14 24             	mov    %edx,(%esp)
80101a52:	e8 89 e7 ff ff       	call   801001e0 <brelse>
80101a57:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a5a:	83 c4 10             	add    $0x10,%esp
80101a5d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a60:	77 9e                	ja     80101a00 <readi+0x60>
80101a62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a68:	5b                   	pop    %ebx
80101a69:	5e                   	pop    %esi
80101a6a:	5f                   	pop    %edi
80101a6b:	5d                   	pop    %ebp
80101a6c:	c3                   	ret    
80101a6d:	8d 76 00             	lea    0x0(%esi),%esi
80101a70:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a74:	66 83 f8 09          	cmp    $0x9,%ax
80101a78:	77 17                	ja     80101a91 <readi+0xf1>
80101a7a:	8b 04 c5 40 23 11 80 	mov    -0x7feedcc0(,%eax,8),%eax
80101a81:	85 c0                	test   %eax,%eax
80101a83:	74 0c                	je     80101a91 <readi+0xf1>
80101a85:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a8b:	5b                   	pop    %ebx
80101a8c:	5e                   	pop    %esi
80101a8d:	5f                   	pop    %edi
80101a8e:	5d                   	pop    %ebp
80101a8f:	ff e0                	jmp    *%eax
80101a91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a96:	eb cd                	jmp    80101a65 <readi+0xc5>
80101a98:	90                   	nop
80101a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101aa0 <writei>:
80101aa0:	55                   	push   %ebp
80101aa1:	89 e5                	mov    %esp,%ebp
80101aa3:	57                   	push   %edi
80101aa4:	56                   	push   %esi
80101aa5:	53                   	push   %ebx
80101aa6:	83 ec 1c             	sub    $0x1c,%esp
80101aa9:	8b 45 08             	mov    0x8(%ebp),%eax
80101aac:	8b 75 0c             	mov    0xc(%ebp),%esi
80101aaf:	8b 7d 14             	mov    0x14(%ebp),%edi
80101ab2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101ab7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101aba:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101abd:	8b 75 10             	mov    0x10(%ebp),%esi
80101ac0:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101ac3:	0f 84 b7 00 00 00    	je     80101b80 <writei+0xe0>
80101ac9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101acc:	39 70 58             	cmp    %esi,0x58(%eax)
80101acf:	0f 82 eb 00 00 00    	jb     80101bc0 <writei+0x120>
80101ad5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101ad8:	31 d2                	xor    %edx,%edx
80101ada:	89 f8                	mov    %edi,%eax
80101adc:	01 f0                	add    %esi,%eax
80101ade:	0f 92 c2             	setb   %dl
80101ae1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ae6:	0f 87 d4 00 00 00    	ja     80101bc0 <writei+0x120>
80101aec:	85 d2                	test   %edx,%edx
80101aee:	0f 85 cc 00 00 00    	jne    80101bc0 <writei+0x120>
80101af4:	85 ff                	test   %edi,%edi
80101af6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101afd:	74 72                	je     80101b71 <writei+0xd1>
80101aff:	90                   	nop
80101b00:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101b03:	89 f2                	mov    %esi,%edx
80101b05:	c1 ea 09             	shr    $0x9,%edx
80101b08:	89 f8                	mov    %edi,%eax
80101b0a:	e8 91 f8 ff ff       	call   801013a0 <bmap>
80101b0f:	83 ec 08             	sub    $0x8,%esp
80101b12:	50                   	push   %eax
80101b13:	ff 37                	pushl  (%edi)
80101b15:	e8 b6 e5 ff ff       	call   801000d0 <bread>
80101b1a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101b1d:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
80101b20:	89 c7                	mov    %eax,%edi
80101b22:	89 f0                	mov    %esi,%eax
80101b24:	b9 00 02 00 00       	mov    $0x200,%ecx
80101b29:	83 c4 0c             	add    $0xc,%esp
80101b2c:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b31:	29 c1                	sub    %eax,%ecx
80101b33:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101b37:	39 d9                	cmp    %ebx,%ecx
80101b39:	0f 46 d9             	cmovbe %ecx,%ebx
80101b3c:	53                   	push   %ebx
80101b3d:	ff 75 dc             	pushl  -0x24(%ebp)
80101b40:	01 de                	add    %ebx,%esi
80101b42:	50                   	push   %eax
80101b43:	e8 58 2e 00 00       	call   801049a0 <memmove>
80101b48:	89 3c 24             	mov    %edi,(%esp)
80101b4b:	e8 b0 12 00 00       	call   80102e00 <log_write>
80101b50:	89 3c 24             	mov    %edi,(%esp)
80101b53:	e8 88 e6 ff ff       	call   801001e0 <brelse>
80101b58:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b5b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b5e:	83 c4 10             	add    $0x10,%esp
80101b61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b64:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b67:	77 97                	ja     80101b00 <writei+0x60>
80101b69:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b6c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b6f:	77 37                	ja     80101ba8 <writei+0x108>
80101b71:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b77:	5b                   	pop    %ebx
80101b78:	5e                   	pop    %esi
80101b79:	5f                   	pop    %edi
80101b7a:	5d                   	pop    %ebp
80101b7b:	c3                   	ret    
80101b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b80:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b84:	66 83 f8 09          	cmp    $0x9,%ax
80101b88:	77 36                	ja     80101bc0 <writei+0x120>
80101b8a:	8b 04 c5 44 23 11 80 	mov    -0x7feedcbc(,%eax,8),%eax
80101b91:	85 c0                	test   %eax,%eax
80101b93:	74 2b                	je     80101bc0 <writei+0x120>
80101b95:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b9b:	5b                   	pop    %ebx
80101b9c:	5e                   	pop    %esi
80101b9d:	5f                   	pop    %edi
80101b9e:	5d                   	pop    %ebp
80101b9f:	ff e0                	jmp    *%eax
80101ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ba8:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101bab:	83 ec 0c             	sub    $0xc,%esp
80101bae:	89 70 58             	mov    %esi,0x58(%eax)
80101bb1:	50                   	push   %eax
80101bb2:	e8 59 fa ff ff       	call   80101610 <iupdate>
80101bb7:	83 c4 10             	add    $0x10,%esp
80101bba:	eb b5                	jmp    80101b71 <writei+0xd1>
80101bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bc5:	eb ad                	jmp    80101b74 <writei+0xd4>
80101bc7:	89 f6                	mov    %esi,%esi
80101bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bd0 <namecmp>:
80101bd0:	55                   	push   %ebp
80101bd1:	89 e5                	mov    %esp,%ebp
80101bd3:	83 ec 0c             	sub    $0xc,%esp
80101bd6:	6a 0e                	push   $0xe
80101bd8:	ff 75 0c             	pushl  0xc(%ebp)
80101bdb:	ff 75 08             	pushl  0x8(%ebp)
80101bde:	e8 2d 2e 00 00       	call   80104a10 <strncmp>
80101be3:	c9                   	leave  
80101be4:	c3                   	ret    
80101be5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bf0 <dirlookup>:
80101bf0:	55                   	push   %ebp
80101bf1:	89 e5                	mov    %esp,%ebp
80101bf3:	57                   	push   %edi
80101bf4:	56                   	push   %esi
80101bf5:	53                   	push   %ebx
80101bf6:	83 ec 1c             	sub    $0x1c,%esp
80101bf9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bfc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101c01:	0f 85 85 00 00 00    	jne    80101c8c <dirlookup+0x9c>
80101c07:	8b 53 58             	mov    0x58(%ebx),%edx
80101c0a:	31 ff                	xor    %edi,%edi
80101c0c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c0f:	85 d2                	test   %edx,%edx
80101c11:	74 3e                	je     80101c51 <dirlookup+0x61>
80101c13:	90                   	nop
80101c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c18:	6a 10                	push   $0x10
80101c1a:	57                   	push   %edi
80101c1b:	56                   	push   %esi
80101c1c:	53                   	push   %ebx
80101c1d:	e8 7e fd ff ff       	call   801019a0 <readi>
80101c22:	83 c4 10             	add    $0x10,%esp
80101c25:	83 f8 10             	cmp    $0x10,%eax
80101c28:	75 55                	jne    80101c7f <dirlookup+0x8f>
80101c2a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c2f:	74 18                	je     80101c49 <dirlookup+0x59>
80101c31:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c34:	83 ec 04             	sub    $0x4,%esp
80101c37:	6a 0e                	push   $0xe
80101c39:	50                   	push   %eax
80101c3a:	ff 75 0c             	pushl  0xc(%ebp)
80101c3d:	e8 ce 2d 00 00       	call   80104a10 <strncmp>
80101c42:	83 c4 10             	add    $0x10,%esp
80101c45:	85 c0                	test   %eax,%eax
80101c47:	74 17                	je     80101c60 <dirlookup+0x70>
80101c49:	83 c7 10             	add    $0x10,%edi
80101c4c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c4f:	72 c7                	jb     80101c18 <dirlookup+0x28>
80101c51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c54:	31 c0                	xor    %eax,%eax
80101c56:	5b                   	pop    %ebx
80101c57:	5e                   	pop    %esi
80101c58:	5f                   	pop    %edi
80101c59:	5d                   	pop    %ebp
80101c5a:	c3                   	ret    
80101c5b:	90                   	nop
80101c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c60:	8b 45 10             	mov    0x10(%ebp),%eax
80101c63:	85 c0                	test   %eax,%eax
80101c65:	74 05                	je     80101c6c <dirlookup+0x7c>
80101c67:	8b 45 10             	mov    0x10(%ebp),%eax
80101c6a:	89 38                	mov    %edi,(%eax)
80101c6c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c70:	8b 03                	mov    (%ebx),%eax
80101c72:	e8 59 f6 ff ff       	call   801012d0 <iget>
80101c77:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c7a:	5b                   	pop    %ebx
80101c7b:	5e                   	pop    %esi
80101c7c:	5f                   	pop    %edi
80101c7d:	5d                   	pop    %ebp
80101c7e:	c3                   	ret    
80101c7f:	83 ec 0c             	sub    $0xc,%esp
80101c82:	68 79 7a 10 80       	push   $0x80107a79
80101c87:	e8 04 e7 ff ff       	call   80100390 <panic>
80101c8c:	83 ec 0c             	sub    $0xc,%esp
80101c8f:	68 67 7a 10 80       	push   $0x80107a67
80101c94:	e8 f7 e6 ff ff       	call   80100390 <panic>
80101c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101ca0 <namex>:
80101ca0:	55                   	push   %ebp
80101ca1:	89 e5                	mov    %esp,%ebp
80101ca3:	57                   	push   %edi
80101ca4:	56                   	push   %esi
80101ca5:	53                   	push   %ebx
80101ca6:	89 cf                	mov    %ecx,%edi
80101ca8:	89 c3                	mov    %eax,%ebx
80101caa:	83 ec 1c             	sub    $0x1c,%esp
80101cad:	80 38 2f             	cmpb   $0x2f,(%eax)
80101cb0:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101cb3:	0f 84 67 01 00 00    	je     80101e20 <namex+0x180>
80101cb9:	e8 e2 1b 00 00       	call   801038a0 <myproc>
80101cbe:	83 ec 0c             	sub    $0xc,%esp
80101cc1:	8b 70 68             	mov    0x68(%eax),%esi
80101cc4:	68 c0 23 11 80       	push   $0x801123c0
80101cc9:	e8 12 2b 00 00       	call   801047e0 <acquire>
80101cce:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101cd2:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
80101cd9:	e8 c2 2b 00 00       	call   801048a0 <release>
80101cde:	83 c4 10             	add    $0x10,%esp
80101ce1:	eb 08                	jmp    80101ceb <namex+0x4b>
80101ce3:	90                   	nop
80101ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ce8:	83 c3 01             	add    $0x1,%ebx
80101ceb:	0f b6 03             	movzbl (%ebx),%eax
80101cee:	3c 2f                	cmp    $0x2f,%al
80101cf0:	74 f6                	je     80101ce8 <namex+0x48>
80101cf2:	84 c0                	test   %al,%al
80101cf4:	0f 84 ee 00 00 00    	je     80101de8 <namex+0x148>
80101cfa:	0f b6 03             	movzbl (%ebx),%eax
80101cfd:	3c 2f                	cmp    $0x2f,%al
80101cff:	0f 84 b3 00 00 00    	je     80101db8 <namex+0x118>
80101d05:	84 c0                	test   %al,%al
80101d07:	89 da                	mov    %ebx,%edx
80101d09:	75 09                	jne    80101d14 <namex+0x74>
80101d0b:	e9 a8 00 00 00       	jmp    80101db8 <namex+0x118>
80101d10:	84 c0                	test   %al,%al
80101d12:	74 0a                	je     80101d1e <namex+0x7e>
80101d14:	83 c2 01             	add    $0x1,%edx
80101d17:	0f b6 02             	movzbl (%edx),%eax
80101d1a:	3c 2f                	cmp    $0x2f,%al
80101d1c:	75 f2                	jne    80101d10 <namex+0x70>
80101d1e:	89 d1                	mov    %edx,%ecx
80101d20:	29 d9                	sub    %ebx,%ecx
80101d22:	83 f9 0d             	cmp    $0xd,%ecx
80101d25:	0f 8e 91 00 00 00    	jle    80101dbc <namex+0x11c>
80101d2b:	83 ec 04             	sub    $0x4,%esp
80101d2e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d31:	6a 0e                	push   $0xe
80101d33:	53                   	push   %ebx
80101d34:	57                   	push   %edi
80101d35:	e8 66 2c 00 00       	call   801049a0 <memmove>
80101d3a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d3d:	83 c4 10             	add    $0x10,%esp
80101d40:	89 d3                	mov    %edx,%ebx
80101d42:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d45:	75 11                	jne    80101d58 <namex+0xb8>
80101d47:	89 f6                	mov    %esi,%esi
80101d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d50:	83 c3 01             	add    $0x1,%ebx
80101d53:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d56:	74 f8                	je     80101d50 <namex+0xb0>
80101d58:	83 ec 0c             	sub    $0xc,%esp
80101d5b:	56                   	push   %esi
80101d5c:	e8 5f f9 ff ff       	call   801016c0 <ilock>
80101d61:	83 c4 10             	add    $0x10,%esp
80101d64:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d69:	0f 85 91 00 00 00    	jne    80101e00 <namex+0x160>
80101d6f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d72:	85 d2                	test   %edx,%edx
80101d74:	74 09                	je     80101d7f <namex+0xdf>
80101d76:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d79:	0f 84 b7 00 00 00    	je     80101e36 <namex+0x196>
80101d7f:	83 ec 04             	sub    $0x4,%esp
80101d82:	6a 00                	push   $0x0
80101d84:	57                   	push   %edi
80101d85:	56                   	push   %esi
80101d86:	e8 65 fe ff ff       	call   80101bf0 <dirlookup>
80101d8b:	83 c4 10             	add    $0x10,%esp
80101d8e:	85 c0                	test   %eax,%eax
80101d90:	74 6e                	je     80101e00 <namex+0x160>
80101d92:	83 ec 0c             	sub    $0xc,%esp
80101d95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d98:	56                   	push   %esi
80101d99:	e8 02 fa ff ff       	call   801017a0 <iunlock>
80101d9e:	89 34 24             	mov    %esi,(%esp)
80101da1:	e8 4a fa ff ff       	call   801017f0 <iput>
80101da6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101da9:	83 c4 10             	add    $0x10,%esp
80101dac:	89 c6                	mov    %eax,%esi
80101dae:	e9 38 ff ff ff       	jmp    80101ceb <namex+0x4b>
80101db3:	90                   	nop
80101db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101db8:	89 da                	mov    %ebx,%edx
80101dba:	31 c9                	xor    %ecx,%ecx
80101dbc:	83 ec 04             	sub    $0x4,%esp
80101dbf:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101dc2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101dc5:	51                   	push   %ecx
80101dc6:	53                   	push   %ebx
80101dc7:	57                   	push   %edi
80101dc8:	e8 d3 2b 00 00       	call   801049a0 <memmove>
80101dcd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101dd0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101dd3:	83 c4 10             	add    $0x10,%esp
80101dd6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101dda:	89 d3                	mov    %edx,%ebx
80101ddc:	e9 61 ff ff ff       	jmp    80101d42 <namex+0xa2>
80101de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101de8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101deb:	85 c0                	test   %eax,%eax
80101ded:	75 5d                	jne    80101e4c <namex+0x1ac>
80101def:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101df2:	89 f0                	mov    %esi,%eax
80101df4:	5b                   	pop    %ebx
80101df5:	5e                   	pop    %esi
80101df6:	5f                   	pop    %edi
80101df7:	5d                   	pop    %ebp
80101df8:	c3                   	ret    
80101df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e00:	83 ec 0c             	sub    $0xc,%esp
80101e03:	56                   	push   %esi
80101e04:	e8 97 f9 ff ff       	call   801017a0 <iunlock>
80101e09:	89 34 24             	mov    %esi,(%esp)
80101e0c:	31 f6                	xor    %esi,%esi
80101e0e:	e8 dd f9 ff ff       	call   801017f0 <iput>
80101e13:	83 c4 10             	add    $0x10,%esp
80101e16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e19:	89 f0                	mov    %esi,%eax
80101e1b:	5b                   	pop    %ebx
80101e1c:	5e                   	pop    %esi
80101e1d:	5f                   	pop    %edi
80101e1e:	5d                   	pop    %ebp
80101e1f:	c3                   	ret    
80101e20:	ba 01 00 00 00       	mov    $0x1,%edx
80101e25:	b8 01 00 00 00       	mov    $0x1,%eax
80101e2a:	e8 a1 f4 ff ff       	call   801012d0 <iget>
80101e2f:	89 c6                	mov    %eax,%esi
80101e31:	e9 b5 fe ff ff       	jmp    80101ceb <namex+0x4b>
80101e36:	83 ec 0c             	sub    $0xc,%esp
80101e39:	56                   	push   %esi
80101e3a:	e8 61 f9 ff ff       	call   801017a0 <iunlock>
80101e3f:	83 c4 10             	add    $0x10,%esp
80101e42:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e45:	89 f0                	mov    %esi,%eax
80101e47:	5b                   	pop    %ebx
80101e48:	5e                   	pop    %esi
80101e49:	5f                   	pop    %edi
80101e4a:	5d                   	pop    %ebp
80101e4b:	c3                   	ret    
80101e4c:	83 ec 0c             	sub    $0xc,%esp
80101e4f:	56                   	push   %esi
80101e50:	31 f6                	xor    %esi,%esi
80101e52:	e8 99 f9 ff ff       	call   801017f0 <iput>
80101e57:	83 c4 10             	add    $0x10,%esp
80101e5a:	eb 93                	jmp    80101def <namex+0x14f>
80101e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e60 <dirlink>:
80101e60:	55                   	push   %ebp
80101e61:	89 e5                	mov    %esp,%ebp
80101e63:	57                   	push   %edi
80101e64:	56                   	push   %esi
80101e65:	53                   	push   %ebx
80101e66:	83 ec 20             	sub    $0x20,%esp
80101e69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e6c:	6a 00                	push   $0x0
80101e6e:	ff 75 0c             	pushl  0xc(%ebp)
80101e71:	53                   	push   %ebx
80101e72:	e8 79 fd ff ff       	call   80101bf0 <dirlookup>
80101e77:	83 c4 10             	add    $0x10,%esp
80101e7a:	85 c0                	test   %eax,%eax
80101e7c:	75 67                	jne    80101ee5 <dirlink+0x85>
80101e7e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e81:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e84:	85 ff                	test   %edi,%edi
80101e86:	74 29                	je     80101eb1 <dirlink+0x51>
80101e88:	31 ff                	xor    %edi,%edi
80101e8a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e8d:	eb 09                	jmp    80101e98 <dirlink+0x38>
80101e8f:	90                   	nop
80101e90:	83 c7 10             	add    $0x10,%edi
80101e93:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e96:	73 19                	jae    80101eb1 <dirlink+0x51>
80101e98:	6a 10                	push   $0x10
80101e9a:	57                   	push   %edi
80101e9b:	56                   	push   %esi
80101e9c:	53                   	push   %ebx
80101e9d:	e8 fe fa ff ff       	call   801019a0 <readi>
80101ea2:	83 c4 10             	add    $0x10,%esp
80101ea5:	83 f8 10             	cmp    $0x10,%eax
80101ea8:	75 4e                	jne    80101ef8 <dirlink+0x98>
80101eaa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101eaf:	75 df                	jne    80101e90 <dirlink+0x30>
80101eb1:	8d 45 da             	lea    -0x26(%ebp),%eax
80101eb4:	83 ec 04             	sub    $0x4,%esp
80101eb7:	6a 0e                	push   $0xe
80101eb9:	ff 75 0c             	pushl  0xc(%ebp)
80101ebc:	50                   	push   %eax
80101ebd:	e8 ae 2b 00 00       	call   80104a70 <strncpy>
80101ec2:	8b 45 10             	mov    0x10(%ebp),%eax
80101ec5:	6a 10                	push   $0x10
80101ec7:	57                   	push   %edi
80101ec8:	56                   	push   %esi
80101ec9:	53                   	push   %ebx
80101eca:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101ece:	e8 cd fb ff ff       	call   80101aa0 <writei>
80101ed3:	83 c4 20             	add    $0x20,%esp
80101ed6:	83 f8 10             	cmp    $0x10,%eax
80101ed9:	75 2a                	jne    80101f05 <dirlink+0xa5>
80101edb:	31 c0                	xor    %eax,%eax
80101edd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ee0:	5b                   	pop    %ebx
80101ee1:	5e                   	pop    %esi
80101ee2:	5f                   	pop    %edi
80101ee3:	5d                   	pop    %ebp
80101ee4:	c3                   	ret    
80101ee5:	83 ec 0c             	sub    $0xc,%esp
80101ee8:	50                   	push   %eax
80101ee9:	e8 02 f9 ff ff       	call   801017f0 <iput>
80101eee:	83 c4 10             	add    $0x10,%esp
80101ef1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ef6:	eb e5                	jmp    80101edd <dirlink+0x7d>
80101ef8:	83 ec 0c             	sub    $0xc,%esp
80101efb:	68 88 7a 10 80       	push   $0x80107a88
80101f00:	e8 8b e4 ff ff       	call   80100390 <panic>
80101f05:	83 ec 0c             	sub    $0xc,%esp
80101f08:	68 9e 80 10 80       	push   $0x8010809e
80101f0d:	e8 7e e4 ff ff       	call   80100390 <panic>
80101f12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f20 <namei>:
80101f20:	55                   	push   %ebp
80101f21:	31 d2                	xor    %edx,%edx
80101f23:	89 e5                	mov    %esp,%ebp
80101f25:	83 ec 18             	sub    $0x18,%esp
80101f28:	8b 45 08             	mov    0x8(%ebp),%eax
80101f2b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f2e:	e8 6d fd ff ff       	call   80101ca0 <namex>
80101f33:	c9                   	leave  
80101f34:	c3                   	ret    
80101f35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f40 <nameiparent>:
80101f40:	55                   	push   %ebp
80101f41:	ba 01 00 00 00       	mov    $0x1,%edx
80101f46:	89 e5                	mov    %esp,%ebp
80101f48:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f4b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f4e:	5d                   	pop    %ebp
80101f4f:	e9 4c fd ff ff       	jmp    80101ca0 <namex>
80101f54:	66 90                	xchg   %ax,%ax
80101f56:	66 90                	xchg   %ax,%ax
80101f58:	66 90                	xchg   %ax,%ax
80101f5a:	66 90                	xchg   %ax,%ax
80101f5c:	66 90                	xchg   %ax,%ax
80101f5e:	66 90                	xchg   %ax,%ax

80101f60 <idestart>:
80101f60:	55                   	push   %ebp
80101f61:	89 e5                	mov    %esp,%ebp
80101f63:	57                   	push   %edi
80101f64:	56                   	push   %esi
80101f65:	53                   	push   %ebx
80101f66:	83 ec 0c             	sub    $0xc,%esp
80101f69:	85 c0                	test   %eax,%eax
80101f6b:	0f 84 b4 00 00 00    	je     80102025 <idestart+0xc5>
80101f71:	8b 58 08             	mov    0x8(%eax),%ebx
80101f74:	89 c6                	mov    %eax,%esi
80101f76:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f7c:	0f 87 96 00 00 00    	ja     80102018 <idestart+0xb8>
80101f82:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101f87:	89 f6                	mov    %esi,%esi
80101f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f90:	89 ca                	mov    %ecx,%edx
80101f92:	ec                   	in     (%dx),%al
80101f93:	83 e0 c0             	and    $0xffffffc0,%eax
80101f96:	3c 40                	cmp    $0x40,%al
80101f98:	75 f6                	jne    80101f90 <idestart+0x30>
80101f9a:	31 ff                	xor    %edi,%edi
80101f9c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101fa1:	89 f8                	mov    %edi,%eax
80101fa3:	ee                   	out    %al,(%dx)
80101fa4:	b8 01 00 00 00       	mov    $0x1,%eax
80101fa9:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101fae:	ee                   	out    %al,(%dx)
80101faf:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101fb4:	89 d8                	mov    %ebx,%eax
80101fb6:	ee                   	out    %al,(%dx)
80101fb7:	89 d8                	mov    %ebx,%eax
80101fb9:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101fbe:	c1 f8 08             	sar    $0x8,%eax
80101fc1:	ee                   	out    %al,(%dx)
80101fc2:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101fc7:	89 f8                	mov    %edi,%eax
80101fc9:	ee                   	out    %al,(%dx)
80101fca:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101fce:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fd3:	c1 e0 04             	shl    $0x4,%eax
80101fd6:	83 e0 10             	and    $0x10,%eax
80101fd9:	83 c8 e0             	or     $0xffffffe0,%eax
80101fdc:	ee                   	out    %al,(%dx)
80101fdd:	f6 06 04             	testb  $0x4,(%esi)
80101fe0:	75 16                	jne    80101ff8 <idestart+0x98>
80101fe2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fe7:	89 ca                	mov    %ecx,%edx
80101fe9:	ee                   	out    %al,(%dx)
80101fea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fed:	5b                   	pop    %ebx
80101fee:	5e                   	pop    %esi
80101fef:	5f                   	pop    %edi
80101ff0:	5d                   	pop    %ebp
80101ff1:	c3                   	ret    
80101ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101ff8:	b8 30 00 00 00       	mov    $0x30,%eax
80101ffd:	89 ca                	mov    %ecx,%edx
80101fff:	ee                   	out    %al,(%dx)
80102000:	b9 80 00 00 00       	mov    $0x80,%ecx
80102005:	83 c6 5c             	add    $0x5c,%esi
80102008:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010200d:	fc                   	cld    
8010200e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80102010:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102013:	5b                   	pop    %ebx
80102014:	5e                   	pop    %esi
80102015:	5f                   	pop    %edi
80102016:	5d                   	pop    %ebp
80102017:	c3                   	ret    
80102018:	83 ec 0c             	sub    $0xc,%esp
8010201b:	68 f4 7a 10 80       	push   $0x80107af4
80102020:	e8 6b e3 ff ff       	call   80100390 <panic>
80102025:	83 ec 0c             	sub    $0xc,%esp
80102028:	68 eb 7a 10 80       	push   $0x80107aeb
8010202d:	e8 5e e3 ff ff       	call   80100390 <panic>
80102032:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102040 <ideinit>:
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	83 ec 10             	sub    $0x10,%esp
80102046:	68 06 7b 10 80       	push   $0x80107b06
8010204b:	68 80 b5 10 80       	push   $0x8010b580
80102050:	e8 4b 26 00 00       	call   801046a0 <initlock>
80102055:	58                   	pop    %eax
80102056:	a1 e0 46 11 80       	mov    0x801146e0,%eax
8010205b:	5a                   	pop    %edx
8010205c:	83 e8 01             	sub    $0x1,%eax
8010205f:	50                   	push   %eax
80102060:	6a 0e                	push   $0xe
80102062:	e8 a9 02 00 00       	call   80102310 <ioapicenable>
80102067:	83 c4 10             	add    $0x10,%esp
8010206a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010206f:	90                   	nop
80102070:	ec                   	in     (%dx),%al
80102071:	83 e0 c0             	and    $0xffffffc0,%eax
80102074:	3c 40                	cmp    $0x40,%al
80102076:	75 f8                	jne    80102070 <ideinit+0x30>
80102078:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010207d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102082:	ee                   	out    %al,(%dx)
80102083:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102088:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010208d:	eb 06                	jmp    80102095 <ideinit+0x55>
8010208f:	90                   	nop
80102090:	83 e9 01             	sub    $0x1,%ecx
80102093:	74 0f                	je     801020a4 <ideinit+0x64>
80102095:	ec                   	in     (%dx),%al
80102096:	84 c0                	test   %al,%al
80102098:	74 f6                	je     80102090 <ideinit+0x50>
8010209a:	c7 05 60 b5 10 80 01 	movl   $0x1,0x8010b560
801020a1:	00 00 00 
801020a4:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801020a9:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020ae:	ee                   	out    %al,(%dx)
801020af:	c9                   	leave  
801020b0:	c3                   	ret    
801020b1:	eb 0d                	jmp    801020c0 <ideintr>
801020b3:	90                   	nop
801020b4:	90                   	nop
801020b5:	90                   	nop
801020b6:	90                   	nop
801020b7:	90                   	nop
801020b8:	90                   	nop
801020b9:	90                   	nop
801020ba:	90                   	nop
801020bb:	90                   	nop
801020bc:	90                   	nop
801020bd:	90                   	nop
801020be:	90                   	nop
801020bf:	90                   	nop

801020c0 <ideintr>:
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	57                   	push   %edi
801020c4:	56                   	push   %esi
801020c5:	53                   	push   %ebx
801020c6:	83 ec 18             	sub    $0x18,%esp
801020c9:	68 80 b5 10 80       	push   $0x8010b580
801020ce:	e8 0d 27 00 00       	call   801047e0 <acquire>
801020d3:	8b 1d 64 b5 10 80    	mov    0x8010b564,%ebx
801020d9:	83 c4 10             	add    $0x10,%esp
801020dc:	85 db                	test   %ebx,%ebx
801020de:	74 67                	je     80102147 <ideintr+0x87>
801020e0:	8b 43 58             	mov    0x58(%ebx),%eax
801020e3:	a3 64 b5 10 80       	mov    %eax,0x8010b564
801020e8:	8b 3b                	mov    (%ebx),%edi
801020ea:	f7 c7 04 00 00 00    	test   $0x4,%edi
801020f0:	75 31                	jne    80102123 <ideintr+0x63>
801020f2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020f7:	89 f6                	mov    %esi,%esi
801020f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102100:	ec                   	in     (%dx),%al
80102101:	89 c6                	mov    %eax,%esi
80102103:	83 e6 c0             	and    $0xffffffc0,%esi
80102106:	89 f1                	mov    %esi,%ecx
80102108:	80 f9 40             	cmp    $0x40,%cl
8010210b:	75 f3                	jne    80102100 <ideintr+0x40>
8010210d:	a8 21                	test   $0x21,%al
8010210f:	75 12                	jne    80102123 <ideintr+0x63>
80102111:	8d 7b 5c             	lea    0x5c(%ebx),%edi
80102114:	b9 80 00 00 00       	mov    $0x80,%ecx
80102119:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010211e:	fc                   	cld    
8010211f:	f3 6d                	rep insl (%dx),%es:(%edi)
80102121:	8b 3b                	mov    (%ebx),%edi
80102123:	83 e7 fb             	and    $0xfffffffb,%edi
80102126:	83 ec 0c             	sub    $0xc,%esp
80102129:	89 f9                	mov    %edi,%ecx
8010212b:	83 c9 02             	or     $0x2,%ecx
8010212e:	89 0b                	mov    %ecx,(%ebx)
80102130:	53                   	push   %ebx
80102131:	e8 4a 1f 00 00       	call   80104080 <wakeup>
80102136:	a1 64 b5 10 80       	mov    0x8010b564,%eax
8010213b:	83 c4 10             	add    $0x10,%esp
8010213e:	85 c0                	test   %eax,%eax
80102140:	74 05                	je     80102147 <ideintr+0x87>
80102142:	e8 19 fe ff ff       	call   80101f60 <idestart>
80102147:	83 ec 0c             	sub    $0xc,%esp
8010214a:	68 80 b5 10 80       	push   $0x8010b580
8010214f:	e8 4c 27 00 00       	call   801048a0 <release>
80102154:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102157:	5b                   	pop    %ebx
80102158:	5e                   	pop    %esi
80102159:	5f                   	pop    %edi
8010215a:	5d                   	pop    %ebp
8010215b:	c3                   	ret    
8010215c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102160 <iderw>:
80102160:	55                   	push   %ebp
80102161:	89 e5                	mov    %esp,%ebp
80102163:	53                   	push   %ebx
80102164:	83 ec 10             	sub    $0x10,%esp
80102167:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010216a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010216d:	50                   	push   %eax
8010216e:	e8 dd 24 00 00       	call   80104650 <holdingsleep>
80102173:	83 c4 10             	add    $0x10,%esp
80102176:	85 c0                	test   %eax,%eax
80102178:	0f 84 c6 00 00 00    	je     80102244 <iderw+0xe4>
8010217e:	8b 03                	mov    (%ebx),%eax
80102180:	83 e0 06             	and    $0x6,%eax
80102183:	83 f8 02             	cmp    $0x2,%eax
80102186:	0f 84 ab 00 00 00    	je     80102237 <iderw+0xd7>
8010218c:	8b 53 04             	mov    0x4(%ebx),%edx
8010218f:	85 d2                	test   %edx,%edx
80102191:	74 0d                	je     801021a0 <iderw+0x40>
80102193:	a1 60 b5 10 80       	mov    0x8010b560,%eax
80102198:	85 c0                	test   %eax,%eax
8010219a:	0f 84 b1 00 00 00    	je     80102251 <iderw+0xf1>
801021a0:	83 ec 0c             	sub    $0xc,%esp
801021a3:	68 80 b5 10 80       	push   $0x8010b580
801021a8:	e8 33 26 00 00       	call   801047e0 <acquire>
801021ad:	8b 15 64 b5 10 80    	mov    0x8010b564,%edx
801021b3:	83 c4 10             	add    $0x10,%esp
801021b6:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801021bd:	85 d2                	test   %edx,%edx
801021bf:	75 09                	jne    801021ca <iderw+0x6a>
801021c1:	eb 6d                	jmp    80102230 <iderw+0xd0>
801021c3:	90                   	nop
801021c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801021c8:	89 c2                	mov    %eax,%edx
801021ca:	8b 42 58             	mov    0x58(%edx),%eax
801021cd:	85 c0                	test   %eax,%eax
801021cf:	75 f7                	jne    801021c8 <iderw+0x68>
801021d1:	83 c2 58             	add    $0x58,%edx
801021d4:	89 1a                	mov    %ebx,(%edx)
801021d6:	39 1d 64 b5 10 80    	cmp    %ebx,0x8010b564
801021dc:	74 42                	je     80102220 <iderw+0xc0>
801021de:	8b 03                	mov    (%ebx),%eax
801021e0:	83 e0 06             	and    $0x6,%eax
801021e3:	83 f8 02             	cmp    $0x2,%eax
801021e6:	74 23                	je     8010220b <iderw+0xab>
801021e8:	90                   	nop
801021e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021f0:	83 ec 08             	sub    $0x8,%esp
801021f3:	68 80 b5 10 80       	push   $0x8010b580
801021f8:	53                   	push   %ebx
801021f9:	e8 c2 1c 00 00       	call   80103ec0 <sleep>
801021fe:	8b 03                	mov    (%ebx),%eax
80102200:	83 c4 10             	add    $0x10,%esp
80102203:	83 e0 06             	and    $0x6,%eax
80102206:	83 f8 02             	cmp    $0x2,%eax
80102209:	75 e5                	jne    801021f0 <iderw+0x90>
8010220b:	c7 45 08 80 b5 10 80 	movl   $0x8010b580,0x8(%ebp)
80102212:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102215:	c9                   	leave  
80102216:	e9 85 26 00 00       	jmp    801048a0 <release>
8010221b:	90                   	nop
8010221c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102220:	89 d8                	mov    %ebx,%eax
80102222:	e8 39 fd ff ff       	call   80101f60 <idestart>
80102227:	eb b5                	jmp    801021de <iderw+0x7e>
80102229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102230:	ba 64 b5 10 80       	mov    $0x8010b564,%edx
80102235:	eb 9d                	jmp    801021d4 <iderw+0x74>
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 20 7b 10 80       	push   $0x80107b20
8010223f:	e8 4c e1 ff ff       	call   80100390 <panic>
80102244:	83 ec 0c             	sub    $0xc,%esp
80102247:	68 0a 7b 10 80       	push   $0x80107b0a
8010224c:	e8 3f e1 ff ff       	call   80100390 <panic>
80102251:	83 ec 0c             	sub    $0xc,%esp
80102254:	68 35 7b 10 80       	push   $0x80107b35
80102259:	e8 32 e1 ff ff       	call   80100390 <panic>
8010225e:	66 90                	xchg   %ax,%ax

80102260 <ioapicinit>:
80102260:	55                   	push   %ebp
80102261:	c7 05 14 40 11 80 00 	movl   $0xfec00000,0x80114014
80102268:	00 c0 fe 
8010226b:	89 e5                	mov    %esp,%ebp
8010226d:	56                   	push   %esi
8010226e:	53                   	push   %ebx
8010226f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102276:	00 00 00 
80102279:	a1 14 40 11 80       	mov    0x80114014,%eax
8010227e:	8b 58 10             	mov    0x10(%eax),%ebx
80102281:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80102287:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
8010228d:	0f b6 15 40 41 11 80 	movzbl 0x80114140,%edx
80102294:	c1 eb 10             	shr    $0x10,%ebx
80102297:	8b 41 10             	mov    0x10(%ecx),%eax
8010229a:	0f b6 db             	movzbl %bl,%ebx
8010229d:	c1 e8 18             	shr    $0x18,%eax
801022a0:	39 c2                	cmp    %eax,%edx
801022a2:	74 16                	je     801022ba <ioapicinit+0x5a>
801022a4:	83 ec 0c             	sub    $0xc,%esp
801022a7:	68 54 7b 10 80       	push   $0x80107b54
801022ac:	e8 af e3 ff ff       	call   80100660 <cprintf>
801022b1:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
801022b7:	83 c4 10             	add    $0x10,%esp
801022ba:	83 c3 21             	add    $0x21,%ebx
801022bd:	ba 10 00 00 00       	mov    $0x10,%edx
801022c2:	b8 20 00 00 00       	mov    $0x20,%eax
801022c7:	89 f6                	mov    %esi,%esi
801022c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801022d0:	89 11                	mov    %edx,(%ecx)
801022d2:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
801022d8:	89 c6                	mov    %eax,%esi
801022da:	81 ce 00 00 01 00    	or     $0x10000,%esi
801022e0:	83 c0 01             	add    $0x1,%eax
801022e3:	89 71 10             	mov    %esi,0x10(%ecx)
801022e6:	8d 72 01             	lea    0x1(%edx),%esi
801022e9:	83 c2 02             	add    $0x2,%edx
801022ec:	39 d8                	cmp    %ebx,%eax
801022ee:	89 31                	mov    %esi,(%ecx)
801022f0:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
801022f6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
801022fd:	75 d1                	jne    801022d0 <ioapicinit+0x70>
801022ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102302:	5b                   	pop    %ebx
80102303:	5e                   	pop    %esi
80102304:	5d                   	pop    %ebp
80102305:	c3                   	ret    
80102306:	8d 76 00             	lea    0x0(%esi),%esi
80102309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102310 <ioapicenable>:
80102310:	55                   	push   %ebp
80102311:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
80102317:	89 e5                	mov    %esp,%ebp
80102319:	8b 45 08             	mov    0x8(%ebp),%eax
8010231c:	8d 50 20             	lea    0x20(%eax),%edx
8010231f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102323:	89 01                	mov    %eax,(%ecx)
80102325:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
8010232b:	83 c0 01             	add    $0x1,%eax
8010232e:	89 51 10             	mov    %edx,0x10(%ecx)
80102331:	8b 55 0c             	mov    0xc(%ebp),%edx
80102334:	89 01                	mov    %eax,(%ecx)
80102336:	a1 14 40 11 80       	mov    0x80114014,%eax
8010233b:	c1 e2 18             	shl    $0x18,%edx
8010233e:	89 50 10             	mov    %edx,0x10(%eax)
80102341:	5d                   	pop    %ebp
80102342:	c3                   	ret    
80102343:	66 90                	xchg   %ax,%ax
80102345:	66 90                	xchg   %ax,%ax
80102347:	66 90                	xchg   %ax,%ax
80102349:	66 90                	xchg   %ax,%ax
8010234b:	66 90                	xchg   %ax,%ax
8010234d:	66 90                	xchg   %ax,%ax
8010234f:	90                   	nop

80102350 <kfree>:
80102350:	55                   	push   %ebp
80102351:	89 e5                	mov    %esp,%ebp
80102353:	53                   	push   %ebx
80102354:	83 ec 04             	sub    $0x4,%esp
80102357:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010235a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102360:	75 70                	jne    801023d2 <kfree+0x82>
80102362:	81 fb 88 70 11 80    	cmp    $0x80117088,%ebx
80102368:	72 68                	jb     801023d2 <kfree+0x82>
8010236a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102370:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102375:	77 5b                	ja     801023d2 <kfree+0x82>
80102377:	83 ec 04             	sub    $0x4,%esp
8010237a:	68 00 10 00 00       	push   $0x1000
8010237f:	6a 01                	push   $0x1
80102381:	53                   	push   %ebx
80102382:	e8 69 25 00 00       	call   801048f0 <memset>
80102387:	8b 15 54 40 11 80    	mov    0x80114054,%edx
8010238d:	83 c4 10             	add    $0x10,%esp
80102390:	85 d2                	test   %edx,%edx
80102392:	75 2c                	jne    801023c0 <kfree+0x70>
80102394:	a1 58 40 11 80       	mov    0x80114058,%eax
80102399:	89 03                	mov    %eax,(%ebx)
8010239b:	a1 54 40 11 80       	mov    0x80114054,%eax
801023a0:	89 1d 58 40 11 80    	mov    %ebx,0x80114058
801023a6:	85 c0                	test   %eax,%eax
801023a8:	75 06                	jne    801023b0 <kfree+0x60>
801023aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ad:	c9                   	leave  
801023ae:	c3                   	ret    
801023af:	90                   	nop
801023b0:	c7 45 08 20 40 11 80 	movl   $0x80114020,0x8(%ebp)
801023b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ba:	c9                   	leave  
801023bb:	e9 e0 24 00 00       	jmp    801048a0 <release>
801023c0:	83 ec 0c             	sub    $0xc,%esp
801023c3:	68 20 40 11 80       	push   $0x80114020
801023c8:	e8 13 24 00 00       	call   801047e0 <acquire>
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	eb c2                	jmp    80102394 <kfree+0x44>
801023d2:	83 ec 0c             	sub    $0xc,%esp
801023d5:	68 86 7b 10 80       	push   $0x80107b86
801023da:	e8 b1 df ff ff       	call   80100390 <panic>
801023df:	90                   	nop

801023e0 <freerange>:
801023e0:	55                   	push   %ebp
801023e1:	89 e5                	mov    %esp,%ebp
801023e3:	56                   	push   %esi
801023e4:	53                   	push   %ebx
801023e5:	8b 45 08             	mov    0x8(%ebp),%eax
801023e8:	8b 75 0c             	mov    0xc(%ebp),%esi
801023eb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023f7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fd:	39 de                	cmp    %ebx,%esi
801023ff:	72 23                	jb     80102424 <freerange+0x44>
80102401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102408:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010240e:	83 ec 0c             	sub    $0xc,%esp
80102411:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102417:	50                   	push   %eax
80102418:	e8 33 ff ff ff       	call   80102350 <kfree>
8010241d:	83 c4 10             	add    $0x10,%esp
80102420:	39 f3                	cmp    %esi,%ebx
80102422:	76 e4                	jbe    80102408 <freerange+0x28>
80102424:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102427:	5b                   	pop    %ebx
80102428:	5e                   	pop    %esi
80102429:	5d                   	pop    %ebp
8010242a:	c3                   	ret    
8010242b:	90                   	nop
8010242c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102430 <kinit1>:
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx
80102435:	8b 75 0c             	mov    0xc(%ebp),%esi
80102438:	83 ec 08             	sub    $0x8,%esp
8010243b:	68 8c 7b 10 80       	push   $0x80107b8c
80102440:	68 20 40 11 80       	push   $0x80114020
80102445:	e8 56 22 00 00       	call   801046a0 <initlock>
8010244a:	8b 45 08             	mov    0x8(%ebp),%eax
8010244d:	83 c4 10             	add    $0x10,%esp
80102450:	c7 05 54 40 11 80 00 	movl   $0x0,0x80114054
80102457:	00 00 00 
8010245a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102460:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102466:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010246c:	39 de                	cmp    %ebx,%esi
8010246e:	72 1c                	jb     8010248c <kinit1+0x5c>
80102470:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102476:	83 ec 0c             	sub    $0xc,%esp
80102479:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010247f:	50                   	push   %eax
80102480:	e8 cb fe ff ff       	call   80102350 <kfree>
80102485:	83 c4 10             	add    $0x10,%esp
80102488:	39 de                	cmp    %ebx,%esi
8010248a:	73 e4                	jae    80102470 <kinit1+0x40>
8010248c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010248f:	5b                   	pop    %ebx
80102490:	5e                   	pop    %esi
80102491:	5d                   	pop    %ebp
80102492:	c3                   	ret    
80102493:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024a0 <kinit2>:
801024a0:	55                   	push   %ebp
801024a1:	89 e5                	mov    %esp,%ebp
801024a3:	56                   	push   %esi
801024a4:	53                   	push   %ebx
801024a5:	8b 45 08             	mov    0x8(%ebp),%eax
801024a8:	8b 75 0c             	mov    0xc(%ebp),%esi
801024ab:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024b1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801024b7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024bd:	39 de                	cmp    %ebx,%esi
801024bf:	72 23                	jb     801024e4 <kinit2+0x44>
801024c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801024c8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024ce:	83 ec 0c             	sub    $0xc,%esp
801024d1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024d7:	50                   	push   %eax
801024d8:	e8 73 fe ff ff       	call   80102350 <kfree>
801024dd:	83 c4 10             	add    $0x10,%esp
801024e0:	39 de                	cmp    %ebx,%esi
801024e2:	73 e4                	jae    801024c8 <kinit2+0x28>
801024e4:	c7 05 54 40 11 80 01 	movl   $0x1,0x80114054
801024eb:	00 00 00 
801024ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024f1:	5b                   	pop    %ebx
801024f2:	5e                   	pop    %esi
801024f3:	5d                   	pop    %ebp
801024f4:	c3                   	ret    
801024f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102500 <kalloc>:
80102500:	a1 54 40 11 80       	mov    0x80114054,%eax
80102505:	85 c0                	test   %eax,%eax
80102507:	75 1f                	jne    80102528 <kalloc+0x28>
80102509:	a1 58 40 11 80       	mov    0x80114058,%eax
8010250e:	85 c0                	test   %eax,%eax
80102510:	74 0e                	je     80102520 <kalloc+0x20>
80102512:	8b 10                	mov    (%eax),%edx
80102514:	89 15 58 40 11 80    	mov    %edx,0x80114058
8010251a:	c3                   	ret    
8010251b:	90                   	nop
8010251c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102520:	f3 c3                	repz ret 
80102522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102528:	55                   	push   %ebp
80102529:	89 e5                	mov    %esp,%ebp
8010252b:	83 ec 24             	sub    $0x24,%esp
8010252e:	68 20 40 11 80       	push   $0x80114020
80102533:	e8 a8 22 00 00       	call   801047e0 <acquire>
80102538:	a1 58 40 11 80       	mov    0x80114058,%eax
8010253d:	83 c4 10             	add    $0x10,%esp
80102540:	8b 15 54 40 11 80    	mov    0x80114054,%edx
80102546:	85 c0                	test   %eax,%eax
80102548:	74 08                	je     80102552 <kalloc+0x52>
8010254a:	8b 08                	mov    (%eax),%ecx
8010254c:	89 0d 58 40 11 80    	mov    %ecx,0x80114058
80102552:	85 d2                	test   %edx,%edx
80102554:	74 16                	je     8010256c <kalloc+0x6c>
80102556:	83 ec 0c             	sub    $0xc,%esp
80102559:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010255c:	68 20 40 11 80       	push   $0x80114020
80102561:	e8 3a 23 00 00       	call   801048a0 <release>
80102566:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102569:	83 c4 10             	add    $0x10,%esp
8010256c:	c9                   	leave  
8010256d:	c3                   	ret    
8010256e:	66 90                	xchg   %ax,%ax

80102570 <kbdgetc>:
80102570:	ba 64 00 00 00       	mov    $0x64,%edx
80102575:	ec                   	in     (%dx),%al
80102576:	a8 01                	test   $0x1,%al
80102578:	0f 84 c2 00 00 00    	je     80102640 <kbdgetc+0xd0>
8010257e:	ba 60 00 00 00       	mov    $0x60,%edx
80102583:	ec                   	in     (%dx),%al
80102584:	0f b6 d0             	movzbl %al,%edx
80102587:	8b 0d b4 b5 10 80    	mov    0x8010b5b4,%ecx
8010258d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102593:	0f 84 7f 00 00 00    	je     80102618 <kbdgetc+0xa8>
80102599:	55                   	push   %ebp
8010259a:	89 e5                	mov    %esp,%ebp
8010259c:	53                   	push   %ebx
8010259d:	89 cb                	mov    %ecx,%ebx
8010259f:	83 e3 40             	and    $0x40,%ebx
801025a2:	84 c0                	test   %al,%al
801025a4:	78 4a                	js     801025f0 <kbdgetc+0x80>
801025a6:	85 db                	test   %ebx,%ebx
801025a8:	74 09                	je     801025b3 <kbdgetc+0x43>
801025aa:	83 c8 80             	or     $0xffffff80,%eax
801025ad:	83 e1 bf             	and    $0xffffffbf,%ecx
801025b0:	0f b6 d0             	movzbl %al,%edx
801025b3:	0f b6 82 c0 7c 10 80 	movzbl -0x7fef8340(%edx),%eax
801025ba:	09 c1                	or     %eax,%ecx
801025bc:	0f b6 82 c0 7b 10 80 	movzbl -0x7fef8440(%edx),%eax
801025c3:	31 c1                	xor    %eax,%ecx
801025c5:	89 c8                	mov    %ecx,%eax
801025c7:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
801025cd:	83 e0 03             	and    $0x3,%eax
801025d0:	83 e1 08             	and    $0x8,%ecx
801025d3:	8b 04 85 a0 7b 10 80 	mov    -0x7fef8460(,%eax,4),%eax
801025da:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
801025de:	74 31                	je     80102611 <kbdgetc+0xa1>
801025e0:	8d 50 9f             	lea    -0x61(%eax),%edx
801025e3:	83 fa 19             	cmp    $0x19,%edx
801025e6:	77 40                	ja     80102628 <kbdgetc+0xb8>
801025e8:	83 e8 20             	sub    $0x20,%eax
801025eb:	5b                   	pop    %ebx
801025ec:	5d                   	pop    %ebp
801025ed:	c3                   	ret    
801025ee:	66 90                	xchg   %ax,%ax
801025f0:	83 e0 7f             	and    $0x7f,%eax
801025f3:	85 db                	test   %ebx,%ebx
801025f5:	0f 44 d0             	cmove  %eax,%edx
801025f8:	0f b6 82 c0 7c 10 80 	movzbl -0x7fef8340(%edx),%eax
801025ff:	83 c8 40             	or     $0x40,%eax
80102602:	0f b6 c0             	movzbl %al,%eax
80102605:	f7 d0                	not    %eax
80102607:	21 c1                	and    %eax,%ecx
80102609:	31 c0                	xor    %eax,%eax
8010260b:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
80102611:	5b                   	pop    %ebx
80102612:	5d                   	pop    %ebp
80102613:	c3                   	ret    
80102614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102618:	83 c9 40             	or     $0x40,%ecx
8010261b:	31 c0                	xor    %eax,%eax
8010261d:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
80102623:	c3                   	ret    
80102624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102628:	8d 48 bf             	lea    -0x41(%eax),%ecx
8010262b:	8d 50 20             	lea    0x20(%eax),%edx
8010262e:	5b                   	pop    %ebx
8010262f:	83 f9 1a             	cmp    $0x1a,%ecx
80102632:	0f 42 c2             	cmovb  %edx,%eax
80102635:	5d                   	pop    %ebp
80102636:	c3                   	ret    
80102637:	89 f6                	mov    %esi,%esi
80102639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102640:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102645:	c3                   	ret    
80102646:	8d 76 00             	lea    0x0(%esi),%esi
80102649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102650 <kbdintr>:
80102650:	55                   	push   %ebp
80102651:	89 e5                	mov    %esp,%ebp
80102653:	83 ec 14             	sub    $0x14,%esp
80102656:	68 70 25 10 80       	push   $0x80102570
8010265b:	e8 f0 e1 ff ff       	call   80100850 <consoleintr>
80102660:	83 c4 10             	add    $0x10,%esp
80102663:	c9                   	leave  
80102664:	c3                   	ret    
80102665:	66 90                	xchg   %ax,%ax
80102667:	66 90                	xchg   %ax,%ax
80102669:	66 90                	xchg   %ax,%ax
8010266b:	66 90                	xchg   %ax,%ax
8010266d:	66 90                	xchg   %ax,%ax
8010266f:	90                   	nop

80102670 <lapicinit>:
80102670:	a1 5c 40 11 80       	mov    0x8011405c,%eax
80102675:	55                   	push   %ebp
80102676:	89 e5                	mov    %esp,%ebp
80102678:	85 c0                	test   %eax,%eax
8010267a:	0f 84 c8 00 00 00    	je     80102748 <lapicinit+0xd8>
80102680:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102687:	01 00 00 
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
8010268d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102694:	00 00 00 
80102697:	8b 50 20             	mov    0x20(%eax),%edx
8010269a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026a1:	00 02 00 
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
801026a7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026ae:	96 98 00 
801026b1:	8b 50 20             	mov    0x20(%eax),%edx
801026b4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026bb:	00 01 00 
801026be:	8b 50 20             	mov    0x20(%eax),%edx
801026c1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026c8:	00 01 00 
801026cb:	8b 50 20             	mov    0x20(%eax),%edx
801026ce:	8b 50 30             	mov    0x30(%eax),%edx
801026d1:	c1 ea 10             	shr    $0x10,%edx
801026d4:	80 fa 03             	cmp    $0x3,%dl
801026d7:	77 77                	ja     80102750 <lapicinit+0xe0>
801026d9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026e0:	00 00 00 
801026e3:	8b 50 20             	mov    0x20(%eax),%edx
801026e6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ed:	00 00 00 
801026f0:	8b 50 20             	mov    0x20(%eax),%edx
801026f3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026fa:	00 00 00 
801026fd:	8b 50 20             	mov    0x20(%eax),%edx
80102700:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102707:	00 00 00 
8010270a:	8b 50 20             	mov    0x20(%eax),%edx
8010270d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102714:	00 00 00 
80102717:	8b 50 20             	mov    0x20(%eax),%edx
8010271a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102721:	85 08 00 
80102724:	8b 50 20             	mov    0x20(%eax),%edx
80102727:	89 f6                	mov    %esi,%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102730:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102736:	80 e6 10             	and    $0x10,%dh
80102739:	75 f5                	jne    80102730 <lapicinit+0xc0>
8010273b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102742:	00 00 00 
80102745:	8b 40 20             	mov    0x20(%eax),%eax
80102748:	5d                   	pop    %ebp
80102749:	c3                   	ret    
8010274a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102750:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102757:	00 01 00 
8010275a:	8b 50 20             	mov    0x20(%eax),%edx
8010275d:	e9 77 ff ff ff       	jmp    801026d9 <lapicinit+0x69>
80102762:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102770 <lapicid>:
80102770:	8b 15 5c 40 11 80    	mov    0x8011405c,%edx
80102776:	55                   	push   %ebp
80102777:	31 c0                	xor    %eax,%eax
80102779:	89 e5                	mov    %esp,%ebp
8010277b:	85 d2                	test   %edx,%edx
8010277d:	74 06                	je     80102785 <lapicid+0x15>
8010277f:	8b 42 20             	mov    0x20(%edx),%eax
80102782:	c1 e8 18             	shr    $0x18,%eax
80102785:	5d                   	pop    %ebp
80102786:	c3                   	ret    
80102787:	89 f6                	mov    %esi,%esi
80102789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102790 <lapiceoi>:
80102790:	a1 5c 40 11 80       	mov    0x8011405c,%eax
80102795:	55                   	push   %ebp
80102796:	89 e5                	mov    %esp,%ebp
80102798:	85 c0                	test   %eax,%eax
8010279a:	74 0d                	je     801027a9 <lapiceoi+0x19>
8010279c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027a3:	00 00 00 
801027a6:	8b 40 20             	mov    0x20(%eax),%eax
801027a9:	5d                   	pop    %ebp
801027aa:	c3                   	ret    
801027ab:	90                   	nop
801027ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027b0 <microdelay>:
801027b0:	55                   	push   %ebp
801027b1:	89 e5                	mov    %esp,%ebp
801027b3:	5d                   	pop    %ebp
801027b4:	c3                   	ret    
801027b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027c0 <lapicstartap>:
801027c0:	55                   	push   %ebp
801027c1:	b8 0f 00 00 00       	mov    $0xf,%eax
801027c6:	ba 70 00 00 00       	mov    $0x70,%edx
801027cb:	89 e5                	mov    %esp,%ebp
801027cd:	53                   	push   %ebx
801027ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027d4:	ee                   	out    %al,(%dx)
801027d5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027da:	ba 71 00 00 00       	mov    $0x71,%edx
801027df:	ee                   	out    %al,(%dx)
801027e0:	31 c0                	xor    %eax,%eax
801027e2:	c1 e3 18             	shl    $0x18,%ebx
801027e5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801027eb:	89 c8                	mov    %ecx,%eax
801027ed:	c1 e9 0c             	shr    $0xc,%ecx
801027f0:	c1 e8 04             	shr    $0x4,%eax
801027f3:	89 da                	mov    %ebx,%edx
801027f5:	80 cd 06             	or     $0x6,%ch
801027f8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801027fe:	a1 5c 40 11 80       	mov    0x8011405c,%eax
80102803:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102809:	8b 58 20             	mov    0x20(%eax),%ebx
8010280c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102813:	c5 00 00 
80102816:	8b 58 20             	mov    0x20(%eax),%ebx
80102819:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102820:	85 00 00 
80102823:	8b 58 20             	mov    0x20(%eax),%ebx
80102826:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010282c:	8b 58 20             	mov    0x20(%eax),%ebx
8010282f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102835:	8b 58 20             	mov    0x20(%eax),%ebx
80102838:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010283e:	8b 50 20             	mov    0x20(%eax),%edx
80102841:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102847:	8b 40 20             	mov    0x20(%eax),%eax
8010284a:	5b                   	pop    %ebx
8010284b:	5d                   	pop    %ebp
8010284c:	c3                   	ret    
8010284d:	8d 76 00             	lea    0x0(%esi),%esi

80102850 <cmostime>:
80102850:	55                   	push   %ebp
80102851:	b8 0b 00 00 00       	mov    $0xb,%eax
80102856:	ba 70 00 00 00       	mov    $0x70,%edx
8010285b:	89 e5                	mov    %esp,%ebp
8010285d:	57                   	push   %edi
8010285e:	56                   	push   %esi
8010285f:	53                   	push   %ebx
80102860:	83 ec 4c             	sub    $0x4c,%esp
80102863:	ee                   	out    %al,(%dx)
80102864:	ba 71 00 00 00       	mov    $0x71,%edx
80102869:	ec                   	in     (%dx),%al
8010286a:	83 e0 04             	and    $0x4,%eax
8010286d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102872:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102875:	8d 76 00             	lea    0x0(%esi),%esi
80102878:	31 c0                	xor    %eax,%eax
8010287a:	89 da                	mov    %ebx,%edx
8010287c:	ee                   	out    %al,(%dx)
8010287d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102882:	89 ca                	mov    %ecx,%edx
80102884:	ec                   	in     (%dx),%al
80102885:	88 45 b7             	mov    %al,-0x49(%ebp)
80102888:	89 da                	mov    %ebx,%edx
8010288a:	b8 02 00 00 00       	mov    $0x2,%eax
8010288f:	ee                   	out    %al,(%dx)
80102890:	89 ca                	mov    %ecx,%edx
80102892:	ec                   	in     (%dx),%al
80102893:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102896:	89 da                	mov    %ebx,%edx
80102898:	b8 04 00 00 00       	mov    $0x4,%eax
8010289d:	ee                   	out    %al,(%dx)
8010289e:	89 ca                	mov    %ecx,%edx
801028a0:	ec                   	in     (%dx),%al
801028a1:	88 45 b5             	mov    %al,-0x4b(%ebp)
801028a4:	89 da                	mov    %ebx,%edx
801028a6:	b8 07 00 00 00       	mov    $0x7,%eax
801028ab:	ee                   	out    %al,(%dx)
801028ac:	89 ca                	mov    %ecx,%edx
801028ae:	ec                   	in     (%dx),%al
801028af:	88 45 b4             	mov    %al,-0x4c(%ebp)
801028b2:	89 da                	mov    %ebx,%edx
801028b4:	b8 08 00 00 00       	mov    $0x8,%eax
801028b9:	ee                   	out    %al,(%dx)
801028ba:	89 ca                	mov    %ecx,%edx
801028bc:	ec                   	in     (%dx),%al
801028bd:	89 c7                	mov    %eax,%edi
801028bf:	89 da                	mov    %ebx,%edx
801028c1:	b8 09 00 00 00       	mov    $0x9,%eax
801028c6:	ee                   	out    %al,(%dx)
801028c7:	89 ca                	mov    %ecx,%edx
801028c9:	ec                   	in     (%dx),%al
801028ca:	89 c6                	mov    %eax,%esi
801028cc:	89 da                	mov    %ebx,%edx
801028ce:	b8 0a 00 00 00       	mov    $0xa,%eax
801028d3:	ee                   	out    %al,(%dx)
801028d4:	89 ca                	mov    %ecx,%edx
801028d6:	ec                   	in     (%dx),%al
801028d7:	84 c0                	test   %al,%al
801028d9:	78 9d                	js     80102878 <cmostime+0x28>
801028db:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801028df:	89 fa                	mov    %edi,%edx
801028e1:	0f b6 fa             	movzbl %dl,%edi
801028e4:	89 f2                	mov    %esi,%edx
801028e6:	0f b6 f2             	movzbl %dl,%esi
801028e9:	89 7d c8             	mov    %edi,-0x38(%ebp)
801028ec:	89 da                	mov    %ebx,%edx
801028ee:	89 75 cc             	mov    %esi,-0x34(%ebp)
801028f1:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028f4:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801028f8:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028fb:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801028ff:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102902:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102906:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102909:	31 c0                	xor    %eax,%eax
8010290b:	ee                   	out    %al,(%dx)
8010290c:	89 ca                	mov    %ecx,%edx
8010290e:	ec                   	in     (%dx),%al
8010290f:	0f b6 c0             	movzbl %al,%eax
80102912:	89 da                	mov    %ebx,%edx
80102914:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102917:	b8 02 00 00 00       	mov    $0x2,%eax
8010291c:	ee                   	out    %al,(%dx)
8010291d:	89 ca                	mov    %ecx,%edx
8010291f:	ec                   	in     (%dx),%al
80102920:	0f b6 c0             	movzbl %al,%eax
80102923:	89 da                	mov    %ebx,%edx
80102925:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102928:	b8 04 00 00 00       	mov    $0x4,%eax
8010292d:	ee                   	out    %al,(%dx)
8010292e:	89 ca                	mov    %ecx,%edx
80102930:	ec                   	in     (%dx),%al
80102931:	0f b6 c0             	movzbl %al,%eax
80102934:	89 da                	mov    %ebx,%edx
80102936:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102939:	b8 07 00 00 00       	mov    $0x7,%eax
8010293e:	ee                   	out    %al,(%dx)
8010293f:	89 ca                	mov    %ecx,%edx
80102941:	ec                   	in     (%dx),%al
80102942:	0f b6 c0             	movzbl %al,%eax
80102945:	89 da                	mov    %ebx,%edx
80102947:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010294a:	b8 08 00 00 00       	mov    $0x8,%eax
8010294f:	ee                   	out    %al,(%dx)
80102950:	89 ca                	mov    %ecx,%edx
80102952:	ec                   	in     (%dx),%al
80102953:	0f b6 c0             	movzbl %al,%eax
80102956:	89 da                	mov    %ebx,%edx
80102958:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010295b:	b8 09 00 00 00       	mov    $0x9,%eax
80102960:	ee                   	out    %al,(%dx)
80102961:	89 ca                	mov    %ecx,%edx
80102963:	ec                   	in     (%dx),%al
80102964:	0f b6 c0             	movzbl %al,%eax
80102967:	83 ec 04             	sub    $0x4,%esp
8010296a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010296d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102970:	6a 18                	push   $0x18
80102972:	50                   	push   %eax
80102973:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102976:	50                   	push   %eax
80102977:	e8 c4 1f 00 00       	call   80104940 <memcmp>
8010297c:	83 c4 10             	add    $0x10,%esp
8010297f:	85 c0                	test   %eax,%eax
80102981:	0f 85 f1 fe ff ff    	jne    80102878 <cmostime+0x28>
80102987:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
8010298b:	75 78                	jne    80102a05 <cmostime+0x1b5>
8010298d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102990:	89 c2                	mov    %eax,%edx
80102992:	83 e0 0f             	and    $0xf,%eax
80102995:	c1 ea 04             	shr    $0x4,%edx
80102998:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010299b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010299e:	89 45 b8             	mov    %eax,-0x48(%ebp)
801029a1:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029a4:	89 c2                	mov    %eax,%edx
801029a6:	83 e0 0f             	and    $0xf,%eax
801029a9:	c1 ea 04             	shr    $0x4,%edx
801029ac:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029af:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029b2:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029b5:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029b8:	89 c2                	mov    %eax,%edx
801029ba:	83 e0 0f             	and    $0xf,%eax
801029bd:	c1 ea 04             	shr    $0x4,%edx
801029c0:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029c3:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029c6:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029c9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029cc:	89 c2                	mov    %eax,%edx
801029ce:	83 e0 0f             	and    $0xf,%eax
801029d1:	c1 ea 04             	shr    $0x4,%edx
801029d4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029d7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029da:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029dd:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029e0:	89 c2                	mov    %eax,%edx
801029e2:	83 e0 0f             	and    $0xf,%eax
801029e5:	c1 ea 04             	shr    $0x4,%edx
801029e8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029eb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029ee:	89 45 c8             	mov    %eax,-0x38(%ebp)
801029f1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f4:	89 c2                	mov    %eax,%edx
801029f6:	83 e0 0f             	and    $0xf,%eax
801029f9:	c1 ea 04             	shr    $0x4,%edx
801029fc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029ff:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a02:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102a05:	8b 75 08             	mov    0x8(%ebp),%esi
80102a08:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a0b:	89 06                	mov    %eax,(%esi)
80102a0d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a10:	89 46 04             	mov    %eax,0x4(%esi)
80102a13:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a16:	89 46 08             	mov    %eax,0x8(%esi)
80102a19:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a1c:	89 46 0c             	mov    %eax,0xc(%esi)
80102a1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a22:	89 46 10             	mov    %eax,0x10(%esi)
80102a25:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a28:	89 46 14             	mov    %eax,0x14(%esi)
80102a2b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102a32:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a35:	5b                   	pop    %ebx
80102a36:	5e                   	pop    %esi
80102a37:	5f                   	pop    %edi
80102a38:	5d                   	pop    %ebp
80102a39:	c3                   	ret    
80102a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102a40 <unixtime>:
80102a40:	55                   	push   %ebp
80102a41:	89 e5                	mov    %esp,%ebp
80102a43:	83 ec 34             	sub    $0x34,%esp
80102a46:	8d 45 e0             	lea    -0x20(%ebp),%eax
80102a49:	50                   	push   %eax
80102a4a:	e8 01 fe ff ff       	call   80102850 <cmostime>
80102a4f:	69 55 f4 80 33 e1 01 	imul   $0x1e13380,-0xc(%ebp),%edx
80102a56:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102a59:	8d 84 02 00 b1 01 89 	lea    -0x76fe4f00(%edx,%eax,1),%eax
80102a60:	69 55 f0 00 8d 27 00 	imul   $0x278d00,-0x10(%ebp),%edx
80102a67:	01 d0                	add    %edx,%eax
80102a69:	69 55 ec 80 51 01 00 	imul   $0x15180,-0x14(%ebp),%edx
80102a70:	01 d0                	add    %edx,%eax
80102a72:	69 55 e8 10 0e 00 00 	imul   $0xe10,-0x18(%ebp),%edx
80102a79:	01 d0                	add    %edx,%eax
80102a7b:	6b 55 e4 3c          	imul   $0x3c,-0x1c(%ebp),%edx
80102a7f:	c9                   	leave  
80102a80:	01 d0                	add    %edx,%eax
80102a82:	c3                   	ret    
80102a83:	66 90                	xchg   %ax,%ax
80102a85:	66 90                	xchg   %ax,%ax
80102a87:	66 90                	xchg   %ax,%ax
80102a89:	66 90                	xchg   %ax,%ax
80102a8b:	66 90                	xchg   %ax,%ax
80102a8d:	66 90                	xchg   %ax,%ax
80102a8f:	90                   	nop

80102a90 <install_trans>:
80102a90:	8b 0d a8 40 11 80    	mov    0x801140a8,%ecx
80102a96:	85 c9                	test   %ecx,%ecx
80102a98:	0f 8e 8a 00 00 00    	jle    80102b28 <install_trans+0x98>
80102a9e:	55                   	push   %ebp
80102a9f:	89 e5                	mov    %esp,%ebp
80102aa1:	57                   	push   %edi
80102aa2:	56                   	push   %esi
80102aa3:	53                   	push   %ebx
80102aa4:	31 db                	xor    %ebx,%ebx
80102aa6:	83 ec 0c             	sub    $0xc,%esp
80102aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ab0:	a1 94 40 11 80       	mov    0x80114094,%eax
80102ab5:	83 ec 08             	sub    $0x8,%esp
80102ab8:	01 d8                	add    %ebx,%eax
80102aba:	83 c0 01             	add    $0x1,%eax
80102abd:	50                   	push   %eax
80102abe:	ff 35 a4 40 11 80    	pushl  0x801140a4
80102ac4:	e8 07 d6 ff ff       	call   801000d0 <bread>
80102ac9:	89 c7                	mov    %eax,%edi
80102acb:	58                   	pop    %eax
80102acc:	5a                   	pop    %edx
80102acd:	ff 34 9d ac 40 11 80 	pushl  -0x7feebf54(,%ebx,4)
80102ad4:	ff 35 a4 40 11 80    	pushl  0x801140a4
80102ada:	83 c3 01             	add    $0x1,%ebx
80102add:	e8 ee d5 ff ff       	call   801000d0 <bread>
80102ae2:	89 c6                	mov    %eax,%esi
80102ae4:	8d 47 5c             	lea    0x5c(%edi),%eax
80102ae7:	83 c4 0c             	add    $0xc,%esp
80102aea:	68 00 02 00 00       	push   $0x200
80102aef:	50                   	push   %eax
80102af0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102af3:	50                   	push   %eax
80102af4:	e8 a7 1e 00 00       	call   801049a0 <memmove>
80102af9:	89 34 24             	mov    %esi,(%esp)
80102afc:	e8 9f d6 ff ff       	call   801001a0 <bwrite>
80102b01:	89 3c 24             	mov    %edi,(%esp)
80102b04:	e8 d7 d6 ff ff       	call   801001e0 <brelse>
80102b09:	89 34 24             	mov    %esi,(%esp)
80102b0c:	e8 cf d6 ff ff       	call   801001e0 <brelse>
80102b11:	83 c4 10             	add    $0x10,%esp
80102b14:	39 1d a8 40 11 80    	cmp    %ebx,0x801140a8
80102b1a:	7f 94                	jg     80102ab0 <install_trans+0x20>
80102b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b1f:	5b                   	pop    %ebx
80102b20:	5e                   	pop    %esi
80102b21:	5f                   	pop    %edi
80102b22:	5d                   	pop    %ebp
80102b23:	c3                   	ret    
80102b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b28:	f3 c3                	repz ret 
80102b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102b30 <write_head>:
80102b30:	55                   	push   %ebp
80102b31:	89 e5                	mov    %esp,%ebp
80102b33:	56                   	push   %esi
80102b34:	53                   	push   %ebx
80102b35:	83 ec 08             	sub    $0x8,%esp
80102b38:	ff 35 94 40 11 80    	pushl  0x80114094
80102b3e:	ff 35 a4 40 11 80    	pushl  0x801140a4
80102b44:	e8 87 d5 ff ff       	call   801000d0 <bread>
80102b49:	8b 1d a8 40 11 80    	mov    0x801140a8,%ebx
80102b4f:	83 c4 10             	add    $0x10,%esp
80102b52:	89 c6                	mov    %eax,%esi
80102b54:	85 db                	test   %ebx,%ebx
80102b56:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102b59:	7e 16                	jle    80102b71 <write_head+0x41>
80102b5b:	c1 e3 02             	shl    $0x2,%ebx
80102b5e:	31 d2                	xor    %edx,%edx
80102b60:	8b 8a ac 40 11 80    	mov    -0x7feebf54(%edx),%ecx
80102b66:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102b6a:	83 c2 04             	add    $0x4,%edx
80102b6d:	39 da                	cmp    %ebx,%edx
80102b6f:	75 ef                	jne    80102b60 <write_head+0x30>
80102b71:	83 ec 0c             	sub    $0xc,%esp
80102b74:	56                   	push   %esi
80102b75:	e8 26 d6 ff ff       	call   801001a0 <bwrite>
80102b7a:	89 34 24             	mov    %esi,(%esp)
80102b7d:	e8 5e d6 ff ff       	call   801001e0 <brelse>
80102b82:	83 c4 10             	add    $0x10,%esp
80102b85:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b88:	5b                   	pop    %ebx
80102b89:	5e                   	pop    %esi
80102b8a:	5d                   	pop    %ebp
80102b8b:	c3                   	ret    
80102b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102b90 <initlog>:
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	53                   	push   %ebx
80102b94:	83 ec 2c             	sub    $0x2c,%esp
80102b97:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b9a:	68 c0 7d 10 80       	push   $0x80107dc0
80102b9f:	68 60 40 11 80       	push   $0x80114060
80102ba4:	e8 f7 1a 00 00       	call   801046a0 <initlock>
80102ba9:	58                   	pop    %eax
80102baa:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102bad:	5a                   	pop    %edx
80102bae:	50                   	push   %eax
80102baf:	53                   	push   %ebx
80102bb0:	e8 cb e8 ff ff       	call   80101480 <readsb>
80102bb5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102bb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102bbb:	59                   	pop    %ecx
80102bbc:	89 1d a4 40 11 80    	mov    %ebx,0x801140a4
80102bc2:	89 15 98 40 11 80    	mov    %edx,0x80114098
80102bc8:	a3 94 40 11 80       	mov    %eax,0x80114094
80102bcd:	5a                   	pop    %edx
80102bce:	50                   	push   %eax
80102bcf:	53                   	push   %ebx
80102bd0:	e8 fb d4 ff ff       	call   801000d0 <bread>
80102bd5:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102bd8:	83 c4 10             	add    $0x10,%esp
80102bdb:	85 db                	test   %ebx,%ebx
80102bdd:	89 1d a8 40 11 80    	mov    %ebx,0x801140a8
80102be3:	7e 1c                	jle    80102c01 <initlog+0x71>
80102be5:	c1 e3 02             	shl    $0x2,%ebx
80102be8:	31 d2                	xor    %edx,%edx
80102bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102bf0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102bf4:	83 c2 04             	add    $0x4,%edx
80102bf7:	89 8a a8 40 11 80    	mov    %ecx,-0x7feebf58(%edx)
80102bfd:	39 d3                	cmp    %edx,%ebx
80102bff:	75 ef                	jne    80102bf0 <initlog+0x60>
80102c01:	83 ec 0c             	sub    $0xc,%esp
80102c04:	50                   	push   %eax
80102c05:	e8 d6 d5 ff ff       	call   801001e0 <brelse>
80102c0a:	e8 81 fe ff ff       	call   80102a90 <install_trans>
80102c0f:	c7 05 a8 40 11 80 00 	movl   $0x0,0x801140a8
80102c16:	00 00 00 
80102c19:	e8 12 ff ff ff       	call   80102b30 <write_head>
80102c1e:	83 c4 10             	add    $0x10,%esp
80102c21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c24:	c9                   	leave  
80102c25:	c3                   	ret    
80102c26:	8d 76 00             	lea    0x0(%esi),%esi
80102c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c30 <begin_op>:
80102c30:	55                   	push   %ebp
80102c31:	89 e5                	mov    %esp,%ebp
80102c33:	83 ec 14             	sub    $0x14,%esp
80102c36:	68 60 40 11 80       	push   $0x80114060
80102c3b:	e8 a0 1b 00 00       	call   801047e0 <acquire>
80102c40:	83 c4 10             	add    $0x10,%esp
80102c43:	eb 18                	jmp    80102c5d <begin_op+0x2d>
80102c45:	8d 76 00             	lea    0x0(%esi),%esi
80102c48:	83 ec 08             	sub    $0x8,%esp
80102c4b:	68 60 40 11 80       	push   $0x80114060
80102c50:	68 60 40 11 80       	push   $0x80114060
80102c55:	e8 66 12 00 00       	call   80103ec0 <sleep>
80102c5a:	83 c4 10             	add    $0x10,%esp
80102c5d:	a1 a0 40 11 80       	mov    0x801140a0,%eax
80102c62:	85 c0                	test   %eax,%eax
80102c64:	75 e2                	jne    80102c48 <begin_op+0x18>
80102c66:	a1 9c 40 11 80       	mov    0x8011409c,%eax
80102c6b:	8b 15 a8 40 11 80    	mov    0x801140a8,%edx
80102c71:	83 c0 01             	add    $0x1,%eax
80102c74:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102c77:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102c7a:	83 fa 1e             	cmp    $0x1e,%edx
80102c7d:	7f c9                	jg     80102c48 <begin_op+0x18>
80102c7f:	83 ec 0c             	sub    $0xc,%esp
80102c82:	a3 9c 40 11 80       	mov    %eax,0x8011409c
80102c87:	68 60 40 11 80       	push   $0x80114060
80102c8c:	e8 0f 1c 00 00       	call   801048a0 <release>
80102c91:	83 c4 10             	add    $0x10,%esp
80102c94:	c9                   	leave  
80102c95:	c3                   	ret    
80102c96:	8d 76 00             	lea    0x0(%esi),%esi
80102c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ca0 <end_op>:
80102ca0:	55                   	push   %ebp
80102ca1:	89 e5                	mov    %esp,%ebp
80102ca3:	57                   	push   %edi
80102ca4:	56                   	push   %esi
80102ca5:	53                   	push   %ebx
80102ca6:	83 ec 18             	sub    $0x18,%esp
80102ca9:	68 60 40 11 80       	push   $0x80114060
80102cae:	e8 2d 1b 00 00       	call   801047e0 <acquire>
80102cb3:	a1 9c 40 11 80       	mov    0x8011409c,%eax
80102cb8:	8b 35 a0 40 11 80    	mov    0x801140a0,%esi
80102cbe:	83 c4 10             	add    $0x10,%esp
80102cc1:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102cc4:	85 f6                	test   %esi,%esi
80102cc6:	89 1d 9c 40 11 80    	mov    %ebx,0x8011409c
80102ccc:	0f 85 1a 01 00 00    	jne    80102dec <end_op+0x14c>
80102cd2:	85 db                	test   %ebx,%ebx
80102cd4:	0f 85 ee 00 00 00    	jne    80102dc8 <end_op+0x128>
80102cda:	83 ec 0c             	sub    $0xc,%esp
80102cdd:	c7 05 a0 40 11 80 01 	movl   $0x1,0x801140a0
80102ce4:	00 00 00 
80102ce7:	68 60 40 11 80       	push   $0x80114060
80102cec:	e8 af 1b 00 00       	call   801048a0 <release>
80102cf1:	8b 0d a8 40 11 80    	mov    0x801140a8,%ecx
80102cf7:	83 c4 10             	add    $0x10,%esp
80102cfa:	85 c9                	test   %ecx,%ecx
80102cfc:	0f 8e 85 00 00 00    	jle    80102d87 <end_op+0xe7>
80102d02:	a1 94 40 11 80       	mov    0x80114094,%eax
80102d07:	83 ec 08             	sub    $0x8,%esp
80102d0a:	01 d8                	add    %ebx,%eax
80102d0c:	83 c0 01             	add    $0x1,%eax
80102d0f:	50                   	push   %eax
80102d10:	ff 35 a4 40 11 80    	pushl  0x801140a4
80102d16:	e8 b5 d3 ff ff       	call   801000d0 <bread>
80102d1b:	89 c6                	mov    %eax,%esi
80102d1d:	58                   	pop    %eax
80102d1e:	5a                   	pop    %edx
80102d1f:	ff 34 9d ac 40 11 80 	pushl  -0x7feebf54(,%ebx,4)
80102d26:	ff 35 a4 40 11 80    	pushl  0x801140a4
80102d2c:	83 c3 01             	add    $0x1,%ebx
80102d2f:	e8 9c d3 ff ff       	call   801000d0 <bread>
80102d34:	89 c7                	mov    %eax,%edi
80102d36:	8d 40 5c             	lea    0x5c(%eax),%eax
80102d39:	83 c4 0c             	add    $0xc,%esp
80102d3c:	68 00 02 00 00       	push   $0x200
80102d41:	50                   	push   %eax
80102d42:	8d 46 5c             	lea    0x5c(%esi),%eax
80102d45:	50                   	push   %eax
80102d46:	e8 55 1c 00 00       	call   801049a0 <memmove>
80102d4b:	89 34 24             	mov    %esi,(%esp)
80102d4e:	e8 4d d4 ff ff       	call   801001a0 <bwrite>
80102d53:	89 3c 24             	mov    %edi,(%esp)
80102d56:	e8 85 d4 ff ff       	call   801001e0 <brelse>
80102d5b:	89 34 24             	mov    %esi,(%esp)
80102d5e:	e8 7d d4 ff ff       	call   801001e0 <brelse>
80102d63:	83 c4 10             	add    $0x10,%esp
80102d66:	3b 1d a8 40 11 80    	cmp    0x801140a8,%ebx
80102d6c:	7c 94                	jl     80102d02 <end_op+0x62>
80102d6e:	e8 bd fd ff ff       	call   80102b30 <write_head>
80102d73:	e8 18 fd ff ff       	call   80102a90 <install_trans>
80102d78:	c7 05 a8 40 11 80 00 	movl   $0x0,0x801140a8
80102d7f:	00 00 00 
80102d82:	e8 a9 fd ff ff       	call   80102b30 <write_head>
80102d87:	83 ec 0c             	sub    $0xc,%esp
80102d8a:	68 60 40 11 80       	push   $0x80114060
80102d8f:	e8 4c 1a 00 00       	call   801047e0 <acquire>
80102d94:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
80102d9b:	c7 05 a0 40 11 80 00 	movl   $0x0,0x801140a0
80102da2:	00 00 00 
80102da5:	e8 d6 12 00 00       	call   80104080 <wakeup>
80102daa:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
80102db1:	e8 ea 1a 00 00       	call   801048a0 <release>
80102db6:	83 c4 10             	add    $0x10,%esp
80102db9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dbc:	5b                   	pop    %ebx
80102dbd:	5e                   	pop    %esi
80102dbe:	5f                   	pop    %edi
80102dbf:	5d                   	pop    %ebp
80102dc0:	c3                   	ret    
80102dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102dc8:	83 ec 0c             	sub    $0xc,%esp
80102dcb:	68 60 40 11 80       	push   $0x80114060
80102dd0:	e8 ab 12 00 00       	call   80104080 <wakeup>
80102dd5:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
80102ddc:	e8 bf 1a 00 00       	call   801048a0 <release>
80102de1:	83 c4 10             	add    $0x10,%esp
80102de4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102de7:	5b                   	pop    %ebx
80102de8:	5e                   	pop    %esi
80102de9:	5f                   	pop    %edi
80102dea:	5d                   	pop    %ebp
80102deb:	c3                   	ret    
80102dec:	83 ec 0c             	sub    $0xc,%esp
80102def:	68 c4 7d 10 80       	push   $0x80107dc4
80102df4:	e8 97 d5 ff ff       	call   80100390 <panic>
80102df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e00 <log_write>:
80102e00:	55                   	push   %ebp
80102e01:	89 e5                	mov    %esp,%ebp
80102e03:	53                   	push   %ebx
80102e04:	83 ec 04             	sub    $0x4,%esp
80102e07:	8b 15 a8 40 11 80    	mov    0x801140a8,%edx
80102e0d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e10:	83 fa 1d             	cmp    $0x1d,%edx
80102e13:	0f 8f 9d 00 00 00    	jg     80102eb6 <log_write+0xb6>
80102e19:	a1 98 40 11 80       	mov    0x80114098,%eax
80102e1e:	83 e8 01             	sub    $0x1,%eax
80102e21:	39 c2                	cmp    %eax,%edx
80102e23:	0f 8d 8d 00 00 00    	jge    80102eb6 <log_write+0xb6>
80102e29:	a1 9c 40 11 80       	mov    0x8011409c,%eax
80102e2e:	85 c0                	test   %eax,%eax
80102e30:	0f 8e 8d 00 00 00    	jle    80102ec3 <log_write+0xc3>
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	68 60 40 11 80       	push   $0x80114060
80102e3e:	e8 9d 19 00 00       	call   801047e0 <acquire>
80102e43:	8b 0d a8 40 11 80    	mov    0x801140a8,%ecx
80102e49:	83 c4 10             	add    $0x10,%esp
80102e4c:	83 f9 00             	cmp    $0x0,%ecx
80102e4f:	7e 57                	jle    80102ea8 <log_write+0xa8>
80102e51:	8b 53 08             	mov    0x8(%ebx),%edx
80102e54:	31 c0                	xor    %eax,%eax
80102e56:	3b 15 ac 40 11 80    	cmp    0x801140ac,%edx
80102e5c:	75 0b                	jne    80102e69 <log_write+0x69>
80102e5e:	eb 38                	jmp    80102e98 <log_write+0x98>
80102e60:	39 14 85 ac 40 11 80 	cmp    %edx,-0x7feebf54(,%eax,4)
80102e67:	74 2f                	je     80102e98 <log_write+0x98>
80102e69:	83 c0 01             	add    $0x1,%eax
80102e6c:	39 c1                	cmp    %eax,%ecx
80102e6e:	75 f0                	jne    80102e60 <log_write+0x60>
80102e70:	89 14 85 ac 40 11 80 	mov    %edx,-0x7feebf54(,%eax,4)
80102e77:	83 c0 01             	add    $0x1,%eax
80102e7a:	a3 a8 40 11 80       	mov    %eax,0x801140a8
80102e7f:	83 0b 04             	orl    $0x4,(%ebx)
80102e82:	c7 45 08 60 40 11 80 	movl   $0x80114060,0x8(%ebp)
80102e89:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e8c:	c9                   	leave  
80102e8d:	e9 0e 1a 00 00       	jmp    801048a0 <release>
80102e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e98:	89 14 85 ac 40 11 80 	mov    %edx,-0x7feebf54(,%eax,4)
80102e9f:	eb de                	jmp    80102e7f <log_write+0x7f>
80102ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ea8:	8b 43 08             	mov    0x8(%ebx),%eax
80102eab:	a3 ac 40 11 80       	mov    %eax,0x801140ac
80102eb0:	75 cd                	jne    80102e7f <log_write+0x7f>
80102eb2:	31 c0                	xor    %eax,%eax
80102eb4:	eb c1                	jmp    80102e77 <log_write+0x77>
80102eb6:	83 ec 0c             	sub    $0xc,%esp
80102eb9:	68 d3 7d 10 80       	push   $0x80107dd3
80102ebe:	e8 cd d4 ff ff       	call   80100390 <panic>
80102ec3:	83 ec 0c             	sub    $0xc,%esp
80102ec6:	68 e9 7d 10 80       	push   $0x80107de9
80102ecb:	e8 c0 d4 ff ff       	call   80100390 <panic>

80102ed0 <mpmain>:
80102ed0:	55                   	push   %ebp
80102ed1:	89 e5                	mov    %esp,%ebp
80102ed3:	53                   	push   %ebx
80102ed4:	83 ec 04             	sub    $0x4,%esp
80102ed7:	e8 a4 09 00 00       	call   80103880 <cpuid>
80102edc:	89 c3                	mov    %eax,%ebx
80102ede:	e8 9d 09 00 00       	call   80103880 <cpuid>
80102ee3:	83 ec 04             	sub    $0x4,%esp
80102ee6:	53                   	push   %ebx
80102ee7:	50                   	push   %eax
80102ee8:	68 04 7e 10 80       	push   $0x80107e04
80102eed:	e8 6e d7 ff ff       	call   80100660 <cprintf>
80102ef2:	e8 a9 2e 00 00       	call   80105da0 <idtinit>
80102ef7:	e8 04 09 00 00       	call   80103800 <mycpu>
80102efc:	89 c2                	mov    %eax,%edx
80102efe:	b8 01 00 00 00       	mov    $0x1,%eax
80102f03:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102f0a:	e8 91 0c 00 00       	call   80103ba0 <scheduler>
80102f0f:	90                   	nop

80102f10 <mpenter>:
80102f10:	55                   	push   %ebp
80102f11:	89 e5                	mov    %esp,%ebp
80102f13:	83 ec 08             	sub    $0x8,%esp
80102f16:	e8 75 3f 00 00       	call   80106e90 <switchkvm>
80102f1b:	e8 e0 3e 00 00       	call   80106e00 <seginit>
80102f20:	e8 4b f7 ff ff       	call   80102670 <lapicinit>
80102f25:	e8 a6 ff ff ff       	call   80102ed0 <mpmain>
80102f2a:	66 90                	xchg   %ax,%ax
80102f2c:	66 90                	xchg   %ax,%ax
80102f2e:	66 90                	xchg   %ax,%ax

80102f30 <main>:
80102f30:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102f34:	83 e4 f0             	and    $0xfffffff0,%esp
80102f37:	ff 71 fc             	pushl  -0x4(%ecx)
80102f3a:	55                   	push   %ebp
80102f3b:	89 e5                	mov    %esp,%ebp
80102f3d:	53                   	push   %ebx
80102f3e:	51                   	push   %ecx
80102f3f:	83 ec 08             	sub    $0x8,%esp
80102f42:	68 00 00 40 80       	push   $0x80400000
80102f47:	68 88 70 11 80       	push   $0x80117088
80102f4c:	e8 df f4 ff ff       	call   80102430 <kinit1>
80102f51:	e8 0a 44 00 00       	call   80107360 <kvmalloc>
80102f56:	e8 75 01 00 00       	call   801030d0 <mpinit>
80102f5b:	e8 10 f7 ff ff       	call   80102670 <lapicinit>
80102f60:	e8 9b 3e 00 00       	call   80106e00 <seginit>
80102f65:	e8 46 03 00 00       	call   801032b0 <picinit>
80102f6a:	e8 f1 f2 ff ff       	call   80102260 <ioapicinit>
80102f6f:	e8 8c da ff ff       	call   80100a00 <consoleinit>
80102f74:	e8 57 31 00 00       	call   801060d0 <uartinit>
80102f79:	e8 52 08 00 00       	call   801037d0 <pinit>
80102f7e:	e8 9d 2d 00 00       	call   80105d20 <tvinit>
80102f83:	e8 b8 d0 ff ff       	call   80100040 <binit>
80102f88:	e8 13 de ff ff       	call   80100da0 <fileinit>
80102f8d:	e8 ae f0 ff ff       	call   80102040 <ideinit>
80102f92:	83 c4 0c             	add    $0xc,%esp
80102f95:	68 8a 00 00 00       	push   $0x8a
80102f9a:	68 90 b4 10 80       	push   $0x8010b490
80102f9f:	68 00 70 00 80       	push   $0x80007000
80102fa4:	e8 f7 19 00 00       	call   801049a0 <memmove>
80102fa9:	69 05 e0 46 11 80 b0 	imul   $0xb0,0x801146e0,%eax
80102fb0:	00 00 00 
80102fb3:	83 c4 10             	add    $0x10,%esp
80102fb6:	05 60 41 11 80       	add    $0x80114160,%eax
80102fbb:	3d 60 41 11 80       	cmp    $0x80114160,%eax
80102fc0:	76 71                	jbe    80103033 <main+0x103>
80102fc2:	bb 60 41 11 80       	mov    $0x80114160,%ebx
80102fc7:	89 f6                	mov    %esi,%esi
80102fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102fd0:	e8 2b 08 00 00       	call   80103800 <mycpu>
80102fd5:	39 d8                	cmp    %ebx,%eax
80102fd7:	74 41                	je     8010301a <main+0xea>
80102fd9:	e8 22 f5 ff ff       	call   80102500 <kalloc>
80102fde:	05 00 10 00 00       	add    $0x1000,%eax
80102fe3:	c7 05 f8 6f 00 80 10 	movl   $0x80102f10,0x80006ff8
80102fea:	2f 10 80 
80102fed:	c7 05 f4 6f 00 80 00 	movl   $0x10a000,0x80006ff4
80102ff4:	a0 10 00 
80102ff7:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102ffc:	0f b6 03             	movzbl (%ebx),%eax
80102fff:	83 ec 08             	sub    $0x8,%esp
80103002:	68 00 70 00 00       	push   $0x7000
80103007:	50                   	push   %eax
80103008:	e8 b3 f7 ff ff       	call   801027c0 <lapicstartap>
8010300d:	83 c4 10             	add    $0x10,%esp
80103010:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103016:	85 c0                	test   %eax,%eax
80103018:	74 f6                	je     80103010 <main+0xe0>
8010301a:	69 05 e0 46 11 80 b0 	imul   $0xb0,0x801146e0,%eax
80103021:	00 00 00 
80103024:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
8010302a:	05 60 41 11 80       	add    $0x80114160,%eax
8010302f:	39 c3                	cmp    %eax,%ebx
80103031:	72 9d                	jb     80102fd0 <main+0xa0>
80103033:	83 ec 08             	sub    $0x8,%esp
80103036:	68 00 00 00 8e       	push   $0x8e000000
8010303b:	68 00 00 40 80       	push   $0x80400000
80103040:	e8 5b f4 ff ff       	call   801024a0 <kinit2>
80103045:	e8 86 08 00 00       	call   801038d0 <userinit>
8010304a:	e8 81 fe ff ff       	call   80102ed0 <mpmain>
8010304f:	90                   	nop

80103050 <mpsearch1>:
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	57                   	push   %edi
80103054:	56                   	push   %esi
80103055:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
8010305b:	53                   	push   %ebx
8010305c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
8010305f:	83 ec 0c             	sub    $0xc,%esp
80103062:	39 de                	cmp    %ebx,%esi
80103064:	72 10                	jb     80103076 <mpsearch1+0x26>
80103066:	eb 50                	jmp    801030b8 <mpsearch1+0x68>
80103068:	90                   	nop
80103069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103070:	39 fb                	cmp    %edi,%ebx
80103072:	89 fe                	mov    %edi,%esi
80103074:	76 42                	jbe    801030b8 <mpsearch1+0x68>
80103076:	83 ec 04             	sub    $0x4,%esp
80103079:	8d 7e 10             	lea    0x10(%esi),%edi
8010307c:	6a 04                	push   $0x4
8010307e:	68 18 7e 10 80       	push   $0x80107e18
80103083:	56                   	push   %esi
80103084:	e8 b7 18 00 00       	call   80104940 <memcmp>
80103089:	83 c4 10             	add    $0x10,%esp
8010308c:	85 c0                	test   %eax,%eax
8010308e:	75 e0                	jne    80103070 <mpsearch1+0x20>
80103090:	89 f1                	mov    %esi,%ecx
80103092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103098:	0f b6 11             	movzbl (%ecx),%edx
8010309b:	83 c1 01             	add    $0x1,%ecx
8010309e:	01 d0                	add    %edx,%eax
801030a0:	39 f9                	cmp    %edi,%ecx
801030a2:	75 f4                	jne    80103098 <mpsearch1+0x48>
801030a4:	84 c0                	test   %al,%al
801030a6:	75 c8                	jne    80103070 <mpsearch1+0x20>
801030a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030ab:	89 f0                	mov    %esi,%eax
801030ad:	5b                   	pop    %ebx
801030ae:	5e                   	pop    %esi
801030af:	5f                   	pop    %edi
801030b0:	5d                   	pop    %ebp
801030b1:	c3                   	ret    
801030b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030bb:	31 f6                	xor    %esi,%esi
801030bd:	89 f0                	mov    %esi,%eax
801030bf:	5b                   	pop    %ebx
801030c0:	5e                   	pop    %esi
801030c1:	5f                   	pop    %edi
801030c2:	5d                   	pop    %ebp
801030c3:	c3                   	ret    
801030c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801030d0 <mpinit>:
801030d0:	55                   	push   %ebp
801030d1:	89 e5                	mov    %esp,%ebp
801030d3:	57                   	push   %edi
801030d4:	56                   	push   %esi
801030d5:	53                   	push   %ebx
801030d6:	83 ec 1c             	sub    $0x1c,%esp
801030d9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801030e0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801030e7:	c1 e0 08             	shl    $0x8,%eax
801030ea:	09 d0                	or     %edx,%eax
801030ec:	c1 e0 04             	shl    $0x4,%eax
801030ef:	85 c0                	test   %eax,%eax
801030f1:	75 1b                	jne    8010310e <mpinit+0x3e>
801030f3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801030fa:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103101:	c1 e0 08             	shl    $0x8,%eax
80103104:	09 d0                	or     %edx,%eax
80103106:	c1 e0 0a             	shl    $0xa,%eax
80103109:	2d 00 04 00 00       	sub    $0x400,%eax
8010310e:	ba 00 04 00 00       	mov    $0x400,%edx
80103113:	e8 38 ff ff ff       	call   80103050 <mpsearch1>
80103118:	85 c0                	test   %eax,%eax
8010311a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010311d:	0f 84 3d 01 00 00    	je     80103260 <mpinit+0x190>
80103123:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103126:	8b 58 04             	mov    0x4(%eax),%ebx
80103129:	85 db                	test   %ebx,%ebx
8010312b:	0f 84 4f 01 00 00    	je     80103280 <mpinit+0x1b0>
80103131:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
80103137:	83 ec 04             	sub    $0x4,%esp
8010313a:	6a 04                	push   $0x4
8010313c:	68 35 7e 10 80       	push   $0x80107e35
80103141:	56                   	push   %esi
80103142:	e8 f9 17 00 00       	call   80104940 <memcmp>
80103147:	83 c4 10             	add    $0x10,%esp
8010314a:	85 c0                	test   %eax,%eax
8010314c:	0f 85 2e 01 00 00    	jne    80103280 <mpinit+0x1b0>
80103152:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103159:	3c 01                	cmp    $0x1,%al
8010315b:	0f 95 c2             	setne  %dl
8010315e:	3c 04                	cmp    $0x4,%al
80103160:	0f 95 c0             	setne  %al
80103163:	20 c2                	and    %al,%dl
80103165:	0f 85 15 01 00 00    	jne    80103280 <mpinit+0x1b0>
8010316b:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
80103172:	66 85 ff             	test   %di,%di
80103175:	74 1a                	je     80103191 <mpinit+0xc1>
80103177:	89 f0                	mov    %esi,%eax
80103179:	01 f7                	add    %esi,%edi
8010317b:	31 d2                	xor    %edx,%edx
8010317d:	8d 76 00             	lea    0x0(%esi),%esi
80103180:	0f b6 08             	movzbl (%eax),%ecx
80103183:	83 c0 01             	add    $0x1,%eax
80103186:	01 ca                	add    %ecx,%edx
80103188:	39 c7                	cmp    %eax,%edi
8010318a:	75 f4                	jne    80103180 <mpinit+0xb0>
8010318c:	84 d2                	test   %dl,%dl
8010318e:	0f 95 c2             	setne  %dl
80103191:	85 f6                	test   %esi,%esi
80103193:	0f 84 e7 00 00 00    	je     80103280 <mpinit+0x1b0>
80103199:	84 d2                	test   %dl,%dl
8010319b:	0f 85 df 00 00 00    	jne    80103280 <mpinit+0x1b0>
801031a1:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801031a7:	a3 5c 40 11 80       	mov    %eax,0x8011405c
801031ac:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801031b3:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801031b9:	bb 01 00 00 00       	mov    $0x1,%ebx
801031be:	01 d6                	add    %edx,%esi
801031c0:	39 c6                	cmp    %eax,%esi
801031c2:	76 23                	jbe    801031e7 <mpinit+0x117>
801031c4:	0f b6 10             	movzbl (%eax),%edx
801031c7:	80 fa 04             	cmp    $0x4,%dl
801031ca:	0f 87 ca 00 00 00    	ja     8010329a <mpinit+0x1ca>
801031d0:	ff 24 95 5c 7e 10 80 	jmp    *-0x7fef81a4(,%edx,4)
801031d7:	89 f6                	mov    %esi,%esi
801031d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801031e0:	83 c0 08             	add    $0x8,%eax
801031e3:	39 c6                	cmp    %eax,%esi
801031e5:	77 dd                	ja     801031c4 <mpinit+0xf4>
801031e7:	85 db                	test   %ebx,%ebx
801031e9:	0f 84 9e 00 00 00    	je     8010328d <mpinit+0x1bd>
801031ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801031f2:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
801031f6:	74 15                	je     8010320d <mpinit+0x13d>
801031f8:	b8 70 00 00 00       	mov    $0x70,%eax
801031fd:	ba 22 00 00 00       	mov    $0x22,%edx
80103202:	ee                   	out    %al,(%dx)
80103203:	ba 23 00 00 00       	mov    $0x23,%edx
80103208:	ec                   	in     (%dx),%al
80103209:	83 c8 01             	or     $0x1,%eax
8010320c:	ee                   	out    %al,(%dx)
8010320d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103210:	5b                   	pop    %ebx
80103211:	5e                   	pop    %esi
80103212:	5f                   	pop    %edi
80103213:	5d                   	pop    %ebp
80103214:	c3                   	ret    
80103215:	8d 76 00             	lea    0x0(%esi),%esi
80103218:	8b 0d e0 46 11 80    	mov    0x801146e0,%ecx
8010321e:	83 f9 07             	cmp    $0x7,%ecx
80103221:	7f 19                	jg     8010323c <mpinit+0x16c>
80103223:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103227:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
8010322d:	83 c1 01             	add    $0x1,%ecx
80103230:	89 0d e0 46 11 80    	mov    %ecx,0x801146e0
80103236:	88 97 60 41 11 80    	mov    %dl,-0x7feebea0(%edi)
8010323c:	83 c0 14             	add    $0x14,%eax
8010323f:	e9 7c ff ff ff       	jmp    801031c0 <mpinit+0xf0>
80103244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103248:	0f b6 50 01          	movzbl 0x1(%eax),%edx
8010324c:	83 c0 08             	add    $0x8,%eax
8010324f:	88 15 40 41 11 80    	mov    %dl,0x80114140
80103255:	e9 66 ff ff ff       	jmp    801031c0 <mpinit+0xf0>
8010325a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103260:	ba 00 00 01 00       	mov    $0x10000,%edx
80103265:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010326a:	e8 e1 fd ff ff       	call   80103050 <mpsearch1>
8010326f:	85 c0                	test   %eax,%eax
80103271:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103274:	0f 85 a9 fe ff ff    	jne    80103123 <mpinit+0x53>
8010327a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103280:	83 ec 0c             	sub    $0xc,%esp
80103283:	68 1d 7e 10 80       	push   $0x80107e1d
80103288:	e8 03 d1 ff ff       	call   80100390 <panic>
8010328d:	83 ec 0c             	sub    $0xc,%esp
80103290:	68 3c 7e 10 80       	push   $0x80107e3c
80103295:	e8 f6 d0 ff ff       	call   80100390 <panic>
8010329a:	31 db                	xor    %ebx,%ebx
8010329c:	e9 26 ff ff ff       	jmp    801031c7 <mpinit+0xf7>
801032a1:	66 90                	xchg   %ax,%ax
801032a3:	66 90                	xchg   %ax,%ax
801032a5:	66 90                	xchg   %ax,%ax
801032a7:	66 90                	xchg   %ax,%ax
801032a9:	66 90                	xchg   %ax,%ax
801032ab:	66 90                	xchg   %ax,%ax
801032ad:	66 90                	xchg   %ax,%ax
801032af:	90                   	nop

801032b0 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
801032b0:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801032b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032b6:	ba 21 00 00 00       	mov    $0x21,%edx
801032bb:	89 e5                	mov    %esp,%ebp
801032bd:	ee                   	out    %al,(%dx)
801032be:	ba a1 00 00 00       	mov    $0xa1,%edx
801032c3:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
801032c4:	5d                   	pop    %ebp
801032c5:	c3                   	ret    
801032c6:	66 90                	xchg   %ax,%ax
801032c8:	66 90                	xchg   %ax,%ax
801032ca:	66 90                	xchg   %ax,%ax
801032cc:	66 90                	xchg   %ax,%ax
801032ce:	66 90                	xchg   %ax,%ax

801032d0 <pipealloc>:
801032d0:	55                   	push   %ebp
801032d1:	89 e5                	mov    %esp,%ebp
801032d3:	57                   	push   %edi
801032d4:	56                   	push   %esi
801032d5:	53                   	push   %ebx
801032d6:	83 ec 0c             	sub    $0xc,%esp
801032d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801032df:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801032e5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801032eb:	e8 d0 da ff ff       	call   80100dc0 <filealloc>
801032f0:	85 c0                	test   %eax,%eax
801032f2:	89 03                	mov    %eax,(%ebx)
801032f4:	74 22                	je     80103318 <pipealloc+0x48>
801032f6:	e8 c5 da ff ff       	call   80100dc0 <filealloc>
801032fb:	85 c0                	test   %eax,%eax
801032fd:	89 06                	mov    %eax,(%esi)
801032ff:	74 3f                	je     80103340 <pipealloc+0x70>
80103301:	e8 fa f1 ff ff       	call   80102500 <kalloc>
80103306:	85 c0                	test   %eax,%eax
80103308:	89 c7                	mov    %eax,%edi
8010330a:	75 54                	jne    80103360 <pipealloc+0x90>
8010330c:	8b 03                	mov    (%ebx),%eax
8010330e:	85 c0                	test   %eax,%eax
80103310:	75 34                	jne    80103346 <pipealloc+0x76>
80103312:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103318:	8b 06                	mov    (%esi),%eax
8010331a:	85 c0                	test   %eax,%eax
8010331c:	74 0c                	je     8010332a <pipealloc+0x5a>
8010331e:	83 ec 0c             	sub    $0xc,%esp
80103321:	50                   	push   %eax
80103322:	e8 59 db ff ff       	call   80100e80 <fileclose>
80103327:	83 c4 10             	add    $0x10,%esp
8010332a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010332d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103332:	5b                   	pop    %ebx
80103333:	5e                   	pop    %esi
80103334:	5f                   	pop    %edi
80103335:	5d                   	pop    %ebp
80103336:	c3                   	ret    
80103337:	89 f6                	mov    %esi,%esi
80103339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103340:	8b 03                	mov    (%ebx),%eax
80103342:	85 c0                	test   %eax,%eax
80103344:	74 e4                	je     8010332a <pipealloc+0x5a>
80103346:	83 ec 0c             	sub    $0xc,%esp
80103349:	50                   	push   %eax
8010334a:	e8 31 db ff ff       	call   80100e80 <fileclose>
8010334f:	8b 06                	mov    (%esi),%eax
80103351:	83 c4 10             	add    $0x10,%esp
80103354:	85 c0                	test   %eax,%eax
80103356:	75 c6                	jne    8010331e <pipealloc+0x4e>
80103358:	eb d0                	jmp    8010332a <pipealloc+0x5a>
8010335a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103360:	83 ec 08             	sub    $0x8,%esp
80103363:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010336a:	00 00 00 
8010336d:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103374:	00 00 00 
80103377:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010337e:	00 00 00 
80103381:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103388:	00 00 00 
8010338b:	68 70 7e 10 80       	push   $0x80107e70
80103390:	50                   	push   %eax
80103391:	e8 0a 13 00 00       	call   801046a0 <initlock>
80103396:	8b 03                	mov    (%ebx),%eax
80103398:	83 c4 10             	add    $0x10,%esp
8010339b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033a1:	8b 03                	mov    (%ebx),%eax
801033a3:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801033a7:	8b 03                	mov    (%ebx),%eax
801033a9:	c6 40 09 00          	movb   $0x0,0x9(%eax)
801033ad:	8b 03                	mov    (%ebx),%eax
801033af:	89 78 0c             	mov    %edi,0xc(%eax)
801033b2:	8b 06                	mov    (%esi),%eax
801033b4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033ba:	8b 06                	mov    (%esi),%eax
801033bc:	c6 40 08 00          	movb   $0x0,0x8(%eax)
801033c0:	8b 06                	mov    (%esi),%eax
801033c2:	c6 40 09 01          	movb   $0x1,0x9(%eax)
801033c6:	8b 06                	mov    (%esi),%eax
801033c8:	89 78 0c             	mov    %edi,0xc(%eax)
801033cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033ce:	31 c0                	xor    %eax,%eax
801033d0:	5b                   	pop    %ebx
801033d1:	5e                   	pop    %esi
801033d2:	5f                   	pop    %edi
801033d3:	5d                   	pop    %ebp
801033d4:	c3                   	ret    
801033d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801033d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801033e0 <pipeclose>:
801033e0:	55                   	push   %ebp
801033e1:	89 e5                	mov    %esp,%ebp
801033e3:	56                   	push   %esi
801033e4:	53                   	push   %ebx
801033e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033e8:	8b 75 0c             	mov    0xc(%ebp),%esi
801033eb:	83 ec 0c             	sub    $0xc,%esp
801033ee:	53                   	push   %ebx
801033ef:	e8 ec 13 00 00       	call   801047e0 <acquire>
801033f4:	83 c4 10             	add    $0x10,%esp
801033f7:	85 f6                	test   %esi,%esi
801033f9:	74 45                	je     80103440 <pipeclose+0x60>
801033fb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103401:	83 ec 0c             	sub    $0xc,%esp
80103404:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010340b:	00 00 00 
8010340e:	50                   	push   %eax
8010340f:	e8 6c 0c 00 00       	call   80104080 <wakeup>
80103414:	83 c4 10             	add    $0x10,%esp
80103417:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010341d:	85 d2                	test   %edx,%edx
8010341f:	75 0a                	jne    8010342b <pipeclose+0x4b>
80103421:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103427:	85 c0                	test   %eax,%eax
80103429:	74 35                	je     80103460 <pipeclose+0x80>
8010342b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010342e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103431:	5b                   	pop    %ebx
80103432:	5e                   	pop    %esi
80103433:	5d                   	pop    %ebp
80103434:	e9 67 14 00 00       	jmp    801048a0 <release>
80103439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103440:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103446:	83 ec 0c             	sub    $0xc,%esp
80103449:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103450:	00 00 00 
80103453:	50                   	push   %eax
80103454:	e8 27 0c 00 00       	call   80104080 <wakeup>
80103459:	83 c4 10             	add    $0x10,%esp
8010345c:	eb b9                	jmp    80103417 <pipeclose+0x37>
8010345e:	66 90                	xchg   %ax,%ax
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	53                   	push   %ebx
80103464:	e8 37 14 00 00       	call   801048a0 <release>
80103469:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010346c:	83 c4 10             	add    $0x10,%esp
8010346f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103472:	5b                   	pop    %ebx
80103473:	5e                   	pop    %esi
80103474:	5d                   	pop    %ebp
80103475:	e9 d6 ee ff ff       	jmp    80102350 <kfree>
8010347a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103480 <pipewrite>:
80103480:	55                   	push   %ebp
80103481:	89 e5                	mov    %esp,%ebp
80103483:	57                   	push   %edi
80103484:	56                   	push   %esi
80103485:	53                   	push   %ebx
80103486:	83 ec 28             	sub    $0x28,%esp
80103489:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010348c:	53                   	push   %ebx
8010348d:	e8 4e 13 00 00       	call   801047e0 <acquire>
80103492:	8b 45 10             	mov    0x10(%ebp),%eax
80103495:	83 c4 10             	add    $0x10,%esp
80103498:	85 c0                	test   %eax,%eax
8010349a:	0f 8e c9 00 00 00    	jle    80103569 <pipewrite+0xe9>
801034a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801034a3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034a9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801034af:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801034b2:	03 4d 10             	add    0x10(%ebp),%ecx
801034b5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801034b8:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801034be:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801034c4:	39 d0                	cmp    %edx,%eax
801034c6:	75 71                	jne    80103539 <pipewrite+0xb9>
801034c8:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801034ce:	85 c0                	test   %eax,%eax
801034d0:	74 4e                	je     80103520 <pipewrite+0xa0>
801034d2:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801034d8:	eb 3a                	jmp    80103514 <pipewrite+0x94>
801034da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801034e0:	83 ec 0c             	sub    $0xc,%esp
801034e3:	57                   	push   %edi
801034e4:	e8 97 0b 00 00       	call   80104080 <wakeup>
801034e9:	5a                   	pop    %edx
801034ea:	59                   	pop    %ecx
801034eb:	53                   	push   %ebx
801034ec:	56                   	push   %esi
801034ed:	e8 ce 09 00 00       	call   80103ec0 <sleep>
801034f2:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034f8:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801034fe:	83 c4 10             	add    $0x10,%esp
80103501:	05 00 02 00 00       	add    $0x200,%eax
80103506:	39 c2                	cmp    %eax,%edx
80103508:	75 36                	jne    80103540 <pipewrite+0xc0>
8010350a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103510:	85 c0                	test   %eax,%eax
80103512:	74 0c                	je     80103520 <pipewrite+0xa0>
80103514:	e8 87 03 00 00       	call   801038a0 <myproc>
80103519:	8b 40 24             	mov    0x24(%eax),%eax
8010351c:	85 c0                	test   %eax,%eax
8010351e:	74 c0                	je     801034e0 <pipewrite+0x60>
80103520:	83 ec 0c             	sub    $0xc,%esp
80103523:	53                   	push   %ebx
80103524:	e8 77 13 00 00       	call   801048a0 <release>
80103529:	83 c4 10             	add    $0x10,%esp
8010352c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103531:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103534:	5b                   	pop    %ebx
80103535:	5e                   	pop    %esi
80103536:	5f                   	pop    %edi
80103537:	5d                   	pop    %ebp
80103538:	c3                   	ret    
80103539:	89 c2                	mov    %eax,%edx
8010353b:	90                   	nop
8010353c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103540:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80103543:	8d 42 01             	lea    0x1(%edx),%eax
80103546:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010354c:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103552:	83 c6 01             	add    $0x1,%esi
80103555:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
80103559:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010355c:	89 75 e4             	mov    %esi,-0x1c(%ebp)
8010355f:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
80103563:	0f 85 4f ff ff ff    	jne    801034b8 <pipewrite+0x38>
80103569:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010356f:	83 ec 0c             	sub    $0xc,%esp
80103572:	50                   	push   %eax
80103573:	e8 08 0b 00 00       	call   80104080 <wakeup>
80103578:	89 1c 24             	mov    %ebx,(%esp)
8010357b:	e8 20 13 00 00       	call   801048a0 <release>
80103580:	83 c4 10             	add    $0x10,%esp
80103583:	8b 45 10             	mov    0x10(%ebp),%eax
80103586:	eb a9                	jmp    80103531 <pipewrite+0xb1>
80103588:	90                   	nop
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103590 <piperead>:
80103590:	55                   	push   %ebp
80103591:	89 e5                	mov    %esp,%ebp
80103593:	57                   	push   %edi
80103594:	56                   	push   %esi
80103595:	53                   	push   %ebx
80103596:	83 ec 18             	sub    $0x18,%esp
80103599:	8b 75 08             	mov    0x8(%ebp),%esi
8010359c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010359f:	56                   	push   %esi
801035a0:	e8 3b 12 00 00       	call   801047e0 <acquire>
801035a5:	83 c4 10             	add    $0x10,%esp
801035a8:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035ae:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035b4:	75 6a                	jne    80103620 <piperead+0x90>
801035b6:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
801035bc:	85 db                	test   %ebx,%ebx
801035be:	0f 84 c4 00 00 00    	je     80103688 <piperead+0xf8>
801035c4:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801035ca:	eb 2d                	jmp    801035f9 <piperead+0x69>
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035d0:	83 ec 08             	sub    $0x8,%esp
801035d3:	56                   	push   %esi
801035d4:	53                   	push   %ebx
801035d5:	e8 e6 08 00 00       	call   80103ec0 <sleep>
801035da:	83 c4 10             	add    $0x10,%esp
801035dd:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035e3:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035e9:	75 35                	jne    80103620 <piperead+0x90>
801035eb:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
801035f1:	85 d2                	test   %edx,%edx
801035f3:	0f 84 8f 00 00 00    	je     80103688 <piperead+0xf8>
801035f9:	e8 a2 02 00 00       	call   801038a0 <myproc>
801035fe:	8b 48 24             	mov    0x24(%eax),%ecx
80103601:	85 c9                	test   %ecx,%ecx
80103603:	74 cb                	je     801035d0 <piperead+0x40>
80103605:	83 ec 0c             	sub    $0xc,%esp
80103608:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010360d:	56                   	push   %esi
8010360e:	e8 8d 12 00 00       	call   801048a0 <release>
80103613:	83 c4 10             	add    $0x10,%esp
80103616:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103619:	89 d8                	mov    %ebx,%eax
8010361b:	5b                   	pop    %ebx
8010361c:	5e                   	pop    %esi
8010361d:	5f                   	pop    %edi
8010361e:	5d                   	pop    %ebp
8010361f:	c3                   	ret    
80103620:	8b 45 10             	mov    0x10(%ebp),%eax
80103623:	85 c0                	test   %eax,%eax
80103625:	7e 61                	jle    80103688 <piperead+0xf8>
80103627:	31 db                	xor    %ebx,%ebx
80103629:	eb 13                	jmp    8010363e <piperead+0xae>
8010362b:	90                   	nop
8010362c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103630:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103636:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
8010363c:	74 1f                	je     8010365d <piperead+0xcd>
8010363e:	8d 41 01             	lea    0x1(%ecx),%eax
80103641:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80103647:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
8010364d:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
80103652:	88 04 1f             	mov    %al,(%edi,%ebx,1)
80103655:	83 c3 01             	add    $0x1,%ebx
80103658:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010365b:	75 d3                	jne    80103630 <piperead+0xa0>
8010365d:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103663:	83 ec 0c             	sub    $0xc,%esp
80103666:	50                   	push   %eax
80103667:	e8 14 0a 00 00       	call   80104080 <wakeup>
8010366c:	89 34 24             	mov    %esi,(%esp)
8010366f:	e8 2c 12 00 00       	call   801048a0 <release>
80103674:	83 c4 10             	add    $0x10,%esp
80103677:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010367a:	89 d8                	mov    %ebx,%eax
8010367c:	5b                   	pop    %ebx
8010367d:	5e                   	pop    %esi
8010367e:	5f                   	pop    %edi
8010367f:	5d                   	pop    %ebp
80103680:	c3                   	ret    
80103681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103688:	31 db                	xor    %ebx,%ebx
8010368a:	eb d1                	jmp    8010365d <piperead+0xcd>
8010368c:	66 90                	xchg   %ax,%ax
8010368e:	66 90                	xchg   %ax,%ax

80103690 <allocproc>:
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	53                   	push   %ebx
80103694:	bb 34 47 11 80       	mov    $0x80114734,%ebx
80103699:	83 ec 10             	sub    $0x10,%esp
8010369c:	68 00 47 11 80       	push   $0x80114700
801036a1:	e8 3a 11 00 00       	call   801047e0 <acquire>
801036a6:	83 c4 10             	add    $0x10,%esp
801036a9:	eb 17                	jmp    801036c2 <allocproc+0x32>
801036ab:	90                   	nop
801036ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036b0:	81 c3 84 00 00 00    	add    $0x84,%ebx
801036b6:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
801036bc:	0f 83 8e 00 00 00    	jae    80103750 <allocproc+0xc0>
801036c2:	8b 43 0c             	mov    0xc(%ebx),%eax
801036c5:	85 c0                	test   %eax,%eax
801036c7:	75 e7                	jne    801036b0 <allocproc+0x20>
801036c9:	a1 04 b0 10 80       	mov    0x8010b004,%eax
801036ce:	83 ec 0c             	sub    $0xc,%esp
801036d1:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
801036d8:	c7 43 7c 01 00 00 00 	movl   $0x1,0x7c(%ebx)
801036df:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
801036e6:	00 00 00 
801036e9:	8d 50 01             	lea    0x1(%eax),%edx
801036ec:	89 43 10             	mov    %eax,0x10(%ebx)
801036ef:	68 00 47 11 80       	push   $0x80114700
801036f4:	89 15 04 b0 10 80    	mov    %edx,0x8010b004
801036fa:	e8 a1 11 00 00       	call   801048a0 <release>
801036ff:	e8 fc ed ff ff       	call   80102500 <kalloc>
80103704:	83 c4 10             	add    $0x10,%esp
80103707:	85 c0                	test   %eax,%eax
80103709:	89 43 08             	mov    %eax,0x8(%ebx)
8010370c:	74 5b                	je     80103769 <allocproc+0xd9>
8010370e:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
80103714:	83 ec 04             	sub    $0x4,%esp
80103717:	05 9c 0f 00 00       	add    $0xf9c,%eax
8010371c:	89 53 18             	mov    %edx,0x18(%ebx)
8010371f:	c7 40 14 06 5d 10 80 	movl   $0x80105d06,0x14(%eax)
80103726:	89 43 1c             	mov    %eax,0x1c(%ebx)
80103729:	6a 14                	push   $0x14
8010372b:	6a 00                	push   $0x0
8010372d:	50                   	push   %eax
8010372e:	e8 bd 11 00 00       	call   801048f0 <memset>
80103733:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103736:	83 c4 10             	add    $0x10,%esp
80103739:	c7 40 10 80 37 10 80 	movl   $0x80103780,0x10(%eax)
80103740:	89 d8                	mov    %ebx,%eax
80103742:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103745:	c9                   	leave  
80103746:	c3                   	ret    
80103747:	89 f6                	mov    %esi,%esi
80103749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103750:	83 ec 0c             	sub    $0xc,%esp
80103753:	31 db                	xor    %ebx,%ebx
80103755:	68 00 47 11 80       	push   $0x80114700
8010375a:	e8 41 11 00 00       	call   801048a0 <release>
8010375f:	89 d8                	mov    %ebx,%eax
80103761:	83 c4 10             	add    $0x10,%esp
80103764:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103767:	c9                   	leave  
80103768:	c3                   	ret    
80103769:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103770:	31 db                	xor    %ebx,%ebx
80103772:	eb cc                	jmp    80103740 <allocproc+0xb0>
80103774:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010377a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103780 <forkret>:
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	83 ec 14             	sub    $0x14,%esp
80103786:	68 00 47 11 80       	push   $0x80114700
8010378b:	e8 10 11 00 00       	call   801048a0 <release>
80103790:	a1 00 b0 10 80       	mov    0x8010b000,%eax
80103795:	83 c4 10             	add    $0x10,%esp
80103798:	85 c0                	test   %eax,%eax
8010379a:	75 04                	jne    801037a0 <forkret+0x20>
8010379c:	c9                   	leave  
8010379d:	c3                   	ret    
8010379e:	66 90                	xchg   %ax,%ax
801037a0:	83 ec 0c             	sub    $0xc,%esp
801037a3:	c7 05 00 b0 10 80 00 	movl   $0x0,0x8010b000
801037aa:	00 00 00 
801037ad:	6a 01                	push   $0x1
801037af:	e8 0c dd ff ff       	call   801014c0 <iinit>
801037b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801037bb:	e8 d0 f3 ff ff       	call   80102b90 <initlog>
801037c0:	83 c4 10             	add    $0x10,%esp
801037c3:	c9                   	leave  
801037c4:	c3                   	ret    
801037c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037d0 <pinit>:
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	83 ec 10             	sub    $0x10,%esp
801037d6:	68 75 7e 10 80       	push   $0x80107e75
801037db:	68 00 47 11 80       	push   $0x80114700
801037e0:	e8 bb 0e 00 00       	call   801046a0 <initlock>
801037e5:	e8 56 f2 ff ff       	call   80102a40 <unixtime>
801037ea:	89 04 24             	mov    %eax,(%esp)
801037ed:	e8 4e 3f 00 00       	call   80107740 <sgenrand>
801037f2:	83 c4 10             	add    $0x10,%esp
801037f5:	c9                   	leave  
801037f6:	c3                   	ret    
801037f7:	89 f6                	mov    %esi,%esi
801037f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103800 <mycpu>:
80103800:	55                   	push   %ebp
80103801:	89 e5                	mov    %esp,%ebp
80103803:	56                   	push   %esi
80103804:	53                   	push   %ebx
80103805:	9c                   	pushf  
80103806:	58                   	pop    %eax
80103807:	f6 c4 02             	test   $0x2,%ah
8010380a:	75 5e                	jne    8010386a <mycpu+0x6a>
8010380c:	e8 5f ef ff ff       	call   80102770 <lapicid>
80103811:	8b 35 e0 46 11 80    	mov    0x801146e0,%esi
80103817:	85 f6                	test   %esi,%esi
80103819:	7e 42                	jle    8010385d <mycpu+0x5d>
8010381b:	0f b6 15 60 41 11 80 	movzbl 0x80114160,%edx
80103822:	39 d0                	cmp    %edx,%eax
80103824:	74 30                	je     80103856 <mycpu+0x56>
80103826:	b9 10 42 11 80       	mov    $0x80114210,%ecx
8010382b:	31 d2                	xor    %edx,%edx
8010382d:	8d 76 00             	lea    0x0(%esi),%esi
80103830:	83 c2 01             	add    $0x1,%edx
80103833:	39 f2                	cmp    %esi,%edx
80103835:	74 26                	je     8010385d <mycpu+0x5d>
80103837:	0f b6 19             	movzbl (%ecx),%ebx
8010383a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103840:	39 c3                	cmp    %eax,%ebx
80103842:	75 ec                	jne    80103830 <mycpu+0x30>
80103844:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010384a:	05 60 41 11 80       	add    $0x80114160,%eax
8010384f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103852:	5b                   	pop    %ebx
80103853:	5e                   	pop    %esi
80103854:	5d                   	pop    %ebp
80103855:	c3                   	ret    
80103856:	b8 60 41 11 80       	mov    $0x80114160,%eax
8010385b:	eb f2                	jmp    8010384f <mycpu+0x4f>
8010385d:	83 ec 0c             	sub    $0xc,%esp
80103860:	68 7c 7e 10 80       	push   $0x80107e7c
80103865:	e8 26 cb ff ff       	call   80100390 <panic>
8010386a:	83 ec 0c             	sub    $0xc,%esp
8010386d:	68 5c 7f 10 80       	push   $0x80107f5c
80103872:	e8 19 cb ff ff       	call   80100390 <panic>
80103877:	89 f6                	mov    %esi,%esi
80103879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103880 <cpuid>:
80103880:	55                   	push   %ebp
80103881:	89 e5                	mov    %esp,%ebp
80103883:	83 ec 08             	sub    $0x8,%esp
80103886:	e8 75 ff ff ff       	call   80103800 <mycpu>
8010388b:	2d 60 41 11 80       	sub    $0x80114160,%eax
80103890:	c9                   	leave  
80103891:	c1 f8 04             	sar    $0x4,%eax
80103894:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
8010389a:	c3                   	ret    
8010389b:	90                   	nop
8010389c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801038a0 <myproc>:
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	53                   	push   %ebx
801038a4:	83 ec 04             	sub    $0x4,%esp
801038a7:	e8 64 0e 00 00       	call   80104710 <pushcli>
801038ac:	e8 4f ff ff ff       	call   80103800 <mycpu>
801038b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801038b7:	e8 94 0e 00 00       	call   80104750 <popcli>
801038bc:	83 c4 04             	add    $0x4,%esp
801038bf:	89 d8                	mov    %ebx,%eax
801038c1:	5b                   	pop    %ebx
801038c2:	5d                   	pop    %ebp
801038c3:	c3                   	ret    
801038c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801038d0 <userinit>:
801038d0:	55                   	push   %ebp
801038d1:	89 e5                	mov    %esp,%ebp
801038d3:	53                   	push   %ebx
801038d4:	83 ec 04             	sub    $0x4,%esp
801038d7:	e8 b4 fd ff ff       	call   80103690 <allocproc>
801038dc:	89 c3                	mov    %eax,%ebx
801038de:	a3 b8 b5 10 80       	mov    %eax,0x8010b5b8
801038e3:	e8 f8 39 00 00       	call   801072e0 <setupkvm>
801038e8:	85 c0                	test   %eax,%eax
801038ea:	89 43 04             	mov    %eax,0x4(%ebx)
801038ed:	0f 84 bd 00 00 00    	je     801039b0 <userinit+0xe0>
801038f3:	83 ec 04             	sub    $0x4,%esp
801038f6:	68 2c 00 00 00       	push   $0x2c
801038fb:	68 64 b4 10 80       	push   $0x8010b464
80103900:	50                   	push   %eax
80103901:	e8 ba 36 00 00       	call   80106fc0 <inituvm>
80103906:	83 c4 0c             	add    $0xc,%esp
80103909:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
8010390f:	6a 4c                	push   $0x4c
80103911:	6a 00                	push   $0x0
80103913:	ff 73 18             	pushl  0x18(%ebx)
80103916:	e8 d5 0f 00 00       	call   801048f0 <memset>
8010391b:	8b 43 18             	mov    0x18(%ebx),%eax
8010391e:	ba 1b 00 00 00       	mov    $0x1b,%edx
80103923:	b9 23 00 00 00       	mov    $0x23,%ecx
80103928:	83 c4 0c             	add    $0xc,%esp
8010392b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
8010392f:	8b 43 18             	mov    0x18(%ebx),%eax
80103932:	66 89 48 2c          	mov    %cx,0x2c(%eax)
80103936:	8b 43 18             	mov    0x18(%ebx),%eax
80103939:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010393d:	66 89 50 28          	mov    %dx,0x28(%eax)
80103941:	8b 43 18             	mov    0x18(%ebx),%eax
80103944:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103948:	66 89 50 48          	mov    %dx,0x48(%eax)
8010394c:	8b 43 18             	mov    0x18(%ebx),%eax
8010394f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80103956:	8b 43 18             	mov    0x18(%ebx),%eax
80103959:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80103960:	8b 43 18             	mov    0x18(%ebx),%eax
80103963:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
8010396a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010396d:	6a 10                	push   $0x10
8010396f:	68 a5 7e 10 80       	push   $0x80107ea5
80103974:	50                   	push   %eax
80103975:	e8 56 11 00 00       	call   80104ad0 <safestrcpy>
8010397a:	c7 04 24 ae 7e 10 80 	movl   $0x80107eae,(%esp)
80103981:	e8 9a e5 ff ff       	call   80101f20 <namei>
80103986:	89 43 68             	mov    %eax,0x68(%ebx)
80103989:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103990:	e8 4b 0e 00 00       	call   801047e0 <acquire>
80103995:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
8010399c:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
801039a3:	e8 f8 0e 00 00       	call   801048a0 <release>
801039a8:	83 c4 10             	add    $0x10,%esp
801039ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039ae:	c9                   	leave  
801039af:	c3                   	ret    
801039b0:	83 ec 0c             	sub    $0xc,%esp
801039b3:	68 8c 7e 10 80       	push   $0x80107e8c
801039b8:	e8 d3 c9 ff ff       	call   80100390 <panic>
801039bd:	8d 76 00             	lea    0x0(%esi),%esi

801039c0 <growproc>:
801039c0:	55                   	push   %ebp
801039c1:	89 e5                	mov    %esp,%ebp
801039c3:	56                   	push   %esi
801039c4:	53                   	push   %ebx
801039c5:	8b 75 08             	mov    0x8(%ebp),%esi
801039c8:	e8 43 0d 00 00       	call   80104710 <pushcli>
801039cd:	e8 2e fe ff ff       	call   80103800 <mycpu>
801039d2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801039d8:	e8 73 0d 00 00       	call   80104750 <popcli>
801039dd:	83 fe 00             	cmp    $0x0,%esi
801039e0:	8b 03                	mov    (%ebx),%eax
801039e2:	7f 1c                	jg     80103a00 <growproc+0x40>
801039e4:	75 3a                	jne    80103a20 <growproc+0x60>
801039e6:	83 ec 0c             	sub    $0xc,%esp
801039e9:	89 03                	mov    %eax,(%ebx)
801039eb:	53                   	push   %ebx
801039ec:	e8 bf 34 00 00       	call   80106eb0 <switchuvm>
801039f1:	83 c4 10             	add    $0x10,%esp
801039f4:	31 c0                	xor    %eax,%eax
801039f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039f9:	5b                   	pop    %ebx
801039fa:	5e                   	pop    %esi
801039fb:	5d                   	pop    %ebp
801039fc:	c3                   	ret    
801039fd:	8d 76 00             	lea    0x0(%esi),%esi
80103a00:	83 ec 04             	sub    $0x4,%esp
80103a03:	01 c6                	add    %eax,%esi
80103a05:	56                   	push   %esi
80103a06:	50                   	push   %eax
80103a07:	ff 73 04             	pushl  0x4(%ebx)
80103a0a:	e8 f1 36 00 00       	call   80107100 <allocuvm>
80103a0f:	83 c4 10             	add    $0x10,%esp
80103a12:	85 c0                	test   %eax,%eax
80103a14:	75 d0                	jne    801039e6 <growproc+0x26>
80103a16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a1b:	eb d9                	jmp    801039f6 <growproc+0x36>
80103a1d:	8d 76 00             	lea    0x0(%esi),%esi
80103a20:	83 ec 04             	sub    $0x4,%esp
80103a23:	01 c6                	add    %eax,%esi
80103a25:	56                   	push   %esi
80103a26:	50                   	push   %eax
80103a27:	ff 73 04             	pushl  0x4(%ebx)
80103a2a:	e8 01 38 00 00       	call   80107230 <deallocuvm>
80103a2f:	83 c4 10             	add    $0x10,%esp
80103a32:	85 c0                	test   %eax,%eax
80103a34:	75 b0                	jne    801039e6 <growproc+0x26>
80103a36:	eb de                	jmp    80103a16 <growproc+0x56>
80103a38:	90                   	nop
80103a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103a40 <fork>:
80103a40:	55                   	push   %ebp
80103a41:	89 e5                	mov    %esp,%ebp
80103a43:	57                   	push   %edi
80103a44:	56                   	push   %esi
80103a45:	53                   	push   %ebx
80103a46:	83 ec 1c             	sub    $0x1c,%esp
80103a49:	e8 c2 0c 00 00       	call   80104710 <pushcli>
80103a4e:	e8 ad fd ff ff       	call   80103800 <mycpu>
80103a53:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103a59:	e8 f2 0c 00 00       	call   80104750 <popcli>
80103a5e:	e8 2d fc ff ff       	call   80103690 <allocproc>
80103a63:	85 c0                	test   %eax,%eax
80103a65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a68:	0f 84 c7 00 00 00    	je     80103b35 <fork+0xf5>
80103a6e:	83 ec 08             	sub    $0x8,%esp
80103a71:	ff 33                	pushl  (%ebx)
80103a73:	ff 73 04             	pushl  0x4(%ebx)
80103a76:	89 c7                	mov    %eax,%edi
80103a78:	e8 33 39 00 00       	call   801073b0 <copyuvm>
80103a7d:	83 c4 10             	add    $0x10,%esp
80103a80:	85 c0                	test   %eax,%eax
80103a82:	89 47 04             	mov    %eax,0x4(%edi)
80103a85:	0f 84 b1 00 00 00    	je     80103b3c <fork+0xfc>
80103a8b:	8b 43 7c             	mov    0x7c(%ebx),%eax
80103a8e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103a91:	89 41 7c             	mov    %eax,0x7c(%ecx)
80103a94:	8b 03                	mov    (%ebx),%eax
80103a96:	8b 79 18             	mov    0x18(%ecx),%edi
80103a99:	89 59 14             	mov    %ebx,0x14(%ecx)
80103a9c:	89 01                	mov    %eax,(%ecx)
80103a9e:	89 c8                	mov    %ecx,%eax
80103aa0:	8b 73 18             	mov    0x18(%ebx),%esi
80103aa3:	b9 13 00 00 00       	mov    $0x13,%ecx
80103aa8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103aaa:	31 f6                	xor    %esi,%esi
80103aac:	8b 40 18             	mov    0x18(%eax),%eax
80103aaf:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103ab6:	8d 76 00             	lea    0x0(%esi),%esi
80103ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103ac0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103ac4:	85 c0                	test   %eax,%eax
80103ac6:	74 13                	je     80103adb <fork+0x9b>
80103ac8:	83 ec 0c             	sub    $0xc,%esp
80103acb:	50                   	push   %eax
80103acc:	e8 5f d3 ff ff       	call   80100e30 <filedup>
80103ad1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ad4:	83 c4 10             	add    $0x10,%esp
80103ad7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103adb:	83 c6 01             	add    $0x1,%esi
80103ade:	83 fe 10             	cmp    $0x10,%esi
80103ae1:	75 dd                	jne    80103ac0 <fork+0x80>
80103ae3:	83 ec 0c             	sub    $0xc,%esp
80103ae6:	ff 73 68             	pushl  0x68(%ebx)
80103ae9:	83 c3 6c             	add    $0x6c,%ebx
80103aec:	e8 9f db ff ff       	call   80101690 <idup>
80103af1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103af4:	83 c4 0c             	add    $0xc,%esp
80103af7:	89 47 68             	mov    %eax,0x68(%edi)
80103afa:	8d 47 6c             	lea    0x6c(%edi),%eax
80103afd:	6a 10                	push   $0x10
80103aff:	53                   	push   %ebx
80103b00:	50                   	push   %eax
80103b01:	e8 ca 0f 00 00       	call   80104ad0 <safestrcpy>
80103b06:	8b 5f 10             	mov    0x10(%edi),%ebx
80103b09:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103b10:	e8 cb 0c 00 00       	call   801047e0 <acquire>
80103b15:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
80103b1c:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103b23:	e8 78 0d 00 00       	call   801048a0 <release>
80103b28:	83 c4 10             	add    $0x10,%esp
80103b2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b2e:	89 d8                	mov    %ebx,%eax
80103b30:	5b                   	pop    %ebx
80103b31:	5e                   	pop    %esi
80103b32:	5f                   	pop    %edi
80103b33:	5d                   	pop    %ebp
80103b34:	c3                   	ret    
80103b35:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b3a:	eb ef                	jmp    80103b2b <fork+0xeb>
80103b3c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b3f:	83 ec 0c             	sub    $0xc,%esp
80103b42:	ff 73 08             	pushl  0x8(%ebx)
80103b45:	e8 06 e8 ff ff       	call   80102350 <kfree>
80103b4a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103b51:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103b58:	83 c4 10             	add    $0x10,%esp
80103b5b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b60:	eb c9                	jmp    80103b2b <fork+0xeb>
80103b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b70 <lottery_total>:
80103b70:	55                   	push   %ebp
80103b71:	31 c0                	xor    %eax,%eax
80103b73:	ba 34 47 11 80       	mov    $0x80114734,%edx
80103b78:	89 e5                	mov    %esp,%ebp
80103b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103b80:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103b84:	75 03                	jne    80103b89 <lottery_total+0x19>
80103b86:	03 42 7c             	add    0x7c(%edx),%eax
80103b89:	81 c2 84 00 00 00    	add    $0x84,%edx
80103b8f:	81 fa 34 68 11 80    	cmp    $0x80116834,%edx
80103b95:	72 e9                	jb     80103b80 <lottery_total+0x10>
80103b97:	5d                   	pop    %ebp
80103b98:	c3                   	ret    
80103b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103ba0 <scheduler>:
80103ba0:	55                   	push   %ebp
80103ba1:	89 e5                	mov    %esp,%ebp
80103ba3:	57                   	push   %edi
80103ba4:	56                   	push   %esi
80103ba5:	53                   	push   %ebx
80103ba6:	83 ec 0c             	sub    $0xc,%esp
80103ba9:	e8 52 fc ff ff       	call   80103800 <mycpu>
80103bae:	8d 70 04             	lea    0x4(%eax),%esi
80103bb1:	89 c3                	mov    %eax,%ebx
80103bb3:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103bba:	00 00 00 
80103bbd:	8d 76 00             	lea    0x0(%esi),%esi
80103bc0:	fb                   	sti    
80103bc1:	83 ec 0c             	sub    $0xc,%esp
80103bc4:	68 00 47 11 80       	push   $0x80114700
80103bc9:	e8 12 0c 00 00       	call   801047e0 <acquire>
80103bce:	83 c4 10             	add    $0x10,%esp
80103bd1:	31 d2                	xor    %edx,%edx
80103bd3:	b8 34 47 11 80       	mov    $0x80114734,%eax
80103bd8:	90                   	nop
80103bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103be0:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103be4:	75 03                	jne    80103be9 <scheduler+0x49>
80103be6:	03 50 7c             	add    0x7c(%eax),%edx
80103be9:	05 84 00 00 00       	add    $0x84,%eax
80103bee:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80103bf3:	72 eb                	jb     80103be0 <scheduler+0x40>
80103bf5:	83 ec 0c             	sub    $0xc,%esp
80103bf8:	bf 34 47 11 80       	mov    $0x80114734,%edi
80103bfd:	52                   	push   %edx
80103bfe:	e8 cd 3c 00 00       	call   801078d0 <random_at_most>
80103c03:	83 c4 10             	add    $0x10,%esp
80103c06:	31 d2                	xor    %edx,%edx
80103c08:	83 7f 0c 03          	cmpl   $0x3,0xc(%edi)
80103c0c:	75 5a                	jne    80103c68 <scheduler+0xc8>
80103c0e:	03 57 7c             	add    0x7c(%edi),%edx
80103c11:	39 d0                	cmp    %edx,%eax
80103c13:	7f 53                	jg     80103c68 <scheduler+0xc8>
80103c15:	83 ec 0c             	sub    $0xc,%esp
80103c18:	89 bb ac 00 00 00    	mov    %edi,0xac(%ebx)
80103c1e:	57                   	push   %edi
80103c1f:	e8 8c 32 00 00       	call   80106eb0 <switchuvm>
80103c24:	58                   	pop    %eax
80103c25:	5a                   	pop    %edx
80103c26:	ff 77 1c             	pushl  0x1c(%edi)
80103c29:	56                   	push   %esi
80103c2a:	c7 47 0c 04 00 00 00 	movl   $0x4,0xc(%edi)
80103c31:	e8 f5 0e 00 00       	call   80104b2b <swtch>
80103c36:	e8 55 32 00 00       	call   80106e90 <switchkvm>
80103c3b:	83 87 80 00 00 00 01 	addl   $0x1,0x80(%edi)
80103c42:	83 c4 10             	add    $0x10,%esp
80103c45:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103c4c:	00 00 00 
80103c4f:	83 ec 0c             	sub    $0xc,%esp
80103c52:	68 00 47 11 80       	push   $0x80114700
80103c57:	e8 44 0c 00 00       	call   801048a0 <release>
80103c5c:	83 c4 10             	add    $0x10,%esp
80103c5f:	e9 5c ff ff ff       	jmp    80103bc0 <scheduler+0x20>
80103c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c68:	81 c7 84 00 00 00    	add    $0x84,%edi
80103c6e:	81 ff 34 68 11 80    	cmp    $0x80116834,%edi
80103c74:	72 92                	jb     80103c08 <scheduler+0x68>
80103c76:	eb d7                	jmp    80103c4f <scheduler+0xaf>
80103c78:	90                   	nop
80103c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103c80 <sched>:
80103c80:	55                   	push   %ebp
80103c81:	89 e5                	mov    %esp,%ebp
80103c83:	56                   	push   %esi
80103c84:	53                   	push   %ebx
80103c85:	e8 86 0a 00 00       	call   80104710 <pushcli>
80103c8a:	e8 71 fb ff ff       	call   80103800 <mycpu>
80103c8f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103c95:	e8 b6 0a 00 00       	call   80104750 <popcli>
80103c9a:	83 ec 0c             	sub    $0xc,%esp
80103c9d:	68 00 47 11 80       	push   $0x80114700
80103ca2:	e8 09 0b 00 00       	call   801047b0 <holding>
80103ca7:	83 c4 10             	add    $0x10,%esp
80103caa:	85 c0                	test   %eax,%eax
80103cac:	74 4f                	je     80103cfd <sched+0x7d>
80103cae:	e8 4d fb ff ff       	call   80103800 <mycpu>
80103cb3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103cba:	75 68                	jne    80103d24 <sched+0xa4>
80103cbc:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103cc0:	74 55                	je     80103d17 <sched+0x97>
80103cc2:	9c                   	pushf  
80103cc3:	58                   	pop    %eax
80103cc4:	f6 c4 02             	test   $0x2,%ah
80103cc7:	75 41                	jne    80103d0a <sched+0x8a>
80103cc9:	e8 32 fb ff ff       	call   80103800 <mycpu>
80103cce:	83 c3 1c             	add    $0x1c,%ebx
80103cd1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
80103cd7:	e8 24 fb ff ff       	call   80103800 <mycpu>
80103cdc:	83 ec 08             	sub    $0x8,%esp
80103cdf:	ff 70 04             	pushl  0x4(%eax)
80103ce2:	53                   	push   %ebx
80103ce3:	e8 43 0e 00 00       	call   80104b2b <swtch>
80103ce8:	e8 13 fb ff ff       	call   80103800 <mycpu>
80103ced:	83 c4 10             	add    $0x10,%esp
80103cf0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80103cf6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103cf9:	5b                   	pop    %ebx
80103cfa:	5e                   	pop    %esi
80103cfb:	5d                   	pop    %ebp
80103cfc:	c3                   	ret    
80103cfd:	83 ec 0c             	sub    $0xc,%esp
80103d00:	68 b0 7e 10 80       	push   $0x80107eb0
80103d05:	e8 86 c6 ff ff       	call   80100390 <panic>
80103d0a:	83 ec 0c             	sub    $0xc,%esp
80103d0d:	68 dc 7e 10 80       	push   $0x80107edc
80103d12:	e8 79 c6 ff ff       	call   80100390 <panic>
80103d17:	83 ec 0c             	sub    $0xc,%esp
80103d1a:	68 ce 7e 10 80       	push   $0x80107ece
80103d1f:	e8 6c c6 ff ff       	call   80100390 <panic>
80103d24:	83 ec 0c             	sub    $0xc,%esp
80103d27:	68 c2 7e 10 80       	push   $0x80107ec2
80103d2c:	e8 5f c6 ff ff       	call   80100390 <panic>
80103d31:	eb 0d                	jmp    80103d40 <exit>
80103d33:	90                   	nop
80103d34:	90                   	nop
80103d35:	90                   	nop
80103d36:	90                   	nop
80103d37:	90                   	nop
80103d38:	90                   	nop
80103d39:	90                   	nop
80103d3a:	90                   	nop
80103d3b:	90                   	nop
80103d3c:	90                   	nop
80103d3d:	90                   	nop
80103d3e:	90                   	nop
80103d3f:	90                   	nop

80103d40 <exit>:
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	57                   	push   %edi
80103d44:	56                   	push   %esi
80103d45:	53                   	push   %ebx
80103d46:	83 ec 0c             	sub    $0xc,%esp
80103d49:	e8 c2 09 00 00       	call   80104710 <pushcli>
80103d4e:	e8 ad fa ff ff       	call   80103800 <mycpu>
80103d53:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103d59:	e8 f2 09 00 00       	call   80104750 <popcli>
80103d5e:	39 35 b8 b5 10 80    	cmp    %esi,0x8010b5b8
80103d64:	8d 5e 28             	lea    0x28(%esi),%ebx
80103d67:	8d 7e 68             	lea    0x68(%esi),%edi
80103d6a:	0f 84 f1 00 00 00    	je     80103e61 <exit+0x121>
80103d70:	8b 03                	mov    (%ebx),%eax
80103d72:	85 c0                	test   %eax,%eax
80103d74:	74 12                	je     80103d88 <exit+0x48>
80103d76:	83 ec 0c             	sub    $0xc,%esp
80103d79:	50                   	push   %eax
80103d7a:	e8 01 d1 ff ff       	call   80100e80 <fileclose>
80103d7f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103d85:	83 c4 10             	add    $0x10,%esp
80103d88:	83 c3 04             	add    $0x4,%ebx
80103d8b:	39 fb                	cmp    %edi,%ebx
80103d8d:	75 e1                	jne    80103d70 <exit+0x30>
80103d8f:	e8 9c ee ff ff       	call   80102c30 <begin_op>
80103d94:	83 ec 0c             	sub    $0xc,%esp
80103d97:	ff 76 68             	pushl  0x68(%esi)
80103d9a:	e8 51 da ff ff       	call   801017f0 <iput>
80103d9f:	e8 fc ee ff ff       	call   80102ca0 <end_op>
80103da4:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
80103dab:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103db2:	e8 29 0a 00 00       	call   801047e0 <acquire>
80103db7:	8b 56 14             	mov    0x14(%esi),%edx
80103dba:	83 c4 10             	add    $0x10,%esp
80103dbd:	b8 34 47 11 80       	mov    $0x80114734,%eax
80103dc2:	eb 10                	jmp    80103dd4 <exit+0x94>
80103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103dc8:	05 84 00 00 00       	add    $0x84,%eax
80103dcd:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80103dd2:	73 1e                	jae    80103df2 <exit+0xb2>
80103dd4:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103dd8:	75 ee                	jne    80103dc8 <exit+0x88>
80103dda:	3b 50 20             	cmp    0x20(%eax),%edx
80103ddd:	75 e9                	jne    80103dc8 <exit+0x88>
80103ddf:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103de6:	05 84 00 00 00       	add    $0x84,%eax
80103deb:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80103df0:	72 e2                	jb     80103dd4 <exit+0x94>
80103df2:	8b 0d b8 b5 10 80    	mov    0x8010b5b8,%ecx
80103df8:	ba 34 47 11 80       	mov    $0x80114734,%edx
80103dfd:	eb 0f                	jmp    80103e0e <exit+0xce>
80103dff:	90                   	nop
80103e00:	81 c2 84 00 00 00    	add    $0x84,%edx
80103e06:	81 fa 34 68 11 80    	cmp    $0x80116834,%edx
80103e0c:	73 3a                	jae    80103e48 <exit+0x108>
80103e0e:	39 72 14             	cmp    %esi,0x14(%edx)
80103e11:	75 ed                	jne    80103e00 <exit+0xc0>
80103e13:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80103e17:	89 4a 14             	mov    %ecx,0x14(%edx)
80103e1a:	75 e4                	jne    80103e00 <exit+0xc0>
80103e1c:	b8 34 47 11 80       	mov    $0x80114734,%eax
80103e21:	eb 11                	jmp    80103e34 <exit+0xf4>
80103e23:	90                   	nop
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	05 84 00 00 00       	add    $0x84,%eax
80103e2d:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80103e32:	73 cc                	jae    80103e00 <exit+0xc0>
80103e34:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e38:	75 ee                	jne    80103e28 <exit+0xe8>
80103e3a:	3b 48 20             	cmp    0x20(%eax),%ecx
80103e3d:	75 e9                	jne    80103e28 <exit+0xe8>
80103e3f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e46:	eb e0                	jmp    80103e28 <exit+0xe8>
80103e48:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
80103e4f:	e8 2c fe ff ff       	call   80103c80 <sched>
80103e54:	83 ec 0c             	sub    $0xc,%esp
80103e57:	68 fd 7e 10 80       	push   $0x80107efd
80103e5c:	e8 2f c5 ff ff       	call   80100390 <panic>
80103e61:	83 ec 0c             	sub    $0xc,%esp
80103e64:	68 f0 7e 10 80       	push   $0x80107ef0
80103e69:	e8 22 c5 ff ff       	call   80100390 <panic>
80103e6e:	66 90                	xchg   %ax,%ax

80103e70 <yield>:
80103e70:	55                   	push   %ebp
80103e71:	89 e5                	mov    %esp,%ebp
80103e73:	53                   	push   %ebx
80103e74:	83 ec 10             	sub    $0x10,%esp
80103e77:	68 00 47 11 80       	push   $0x80114700
80103e7c:	e8 5f 09 00 00       	call   801047e0 <acquire>
80103e81:	e8 8a 08 00 00       	call   80104710 <pushcli>
80103e86:	e8 75 f9 ff ff       	call   80103800 <mycpu>
80103e8b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103e91:	e8 ba 08 00 00       	call   80104750 <popcli>
80103e96:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103e9d:	e8 de fd ff ff       	call   80103c80 <sched>
80103ea2:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103ea9:	e8 f2 09 00 00       	call   801048a0 <release>
80103eae:	83 c4 10             	add    $0x10,%esp
80103eb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103eb4:	c9                   	leave  
80103eb5:	c3                   	ret    
80103eb6:	8d 76 00             	lea    0x0(%esi),%esi
80103eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ec0 <sleep>:
80103ec0:	55                   	push   %ebp
80103ec1:	89 e5                	mov    %esp,%ebp
80103ec3:	57                   	push   %edi
80103ec4:	56                   	push   %esi
80103ec5:	53                   	push   %ebx
80103ec6:	83 ec 0c             	sub    $0xc,%esp
80103ec9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103ecc:	8b 75 0c             	mov    0xc(%ebp),%esi
80103ecf:	e8 3c 08 00 00       	call   80104710 <pushcli>
80103ed4:	e8 27 f9 ff ff       	call   80103800 <mycpu>
80103ed9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103edf:	e8 6c 08 00 00       	call   80104750 <popcli>
80103ee4:	85 db                	test   %ebx,%ebx
80103ee6:	0f 84 87 00 00 00    	je     80103f73 <sleep+0xb3>
80103eec:	85 f6                	test   %esi,%esi
80103eee:	74 76                	je     80103f66 <sleep+0xa6>
80103ef0:	81 fe 00 47 11 80    	cmp    $0x80114700,%esi
80103ef6:	74 50                	je     80103f48 <sleep+0x88>
80103ef8:	83 ec 0c             	sub    $0xc,%esp
80103efb:	68 00 47 11 80       	push   $0x80114700
80103f00:	e8 db 08 00 00       	call   801047e0 <acquire>
80103f05:	89 34 24             	mov    %esi,(%esp)
80103f08:	e8 93 09 00 00       	call   801048a0 <release>
80103f0d:	89 7b 20             	mov    %edi,0x20(%ebx)
80103f10:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103f17:	e8 64 fd ff ff       	call   80103c80 <sched>
80103f1c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103f23:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103f2a:	e8 71 09 00 00       	call   801048a0 <release>
80103f2f:	89 75 08             	mov    %esi,0x8(%ebp)
80103f32:	83 c4 10             	add    $0x10,%esp
80103f35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f38:	5b                   	pop    %ebx
80103f39:	5e                   	pop    %esi
80103f3a:	5f                   	pop    %edi
80103f3b:	5d                   	pop    %ebp
80103f3c:	e9 9f 08 00 00       	jmp    801047e0 <acquire>
80103f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f48:	89 7b 20             	mov    %edi,0x20(%ebx)
80103f4b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103f52:	e8 29 fd ff ff       	call   80103c80 <sched>
80103f57:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103f5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f61:	5b                   	pop    %ebx
80103f62:	5e                   	pop    %esi
80103f63:	5f                   	pop    %edi
80103f64:	5d                   	pop    %ebp
80103f65:	c3                   	ret    
80103f66:	83 ec 0c             	sub    $0xc,%esp
80103f69:	68 0f 7f 10 80       	push   $0x80107f0f
80103f6e:	e8 1d c4 ff ff       	call   80100390 <panic>
80103f73:	83 ec 0c             	sub    $0xc,%esp
80103f76:	68 09 7f 10 80       	push   $0x80107f09
80103f7b:	e8 10 c4 ff ff       	call   80100390 <panic>

80103f80 <wait>:
80103f80:	55                   	push   %ebp
80103f81:	89 e5                	mov    %esp,%ebp
80103f83:	56                   	push   %esi
80103f84:	53                   	push   %ebx
80103f85:	e8 86 07 00 00       	call   80104710 <pushcli>
80103f8a:	e8 71 f8 ff ff       	call   80103800 <mycpu>
80103f8f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103f95:	e8 b6 07 00 00       	call   80104750 <popcli>
80103f9a:	83 ec 0c             	sub    $0xc,%esp
80103f9d:	68 00 47 11 80       	push   $0x80114700
80103fa2:	e8 39 08 00 00       	call   801047e0 <acquire>
80103fa7:	83 c4 10             	add    $0x10,%esp
80103faa:	31 c0                	xor    %eax,%eax
80103fac:	bb 34 47 11 80       	mov    $0x80114734,%ebx
80103fb1:	eb 13                	jmp    80103fc6 <wait+0x46>
80103fb3:	90                   	nop
80103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fb8:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103fbe:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
80103fc4:	73 1e                	jae    80103fe4 <wait+0x64>
80103fc6:	39 73 14             	cmp    %esi,0x14(%ebx)
80103fc9:	75 ed                	jne    80103fb8 <wait+0x38>
80103fcb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fcf:	74 37                	je     80104008 <wait+0x88>
80103fd1:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103fd7:	b8 01 00 00 00       	mov    $0x1,%eax
80103fdc:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
80103fe2:	72 e2                	jb     80103fc6 <wait+0x46>
80103fe4:	85 c0                	test   %eax,%eax
80103fe6:	74 76                	je     8010405e <wait+0xde>
80103fe8:	8b 46 24             	mov    0x24(%esi),%eax
80103feb:	85 c0                	test   %eax,%eax
80103fed:	75 6f                	jne    8010405e <wait+0xde>
80103fef:	83 ec 08             	sub    $0x8,%esp
80103ff2:	68 00 47 11 80       	push   $0x80114700
80103ff7:	56                   	push   %esi
80103ff8:	e8 c3 fe ff ff       	call   80103ec0 <sleep>
80103ffd:	83 c4 10             	add    $0x10,%esp
80104000:	eb a8                	jmp    80103faa <wait+0x2a>
80104002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104008:	83 ec 0c             	sub    $0xc,%esp
8010400b:	ff 73 08             	pushl  0x8(%ebx)
8010400e:	8b 73 10             	mov    0x10(%ebx),%esi
80104011:	e8 3a e3 ff ff       	call   80102350 <kfree>
80104016:	5a                   	pop    %edx
80104017:	ff 73 04             	pushl  0x4(%ebx)
8010401a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104021:	e8 3a 32 00 00       	call   80107260 <freevm>
80104026:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
8010402d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80104034:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
8010403b:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
8010403f:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80104046:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010404d:	e8 4e 08 00 00       	call   801048a0 <release>
80104052:	83 c4 10             	add    $0x10,%esp
80104055:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104058:	89 f0                	mov    %esi,%eax
8010405a:	5b                   	pop    %ebx
8010405b:	5e                   	pop    %esi
8010405c:	5d                   	pop    %ebp
8010405d:	c3                   	ret    
8010405e:	83 ec 0c             	sub    $0xc,%esp
80104061:	be ff ff ff ff       	mov    $0xffffffff,%esi
80104066:	68 00 47 11 80       	push   $0x80114700
8010406b:	e8 30 08 00 00       	call   801048a0 <release>
80104070:	83 c4 10             	add    $0x10,%esp
80104073:	eb e0                	jmp    80104055 <wait+0xd5>
80104075:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104080 <wakeup>:
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	53                   	push   %ebx
80104084:	83 ec 10             	sub    $0x10,%esp
80104087:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010408a:	68 00 47 11 80       	push   $0x80114700
8010408f:	e8 4c 07 00 00       	call   801047e0 <acquire>
80104094:	83 c4 10             	add    $0x10,%esp
80104097:	b8 34 47 11 80       	mov    $0x80114734,%eax
8010409c:	eb 0e                	jmp    801040ac <wakeup+0x2c>
8010409e:	66 90                	xchg   %ax,%ax
801040a0:	05 84 00 00 00       	add    $0x84,%eax
801040a5:	3d 34 68 11 80       	cmp    $0x80116834,%eax
801040aa:	73 1e                	jae    801040ca <wakeup+0x4a>
801040ac:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040b0:	75 ee                	jne    801040a0 <wakeup+0x20>
801040b2:	3b 58 20             	cmp    0x20(%eax),%ebx
801040b5:	75 e9                	jne    801040a0 <wakeup+0x20>
801040b7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801040be:	05 84 00 00 00       	add    $0x84,%eax
801040c3:	3d 34 68 11 80       	cmp    $0x80116834,%eax
801040c8:	72 e2                	jb     801040ac <wakeup+0x2c>
801040ca:	c7 45 08 00 47 11 80 	movl   $0x80114700,0x8(%ebp)
801040d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040d4:	c9                   	leave  
801040d5:	e9 c6 07 00 00       	jmp    801048a0 <release>
801040da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801040e0 <kill>:
801040e0:	55                   	push   %ebp
801040e1:	89 e5                	mov    %esp,%ebp
801040e3:	53                   	push   %ebx
801040e4:	83 ec 10             	sub    $0x10,%esp
801040e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040ea:	68 00 47 11 80       	push   $0x80114700
801040ef:	e8 ec 06 00 00       	call   801047e0 <acquire>
801040f4:	83 c4 10             	add    $0x10,%esp
801040f7:	b8 34 47 11 80       	mov    $0x80114734,%eax
801040fc:	eb 0e                	jmp    8010410c <kill+0x2c>
801040fe:	66 90                	xchg   %ax,%ax
80104100:	05 84 00 00 00       	add    $0x84,%eax
80104105:	3d 34 68 11 80       	cmp    $0x80116834,%eax
8010410a:	73 34                	jae    80104140 <kill+0x60>
8010410c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010410f:	75 ef                	jne    80104100 <kill+0x20>
80104111:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104115:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010411c:	75 07                	jne    80104125 <kill+0x45>
8010411e:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80104125:	83 ec 0c             	sub    $0xc,%esp
80104128:	68 00 47 11 80       	push   $0x80114700
8010412d:	e8 6e 07 00 00       	call   801048a0 <release>
80104132:	83 c4 10             	add    $0x10,%esp
80104135:	31 c0                	xor    %eax,%eax
80104137:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010413a:	c9                   	leave  
8010413b:	c3                   	ret    
8010413c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104140:	83 ec 0c             	sub    $0xc,%esp
80104143:	68 00 47 11 80       	push   $0x80114700
80104148:	e8 53 07 00 00       	call   801048a0 <release>
8010414d:	83 c4 10             	add    $0x10,%esp
80104150:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104155:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104158:	c9                   	leave  
80104159:	c3                   	ret    
8010415a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104160 <settickets>:
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	56                   	push   %esi
80104164:	53                   	push   %ebx
80104165:	8b 75 08             	mov    0x8(%ebp),%esi
80104168:	85 f6                	test   %esi,%esi
8010416a:	7e 54                	jle    801041c0 <settickets+0x60>
8010416c:	e8 9f 05 00 00       	call   80104710 <pushcli>
80104171:	e8 8a f6 ff ff       	call   80103800 <mycpu>
80104176:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
8010417c:	e8 cf 05 00 00       	call   80104750 <popcli>
80104181:	83 ec 0c             	sub    $0xc,%esp
80104184:	89 73 7c             	mov    %esi,0x7c(%ebx)
80104187:	68 00 47 11 80       	push   $0x80114700
8010418c:	81 eb 34 47 11 80    	sub    $0x80114734,%ebx
80104192:	83 e3 fc             	and    $0xfffffffc,%ebx
80104195:	e8 46 06 00 00       	call   801047e0 <acquire>
8010419a:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
801041a1:	89 b3 b0 47 11 80    	mov    %esi,-0x7feeb850(%ebx)
801041a7:	e8 f4 06 00 00       	call   801048a0 <release>
801041ac:	83 c4 10             	add    $0x10,%esp
801041af:	31 c0                	xor    %eax,%eax
801041b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041b4:	5b                   	pop    %ebx
801041b5:	5e                   	pop    %esi
801041b6:	5d                   	pop    %ebp
801041b7:	c3                   	ret    
801041b8:	90                   	nop
801041b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801041c5:	eb ea                	jmp    801041b1 <settickets+0x51>
801041c7:	89 f6                	mov    %esi,%esi
801041c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041d0 <getpinfo>:
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	83 ec 14             	sub    $0x14,%esp
801041d6:	68 00 47 11 80       	push   $0x80114700
801041db:	e8 00 06 00 00       	call   801047e0 <acquire>
801041e0:	8b 55 08             	mov    0x8(%ebp),%edx
801041e3:	83 c4 10             	add    $0x10,%esp
801041e6:	b8 34 47 11 80       	mov    $0x80114734,%eax
801041eb:	90                   	nop
801041ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801041f0:	8b 48 10             	mov    0x10(%eax),%ecx
801041f3:	89 8a 00 02 00 00    	mov    %ecx,0x200(%edx)
801041f9:	31 c9                	xor    %ecx,%ecx
801041fb:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
801041ff:	0f 95 c1             	setne  %cl
80104202:	05 84 00 00 00       	add    $0x84,%eax
80104207:	83 c2 04             	add    $0x4,%edx
8010420a:	89 4a fc             	mov    %ecx,-0x4(%edx)
8010420d:	8b 48 f8             	mov    -0x8(%eax),%ecx
80104210:	89 8a fc 00 00 00    	mov    %ecx,0xfc(%edx)
80104216:	8b 48 fc             	mov    -0x4(%eax),%ecx
80104219:	89 8a fc 02 00 00    	mov    %ecx,0x2fc(%edx)
8010421f:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80104224:	72 ca                	jb     801041f0 <getpinfo+0x20>
80104226:	83 ec 0c             	sub    $0xc,%esp
80104229:	68 00 47 11 80       	push   $0x80114700
8010422e:	e8 6d 06 00 00       	call   801048a0 <release>
80104233:	31 c0                	xor    %eax,%eax
80104235:	c9                   	leave  
80104236:	c3                   	ret    
80104237:	89 f6                	mov    %esi,%esi
80104239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104240 <procdump>:
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	57                   	push   %edi
80104244:	56                   	push   %esi
80104245:	53                   	push   %ebx
80104246:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104249:	bb 34 47 11 80       	mov    $0x80114734,%ebx
8010424e:	83 ec 3c             	sub    $0x3c,%esp
80104251:	eb 27                	jmp    8010427a <procdump+0x3a>
80104253:	90                   	nop
80104254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104258:	83 ec 0c             	sub    $0xc,%esp
8010425b:	68 b7 82 10 80       	push   $0x801082b7
80104260:	e8 fb c3 ff ff       	call   80100660 <cprintf>
80104265:	83 c4 10             	add    $0x10,%esp
80104268:	81 c3 84 00 00 00    	add    $0x84,%ebx
8010426e:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
80104274:	0f 83 96 00 00 00    	jae    80104310 <procdump+0xd0>
8010427a:	8b 43 0c             	mov    0xc(%ebx),%eax
8010427d:	85 c0                	test   %eax,%eax
8010427f:	74 e7                	je     80104268 <procdump+0x28>
80104281:	83 f8 05             	cmp    $0x5,%eax
80104284:	ba 20 7f 10 80       	mov    $0x80107f20,%edx
80104289:	77 11                	ja     8010429c <procdump+0x5c>
8010428b:	8b 14 85 84 7f 10 80 	mov    -0x7fef807c(,%eax,4),%edx
80104292:	b8 20 7f 10 80       	mov    $0x80107f20,%eax
80104297:	85 d2                	test   %edx,%edx
80104299:	0f 44 d0             	cmove  %eax,%edx
8010429c:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010429f:	83 ec 0c             	sub    $0xc,%esp
801042a2:	ff 73 7c             	pushl  0x7c(%ebx)
801042a5:	50                   	push   %eax
801042a6:	52                   	push   %edx
801042a7:	ff 73 10             	pushl  0x10(%ebx)
801042aa:	68 24 7f 10 80       	push   $0x80107f24
801042af:	e8 ac c3 ff ff       	call   80100660 <cprintf>
801042b4:	83 c4 20             	add    $0x20,%esp
801042b7:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
801042bb:	75 9b                	jne    80104258 <procdump+0x18>
801042bd:	8d 45 c0             	lea    -0x40(%ebp),%eax
801042c0:	83 ec 08             	sub    $0x8,%esp
801042c3:	8d 7d c0             	lea    -0x40(%ebp),%edi
801042c6:	50                   	push   %eax
801042c7:	8b 43 1c             	mov    0x1c(%ebx),%eax
801042ca:	8b 40 0c             	mov    0xc(%eax),%eax
801042cd:	83 c0 08             	add    $0x8,%eax
801042d0:	50                   	push   %eax
801042d1:	e8 ea 03 00 00       	call   801046c0 <getcallerpcs>
801042d6:	83 c4 10             	add    $0x10,%esp
801042d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042e0:	8b 17                	mov    (%edi),%edx
801042e2:	85 d2                	test   %edx,%edx
801042e4:	0f 84 6e ff ff ff    	je     80104258 <procdump+0x18>
801042ea:	83 ec 08             	sub    $0x8,%esp
801042ed:	83 c7 04             	add    $0x4,%edi
801042f0:	52                   	push   %edx
801042f1:	68 61 79 10 80       	push   $0x80107961
801042f6:	e8 65 c3 ff ff       	call   80100660 <cprintf>
801042fb:	83 c4 10             	add    $0x10,%esp
801042fe:	39 fe                	cmp    %edi,%esi
80104300:	75 de                	jne    801042e0 <procdump+0xa0>
80104302:	e9 51 ff ff ff       	jmp    80104258 <procdump+0x18>
80104307:	89 f6                	mov    %esi,%esi
80104309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104310:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104313:	5b                   	pop    %ebx
80104314:	5e                   	pop    %esi
80104315:	5f                   	pop    %edi
80104316:	5d                   	pop    %ebp
80104317:	c3                   	ret    
80104318:	90                   	nop
80104319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104320 <clone>:
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	57                   	push   %edi
80104324:	56                   	push   %esi
80104325:	53                   	push   %ebx
80104326:	83 ec 1c             	sub    $0x1c,%esp
80104329:	e8 e2 03 00 00       	call   80104710 <pushcli>
8010432e:	e8 cd f4 ff ff       	call   80103800 <mycpu>
80104333:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80104339:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010433c:	e8 0f 04 00 00       	call   80104750 <popcli>
80104341:	e8 4a f3 ff ff       	call   80103690 <allocproc>
80104346:	85 c0                	test   %eax,%eax
80104348:	0f 84 f1 00 00 00    	je     8010443f <clone+0x11f>
8010434e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104351:	89 c3                	mov    %eax,%ebx
80104353:	b9 13 00 00 00       	mov    $0x13,%ecx
80104358:	8b 7b 18             	mov    0x18(%ebx),%edi
8010435b:	83 ec 04             	sub    $0x4,%esp
8010435e:	8b 42 04             	mov    0x4(%edx),%eax
80104361:	89 55 e0             	mov    %edx,-0x20(%ebp)
80104364:	89 43 04             	mov    %eax,0x4(%ebx)
80104367:	8b 02                	mov    (%edx),%eax
80104369:	89 53 14             	mov    %edx,0x14(%ebx)
8010436c:	89 03                	mov    %eax,(%ebx)
8010436e:	8b 45 10             	mov    0x10(%ebp),%eax
80104371:	8b 72 18             	mov    0x18(%edx),%esi
80104374:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80104376:	c7 80 f8 0f 00 00 ff 	movl   $0xfffffff,0xff8(%eax)
8010437d:	ff ff 0f 
80104380:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104383:	31 f6                	xor    %esi,%esi
80104385:	8b 45 0c             	mov    0xc(%ebp),%eax
80104388:	89 81 fc 0f 00 00    	mov    %eax,0xffc(%ecx)
8010438e:	8b 43 18             	mov    0x18(%ebx),%eax
80104391:	89 48 44             	mov    %ecx,0x44(%eax)
80104394:	8b 43 18             	mov    0x18(%ebx),%eax
80104397:	8b 7b 10             	mov    0x10(%ebx),%edi
8010439a:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801043a1:	68 00 10 00 00       	push   $0x1000
801043a6:	51                   	push   %ecx
801043a7:	8b 43 18             	mov    0x18(%ebx),%eax
801043aa:	ff 70 44             	pushl  0x44(%eax)
801043ad:	e8 ee 05 00 00       	call   801049a0 <memmove>
801043b2:	8b 43 18             	mov    0x18(%ebx),%eax
801043b5:	8b 55 e0             	mov    -0x20(%ebp),%edx
801043b8:	83 c4 10             	add    $0x10,%esp
801043bb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801043be:	81 40 44 f8 0f 00 00 	addl   $0xff8,0x44(%eax)
801043c5:	89 d7                	mov    %edx,%edi
801043c7:	8b 43 18             	mov    0x18(%ebx),%eax
801043ca:	8b 48 44             	mov    0x44(%eax),%ecx
801043cd:	89 48 08             	mov    %ecx,0x8(%eax)
801043d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
801043d3:	8b 43 18             	mov    0x18(%ebx),%eax
801043d6:	89 48 38             	mov    %ecx,0x38(%eax)
801043d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043e0:	8b 44 b7 28          	mov    0x28(%edi,%esi,4),%eax
801043e4:	85 c0                	test   %eax,%eax
801043e6:	74 10                	je     801043f8 <clone+0xd8>
801043e8:	83 ec 0c             	sub    $0xc,%esp
801043eb:	50                   	push   %eax
801043ec:	e8 3f ca ff ff       	call   80100e30 <filedup>
801043f1:	83 c4 10             	add    $0x10,%esp
801043f4:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
801043f8:	83 c6 01             	add    $0x1,%esi
801043fb:	83 fe 10             	cmp    $0x10,%esi
801043fe:	75 e0                	jne    801043e0 <clone+0xc0>
80104400:	89 fa                	mov    %edi,%edx
80104402:	83 ec 0c             	sub    $0xc,%esp
80104405:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80104408:	ff 72 68             	pushl  0x68(%edx)
8010440b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010440e:	83 c3 6c             	add    $0x6c,%ebx
80104411:	e8 7a d2 ff ff       	call   80101690 <idup>
80104416:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104419:	89 43 fc             	mov    %eax,-0x4(%ebx)
8010441c:	83 c4 0c             	add    $0xc,%esp
8010441f:	c7 43 a0 03 00 00 00 	movl   $0x3,-0x60(%ebx)
80104426:	6a 10                	push   $0x10
80104428:	83 c2 6c             	add    $0x6c,%edx
8010442b:	52                   	push   %edx
8010442c:	53                   	push   %ebx
8010442d:	e8 9e 06 00 00       	call   80104ad0 <safestrcpy>
80104432:	83 c4 10             	add    $0x10,%esp
80104435:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104438:	89 f8                	mov    %edi,%eax
8010443a:	5b                   	pop    %ebx
8010443b:	5e                   	pop    %esi
8010443c:	5f                   	pop    %edi
8010443d:	5d                   	pop    %ebp
8010443e:	c3                   	ret    
8010443f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104444:	eb ef                	jmp    80104435 <clone+0x115>
80104446:	8d 76 00             	lea    0x0(%esi),%esi
80104449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104450 <join>:
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	56                   	push   %esi
80104454:	53                   	push   %ebx
80104455:	e8 b6 02 00 00       	call   80104710 <pushcli>
8010445a:	e8 a1 f3 ff ff       	call   80103800 <mycpu>
8010445f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80104465:	e8 e6 02 00 00       	call   80104750 <popcli>
8010446a:	83 ec 0c             	sub    $0xc,%esp
8010446d:	68 00 47 11 80       	push   $0x80114700
80104472:	e8 69 03 00 00       	call   801047e0 <acquire>
80104477:	83 c4 10             	add    $0x10,%esp
8010447a:	31 c0                	xor    %eax,%eax
8010447c:	bb 34 47 11 80       	mov    $0x80114734,%ebx
80104481:	eb 13                	jmp    80104496 <join+0x46>
80104483:	90                   	nop
80104484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104488:	81 c3 84 00 00 00    	add    $0x84,%ebx
8010448e:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
80104494:	73 26                	jae    801044bc <join+0x6c>
80104496:	39 73 14             	cmp    %esi,0x14(%ebx)
80104499:	75 ed                	jne    80104488 <join+0x38>
8010449b:	8b 4e 04             	mov    0x4(%esi),%ecx
8010449e:	39 4b 04             	cmp    %ecx,0x4(%ebx)
801044a1:	75 e5                	jne    80104488 <join+0x38>
801044a3:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801044a7:	74 3f                	je     801044e8 <join+0x98>
801044a9:	81 c3 84 00 00 00    	add    $0x84,%ebx
801044af:	b8 01 00 00 00       	mov    $0x1,%eax
801044b4:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
801044ba:	72 da                	jb     80104496 <join+0x46>
801044bc:	85 c0                	test   %eax,%eax
801044be:	0f 84 91 00 00 00    	je     80104555 <join+0x105>
801044c4:	8b 46 24             	mov    0x24(%esi),%eax
801044c7:	85 c0                	test   %eax,%eax
801044c9:	0f 85 86 00 00 00    	jne    80104555 <join+0x105>
801044cf:	83 ec 08             	sub    $0x8,%esp
801044d2:	68 00 47 11 80       	push   $0x80114700
801044d7:	56                   	push   %esi
801044d8:	e8 e3 f9 ff ff       	call   80103ec0 <sleep>
801044dd:	83 c4 10             	add    $0x10,%esp
801044e0:	eb 98                	jmp    8010447a <join+0x2a>
801044e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801044e8:	8b 46 18             	mov    0x18(%esi),%eax
801044eb:	83 ec 0c             	sub    $0xc,%esp
801044ee:	8b 50 44             	mov    0x44(%eax),%edx
801044f1:	8b 43 18             	mov    0x18(%ebx),%eax
801044f4:	8b 40 08             	mov    0x8(%eax),%eax
801044f7:	2d f4 0f 00 00       	sub    $0xff4,%eax
801044fc:	89 42 1c             	mov    %eax,0x1c(%edx)
801044ff:	8b 56 18             	mov    0x18(%esi),%edx
80104502:	8b 43 18             	mov    0x18(%ebx),%eax
80104505:	8b 52 44             	mov    0x44(%edx),%edx
80104508:	89 50 44             	mov    %edx,0x44(%eax)
8010450b:	ff 73 08             	pushl  0x8(%ebx)
8010450e:	8b 73 10             	mov    0x10(%ebx),%esi
80104511:	e8 3a de ff ff       	call   80102350 <kfree>
80104516:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
8010451d:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104524:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
8010452b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80104532:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80104536:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
8010453d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80104544:	e8 57 03 00 00       	call   801048a0 <release>
80104549:	83 c4 10             	add    $0x10,%esp
8010454c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010454f:	89 f0                	mov    %esi,%eax
80104551:	5b                   	pop    %ebx
80104552:	5e                   	pop    %esi
80104553:	5d                   	pop    %ebp
80104554:	c3                   	ret    
80104555:	83 ec 0c             	sub    $0xc,%esp
80104558:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010455d:	68 00 47 11 80       	push   $0x80114700
80104562:	e8 39 03 00 00       	call   801048a0 <release>
80104567:	83 c4 10             	add    $0x10,%esp
8010456a:	eb e0                	jmp    8010454c <join+0xfc>
8010456c:	66 90                	xchg   %ax,%ax
8010456e:	66 90                	xchg   %ax,%ax

80104570 <initsleeplock>:
80104570:	55                   	push   %ebp
80104571:	89 e5                	mov    %esp,%ebp
80104573:	53                   	push   %ebx
80104574:	83 ec 0c             	sub    $0xc,%esp
80104577:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010457a:	68 9c 7f 10 80       	push   $0x80107f9c
8010457f:	8d 43 04             	lea    0x4(%ebx),%eax
80104582:	50                   	push   %eax
80104583:	e8 18 01 00 00       	call   801046a0 <initlock>
80104588:	8b 45 0c             	mov    0xc(%ebp),%eax
8010458b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104591:	83 c4 10             	add    $0x10,%esp
80104594:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010459b:	89 43 38             	mov    %eax,0x38(%ebx)
8010459e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045a1:	c9                   	leave  
801045a2:	c3                   	ret    
801045a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045b0 <acquiresleep>:
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	56                   	push   %esi
801045b4:	53                   	push   %ebx
801045b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045b8:	83 ec 0c             	sub    $0xc,%esp
801045bb:	8d 73 04             	lea    0x4(%ebx),%esi
801045be:	56                   	push   %esi
801045bf:	e8 1c 02 00 00       	call   801047e0 <acquire>
801045c4:	8b 13                	mov    (%ebx),%edx
801045c6:	83 c4 10             	add    $0x10,%esp
801045c9:	85 d2                	test   %edx,%edx
801045cb:	74 16                	je     801045e3 <acquiresleep+0x33>
801045cd:	8d 76 00             	lea    0x0(%esi),%esi
801045d0:	83 ec 08             	sub    $0x8,%esp
801045d3:	56                   	push   %esi
801045d4:	53                   	push   %ebx
801045d5:	e8 e6 f8 ff ff       	call   80103ec0 <sleep>
801045da:	8b 03                	mov    (%ebx),%eax
801045dc:	83 c4 10             	add    $0x10,%esp
801045df:	85 c0                	test   %eax,%eax
801045e1:	75 ed                	jne    801045d0 <acquiresleep+0x20>
801045e3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
801045e9:	e8 b2 f2 ff ff       	call   801038a0 <myproc>
801045ee:	8b 40 10             	mov    0x10(%eax),%eax
801045f1:	89 43 3c             	mov    %eax,0x3c(%ebx)
801045f4:	89 75 08             	mov    %esi,0x8(%ebp)
801045f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045fa:	5b                   	pop    %ebx
801045fb:	5e                   	pop    %esi
801045fc:	5d                   	pop    %ebp
801045fd:	e9 9e 02 00 00       	jmp    801048a0 <release>
80104602:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104610 <releasesleep>:
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	56                   	push   %esi
80104614:	53                   	push   %ebx
80104615:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104618:	83 ec 0c             	sub    $0xc,%esp
8010461b:	8d 73 04             	lea    0x4(%ebx),%esi
8010461e:	56                   	push   %esi
8010461f:	e8 bc 01 00 00       	call   801047e0 <acquire>
80104624:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010462a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104631:	89 1c 24             	mov    %ebx,(%esp)
80104634:	e8 47 fa ff ff       	call   80104080 <wakeup>
80104639:	89 75 08             	mov    %esi,0x8(%ebp)
8010463c:	83 c4 10             	add    $0x10,%esp
8010463f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104642:	5b                   	pop    %ebx
80104643:	5e                   	pop    %esi
80104644:	5d                   	pop    %ebp
80104645:	e9 56 02 00 00       	jmp    801048a0 <release>
8010464a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104650 <holdingsleep>:
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	57                   	push   %edi
80104654:	56                   	push   %esi
80104655:	53                   	push   %ebx
80104656:	31 ff                	xor    %edi,%edi
80104658:	83 ec 18             	sub    $0x18,%esp
8010465b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010465e:	8d 73 04             	lea    0x4(%ebx),%esi
80104661:	56                   	push   %esi
80104662:	e8 79 01 00 00       	call   801047e0 <acquire>
80104667:	8b 03                	mov    (%ebx),%eax
80104669:	83 c4 10             	add    $0x10,%esp
8010466c:	85 c0                	test   %eax,%eax
8010466e:	74 13                	je     80104683 <holdingsleep+0x33>
80104670:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104673:	e8 28 f2 ff ff       	call   801038a0 <myproc>
80104678:	39 58 10             	cmp    %ebx,0x10(%eax)
8010467b:	0f 94 c0             	sete   %al
8010467e:	0f b6 c0             	movzbl %al,%eax
80104681:	89 c7                	mov    %eax,%edi
80104683:	83 ec 0c             	sub    $0xc,%esp
80104686:	56                   	push   %esi
80104687:	e8 14 02 00 00       	call   801048a0 <release>
8010468c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010468f:	89 f8                	mov    %edi,%eax
80104691:	5b                   	pop    %ebx
80104692:	5e                   	pop    %esi
80104693:	5f                   	pop    %edi
80104694:	5d                   	pop    %ebp
80104695:	c3                   	ret    
80104696:	66 90                	xchg   %ax,%ax
80104698:	66 90                	xchg   %ax,%ax
8010469a:	66 90                	xchg   %ax,%ax
8010469c:	66 90                	xchg   %ax,%ax
8010469e:	66 90                	xchg   %ax,%ax

801046a0 <initlock>:
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	8b 45 08             	mov    0x8(%ebp),%eax
801046a6:	8b 55 0c             	mov    0xc(%ebp),%edx
801046a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801046af:	89 50 04             	mov    %edx,0x4(%eax)
801046b2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
801046b9:	5d                   	pop    %ebp
801046ba:	c3                   	ret    
801046bb:	90                   	nop
801046bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046c0 <getcallerpcs>:
801046c0:	55                   	push   %ebp
801046c1:	31 d2                	xor    %edx,%edx
801046c3:	89 e5                	mov    %esp,%ebp
801046c5:	53                   	push   %ebx
801046c6:	8b 45 08             	mov    0x8(%ebp),%eax
801046c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801046cc:	83 e8 08             	sub    $0x8,%eax
801046cf:	90                   	nop
801046d0:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801046d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801046dc:	77 1a                	ja     801046f8 <getcallerpcs+0x38>
801046de:	8b 58 04             	mov    0x4(%eax),%ebx
801046e1:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
801046e4:	83 c2 01             	add    $0x1,%edx
801046e7:	8b 00                	mov    (%eax),%eax
801046e9:	83 fa 0a             	cmp    $0xa,%edx
801046ec:	75 e2                	jne    801046d0 <getcallerpcs+0x10>
801046ee:	5b                   	pop    %ebx
801046ef:	5d                   	pop    %ebp
801046f0:	c3                   	ret    
801046f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046f8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801046fb:	83 c1 28             	add    $0x28,%ecx
801046fe:	66 90                	xchg   %ax,%ax
80104700:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104706:	83 c0 04             	add    $0x4,%eax
80104709:	39 c1                	cmp    %eax,%ecx
8010470b:	75 f3                	jne    80104700 <getcallerpcs+0x40>
8010470d:	5b                   	pop    %ebx
8010470e:	5d                   	pop    %ebp
8010470f:	c3                   	ret    

80104710 <pushcli>:
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	53                   	push   %ebx
80104714:	83 ec 04             	sub    $0x4,%esp
80104717:	9c                   	pushf  
80104718:	5b                   	pop    %ebx
80104719:	fa                   	cli    
8010471a:	e8 e1 f0 ff ff       	call   80103800 <mycpu>
8010471f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104725:	85 c0                	test   %eax,%eax
80104727:	75 11                	jne    8010473a <pushcli+0x2a>
80104729:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010472f:	e8 cc f0 ff ff       	call   80103800 <mycpu>
80104734:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
8010473a:	e8 c1 f0 ff ff       	call   80103800 <mycpu>
8010473f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104746:	83 c4 04             	add    $0x4,%esp
80104749:	5b                   	pop    %ebx
8010474a:	5d                   	pop    %ebp
8010474b:	c3                   	ret    
8010474c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104750 <popcli>:
80104750:	55                   	push   %ebp
80104751:	89 e5                	mov    %esp,%ebp
80104753:	83 ec 08             	sub    $0x8,%esp
80104756:	9c                   	pushf  
80104757:	58                   	pop    %eax
80104758:	f6 c4 02             	test   $0x2,%ah
8010475b:	75 35                	jne    80104792 <popcli+0x42>
8010475d:	e8 9e f0 ff ff       	call   80103800 <mycpu>
80104762:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104769:	78 34                	js     8010479f <popcli+0x4f>
8010476b:	e8 90 f0 ff ff       	call   80103800 <mycpu>
80104770:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104776:	85 d2                	test   %edx,%edx
80104778:	74 06                	je     80104780 <popcli+0x30>
8010477a:	c9                   	leave  
8010477b:	c3                   	ret    
8010477c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104780:	e8 7b f0 ff ff       	call   80103800 <mycpu>
80104785:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010478b:	85 c0                	test   %eax,%eax
8010478d:	74 eb                	je     8010477a <popcli+0x2a>
8010478f:	fb                   	sti    
80104790:	c9                   	leave  
80104791:	c3                   	ret    
80104792:	83 ec 0c             	sub    $0xc,%esp
80104795:	68 a7 7f 10 80       	push   $0x80107fa7
8010479a:	e8 f1 bb ff ff       	call   80100390 <panic>
8010479f:	83 ec 0c             	sub    $0xc,%esp
801047a2:	68 be 7f 10 80       	push   $0x80107fbe
801047a7:	e8 e4 bb ff ff       	call   80100390 <panic>
801047ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801047b0 <holding>:
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	56                   	push   %esi
801047b4:	53                   	push   %ebx
801047b5:	8b 75 08             	mov    0x8(%ebp),%esi
801047b8:	31 db                	xor    %ebx,%ebx
801047ba:	e8 51 ff ff ff       	call   80104710 <pushcli>
801047bf:	8b 06                	mov    (%esi),%eax
801047c1:	85 c0                	test   %eax,%eax
801047c3:	74 10                	je     801047d5 <holding+0x25>
801047c5:	8b 5e 08             	mov    0x8(%esi),%ebx
801047c8:	e8 33 f0 ff ff       	call   80103800 <mycpu>
801047cd:	39 c3                	cmp    %eax,%ebx
801047cf:	0f 94 c3             	sete   %bl
801047d2:	0f b6 db             	movzbl %bl,%ebx
801047d5:	e8 76 ff ff ff       	call   80104750 <popcli>
801047da:	89 d8                	mov    %ebx,%eax
801047dc:	5b                   	pop    %ebx
801047dd:	5e                   	pop    %esi
801047de:	5d                   	pop    %ebp
801047df:	c3                   	ret    

801047e0 <acquire>:
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	56                   	push   %esi
801047e4:	53                   	push   %ebx
801047e5:	e8 26 ff ff ff       	call   80104710 <pushcli>
801047ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
801047ed:	83 ec 0c             	sub    $0xc,%esp
801047f0:	53                   	push   %ebx
801047f1:	e8 ba ff ff ff       	call   801047b0 <holding>
801047f6:	83 c4 10             	add    $0x10,%esp
801047f9:	85 c0                	test   %eax,%eax
801047fb:	0f 85 83 00 00 00    	jne    80104884 <acquire+0xa4>
80104801:	89 c6                	mov    %eax,%esi
80104803:	ba 01 00 00 00       	mov    $0x1,%edx
80104808:	eb 09                	jmp    80104813 <acquire+0x33>
8010480a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104810:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104813:	89 d0                	mov    %edx,%eax
80104815:	f0 87 03             	lock xchg %eax,(%ebx)
80104818:	85 c0                	test   %eax,%eax
8010481a:	75 f4                	jne    80104810 <acquire+0x30>
8010481c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104821:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104824:	e8 d7 ef ff ff       	call   80103800 <mycpu>
80104829:	8d 53 0c             	lea    0xc(%ebx),%edx
8010482c:	89 43 08             	mov    %eax,0x8(%ebx)
8010482f:	89 e8                	mov    %ebp,%eax
80104831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104838:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
8010483e:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
80104844:	77 1a                	ja     80104860 <acquire+0x80>
80104846:	8b 48 04             	mov    0x4(%eax),%ecx
80104849:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
8010484c:	83 c6 01             	add    $0x1,%esi
8010484f:	8b 00                	mov    (%eax),%eax
80104851:	83 fe 0a             	cmp    $0xa,%esi
80104854:	75 e2                	jne    80104838 <acquire+0x58>
80104856:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104859:	5b                   	pop    %ebx
8010485a:	5e                   	pop    %esi
8010485b:	5d                   	pop    %ebp
8010485c:	c3                   	ret    
8010485d:	8d 76 00             	lea    0x0(%esi),%esi
80104860:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104863:	83 c2 28             	add    $0x28,%edx
80104866:	8d 76 00             	lea    0x0(%esi),%esi
80104869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104870:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104876:	83 c0 04             	add    $0x4,%eax
80104879:	39 d0                	cmp    %edx,%eax
8010487b:	75 f3                	jne    80104870 <acquire+0x90>
8010487d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104880:	5b                   	pop    %ebx
80104881:	5e                   	pop    %esi
80104882:	5d                   	pop    %ebp
80104883:	c3                   	ret    
80104884:	83 ec 0c             	sub    $0xc,%esp
80104887:	68 c5 7f 10 80       	push   $0x80107fc5
8010488c:	e8 ff ba ff ff       	call   80100390 <panic>
80104891:	eb 0d                	jmp    801048a0 <release>
80104893:	90                   	nop
80104894:	90                   	nop
80104895:	90                   	nop
80104896:	90                   	nop
80104897:	90                   	nop
80104898:	90                   	nop
80104899:	90                   	nop
8010489a:	90                   	nop
8010489b:	90                   	nop
8010489c:	90                   	nop
8010489d:	90                   	nop
8010489e:	90                   	nop
8010489f:	90                   	nop

801048a0 <release>:
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	53                   	push   %ebx
801048a4:	83 ec 10             	sub    $0x10,%esp
801048a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801048aa:	53                   	push   %ebx
801048ab:	e8 00 ff ff ff       	call   801047b0 <holding>
801048b0:	83 c4 10             	add    $0x10,%esp
801048b3:	85 c0                	test   %eax,%eax
801048b5:	74 22                	je     801048d9 <release+0x39>
801048b7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801048be:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801048c5:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801048ca:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801048d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801048d3:	c9                   	leave  
801048d4:	e9 77 fe ff ff       	jmp    80104750 <popcli>
801048d9:	83 ec 0c             	sub    $0xc,%esp
801048dc:	68 cd 7f 10 80       	push   $0x80107fcd
801048e1:	e8 aa ba ff ff       	call   80100390 <panic>
801048e6:	66 90                	xchg   %ax,%ax
801048e8:	66 90                	xchg   %ax,%ax
801048ea:	66 90                	xchg   %ax,%ax
801048ec:	66 90                	xchg   %ax,%ax
801048ee:	66 90                	xchg   %ax,%ax

801048f0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	57                   	push   %edi
801048f4:	53                   	push   %ebx
801048f5:	8b 55 08             	mov    0x8(%ebp),%edx
801048f8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
801048fb:	f6 c2 03             	test   $0x3,%dl
801048fe:	75 05                	jne    80104905 <memset+0x15>
80104900:	f6 c1 03             	test   $0x3,%cl
80104903:	74 13                	je     80104918 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104905:	89 d7                	mov    %edx,%edi
80104907:	8b 45 0c             	mov    0xc(%ebp),%eax
8010490a:	fc                   	cld    
8010490b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010490d:	5b                   	pop    %ebx
8010490e:	89 d0                	mov    %edx,%eax
80104910:	5f                   	pop    %edi
80104911:	5d                   	pop    %ebp
80104912:	c3                   	ret    
80104913:	90                   	nop
80104914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
80104918:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010491c:	c1 e9 02             	shr    $0x2,%ecx
8010491f:	89 f8                	mov    %edi,%eax
80104921:	89 fb                	mov    %edi,%ebx
80104923:	c1 e0 18             	shl    $0x18,%eax
80104926:	c1 e3 10             	shl    $0x10,%ebx
80104929:	09 d8                	or     %ebx,%eax
8010492b:	09 f8                	or     %edi,%eax
8010492d:	c1 e7 08             	shl    $0x8,%edi
80104930:	09 f8                	or     %edi,%eax
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
80104932:	89 d7                	mov    %edx,%edi
80104934:	fc                   	cld    
80104935:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104937:	5b                   	pop    %ebx
80104938:	89 d0                	mov    %edx,%eax
8010493a:	5f                   	pop    %edi
8010493b:	5d                   	pop    %ebp
8010493c:	c3                   	ret    
8010493d:	8d 76 00             	lea    0x0(%esi),%esi

80104940 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104940:	55                   	push   %ebp
80104941:	89 e5                	mov    %esp,%ebp
80104943:	57                   	push   %edi
80104944:	56                   	push   %esi
80104945:	53                   	push   %ebx
80104946:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104949:	8b 75 08             	mov    0x8(%ebp),%esi
8010494c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010494f:	85 db                	test   %ebx,%ebx
80104951:	74 29                	je     8010497c <memcmp+0x3c>
    if(*s1 != *s2)
80104953:	0f b6 16             	movzbl (%esi),%edx
80104956:	0f b6 0f             	movzbl (%edi),%ecx
80104959:	38 d1                	cmp    %dl,%cl
8010495b:	75 2b                	jne    80104988 <memcmp+0x48>
8010495d:	b8 01 00 00 00       	mov    $0x1,%eax
80104962:	eb 14                	jmp    80104978 <memcmp+0x38>
80104964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104968:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010496c:	83 c0 01             	add    $0x1,%eax
8010496f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104974:	38 ca                	cmp    %cl,%dl
80104976:	75 10                	jne    80104988 <memcmp+0x48>
  while(n-- > 0){
80104978:	39 d8                	cmp    %ebx,%eax
8010497a:	75 ec                	jne    80104968 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010497c:	5b                   	pop    %ebx
  return 0;
8010497d:	31 c0                	xor    %eax,%eax
}
8010497f:	5e                   	pop    %esi
80104980:	5f                   	pop    %edi
80104981:	5d                   	pop    %ebp
80104982:	c3                   	ret    
80104983:	90                   	nop
80104984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
80104988:	0f b6 c2             	movzbl %dl,%eax
}
8010498b:	5b                   	pop    %ebx
      return *s1 - *s2;
8010498c:	29 c8                	sub    %ecx,%eax
}
8010498e:	5e                   	pop    %esi
8010498f:	5f                   	pop    %edi
80104990:	5d                   	pop    %ebp
80104991:	c3                   	ret    
80104992:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049a0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801049a0:	55                   	push   %ebp
801049a1:	89 e5                	mov    %esp,%ebp
801049a3:	56                   	push   %esi
801049a4:	53                   	push   %ebx
801049a5:	8b 45 08             	mov    0x8(%ebp),%eax
801049a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801049ab:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801049ae:	39 c3                	cmp    %eax,%ebx
801049b0:	73 26                	jae    801049d8 <memmove+0x38>
801049b2:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
801049b5:	39 c8                	cmp    %ecx,%eax
801049b7:	73 1f                	jae    801049d8 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
801049b9:	85 f6                	test   %esi,%esi
801049bb:	8d 56 ff             	lea    -0x1(%esi),%edx
801049be:	74 0f                	je     801049cf <memmove+0x2f>
      *--d = *--s;
801049c0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801049c4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
801049c7:	83 ea 01             	sub    $0x1,%edx
801049ca:	83 fa ff             	cmp    $0xffffffff,%edx
801049cd:	75 f1                	jne    801049c0 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801049cf:	5b                   	pop    %ebx
801049d0:	5e                   	pop    %esi
801049d1:	5d                   	pop    %ebp
801049d2:	c3                   	ret    
801049d3:	90                   	nop
801049d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
801049d8:	31 d2                	xor    %edx,%edx
801049da:	85 f6                	test   %esi,%esi
801049dc:	74 f1                	je     801049cf <memmove+0x2f>
801049de:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
801049e0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801049e4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801049e7:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
801049ea:	39 d6                	cmp    %edx,%esi
801049ec:	75 f2                	jne    801049e0 <memmove+0x40>
}
801049ee:	5b                   	pop    %ebx
801049ef:	5e                   	pop    %esi
801049f0:	5d                   	pop    %ebp
801049f1:	c3                   	ret    
801049f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a00 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104a00:	55                   	push   %ebp
80104a01:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104a03:	5d                   	pop    %ebp
  return memmove(dst, src, n);
80104a04:	eb 9a                	jmp    801049a0 <memmove>
80104a06:	8d 76 00             	lea    0x0(%esi),%esi
80104a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a10 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80104a10:	55                   	push   %ebp
80104a11:	89 e5                	mov    %esp,%ebp
80104a13:	57                   	push   %edi
80104a14:	56                   	push   %esi
80104a15:	8b 7d 10             	mov    0x10(%ebp),%edi
80104a18:	53                   	push   %ebx
80104a19:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
80104a1f:	85 ff                	test   %edi,%edi
80104a21:	74 2f                	je     80104a52 <strncmp+0x42>
80104a23:	0f b6 01             	movzbl (%ecx),%eax
80104a26:	0f b6 1e             	movzbl (%esi),%ebx
80104a29:	84 c0                	test   %al,%al
80104a2b:	74 37                	je     80104a64 <strncmp+0x54>
80104a2d:	38 c3                	cmp    %al,%bl
80104a2f:	75 33                	jne    80104a64 <strncmp+0x54>
80104a31:	01 f7                	add    %esi,%edi
80104a33:	eb 13                	jmp    80104a48 <strncmp+0x38>
80104a35:	8d 76 00             	lea    0x0(%esi),%esi
80104a38:	0f b6 01             	movzbl (%ecx),%eax
80104a3b:	84 c0                	test   %al,%al
80104a3d:	74 21                	je     80104a60 <strncmp+0x50>
80104a3f:	0f b6 1a             	movzbl (%edx),%ebx
80104a42:	89 d6                	mov    %edx,%esi
80104a44:	38 d8                	cmp    %bl,%al
80104a46:	75 1c                	jne    80104a64 <strncmp+0x54>
    n--, p++, q++;
80104a48:	8d 56 01             	lea    0x1(%esi),%edx
80104a4b:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
80104a4e:	39 fa                	cmp    %edi,%edx
80104a50:	75 e6                	jne    80104a38 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104a52:	5b                   	pop    %ebx
    return 0;
80104a53:	31 c0                	xor    %eax,%eax
}
80104a55:	5e                   	pop    %esi
80104a56:	5f                   	pop    %edi
80104a57:	5d                   	pop    %ebp
80104a58:	c3                   	ret    
80104a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a60:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104a64:	29 d8                	sub    %ebx,%eax
}
80104a66:	5b                   	pop    %ebx
80104a67:	5e                   	pop    %esi
80104a68:	5f                   	pop    %edi
80104a69:	5d                   	pop    %ebp
80104a6a:	c3                   	ret    
80104a6b:	90                   	nop
80104a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a70 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104a70:	55                   	push   %ebp
80104a71:	89 e5                	mov    %esp,%ebp
80104a73:	56                   	push   %esi
80104a74:	53                   	push   %ebx
80104a75:	8b 45 08             	mov    0x8(%ebp),%eax
80104a78:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104a7b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
80104a7e:	89 c2                	mov    %eax,%edx
80104a80:	eb 19                	jmp    80104a9b <strncpy+0x2b>
80104a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a88:	83 c3 01             	add    $0x1,%ebx
80104a8b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
80104a8f:	83 c2 01             	add    $0x1,%edx
80104a92:	84 c9                	test   %cl,%cl
80104a94:	88 4a ff             	mov    %cl,-0x1(%edx)
80104a97:	74 09                	je     80104aa2 <strncpy+0x32>
80104a99:	89 f1                	mov    %esi,%ecx
80104a9b:	85 c9                	test   %ecx,%ecx
80104a9d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104aa0:	7f e6                	jg     80104a88 <strncpy+0x18>
    ;
  while(n-- > 0)
80104aa2:	31 c9                	xor    %ecx,%ecx
80104aa4:	85 f6                	test   %esi,%esi
80104aa6:	7e 17                	jle    80104abf <strncpy+0x4f>
80104aa8:	90                   	nop
80104aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104ab0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104ab4:	89 f3                	mov    %esi,%ebx
80104ab6:	83 c1 01             	add    $0x1,%ecx
80104ab9:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
80104abb:	85 db                	test   %ebx,%ebx
80104abd:	7f f1                	jg     80104ab0 <strncpy+0x40>
  return os;
}
80104abf:	5b                   	pop    %ebx
80104ac0:	5e                   	pop    %esi
80104ac1:	5d                   	pop    %ebp
80104ac2:	c3                   	ret    
80104ac3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ad0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104ad0:	55                   	push   %ebp
80104ad1:	89 e5                	mov    %esp,%ebp
80104ad3:	56                   	push   %esi
80104ad4:	53                   	push   %ebx
80104ad5:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104ad8:	8b 45 08             	mov    0x8(%ebp),%eax
80104adb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
80104ade:	85 c9                	test   %ecx,%ecx
80104ae0:	7e 26                	jle    80104b08 <safestrcpy+0x38>
80104ae2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104ae6:	89 c1                	mov    %eax,%ecx
80104ae8:	eb 17                	jmp    80104b01 <safestrcpy+0x31>
80104aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104af0:	83 c2 01             	add    $0x1,%edx
80104af3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104af7:	83 c1 01             	add    $0x1,%ecx
80104afa:	84 db                	test   %bl,%bl
80104afc:	88 59 ff             	mov    %bl,-0x1(%ecx)
80104aff:	74 04                	je     80104b05 <safestrcpy+0x35>
80104b01:	39 f2                	cmp    %esi,%edx
80104b03:	75 eb                	jne    80104af0 <safestrcpy+0x20>
    ;
  *s = 0;
80104b05:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104b08:	5b                   	pop    %ebx
80104b09:	5e                   	pop    %esi
80104b0a:	5d                   	pop    %ebp
80104b0b:	c3                   	ret    
80104b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b10 <strlen>:

int
strlen(const char *s)
{
80104b10:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104b11:	31 c0                	xor    %eax,%eax
{
80104b13:	89 e5                	mov    %esp,%ebp
80104b15:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104b18:	80 3a 00             	cmpb   $0x0,(%edx)
80104b1b:	74 0c                	je     80104b29 <strlen+0x19>
80104b1d:	8d 76 00             	lea    0x0(%esi),%esi
80104b20:	83 c0 01             	add    $0x1,%eax
80104b23:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104b27:	75 f7                	jne    80104b20 <strlen+0x10>
    ;
  return n;
}
80104b29:	5d                   	pop    %ebp
80104b2a:	c3                   	ret    

80104b2b <swtch>:
80104b2b:	8b 44 24 04          	mov    0x4(%esp),%eax
80104b2f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104b33:	55                   	push   %ebp
80104b34:	53                   	push   %ebx
80104b35:	56                   	push   %esi
80104b36:	57                   	push   %edi
80104b37:	89 20                	mov    %esp,(%eax)
80104b39:	89 d4                	mov    %edx,%esp
80104b3b:	5f                   	pop    %edi
80104b3c:	5e                   	pop    %esi
80104b3d:	5b                   	pop    %ebx
80104b3e:	5d                   	pop    %ebp
80104b3f:	c3                   	ret    

80104b40 <fetchint>:
80104b40:	55                   	push   %ebp
80104b41:	89 e5                	mov    %esp,%ebp
80104b43:	53                   	push   %ebx
80104b44:	83 ec 04             	sub    $0x4,%esp
80104b47:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104b4a:	e8 51 ed ff ff       	call   801038a0 <myproc>
80104b4f:	8b 00                	mov    (%eax),%eax
80104b51:	39 d8                	cmp    %ebx,%eax
80104b53:	76 1b                	jbe    80104b70 <fetchint+0x30>
80104b55:	8d 53 04             	lea    0x4(%ebx),%edx
80104b58:	39 d0                	cmp    %edx,%eax
80104b5a:	72 14                	jb     80104b70 <fetchint+0x30>
80104b5c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b5f:	8b 13                	mov    (%ebx),%edx
80104b61:	89 10                	mov    %edx,(%eax)
80104b63:	31 c0                	xor    %eax,%eax
80104b65:	83 c4 04             	add    $0x4,%esp
80104b68:	5b                   	pop    %ebx
80104b69:	5d                   	pop    %ebp
80104b6a:	c3                   	ret    
80104b6b:	90                   	nop
80104b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b75:	eb ee                	jmp    80104b65 <fetchint+0x25>
80104b77:	89 f6                	mov    %esi,%esi
80104b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b80 <fetchstr>:
80104b80:	55                   	push   %ebp
80104b81:	89 e5                	mov    %esp,%ebp
80104b83:	53                   	push   %ebx
80104b84:	83 ec 04             	sub    $0x4,%esp
80104b87:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104b8a:	e8 11 ed ff ff       	call   801038a0 <myproc>
80104b8f:	39 18                	cmp    %ebx,(%eax)
80104b91:	76 29                	jbe    80104bbc <fetchstr+0x3c>
80104b93:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104b96:	89 da                	mov    %ebx,%edx
80104b98:	89 19                	mov    %ebx,(%ecx)
80104b9a:	8b 00                	mov    (%eax),%eax
80104b9c:	39 c3                	cmp    %eax,%ebx
80104b9e:	73 1c                	jae    80104bbc <fetchstr+0x3c>
80104ba0:	80 3b 00             	cmpb   $0x0,(%ebx)
80104ba3:	75 10                	jne    80104bb5 <fetchstr+0x35>
80104ba5:	eb 39                	jmp    80104be0 <fetchstr+0x60>
80104ba7:	89 f6                	mov    %esi,%esi
80104ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104bb0:	80 3a 00             	cmpb   $0x0,(%edx)
80104bb3:	74 1b                	je     80104bd0 <fetchstr+0x50>
80104bb5:	83 c2 01             	add    $0x1,%edx
80104bb8:	39 d0                	cmp    %edx,%eax
80104bba:	77 f4                	ja     80104bb0 <fetchstr+0x30>
80104bbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bc1:	83 c4 04             	add    $0x4,%esp
80104bc4:	5b                   	pop    %ebx
80104bc5:	5d                   	pop    %ebp
80104bc6:	c3                   	ret    
80104bc7:	89 f6                	mov    %esi,%esi
80104bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104bd0:	83 c4 04             	add    $0x4,%esp
80104bd3:	89 d0                	mov    %edx,%eax
80104bd5:	29 d8                	sub    %ebx,%eax
80104bd7:	5b                   	pop    %ebx
80104bd8:	5d                   	pop    %ebp
80104bd9:	c3                   	ret    
80104bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104be0:	31 c0                	xor    %eax,%eax
80104be2:	eb dd                	jmp    80104bc1 <fetchstr+0x41>
80104be4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104bea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104bf0 <argint>:
80104bf0:	55                   	push   %ebp
80104bf1:	89 e5                	mov    %esp,%ebp
80104bf3:	56                   	push   %esi
80104bf4:	53                   	push   %ebx
80104bf5:	e8 a6 ec ff ff       	call   801038a0 <myproc>
80104bfa:	8b 40 18             	mov    0x18(%eax),%eax
80104bfd:	8b 55 08             	mov    0x8(%ebp),%edx
80104c00:	8b 40 44             	mov    0x44(%eax),%eax
80104c03:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104c06:	e8 95 ec ff ff       	call   801038a0 <myproc>
80104c0b:	8b 00                	mov    (%eax),%eax
80104c0d:	8d 73 04             	lea    0x4(%ebx),%esi
80104c10:	39 c6                	cmp    %eax,%esi
80104c12:	73 1c                	jae    80104c30 <argint+0x40>
80104c14:	8d 53 08             	lea    0x8(%ebx),%edx
80104c17:	39 d0                	cmp    %edx,%eax
80104c19:	72 15                	jb     80104c30 <argint+0x40>
80104c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104c1e:	8b 53 04             	mov    0x4(%ebx),%edx
80104c21:	89 10                	mov    %edx,(%eax)
80104c23:	31 c0                	xor    %eax,%eax
80104c25:	5b                   	pop    %ebx
80104c26:	5e                   	pop    %esi
80104c27:	5d                   	pop    %ebp
80104c28:	c3                   	ret    
80104c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c35:	eb ee                	jmp    80104c25 <argint+0x35>
80104c37:	89 f6                	mov    %esi,%esi
80104c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c40 <argptr>:
80104c40:	55                   	push   %ebp
80104c41:	89 e5                	mov    %esp,%ebp
80104c43:	56                   	push   %esi
80104c44:	53                   	push   %ebx
80104c45:	83 ec 10             	sub    $0x10,%esp
80104c48:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104c4b:	e8 50 ec ff ff       	call   801038a0 <myproc>
80104c50:	89 c6                	mov    %eax,%esi
80104c52:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c55:	83 ec 08             	sub    $0x8,%esp
80104c58:	50                   	push   %eax
80104c59:	ff 75 08             	pushl  0x8(%ebp)
80104c5c:	e8 8f ff ff ff       	call   80104bf0 <argint>
80104c61:	83 c4 10             	add    $0x10,%esp
80104c64:	85 c0                	test   %eax,%eax
80104c66:	78 28                	js     80104c90 <argptr+0x50>
80104c68:	85 db                	test   %ebx,%ebx
80104c6a:	78 24                	js     80104c90 <argptr+0x50>
80104c6c:	8b 16                	mov    (%esi),%edx
80104c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c71:	39 c2                	cmp    %eax,%edx
80104c73:	76 1b                	jbe    80104c90 <argptr+0x50>
80104c75:	01 c3                	add    %eax,%ebx
80104c77:	39 da                	cmp    %ebx,%edx
80104c79:	72 15                	jb     80104c90 <argptr+0x50>
80104c7b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104c7e:	89 02                	mov    %eax,(%edx)
80104c80:	31 c0                	xor    %eax,%eax
80104c82:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c85:	5b                   	pop    %ebx
80104c86:	5e                   	pop    %esi
80104c87:	5d                   	pop    %ebp
80104c88:	c3                   	ret    
80104c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c95:	eb eb                	jmp    80104c82 <argptr+0x42>
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ca0 <argstr>:
80104ca0:	55                   	push   %ebp
80104ca1:	89 e5                	mov    %esp,%ebp
80104ca3:	83 ec 20             	sub    $0x20,%esp
80104ca6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ca9:	50                   	push   %eax
80104caa:	ff 75 08             	pushl  0x8(%ebp)
80104cad:	e8 3e ff ff ff       	call   80104bf0 <argint>
80104cb2:	83 c4 10             	add    $0x10,%esp
80104cb5:	85 c0                	test   %eax,%eax
80104cb7:	78 17                	js     80104cd0 <argstr+0x30>
80104cb9:	83 ec 08             	sub    $0x8,%esp
80104cbc:	ff 75 0c             	pushl  0xc(%ebp)
80104cbf:	ff 75 f4             	pushl  -0xc(%ebp)
80104cc2:	e8 b9 fe ff ff       	call   80104b80 <fetchstr>
80104cc7:	83 c4 10             	add    $0x10,%esp
80104cca:	c9                   	leave  
80104ccb:	c3                   	ret    
80104ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cd5:	c9                   	leave  
80104cd6:	c3                   	ret    
80104cd7:	89 f6                	mov    %esi,%esi
80104cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ce0 <getreadcount>:
80104ce0:	55                   	push   %ebp
80104ce1:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
80104ce6:	89 e5                	mov    %esp,%ebp
80104ce8:	5d                   	pop    %ebp
80104ce9:	c3                   	ret    
80104cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104cf0 <syscall>:
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	53                   	push   %ebx
80104cf4:	83 ec 04             	sub    $0x4,%esp
80104cf7:	e8 a4 eb ff ff       	call   801038a0 <myproc>
80104cfc:	89 c3                	mov    %eax,%ebx
80104cfe:	8b 40 18             	mov    0x18(%eax),%eax
80104d01:	8b 40 1c             	mov    0x1c(%eax),%eax
80104d04:	8d 50 ff             	lea    -0x1(%eax),%edx
80104d07:	83 fa 1c             	cmp    $0x1c,%edx
80104d0a:	77 24                	ja     80104d30 <syscall+0x40>
80104d0c:	8b 14 85 00 80 10 80 	mov    -0x7fef8000(,%eax,4),%edx
80104d13:	85 d2                	test   %edx,%edx
80104d15:	74 19                	je     80104d30 <syscall+0x40>
80104d17:	83 f8 05             	cmp    $0x5,%eax
80104d1a:	75 07                	jne    80104d23 <syscall+0x33>
80104d1c:	83 05 bc b5 10 80 01 	addl   $0x1,0x8010b5bc
80104d23:	ff d2                	call   *%edx
80104d25:	8b 53 18             	mov    0x18(%ebx),%edx
80104d28:	89 42 1c             	mov    %eax,0x1c(%edx)
80104d2b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d2e:	c9                   	leave  
80104d2f:	c3                   	ret    
80104d30:	50                   	push   %eax
80104d31:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104d34:	50                   	push   %eax
80104d35:	ff 73 10             	pushl  0x10(%ebx)
80104d38:	68 d5 7f 10 80       	push   $0x80107fd5
80104d3d:	e8 1e b9 ff ff       	call   80100660 <cprintf>
80104d42:	8b 43 18             	mov    0x18(%ebx),%eax
80104d45:	83 c4 10             	add    $0x10,%esp
80104d48:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104d4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d52:	c9                   	leave  
80104d53:	c3                   	ret    
80104d54:	66 90                	xchg   %ax,%ax
80104d56:	66 90                	xchg   %ax,%ax
80104d58:	66 90                	xchg   %ax,%ax
80104d5a:	66 90                	xchg   %ax,%ax
80104d5c:	66 90                	xchg   %ax,%ax
80104d5e:	66 90                	xchg   %ax,%ax

80104d60 <create>:
80104d60:	55                   	push   %ebp
80104d61:	89 e5                	mov    %esp,%ebp
80104d63:	57                   	push   %edi
80104d64:	56                   	push   %esi
80104d65:	53                   	push   %ebx
80104d66:	8d 75 da             	lea    -0x26(%ebp),%esi
80104d69:	83 ec 34             	sub    $0x34,%esp
80104d6c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104d6f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104d72:	56                   	push   %esi
80104d73:	50                   	push   %eax
80104d74:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104d77:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80104d7a:	e8 c1 d1 ff ff       	call   80101f40 <nameiparent>
80104d7f:	83 c4 10             	add    $0x10,%esp
80104d82:	85 c0                	test   %eax,%eax
80104d84:	0f 84 46 01 00 00    	je     80104ed0 <create+0x170>
80104d8a:	83 ec 0c             	sub    $0xc,%esp
80104d8d:	89 c3                	mov    %eax,%ebx
80104d8f:	50                   	push   %eax
80104d90:	e8 2b c9 ff ff       	call   801016c0 <ilock>
80104d95:	83 c4 0c             	add    $0xc,%esp
80104d98:	6a 00                	push   $0x0
80104d9a:	56                   	push   %esi
80104d9b:	53                   	push   %ebx
80104d9c:	e8 4f ce ff ff       	call   80101bf0 <dirlookup>
80104da1:	83 c4 10             	add    $0x10,%esp
80104da4:	85 c0                	test   %eax,%eax
80104da6:	89 c7                	mov    %eax,%edi
80104da8:	74 36                	je     80104de0 <create+0x80>
80104daa:	83 ec 0c             	sub    $0xc,%esp
80104dad:	53                   	push   %ebx
80104dae:	e8 9d cb ff ff       	call   80101950 <iunlockput>
80104db3:	89 3c 24             	mov    %edi,(%esp)
80104db6:	e8 05 c9 ff ff       	call   801016c0 <ilock>
80104dbb:	83 c4 10             	add    $0x10,%esp
80104dbe:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104dc3:	0f 85 97 00 00 00    	jne    80104e60 <create+0x100>
80104dc9:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104dce:	0f 85 8c 00 00 00    	jne    80104e60 <create+0x100>
80104dd4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104dd7:	89 f8                	mov    %edi,%eax
80104dd9:	5b                   	pop    %ebx
80104dda:	5e                   	pop    %esi
80104ddb:	5f                   	pop    %edi
80104ddc:	5d                   	pop    %ebp
80104ddd:	c3                   	ret    
80104dde:	66 90                	xchg   %ax,%ax
80104de0:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104de4:	83 ec 08             	sub    $0x8,%esp
80104de7:	50                   	push   %eax
80104de8:	ff 33                	pushl  (%ebx)
80104dea:	e8 61 c7 ff ff       	call   80101550 <ialloc>
80104def:	83 c4 10             	add    $0x10,%esp
80104df2:	85 c0                	test   %eax,%eax
80104df4:	89 c7                	mov    %eax,%edi
80104df6:	0f 84 e8 00 00 00    	je     80104ee4 <create+0x184>
80104dfc:	83 ec 0c             	sub    $0xc,%esp
80104dff:	50                   	push   %eax
80104e00:	e8 bb c8 ff ff       	call   801016c0 <ilock>
80104e05:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104e09:	66 89 47 52          	mov    %ax,0x52(%edi)
80104e0d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104e11:	66 89 47 54          	mov    %ax,0x54(%edi)
80104e15:	b8 01 00 00 00       	mov    $0x1,%eax
80104e1a:	66 89 47 56          	mov    %ax,0x56(%edi)
80104e1e:	89 3c 24             	mov    %edi,(%esp)
80104e21:	e8 ea c7 ff ff       	call   80101610 <iupdate>
80104e26:	83 c4 10             	add    $0x10,%esp
80104e29:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104e2e:	74 50                	je     80104e80 <create+0x120>
80104e30:	83 ec 04             	sub    $0x4,%esp
80104e33:	ff 77 04             	pushl  0x4(%edi)
80104e36:	56                   	push   %esi
80104e37:	53                   	push   %ebx
80104e38:	e8 23 d0 ff ff       	call   80101e60 <dirlink>
80104e3d:	83 c4 10             	add    $0x10,%esp
80104e40:	85 c0                	test   %eax,%eax
80104e42:	0f 88 8f 00 00 00    	js     80104ed7 <create+0x177>
80104e48:	83 ec 0c             	sub    $0xc,%esp
80104e4b:	53                   	push   %ebx
80104e4c:	e8 ff ca ff ff       	call   80101950 <iunlockput>
80104e51:	83 c4 10             	add    $0x10,%esp
80104e54:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e57:	89 f8                	mov    %edi,%eax
80104e59:	5b                   	pop    %ebx
80104e5a:	5e                   	pop    %esi
80104e5b:	5f                   	pop    %edi
80104e5c:	5d                   	pop    %ebp
80104e5d:	c3                   	ret    
80104e5e:	66 90                	xchg   %ax,%ax
80104e60:	83 ec 0c             	sub    $0xc,%esp
80104e63:	57                   	push   %edi
80104e64:	31 ff                	xor    %edi,%edi
80104e66:	e8 e5 ca ff ff       	call   80101950 <iunlockput>
80104e6b:	83 c4 10             	add    $0x10,%esp
80104e6e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e71:	89 f8                	mov    %edi,%eax
80104e73:	5b                   	pop    %ebx
80104e74:	5e                   	pop    %esi
80104e75:	5f                   	pop    %edi
80104e76:	5d                   	pop    %ebp
80104e77:	c3                   	ret    
80104e78:	90                   	nop
80104e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e80:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104e85:	83 ec 0c             	sub    $0xc,%esp
80104e88:	53                   	push   %ebx
80104e89:	e8 82 c7 ff ff       	call   80101610 <iupdate>
80104e8e:	83 c4 0c             	add    $0xc,%esp
80104e91:	ff 77 04             	pushl  0x4(%edi)
80104e94:	68 94 80 10 80       	push   $0x80108094
80104e99:	57                   	push   %edi
80104e9a:	e8 c1 cf ff ff       	call   80101e60 <dirlink>
80104e9f:	83 c4 10             	add    $0x10,%esp
80104ea2:	85 c0                	test   %eax,%eax
80104ea4:	78 1c                	js     80104ec2 <create+0x162>
80104ea6:	83 ec 04             	sub    $0x4,%esp
80104ea9:	ff 73 04             	pushl  0x4(%ebx)
80104eac:	68 93 80 10 80       	push   $0x80108093
80104eb1:	57                   	push   %edi
80104eb2:	e8 a9 cf ff ff       	call   80101e60 <dirlink>
80104eb7:	83 c4 10             	add    $0x10,%esp
80104eba:	85 c0                	test   %eax,%eax
80104ebc:	0f 89 6e ff ff ff    	jns    80104e30 <create+0xd0>
80104ec2:	83 ec 0c             	sub    $0xc,%esp
80104ec5:	68 87 80 10 80       	push   $0x80108087
80104eca:	e8 c1 b4 ff ff       	call   80100390 <panic>
80104ecf:	90                   	nop
80104ed0:	31 ff                	xor    %edi,%edi
80104ed2:	e9 fd fe ff ff       	jmp    80104dd4 <create+0x74>
80104ed7:	83 ec 0c             	sub    $0xc,%esp
80104eda:	68 96 80 10 80       	push   $0x80108096
80104edf:	e8 ac b4 ff ff       	call   80100390 <panic>
80104ee4:	83 ec 0c             	sub    $0xc,%esp
80104ee7:	68 78 80 10 80       	push   $0x80108078
80104eec:	e8 9f b4 ff ff       	call   80100390 <panic>
80104ef1:	eb 0d                	jmp    80104f00 <argfd.constprop.0>
80104ef3:	90                   	nop
80104ef4:	90                   	nop
80104ef5:	90                   	nop
80104ef6:	90                   	nop
80104ef7:	90                   	nop
80104ef8:	90                   	nop
80104ef9:	90                   	nop
80104efa:	90                   	nop
80104efb:	90                   	nop
80104efc:	90                   	nop
80104efd:	90                   	nop
80104efe:	90                   	nop
80104eff:	90                   	nop

80104f00 <argfd.constprop.0>:
80104f00:	55                   	push   %ebp
80104f01:	89 e5                	mov    %esp,%ebp
80104f03:	56                   	push   %esi
80104f04:	53                   	push   %ebx
80104f05:	89 c3                	mov    %eax,%ebx
80104f07:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104f0a:	89 d6                	mov    %edx,%esi
80104f0c:	83 ec 18             	sub    $0x18,%esp
80104f0f:	50                   	push   %eax
80104f10:	6a 00                	push   $0x0
80104f12:	e8 d9 fc ff ff       	call   80104bf0 <argint>
80104f17:	83 c4 10             	add    $0x10,%esp
80104f1a:	85 c0                	test   %eax,%eax
80104f1c:	78 2a                	js     80104f48 <argfd.constprop.0+0x48>
80104f1e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104f22:	77 24                	ja     80104f48 <argfd.constprop.0+0x48>
80104f24:	e8 77 e9 ff ff       	call   801038a0 <myproc>
80104f29:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104f2c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104f30:	85 c0                	test   %eax,%eax
80104f32:	74 14                	je     80104f48 <argfd.constprop.0+0x48>
80104f34:	85 db                	test   %ebx,%ebx
80104f36:	74 02                	je     80104f3a <argfd.constprop.0+0x3a>
80104f38:	89 13                	mov    %edx,(%ebx)
80104f3a:	89 06                	mov    %eax,(%esi)
80104f3c:	31 c0                	xor    %eax,%eax
80104f3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f41:	5b                   	pop    %ebx
80104f42:	5e                   	pop    %esi
80104f43:	5d                   	pop    %ebp
80104f44:	c3                   	ret    
80104f45:	8d 76 00             	lea    0x0(%esi),%esi
80104f48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f4d:	eb ef                	jmp    80104f3e <argfd.constprop.0+0x3e>
80104f4f:	90                   	nop

80104f50 <sys_dup>:
80104f50:	55                   	push   %ebp
80104f51:	31 c0                	xor    %eax,%eax
80104f53:	89 e5                	mov    %esp,%ebp
80104f55:	56                   	push   %esi
80104f56:	53                   	push   %ebx
80104f57:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104f5a:	83 ec 10             	sub    $0x10,%esp
80104f5d:	e8 9e ff ff ff       	call   80104f00 <argfd.constprop.0>
80104f62:	85 c0                	test   %eax,%eax
80104f64:	78 42                	js     80104fa8 <sys_dup+0x58>
80104f66:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104f69:	31 db                	xor    %ebx,%ebx
80104f6b:	e8 30 e9 ff ff       	call   801038a0 <myproc>
80104f70:	eb 0e                	jmp    80104f80 <sys_dup+0x30>
80104f72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104f78:	83 c3 01             	add    $0x1,%ebx
80104f7b:	83 fb 10             	cmp    $0x10,%ebx
80104f7e:	74 28                	je     80104fa8 <sys_dup+0x58>
80104f80:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104f84:	85 d2                	test   %edx,%edx
80104f86:	75 f0                	jne    80104f78 <sys_dup+0x28>
80104f88:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104f8c:	83 ec 0c             	sub    $0xc,%esp
80104f8f:	ff 75 f4             	pushl  -0xc(%ebp)
80104f92:	e8 99 be ff ff       	call   80100e30 <filedup>
80104f97:	83 c4 10             	add    $0x10,%esp
80104f9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f9d:	89 d8                	mov    %ebx,%eax
80104f9f:	5b                   	pop    %ebx
80104fa0:	5e                   	pop    %esi
80104fa1:	5d                   	pop    %ebp
80104fa2:	c3                   	ret    
80104fa3:	90                   	nop
80104fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104fa8:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104fab:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104fb0:	89 d8                	mov    %ebx,%eax
80104fb2:	5b                   	pop    %ebx
80104fb3:	5e                   	pop    %esi
80104fb4:	5d                   	pop    %ebp
80104fb5:	c3                   	ret    
80104fb6:	8d 76 00             	lea    0x0(%esi),%esi
80104fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104fc0 <sys_read>:
80104fc0:	55                   	push   %ebp
80104fc1:	31 c0                	xor    %eax,%eax
80104fc3:	89 e5                	mov    %esp,%ebp
80104fc5:	83 ec 18             	sub    $0x18,%esp
80104fc8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104fcb:	e8 30 ff ff ff       	call   80104f00 <argfd.constprop.0>
80104fd0:	85 c0                	test   %eax,%eax
80104fd2:	78 4c                	js     80105020 <sys_read+0x60>
80104fd4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104fd7:	83 ec 08             	sub    $0x8,%esp
80104fda:	50                   	push   %eax
80104fdb:	6a 02                	push   $0x2
80104fdd:	e8 0e fc ff ff       	call   80104bf0 <argint>
80104fe2:	83 c4 10             	add    $0x10,%esp
80104fe5:	85 c0                	test   %eax,%eax
80104fe7:	78 37                	js     80105020 <sys_read+0x60>
80104fe9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fec:	83 ec 04             	sub    $0x4,%esp
80104fef:	ff 75 f0             	pushl  -0x10(%ebp)
80104ff2:	50                   	push   %eax
80104ff3:	6a 01                	push   $0x1
80104ff5:	e8 46 fc ff ff       	call   80104c40 <argptr>
80104ffa:	83 c4 10             	add    $0x10,%esp
80104ffd:	85 c0                	test   %eax,%eax
80104fff:	78 1f                	js     80105020 <sys_read+0x60>
80105001:	83 ec 04             	sub    $0x4,%esp
80105004:	ff 75 f0             	pushl  -0x10(%ebp)
80105007:	ff 75 f4             	pushl  -0xc(%ebp)
8010500a:	ff 75 ec             	pushl  -0x14(%ebp)
8010500d:	e8 8e bf ff ff       	call   80100fa0 <fileread>
80105012:	83 c4 10             	add    $0x10,%esp
80105015:	c9                   	leave  
80105016:	c3                   	ret    
80105017:	89 f6                	mov    %esi,%esi
80105019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105020:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105025:	c9                   	leave  
80105026:	c3                   	ret    
80105027:	89 f6                	mov    %esi,%esi
80105029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105030 <sys_write>:
80105030:	55                   	push   %ebp
80105031:	31 c0                	xor    %eax,%eax
80105033:	89 e5                	mov    %esp,%ebp
80105035:	83 ec 18             	sub    $0x18,%esp
80105038:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010503b:	e8 c0 fe ff ff       	call   80104f00 <argfd.constprop.0>
80105040:	85 c0                	test   %eax,%eax
80105042:	78 4c                	js     80105090 <sys_write+0x60>
80105044:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105047:	83 ec 08             	sub    $0x8,%esp
8010504a:	50                   	push   %eax
8010504b:	6a 02                	push   $0x2
8010504d:	e8 9e fb ff ff       	call   80104bf0 <argint>
80105052:	83 c4 10             	add    $0x10,%esp
80105055:	85 c0                	test   %eax,%eax
80105057:	78 37                	js     80105090 <sys_write+0x60>
80105059:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010505c:	83 ec 04             	sub    $0x4,%esp
8010505f:	ff 75 f0             	pushl  -0x10(%ebp)
80105062:	50                   	push   %eax
80105063:	6a 01                	push   $0x1
80105065:	e8 d6 fb ff ff       	call   80104c40 <argptr>
8010506a:	83 c4 10             	add    $0x10,%esp
8010506d:	85 c0                	test   %eax,%eax
8010506f:	78 1f                	js     80105090 <sys_write+0x60>
80105071:	83 ec 04             	sub    $0x4,%esp
80105074:	ff 75 f0             	pushl  -0x10(%ebp)
80105077:	ff 75 f4             	pushl  -0xc(%ebp)
8010507a:	ff 75 ec             	pushl  -0x14(%ebp)
8010507d:	e8 ae bf ff ff       	call   80101030 <filewrite>
80105082:	83 c4 10             	add    $0x10,%esp
80105085:	c9                   	leave  
80105086:	c3                   	ret    
80105087:	89 f6                	mov    %esi,%esi
80105089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105090:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105095:	c9                   	leave  
80105096:	c3                   	ret    
80105097:	89 f6                	mov    %esi,%esi
80105099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801050a0 <sys_close>:
801050a0:	55                   	push   %ebp
801050a1:	89 e5                	mov    %esp,%ebp
801050a3:	83 ec 18             	sub    $0x18,%esp
801050a6:	8d 55 f4             	lea    -0xc(%ebp),%edx
801050a9:	8d 45 f0             	lea    -0x10(%ebp),%eax
801050ac:	e8 4f fe ff ff       	call   80104f00 <argfd.constprop.0>
801050b1:	85 c0                	test   %eax,%eax
801050b3:	78 2b                	js     801050e0 <sys_close+0x40>
801050b5:	e8 e6 e7 ff ff       	call   801038a0 <myproc>
801050ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
801050bd:	83 ec 0c             	sub    $0xc,%esp
801050c0:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
801050c7:	00 
801050c8:	ff 75 f4             	pushl  -0xc(%ebp)
801050cb:	e8 b0 bd ff ff       	call   80100e80 <fileclose>
801050d0:	83 c4 10             	add    $0x10,%esp
801050d3:	31 c0                	xor    %eax,%eax
801050d5:	c9                   	leave  
801050d6:	c3                   	ret    
801050d7:	89 f6                	mov    %esi,%esi
801050d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801050e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050e5:	c9                   	leave  
801050e6:	c3                   	ret    
801050e7:	89 f6                	mov    %esi,%esi
801050e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801050f0 <sys_fstat>:
801050f0:	55                   	push   %ebp
801050f1:	31 c0                	xor    %eax,%eax
801050f3:	89 e5                	mov    %esp,%ebp
801050f5:	83 ec 18             	sub    $0x18,%esp
801050f8:	8d 55 f0             	lea    -0x10(%ebp),%edx
801050fb:	e8 00 fe ff ff       	call   80104f00 <argfd.constprop.0>
80105100:	85 c0                	test   %eax,%eax
80105102:	78 2c                	js     80105130 <sys_fstat+0x40>
80105104:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105107:	83 ec 04             	sub    $0x4,%esp
8010510a:	6a 14                	push   $0x14
8010510c:	50                   	push   %eax
8010510d:	6a 01                	push   $0x1
8010510f:	e8 2c fb ff ff       	call   80104c40 <argptr>
80105114:	83 c4 10             	add    $0x10,%esp
80105117:	85 c0                	test   %eax,%eax
80105119:	78 15                	js     80105130 <sys_fstat+0x40>
8010511b:	83 ec 08             	sub    $0x8,%esp
8010511e:	ff 75 f4             	pushl  -0xc(%ebp)
80105121:	ff 75 f0             	pushl  -0x10(%ebp)
80105124:	e8 27 be ff ff       	call   80100f50 <filestat>
80105129:	83 c4 10             	add    $0x10,%esp
8010512c:	c9                   	leave  
8010512d:	c3                   	ret    
8010512e:	66 90                	xchg   %ax,%ax
80105130:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105135:	c9                   	leave  
80105136:	c3                   	ret    
80105137:	89 f6                	mov    %esi,%esi
80105139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105140 <sys_link>:
80105140:	55                   	push   %ebp
80105141:	89 e5                	mov    %esp,%ebp
80105143:	57                   	push   %edi
80105144:	56                   	push   %esi
80105145:	53                   	push   %ebx
80105146:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80105149:	83 ec 34             	sub    $0x34,%esp
8010514c:	50                   	push   %eax
8010514d:	6a 00                	push   $0x0
8010514f:	e8 4c fb ff ff       	call   80104ca0 <argstr>
80105154:	83 c4 10             	add    $0x10,%esp
80105157:	85 c0                	test   %eax,%eax
80105159:	0f 88 fb 00 00 00    	js     8010525a <sys_link+0x11a>
8010515f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80105162:	83 ec 08             	sub    $0x8,%esp
80105165:	50                   	push   %eax
80105166:	6a 01                	push   $0x1
80105168:	e8 33 fb ff ff       	call   80104ca0 <argstr>
8010516d:	83 c4 10             	add    $0x10,%esp
80105170:	85 c0                	test   %eax,%eax
80105172:	0f 88 e2 00 00 00    	js     8010525a <sys_link+0x11a>
80105178:	e8 b3 da ff ff       	call   80102c30 <begin_op>
8010517d:	83 ec 0c             	sub    $0xc,%esp
80105180:	ff 75 d4             	pushl  -0x2c(%ebp)
80105183:	e8 98 cd ff ff       	call   80101f20 <namei>
80105188:	83 c4 10             	add    $0x10,%esp
8010518b:	85 c0                	test   %eax,%eax
8010518d:	89 c3                	mov    %eax,%ebx
8010518f:	0f 84 ea 00 00 00    	je     8010527f <sys_link+0x13f>
80105195:	83 ec 0c             	sub    $0xc,%esp
80105198:	50                   	push   %eax
80105199:	e8 22 c5 ff ff       	call   801016c0 <ilock>
8010519e:	83 c4 10             	add    $0x10,%esp
801051a1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801051a6:	0f 84 bb 00 00 00    	je     80105267 <sys_link+0x127>
801051ac:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
801051b1:	83 ec 0c             	sub    $0xc,%esp
801051b4:	8d 7d da             	lea    -0x26(%ebp),%edi
801051b7:	53                   	push   %ebx
801051b8:	e8 53 c4 ff ff       	call   80101610 <iupdate>
801051bd:	89 1c 24             	mov    %ebx,(%esp)
801051c0:	e8 db c5 ff ff       	call   801017a0 <iunlock>
801051c5:	58                   	pop    %eax
801051c6:	5a                   	pop    %edx
801051c7:	57                   	push   %edi
801051c8:	ff 75 d0             	pushl  -0x30(%ebp)
801051cb:	e8 70 cd ff ff       	call   80101f40 <nameiparent>
801051d0:	83 c4 10             	add    $0x10,%esp
801051d3:	85 c0                	test   %eax,%eax
801051d5:	89 c6                	mov    %eax,%esi
801051d7:	74 5b                	je     80105234 <sys_link+0xf4>
801051d9:	83 ec 0c             	sub    $0xc,%esp
801051dc:	50                   	push   %eax
801051dd:	e8 de c4 ff ff       	call   801016c0 <ilock>
801051e2:	83 c4 10             	add    $0x10,%esp
801051e5:	8b 03                	mov    (%ebx),%eax
801051e7:	39 06                	cmp    %eax,(%esi)
801051e9:	75 3d                	jne    80105228 <sys_link+0xe8>
801051eb:	83 ec 04             	sub    $0x4,%esp
801051ee:	ff 73 04             	pushl  0x4(%ebx)
801051f1:	57                   	push   %edi
801051f2:	56                   	push   %esi
801051f3:	e8 68 cc ff ff       	call   80101e60 <dirlink>
801051f8:	83 c4 10             	add    $0x10,%esp
801051fb:	85 c0                	test   %eax,%eax
801051fd:	78 29                	js     80105228 <sys_link+0xe8>
801051ff:	83 ec 0c             	sub    $0xc,%esp
80105202:	56                   	push   %esi
80105203:	e8 48 c7 ff ff       	call   80101950 <iunlockput>
80105208:	89 1c 24             	mov    %ebx,(%esp)
8010520b:	e8 e0 c5 ff ff       	call   801017f0 <iput>
80105210:	e8 8b da ff ff       	call   80102ca0 <end_op>
80105215:	83 c4 10             	add    $0x10,%esp
80105218:	31 c0                	xor    %eax,%eax
8010521a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010521d:	5b                   	pop    %ebx
8010521e:	5e                   	pop    %esi
8010521f:	5f                   	pop    %edi
80105220:	5d                   	pop    %ebp
80105221:	c3                   	ret    
80105222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105228:	83 ec 0c             	sub    $0xc,%esp
8010522b:	56                   	push   %esi
8010522c:	e8 1f c7 ff ff       	call   80101950 <iunlockput>
80105231:	83 c4 10             	add    $0x10,%esp
80105234:	83 ec 0c             	sub    $0xc,%esp
80105237:	53                   	push   %ebx
80105238:	e8 83 c4 ff ff       	call   801016c0 <ilock>
8010523d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105242:	89 1c 24             	mov    %ebx,(%esp)
80105245:	e8 c6 c3 ff ff       	call   80101610 <iupdate>
8010524a:	89 1c 24             	mov    %ebx,(%esp)
8010524d:	e8 fe c6 ff ff       	call   80101950 <iunlockput>
80105252:	e8 49 da ff ff       	call   80102ca0 <end_op>
80105257:	83 c4 10             	add    $0x10,%esp
8010525a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010525d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105262:	5b                   	pop    %ebx
80105263:	5e                   	pop    %esi
80105264:	5f                   	pop    %edi
80105265:	5d                   	pop    %ebp
80105266:	c3                   	ret    
80105267:	83 ec 0c             	sub    $0xc,%esp
8010526a:	53                   	push   %ebx
8010526b:	e8 e0 c6 ff ff       	call   80101950 <iunlockput>
80105270:	e8 2b da ff ff       	call   80102ca0 <end_op>
80105275:	83 c4 10             	add    $0x10,%esp
80105278:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010527d:	eb 9b                	jmp    8010521a <sys_link+0xda>
8010527f:	e8 1c da ff ff       	call   80102ca0 <end_op>
80105284:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105289:	eb 8f                	jmp    8010521a <sys_link+0xda>
8010528b:	90                   	nop
8010528c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105290 <sys_unlink>:
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
80105293:	57                   	push   %edi
80105294:	56                   	push   %esi
80105295:	53                   	push   %ebx
80105296:	8d 45 c0             	lea    -0x40(%ebp),%eax
80105299:	83 ec 44             	sub    $0x44,%esp
8010529c:	50                   	push   %eax
8010529d:	6a 00                	push   $0x0
8010529f:	e8 fc f9 ff ff       	call   80104ca0 <argstr>
801052a4:	83 c4 10             	add    $0x10,%esp
801052a7:	85 c0                	test   %eax,%eax
801052a9:	0f 88 77 01 00 00    	js     80105426 <sys_unlink+0x196>
801052af:	8d 5d ca             	lea    -0x36(%ebp),%ebx
801052b2:	e8 79 d9 ff ff       	call   80102c30 <begin_op>
801052b7:	83 ec 08             	sub    $0x8,%esp
801052ba:	53                   	push   %ebx
801052bb:	ff 75 c0             	pushl  -0x40(%ebp)
801052be:	e8 7d cc ff ff       	call   80101f40 <nameiparent>
801052c3:	83 c4 10             	add    $0x10,%esp
801052c6:	85 c0                	test   %eax,%eax
801052c8:	89 c6                	mov    %eax,%esi
801052ca:	0f 84 60 01 00 00    	je     80105430 <sys_unlink+0x1a0>
801052d0:	83 ec 0c             	sub    $0xc,%esp
801052d3:	50                   	push   %eax
801052d4:	e8 e7 c3 ff ff       	call   801016c0 <ilock>
801052d9:	58                   	pop    %eax
801052da:	5a                   	pop    %edx
801052db:	68 94 80 10 80       	push   $0x80108094
801052e0:	53                   	push   %ebx
801052e1:	e8 ea c8 ff ff       	call   80101bd0 <namecmp>
801052e6:	83 c4 10             	add    $0x10,%esp
801052e9:	85 c0                	test   %eax,%eax
801052eb:	0f 84 03 01 00 00    	je     801053f4 <sys_unlink+0x164>
801052f1:	83 ec 08             	sub    $0x8,%esp
801052f4:	68 93 80 10 80       	push   $0x80108093
801052f9:	53                   	push   %ebx
801052fa:	e8 d1 c8 ff ff       	call   80101bd0 <namecmp>
801052ff:	83 c4 10             	add    $0x10,%esp
80105302:	85 c0                	test   %eax,%eax
80105304:	0f 84 ea 00 00 00    	je     801053f4 <sys_unlink+0x164>
8010530a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010530d:	83 ec 04             	sub    $0x4,%esp
80105310:	50                   	push   %eax
80105311:	53                   	push   %ebx
80105312:	56                   	push   %esi
80105313:	e8 d8 c8 ff ff       	call   80101bf0 <dirlookup>
80105318:	83 c4 10             	add    $0x10,%esp
8010531b:	85 c0                	test   %eax,%eax
8010531d:	89 c3                	mov    %eax,%ebx
8010531f:	0f 84 cf 00 00 00    	je     801053f4 <sys_unlink+0x164>
80105325:	83 ec 0c             	sub    $0xc,%esp
80105328:	50                   	push   %eax
80105329:	e8 92 c3 ff ff       	call   801016c0 <ilock>
8010532e:	83 c4 10             	add    $0x10,%esp
80105331:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80105336:	0f 8e 10 01 00 00    	jle    8010544c <sys_unlink+0x1bc>
8010533c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105341:	74 6d                	je     801053b0 <sys_unlink+0x120>
80105343:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105346:	83 ec 04             	sub    $0x4,%esp
80105349:	6a 10                	push   $0x10
8010534b:	6a 00                	push   $0x0
8010534d:	50                   	push   %eax
8010534e:	e8 9d f5 ff ff       	call   801048f0 <memset>
80105353:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105356:	6a 10                	push   $0x10
80105358:	ff 75 c4             	pushl  -0x3c(%ebp)
8010535b:	50                   	push   %eax
8010535c:	56                   	push   %esi
8010535d:	e8 3e c7 ff ff       	call   80101aa0 <writei>
80105362:	83 c4 20             	add    $0x20,%esp
80105365:	83 f8 10             	cmp    $0x10,%eax
80105368:	0f 85 eb 00 00 00    	jne    80105459 <sys_unlink+0x1c9>
8010536e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105373:	0f 84 97 00 00 00    	je     80105410 <sys_unlink+0x180>
80105379:	83 ec 0c             	sub    $0xc,%esp
8010537c:	56                   	push   %esi
8010537d:	e8 ce c5 ff ff       	call   80101950 <iunlockput>
80105382:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105387:	89 1c 24             	mov    %ebx,(%esp)
8010538a:	e8 81 c2 ff ff       	call   80101610 <iupdate>
8010538f:	89 1c 24             	mov    %ebx,(%esp)
80105392:	e8 b9 c5 ff ff       	call   80101950 <iunlockput>
80105397:	e8 04 d9 ff ff       	call   80102ca0 <end_op>
8010539c:	83 c4 10             	add    $0x10,%esp
8010539f:	31 c0                	xor    %eax,%eax
801053a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053a4:	5b                   	pop    %ebx
801053a5:	5e                   	pop    %esi
801053a6:	5f                   	pop    %edi
801053a7:	5d                   	pop    %ebp
801053a8:	c3                   	ret    
801053a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801053b0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801053b4:	76 8d                	jbe    80105343 <sys_unlink+0xb3>
801053b6:	bf 20 00 00 00       	mov    $0x20,%edi
801053bb:	eb 0f                	jmp    801053cc <sys_unlink+0x13c>
801053bd:	8d 76 00             	lea    0x0(%esi),%esi
801053c0:	83 c7 10             	add    $0x10,%edi
801053c3:	3b 7b 58             	cmp    0x58(%ebx),%edi
801053c6:	0f 83 77 ff ff ff    	jae    80105343 <sys_unlink+0xb3>
801053cc:	8d 45 d8             	lea    -0x28(%ebp),%eax
801053cf:	6a 10                	push   $0x10
801053d1:	57                   	push   %edi
801053d2:	50                   	push   %eax
801053d3:	53                   	push   %ebx
801053d4:	e8 c7 c5 ff ff       	call   801019a0 <readi>
801053d9:	83 c4 10             	add    $0x10,%esp
801053dc:	83 f8 10             	cmp    $0x10,%eax
801053df:	75 5e                	jne    8010543f <sys_unlink+0x1af>
801053e1:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801053e6:	74 d8                	je     801053c0 <sys_unlink+0x130>
801053e8:	83 ec 0c             	sub    $0xc,%esp
801053eb:	53                   	push   %ebx
801053ec:	e8 5f c5 ff ff       	call   80101950 <iunlockput>
801053f1:	83 c4 10             	add    $0x10,%esp
801053f4:	83 ec 0c             	sub    $0xc,%esp
801053f7:	56                   	push   %esi
801053f8:	e8 53 c5 ff ff       	call   80101950 <iunlockput>
801053fd:	e8 9e d8 ff ff       	call   80102ca0 <end_op>
80105402:	83 c4 10             	add    $0x10,%esp
80105405:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010540a:	eb 95                	jmp    801053a1 <sys_unlink+0x111>
8010540c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105410:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
80105415:	83 ec 0c             	sub    $0xc,%esp
80105418:	56                   	push   %esi
80105419:	e8 f2 c1 ff ff       	call   80101610 <iupdate>
8010541e:	83 c4 10             	add    $0x10,%esp
80105421:	e9 53 ff ff ff       	jmp    80105379 <sys_unlink+0xe9>
80105426:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010542b:	e9 71 ff ff ff       	jmp    801053a1 <sys_unlink+0x111>
80105430:	e8 6b d8 ff ff       	call   80102ca0 <end_op>
80105435:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010543a:	e9 62 ff ff ff       	jmp    801053a1 <sys_unlink+0x111>
8010543f:	83 ec 0c             	sub    $0xc,%esp
80105442:	68 b8 80 10 80       	push   $0x801080b8
80105447:	e8 44 af ff ff       	call   80100390 <panic>
8010544c:	83 ec 0c             	sub    $0xc,%esp
8010544f:	68 a6 80 10 80       	push   $0x801080a6
80105454:	e8 37 af ff ff       	call   80100390 <panic>
80105459:	83 ec 0c             	sub    $0xc,%esp
8010545c:	68 ca 80 10 80       	push   $0x801080ca
80105461:	e8 2a af ff ff       	call   80100390 <panic>
80105466:	8d 76 00             	lea    0x0(%esi),%esi
80105469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105470 <sys_open>:
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	57                   	push   %edi
80105474:	56                   	push   %esi
80105475:	53                   	push   %ebx
80105476:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105479:	83 ec 24             	sub    $0x24,%esp
8010547c:	50                   	push   %eax
8010547d:	6a 00                	push   $0x0
8010547f:	e8 1c f8 ff ff       	call   80104ca0 <argstr>
80105484:	83 c4 10             	add    $0x10,%esp
80105487:	85 c0                	test   %eax,%eax
80105489:	0f 88 1d 01 00 00    	js     801055ac <sys_open+0x13c>
8010548f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105492:	83 ec 08             	sub    $0x8,%esp
80105495:	50                   	push   %eax
80105496:	6a 01                	push   $0x1
80105498:	e8 53 f7 ff ff       	call   80104bf0 <argint>
8010549d:	83 c4 10             	add    $0x10,%esp
801054a0:	85 c0                	test   %eax,%eax
801054a2:	0f 88 04 01 00 00    	js     801055ac <sys_open+0x13c>
801054a8:	e8 83 d7 ff ff       	call   80102c30 <begin_op>
801054ad:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801054b1:	0f 85 a9 00 00 00    	jne    80105560 <sys_open+0xf0>
801054b7:	83 ec 0c             	sub    $0xc,%esp
801054ba:	ff 75 e0             	pushl  -0x20(%ebp)
801054bd:	e8 5e ca ff ff       	call   80101f20 <namei>
801054c2:	83 c4 10             	add    $0x10,%esp
801054c5:	85 c0                	test   %eax,%eax
801054c7:	89 c6                	mov    %eax,%esi
801054c9:	0f 84 b2 00 00 00    	je     80105581 <sys_open+0x111>
801054cf:	83 ec 0c             	sub    $0xc,%esp
801054d2:	50                   	push   %eax
801054d3:	e8 e8 c1 ff ff       	call   801016c0 <ilock>
801054d8:	83 c4 10             	add    $0x10,%esp
801054db:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801054e0:	0f 84 aa 00 00 00    	je     80105590 <sys_open+0x120>
801054e6:	e8 d5 b8 ff ff       	call   80100dc0 <filealloc>
801054eb:	85 c0                	test   %eax,%eax
801054ed:	89 c7                	mov    %eax,%edi
801054ef:	0f 84 a6 00 00 00    	je     8010559b <sys_open+0x12b>
801054f5:	e8 a6 e3 ff ff       	call   801038a0 <myproc>
801054fa:	31 db                	xor    %ebx,%ebx
801054fc:	eb 0e                	jmp    8010550c <sys_open+0x9c>
801054fe:	66 90                	xchg   %ax,%ax
80105500:	83 c3 01             	add    $0x1,%ebx
80105503:	83 fb 10             	cmp    $0x10,%ebx
80105506:	0f 84 ac 00 00 00    	je     801055b8 <sys_open+0x148>
8010550c:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105510:	85 d2                	test   %edx,%edx
80105512:	75 ec                	jne    80105500 <sys_open+0x90>
80105514:	83 ec 0c             	sub    $0xc,%esp
80105517:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
8010551b:	56                   	push   %esi
8010551c:	e8 7f c2 ff ff       	call   801017a0 <iunlock>
80105521:	e8 7a d7 ff ff       	call   80102ca0 <end_op>
80105526:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
8010552c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010552f:	83 c4 10             	add    $0x10,%esp
80105532:	89 77 10             	mov    %esi,0x10(%edi)
80105535:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
8010553c:	89 d0                	mov    %edx,%eax
8010553e:	f7 d0                	not    %eax
80105540:	83 e0 01             	and    $0x1,%eax
80105543:	83 e2 03             	and    $0x3,%edx
80105546:	88 47 08             	mov    %al,0x8(%edi)
80105549:	0f 95 47 09          	setne  0x9(%edi)
8010554d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105550:	89 d8                	mov    %ebx,%eax
80105552:	5b                   	pop    %ebx
80105553:	5e                   	pop    %esi
80105554:	5f                   	pop    %edi
80105555:	5d                   	pop    %ebp
80105556:	c3                   	ret    
80105557:	89 f6                	mov    %esi,%esi
80105559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105560:	83 ec 0c             	sub    $0xc,%esp
80105563:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105566:	31 c9                	xor    %ecx,%ecx
80105568:	6a 00                	push   $0x0
8010556a:	ba 02 00 00 00       	mov    $0x2,%edx
8010556f:	e8 ec f7 ff ff       	call   80104d60 <create>
80105574:	83 c4 10             	add    $0x10,%esp
80105577:	85 c0                	test   %eax,%eax
80105579:	89 c6                	mov    %eax,%esi
8010557b:	0f 85 65 ff ff ff    	jne    801054e6 <sys_open+0x76>
80105581:	e8 1a d7 ff ff       	call   80102ca0 <end_op>
80105586:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010558b:	eb c0                	jmp    8010554d <sys_open+0xdd>
8010558d:	8d 76 00             	lea    0x0(%esi),%esi
80105590:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105593:	85 c9                	test   %ecx,%ecx
80105595:	0f 84 4b ff ff ff    	je     801054e6 <sys_open+0x76>
8010559b:	83 ec 0c             	sub    $0xc,%esp
8010559e:	56                   	push   %esi
8010559f:	e8 ac c3 ff ff       	call   80101950 <iunlockput>
801055a4:	e8 f7 d6 ff ff       	call   80102ca0 <end_op>
801055a9:	83 c4 10             	add    $0x10,%esp
801055ac:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801055b1:	eb 9a                	jmp    8010554d <sys_open+0xdd>
801055b3:	90                   	nop
801055b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801055b8:	83 ec 0c             	sub    $0xc,%esp
801055bb:	57                   	push   %edi
801055bc:	e8 bf b8 ff ff       	call   80100e80 <fileclose>
801055c1:	83 c4 10             	add    $0x10,%esp
801055c4:	eb d5                	jmp    8010559b <sys_open+0x12b>
801055c6:	8d 76 00             	lea    0x0(%esi),%esi
801055c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055d0 <sys_mkdir>:
801055d0:	55                   	push   %ebp
801055d1:	89 e5                	mov    %esp,%ebp
801055d3:	83 ec 18             	sub    $0x18,%esp
801055d6:	e8 55 d6 ff ff       	call   80102c30 <begin_op>
801055db:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055de:	83 ec 08             	sub    $0x8,%esp
801055e1:	50                   	push   %eax
801055e2:	6a 00                	push   $0x0
801055e4:	e8 b7 f6 ff ff       	call   80104ca0 <argstr>
801055e9:	83 c4 10             	add    $0x10,%esp
801055ec:	85 c0                	test   %eax,%eax
801055ee:	78 30                	js     80105620 <sys_mkdir+0x50>
801055f0:	83 ec 0c             	sub    $0xc,%esp
801055f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801055f6:	31 c9                	xor    %ecx,%ecx
801055f8:	6a 00                	push   $0x0
801055fa:	ba 01 00 00 00       	mov    $0x1,%edx
801055ff:	e8 5c f7 ff ff       	call   80104d60 <create>
80105604:	83 c4 10             	add    $0x10,%esp
80105607:	85 c0                	test   %eax,%eax
80105609:	74 15                	je     80105620 <sys_mkdir+0x50>
8010560b:	83 ec 0c             	sub    $0xc,%esp
8010560e:	50                   	push   %eax
8010560f:	e8 3c c3 ff ff       	call   80101950 <iunlockput>
80105614:	e8 87 d6 ff ff       	call   80102ca0 <end_op>
80105619:	83 c4 10             	add    $0x10,%esp
8010561c:	31 c0                	xor    %eax,%eax
8010561e:	c9                   	leave  
8010561f:	c3                   	ret    
80105620:	e8 7b d6 ff ff       	call   80102ca0 <end_op>
80105625:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010562a:	c9                   	leave  
8010562b:	c3                   	ret    
8010562c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105630 <sys_mknod>:
80105630:	55                   	push   %ebp
80105631:	89 e5                	mov    %esp,%ebp
80105633:	83 ec 18             	sub    $0x18,%esp
80105636:	e8 f5 d5 ff ff       	call   80102c30 <begin_op>
8010563b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010563e:	83 ec 08             	sub    $0x8,%esp
80105641:	50                   	push   %eax
80105642:	6a 00                	push   $0x0
80105644:	e8 57 f6 ff ff       	call   80104ca0 <argstr>
80105649:	83 c4 10             	add    $0x10,%esp
8010564c:	85 c0                	test   %eax,%eax
8010564e:	78 60                	js     801056b0 <sys_mknod+0x80>
80105650:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105653:	83 ec 08             	sub    $0x8,%esp
80105656:	50                   	push   %eax
80105657:	6a 01                	push   $0x1
80105659:	e8 92 f5 ff ff       	call   80104bf0 <argint>
8010565e:	83 c4 10             	add    $0x10,%esp
80105661:	85 c0                	test   %eax,%eax
80105663:	78 4b                	js     801056b0 <sys_mknod+0x80>
80105665:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105668:	83 ec 08             	sub    $0x8,%esp
8010566b:	50                   	push   %eax
8010566c:	6a 02                	push   $0x2
8010566e:	e8 7d f5 ff ff       	call   80104bf0 <argint>
80105673:	83 c4 10             	add    $0x10,%esp
80105676:	85 c0                	test   %eax,%eax
80105678:	78 36                	js     801056b0 <sys_mknod+0x80>
8010567a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010567e:	83 ec 0c             	sub    $0xc,%esp
80105681:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105685:	ba 03 00 00 00       	mov    $0x3,%edx
8010568a:	50                   	push   %eax
8010568b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010568e:	e8 cd f6 ff ff       	call   80104d60 <create>
80105693:	83 c4 10             	add    $0x10,%esp
80105696:	85 c0                	test   %eax,%eax
80105698:	74 16                	je     801056b0 <sys_mknod+0x80>
8010569a:	83 ec 0c             	sub    $0xc,%esp
8010569d:	50                   	push   %eax
8010569e:	e8 ad c2 ff ff       	call   80101950 <iunlockput>
801056a3:	e8 f8 d5 ff ff       	call   80102ca0 <end_op>
801056a8:	83 c4 10             	add    $0x10,%esp
801056ab:	31 c0                	xor    %eax,%eax
801056ad:	c9                   	leave  
801056ae:	c3                   	ret    
801056af:	90                   	nop
801056b0:	e8 eb d5 ff ff       	call   80102ca0 <end_op>
801056b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056ba:	c9                   	leave  
801056bb:	c3                   	ret    
801056bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056c0 <sys_chdir>:
801056c0:	55                   	push   %ebp
801056c1:	89 e5                	mov    %esp,%ebp
801056c3:	56                   	push   %esi
801056c4:	53                   	push   %ebx
801056c5:	83 ec 10             	sub    $0x10,%esp
801056c8:	e8 d3 e1 ff ff       	call   801038a0 <myproc>
801056cd:	89 c6                	mov    %eax,%esi
801056cf:	e8 5c d5 ff ff       	call   80102c30 <begin_op>
801056d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056d7:	83 ec 08             	sub    $0x8,%esp
801056da:	50                   	push   %eax
801056db:	6a 00                	push   $0x0
801056dd:	e8 be f5 ff ff       	call   80104ca0 <argstr>
801056e2:	83 c4 10             	add    $0x10,%esp
801056e5:	85 c0                	test   %eax,%eax
801056e7:	78 77                	js     80105760 <sys_chdir+0xa0>
801056e9:	83 ec 0c             	sub    $0xc,%esp
801056ec:	ff 75 f4             	pushl  -0xc(%ebp)
801056ef:	e8 2c c8 ff ff       	call   80101f20 <namei>
801056f4:	83 c4 10             	add    $0x10,%esp
801056f7:	85 c0                	test   %eax,%eax
801056f9:	89 c3                	mov    %eax,%ebx
801056fb:	74 63                	je     80105760 <sys_chdir+0xa0>
801056fd:	83 ec 0c             	sub    $0xc,%esp
80105700:	50                   	push   %eax
80105701:	e8 ba bf ff ff       	call   801016c0 <ilock>
80105706:	83 c4 10             	add    $0x10,%esp
80105709:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010570e:	75 30                	jne    80105740 <sys_chdir+0x80>
80105710:	83 ec 0c             	sub    $0xc,%esp
80105713:	53                   	push   %ebx
80105714:	e8 87 c0 ff ff       	call   801017a0 <iunlock>
80105719:	58                   	pop    %eax
8010571a:	ff 76 68             	pushl  0x68(%esi)
8010571d:	e8 ce c0 ff ff       	call   801017f0 <iput>
80105722:	e8 79 d5 ff ff       	call   80102ca0 <end_op>
80105727:	89 5e 68             	mov    %ebx,0x68(%esi)
8010572a:	83 c4 10             	add    $0x10,%esp
8010572d:	31 c0                	xor    %eax,%eax
8010572f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105732:	5b                   	pop    %ebx
80105733:	5e                   	pop    %esi
80105734:	5d                   	pop    %ebp
80105735:	c3                   	ret    
80105736:	8d 76 00             	lea    0x0(%esi),%esi
80105739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105740:	83 ec 0c             	sub    $0xc,%esp
80105743:	53                   	push   %ebx
80105744:	e8 07 c2 ff ff       	call   80101950 <iunlockput>
80105749:	e8 52 d5 ff ff       	call   80102ca0 <end_op>
8010574e:	83 c4 10             	add    $0x10,%esp
80105751:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105756:	eb d7                	jmp    8010572f <sys_chdir+0x6f>
80105758:	90                   	nop
80105759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105760:	e8 3b d5 ff ff       	call   80102ca0 <end_op>
80105765:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010576a:	eb c3                	jmp    8010572f <sys_chdir+0x6f>
8010576c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105770 <sys_exec>:
80105770:	55                   	push   %ebp
80105771:	89 e5                	mov    %esp,%ebp
80105773:	57                   	push   %edi
80105774:	56                   	push   %esi
80105775:	53                   	push   %ebx
80105776:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010577c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105782:	50                   	push   %eax
80105783:	6a 00                	push   $0x0
80105785:	e8 16 f5 ff ff       	call   80104ca0 <argstr>
8010578a:	83 c4 10             	add    $0x10,%esp
8010578d:	85 c0                	test   %eax,%eax
8010578f:	0f 88 87 00 00 00    	js     8010581c <sys_exec+0xac>
80105795:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010579b:	83 ec 08             	sub    $0x8,%esp
8010579e:	50                   	push   %eax
8010579f:	6a 01                	push   $0x1
801057a1:	e8 4a f4 ff ff       	call   80104bf0 <argint>
801057a6:	83 c4 10             	add    $0x10,%esp
801057a9:	85 c0                	test   %eax,%eax
801057ab:	78 6f                	js     8010581c <sys_exec+0xac>
801057ad:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801057b3:	83 ec 04             	sub    $0x4,%esp
801057b6:	31 db                	xor    %ebx,%ebx
801057b8:	68 80 00 00 00       	push   $0x80
801057bd:	6a 00                	push   $0x0
801057bf:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801057c5:	50                   	push   %eax
801057c6:	e8 25 f1 ff ff       	call   801048f0 <memset>
801057cb:	83 c4 10             	add    $0x10,%esp
801057ce:	eb 2c                	jmp    801057fc <sys_exec+0x8c>
801057d0:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801057d6:	85 c0                	test   %eax,%eax
801057d8:	74 56                	je     80105830 <sys_exec+0xc0>
801057da:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
801057e0:	83 ec 08             	sub    $0x8,%esp
801057e3:	8d 14 31             	lea    (%ecx,%esi,1),%edx
801057e6:	52                   	push   %edx
801057e7:	50                   	push   %eax
801057e8:	e8 93 f3 ff ff       	call   80104b80 <fetchstr>
801057ed:	83 c4 10             	add    $0x10,%esp
801057f0:	85 c0                	test   %eax,%eax
801057f2:	78 28                	js     8010581c <sys_exec+0xac>
801057f4:	83 c3 01             	add    $0x1,%ebx
801057f7:	83 fb 20             	cmp    $0x20,%ebx
801057fa:	74 20                	je     8010581c <sys_exec+0xac>
801057fc:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105802:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105809:	83 ec 08             	sub    $0x8,%esp
8010580c:	57                   	push   %edi
8010580d:	01 f0                	add    %esi,%eax
8010580f:	50                   	push   %eax
80105810:	e8 2b f3 ff ff       	call   80104b40 <fetchint>
80105815:	83 c4 10             	add    $0x10,%esp
80105818:	85 c0                	test   %eax,%eax
8010581a:	79 b4                	jns    801057d0 <sys_exec+0x60>
8010581c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010581f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105824:	5b                   	pop    %ebx
80105825:	5e                   	pop    %esi
80105826:	5f                   	pop    %edi
80105827:	5d                   	pop    %ebp
80105828:	c3                   	ret    
80105829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105830:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105836:	83 ec 08             	sub    $0x8,%esp
80105839:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105840:	00 00 00 00 
80105844:	50                   	push   %eax
80105845:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010584b:	e8 00 b2 ff ff       	call   80100a50 <exec>
80105850:	83 c4 10             	add    $0x10,%esp
80105853:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105856:	5b                   	pop    %ebx
80105857:	5e                   	pop    %esi
80105858:	5f                   	pop    %edi
80105859:	5d                   	pop    %ebp
8010585a:	c3                   	ret    
8010585b:	90                   	nop
8010585c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105860 <sys_pipe>:
80105860:	55                   	push   %ebp
80105861:	89 e5                	mov    %esp,%ebp
80105863:	57                   	push   %edi
80105864:	56                   	push   %esi
80105865:	53                   	push   %ebx
80105866:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105869:	83 ec 20             	sub    $0x20,%esp
8010586c:	6a 08                	push   $0x8
8010586e:	50                   	push   %eax
8010586f:	6a 00                	push   $0x0
80105871:	e8 ca f3 ff ff       	call   80104c40 <argptr>
80105876:	83 c4 10             	add    $0x10,%esp
80105879:	85 c0                	test   %eax,%eax
8010587b:	0f 88 ae 00 00 00    	js     8010592f <sys_pipe+0xcf>
80105881:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105884:	83 ec 08             	sub    $0x8,%esp
80105887:	50                   	push   %eax
80105888:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010588b:	50                   	push   %eax
8010588c:	e8 3f da ff ff       	call   801032d0 <pipealloc>
80105891:	83 c4 10             	add    $0x10,%esp
80105894:	85 c0                	test   %eax,%eax
80105896:	0f 88 93 00 00 00    	js     8010592f <sys_pipe+0xcf>
8010589c:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010589f:	31 db                	xor    %ebx,%ebx
801058a1:	e8 fa df ff ff       	call   801038a0 <myproc>
801058a6:	eb 10                	jmp    801058b8 <sys_pipe+0x58>
801058a8:	90                   	nop
801058a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058b0:	83 c3 01             	add    $0x1,%ebx
801058b3:	83 fb 10             	cmp    $0x10,%ebx
801058b6:	74 60                	je     80105918 <sys_pipe+0xb8>
801058b8:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801058bc:	85 f6                	test   %esi,%esi
801058be:	75 f0                	jne    801058b0 <sys_pipe+0x50>
801058c0:	8d 73 08             	lea    0x8(%ebx),%esi
801058c3:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
801058c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801058ca:	e8 d1 df ff ff       	call   801038a0 <myproc>
801058cf:	31 d2                	xor    %edx,%edx
801058d1:	eb 0d                	jmp    801058e0 <sys_pipe+0x80>
801058d3:	90                   	nop
801058d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801058d8:	83 c2 01             	add    $0x1,%edx
801058db:	83 fa 10             	cmp    $0x10,%edx
801058de:	74 28                	je     80105908 <sys_pipe+0xa8>
801058e0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801058e4:	85 c9                	test   %ecx,%ecx
801058e6:	75 f0                	jne    801058d8 <sys_pipe+0x78>
801058e8:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
801058ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058ef:	89 18                	mov    %ebx,(%eax)
801058f1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058f4:	89 50 04             	mov    %edx,0x4(%eax)
801058f7:	31 c0                	xor    %eax,%eax
801058f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058fc:	5b                   	pop    %ebx
801058fd:	5e                   	pop    %esi
801058fe:	5f                   	pop    %edi
801058ff:	5d                   	pop    %ebp
80105900:	c3                   	ret    
80105901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105908:	e8 93 df ff ff       	call   801038a0 <myproc>
8010590d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105914:	00 
80105915:	8d 76 00             	lea    0x0(%esi),%esi
80105918:	83 ec 0c             	sub    $0xc,%esp
8010591b:	ff 75 e0             	pushl  -0x20(%ebp)
8010591e:	e8 5d b5 ff ff       	call   80100e80 <fileclose>
80105923:	58                   	pop    %eax
80105924:	ff 75 e4             	pushl  -0x1c(%ebp)
80105927:	e8 54 b5 ff ff       	call   80100e80 <fileclose>
8010592c:	83 c4 10             	add    $0x10,%esp
8010592f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105934:	eb c3                	jmp    801058f9 <sys_pipe+0x99>
80105936:	66 90                	xchg   %ax,%ax
80105938:	66 90                	xchg   %ax,%ax
8010593a:	66 90                	xchg   %ax,%ax
8010593c:	66 90                	xchg   %ax,%ax
8010593e:	66 90                	xchg   %ax,%ax

80105940 <sys_fork>:
80105940:	55                   	push   %ebp
80105941:	89 e5                	mov    %esp,%ebp
80105943:	5d                   	pop    %ebp
80105944:	e9 f7 e0 ff ff       	jmp    80103a40 <fork>
80105949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105950 <sys_exit>:
80105950:	55                   	push   %ebp
80105951:	89 e5                	mov    %esp,%ebp
80105953:	83 ec 08             	sub    $0x8,%esp
80105956:	e8 e5 e3 ff ff       	call   80103d40 <exit>
8010595b:	31 c0                	xor    %eax,%eax
8010595d:	c9                   	leave  
8010595e:	c3                   	ret    
8010595f:	90                   	nop

80105960 <sys_wait>:
80105960:	55                   	push   %ebp
80105961:	89 e5                	mov    %esp,%ebp
80105963:	5d                   	pop    %ebp
80105964:	e9 17 e6 ff ff       	jmp    80103f80 <wait>
80105969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105970 <sys_kill>:
80105970:	55                   	push   %ebp
80105971:	89 e5                	mov    %esp,%ebp
80105973:	83 ec 20             	sub    $0x20,%esp
80105976:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105979:	50                   	push   %eax
8010597a:	6a 00                	push   $0x0
8010597c:	e8 6f f2 ff ff       	call   80104bf0 <argint>
80105981:	83 c4 10             	add    $0x10,%esp
80105984:	85 c0                	test   %eax,%eax
80105986:	78 18                	js     801059a0 <sys_kill+0x30>
80105988:	83 ec 0c             	sub    $0xc,%esp
8010598b:	ff 75 f4             	pushl  -0xc(%ebp)
8010598e:	e8 4d e7 ff ff       	call   801040e0 <kill>
80105993:	83 c4 10             	add    $0x10,%esp
80105996:	c9                   	leave  
80105997:	c3                   	ret    
80105998:	90                   	nop
80105999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801059a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801059a5:	c9                   	leave  
801059a6:	c3                   	ret    
801059a7:	89 f6                	mov    %esi,%esi
801059a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801059b0 <sys_getpid>:
801059b0:	55                   	push   %ebp
801059b1:	89 e5                	mov    %esp,%ebp
801059b3:	83 ec 08             	sub    $0x8,%esp
801059b6:	e8 e5 de ff ff       	call   801038a0 <myproc>
801059bb:	8b 40 10             	mov    0x10(%eax),%eax
801059be:	c9                   	leave  
801059bf:	c3                   	ret    

801059c0 <sys_sbrk>:
801059c0:	55                   	push   %ebp
801059c1:	89 e5                	mov    %esp,%ebp
801059c3:	53                   	push   %ebx
801059c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801059c7:	83 ec 1c             	sub    $0x1c,%esp
801059ca:	50                   	push   %eax
801059cb:	6a 00                	push   $0x0
801059cd:	e8 1e f2 ff ff       	call   80104bf0 <argint>
801059d2:	83 c4 10             	add    $0x10,%esp
801059d5:	85 c0                	test   %eax,%eax
801059d7:	78 27                	js     80105a00 <sys_sbrk+0x40>
801059d9:	e8 c2 de ff ff       	call   801038a0 <myproc>
801059de:	83 ec 0c             	sub    $0xc,%esp
801059e1:	8b 18                	mov    (%eax),%ebx
801059e3:	ff 75 f4             	pushl  -0xc(%ebp)
801059e6:	e8 d5 df ff ff       	call   801039c0 <growproc>
801059eb:	83 c4 10             	add    $0x10,%esp
801059ee:	85 c0                	test   %eax,%eax
801059f0:	78 0e                	js     80105a00 <sys_sbrk+0x40>
801059f2:	89 d8                	mov    %ebx,%eax
801059f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801059f7:	c9                   	leave  
801059f8:	c3                   	ret    
801059f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a00:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105a05:	eb eb                	jmp    801059f2 <sys_sbrk+0x32>
80105a07:	89 f6                	mov    %esi,%esi
80105a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a10 <sys_sleep>:
80105a10:	55                   	push   %ebp
80105a11:	89 e5                	mov    %esp,%ebp
80105a13:	53                   	push   %ebx
80105a14:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105a17:	83 ec 1c             	sub    $0x1c,%esp
80105a1a:	50                   	push   %eax
80105a1b:	6a 00                	push   $0x0
80105a1d:	e8 ce f1 ff ff       	call   80104bf0 <argint>
80105a22:	83 c4 10             	add    $0x10,%esp
80105a25:	85 c0                	test   %eax,%eax
80105a27:	0f 88 8a 00 00 00    	js     80105ab7 <sys_sleep+0xa7>
80105a2d:	83 ec 0c             	sub    $0xc,%esp
80105a30:	68 40 68 11 80       	push   $0x80116840
80105a35:	e8 a6 ed ff ff       	call   801047e0 <acquire>
80105a3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105a3d:	83 c4 10             	add    $0x10,%esp
80105a40:	8b 1d 80 70 11 80    	mov    0x80117080,%ebx
80105a46:	85 d2                	test   %edx,%edx
80105a48:	75 27                	jne    80105a71 <sys_sleep+0x61>
80105a4a:	eb 54                	jmp    80105aa0 <sys_sleep+0x90>
80105a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a50:	83 ec 08             	sub    $0x8,%esp
80105a53:	68 40 68 11 80       	push   $0x80116840
80105a58:	68 80 70 11 80       	push   $0x80117080
80105a5d:	e8 5e e4 ff ff       	call   80103ec0 <sleep>
80105a62:	a1 80 70 11 80       	mov    0x80117080,%eax
80105a67:	83 c4 10             	add    $0x10,%esp
80105a6a:	29 d8                	sub    %ebx,%eax
80105a6c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105a6f:	73 2f                	jae    80105aa0 <sys_sleep+0x90>
80105a71:	e8 2a de ff ff       	call   801038a0 <myproc>
80105a76:	8b 40 24             	mov    0x24(%eax),%eax
80105a79:	85 c0                	test   %eax,%eax
80105a7b:	74 d3                	je     80105a50 <sys_sleep+0x40>
80105a7d:	83 ec 0c             	sub    $0xc,%esp
80105a80:	68 40 68 11 80       	push   $0x80116840
80105a85:	e8 16 ee ff ff       	call   801048a0 <release>
80105a8a:	83 c4 10             	add    $0x10,%esp
80105a8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a95:	c9                   	leave  
80105a96:	c3                   	ret    
80105a97:	89 f6                	mov    %esi,%esi
80105a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105aa0:	83 ec 0c             	sub    $0xc,%esp
80105aa3:	68 40 68 11 80       	push   $0x80116840
80105aa8:	e8 f3 ed ff ff       	call   801048a0 <release>
80105aad:	83 c4 10             	add    $0x10,%esp
80105ab0:	31 c0                	xor    %eax,%eax
80105ab2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105ab5:	c9                   	leave  
80105ab6:	c3                   	ret    
80105ab7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105abc:	eb f4                	jmp    80105ab2 <sys_sleep+0xa2>
80105abe:	66 90                	xchg   %ax,%ax

80105ac0 <sys_uptime>:
80105ac0:	55                   	push   %ebp
80105ac1:	89 e5                	mov    %esp,%ebp
80105ac3:	53                   	push   %ebx
80105ac4:	83 ec 10             	sub    $0x10,%esp
80105ac7:	68 40 68 11 80       	push   $0x80116840
80105acc:	e8 0f ed ff ff       	call   801047e0 <acquire>
80105ad1:	8b 1d 80 70 11 80    	mov    0x80117080,%ebx
80105ad7:	c7 04 24 40 68 11 80 	movl   $0x80116840,(%esp)
80105ade:	e8 bd ed ff ff       	call   801048a0 <release>
80105ae3:	89 d8                	mov    %ebx,%eax
80105ae5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105ae8:	c9                   	leave  
80105ae9:	c3                   	ret    
80105aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105af0 <sys_gettime>:
80105af0:	55                   	push   %ebp
80105af1:	89 e5                	mov    %esp,%ebp
80105af3:	83 ec 1c             	sub    $0x1c,%esp
80105af6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105af9:	6a 18                	push   $0x18
80105afb:	50                   	push   %eax
80105afc:	6a 00                	push   $0x0
80105afe:	e8 3d f1 ff ff       	call   80104c40 <argptr>
80105b03:	83 c4 10             	add    $0x10,%esp
80105b06:	85 c0                	test   %eax,%eax
80105b08:	78 16                	js     80105b20 <sys_gettime+0x30>
80105b0a:	83 ec 0c             	sub    $0xc,%esp
80105b0d:	ff 75 f4             	pushl  -0xc(%ebp)
80105b10:	e8 3b cd ff ff       	call   80102850 <cmostime>
80105b15:	83 c4 10             	add    $0x10,%esp
80105b18:	31 c0                	xor    %eax,%eax
80105b1a:	c9                   	leave  
80105b1b:	c3                   	ret    
80105b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105b20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b25:	c9                   	leave  
80105b26:	c3                   	ret    
80105b27:	89 f6                	mov    %esi,%esi
80105b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b30 <sys_settickets>:
80105b30:	55                   	push   %ebp
80105b31:	89 e5                	mov    %esp,%ebp
80105b33:	83 ec 20             	sub    $0x20,%esp
80105b36:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b39:	50                   	push   %eax
80105b3a:	6a 00                	push   $0x0
80105b3c:	e8 af f0 ff ff       	call   80104bf0 <argint>
80105b41:	83 c4 10             	add    $0x10,%esp
80105b44:	85 c0                	test   %eax,%eax
80105b46:	78 18                	js     80105b60 <sys_settickets+0x30>
80105b48:	83 ec 0c             	sub    $0xc,%esp
80105b4b:	ff 75 f4             	pushl  -0xc(%ebp)
80105b4e:	e8 0d e6 ff ff       	call   80104160 <settickets>
80105b53:	83 c4 10             	add    $0x10,%esp
80105b56:	31 c0                	xor    %eax,%eax
80105b58:	c9                   	leave  
80105b59:	c3                   	ret    
80105b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b65:	c9                   	leave  
80105b66:	c3                   	ret    
80105b67:	89 f6                	mov    %esi,%esi
80105b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b70 <sys_getpinfo>:
80105b70:	55                   	push   %ebp
80105b71:	89 e5                	mov    %esp,%ebp
80105b73:	83 ec 1c             	sub    $0x1c,%esp
80105b76:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b79:	68 00 04 00 00       	push   $0x400
80105b7e:	50                   	push   %eax
80105b7f:	6a 00                	push   $0x0
80105b81:	e8 ba f0 ff ff       	call   80104c40 <argptr>
80105b86:	83 c4 10             	add    $0x10,%esp
80105b89:	85 c0                	test   %eax,%eax
80105b8b:	78 13                	js     80105ba0 <sys_getpinfo+0x30>
80105b8d:	83 ec 0c             	sub    $0xc,%esp
80105b90:	ff 75 f4             	pushl  -0xc(%ebp)
80105b93:	e8 38 e6 ff ff       	call   801041d0 <getpinfo>
80105b98:	83 c4 10             	add    $0x10,%esp
80105b9b:	31 c0                	xor    %eax,%eax
80105b9d:	c9                   	leave  
80105b9e:	c3                   	ret    
80105b9f:	90                   	nop
80105ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ba5:	c9                   	leave  
80105ba6:	c3                   	ret    
80105ba7:	89 f6                	mov    %esi,%esi
80105ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105bb0 <sys_getreadcount>:
80105bb0:	55                   	push   %ebp
80105bb1:	89 e5                	mov    %esp,%ebp
80105bb3:	5d                   	pop    %ebp
80105bb4:	e9 27 f1 ff ff       	jmp    80104ce0 <getreadcount>
80105bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105bc0 <sys_mprotect>:
80105bc0:	55                   	push   %ebp
80105bc1:	89 e5                	mov    %esp,%ebp
80105bc3:	83 ec 20             	sub    $0x20,%esp
80105bc6:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105bc9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80105bd0:	50                   	push   %eax
80105bd1:	6a 00                	push   $0x0
80105bd3:	e8 18 f0 ff ff       	call   80104bf0 <argint>
80105bd8:	83 c4 10             	add    $0x10,%esp
80105bdb:	85 c0                	test   %eax,%eax
80105bdd:	78 31                	js     80105c10 <sys_mprotect+0x50>
80105bdf:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105be2:	83 ec 08             	sub    $0x8,%esp
80105be5:	50                   	push   %eax
80105be6:	6a 01                	push   $0x1
80105be8:	e8 03 f0 ff ff       	call   80104bf0 <argint>
80105bed:	83 c4 10             	add    $0x10,%esp
80105bf0:	85 c0                	test   %eax,%eax
80105bf2:	78 1c                	js     80105c10 <sys_mprotect+0x50>
80105bf4:	83 ec 08             	sub    $0x8,%esp
80105bf7:	ff 75 f4             	pushl  -0xc(%ebp)
80105bfa:	ff 75 f0             	pushl  -0x10(%ebp)
80105bfd:	e8 7e 19 00 00       	call   80107580 <mprotect>
80105c02:	83 c4 10             	add    $0x10,%esp
80105c05:	c9                   	leave  
80105c06:	c3                   	ret    
80105c07:	89 f6                	mov    %esi,%esi
80105c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105c10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c15:	c9                   	leave  
80105c16:	c3                   	ret    
80105c17:	89 f6                	mov    %esi,%esi
80105c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c20 <sys_munprotect>:
80105c20:	55                   	push   %ebp
80105c21:	89 e5                	mov    %esp,%ebp
80105c23:	83 ec 20             	sub    $0x20,%esp
80105c26:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105c29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80105c30:	50                   	push   %eax
80105c31:	6a 00                	push   $0x0
80105c33:	e8 b8 ef ff ff       	call   80104bf0 <argint>
80105c38:	83 c4 10             	add    $0x10,%esp
80105c3b:	85 c0                	test   %eax,%eax
80105c3d:	78 31                	js     80105c70 <sys_munprotect+0x50>
80105c3f:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105c42:	83 ec 08             	sub    $0x8,%esp
80105c45:	50                   	push   %eax
80105c46:	6a 01                	push   $0x1
80105c48:	e8 a3 ef ff ff       	call   80104bf0 <argint>
80105c4d:	83 c4 10             	add    $0x10,%esp
80105c50:	85 c0                	test   %eax,%eax
80105c52:	78 1c                	js     80105c70 <sys_munprotect+0x50>
80105c54:	83 ec 08             	sub    $0x8,%esp
80105c57:	ff 75 f4             	pushl  -0xc(%ebp)
80105c5a:	ff 75 f0             	pushl  -0x10(%ebp)
80105c5d:	e8 fe 19 00 00       	call   80107660 <munprotect>
80105c62:	83 c4 10             	add    $0x10,%esp
80105c65:	c9                   	leave  
80105c66:	c3                   	ret    
80105c67:	89 f6                	mov    %esi,%esi
80105c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105c70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c75:	c9                   	leave  
80105c76:	c3                   	ret    
80105c77:	89 f6                	mov    %esi,%esi
80105c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c80 <sys_clone>:
80105c80:	55                   	push   %ebp
80105c81:	89 e5                	mov    %esp,%ebp
80105c83:	57                   	push   %edi
80105c84:	56                   	push   %esi
80105c85:	53                   	push   %ebx
80105c86:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
80105c89:	83 ec 24             	sub    $0x24,%esp
80105c8c:	53                   	push   %ebx
80105c8d:	6a 00                	push   $0x0
80105c8f:	e8 5c ef ff ff       	call   80104bf0 <argint>
80105c94:	58                   	pop    %eax
80105c95:	5a                   	pop    %edx
80105c96:	53                   	push   %ebx
80105c97:	6a 01                	push   $0x1
80105c99:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80105c9c:	e8 4f ef ff ff       	call   80104bf0 <argint>
80105ca1:	59                   	pop    %ecx
80105ca2:	58                   	pop    %eax
80105ca3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105ca6:	53                   	push   %ebx
80105ca7:	6a 02                	push   $0x2
80105ca9:	e8 42 ef ff ff       	call   80104bf0 <argint>
80105cae:	83 c4 0c             	add    $0xc,%esp
80105cb1:	ff 75 e4             	pushl  -0x1c(%ebp)
80105cb4:	57                   	push   %edi
80105cb5:	56                   	push   %esi
80105cb6:	e8 65 e6 ff ff       	call   80104320 <clone>
80105cbb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cbe:	5b                   	pop    %ebx
80105cbf:	5e                   	pop    %esi
80105cc0:	5f                   	pop    %edi
80105cc1:	5d                   	pop    %ebp
80105cc2:	c3                   	ret    
80105cc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105cd0 <sys_join>:
80105cd0:	55                   	push   %ebp
80105cd1:	89 e5                	mov    %esp,%ebp
80105cd3:	83 ec 20             	sub    $0x20,%esp
80105cd6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105cd9:	50                   	push   %eax
80105cda:	6a 00                	push   $0x0
80105cdc:	e8 0f ef ff ff       	call   80104bf0 <argint>
80105ce1:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105ce4:	89 04 24             	mov    %eax,(%esp)
80105ce7:	e8 64 e7 ff ff       	call   80104450 <join>
80105cec:	c9                   	leave  
80105ced:	c3                   	ret    

80105cee <alltraps>:
80105cee:	1e                   	push   %ds
80105cef:	06                   	push   %es
80105cf0:	0f a0                	push   %fs
80105cf2:	0f a8                	push   %gs
80105cf4:	60                   	pusha  
80105cf5:	66 b8 10 00          	mov    $0x10,%ax
80105cf9:	8e d8                	mov    %eax,%ds
80105cfb:	8e c0                	mov    %eax,%es
80105cfd:	54                   	push   %esp
80105cfe:	e8 cd 00 00 00       	call   80105dd0 <trap>
80105d03:	83 c4 04             	add    $0x4,%esp

80105d06 <trapret>:
80105d06:	61                   	popa   
80105d07:	0f a9                	pop    %gs
80105d09:	0f a1                	pop    %fs
80105d0b:	07                   	pop    %es
80105d0c:	1f                   	pop    %ds
80105d0d:	83 c4 08             	add    $0x8,%esp
80105d10:	cf                   	iret   
80105d11:	66 90                	xchg   %ax,%ax
80105d13:	66 90                	xchg   %ax,%ax
80105d15:	66 90                	xchg   %ax,%ax
80105d17:	66 90                	xchg   %ax,%ax
80105d19:	66 90                	xchg   %ax,%ax
80105d1b:	66 90                	xchg   %ax,%ax
80105d1d:	66 90                	xchg   %ax,%ax
80105d1f:	90                   	nop

80105d20 <tvinit>:
80105d20:	55                   	push   %ebp
80105d21:	31 c0                	xor    %eax,%eax
80105d23:	89 e5                	mov    %esp,%ebp
80105d25:	83 ec 08             	sub    $0x8,%esp
80105d28:	90                   	nop
80105d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d30:	8b 14 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%edx
80105d37:	c7 04 c5 82 68 11 80 	movl   $0x8e000008,-0x7fee977e(,%eax,8)
80105d3e:	08 00 00 8e 
80105d42:	66 89 14 c5 80 68 11 	mov    %dx,-0x7fee9780(,%eax,8)
80105d49:	80 
80105d4a:	c1 ea 10             	shr    $0x10,%edx
80105d4d:	66 89 14 c5 86 68 11 	mov    %dx,-0x7fee977a(,%eax,8)
80105d54:	80 
80105d55:	83 c0 01             	add    $0x1,%eax
80105d58:	3d 00 01 00 00       	cmp    $0x100,%eax
80105d5d:	75 d1                	jne    80105d30 <tvinit+0x10>
80105d5f:	a1 08 b1 10 80       	mov    0x8010b108,%eax
80105d64:	83 ec 08             	sub    $0x8,%esp
80105d67:	c7 05 82 6a 11 80 08 	movl   $0xef000008,0x80116a82
80105d6e:	00 00 ef 
80105d71:	68 d9 80 10 80       	push   $0x801080d9
80105d76:	68 40 68 11 80       	push   $0x80116840
80105d7b:	66 a3 80 6a 11 80    	mov    %ax,0x80116a80
80105d81:	c1 e8 10             	shr    $0x10,%eax
80105d84:	66 a3 86 6a 11 80    	mov    %ax,0x80116a86
80105d8a:	e8 11 e9 ff ff       	call   801046a0 <initlock>
80105d8f:	83 c4 10             	add    $0x10,%esp
80105d92:	c9                   	leave  
80105d93:	c3                   	ret    
80105d94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105d9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105da0 <idtinit>:
80105da0:	55                   	push   %ebp
80105da1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105da6:	89 e5                	mov    %esp,%ebp
80105da8:	83 ec 10             	sub    $0x10,%esp
80105dab:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
80105daf:	b8 80 68 11 80       	mov    $0x80116880,%eax
80105db4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105db8:	c1 e8 10             	shr    $0x10,%eax
80105dbb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
80105dbf:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105dc2:	0f 01 18             	lidtl  (%eax)
80105dc5:	c9                   	leave  
80105dc6:	c3                   	ret    
80105dc7:	89 f6                	mov    %esi,%esi
80105dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105dd0 <trap>:
80105dd0:	55                   	push   %ebp
80105dd1:	89 e5                	mov    %esp,%ebp
80105dd3:	57                   	push   %edi
80105dd4:	56                   	push   %esi
80105dd5:	53                   	push   %ebx
80105dd6:	83 ec 1c             	sub    $0x1c,%esp
80105dd9:	8b 7d 08             	mov    0x8(%ebp),%edi
80105ddc:	8b 47 30             	mov    0x30(%edi),%eax
80105ddf:	83 f8 40             	cmp    $0x40,%eax
80105de2:	0f 84 f0 00 00 00    	je     80105ed8 <trap+0x108>
80105de8:	83 e8 20             	sub    $0x20,%eax
80105deb:	83 f8 1f             	cmp    $0x1f,%eax
80105dee:	77 10                	ja     80105e00 <trap+0x30>
80105df0:	ff 24 85 80 81 10 80 	jmp    *-0x7fef7e80(,%eax,4)
80105df7:	89 f6                	mov    %esi,%esi
80105df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105e00:	e8 9b da ff ff       	call   801038a0 <myproc>
80105e05:	85 c0                	test   %eax,%eax
80105e07:	8b 5f 38             	mov    0x38(%edi),%ebx
80105e0a:	0f 84 14 02 00 00    	je     80106024 <trap+0x254>
80105e10:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105e14:	0f 84 0a 02 00 00    	je     80106024 <trap+0x254>
80105e1a:	0f 20 d1             	mov    %cr2,%ecx
80105e1d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105e20:	e8 5b da ff ff       	call   80103880 <cpuid>
80105e25:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105e28:	8b 47 34             	mov    0x34(%edi),%eax
80105e2b:	8b 77 30             	mov    0x30(%edi),%esi
80105e2e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105e31:	e8 6a da ff ff       	call   801038a0 <myproc>
80105e36:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105e39:	e8 62 da ff ff       	call   801038a0 <myproc>
80105e3e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105e41:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105e44:	51                   	push   %ecx
80105e45:	53                   	push   %ebx
80105e46:	52                   	push   %edx
80105e47:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105e4a:	ff 75 e4             	pushl  -0x1c(%ebp)
80105e4d:	56                   	push   %esi
80105e4e:	83 c2 6c             	add    $0x6c,%edx
80105e51:	52                   	push   %edx
80105e52:	ff 70 10             	pushl  0x10(%eax)
80105e55:	68 3c 81 10 80       	push   $0x8010813c
80105e5a:	e8 01 a8 ff ff       	call   80100660 <cprintf>
80105e5f:	83 c4 20             	add    $0x20,%esp
80105e62:	e8 39 da ff ff       	call   801038a0 <myproc>
80105e67:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105e6e:	e8 2d da ff ff       	call   801038a0 <myproc>
80105e73:	85 c0                	test   %eax,%eax
80105e75:	74 1d                	je     80105e94 <trap+0xc4>
80105e77:	e8 24 da ff ff       	call   801038a0 <myproc>
80105e7c:	8b 50 24             	mov    0x24(%eax),%edx
80105e7f:	85 d2                	test   %edx,%edx
80105e81:	74 11                	je     80105e94 <trap+0xc4>
80105e83:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105e87:	83 e0 03             	and    $0x3,%eax
80105e8a:	66 83 f8 03          	cmp    $0x3,%ax
80105e8e:	0f 84 4c 01 00 00    	je     80105fe0 <trap+0x210>
80105e94:	e8 07 da ff ff       	call   801038a0 <myproc>
80105e99:	85 c0                	test   %eax,%eax
80105e9b:	74 0b                	je     80105ea8 <trap+0xd8>
80105e9d:	e8 fe d9 ff ff       	call   801038a0 <myproc>
80105ea2:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105ea6:	74 68                	je     80105f10 <trap+0x140>
80105ea8:	e8 f3 d9 ff ff       	call   801038a0 <myproc>
80105ead:	85 c0                	test   %eax,%eax
80105eaf:	74 19                	je     80105eca <trap+0xfa>
80105eb1:	e8 ea d9 ff ff       	call   801038a0 <myproc>
80105eb6:	8b 40 24             	mov    0x24(%eax),%eax
80105eb9:	85 c0                	test   %eax,%eax
80105ebb:	74 0d                	je     80105eca <trap+0xfa>
80105ebd:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105ec1:	83 e0 03             	and    $0x3,%eax
80105ec4:	66 83 f8 03          	cmp    $0x3,%ax
80105ec8:	74 37                	je     80105f01 <trap+0x131>
80105eca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ecd:	5b                   	pop    %ebx
80105ece:	5e                   	pop    %esi
80105ecf:	5f                   	pop    %edi
80105ed0:	5d                   	pop    %ebp
80105ed1:	c3                   	ret    
80105ed2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105ed8:	e8 c3 d9 ff ff       	call   801038a0 <myproc>
80105edd:	8b 58 24             	mov    0x24(%eax),%ebx
80105ee0:	85 db                	test   %ebx,%ebx
80105ee2:	0f 85 e8 00 00 00    	jne    80105fd0 <trap+0x200>
80105ee8:	e8 b3 d9 ff ff       	call   801038a0 <myproc>
80105eed:	89 78 18             	mov    %edi,0x18(%eax)
80105ef0:	e8 fb ed ff ff       	call   80104cf0 <syscall>
80105ef5:	e8 a6 d9 ff ff       	call   801038a0 <myproc>
80105efa:	8b 48 24             	mov    0x24(%eax),%ecx
80105efd:	85 c9                	test   %ecx,%ecx
80105eff:	74 c9                	je     80105eca <trap+0xfa>
80105f01:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105f04:	5b                   	pop    %ebx
80105f05:	5e                   	pop    %esi
80105f06:	5f                   	pop    %edi
80105f07:	5d                   	pop    %ebp
80105f08:	e9 33 de ff ff       	jmp    80103d40 <exit>
80105f0d:	8d 76 00             	lea    0x0(%esi),%esi
80105f10:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105f14:	75 92                	jne    80105ea8 <trap+0xd8>
80105f16:	e8 55 df ff ff       	call   80103e70 <yield>
80105f1b:	eb 8b                	jmp    80105ea8 <trap+0xd8>
80105f1d:	8d 76 00             	lea    0x0(%esi),%esi
80105f20:	e8 5b d9 ff ff       	call   80103880 <cpuid>
80105f25:	85 c0                	test   %eax,%eax
80105f27:	0f 84 c3 00 00 00    	je     80105ff0 <trap+0x220>
80105f2d:	e8 5e c8 ff ff       	call   80102790 <lapiceoi>
80105f32:	e8 69 d9 ff ff       	call   801038a0 <myproc>
80105f37:	85 c0                	test   %eax,%eax
80105f39:	0f 85 38 ff ff ff    	jne    80105e77 <trap+0xa7>
80105f3f:	e9 50 ff ff ff       	jmp    80105e94 <trap+0xc4>
80105f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105f48:	e8 03 c7 ff ff       	call   80102650 <kbdintr>
80105f4d:	e8 3e c8 ff ff       	call   80102790 <lapiceoi>
80105f52:	e8 49 d9 ff ff       	call   801038a0 <myproc>
80105f57:	85 c0                	test   %eax,%eax
80105f59:	0f 85 18 ff ff ff    	jne    80105e77 <trap+0xa7>
80105f5f:	e9 30 ff ff ff       	jmp    80105e94 <trap+0xc4>
80105f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105f68:	e8 53 02 00 00       	call   801061c0 <uartintr>
80105f6d:	e8 1e c8 ff ff       	call   80102790 <lapiceoi>
80105f72:	e8 29 d9 ff ff       	call   801038a0 <myproc>
80105f77:	85 c0                	test   %eax,%eax
80105f79:	0f 85 f8 fe ff ff    	jne    80105e77 <trap+0xa7>
80105f7f:	e9 10 ff ff ff       	jmp    80105e94 <trap+0xc4>
80105f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105f88:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105f8c:	8b 77 38             	mov    0x38(%edi),%esi
80105f8f:	e8 ec d8 ff ff       	call   80103880 <cpuid>
80105f94:	56                   	push   %esi
80105f95:	53                   	push   %ebx
80105f96:	50                   	push   %eax
80105f97:	68 e4 80 10 80       	push   $0x801080e4
80105f9c:	e8 bf a6 ff ff       	call   80100660 <cprintf>
80105fa1:	e8 ea c7 ff ff       	call   80102790 <lapiceoi>
80105fa6:	83 c4 10             	add    $0x10,%esp
80105fa9:	e8 f2 d8 ff ff       	call   801038a0 <myproc>
80105fae:	85 c0                	test   %eax,%eax
80105fb0:	0f 85 c1 fe ff ff    	jne    80105e77 <trap+0xa7>
80105fb6:	e9 d9 fe ff ff       	jmp    80105e94 <trap+0xc4>
80105fbb:	90                   	nop
80105fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105fc0:	e8 fb c0 ff ff       	call   801020c0 <ideintr>
80105fc5:	e9 63 ff ff ff       	jmp    80105f2d <trap+0x15d>
80105fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105fd0:	e8 6b dd ff ff       	call   80103d40 <exit>
80105fd5:	e9 0e ff ff ff       	jmp    80105ee8 <trap+0x118>
80105fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105fe0:	e8 5b dd ff ff       	call   80103d40 <exit>
80105fe5:	e9 aa fe ff ff       	jmp    80105e94 <trap+0xc4>
80105fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105ff0:	83 ec 0c             	sub    $0xc,%esp
80105ff3:	68 40 68 11 80       	push   $0x80116840
80105ff8:	e8 e3 e7 ff ff       	call   801047e0 <acquire>
80105ffd:	c7 04 24 80 70 11 80 	movl   $0x80117080,(%esp)
80106004:	83 05 80 70 11 80 01 	addl   $0x1,0x80117080
8010600b:	e8 70 e0 ff ff       	call   80104080 <wakeup>
80106010:	c7 04 24 40 68 11 80 	movl   $0x80116840,(%esp)
80106017:	e8 84 e8 ff ff       	call   801048a0 <release>
8010601c:	83 c4 10             	add    $0x10,%esp
8010601f:	e9 09 ff ff ff       	jmp    80105f2d <trap+0x15d>
80106024:	0f 20 d6             	mov    %cr2,%esi
80106027:	e8 54 d8 ff ff       	call   80103880 <cpuid>
8010602c:	83 ec 0c             	sub    $0xc,%esp
8010602f:	56                   	push   %esi
80106030:	53                   	push   %ebx
80106031:	50                   	push   %eax
80106032:	ff 77 30             	pushl  0x30(%edi)
80106035:	68 08 81 10 80       	push   $0x80108108
8010603a:	e8 21 a6 ff ff       	call   80100660 <cprintf>
8010603f:	83 c4 14             	add    $0x14,%esp
80106042:	68 de 80 10 80       	push   $0x801080de
80106047:	e8 44 a3 ff ff       	call   80100390 <panic>
8010604c:	66 90                	xchg   %ax,%ax
8010604e:	66 90                	xchg   %ax,%ax

80106050 <uartgetc>:
80106050:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
80106055:	55                   	push   %ebp
80106056:	89 e5                	mov    %esp,%ebp
80106058:	85 c0                	test   %eax,%eax
8010605a:	74 1c                	je     80106078 <uartgetc+0x28>
8010605c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106061:	ec                   	in     (%dx),%al
80106062:	a8 01                	test   $0x1,%al
80106064:	74 12                	je     80106078 <uartgetc+0x28>
80106066:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010606b:	ec                   	in     (%dx),%al
8010606c:	0f b6 c0             	movzbl %al,%eax
8010606f:	5d                   	pop    %ebp
80106070:	c3                   	ret    
80106071:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106078:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010607d:	5d                   	pop    %ebp
8010607e:	c3                   	ret    
8010607f:	90                   	nop

80106080 <uartputc.part.0>:
80106080:	55                   	push   %ebp
80106081:	89 e5                	mov    %esp,%ebp
80106083:	57                   	push   %edi
80106084:	56                   	push   %esi
80106085:	53                   	push   %ebx
80106086:	89 c7                	mov    %eax,%edi
80106088:	bb 80 00 00 00       	mov    $0x80,%ebx
8010608d:	be fd 03 00 00       	mov    $0x3fd,%esi
80106092:	83 ec 0c             	sub    $0xc,%esp
80106095:	eb 1b                	jmp    801060b2 <uartputc.part.0+0x32>
80106097:	89 f6                	mov    %esi,%esi
80106099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801060a0:	83 ec 0c             	sub    $0xc,%esp
801060a3:	6a 0a                	push   $0xa
801060a5:	e8 06 c7 ff ff       	call   801027b0 <microdelay>
801060aa:	83 c4 10             	add    $0x10,%esp
801060ad:	83 eb 01             	sub    $0x1,%ebx
801060b0:	74 07                	je     801060b9 <uartputc.part.0+0x39>
801060b2:	89 f2                	mov    %esi,%edx
801060b4:	ec                   	in     (%dx),%al
801060b5:	a8 20                	test   $0x20,%al
801060b7:	74 e7                	je     801060a0 <uartputc.part.0+0x20>
801060b9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801060be:	89 f8                	mov    %edi,%eax
801060c0:	ee                   	out    %al,(%dx)
801060c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801060c4:	5b                   	pop    %ebx
801060c5:	5e                   	pop    %esi
801060c6:	5f                   	pop    %edi
801060c7:	5d                   	pop    %ebp
801060c8:	c3                   	ret    
801060c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801060d0 <uartinit>:
801060d0:	55                   	push   %ebp
801060d1:	31 c9                	xor    %ecx,%ecx
801060d3:	89 c8                	mov    %ecx,%eax
801060d5:	89 e5                	mov    %esp,%ebp
801060d7:	57                   	push   %edi
801060d8:	56                   	push   %esi
801060d9:	53                   	push   %ebx
801060da:	bb fa 03 00 00       	mov    $0x3fa,%ebx
801060df:	89 da                	mov    %ebx,%edx
801060e1:	83 ec 0c             	sub    $0xc,%esp
801060e4:	ee                   	out    %al,(%dx)
801060e5:	bf fb 03 00 00       	mov    $0x3fb,%edi
801060ea:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801060ef:	89 fa                	mov    %edi,%edx
801060f1:	ee                   	out    %al,(%dx)
801060f2:	b8 0c 00 00 00       	mov    $0xc,%eax
801060f7:	ba f8 03 00 00       	mov    $0x3f8,%edx
801060fc:	ee                   	out    %al,(%dx)
801060fd:	be f9 03 00 00       	mov    $0x3f9,%esi
80106102:	89 c8                	mov    %ecx,%eax
80106104:	89 f2                	mov    %esi,%edx
80106106:	ee                   	out    %al,(%dx)
80106107:	b8 03 00 00 00       	mov    $0x3,%eax
8010610c:	89 fa                	mov    %edi,%edx
8010610e:	ee                   	out    %al,(%dx)
8010610f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80106114:	89 c8                	mov    %ecx,%eax
80106116:	ee                   	out    %al,(%dx)
80106117:	b8 01 00 00 00       	mov    $0x1,%eax
8010611c:	89 f2                	mov    %esi,%edx
8010611e:	ee                   	out    %al,(%dx)
8010611f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106124:	ec                   	in     (%dx),%al
80106125:	3c ff                	cmp    $0xff,%al
80106127:	74 5a                	je     80106183 <uartinit+0xb3>
80106129:	c7 05 c0 b5 10 80 01 	movl   $0x1,0x8010b5c0
80106130:	00 00 00 
80106133:	89 da                	mov    %ebx,%edx
80106135:	ec                   	in     (%dx),%al
80106136:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010613b:	ec                   	in     (%dx),%al
8010613c:	83 ec 08             	sub    $0x8,%esp
8010613f:	bb 00 82 10 80       	mov    $0x80108200,%ebx
80106144:	6a 00                	push   $0x0
80106146:	6a 04                	push   $0x4
80106148:	e8 c3 c1 ff ff       	call   80102310 <ioapicenable>
8010614d:	83 c4 10             	add    $0x10,%esp
80106150:	b8 78 00 00 00       	mov    $0x78,%eax
80106155:	eb 13                	jmp    8010616a <uartinit+0x9a>
80106157:	89 f6                	mov    %esi,%esi
80106159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106160:	83 c3 01             	add    $0x1,%ebx
80106163:	0f be 03             	movsbl (%ebx),%eax
80106166:	84 c0                	test   %al,%al
80106168:	74 19                	je     80106183 <uartinit+0xb3>
8010616a:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
80106170:	85 d2                	test   %edx,%edx
80106172:	74 ec                	je     80106160 <uartinit+0x90>
80106174:	83 c3 01             	add    $0x1,%ebx
80106177:	e8 04 ff ff ff       	call   80106080 <uartputc.part.0>
8010617c:	0f be 03             	movsbl (%ebx),%eax
8010617f:	84 c0                	test   %al,%al
80106181:	75 e7                	jne    8010616a <uartinit+0x9a>
80106183:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106186:	5b                   	pop    %ebx
80106187:	5e                   	pop    %esi
80106188:	5f                   	pop    %edi
80106189:	5d                   	pop    %ebp
8010618a:	c3                   	ret    
8010618b:	90                   	nop
8010618c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106190 <uartputc>:
80106190:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
80106196:	55                   	push   %ebp
80106197:	89 e5                	mov    %esp,%ebp
80106199:	85 d2                	test   %edx,%edx
8010619b:	8b 45 08             	mov    0x8(%ebp),%eax
8010619e:	74 10                	je     801061b0 <uartputc+0x20>
801061a0:	5d                   	pop    %ebp
801061a1:	e9 da fe ff ff       	jmp    80106080 <uartputc.part.0>
801061a6:	8d 76 00             	lea    0x0(%esi),%esi
801061a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801061b0:	5d                   	pop    %ebp
801061b1:	c3                   	ret    
801061b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801061b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801061c0 <uartintr>:
801061c0:	55                   	push   %ebp
801061c1:	89 e5                	mov    %esp,%ebp
801061c3:	83 ec 14             	sub    $0x14,%esp
801061c6:	68 50 60 10 80       	push   $0x80106050
801061cb:	e8 80 a6 ff ff       	call   80100850 <consoleintr>
801061d0:	83 c4 10             	add    $0x10,%esp
801061d3:	c9                   	leave  
801061d4:	c3                   	ret    

801061d5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
801061d5:	6a 00                	push   $0x0
  pushl $0
801061d7:	6a 00                	push   $0x0
  jmp alltraps
801061d9:	e9 10 fb ff ff       	jmp    80105cee <alltraps>

801061de <vector1>:
.globl vector1
vector1:
  pushl $0
801061de:	6a 00                	push   $0x0
  pushl $1
801061e0:	6a 01                	push   $0x1
  jmp alltraps
801061e2:	e9 07 fb ff ff       	jmp    80105cee <alltraps>

801061e7 <vector2>:
.globl vector2
vector2:
  pushl $0
801061e7:	6a 00                	push   $0x0
  pushl $2
801061e9:	6a 02                	push   $0x2
  jmp alltraps
801061eb:	e9 fe fa ff ff       	jmp    80105cee <alltraps>

801061f0 <vector3>:
.globl vector3
vector3:
  pushl $0
801061f0:	6a 00                	push   $0x0
  pushl $3
801061f2:	6a 03                	push   $0x3
  jmp alltraps
801061f4:	e9 f5 fa ff ff       	jmp    80105cee <alltraps>

801061f9 <vector4>:
.globl vector4
vector4:
  pushl $0
801061f9:	6a 00                	push   $0x0
  pushl $4
801061fb:	6a 04                	push   $0x4
  jmp alltraps
801061fd:	e9 ec fa ff ff       	jmp    80105cee <alltraps>

80106202 <vector5>:
.globl vector5
vector5:
  pushl $0
80106202:	6a 00                	push   $0x0
  pushl $5
80106204:	6a 05                	push   $0x5
  jmp alltraps
80106206:	e9 e3 fa ff ff       	jmp    80105cee <alltraps>

8010620b <vector6>:
.globl vector6
vector6:
  pushl $0
8010620b:	6a 00                	push   $0x0
  pushl $6
8010620d:	6a 06                	push   $0x6
  jmp alltraps
8010620f:	e9 da fa ff ff       	jmp    80105cee <alltraps>

80106214 <vector7>:
.globl vector7
vector7:
  pushl $0
80106214:	6a 00                	push   $0x0
  pushl $7
80106216:	6a 07                	push   $0x7
  jmp alltraps
80106218:	e9 d1 fa ff ff       	jmp    80105cee <alltraps>

8010621d <vector8>:
.globl vector8
vector8:
  pushl $8
8010621d:	6a 08                	push   $0x8
  jmp alltraps
8010621f:	e9 ca fa ff ff       	jmp    80105cee <alltraps>

80106224 <vector9>:
.globl vector9
vector9:
  pushl $0
80106224:	6a 00                	push   $0x0
  pushl $9
80106226:	6a 09                	push   $0x9
  jmp alltraps
80106228:	e9 c1 fa ff ff       	jmp    80105cee <alltraps>

8010622d <vector10>:
.globl vector10
vector10:
  pushl $10
8010622d:	6a 0a                	push   $0xa
  jmp alltraps
8010622f:	e9 ba fa ff ff       	jmp    80105cee <alltraps>

80106234 <vector11>:
.globl vector11
vector11:
  pushl $11
80106234:	6a 0b                	push   $0xb
  jmp alltraps
80106236:	e9 b3 fa ff ff       	jmp    80105cee <alltraps>

8010623b <vector12>:
.globl vector12
vector12:
  pushl $12
8010623b:	6a 0c                	push   $0xc
  jmp alltraps
8010623d:	e9 ac fa ff ff       	jmp    80105cee <alltraps>

80106242 <vector13>:
.globl vector13
vector13:
  pushl $13
80106242:	6a 0d                	push   $0xd
  jmp alltraps
80106244:	e9 a5 fa ff ff       	jmp    80105cee <alltraps>

80106249 <vector14>:
.globl vector14
vector14:
  pushl $14
80106249:	6a 0e                	push   $0xe
  jmp alltraps
8010624b:	e9 9e fa ff ff       	jmp    80105cee <alltraps>

80106250 <vector15>:
.globl vector15
vector15:
  pushl $0
80106250:	6a 00                	push   $0x0
  pushl $15
80106252:	6a 0f                	push   $0xf
  jmp alltraps
80106254:	e9 95 fa ff ff       	jmp    80105cee <alltraps>

80106259 <vector16>:
.globl vector16
vector16:
  pushl $0
80106259:	6a 00                	push   $0x0
  pushl $16
8010625b:	6a 10                	push   $0x10
  jmp alltraps
8010625d:	e9 8c fa ff ff       	jmp    80105cee <alltraps>

80106262 <vector17>:
.globl vector17
vector17:
  pushl $17
80106262:	6a 11                	push   $0x11
  jmp alltraps
80106264:	e9 85 fa ff ff       	jmp    80105cee <alltraps>

80106269 <vector18>:
.globl vector18
vector18:
  pushl $0
80106269:	6a 00                	push   $0x0
  pushl $18
8010626b:	6a 12                	push   $0x12
  jmp alltraps
8010626d:	e9 7c fa ff ff       	jmp    80105cee <alltraps>

80106272 <vector19>:
.globl vector19
vector19:
  pushl $0
80106272:	6a 00                	push   $0x0
  pushl $19
80106274:	6a 13                	push   $0x13
  jmp alltraps
80106276:	e9 73 fa ff ff       	jmp    80105cee <alltraps>

8010627b <vector20>:
.globl vector20
vector20:
  pushl $0
8010627b:	6a 00                	push   $0x0
  pushl $20
8010627d:	6a 14                	push   $0x14
  jmp alltraps
8010627f:	e9 6a fa ff ff       	jmp    80105cee <alltraps>

80106284 <vector21>:
.globl vector21
vector21:
  pushl $0
80106284:	6a 00                	push   $0x0
  pushl $21
80106286:	6a 15                	push   $0x15
  jmp alltraps
80106288:	e9 61 fa ff ff       	jmp    80105cee <alltraps>

8010628d <vector22>:
.globl vector22
vector22:
  pushl $0
8010628d:	6a 00                	push   $0x0
  pushl $22
8010628f:	6a 16                	push   $0x16
  jmp alltraps
80106291:	e9 58 fa ff ff       	jmp    80105cee <alltraps>

80106296 <vector23>:
.globl vector23
vector23:
  pushl $0
80106296:	6a 00                	push   $0x0
  pushl $23
80106298:	6a 17                	push   $0x17
  jmp alltraps
8010629a:	e9 4f fa ff ff       	jmp    80105cee <alltraps>

8010629f <vector24>:
.globl vector24
vector24:
  pushl $0
8010629f:	6a 00                	push   $0x0
  pushl $24
801062a1:	6a 18                	push   $0x18
  jmp alltraps
801062a3:	e9 46 fa ff ff       	jmp    80105cee <alltraps>

801062a8 <vector25>:
.globl vector25
vector25:
  pushl $0
801062a8:	6a 00                	push   $0x0
  pushl $25
801062aa:	6a 19                	push   $0x19
  jmp alltraps
801062ac:	e9 3d fa ff ff       	jmp    80105cee <alltraps>

801062b1 <vector26>:
.globl vector26
vector26:
  pushl $0
801062b1:	6a 00                	push   $0x0
  pushl $26
801062b3:	6a 1a                	push   $0x1a
  jmp alltraps
801062b5:	e9 34 fa ff ff       	jmp    80105cee <alltraps>

801062ba <vector27>:
.globl vector27
vector27:
  pushl $0
801062ba:	6a 00                	push   $0x0
  pushl $27
801062bc:	6a 1b                	push   $0x1b
  jmp alltraps
801062be:	e9 2b fa ff ff       	jmp    80105cee <alltraps>

801062c3 <vector28>:
.globl vector28
vector28:
  pushl $0
801062c3:	6a 00                	push   $0x0
  pushl $28
801062c5:	6a 1c                	push   $0x1c
  jmp alltraps
801062c7:	e9 22 fa ff ff       	jmp    80105cee <alltraps>

801062cc <vector29>:
.globl vector29
vector29:
  pushl $0
801062cc:	6a 00                	push   $0x0
  pushl $29
801062ce:	6a 1d                	push   $0x1d
  jmp alltraps
801062d0:	e9 19 fa ff ff       	jmp    80105cee <alltraps>

801062d5 <vector30>:
.globl vector30
vector30:
  pushl $0
801062d5:	6a 00                	push   $0x0
  pushl $30
801062d7:	6a 1e                	push   $0x1e
  jmp alltraps
801062d9:	e9 10 fa ff ff       	jmp    80105cee <alltraps>

801062de <vector31>:
.globl vector31
vector31:
  pushl $0
801062de:	6a 00                	push   $0x0
  pushl $31
801062e0:	6a 1f                	push   $0x1f
  jmp alltraps
801062e2:	e9 07 fa ff ff       	jmp    80105cee <alltraps>

801062e7 <vector32>:
.globl vector32
vector32:
  pushl $0
801062e7:	6a 00                	push   $0x0
  pushl $32
801062e9:	6a 20                	push   $0x20
  jmp alltraps
801062eb:	e9 fe f9 ff ff       	jmp    80105cee <alltraps>

801062f0 <vector33>:
.globl vector33
vector33:
  pushl $0
801062f0:	6a 00                	push   $0x0
  pushl $33
801062f2:	6a 21                	push   $0x21
  jmp alltraps
801062f4:	e9 f5 f9 ff ff       	jmp    80105cee <alltraps>

801062f9 <vector34>:
.globl vector34
vector34:
  pushl $0
801062f9:	6a 00                	push   $0x0
  pushl $34
801062fb:	6a 22                	push   $0x22
  jmp alltraps
801062fd:	e9 ec f9 ff ff       	jmp    80105cee <alltraps>

80106302 <vector35>:
.globl vector35
vector35:
  pushl $0
80106302:	6a 00                	push   $0x0
  pushl $35
80106304:	6a 23                	push   $0x23
  jmp alltraps
80106306:	e9 e3 f9 ff ff       	jmp    80105cee <alltraps>

8010630b <vector36>:
.globl vector36
vector36:
  pushl $0
8010630b:	6a 00                	push   $0x0
  pushl $36
8010630d:	6a 24                	push   $0x24
  jmp alltraps
8010630f:	e9 da f9 ff ff       	jmp    80105cee <alltraps>

80106314 <vector37>:
.globl vector37
vector37:
  pushl $0
80106314:	6a 00                	push   $0x0
  pushl $37
80106316:	6a 25                	push   $0x25
  jmp alltraps
80106318:	e9 d1 f9 ff ff       	jmp    80105cee <alltraps>

8010631d <vector38>:
.globl vector38
vector38:
  pushl $0
8010631d:	6a 00                	push   $0x0
  pushl $38
8010631f:	6a 26                	push   $0x26
  jmp alltraps
80106321:	e9 c8 f9 ff ff       	jmp    80105cee <alltraps>

80106326 <vector39>:
.globl vector39
vector39:
  pushl $0
80106326:	6a 00                	push   $0x0
  pushl $39
80106328:	6a 27                	push   $0x27
  jmp alltraps
8010632a:	e9 bf f9 ff ff       	jmp    80105cee <alltraps>

8010632f <vector40>:
.globl vector40
vector40:
  pushl $0
8010632f:	6a 00                	push   $0x0
  pushl $40
80106331:	6a 28                	push   $0x28
  jmp alltraps
80106333:	e9 b6 f9 ff ff       	jmp    80105cee <alltraps>

80106338 <vector41>:
.globl vector41
vector41:
  pushl $0
80106338:	6a 00                	push   $0x0
  pushl $41
8010633a:	6a 29                	push   $0x29
  jmp alltraps
8010633c:	e9 ad f9 ff ff       	jmp    80105cee <alltraps>

80106341 <vector42>:
.globl vector42
vector42:
  pushl $0
80106341:	6a 00                	push   $0x0
  pushl $42
80106343:	6a 2a                	push   $0x2a
  jmp alltraps
80106345:	e9 a4 f9 ff ff       	jmp    80105cee <alltraps>

8010634a <vector43>:
.globl vector43
vector43:
  pushl $0
8010634a:	6a 00                	push   $0x0
  pushl $43
8010634c:	6a 2b                	push   $0x2b
  jmp alltraps
8010634e:	e9 9b f9 ff ff       	jmp    80105cee <alltraps>

80106353 <vector44>:
.globl vector44
vector44:
  pushl $0
80106353:	6a 00                	push   $0x0
  pushl $44
80106355:	6a 2c                	push   $0x2c
  jmp alltraps
80106357:	e9 92 f9 ff ff       	jmp    80105cee <alltraps>

8010635c <vector45>:
.globl vector45
vector45:
  pushl $0
8010635c:	6a 00                	push   $0x0
  pushl $45
8010635e:	6a 2d                	push   $0x2d
  jmp alltraps
80106360:	e9 89 f9 ff ff       	jmp    80105cee <alltraps>

80106365 <vector46>:
.globl vector46
vector46:
  pushl $0
80106365:	6a 00                	push   $0x0
  pushl $46
80106367:	6a 2e                	push   $0x2e
  jmp alltraps
80106369:	e9 80 f9 ff ff       	jmp    80105cee <alltraps>

8010636e <vector47>:
.globl vector47
vector47:
  pushl $0
8010636e:	6a 00                	push   $0x0
  pushl $47
80106370:	6a 2f                	push   $0x2f
  jmp alltraps
80106372:	e9 77 f9 ff ff       	jmp    80105cee <alltraps>

80106377 <vector48>:
.globl vector48
vector48:
  pushl $0
80106377:	6a 00                	push   $0x0
  pushl $48
80106379:	6a 30                	push   $0x30
  jmp alltraps
8010637b:	e9 6e f9 ff ff       	jmp    80105cee <alltraps>

80106380 <vector49>:
.globl vector49
vector49:
  pushl $0
80106380:	6a 00                	push   $0x0
  pushl $49
80106382:	6a 31                	push   $0x31
  jmp alltraps
80106384:	e9 65 f9 ff ff       	jmp    80105cee <alltraps>

80106389 <vector50>:
.globl vector50
vector50:
  pushl $0
80106389:	6a 00                	push   $0x0
  pushl $50
8010638b:	6a 32                	push   $0x32
  jmp alltraps
8010638d:	e9 5c f9 ff ff       	jmp    80105cee <alltraps>

80106392 <vector51>:
.globl vector51
vector51:
  pushl $0
80106392:	6a 00                	push   $0x0
  pushl $51
80106394:	6a 33                	push   $0x33
  jmp alltraps
80106396:	e9 53 f9 ff ff       	jmp    80105cee <alltraps>

8010639b <vector52>:
.globl vector52
vector52:
  pushl $0
8010639b:	6a 00                	push   $0x0
  pushl $52
8010639d:	6a 34                	push   $0x34
  jmp alltraps
8010639f:	e9 4a f9 ff ff       	jmp    80105cee <alltraps>

801063a4 <vector53>:
.globl vector53
vector53:
  pushl $0
801063a4:	6a 00                	push   $0x0
  pushl $53
801063a6:	6a 35                	push   $0x35
  jmp alltraps
801063a8:	e9 41 f9 ff ff       	jmp    80105cee <alltraps>

801063ad <vector54>:
.globl vector54
vector54:
  pushl $0
801063ad:	6a 00                	push   $0x0
  pushl $54
801063af:	6a 36                	push   $0x36
  jmp alltraps
801063b1:	e9 38 f9 ff ff       	jmp    80105cee <alltraps>

801063b6 <vector55>:
.globl vector55
vector55:
  pushl $0
801063b6:	6a 00                	push   $0x0
  pushl $55
801063b8:	6a 37                	push   $0x37
  jmp alltraps
801063ba:	e9 2f f9 ff ff       	jmp    80105cee <alltraps>

801063bf <vector56>:
.globl vector56
vector56:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $56
801063c1:	6a 38                	push   $0x38
  jmp alltraps
801063c3:	e9 26 f9 ff ff       	jmp    80105cee <alltraps>

801063c8 <vector57>:
.globl vector57
vector57:
  pushl $0
801063c8:	6a 00                	push   $0x0
  pushl $57
801063ca:	6a 39                	push   $0x39
  jmp alltraps
801063cc:	e9 1d f9 ff ff       	jmp    80105cee <alltraps>

801063d1 <vector58>:
.globl vector58
vector58:
  pushl $0
801063d1:	6a 00                	push   $0x0
  pushl $58
801063d3:	6a 3a                	push   $0x3a
  jmp alltraps
801063d5:	e9 14 f9 ff ff       	jmp    80105cee <alltraps>

801063da <vector59>:
.globl vector59
vector59:
  pushl $0
801063da:	6a 00                	push   $0x0
  pushl $59
801063dc:	6a 3b                	push   $0x3b
  jmp alltraps
801063de:	e9 0b f9 ff ff       	jmp    80105cee <alltraps>

801063e3 <vector60>:
.globl vector60
vector60:
  pushl $0
801063e3:	6a 00                	push   $0x0
  pushl $60
801063e5:	6a 3c                	push   $0x3c
  jmp alltraps
801063e7:	e9 02 f9 ff ff       	jmp    80105cee <alltraps>

801063ec <vector61>:
.globl vector61
vector61:
  pushl $0
801063ec:	6a 00                	push   $0x0
  pushl $61
801063ee:	6a 3d                	push   $0x3d
  jmp alltraps
801063f0:	e9 f9 f8 ff ff       	jmp    80105cee <alltraps>

801063f5 <vector62>:
.globl vector62
vector62:
  pushl $0
801063f5:	6a 00                	push   $0x0
  pushl $62
801063f7:	6a 3e                	push   $0x3e
  jmp alltraps
801063f9:	e9 f0 f8 ff ff       	jmp    80105cee <alltraps>

801063fe <vector63>:
.globl vector63
vector63:
  pushl $0
801063fe:	6a 00                	push   $0x0
  pushl $63
80106400:	6a 3f                	push   $0x3f
  jmp alltraps
80106402:	e9 e7 f8 ff ff       	jmp    80105cee <alltraps>

80106407 <vector64>:
.globl vector64
vector64:
  pushl $0
80106407:	6a 00                	push   $0x0
  pushl $64
80106409:	6a 40                	push   $0x40
  jmp alltraps
8010640b:	e9 de f8 ff ff       	jmp    80105cee <alltraps>

80106410 <vector65>:
.globl vector65
vector65:
  pushl $0
80106410:	6a 00                	push   $0x0
  pushl $65
80106412:	6a 41                	push   $0x41
  jmp alltraps
80106414:	e9 d5 f8 ff ff       	jmp    80105cee <alltraps>

80106419 <vector66>:
.globl vector66
vector66:
  pushl $0
80106419:	6a 00                	push   $0x0
  pushl $66
8010641b:	6a 42                	push   $0x42
  jmp alltraps
8010641d:	e9 cc f8 ff ff       	jmp    80105cee <alltraps>

80106422 <vector67>:
.globl vector67
vector67:
  pushl $0
80106422:	6a 00                	push   $0x0
  pushl $67
80106424:	6a 43                	push   $0x43
  jmp alltraps
80106426:	e9 c3 f8 ff ff       	jmp    80105cee <alltraps>

8010642b <vector68>:
.globl vector68
vector68:
  pushl $0
8010642b:	6a 00                	push   $0x0
  pushl $68
8010642d:	6a 44                	push   $0x44
  jmp alltraps
8010642f:	e9 ba f8 ff ff       	jmp    80105cee <alltraps>

80106434 <vector69>:
.globl vector69
vector69:
  pushl $0
80106434:	6a 00                	push   $0x0
  pushl $69
80106436:	6a 45                	push   $0x45
  jmp alltraps
80106438:	e9 b1 f8 ff ff       	jmp    80105cee <alltraps>

8010643d <vector70>:
.globl vector70
vector70:
  pushl $0
8010643d:	6a 00                	push   $0x0
  pushl $70
8010643f:	6a 46                	push   $0x46
  jmp alltraps
80106441:	e9 a8 f8 ff ff       	jmp    80105cee <alltraps>

80106446 <vector71>:
.globl vector71
vector71:
  pushl $0
80106446:	6a 00                	push   $0x0
  pushl $71
80106448:	6a 47                	push   $0x47
  jmp alltraps
8010644a:	e9 9f f8 ff ff       	jmp    80105cee <alltraps>

8010644f <vector72>:
.globl vector72
vector72:
  pushl $0
8010644f:	6a 00                	push   $0x0
  pushl $72
80106451:	6a 48                	push   $0x48
  jmp alltraps
80106453:	e9 96 f8 ff ff       	jmp    80105cee <alltraps>

80106458 <vector73>:
.globl vector73
vector73:
  pushl $0
80106458:	6a 00                	push   $0x0
  pushl $73
8010645a:	6a 49                	push   $0x49
  jmp alltraps
8010645c:	e9 8d f8 ff ff       	jmp    80105cee <alltraps>

80106461 <vector74>:
.globl vector74
vector74:
  pushl $0
80106461:	6a 00                	push   $0x0
  pushl $74
80106463:	6a 4a                	push   $0x4a
  jmp alltraps
80106465:	e9 84 f8 ff ff       	jmp    80105cee <alltraps>

8010646a <vector75>:
.globl vector75
vector75:
  pushl $0
8010646a:	6a 00                	push   $0x0
  pushl $75
8010646c:	6a 4b                	push   $0x4b
  jmp alltraps
8010646e:	e9 7b f8 ff ff       	jmp    80105cee <alltraps>

80106473 <vector76>:
.globl vector76
vector76:
  pushl $0
80106473:	6a 00                	push   $0x0
  pushl $76
80106475:	6a 4c                	push   $0x4c
  jmp alltraps
80106477:	e9 72 f8 ff ff       	jmp    80105cee <alltraps>

8010647c <vector77>:
.globl vector77
vector77:
  pushl $0
8010647c:	6a 00                	push   $0x0
  pushl $77
8010647e:	6a 4d                	push   $0x4d
  jmp alltraps
80106480:	e9 69 f8 ff ff       	jmp    80105cee <alltraps>

80106485 <vector78>:
.globl vector78
vector78:
  pushl $0
80106485:	6a 00                	push   $0x0
  pushl $78
80106487:	6a 4e                	push   $0x4e
  jmp alltraps
80106489:	e9 60 f8 ff ff       	jmp    80105cee <alltraps>

8010648e <vector79>:
.globl vector79
vector79:
  pushl $0
8010648e:	6a 00                	push   $0x0
  pushl $79
80106490:	6a 4f                	push   $0x4f
  jmp alltraps
80106492:	e9 57 f8 ff ff       	jmp    80105cee <alltraps>

80106497 <vector80>:
.globl vector80
vector80:
  pushl $0
80106497:	6a 00                	push   $0x0
  pushl $80
80106499:	6a 50                	push   $0x50
  jmp alltraps
8010649b:	e9 4e f8 ff ff       	jmp    80105cee <alltraps>

801064a0 <vector81>:
.globl vector81
vector81:
  pushl $0
801064a0:	6a 00                	push   $0x0
  pushl $81
801064a2:	6a 51                	push   $0x51
  jmp alltraps
801064a4:	e9 45 f8 ff ff       	jmp    80105cee <alltraps>

801064a9 <vector82>:
.globl vector82
vector82:
  pushl $0
801064a9:	6a 00                	push   $0x0
  pushl $82
801064ab:	6a 52                	push   $0x52
  jmp alltraps
801064ad:	e9 3c f8 ff ff       	jmp    80105cee <alltraps>

801064b2 <vector83>:
.globl vector83
vector83:
  pushl $0
801064b2:	6a 00                	push   $0x0
  pushl $83
801064b4:	6a 53                	push   $0x53
  jmp alltraps
801064b6:	e9 33 f8 ff ff       	jmp    80105cee <alltraps>

801064bb <vector84>:
.globl vector84
vector84:
  pushl $0
801064bb:	6a 00                	push   $0x0
  pushl $84
801064bd:	6a 54                	push   $0x54
  jmp alltraps
801064bf:	e9 2a f8 ff ff       	jmp    80105cee <alltraps>

801064c4 <vector85>:
.globl vector85
vector85:
  pushl $0
801064c4:	6a 00                	push   $0x0
  pushl $85
801064c6:	6a 55                	push   $0x55
  jmp alltraps
801064c8:	e9 21 f8 ff ff       	jmp    80105cee <alltraps>

801064cd <vector86>:
.globl vector86
vector86:
  pushl $0
801064cd:	6a 00                	push   $0x0
  pushl $86
801064cf:	6a 56                	push   $0x56
  jmp alltraps
801064d1:	e9 18 f8 ff ff       	jmp    80105cee <alltraps>

801064d6 <vector87>:
.globl vector87
vector87:
  pushl $0
801064d6:	6a 00                	push   $0x0
  pushl $87
801064d8:	6a 57                	push   $0x57
  jmp alltraps
801064da:	e9 0f f8 ff ff       	jmp    80105cee <alltraps>

801064df <vector88>:
.globl vector88
vector88:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $88
801064e1:	6a 58                	push   $0x58
  jmp alltraps
801064e3:	e9 06 f8 ff ff       	jmp    80105cee <alltraps>

801064e8 <vector89>:
.globl vector89
vector89:
  pushl $0
801064e8:	6a 00                	push   $0x0
  pushl $89
801064ea:	6a 59                	push   $0x59
  jmp alltraps
801064ec:	e9 fd f7 ff ff       	jmp    80105cee <alltraps>

801064f1 <vector90>:
.globl vector90
vector90:
  pushl $0
801064f1:	6a 00                	push   $0x0
  pushl $90
801064f3:	6a 5a                	push   $0x5a
  jmp alltraps
801064f5:	e9 f4 f7 ff ff       	jmp    80105cee <alltraps>

801064fa <vector91>:
.globl vector91
vector91:
  pushl $0
801064fa:	6a 00                	push   $0x0
  pushl $91
801064fc:	6a 5b                	push   $0x5b
  jmp alltraps
801064fe:	e9 eb f7 ff ff       	jmp    80105cee <alltraps>

80106503 <vector92>:
.globl vector92
vector92:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $92
80106505:	6a 5c                	push   $0x5c
  jmp alltraps
80106507:	e9 e2 f7 ff ff       	jmp    80105cee <alltraps>

8010650c <vector93>:
.globl vector93
vector93:
  pushl $0
8010650c:	6a 00                	push   $0x0
  pushl $93
8010650e:	6a 5d                	push   $0x5d
  jmp alltraps
80106510:	e9 d9 f7 ff ff       	jmp    80105cee <alltraps>

80106515 <vector94>:
.globl vector94
vector94:
  pushl $0
80106515:	6a 00                	push   $0x0
  pushl $94
80106517:	6a 5e                	push   $0x5e
  jmp alltraps
80106519:	e9 d0 f7 ff ff       	jmp    80105cee <alltraps>

8010651e <vector95>:
.globl vector95
vector95:
  pushl $0
8010651e:	6a 00                	push   $0x0
  pushl $95
80106520:	6a 5f                	push   $0x5f
  jmp alltraps
80106522:	e9 c7 f7 ff ff       	jmp    80105cee <alltraps>

80106527 <vector96>:
.globl vector96
vector96:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $96
80106529:	6a 60                	push   $0x60
  jmp alltraps
8010652b:	e9 be f7 ff ff       	jmp    80105cee <alltraps>

80106530 <vector97>:
.globl vector97
vector97:
  pushl $0
80106530:	6a 00                	push   $0x0
  pushl $97
80106532:	6a 61                	push   $0x61
  jmp alltraps
80106534:	e9 b5 f7 ff ff       	jmp    80105cee <alltraps>

80106539 <vector98>:
.globl vector98
vector98:
  pushl $0
80106539:	6a 00                	push   $0x0
  pushl $98
8010653b:	6a 62                	push   $0x62
  jmp alltraps
8010653d:	e9 ac f7 ff ff       	jmp    80105cee <alltraps>

80106542 <vector99>:
.globl vector99
vector99:
  pushl $0
80106542:	6a 00                	push   $0x0
  pushl $99
80106544:	6a 63                	push   $0x63
  jmp alltraps
80106546:	e9 a3 f7 ff ff       	jmp    80105cee <alltraps>

8010654b <vector100>:
.globl vector100
vector100:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $100
8010654d:	6a 64                	push   $0x64
  jmp alltraps
8010654f:	e9 9a f7 ff ff       	jmp    80105cee <alltraps>

80106554 <vector101>:
.globl vector101
vector101:
  pushl $0
80106554:	6a 00                	push   $0x0
  pushl $101
80106556:	6a 65                	push   $0x65
  jmp alltraps
80106558:	e9 91 f7 ff ff       	jmp    80105cee <alltraps>

8010655d <vector102>:
.globl vector102
vector102:
  pushl $0
8010655d:	6a 00                	push   $0x0
  pushl $102
8010655f:	6a 66                	push   $0x66
  jmp alltraps
80106561:	e9 88 f7 ff ff       	jmp    80105cee <alltraps>

80106566 <vector103>:
.globl vector103
vector103:
  pushl $0
80106566:	6a 00                	push   $0x0
  pushl $103
80106568:	6a 67                	push   $0x67
  jmp alltraps
8010656a:	e9 7f f7 ff ff       	jmp    80105cee <alltraps>

8010656f <vector104>:
.globl vector104
vector104:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $104
80106571:	6a 68                	push   $0x68
  jmp alltraps
80106573:	e9 76 f7 ff ff       	jmp    80105cee <alltraps>

80106578 <vector105>:
.globl vector105
vector105:
  pushl $0
80106578:	6a 00                	push   $0x0
  pushl $105
8010657a:	6a 69                	push   $0x69
  jmp alltraps
8010657c:	e9 6d f7 ff ff       	jmp    80105cee <alltraps>

80106581 <vector106>:
.globl vector106
vector106:
  pushl $0
80106581:	6a 00                	push   $0x0
  pushl $106
80106583:	6a 6a                	push   $0x6a
  jmp alltraps
80106585:	e9 64 f7 ff ff       	jmp    80105cee <alltraps>

8010658a <vector107>:
.globl vector107
vector107:
  pushl $0
8010658a:	6a 00                	push   $0x0
  pushl $107
8010658c:	6a 6b                	push   $0x6b
  jmp alltraps
8010658e:	e9 5b f7 ff ff       	jmp    80105cee <alltraps>

80106593 <vector108>:
.globl vector108
vector108:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $108
80106595:	6a 6c                	push   $0x6c
  jmp alltraps
80106597:	e9 52 f7 ff ff       	jmp    80105cee <alltraps>

8010659c <vector109>:
.globl vector109
vector109:
  pushl $0
8010659c:	6a 00                	push   $0x0
  pushl $109
8010659e:	6a 6d                	push   $0x6d
  jmp alltraps
801065a0:	e9 49 f7 ff ff       	jmp    80105cee <alltraps>

801065a5 <vector110>:
.globl vector110
vector110:
  pushl $0
801065a5:	6a 00                	push   $0x0
  pushl $110
801065a7:	6a 6e                	push   $0x6e
  jmp alltraps
801065a9:	e9 40 f7 ff ff       	jmp    80105cee <alltraps>

801065ae <vector111>:
.globl vector111
vector111:
  pushl $0
801065ae:	6a 00                	push   $0x0
  pushl $111
801065b0:	6a 6f                	push   $0x6f
  jmp alltraps
801065b2:	e9 37 f7 ff ff       	jmp    80105cee <alltraps>

801065b7 <vector112>:
.globl vector112
vector112:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $112
801065b9:	6a 70                	push   $0x70
  jmp alltraps
801065bb:	e9 2e f7 ff ff       	jmp    80105cee <alltraps>

801065c0 <vector113>:
.globl vector113
vector113:
  pushl $0
801065c0:	6a 00                	push   $0x0
  pushl $113
801065c2:	6a 71                	push   $0x71
  jmp alltraps
801065c4:	e9 25 f7 ff ff       	jmp    80105cee <alltraps>

801065c9 <vector114>:
.globl vector114
vector114:
  pushl $0
801065c9:	6a 00                	push   $0x0
  pushl $114
801065cb:	6a 72                	push   $0x72
  jmp alltraps
801065cd:	e9 1c f7 ff ff       	jmp    80105cee <alltraps>

801065d2 <vector115>:
.globl vector115
vector115:
  pushl $0
801065d2:	6a 00                	push   $0x0
  pushl $115
801065d4:	6a 73                	push   $0x73
  jmp alltraps
801065d6:	e9 13 f7 ff ff       	jmp    80105cee <alltraps>

801065db <vector116>:
.globl vector116
vector116:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $116
801065dd:	6a 74                	push   $0x74
  jmp alltraps
801065df:	e9 0a f7 ff ff       	jmp    80105cee <alltraps>

801065e4 <vector117>:
.globl vector117
vector117:
  pushl $0
801065e4:	6a 00                	push   $0x0
  pushl $117
801065e6:	6a 75                	push   $0x75
  jmp alltraps
801065e8:	e9 01 f7 ff ff       	jmp    80105cee <alltraps>

801065ed <vector118>:
.globl vector118
vector118:
  pushl $0
801065ed:	6a 00                	push   $0x0
  pushl $118
801065ef:	6a 76                	push   $0x76
  jmp alltraps
801065f1:	e9 f8 f6 ff ff       	jmp    80105cee <alltraps>

801065f6 <vector119>:
.globl vector119
vector119:
  pushl $0
801065f6:	6a 00                	push   $0x0
  pushl $119
801065f8:	6a 77                	push   $0x77
  jmp alltraps
801065fa:	e9 ef f6 ff ff       	jmp    80105cee <alltraps>

801065ff <vector120>:
.globl vector120
vector120:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $120
80106601:	6a 78                	push   $0x78
  jmp alltraps
80106603:	e9 e6 f6 ff ff       	jmp    80105cee <alltraps>

80106608 <vector121>:
.globl vector121
vector121:
  pushl $0
80106608:	6a 00                	push   $0x0
  pushl $121
8010660a:	6a 79                	push   $0x79
  jmp alltraps
8010660c:	e9 dd f6 ff ff       	jmp    80105cee <alltraps>

80106611 <vector122>:
.globl vector122
vector122:
  pushl $0
80106611:	6a 00                	push   $0x0
  pushl $122
80106613:	6a 7a                	push   $0x7a
  jmp alltraps
80106615:	e9 d4 f6 ff ff       	jmp    80105cee <alltraps>

8010661a <vector123>:
.globl vector123
vector123:
  pushl $0
8010661a:	6a 00                	push   $0x0
  pushl $123
8010661c:	6a 7b                	push   $0x7b
  jmp alltraps
8010661e:	e9 cb f6 ff ff       	jmp    80105cee <alltraps>

80106623 <vector124>:
.globl vector124
vector124:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $124
80106625:	6a 7c                	push   $0x7c
  jmp alltraps
80106627:	e9 c2 f6 ff ff       	jmp    80105cee <alltraps>

8010662c <vector125>:
.globl vector125
vector125:
  pushl $0
8010662c:	6a 00                	push   $0x0
  pushl $125
8010662e:	6a 7d                	push   $0x7d
  jmp alltraps
80106630:	e9 b9 f6 ff ff       	jmp    80105cee <alltraps>

80106635 <vector126>:
.globl vector126
vector126:
  pushl $0
80106635:	6a 00                	push   $0x0
  pushl $126
80106637:	6a 7e                	push   $0x7e
  jmp alltraps
80106639:	e9 b0 f6 ff ff       	jmp    80105cee <alltraps>

8010663e <vector127>:
.globl vector127
vector127:
  pushl $0
8010663e:	6a 00                	push   $0x0
  pushl $127
80106640:	6a 7f                	push   $0x7f
  jmp alltraps
80106642:	e9 a7 f6 ff ff       	jmp    80105cee <alltraps>

80106647 <vector128>:
.globl vector128
vector128:
  pushl $0
80106647:	6a 00                	push   $0x0
  pushl $128
80106649:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010664e:	e9 9b f6 ff ff       	jmp    80105cee <alltraps>

80106653 <vector129>:
.globl vector129
vector129:
  pushl $0
80106653:	6a 00                	push   $0x0
  pushl $129
80106655:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010665a:	e9 8f f6 ff ff       	jmp    80105cee <alltraps>

8010665f <vector130>:
.globl vector130
vector130:
  pushl $0
8010665f:	6a 00                	push   $0x0
  pushl $130
80106661:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106666:	e9 83 f6 ff ff       	jmp    80105cee <alltraps>

8010666b <vector131>:
.globl vector131
vector131:
  pushl $0
8010666b:	6a 00                	push   $0x0
  pushl $131
8010666d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80106672:	e9 77 f6 ff ff       	jmp    80105cee <alltraps>

80106677 <vector132>:
.globl vector132
vector132:
  pushl $0
80106677:	6a 00                	push   $0x0
  pushl $132
80106679:	68 84 00 00 00       	push   $0x84
  jmp alltraps
8010667e:	e9 6b f6 ff ff       	jmp    80105cee <alltraps>

80106683 <vector133>:
.globl vector133
vector133:
  pushl $0
80106683:	6a 00                	push   $0x0
  pushl $133
80106685:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010668a:	e9 5f f6 ff ff       	jmp    80105cee <alltraps>

8010668f <vector134>:
.globl vector134
vector134:
  pushl $0
8010668f:	6a 00                	push   $0x0
  pushl $134
80106691:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106696:	e9 53 f6 ff ff       	jmp    80105cee <alltraps>

8010669b <vector135>:
.globl vector135
vector135:
  pushl $0
8010669b:	6a 00                	push   $0x0
  pushl $135
8010669d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801066a2:	e9 47 f6 ff ff       	jmp    80105cee <alltraps>

801066a7 <vector136>:
.globl vector136
vector136:
  pushl $0
801066a7:	6a 00                	push   $0x0
  pushl $136
801066a9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801066ae:	e9 3b f6 ff ff       	jmp    80105cee <alltraps>

801066b3 <vector137>:
.globl vector137
vector137:
  pushl $0
801066b3:	6a 00                	push   $0x0
  pushl $137
801066b5:	68 89 00 00 00       	push   $0x89
  jmp alltraps
801066ba:	e9 2f f6 ff ff       	jmp    80105cee <alltraps>

801066bf <vector138>:
.globl vector138
vector138:
  pushl $0
801066bf:	6a 00                	push   $0x0
  pushl $138
801066c1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801066c6:	e9 23 f6 ff ff       	jmp    80105cee <alltraps>

801066cb <vector139>:
.globl vector139
vector139:
  pushl $0
801066cb:	6a 00                	push   $0x0
  pushl $139
801066cd:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801066d2:	e9 17 f6 ff ff       	jmp    80105cee <alltraps>

801066d7 <vector140>:
.globl vector140
vector140:
  pushl $0
801066d7:	6a 00                	push   $0x0
  pushl $140
801066d9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801066de:	e9 0b f6 ff ff       	jmp    80105cee <alltraps>

801066e3 <vector141>:
.globl vector141
vector141:
  pushl $0
801066e3:	6a 00                	push   $0x0
  pushl $141
801066e5:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801066ea:	e9 ff f5 ff ff       	jmp    80105cee <alltraps>

801066ef <vector142>:
.globl vector142
vector142:
  pushl $0
801066ef:	6a 00                	push   $0x0
  pushl $142
801066f1:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
801066f6:	e9 f3 f5 ff ff       	jmp    80105cee <alltraps>

801066fb <vector143>:
.globl vector143
vector143:
  pushl $0
801066fb:	6a 00                	push   $0x0
  pushl $143
801066fd:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106702:	e9 e7 f5 ff ff       	jmp    80105cee <alltraps>

80106707 <vector144>:
.globl vector144
vector144:
  pushl $0
80106707:	6a 00                	push   $0x0
  pushl $144
80106709:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010670e:	e9 db f5 ff ff       	jmp    80105cee <alltraps>

80106713 <vector145>:
.globl vector145
vector145:
  pushl $0
80106713:	6a 00                	push   $0x0
  pushl $145
80106715:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010671a:	e9 cf f5 ff ff       	jmp    80105cee <alltraps>

8010671f <vector146>:
.globl vector146
vector146:
  pushl $0
8010671f:	6a 00                	push   $0x0
  pushl $146
80106721:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106726:	e9 c3 f5 ff ff       	jmp    80105cee <alltraps>

8010672b <vector147>:
.globl vector147
vector147:
  pushl $0
8010672b:	6a 00                	push   $0x0
  pushl $147
8010672d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106732:	e9 b7 f5 ff ff       	jmp    80105cee <alltraps>

80106737 <vector148>:
.globl vector148
vector148:
  pushl $0
80106737:	6a 00                	push   $0x0
  pushl $148
80106739:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010673e:	e9 ab f5 ff ff       	jmp    80105cee <alltraps>

80106743 <vector149>:
.globl vector149
vector149:
  pushl $0
80106743:	6a 00                	push   $0x0
  pushl $149
80106745:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010674a:	e9 9f f5 ff ff       	jmp    80105cee <alltraps>

8010674f <vector150>:
.globl vector150
vector150:
  pushl $0
8010674f:	6a 00                	push   $0x0
  pushl $150
80106751:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106756:	e9 93 f5 ff ff       	jmp    80105cee <alltraps>

8010675b <vector151>:
.globl vector151
vector151:
  pushl $0
8010675b:	6a 00                	push   $0x0
  pushl $151
8010675d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106762:	e9 87 f5 ff ff       	jmp    80105cee <alltraps>

80106767 <vector152>:
.globl vector152
vector152:
  pushl $0
80106767:	6a 00                	push   $0x0
  pushl $152
80106769:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010676e:	e9 7b f5 ff ff       	jmp    80105cee <alltraps>

80106773 <vector153>:
.globl vector153
vector153:
  pushl $0
80106773:	6a 00                	push   $0x0
  pushl $153
80106775:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010677a:	e9 6f f5 ff ff       	jmp    80105cee <alltraps>

8010677f <vector154>:
.globl vector154
vector154:
  pushl $0
8010677f:	6a 00                	push   $0x0
  pushl $154
80106781:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106786:	e9 63 f5 ff ff       	jmp    80105cee <alltraps>

8010678b <vector155>:
.globl vector155
vector155:
  pushl $0
8010678b:	6a 00                	push   $0x0
  pushl $155
8010678d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106792:	e9 57 f5 ff ff       	jmp    80105cee <alltraps>

80106797 <vector156>:
.globl vector156
vector156:
  pushl $0
80106797:	6a 00                	push   $0x0
  pushl $156
80106799:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010679e:	e9 4b f5 ff ff       	jmp    80105cee <alltraps>

801067a3 <vector157>:
.globl vector157
vector157:
  pushl $0
801067a3:	6a 00                	push   $0x0
  pushl $157
801067a5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801067aa:	e9 3f f5 ff ff       	jmp    80105cee <alltraps>

801067af <vector158>:
.globl vector158
vector158:
  pushl $0
801067af:	6a 00                	push   $0x0
  pushl $158
801067b1:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801067b6:	e9 33 f5 ff ff       	jmp    80105cee <alltraps>

801067bb <vector159>:
.globl vector159
vector159:
  pushl $0
801067bb:	6a 00                	push   $0x0
  pushl $159
801067bd:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801067c2:	e9 27 f5 ff ff       	jmp    80105cee <alltraps>

801067c7 <vector160>:
.globl vector160
vector160:
  pushl $0
801067c7:	6a 00                	push   $0x0
  pushl $160
801067c9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801067ce:	e9 1b f5 ff ff       	jmp    80105cee <alltraps>

801067d3 <vector161>:
.globl vector161
vector161:
  pushl $0
801067d3:	6a 00                	push   $0x0
  pushl $161
801067d5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801067da:	e9 0f f5 ff ff       	jmp    80105cee <alltraps>

801067df <vector162>:
.globl vector162
vector162:
  pushl $0
801067df:	6a 00                	push   $0x0
  pushl $162
801067e1:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801067e6:	e9 03 f5 ff ff       	jmp    80105cee <alltraps>

801067eb <vector163>:
.globl vector163
vector163:
  pushl $0
801067eb:	6a 00                	push   $0x0
  pushl $163
801067ed:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801067f2:	e9 f7 f4 ff ff       	jmp    80105cee <alltraps>

801067f7 <vector164>:
.globl vector164
vector164:
  pushl $0
801067f7:	6a 00                	push   $0x0
  pushl $164
801067f9:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801067fe:	e9 eb f4 ff ff       	jmp    80105cee <alltraps>

80106803 <vector165>:
.globl vector165
vector165:
  pushl $0
80106803:	6a 00                	push   $0x0
  pushl $165
80106805:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010680a:	e9 df f4 ff ff       	jmp    80105cee <alltraps>

8010680f <vector166>:
.globl vector166
vector166:
  pushl $0
8010680f:	6a 00                	push   $0x0
  pushl $166
80106811:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106816:	e9 d3 f4 ff ff       	jmp    80105cee <alltraps>

8010681b <vector167>:
.globl vector167
vector167:
  pushl $0
8010681b:	6a 00                	push   $0x0
  pushl $167
8010681d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106822:	e9 c7 f4 ff ff       	jmp    80105cee <alltraps>

80106827 <vector168>:
.globl vector168
vector168:
  pushl $0
80106827:	6a 00                	push   $0x0
  pushl $168
80106829:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010682e:	e9 bb f4 ff ff       	jmp    80105cee <alltraps>

80106833 <vector169>:
.globl vector169
vector169:
  pushl $0
80106833:	6a 00                	push   $0x0
  pushl $169
80106835:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010683a:	e9 af f4 ff ff       	jmp    80105cee <alltraps>

8010683f <vector170>:
.globl vector170
vector170:
  pushl $0
8010683f:	6a 00                	push   $0x0
  pushl $170
80106841:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106846:	e9 a3 f4 ff ff       	jmp    80105cee <alltraps>

8010684b <vector171>:
.globl vector171
vector171:
  pushl $0
8010684b:	6a 00                	push   $0x0
  pushl $171
8010684d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106852:	e9 97 f4 ff ff       	jmp    80105cee <alltraps>

80106857 <vector172>:
.globl vector172
vector172:
  pushl $0
80106857:	6a 00                	push   $0x0
  pushl $172
80106859:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010685e:	e9 8b f4 ff ff       	jmp    80105cee <alltraps>

80106863 <vector173>:
.globl vector173
vector173:
  pushl $0
80106863:	6a 00                	push   $0x0
  pushl $173
80106865:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010686a:	e9 7f f4 ff ff       	jmp    80105cee <alltraps>

8010686f <vector174>:
.globl vector174
vector174:
  pushl $0
8010686f:	6a 00                	push   $0x0
  pushl $174
80106871:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106876:	e9 73 f4 ff ff       	jmp    80105cee <alltraps>

8010687b <vector175>:
.globl vector175
vector175:
  pushl $0
8010687b:	6a 00                	push   $0x0
  pushl $175
8010687d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106882:	e9 67 f4 ff ff       	jmp    80105cee <alltraps>

80106887 <vector176>:
.globl vector176
vector176:
  pushl $0
80106887:	6a 00                	push   $0x0
  pushl $176
80106889:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010688e:	e9 5b f4 ff ff       	jmp    80105cee <alltraps>

80106893 <vector177>:
.globl vector177
vector177:
  pushl $0
80106893:	6a 00                	push   $0x0
  pushl $177
80106895:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010689a:	e9 4f f4 ff ff       	jmp    80105cee <alltraps>

8010689f <vector178>:
.globl vector178
vector178:
  pushl $0
8010689f:	6a 00                	push   $0x0
  pushl $178
801068a1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801068a6:	e9 43 f4 ff ff       	jmp    80105cee <alltraps>

801068ab <vector179>:
.globl vector179
vector179:
  pushl $0
801068ab:	6a 00                	push   $0x0
  pushl $179
801068ad:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801068b2:	e9 37 f4 ff ff       	jmp    80105cee <alltraps>

801068b7 <vector180>:
.globl vector180
vector180:
  pushl $0
801068b7:	6a 00                	push   $0x0
  pushl $180
801068b9:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801068be:	e9 2b f4 ff ff       	jmp    80105cee <alltraps>

801068c3 <vector181>:
.globl vector181
vector181:
  pushl $0
801068c3:	6a 00                	push   $0x0
  pushl $181
801068c5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801068ca:	e9 1f f4 ff ff       	jmp    80105cee <alltraps>

801068cf <vector182>:
.globl vector182
vector182:
  pushl $0
801068cf:	6a 00                	push   $0x0
  pushl $182
801068d1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801068d6:	e9 13 f4 ff ff       	jmp    80105cee <alltraps>

801068db <vector183>:
.globl vector183
vector183:
  pushl $0
801068db:	6a 00                	push   $0x0
  pushl $183
801068dd:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801068e2:	e9 07 f4 ff ff       	jmp    80105cee <alltraps>

801068e7 <vector184>:
.globl vector184
vector184:
  pushl $0
801068e7:	6a 00                	push   $0x0
  pushl $184
801068e9:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801068ee:	e9 fb f3 ff ff       	jmp    80105cee <alltraps>

801068f3 <vector185>:
.globl vector185
vector185:
  pushl $0
801068f3:	6a 00                	push   $0x0
  pushl $185
801068f5:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801068fa:	e9 ef f3 ff ff       	jmp    80105cee <alltraps>

801068ff <vector186>:
.globl vector186
vector186:
  pushl $0
801068ff:	6a 00                	push   $0x0
  pushl $186
80106901:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106906:	e9 e3 f3 ff ff       	jmp    80105cee <alltraps>

8010690b <vector187>:
.globl vector187
vector187:
  pushl $0
8010690b:	6a 00                	push   $0x0
  pushl $187
8010690d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106912:	e9 d7 f3 ff ff       	jmp    80105cee <alltraps>

80106917 <vector188>:
.globl vector188
vector188:
  pushl $0
80106917:	6a 00                	push   $0x0
  pushl $188
80106919:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010691e:	e9 cb f3 ff ff       	jmp    80105cee <alltraps>

80106923 <vector189>:
.globl vector189
vector189:
  pushl $0
80106923:	6a 00                	push   $0x0
  pushl $189
80106925:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010692a:	e9 bf f3 ff ff       	jmp    80105cee <alltraps>

8010692f <vector190>:
.globl vector190
vector190:
  pushl $0
8010692f:	6a 00                	push   $0x0
  pushl $190
80106931:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106936:	e9 b3 f3 ff ff       	jmp    80105cee <alltraps>

8010693b <vector191>:
.globl vector191
vector191:
  pushl $0
8010693b:	6a 00                	push   $0x0
  pushl $191
8010693d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106942:	e9 a7 f3 ff ff       	jmp    80105cee <alltraps>

80106947 <vector192>:
.globl vector192
vector192:
  pushl $0
80106947:	6a 00                	push   $0x0
  pushl $192
80106949:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010694e:	e9 9b f3 ff ff       	jmp    80105cee <alltraps>

80106953 <vector193>:
.globl vector193
vector193:
  pushl $0
80106953:	6a 00                	push   $0x0
  pushl $193
80106955:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010695a:	e9 8f f3 ff ff       	jmp    80105cee <alltraps>

8010695f <vector194>:
.globl vector194
vector194:
  pushl $0
8010695f:	6a 00                	push   $0x0
  pushl $194
80106961:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106966:	e9 83 f3 ff ff       	jmp    80105cee <alltraps>

8010696b <vector195>:
.globl vector195
vector195:
  pushl $0
8010696b:	6a 00                	push   $0x0
  pushl $195
8010696d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106972:	e9 77 f3 ff ff       	jmp    80105cee <alltraps>

80106977 <vector196>:
.globl vector196
vector196:
  pushl $0
80106977:	6a 00                	push   $0x0
  pushl $196
80106979:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010697e:	e9 6b f3 ff ff       	jmp    80105cee <alltraps>

80106983 <vector197>:
.globl vector197
vector197:
  pushl $0
80106983:	6a 00                	push   $0x0
  pushl $197
80106985:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010698a:	e9 5f f3 ff ff       	jmp    80105cee <alltraps>

8010698f <vector198>:
.globl vector198
vector198:
  pushl $0
8010698f:	6a 00                	push   $0x0
  pushl $198
80106991:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106996:	e9 53 f3 ff ff       	jmp    80105cee <alltraps>

8010699b <vector199>:
.globl vector199
vector199:
  pushl $0
8010699b:	6a 00                	push   $0x0
  pushl $199
8010699d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801069a2:	e9 47 f3 ff ff       	jmp    80105cee <alltraps>

801069a7 <vector200>:
.globl vector200
vector200:
  pushl $0
801069a7:	6a 00                	push   $0x0
  pushl $200
801069a9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801069ae:	e9 3b f3 ff ff       	jmp    80105cee <alltraps>

801069b3 <vector201>:
.globl vector201
vector201:
  pushl $0
801069b3:	6a 00                	push   $0x0
  pushl $201
801069b5:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
801069ba:	e9 2f f3 ff ff       	jmp    80105cee <alltraps>

801069bf <vector202>:
.globl vector202
vector202:
  pushl $0
801069bf:	6a 00                	push   $0x0
  pushl $202
801069c1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801069c6:	e9 23 f3 ff ff       	jmp    80105cee <alltraps>

801069cb <vector203>:
.globl vector203
vector203:
  pushl $0
801069cb:	6a 00                	push   $0x0
  pushl $203
801069cd:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801069d2:	e9 17 f3 ff ff       	jmp    80105cee <alltraps>

801069d7 <vector204>:
.globl vector204
vector204:
  pushl $0
801069d7:	6a 00                	push   $0x0
  pushl $204
801069d9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801069de:	e9 0b f3 ff ff       	jmp    80105cee <alltraps>

801069e3 <vector205>:
.globl vector205
vector205:
  pushl $0
801069e3:	6a 00                	push   $0x0
  pushl $205
801069e5:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801069ea:	e9 ff f2 ff ff       	jmp    80105cee <alltraps>

801069ef <vector206>:
.globl vector206
vector206:
  pushl $0
801069ef:	6a 00                	push   $0x0
  pushl $206
801069f1:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801069f6:	e9 f3 f2 ff ff       	jmp    80105cee <alltraps>

801069fb <vector207>:
.globl vector207
vector207:
  pushl $0
801069fb:	6a 00                	push   $0x0
  pushl $207
801069fd:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106a02:	e9 e7 f2 ff ff       	jmp    80105cee <alltraps>

80106a07 <vector208>:
.globl vector208
vector208:
  pushl $0
80106a07:	6a 00                	push   $0x0
  pushl $208
80106a09:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80106a0e:	e9 db f2 ff ff       	jmp    80105cee <alltraps>

80106a13 <vector209>:
.globl vector209
vector209:
  pushl $0
80106a13:	6a 00                	push   $0x0
  pushl $209
80106a15:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80106a1a:	e9 cf f2 ff ff       	jmp    80105cee <alltraps>

80106a1f <vector210>:
.globl vector210
vector210:
  pushl $0
80106a1f:	6a 00                	push   $0x0
  pushl $210
80106a21:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106a26:	e9 c3 f2 ff ff       	jmp    80105cee <alltraps>

80106a2b <vector211>:
.globl vector211
vector211:
  pushl $0
80106a2b:	6a 00                	push   $0x0
  pushl $211
80106a2d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106a32:	e9 b7 f2 ff ff       	jmp    80105cee <alltraps>

80106a37 <vector212>:
.globl vector212
vector212:
  pushl $0
80106a37:	6a 00                	push   $0x0
  pushl $212
80106a39:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80106a3e:	e9 ab f2 ff ff       	jmp    80105cee <alltraps>

80106a43 <vector213>:
.globl vector213
vector213:
  pushl $0
80106a43:	6a 00                	push   $0x0
  pushl $213
80106a45:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106a4a:	e9 9f f2 ff ff       	jmp    80105cee <alltraps>

80106a4f <vector214>:
.globl vector214
vector214:
  pushl $0
80106a4f:	6a 00                	push   $0x0
  pushl $214
80106a51:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106a56:	e9 93 f2 ff ff       	jmp    80105cee <alltraps>

80106a5b <vector215>:
.globl vector215
vector215:
  pushl $0
80106a5b:	6a 00                	push   $0x0
  pushl $215
80106a5d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106a62:	e9 87 f2 ff ff       	jmp    80105cee <alltraps>

80106a67 <vector216>:
.globl vector216
vector216:
  pushl $0
80106a67:	6a 00                	push   $0x0
  pushl $216
80106a69:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80106a6e:	e9 7b f2 ff ff       	jmp    80105cee <alltraps>

80106a73 <vector217>:
.globl vector217
vector217:
  pushl $0
80106a73:	6a 00                	push   $0x0
  pushl $217
80106a75:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106a7a:	e9 6f f2 ff ff       	jmp    80105cee <alltraps>

80106a7f <vector218>:
.globl vector218
vector218:
  pushl $0
80106a7f:	6a 00                	push   $0x0
  pushl $218
80106a81:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106a86:	e9 63 f2 ff ff       	jmp    80105cee <alltraps>

80106a8b <vector219>:
.globl vector219
vector219:
  pushl $0
80106a8b:	6a 00                	push   $0x0
  pushl $219
80106a8d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106a92:	e9 57 f2 ff ff       	jmp    80105cee <alltraps>

80106a97 <vector220>:
.globl vector220
vector220:
  pushl $0
80106a97:	6a 00                	push   $0x0
  pushl $220
80106a99:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106a9e:	e9 4b f2 ff ff       	jmp    80105cee <alltraps>

80106aa3 <vector221>:
.globl vector221
vector221:
  pushl $0
80106aa3:	6a 00                	push   $0x0
  pushl $221
80106aa5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106aaa:	e9 3f f2 ff ff       	jmp    80105cee <alltraps>

80106aaf <vector222>:
.globl vector222
vector222:
  pushl $0
80106aaf:	6a 00                	push   $0x0
  pushl $222
80106ab1:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106ab6:	e9 33 f2 ff ff       	jmp    80105cee <alltraps>

80106abb <vector223>:
.globl vector223
vector223:
  pushl $0
80106abb:	6a 00                	push   $0x0
  pushl $223
80106abd:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106ac2:	e9 27 f2 ff ff       	jmp    80105cee <alltraps>

80106ac7 <vector224>:
.globl vector224
vector224:
  pushl $0
80106ac7:	6a 00                	push   $0x0
  pushl $224
80106ac9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106ace:	e9 1b f2 ff ff       	jmp    80105cee <alltraps>

80106ad3 <vector225>:
.globl vector225
vector225:
  pushl $0
80106ad3:	6a 00                	push   $0x0
  pushl $225
80106ad5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106ada:	e9 0f f2 ff ff       	jmp    80105cee <alltraps>

80106adf <vector226>:
.globl vector226
vector226:
  pushl $0
80106adf:	6a 00                	push   $0x0
  pushl $226
80106ae1:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106ae6:	e9 03 f2 ff ff       	jmp    80105cee <alltraps>

80106aeb <vector227>:
.globl vector227
vector227:
  pushl $0
80106aeb:	6a 00                	push   $0x0
  pushl $227
80106aed:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106af2:	e9 f7 f1 ff ff       	jmp    80105cee <alltraps>

80106af7 <vector228>:
.globl vector228
vector228:
  pushl $0
80106af7:	6a 00                	push   $0x0
  pushl $228
80106af9:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106afe:	e9 eb f1 ff ff       	jmp    80105cee <alltraps>

80106b03 <vector229>:
.globl vector229
vector229:
  pushl $0
80106b03:	6a 00                	push   $0x0
  pushl $229
80106b05:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106b0a:	e9 df f1 ff ff       	jmp    80105cee <alltraps>

80106b0f <vector230>:
.globl vector230
vector230:
  pushl $0
80106b0f:	6a 00                	push   $0x0
  pushl $230
80106b11:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106b16:	e9 d3 f1 ff ff       	jmp    80105cee <alltraps>

80106b1b <vector231>:
.globl vector231
vector231:
  pushl $0
80106b1b:	6a 00                	push   $0x0
  pushl $231
80106b1d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106b22:	e9 c7 f1 ff ff       	jmp    80105cee <alltraps>

80106b27 <vector232>:
.globl vector232
vector232:
  pushl $0
80106b27:	6a 00                	push   $0x0
  pushl $232
80106b29:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80106b2e:	e9 bb f1 ff ff       	jmp    80105cee <alltraps>

80106b33 <vector233>:
.globl vector233
vector233:
  pushl $0
80106b33:	6a 00                	push   $0x0
  pushl $233
80106b35:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80106b3a:	e9 af f1 ff ff       	jmp    80105cee <alltraps>

80106b3f <vector234>:
.globl vector234
vector234:
  pushl $0
80106b3f:	6a 00                	push   $0x0
  pushl $234
80106b41:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106b46:	e9 a3 f1 ff ff       	jmp    80105cee <alltraps>

80106b4b <vector235>:
.globl vector235
vector235:
  pushl $0
80106b4b:	6a 00                	push   $0x0
  pushl $235
80106b4d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106b52:	e9 97 f1 ff ff       	jmp    80105cee <alltraps>

80106b57 <vector236>:
.globl vector236
vector236:
  pushl $0
80106b57:	6a 00                	push   $0x0
  pushl $236
80106b59:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80106b5e:	e9 8b f1 ff ff       	jmp    80105cee <alltraps>

80106b63 <vector237>:
.globl vector237
vector237:
  pushl $0
80106b63:	6a 00                	push   $0x0
  pushl $237
80106b65:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106b6a:	e9 7f f1 ff ff       	jmp    80105cee <alltraps>

80106b6f <vector238>:
.globl vector238
vector238:
  pushl $0
80106b6f:	6a 00                	push   $0x0
  pushl $238
80106b71:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106b76:	e9 73 f1 ff ff       	jmp    80105cee <alltraps>

80106b7b <vector239>:
.globl vector239
vector239:
  pushl $0
80106b7b:	6a 00                	push   $0x0
  pushl $239
80106b7d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106b82:	e9 67 f1 ff ff       	jmp    80105cee <alltraps>

80106b87 <vector240>:
.globl vector240
vector240:
  pushl $0
80106b87:	6a 00                	push   $0x0
  pushl $240
80106b89:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106b8e:	e9 5b f1 ff ff       	jmp    80105cee <alltraps>

80106b93 <vector241>:
.globl vector241
vector241:
  pushl $0
80106b93:	6a 00                	push   $0x0
  pushl $241
80106b95:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106b9a:	e9 4f f1 ff ff       	jmp    80105cee <alltraps>

80106b9f <vector242>:
.globl vector242
vector242:
  pushl $0
80106b9f:	6a 00                	push   $0x0
  pushl $242
80106ba1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106ba6:	e9 43 f1 ff ff       	jmp    80105cee <alltraps>

80106bab <vector243>:
.globl vector243
vector243:
  pushl $0
80106bab:	6a 00                	push   $0x0
  pushl $243
80106bad:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106bb2:	e9 37 f1 ff ff       	jmp    80105cee <alltraps>

80106bb7 <vector244>:
.globl vector244
vector244:
  pushl $0
80106bb7:	6a 00                	push   $0x0
  pushl $244
80106bb9:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106bbe:	e9 2b f1 ff ff       	jmp    80105cee <alltraps>

80106bc3 <vector245>:
.globl vector245
vector245:
  pushl $0
80106bc3:	6a 00                	push   $0x0
  pushl $245
80106bc5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106bca:	e9 1f f1 ff ff       	jmp    80105cee <alltraps>

80106bcf <vector246>:
.globl vector246
vector246:
  pushl $0
80106bcf:	6a 00                	push   $0x0
  pushl $246
80106bd1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106bd6:	e9 13 f1 ff ff       	jmp    80105cee <alltraps>

80106bdb <vector247>:
.globl vector247
vector247:
  pushl $0
80106bdb:	6a 00                	push   $0x0
  pushl $247
80106bdd:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106be2:	e9 07 f1 ff ff       	jmp    80105cee <alltraps>

80106be7 <vector248>:
.globl vector248
vector248:
  pushl $0
80106be7:	6a 00                	push   $0x0
  pushl $248
80106be9:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106bee:	e9 fb f0 ff ff       	jmp    80105cee <alltraps>

80106bf3 <vector249>:
.globl vector249
vector249:
  pushl $0
80106bf3:	6a 00                	push   $0x0
  pushl $249
80106bf5:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106bfa:	e9 ef f0 ff ff       	jmp    80105cee <alltraps>

80106bff <vector250>:
.globl vector250
vector250:
  pushl $0
80106bff:	6a 00                	push   $0x0
  pushl $250
80106c01:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106c06:	e9 e3 f0 ff ff       	jmp    80105cee <alltraps>

80106c0b <vector251>:
.globl vector251
vector251:
  pushl $0
80106c0b:	6a 00                	push   $0x0
  pushl $251
80106c0d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106c12:	e9 d7 f0 ff ff       	jmp    80105cee <alltraps>

80106c17 <vector252>:
.globl vector252
vector252:
  pushl $0
80106c17:	6a 00                	push   $0x0
  pushl $252
80106c19:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106c1e:	e9 cb f0 ff ff       	jmp    80105cee <alltraps>

80106c23 <vector253>:
.globl vector253
vector253:
  pushl $0
80106c23:	6a 00                	push   $0x0
  pushl $253
80106c25:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106c2a:	e9 bf f0 ff ff       	jmp    80105cee <alltraps>

80106c2f <vector254>:
.globl vector254
vector254:
  pushl $0
80106c2f:	6a 00                	push   $0x0
  pushl $254
80106c31:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106c36:	e9 b3 f0 ff ff       	jmp    80105cee <alltraps>

80106c3b <vector255>:
.globl vector255
vector255:
  pushl $0
80106c3b:	6a 00                	push   $0x0
  pushl $255
80106c3d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106c42:	e9 a7 f0 ff ff       	jmp    80105cee <alltraps>
80106c47:	66 90                	xchg   %ax,%ax
80106c49:	66 90                	xchg   %ax,%ax
80106c4b:	66 90                	xchg   %ax,%ax
80106c4d:	66 90                	xchg   %ax,%ax
80106c4f:	90                   	nop

80106c50 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106c50:	55                   	push   %ebp
80106c51:	89 e5                	mov    %esp,%ebp
80106c53:	57                   	push   %edi
80106c54:	56                   	push   %esi
80106c55:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106c56:	89 d3                	mov    %edx,%ebx
{
80106c58:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
80106c5a:	c1 eb 16             	shr    $0x16,%ebx
80106c5d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
80106c60:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
80106c63:	8b 06                	mov    (%esi),%eax
80106c65:	a8 01                	test   $0x1,%al
80106c67:	74 27                	je     80106c90 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106c69:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c6e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106c74:	c1 ef 0a             	shr    $0xa,%edi
}
80106c77:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
80106c7a:	89 fa                	mov    %edi,%edx
80106c7c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106c82:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106c85:	5b                   	pop    %ebx
80106c86:	5e                   	pop    %esi
80106c87:	5f                   	pop    %edi
80106c88:	5d                   	pop    %ebp
80106c89:	c3                   	ret    
80106c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106c90:	85 c9                	test   %ecx,%ecx
80106c92:	74 2c                	je     80106cc0 <walkpgdir+0x70>
80106c94:	e8 67 b8 ff ff       	call   80102500 <kalloc>
80106c99:	85 c0                	test   %eax,%eax
80106c9b:	89 c3                	mov    %eax,%ebx
80106c9d:	74 21                	je     80106cc0 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
80106c9f:	83 ec 04             	sub    $0x4,%esp
80106ca2:	68 00 10 00 00       	push   $0x1000
80106ca7:	6a 00                	push   $0x0
80106ca9:	50                   	push   %eax
80106caa:	e8 41 dc ff ff       	call   801048f0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106caf:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106cb5:	83 c4 10             	add    $0x10,%esp
80106cb8:	83 c8 07             	or     $0x7,%eax
80106cbb:	89 06                	mov    %eax,(%esi)
80106cbd:	eb b5                	jmp    80106c74 <walkpgdir+0x24>
80106cbf:	90                   	nop
}
80106cc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106cc3:	31 c0                	xor    %eax,%eax
}
80106cc5:	5b                   	pop    %ebx
80106cc6:	5e                   	pop    %esi
80106cc7:	5f                   	pop    %edi
80106cc8:	5d                   	pop    %ebp
80106cc9:	c3                   	ret    
80106cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cd0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106cd0:	55                   	push   %ebp
80106cd1:	89 e5                	mov    %esp,%ebp
80106cd3:	57                   	push   %edi
80106cd4:	56                   	push   %esi
80106cd5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106cd6:	89 d3                	mov    %edx,%ebx
80106cd8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106cde:	83 ec 1c             	sub    $0x1c,%esp
80106ce1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106ce4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106ce8:	8b 7d 08             	mov    0x8(%ebp),%edi
80106ceb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106cf0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106cf3:	8b 45 0c             	mov    0xc(%ebp),%eax
80106cf6:	29 df                	sub    %ebx,%edi
80106cf8:	83 c8 01             	or     $0x1,%eax
80106cfb:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106cfe:	eb 15                	jmp    80106d15 <mappages+0x45>
    if(*pte & PTE_P)
80106d00:	f6 00 01             	testb  $0x1,(%eax)
80106d03:	75 45                	jne    80106d4a <mappages+0x7a>
    *pte = pa | perm | PTE_P;
80106d05:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106d08:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
80106d0b:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106d0d:	74 31                	je     80106d40 <mappages+0x70>
      break;
    a += PGSIZE;
80106d0f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106d15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d18:	b9 01 00 00 00       	mov    $0x1,%ecx
80106d1d:	89 da                	mov    %ebx,%edx
80106d1f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106d22:	e8 29 ff ff ff       	call   80106c50 <walkpgdir>
80106d27:	85 c0                	test   %eax,%eax
80106d29:	75 d5                	jne    80106d00 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
80106d2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106d2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106d33:	5b                   	pop    %ebx
80106d34:	5e                   	pop    %esi
80106d35:	5f                   	pop    %edi
80106d36:	5d                   	pop    %ebp
80106d37:	c3                   	ret    
80106d38:	90                   	nop
80106d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106d43:	31 c0                	xor    %eax,%eax
}
80106d45:	5b                   	pop    %ebx
80106d46:	5e                   	pop    %esi
80106d47:	5f                   	pop    %edi
80106d48:	5d                   	pop    %ebp
80106d49:	c3                   	ret    
      panic("remap");
80106d4a:	83 ec 0c             	sub    $0xc,%esp
80106d4d:	68 08 82 10 80       	push   $0x80108208
80106d52:	e8 39 96 ff ff       	call   80100390 <panic>
80106d57:	89 f6                	mov    %esi,%esi
80106d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d60 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106d66:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d6c:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
80106d6e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d74:	83 ec 1c             	sub    $0x1c,%esp
80106d77:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106d7a:	39 d3                	cmp    %edx,%ebx
80106d7c:	73 66                	jae    80106de4 <deallocuvm.part.0+0x84>
80106d7e:	89 d6                	mov    %edx,%esi
80106d80:	eb 3d                	jmp    80106dbf <deallocuvm.part.0+0x5f>
80106d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106d88:	8b 10                	mov    (%eax),%edx
80106d8a:	f6 c2 01             	test   $0x1,%dl
80106d8d:	74 26                	je     80106db5 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106d8f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106d95:	74 58                	je     80106def <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106d97:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106d9a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106da0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106da3:	52                   	push   %edx
80106da4:	e8 a7 b5 ff ff       	call   80102350 <kfree>
      *pte = 0;
80106da9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106dac:	83 c4 10             	add    $0x10,%esp
80106daf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106db5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106dbb:	39 f3                	cmp    %esi,%ebx
80106dbd:	73 25                	jae    80106de4 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106dbf:	31 c9                	xor    %ecx,%ecx
80106dc1:	89 da                	mov    %ebx,%edx
80106dc3:	89 f8                	mov    %edi,%eax
80106dc5:	e8 86 fe ff ff       	call   80106c50 <walkpgdir>
    if(!pte)
80106dca:	85 c0                	test   %eax,%eax
80106dcc:	75 ba                	jne    80106d88 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106dce:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106dd4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106dda:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106de0:	39 f3                	cmp    %esi,%ebx
80106de2:	72 db                	jb     80106dbf <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106de4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106de7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dea:	5b                   	pop    %ebx
80106deb:	5e                   	pop    %esi
80106dec:	5f                   	pop    %edi
80106ded:	5d                   	pop    %ebp
80106dee:	c3                   	ret    
        panic("kfree");
80106def:	83 ec 0c             	sub    $0xc,%esp
80106df2:	68 86 7b 10 80       	push   $0x80107b86
80106df7:	e8 94 95 ff ff       	call   80100390 <panic>
80106dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e00 <seginit>:
{
80106e00:	55                   	push   %ebp
80106e01:	89 e5                	mov    %esp,%ebp
80106e03:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106e06:	e8 75 ca ff ff       	call   80103880 <cpuid>
80106e0b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106e11:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106e16:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106e1a:	c7 80 d8 41 11 80 ff 	movl   $0xffff,-0x7feebe28(%eax)
80106e21:	ff 00 00 
80106e24:	c7 80 dc 41 11 80 00 	movl   $0xcf9a00,-0x7feebe24(%eax)
80106e2b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106e2e:	c7 80 e0 41 11 80 ff 	movl   $0xffff,-0x7feebe20(%eax)
80106e35:	ff 00 00 
80106e38:	c7 80 e4 41 11 80 00 	movl   $0xcf9200,-0x7feebe1c(%eax)
80106e3f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106e42:	c7 80 e8 41 11 80 ff 	movl   $0xffff,-0x7feebe18(%eax)
80106e49:	ff 00 00 
80106e4c:	c7 80 ec 41 11 80 00 	movl   $0xcffa00,-0x7feebe14(%eax)
80106e53:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106e56:	c7 80 f0 41 11 80 ff 	movl   $0xffff,-0x7feebe10(%eax)
80106e5d:	ff 00 00 
80106e60:	c7 80 f4 41 11 80 00 	movl   $0xcff200,-0x7feebe0c(%eax)
80106e67:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106e6a:	05 d0 41 11 80       	add    $0x801141d0,%eax
  pd[1] = (uint)p;
80106e6f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106e73:	c1 e8 10             	shr    $0x10,%eax
80106e76:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106e7a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106e7d:	0f 01 10             	lgdtl  (%eax)
}
80106e80:	c9                   	leave  
80106e81:	c3                   	ret    
80106e82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e90 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106e90:	a1 84 70 11 80       	mov    0x80117084,%eax
{
80106e95:	55                   	push   %ebp
80106e96:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106e98:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106e9d:	0f 22 d8             	mov    %eax,%cr3
}
80106ea0:	5d                   	pop    %ebp
80106ea1:	c3                   	ret    
80106ea2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106eb0 <switchuvm>:
{
80106eb0:	55                   	push   %ebp
80106eb1:	89 e5                	mov    %esp,%ebp
80106eb3:	57                   	push   %edi
80106eb4:	56                   	push   %esi
80106eb5:	53                   	push   %ebx
80106eb6:	83 ec 1c             	sub    $0x1c,%esp
80106eb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106ebc:	85 db                	test   %ebx,%ebx
80106ebe:	0f 84 cb 00 00 00    	je     80106f8f <switchuvm+0xdf>
  if(p->kstack == 0)
80106ec4:	8b 43 08             	mov    0x8(%ebx),%eax
80106ec7:	85 c0                	test   %eax,%eax
80106ec9:	0f 84 da 00 00 00    	je     80106fa9 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106ecf:	8b 43 04             	mov    0x4(%ebx),%eax
80106ed2:	85 c0                	test   %eax,%eax
80106ed4:	0f 84 c2 00 00 00    	je     80106f9c <switchuvm+0xec>
  pushcli();
80106eda:	e8 31 d8 ff ff       	call   80104710 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106edf:	e8 1c c9 ff ff       	call   80103800 <mycpu>
80106ee4:	89 c6                	mov    %eax,%esi
80106ee6:	e8 15 c9 ff ff       	call   80103800 <mycpu>
80106eeb:	89 c7                	mov    %eax,%edi
80106eed:	e8 0e c9 ff ff       	call   80103800 <mycpu>
80106ef2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ef5:	83 c7 08             	add    $0x8,%edi
80106ef8:	e8 03 c9 ff ff       	call   80103800 <mycpu>
80106efd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106f00:	83 c0 08             	add    $0x8,%eax
80106f03:	ba 67 00 00 00       	mov    $0x67,%edx
80106f08:	c1 e8 18             	shr    $0x18,%eax
80106f0b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106f12:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106f19:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106f1f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106f24:	83 c1 08             	add    $0x8,%ecx
80106f27:	c1 e9 10             	shr    $0x10,%ecx
80106f2a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106f30:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106f35:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106f3c:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80106f41:	e8 ba c8 ff ff       	call   80103800 <mycpu>
80106f46:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106f4d:	e8 ae c8 ff ff       	call   80103800 <mycpu>
80106f52:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106f56:	8b 73 08             	mov    0x8(%ebx),%esi
80106f59:	e8 a2 c8 ff ff       	call   80103800 <mycpu>
80106f5e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106f64:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106f67:	e8 94 c8 ff ff       	call   80103800 <mycpu>
80106f6c:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106f70:	b8 28 00 00 00       	mov    $0x28,%eax
80106f75:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106f78:	8b 43 04             	mov    0x4(%ebx),%eax
80106f7b:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106f80:	0f 22 d8             	mov    %eax,%cr3
}
80106f83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f86:	5b                   	pop    %ebx
80106f87:	5e                   	pop    %esi
80106f88:	5f                   	pop    %edi
80106f89:	5d                   	pop    %ebp
  popcli();
80106f8a:	e9 c1 d7 ff ff       	jmp    80104750 <popcli>
    panic("switchuvm: no process");
80106f8f:	83 ec 0c             	sub    $0xc,%esp
80106f92:	68 0e 82 10 80       	push   $0x8010820e
80106f97:	e8 f4 93 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
80106f9c:	83 ec 0c             	sub    $0xc,%esp
80106f9f:	68 39 82 10 80       	push   $0x80108239
80106fa4:	e8 e7 93 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
80106fa9:	83 ec 0c             	sub    $0xc,%esp
80106fac:	68 24 82 10 80       	push   $0x80108224
80106fb1:	e8 da 93 ff ff       	call   80100390 <panic>
80106fb6:	8d 76 00             	lea    0x0(%esi),%esi
80106fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fc0 <inituvm>:
{
80106fc0:	55                   	push   %ebp
80106fc1:	89 e5                	mov    %esp,%ebp
80106fc3:	57                   	push   %edi
80106fc4:	56                   	push   %esi
80106fc5:	53                   	push   %ebx
80106fc6:	83 ec 1c             	sub    $0x1c,%esp
80106fc9:	8b 75 10             	mov    0x10(%ebp),%esi
80106fcc:	8b 45 08             	mov    0x8(%ebp),%eax
80106fcf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106fd2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80106fd8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106fdb:	77 49                	ja     80107026 <inituvm+0x66>
  mem = kalloc();
80106fdd:	e8 1e b5 ff ff       	call   80102500 <kalloc>
  memset(mem, 0, PGSIZE);
80106fe2:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106fe5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106fe7:	68 00 10 00 00       	push   $0x1000
80106fec:	6a 00                	push   $0x0
80106fee:	50                   	push   %eax
80106fef:	e8 fc d8 ff ff       	call   801048f0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106ff4:	58                   	pop    %eax
80106ff5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106ffb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107000:	5a                   	pop    %edx
80107001:	6a 06                	push   $0x6
80107003:	50                   	push   %eax
80107004:	31 d2                	xor    %edx,%edx
80107006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107009:	e8 c2 fc ff ff       	call   80106cd0 <mappages>
  memmove(mem, init, sz);
8010700e:	89 75 10             	mov    %esi,0x10(%ebp)
80107011:	89 7d 0c             	mov    %edi,0xc(%ebp)
80107014:	83 c4 10             	add    $0x10,%esp
80107017:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010701a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010701d:	5b                   	pop    %ebx
8010701e:	5e                   	pop    %esi
8010701f:	5f                   	pop    %edi
80107020:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80107021:	e9 7a d9 ff ff       	jmp    801049a0 <memmove>
    panic("inituvm: more than a page");
80107026:	83 ec 0c             	sub    $0xc,%esp
80107029:	68 4d 82 10 80       	push   $0x8010824d
8010702e:	e8 5d 93 ff ff       	call   80100390 <panic>
80107033:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107040 <loaduvm>:
{
80107040:	55                   	push   %ebp
80107041:	89 e5                	mov    %esp,%ebp
80107043:	57                   	push   %edi
80107044:	56                   	push   %esi
80107045:	53                   	push   %ebx
80107046:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80107049:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80107050:	0f 85 91 00 00 00    	jne    801070e7 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80107056:	8b 75 18             	mov    0x18(%ebp),%esi
80107059:	31 db                	xor    %ebx,%ebx
8010705b:	85 f6                	test   %esi,%esi
8010705d:	75 1a                	jne    80107079 <loaduvm+0x39>
8010705f:	eb 6f                	jmp    801070d0 <loaduvm+0x90>
80107061:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107068:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010706e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80107074:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80107077:	76 57                	jbe    801070d0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80107079:	8b 55 0c             	mov    0xc(%ebp),%edx
8010707c:	8b 45 08             	mov    0x8(%ebp),%eax
8010707f:	31 c9                	xor    %ecx,%ecx
80107081:	01 da                	add    %ebx,%edx
80107083:	e8 c8 fb ff ff       	call   80106c50 <walkpgdir>
80107088:	85 c0                	test   %eax,%eax
8010708a:	74 4e                	je     801070da <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
8010708c:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
8010708e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80107091:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80107096:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
8010709b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801070a1:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
801070a4:	01 d9                	add    %ebx,%ecx
801070a6:	05 00 00 00 80       	add    $0x80000000,%eax
801070ab:	57                   	push   %edi
801070ac:	51                   	push   %ecx
801070ad:	50                   	push   %eax
801070ae:	ff 75 10             	pushl  0x10(%ebp)
801070b1:	e8 ea a8 ff ff       	call   801019a0 <readi>
801070b6:	83 c4 10             	add    $0x10,%esp
801070b9:	39 f8                	cmp    %edi,%eax
801070bb:	74 ab                	je     80107068 <loaduvm+0x28>
}
801070bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801070c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801070c5:	5b                   	pop    %ebx
801070c6:	5e                   	pop    %esi
801070c7:	5f                   	pop    %edi
801070c8:	5d                   	pop    %ebp
801070c9:	c3                   	ret    
801070ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801070d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801070d3:	31 c0                	xor    %eax,%eax
}
801070d5:	5b                   	pop    %ebx
801070d6:	5e                   	pop    %esi
801070d7:	5f                   	pop    %edi
801070d8:	5d                   	pop    %ebp
801070d9:	c3                   	ret    
      panic("loaduvm: address should exist");
801070da:	83 ec 0c             	sub    $0xc,%esp
801070dd:	68 67 82 10 80       	push   $0x80108267
801070e2:	e8 a9 92 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
801070e7:	83 ec 0c             	sub    $0xc,%esp
801070ea:	68 34 83 10 80       	push   $0x80108334
801070ef:	e8 9c 92 ff ff       	call   80100390 <panic>
801070f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801070fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107100 <allocuvm>:
{
80107100:	55                   	push   %ebp
80107101:	89 e5                	mov    %esp,%ebp
80107103:	57                   	push   %edi
80107104:	56                   	push   %esi
80107105:	53                   	push   %ebx
80107106:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80107109:	8b 7d 10             	mov    0x10(%ebp),%edi
8010710c:	85 ff                	test   %edi,%edi
8010710e:	0f 88 8e 00 00 00    	js     801071a2 <allocuvm+0xa2>
  if(newsz < oldsz)
80107114:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107117:	0f 82 93 00 00 00    	jb     801071b0 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
8010711d:	8b 45 0c             	mov    0xc(%ebp),%eax
80107120:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80107126:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
8010712c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010712f:	0f 86 7e 00 00 00    	jbe    801071b3 <allocuvm+0xb3>
80107135:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80107138:	8b 7d 08             	mov    0x8(%ebp),%edi
8010713b:	eb 42                	jmp    8010717f <allocuvm+0x7f>
8010713d:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80107140:	83 ec 04             	sub    $0x4,%esp
80107143:	68 00 10 00 00       	push   $0x1000
80107148:	6a 00                	push   $0x0
8010714a:	50                   	push   %eax
8010714b:	e8 a0 d7 ff ff       	call   801048f0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80107150:	58                   	pop    %eax
80107151:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80107157:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010715c:	5a                   	pop    %edx
8010715d:	6a 06                	push   $0x6
8010715f:	50                   	push   %eax
80107160:	89 da                	mov    %ebx,%edx
80107162:	89 f8                	mov    %edi,%eax
80107164:	e8 67 fb ff ff       	call   80106cd0 <mappages>
80107169:	83 c4 10             	add    $0x10,%esp
8010716c:	85 c0                	test   %eax,%eax
8010716e:	78 50                	js     801071c0 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80107170:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107176:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80107179:	0f 86 81 00 00 00    	jbe    80107200 <allocuvm+0x100>
    mem = kalloc();
8010717f:	e8 7c b3 ff ff       	call   80102500 <kalloc>
    if(mem == 0){
80107184:	85 c0                	test   %eax,%eax
    mem = kalloc();
80107186:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80107188:	75 b6                	jne    80107140 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
8010718a:	83 ec 0c             	sub    $0xc,%esp
8010718d:	68 85 82 10 80       	push   $0x80108285
80107192:	e8 c9 94 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80107197:	83 c4 10             	add    $0x10,%esp
8010719a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010719d:	39 45 10             	cmp    %eax,0x10(%ebp)
801071a0:	77 6e                	ja     80107210 <allocuvm+0x110>
}
801071a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
801071a5:	31 ff                	xor    %edi,%edi
}
801071a7:	89 f8                	mov    %edi,%eax
801071a9:	5b                   	pop    %ebx
801071aa:	5e                   	pop    %esi
801071ab:	5f                   	pop    %edi
801071ac:	5d                   	pop    %ebp
801071ad:	c3                   	ret    
801071ae:	66 90                	xchg   %ax,%ax
    return oldsz;
801071b0:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
801071b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071b6:	89 f8                	mov    %edi,%eax
801071b8:	5b                   	pop    %ebx
801071b9:	5e                   	pop    %esi
801071ba:	5f                   	pop    %edi
801071bb:	5d                   	pop    %ebp
801071bc:	c3                   	ret    
801071bd:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
801071c0:	83 ec 0c             	sub    $0xc,%esp
801071c3:	68 9d 82 10 80       	push   $0x8010829d
801071c8:	e8 93 94 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
801071cd:	83 c4 10             	add    $0x10,%esp
801071d0:	8b 45 0c             	mov    0xc(%ebp),%eax
801071d3:	39 45 10             	cmp    %eax,0x10(%ebp)
801071d6:	76 0d                	jbe    801071e5 <allocuvm+0xe5>
801071d8:	89 c1                	mov    %eax,%ecx
801071da:	8b 55 10             	mov    0x10(%ebp),%edx
801071dd:	8b 45 08             	mov    0x8(%ebp),%eax
801071e0:	e8 7b fb ff ff       	call   80106d60 <deallocuvm.part.0>
      kfree(mem);
801071e5:	83 ec 0c             	sub    $0xc,%esp
      return 0;
801071e8:	31 ff                	xor    %edi,%edi
      kfree(mem);
801071ea:	56                   	push   %esi
801071eb:	e8 60 b1 ff ff       	call   80102350 <kfree>
      return 0;
801071f0:	83 c4 10             	add    $0x10,%esp
}
801071f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071f6:	89 f8                	mov    %edi,%eax
801071f8:	5b                   	pop    %ebx
801071f9:	5e                   	pop    %esi
801071fa:	5f                   	pop    %edi
801071fb:	5d                   	pop    %ebp
801071fc:	c3                   	ret    
801071fd:	8d 76 00             	lea    0x0(%esi),%esi
80107200:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80107203:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107206:	5b                   	pop    %ebx
80107207:	89 f8                	mov    %edi,%eax
80107209:	5e                   	pop    %esi
8010720a:	5f                   	pop    %edi
8010720b:	5d                   	pop    %ebp
8010720c:	c3                   	ret    
8010720d:	8d 76 00             	lea    0x0(%esi),%esi
80107210:	89 c1                	mov    %eax,%ecx
80107212:	8b 55 10             	mov    0x10(%ebp),%edx
80107215:	8b 45 08             	mov    0x8(%ebp),%eax
      return 0;
80107218:	31 ff                	xor    %edi,%edi
8010721a:	e8 41 fb ff ff       	call   80106d60 <deallocuvm.part.0>
8010721f:	eb 92                	jmp    801071b3 <allocuvm+0xb3>
80107221:	eb 0d                	jmp    80107230 <deallocuvm>
80107223:	90                   	nop
80107224:	90                   	nop
80107225:	90                   	nop
80107226:	90                   	nop
80107227:	90                   	nop
80107228:	90                   	nop
80107229:	90                   	nop
8010722a:	90                   	nop
8010722b:	90                   	nop
8010722c:	90                   	nop
8010722d:	90                   	nop
8010722e:	90                   	nop
8010722f:	90                   	nop

80107230 <deallocuvm>:
{
80107230:	55                   	push   %ebp
80107231:	89 e5                	mov    %esp,%ebp
80107233:	8b 55 0c             	mov    0xc(%ebp),%edx
80107236:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107239:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
8010723c:	39 d1                	cmp    %edx,%ecx
8010723e:	73 10                	jae    80107250 <deallocuvm+0x20>
}
80107240:	5d                   	pop    %ebp
80107241:	e9 1a fb ff ff       	jmp    80106d60 <deallocuvm.part.0>
80107246:	8d 76 00             	lea    0x0(%esi),%esi
80107249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107250:	89 d0                	mov    %edx,%eax
80107252:	5d                   	pop    %ebp
80107253:	c3                   	ret    
80107254:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010725a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107260 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107260:	55                   	push   %ebp
80107261:	89 e5                	mov    %esp,%ebp
80107263:	57                   	push   %edi
80107264:	56                   	push   %esi
80107265:	53                   	push   %ebx
80107266:	83 ec 0c             	sub    $0xc,%esp
80107269:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010726c:	85 f6                	test   %esi,%esi
8010726e:	74 59                	je     801072c9 <freevm+0x69>
80107270:	31 c9                	xor    %ecx,%ecx
80107272:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107277:	89 f0                	mov    %esi,%eax
80107279:	e8 e2 fa ff ff       	call   80106d60 <deallocuvm.part.0>
8010727e:	89 f3                	mov    %esi,%ebx
80107280:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107286:	eb 0f                	jmp    80107297 <freevm+0x37>
80107288:	90                   	nop
80107289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107290:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107293:	39 fb                	cmp    %edi,%ebx
80107295:	74 23                	je     801072ba <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80107297:	8b 03                	mov    (%ebx),%eax
80107299:	a8 01                	test   $0x1,%al
8010729b:	74 f3                	je     80107290 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
8010729d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
801072a2:	83 ec 0c             	sub    $0xc,%esp
801072a5:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
801072a8:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
801072ad:	50                   	push   %eax
801072ae:	e8 9d b0 ff ff       	call   80102350 <kfree>
801072b3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
801072b6:	39 fb                	cmp    %edi,%ebx
801072b8:	75 dd                	jne    80107297 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
801072ba:	89 75 08             	mov    %esi,0x8(%ebp)
}
801072bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801072c0:	5b                   	pop    %ebx
801072c1:	5e                   	pop    %esi
801072c2:	5f                   	pop    %edi
801072c3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
801072c4:	e9 87 b0 ff ff       	jmp    80102350 <kfree>
    panic("freevm: no pgdir");
801072c9:	83 ec 0c             	sub    $0xc,%esp
801072cc:	68 b9 82 10 80       	push   $0x801082b9
801072d1:	e8 ba 90 ff ff       	call   80100390 <panic>
801072d6:	8d 76 00             	lea    0x0(%esi),%esi
801072d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801072e0 <setupkvm>:
{
801072e0:	55                   	push   %ebp
801072e1:	89 e5                	mov    %esp,%ebp
801072e3:	56                   	push   %esi
801072e4:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
801072e5:	e8 16 b2 ff ff       	call   80102500 <kalloc>
801072ea:	85 c0                	test   %eax,%eax
801072ec:	89 c6                	mov    %eax,%esi
801072ee:	74 42                	je     80107332 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
801072f0:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801072f3:	bb 20 b4 10 80       	mov    $0x8010b420,%ebx
  memset(pgdir, 0, PGSIZE);
801072f8:	68 00 10 00 00       	push   $0x1000
801072fd:	6a 00                	push   $0x0
801072ff:	50                   	push   %eax
80107300:	e8 eb d5 ff ff       	call   801048f0 <memset>
80107305:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80107308:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010730b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010730e:	83 ec 08             	sub    $0x8,%esp
80107311:	8b 13                	mov    (%ebx),%edx
80107313:	ff 73 0c             	pushl  0xc(%ebx)
80107316:	50                   	push   %eax
80107317:	29 c1                	sub    %eax,%ecx
80107319:	89 f0                	mov    %esi,%eax
8010731b:	e8 b0 f9 ff ff       	call   80106cd0 <mappages>
80107320:	83 c4 10             	add    $0x10,%esp
80107323:	85 c0                	test   %eax,%eax
80107325:	78 19                	js     80107340 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107327:	83 c3 10             	add    $0x10,%ebx
8010732a:	81 fb 60 b4 10 80    	cmp    $0x8010b460,%ebx
80107330:	75 d6                	jne    80107308 <setupkvm+0x28>
}
80107332:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107335:	89 f0                	mov    %esi,%eax
80107337:	5b                   	pop    %ebx
80107338:	5e                   	pop    %esi
80107339:	5d                   	pop    %ebp
8010733a:	c3                   	ret    
8010733b:	90                   	nop
8010733c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80107340:	83 ec 0c             	sub    $0xc,%esp
80107343:	56                   	push   %esi
      return 0;
80107344:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80107346:	e8 15 ff ff ff       	call   80107260 <freevm>
      return 0;
8010734b:	83 c4 10             	add    $0x10,%esp
}
8010734e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107351:	89 f0                	mov    %esi,%eax
80107353:	5b                   	pop    %ebx
80107354:	5e                   	pop    %esi
80107355:	5d                   	pop    %ebp
80107356:	c3                   	ret    
80107357:	89 f6                	mov    %esi,%esi
80107359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107360 <kvmalloc>:
{
80107360:	55                   	push   %ebp
80107361:	89 e5                	mov    %esp,%ebp
80107363:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107366:	e8 75 ff ff ff       	call   801072e0 <setupkvm>
8010736b:	a3 84 70 11 80       	mov    %eax,0x80117084
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107370:	05 00 00 00 80       	add    $0x80000000,%eax
80107375:	0f 22 d8             	mov    %eax,%cr3
}
80107378:	c9                   	leave  
80107379:	c3                   	ret    
8010737a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107380 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107380:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107381:	31 c9                	xor    %ecx,%ecx
{
80107383:	89 e5                	mov    %esp,%ebp
80107385:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107388:	8b 55 0c             	mov    0xc(%ebp),%edx
8010738b:	8b 45 08             	mov    0x8(%ebp),%eax
8010738e:	e8 bd f8 ff ff       	call   80106c50 <walkpgdir>
  if(pte == 0)
80107393:	85 c0                	test   %eax,%eax
80107395:	74 05                	je     8010739c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80107397:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010739a:	c9                   	leave  
8010739b:	c3                   	ret    
    panic("clearpteu");
8010739c:	83 ec 0c             	sub    $0xc,%esp
8010739f:	68 ca 82 10 80       	push   $0x801082ca
801073a4:	e8 e7 8f ff ff       	call   80100390 <panic>
801073a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801073b0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801073b0:	55                   	push   %ebp
801073b1:	89 e5                	mov    %esp,%ebp
801073b3:	57                   	push   %edi
801073b4:	56                   	push   %esi
801073b5:	53                   	push   %ebx
801073b6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801073b9:	e8 22 ff ff ff       	call   801072e0 <setupkvm>
801073be:	85 c0                	test   %eax,%eax
801073c0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801073c3:	0f 84 9f 00 00 00    	je     80107468 <copyuvm+0xb8>
    return 0;
  for(i = PGSIZE; i < sz; i += PGSIZE){
801073c9:	81 7d 0c 00 10 00 00 	cmpl   $0x1000,0xc(%ebp)
801073d0:	0f 86 92 00 00 00    	jbe    80107468 <copyuvm+0xb8>
801073d6:	bf 00 10 00 00       	mov    $0x1000,%edi
801073db:	eb 45                	jmp    80107422 <copyuvm+0x72>
801073dd:	8d 76 00             	lea    0x0(%esi),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
801073e0:	83 ec 04             	sub    $0x4,%esp
801073e3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
801073e9:	68 00 10 00 00       	push   $0x1000
801073ee:	53                   	push   %ebx
801073ef:	50                   	push   %eax
801073f0:	e8 ab d5 ff ff       	call   801049a0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
801073f5:	58                   	pop    %eax
801073f6:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801073fc:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107401:	5a                   	pop    %edx
80107402:	ff 75 e4             	pushl  -0x1c(%ebp)
80107405:	50                   	push   %eax
80107406:	89 fa                	mov    %edi,%edx
80107408:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010740b:	e8 c0 f8 ff ff       	call   80106cd0 <mappages>
80107410:	83 c4 10             	add    $0x10,%esp
80107413:	85 c0                	test   %eax,%eax
80107415:	78 61                	js     80107478 <copyuvm+0xc8>
  for(i = PGSIZE; i < sz; i += PGSIZE){
80107417:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010741d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80107420:	76 46                	jbe    80107468 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107422:	8b 45 08             	mov    0x8(%ebp),%eax
80107425:	31 c9                	xor    %ecx,%ecx
80107427:	89 fa                	mov    %edi,%edx
80107429:	e8 22 f8 ff ff       	call   80106c50 <walkpgdir>
8010742e:	85 c0                	test   %eax,%eax
80107430:	74 61                	je     80107493 <copyuvm+0xe3>
    if(!(*pte & PTE_P))
80107432:	8b 00                	mov    (%eax),%eax
80107434:	a8 01                	test   $0x1,%al
80107436:	74 4e                	je     80107486 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
80107438:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
8010743a:	25 ff 0f 00 00       	and    $0xfff,%eax
    pa = PTE_ADDR(*pte);
8010743f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80107445:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80107448:	e8 b3 b0 ff ff       	call   80102500 <kalloc>
8010744d:	85 c0                	test   %eax,%eax
8010744f:	89 c6                	mov    %eax,%esi
80107451:	75 8d                	jne    801073e0 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80107453:	83 ec 0c             	sub    $0xc,%esp
80107456:	ff 75 e0             	pushl  -0x20(%ebp)
80107459:	e8 02 fe ff ff       	call   80107260 <freevm>
  return 0;
8010745e:	83 c4 10             	add    $0x10,%esp
80107461:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80107468:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010746b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010746e:	5b                   	pop    %ebx
8010746f:	5e                   	pop    %esi
80107470:	5f                   	pop    %edi
80107471:	5d                   	pop    %ebp
80107472:	c3                   	ret    
80107473:	90                   	nop
80107474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80107478:	83 ec 0c             	sub    $0xc,%esp
8010747b:	56                   	push   %esi
8010747c:	e8 cf ae ff ff       	call   80102350 <kfree>
      goto bad;
80107481:	83 c4 10             	add    $0x10,%esp
80107484:	eb cd                	jmp    80107453 <copyuvm+0xa3>
      panic("copyuvm: page not present");
80107486:	83 ec 0c             	sub    $0xc,%esp
80107489:	68 ee 82 10 80       	push   $0x801082ee
8010748e:	e8 fd 8e ff ff       	call   80100390 <panic>
      panic("copyuvm: pte should exist");
80107493:	83 ec 0c             	sub    $0xc,%esp
80107496:	68 d4 82 10 80       	push   $0x801082d4
8010749b:	e8 f0 8e ff ff       	call   80100390 <panic>

801074a0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801074a0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801074a1:	31 c9                	xor    %ecx,%ecx
{
801074a3:	89 e5                	mov    %esp,%ebp
801074a5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
801074a8:	8b 55 0c             	mov    0xc(%ebp),%edx
801074ab:	8b 45 08             	mov    0x8(%ebp),%eax
801074ae:	e8 9d f7 ff ff       	call   80106c50 <walkpgdir>
  if((*pte & PTE_P) == 0)
801074b3:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
801074b5:	c9                   	leave  
  if((*pte & PTE_U) == 0)
801074b6:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801074b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
801074bd:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801074c0:	05 00 00 00 80       	add    $0x80000000,%eax
801074c5:	83 fa 05             	cmp    $0x5,%edx
801074c8:	ba 00 00 00 00       	mov    $0x0,%edx
801074cd:	0f 45 c2             	cmovne %edx,%eax
}
801074d0:	c3                   	ret    
801074d1:	eb 0d                	jmp    801074e0 <copyout>
801074d3:	90                   	nop
801074d4:	90                   	nop
801074d5:	90                   	nop
801074d6:	90                   	nop
801074d7:	90                   	nop
801074d8:	90                   	nop
801074d9:	90                   	nop
801074da:	90                   	nop
801074db:	90                   	nop
801074dc:	90                   	nop
801074dd:	90                   	nop
801074de:	90                   	nop
801074df:	90                   	nop

801074e0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801074e0:	55                   	push   %ebp
801074e1:	89 e5                	mov    %esp,%ebp
801074e3:	57                   	push   %edi
801074e4:	56                   	push   %esi
801074e5:	53                   	push   %ebx
801074e6:	83 ec 1c             	sub    $0x1c,%esp
801074e9:	8b 5d 14             	mov    0x14(%ebp),%ebx
801074ec:	8b 55 0c             	mov    0xc(%ebp),%edx
801074ef:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801074f2:	85 db                	test   %ebx,%ebx
801074f4:	75 40                	jne    80107536 <copyout+0x56>
801074f6:	eb 70                	jmp    80107568 <copyout+0x88>
801074f8:	90                   	nop
801074f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107500:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107503:	89 f1                	mov    %esi,%ecx
80107505:	29 d1                	sub    %edx,%ecx
80107507:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010750d:	39 d9                	cmp    %ebx,%ecx
8010750f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107512:	29 f2                	sub    %esi,%edx
80107514:	83 ec 04             	sub    $0x4,%esp
80107517:	01 d0                	add    %edx,%eax
80107519:	51                   	push   %ecx
8010751a:	57                   	push   %edi
8010751b:	50                   	push   %eax
8010751c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010751f:	e8 7c d4 ff ff       	call   801049a0 <memmove>
    len -= n;
    buf += n;
80107524:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80107527:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
8010752a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
80107530:	01 cf                	add    %ecx,%edi
  while(len > 0){
80107532:	29 cb                	sub    %ecx,%ebx
80107534:	74 32                	je     80107568 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107536:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107538:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
8010753b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010753e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107544:	56                   	push   %esi
80107545:	ff 75 08             	pushl  0x8(%ebp)
80107548:	e8 53 ff ff ff       	call   801074a0 <uva2ka>
    if(pa0 == 0)
8010754d:	83 c4 10             	add    $0x10,%esp
80107550:	85 c0                	test   %eax,%eax
80107552:	75 ac                	jne    80107500 <copyout+0x20>
  }
  return 0;
}
80107554:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80107557:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010755c:	5b                   	pop    %ebx
8010755d:	5e                   	pop    %esi
8010755e:	5f                   	pop    %edi
8010755f:	5d                   	pop    %ebp
80107560:	c3                   	ret    
80107561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107568:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010756b:	31 c0                	xor    %eax,%eax
}
8010756d:	5b                   	pop    %ebx
8010756e:	5e                   	pop    %esi
8010756f:	5f                   	pop    %edi
80107570:	5d                   	pop    %ebp
80107571:	c3                   	ret    
80107572:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107580 <mprotect>:

//mprotect system call makes page table entries only readable, non-writable
int
mprotect(void *addr, int len){
80107580:	55                   	push   %ebp
80107581:	89 e5                	mov    %esp,%ebp
80107583:	57                   	push   %edi
80107584:	56                   	push   %esi
80107585:	53                   	push   %ebx
80107586:	83 ec 0c             	sub    $0xc,%esp
80107589:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct proc *curproc = myproc();
8010758c:	e8 0f c3 ff ff       	call   801038a0 <myproc>
  
  //Check if addr points to a region that is not currently a part of the address space
  if(len <= 0 || (int)addr+len*PGSIZE>curproc->sz){
80107591:	85 f6                	test   %esi,%esi
80107593:	0f 8e 8c 00 00 00    	jle    80107625 <mprotect+0xa5>
80107599:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010759c:	c1 e6 0c             	shl    $0xc,%esi
8010759f:	89 c7                	mov    %eax,%edi
801075a1:	01 de                	add    %ebx,%esi
801075a3:	3b 30                	cmp    (%eax),%esi
801075a5:	77 7e                	ja     80107625 <mprotect+0xa5>
    cprintf("\nwrong len\n");
    return -1;
  }

  //Check if addr is not page aligned
  if((int)(((int) addr) % PGSIZE )  != 0){
801075a7:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801075ad:	0f 85 89 00 00 00    	jne    8010763c <mprotect+0xbc>

  
  //loop for each page
  pte_t *pte;
  int i;
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
801075b3:	39 f3                	cmp    %esi,%ebx
801075b5:	7c 35                	jl     801075ec <mprotect+0x6c>
801075b7:	eb 57                	jmp    80107610 <mprotect+0x90>
801075b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // Getting the address of the PTE in the current process's page table (pgdir)
    // that corresponds to virtual address (i)
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
801075c0:	8b 10                	mov    (%eax),%edx
801075c2:	89 d1                	mov    %edx,%ecx
801075c4:	83 e1 05             	and    $0x5,%ecx
801075c7:	83 f9 05             	cmp    $0x5,%ecx
801075ca:	75 30                	jne    801075fc <mprotect+0x7c>
      *pte = (*pte) & (~PTE_W) ; //Clearing the write bit 
      cprintf("\nPTE : 0x%p\n", pte);
801075cc:	83 ec 08             	sub    $0x8,%esp
      *pte = (*pte) & (~PTE_W) ; //Clearing the write bit 
801075cf:	83 e2 fd             	and    $0xfffffffd,%edx
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
801075d2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
      *pte = (*pte) & (~PTE_W) ; //Clearing the write bit 
801075d8:	89 10                	mov    %edx,(%eax)
      cprintf("\nPTE : 0x%p\n", pte);
801075da:	50                   	push   %eax
801075db:	68 24 83 10 80       	push   $0x80108324
801075e0:	e8 7b 90 ff ff       	call   80100660 <cprintf>
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
801075e5:	83 c4 10             	add    $0x10,%esp
801075e8:	39 de                	cmp    %ebx,%esi
801075ea:	7e 24                	jle    80107610 <mprotect+0x90>
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
801075ec:	8b 47 04             	mov    0x4(%edi),%eax
801075ef:	31 c9                	xor    %ecx,%ecx
801075f1:	89 da                	mov    %ebx,%edx
801075f3:	e8 58 f6 ff ff       	call   80106c50 <walkpgdir>
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
801075f8:	85 c0                	test   %eax,%eax
801075fa:	75 c4                	jne    801075c0 <mprotect+0x40>
    } else {
      return -1;
801075fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  //Reloading the Control register 3 with the address of page directory 
  //to flush TLB
  lcr3(V2P(curproc->pgdir));  
return 0;
}
80107601:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107604:	5b                   	pop    %ebx
80107605:	5e                   	pop    %esi
80107606:	5f                   	pop    %edi
80107607:	5d                   	pop    %ebp
80107608:	c3                   	ret    
80107609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  lcr3(V2P(curproc->pgdir));  
80107610:	8b 47 04             	mov    0x4(%edi),%eax
80107613:	05 00 00 00 80       	add    $0x80000000,%eax
80107618:	0f 22 d8             	mov    %eax,%cr3
}
8010761b:	8d 65 f4             	lea    -0xc(%ebp),%esp
return 0;
8010761e:	31 c0                	xor    %eax,%eax
}
80107620:	5b                   	pop    %ebx
80107621:	5e                   	pop    %esi
80107622:	5f                   	pop    %edi
80107623:	5d                   	pop    %ebp
80107624:	c3                   	ret    
    cprintf("\nwrong len\n");
80107625:	83 ec 0c             	sub    $0xc,%esp
80107628:	68 08 83 10 80       	push   $0x80108308
8010762d:	e8 2e 90 ff ff       	call   80100660 <cprintf>
    return -1;
80107632:	83 c4 10             	add    $0x10,%esp
80107635:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010763a:	eb c5                	jmp    80107601 <mprotect+0x81>
    cprintf("\nwrong addr %p\n", addr);
8010763c:	83 ec 08             	sub    $0x8,%esp
8010763f:	ff 75 08             	pushl  0x8(%ebp)
80107642:	68 14 83 10 80       	push   $0x80108314
80107647:	e8 14 90 ff ff       	call   80100660 <cprintf>
    return -1;
8010764c:	83 c4 10             	add    $0x10,%esp
8010764f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107654:	eb ab                	jmp    80107601 <mprotect+0x81>
80107656:	8d 76 00             	lea    0x0(%esi),%esi
80107659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107660 <munprotect>:

//mprotect system call makes page table entries both readable and writable
int
munprotect(void *addr, int len){
80107660:	55                   	push   %ebp
80107661:	89 e5                	mov    %esp,%ebp
80107663:	57                   	push   %edi
80107664:	56                   	push   %esi
80107665:	53                   	push   %ebx
80107666:	83 ec 0c             	sub    $0xc,%esp
80107669:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct proc *curproc = myproc();
8010766c:	e8 2f c2 ff ff       	call   801038a0 <myproc>
  
  //Check if addr points to a region that is not currently a part of the address space
  if(len <= 0 || (int)addr+len*PGSIZE>curproc->sz){
80107671:	85 f6                	test   %esi,%esi
80107673:	0f 8e 8c 00 00 00    	jle    80107705 <munprotect+0xa5>
80107679:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010767c:	c1 e6 0c             	shl    $0xc,%esi
8010767f:	89 c7                	mov    %eax,%edi
80107681:	01 de                	add    %ebx,%esi
80107683:	3b 30                	cmp    (%eax),%esi
80107685:	77 7e                	ja     80107705 <munprotect+0xa5>
    cprintf("\nwrong len\n");
    return -1;
  }

  //Check if addr is not page aligned
  if((int)(((int) addr) % PGSIZE )  != 0){
80107687:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
8010768d:	0f 85 89 00 00 00    	jne    8010771c <munprotect+0xbc>
  }

  //loop for each page
  pte_t *pte;
  int i;
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
80107693:	39 f3                	cmp    %esi,%ebx
80107695:	7c 35                	jl     801076cc <munprotect+0x6c>
80107697:	eb 57                	jmp    801076f0 <munprotect+0x90>
80107699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // Getting the address of the PTE in the current process's page table (pgdir)
    // that corresponds to virtual address (i)
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
801076a0:	8b 10                	mov    (%eax),%edx
801076a2:	89 d1                	mov    %edx,%ecx
801076a4:	83 e1 05             	and    $0x5,%ecx
801076a7:	83 f9 05             	cmp    $0x5,%ecx
801076aa:	75 30                	jne    801076dc <munprotect+0x7c>
      *pte = (*pte) | (PTE_W) ; //Setting the write bit 
      cprintf("\nPTE : 0x%p\n", pte);
801076ac:	83 ec 08             	sub    $0x8,%esp
      *pte = (*pte) | (PTE_W) ; //Setting the write bit 
801076af:	83 ca 02             	or     $0x2,%edx
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
801076b2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
      *pte = (*pte) | (PTE_W) ; //Setting the write bit 
801076b8:	89 10                	mov    %edx,(%eax)
      cprintf("\nPTE : 0x%p\n", pte);
801076ba:	50                   	push   %eax
801076bb:	68 24 83 10 80       	push   $0x80108324
801076c0:	e8 9b 8f ff ff       	call   80100660 <cprintf>
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
801076c5:	83 c4 10             	add    $0x10,%esp
801076c8:	39 de                	cmp    %ebx,%esi
801076ca:	7e 24                	jle    801076f0 <munprotect+0x90>
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
801076cc:	8b 47 04             	mov    0x4(%edi),%eax
801076cf:	31 c9                	xor    %ecx,%ecx
801076d1:	89 da                	mov    %ebx,%edx
801076d3:	e8 78 f5 ff ff       	call   80106c50 <walkpgdir>
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
801076d8:	85 c0                	test   %eax,%eax
801076da:	75 c4                	jne    801076a0 <munprotect+0x40>
    } else {
      return -1;
801076dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  //Reloading the Control register 3 with the address of page directory 
  //to flush TLB
  lcr3(V2P(curproc->pgdir));
  
  return 0;
}
801076e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801076e4:	5b                   	pop    %ebx
801076e5:	5e                   	pop    %esi
801076e6:	5f                   	pop    %edi
801076e7:	5d                   	pop    %ebp
801076e8:	c3                   	ret    
801076e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  lcr3(V2P(curproc->pgdir));
801076f0:	8b 47 04             	mov    0x4(%edi),%eax
801076f3:	05 00 00 00 80       	add    $0x80000000,%eax
801076f8:	0f 22 d8             	mov    %eax,%cr3
}
801076fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801076fe:	31 c0                	xor    %eax,%eax
}
80107700:	5b                   	pop    %ebx
80107701:	5e                   	pop    %esi
80107702:	5f                   	pop    %edi
80107703:	5d                   	pop    %ebp
80107704:	c3                   	ret    
    cprintf("\nwrong len\n");
80107705:	83 ec 0c             	sub    $0xc,%esp
80107708:	68 08 83 10 80       	push   $0x80108308
8010770d:	e8 4e 8f ff ff       	call   80100660 <cprintf>
    return -1;
80107712:	83 c4 10             	add    $0x10,%esp
80107715:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010771a:	eb c5                	jmp    801076e1 <munprotect+0x81>
    cprintf("\nwrong addr %p\n", addr);
8010771c:	83 ec 08             	sub    $0x8,%esp
8010771f:	ff 75 08             	pushl  0x8(%ebp)
80107722:	68 14 83 10 80       	push   $0x80108314
80107727:	e8 34 8f ff ff       	call   80100660 <cprintf>
    return -1;
8010772c:	83 c4 10             	add    $0x10,%esp
8010772f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107734:	eb ab                	jmp    801076e1 <munprotect+0x81>
80107736:	66 90                	xchg   %ax,%ax
80107738:	66 90                	xchg   %ax,%ax
8010773a:	66 90                	xchg   %ax,%ax
8010773c:	66 90                	xchg   %ax,%ax
8010773e:	66 90                	xchg   %ax,%ax

80107740 <sgenrand>:
80107740:	55                   	push   %ebp
80107741:	b8 e4 b5 10 80       	mov    $0x8010b5e4,%eax
80107746:	b9 9c bf 10 80       	mov    $0x8010bf9c,%ecx
8010774b:	89 e5                	mov    %esp,%ebp
8010774d:	8b 55 08             	mov    0x8(%ebp),%edx
80107750:	89 15 e0 b5 10 80    	mov    %edx,0x8010b5e0
80107756:	eb 0b                	jmp    80107763 <sgenrand+0x23>
80107758:	90                   	nop
80107759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107760:	83 c0 04             	add    $0x4,%eax
80107763:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
80107769:	39 c1                	cmp    %eax,%ecx
8010776b:	89 10                	mov    %edx,(%eax)
8010776d:	75 f1                	jne    80107760 <sgenrand+0x20>
8010776f:	c7 05 60 b4 10 80 70 	movl   $0x270,0x8010b460
80107776:	02 00 00 
80107779:	5d                   	pop    %ebp
8010777a:	c3                   	ret    
8010777b:	90                   	nop
8010777c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107780 <genrand>:
80107780:	a1 60 b4 10 80       	mov    0x8010b460,%eax
80107785:	55                   	push   %ebp
80107786:	89 e5                	mov    %esp,%ebp
80107788:	56                   	push   %esi
80107789:	53                   	push   %ebx
8010778a:	3d 6f 02 00 00       	cmp    $0x26f,%eax
8010778f:	0f 8e f9 00 00 00    	jle    8010788e <genrand+0x10e>
80107795:	3d 71 02 00 00       	cmp    $0x271,%eax
8010779a:	0f 84 fa 00 00 00    	je     8010789a <genrand+0x11a>
801077a0:	ba e0 b5 10 80       	mov    $0x8010b5e0,%edx
801077a5:	bb 6c b9 10 80       	mov    $0x8010b96c,%ebx
801077aa:	89 d1                	mov    %edx,%ecx
801077ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801077b0:	8b 01                	mov    (%ecx),%eax
801077b2:	8b 71 04             	mov    0x4(%ecx),%esi
801077b5:	83 c1 04             	add    $0x4,%ecx
801077b8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
801077be:	25 00 00 00 80       	and    $0x80000000,%eax
801077c3:	09 f0                	or     %esi,%eax
801077c5:	89 c6                	mov    %eax,%esi
801077c7:	83 e0 01             	and    $0x1,%eax
801077ca:	d1 ee                	shr    %esi
801077cc:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
801077d2:	33 34 85 58 83 10 80 	xor    -0x7fef7ca8(,%eax,4),%esi
801077d9:	89 71 fc             	mov    %esi,-0x4(%ecx)
801077dc:	39 cb                	cmp    %ecx,%ebx
801077de:	75 d0                	jne    801077b0 <genrand+0x30>
801077e0:	b9 10 bc 10 80       	mov    $0x8010bc10,%ecx
801077e5:	8d 76 00             	lea    0x0(%esi),%esi
801077e8:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
801077ee:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
801077f4:	83 c2 04             	add    $0x4,%edx
801077f7:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
801077fd:	25 00 00 00 80       	and    $0x80000000,%eax
80107802:	09 d8                	or     %ebx,%eax
80107804:	89 c3                	mov    %eax,%ebx
80107806:	83 e0 01             	and    $0x1,%eax
80107809:	d1 eb                	shr    %ebx
8010780b:	33 5a fc             	xor    -0x4(%edx),%ebx
8010780e:	33 1c 85 58 83 10 80 	xor    -0x7fef7ca8(,%eax,4),%ebx
80107815:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
8010781b:	39 d1                	cmp    %edx,%ecx
8010781d:	75 c9                	jne    801077e8 <genrand+0x68>
8010781f:	a1 e0 b5 10 80       	mov    0x8010b5e0,%eax
80107824:	8b 0d 9c bf 10 80    	mov    0x8010bf9c,%ecx
8010782a:	89 c2                	mov    %eax,%edx
8010782c:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
80107832:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
80107838:	09 d1                	or     %edx,%ecx
8010783a:	89 ca                	mov    %ecx,%edx
8010783c:	83 e1 01             	and    $0x1,%ecx
8010783f:	d1 ea                	shr    %edx
80107841:	33 15 10 bc 10 80    	xor    0x8010bc10,%edx
80107847:	33 14 8d 58 83 10 80 	xor    -0x7fef7ca8(,%ecx,4),%edx
8010784e:	89 15 9c bf 10 80    	mov    %edx,0x8010bf9c
80107854:	ba 01 00 00 00       	mov    $0x1,%edx
80107859:	89 15 60 b4 10 80    	mov    %edx,0x8010b460
8010785f:	89 c2                	mov    %eax,%edx
80107861:	c1 ea 0b             	shr    $0xb,%edx
80107864:	31 c2                	xor    %eax,%edx
80107866:	89 d0                	mov    %edx,%eax
80107868:	c1 e0 07             	shl    $0x7,%eax
8010786b:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
80107870:	31 c2                	xor    %eax,%edx
80107872:	89 d0                	mov    %edx,%eax
80107874:	c1 e0 0f             	shl    $0xf,%eax
80107877:	25 00 00 c6 ef       	and    $0xefc60000,%eax
8010787c:	31 d0                	xor    %edx,%eax
8010787e:	89 c2                	mov    %eax,%edx
80107880:	c1 ea 12             	shr    $0x12,%edx
80107883:	31 d0                	xor    %edx,%eax
80107885:	5b                   	pop    %ebx
80107886:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
8010788b:	5e                   	pop    %esi
8010788c:	5d                   	pop    %ebp
8010788d:	c3                   	ret    
8010788e:	8d 50 01             	lea    0x1(%eax),%edx
80107891:	8b 04 85 e0 b5 10 80 	mov    -0x7fef4a20(,%eax,4),%eax
80107898:	eb bf                	jmp    80107859 <genrand+0xd9>
8010789a:	c7 05 e0 b5 10 80 05 	movl   $0x1105,0x8010b5e0
801078a1:	11 00 00 
801078a4:	b8 e4 b5 10 80       	mov    $0x8010b5e4,%eax
801078a9:	b9 9c bf 10 80       	mov    $0x8010bf9c,%ecx
801078ae:	ba 05 11 00 00       	mov    $0x1105,%edx
801078b3:	eb 06                	jmp    801078bb <genrand+0x13b>
801078b5:	8d 76 00             	lea    0x0(%esi),%esi
801078b8:	83 c0 04             	add    $0x4,%eax
801078bb:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
801078c1:	39 c1                	cmp    %eax,%ecx
801078c3:	89 10                	mov    %edx,(%eax)
801078c5:	75 f1                	jne    801078b8 <genrand+0x138>
801078c7:	e9 d4 fe ff ff       	jmp    801077a0 <genrand+0x20>
801078cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801078d0 <random_at_most>:
801078d0:	55                   	push   %ebp
801078d1:	31 d2                	xor    %edx,%edx
801078d3:	89 e5                	mov    %esp,%ebp
801078d5:	56                   	push   %esi
801078d6:	53                   	push   %ebx
801078d7:	8b 45 08             	mov    0x8(%ebp),%eax
801078da:	bb 00 00 00 80       	mov    $0x80000000,%ebx
801078df:	8d 48 01             	lea    0x1(%eax),%ecx
801078e2:	89 d8                	mov    %ebx,%eax
801078e4:	f7 f1                	div    %ecx
801078e6:	89 c6                	mov    %eax,%esi
801078e8:	29 d3                	sub    %edx,%ebx
801078ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801078f0:	e8 8b fe ff ff       	call   80107780 <genrand>
801078f5:	39 d8                	cmp    %ebx,%eax
801078f7:	73 f7                	jae    801078f0 <random_at_most+0x20>
801078f9:	31 d2                	xor    %edx,%edx
801078fb:	f7 f6                	div    %esi
801078fd:	5b                   	pop    %ebx
801078fe:	5e                   	pop    %esi
801078ff:	5d                   	pop    %ebp
80107900:	c3                   	ret    
