
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
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb d4 cf 10 80       	mov    $0x8010cfd4,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 40 76 10 80       	push   $0x80107640
80100051:	68 a0 cf 10 80       	push   $0x8010cfa0
80100056:	e8 f5 43 00 00       	call   80104450 <initlock>
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 ec 16 11 80 9c 	movl   $0x8011169c,0x801116ec
80100062:	16 11 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 f0 16 11 80 9c 	movl   $0x8011169c,0x801116f0
8010006c:	16 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 9c 16 11 80       	mov    $0x8011169c,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 9c 16 11 80 	movl   $0x8011169c,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 47 76 10 80       	push   $0x80107647
80100097:	50                   	push   %eax
80100098:	e8 83 42 00 00       	call   80104320 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 f0 16 11 80       	mov    0x801116f0,%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    bcache.head.next = b;
801000b0:	89 1d f0 16 11 80    	mov    %ebx,0x801116f0
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d 9c 16 11 80       	cmp    $0x8011169c,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000df:	68 a0 cf 10 80       	push   $0x8010cfa0
801000e4:	e8 a7 44 00 00       	call   80104590 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d f0 16 11 80    	mov    0x801116f0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d ec 16 11 80    	mov    0x801116ec,%ebx
80100126:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 a0 cf 10 80       	push   $0x8010cfa0
80100162:	e8 e9 44 00 00       	call   80104650 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ee 41 00 00       	call   80104360 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 dd 1f 00 00       	call   80102160 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 4e 76 10 80       	push   $0x8010764e
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 4d 42 00 00       	call   80104400 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
  iderw(b);
801001c4:	e9 97 1f 00 00       	jmp    80102160 <iderw>
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 5f 76 10 80       	push   $0x8010765f
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 0c 42 00 00       	call   80104400 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 bc 41 00 00       	call   801043c0 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 a0 cf 10 80 	movl   $0x8010cfa0,(%esp)
8010020b:	e8 80 43 00 00       	call   80104590 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 f0 16 11 80       	mov    0x801116f0,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 9c 16 11 80 	movl   $0x8011169c,0x50(%ebx)
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100241:	a1 f0 16 11 80       	mov    0x801116f0,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d f0 16 11 80    	mov    %ebx,0x801116f0
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 a0 cf 10 80 	movl   $0x8010cfa0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
  release(&bcache.lock);
8010025c:	e9 ef 43 00 00       	jmp    80104650 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 66 76 10 80       	push   $0x80107666
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 1b 15 00 00       	call   801017a0 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010028c:	e8 ff 42 00 00       	call   80104590 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
    while(input.r == input.w){
801002a1:	8b 15 80 19 11 80    	mov    0x80111980,%edx
801002a7:	39 15 84 19 11 80    	cmp    %edx,0x80111984
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 b5 10 80       	push   $0x8010b520
801002c0:	68 80 19 11 80       	push   $0x80111980
801002c5:	e8 f6 3b 00 00       	call   80103ec0 <sleep>
    while(input.r == input.w){
801002ca:	8b 15 80 19 11 80    	mov    0x80111980,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 84 19 11 80    	cmp    0x80111984,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
      if(myproc()->killed){
801002db:	e8 c0 35 00 00       	call   801038a0 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
        release(&cons.lock);
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 b5 10 80       	push   $0x8010b520
801002ef:	e8 5c 43 00 00       	call   80104650 <release>
        ilock(ip);
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 c4 13 00 00       	call   801016c0 <ilock>
        return -1;
801002fc:	83 c4 10             	add    $0x10,%esp
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 80 19 11 80       	mov    %eax,0x80111980
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 00 19 11 80 	movsbl -0x7feee700(%eax),%eax
    if(c == C('D')){  // EOF
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
    *dst++ = c;
80100329:	83 c6 01             	add    $0x1,%esi
    --n;
8010032c:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
8010032f:	83 f8 0a             	cmp    $0xa,%eax
    *dst++ = c;
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
    if(c == '\n')
80100335:	74 43                	je     8010037a <consoleread+0x10a>
  while(n > 0){
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
  release(&cons.lock);
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 b5 10 80       	push   $0x8010b520
8010034d:	e8 fe 42 00 00       	call   80104650 <release>
  ilock(ip);
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 66 13 00 00       	call   801016c0 <ilock>
  return target - n;
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
}
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
      if(n < target){
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
        input.r--;
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
{
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100398:	fa                   	cli    
  cons.locking = 0;
80100399:	c7 05 54 b5 10 80 00 	movl   $0x0,0x8010b554
801003a0:	00 00 00 
  getcallerpcs(&s, pcs);
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
801003a9:	e8 c2 23 00 00       	call   80102770 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 6d 76 10 80       	push   $0x8010766d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 cf 7f 10 80 	movl   $0x80107fcf,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 93 40 00 00       	call   80104470 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 81 76 10 80       	push   $0x80107681
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
  for(i=0; i<10; i++)
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003f9:	c7 05 58 b5 10 80 01 	movl   $0x1,0x8010b558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
  if(panicked){
80100410:	8b 0d 58 b5 10 80    	mov    0x8010b558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
{
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
  if(c == BACKSPACE){
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
    uartputc(c);
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 81 5a 00 00       	call   80105ec0 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100457:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
  pos |= inb(CRTPORT+1);
8010046d:	09 fb                	or     %edi,%ebx
  if(c == '\n')
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
  else if(c == BACKSPACE){
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
  if(pos < 0 || pos > 25*80)
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
  if((pos/80) >= 24){  // Scroll up.
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
  outb(CRTPORT+1, pos>>8);
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
  crt[pos] = ' ' | 0x0700;
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
}
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 cf 59 00 00       	call   80105ec0 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 c3 59 00 00       	call   80105ec0 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 b7 59 00 00       	call   80105ec0 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
    pos -= 80;
80100517:	83 eb 50             	sub    $0x50,%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 27 42 00 00       	call   80104750 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 5a 41 00 00       	call   801046a0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
    panic("pos under/overflow");
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 85 76 10 80       	push   $0x80107685
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
    if(pos > 0) --pos;
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
    pos += 80 - pos%80;
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  if(sign && (sign = xx < 0))
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
    x = xx;
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  i = 0;
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    buf[i++] = digits[x % base];
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 b0 76 10 80 	movzbl -0x7fef8950(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    consputc(buf[i]);
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
  while(--i >= 0)
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
    x = -xx;
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 8c 11 00 00       	call   801017a0 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010061b:	e8 70 3f 00 00       	call   80104590 <acquire>
  for(i = 0; i < n; i++)
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
  for(i = 0; i < n; i++)
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 b5 10 80       	push   $0x8010b520
80100647:	e8 04 40 00 00       	call   80104650 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 6b 10 00 00       	call   801016c0 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100669:	a1 54 b5 10 80       	mov    0x8010b554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
  locking = cons.locking;
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(locking)
80100673:	0f 85 af 01 00 00    	jne    80100828 <cprintf+0x1c8>
  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 b7 01 00 00    	je     8010083d <cprintf+0x1dd>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
  argp = (uint*)(void*)(&fmt + 1);
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010068c:	31 db                	xor    %ebx,%ebx
  argp = (uint*)(void*)(&fmt + 1);
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100691:	85 c0                	test   %eax,%eax
80100693:	75 52                	jne    801006e7 <cprintf+0x87>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[++i] & 0xff;
801006a0:	0f b6 16             	movzbl (%esi),%edx
    if(c == 0)
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
    switch(c){
801006aa:	83 fa 6c             	cmp    $0x6c,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 ca 00 00 00    	je     80100780 <cprintf+0x120>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 3f 01 00 00    	je     80100800 <cprintf+0x1a0>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	75 7d                	jne    80100743 <cprintf+0xe3>
      printint(*argp++, 10, 1);
801006c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006c9:	ba 0a 00 00 00       	mov    $0xa,%edx
801006ce:	8d 48 04             	lea    0x4(%eax),%ecx
801006d1:	8b 00                	mov    (%eax),%eax
801006d3:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006d6:	b9 01 00 00 00       	mov    $0x1,%ecx
801006db:	e8 a0 fe ff ff       	call   80100580 <printint>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006e0:	0f b6 06             	movzbl (%esi),%eax
801006e3:	85 c0                	test   %eax,%eax
801006e5:	74 29                	je     80100710 <cprintf+0xb0>
801006e7:	8d 53 01             	lea    0x1(%ebx),%edx
    if(c != '%'){
801006ea:	83 f8 25             	cmp    $0x25,%eax
801006ed:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f0:	74 ae                	je     801006a0 <cprintf+0x40>
801006f2:	89 55 e0             	mov    %edx,-0x20(%ebp)
      consputc(c);
801006f5:	e8 16 fd ff ff       	call   80100410 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006fa:	0f b6 06             	movzbl (%esi),%eax
      continue;
801006fd:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100700:	89 d3                	mov    %edx,%ebx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100702:	85 c0                	test   %eax,%eax
80100704:	75 e1                	jne    801006e7 <cprintf+0x87>
80100706:	8d 76 00             	lea    0x0(%esi),%esi
80100709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(locking)
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
    release(&cons.lock);
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 b5 10 80       	push   $0x8010b520
8010071f:	e8 2c 3f 00 00       	call   80104650 <release>
80100724:	83 c4 10             	add    $0x10,%esp
}
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
    switch(c){
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	0f 84 7f 00 00 00    	je     801007b8 <cprintf+0x158>
80100739:	83 fa 78             	cmp    $0x78,%edx
8010073c:	74 22                	je     80100760 <cprintf+0x100>
8010073e:	83 fa 70             	cmp    $0x70,%edx
80100741:	74 1d                	je     80100760 <cprintf+0x100>
      consputc('%');
80100743:	b8 25 00 00 00       	mov    $0x25,%eax
80100748:	89 55 e0             	mov    %edx,-0x20(%ebp)
8010074b:	e8 c0 fc ff ff       	call   80100410 <consputc>
      consputc(c);
80100750:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100753:	89 d0                	mov    %edx,%eax
80100755:	e8 b6 fc ff ff       	call   80100410 <consputc>
      break;
8010075a:	eb 84                	jmp    801006e0 <cprintf+0x80>
8010075c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printint(*argp++, 16, 0);
80100760:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100763:	ba 10 00 00 00       	mov    $0x10,%edx
80100768:	8d 48 04             	lea    0x4(%eax),%ecx
8010076b:	8b 00                	mov    (%eax),%eax
8010076d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100770:	31 c9                	xor    %ecx,%ecx
80100772:	e8 09 fe ff ff       	call   80100580 <printint>
      break;
80100777:	e9 64 ff ff ff       	jmp    801006e0 <cprintf+0x80>
8010077c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(*(unsigned long long *)argp, 10, 0);
80100780:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100783:	8b 08                	mov    (%eax),%ecx
80100785:	8b 40 04             	mov    0x4(%eax),%eax
    if(upper) printint(upper, 16, 0);
80100788:	85 c0                	test   %eax,%eax
        printlong(*(unsigned long long *)argp, 10, 0);
8010078a:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    if(upper) printint(upper, 16, 0);
8010078d:	74 0c                	je     8010079b <cprintf+0x13b>
8010078f:	31 c9                	xor    %ecx,%ecx
80100791:	ba 10 00 00 00       	mov    $0x10,%edx
80100796:	e8 e5 fd ff ff       	call   80100580 <printint>
    printint(lower, 16, 0);
8010079b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010079e:	31 c9                	xor    %ecx,%ecx
801007a0:	ba 10 00 00 00       	mov    $0x10,%edx
801007a5:	e8 d6 fd ff ff       	call   80100580 <printint>
        argp++;
801007aa:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
        break;
801007ae:	e9 2d ff ff ff       	jmp    801006e0 <cprintf+0x80>
801007b3:	90                   	nop
801007b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if((s = (char*)*argp++) == 0)
801007b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801007bb:	8b 10                	mov    (%eax),%edx
801007bd:	8d 48 04             	lea    0x4(%eax),%ecx
801007c0:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801007c3:	85 d2                	test   %edx,%edx
801007c5:	74 49                	je     80100810 <cprintf+0x1b0>
      for(; *s; s++)
801007c7:	0f be 02             	movsbl (%edx),%eax
      if((s = (char*)*argp++) == 0)
801007ca:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      for(; *s; s++)
801007cd:	84 c0                	test   %al,%al
801007cf:	0f 84 0b ff ff ff    	je     801006e0 <cprintf+0x80>
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	89 d3                	mov    %edx,%ebx
801007da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007e0:	83 c3 01             	add    $0x1,%ebx
        consputc(*s);
801007e3:	e8 28 fc ff ff       	call   80100410 <consputc>
      for(; *s; s++)
801007e8:	0f be 03             	movsbl (%ebx),%eax
801007eb:	84 c0                	test   %al,%al
801007ed:	75 f1                	jne    801007e0 <cprintf+0x180>
      if((s = (char*)*argp++) == 0)
801007ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007f2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007f8:	e9 e3 fe ff ff       	jmp    801006e0 <cprintf+0x80>
801007fd:	8d 76 00             	lea    0x0(%esi),%esi
      consputc('%');
80100800:	b8 25 00 00 00       	mov    $0x25,%eax
80100805:	e8 06 fc ff ff       	call   80100410 <consputc>
      break;
8010080a:	e9 d1 fe ff ff       	jmp    801006e0 <cprintf+0x80>
8010080f:	90                   	nop
        s = "(null)";
80100810:	ba 98 76 10 80       	mov    $0x80107698,%edx
      for(; *s; s++)
80100815:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100818:	b8 28 00 00 00       	mov    $0x28,%eax
8010081d:	89 d3                	mov    %edx,%ebx
8010081f:	eb bf                	jmp    801007e0 <cprintf+0x180>
80100821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
80100828:	83 ec 0c             	sub    $0xc,%esp
8010082b:	68 20 b5 10 80       	push   $0x8010b520
80100830:	e8 5b 3d 00 00       	call   80104590 <acquire>
80100835:	83 c4 10             	add    $0x10,%esp
80100838:	e9 3c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
8010083d:	83 ec 0c             	sub    $0xc,%esp
80100840:	68 9f 76 10 80       	push   $0x8010769f
80100845:	e8 46 fb ff ff       	call   80100390 <panic>
8010084a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100850 <consoleintr>:
{
80100850:	55                   	push   %ebp
80100851:	89 e5                	mov    %esp,%ebp
80100853:	57                   	push   %edi
80100854:	56                   	push   %esi
80100855:	53                   	push   %ebx
  int c, doprocdump = 0;
80100856:	31 f6                	xor    %esi,%esi
{
80100858:	83 ec 18             	sub    $0x18,%esp
8010085b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
8010085e:	68 20 b5 10 80       	push   $0x8010b520
80100863:	e8 28 3d 00 00       	call   80104590 <acquire>
  while((c = getc()) >= 0){
80100868:	83 c4 10             	add    $0x10,%esp
8010086b:	90                   	nop
8010086c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	78 48                	js     801008c0 <consoleintr+0x70>
    switch(c){
80100878:	83 ff 10             	cmp    $0x10,%edi
8010087b:	0f 84 e7 00 00 00    	je     80100968 <consoleintr+0x118>
80100881:	7e 5d                	jle    801008e0 <consoleintr+0x90>
80100883:	83 ff 15             	cmp    $0x15,%edi
80100886:	0f 84 ec 00 00 00    	je     80100978 <consoleintr+0x128>
8010088c:	83 ff 7f             	cmp    $0x7f,%edi
8010088f:	75 54                	jne    801008e5 <consoleintr+0x95>
      if(input.e != input.w){
80100891:	a1 88 19 11 80       	mov    0x80111988,%eax
80100896:	3b 05 84 19 11 80    	cmp    0x80111984,%eax
8010089c:	74 d2                	je     80100870 <consoleintr+0x20>
        input.e--;
8010089e:	83 e8 01             	sub    $0x1,%eax
801008a1:	a3 88 19 11 80       	mov    %eax,0x80111988
        consputc(BACKSPACE);
801008a6:	b8 00 01 00 00       	mov    $0x100,%eax
801008ab:	e8 60 fb ff ff       	call   80100410 <consputc>
  while((c = getc()) >= 0){
801008b0:	ff d3                	call   *%ebx
801008b2:	85 c0                	test   %eax,%eax
801008b4:	89 c7                	mov    %eax,%edi
801008b6:	79 c0                	jns    80100878 <consoleintr+0x28>
801008b8:	90                   	nop
801008b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
801008c0:	83 ec 0c             	sub    $0xc,%esp
801008c3:	68 20 b5 10 80       	push   $0x8010b520
801008c8:	e8 83 3d 00 00       	call   80104650 <release>
  if(doprocdump) {
801008cd:	83 c4 10             	add    $0x10,%esp
801008d0:	85 f6                	test   %esi,%esi
801008d2:	0f 85 f8 00 00 00    	jne    801009d0 <consoleintr+0x180>
}
801008d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801008db:	5b                   	pop    %ebx
801008dc:	5e                   	pop    %esi
801008dd:	5f                   	pop    %edi
801008de:	5d                   	pop    %ebp
801008df:	c3                   	ret    
    switch(c){
801008e0:	83 ff 08             	cmp    $0x8,%edi
801008e3:	74 ac                	je     80100891 <consoleintr+0x41>
      if(c != 0 && input.e-input.r < INPUT_BUF){
801008e5:	85 ff                	test   %edi,%edi
801008e7:	74 87                	je     80100870 <consoleintr+0x20>
801008e9:	a1 88 19 11 80       	mov    0x80111988,%eax
801008ee:	89 c2                	mov    %eax,%edx
801008f0:	2b 15 80 19 11 80    	sub    0x80111980,%edx
801008f6:	83 fa 7f             	cmp    $0x7f,%edx
801008f9:	0f 87 71 ff ff ff    	ja     80100870 <consoleintr+0x20>
801008ff:	8d 50 01             	lea    0x1(%eax),%edx
80100902:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
80100905:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100908:	89 15 88 19 11 80    	mov    %edx,0x80111988
        c = (c == '\r') ? '\n' : c;
8010090e:	0f 84 cc 00 00 00    	je     801009e0 <consoleintr+0x190>
        input.buf[input.e++ % INPUT_BUF] = c;
80100914:	89 f9                	mov    %edi,%ecx
80100916:	88 88 00 19 11 80    	mov    %cl,-0x7feee700(%eax)
        consputc(c);
8010091c:	89 f8                	mov    %edi,%eax
8010091e:	e8 ed fa ff ff       	call   80100410 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
80100923:	83 ff 0a             	cmp    $0xa,%edi
80100926:	0f 84 c5 00 00 00    	je     801009f1 <consoleintr+0x1a1>
8010092c:	83 ff 04             	cmp    $0x4,%edi
8010092f:	0f 84 bc 00 00 00    	je     801009f1 <consoleintr+0x1a1>
80100935:	a1 80 19 11 80       	mov    0x80111980,%eax
8010093a:	83 e8 80             	sub    $0xffffff80,%eax
8010093d:	39 05 88 19 11 80    	cmp    %eax,0x80111988
80100943:	0f 85 27 ff ff ff    	jne    80100870 <consoleintr+0x20>
          wakeup(&input.r);
80100949:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
8010094c:	a3 84 19 11 80       	mov    %eax,0x80111984
          wakeup(&input.r);
80100951:	68 80 19 11 80       	push   $0x80111980
80100956:	e8 25 37 00 00       	call   80104080 <wakeup>
8010095b:	83 c4 10             	add    $0x10,%esp
8010095e:	e9 0d ff ff ff       	jmp    80100870 <consoleintr+0x20>
80100963:	90                   	nop
80100964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      doprocdump = 1;
80100968:	be 01 00 00 00       	mov    $0x1,%esi
8010096d:	e9 fe fe ff ff       	jmp    80100870 <consoleintr+0x20>
80100972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      while(input.e != input.w &&
80100978:	a1 88 19 11 80       	mov    0x80111988,%eax
8010097d:	39 05 84 19 11 80    	cmp    %eax,0x80111984
80100983:	75 2b                	jne    801009b0 <consoleintr+0x160>
80100985:	e9 e6 fe ff ff       	jmp    80100870 <consoleintr+0x20>
8010098a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100990:	a3 88 19 11 80       	mov    %eax,0x80111988
        consputc(BACKSPACE);
80100995:	b8 00 01 00 00       	mov    $0x100,%eax
8010099a:	e8 71 fa ff ff       	call   80100410 <consputc>
      while(input.e != input.w &&
8010099f:	a1 88 19 11 80       	mov    0x80111988,%eax
801009a4:	3b 05 84 19 11 80    	cmp    0x80111984,%eax
801009aa:	0f 84 c0 fe ff ff    	je     80100870 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
801009b0:	83 e8 01             	sub    $0x1,%eax
801009b3:	89 c2                	mov    %eax,%edx
801009b5:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
801009b8:	80 ba 00 19 11 80 0a 	cmpb   $0xa,-0x7feee700(%edx)
801009bf:	75 cf                	jne    80100990 <consoleintr+0x140>
801009c1:	e9 aa fe ff ff       	jmp    80100870 <consoleintr+0x20>
801009c6:	8d 76 00             	lea    0x0(%esi),%esi
801009c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
801009d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009d3:	5b                   	pop    %ebx
801009d4:	5e                   	pop    %esi
801009d5:	5f                   	pop    %edi
801009d6:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
801009d7:	e9 64 38 00 00       	jmp    80104240 <procdump>
801009dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        input.buf[input.e++ % INPUT_BUF] = c;
801009e0:	c6 80 00 19 11 80 0a 	movb   $0xa,-0x7feee700(%eax)
        consputc(c);
801009e7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ec:	e8 1f fa ff ff       	call   80100410 <consputc>
801009f1:	a1 88 19 11 80       	mov    0x80111988,%eax
801009f6:	e9 4e ff ff ff       	jmp    80100949 <consoleintr+0xf9>
801009fb:	90                   	nop
801009fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100a00 <consoleinit>:

void
consoleinit(void)
{
80100a00:	55                   	push   %ebp
80100a01:	89 e5                	mov    %esp,%ebp
80100a03:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100a06:	68 a8 76 10 80       	push   $0x801076a8
80100a0b:	68 20 b5 10 80       	push   $0x8010b520
80100a10:	e8 3b 3a 00 00       	call   80104450 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
80100a15:	58                   	pop    %eax
80100a16:	5a                   	pop    %edx
80100a17:	6a 00                	push   $0x0
80100a19:	6a 01                	push   $0x1
  devsw[CONSOLE].write = consolewrite;
80100a1b:	c7 05 4c 23 11 80 00 	movl   $0x80100600,0x8011234c
80100a22:	06 10 80 
  devsw[CONSOLE].read = consoleread;
80100a25:	c7 05 48 23 11 80 70 	movl   $0x80100270,0x80112348
80100a2c:	02 10 80 
  cons.locking = 1;
80100a2f:	c7 05 54 b5 10 80 01 	movl   $0x1,0x8010b554
80100a36:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
80100a39:	e8 d2 18 00 00       	call   80102310 <ioapicenable>
}
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
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100a50:	55                   	push   %ebp
80100a51:	89 e5                	mov    %esp,%ebp
80100a53:	57                   	push   %edi
80100a54:	56                   	push   %esi
80100a55:	53                   	push   %ebx
80100a56:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100a5c:	e8 3f 2e 00 00       	call   801038a0 <myproc>
80100a61:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a67:	e8 c4 21 00 00       	call   80102c30 <begin_op>

  if((ip = namei(path)) == 0){
80100a6c:	83 ec 0c             	sub    $0xc,%esp
80100a6f:	ff 75 08             	pushl  0x8(%ebp)
80100a72:	e8 a9 14 00 00       	call   80101f20 <namei>
80100a77:	83 c4 10             	add    $0x10,%esp
80100a7a:	85 c0                	test   %eax,%eax
80100a7c:	0f 84 99 01 00 00    	je     80100c1b <exec+0x1cb>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a82:	83 ec 0c             	sub    $0xc,%esp
80100a85:	89 c3                	mov    %eax,%ebx
80100a87:	50                   	push   %eax
80100a88:	e8 33 0c 00 00       	call   801016c0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a8d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a93:	6a 34                	push   $0x34
80100a95:	6a 00                	push   $0x0
80100a97:	50                   	push   %eax
80100a98:	53                   	push   %ebx
80100a99:	e8 02 0f 00 00       	call   801019a0 <readi>
80100a9e:	83 c4 20             	add    $0x20,%esp
80100aa1:	83 f8 34             	cmp    $0x34,%eax
80100aa4:	74 22                	je     80100ac8 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100aa6:	83 ec 0c             	sub    $0xc,%esp
80100aa9:	53                   	push   %ebx
80100aaa:	e8 a1 0e 00 00       	call   80101950 <iunlockput>
    end_op();
80100aaf:	e8 ec 21 00 00       	call   80102ca0 <end_op>
80100ab4:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100ab7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100abc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100abf:	5b                   	pop    %ebx
80100ac0:	5e                   	pop    %esi
80100ac1:	5f                   	pop    %edi
80100ac2:	5d                   	pop    %ebp
80100ac3:	c3                   	ret    
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100ac8:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100acf:	45 4c 46 
80100ad2:	75 d2                	jne    80100aa6 <exec+0x56>
  if((pgdir = setupkvm()) == 0)
80100ad4:	e8 37 65 00 00       	call   80107010 <setupkvm>
80100ad9:	85 c0                	test   %eax,%eax
80100adb:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100ae1:	74 c3                	je     80100aa6 <exec+0x56>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100ae3:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aea:	00 
80100aeb:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
  sz = PGSIZE;
80100af1:	bf 00 10 00 00       	mov    $0x1000,%edi
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100af6:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100afc:	0f 84 91 02 00 00    	je     80100d93 <exec+0x343>
80100b02:	31 f6                	xor    %esi,%esi
80100b04:	e9 81 00 00 00       	jmp    80100b8a <exec+0x13a>
80100b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ph.type != ELF_PROG_LOAD)
80100b10:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b17:	75 63                	jne    80100b7c <exec+0x12c>
    if(ph.memsz < ph.filesz)
80100b19:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b1f:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b25:	0f 82 86 00 00 00    	jb     80100bb1 <exec+0x161>
80100b2b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b31:	72 7e                	jb     80100bb1 <exec+0x161>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b33:	83 ec 04             	sub    $0x4,%esp
80100b36:	50                   	push   %eax
80100b37:	57                   	push   %edi
80100b38:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3e:	e8 ed 62 00 00       	call   80106e30 <allocuvm>
80100b43:	83 c4 10             	add    $0x10,%esp
80100b46:	85 c0                	test   %eax,%eax
80100b48:	89 c7                	mov    %eax,%edi
80100b4a:	74 65                	je     80100bb1 <exec+0x161>
    if(ph.vaddr % PGSIZE != 0)
80100b4c:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b52:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b57:	75 58                	jne    80100bb1 <exec+0x161>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b59:	83 ec 0c             	sub    $0xc,%esp
80100b5c:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b62:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b68:	53                   	push   %ebx
80100b69:	50                   	push   %eax
80100b6a:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b70:	e8 fb 61 00 00       	call   80106d70 <loaduvm>
80100b75:	83 c4 20             	add    $0x20,%esp
80100b78:	85 c0                	test   %eax,%eax
80100b7a:	78 35                	js     80100bb1 <exec+0x161>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b7c:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b83:	83 c6 01             	add    $0x1,%esi
80100b86:	39 f0                	cmp    %esi,%eax
80100b88:	7e 3d                	jle    80100bc7 <exec+0x177>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
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
    freevm(pgdir);
80100bb1:	83 ec 0c             	sub    $0xc,%esp
80100bb4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bba:	e8 d1 63 00 00       	call   80106f90 <freevm>
80100bbf:	83 c4 10             	add    $0x10,%esp
80100bc2:	e9 df fe ff ff       	jmp    80100aa6 <exec+0x56>
80100bc7:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100bcd:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100bd3:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100bd9:	83 ec 0c             	sub    $0xc,%esp
80100bdc:	53                   	push   %ebx
80100bdd:	e8 6e 0d 00 00       	call   80101950 <iunlockput>
  end_op();
80100be2:	e8 b9 20 00 00       	call   80102ca0 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100be7:	83 c4 0c             	add    $0xc,%esp
80100bea:	56                   	push   %esi
80100beb:	57                   	push   %edi
80100bec:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf2:	e8 39 62 00 00       	call   80106e30 <allocuvm>
80100bf7:	83 c4 10             	add    $0x10,%esp
80100bfa:	85 c0                	test   %eax,%eax
80100bfc:	89 c6                	mov    %eax,%esi
80100bfe:	75 3a                	jne    80100c3a <exec+0x1ea>
    freevm(pgdir);
80100c00:	83 ec 0c             	sub    $0xc,%esp
80100c03:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c09:	e8 82 63 00 00       	call   80106f90 <freevm>
80100c0e:	83 c4 10             	add    $0x10,%esp
  return -1;
80100c11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c16:	e9 a1 fe ff ff       	jmp    80100abc <exec+0x6c>
    end_op();
80100c1b:	e8 80 20 00 00       	call   80102ca0 <end_op>
    cprintf("exec: fail\n");
80100c20:	83 ec 0c             	sub    $0xc,%esp
80100c23:	68 c1 76 10 80       	push   $0x801076c1
80100c28:	e8 33 fa ff ff       	call   80100660 <cprintf>
    return -1;
80100c2d:	83 c4 10             	add    $0x10,%esp
80100c30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c35:	e9 82 fe ff ff       	jmp    80100abc <exec+0x6c>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c3a:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100c40:	83 ec 08             	sub    $0x8,%esp
  for(argc = 0; argv[argc]; argc++) {
80100c43:	31 ff                	xor    %edi,%edi
80100c45:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c47:	50                   	push   %eax
80100c48:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c4e:	e8 5d 64 00 00       	call   801070b0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
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
    if(argc >= MAXARG)
80100c78:	83 ff 20             	cmp    $0x20,%edi
80100c7b:	74 83                	je     80100c00 <exec+0x1b0>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c7d:	83 ec 0c             	sub    $0xc,%esp
80100c80:	50                   	push   %eax
80100c81:	e8 3a 3c 00 00       	call   801048c0 <strlen>
80100c86:	f7 d0                	not    %eax
80100c88:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8d:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c8e:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c91:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c94:	e8 27 3c 00 00       	call   801048c0 <strlen>
80100c99:	83 c0 01             	add    $0x1,%eax
80100c9c:	50                   	push   %eax
80100c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100ca0:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ca3:	53                   	push   %ebx
80100ca4:	56                   	push   %esi
80100ca5:	e8 66 65 00 00       	call   80107210 <copyout>
80100caa:	83 c4 20             	add    $0x20,%esp
80100cad:	85 c0                	test   %eax,%eax
80100caf:	0f 88 4b ff ff ff    	js     80100c00 <exec+0x1b0>
  for(argc = 0; argv[argc]; argc++) {
80100cb5:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100cb8:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100cbf:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100cc2:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100cc8:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100ccb:	85 c0                	test   %eax,%eax
80100ccd:	75 a9                	jne    80100c78 <exec+0x228>
80100ccf:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cd5:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100cdc:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100cde:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100ce5:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100ce9:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100cf0:	ff ff ff 
  ustack[1] = argc;
80100cf3:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cf9:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100cfb:	83 c0 0c             	add    $0xc,%eax
80100cfe:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d00:	50                   	push   %eax
80100d01:	52                   	push   %edx
80100d02:	53                   	push   %ebx
80100d03:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d09:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d0f:	e8 fc 64 00 00       	call   80107210 <copyout>
80100d14:	83 c4 10             	add    $0x10,%esp
80100d17:	85 c0                	test   %eax,%eax
80100d19:	0f 88 e1 fe ff ff    	js     80100c00 <exec+0x1b0>
  for(last=s=path; *s; s++)
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
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d40:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100d46:	50                   	push   %eax
80100d47:	6a 10                	push   $0x10
80100d49:	ff 75 08             	pushl  0x8(%ebp)
80100d4c:	89 f8                	mov    %edi,%eax
80100d4e:	83 c0 6c             	add    $0x6c,%eax
80100d51:	50                   	push   %eax
80100d52:	e8 29 3b 00 00       	call   80104880 <safestrcpy>
  curproc->pgdir = pgdir;
80100d57:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
  oldpgdir = curproc->pgdir;
80100d5d:	89 f9                	mov    %edi,%ecx
80100d5f:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->tf->eip = elf.entry;  // main
80100d62:	8b 41 18             	mov    0x18(%ecx),%eax
  curproc->sz = sz;
80100d65:	89 31                	mov    %esi,(%ecx)
  curproc->pgdir = pgdir;
80100d67:	89 51 04             	mov    %edx,0x4(%ecx)
  curproc->tf->eip = elf.entry;  // main
80100d6a:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d70:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d73:	8b 41 18             	mov    0x18(%ecx),%eax
80100d76:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d79:	89 0c 24             	mov    %ecx,(%esp)
80100d7c:	e8 5f 5e 00 00       	call   80106be0 <switchuvm>
  freevm(oldpgdir);
80100d81:	89 3c 24             	mov    %edi,(%esp)
80100d84:	e8 07 62 00 00       	call   80106f90 <freevm>
  return 0;
80100d89:	83 c4 10             	add    $0x10,%esp
80100d8c:	31 c0                	xor    %eax,%eax
80100d8e:	e9 29 fd ff ff       	jmp    80100abc <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d93:	be 00 30 00 00       	mov    $0x3000,%esi
80100d98:	e9 3c fe ff ff       	jmp    80100bd9 <exec+0x189>
80100d9d:	66 90                	xchg   %ax,%ax
80100d9f:	90                   	nop

80100da0 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100da0:	55                   	push   %ebp
80100da1:	89 e5                	mov    %esp,%ebp
80100da3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100da6:	68 cd 76 10 80       	push   $0x801076cd
80100dab:	68 a0 19 11 80       	push   $0x801119a0
80100db0:	e8 9b 36 00 00       	call   80104450 <initlock>
}
80100db5:	83 c4 10             	add    $0x10,%esp
80100db8:	c9                   	leave  
80100db9:	c3                   	ret    
80100dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100dc0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100dc0:	55                   	push   %ebp
80100dc1:	89 e5                	mov    %esp,%ebp
80100dc3:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100dc4:	bb d4 19 11 80       	mov    $0x801119d4,%ebx
{
80100dc9:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100dcc:	68 a0 19 11 80       	push   $0x801119a0
80100dd1:	e8 ba 37 00 00       	call   80104590 <acquire>
80100dd6:	83 c4 10             	add    $0x10,%esp
80100dd9:	eb 10                	jmp    80100deb <filealloc+0x2b>
80100ddb:	90                   	nop
80100ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100de0:	83 c3 18             	add    $0x18,%ebx
80100de3:	81 fb 34 23 11 80    	cmp    $0x80112334,%ebx
80100de9:	73 25                	jae    80100e10 <filealloc+0x50>
    if(f->ref == 0){
80100deb:	8b 43 04             	mov    0x4(%ebx),%eax
80100dee:	85 c0                	test   %eax,%eax
80100df0:	75 ee                	jne    80100de0 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100df2:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100df5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dfc:	68 a0 19 11 80       	push   $0x801119a0
80100e01:	e8 4a 38 00 00       	call   80104650 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100e06:	89 d8                	mov    %ebx,%eax
      return f;
80100e08:	83 c4 10             	add    $0x10,%esp
}
80100e0b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e0e:	c9                   	leave  
80100e0f:	c3                   	ret    
  release(&ftable.lock);
80100e10:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100e13:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100e15:	68 a0 19 11 80       	push   $0x801119a0
80100e1a:	e8 31 38 00 00       	call   80104650 <release>
}
80100e1f:	89 d8                	mov    %ebx,%eax
  return 0;
80100e21:	83 c4 10             	add    $0x10,%esp
}
80100e24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e27:	c9                   	leave  
80100e28:	c3                   	ret    
80100e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e30 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	53                   	push   %ebx
80100e34:	83 ec 10             	sub    $0x10,%esp
80100e37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100e3a:	68 a0 19 11 80       	push   $0x801119a0
80100e3f:	e8 4c 37 00 00       	call   80104590 <acquire>
  if(f->ref < 1)
80100e44:	8b 43 04             	mov    0x4(%ebx),%eax
80100e47:	83 c4 10             	add    $0x10,%esp
80100e4a:	85 c0                	test   %eax,%eax
80100e4c:	7e 1a                	jle    80100e68 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100e4e:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e51:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100e54:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e57:	68 a0 19 11 80       	push   $0x801119a0
80100e5c:	e8 ef 37 00 00       	call   80104650 <release>
  return f;
}
80100e61:	89 d8                	mov    %ebx,%eax
80100e63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e66:	c9                   	leave  
80100e67:	c3                   	ret    
    panic("filedup");
80100e68:	83 ec 0c             	sub    $0xc,%esp
80100e6b:	68 d4 76 10 80       	push   $0x801076d4
80100e70:	e8 1b f5 ff ff       	call   80100390 <panic>
80100e75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e80 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e80:	55                   	push   %ebp
80100e81:	89 e5                	mov    %esp,%ebp
80100e83:	57                   	push   %edi
80100e84:	56                   	push   %esi
80100e85:	53                   	push   %ebx
80100e86:	83 ec 28             	sub    $0x28,%esp
80100e89:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
80100e8c:	68 a0 19 11 80       	push   $0x801119a0
80100e91:	e8 fa 36 00 00       	call   80104590 <acquire>
  if(f->ref < 1)
80100e96:	8b 43 04             	mov    0x4(%ebx),%eax
80100e99:	83 c4 10             	add    $0x10,%esp
80100e9c:	85 c0                	test   %eax,%eax
80100e9e:	0f 8e 9b 00 00 00    	jle    80100f3f <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100ea4:	83 e8 01             	sub    $0x1,%eax
80100ea7:	85 c0                	test   %eax,%eax
80100ea9:	89 43 04             	mov    %eax,0x4(%ebx)
80100eac:	74 1a                	je     80100ec8 <fileclose+0x48>
    release(&ftable.lock);
80100eae:	c7 45 08 a0 19 11 80 	movl   $0x801119a0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100eb5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eb8:	5b                   	pop    %ebx
80100eb9:	5e                   	pop    %esi
80100eba:	5f                   	pop    %edi
80100ebb:	5d                   	pop    %ebp
    release(&ftable.lock);
80100ebc:	e9 8f 37 00 00       	jmp    80104650 <release>
80100ec1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff = *f;
80100ec8:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100ecc:	8b 3b                	mov    (%ebx),%edi
  release(&ftable.lock);
80100ece:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100ed1:	8b 73 0c             	mov    0xc(%ebx),%esi
  f->type = FD_NONE;
80100ed4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  ff = *f;
80100eda:	88 45 e7             	mov    %al,-0x19(%ebp)
80100edd:	8b 43 10             	mov    0x10(%ebx),%eax
  release(&ftable.lock);
80100ee0:	68 a0 19 11 80       	push   $0x801119a0
  ff = *f;
80100ee5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100ee8:	e8 63 37 00 00       	call   80104650 <release>
  if(ff.type == FD_PIPE)
80100eed:	83 c4 10             	add    $0x10,%esp
80100ef0:	83 ff 01             	cmp    $0x1,%edi
80100ef3:	74 13                	je     80100f08 <fileclose+0x88>
  else if(ff.type == FD_INODE){
80100ef5:	83 ff 02             	cmp    $0x2,%edi
80100ef8:	74 26                	je     80100f20 <fileclose+0xa0>
}
80100efa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100efd:	5b                   	pop    %ebx
80100efe:	5e                   	pop    %esi
80100eff:	5f                   	pop    %edi
80100f00:	5d                   	pop    %ebp
80100f01:	c3                   	ret    
80100f02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pipeclose(ff.pipe, ff.writable);
80100f08:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100f0c:	83 ec 08             	sub    $0x8,%esp
80100f0f:	53                   	push   %ebx
80100f10:	56                   	push   %esi
80100f11:	e8 ca 24 00 00       	call   801033e0 <pipeclose>
80100f16:	83 c4 10             	add    $0x10,%esp
80100f19:	eb df                	jmp    80100efa <fileclose+0x7a>
80100f1b:	90                   	nop
80100f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    begin_op();
80100f20:	e8 0b 1d 00 00       	call   80102c30 <begin_op>
    iput(ff.ip);
80100f25:	83 ec 0c             	sub    $0xc,%esp
80100f28:	ff 75 e0             	pushl  -0x20(%ebp)
80100f2b:	e8 c0 08 00 00       	call   801017f0 <iput>
    end_op();
80100f30:	83 c4 10             	add    $0x10,%esp
}
80100f33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f36:	5b                   	pop    %ebx
80100f37:	5e                   	pop    %esi
80100f38:	5f                   	pop    %edi
80100f39:	5d                   	pop    %ebp
    end_op();
80100f3a:	e9 61 1d 00 00       	jmp    80102ca0 <end_op>
    panic("fileclose");
80100f3f:	83 ec 0c             	sub    $0xc,%esp
80100f42:	68 dc 76 10 80       	push   $0x801076dc
80100f47:	e8 44 f4 ff ff       	call   80100390 <panic>
80100f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f50 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	53                   	push   %ebx
80100f54:	83 ec 04             	sub    $0x4,%esp
80100f57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f5a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f5d:	75 31                	jne    80100f90 <filestat+0x40>
    ilock(f->ip);
80100f5f:	83 ec 0c             	sub    $0xc,%esp
80100f62:	ff 73 10             	pushl  0x10(%ebx)
80100f65:	e8 56 07 00 00       	call   801016c0 <ilock>
    stati(f->ip, st);
80100f6a:	58                   	pop    %eax
80100f6b:	5a                   	pop    %edx
80100f6c:	ff 75 0c             	pushl  0xc(%ebp)
80100f6f:	ff 73 10             	pushl  0x10(%ebx)
80100f72:	e8 f9 09 00 00       	call   80101970 <stati>
    iunlock(f->ip);
80100f77:	59                   	pop    %ecx
80100f78:	ff 73 10             	pushl  0x10(%ebx)
80100f7b:	e8 20 08 00 00       	call   801017a0 <iunlock>
    return 0;
80100f80:	83 c4 10             	add    $0x10,%esp
80100f83:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f88:	c9                   	leave  
80100f89:	c3                   	ret    
80100f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return -1;
80100f90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f95:	eb ee                	jmp    80100f85 <filestat+0x35>
80100f97:	89 f6                	mov    %esi,%esi
80100f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fa0 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100fa0:	55                   	push   %ebp
80100fa1:	89 e5                	mov    %esp,%ebp
80100fa3:	57                   	push   %edi
80100fa4:	56                   	push   %esi
80100fa5:	53                   	push   %ebx
80100fa6:	83 ec 0c             	sub    $0xc,%esp
80100fa9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fac:	8b 75 0c             	mov    0xc(%ebp),%esi
80100faf:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100fb2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100fb6:	74 60                	je     80101018 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100fb8:	8b 03                	mov    (%ebx),%eax
80100fba:	83 f8 01             	cmp    $0x1,%eax
80100fbd:	74 41                	je     80101000 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100fbf:	83 f8 02             	cmp    $0x2,%eax
80100fc2:	75 5b                	jne    8010101f <fileread+0x7f>
    ilock(f->ip);
80100fc4:	83 ec 0c             	sub    $0xc,%esp
80100fc7:	ff 73 10             	pushl  0x10(%ebx)
80100fca:	e8 f1 06 00 00       	call   801016c0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100fcf:	57                   	push   %edi
80100fd0:	ff 73 14             	pushl  0x14(%ebx)
80100fd3:	56                   	push   %esi
80100fd4:	ff 73 10             	pushl  0x10(%ebx)
80100fd7:	e8 c4 09 00 00       	call   801019a0 <readi>
80100fdc:	83 c4 20             	add    $0x20,%esp
80100fdf:	85 c0                	test   %eax,%eax
80100fe1:	89 c6                	mov    %eax,%esi
80100fe3:	7e 03                	jle    80100fe8 <fileread+0x48>
      f->off += r;
80100fe5:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100fe8:	83 ec 0c             	sub    $0xc,%esp
80100feb:	ff 73 10             	pushl  0x10(%ebx)
80100fee:	e8 ad 07 00 00       	call   801017a0 <iunlock>
    return r;
80100ff3:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80100ff6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ff9:	89 f0                	mov    %esi,%eax
80100ffb:	5b                   	pop    %ebx
80100ffc:	5e                   	pop    %esi
80100ffd:	5f                   	pop    %edi
80100ffe:	5d                   	pop    %ebp
80100fff:	c3                   	ret    
    return piperead(f->pipe, addr, n);
80101000:	8b 43 0c             	mov    0xc(%ebx),%eax
80101003:	89 45 08             	mov    %eax,0x8(%ebp)
}
80101006:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101009:	5b                   	pop    %ebx
8010100a:	5e                   	pop    %esi
8010100b:	5f                   	pop    %edi
8010100c:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
8010100d:	e9 7e 25 00 00       	jmp    80103590 <piperead>
80101012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80101018:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010101d:	eb d7                	jmp    80100ff6 <fileread+0x56>
  panic("fileread");
8010101f:	83 ec 0c             	sub    $0xc,%esp
80101022:	68 e6 76 10 80       	push   $0x801076e6
80101027:	e8 64 f3 ff ff       	call   80100390 <panic>
8010102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101030 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101030:	55                   	push   %ebp
80101031:	89 e5                	mov    %esp,%ebp
80101033:	57                   	push   %edi
80101034:	56                   	push   %esi
80101035:	53                   	push   %ebx
80101036:	83 ec 1c             	sub    $0x1c,%esp
80101039:	8b 75 08             	mov    0x8(%ebp),%esi
8010103c:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
8010103f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
{
80101043:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101046:	8b 45 10             	mov    0x10(%ebp),%eax
80101049:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
8010104c:	0f 84 aa 00 00 00    	je     801010fc <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101052:	8b 06                	mov    (%esi),%eax
80101054:	83 f8 01             	cmp    $0x1,%eax
80101057:	0f 84 c3 00 00 00    	je     80101120 <filewrite+0xf0>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010105d:	83 f8 02             	cmp    $0x2,%eax
80101060:	0f 85 d9 00 00 00    	jne    8010113f <filewrite+0x10f>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101066:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i = 0;
80101069:	31 ff                	xor    %edi,%edi
    while(i < n){
8010106b:	85 c0                	test   %eax,%eax
8010106d:	7f 34                	jg     801010a3 <filewrite+0x73>
8010106f:	e9 9c 00 00 00       	jmp    80101110 <filewrite+0xe0>
80101074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101078:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
        f->off += r;
80101081:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101084:	e8 17 07 00 00       	call   801017a0 <iunlock>
      end_op();
80101089:	e8 12 1c 00 00       	call   80102ca0 <end_op>
8010108e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101091:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101094:	39 c3                	cmp    %eax,%ebx
80101096:	0f 85 96 00 00 00    	jne    80101132 <filewrite+0x102>
        panic("short filewrite");
      i += r;
8010109c:	01 df                	add    %ebx,%edi
    while(i < n){
8010109e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010a1:	7e 6d                	jle    80101110 <filewrite+0xe0>
      int n1 = n - i;
801010a3:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801010a6:	b8 00 06 00 00       	mov    $0x600,%eax
801010ab:	29 fb                	sub    %edi,%ebx
801010ad:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
801010b3:	0f 4f d8             	cmovg  %eax,%ebx
      begin_op();
801010b6:	e8 75 1b 00 00       	call   80102c30 <begin_op>
      ilock(f->ip);
801010bb:	83 ec 0c             	sub    $0xc,%esp
801010be:	ff 76 10             	pushl  0x10(%esi)
801010c1:	e8 fa 05 00 00       	call   801016c0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
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
      iunlock(f->ip);
801010df:	83 ec 0c             	sub    $0xc,%esp
801010e2:	ff 76 10             	pushl  0x10(%esi)
801010e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010e8:	e8 b3 06 00 00       	call   801017a0 <iunlock>
      end_op();
801010ed:	e8 ae 1b 00 00       	call   80102ca0 <end_op>
      if(r < 0)
801010f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010f5:	83 c4 10             	add    $0x10,%esp
801010f8:	85 c0                	test   %eax,%eax
801010fa:	74 98                	je     80101094 <filewrite+0x64>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801010ff:	bf ff ff ff ff       	mov    $0xffffffff,%edi
}
80101104:	89 f8                	mov    %edi,%eax
80101106:	5b                   	pop    %ebx
80101107:	5e                   	pop    %esi
80101108:	5f                   	pop    %edi
80101109:	5d                   	pop    %ebp
8010110a:	c3                   	ret    
8010110b:	90                   	nop
8010110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return i == n ? n : -1;
80101110:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101113:	75 e7                	jne    801010fc <filewrite+0xcc>
}
80101115:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101118:	89 f8                	mov    %edi,%eax
8010111a:	5b                   	pop    %ebx
8010111b:	5e                   	pop    %esi
8010111c:	5f                   	pop    %edi
8010111d:	5d                   	pop    %ebp
8010111e:	c3                   	ret    
8010111f:	90                   	nop
    return pipewrite(f->pipe, addr, n);
80101120:	8b 46 0c             	mov    0xc(%esi),%eax
80101123:	89 45 08             	mov    %eax,0x8(%ebp)
}
80101126:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101129:	5b                   	pop    %ebx
8010112a:	5e                   	pop    %esi
8010112b:	5f                   	pop    %edi
8010112c:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
8010112d:	e9 4e 23 00 00       	jmp    80103480 <pipewrite>
        panic("short filewrite");
80101132:	83 ec 0c             	sub    $0xc,%esp
80101135:	68 ef 76 10 80       	push   $0x801076ef
8010113a:	e8 51 f2 ff ff       	call   80100390 <panic>
  panic("filewrite");
8010113f:	83 ec 0c             	sub    $0xc,%esp
80101142:	68 f5 76 10 80       	push   $0x801076f5
80101147:	e8 44 f2 ff ff       	call   80100390 <panic>
8010114c:	66 90                	xchg   %ax,%ax
8010114e:	66 90                	xchg   %ax,%ax

80101150 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80101150:	55                   	push   %ebp
80101151:	89 e5                	mov    %esp,%ebp
80101153:	56                   	push   %esi
80101154:	53                   	push   %ebx
80101155:	89 d3                	mov    %edx,%ebx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80101157:	c1 ea 0c             	shr    $0xc,%edx
8010115a:	03 15 b8 23 11 80    	add    0x801123b8,%edx
80101160:	83 ec 08             	sub    $0x8,%esp
80101163:	52                   	push   %edx
80101164:	50                   	push   %eax
80101165:	e8 66 ef ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010116a:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010116c:	c1 fb 03             	sar    $0x3,%ebx
  m = 1 << (bi % 8);
8010116f:	ba 01 00 00 00       	mov    $0x1,%edx
80101174:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101177:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010117d:	83 c4 10             	add    $0x10,%esp
  m = 1 << (bi % 8);
80101180:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101182:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101187:	85 d1                	test   %edx,%ecx
80101189:	74 25                	je     801011b0 <bfree+0x60>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010118b:	f7 d2                	not    %edx
8010118d:	89 c6                	mov    %eax,%esi
  log_write(bp);
8010118f:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101192:	21 ca                	and    %ecx,%edx
80101194:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
  log_write(bp);
80101198:	56                   	push   %esi
80101199:	e8 62 1c 00 00       	call   80102e00 <log_write>
  brelse(bp);
8010119e:	89 34 24             	mov    %esi,(%esp)
801011a1:	e8 3a f0 ff ff       	call   801001e0 <brelse>
}
801011a6:	83 c4 10             	add    $0x10,%esp
801011a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801011ac:	5b                   	pop    %ebx
801011ad:	5e                   	pop    %esi
801011ae:	5d                   	pop    %ebp
801011af:	c3                   	ret    
    panic("freeing free block");
801011b0:	83 ec 0c             	sub    $0xc,%esp
801011b3:	68 ff 76 10 80       	push   $0x801076ff
801011b8:	e8 d3 f1 ff ff       	call   80100390 <panic>
801011bd:	8d 76 00             	lea    0x0(%esi),%esi

801011c0 <balloc>:
{
801011c0:	55                   	push   %ebp
801011c1:	89 e5                	mov    %esp,%ebp
801011c3:	57                   	push   %edi
801011c4:	56                   	push   %esi
801011c5:	53                   	push   %ebx
801011c6:	83 ec 1c             	sub    $0x1c,%esp
  for(b = 0; b < sb.size; b += BPB){
801011c9:	8b 0d a0 23 11 80    	mov    0x801123a0,%ecx
{
801011cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
801011d2:	85 c9                	test   %ecx,%ecx
801011d4:	0f 84 87 00 00 00    	je     80101261 <balloc+0xa1>
801011da:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
801011e1:	8b 75 dc             	mov    -0x24(%ebp),%esi
801011e4:	83 ec 08             	sub    $0x8,%esp
801011e7:	89 f0                	mov    %esi,%eax
801011e9:	c1 f8 0c             	sar    $0xc,%eax
801011ec:	03 05 b8 23 11 80    	add    0x801123b8,%eax
801011f2:	50                   	push   %eax
801011f3:	ff 75 d8             	pushl  -0x28(%ebp)
801011f6:	e8 d5 ee ff ff       	call   801000d0 <bread>
801011fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801011fe:	a1 a0 23 11 80       	mov    0x801123a0,%eax
80101203:	83 c4 10             	add    $0x10,%esp
80101206:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101209:	31 c0                	xor    %eax,%eax
8010120b:	eb 2f                	jmp    8010123c <balloc+0x7c>
8010120d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101210:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101212:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
80101215:	bb 01 00 00 00       	mov    $0x1,%ebx
8010121a:	83 e1 07             	and    $0x7,%ecx
8010121d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010121f:	89 c1                	mov    %eax,%ecx
80101221:	c1 f9 03             	sar    $0x3,%ecx
80101224:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101229:	85 df                	test   %ebx,%edi
8010122b:	89 fa                	mov    %edi,%edx
8010122d:	74 41                	je     80101270 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010122f:	83 c0 01             	add    $0x1,%eax
80101232:	83 c6 01             	add    $0x1,%esi
80101235:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010123a:	74 05                	je     80101241 <balloc+0x81>
8010123c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010123f:	77 cf                	ja     80101210 <balloc+0x50>
    brelse(bp);
80101241:	83 ec 0c             	sub    $0xc,%esp
80101244:	ff 75 e4             	pushl  -0x1c(%ebp)
80101247:	e8 94 ef ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010124c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101253:	83 c4 10             	add    $0x10,%esp
80101256:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101259:	39 05 a0 23 11 80    	cmp    %eax,0x801123a0
8010125f:	77 80                	ja     801011e1 <balloc+0x21>
  panic("balloc: out of blocks");
80101261:	83 ec 0c             	sub    $0xc,%esp
80101264:	68 12 77 10 80       	push   $0x80107712
80101269:	e8 22 f1 ff ff       	call   80100390 <panic>
8010126e:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
80101270:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
80101273:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
80101276:	09 da                	or     %ebx,%edx
80101278:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
8010127c:	57                   	push   %edi
8010127d:	e8 7e 1b 00 00       	call   80102e00 <log_write>
        brelse(bp);
80101282:	89 3c 24             	mov    %edi,(%esp)
80101285:	e8 56 ef ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
8010128a:	58                   	pop    %eax
8010128b:	5a                   	pop    %edx
8010128c:	56                   	push   %esi
8010128d:	ff 75 d8             	pushl  -0x28(%ebp)
80101290:	e8 3b ee ff ff       	call   801000d0 <bread>
80101295:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
80101297:	8d 40 5c             	lea    0x5c(%eax),%eax
8010129a:	83 c4 0c             	add    $0xc,%esp
8010129d:	68 00 02 00 00       	push   $0x200
801012a2:	6a 00                	push   $0x0
801012a4:	50                   	push   %eax
801012a5:	e8 f6 33 00 00       	call   801046a0 <memset>
  log_write(bp);
801012aa:	89 1c 24             	mov    %ebx,(%esp)
801012ad:	e8 4e 1b 00 00       	call   80102e00 <log_write>
  brelse(bp);
801012b2:	89 1c 24             	mov    %ebx,(%esp)
801012b5:	e8 26 ef ff ff       	call   801001e0 <brelse>
}
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
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
801012d8:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012da:	bb f4 23 11 80       	mov    $0x801123f4,%ebx
{
801012df:	83 ec 28             	sub    $0x28,%esp
801012e2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
801012e5:	68 c0 23 11 80       	push   $0x801123c0
801012ea:	e8 a1 32 00 00       	call   80104590 <acquire>
801012ef:	83 c4 10             	add    $0x10,%esp
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012f5:	eb 17                	jmp    8010130e <iget+0x3e>
801012f7:	89 f6                	mov    %esi,%esi
801012f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101300:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101306:	81 fb 14 40 11 80    	cmp    $0x80114014,%ebx
8010130c:	73 22                	jae    80101330 <iget+0x60>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010130e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101311:	85 c9                	test   %ecx,%ecx
80101313:	7e 04                	jle    80101319 <iget+0x49>
80101315:	39 3b                	cmp    %edi,(%ebx)
80101317:	74 4f                	je     80101368 <iget+0x98>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101319:	85 f6                	test   %esi,%esi
8010131b:	75 e3                	jne    80101300 <iget+0x30>
8010131d:	85 c9                	test   %ecx,%ecx
8010131f:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101322:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101328:	81 fb 14 40 11 80    	cmp    $0x80114014,%ebx
8010132e:	72 de                	jb     8010130e <iget+0x3e>
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101330:	85 f6                	test   %esi,%esi
80101332:	74 5b                	je     8010138f <iget+0xbf>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
80101334:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
80101337:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101339:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010133c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101343:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010134a:	68 c0 23 11 80       	push   $0x801123c0
8010134f:	e8 fc 32 00 00       	call   80104650 <release>

  return ip;
80101354:	83 c4 10             	add    $0x10,%esp
}
80101357:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010135a:	89 f0                	mov    %esi,%eax
8010135c:	5b                   	pop    %ebx
8010135d:	5e                   	pop    %esi
8010135e:	5f                   	pop    %edi
8010135f:	5d                   	pop    %ebp
80101360:	c3                   	ret    
80101361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101368:	39 53 04             	cmp    %edx,0x4(%ebx)
8010136b:	75 ac                	jne    80101319 <iget+0x49>
      release(&icache.lock);
8010136d:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
80101370:	83 c1 01             	add    $0x1,%ecx
      return ip;
80101373:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
80101375:	68 c0 23 11 80       	push   $0x801123c0
      ip->ref++;
8010137a:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
8010137d:	e8 ce 32 00 00       	call   80104650 <release>
      return ip;
80101382:	83 c4 10             	add    $0x10,%esp
}
80101385:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101388:	89 f0                	mov    %esi,%eax
8010138a:	5b                   	pop    %ebx
8010138b:	5e                   	pop    %esi
8010138c:	5f                   	pop    %edi
8010138d:	5d                   	pop    %ebp
8010138e:	c3                   	ret    
    panic("iget: no inodes");
8010138f:	83 ec 0c             	sub    $0xc,%esp
80101392:	68 28 77 10 80       	push   $0x80107728
80101397:	e8 f4 ef ff ff       	call   80100390 <panic>
8010139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801013a0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801013a0:	55                   	push   %ebp
801013a1:	89 e5                	mov    %esp,%ebp
801013a3:	57                   	push   %edi
801013a4:	56                   	push   %esi
801013a5:	53                   	push   %ebx
801013a6:	89 c6                	mov    %eax,%esi
801013a8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801013ab:	83 fa 0b             	cmp    $0xb,%edx
801013ae:	77 18                	ja     801013c8 <bmap+0x28>
801013b0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
    if((addr = ip->addrs[bn]) == 0)
801013b3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801013b6:	85 db                	test   %ebx,%ebx
801013b8:	74 76                	je     80101430 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801013ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013bd:	89 d8                	mov    %ebx,%eax
801013bf:	5b                   	pop    %ebx
801013c0:	5e                   	pop    %esi
801013c1:	5f                   	pop    %edi
801013c2:	5d                   	pop    %ebp
801013c3:	c3                   	ret    
801013c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;
801013c8:	8d 5a f4             	lea    -0xc(%edx),%ebx
  if(bn < NINDIRECT){
801013cb:	83 fb 7f             	cmp    $0x7f,%ebx
801013ce:	0f 87 90 00 00 00    	ja     80101464 <bmap+0xc4>
    if((addr = ip->addrs[NDIRECT]) == 0)
801013d4:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
801013da:	8b 00                	mov    (%eax),%eax
801013dc:	85 d2                	test   %edx,%edx
801013de:	74 70                	je     80101450 <bmap+0xb0>
    bp = bread(ip->dev, addr);
801013e0:	83 ec 08             	sub    $0x8,%esp
801013e3:	52                   	push   %edx
801013e4:	50                   	push   %eax
801013e5:	e8 e6 ec ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
801013ea:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
801013ee:	83 c4 10             	add    $0x10,%esp
    bp = bread(ip->dev, addr);
801013f1:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
801013f3:	8b 1a                	mov    (%edx),%ebx
801013f5:	85 db                	test   %ebx,%ebx
801013f7:	75 1d                	jne    80101416 <bmap+0x76>
      a[bn] = addr = balloc(ip->dev);
801013f9:	8b 06                	mov    (%esi),%eax
801013fb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801013fe:	e8 bd fd ff ff       	call   801011c0 <balloc>
80101403:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101406:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
80101409:	89 c3                	mov    %eax,%ebx
8010140b:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010140d:	57                   	push   %edi
8010140e:	e8 ed 19 00 00       	call   80102e00 <log_write>
80101413:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101416:	83 ec 0c             	sub    $0xc,%esp
80101419:	57                   	push   %edi
8010141a:	e8 c1 ed ff ff       	call   801001e0 <brelse>
8010141f:	83 c4 10             	add    $0x10,%esp
}
80101422:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101425:	89 d8                	mov    %ebx,%eax
80101427:	5b                   	pop    %ebx
80101428:	5e                   	pop    %esi
80101429:	5f                   	pop    %edi
8010142a:	5d                   	pop    %ebp
8010142b:	c3                   	ret    
8010142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ip->addrs[bn] = addr = balloc(ip->dev);
80101430:	8b 00                	mov    (%eax),%eax
80101432:	e8 89 fd ff ff       	call   801011c0 <balloc>
80101437:	89 47 5c             	mov    %eax,0x5c(%edi)
}
8010143a:	8d 65 f4             	lea    -0xc(%ebp),%esp
      ip->addrs[bn] = addr = balloc(ip->dev);
8010143d:	89 c3                	mov    %eax,%ebx
}
8010143f:	89 d8                	mov    %ebx,%eax
80101441:	5b                   	pop    %ebx
80101442:	5e                   	pop    %esi
80101443:	5f                   	pop    %edi
80101444:	5d                   	pop    %ebp
80101445:	c3                   	ret    
80101446:	8d 76 00             	lea    0x0(%esi),%esi
80101449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101450:	e8 6b fd ff ff       	call   801011c0 <balloc>
80101455:	89 c2                	mov    %eax,%edx
80101457:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010145d:	8b 06                	mov    (%esi),%eax
8010145f:	e9 7c ff ff ff       	jmp    801013e0 <bmap+0x40>
  panic("bmap: out of range");
80101464:	83 ec 0c             	sub    $0xc,%esp
80101467:	68 38 77 10 80       	push   $0x80107738
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
{
80101480:	55                   	push   %ebp
80101481:	89 e5                	mov    %esp,%ebp
80101483:	56                   	push   %esi
80101484:	53                   	push   %ebx
80101485:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
80101488:	83 ec 08             	sub    $0x8,%esp
8010148b:	6a 01                	push   $0x1
8010148d:	ff 75 08             	pushl  0x8(%ebp)
80101490:	e8 3b ec ff ff       	call   801000d0 <bread>
80101495:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
80101497:	8d 40 5c             	lea    0x5c(%eax),%eax
8010149a:	83 c4 0c             	add    $0xc,%esp
8010149d:	6a 1c                	push   $0x1c
8010149f:	50                   	push   %eax
801014a0:	56                   	push   %esi
801014a1:	e8 aa 32 00 00       	call   80104750 <memmove>
  brelse(bp);
801014a6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801014a9:	83 c4 10             	add    $0x10,%esp
}
801014ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
801014af:	5b                   	pop    %ebx
801014b0:	5e                   	pop    %esi
801014b1:	5d                   	pop    %ebp
  brelse(bp);
801014b2:	e9 29 ed ff ff       	jmp    801001e0 <brelse>
801014b7:	89 f6                	mov    %esi,%esi
801014b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801014c0 <iinit>:
{
801014c0:	55                   	push   %ebp
801014c1:	89 e5                	mov    %esp,%ebp
801014c3:	53                   	push   %ebx
801014c4:	bb 00 24 11 80       	mov    $0x80112400,%ebx
801014c9:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
801014cc:	68 4b 77 10 80       	push   $0x8010774b
801014d1:	68 c0 23 11 80       	push   $0x801123c0
801014d6:	e8 75 2f 00 00       	call   80104450 <initlock>
801014db:	83 c4 10             	add    $0x10,%esp
801014de:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
801014e0:	83 ec 08             	sub    $0x8,%esp
801014e3:	68 52 77 10 80       	push   $0x80107752
801014e8:	53                   	push   %ebx
801014e9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014ef:	e8 2c 2e 00 00       	call   80104320 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801014f4:	83 c4 10             	add    $0x10,%esp
801014f7:	81 fb 20 40 11 80    	cmp    $0x80114020,%ebx
801014fd:	75 e1                	jne    801014e0 <iinit+0x20>
  readsb(dev, &sb);
801014ff:	83 ec 08             	sub    $0x8,%esp
80101502:	68 a0 23 11 80       	push   $0x801123a0
80101507:	ff 75 08             	pushl  0x8(%ebp)
8010150a:	e8 71 ff ff ff       	call   80101480 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010150f:	ff 35 b8 23 11 80    	pushl  0x801123b8
80101515:	ff 35 b4 23 11 80    	pushl  0x801123b4
8010151b:	ff 35 b0 23 11 80    	pushl  0x801123b0
80101521:	ff 35 ac 23 11 80    	pushl  0x801123ac
80101527:	ff 35 a8 23 11 80    	pushl  0x801123a8
8010152d:	ff 35 a4 23 11 80    	pushl  0x801123a4
80101533:	ff 35 a0 23 11 80    	pushl  0x801123a0
80101539:	68 b8 77 10 80       	push   $0x801077b8
8010153e:	e8 1d f1 ff ff       	call   80100660 <cprintf>
}
80101543:	83 c4 30             	add    $0x30,%esp
80101546:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101549:	c9                   	leave  
8010154a:	c3                   	ret    
8010154b:	90                   	nop
8010154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101550 <ialloc>:
{
80101550:	55                   	push   %ebp
80101551:	89 e5                	mov    %esp,%ebp
80101553:	57                   	push   %edi
80101554:	56                   	push   %esi
80101555:	53                   	push   %ebx
80101556:	83 ec 1c             	sub    $0x1c,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101559:	83 3d a8 23 11 80 01 	cmpl   $0x1,0x801123a8
{
80101560:	8b 45 0c             	mov    0xc(%ebp),%eax
80101563:	8b 75 08             	mov    0x8(%ebp),%esi
80101566:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101569:	0f 86 91 00 00 00    	jbe    80101600 <ialloc+0xb0>
8010156f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101574:	eb 21                	jmp    80101597 <ialloc+0x47>
80101576:	8d 76 00             	lea    0x0(%esi),%esi
80101579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    brelse(bp);
80101580:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101583:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
80101586:	57                   	push   %edi
80101587:	e8 54 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010158c:	83 c4 10             	add    $0x10,%esp
8010158f:	39 1d a8 23 11 80    	cmp    %ebx,0x801123a8
80101595:	76 69                	jbe    80101600 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101597:	89 d8                	mov    %ebx,%eax
80101599:	83 ec 08             	sub    $0x8,%esp
8010159c:	c1 e8 03             	shr    $0x3,%eax
8010159f:	03 05 b4 23 11 80    	add    0x801123b4,%eax
801015a5:	50                   	push   %eax
801015a6:	56                   	push   %esi
801015a7:	e8 24 eb ff ff       	call   801000d0 <bread>
801015ac:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
801015ae:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
801015b0:	83 c4 10             	add    $0x10,%esp
    dip = (struct dinode*)bp->data + inum%IPB;
801015b3:	83 e0 07             	and    $0x7,%eax
801015b6:	c1 e0 06             	shl    $0x6,%eax
801015b9:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
801015bd:	66 83 39 00          	cmpw   $0x0,(%ecx)
801015c1:	75 bd                	jne    80101580 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
801015c3:	83 ec 04             	sub    $0x4,%esp
801015c6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015c9:	6a 40                	push   $0x40
801015cb:	6a 00                	push   $0x0
801015cd:	51                   	push   %ecx
801015ce:	e8 cd 30 00 00       	call   801046a0 <memset>
      dip->type = type;
801015d3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015d7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015da:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015dd:	89 3c 24             	mov    %edi,(%esp)
801015e0:	e8 1b 18 00 00       	call   80102e00 <log_write>
      brelse(bp);
801015e5:	89 3c 24             	mov    %edi,(%esp)
801015e8:	e8 f3 eb ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
801015ed:	83 c4 10             	add    $0x10,%esp
}
801015f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
801015f3:	89 da                	mov    %ebx,%edx
801015f5:	89 f0                	mov    %esi,%eax
}
801015f7:	5b                   	pop    %ebx
801015f8:	5e                   	pop    %esi
801015f9:	5f                   	pop    %edi
801015fa:	5d                   	pop    %ebp
      return iget(dev, inum);
801015fb:	e9 d0 fc ff ff       	jmp    801012d0 <iget>
  panic("ialloc: no inodes");
80101600:	83 ec 0c             	sub    $0xc,%esp
80101603:	68 58 77 10 80       	push   $0x80107758
80101608:	e8 83 ed ff ff       	call   80100390 <panic>
8010160d:	8d 76 00             	lea    0x0(%esi),%esi

80101610 <iupdate>:
{
80101610:	55                   	push   %ebp
80101611:	89 e5                	mov    %esp,%ebp
80101613:	56                   	push   %esi
80101614:	53                   	push   %ebx
80101615:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101618:	83 ec 08             	sub    $0x8,%esp
8010161b:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010161e:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101621:	c1 e8 03             	shr    $0x3,%eax
80101624:	03 05 b4 23 11 80    	add    0x801123b4,%eax
8010162a:	50                   	push   %eax
8010162b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010162e:	e8 9d ea ff ff       	call   801000d0 <bread>
80101633:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101635:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
80101638:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010163c:	83 c4 0c             	add    $0xc,%esp
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010163f:	83 e0 07             	and    $0x7,%eax
80101642:	c1 e0 06             	shl    $0x6,%eax
80101645:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101649:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010164c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101650:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101653:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101657:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010165b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010165f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101663:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101667:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010166a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010166d:	6a 34                	push   $0x34
8010166f:	53                   	push   %ebx
80101670:	50                   	push   %eax
80101671:	e8 da 30 00 00       	call   80104750 <memmove>
  log_write(bp);
80101676:	89 34 24             	mov    %esi,(%esp)
80101679:	e8 82 17 00 00       	call   80102e00 <log_write>
  brelse(bp);
8010167e:	89 75 08             	mov    %esi,0x8(%ebp)
80101681:	83 c4 10             	add    $0x10,%esp
}
80101684:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101687:	5b                   	pop    %ebx
80101688:	5e                   	pop    %esi
80101689:	5d                   	pop    %ebp
  brelse(bp);
8010168a:	e9 51 eb ff ff       	jmp    801001e0 <brelse>
8010168f:	90                   	nop

80101690 <idup>:
{
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	53                   	push   %ebx
80101694:	83 ec 10             	sub    $0x10,%esp
80101697:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010169a:	68 c0 23 11 80       	push   $0x801123c0
8010169f:	e8 ec 2e 00 00       	call   80104590 <acquire>
  ip->ref++;
801016a4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016a8:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
801016af:	e8 9c 2f 00 00       	call   80104650 <release>
}
801016b4:	89 d8                	mov    %ebx,%eax
801016b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801016b9:	c9                   	leave  
801016ba:	c3                   	ret    
801016bb:	90                   	nop
801016bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801016c0 <ilock>:
{
801016c0:	55                   	push   %ebp
801016c1:	89 e5                	mov    %esp,%ebp
801016c3:	56                   	push   %esi
801016c4:	53                   	push   %ebx
801016c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
801016c8:	85 db                	test   %ebx,%ebx
801016ca:	0f 84 b7 00 00 00    	je     80101787 <ilock+0xc7>
801016d0:	8b 53 08             	mov    0x8(%ebx),%edx
801016d3:	85 d2                	test   %edx,%edx
801016d5:	0f 8e ac 00 00 00    	jle    80101787 <ilock+0xc7>
  acquiresleep(&ip->lock);
801016db:	8d 43 0c             	lea    0xc(%ebx),%eax
801016de:	83 ec 0c             	sub    $0xc,%esp
801016e1:	50                   	push   %eax
801016e2:	e8 79 2c 00 00       	call   80104360 <acquiresleep>
  if(ip->valid == 0){
801016e7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ea:	83 c4 10             	add    $0x10,%esp
801016ed:	85 c0                	test   %eax,%eax
801016ef:	74 0f                	je     80101700 <ilock+0x40>
}
801016f1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016f4:	5b                   	pop    %ebx
801016f5:	5e                   	pop    %esi
801016f6:	5d                   	pop    %ebp
801016f7:	c3                   	ret    
801016f8:	90                   	nop
801016f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101700:	8b 43 04             	mov    0x4(%ebx),%eax
80101703:	83 ec 08             	sub    $0x8,%esp
80101706:	c1 e8 03             	shr    $0x3,%eax
80101709:	03 05 b4 23 11 80    	add    0x801123b4,%eax
8010170f:	50                   	push   %eax
80101710:	ff 33                	pushl  (%ebx)
80101712:	e8 b9 e9 ff ff       	call   801000d0 <bread>
80101717:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101719:	8b 43 04             	mov    0x4(%ebx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010171c:	83 c4 0c             	add    $0xc,%esp
    dip = (struct dinode*)bp->data + ip->inum%IPB;
8010171f:	83 e0 07             	and    $0x7,%eax
80101722:	c1 e0 06             	shl    $0x6,%eax
80101725:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
80101729:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010172c:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
8010172f:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101733:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101737:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
8010173b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010173f:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101743:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101747:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010174b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010174e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101751:	6a 34                	push   $0x34
80101753:	50                   	push   %eax
80101754:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101757:	50                   	push   %eax
80101758:	e8 f3 2f 00 00       	call   80104750 <memmove>
    brelse(bp);
8010175d:	89 34 24             	mov    %esi,(%esp)
80101760:	e8 7b ea ff ff       	call   801001e0 <brelse>
    if(ip->type == 0)
80101765:	83 c4 10             	add    $0x10,%esp
80101768:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010176d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101774:	0f 85 77 ff ff ff    	jne    801016f1 <ilock+0x31>
      panic("ilock: no type");
8010177a:	83 ec 0c             	sub    $0xc,%esp
8010177d:	68 70 77 10 80       	push   $0x80107770
80101782:	e8 09 ec ff ff       	call   80100390 <panic>
    panic("ilock");
80101787:	83 ec 0c             	sub    $0xc,%esp
8010178a:	68 6a 77 10 80       	push   $0x8010776a
8010178f:	e8 fc eb ff ff       	call   80100390 <panic>
80101794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010179a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801017a0 <iunlock>:
{
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	56                   	push   %esi
801017a4:	53                   	push   %ebx
801017a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
801017a8:	85 db                	test   %ebx,%ebx
801017aa:	74 28                	je     801017d4 <iunlock+0x34>
801017ac:	8d 73 0c             	lea    0xc(%ebx),%esi
801017af:	83 ec 0c             	sub    $0xc,%esp
801017b2:	56                   	push   %esi
801017b3:	e8 48 2c 00 00       	call   80104400 <holdingsleep>
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 c0                	test   %eax,%eax
801017bd:	74 15                	je     801017d4 <iunlock+0x34>
801017bf:	8b 43 08             	mov    0x8(%ebx),%eax
801017c2:	85 c0                	test   %eax,%eax
801017c4:	7e 0e                	jle    801017d4 <iunlock+0x34>
  releasesleep(&ip->lock);
801017c6:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017c9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017cc:	5b                   	pop    %ebx
801017cd:	5e                   	pop    %esi
801017ce:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
801017cf:	e9 ec 2b 00 00       	jmp    801043c0 <releasesleep>
    panic("iunlock");
801017d4:	83 ec 0c             	sub    $0xc,%esp
801017d7:	68 7f 77 10 80       	push   $0x8010777f
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
{
801017f0:	55                   	push   %ebp
801017f1:	89 e5                	mov    %esp,%ebp
801017f3:	57                   	push   %edi
801017f4:	56                   	push   %esi
801017f5:	53                   	push   %ebx
801017f6:	83 ec 28             	sub    $0x28,%esp
801017f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
801017fc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017ff:	57                   	push   %edi
80101800:	e8 5b 2b 00 00       	call   80104360 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
80101805:	8b 53 4c             	mov    0x4c(%ebx),%edx
80101808:	83 c4 10             	add    $0x10,%esp
8010180b:	85 d2                	test   %edx,%edx
8010180d:	74 07                	je     80101816 <iput+0x26>
8010180f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101814:	74 32                	je     80101848 <iput+0x58>
  releasesleep(&ip->lock);
80101816:	83 ec 0c             	sub    $0xc,%esp
80101819:	57                   	push   %edi
8010181a:	e8 a1 2b 00 00       	call   801043c0 <releasesleep>
  acquire(&icache.lock);
8010181f:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
80101826:	e8 65 2d 00 00       	call   80104590 <acquire>
  ip->ref--;
8010182b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010182f:	83 c4 10             	add    $0x10,%esp
80101832:	c7 45 08 c0 23 11 80 	movl   $0x801123c0,0x8(%ebp)
}
80101839:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010183c:	5b                   	pop    %ebx
8010183d:	5e                   	pop    %esi
8010183e:	5f                   	pop    %edi
8010183f:	5d                   	pop    %ebp
  release(&icache.lock);
80101840:	e9 0b 2e 00 00       	jmp    80104650 <release>
80101845:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101848:	83 ec 0c             	sub    $0xc,%esp
8010184b:	68 c0 23 11 80       	push   $0x801123c0
80101850:	e8 3b 2d 00 00       	call   80104590 <acquire>
    int r = ip->ref;
80101855:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101858:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
8010185f:	e8 ec 2d 00 00       	call   80104650 <release>
    if(r == 1){
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
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101883:	39 fe                	cmp    %edi,%esi
80101885:	74 19                	je     801018a0 <iput+0xb0>
    if(ip->addrs[i]){
80101887:	8b 16                	mov    (%esi),%edx
80101889:	85 d2                	test   %edx,%edx
8010188b:	74 f3                	je     80101880 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010188d:	8b 03                	mov    (%ebx),%eax
8010188f:	e8 bc f8 ff ff       	call   80101150 <bfree>
      ip->addrs[i] = 0;
80101894:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010189a:	eb e4                	jmp    80101880 <iput+0x90>
8010189c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
801018a0:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
801018a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801018a9:	85 c0                	test   %eax,%eax
801018ab:	75 33                	jne    801018e0 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
801018ad:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
801018b0:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
801018b7:	53                   	push   %ebx
801018b8:	e8 53 fd ff ff       	call   80101610 <iupdate>
      ip->type = 0;
801018bd:	31 c0                	xor    %eax,%eax
801018bf:	66 89 43 50          	mov    %ax,0x50(%ebx)
      iupdate(ip);
801018c3:	89 1c 24             	mov    %ebx,(%esp)
801018c6:	e8 45 fd ff ff       	call   80101610 <iupdate>
      ip->valid = 0;
801018cb:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801018d2:	83 c4 10             	add    $0x10,%esp
801018d5:	e9 3c ff ff ff       	jmp    80101816 <iput+0x26>
801018da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018e0:	83 ec 08             	sub    $0x8,%esp
801018e3:	50                   	push   %eax
801018e4:	ff 33                	pushl  (%ebx)
801018e6:	e8 e5 e7 ff ff       	call   801000d0 <bread>
801018eb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018f1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018f7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018fa:	83 c4 10             	add    $0x10,%esp
801018fd:	89 cf                	mov    %ecx,%edi
801018ff:	eb 0e                	jmp    8010190f <iput+0x11f>
80101901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101908:	83 c6 04             	add    $0x4,%esi
    for(j = 0; j < NINDIRECT; j++){
8010190b:	39 fe                	cmp    %edi,%esi
8010190d:	74 0f                	je     8010191e <iput+0x12e>
      if(a[j])
8010190f:	8b 16                	mov    (%esi),%edx
80101911:	85 d2                	test   %edx,%edx
80101913:	74 f3                	je     80101908 <iput+0x118>
        bfree(ip->dev, a[j]);
80101915:	8b 03                	mov    (%ebx),%eax
80101917:	e8 34 f8 ff ff       	call   80101150 <bfree>
8010191c:	eb ea                	jmp    80101908 <iput+0x118>
    brelse(bp);
8010191e:	83 ec 0c             	sub    $0xc,%esp
80101921:	ff 75 e4             	pushl  -0x1c(%ebp)
80101924:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101927:	e8 b4 e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
8010192c:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101932:	8b 03                	mov    (%ebx),%eax
80101934:	e8 17 f8 ff ff       	call   80101150 <bfree>
    ip->addrs[NDIRECT] = 0;
80101939:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101940:	00 00 00 
80101943:	83 c4 10             	add    $0x10,%esp
80101946:	e9 62 ff ff ff       	jmp    801018ad <iput+0xbd>
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <iunlockput>:
{
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	53                   	push   %ebx
80101954:	83 ec 10             	sub    $0x10,%esp
80101957:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010195a:	53                   	push   %ebx
8010195b:	e8 40 fe ff ff       	call   801017a0 <iunlock>
  iput(ip);
80101960:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101963:	83 c4 10             	add    $0x10,%esp
}
80101966:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101969:	c9                   	leave  
  iput(ip);
8010196a:	e9 81 fe ff ff       	jmp    801017f0 <iput>
8010196f:	90                   	nop

80101970 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	8b 55 08             	mov    0x8(%ebp),%edx
80101976:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101979:	8b 0a                	mov    (%edx),%ecx
8010197b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010197e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101981:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101984:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101988:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010198b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010198f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101993:	8b 52 58             	mov    0x58(%edx),%edx
80101996:	89 50 10             	mov    %edx,0x10(%eax)
}
80101999:	5d                   	pop    %ebp
8010199a:	c3                   	ret    
8010199b:	90                   	nop
8010199c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801019a0 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
801019a0:	55                   	push   %ebp
801019a1:	89 e5                	mov    %esp,%ebp
801019a3:	57                   	push   %edi
801019a4:	56                   	push   %esi
801019a5:	53                   	push   %ebx
801019a6:	83 ec 1c             	sub    $0x1c,%esp
801019a9:	8b 45 08             	mov    0x8(%ebp),%eax
801019ac:	8b 75 0c             	mov    0xc(%ebp),%esi
801019af:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
801019b2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
801019b7:	89 75 e0             	mov    %esi,-0x20(%ebp)
801019ba:	89 45 d8             	mov    %eax,-0x28(%ebp)
801019bd:	8b 75 10             	mov    0x10(%ebp),%esi
801019c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
801019c3:	0f 84 a7 00 00 00    	je     80101a70 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
801019c9:	8b 45 d8             	mov    -0x28(%ebp),%eax
801019cc:	8b 40 58             	mov    0x58(%eax),%eax
801019cf:	39 c6                	cmp    %eax,%esi
801019d1:	0f 87 ba 00 00 00    	ja     80101a91 <readi+0xf1>
801019d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019da:	89 f9                	mov    %edi,%ecx
801019dc:	01 f1                	add    %esi,%ecx
801019de:	0f 82 ad 00 00 00    	jb     80101a91 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019e4:	89 c2                	mov    %eax,%edx
801019e6:	29 f2                	sub    %esi,%edx
801019e8:	39 c8                	cmp    %ecx,%eax
801019ea:	0f 43 d7             	cmovae %edi,%edx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019ed:	31 ff                	xor    %edi,%edi
801019ef:	85 d2                	test   %edx,%edx
    n = ip->size - off;
801019f1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f4:	74 6c                	je     80101a62 <readi+0xc2>
801019f6:	8d 76 00             	lea    0x0(%esi),%esi
801019f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a00:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101a03:	89 f2                	mov    %esi,%edx
80101a05:	c1 ea 09             	shr    $0x9,%edx
80101a08:	89 d8                	mov    %ebx,%eax
80101a0a:	e8 91 f9 ff ff       	call   801013a0 <bmap>
80101a0f:	83 ec 08             	sub    $0x8,%esp
80101a12:	50                   	push   %eax
80101a13:	ff 33                	pushl  (%ebx)
80101a15:	e8 b6 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101a1a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a1d:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a1f:	89 f0                	mov    %esi,%eax
80101a21:	25 ff 01 00 00       	and    $0x1ff,%eax
80101a26:	b9 00 02 00 00       	mov    $0x200,%ecx
80101a2b:	83 c4 0c             	add    $0xc,%esp
80101a2e:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
80101a30:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a34:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101a37:	29 fb                	sub    %edi,%ebx
80101a39:	39 d9                	cmp    %ebx,%ecx
80101a3b:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101a3e:	53                   	push   %ebx
80101a3f:	50                   	push   %eax
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a40:	01 df                	add    %ebx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101a42:	ff 75 e0             	pushl  -0x20(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a45:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101a47:	e8 04 2d 00 00       	call   80104750 <memmove>
    brelse(bp);
80101a4c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a4f:	89 14 24             	mov    %edx,(%esp)
80101a52:	e8 89 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a57:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a5a:	83 c4 10             	add    $0x10,%esp
80101a5d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a60:	77 9e                	ja     80101a00 <readi+0x60>
  }
  return n;
80101a62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a68:	5b                   	pop    %ebx
80101a69:	5e                   	pop    %esi
80101a6a:	5f                   	pop    %edi
80101a6b:	5d                   	pop    %ebp
80101a6c:	c3                   	ret    
80101a6d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a70:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a74:	66 83 f8 09          	cmp    $0x9,%ax
80101a78:	77 17                	ja     80101a91 <readi+0xf1>
80101a7a:	8b 04 c5 40 23 11 80 	mov    -0x7feedcc0(,%eax,8),%eax
80101a81:	85 c0                	test   %eax,%eax
80101a83:	74 0c                	je     80101a91 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101a85:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101a88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a8b:	5b                   	pop    %ebx
80101a8c:	5e                   	pop    %esi
80101a8d:	5f                   	pop    %edi
80101a8e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101a8f:	ff e0                	jmp    *%eax
      return -1;
80101a91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a96:	eb cd                	jmp    80101a65 <readi+0xc5>
80101a98:	90                   	nop
80101a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101aa0 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101aa0:	55                   	push   %ebp
80101aa1:	89 e5                	mov    %esp,%ebp
80101aa3:	57                   	push   %edi
80101aa4:	56                   	push   %esi
80101aa5:	53                   	push   %ebx
80101aa6:	83 ec 1c             	sub    $0x1c,%esp
80101aa9:	8b 45 08             	mov    0x8(%ebp),%eax
80101aac:	8b 75 0c             	mov    0xc(%ebp),%esi
80101aaf:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ab2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101ab7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101aba:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101abd:	8b 75 10             	mov    0x10(%ebp),%esi
80101ac0:	89 7d e0             	mov    %edi,-0x20(%ebp)
  if(ip->type == T_DEV){
80101ac3:	0f 84 b7 00 00 00    	je     80101b80 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101ac9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101acc:	39 70 58             	cmp    %esi,0x58(%eax)
80101acf:	0f 82 eb 00 00 00    	jb     80101bc0 <writei+0x120>
80101ad5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101ad8:	31 d2                	xor    %edx,%edx
80101ada:	89 f8                	mov    %edi,%eax
80101adc:	01 f0                	add    %esi,%eax
80101ade:	0f 92 c2             	setb   %dl
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101ae1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ae6:	0f 87 d4 00 00 00    	ja     80101bc0 <writei+0x120>
80101aec:	85 d2                	test   %edx,%edx
80101aee:	0f 85 cc 00 00 00    	jne    80101bc0 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af4:	85 ff                	test   %edi,%edi
80101af6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101afd:	74 72                	je     80101b71 <writei+0xd1>
80101aff:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b00:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101b03:	89 f2                	mov    %esi,%edx
80101b05:	c1 ea 09             	shr    $0x9,%edx
80101b08:	89 f8                	mov    %edi,%eax
80101b0a:	e8 91 f8 ff ff       	call   801013a0 <bmap>
80101b0f:	83 ec 08             	sub    $0x8,%esp
80101b12:	50                   	push   %eax
80101b13:	ff 37                	pushl  (%edi)
80101b15:	e8 b6 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101b1a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101b1d:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b20:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101b22:	89 f0                	mov    %esi,%eax
80101b24:	b9 00 02 00 00       	mov    $0x200,%ecx
80101b29:	83 c4 0c             	add    $0xc,%esp
80101b2c:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b31:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101b33:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101b37:	39 d9                	cmp    %ebx,%ecx
80101b39:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101b3c:	53                   	push   %ebx
80101b3d:	ff 75 dc             	pushl  -0x24(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b40:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101b42:	50                   	push   %eax
80101b43:	e8 08 2c 00 00       	call   80104750 <memmove>
    log_write(bp);
80101b48:	89 3c 24             	mov    %edi,(%esp)
80101b4b:	e8 b0 12 00 00       	call   80102e00 <log_write>
    brelse(bp);
80101b50:	89 3c 24             	mov    %edi,(%esp)
80101b53:	e8 88 e6 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b58:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b5b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b5e:	83 c4 10             	add    $0x10,%esp
80101b61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b64:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b67:	77 97                	ja     80101b00 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101b69:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b6c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b6f:	77 37                	ja     80101ba8 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b71:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b77:	5b                   	pop    %ebx
80101b78:	5e                   	pop    %esi
80101b79:	5f                   	pop    %edi
80101b7a:	5d                   	pop    %ebp
80101b7b:	c3                   	ret    
80101b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b80:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b84:	66 83 f8 09          	cmp    $0x9,%ax
80101b88:	77 36                	ja     80101bc0 <writei+0x120>
80101b8a:	8b 04 c5 44 23 11 80 	mov    -0x7feedcbc(,%eax,8),%eax
80101b91:	85 c0                	test   %eax,%eax
80101b93:	74 2b                	je     80101bc0 <writei+0x120>
    return devsw[ip->major].write(ip, src, n);
80101b95:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101b98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b9b:	5b                   	pop    %ebx
80101b9c:	5e                   	pop    %esi
80101b9d:	5f                   	pop    %edi
80101b9e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101b9f:	ff e0                	jmp    *%eax
80101ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101ba8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101bab:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101bae:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101bb1:	50                   	push   %eax
80101bb2:	e8 59 fa ff ff       	call   80101610 <iupdate>
80101bb7:	83 c4 10             	add    $0x10,%esp
80101bba:	eb b5                	jmp    80101b71 <writei+0xd1>
80101bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bc5:	eb ad                	jmp    80101b74 <writei+0xd4>
80101bc7:	89 f6                	mov    %esi,%esi
80101bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bd0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101bd0:	55                   	push   %ebp
80101bd1:	89 e5                	mov    %esp,%ebp
80101bd3:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101bd6:	6a 0e                	push   $0xe
80101bd8:	ff 75 0c             	pushl  0xc(%ebp)
80101bdb:	ff 75 08             	pushl  0x8(%ebp)
80101bde:	e8 dd 2b 00 00       	call   801047c0 <strncmp>
}
80101be3:	c9                   	leave  
80101be4:	c3                   	ret    
80101be5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bf0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bf0:	55                   	push   %ebp
80101bf1:	89 e5                	mov    %esp,%ebp
80101bf3:	57                   	push   %edi
80101bf4:	56                   	push   %esi
80101bf5:	53                   	push   %ebx
80101bf6:	83 ec 1c             	sub    $0x1c,%esp
80101bf9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bfc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101c01:	0f 85 85 00 00 00    	jne    80101c8c <dirlookup+0x9c>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101c07:	8b 53 58             	mov    0x58(%ebx),%edx
80101c0a:	31 ff                	xor    %edi,%edi
80101c0c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c0f:	85 d2                	test   %edx,%edx
80101c11:	74 3e                	je     80101c51 <dirlookup+0x61>
80101c13:	90                   	nop
80101c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c18:	6a 10                	push   $0x10
80101c1a:	57                   	push   %edi
80101c1b:	56                   	push   %esi
80101c1c:	53                   	push   %ebx
80101c1d:	e8 7e fd ff ff       	call   801019a0 <readi>
80101c22:	83 c4 10             	add    $0x10,%esp
80101c25:	83 f8 10             	cmp    $0x10,%eax
80101c28:	75 55                	jne    80101c7f <dirlookup+0x8f>
      panic("dirlookup read");
    if(de.inum == 0)
80101c2a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c2f:	74 18                	je     80101c49 <dirlookup+0x59>
  return strncmp(s, t, DIRSIZ);
80101c31:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c34:	83 ec 04             	sub    $0x4,%esp
80101c37:	6a 0e                	push   $0xe
80101c39:	50                   	push   %eax
80101c3a:	ff 75 0c             	pushl  0xc(%ebp)
80101c3d:	e8 7e 2b 00 00       	call   801047c0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101c42:	83 c4 10             	add    $0x10,%esp
80101c45:	85 c0                	test   %eax,%eax
80101c47:	74 17                	je     80101c60 <dirlookup+0x70>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101c49:	83 c7 10             	add    $0x10,%edi
80101c4c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c4f:	72 c7                	jb     80101c18 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101c51:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101c54:	31 c0                	xor    %eax,%eax
}
80101c56:	5b                   	pop    %ebx
80101c57:	5e                   	pop    %esi
80101c58:	5f                   	pop    %edi
80101c59:	5d                   	pop    %ebp
80101c5a:	c3                   	ret    
80101c5b:	90                   	nop
80101c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(poff)
80101c60:	8b 45 10             	mov    0x10(%ebp),%eax
80101c63:	85 c0                	test   %eax,%eax
80101c65:	74 05                	je     80101c6c <dirlookup+0x7c>
        *poff = off;
80101c67:	8b 45 10             	mov    0x10(%ebp),%eax
80101c6a:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c6c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c70:	8b 03                	mov    (%ebx),%eax
80101c72:	e8 59 f6 ff ff       	call   801012d0 <iget>
}
80101c77:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c7a:	5b                   	pop    %ebx
80101c7b:	5e                   	pop    %esi
80101c7c:	5f                   	pop    %edi
80101c7d:	5d                   	pop    %ebp
80101c7e:	c3                   	ret    
      panic("dirlookup read");
80101c7f:	83 ec 0c             	sub    $0xc,%esp
80101c82:	68 99 77 10 80       	push   $0x80107799
80101c87:	e8 04 e7 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101c8c:	83 ec 0c             	sub    $0xc,%esp
80101c8f:	68 87 77 10 80       	push   $0x80107787
80101c94:	e8 f7 e6 ff ff       	call   80100390 <panic>
80101c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101ca0 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101ca0:	55                   	push   %ebp
80101ca1:	89 e5                	mov    %esp,%ebp
80101ca3:	57                   	push   %edi
80101ca4:	56                   	push   %esi
80101ca5:	53                   	push   %ebx
80101ca6:	89 cf                	mov    %ecx,%edi
80101ca8:	89 c3                	mov    %eax,%ebx
80101caa:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101cad:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101cb0:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101cb3:	0f 84 67 01 00 00    	je     80101e20 <namex+0x180>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101cb9:	e8 e2 1b 00 00       	call   801038a0 <myproc>
  acquire(&icache.lock);
80101cbe:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101cc1:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101cc4:	68 c0 23 11 80       	push   $0x801123c0
80101cc9:	e8 c2 28 00 00       	call   80104590 <acquire>
  ip->ref++;
80101cce:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101cd2:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
80101cd9:	e8 72 29 00 00       	call   80104650 <release>
80101cde:	83 c4 10             	add    $0x10,%esp
80101ce1:	eb 08                	jmp    80101ceb <namex+0x4b>
80101ce3:	90                   	nop
80101ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101ce8:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101ceb:	0f b6 03             	movzbl (%ebx),%eax
80101cee:	3c 2f                	cmp    $0x2f,%al
80101cf0:	74 f6                	je     80101ce8 <namex+0x48>
  if(*path == 0)
80101cf2:	84 c0                	test   %al,%al
80101cf4:	0f 84 ee 00 00 00    	je     80101de8 <namex+0x148>
  while(*path != '/' && *path != 0)
80101cfa:	0f b6 03             	movzbl (%ebx),%eax
80101cfd:	3c 2f                	cmp    $0x2f,%al
80101cff:	0f 84 b3 00 00 00    	je     80101db8 <namex+0x118>
80101d05:	84 c0                	test   %al,%al
80101d07:	89 da                	mov    %ebx,%edx
80101d09:	75 09                	jne    80101d14 <namex+0x74>
80101d0b:	e9 a8 00 00 00       	jmp    80101db8 <namex+0x118>
80101d10:	84 c0                	test   %al,%al
80101d12:	74 0a                	je     80101d1e <namex+0x7e>
    path++;
80101d14:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101d17:	0f b6 02             	movzbl (%edx),%eax
80101d1a:	3c 2f                	cmp    $0x2f,%al
80101d1c:	75 f2                	jne    80101d10 <namex+0x70>
80101d1e:	89 d1                	mov    %edx,%ecx
80101d20:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101d22:	83 f9 0d             	cmp    $0xd,%ecx
80101d25:	0f 8e 91 00 00 00    	jle    80101dbc <namex+0x11c>
    memmove(name, s, DIRSIZ);
80101d2b:	83 ec 04             	sub    $0x4,%esp
80101d2e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d31:	6a 0e                	push   $0xe
80101d33:	53                   	push   %ebx
80101d34:	57                   	push   %edi
80101d35:	e8 16 2a 00 00       	call   80104750 <memmove>
    path++;
80101d3a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    memmove(name, s, DIRSIZ);
80101d3d:	83 c4 10             	add    $0x10,%esp
    path++;
80101d40:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101d42:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d45:	75 11                	jne    80101d58 <namex+0xb8>
80101d47:	89 f6                	mov    %esi,%esi
80101d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d50:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d53:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d56:	74 f8                	je     80101d50 <namex+0xb0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d58:	83 ec 0c             	sub    $0xc,%esp
80101d5b:	56                   	push   %esi
80101d5c:	e8 5f f9 ff ff       	call   801016c0 <ilock>
    if(ip->type != T_DIR){
80101d61:	83 c4 10             	add    $0x10,%esp
80101d64:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d69:	0f 85 91 00 00 00    	jne    80101e00 <namex+0x160>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d6f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d72:	85 d2                	test   %edx,%edx
80101d74:	74 09                	je     80101d7f <namex+0xdf>
80101d76:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d79:	0f 84 b7 00 00 00    	je     80101e36 <namex+0x196>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d7f:	83 ec 04             	sub    $0x4,%esp
80101d82:	6a 00                	push   $0x0
80101d84:	57                   	push   %edi
80101d85:	56                   	push   %esi
80101d86:	e8 65 fe ff ff       	call   80101bf0 <dirlookup>
80101d8b:	83 c4 10             	add    $0x10,%esp
80101d8e:	85 c0                	test   %eax,%eax
80101d90:	74 6e                	je     80101e00 <namex+0x160>
  iunlock(ip);
80101d92:	83 ec 0c             	sub    $0xc,%esp
80101d95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d98:	56                   	push   %esi
80101d99:	e8 02 fa ff ff       	call   801017a0 <iunlock>
  iput(ip);
80101d9e:	89 34 24             	mov    %esi,(%esp)
80101da1:	e8 4a fa ff ff       	call   801017f0 <iput>
80101da6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101da9:	83 c4 10             	add    $0x10,%esp
80101dac:	89 c6                	mov    %eax,%esi
80101dae:	e9 38 ff ff ff       	jmp    80101ceb <namex+0x4b>
80101db3:	90                   	nop
80101db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*path != '/' && *path != 0)
80101db8:	89 da                	mov    %ebx,%edx
80101dba:	31 c9                	xor    %ecx,%ecx
    memmove(name, s, len);
80101dbc:	83 ec 04             	sub    $0x4,%esp
80101dbf:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101dc2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101dc5:	51                   	push   %ecx
80101dc6:	53                   	push   %ebx
80101dc7:	57                   	push   %edi
80101dc8:	e8 83 29 00 00       	call   80104750 <memmove>
    name[len] = 0;
80101dcd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101dd0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101dd3:	83 c4 10             	add    $0x10,%esp
80101dd6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101dda:	89 d3                	mov    %edx,%ebx
80101ddc:	e9 61 ff ff ff       	jmp    80101d42 <namex+0xa2>
80101de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101de8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101deb:	85 c0                	test   %eax,%eax
80101ded:	75 5d                	jne    80101e4c <namex+0x1ac>
    iput(ip);
    return 0;
  }
  return ip;
}
80101def:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101df2:	89 f0                	mov    %esi,%eax
80101df4:	5b                   	pop    %ebx
80101df5:	5e                   	pop    %esi
80101df6:	5f                   	pop    %edi
80101df7:	5d                   	pop    %ebp
80101df8:	c3                   	ret    
80101df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  iunlock(ip);
80101e00:	83 ec 0c             	sub    $0xc,%esp
80101e03:	56                   	push   %esi
80101e04:	e8 97 f9 ff ff       	call   801017a0 <iunlock>
  iput(ip);
80101e09:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101e0c:	31 f6                	xor    %esi,%esi
  iput(ip);
80101e0e:	e8 dd f9 ff ff       	call   801017f0 <iput>
      return 0;
80101e13:	83 c4 10             	add    $0x10,%esp
}
80101e16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e19:	89 f0                	mov    %esi,%eax
80101e1b:	5b                   	pop    %ebx
80101e1c:	5e                   	pop    %esi
80101e1d:	5f                   	pop    %edi
80101e1e:	5d                   	pop    %ebp
80101e1f:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101e20:	ba 01 00 00 00       	mov    $0x1,%edx
80101e25:	b8 01 00 00 00       	mov    $0x1,%eax
80101e2a:	e8 a1 f4 ff ff       	call   801012d0 <iget>
80101e2f:	89 c6                	mov    %eax,%esi
80101e31:	e9 b5 fe ff ff       	jmp    80101ceb <namex+0x4b>
      iunlock(ip);
80101e36:	83 ec 0c             	sub    $0xc,%esp
80101e39:	56                   	push   %esi
80101e3a:	e8 61 f9 ff ff       	call   801017a0 <iunlock>
      return ip;
80101e3f:	83 c4 10             	add    $0x10,%esp
}
80101e42:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e45:	89 f0                	mov    %esi,%eax
80101e47:	5b                   	pop    %ebx
80101e48:	5e                   	pop    %esi
80101e49:	5f                   	pop    %edi
80101e4a:	5d                   	pop    %ebp
80101e4b:	c3                   	ret    
    iput(ip);
80101e4c:	83 ec 0c             	sub    $0xc,%esp
80101e4f:	56                   	push   %esi
    return 0;
80101e50:	31 f6                	xor    %esi,%esi
    iput(ip);
80101e52:	e8 99 f9 ff ff       	call   801017f0 <iput>
    return 0;
80101e57:	83 c4 10             	add    $0x10,%esp
80101e5a:	eb 93                	jmp    80101def <namex+0x14f>
80101e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e60 <dirlink>:
{
80101e60:	55                   	push   %ebp
80101e61:	89 e5                	mov    %esp,%ebp
80101e63:	57                   	push   %edi
80101e64:	56                   	push   %esi
80101e65:	53                   	push   %ebx
80101e66:	83 ec 20             	sub    $0x20,%esp
80101e69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e6c:	6a 00                	push   $0x0
80101e6e:	ff 75 0c             	pushl  0xc(%ebp)
80101e71:	53                   	push   %ebx
80101e72:	e8 79 fd ff ff       	call   80101bf0 <dirlookup>
80101e77:	83 c4 10             	add    $0x10,%esp
80101e7a:	85 c0                	test   %eax,%eax
80101e7c:	75 67                	jne    80101ee5 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
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
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e98:	6a 10                	push   $0x10
80101e9a:	57                   	push   %edi
80101e9b:	56                   	push   %esi
80101e9c:	53                   	push   %ebx
80101e9d:	e8 fe fa ff ff       	call   801019a0 <readi>
80101ea2:	83 c4 10             	add    $0x10,%esp
80101ea5:	83 f8 10             	cmp    $0x10,%eax
80101ea8:	75 4e                	jne    80101ef8 <dirlink+0x98>
    if(de.inum == 0)
80101eaa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101eaf:	75 df                	jne    80101e90 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80101eb1:	8d 45 da             	lea    -0x26(%ebp),%eax
80101eb4:	83 ec 04             	sub    $0x4,%esp
80101eb7:	6a 0e                	push   $0xe
80101eb9:	ff 75 0c             	pushl  0xc(%ebp)
80101ebc:	50                   	push   %eax
80101ebd:	e8 5e 29 00 00       	call   80104820 <strncpy>
  de.inum = inum;
80101ec2:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ec5:	6a 10                	push   $0x10
80101ec7:	57                   	push   %edi
80101ec8:	56                   	push   %esi
80101ec9:	53                   	push   %ebx
  de.inum = inum;
80101eca:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ece:	e8 cd fb ff ff       	call   80101aa0 <writei>
80101ed3:	83 c4 20             	add    $0x20,%esp
80101ed6:	83 f8 10             	cmp    $0x10,%eax
80101ed9:	75 2a                	jne    80101f05 <dirlink+0xa5>
  return 0;
80101edb:	31 c0                	xor    %eax,%eax
}
80101edd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ee0:	5b                   	pop    %ebx
80101ee1:	5e                   	pop    %esi
80101ee2:	5f                   	pop    %edi
80101ee3:	5d                   	pop    %ebp
80101ee4:	c3                   	ret    
    iput(ip);
80101ee5:	83 ec 0c             	sub    $0xc,%esp
80101ee8:	50                   	push   %eax
80101ee9:	e8 02 f9 ff ff       	call   801017f0 <iput>
    return -1;
80101eee:	83 c4 10             	add    $0x10,%esp
80101ef1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ef6:	eb e5                	jmp    80101edd <dirlink+0x7d>
      panic("dirlink read");
80101ef8:	83 ec 0c             	sub    $0xc,%esp
80101efb:	68 a8 77 10 80       	push   $0x801077a8
80101f00:	e8 8b e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101f05:	83 ec 0c             	sub    $0xc,%esp
80101f08:	68 b6 7d 10 80       	push   $0x80107db6
80101f0d:	e8 7e e4 ff ff       	call   80100390 <panic>
80101f12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f20 <namei>:

struct inode*
namei(char *path)
{
80101f20:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f21:	31 d2                	xor    %edx,%edx
{
80101f23:	89 e5                	mov    %esp,%ebp
80101f25:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101f28:	8b 45 08             	mov    0x8(%ebp),%eax
80101f2b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f2e:	e8 6d fd ff ff       	call   80101ca0 <namex>
}
80101f33:	c9                   	leave  
80101f34:	c3                   	ret    
80101f35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f40 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f40:	55                   	push   %ebp
  return namex(path, 1, name);
80101f41:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101f46:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f48:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f4b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f4e:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101f4f:	e9 4c fd ff ff       	jmp    80101ca0 <namex>
80101f54:	66 90                	xchg   %ax,%ax
80101f56:	66 90                	xchg   %ax,%ax
80101f58:	66 90                	xchg   %ax,%ax
80101f5a:	66 90                	xchg   %ax,%ax
80101f5c:	66 90                	xchg   %ax,%ax
80101f5e:	66 90                	xchg   %ax,%ax

80101f60 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f60:	55                   	push   %ebp
80101f61:	89 e5                	mov    %esp,%ebp
80101f63:	57                   	push   %edi
80101f64:	56                   	push   %esi
80101f65:	53                   	push   %ebx
80101f66:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
80101f69:	85 c0                	test   %eax,%eax
80101f6b:	0f 84 b4 00 00 00    	je     80102025 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f71:	8b 58 08             	mov    0x8(%eax),%ebx
80101f74:	89 c6                	mov    %eax,%esi
80101f76:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f7c:	0f 87 96 00 00 00    	ja     80102018 <idestart+0xb8>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f82:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101f87:	89 f6                	mov    %esi,%esi
80101f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f90:	89 ca                	mov    %ecx,%edx
80101f92:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f93:	83 e0 c0             	and    $0xffffffc0,%eax
80101f96:	3c 40                	cmp    $0x40,%al
80101f98:	75 f6                	jne    80101f90 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101fb7:	89 d8                	mov    %ebx,%eax
80101fb9:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101fbe:	c1 f8 08             	sar    $0x8,%eax
80101fc1:	ee                   	out    %al,(%dx)
80101fc2:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101fc7:	89 f8                	mov    %edi,%eax
80101fc9:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101fca:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101fce:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fd3:	c1 e0 04             	shl    $0x4,%eax
80101fd6:	83 e0 10             	and    $0x10,%eax
80101fd9:	83 c8 e0             	or     $0xffffffe0,%eax
80101fdc:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101fdd:	f6 06 04             	testb  $0x4,(%esi)
80101fe0:	75 16                	jne    80101ff8 <idestart+0x98>
80101fe2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fe7:	89 ca                	mov    %ecx,%edx
80101fe9:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
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
  asm volatile("cld; rep outsl" :
80102000:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80102005:	83 c6 5c             	add    $0x5c,%esi
80102008:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010200d:	fc                   	cld    
8010200e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80102010:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102013:	5b                   	pop    %ebx
80102014:	5e                   	pop    %esi
80102015:	5f                   	pop    %edi
80102016:	5d                   	pop    %ebp
80102017:	c3                   	ret    
    panic("incorrect blockno");
80102018:	83 ec 0c             	sub    $0xc,%esp
8010201b:	68 14 78 10 80       	push   $0x80107814
80102020:	e8 6b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80102025:	83 ec 0c             	sub    $0xc,%esp
80102028:	68 0b 78 10 80       	push   $0x8010780b
8010202d:	e8 5e e3 ff ff       	call   80100390 <panic>
80102032:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102040 <ideinit>:
{
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102046:	68 26 78 10 80       	push   $0x80107826
8010204b:	68 80 b5 10 80       	push   $0x8010b580
80102050:	e8 fb 23 00 00       	call   80104450 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102055:	58                   	pop    %eax
80102056:	a1 e0 46 11 80       	mov    0x801146e0,%eax
8010205b:	5a                   	pop    %edx
8010205c:	83 e8 01             	sub    $0x1,%eax
8010205f:	50                   	push   %eax
80102060:	6a 0e                	push   $0xe
80102062:	e8 a9 02 00 00       	call   80102310 <ioapicenable>
80102067:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010206a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010206f:	90                   	nop
80102070:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102071:	83 e0 c0             	and    $0xffffffc0,%eax
80102074:	3c 40                	cmp    $0x40,%al
80102076:	75 f8                	jne    80102070 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102078:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010207d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102082:	ee                   	out    %al,(%dx)
80102083:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102088:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010208d:	eb 06                	jmp    80102095 <ideinit+0x55>
8010208f:	90                   	nop
  for(i=0; i<1000; i++){
80102090:	83 e9 01             	sub    $0x1,%ecx
80102093:	74 0f                	je     801020a4 <ideinit+0x64>
80102095:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102096:	84 c0                	test   %al,%al
80102098:	74 f6                	je     80102090 <ideinit+0x50>
      havedisk1 = 1;
8010209a:	c7 05 60 b5 10 80 01 	movl   $0x1,0x8010b560
801020a1:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801020a4:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801020a9:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020ae:	ee                   	out    %al,(%dx)
}
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

// Interrupt handler.
void
ideintr(void)
{
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	57                   	push   %edi
801020c4:	56                   	push   %esi
801020c5:	53                   	push   %ebx
801020c6:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801020c9:	68 80 b5 10 80       	push   $0x8010b580
801020ce:	e8 bd 24 00 00       	call   80104590 <acquire>

  if((b = idequeue) == 0){
801020d3:	8b 1d 64 b5 10 80    	mov    0x8010b564,%ebx
801020d9:	83 c4 10             	add    $0x10,%esp
801020dc:	85 db                	test   %ebx,%ebx
801020de:	74 67                	je     80102147 <ideintr+0x87>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
801020e0:	8b 43 58             	mov    0x58(%ebx),%eax
801020e3:	a3 64 b5 10 80       	mov    %eax,0x8010b564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801020e8:	8b 3b                	mov    (%ebx),%edi
801020ea:	f7 c7 04 00 00 00    	test   $0x4,%edi
801020f0:	75 31                	jne    80102123 <ideintr+0x63>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020f2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020f7:	89 f6                	mov    %esi,%esi
801020f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102100:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102101:	89 c6                	mov    %eax,%esi
80102103:	83 e6 c0             	and    $0xffffffc0,%esi
80102106:	89 f1                	mov    %esi,%ecx
80102108:	80 f9 40             	cmp    $0x40,%cl
8010210b:	75 f3                	jne    80102100 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
8010210d:	a8 21                	test   $0x21,%al
8010210f:	75 12                	jne    80102123 <ideintr+0x63>
    insl(0x1f0, b->data, BSIZE/4);
80102111:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80102114:	b9 80 00 00 00       	mov    $0x80,%ecx
80102119:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010211e:	fc                   	cld    
8010211f:	f3 6d                	rep insl (%dx),%es:(%edi)
80102121:	8b 3b                	mov    (%ebx),%edi

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102123:	83 e7 fb             	and    $0xfffffffb,%edi
  wakeup(b);
80102126:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
80102129:	89 f9                	mov    %edi,%ecx
8010212b:	83 c9 02             	or     $0x2,%ecx
8010212e:	89 0b                	mov    %ecx,(%ebx)
  wakeup(b);
80102130:	53                   	push   %ebx
80102131:	e8 4a 1f 00 00       	call   80104080 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102136:	a1 64 b5 10 80       	mov    0x8010b564,%eax
8010213b:	83 c4 10             	add    $0x10,%esp
8010213e:	85 c0                	test   %eax,%eax
80102140:	74 05                	je     80102147 <ideintr+0x87>
    idestart(idequeue);
80102142:	e8 19 fe ff ff       	call   80101f60 <idestart>
    release(&idelock);
80102147:	83 ec 0c             	sub    $0xc,%esp
8010214a:	68 80 b5 10 80       	push   $0x8010b580
8010214f:	e8 fc 24 00 00       	call   80104650 <release>

  release(&idelock);
}
80102154:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102157:	5b                   	pop    %ebx
80102158:	5e                   	pop    %esi
80102159:	5f                   	pop    %edi
8010215a:	5d                   	pop    %ebp
8010215b:	c3                   	ret    
8010215c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102160 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102160:	55                   	push   %ebp
80102161:	89 e5                	mov    %esp,%ebp
80102163:	53                   	push   %ebx
80102164:	83 ec 10             	sub    $0x10,%esp
80102167:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010216a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010216d:	50                   	push   %eax
8010216e:	e8 8d 22 00 00       	call   80104400 <holdingsleep>
80102173:	83 c4 10             	add    $0x10,%esp
80102176:	85 c0                	test   %eax,%eax
80102178:	0f 84 c6 00 00 00    	je     80102244 <iderw+0xe4>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010217e:	8b 03                	mov    (%ebx),%eax
80102180:	83 e0 06             	and    $0x6,%eax
80102183:	83 f8 02             	cmp    $0x2,%eax
80102186:	0f 84 ab 00 00 00    	je     80102237 <iderw+0xd7>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010218c:	8b 53 04             	mov    0x4(%ebx),%edx
8010218f:	85 d2                	test   %edx,%edx
80102191:	74 0d                	je     801021a0 <iderw+0x40>
80102193:	a1 60 b5 10 80       	mov    0x8010b560,%eax
80102198:	85 c0                	test   %eax,%eax
8010219a:	0f 84 b1 00 00 00    	je     80102251 <iderw+0xf1>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
801021a0:	83 ec 0c             	sub    $0xc,%esp
801021a3:	68 80 b5 10 80       	push   $0x8010b580
801021a8:	e8 e3 23 00 00       	call   80104590 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021ad:	8b 15 64 b5 10 80    	mov    0x8010b564,%edx
801021b3:	83 c4 10             	add    $0x10,%esp
  b->qnext = 0;
801021b6:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
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
    ;
  *pp = b;
801021d4:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801021d6:	39 1d 64 b5 10 80    	cmp    %ebx,0x8010b564
801021dc:	74 42                	je     80102220 <iderw+0xc0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021de:	8b 03                	mov    (%ebx),%eax
801021e0:	83 e0 06             	and    $0x6,%eax
801021e3:	83 f8 02             	cmp    $0x2,%eax
801021e6:	74 23                	je     8010220b <iderw+0xab>
801021e8:	90                   	nop
801021e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
801021f0:	83 ec 08             	sub    $0x8,%esp
801021f3:	68 80 b5 10 80       	push   $0x8010b580
801021f8:	53                   	push   %ebx
801021f9:	e8 c2 1c 00 00       	call   80103ec0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021fe:	8b 03                	mov    (%ebx),%eax
80102200:	83 c4 10             	add    $0x10,%esp
80102203:	83 e0 06             	and    $0x6,%eax
80102206:	83 f8 02             	cmp    $0x2,%eax
80102209:	75 e5                	jne    801021f0 <iderw+0x90>
  }


  release(&idelock);
8010220b:	c7 45 08 80 b5 10 80 	movl   $0x8010b580,0x8(%ebp)
}
80102212:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102215:	c9                   	leave  
  release(&idelock);
80102216:	e9 35 24 00 00       	jmp    80104650 <release>
8010221b:	90                   	nop
8010221c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    idestart(b);
80102220:	89 d8                	mov    %ebx,%eax
80102222:	e8 39 fd ff ff       	call   80101f60 <idestart>
80102227:	eb b5                	jmp    801021de <iderw+0x7e>
80102229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102230:	ba 64 b5 10 80       	mov    $0x8010b564,%edx
80102235:	eb 9d                	jmp    801021d4 <iderw+0x74>
    panic("iderw: nothing to do");
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 40 78 10 80       	push   $0x80107840
8010223f:	e8 4c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102244:	83 ec 0c             	sub    $0xc,%esp
80102247:	68 2a 78 10 80       	push   $0x8010782a
8010224c:	e8 3f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102251:	83 ec 0c             	sub    $0xc,%esp
80102254:	68 55 78 10 80       	push   $0x80107855
80102259:	e8 32 e1 ff ff       	call   80100390 <panic>
8010225e:	66 90                	xchg   %ax,%ax

80102260 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102260:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102261:	c7 05 14 40 11 80 00 	movl   $0xfec00000,0x80114014
80102268:	00 c0 fe 
{
8010226b:	89 e5                	mov    %esp,%ebp
8010226d:	56                   	push   %esi
8010226e:	53                   	push   %ebx
  ioapic->reg = reg;
8010226f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102276:	00 00 00 
  return ioapic->data;
80102279:	a1 14 40 11 80       	mov    0x80114014,%eax
8010227e:	8b 58 10             	mov    0x10(%eax),%ebx
  ioapic->reg = reg;
80102281:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return ioapic->data;
80102287:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010228d:	0f b6 15 40 41 11 80 	movzbl 0x80114140,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102294:	c1 eb 10             	shr    $0x10,%ebx
  return ioapic->data;
80102297:	8b 41 10             	mov    0x10(%ecx),%eax
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
8010229a:	0f b6 db             	movzbl %bl,%ebx
  id = ioapicread(REG_ID) >> 24;
8010229d:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
801022a0:	39 c2                	cmp    %eax,%edx
801022a2:	74 16                	je     801022ba <ioapicinit+0x5a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
801022a4:	83 ec 0c             	sub    $0xc,%esp
801022a7:	68 74 78 10 80       	push   $0x80107874
801022ac:	e8 af e3 ff ff       	call   80100660 <cprintf>
801022b1:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
801022b7:	83 c4 10             	add    $0x10,%esp
801022ba:	83 c3 21             	add    $0x21,%ebx
{
801022bd:	ba 10 00 00 00       	mov    $0x10,%edx
801022c2:	b8 20 00 00 00       	mov    $0x20,%eax
801022c7:	89 f6                	mov    %esi,%esi
801022c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ioapic->reg = reg;
801022d0:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
801022d2:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801022d8:	89 c6                	mov    %eax,%esi
801022da:	81 ce 00 00 01 00    	or     $0x10000,%esi
801022e0:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022e3:	89 71 10             	mov    %esi,0x10(%ecx)
801022e6:	8d 72 01             	lea    0x1(%edx),%esi
801022e9:	83 c2 02             	add    $0x2,%edx
  for(i = 0; i <= maxintr; i++){
801022ec:	39 d8                	cmp    %ebx,%eax
  ioapic->reg = reg;
801022ee:	89 31                	mov    %esi,(%ecx)
  ioapic->data = data;
801022f0:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
801022f6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
801022fd:	75 d1                	jne    801022d0 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102302:	5b                   	pop    %ebx
80102303:	5e                   	pop    %esi
80102304:	5d                   	pop    %ebp
80102305:	c3                   	ret    
80102306:	8d 76 00             	lea    0x0(%esi),%esi
80102309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102310 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
80102310:	55                   	push   %ebp
  ioapic->reg = reg;
80102311:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
{
80102317:	89 e5                	mov    %esp,%ebp
80102319:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010231c:	8d 50 20             	lea    0x20(%eax),%edx
8010231f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
80102323:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102325:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010232b:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
8010232e:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102331:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
80102334:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102336:	a1 14 40 11 80       	mov    0x80114014,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010233b:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
8010233e:	89 50 10             	mov    %edx,0x10(%eax)
}
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
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102350:	55                   	push   %ebp
80102351:	89 e5                	mov    %esp,%ebp
80102353:	53                   	push   %ebx
80102354:	83 ec 04             	sub    $0x4,%esp
80102357:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010235a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102360:	75 70                	jne    801023d2 <kfree+0x82>
80102362:	81 fb 88 70 11 80    	cmp    $0x80117088,%ebx
80102368:	72 68                	jb     801023d2 <kfree+0x82>
8010236a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102370:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102375:	77 5b                	ja     801023d2 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102377:	83 ec 04             	sub    $0x4,%esp
8010237a:	68 00 10 00 00       	push   $0x1000
8010237f:	6a 01                	push   $0x1
80102381:	53                   	push   %ebx
80102382:	e8 19 23 00 00       	call   801046a0 <memset>

  if(kmem.use_lock)
80102387:	8b 15 54 40 11 80    	mov    0x80114054,%edx
8010238d:	83 c4 10             	add    $0x10,%esp
80102390:	85 d2                	test   %edx,%edx
80102392:	75 2c                	jne    801023c0 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102394:	a1 58 40 11 80       	mov    0x80114058,%eax
80102399:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010239b:	a1 54 40 11 80       	mov    0x80114054,%eax
  kmem.freelist = r;
801023a0:	89 1d 58 40 11 80    	mov    %ebx,0x80114058
  if(kmem.use_lock)
801023a6:	85 c0                	test   %eax,%eax
801023a8:	75 06                	jne    801023b0 <kfree+0x60>
    release(&kmem.lock);
}
801023aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ad:	c9                   	leave  
801023ae:	c3                   	ret    
801023af:	90                   	nop
    release(&kmem.lock);
801023b0:	c7 45 08 20 40 11 80 	movl   $0x80114020,0x8(%ebp)
}
801023b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ba:	c9                   	leave  
    release(&kmem.lock);
801023bb:	e9 90 22 00 00       	jmp    80104650 <release>
    acquire(&kmem.lock);
801023c0:	83 ec 0c             	sub    $0xc,%esp
801023c3:	68 20 40 11 80       	push   $0x80114020
801023c8:	e8 c3 21 00 00       	call   80104590 <acquire>
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	eb c2                	jmp    80102394 <kfree+0x44>
    panic("kfree");
801023d2:	83 ec 0c             	sub    $0xc,%esp
801023d5:	68 a6 78 10 80       	push   $0x801078a6
801023da:	e8 b1 df ff ff       	call   80100390 <panic>
801023df:	90                   	nop

801023e0 <freerange>:
{
801023e0:	55                   	push   %ebp
801023e1:	89 e5                	mov    %esp,%ebp
801023e3:	56                   	push   %esi
801023e4:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
801023e5:	8b 45 08             	mov    0x8(%ebp),%eax
{
801023e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801023eb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023f7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fd:	39 de                	cmp    %ebx,%esi
801023ff:	72 23                	jb     80102424 <freerange+0x44>
80102401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102408:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010240e:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102411:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102417:	50                   	push   %eax
80102418:	e8 33 ff ff ff       	call   80102350 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010241d:	83 c4 10             	add    $0x10,%esp
80102420:	39 f3                	cmp    %esi,%ebx
80102422:	76 e4                	jbe    80102408 <freerange+0x28>
}
80102424:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102427:	5b                   	pop    %ebx
80102428:	5e                   	pop    %esi
80102429:	5d                   	pop    %ebp
8010242a:	c3                   	ret    
8010242b:	90                   	nop
8010242c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102430 <kinit1>:
{
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx
80102435:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102438:	83 ec 08             	sub    $0x8,%esp
8010243b:	68 ac 78 10 80       	push   $0x801078ac
80102440:	68 20 40 11 80       	push   $0x80114020
80102445:	e8 06 20 00 00       	call   80104450 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
8010244a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010244d:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
80102450:	c7 05 54 40 11 80 00 	movl   $0x0,0x80114054
80102457:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
8010245a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102460:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102466:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010246c:	39 de                	cmp    %ebx,%esi
8010246e:	72 1c                	jb     8010248c <kinit1+0x5c>
    kfree(p);
80102470:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102476:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102479:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010247f:	50                   	push   %eax
80102480:	e8 cb fe ff ff       	call   80102350 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102485:	83 c4 10             	add    $0x10,%esp
80102488:	39 de                	cmp    %ebx,%esi
8010248a:	73 e4                	jae    80102470 <kinit1+0x40>
}
8010248c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010248f:	5b                   	pop    %ebx
80102490:	5e                   	pop    %esi
80102491:	5d                   	pop    %ebp
80102492:	c3                   	ret    
80102493:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024a0 <kinit2>:
{
801024a0:	55                   	push   %ebp
801024a1:	89 e5                	mov    %esp,%ebp
801024a3:	56                   	push   %esi
801024a4:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
801024a5:	8b 45 08             	mov    0x8(%ebp),%eax
{
801024a8:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801024ab:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024b1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024b7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024bd:	39 de                	cmp    %ebx,%esi
801024bf:	72 23                	jb     801024e4 <kinit2+0x44>
801024c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801024c8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024ce:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024d1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801024d7:	50                   	push   %eax
801024d8:	e8 73 fe ff ff       	call   80102350 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024dd:	83 c4 10             	add    $0x10,%esp
801024e0:	39 de                	cmp    %ebx,%esi
801024e2:	73 e4                	jae    801024c8 <kinit2+0x28>
  kmem.use_lock = 1;
801024e4:	c7 05 54 40 11 80 01 	movl   $0x1,0x80114054
801024eb:	00 00 00 
}
801024ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024f1:	5b                   	pop    %ebx
801024f2:	5e                   	pop    %esi
801024f3:	5d                   	pop    %ebp
801024f4:	c3                   	ret    
801024f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102500 <kalloc>:
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
80102500:	a1 54 40 11 80       	mov    0x80114054,%eax
80102505:	85 c0                	test   %eax,%eax
80102507:	75 1f                	jne    80102528 <kalloc+0x28>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102509:	a1 58 40 11 80       	mov    0x80114058,%eax
  if(r)
8010250e:	85 c0                	test   %eax,%eax
80102510:	74 0e                	je     80102520 <kalloc+0x20>
    kmem.freelist = r->next;
80102512:	8b 10                	mov    (%eax),%edx
80102514:	89 15 58 40 11 80    	mov    %edx,0x80114058
8010251a:	c3                   	ret    
8010251b:	90                   	nop
8010251c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(kmem.use_lock)
    release(&kmem.lock);
  return (char*)r;
}
80102520:	f3 c3                	repz ret 
80102522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
80102528:	55                   	push   %ebp
80102529:	89 e5                	mov    %esp,%ebp
8010252b:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
8010252e:	68 20 40 11 80       	push   $0x80114020
80102533:	e8 58 20 00 00       	call   80104590 <acquire>
  r = kmem.freelist;
80102538:	a1 58 40 11 80       	mov    0x80114058,%eax
  if(r)
8010253d:	83 c4 10             	add    $0x10,%esp
80102540:	8b 15 54 40 11 80    	mov    0x80114054,%edx
80102546:	85 c0                	test   %eax,%eax
80102548:	74 08                	je     80102552 <kalloc+0x52>
    kmem.freelist = r->next;
8010254a:	8b 08                	mov    (%eax),%ecx
8010254c:	89 0d 58 40 11 80    	mov    %ecx,0x80114058
  if(kmem.use_lock)
80102552:	85 d2                	test   %edx,%edx
80102554:	74 16                	je     8010256c <kalloc+0x6c>
    release(&kmem.lock);
80102556:	83 ec 0c             	sub    $0xc,%esp
80102559:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010255c:	68 20 40 11 80       	push   $0x80114020
80102561:	e8 ea 20 00 00       	call   80104650 <release>
  return (char*)r;
80102566:	8b 45 f4             	mov    -0xc(%ebp),%eax
    release(&kmem.lock);
80102569:	83 c4 10             	add    $0x10,%esp
}
8010256c:	c9                   	leave  
8010256d:	c3                   	ret    
8010256e:	66 90                	xchg   %ax,%ax

80102570 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102570:	ba 64 00 00 00       	mov    $0x64,%edx
80102575:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102576:	a8 01                	test   $0x1,%al
80102578:	0f 84 c2 00 00 00    	je     80102640 <kbdgetc+0xd0>
8010257e:	ba 60 00 00 00       	mov    $0x60,%edx
80102583:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102584:	0f b6 d0             	movzbl %al,%edx
80102587:	8b 0d b4 b5 10 80    	mov    0x8010b5b4,%ecx

  if(data == 0xE0){
8010258d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102593:	0f 84 7f 00 00 00    	je     80102618 <kbdgetc+0xa8>
{
80102599:	55                   	push   %ebp
8010259a:	89 e5                	mov    %esp,%ebp
8010259c:	53                   	push   %ebx
8010259d:	89 cb                	mov    %ecx,%ebx
8010259f:	83 e3 40             	and    $0x40,%ebx
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801025a2:	84 c0                	test   %al,%al
801025a4:	78 4a                	js     801025f0 <kbdgetc+0x80>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
801025a6:	85 db                	test   %ebx,%ebx
801025a8:	74 09                	je     801025b3 <kbdgetc+0x43>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
801025aa:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
801025ad:	83 e1 bf             	and    $0xffffffbf,%ecx
    data |= 0x80;
801025b0:	0f b6 d0             	movzbl %al,%edx
  }

  shift |= shiftcode[data];
801025b3:	0f b6 82 e0 79 10 80 	movzbl -0x7fef8620(%edx),%eax
801025ba:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
801025bc:	0f b6 82 e0 78 10 80 	movzbl -0x7fef8720(%edx),%eax
801025c3:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801025c5:	89 c8                	mov    %ecx,%eax
  shift ^= togglecode[data];
801025c7:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
  c = charcode[shift & (CTL | SHIFT)][data];
801025cd:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801025d0:	83 e1 08             	and    $0x8,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801025d3:	8b 04 85 c0 78 10 80 	mov    -0x7fef8740(,%eax,4),%eax
801025da:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
801025de:	74 31                	je     80102611 <kbdgetc+0xa1>
    if('a' <= c && c <= 'z')
801025e0:	8d 50 9f             	lea    -0x61(%eax),%edx
801025e3:	83 fa 19             	cmp    $0x19,%edx
801025e6:	77 40                	ja     80102628 <kbdgetc+0xb8>
      c += 'A' - 'a';
801025e8:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025eb:	5b                   	pop    %ebx
801025ec:	5d                   	pop    %ebp
801025ed:	c3                   	ret    
801025ee:	66 90                	xchg   %ax,%ax
    data = (shift & E0ESC ? data : data & 0x7F);
801025f0:	83 e0 7f             	and    $0x7f,%eax
801025f3:	85 db                	test   %ebx,%ebx
801025f5:	0f 44 d0             	cmove  %eax,%edx
    shift &= ~(shiftcode[data] | E0ESC);
801025f8:	0f b6 82 e0 79 10 80 	movzbl -0x7fef8620(%edx),%eax
801025ff:	83 c8 40             	or     $0x40,%eax
80102602:	0f b6 c0             	movzbl %al,%eax
80102605:	f7 d0                	not    %eax
80102607:	21 c1                	and    %eax,%ecx
    return 0;
80102609:	31 c0                	xor    %eax,%eax
    shift &= ~(shiftcode[data] | E0ESC);
8010260b:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
}
80102611:	5b                   	pop    %ebx
80102612:	5d                   	pop    %ebp
80102613:	c3                   	ret    
80102614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    shift |= E0ESC;
80102618:	83 c9 40             	or     $0x40,%ecx
    return 0;
8010261b:	31 c0                	xor    %eax,%eax
    shift |= E0ESC;
8010261d:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
    return 0;
80102623:	c3                   	ret    
80102624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    else if('A' <= c && c <= 'Z')
80102628:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
8010262b:	8d 50 20             	lea    0x20(%eax),%edx
}
8010262e:	5b                   	pop    %ebx
      c += 'a' - 'A';
8010262f:	83 f9 1a             	cmp    $0x1a,%ecx
80102632:	0f 42 c2             	cmovb  %edx,%eax
}
80102635:	5d                   	pop    %ebp
80102636:	c3                   	ret    
80102637:	89 f6                	mov    %esi,%esi
80102639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80102640:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102645:	c3                   	ret    
80102646:	8d 76 00             	lea    0x0(%esi),%esi
80102649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102650 <kbdintr>:

void
kbdintr(void)
{
80102650:	55                   	push   %ebp
80102651:	89 e5                	mov    %esp,%ebp
80102653:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102656:	68 70 25 10 80       	push   $0x80102570
8010265b:	e8 f0 e1 ff ff       	call   80100850 <consoleintr>
}
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
}

void
lapicinit(void)
{
  if(!lapic)
80102670:	a1 5c 40 11 80       	mov    0x8011405c,%eax
{
80102675:	55                   	push   %ebp
80102676:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102678:	85 c0                	test   %eax,%eax
8010267a:	0f 84 c8 00 00 00    	je     80102748 <lapicinit+0xd8>
  lapic[index] = value;
80102680:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102687:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010268d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102694:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102697:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010269a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026a1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026a7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026ae:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801026b1:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026b4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026bb:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026be:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026c1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026c8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026cb:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801026ce:	8b 50 30             	mov    0x30(%eax),%edx
801026d1:	c1 ea 10             	shr    $0x10,%edx
801026d4:	80 fa 03             	cmp    $0x3,%dl
801026d7:	77 77                	ja     80102750 <lapicinit+0xe0>
  lapic[index] = value;
801026d9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026e0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026e3:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026e6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ed:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026f0:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026f3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026fa:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026fd:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102700:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102707:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010270a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010270d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102714:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102717:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010271a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102721:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102724:	8b 50 20             	mov    0x20(%eax),%edx
80102727:	89 f6                	mov    %esi,%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102730:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102736:	80 e6 10             	and    $0x10,%dh
80102739:	75 f5                	jne    80102730 <lapicinit+0xc0>
  lapic[index] = value;
8010273b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102742:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102745:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102748:	5d                   	pop    %ebp
80102749:	c3                   	ret    
8010274a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic[index] = value;
80102750:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102757:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010275a:	8b 50 20             	mov    0x20(%eax),%edx
8010275d:	e9 77 ff ff ff       	jmp    801026d9 <lapicinit+0x69>
80102762:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102770 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
80102770:	8b 15 5c 40 11 80    	mov    0x8011405c,%edx
{
80102776:	55                   	push   %ebp
80102777:	31 c0                	xor    %eax,%eax
80102779:	89 e5                	mov    %esp,%ebp
  if (!lapic)
8010277b:	85 d2                	test   %edx,%edx
8010277d:	74 06                	je     80102785 <lapicid+0x15>
    return 0;
  return lapic[ID] >> 24;
8010277f:	8b 42 20             	mov    0x20(%edx),%eax
80102782:	c1 e8 18             	shr    $0x18,%eax
}
80102785:	5d                   	pop    %ebp
80102786:	c3                   	ret    
80102787:	89 f6                	mov    %esi,%esi
80102789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102790 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102790:	a1 5c 40 11 80       	mov    0x8011405c,%eax
{
80102795:	55                   	push   %ebp
80102796:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102798:	85 c0                	test   %eax,%eax
8010279a:	74 0d                	je     801027a9 <lapiceoi+0x19>
  lapic[index] = value;
8010279c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027a3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027a6:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
801027a9:	5d                   	pop    %ebp
801027aa:	c3                   	ret    
801027ab:	90                   	nop
801027ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027b0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801027b0:	55                   	push   %ebp
801027b1:	89 e5                	mov    %esp,%ebp
}
801027b3:	5d                   	pop    %ebp
801027b4:	c3                   	ret    
801027b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027c0 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
801027c0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801027e0:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
801027e2:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
801027e5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801027eb:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801027ed:	c1 e9 0c             	shr    $0xc,%ecx
  wrv[1] = addr >> 4;
801027f0:	c1 e8 04             	shr    $0x4,%eax
  lapicw(ICRHI, apicid<<24);
801027f3:	89 da                	mov    %ebx,%edx
    lapicw(ICRLO, STARTUP | (addr>>12));
801027f5:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
801027f8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
801027fe:	a1 5c 40 11 80       	mov    0x8011405c,%eax
80102803:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102809:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
8010280c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102813:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102816:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102819:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102820:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102823:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102826:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010282c:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
8010282f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102835:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102838:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010283e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102841:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102847:	8b 40 20             	mov    0x20(%eax),%eax
    microdelay(200);
  }
}
8010284a:	5b                   	pop    %ebx
8010284b:	5d                   	pop    %ebp
8010284c:	c3                   	ret    
8010284d:	8d 76 00             	lea    0x0(%esi),%esi

80102850 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102850:	55                   	push   %ebp
80102851:	b8 0b 00 00 00       	mov    $0xb,%eax
80102856:	ba 70 00 00 00       	mov    $0x70,%edx
8010285b:	89 e5                	mov    %esp,%ebp
8010285d:	57                   	push   %edi
8010285e:	56                   	push   %esi
8010285f:	53                   	push   %ebx
80102860:	83 ec 4c             	sub    $0x4c,%esp
80102863:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102864:	ba 71 00 00 00       	mov    $0x71,%edx
80102869:	ec                   	in     (%dx),%al
8010286a:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010286d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102872:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102875:	8d 76 00             	lea    0x0(%esi),%esi
80102878:	31 c0                	xor    %eax,%eax
8010287a:	89 da                	mov    %ebx,%edx
8010287c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102882:	89 ca                	mov    %ecx,%edx
80102884:	ec                   	in     (%dx),%al
80102885:	88 45 b7             	mov    %al,-0x49(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102888:	89 da                	mov    %ebx,%edx
8010288a:	b8 02 00 00 00       	mov    $0x2,%eax
8010288f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102890:	89 ca                	mov    %ecx,%edx
80102892:	ec                   	in     (%dx),%al
80102893:	88 45 b6             	mov    %al,-0x4a(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102896:	89 da                	mov    %ebx,%edx
80102898:	b8 04 00 00 00       	mov    $0x4,%eax
8010289d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010289e:	89 ca                	mov    %ecx,%edx
801028a0:	ec                   	in     (%dx),%al
801028a1:	88 45 b5             	mov    %al,-0x4b(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028a4:	89 da                	mov    %ebx,%edx
801028a6:	b8 07 00 00 00       	mov    $0x7,%eax
801028ab:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ac:	89 ca                	mov    %ecx,%edx
801028ae:	ec                   	in     (%dx),%al
801028af:	88 45 b4             	mov    %al,-0x4c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028b2:	89 da                	mov    %ebx,%edx
801028b4:	b8 08 00 00 00       	mov    $0x8,%eax
801028b9:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ba:	89 ca                	mov    %ecx,%edx
801028bc:	ec                   	in     (%dx),%al
801028bd:	89 c7                	mov    %eax,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028bf:	89 da                	mov    %ebx,%edx
801028c1:	b8 09 00 00 00       	mov    $0x9,%eax
801028c6:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028c7:	89 ca                	mov    %ecx,%edx
801028c9:	ec                   	in     (%dx),%al
801028ca:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028cc:	89 da                	mov    %ebx,%edx
801028ce:	b8 0a 00 00 00       	mov    $0xa,%eax
801028d3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028d4:	89 ca                	mov    %ecx,%edx
801028d6:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028d7:	84 c0                	test   %al,%al
801028d9:	78 9d                	js     80102878 <cmostime+0x28>
  return inb(CMOS_RETURN);
801028db:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801028df:	89 fa                	mov    %edi,%edx
801028e1:	0f b6 fa             	movzbl %dl,%edi
801028e4:	89 f2                	mov    %esi,%edx
801028e6:	0f b6 f2             	movzbl %dl,%esi
801028e9:	89 7d c8             	mov    %edi,-0x38(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010290c:	89 ca                	mov    %ecx,%edx
8010290e:	ec                   	in     (%dx),%al
8010290f:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102912:	89 da                	mov    %ebx,%edx
80102914:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102917:	b8 02 00 00 00       	mov    $0x2,%eax
8010291c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010291d:	89 ca                	mov    %ecx,%edx
8010291f:	ec                   	in     (%dx),%al
80102920:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102923:	89 da                	mov    %ebx,%edx
80102925:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102928:	b8 04 00 00 00       	mov    $0x4,%eax
8010292d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010292e:	89 ca                	mov    %ecx,%edx
80102930:	ec                   	in     (%dx),%al
80102931:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102934:	89 da                	mov    %ebx,%edx
80102936:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102939:	b8 07 00 00 00       	mov    $0x7,%eax
8010293e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010293f:	89 ca                	mov    %ecx,%edx
80102941:	ec                   	in     (%dx),%al
80102942:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102945:	89 da                	mov    %ebx,%edx
80102947:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010294a:	b8 08 00 00 00       	mov    $0x8,%eax
8010294f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102950:	89 ca                	mov    %ecx,%edx
80102952:	ec                   	in     (%dx),%al
80102953:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102956:	89 da                	mov    %ebx,%edx
80102958:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010295b:	b8 09 00 00 00       	mov    $0x9,%eax
80102960:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102961:	89 ca                	mov    %ecx,%edx
80102963:	ec                   	in     (%dx),%al
80102964:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102967:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
8010296a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010296d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102970:	6a 18                	push   $0x18
80102972:	50                   	push   %eax
80102973:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102976:	50                   	push   %eax
80102977:	e8 74 1d 00 00       	call   801046f0 <memcmp>
8010297c:	83 c4 10             	add    $0x10,%esp
8010297f:	85 c0                	test   %eax,%eax
80102981:	0f 85 f1 fe ff ff    	jne    80102878 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102987:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
8010298b:	75 78                	jne    80102a05 <cmostime+0x1b5>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010298d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102990:	89 c2                	mov    %eax,%edx
80102992:	83 e0 0f             	and    $0xf,%eax
80102995:	c1 ea 04             	shr    $0x4,%edx
80102998:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010299b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010299e:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
801029a1:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029a4:	89 c2                	mov    %eax,%edx
801029a6:	83 e0 0f             	and    $0xf,%eax
801029a9:	c1 ea 04             	shr    $0x4,%edx
801029ac:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029af:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029b2:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801029b5:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029b8:	89 c2                	mov    %eax,%edx
801029ba:	83 e0 0f             	and    $0xf,%eax
801029bd:	c1 ea 04             	shr    $0x4,%edx
801029c0:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029c3:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029c6:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
801029c9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029cc:	89 c2                	mov    %eax,%edx
801029ce:	83 e0 0f             	and    $0xf,%eax
801029d1:	c1 ea 04             	shr    $0x4,%edx
801029d4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029d7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029da:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
801029dd:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029e0:	89 c2                	mov    %eax,%edx
801029e2:	83 e0 0f             	and    $0xf,%eax
801029e5:	c1 ea 04             	shr    $0x4,%edx
801029e8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029eb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029ee:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
801029f1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f4:	89 c2                	mov    %eax,%edx
801029f6:	83 e0 0f             	and    $0xf,%eax
801029f9:	c1 ea 04             	shr    $0x4,%edx
801029fc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029ff:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a02:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
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
  r->year += 2000;
80102a2b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102a32:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a35:	5b                   	pop    %ebx
80102a36:	5e                   	pop    %esi
80102a37:	5f                   	pop    %edi
80102a38:	5d                   	pop    %ebp
80102a39:	c3                   	ret    
80102a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102a40 <unixtime>:

// This is not the "real" UNIX time as it makes many
// simplifying assumptions -- no leap years, months
// that are all the same length (!)
unsigned long unixtime(void) {
80102a40:	55                   	push   %ebp
80102a41:	89 e5                	mov    %esp,%ebp
80102a43:	83 ec 34             	sub    $0x34,%esp
  struct rtcdate t;
  cmostime(&t);
80102a46:	8d 45 e0             	lea    -0x20(%ebp),%eax
80102a49:	50                   	push   %eax
80102a4a:	e8 01 fe ff ff       	call   80102850 <cmostime>
  return ((t.year - 1970) * 365 * 24 * 60 * 60) +
80102a4f:	69 55 f4 80 33 e1 01 	imul   $0x1e13380,-0xc(%ebp),%edx
         (t.month * 30 * 24 * 60 * 60) +
         (t.day * 24 * 60 * 60) +
         (t.hour * 60 * 60) +
         (t.minute * 60) +
80102a56:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102a59:	8d 84 02 00 b1 01 89 	lea    -0x76fe4f00(%edx,%eax,1),%eax
         (t.month * 30 * 24 * 60 * 60) +
80102a60:	69 55 f0 00 8d 27 00 	imul   $0x278d00,-0x10(%ebp),%edx
         (t.minute * 60) +
80102a67:	01 d0                	add    %edx,%eax
         (t.day * 24 * 60 * 60) +
80102a69:	69 55 ec 80 51 01 00 	imul   $0x15180,-0x14(%ebp),%edx
         (t.minute * 60) +
80102a70:	01 d0                	add    %edx,%eax
         (t.hour * 60 * 60) +
80102a72:	69 55 e8 10 0e 00 00 	imul   $0xe10,-0x18(%ebp),%edx
         (t.minute * 60) +
80102a79:	01 d0                	add    %edx,%eax
80102a7b:	6b 55 e4 3c          	imul   $0x3c,-0x1c(%ebp),%edx
         (t.second);
80102a7f:	c9                   	leave  
         (t.minute * 60) +
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
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a90:	8b 0d a8 40 11 80    	mov    0x801140a8,%ecx
80102a96:	85 c9                	test   %ecx,%ecx
80102a98:	0f 8e 8a 00 00 00    	jle    80102b28 <install_trans+0x98>
{
80102a9e:	55                   	push   %ebp
80102a9f:	89 e5                	mov    %esp,%ebp
80102aa1:	57                   	push   %edi
80102aa2:	56                   	push   %esi
80102aa3:	53                   	push   %ebx
  for (tail = 0; tail < log.lh.n; tail++) {
80102aa4:	31 db                	xor    %ebx,%ebx
{
80102aa6:	83 ec 0c             	sub    $0xc,%esp
80102aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102ab0:	a1 94 40 11 80       	mov    0x80114094,%eax
80102ab5:	83 ec 08             	sub    $0x8,%esp
80102ab8:	01 d8                	add    %ebx,%eax
80102aba:	83 c0 01             	add    $0x1,%eax
80102abd:	50                   	push   %eax
80102abe:	ff 35 a4 40 11 80    	pushl  0x801140a4
80102ac4:	e8 07 d6 ff ff       	call   801000d0 <bread>
80102ac9:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102acb:	58                   	pop    %eax
80102acc:	5a                   	pop    %edx
80102acd:	ff 34 9d ac 40 11 80 	pushl  -0x7feebf54(,%ebx,4)
80102ad4:	ff 35 a4 40 11 80    	pushl  0x801140a4
  for (tail = 0; tail < log.lh.n; tail++) {
80102ada:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102add:	e8 ee d5 ff ff       	call   801000d0 <bread>
80102ae2:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102ae4:	8d 47 5c             	lea    0x5c(%edi),%eax
80102ae7:	83 c4 0c             	add    $0xc,%esp
80102aea:	68 00 02 00 00       	push   $0x200
80102aef:	50                   	push   %eax
80102af0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102af3:	50                   	push   %eax
80102af4:	e8 57 1c 00 00       	call   80104750 <memmove>
    bwrite(dbuf);  // write dst to disk
80102af9:	89 34 24             	mov    %esi,(%esp)
80102afc:	e8 9f d6 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102b01:	89 3c 24             	mov    %edi,(%esp)
80102b04:	e8 d7 d6 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102b09:	89 34 24             	mov    %esi,(%esp)
80102b0c:	e8 cf d6 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102b11:	83 c4 10             	add    $0x10,%esp
80102b14:	39 1d a8 40 11 80    	cmp    %ebx,0x801140a8
80102b1a:	7f 94                	jg     80102ab0 <install_trans+0x20>
  }
}
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
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102b30:	55                   	push   %ebp
80102b31:	89 e5                	mov    %esp,%ebp
80102b33:	56                   	push   %esi
80102b34:	53                   	push   %ebx
  struct buf *buf = bread(log.dev, log.start);
80102b35:	83 ec 08             	sub    $0x8,%esp
80102b38:	ff 35 94 40 11 80    	pushl  0x80114094
80102b3e:	ff 35 a4 40 11 80    	pushl  0x801140a4
80102b44:	e8 87 d5 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102b49:	8b 1d a8 40 11 80    	mov    0x801140a8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102b4f:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102b52:	89 c6                	mov    %eax,%esi
  for (i = 0; i < log.lh.n; i++) {
80102b54:	85 db                	test   %ebx,%ebx
  hb->n = log.lh.n;
80102b56:	89 58 5c             	mov    %ebx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102b59:	7e 16                	jle    80102b71 <write_head+0x41>
80102b5b:	c1 e3 02             	shl    $0x2,%ebx
80102b5e:	31 d2                	xor    %edx,%edx
    hb->block[i] = log.lh.block[i];
80102b60:	8b 8a ac 40 11 80    	mov    -0x7feebf54(%edx),%ecx
80102b66:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102b6a:	83 c2 04             	add    $0x4,%edx
  for (i = 0; i < log.lh.n; i++) {
80102b6d:	39 da                	cmp    %ebx,%edx
80102b6f:	75 ef                	jne    80102b60 <write_head+0x30>
  }
  bwrite(buf);
80102b71:	83 ec 0c             	sub    $0xc,%esp
80102b74:	56                   	push   %esi
80102b75:	e8 26 d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102b7a:	89 34 24             	mov    %esi,(%esp)
80102b7d:	e8 5e d6 ff ff       	call   801001e0 <brelse>
}
80102b82:	83 c4 10             	add    $0x10,%esp
80102b85:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b88:	5b                   	pop    %ebx
80102b89:	5e                   	pop    %esi
80102b8a:	5d                   	pop    %ebp
80102b8b:	c3                   	ret    
80102b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102b90 <initlog>:
{
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	53                   	push   %ebx
80102b94:	83 ec 2c             	sub    $0x2c,%esp
80102b97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102b9a:	68 e0 7a 10 80       	push   $0x80107ae0
80102b9f:	68 60 40 11 80       	push   $0x80114060
80102ba4:	e8 a7 18 00 00       	call   80104450 <initlock>
  readsb(dev, &sb);
80102ba9:	58                   	pop    %eax
80102baa:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102bad:	5a                   	pop    %edx
80102bae:	50                   	push   %eax
80102baf:	53                   	push   %ebx
80102bb0:	e8 cb e8 ff ff       	call   80101480 <readsb>
  log.size = sb.nlog;
80102bb5:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102bb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102bbb:	59                   	pop    %ecx
  log.dev = dev;
80102bbc:	89 1d a4 40 11 80    	mov    %ebx,0x801140a4
  log.size = sb.nlog;
80102bc2:	89 15 98 40 11 80    	mov    %edx,0x80114098
  log.start = sb.logstart;
80102bc8:	a3 94 40 11 80       	mov    %eax,0x80114094
  struct buf *buf = bread(log.dev, log.start);
80102bcd:	5a                   	pop    %edx
80102bce:	50                   	push   %eax
80102bcf:	53                   	push   %ebx
80102bd0:	e8 fb d4 ff ff       	call   801000d0 <bread>
  log.lh.n = lh->n;
80102bd5:	8b 58 5c             	mov    0x5c(%eax),%ebx
  for (i = 0; i < log.lh.n; i++) {
80102bd8:	83 c4 10             	add    $0x10,%esp
80102bdb:	85 db                	test   %ebx,%ebx
  log.lh.n = lh->n;
80102bdd:	89 1d a8 40 11 80    	mov    %ebx,0x801140a8
  for (i = 0; i < log.lh.n; i++) {
80102be3:	7e 1c                	jle    80102c01 <initlog+0x71>
80102be5:	c1 e3 02             	shl    $0x2,%ebx
80102be8:	31 d2                	xor    %edx,%edx
80102bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    log.lh.block[i] = lh->block[i];
80102bf0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102bf4:	83 c2 04             	add    $0x4,%edx
80102bf7:	89 8a a8 40 11 80    	mov    %ecx,-0x7feebf58(%edx)
  for (i = 0; i < log.lh.n; i++) {
80102bfd:	39 d3                	cmp    %edx,%ebx
80102bff:	75 ef                	jne    80102bf0 <initlog+0x60>
  brelse(buf);
80102c01:	83 ec 0c             	sub    $0xc,%esp
80102c04:	50                   	push   %eax
80102c05:	e8 d6 d5 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102c0a:	e8 81 fe ff ff       	call   80102a90 <install_trans>
  log.lh.n = 0;
80102c0f:	c7 05 a8 40 11 80 00 	movl   $0x0,0x801140a8
80102c16:	00 00 00 
  write_head(); // clear the log
80102c19:	e8 12 ff ff ff       	call   80102b30 <write_head>
}
80102c1e:	83 c4 10             	add    $0x10,%esp
80102c21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c24:	c9                   	leave  
80102c25:	c3                   	ret    
80102c26:	8d 76 00             	lea    0x0(%esi),%esi
80102c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c30 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102c30:	55                   	push   %ebp
80102c31:	89 e5                	mov    %esp,%ebp
80102c33:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102c36:	68 60 40 11 80       	push   $0x80114060
80102c3b:	e8 50 19 00 00       	call   80104590 <acquire>
80102c40:	83 c4 10             	add    $0x10,%esp
80102c43:	eb 18                	jmp    80102c5d <begin_op+0x2d>
80102c45:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102c48:	83 ec 08             	sub    $0x8,%esp
80102c4b:	68 60 40 11 80       	push   $0x80114060
80102c50:	68 60 40 11 80       	push   $0x80114060
80102c55:	e8 66 12 00 00       	call   80103ec0 <sleep>
80102c5a:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102c5d:	a1 a0 40 11 80       	mov    0x801140a0,%eax
80102c62:	85 c0                	test   %eax,%eax
80102c64:	75 e2                	jne    80102c48 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102c66:	a1 9c 40 11 80       	mov    0x8011409c,%eax
80102c6b:	8b 15 a8 40 11 80    	mov    0x801140a8,%edx
80102c71:	83 c0 01             	add    $0x1,%eax
80102c74:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102c77:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102c7a:	83 fa 1e             	cmp    $0x1e,%edx
80102c7d:	7f c9                	jg     80102c48 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102c7f:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102c82:	a3 9c 40 11 80       	mov    %eax,0x8011409c
      release(&log.lock);
80102c87:	68 60 40 11 80       	push   $0x80114060
80102c8c:	e8 bf 19 00 00       	call   80104650 <release>
      break;
    }
  }
}
80102c91:	83 c4 10             	add    $0x10,%esp
80102c94:	c9                   	leave  
80102c95:	c3                   	ret    
80102c96:	8d 76 00             	lea    0x0(%esi),%esi
80102c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ca0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102ca0:	55                   	push   %ebp
80102ca1:	89 e5                	mov    %esp,%ebp
80102ca3:	57                   	push   %edi
80102ca4:	56                   	push   %esi
80102ca5:	53                   	push   %ebx
80102ca6:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102ca9:	68 60 40 11 80       	push   $0x80114060
80102cae:	e8 dd 18 00 00       	call   80104590 <acquire>
  log.outstanding -= 1;
80102cb3:	a1 9c 40 11 80       	mov    0x8011409c,%eax
  if(log.committing)
80102cb8:	8b 35 a0 40 11 80    	mov    0x801140a0,%esi
80102cbe:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102cc1:	8d 58 ff             	lea    -0x1(%eax),%ebx
  if(log.committing)
80102cc4:	85 f6                	test   %esi,%esi
  log.outstanding -= 1;
80102cc6:	89 1d 9c 40 11 80    	mov    %ebx,0x8011409c
  if(log.committing)
80102ccc:	0f 85 1a 01 00 00    	jne    80102dec <end_op+0x14c>
    panic("log.committing");
  if(log.outstanding == 0){
80102cd2:	85 db                	test   %ebx,%ebx
80102cd4:	0f 85 ee 00 00 00    	jne    80102dc8 <end_op+0x128>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102cda:	83 ec 0c             	sub    $0xc,%esp
    log.committing = 1;
80102cdd:	c7 05 a0 40 11 80 01 	movl   $0x1,0x801140a0
80102ce4:	00 00 00 
  release(&log.lock);
80102ce7:	68 60 40 11 80       	push   $0x80114060
80102cec:	e8 5f 19 00 00       	call   80104650 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102cf1:	8b 0d a8 40 11 80    	mov    0x801140a8,%ecx
80102cf7:	83 c4 10             	add    $0x10,%esp
80102cfa:	85 c9                	test   %ecx,%ecx
80102cfc:	0f 8e 85 00 00 00    	jle    80102d87 <end_op+0xe7>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102d02:	a1 94 40 11 80       	mov    0x80114094,%eax
80102d07:	83 ec 08             	sub    $0x8,%esp
80102d0a:	01 d8                	add    %ebx,%eax
80102d0c:	83 c0 01             	add    $0x1,%eax
80102d0f:	50                   	push   %eax
80102d10:	ff 35 a4 40 11 80    	pushl  0x801140a4
80102d16:	e8 b5 d3 ff ff       	call   801000d0 <bread>
80102d1b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102d1d:	58                   	pop    %eax
80102d1e:	5a                   	pop    %edx
80102d1f:	ff 34 9d ac 40 11 80 	pushl  -0x7feebf54(,%ebx,4)
80102d26:	ff 35 a4 40 11 80    	pushl  0x801140a4
  for (tail = 0; tail < log.lh.n; tail++) {
80102d2c:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102d2f:	e8 9c d3 ff ff       	call   801000d0 <bread>
80102d34:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102d36:	8d 40 5c             	lea    0x5c(%eax),%eax
80102d39:	83 c4 0c             	add    $0xc,%esp
80102d3c:	68 00 02 00 00       	push   $0x200
80102d41:	50                   	push   %eax
80102d42:	8d 46 5c             	lea    0x5c(%esi),%eax
80102d45:	50                   	push   %eax
80102d46:	e8 05 1a 00 00       	call   80104750 <memmove>
    bwrite(to);  // write the log
80102d4b:	89 34 24             	mov    %esi,(%esp)
80102d4e:	e8 4d d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102d53:	89 3c 24             	mov    %edi,(%esp)
80102d56:	e8 85 d4 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102d5b:	89 34 24             	mov    %esi,(%esp)
80102d5e:	e8 7d d4 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102d63:	83 c4 10             	add    $0x10,%esp
80102d66:	3b 1d a8 40 11 80    	cmp    0x801140a8,%ebx
80102d6c:	7c 94                	jl     80102d02 <end_op+0x62>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102d6e:	e8 bd fd ff ff       	call   80102b30 <write_head>
    install_trans(); // Now install writes to home locations
80102d73:	e8 18 fd ff ff       	call   80102a90 <install_trans>
    log.lh.n = 0;
80102d78:	c7 05 a8 40 11 80 00 	movl   $0x0,0x801140a8
80102d7f:	00 00 00 
    write_head();    // Erase the transaction from the log
80102d82:	e8 a9 fd ff ff       	call   80102b30 <write_head>
    acquire(&log.lock);
80102d87:	83 ec 0c             	sub    $0xc,%esp
80102d8a:	68 60 40 11 80       	push   $0x80114060
80102d8f:	e8 fc 17 00 00       	call   80104590 <acquire>
    wakeup(&log);
80102d94:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
    log.committing = 0;
80102d9b:	c7 05 a0 40 11 80 00 	movl   $0x0,0x801140a0
80102da2:	00 00 00 
    wakeup(&log);
80102da5:	e8 d6 12 00 00       	call   80104080 <wakeup>
    release(&log.lock);
80102daa:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
80102db1:	e8 9a 18 00 00       	call   80104650 <release>
80102db6:	83 c4 10             	add    $0x10,%esp
}
80102db9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dbc:	5b                   	pop    %ebx
80102dbd:	5e                   	pop    %esi
80102dbe:	5f                   	pop    %edi
80102dbf:	5d                   	pop    %ebp
80102dc0:	c3                   	ret    
80102dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&log);
80102dc8:	83 ec 0c             	sub    $0xc,%esp
80102dcb:	68 60 40 11 80       	push   $0x80114060
80102dd0:	e8 ab 12 00 00       	call   80104080 <wakeup>
  release(&log.lock);
80102dd5:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
80102ddc:	e8 6f 18 00 00       	call   80104650 <release>
80102de1:	83 c4 10             	add    $0x10,%esp
}
80102de4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102de7:	5b                   	pop    %ebx
80102de8:	5e                   	pop    %esi
80102de9:	5f                   	pop    %edi
80102dea:	5d                   	pop    %ebp
80102deb:	c3                   	ret    
    panic("log.committing");
80102dec:	83 ec 0c             	sub    $0xc,%esp
80102def:	68 e4 7a 10 80       	push   $0x80107ae4
80102df4:	e8 97 d5 ff ff       	call   80100390 <panic>
80102df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e00 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102e00:	55                   	push   %ebp
80102e01:	89 e5                	mov    %esp,%ebp
80102e03:	53                   	push   %ebx
80102e04:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102e07:	8b 15 a8 40 11 80    	mov    0x801140a8,%edx
{
80102e0d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102e10:	83 fa 1d             	cmp    $0x1d,%edx
80102e13:	0f 8f 9d 00 00 00    	jg     80102eb6 <log_write+0xb6>
80102e19:	a1 98 40 11 80       	mov    0x80114098,%eax
80102e1e:	83 e8 01             	sub    $0x1,%eax
80102e21:	39 c2                	cmp    %eax,%edx
80102e23:	0f 8d 8d 00 00 00    	jge    80102eb6 <log_write+0xb6>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102e29:	a1 9c 40 11 80       	mov    0x8011409c,%eax
80102e2e:	85 c0                	test   %eax,%eax
80102e30:	0f 8e 8d 00 00 00    	jle    80102ec3 <log_write+0xc3>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	68 60 40 11 80       	push   $0x80114060
80102e3e:	e8 4d 17 00 00       	call   80104590 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102e43:	8b 0d a8 40 11 80    	mov    0x801140a8,%ecx
80102e49:	83 c4 10             	add    $0x10,%esp
80102e4c:	83 f9 00             	cmp    $0x0,%ecx
80102e4f:	7e 57                	jle    80102ea8 <log_write+0xa8>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e51:	8b 53 08             	mov    0x8(%ebx),%edx
  for (i = 0; i < log.lh.n; i++) {
80102e54:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e56:	3b 15 ac 40 11 80    	cmp    0x801140ac,%edx
80102e5c:	75 0b                	jne    80102e69 <log_write+0x69>
80102e5e:	eb 38                	jmp    80102e98 <log_write+0x98>
80102e60:	39 14 85 ac 40 11 80 	cmp    %edx,-0x7feebf54(,%eax,4)
80102e67:	74 2f                	je     80102e98 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80102e69:	83 c0 01             	add    $0x1,%eax
80102e6c:	39 c1                	cmp    %eax,%ecx
80102e6e:	75 f0                	jne    80102e60 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80102e70:	89 14 85 ac 40 11 80 	mov    %edx,-0x7feebf54(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
80102e77:	83 c0 01             	add    $0x1,%eax
80102e7a:	a3 a8 40 11 80       	mov    %eax,0x801140a8
  b->flags |= B_DIRTY; // prevent eviction
80102e7f:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102e82:	c7 45 08 60 40 11 80 	movl   $0x80114060,0x8(%ebp)
}
80102e89:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e8c:	c9                   	leave  
  release(&log.lock);
80102e8d:	e9 be 17 00 00       	jmp    80104650 <release>
80102e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80102e98:	89 14 85 ac 40 11 80 	mov    %edx,-0x7feebf54(,%eax,4)
80102e9f:	eb de                	jmp    80102e7f <log_write+0x7f>
80102ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ea8:	8b 43 08             	mov    0x8(%ebx),%eax
80102eab:	a3 ac 40 11 80       	mov    %eax,0x801140ac
  if (i == log.lh.n)
80102eb0:	75 cd                	jne    80102e7f <log_write+0x7f>
80102eb2:	31 c0                	xor    %eax,%eax
80102eb4:	eb c1                	jmp    80102e77 <log_write+0x77>
    panic("too big a transaction");
80102eb6:	83 ec 0c             	sub    $0xc,%esp
80102eb9:	68 f3 7a 10 80       	push   $0x80107af3
80102ebe:	e8 cd d4 ff ff       	call   80100390 <panic>
    panic("log_write outside of trans");
80102ec3:	83 ec 0c             	sub    $0xc,%esp
80102ec6:	68 09 7b 10 80       	push   $0x80107b09
80102ecb:	e8 c0 d4 ff ff       	call   80100390 <panic>

80102ed0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102ed0:	55                   	push   %ebp
80102ed1:	89 e5                	mov    %esp,%ebp
80102ed3:	53                   	push   %ebx
80102ed4:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102ed7:	e8 a4 09 00 00       	call   80103880 <cpuid>
80102edc:	89 c3                	mov    %eax,%ebx
80102ede:	e8 9d 09 00 00       	call   80103880 <cpuid>
80102ee3:	83 ec 04             	sub    $0x4,%esp
80102ee6:	53                   	push   %ebx
80102ee7:	50                   	push   %eax
80102ee8:	68 24 7b 10 80       	push   $0x80107b24
80102eed:	e8 6e d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102ef2:	e8 d9 2b 00 00       	call   80105ad0 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102ef7:	e8 04 09 00 00       	call   80103800 <mycpu>
80102efc:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102efe:	b8 01 00 00 00       	mov    $0x1,%eax
80102f03:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102f0a:	e8 91 0c 00 00       	call   80103ba0 <scheduler>
80102f0f:	90                   	nop

80102f10 <mpenter>:
{
80102f10:	55                   	push   %ebp
80102f11:	89 e5                	mov    %esp,%ebp
80102f13:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102f16:	e8 a5 3c 00 00       	call   80106bc0 <switchkvm>
  seginit();
80102f1b:	e8 10 3c 00 00       	call   80106b30 <seginit>
  lapicinit();
80102f20:	e8 4b f7 ff ff       	call   80102670 <lapicinit>
  mpmain();
80102f25:	e8 a6 ff ff ff       	call   80102ed0 <mpmain>
80102f2a:	66 90                	xchg   %ax,%ax
80102f2c:	66 90                	xchg   %ax,%ax
80102f2e:	66 90                	xchg   %ax,%ax

80102f30 <main>:
{
80102f30:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102f34:	83 e4 f0             	and    $0xfffffff0,%esp
80102f37:	ff 71 fc             	pushl  -0x4(%ecx)
80102f3a:	55                   	push   %ebp
80102f3b:	89 e5                	mov    %esp,%ebp
80102f3d:	53                   	push   %ebx
80102f3e:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102f3f:	83 ec 08             	sub    $0x8,%esp
80102f42:	68 00 00 40 80       	push   $0x80400000
80102f47:	68 88 70 11 80       	push   $0x80117088
80102f4c:	e8 df f4 ff ff       	call   80102430 <kinit1>
  kvmalloc();      // kernel page table
80102f51:	e8 3a 41 00 00       	call   80107090 <kvmalloc>
  mpinit();        // detect other processors
80102f56:	e8 75 01 00 00       	call   801030d0 <mpinit>
  lapicinit();     // interrupt controller
80102f5b:	e8 10 f7 ff ff       	call   80102670 <lapicinit>
  seginit();       // segment descriptors
80102f60:	e8 cb 3b 00 00       	call   80106b30 <seginit>
  picinit();       // disable pic
80102f65:	e8 46 03 00 00       	call   801032b0 <picinit>
  ioapicinit();    // another interrupt controller
80102f6a:	e8 f1 f2 ff ff       	call   80102260 <ioapicinit>
  consoleinit();   // console hardware
80102f6f:	e8 8c da ff ff       	call   80100a00 <consoleinit>
  uartinit();      // serial port
80102f74:	e8 87 2e 00 00       	call   80105e00 <uartinit>
  pinit();         // process table
80102f79:	e8 52 08 00 00       	call   801037d0 <pinit>
  tvinit();        // trap vectors
80102f7e:	e8 cd 2a 00 00       	call   80105a50 <tvinit>
  binit();         // buffer cache
80102f83:	e8 b8 d0 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102f88:	e8 13 de ff ff       	call   80100da0 <fileinit>
  ideinit();       // disk 
80102f8d:	e8 ae f0 ff ff       	call   80102040 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f92:	83 c4 0c             	add    $0xc,%esp
80102f95:	68 8a 00 00 00       	push   $0x8a
80102f9a:	68 90 b4 10 80       	push   $0x8010b490
80102f9f:	68 00 70 00 80       	push   $0x80007000
80102fa4:	e8 a7 17 00 00       	call   80104750 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102fa9:	69 05 e0 46 11 80 b0 	imul   $0xb0,0x801146e0,%eax
80102fb0:	00 00 00 
80102fb3:	83 c4 10             	add    $0x10,%esp
80102fb6:	05 60 41 11 80       	add    $0x80114160,%eax
80102fbb:	3d 60 41 11 80       	cmp    $0x80114160,%eax
80102fc0:	76 71                	jbe    80103033 <main+0x103>
80102fc2:	bb 60 41 11 80       	mov    $0x80114160,%ebx
80102fc7:	89 f6                	mov    %esi,%esi
80102fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == mycpu())  // We've started already.
80102fd0:	e8 2b 08 00 00       	call   80103800 <mycpu>
80102fd5:	39 d8                	cmp    %ebx,%eax
80102fd7:	74 41                	je     8010301a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102fd9:	e8 22 f5 ff ff       	call   80102500 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102fde:	05 00 10 00 00       	add    $0x1000,%eax
    *(void(**)(void))(code-8) = mpenter;
80102fe3:	c7 05 f8 6f 00 80 10 	movl   $0x80102f10,0x80006ff8
80102fea:	2f 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102fed:	c7 05 f4 6f 00 80 00 	movl   $0x10a000,0x80006ff4
80102ff4:	a0 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
80102ff7:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
80102ffc:	0f b6 03             	movzbl (%ebx),%eax
80102fff:	83 ec 08             	sub    $0x8,%esp
80103002:	68 00 70 00 00       	push   $0x7000
80103007:	50                   	push   %eax
80103008:	e8 b3 f7 ff ff       	call   801027c0 <lapicstartap>
8010300d:	83 c4 10             	add    $0x10,%esp

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80103010:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103016:	85 c0                	test   %eax,%eax
80103018:	74 f6                	je     80103010 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
8010301a:	69 05 e0 46 11 80 b0 	imul   $0xb0,0x801146e0,%eax
80103021:	00 00 00 
80103024:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
8010302a:	05 60 41 11 80       	add    $0x80114160,%eax
8010302f:	39 c3                	cmp    %eax,%ebx
80103031:	72 9d                	jb     80102fd0 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103033:	83 ec 08             	sub    $0x8,%esp
80103036:	68 00 00 00 8e       	push   $0x8e000000
8010303b:	68 00 00 40 80       	push   $0x80400000
80103040:	e8 5b f4 ff ff       	call   801024a0 <kinit2>
  userinit();      // first user process
80103045:	e8 86 08 00 00       	call   801038d0 <userinit>
  mpmain();        // finish this processor's setup
8010304a:	e8 81 fe ff ff       	call   80102ed0 <mpmain>
8010304f:	90                   	nop

80103050 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	57                   	push   %edi
80103054:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103055:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
8010305b:	53                   	push   %ebx
  e = addr+len;
8010305c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
8010305f:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80103062:	39 de                	cmp    %ebx,%esi
80103064:	72 10                	jb     80103076 <mpsearch1+0x26>
80103066:	eb 50                	jmp    801030b8 <mpsearch1+0x68>
80103068:	90                   	nop
80103069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103070:	39 fb                	cmp    %edi,%ebx
80103072:	89 fe                	mov    %edi,%esi
80103074:	76 42                	jbe    801030b8 <mpsearch1+0x68>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103076:	83 ec 04             	sub    $0x4,%esp
80103079:	8d 7e 10             	lea    0x10(%esi),%edi
8010307c:	6a 04                	push   $0x4
8010307e:	68 38 7b 10 80       	push   $0x80107b38
80103083:	56                   	push   %esi
80103084:	e8 67 16 00 00       	call   801046f0 <memcmp>
80103089:	83 c4 10             	add    $0x10,%esp
8010308c:	85 c0                	test   %eax,%eax
8010308e:	75 e0                	jne    80103070 <mpsearch1+0x20>
80103090:	89 f1                	mov    %esi,%ecx
80103092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    sum += addr[i];
80103098:	0f b6 11             	movzbl (%ecx),%edx
8010309b:	83 c1 01             	add    $0x1,%ecx
8010309e:	01 d0                	add    %edx,%eax
  for(i=0; i<len; i++)
801030a0:	39 f9                	cmp    %edi,%ecx
801030a2:	75 f4                	jne    80103098 <mpsearch1+0x48>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801030a4:	84 c0                	test   %al,%al
801030a6:	75 c8                	jne    80103070 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
801030a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030ab:	89 f0                	mov    %esi,%eax
801030ad:	5b                   	pop    %ebx
801030ae:	5e                   	pop    %esi
801030af:	5f                   	pop    %edi
801030b0:	5d                   	pop    %ebp
801030b1:	c3                   	ret    
801030b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801030bb:	31 f6                	xor    %esi,%esi
}
801030bd:	89 f0                	mov    %esi,%eax
801030bf:	5b                   	pop    %ebx
801030c0:	5e                   	pop    %esi
801030c1:	5f                   	pop    %edi
801030c2:	5d                   	pop    %ebp
801030c3:	c3                   	ret    
801030c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801030d0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
801030d0:	55                   	push   %ebp
801030d1:	89 e5                	mov    %esp,%ebp
801030d3:	57                   	push   %edi
801030d4:	56                   	push   %esi
801030d5:	53                   	push   %ebx
801030d6:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
801030d9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801030e0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801030e7:	c1 e0 08             	shl    $0x8,%eax
801030ea:	09 d0                	or     %edx,%eax
801030ec:	c1 e0 04             	shl    $0x4,%eax
801030ef:	85 c0                	test   %eax,%eax
801030f1:	75 1b                	jne    8010310e <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
801030f3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801030fa:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103101:	c1 e0 08             	shl    $0x8,%eax
80103104:	09 d0                	or     %edx,%eax
80103106:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103109:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
8010310e:	ba 00 04 00 00       	mov    $0x400,%edx
80103113:	e8 38 ff ff ff       	call   80103050 <mpsearch1>
80103118:	85 c0                	test   %eax,%eax
8010311a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010311d:	0f 84 3d 01 00 00    	je     80103260 <mpinit+0x190>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103123:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103126:	8b 58 04             	mov    0x4(%eax),%ebx
80103129:	85 db                	test   %ebx,%ebx
8010312b:	0f 84 4f 01 00 00    	je     80103280 <mpinit+0x1b0>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103131:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103137:	83 ec 04             	sub    $0x4,%esp
8010313a:	6a 04                	push   $0x4
8010313c:	68 55 7b 10 80       	push   $0x80107b55
80103141:	56                   	push   %esi
80103142:	e8 a9 15 00 00       	call   801046f0 <memcmp>
80103147:	83 c4 10             	add    $0x10,%esp
8010314a:	85 c0                	test   %eax,%eax
8010314c:	0f 85 2e 01 00 00    	jne    80103280 <mpinit+0x1b0>
  if(conf->version != 1 && conf->version != 4)
80103152:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103159:	3c 01                	cmp    $0x1,%al
8010315b:	0f 95 c2             	setne  %dl
8010315e:	3c 04                	cmp    $0x4,%al
80103160:	0f 95 c0             	setne  %al
80103163:	20 c2                	and    %al,%dl
80103165:	0f 85 15 01 00 00    	jne    80103280 <mpinit+0x1b0>
  if(sum((uchar*)conf, conf->length) != 0)
8010316b:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
  for(i=0; i<len; i++)
80103172:	66 85 ff             	test   %di,%di
80103175:	74 1a                	je     80103191 <mpinit+0xc1>
80103177:	89 f0                	mov    %esi,%eax
80103179:	01 f7                	add    %esi,%edi
  sum = 0;
8010317b:	31 d2                	xor    %edx,%edx
8010317d:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
80103180:	0f b6 08             	movzbl (%eax),%ecx
80103183:	83 c0 01             	add    $0x1,%eax
80103186:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
80103188:	39 c7                	cmp    %eax,%edi
8010318a:	75 f4                	jne    80103180 <mpinit+0xb0>
8010318c:	84 d2                	test   %dl,%dl
8010318e:	0f 95 c2             	setne  %dl
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80103191:	85 f6                	test   %esi,%esi
80103193:	0f 84 e7 00 00 00    	je     80103280 <mpinit+0x1b0>
80103199:	84 d2                	test   %dl,%dl
8010319b:	0f 85 df 00 00 00    	jne    80103280 <mpinit+0x1b0>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801031a1:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801031a7:	a3 5c 40 11 80       	mov    %eax,0x8011405c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031ac:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801031b3:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  ismp = 1;
801031b9:	bb 01 00 00 00       	mov    $0x1,%ebx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031be:	01 d6                	add    %edx,%esi
801031c0:	39 c6                	cmp    %eax,%esi
801031c2:	76 23                	jbe    801031e7 <mpinit+0x117>
    switch(*p){
801031c4:	0f b6 10             	movzbl (%eax),%edx
801031c7:	80 fa 04             	cmp    $0x4,%dl
801031ca:	0f 87 ca 00 00 00    	ja     8010329a <mpinit+0x1ca>
801031d0:	ff 24 95 7c 7b 10 80 	jmp    *-0x7fef8484(,%edx,4)
801031d7:	89 f6                	mov    %esi,%esi
801031d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801031e0:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031e3:	39 c6                	cmp    %eax,%esi
801031e5:	77 dd                	ja     801031c4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
801031e7:	85 db                	test   %ebx,%ebx
801031e9:	0f 84 9e 00 00 00    	je     8010328d <mpinit+0x1bd>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
801031ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801031f2:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
801031f6:	74 15                	je     8010320d <mpinit+0x13d>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031f8:	b8 70 00 00 00       	mov    $0x70,%eax
801031fd:	ba 22 00 00 00       	mov    $0x22,%edx
80103202:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103203:	ba 23 00 00 00       	mov    $0x23,%edx
80103208:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103209:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010320c:	ee                   	out    %al,(%dx)
  }
}
8010320d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103210:	5b                   	pop    %ebx
80103211:	5e                   	pop    %esi
80103212:	5f                   	pop    %edi
80103213:	5d                   	pop    %ebp
80103214:	c3                   	ret    
80103215:	8d 76 00             	lea    0x0(%esi),%esi
      if(ncpu < NCPU) {
80103218:	8b 0d e0 46 11 80    	mov    0x801146e0,%ecx
8010321e:	83 f9 07             	cmp    $0x7,%ecx
80103221:	7f 19                	jg     8010323c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103223:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103227:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010322d:	83 c1 01             	add    $0x1,%ecx
80103230:	89 0d e0 46 11 80    	mov    %ecx,0x801146e0
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103236:	88 97 60 41 11 80    	mov    %dl,-0x7feebea0(%edi)
      p += sizeof(struct mpproc);
8010323c:	83 c0 14             	add    $0x14,%eax
      continue;
8010323f:	e9 7c ff ff ff       	jmp    801031c0 <mpinit+0xf0>
80103244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
80103248:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010324c:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
8010324f:	88 15 40 41 11 80    	mov    %dl,0x80114140
      continue;
80103255:	e9 66 ff ff ff       	jmp    801031c0 <mpinit+0xf0>
8010325a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return mpsearch1(0xF0000, 0x10000);
80103260:	ba 00 00 01 00       	mov    $0x10000,%edx
80103265:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010326a:	e8 e1 fd ff ff       	call   80103050 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010326f:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
80103271:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103274:	0f 85 a9 fe ff ff    	jne    80103123 <mpinit+0x53>
8010327a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("Expect to run on an SMP");
80103280:	83 ec 0c             	sub    $0xc,%esp
80103283:	68 3d 7b 10 80       	push   $0x80107b3d
80103288:	e8 03 d1 ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
8010328d:	83 ec 0c             	sub    $0xc,%esp
80103290:	68 5c 7b 10 80       	push   $0x80107b5c
80103295:	e8 f6 d0 ff ff       	call   80100390 <panic>
      ismp = 0;
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
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801032d0:	55                   	push   %ebp
801032d1:	89 e5                	mov    %esp,%ebp
801032d3:	57                   	push   %edi
801032d4:	56                   	push   %esi
801032d5:	53                   	push   %ebx
801032d6:	83 ec 0c             	sub    $0xc,%esp
801032d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801032df:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801032e5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801032eb:	e8 d0 da ff ff       	call   80100dc0 <filealloc>
801032f0:	85 c0                	test   %eax,%eax
801032f2:	89 03                	mov    %eax,(%ebx)
801032f4:	74 22                	je     80103318 <pipealloc+0x48>
801032f6:	e8 c5 da ff ff       	call   80100dc0 <filealloc>
801032fb:	85 c0                	test   %eax,%eax
801032fd:	89 06                	mov    %eax,(%esi)
801032ff:	74 3f                	je     80103340 <pipealloc+0x70>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103301:	e8 fa f1 ff ff       	call   80102500 <kalloc>
80103306:	85 c0                	test   %eax,%eax
80103308:	89 c7                	mov    %eax,%edi
8010330a:	75 54                	jne    80103360 <pipealloc+0x90>

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
8010330c:	8b 03                	mov    (%ebx),%eax
8010330e:	85 c0                	test   %eax,%eax
80103310:	75 34                	jne    80103346 <pipealloc+0x76>
80103312:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    fileclose(*f0);
  if(*f1)
80103318:	8b 06                	mov    (%esi),%eax
8010331a:	85 c0                	test   %eax,%eax
8010331c:	74 0c                	je     8010332a <pipealloc+0x5a>
    fileclose(*f1);
8010331e:	83 ec 0c             	sub    $0xc,%esp
80103321:	50                   	push   %eax
80103322:	e8 59 db ff ff       	call   80100e80 <fileclose>
80103327:	83 c4 10             	add    $0x10,%esp
  return -1;
}
8010332a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010332d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103332:	5b                   	pop    %ebx
80103333:	5e                   	pop    %esi
80103334:	5f                   	pop    %edi
80103335:	5d                   	pop    %ebp
80103336:	c3                   	ret    
80103337:	89 f6                	mov    %esi,%esi
80103339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(*f0)
80103340:	8b 03                	mov    (%ebx),%eax
80103342:	85 c0                	test   %eax,%eax
80103344:	74 e4                	je     8010332a <pipealloc+0x5a>
    fileclose(*f0);
80103346:	83 ec 0c             	sub    $0xc,%esp
80103349:	50                   	push   %eax
8010334a:	e8 31 db ff ff       	call   80100e80 <fileclose>
  if(*f1)
8010334f:	8b 06                	mov    (%esi),%eax
    fileclose(*f0);
80103351:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103354:	85 c0                	test   %eax,%eax
80103356:	75 c6                	jne    8010331e <pipealloc+0x4e>
80103358:	eb d0                	jmp    8010332a <pipealloc+0x5a>
8010335a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  initlock(&p->lock, "pipe");
80103360:	83 ec 08             	sub    $0x8,%esp
  p->readopen = 1;
80103363:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010336a:	00 00 00 
  p->writeopen = 1;
8010336d:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103374:	00 00 00 
  p->nwrite = 0;
80103377:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010337e:	00 00 00 
  p->nread = 0;
80103381:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103388:	00 00 00 
  initlock(&p->lock, "pipe");
8010338b:	68 90 7b 10 80       	push   $0x80107b90
80103390:	50                   	push   %eax
80103391:	e8 ba 10 00 00       	call   80104450 <initlock>
  (*f0)->type = FD_PIPE;
80103396:	8b 03                	mov    (%ebx),%eax
  return 0;
80103398:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
8010339b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801033a1:	8b 03                	mov    (%ebx),%eax
801033a3:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801033a7:	8b 03                	mov    (%ebx),%eax
801033a9:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801033ad:	8b 03                	mov    (%ebx),%eax
801033af:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801033b2:	8b 06                	mov    (%esi),%eax
801033b4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801033ba:	8b 06                	mov    (%esi),%eax
801033bc:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801033c0:	8b 06                	mov    (%esi),%eax
801033c2:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801033c6:	8b 06                	mov    (%esi),%eax
801033c8:	89 78 0c             	mov    %edi,0xc(%eax)
}
801033cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801033ce:	31 c0                	xor    %eax,%eax
}
801033d0:	5b                   	pop    %ebx
801033d1:	5e                   	pop    %esi
801033d2:	5f                   	pop    %edi
801033d3:	5d                   	pop    %ebp
801033d4:	c3                   	ret    
801033d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801033d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801033e0 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
801033e0:	55                   	push   %ebp
801033e1:	89 e5                	mov    %esp,%ebp
801033e3:	56                   	push   %esi
801033e4:	53                   	push   %ebx
801033e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801033eb:	83 ec 0c             	sub    $0xc,%esp
801033ee:	53                   	push   %ebx
801033ef:	e8 9c 11 00 00       	call   80104590 <acquire>
  if(writable){
801033f4:	83 c4 10             	add    $0x10,%esp
801033f7:	85 f6                	test   %esi,%esi
801033f9:	74 45                	je     80103440 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
801033fb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103401:	83 ec 0c             	sub    $0xc,%esp
    p->writeopen = 0;
80103404:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010340b:	00 00 00 
    wakeup(&p->nread);
8010340e:	50                   	push   %eax
8010340f:	e8 6c 0c 00 00       	call   80104080 <wakeup>
80103414:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103417:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010341d:	85 d2                	test   %edx,%edx
8010341f:	75 0a                	jne    8010342b <pipeclose+0x4b>
80103421:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103427:	85 c0                	test   %eax,%eax
80103429:	74 35                	je     80103460 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010342b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010342e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103431:	5b                   	pop    %ebx
80103432:	5e                   	pop    %esi
80103433:	5d                   	pop    %ebp
    release(&p->lock);
80103434:	e9 17 12 00 00       	jmp    80104650 <release>
80103439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
80103440:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103446:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
80103449:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103450:	00 00 00 
    wakeup(&p->nwrite);
80103453:	50                   	push   %eax
80103454:	e8 27 0c 00 00       	call   80104080 <wakeup>
80103459:	83 c4 10             	add    $0x10,%esp
8010345c:	eb b9                	jmp    80103417 <pipeclose+0x37>
8010345e:	66 90                	xchg   %ax,%ax
    release(&p->lock);
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	53                   	push   %ebx
80103464:	e8 e7 11 00 00       	call   80104650 <release>
    kfree((char*)p);
80103469:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010346c:	83 c4 10             	add    $0x10,%esp
}
8010346f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103472:	5b                   	pop    %ebx
80103473:	5e                   	pop    %esi
80103474:	5d                   	pop    %ebp
    kfree((char*)p);
80103475:	e9 d6 ee ff ff       	jmp    80102350 <kfree>
8010347a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103480 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103480:	55                   	push   %ebp
80103481:	89 e5                	mov    %esp,%ebp
80103483:	57                   	push   %edi
80103484:	56                   	push   %esi
80103485:	53                   	push   %ebx
80103486:	83 ec 28             	sub    $0x28,%esp
80103489:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010348c:	53                   	push   %ebx
8010348d:	e8 fe 10 00 00       	call   80104590 <acquire>
  for(i = 0; i < n; i++){
80103492:	8b 45 10             	mov    0x10(%ebp),%eax
80103495:	83 c4 10             	add    $0x10,%esp
80103498:	85 c0                	test   %eax,%eax
8010349a:	0f 8e c9 00 00 00    	jle    80103569 <pipewrite+0xe9>
801034a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801034a3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801034a9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801034af:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801034b2:	03 4d 10             	add    0x10(%ebp),%ecx
801034b5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034b8:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801034be:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801034c4:	39 d0                	cmp    %edx,%eax
801034c6:	75 71                	jne    80103539 <pipewrite+0xb9>
      if(p->readopen == 0 || myproc()->killed){
801034c8:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801034ce:	85 c0                	test   %eax,%eax
801034d0:	74 4e                	je     80103520 <pipewrite+0xa0>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801034d2:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801034d8:	eb 3a                	jmp    80103514 <pipewrite+0x94>
801034da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      wakeup(&p->nread);
801034e0:	83 ec 0c             	sub    $0xc,%esp
801034e3:	57                   	push   %edi
801034e4:	e8 97 0b 00 00       	call   80104080 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801034e9:	5a                   	pop    %edx
801034ea:	59                   	pop    %ecx
801034eb:	53                   	push   %ebx
801034ec:	56                   	push   %esi
801034ed:	e8 ce 09 00 00       	call   80103ec0 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034f2:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034f8:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801034fe:	83 c4 10             	add    $0x10,%esp
80103501:	05 00 02 00 00       	add    $0x200,%eax
80103506:	39 c2                	cmp    %eax,%edx
80103508:	75 36                	jne    80103540 <pipewrite+0xc0>
      if(p->readopen == 0 || myproc()->killed){
8010350a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103510:	85 c0                	test   %eax,%eax
80103512:	74 0c                	je     80103520 <pipewrite+0xa0>
80103514:	e8 87 03 00 00       	call   801038a0 <myproc>
80103519:	8b 40 24             	mov    0x24(%eax),%eax
8010351c:	85 c0                	test   %eax,%eax
8010351e:	74 c0                	je     801034e0 <pipewrite+0x60>
        release(&p->lock);
80103520:	83 ec 0c             	sub    $0xc,%esp
80103523:	53                   	push   %ebx
80103524:	e8 27 11 00 00       	call   80104650 <release>
        return -1;
80103529:	83 c4 10             	add    $0x10,%esp
8010352c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103531:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103534:	5b                   	pop    %ebx
80103535:	5e                   	pop    %esi
80103536:	5f                   	pop    %edi
80103537:	5d                   	pop    %ebp
80103538:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103539:	89 c2                	mov    %eax,%edx
8010353b:	90                   	nop
8010353c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103540:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80103543:	8d 42 01             	lea    0x1(%edx),%eax
80103546:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010354c:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103552:	83 c6 01             	add    $0x1,%esi
80103555:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
  for(i = 0; i < n; i++){
80103559:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010355c:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
8010355f:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
80103563:	0f 85 4f ff ff ff    	jne    801034b8 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103569:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010356f:	83 ec 0c             	sub    $0xc,%esp
80103572:	50                   	push   %eax
80103573:	e8 08 0b 00 00       	call   80104080 <wakeup>
  release(&p->lock);
80103578:	89 1c 24             	mov    %ebx,(%esp)
8010357b:	e8 d0 10 00 00       	call   80104650 <release>
  return n;
80103580:	83 c4 10             	add    $0x10,%esp
80103583:	8b 45 10             	mov    0x10(%ebp),%eax
80103586:	eb a9                	jmp    80103531 <pipewrite+0xb1>
80103588:	90                   	nop
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103590 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103590:	55                   	push   %ebp
80103591:	89 e5                	mov    %esp,%ebp
80103593:	57                   	push   %edi
80103594:	56                   	push   %esi
80103595:	53                   	push   %ebx
80103596:	83 ec 18             	sub    $0x18,%esp
80103599:	8b 75 08             	mov    0x8(%ebp),%esi
8010359c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010359f:	56                   	push   %esi
801035a0:	e8 eb 0f 00 00       	call   80104590 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801035a5:	83 c4 10             	add    $0x10,%esp
801035a8:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035ae:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035b4:	75 6a                	jne    80103620 <piperead+0x90>
801035b6:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
801035bc:	85 db                	test   %ebx,%ebx
801035be:	0f 84 c4 00 00 00    	je     80103688 <piperead+0xf8>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801035c4:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801035ca:	eb 2d                	jmp    801035f9 <piperead+0x69>
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035d0:	83 ec 08             	sub    $0x8,%esp
801035d3:	56                   	push   %esi
801035d4:	53                   	push   %ebx
801035d5:	e8 e6 08 00 00       	call   80103ec0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801035da:	83 c4 10             	add    $0x10,%esp
801035dd:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035e3:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035e9:	75 35                	jne    80103620 <piperead+0x90>
801035eb:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
801035f1:	85 d2                	test   %edx,%edx
801035f3:	0f 84 8f 00 00 00    	je     80103688 <piperead+0xf8>
    if(myproc()->killed){
801035f9:	e8 a2 02 00 00       	call   801038a0 <myproc>
801035fe:	8b 48 24             	mov    0x24(%eax),%ecx
80103601:	85 c9                	test   %ecx,%ecx
80103603:	74 cb                	je     801035d0 <piperead+0x40>
      release(&p->lock);
80103605:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103608:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
8010360d:	56                   	push   %esi
8010360e:	e8 3d 10 00 00       	call   80104650 <release>
      return -1;
80103613:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103616:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103619:	89 d8                	mov    %ebx,%eax
8010361b:	5b                   	pop    %ebx
8010361c:	5e                   	pop    %esi
8010361d:	5f                   	pop    %edi
8010361e:	5d                   	pop    %ebp
8010361f:	c3                   	ret    
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103620:	8b 45 10             	mov    0x10(%ebp),%eax
80103623:	85 c0                	test   %eax,%eax
80103625:	7e 61                	jle    80103688 <piperead+0xf8>
    if(p->nread == p->nwrite)
80103627:	31 db                	xor    %ebx,%ebx
80103629:	eb 13                	jmp    8010363e <piperead+0xae>
8010362b:	90                   	nop
8010362c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103630:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103636:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
8010363c:	74 1f                	je     8010365d <piperead+0xcd>
    addr[i] = p->data[p->nread++ % PIPESIZE];
8010363e:	8d 41 01             	lea    0x1(%ecx),%eax
80103641:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80103647:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
8010364d:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
80103652:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103655:	83 c3 01             	add    $0x1,%ebx
80103658:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010365b:	75 d3                	jne    80103630 <piperead+0xa0>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010365d:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103663:	83 ec 0c             	sub    $0xc,%esp
80103666:	50                   	push   %eax
80103667:	e8 14 0a 00 00       	call   80104080 <wakeup>
  release(&p->lock);
8010366c:	89 34 24             	mov    %esi,(%esp)
8010366f:	e8 dc 0f 00 00       	call   80104650 <release>
  return i;
80103674:	83 c4 10             	add    $0x10,%esp
}
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
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103694:	bb 34 47 11 80       	mov    $0x80114734,%ebx
{
80103699:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010369c:	68 00 47 11 80       	push   $0x80114700
801036a1:	e8 ea 0e 00 00       	call   80104590 <acquire>
801036a6:	83 c4 10             	add    $0x10,%esp
801036a9:	eb 17                	jmp    801036c2 <allocproc+0x32>
801036ab:	90                   	nop
801036ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036b0:	81 c3 84 00 00 00    	add    $0x84,%ebx
801036b6:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
801036bc:	0f 83 8e 00 00 00    	jae    80103750 <allocproc+0xc0>
    if(p->state == UNUSED)
801036c2:	8b 43 0c             	mov    0xc(%ebx),%eax
801036c5:	85 c0                	test   %eax,%eax
801036c7:	75 e7                	jne    801036b0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036c9:	a1 04 b0 10 80       	mov    0x8010b004,%eax
  p->tickets = 1;
  p->ticks = 0;

  release(&ptable.lock);
801036ce:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
801036d1:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->tickets = 1;
801036d8:	c7 43 7c 01 00 00 00 	movl   $0x1,0x7c(%ebx)
  p->ticks = 0;
801036df:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
801036e6:	00 00 00 
  p->pid = nextpid++;
801036e9:	8d 50 01             	lea    0x1(%eax),%edx
801036ec:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
801036ef:	68 00 47 11 80       	push   $0x80114700
  p->pid = nextpid++;
801036f4:	89 15 04 b0 10 80    	mov    %edx,0x8010b004
  release(&ptable.lock);
801036fa:	e8 51 0f 00 00       	call   80104650 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801036ff:	e8 fc ed ff ff       	call   80102500 <kalloc>
80103704:	83 c4 10             	add    $0x10,%esp
80103707:	85 c0                	test   %eax,%eax
80103709:	89 43 08             	mov    %eax,0x8(%ebx)
8010370c:	74 5b                	je     80103769 <allocproc+0xd9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010370e:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103714:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
80103717:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010371c:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
8010371f:	c7 40 14 3f 5a 10 80 	movl   $0x80105a3f,0x14(%eax)
  p->context = (struct context*)sp;
80103726:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103729:	6a 14                	push   $0x14
8010372b:	6a 00                	push   $0x0
8010372d:	50                   	push   %eax
8010372e:	e8 6d 0f 00 00       	call   801046a0 <memset>
  p->context->eip = (uint)forkret;
80103733:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103736:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
80103739:	c7 40 10 80 37 10 80 	movl   $0x80103780,0x10(%eax)
}
80103740:	89 d8                	mov    %ebx,%eax
80103742:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103745:	c9                   	leave  
80103746:	c3                   	ret    
80103747:	89 f6                	mov    %esi,%esi
80103749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&ptable.lock);
80103750:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103753:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103755:	68 00 47 11 80       	push   $0x80114700
8010375a:	e8 f1 0e 00 00       	call   80104650 <release>
}
8010375f:	89 d8                	mov    %ebx,%eax
  return 0;
80103761:	83 c4 10             	add    $0x10,%esp
}
80103764:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103767:	c9                   	leave  
80103768:	c3                   	ret    
    p->state = UNUSED;
80103769:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103770:	31 db                	xor    %ebx,%ebx
80103772:	eb cc                	jmp    80103740 <allocproc+0xb0>
80103774:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010377a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103780 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103786:	68 00 47 11 80       	push   $0x80114700
8010378b:	e8 c0 0e 00 00       	call   80104650 <release>

  if (first) {
80103790:	a1 00 b0 10 80       	mov    0x8010b000,%eax
80103795:	83 c4 10             	add    $0x10,%esp
80103798:	85 c0                	test   %eax,%eax
8010379a:	75 04                	jne    801037a0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010379c:	c9                   	leave  
8010379d:	c3                   	ret    
8010379e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
801037a0:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
801037a3:	c7 05 00 b0 10 80 00 	movl   $0x0,0x8010b000
801037aa:	00 00 00 
    iinit(ROOTDEV);
801037ad:	6a 01                	push   $0x1
801037af:	e8 0c dd ff ff       	call   801014c0 <iinit>
    initlog(ROOTDEV);
801037b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801037bb:	e8 d0 f3 ff ff       	call   80102b90 <initlog>
801037c0:	83 c4 10             	add    $0x10,%esp
}
801037c3:	c9                   	leave  
801037c4:	c3                   	ret    
801037c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037d0 <pinit>:
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801037d6:	68 95 7b 10 80       	push   $0x80107b95
801037db:	68 00 47 11 80       	push   $0x80114700
801037e0:	e8 6b 0c 00 00       	call   80104450 <initlock>
  sgenrand(unixtime());
801037e5:	e8 56 f2 ff ff       	call   80102a40 <unixtime>
801037ea:	89 04 24             	mov    %eax,(%esp)
801037ed:	e8 7e 3c 00 00       	call   80107470 <sgenrand>
}
801037f2:	83 c4 10             	add    $0x10,%esp
801037f5:	c9                   	leave  
801037f6:	c3                   	ret    
801037f7:	89 f6                	mov    %esi,%esi
801037f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103800 <mycpu>:
{
80103800:	55                   	push   %ebp
80103801:	89 e5                	mov    %esp,%ebp
80103803:	56                   	push   %esi
80103804:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103805:	9c                   	pushf  
80103806:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103807:	f6 c4 02             	test   $0x2,%ah
8010380a:	75 5e                	jne    8010386a <mycpu+0x6a>
  apicid = lapicid();
8010380c:	e8 5f ef ff ff       	call   80102770 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103811:	8b 35 e0 46 11 80    	mov    0x801146e0,%esi
80103817:	85 f6                	test   %esi,%esi
80103819:	7e 42                	jle    8010385d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010381b:	0f b6 15 60 41 11 80 	movzbl 0x80114160,%edx
80103822:	39 d0                	cmp    %edx,%eax
80103824:	74 30                	je     80103856 <mycpu+0x56>
80103826:	b9 10 42 11 80       	mov    $0x80114210,%ecx
  for (i = 0; i < ncpu; ++i) {
8010382b:	31 d2                	xor    %edx,%edx
8010382d:	8d 76 00             	lea    0x0(%esi),%esi
80103830:	83 c2 01             	add    $0x1,%edx
80103833:	39 f2                	cmp    %esi,%edx
80103835:	74 26                	je     8010385d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
80103837:	0f b6 19             	movzbl (%ecx),%ebx
8010383a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103840:	39 c3                	cmp    %eax,%ebx
80103842:	75 ec                	jne    80103830 <mycpu+0x30>
80103844:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010384a:	05 60 41 11 80       	add    $0x80114160,%eax
}
8010384f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103852:	5b                   	pop    %ebx
80103853:	5e                   	pop    %esi
80103854:	5d                   	pop    %ebp
80103855:	c3                   	ret    
    if (cpus[i].apicid == apicid)
80103856:	b8 60 41 11 80       	mov    $0x80114160,%eax
      return &cpus[i];
8010385b:	eb f2                	jmp    8010384f <mycpu+0x4f>
  panic("unknown apicid\n");
8010385d:	83 ec 0c             	sub    $0xc,%esp
80103860:	68 9c 7b 10 80       	push   $0x80107b9c
80103865:	e8 26 cb ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
8010386a:	83 ec 0c             	sub    $0xc,%esp
8010386d:	68 7c 7c 10 80       	push   $0x80107c7c
80103872:	e8 19 cb ff ff       	call   80100390 <panic>
80103877:	89 f6                	mov    %esi,%esi
80103879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103880 <cpuid>:
cpuid() {
80103880:	55                   	push   %ebp
80103881:	89 e5                	mov    %esp,%ebp
80103883:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103886:	e8 75 ff ff ff       	call   80103800 <mycpu>
8010388b:	2d 60 41 11 80       	sub    $0x80114160,%eax
}
80103890:	c9                   	leave  
  return mycpu()-cpus;
80103891:	c1 f8 04             	sar    $0x4,%eax
80103894:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010389a:	c3                   	ret    
8010389b:	90                   	nop
8010389c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801038a0 <myproc>:
myproc(void) {
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	53                   	push   %ebx
801038a4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801038a7:	e8 14 0c 00 00       	call   801044c0 <pushcli>
  c = mycpu();
801038ac:	e8 4f ff ff ff       	call   80103800 <mycpu>
  p = c->proc;
801038b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038b7:	e8 44 0c 00 00       	call   80104500 <popcli>
}
801038bc:	83 c4 04             	add    $0x4,%esp
801038bf:	89 d8                	mov    %ebx,%eax
801038c1:	5b                   	pop    %ebx
801038c2:	5d                   	pop    %ebp
801038c3:	c3                   	ret    
801038c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801038d0 <userinit>:
{
801038d0:	55                   	push   %ebp
801038d1:	89 e5                	mov    %esp,%ebp
801038d3:	53                   	push   %ebx
801038d4:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
801038d7:	e8 b4 fd ff ff       	call   80103690 <allocproc>
801038dc:	89 c3                	mov    %eax,%ebx
  initproc = p;
801038de:	a3 b8 b5 10 80       	mov    %eax,0x8010b5b8
  if((p->pgdir = setupkvm()) == 0)
801038e3:	e8 28 37 00 00       	call   80107010 <setupkvm>
801038e8:	85 c0                	test   %eax,%eax
801038ea:	89 43 04             	mov    %eax,0x4(%ebx)
801038ed:	0f 84 bd 00 00 00    	je     801039b0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801038f3:	83 ec 04             	sub    $0x4,%esp
801038f6:	68 2c 00 00 00       	push   $0x2c
801038fb:	68 64 b4 10 80       	push   $0x8010b464
80103900:	50                   	push   %eax
80103901:	e8 ea 33 00 00       	call   80106cf0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103906:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103909:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010390f:	6a 4c                	push   $0x4c
80103911:	6a 00                	push   $0x0
80103913:	ff 73 18             	pushl  0x18(%ebx)
80103916:	e8 85 0d 00 00       	call   801046a0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010391b:	8b 43 18             	mov    0x18(%ebx),%eax
8010391e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103923:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103928:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010392b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010392f:	8b 43 18             	mov    0x18(%ebx),%eax
80103932:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103936:	8b 43 18             	mov    0x18(%ebx),%eax
80103939:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010393d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103941:	8b 43 18             	mov    0x18(%ebx),%eax
80103944:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103948:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010394c:	8b 43 18             	mov    0x18(%ebx),%eax
8010394f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103956:	8b 43 18             	mov    0x18(%ebx),%eax
80103959:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103960:	8b 43 18             	mov    0x18(%ebx),%eax
80103963:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010396a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010396d:	6a 10                	push   $0x10
8010396f:	68 c5 7b 10 80       	push   $0x80107bc5
80103974:	50                   	push   %eax
80103975:	e8 06 0f 00 00       	call   80104880 <safestrcpy>
  p->cwd = namei("/");
8010397a:	c7 04 24 ce 7b 10 80 	movl   $0x80107bce,(%esp)
80103981:	e8 9a e5 ff ff       	call   80101f20 <namei>
80103986:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103989:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103990:	e8 fb 0b 00 00       	call   80104590 <acquire>
  p->state = RUNNABLE;
80103995:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010399c:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
801039a3:	e8 a8 0c 00 00       	call   80104650 <release>
}
801039a8:	83 c4 10             	add    $0x10,%esp
801039ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039ae:	c9                   	leave  
801039af:	c3                   	ret    
    panic("userinit: out of memory?");
801039b0:	83 ec 0c             	sub    $0xc,%esp
801039b3:	68 ac 7b 10 80       	push   $0x80107bac
801039b8:	e8 d3 c9 ff ff       	call   80100390 <panic>
801039bd:	8d 76 00             	lea    0x0(%esi),%esi

801039c0 <growproc>:
{
801039c0:	55                   	push   %ebp
801039c1:	89 e5                	mov    %esp,%ebp
801039c3:	56                   	push   %esi
801039c4:	53                   	push   %ebx
801039c5:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
801039c8:	e8 f3 0a 00 00       	call   801044c0 <pushcli>
  c = mycpu();
801039cd:	e8 2e fe ff ff       	call   80103800 <mycpu>
  p = c->proc;
801039d2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801039d8:	e8 23 0b 00 00       	call   80104500 <popcli>
  if(n > 0){
801039dd:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
801039e0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801039e2:	7f 1c                	jg     80103a00 <growproc+0x40>
  } else if(n < 0){
801039e4:	75 3a                	jne    80103a20 <growproc+0x60>
  switchuvm(curproc);
801039e6:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
801039e9:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801039eb:	53                   	push   %ebx
801039ec:	e8 ef 31 00 00       	call   80106be0 <switchuvm>
  return 0;
801039f1:	83 c4 10             	add    $0x10,%esp
801039f4:	31 c0                	xor    %eax,%eax
}
801039f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039f9:	5b                   	pop    %ebx
801039fa:	5e                   	pop    %esi
801039fb:	5d                   	pop    %ebp
801039fc:	c3                   	ret    
801039fd:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a00:	83 ec 04             	sub    $0x4,%esp
80103a03:	01 c6                	add    %eax,%esi
80103a05:	56                   	push   %esi
80103a06:	50                   	push   %eax
80103a07:	ff 73 04             	pushl  0x4(%ebx)
80103a0a:	e8 21 34 00 00       	call   80106e30 <allocuvm>
80103a0f:	83 c4 10             	add    $0x10,%esp
80103a12:	85 c0                	test   %eax,%eax
80103a14:	75 d0                	jne    801039e6 <growproc+0x26>
      return -1;
80103a16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a1b:	eb d9                	jmp    801039f6 <growproc+0x36>
80103a1d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a20:	83 ec 04             	sub    $0x4,%esp
80103a23:	01 c6                	add    %eax,%esi
80103a25:	56                   	push   %esi
80103a26:	50                   	push   %eax
80103a27:	ff 73 04             	pushl  0x4(%ebx)
80103a2a:	e8 31 35 00 00       	call   80106f60 <deallocuvm>
80103a2f:	83 c4 10             	add    $0x10,%esp
80103a32:	85 c0                	test   %eax,%eax
80103a34:	75 b0                	jne    801039e6 <growproc+0x26>
80103a36:	eb de                	jmp    80103a16 <growproc+0x56>
80103a38:	90                   	nop
80103a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103a40 <fork>:
{
80103a40:	55                   	push   %ebp
80103a41:	89 e5                	mov    %esp,%ebp
80103a43:	57                   	push   %edi
80103a44:	56                   	push   %esi
80103a45:	53                   	push   %ebx
80103a46:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103a49:	e8 72 0a 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103a4e:	e8 ad fd ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103a53:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a59:	e8 a2 0a 00 00       	call   80104500 <popcli>
  if((np = allocproc()) == 0){
80103a5e:	e8 2d fc ff ff       	call   80103690 <allocproc>
80103a63:	85 c0                	test   %eax,%eax
80103a65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a68:	0f 84 c7 00 00 00    	je     80103b35 <fork+0xf5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103a6e:	83 ec 08             	sub    $0x8,%esp
80103a71:	ff 33                	pushl  (%ebx)
80103a73:	ff 73 04             	pushl  0x4(%ebx)
80103a76:	89 c7                	mov    %eax,%edi
80103a78:	e8 63 36 00 00       	call   801070e0 <copyuvm>
80103a7d:	83 c4 10             	add    $0x10,%esp
80103a80:	85 c0                	test   %eax,%eax
80103a82:	89 47 04             	mov    %eax,0x4(%edi)
80103a85:	0f 84 b1 00 00 00    	je     80103b3c <fork+0xfc>
  np->tickets = curproc->tickets;
80103a8b:	8b 43 7c             	mov    0x7c(%ebx),%eax
80103a8e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103a91:	89 41 7c             	mov    %eax,0x7c(%ecx)
  np->sz = curproc->sz;
80103a94:	8b 03                	mov    (%ebx),%eax
  *np->tf = *curproc->tf;
80103a96:	8b 79 18             	mov    0x18(%ecx),%edi
  np->parent = curproc;
80103a99:	89 59 14             	mov    %ebx,0x14(%ecx)
  np->sz = curproc->sz;
80103a9c:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103a9e:	89 c8                	mov    %ecx,%eax
  *np->tf = *curproc->tf;
80103aa0:	8b 73 18             	mov    0x18(%ebx),%esi
80103aa3:	b9 13 00 00 00       	mov    $0x13,%ecx
80103aa8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103aaa:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103aac:	8b 40 18             	mov    0x18(%eax),%eax
80103aaf:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103ab6:	8d 76 00             	lea    0x0(%esi),%esi
80103ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(curproc->ofile[i])
80103ac0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103ac4:	85 c0                	test   %eax,%eax
80103ac6:	74 13                	je     80103adb <fork+0x9b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103ac8:	83 ec 0c             	sub    $0xc,%esp
80103acb:	50                   	push   %eax
80103acc:	e8 5f d3 ff ff       	call   80100e30 <filedup>
80103ad1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ad4:	83 c4 10             	add    $0x10,%esp
80103ad7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103adb:	83 c6 01             	add    $0x1,%esi
80103ade:	83 fe 10             	cmp    $0x10,%esi
80103ae1:	75 dd                	jne    80103ac0 <fork+0x80>
  np->cwd = idup(curproc->cwd);
80103ae3:	83 ec 0c             	sub    $0xc,%esp
80103ae6:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103ae9:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103aec:	e8 9f db ff ff       	call   80101690 <idup>
80103af1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103af4:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103af7:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103afa:	8d 47 6c             	lea    0x6c(%edi),%eax
80103afd:	6a 10                	push   $0x10
80103aff:	53                   	push   %ebx
80103b00:	50                   	push   %eax
80103b01:	e8 7a 0d 00 00       	call   80104880 <safestrcpy>
  pid = np->pid;
80103b06:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103b09:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103b10:	e8 7b 0a 00 00       	call   80104590 <acquire>
  np->state = RUNNABLE;
80103b15:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103b1c:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103b23:	e8 28 0b 00 00       	call   80104650 <release>
  return pid;
80103b28:	83 c4 10             	add    $0x10,%esp
}
80103b2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b2e:	89 d8                	mov    %ebx,%eax
80103b30:	5b                   	pop    %ebx
80103b31:	5e                   	pop    %esi
80103b32:	5f                   	pop    %edi
80103b33:	5d                   	pop    %ebp
80103b34:	c3                   	ret    
    return -1;
80103b35:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b3a:	eb ef                	jmp    80103b2b <fork+0xeb>
    kfree(np->kstack);
80103b3c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b3f:	83 ec 0c             	sub    $0xc,%esp
80103b42:	ff 73 08             	pushl  0x8(%ebx)
80103b45:	e8 06 e8 ff ff       	call   80102350 <kfree>
    np->kstack = 0;
80103b4a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b51:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103b58:	83 c4 10             	add    $0x10,%esp
80103b5b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b60:	eb c9                	jmp    80103b2b <fork+0xeb>
80103b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b70 <lottery_total>:
lottery_total(void){
80103b70:	55                   	push   %ebp
  int ticket_aggregate=0;
80103b71:	31 c0                	xor    %eax,%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b73:	ba 34 47 11 80       	mov    $0x80114734,%edx
lottery_total(void){
80103b78:	89 e5                	mov    %esp,%ebp
80103b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p->state==RUNNABLE){
80103b80:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103b84:	75 03                	jne    80103b89 <lottery_total+0x19>
      ticket_aggregate+=p->tickets;
80103b86:	03 42 7c             	add    0x7c(%edx),%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b89:	81 c2 84 00 00 00    	add    $0x84,%edx
80103b8f:	81 fa 34 68 11 80    	cmp    $0x80116834,%edx
80103b95:	72 e9                	jb     80103b80 <lottery_total+0x10>
}
80103b97:	5d                   	pop    %ebp
80103b98:	c3                   	ret    
80103b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103ba0 <scheduler>:
{
80103ba0:	55                   	push   %ebp
80103ba1:	89 e5                	mov    %esp,%ebp
80103ba3:	57                   	push   %edi
80103ba4:	56                   	push   %esi
80103ba5:	53                   	push   %ebx
80103ba6:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103ba9:	e8 52 fc ff ff       	call   80103800 <mycpu>
80103bae:	8d 70 04             	lea    0x4(%eax),%esi
80103bb1:	89 c3                	mov    %eax,%ebx
  c->proc = 0;
80103bb3:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103bba:	00 00 00 
80103bbd:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103bc0:	fb                   	sti    
    acquire(&ptable.lock);
80103bc1:	83 ec 0c             	sub    $0xc,%esp
80103bc4:	68 00 47 11 80       	push   $0x80114700
80103bc9:	e8 c2 09 00 00       	call   80104590 <acquire>
80103bce:	83 c4 10             	add    $0x10,%esp
  int ticket_aggregate=0;
80103bd1:	31 d2                	xor    %edx,%edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103bd3:	b8 34 47 11 80       	mov    $0x80114734,%eax
80103bd8:	90                   	nop
80103bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p->state==RUNNABLE){
80103be0:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103be4:	75 03                	jne    80103be9 <scheduler+0x49>
      ticket_aggregate+=p->tickets;
80103be6:	03 50 7c             	add    0x7c(%eax),%edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103be9:	05 84 00 00 00       	add    $0x84,%eax
80103bee:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80103bf3:	72 eb                	jb     80103be0 <scheduler+0x40>
    winner = random_at_most(total_tickets);
80103bf5:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bf8:	bf 34 47 11 80       	mov    $0x80114734,%edi
    winner = random_at_most(total_tickets);
80103bfd:	52                   	push   %edx
80103bfe:	e8 fd 39 00 00       	call   80107600 <random_at_most>
80103c03:	83 c4 10             	add    $0x10,%esp
    counter = 0;
80103c06:	31 d2                	xor    %edx,%edx
      if(p->state != RUNNABLE) {
80103c08:	83 7f 0c 03          	cmpl   $0x3,0xc(%edi)
80103c0c:	75 5a                	jne    80103c68 <scheduler+0xc8>
      counter += p->tickets;
80103c0e:	03 57 7c             	add    0x7c(%edi),%edx
      if (counter < winner) {
80103c11:	39 d0                	cmp    %edx,%eax
80103c13:	7f 53                	jg     80103c68 <scheduler+0xc8>
      switchuvm(p);
80103c15:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103c18:	89 bb ac 00 00 00    	mov    %edi,0xac(%ebx)
      switchuvm(p);
80103c1e:	57                   	push   %edi
80103c1f:	e8 bc 2f 00 00       	call   80106be0 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103c24:	58                   	pop    %eax
80103c25:	5a                   	pop    %edx
80103c26:	ff 77 1c             	pushl  0x1c(%edi)
80103c29:	56                   	push   %esi
      p->state = RUNNING;
80103c2a:	c7 47 0c 04 00 00 00 	movl   $0x4,0xc(%edi)
      swtch(&(c->scheduler), p->context);
80103c31:	e8 a5 0c 00 00       	call   801048db <swtch>
      switchkvm();
80103c36:	e8 85 2f 00 00       	call   80106bc0 <switchkvm>
      p->ticks += 1;
80103c3b:	83 87 80 00 00 00 01 	addl   $0x1,0x80(%edi)
      break;
80103c42:	83 c4 10             	add    $0x10,%esp
      c->proc = 0;
80103c45:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103c4c:	00 00 00 
    release(&ptable.lock);
80103c4f:	83 ec 0c             	sub    $0xc,%esp
80103c52:	68 00 47 11 80       	push   $0x80114700
80103c57:	e8 f4 09 00 00       	call   80104650 <release>
    sti();
80103c5c:	83 c4 10             	add    $0x10,%esp
80103c5f:	e9 5c ff ff ff       	jmp    80103bc0 <scheduler+0x20>
80103c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c68:	81 c7 84 00 00 00    	add    $0x84,%edi
80103c6e:	81 ff 34 68 11 80    	cmp    $0x80116834,%edi
80103c74:	72 92                	jb     80103c08 <scheduler+0x68>
80103c76:	eb d7                	jmp    80103c4f <scheduler+0xaf>
80103c78:	90                   	nop
80103c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103c80 <sched>:
{
80103c80:	55                   	push   %ebp
80103c81:	89 e5                	mov    %esp,%ebp
80103c83:	56                   	push   %esi
80103c84:	53                   	push   %ebx
  pushcli();
80103c85:	e8 36 08 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103c8a:	e8 71 fb ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103c8f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103c95:	e8 66 08 00 00       	call   80104500 <popcli>
  if(!holding(&ptable.lock))
80103c9a:	83 ec 0c             	sub    $0xc,%esp
80103c9d:	68 00 47 11 80       	push   $0x80114700
80103ca2:	e8 b9 08 00 00       	call   80104560 <holding>
80103ca7:	83 c4 10             	add    $0x10,%esp
80103caa:	85 c0                	test   %eax,%eax
80103cac:	74 4f                	je     80103cfd <sched+0x7d>
  if(mycpu()->ncli != 1)
80103cae:	e8 4d fb ff ff       	call   80103800 <mycpu>
80103cb3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103cba:	75 68                	jne    80103d24 <sched+0xa4>
  if(p->state == RUNNING)
80103cbc:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103cc0:	74 55                	je     80103d17 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103cc2:	9c                   	pushf  
80103cc3:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103cc4:	f6 c4 02             	test   $0x2,%ah
80103cc7:	75 41                	jne    80103d0a <sched+0x8a>
  intena = mycpu()->intena;
80103cc9:	e8 32 fb ff ff       	call   80103800 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103cce:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103cd1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103cd7:	e8 24 fb ff ff       	call   80103800 <mycpu>
80103cdc:	83 ec 08             	sub    $0x8,%esp
80103cdf:	ff 70 04             	pushl  0x4(%eax)
80103ce2:	53                   	push   %ebx
80103ce3:	e8 f3 0b 00 00       	call   801048db <swtch>
  mycpu()->intena = intena;
80103ce8:	e8 13 fb ff ff       	call   80103800 <mycpu>
}
80103ced:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103cf0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103cf6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103cf9:	5b                   	pop    %ebx
80103cfa:	5e                   	pop    %esi
80103cfb:	5d                   	pop    %ebp
80103cfc:	c3                   	ret    
    panic("sched ptable.lock");
80103cfd:	83 ec 0c             	sub    $0xc,%esp
80103d00:	68 d0 7b 10 80       	push   $0x80107bd0
80103d05:	e8 86 c6 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103d0a:	83 ec 0c             	sub    $0xc,%esp
80103d0d:	68 fc 7b 10 80       	push   $0x80107bfc
80103d12:	e8 79 c6 ff ff       	call   80100390 <panic>
    panic("sched running");
80103d17:	83 ec 0c             	sub    $0xc,%esp
80103d1a:	68 ee 7b 10 80       	push   $0x80107bee
80103d1f:	e8 6c c6 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103d24:	83 ec 0c             	sub    $0xc,%esp
80103d27:	68 e2 7b 10 80       	push   $0x80107be2
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
{
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	57                   	push   %edi
80103d44:	56                   	push   %esi
80103d45:	53                   	push   %ebx
80103d46:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103d49:	e8 72 07 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103d4e:	e8 ad fa ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103d53:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103d59:	e8 a2 07 00 00       	call   80104500 <popcli>
  if(curproc == initproc)
80103d5e:	39 35 b8 b5 10 80    	cmp    %esi,0x8010b5b8
80103d64:	8d 5e 28             	lea    0x28(%esi),%ebx
80103d67:	8d 7e 68             	lea    0x68(%esi),%edi
80103d6a:	0f 84 f1 00 00 00    	je     80103e61 <exit+0x121>
    if(curproc->ofile[fd]){
80103d70:	8b 03                	mov    (%ebx),%eax
80103d72:	85 c0                	test   %eax,%eax
80103d74:	74 12                	je     80103d88 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103d76:	83 ec 0c             	sub    $0xc,%esp
80103d79:	50                   	push   %eax
80103d7a:	e8 01 d1 ff ff       	call   80100e80 <fileclose>
      curproc->ofile[fd] = 0;
80103d7f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103d85:	83 c4 10             	add    $0x10,%esp
80103d88:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103d8b:	39 fb                	cmp    %edi,%ebx
80103d8d:	75 e1                	jne    80103d70 <exit+0x30>
  begin_op();
80103d8f:	e8 9c ee ff ff       	call   80102c30 <begin_op>
  iput(curproc->cwd);
80103d94:	83 ec 0c             	sub    $0xc,%esp
80103d97:	ff 76 68             	pushl  0x68(%esi)
80103d9a:	e8 51 da ff ff       	call   801017f0 <iput>
  end_op();
80103d9f:	e8 fc ee ff ff       	call   80102ca0 <end_op>
  curproc->cwd = 0;
80103da4:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103dab:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103db2:	e8 d9 07 00 00       	call   80104590 <acquire>
  wakeup1(curproc->parent);
80103db7:	8b 56 14             	mov    0x14(%esi),%edx
80103dba:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dbd:	b8 34 47 11 80       	mov    $0x80114734,%eax
80103dc2:	eb 10                	jmp    80103dd4 <exit+0x94>
80103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103dc8:	05 84 00 00 00       	add    $0x84,%eax
80103dcd:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80103dd2:	73 1e                	jae    80103df2 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103dd4:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103dd8:	75 ee                	jne    80103dc8 <exit+0x88>
80103dda:	3b 50 20             	cmp    0x20(%eax),%edx
80103ddd:	75 e9                	jne    80103dc8 <exit+0x88>
      p->state = RUNNABLE;
80103ddf:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103de6:	05 84 00 00 00       	add    $0x84,%eax
80103deb:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80103df0:	72 e2                	jb     80103dd4 <exit+0x94>
      p->parent = initproc;
80103df2:	8b 0d b8 b5 10 80    	mov    0x8010b5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103df8:	ba 34 47 11 80       	mov    $0x80114734,%edx
80103dfd:	eb 0f                	jmp    80103e0e <exit+0xce>
80103dff:	90                   	nop
80103e00:	81 c2 84 00 00 00    	add    $0x84,%edx
80103e06:	81 fa 34 68 11 80    	cmp    $0x80116834,%edx
80103e0c:	73 3a                	jae    80103e48 <exit+0x108>
    if(p->parent == curproc){
80103e0e:	39 72 14             	cmp    %esi,0x14(%edx)
80103e11:	75 ed                	jne    80103e00 <exit+0xc0>
      if(p->state == ZOMBIE)
80103e13:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103e17:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e1a:	75 e4                	jne    80103e00 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e1c:	b8 34 47 11 80       	mov    $0x80114734,%eax
80103e21:	eb 11                	jmp    80103e34 <exit+0xf4>
80103e23:	90                   	nop
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	05 84 00 00 00       	add    $0x84,%eax
80103e2d:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80103e32:	73 cc                	jae    80103e00 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103e34:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e38:	75 ee                	jne    80103e28 <exit+0xe8>
80103e3a:	3b 48 20             	cmp    0x20(%eax),%ecx
80103e3d:	75 e9                	jne    80103e28 <exit+0xe8>
      p->state = RUNNABLE;
80103e3f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e46:	eb e0                	jmp    80103e28 <exit+0xe8>
  curproc->state = ZOMBIE;
80103e48:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103e4f:	e8 2c fe ff ff       	call   80103c80 <sched>
  panic("zombie exit");
80103e54:	83 ec 0c             	sub    $0xc,%esp
80103e57:	68 1d 7c 10 80       	push   $0x80107c1d
80103e5c:	e8 2f c5 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103e61:	83 ec 0c             	sub    $0xc,%esp
80103e64:	68 10 7c 10 80       	push   $0x80107c10
80103e69:	e8 22 c5 ff ff       	call   80100390 <panic>
80103e6e:	66 90                	xchg   %ax,%ax

80103e70 <yield>:
{
80103e70:	55                   	push   %ebp
80103e71:	89 e5                	mov    %esp,%ebp
80103e73:	53                   	push   %ebx
80103e74:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e77:	68 00 47 11 80       	push   $0x80114700
80103e7c:	e8 0f 07 00 00       	call   80104590 <acquire>
  pushcli();
80103e81:	e8 3a 06 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103e86:	e8 75 f9 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103e8b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103e91:	e8 6a 06 00 00       	call   80104500 <popcli>
  myproc()->state = RUNNABLE;
80103e96:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103e9d:	e8 de fd ff ff       	call   80103c80 <sched>
  release(&ptable.lock);
80103ea2:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103ea9:	e8 a2 07 00 00       	call   80104650 <release>
}
80103eae:	83 c4 10             	add    $0x10,%esp
80103eb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103eb4:	c9                   	leave  
80103eb5:	c3                   	ret    
80103eb6:	8d 76 00             	lea    0x0(%esi),%esi
80103eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ec0 <sleep>:
{
80103ec0:	55                   	push   %ebp
80103ec1:	89 e5                	mov    %esp,%ebp
80103ec3:	57                   	push   %edi
80103ec4:	56                   	push   %esi
80103ec5:	53                   	push   %ebx
80103ec6:	83 ec 0c             	sub    $0xc,%esp
80103ec9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103ecc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103ecf:	e8 ec 05 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103ed4:	e8 27 f9 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103ed9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103edf:	e8 1c 06 00 00       	call   80104500 <popcli>
  if(p == 0)
80103ee4:	85 db                	test   %ebx,%ebx
80103ee6:	0f 84 87 00 00 00    	je     80103f73 <sleep+0xb3>
  if(lk == 0)
80103eec:	85 f6                	test   %esi,%esi
80103eee:	74 76                	je     80103f66 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103ef0:	81 fe 00 47 11 80    	cmp    $0x80114700,%esi
80103ef6:	74 50                	je     80103f48 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103ef8:	83 ec 0c             	sub    $0xc,%esp
80103efb:	68 00 47 11 80       	push   $0x80114700
80103f00:	e8 8b 06 00 00       	call   80104590 <acquire>
    release(lk);
80103f05:	89 34 24             	mov    %esi,(%esp)
80103f08:	e8 43 07 00 00       	call   80104650 <release>
  p->chan = chan;
80103f0d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f10:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103f17:	e8 64 fd ff ff       	call   80103c80 <sched>
  p->chan = 0;
80103f1c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103f23:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103f2a:	e8 21 07 00 00       	call   80104650 <release>
    acquire(lk);
80103f2f:	89 75 08             	mov    %esi,0x8(%ebp)
80103f32:	83 c4 10             	add    $0x10,%esp
}
80103f35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f38:	5b                   	pop    %ebx
80103f39:	5e                   	pop    %esi
80103f3a:	5f                   	pop    %edi
80103f3b:	5d                   	pop    %ebp
    acquire(lk);
80103f3c:	e9 4f 06 00 00       	jmp    80104590 <acquire>
80103f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103f48:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f4b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103f52:	e8 29 fd ff ff       	call   80103c80 <sched>
  p->chan = 0;
80103f57:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103f5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f61:	5b                   	pop    %ebx
80103f62:	5e                   	pop    %esi
80103f63:	5f                   	pop    %edi
80103f64:	5d                   	pop    %ebp
80103f65:	c3                   	ret    
    panic("sleep without lk");
80103f66:	83 ec 0c             	sub    $0xc,%esp
80103f69:	68 2f 7c 10 80       	push   $0x80107c2f
80103f6e:	e8 1d c4 ff ff       	call   80100390 <panic>
    panic("sleep");
80103f73:	83 ec 0c             	sub    $0xc,%esp
80103f76:	68 29 7c 10 80       	push   $0x80107c29
80103f7b:	e8 10 c4 ff ff       	call   80100390 <panic>

80103f80 <wait>:
{
80103f80:	55                   	push   %ebp
80103f81:	89 e5                	mov    %esp,%ebp
80103f83:	56                   	push   %esi
80103f84:	53                   	push   %ebx
  pushcli();
80103f85:	e8 36 05 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103f8a:	e8 71 f8 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103f8f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103f95:	e8 66 05 00 00       	call   80104500 <popcli>
  acquire(&ptable.lock);
80103f9a:	83 ec 0c             	sub    $0xc,%esp
80103f9d:	68 00 47 11 80       	push   $0x80114700
80103fa2:	e8 e9 05 00 00       	call   80104590 <acquire>
80103fa7:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103faa:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fac:	bb 34 47 11 80       	mov    $0x80114734,%ebx
80103fb1:	eb 13                	jmp    80103fc6 <wait+0x46>
80103fb3:	90                   	nop
80103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fb8:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103fbe:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
80103fc4:	73 1e                	jae    80103fe4 <wait+0x64>
      if(p->parent != curproc)
80103fc6:	39 73 14             	cmp    %esi,0x14(%ebx)
80103fc9:	75 ed                	jne    80103fb8 <wait+0x38>
      if(p->state == ZOMBIE){
80103fcb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fcf:	74 37                	je     80104008 <wait+0x88>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fd1:	81 c3 84 00 00 00    	add    $0x84,%ebx
      havekids = 1;
80103fd7:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fdc:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
80103fe2:	72 e2                	jb     80103fc6 <wait+0x46>
    if(!havekids || curproc->killed){
80103fe4:	85 c0                	test   %eax,%eax
80103fe6:	74 76                	je     8010405e <wait+0xde>
80103fe8:	8b 46 24             	mov    0x24(%esi),%eax
80103feb:	85 c0                	test   %eax,%eax
80103fed:	75 6f                	jne    8010405e <wait+0xde>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103fef:	83 ec 08             	sub    $0x8,%esp
80103ff2:	68 00 47 11 80       	push   $0x80114700
80103ff7:	56                   	push   %esi
80103ff8:	e8 c3 fe ff ff       	call   80103ec0 <sleep>
    havekids = 0;
80103ffd:	83 c4 10             	add    $0x10,%esp
80104000:	eb a8                	jmp    80103faa <wait+0x2a>
80104002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        kfree(p->kstack);
80104008:	83 ec 0c             	sub    $0xc,%esp
8010400b:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
8010400e:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104011:	e8 3a e3 ff ff       	call   80102350 <kfree>
        freevm(p->pgdir);
80104016:	5a                   	pop    %edx
80104017:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
8010401a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104021:	e8 6a 2f 00 00       	call   80106f90 <freevm>
        release(&ptable.lock);
80104026:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
        p->pid = 0;
8010402d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80104034:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
8010403b:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
8010403f:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80104046:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
8010404d:	e8 fe 05 00 00       	call   80104650 <release>
        return pid;
80104052:	83 c4 10             	add    $0x10,%esp
}
80104055:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104058:	89 f0                	mov    %esi,%eax
8010405a:	5b                   	pop    %ebx
8010405b:	5e                   	pop    %esi
8010405c:	5d                   	pop    %ebp
8010405d:	c3                   	ret    
      release(&ptable.lock);
8010405e:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104061:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80104066:	68 00 47 11 80       	push   $0x80114700
8010406b:	e8 e0 05 00 00       	call   80104650 <release>
      return -1;
80104070:	83 c4 10             	add    $0x10,%esp
80104073:	eb e0                	jmp    80104055 <wait+0xd5>
80104075:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104080 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	53                   	push   %ebx
80104084:	83 ec 10             	sub    $0x10,%esp
80104087:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010408a:	68 00 47 11 80       	push   $0x80114700
8010408f:	e8 fc 04 00 00       	call   80104590 <acquire>
80104094:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104097:	b8 34 47 11 80       	mov    $0x80114734,%eax
8010409c:	eb 0e                	jmp    801040ac <wakeup+0x2c>
8010409e:	66 90                	xchg   %ax,%ax
801040a0:	05 84 00 00 00       	add    $0x84,%eax
801040a5:	3d 34 68 11 80       	cmp    $0x80116834,%eax
801040aa:	73 1e                	jae    801040ca <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
801040ac:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040b0:	75 ee                	jne    801040a0 <wakeup+0x20>
801040b2:	3b 58 20             	cmp    0x20(%eax),%ebx
801040b5:	75 e9                	jne    801040a0 <wakeup+0x20>
      p->state = RUNNABLE;
801040b7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040be:	05 84 00 00 00       	add    $0x84,%eax
801040c3:	3d 34 68 11 80       	cmp    $0x80116834,%eax
801040c8:	72 e2                	jb     801040ac <wakeup+0x2c>
  wakeup1(chan);
  release(&ptable.lock);
801040ca:	c7 45 08 00 47 11 80 	movl   $0x80114700,0x8(%ebp)
}
801040d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040d4:	c9                   	leave  
  release(&ptable.lock);
801040d5:	e9 76 05 00 00       	jmp    80104650 <release>
801040da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801040e0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801040e0:	55                   	push   %ebp
801040e1:	89 e5                	mov    %esp,%ebp
801040e3:	53                   	push   %ebx
801040e4:	83 ec 10             	sub    $0x10,%esp
801040e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801040ea:	68 00 47 11 80       	push   $0x80114700
801040ef:	e8 9c 04 00 00       	call   80104590 <acquire>
801040f4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040f7:	b8 34 47 11 80       	mov    $0x80114734,%eax
801040fc:	eb 0e                	jmp    8010410c <kill+0x2c>
801040fe:	66 90                	xchg   %ax,%ax
80104100:	05 84 00 00 00       	add    $0x84,%eax
80104105:	3d 34 68 11 80       	cmp    $0x80116834,%eax
8010410a:	73 34                	jae    80104140 <kill+0x60>
    if(p->pid == pid){
8010410c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010410f:	75 ef                	jne    80104100 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104111:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104115:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010411c:	75 07                	jne    80104125 <kill+0x45>
        p->state = RUNNABLE;
8010411e:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104125:	83 ec 0c             	sub    $0xc,%esp
80104128:	68 00 47 11 80       	push   $0x80114700
8010412d:	e8 1e 05 00 00       	call   80104650 <release>
      return 0;
80104132:	83 c4 10             	add    $0x10,%esp
80104135:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104137:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010413a:	c9                   	leave  
8010413b:	c3                   	ret    
8010413c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104140:	83 ec 0c             	sub    $0xc,%esp
80104143:	68 00 47 11 80       	push   $0x80114700
80104148:	e8 03 05 00 00       	call   80104650 <release>
  return -1;
8010414d:	83 c4 10             	add    $0x10,%esp
80104150:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104155:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104158:	c9                   	leave  
80104159:	c3                   	ret    
8010415a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104160 <settickets>:

int 
settickets(int tickets){
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	56                   	push   %esi
80104164:	53                   	push   %ebx
80104165:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tickets < 1)
80104168:	85 f6                	test   %esi,%esi
8010416a:	7e 54                	jle    801041c0 <settickets+0x60>
  pushcli();
8010416c:	e8 4f 03 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80104171:	e8 8a f6 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80104176:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010417c:	e8 7f 03 00 00       	call   80104500 <popcli>
    return -1;
  struct proc *proc = myproc();
  proc->tickets = tickets;
  acquire(&ptable.lock);
80104181:	83 ec 0c             	sub    $0xc,%esp
  proc->tickets = tickets;
80104184:	89 73 7c             	mov    %esi,0x7c(%ebx)
  acquire(&ptable.lock);
80104187:	68 00 47 11 80       	push   $0x80114700
  ptable.proc[proc-ptable.proc].tickets = tickets;
8010418c:	81 eb 34 47 11 80    	sub    $0x80114734,%ebx
80104192:	83 e3 fc             	and    $0xfffffffc,%ebx
  acquire(&ptable.lock);
80104195:	e8 f6 03 00 00       	call   80104590 <acquire>
  release(&ptable.lock);
8010419a:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
  ptable.proc[proc-ptable.proc].tickets = tickets;
801041a1:	89 b3 b0 47 11 80    	mov    %esi,-0x7feeb850(%ebx)
  release(&ptable.lock);
801041a7:	e8 a4 04 00 00       	call   80104650 <release>
  //cprintf("tickets is %d", proc->tickets);
  return 0;
801041ac:	83 c4 10             	add    $0x10,%esp
801041af:	31 c0                	xor    %eax,%eax
}
801041b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041b4:	5b                   	pop    %ebx
801041b5:	5e                   	pop    %esi
801041b6:	5d                   	pop    %ebp
801041b7:	c3                   	ret    
801041b8:	90                   	nop
801041b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801041c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801041c5:	eb ea                	jmp    801041b1 <settickets+0x51>
801041c7:	89 f6                	mov    %esi,%esi
801041c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041d0 <getpinfo>:

int
getpinfo(struct pstat* ps) {
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	83 ec 14             	sub    $0x14,%esp
  int i = 0;
  struct proc *p;
  acquire(&ptable.lock);
801041d6:	68 00 47 11 80       	push   $0x80114700
801041db:	e8 b0 03 00 00       	call   80104590 <acquire>
801041e0:	8b 55 08             	mov    0x8(%ebp),%edx
801041e3:	83 c4 10             	add    $0x10,%esp
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801041e6:	b8 34 47 11 80       	mov    $0x80114734,%eax
801041eb:	90                   	nop
801041ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ps->pid[i] = p->pid;
801041f0:	8b 48 10             	mov    0x10(%eax),%ecx
801041f3:	89 8a 00 02 00 00    	mov    %ecx,0x200(%edx)
    ps->inuse[i] = p->state != UNUSED;
801041f9:	31 c9                	xor    %ecx,%ecx
801041fb:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
801041ff:	0f 95 c1             	setne  %cl
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104202:	05 84 00 00 00       	add    $0x84,%eax
80104207:	83 c2 04             	add    $0x4,%edx
    ps->inuse[i] = p->state != UNUSED;
8010420a:	89 4a fc             	mov    %ecx,-0x4(%edx)
    ps->tickets[i] = p->tickets;
8010420d:	8b 48 f8             	mov    -0x8(%eax),%ecx
80104210:	89 8a fc 00 00 00    	mov    %ecx,0xfc(%edx)
    ps->ticks[i] = p->ticks;
80104216:	8b 48 fc             	mov    -0x4(%eax),%ecx
80104219:	89 8a fc 02 00 00    	mov    %ecx,0x2fc(%edx)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010421f:	3d 34 68 11 80       	cmp    $0x80116834,%eax
80104224:	72 ca                	jb     801041f0 <getpinfo+0x20>
    i++;
  }
  release(&ptable.lock);
80104226:	83 ec 0c             	sub    $0xc,%esp
80104229:	68 00 47 11 80       	push   $0x80114700
8010422e:	e8 1d 04 00 00       	call   80104650 <release>
  return 0;
}
80104233:	31 c0                	xor    %eax,%eax
80104235:	c9                   	leave  
80104236:	c3                   	ret    
80104237:	89 f6                	mov    %esi,%esi
80104239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104240 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	57                   	push   %edi
80104244:	56                   	push   %esi
80104245:	53                   	push   %ebx
80104246:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104249:	bb 34 47 11 80       	mov    $0x80114734,%ebx
{
8010424e:	83 ec 3c             	sub    $0x3c,%esp
80104251:	eb 27                	jmp    8010427a <procdump+0x3a>
80104253:	90                   	nop
80104254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    // cprintf(" %d", p->tickets);
    // cprintf(" %d", winning_ticket);
    // cprintf(" %d", total_tickets);
    cprintf("\n");
80104258:	83 ec 0c             	sub    $0xc,%esp
8010425b:	68 cf 7f 10 80       	push   $0x80107fcf
80104260:	e8 fb c3 ff ff       	call   80100660 <cprintf>
80104265:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104268:	81 c3 84 00 00 00    	add    $0x84,%ebx
8010426e:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
80104274:	0f 83 96 00 00 00    	jae    80104310 <procdump+0xd0>
    if(p->state == UNUSED)
8010427a:	8b 43 0c             	mov    0xc(%ebx),%eax
8010427d:	85 c0                	test   %eax,%eax
8010427f:	74 e7                	je     80104268 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104281:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
80104284:	ba 40 7c 10 80       	mov    $0x80107c40,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104289:	77 11                	ja     8010429c <procdump+0x5c>
8010428b:	8b 14 85 a4 7c 10 80 	mov    -0x7fef835c(,%eax,4),%edx
      state = "???";
80104292:	b8 40 7c 10 80       	mov    $0x80107c40,%eax
80104297:	85 d2                	test   %edx,%edx
80104299:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %sc%d", p->pid, state, p->name, p->tickets);
8010429c:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010429f:	83 ec 0c             	sub    $0xc,%esp
801042a2:	ff 73 7c             	pushl  0x7c(%ebx)
801042a5:	50                   	push   %eax
801042a6:	52                   	push   %edx
801042a7:	ff 73 10             	pushl  0x10(%ebx)
801042aa:	68 44 7c 10 80       	push   $0x80107c44
801042af:	e8 ac c3 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
801042b4:	83 c4 20             	add    $0x20,%esp
801042b7:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
801042bb:	75 9b                	jne    80104258 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801042bd:	8d 45 c0             	lea    -0x40(%ebp),%eax
801042c0:	83 ec 08             	sub    $0x8,%esp
801042c3:	8d 7d c0             	lea    -0x40(%ebp),%edi
801042c6:	50                   	push   %eax
801042c7:	8b 43 1c             	mov    0x1c(%ebx),%eax
801042ca:	8b 40 0c             	mov    0xc(%eax),%eax
801042cd:	83 c0 08             	add    $0x8,%eax
801042d0:	50                   	push   %eax
801042d1:	e8 9a 01 00 00       	call   80104470 <getcallerpcs>
801042d6:	83 c4 10             	add    $0x10,%esp
801042d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
801042e0:	8b 17                	mov    (%edi),%edx
801042e2:	85 d2                	test   %edx,%edx
801042e4:	0f 84 6e ff ff ff    	je     80104258 <procdump+0x18>
        cprintf(" %p", pc[i]);
801042ea:	83 ec 08             	sub    $0x8,%esp
801042ed:	83 c7 04             	add    $0x4,%edi
801042f0:	52                   	push   %edx
801042f1:	68 81 76 10 80       	push   $0x80107681
801042f6:	e8 65 c3 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
801042fb:	83 c4 10             	add    $0x10,%esp
801042fe:	39 fe                	cmp    %edi,%esi
80104300:	75 de                	jne    801042e0 <procdump+0xa0>
80104302:	e9 51 ff ff ff       	jmp    80104258 <procdump+0x18>
80104307:	89 f6                	mov    %esi,%esi
80104309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
}
80104310:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104313:	5b                   	pop    %ebx
80104314:	5e                   	pop    %esi
80104315:	5f                   	pop    %edi
80104316:	5d                   	pop    %ebp
80104317:	c3                   	ret    
80104318:	66 90                	xchg   %ax,%ax
8010431a:	66 90                	xchg   %ax,%ax
8010431c:	66 90                	xchg   %ax,%ax
8010431e:	66 90                	xchg   %ax,%ax

80104320 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	53                   	push   %ebx
80104324:	83 ec 0c             	sub    $0xc,%esp
80104327:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010432a:	68 bc 7c 10 80       	push   $0x80107cbc
8010432f:	8d 43 04             	lea    0x4(%ebx),%eax
80104332:	50                   	push   %eax
80104333:	e8 18 01 00 00       	call   80104450 <initlock>
  lk->name = name;
80104338:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010433b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104341:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104344:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010434b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010434e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104351:	c9                   	leave  
80104352:	c3                   	ret    
80104353:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104360 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104360:	55                   	push   %ebp
80104361:	89 e5                	mov    %esp,%ebp
80104363:	56                   	push   %esi
80104364:	53                   	push   %ebx
80104365:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104368:	83 ec 0c             	sub    $0xc,%esp
8010436b:	8d 73 04             	lea    0x4(%ebx),%esi
8010436e:	56                   	push   %esi
8010436f:	e8 1c 02 00 00       	call   80104590 <acquire>
  while (lk->locked) {
80104374:	8b 13                	mov    (%ebx),%edx
80104376:	83 c4 10             	add    $0x10,%esp
80104379:	85 d2                	test   %edx,%edx
8010437b:	74 16                	je     80104393 <acquiresleep+0x33>
8010437d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104380:	83 ec 08             	sub    $0x8,%esp
80104383:	56                   	push   %esi
80104384:	53                   	push   %ebx
80104385:	e8 36 fb ff ff       	call   80103ec0 <sleep>
  while (lk->locked) {
8010438a:	8b 03                	mov    (%ebx),%eax
8010438c:	83 c4 10             	add    $0x10,%esp
8010438f:	85 c0                	test   %eax,%eax
80104391:	75 ed                	jne    80104380 <acquiresleep+0x20>
  }
  lk->locked = 1;
80104393:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104399:	e8 02 f5 ff ff       	call   801038a0 <myproc>
8010439e:	8b 40 10             	mov    0x10(%eax),%eax
801043a1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801043a4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801043a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043aa:	5b                   	pop    %ebx
801043ab:	5e                   	pop    %esi
801043ac:	5d                   	pop    %ebp
  release(&lk->lk);
801043ad:	e9 9e 02 00 00       	jmp    80104650 <release>
801043b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043c0 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
801043c0:	55                   	push   %ebp
801043c1:	89 e5                	mov    %esp,%ebp
801043c3:	56                   	push   %esi
801043c4:	53                   	push   %ebx
801043c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801043c8:	83 ec 0c             	sub    $0xc,%esp
801043cb:	8d 73 04             	lea    0x4(%ebx),%esi
801043ce:	56                   	push   %esi
801043cf:	e8 bc 01 00 00       	call   80104590 <acquire>
  lk->locked = 0;
801043d4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801043da:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801043e1:	89 1c 24             	mov    %ebx,(%esp)
801043e4:	e8 97 fc ff ff       	call   80104080 <wakeup>
  release(&lk->lk);
801043e9:	89 75 08             	mov    %esi,0x8(%ebp)
801043ec:	83 c4 10             	add    $0x10,%esp
}
801043ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043f2:	5b                   	pop    %ebx
801043f3:	5e                   	pop    %esi
801043f4:	5d                   	pop    %ebp
  release(&lk->lk);
801043f5:	e9 56 02 00 00       	jmp    80104650 <release>
801043fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104400 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	57                   	push   %edi
80104404:	56                   	push   %esi
80104405:	53                   	push   %ebx
80104406:	31 ff                	xor    %edi,%edi
80104408:	83 ec 18             	sub    $0x18,%esp
8010440b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010440e:	8d 73 04             	lea    0x4(%ebx),%esi
80104411:	56                   	push   %esi
80104412:	e8 79 01 00 00       	call   80104590 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104417:	8b 03                	mov    (%ebx),%eax
80104419:	83 c4 10             	add    $0x10,%esp
8010441c:	85 c0                	test   %eax,%eax
8010441e:	74 13                	je     80104433 <holdingsleep+0x33>
80104420:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104423:	e8 78 f4 ff ff       	call   801038a0 <myproc>
80104428:	39 58 10             	cmp    %ebx,0x10(%eax)
8010442b:	0f 94 c0             	sete   %al
8010442e:	0f b6 c0             	movzbl %al,%eax
80104431:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
80104433:	83 ec 0c             	sub    $0xc,%esp
80104436:	56                   	push   %esi
80104437:	e8 14 02 00 00       	call   80104650 <release>
  return r;
}
8010443c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010443f:	89 f8                	mov    %edi,%eax
80104441:	5b                   	pop    %ebx
80104442:	5e                   	pop    %esi
80104443:	5f                   	pop    %edi
80104444:	5d                   	pop    %ebp
80104445:	c3                   	ret    
80104446:	66 90                	xchg   %ax,%ax
80104448:	66 90                	xchg   %ax,%ax
8010444a:	66 90                	xchg   %ax,%ax
8010444c:	66 90                	xchg   %ax,%ax
8010444e:	66 90                	xchg   %ax,%ax

80104450 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104456:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104459:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010445f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80104462:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104469:	5d                   	pop    %ebp
8010446a:	c3                   	ret    
8010446b:	90                   	nop
8010446c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104470 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104470:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104471:	31 d2                	xor    %edx,%edx
{
80104473:	89 e5                	mov    %esp,%ebp
80104475:	53                   	push   %ebx
  ebp = (uint*)v - 2;
80104476:	8b 45 08             	mov    0x8(%ebp),%eax
{
80104479:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
8010447c:	83 e8 08             	sub    $0x8,%eax
8010447f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104480:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104486:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010448c:	77 1a                	ja     801044a8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010448e:	8b 58 04             	mov    0x4(%eax),%ebx
80104491:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
80104494:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
80104497:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104499:	83 fa 0a             	cmp    $0xa,%edx
8010449c:	75 e2                	jne    80104480 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010449e:	5b                   	pop    %ebx
8010449f:	5d                   	pop    %ebp
801044a0:	c3                   	ret    
801044a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044a8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801044ab:	83 c1 28             	add    $0x28,%ecx
801044ae:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
801044b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801044b6:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
801044b9:	39 c1                	cmp    %eax,%ecx
801044bb:	75 f3                	jne    801044b0 <getcallerpcs+0x40>
}
801044bd:	5b                   	pop    %ebx
801044be:	5d                   	pop    %ebp
801044bf:	c3                   	ret    

801044c0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801044c0:	55                   	push   %ebp
801044c1:	89 e5                	mov    %esp,%ebp
801044c3:	53                   	push   %ebx
801044c4:	83 ec 04             	sub    $0x4,%esp
801044c7:	9c                   	pushf  
801044c8:	5b                   	pop    %ebx
  asm volatile("cli");
801044c9:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
801044ca:	e8 31 f3 ff ff       	call   80103800 <mycpu>
801044cf:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801044d5:	85 c0                	test   %eax,%eax
801044d7:	75 11                	jne    801044ea <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
801044d9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801044df:	e8 1c f3 ff ff       	call   80103800 <mycpu>
801044e4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
801044ea:	e8 11 f3 ff ff       	call   80103800 <mycpu>
801044ef:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801044f6:	83 c4 04             	add    $0x4,%esp
801044f9:	5b                   	pop    %ebx
801044fa:	5d                   	pop    %ebp
801044fb:	c3                   	ret    
801044fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104500 <popcli>:

void
popcli(void)
{
80104500:	55                   	push   %ebp
80104501:	89 e5                	mov    %esp,%ebp
80104503:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104506:	9c                   	pushf  
80104507:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104508:	f6 c4 02             	test   $0x2,%ah
8010450b:	75 35                	jne    80104542 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010450d:	e8 ee f2 ff ff       	call   80103800 <mycpu>
80104512:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104519:	78 34                	js     8010454f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010451b:	e8 e0 f2 ff ff       	call   80103800 <mycpu>
80104520:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104526:	85 d2                	test   %edx,%edx
80104528:	74 06                	je     80104530 <popcli+0x30>
    sti();
}
8010452a:	c9                   	leave  
8010452b:	c3                   	ret    
8010452c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104530:	e8 cb f2 ff ff       	call   80103800 <mycpu>
80104535:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010453b:	85 c0                	test   %eax,%eax
8010453d:	74 eb                	je     8010452a <popcli+0x2a>
  asm volatile("sti");
8010453f:	fb                   	sti    
}
80104540:	c9                   	leave  
80104541:	c3                   	ret    
    panic("popcli - interruptible");
80104542:	83 ec 0c             	sub    $0xc,%esp
80104545:	68 c7 7c 10 80       	push   $0x80107cc7
8010454a:	e8 41 be ff ff       	call   80100390 <panic>
    panic("popcli");
8010454f:	83 ec 0c             	sub    $0xc,%esp
80104552:	68 de 7c 10 80       	push   $0x80107cde
80104557:	e8 34 be ff ff       	call   80100390 <panic>
8010455c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104560 <holding>:
{
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	56                   	push   %esi
80104564:	53                   	push   %ebx
80104565:	8b 75 08             	mov    0x8(%ebp),%esi
80104568:	31 db                	xor    %ebx,%ebx
  pushcli();
8010456a:	e8 51 ff ff ff       	call   801044c0 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010456f:	8b 06                	mov    (%esi),%eax
80104571:	85 c0                	test   %eax,%eax
80104573:	74 10                	je     80104585 <holding+0x25>
80104575:	8b 5e 08             	mov    0x8(%esi),%ebx
80104578:	e8 83 f2 ff ff       	call   80103800 <mycpu>
8010457d:	39 c3                	cmp    %eax,%ebx
8010457f:	0f 94 c3             	sete   %bl
80104582:	0f b6 db             	movzbl %bl,%ebx
  popcli();
80104585:	e8 76 ff ff ff       	call   80104500 <popcli>
}
8010458a:	89 d8                	mov    %ebx,%eax
8010458c:	5b                   	pop    %ebx
8010458d:	5e                   	pop    %esi
8010458e:	5d                   	pop    %ebp
8010458f:	c3                   	ret    

80104590 <acquire>:
{
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	56                   	push   %esi
80104594:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
80104595:	e8 26 ff ff ff       	call   801044c0 <pushcli>
  if(holding(lk))
8010459a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010459d:	83 ec 0c             	sub    $0xc,%esp
801045a0:	53                   	push   %ebx
801045a1:	e8 ba ff ff ff       	call   80104560 <holding>
801045a6:	83 c4 10             	add    $0x10,%esp
801045a9:	85 c0                	test   %eax,%eax
801045ab:	0f 85 83 00 00 00    	jne    80104634 <acquire+0xa4>
801045b1:	89 c6                	mov    %eax,%esi
  asm volatile("lock; xchgl %0, %1" :
801045b3:	ba 01 00 00 00       	mov    $0x1,%edx
801045b8:	eb 09                	jmp    801045c3 <acquire+0x33>
801045ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045c3:	89 d0                	mov    %edx,%eax
801045c5:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
801045c8:	85 c0                	test   %eax,%eax
801045ca:	75 f4                	jne    801045c0 <acquire+0x30>
  __sync_synchronize();
801045cc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
801045d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045d4:	e8 27 f2 ff ff       	call   80103800 <mycpu>
  getcallerpcs(&lk, lk->pcs);
801045d9:	8d 53 0c             	lea    0xc(%ebx),%edx
  lk->cpu = mycpu();
801045dc:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
801045df:	89 e8                	mov    %ebp,%eax
801045e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801045e8:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
801045ee:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
801045f4:	77 1a                	ja     80104610 <acquire+0x80>
    pcs[i] = ebp[1];     // saved %eip
801045f6:	8b 48 04             	mov    0x4(%eax),%ecx
801045f9:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
  for(i = 0; i < 10; i++){
801045fc:	83 c6 01             	add    $0x1,%esi
    ebp = (uint*)ebp[0]; // saved %ebp
801045ff:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104601:	83 fe 0a             	cmp    $0xa,%esi
80104604:	75 e2                	jne    801045e8 <acquire+0x58>
}
80104606:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104609:	5b                   	pop    %ebx
8010460a:	5e                   	pop    %esi
8010460b:	5d                   	pop    %ebp
8010460c:	c3                   	ret    
8010460d:	8d 76 00             	lea    0x0(%esi),%esi
80104610:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104613:	83 c2 28             	add    $0x28,%edx
80104616:	8d 76 00             	lea    0x0(%esi),%esi
80104619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    pcs[i] = 0;
80104620:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104626:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104629:	39 d0                	cmp    %edx,%eax
8010462b:	75 f3                	jne    80104620 <acquire+0x90>
}
8010462d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104630:	5b                   	pop    %ebx
80104631:	5e                   	pop    %esi
80104632:	5d                   	pop    %ebp
80104633:	c3                   	ret    
    panic("acquire");
80104634:	83 ec 0c             	sub    $0xc,%esp
80104637:	68 e5 7c 10 80       	push   $0x80107ce5
8010463c:	e8 4f bd ff ff       	call   80100390 <panic>
80104641:	eb 0d                	jmp    80104650 <release>
80104643:	90                   	nop
80104644:	90                   	nop
80104645:	90                   	nop
80104646:	90                   	nop
80104647:	90                   	nop
80104648:	90                   	nop
80104649:	90                   	nop
8010464a:	90                   	nop
8010464b:	90                   	nop
8010464c:	90                   	nop
8010464d:	90                   	nop
8010464e:	90                   	nop
8010464f:	90                   	nop

80104650 <release>:
{
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	53                   	push   %ebx
80104654:	83 ec 10             	sub    $0x10,%esp
80104657:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
8010465a:	53                   	push   %ebx
8010465b:	e8 00 ff ff ff       	call   80104560 <holding>
80104660:	83 c4 10             	add    $0x10,%esp
80104663:	85 c0                	test   %eax,%eax
80104665:	74 22                	je     80104689 <release+0x39>
  lk->pcs[0] = 0;
80104667:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
8010466e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80104675:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010467a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
80104680:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104683:	c9                   	leave  
  popcli();
80104684:	e9 77 fe ff ff       	jmp    80104500 <popcli>
    panic("release");
80104689:	83 ec 0c             	sub    $0xc,%esp
8010468c:	68 ed 7c 10 80       	push   $0x80107ced
80104691:	e8 fa bc ff ff       	call   80100390 <panic>
80104696:	66 90                	xchg   %ax,%ax
80104698:	66 90                	xchg   %ax,%ax
8010469a:	66 90                	xchg   %ax,%ax
8010469c:	66 90                	xchg   %ax,%ax
8010469e:	66 90                	xchg   %ax,%ax

801046a0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	57                   	push   %edi
801046a4:	53                   	push   %ebx
801046a5:	8b 55 08             	mov    0x8(%ebp),%edx
801046a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
801046ab:	f6 c2 03             	test   $0x3,%dl
801046ae:	75 05                	jne    801046b5 <memset+0x15>
801046b0:	f6 c1 03             	test   $0x3,%cl
801046b3:	74 13                	je     801046c8 <memset+0x28>
  asm volatile("cld; rep stosb" :
801046b5:	89 d7                	mov    %edx,%edi
801046b7:	8b 45 0c             	mov    0xc(%ebp),%eax
801046ba:	fc                   	cld    
801046bb:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
801046bd:	5b                   	pop    %ebx
801046be:	89 d0                	mov    %edx,%eax
801046c0:	5f                   	pop    %edi
801046c1:	5d                   	pop    %ebp
801046c2:	c3                   	ret    
801046c3:	90                   	nop
801046c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
801046c8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
801046cc:	c1 e9 02             	shr    $0x2,%ecx
801046cf:	89 f8                	mov    %edi,%eax
801046d1:	89 fb                	mov    %edi,%ebx
801046d3:	c1 e0 18             	shl    $0x18,%eax
801046d6:	c1 e3 10             	shl    $0x10,%ebx
801046d9:	09 d8                	or     %ebx,%eax
801046db:	09 f8                	or     %edi,%eax
801046dd:	c1 e7 08             	shl    $0x8,%edi
801046e0:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
801046e2:	89 d7                	mov    %edx,%edi
801046e4:	fc                   	cld    
801046e5:	f3 ab                	rep stos %eax,%es:(%edi)
}
801046e7:	5b                   	pop    %ebx
801046e8:	89 d0                	mov    %edx,%eax
801046ea:	5f                   	pop    %edi
801046eb:	5d                   	pop    %ebp
801046ec:	c3                   	ret    
801046ed:	8d 76 00             	lea    0x0(%esi),%esi

801046f0 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
801046f3:	57                   	push   %edi
801046f4:	56                   	push   %esi
801046f5:	53                   	push   %ebx
801046f6:	8b 5d 10             	mov    0x10(%ebp),%ebx
801046f9:	8b 75 08             	mov    0x8(%ebp),%esi
801046fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801046ff:	85 db                	test   %ebx,%ebx
80104701:	74 29                	je     8010472c <memcmp+0x3c>
    if(*s1 != *s2)
80104703:	0f b6 16             	movzbl (%esi),%edx
80104706:	0f b6 0f             	movzbl (%edi),%ecx
80104709:	38 d1                	cmp    %dl,%cl
8010470b:	75 2b                	jne    80104738 <memcmp+0x48>
8010470d:	b8 01 00 00 00       	mov    $0x1,%eax
80104712:	eb 14                	jmp    80104728 <memcmp+0x38>
80104714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104718:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010471c:	83 c0 01             	add    $0x1,%eax
8010471f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104724:	38 ca                	cmp    %cl,%dl
80104726:	75 10                	jne    80104738 <memcmp+0x48>
  while(n-- > 0){
80104728:	39 d8                	cmp    %ebx,%eax
8010472a:	75 ec                	jne    80104718 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010472c:	5b                   	pop    %ebx
  return 0;
8010472d:	31 c0                	xor    %eax,%eax
}
8010472f:	5e                   	pop    %esi
80104730:	5f                   	pop    %edi
80104731:	5d                   	pop    %ebp
80104732:	c3                   	ret    
80104733:	90                   	nop
80104734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
80104738:	0f b6 c2             	movzbl %dl,%eax
}
8010473b:	5b                   	pop    %ebx
      return *s1 - *s2;
8010473c:	29 c8                	sub    %ecx,%eax
}
8010473e:	5e                   	pop    %esi
8010473f:	5f                   	pop    %edi
80104740:	5d                   	pop    %ebp
80104741:	c3                   	ret    
80104742:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104750 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104750:	55                   	push   %ebp
80104751:	89 e5                	mov    %esp,%ebp
80104753:	56                   	push   %esi
80104754:	53                   	push   %ebx
80104755:	8b 45 08             	mov    0x8(%ebp),%eax
80104758:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010475b:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010475e:	39 c3                	cmp    %eax,%ebx
80104760:	73 26                	jae    80104788 <memmove+0x38>
80104762:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80104765:	39 c8                	cmp    %ecx,%eax
80104767:	73 1f                	jae    80104788 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
80104769:	85 f6                	test   %esi,%esi
8010476b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010476e:	74 0f                	je     8010477f <memmove+0x2f>
      *--d = *--s;
80104770:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104774:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
80104777:	83 ea 01             	sub    $0x1,%edx
8010477a:	83 fa ff             	cmp    $0xffffffff,%edx
8010477d:	75 f1                	jne    80104770 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
8010477f:	5b                   	pop    %ebx
80104780:	5e                   	pop    %esi
80104781:	5d                   	pop    %ebp
80104782:	c3                   	ret    
80104783:	90                   	nop
80104784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
80104788:	31 d2                	xor    %edx,%edx
8010478a:	85 f6                	test   %esi,%esi
8010478c:	74 f1                	je     8010477f <memmove+0x2f>
8010478e:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104790:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104794:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104797:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
8010479a:	39 d6                	cmp    %edx,%esi
8010479c:	75 f2                	jne    80104790 <memmove+0x40>
}
8010479e:	5b                   	pop    %ebx
8010479f:	5e                   	pop    %esi
801047a0:	5d                   	pop    %ebp
801047a1:	c3                   	ret    
801047a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047b0 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
801047b3:	5d                   	pop    %ebp
  return memmove(dst, src, n);
801047b4:	eb 9a                	jmp    80104750 <memmove>
801047b6:	8d 76 00             	lea    0x0(%esi),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047c0 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	57                   	push   %edi
801047c4:	56                   	push   %esi
801047c5:	8b 7d 10             	mov    0x10(%ebp),%edi
801047c8:	53                   	push   %ebx
801047c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801047cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
801047cf:	85 ff                	test   %edi,%edi
801047d1:	74 2f                	je     80104802 <strncmp+0x42>
801047d3:	0f b6 01             	movzbl (%ecx),%eax
801047d6:	0f b6 1e             	movzbl (%esi),%ebx
801047d9:	84 c0                	test   %al,%al
801047db:	74 37                	je     80104814 <strncmp+0x54>
801047dd:	38 c3                	cmp    %al,%bl
801047df:	75 33                	jne    80104814 <strncmp+0x54>
801047e1:	01 f7                	add    %esi,%edi
801047e3:	eb 13                	jmp    801047f8 <strncmp+0x38>
801047e5:	8d 76 00             	lea    0x0(%esi),%esi
801047e8:	0f b6 01             	movzbl (%ecx),%eax
801047eb:	84 c0                	test   %al,%al
801047ed:	74 21                	je     80104810 <strncmp+0x50>
801047ef:	0f b6 1a             	movzbl (%edx),%ebx
801047f2:	89 d6                	mov    %edx,%esi
801047f4:	38 d8                	cmp    %bl,%al
801047f6:	75 1c                	jne    80104814 <strncmp+0x54>
    n--, p++, q++;
801047f8:	8d 56 01             	lea    0x1(%esi),%edx
801047fb:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
801047fe:	39 fa                	cmp    %edi,%edx
80104800:	75 e6                	jne    801047e8 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104802:	5b                   	pop    %ebx
    return 0;
80104803:	31 c0                	xor    %eax,%eax
}
80104805:	5e                   	pop    %esi
80104806:	5f                   	pop    %edi
80104807:	5d                   	pop    %ebp
80104808:	c3                   	ret    
80104809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104810:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104814:	29 d8                	sub    %ebx,%eax
}
80104816:	5b                   	pop    %ebx
80104817:	5e                   	pop    %esi
80104818:	5f                   	pop    %edi
80104819:	5d                   	pop    %ebp
8010481a:	c3                   	ret    
8010481b:	90                   	nop
8010481c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104820 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	56                   	push   %esi
80104824:	53                   	push   %ebx
80104825:	8b 45 08             	mov    0x8(%ebp),%eax
80104828:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010482b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010482e:	89 c2                	mov    %eax,%edx
80104830:	eb 19                	jmp    8010484b <strncpy+0x2b>
80104832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104838:	83 c3 01             	add    $0x1,%ebx
8010483b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010483f:	83 c2 01             	add    $0x1,%edx
80104842:	84 c9                	test   %cl,%cl
80104844:	88 4a ff             	mov    %cl,-0x1(%edx)
80104847:	74 09                	je     80104852 <strncpy+0x32>
80104849:	89 f1                	mov    %esi,%ecx
8010484b:	85 c9                	test   %ecx,%ecx
8010484d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104850:	7f e6                	jg     80104838 <strncpy+0x18>
    ;
  while(n-- > 0)
80104852:	31 c9                	xor    %ecx,%ecx
80104854:	85 f6                	test   %esi,%esi
80104856:	7e 17                	jle    8010486f <strncpy+0x4f>
80104858:	90                   	nop
80104859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104860:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104864:	89 f3                	mov    %esi,%ebx
80104866:	83 c1 01             	add    $0x1,%ecx
80104869:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
8010486b:	85 db                	test   %ebx,%ebx
8010486d:	7f f1                	jg     80104860 <strncpy+0x40>
  return os;
}
8010486f:	5b                   	pop    %ebx
80104870:	5e                   	pop    %esi
80104871:	5d                   	pop    %ebp
80104872:	c3                   	ret    
80104873:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104880 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104880:	55                   	push   %ebp
80104881:	89 e5                	mov    %esp,%ebp
80104883:	56                   	push   %esi
80104884:	53                   	push   %ebx
80104885:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104888:	8b 45 08             	mov    0x8(%ebp),%eax
8010488b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010488e:	85 c9                	test   %ecx,%ecx
80104890:	7e 26                	jle    801048b8 <safestrcpy+0x38>
80104892:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104896:	89 c1                	mov    %eax,%ecx
80104898:	eb 17                	jmp    801048b1 <safestrcpy+0x31>
8010489a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
801048a0:	83 c2 01             	add    $0x1,%edx
801048a3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801048a7:	83 c1 01             	add    $0x1,%ecx
801048aa:	84 db                	test   %bl,%bl
801048ac:	88 59 ff             	mov    %bl,-0x1(%ecx)
801048af:	74 04                	je     801048b5 <safestrcpy+0x35>
801048b1:	39 f2                	cmp    %esi,%edx
801048b3:	75 eb                	jne    801048a0 <safestrcpy+0x20>
    ;
  *s = 0;
801048b5:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
801048b8:	5b                   	pop    %ebx
801048b9:	5e                   	pop    %esi
801048ba:	5d                   	pop    %ebp
801048bb:	c3                   	ret    
801048bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801048c0 <strlen>:

int
strlen(const char *s)
{
801048c0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
801048c1:	31 c0                	xor    %eax,%eax
{
801048c3:	89 e5                	mov    %esp,%ebp
801048c5:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
801048c8:	80 3a 00             	cmpb   $0x0,(%edx)
801048cb:	74 0c                	je     801048d9 <strlen+0x19>
801048cd:	8d 76 00             	lea    0x0(%esi),%esi
801048d0:	83 c0 01             	add    $0x1,%eax
801048d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801048d7:	75 f7                	jne    801048d0 <strlen+0x10>
    ;
  return n;
}
801048d9:	5d                   	pop    %ebp
801048da:	c3                   	ret    

801048db <swtch>:
801048db:	8b 44 24 04          	mov    0x4(%esp),%eax
801048df:	8b 54 24 08          	mov    0x8(%esp),%edx
801048e3:	55                   	push   %ebp
801048e4:	53                   	push   %ebx
801048e5:	56                   	push   %esi
801048e6:	57                   	push   %edi
801048e7:	89 20                	mov    %esp,(%eax)
801048e9:	89 d4                	mov    %edx,%esp
801048eb:	5f                   	pop    %edi
801048ec:	5e                   	pop    %esi
801048ed:	5b                   	pop    %ebx
801048ee:	5d                   	pop    %ebp
801048ef:	c3                   	ret    

801048f0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	53                   	push   %ebx
801048f4:	83 ec 04             	sub    $0x4,%esp
801048f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
801048fa:	e8 a1 ef ff ff       	call   801038a0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801048ff:	8b 00                	mov    (%eax),%eax
80104901:	39 d8                	cmp    %ebx,%eax
80104903:	76 1b                	jbe    80104920 <fetchint+0x30>
80104905:	8d 53 04             	lea    0x4(%ebx),%edx
80104908:	39 d0                	cmp    %edx,%eax
8010490a:	72 14                	jb     80104920 <fetchint+0x30>
    return -1;
  
  *ip = *(int*)(addr);
8010490c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010490f:	8b 13                	mov    (%ebx),%edx
80104911:	89 10                	mov    %edx,(%eax)
  return 0;
80104913:	31 c0                	xor    %eax,%eax
}
80104915:	83 c4 04             	add    $0x4,%esp
80104918:	5b                   	pop    %ebx
80104919:	5d                   	pop    %ebp
8010491a:	c3                   	ret    
8010491b:	90                   	nop
8010491c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104920:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104925:	eb ee                	jmp    80104915 <fetchint+0x25>
80104927:	89 f6                	mov    %esi,%esi
80104929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104930 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104930:	55                   	push   %ebp
80104931:	89 e5                	mov    %esp,%ebp
80104933:	53                   	push   %ebx
80104934:	83 ec 04             	sub    $0x4,%esp
80104937:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010493a:	e8 61 ef ff ff       	call   801038a0 <myproc>

  if(addr >= curproc->sz)
8010493f:	39 18                	cmp    %ebx,(%eax)
80104941:	76 29                	jbe    8010496c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104943:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104946:	89 da                	mov    %ebx,%edx
80104948:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010494a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010494c:	39 c3                	cmp    %eax,%ebx
8010494e:	73 1c                	jae    8010496c <fetchstr+0x3c>
    if(*s == 0)
80104950:	80 3b 00             	cmpb   $0x0,(%ebx)
80104953:	75 10                	jne    80104965 <fetchstr+0x35>
80104955:	eb 39                	jmp    80104990 <fetchstr+0x60>
80104957:	89 f6                	mov    %esi,%esi
80104959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104960:	80 3a 00             	cmpb   $0x0,(%edx)
80104963:	74 1b                	je     80104980 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
80104965:	83 c2 01             	add    $0x1,%edx
80104968:	39 d0                	cmp    %edx,%eax
8010496a:	77 f4                	ja     80104960 <fetchstr+0x30>
    return -1;
8010496c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
80104971:	83 c4 04             	add    $0x4,%esp
80104974:	5b                   	pop    %ebx
80104975:	5d                   	pop    %ebp
80104976:	c3                   	ret    
80104977:	89 f6                	mov    %esi,%esi
80104979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104980:	83 c4 04             	add    $0x4,%esp
80104983:	89 d0                	mov    %edx,%eax
80104985:	29 d8                	sub    %ebx,%eax
80104987:	5b                   	pop    %ebx
80104988:	5d                   	pop    %ebp
80104989:	c3                   	ret    
8010498a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s == 0)
80104990:	31 c0                	xor    %eax,%eax
      return s - *pp;
80104992:	eb dd                	jmp    80104971 <fetchstr+0x41>
80104994:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010499a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801049a0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801049a0:	55                   	push   %ebp
801049a1:	89 e5                	mov    %esp,%ebp
801049a3:	56                   	push   %esi
801049a4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801049a5:	e8 f6 ee ff ff       	call   801038a0 <myproc>
801049aa:	8b 40 18             	mov    0x18(%eax),%eax
801049ad:	8b 55 08             	mov    0x8(%ebp),%edx
801049b0:	8b 40 44             	mov    0x44(%eax),%eax
801049b3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
801049b6:	e8 e5 ee ff ff       	call   801038a0 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801049bb:	8b 00                	mov    (%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801049bd:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801049c0:	39 c6                	cmp    %eax,%esi
801049c2:	73 1c                	jae    801049e0 <argint+0x40>
801049c4:	8d 53 08             	lea    0x8(%ebx),%edx
801049c7:	39 d0                	cmp    %edx,%eax
801049c9:	72 15                	jb     801049e0 <argint+0x40>
  *ip = *(int*)(addr);
801049cb:	8b 45 0c             	mov    0xc(%ebp),%eax
801049ce:	8b 53 04             	mov    0x4(%ebx),%edx
801049d1:	89 10                	mov    %edx,(%eax)
  return 0;
801049d3:	31 c0                	xor    %eax,%eax
}
801049d5:	5b                   	pop    %ebx
801049d6:	5e                   	pop    %esi
801049d7:	5d                   	pop    %ebp
801049d8:	c3                   	ret    
801049d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801049e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801049e5:	eb ee                	jmp    801049d5 <argint+0x35>
801049e7:	89 f6                	mov    %esi,%esi
801049e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049f0 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
801049f0:	55                   	push   %ebp
801049f1:	89 e5                	mov    %esp,%ebp
801049f3:	56                   	push   %esi
801049f4:	53                   	push   %ebx
801049f5:	83 ec 10             	sub    $0x10,%esp
801049f8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
801049fb:	e8 a0 ee ff ff       	call   801038a0 <myproc>
80104a00:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104a02:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a05:	83 ec 08             	sub    $0x8,%esp
80104a08:	50                   	push   %eax
80104a09:	ff 75 08             	pushl  0x8(%ebp)
80104a0c:	e8 8f ff ff ff       	call   801049a0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104a11:	83 c4 10             	add    $0x10,%esp
80104a14:	85 c0                	test   %eax,%eax
80104a16:	78 28                	js     80104a40 <argptr+0x50>
80104a18:	85 db                	test   %ebx,%ebx
80104a1a:	78 24                	js     80104a40 <argptr+0x50>
80104a1c:	8b 16                	mov    (%esi),%edx
80104a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a21:	39 c2                	cmp    %eax,%edx
80104a23:	76 1b                	jbe    80104a40 <argptr+0x50>
80104a25:	01 c3                	add    %eax,%ebx
80104a27:	39 da                	cmp    %ebx,%edx
80104a29:	72 15                	jb     80104a40 <argptr+0x50>
    return -1;
  *pp = (char*)i;
80104a2b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a2e:	89 02                	mov    %eax,(%edx)
  return 0;
80104a30:	31 c0                	xor    %eax,%eax
}
80104a32:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a35:	5b                   	pop    %ebx
80104a36:	5e                   	pop    %esi
80104a37:	5d                   	pop    %ebp
80104a38:	c3                   	ret    
80104a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104a40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a45:	eb eb                	jmp    80104a32 <argptr+0x42>
80104a47:	89 f6                	mov    %esi,%esi
80104a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a50 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104a50:	55                   	push   %ebp
80104a51:	89 e5                	mov    %esp,%ebp
80104a53:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104a56:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a59:	50                   	push   %eax
80104a5a:	ff 75 08             	pushl  0x8(%ebp)
80104a5d:	e8 3e ff ff ff       	call   801049a0 <argint>
80104a62:	83 c4 10             	add    $0x10,%esp
80104a65:	85 c0                	test   %eax,%eax
80104a67:	78 17                	js     80104a80 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104a69:	83 ec 08             	sub    $0x8,%esp
80104a6c:	ff 75 0c             	pushl  0xc(%ebp)
80104a6f:	ff 75 f4             	pushl  -0xc(%ebp)
80104a72:	e8 b9 fe ff ff       	call   80104930 <fetchstr>
80104a77:	83 c4 10             	add    $0x10,%esp
}
80104a7a:	c9                   	leave  
80104a7b:	c3                   	ret    
80104a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104a80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104a85:	c9                   	leave  
80104a86:	c3                   	ret    
80104a87:	89 f6                	mov    %esi,%esi
80104a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a90 <getreadcount>:

int
getreadcount(void){
80104a90:	55                   	push   %ebp
  return counter;
}
80104a91:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
getreadcount(void){
80104a96:	89 e5                	mov    %esp,%ebp
}
80104a98:	5d                   	pop    %ebp
80104a99:	c3                   	ret    
80104a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104aa0 <syscall>:
};


void
syscall(void)
{
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	53                   	push   %ebx
80104aa4:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104aa7:	e8 f4 ed ff ff       	call   801038a0 <myproc>
80104aac:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104aae:	8b 40 18             	mov    0x18(%eax),%eax
80104ab1:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104ab4:	8d 50 ff             	lea    -0x1(%eax),%edx
80104ab7:	83 fa 1a             	cmp    $0x1a,%edx
80104aba:	77 24                	ja     80104ae0 <syscall+0x40>
80104abc:	8b 14 85 20 7d 10 80 	mov    -0x7fef82e0(,%eax,4),%edx
80104ac3:	85 d2                	test   %edx,%edx
80104ac5:	74 19                	je     80104ae0 <syscall+0x40>

    if(num == SYS_read) counter++;
80104ac7:	83 f8 05             	cmp    $0x5,%eax
80104aca:	75 07                	jne    80104ad3 <syscall+0x33>
80104acc:	83 05 bc b5 10 80 01 	addl   $0x1,0x8010b5bc
    
    curproc->tf->eax = syscalls[num]();
80104ad3:	ff d2                	call   *%edx
80104ad5:	8b 53 18             	mov    0x18(%ebx),%edx
80104ad8:	89 42 1c             	mov    %eax,0x1c(%edx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104adb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ade:	c9                   	leave  
80104adf:	c3                   	ret    
    cprintf("%d %s: unknown sys call %d\n",
80104ae0:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104ae1:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104ae4:	50                   	push   %eax
80104ae5:	ff 73 10             	pushl  0x10(%ebx)
80104ae8:	68 f5 7c 10 80       	push   $0x80107cf5
80104aed:	e8 6e bb ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
80104af2:	8b 43 18             	mov    0x18(%ebx),%eax
80104af5:	83 c4 10             	add    $0x10,%esp
80104af8:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104aff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b02:	c9                   	leave  
80104b03:	c3                   	ret    
80104b04:	66 90                	xchg   %ax,%ax
80104b06:	66 90                	xchg   %ax,%ax
80104b08:	66 90                	xchg   %ax,%ax
80104b0a:	66 90                	xchg   %ax,%ax
80104b0c:	66 90                	xchg   %ax,%ax
80104b0e:	66 90                	xchg   %ax,%ax

80104b10 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104b10:	55                   	push   %ebp
80104b11:	89 e5                	mov    %esp,%ebp
80104b13:	57                   	push   %edi
80104b14:	56                   	push   %esi
80104b15:	53                   	push   %ebx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104b16:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104b19:	83 ec 34             	sub    $0x34,%esp
80104b1c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104b1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104b22:	56                   	push   %esi
80104b23:	50                   	push   %eax
{
80104b24:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104b27:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104b2a:	e8 11 d4 ff ff       	call   80101f40 <nameiparent>
80104b2f:	83 c4 10             	add    $0x10,%esp
80104b32:	85 c0                	test   %eax,%eax
80104b34:	0f 84 46 01 00 00    	je     80104c80 <create+0x170>
    return 0;
  ilock(dp);
80104b3a:	83 ec 0c             	sub    $0xc,%esp
80104b3d:	89 c3                	mov    %eax,%ebx
80104b3f:	50                   	push   %eax
80104b40:	e8 7b cb ff ff       	call   801016c0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104b45:	83 c4 0c             	add    $0xc,%esp
80104b48:	6a 00                	push   $0x0
80104b4a:	56                   	push   %esi
80104b4b:	53                   	push   %ebx
80104b4c:	e8 9f d0 ff ff       	call   80101bf0 <dirlookup>
80104b51:	83 c4 10             	add    $0x10,%esp
80104b54:	85 c0                	test   %eax,%eax
80104b56:	89 c7                	mov    %eax,%edi
80104b58:	74 36                	je     80104b90 <create+0x80>
    iunlockput(dp);
80104b5a:	83 ec 0c             	sub    $0xc,%esp
80104b5d:	53                   	push   %ebx
80104b5e:	e8 ed cd ff ff       	call   80101950 <iunlockput>
    ilock(ip);
80104b63:	89 3c 24             	mov    %edi,(%esp)
80104b66:	e8 55 cb ff ff       	call   801016c0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104b6b:	83 c4 10             	add    $0x10,%esp
80104b6e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104b73:	0f 85 97 00 00 00    	jne    80104c10 <create+0x100>
80104b79:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104b7e:	0f 85 8c 00 00 00    	jne    80104c10 <create+0x100>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104b84:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b87:	89 f8                	mov    %edi,%eax
80104b89:	5b                   	pop    %ebx
80104b8a:	5e                   	pop    %esi
80104b8b:	5f                   	pop    %edi
80104b8c:	5d                   	pop    %ebp
80104b8d:	c3                   	ret    
80104b8e:	66 90                	xchg   %ax,%ax
  if((ip = ialloc(dp->dev, type)) == 0)
80104b90:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104b94:	83 ec 08             	sub    $0x8,%esp
80104b97:	50                   	push   %eax
80104b98:	ff 33                	pushl  (%ebx)
80104b9a:	e8 b1 c9 ff ff       	call   80101550 <ialloc>
80104b9f:	83 c4 10             	add    $0x10,%esp
80104ba2:	85 c0                	test   %eax,%eax
80104ba4:	89 c7                	mov    %eax,%edi
80104ba6:	0f 84 e8 00 00 00    	je     80104c94 <create+0x184>
  ilock(ip);
80104bac:	83 ec 0c             	sub    $0xc,%esp
80104baf:	50                   	push   %eax
80104bb0:	e8 0b cb ff ff       	call   801016c0 <ilock>
  ip->major = major;
80104bb5:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104bb9:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104bbd:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104bc1:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104bc5:	b8 01 00 00 00       	mov    $0x1,%eax
80104bca:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104bce:	89 3c 24             	mov    %edi,(%esp)
80104bd1:	e8 3a ca ff ff       	call   80101610 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104bd6:	83 c4 10             	add    $0x10,%esp
80104bd9:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104bde:	74 50                	je     80104c30 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104be0:	83 ec 04             	sub    $0x4,%esp
80104be3:	ff 77 04             	pushl  0x4(%edi)
80104be6:	56                   	push   %esi
80104be7:	53                   	push   %ebx
80104be8:	e8 73 d2 ff ff       	call   80101e60 <dirlink>
80104bed:	83 c4 10             	add    $0x10,%esp
80104bf0:	85 c0                	test   %eax,%eax
80104bf2:	0f 88 8f 00 00 00    	js     80104c87 <create+0x177>
  iunlockput(dp);
80104bf8:	83 ec 0c             	sub    $0xc,%esp
80104bfb:	53                   	push   %ebx
80104bfc:	e8 4f cd ff ff       	call   80101950 <iunlockput>
  return ip;
80104c01:	83 c4 10             	add    $0x10,%esp
}
80104c04:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c07:	89 f8                	mov    %edi,%eax
80104c09:	5b                   	pop    %ebx
80104c0a:	5e                   	pop    %esi
80104c0b:	5f                   	pop    %edi
80104c0c:	5d                   	pop    %ebp
80104c0d:	c3                   	ret    
80104c0e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104c10:	83 ec 0c             	sub    $0xc,%esp
80104c13:	57                   	push   %edi
    return 0;
80104c14:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104c16:	e8 35 cd ff ff       	call   80101950 <iunlockput>
    return 0;
80104c1b:	83 c4 10             	add    $0x10,%esp
}
80104c1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c21:	89 f8                	mov    %edi,%eax
80104c23:	5b                   	pop    %ebx
80104c24:	5e                   	pop    %esi
80104c25:	5f                   	pop    %edi
80104c26:	5d                   	pop    %ebp
80104c27:	c3                   	ret    
80104c28:	90                   	nop
80104c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink++;  // for ".."
80104c30:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104c35:	83 ec 0c             	sub    $0xc,%esp
80104c38:	53                   	push   %ebx
80104c39:	e8 d2 c9 ff ff       	call   80101610 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104c3e:	83 c4 0c             	add    $0xc,%esp
80104c41:	ff 77 04             	pushl  0x4(%edi)
80104c44:	68 ac 7d 10 80       	push   $0x80107dac
80104c49:	57                   	push   %edi
80104c4a:	e8 11 d2 ff ff       	call   80101e60 <dirlink>
80104c4f:	83 c4 10             	add    $0x10,%esp
80104c52:	85 c0                	test   %eax,%eax
80104c54:	78 1c                	js     80104c72 <create+0x162>
80104c56:	83 ec 04             	sub    $0x4,%esp
80104c59:	ff 73 04             	pushl  0x4(%ebx)
80104c5c:	68 ab 7d 10 80       	push   $0x80107dab
80104c61:	57                   	push   %edi
80104c62:	e8 f9 d1 ff ff       	call   80101e60 <dirlink>
80104c67:	83 c4 10             	add    $0x10,%esp
80104c6a:	85 c0                	test   %eax,%eax
80104c6c:	0f 89 6e ff ff ff    	jns    80104be0 <create+0xd0>
      panic("create dots");
80104c72:	83 ec 0c             	sub    $0xc,%esp
80104c75:	68 9f 7d 10 80       	push   $0x80107d9f
80104c7a:	e8 11 b7 ff ff       	call   80100390 <panic>
80104c7f:	90                   	nop
    return 0;
80104c80:	31 ff                	xor    %edi,%edi
80104c82:	e9 fd fe ff ff       	jmp    80104b84 <create+0x74>
    panic("create: dirlink");
80104c87:	83 ec 0c             	sub    $0xc,%esp
80104c8a:	68 ae 7d 10 80       	push   $0x80107dae
80104c8f:	e8 fc b6 ff ff       	call   80100390 <panic>
    panic("create: ialloc");
80104c94:	83 ec 0c             	sub    $0xc,%esp
80104c97:	68 90 7d 10 80       	push   $0x80107d90
80104c9c:	e8 ef b6 ff ff       	call   80100390 <panic>
80104ca1:	eb 0d                	jmp    80104cb0 <argfd.constprop.0>
80104ca3:	90                   	nop
80104ca4:	90                   	nop
80104ca5:	90                   	nop
80104ca6:	90                   	nop
80104ca7:	90                   	nop
80104ca8:	90                   	nop
80104ca9:	90                   	nop
80104caa:	90                   	nop
80104cab:	90                   	nop
80104cac:	90                   	nop
80104cad:	90                   	nop
80104cae:	90                   	nop
80104caf:	90                   	nop

80104cb0 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104cb0:	55                   	push   %ebp
80104cb1:	89 e5                	mov    %esp,%ebp
80104cb3:	56                   	push   %esi
80104cb4:	53                   	push   %ebx
80104cb5:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80104cb7:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104cba:	89 d6                	mov    %edx,%esi
80104cbc:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104cbf:	50                   	push   %eax
80104cc0:	6a 00                	push   $0x0
80104cc2:	e8 d9 fc ff ff       	call   801049a0 <argint>
80104cc7:	83 c4 10             	add    $0x10,%esp
80104cca:	85 c0                	test   %eax,%eax
80104ccc:	78 2a                	js     80104cf8 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104cce:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104cd2:	77 24                	ja     80104cf8 <argfd.constprop.0+0x48>
80104cd4:	e8 c7 eb ff ff       	call   801038a0 <myproc>
80104cd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104cdc:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104ce0:	85 c0                	test   %eax,%eax
80104ce2:	74 14                	je     80104cf8 <argfd.constprop.0+0x48>
  if(pfd)
80104ce4:	85 db                	test   %ebx,%ebx
80104ce6:	74 02                	je     80104cea <argfd.constprop.0+0x3a>
    *pfd = fd;
80104ce8:	89 13                	mov    %edx,(%ebx)
    *pf = f;
80104cea:	89 06                	mov    %eax,(%esi)
  return 0;
80104cec:	31 c0                	xor    %eax,%eax
}
80104cee:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104cf1:	5b                   	pop    %ebx
80104cf2:	5e                   	pop    %esi
80104cf3:	5d                   	pop    %ebp
80104cf4:	c3                   	ret    
80104cf5:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104cf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cfd:	eb ef                	jmp    80104cee <argfd.constprop.0+0x3e>
80104cff:	90                   	nop

80104d00 <sys_dup>:
{
80104d00:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104d01:	31 c0                	xor    %eax,%eax
{
80104d03:	89 e5                	mov    %esp,%ebp
80104d05:	56                   	push   %esi
80104d06:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104d07:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104d0a:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104d0d:	e8 9e ff ff ff       	call   80104cb0 <argfd.constprop.0>
80104d12:	85 c0                	test   %eax,%eax
80104d14:	78 42                	js     80104d58 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
80104d16:	8b 75 f4             	mov    -0xc(%ebp),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104d19:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80104d1b:	e8 80 eb ff ff       	call   801038a0 <myproc>
80104d20:	eb 0e                	jmp    80104d30 <sys_dup+0x30>
80104d22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104d28:	83 c3 01             	add    $0x1,%ebx
80104d2b:	83 fb 10             	cmp    $0x10,%ebx
80104d2e:	74 28                	je     80104d58 <sys_dup+0x58>
    if(curproc->ofile[fd] == 0){
80104d30:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104d34:	85 d2                	test   %edx,%edx
80104d36:	75 f0                	jne    80104d28 <sys_dup+0x28>
      curproc->ofile[fd] = f;
80104d38:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104d3c:	83 ec 0c             	sub    $0xc,%esp
80104d3f:	ff 75 f4             	pushl  -0xc(%ebp)
80104d42:	e8 e9 c0 ff ff       	call   80100e30 <filedup>
  return fd;
80104d47:	83 c4 10             	add    $0x10,%esp
}
80104d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d4d:	89 d8                	mov    %ebx,%eax
80104d4f:	5b                   	pop    %ebx
80104d50:	5e                   	pop    %esi
80104d51:	5d                   	pop    %ebp
80104d52:	c3                   	ret    
80104d53:	90                   	nop
80104d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d58:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104d5b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104d60:	89 d8                	mov    %ebx,%eax
80104d62:	5b                   	pop    %ebx
80104d63:	5e                   	pop    %esi
80104d64:	5d                   	pop    %ebp
80104d65:	c3                   	ret    
80104d66:	8d 76 00             	lea    0x0(%esi),%esi
80104d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d70 <sys_read>:
{
80104d70:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d71:	31 c0                	xor    %eax,%eax
{
80104d73:	89 e5                	mov    %esp,%ebp
80104d75:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d7b:	e8 30 ff ff ff       	call   80104cb0 <argfd.constprop.0>
80104d80:	85 c0                	test   %eax,%eax
80104d82:	78 4c                	js     80104dd0 <sys_read+0x60>
80104d84:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d87:	83 ec 08             	sub    $0x8,%esp
80104d8a:	50                   	push   %eax
80104d8b:	6a 02                	push   $0x2
80104d8d:	e8 0e fc ff ff       	call   801049a0 <argint>
80104d92:	83 c4 10             	add    $0x10,%esp
80104d95:	85 c0                	test   %eax,%eax
80104d97:	78 37                	js     80104dd0 <sys_read+0x60>
80104d99:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d9c:	83 ec 04             	sub    $0x4,%esp
80104d9f:	ff 75 f0             	pushl  -0x10(%ebp)
80104da2:	50                   	push   %eax
80104da3:	6a 01                	push   $0x1
80104da5:	e8 46 fc ff ff       	call   801049f0 <argptr>
80104daa:	83 c4 10             	add    $0x10,%esp
80104dad:	85 c0                	test   %eax,%eax
80104daf:	78 1f                	js     80104dd0 <sys_read+0x60>
  return fileread(f, p, n);
80104db1:	83 ec 04             	sub    $0x4,%esp
80104db4:	ff 75 f0             	pushl  -0x10(%ebp)
80104db7:	ff 75 f4             	pushl  -0xc(%ebp)
80104dba:	ff 75 ec             	pushl  -0x14(%ebp)
80104dbd:	e8 de c1 ff ff       	call   80100fa0 <fileread>
80104dc2:	83 c4 10             	add    $0x10,%esp
}
80104dc5:	c9                   	leave  
80104dc6:	c3                   	ret    
80104dc7:	89 f6                	mov    %esi,%esi
80104dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104dd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104dd5:	c9                   	leave  
80104dd6:	c3                   	ret    
80104dd7:	89 f6                	mov    %esi,%esi
80104dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104de0 <sys_write>:
{
80104de0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104de1:	31 c0                	xor    %eax,%eax
{
80104de3:	89 e5                	mov    %esp,%ebp
80104de5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104de8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104deb:	e8 c0 fe ff ff       	call   80104cb0 <argfd.constprop.0>
80104df0:	85 c0                	test   %eax,%eax
80104df2:	78 4c                	js     80104e40 <sys_write+0x60>
80104df4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104df7:	83 ec 08             	sub    $0x8,%esp
80104dfa:	50                   	push   %eax
80104dfb:	6a 02                	push   $0x2
80104dfd:	e8 9e fb ff ff       	call   801049a0 <argint>
80104e02:	83 c4 10             	add    $0x10,%esp
80104e05:	85 c0                	test   %eax,%eax
80104e07:	78 37                	js     80104e40 <sys_write+0x60>
80104e09:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e0c:	83 ec 04             	sub    $0x4,%esp
80104e0f:	ff 75 f0             	pushl  -0x10(%ebp)
80104e12:	50                   	push   %eax
80104e13:	6a 01                	push   $0x1
80104e15:	e8 d6 fb ff ff       	call   801049f0 <argptr>
80104e1a:	83 c4 10             	add    $0x10,%esp
80104e1d:	85 c0                	test   %eax,%eax
80104e1f:	78 1f                	js     80104e40 <sys_write+0x60>
  return filewrite(f, p, n);
80104e21:	83 ec 04             	sub    $0x4,%esp
80104e24:	ff 75 f0             	pushl  -0x10(%ebp)
80104e27:	ff 75 f4             	pushl  -0xc(%ebp)
80104e2a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e2d:	e8 fe c1 ff ff       	call   80101030 <filewrite>
80104e32:	83 c4 10             	add    $0x10,%esp
}
80104e35:	c9                   	leave  
80104e36:	c3                   	ret    
80104e37:	89 f6                	mov    %esi,%esi
80104e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104e40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e45:	c9                   	leave  
80104e46:	c3                   	ret    
80104e47:	89 f6                	mov    %esi,%esi
80104e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e50 <sys_close>:
{
80104e50:	55                   	push   %ebp
80104e51:	89 e5                	mov    %esp,%ebp
80104e53:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104e56:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104e59:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e5c:	e8 4f fe ff ff       	call   80104cb0 <argfd.constprop.0>
80104e61:	85 c0                	test   %eax,%eax
80104e63:	78 2b                	js     80104e90 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
80104e65:	e8 36 ea ff ff       	call   801038a0 <myproc>
80104e6a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104e6d:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80104e70:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104e77:	00 
  fileclose(f);
80104e78:	ff 75 f4             	pushl  -0xc(%ebp)
80104e7b:	e8 00 c0 ff ff       	call   80100e80 <fileclose>
  return 0;
80104e80:	83 c4 10             	add    $0x10,%esp
80104e83:	31 c0                	xor    %eax,%eax
}
80104e85:	c9                   	leave  
80104e86:	c3                   	ret    
80104e87:	89 f6                	mov    %esi,%esi
80104e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104e90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e95:	c9                   	leave  
80104e96:	c3                   	ret    
80104e97:	89 f6                	mov    %esi,%esi
80104e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ea0 <sys_fstat>:
{
80104ea0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ea1:	31 c0                	xor    %eax,%eax
{
80104ea3:	89 e5                	mov    %esp,%ebp
80104ea5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ea8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104eab:	e8 00 fe ff ff       	call   80104cb0 <argfd.constprop.0>
80104eb0:	85 c0                	test   %eax,%eax
80104eb2:	78 2c                	js     80104ee0 <sys_fstat+0x40>
80104eb4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104eb7:	83 ec 04             	sub    $0x4,%esp
80104eba:	6a 14                	push   $0x14
80104ebc:	50                   	push   %eax
80104ebd:	6a 01                	push   $0x1
80104ebf:	e8 2c fb ff ff       	call   801049f0 <argptr>
80104ec4:	83 c4 10             	add    $0x10,%esp
80104ec7:	85 c0                	test   %eax,%eax
80104ec9:	78 15                	js     80104ee0 <sys_fstat+0x40>
  return filestat(f, st);
80104ecb:	83 ec 08             	sub    $0x8,%esp
80104ece:	ff 75 f4             	pushl  -0xc(%ebp)
80104ed1:	ff 75 f0             	pushl  -0x10(%ebp)
80104ed4:	e8 77 c0 ff ff       	call   80100f50 <filestat>
80104ed9:	83 c4 10             	add    $0x10,%esp
}
80104edc:	c9                   	leave  
80104edd:	c3                   	ret    
80104ede:	66 90                	xchg   %ax,%ax
    return -1;
80104ee0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ee5:	c9                   	leave  
80104ee6:	c3                   	ret    
80104ee7:	89 f6                	mov    %esi,%esi
80104ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ef0 <sys_link>:
{
80104ef0:	55                   	push   %ebp
80104ef1:	89 e5                	mov    %esp,%ebp
80104ef3:	57                   	push   %edi
80104ef4:	56                   	push   %esi
80104ef5:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104ef6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104ef9:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104efc:	50                   	push   %eax
80104efd:	6a 00                	push   $0x0
80104eff:	e8 4c fb ff ff       	call   80104a50 <argstr>
80104f04:	83 c4 10             	add    $0x10,%esp
80104f07:	85 c0                	test   %eax,%eax
80104f09:	0f 88 fb 00 00 00    	js     8010500a <sys_link+0x11a>
80104f0f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104f12:	83 ec 08             	sub    $0x8,%esp
80104f15:	50                   	push   %eax
80104f16:	6a 01                	push   $0x1
80104f18:	e8 33 fb ff ff       	call   80104a50 <argstr>
80104f1d:	83 c4 10             	add    $0x10,%esp
80104f20:	85 c0                	test   %eax,%eax
80104f22:	0f 88 e2 00 00 00    	js     8010500a <sys_link+0x11a>
  begin_op();
80104f28:	e8 03 dd ff ff       	call   80102c30 <begin_op>
  if((ip = namei(old)) == 0){
80104f2d:	83 ec 0c             	sub    $0xc,%esp
80104f30:	ff 75 d4             	pushl  -0x2c(%ebp)
80104f33:	e8 e8 cf ff ff       	call   80101f20 <namei>
80104f38:	83 c4 10             	add    $0x10,%esp
80104f3b:	85 c0                	test   %eax,%eax
80104f3d:	89 c3                	mov    %eax,%ebx
80104f3f:	0f 84 ea 00 00 00    	je     8010502f <sys_link+0x13f>
  ilock(ip);
80104f45:	83 ec 0c             	sub    $0xc,%esp
80104f48:	50                   	push   %eax
80104f49:	e8 72 c7 ff ff       	call   801016c0 <ilock>
  if(ip->type == T_DIR){
80104f4e:	83 c4 10             	add    $0x10,%esp
80104f51:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f56:	0f 84 bb 00 00 00    	je     80105017 <sys_link+0x127>
  ip->nlink++;
80104f5c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f61:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80104f64:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104f67:	53                   	push   %ebx
80104f68:	e8 a3 c6 ff ff       	call   80101610 <iupdate>
  iunlock(ip);
80104f6d:	89 1c 24             	mov    %ebx,(%esp)
80104f70:	e8 2b c8 ff ff       	call   801017a0 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104f75:	58                   	pop    %eax
80104f76:	5a                   	pop    %edx
80104f77:	57                   	push   %edi
80104f78:	ff 75 d0             	pushl  -0x30(%ebp)
80104f7b:	e8 c0 cf ff ff       	call   80101f40 <nameiparent>
80104f80:	83 c4 10             	add    $0x10,%esp
80104f83:	85 c0                	test   %eax,%eax
80104f85:	89 c6                	mov    %eax,%esi
80104f87:	74 5b                	je     80104fe4 <sys_link+0xf4>
  ilock(dp);
80104f89:	83 ec 0c             	sub    $0xc,%esp
80104f8c:	50                   	push   %eax
80104f8d:	e8 2e c7 ff ff       	call   801016c0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104f92:	83 c4 10             	add    $0x10,%esp
80104f95:	8b 03                	mov    (%ebx),%eax
80104f97:	39 06                	cmp    %eax,(%esi)
80104f99:	75 3d                	jne    80104fd8 <sys_link+0xe8>
80104f9b:	83 ec 04             	sub    $0x4,%esp
80104f9e:	ff 73 04             	pushl  0x4(%ebx)
80104fa1:	57                   	push   %edi
80104fa2:	56                   	push   %esi
80104fa3:	e8 b8 ce ff ff       	call   80101e60 <dirlink>
80104fa8:	83 c4 10             	add    $0x10,%esp
80104fab:	85 c0                	test   %eax,%eax
80104fad:	78 29                	js     80104fd8 <sys_link+0xe8>
  iunlockput(dp);
80104faf:	83 ec 0c             	sub    $0xc,%esp
80104fb2:	56                   	push   %esi
80104fb3:	e8 98 c9 ff ff       	call   80101950 <iunlockput>
  iput(ip);
80104fb8:	89 1c 24             	mov    %ebx,(%esp)
80104fbb:	e8 30 c8 ff ff       	call   801017f0 <iput>
  end_op();
80104fc0:	e8 db dc ff ff       	call   80102ca0 <end_op>
  return 0;
80104fc5:	83 c4 10             	add    $0x10,%esp
80104fc8:	31 c0                	xor    %eax,%eax
}
80104fca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fcd:	5b                   	pop    %ebx
80104fce:	5e                   	pop    %esi
80104fcf:	5f                   	pop    %edi
80104fd0:	5d                   	pop    %ebp
80104fd1:	c3                   	ret    
80104fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80104fd8:	83 ec 0c             	sub    $0xc,%esp
80104fdb:	56                   	push   %esi
80104fdc:	e8 6f c9 ff ff       	call   80101950 <iunlockput>
    goto bad;
80104fe1:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104fe4:	83 ec 0c             	sub    $0xc,%esp
80104fe7:	53                   	push   %ebx
80104fe8:	e8 d3 c6 ff ff       	call   801016c0 <ilock>
  ip->nlink--;
80104fed:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ff2:	89 1c 24             	mov    %ebx,(%esp)
80104ff5:	e8 16 c6 ff ff       	call   80101610 <iupdate>
  iunlockput(ip);
80104ffa:	89 1c 24             	mov    %ebx,(%esp)
80104ffd:	e8 4e c9 ff ff       	call   80101950 <iunlockput>
  end_op();
80105002:	e8 99 dc ff ff       	call   80102ca0 <end_op>
  return -1;
80105007:	83 c4 10             	add    $0x10,%esp
}
8010500a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010500d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105012:	5b                   	pop    %ebx
80105013:	5e                   	pop    %esi
80105014:	5f                   	pop    %edi
80105015:	5d                   	pop    %ebp
80105016:	c3                   	ret    
    iunlockput(ip);
80105017:	83 ec 0c             	sub    $0xc,%esp
8010501a:	53                   	push   %ebx
8010501b:	e8 30 c9 ff ff       	call   80101950 <iunlockput>
    end_op();
80105020:	e8 7b dc ff ff       	call   80102ca0 <end_op>
    return -1;
80105025:	83 c4 10             	add    $0x10,%esp
80105028:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010502d:	eb 9b                	jmp    80104fca <sys_link+0xda>
    end_op();
8010502f:	e8 6c dc ff ff       	call   80102ca0 <end_op>
    return -1;
80105034:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105039:	eb 8f                	jmp    80104fca <sys_link+0xda>
8010503b:	90                   	nop
8010503c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105040 <sys_unlink>:
{
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	57                   	push   %edi
80105044:	56                   	push   %esi
80105045:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80105046:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80105049:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
8010504c:	50                   	push   %eax
8010504d:	6a 00                	push   $0x0
8010504f:	e8 fc f9 ff ff       	call   80104a50 <argstr>
80105054:	83 c4 10             	add    $0x10,%esp
80105057:	85 c0                	test   %eax,%eax
80105059:	0f 88 77 01 00 00    	js     801051d6 <sys_unlink+0x196>
  if((dp = nameiparent(path, name)) == 0){
8010505f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
80105062:	e8 c9 db ff ff       	call   80102c30 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105067:	83 ec 08             	sub    $0x8,%esp
8010506a:	53                   	push   %ebx
8010506b:	ff 75 c0             	pushl  -0x40(%ebp)
8010506e:	e8 cd ce ff ff       	call   80101f40 <nameiparent>
80105073:	83 c4 10             	add    $0x10,%esp
80105076:	85 c0                	test   %eax,%eax
80105078:	89 c6                	mov    %eax,%esi
8010507a:	0f 84 60 01 00 00    	je     801051e0 <sys_unlink+0x1a0>
  ilock(dp);
80105080:	83 ec 0c             	sub    $0xc,%esp
80105083:	50                   	push   %eax
80105084:	e8 37 c6 ff ff       	call   801016c0 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80105089:	58                   	pop    %eax
8010508a:	5a                   	pop    %edx
8010508b:	68 ac 7d 10 80       	push   $0x80107dac
80105090:	53                   	push   %ebx
80105091:	e8 3a cb ff ff       	call   80101bd0 <namecmp>
80105096:	83 c4 10             	add    $0x10,%esp
80105099:	85 c0                	test   %eax,%eax
8010509b:	0f 84 03 01 00 00    	je     801051a4 <sys_unlink+0x164>
801050a1:	83 ec 08             	sub    $0x8,%esp
801050a4:	68 ab 7d 10 80       	push   $0x80107dab
801050a9:	53                   	push   %ebx
801050aa:	e8 21 cb ff ff       	call   80101bd0 <namecmp>
801050af:	83 c4 10             	add    $0x10,%esp
801050b2:	85 c0                	test   %eax,%eax
801050b4:	0f 84 ea 00 00 00    	je     801051a4 <sys_unlink+0x164>
  if((ip = dirlookup(dp, name, &off)) == 0)
801050ba:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801050bd:	83 ec 04             	sub    $0x4,%esp
801050c0:	50                   	push   %eax
801050c1:	53                   	push   %ebx
801050c2:	56                   	push   %esi
801050c3:	e8 28 cb ff ff       	call   80101bf0 <dirlookup>
801050c8:	83 c4 10             	add    $0x10,%esp
801050cb:	85 c0                	test   %eax,%eax
801050cd:	89 c3                	mov    %eax,%ebx
801050cf:	0f 84 cf 00 00 00    	je     801051a4 <sys_unlink+0x164>
  ilock(ip);
801050d5:	83 ec 0c             	sub    $0xc,%esp
801050d8:	50                   	push   %eax
801050d9:	e8 e2 c5 ff ff       	call   801016c0 <ilock>
  if(ip->nlink < 1)
801050de:	83 c4 10             	add    $0x10,%esp
801050e1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801050e6:	0f 8e 10 01 00 00    	jle    801051fc <sys_unlink+0x1bc>
  if(ip->type == T_DIR && !isdirempty(ip)){
801050ec:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050f1:	74 6d                	je     80105160 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
801050f3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801050f6:	83 ec 04             	sub    $0x4,%esp
801050f9:	6a 10                	push   $0x10
801050fb:	6a 00                	push   $0x0
801050fd:	50                   	push   %eax
801050fe:	e8 9d f5 ff ff       	call   801046a0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105103:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105106:	6a 10                	push   $0x10
80105108:	ff 75 c4             	pushl  -0x3c(%ebp)
8010510b:	50                   	push   %eax
8010510c:	56                   	push   %esi
8010510d:	e8 8e c9 ff ff       	call   80101aa0 <writei>
80105112:	83 c4 20             	add    $0x20,%esp
80105115:	83 f8 10             	cmp    $0x10,%eax
80105118:	0f 85 eb 00 00 00    	jne    80105209 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
8010511e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105123:	0f 84 97 00 00 00    	je     801051c0 <sys_unlink+0x180>
  iunlockput(dp);
80105129:	83 ec 0c             	sub    $0xc,%esp
8010512c:	56                   	push   %esi
8010512d:	e8 1e c8 ff ff       	call   80101950 <iunlockput>
  ip->nlink--;
80105132:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105137:	89 1c 24             	mov    %ebx,(%esp)
8010513a:	e8 d1 c4 ff ff       	call   80101610 <iupdate>
  iunlockput(ip);
8010513f:	89 1c 24             	mov    %ebx,(%esp)
80105142:	e8 09 c8 ff ff       	call   80101950 <iunlockput>
  end_op();
80105147:	e8 54 db ff ff       	call   80102ca0 <end_op>
  return 0;
8010514c:	83 c4 10             	add    $0x10,%esp
8010514f:	31 c0                	xor    %eax,%eax
}
80105151:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105154:	5b                   	pop    %ebx
80105155:	5e                   	pop    %esi
80105156:	5f                   	pop    %edi
80105157:	5d                   	pop    %ebp
80105158:	c3                   	ret    
80105159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105160:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105164:	76 8d                	jbe    801050f3 <sys_unlink+0xb3>
80105166:	bf 20 00 00 00       	mov    $0x20,%edi
8010516b:	eb 0f                	jmp    8010517c <sys_unlink+0x13c>
8010516d:	8d 76 00             	lea    0x0(%esi),%esi
80105170:	83 c7 10             	add    $0x10,%edi
80105173:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105176:	0f 83 77 ff ff ff    	jae    801050f3 <sys_unlink+0xb3>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010517c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010517f:	6a 10                	push   $0x10
80105181:	57                   	push   %edi
80105182:	50                   	push   %eax
80105183:	53                   	push   %ebx
80105184:	e8 17 c8 ff ff       	call   801019a0 <readi>
80105189:	83 c4 10             	add    $0x10,%esp
8010518c:	83 f8 10             	cmp    $0x10,%eax
8010518f:	75 5e                	jne    801051ef <sys_unlink+0x1af>
    if(de.inum != 0)
80105191:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105196:	74 d8                	je     80105170 <sys_unlink+0x130>
    iunlockput(ip);
80105198:	83 ec 0c             	sub    $0xc,%esp
8010519b:	53                   	push   %ebx
8010519c:	e8 af c7 ff ff       	call   80101950 <iunlockput>
    goto bad;
801051a1:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
801051a4:	83 ec 0c             	sub    $0xc,%esp
801051a7:	56                   	push   %esi
801051a8:	e8 a3 c7 ff ff       	call   80101950 <iunlockput>
  end_op();
801051ad:	e8 ee da ff ff       	call   80102ca0 <end_op>
  return -1;
801051b2:	83 c4 10             	add    $0x10,%esp
801051b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051ba:	eb 95                	jmp    80105151 <sys_unlink+0x111>
801051bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
801051c0:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
    iupdate(dp);
801051c5:	83 ec 0c             	sub    $0xc,%esp
801051c8:	56                   	push   %esi
801051c9:	e8 42 c4 ff ff       	call   80101610 <iupdate>
801051ce:	83 c4 10             	add    $0x10,%esp
801051d1:	e9 53 ff ff ff       	jmp    80105129 <sys_unlink+0xe9>
    return -1;
801051d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051db:	e9 71 ff ff ff       	jmp    80105151 <sys_unlink+0x111>
    end_op();
801051e0:	e8 bb da ff ff       	call   80102ca0 <end_op>
    return -1;
801051e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051ea:	e9 62 ff ff ff       	jmp    80105151 <sys_unlink+0x111>
      panic("isdirempty: readi");
801051ef:	83 ec 0c             	sub    $0xc,%esp
801051f2:	68 d0 7d 10 80       	push   $0x80107dd0
801051f7:	e8 94 b1 ff ff       	call   80100390 <panic>
    panic("unlink: nlink < 1");
801051fc:	83 ec 0c             	sub    $0xc,%esp
801051ff:	68 be 7d 10 80       	push   $0x80107dbe
80105204:	e8 87 b1 ff ff       	call   80100390 <panic>
    panic("unlink: writei");
80105209:	83 ec 0c             	sub    $0xc,%esp
8010520c:	68 e2 7d 10 80       	push   $0x80107de2
80105211:	e8 7a b1 ff ff       	call   80100390 <panic>
80105216:	8d 76 00             	lea    0x0(%esi),%esi
80105219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105220 <sys_open>:

int
sys_open(void)
{
80105220:	55                   	push   %ebp
80105221:	89 e5                	mov    %esp,%ebp
80105223:	57                   	push   %edi
80105224:	56                   	push   %esi
80105225:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105226:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105229:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010522c:	50                   	push   %eax
8010522d:	6a 00                	push   $0x0
8010522f:	e8 1c f8 ff ff       	call   80104a50 <argstr>
80105234:	83 c4 10             	add    $0x10,%esp
80105237:	85 c0                	test   %eax,%eax
80105239:	0f 88 1d 01 00 00    	js     8010535c <sys_open+0x13c>
8010523f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105242:	83 ec 08             	sub    $0x8,%esp
80105245:	50                   	push   %eax
80105246:	6a 01                	push   $0x1
80105248:	e8 53 f7 ff ff       	call   801049a0 <argint>
8010524d:	83 c4 10             	add    $0x10,%esp
80105250:	85 c0                	test   %eax,%eax
80105252:	0f 88 04 01 00 00    	js     8010535c <sys_open+0x13c>
    return -1;

  begin_op();
80105258:	e8 d3 d9 ff ff       	call   80102c30 <begin_op>

  if(omode & O_CREATE){
8010525d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105261:	0f 85 a9 00 00 00    	jne    80105310 <sys_open+0xf0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105267:	83 ec 0c             	sub    $0xc,%esp
8010526a:	ff 75 e0             	pushl  -0x20(%ebp)
8010526d:	e8 ae cc ff ff       	call   80101f20 <namei>
80105272:	83 c4 10             	add    $0x10,%esp
80105275:	85 c0                	test   %eax,%eax
80105277:	89 c6                	mov    %eax,%esi
80105279:	0f 84 b2 00 00 00    	je     80105331 <sys_open+0x111>
      end_op();
      return -1;
    }
    ilock(ip);
8010527f:	83 ec 0c             	sub    $0xc,%esp
80105282:	50                   	push   %eax
80105283:	e8 38 c4 ff ff       	call   801016c0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105288:	83 c4 10             	add    $0x10,%esp
8010528b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105290:	0f 84 aa 00 00 00    	je     80105340 <sys_open+0x120>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105296:	e8 25 bb ff ff       	call   80100dc0 <filealloc>
8010529b:	85 c0                	test   %eax,%eax
8010529d:	89 c7                	mov    %eax,%edi
8010529f:	0f 84 a6 00 00 00    	je     8010534b <sys_open+0x12b>
  struct proc *curproc = myproc();
801052a5:	e8 f6 e5 ff ff       	call   801038a0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801052aa:	31 db                	xor    %ebx,%ebx
801052ac:	eb 0e                	jmp    801052bc <sys_open+0x9c>
801052ae:	66 90                	xchg   %ax,%ax
801052b0:	83 c3 01             	add    $0x1,%ebx
801052b3:	83 fb 10             	cmp    $0x10,%ebx
801052b6:	0f 84 ac 00 00 00    	je     80105368 <sys_open+0x148>
    if(curproc->ofile[fd] == 0){
801052bc:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801052c0:	85 d2                	test   %edx,%edx
801052c2:	75 ec                	jne    801052b0 <sys_open+0x90>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052c4:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
801052c7:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
801052cb:	56                   	push   %esi
801052cc:	e8 cf c4 ff ff       	call   801017a0 <iunlock>
  end_op();
801052d1:	e8 ca d9 ff ff       	call   80102ca0 <end_op>

  f->type = FD_INODE;
801052d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801052dc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801052df:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
801052e2:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
801052e5:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
801052ec:	89 d0                	mov    %edx,%eax
801052ee:	f7 d0                	not    %eax
801052f0:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801052f3:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
801052f6:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801052f9:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
801052fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105300:	89 d8                	mov    %ebx,%eax
80105302:	5b                   	pop    %ebx
80105303:	5e                   	pop    %esi
80105304:	5f                   	pop    %edi
80105305:	5d                   	pop    %ebp
80105306:	c3                   	ret    
80105307:	89 f6                	mov    %esi,%esi
80105309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ip = create(path, T_FILE, 0, 0);
80105310:	83 ec 0c             	sub    $0xc,%esp
80105313:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105316:	31 c9                	xor    %ecx,%ecx
80105318:	6a 00                	push   $0x0
8010531a:	ba 02 00 00 00       	mov    $0x2,%edx
8010531f:	e8 ec f7 ff ff       	call   80104b10 <create>
    if(ip == 0){
80105324:	83 c4 10             	add    $0x10,%esp
80105327:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105329:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010532b:	0f 85 65 ff ff ff    	jne    80105296 <sys_open+0x76>
      end_op();
80105331:	e8 6a d9 ff ff       	call   80102ca0 <end_op>
      return -1;
80105336:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010533b:	eb c0                	jmp    801052fd <sys_open+0xdd>
8010533d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105340:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105343:	85 c9                	test   %ecx,%ecx
80105345:	0f 84 4b ff ff ff    	je     80105296 <sys_open+0x76>
    iunlockput(ip);
8010534b:	83 ec 0c             	sub    $0xc,%esp
8010534e:	56                   	push   %esi
8010534f:	e8 fc c5 ff ff       	call   80101950 <iunlockput>
    end_op();
80105354:	e8 47 d9 ff ff       	call   80102ca0 <end_op>
    return -1;
80105359:	83 c4 10             	add    $0x10,%esp
8010535c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105361:	eb 9a                	jmp    801052fd <sys_open+0xdd>
80105363:	90                   	nop
80105364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
80105368:	83 ec 0c             	sub    $0xc,%esp
8010536b:	57                   	push   %edi
8010536c:	e8 0f bb ff ff       	call   80100e80 <fileclose>
80105371:	83 c4 10             	add    $0x10,%esp
80105374:	eb d5                	jmp    8010534b <sys_open+0x12b>
80105376:	8d 76 00             	lea    0x0(%esi),%esi
80105379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105380 <sys_mkdir>:

int
sys_mkdir(void)
{
80105380:	55                   	push   %ebp
80105381:	89 e5                	mov    %esp,%ebp
80105383:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105386:	e8 a5 d8 ff ff       	call   80102c30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010538b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010538e:	83 ec 08             	sub    $0x8,%esp
80105391:	50                   	push   %eax
80105392:	6a 00                	push   $0x0
80105394:	e8 b7 f6 ff ff       	call   80104a50 <argstr>
80105399:	83 c4 10             	add    $0x10,%esp
8010539c:	85 c0                	test   %eax,%eax
8010539e:	78 30                	js     801053d0 <sys_mkdir+0x50>
801053a0:	83 ec 0c             	sub    $0xc,%esp
801053a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801053a6:	31 c9                	xor    %ecx,%ecx
801053a8:	6a 00                	push   $0x0
801053aa:	ba 01 00 00 00       	mov    $0x1,%edx
801053af:	e8 5c f7 ff ff       	call   80104b10 <create>
801053b4:	83 c4 10             	add    $0x10,%esp
801053b7:	85 c0                	test   %eax,%eax
801053b9:	74 15                	je     801053d0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801053bb:	83 ec 0c             	sub    $0xc,%esp
801053be:	50                   	push   %eax
801053bf:	e8 8c c5 ff ff       	call   80101950 <iunlockput>
  end_op();
801053c4:	e8 d7 d8 ff ff       	call   80102ca0 <end_op>
  return 0;
801053c9:	83 c4 10             	add    $0x10,%esp
801053cc:	31 c0                	xor    %eax,%eax
}
801053ce:	c9                   	leave  
801053cf:	c3                   	ret    
    end_op();
801053d0:	e8 cb d8 ff ff       	call   80102ca0 <end_op>
    return -1;
801053d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053da:	c9                   	leave  
801053db:	c3                   	ret    
801053dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053e0 <sys_mknod>:

int
sys_mknod(void)
{
801053e0:	55                   	push   %ebp
801053e1:	89 e5                	mov    %esp,%ebp
801053e3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801053e6:	e8 45 d8 ff ff       	call   80102c30 <begin_op>
  if((argstr(0, &path)) < 0 ||
801053eb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801053ee:	83 ec 08             	sub    $0x8,%esp
801053f1:	50                   	push   %eax
801053f2:	6a 00                	push   $0x0
801053f4:	e8 57 f6 ff ff       	call   80104a50 <argstr>
801053f9:	83 c4 10             	add    $0x10,%esp
801053fc:	85 c0                	test   %eax,%eax
801053fe:	78 60                	js     80105460 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105400:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105403:	83 ec 08             	sub    $0x8,%esp
80105406:	50                   	push   %eax
80105407:	6a 01                	push   $0x1
80105409:	e8 92 f5 ff ff       	call   801049a0 <argint>
  if((argstr(0, &path)) < 0 ||
8010540e:	83 c4 10             	add    $0x10,%esp
80105411:	85 c0                	test   %eax,%eax
80105413:	78 4b                	js     80105460 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105415:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105418:	83 ec 08             	sub    $0x8,%esp
8010541b:	50                   	push   %eax
8010541c:	6a 02                	push   $0x2
8010541e:	e8 7d f5 ff ff       	call   801049a0 <argint>
     argint(1, &major) < 0 ||
80105423:	83 c4 10             	add    $0x10,%esp
80105426:	85 c0                	test   %eax,%eax
80105428:	78 36                	js     80105460 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010542a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010542e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105431:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
80105435:	ba 03 00 00 00       	mov    $0x3,%edx
8010543a:	50                   	push   %eax
8010543b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010543e:	e8 cd f6 ff ff       	call   80104b10 <create>
80105443:	83 c4 10             	add    $0x10,%esp
80105446:	85 c0                	test   %eax,%eax
80105448:	74 16                	je     80105460 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010544a:	83 ec 0c             	sub    $0xc,%esp
8010544d:	50                   	push   %eax
8010544e:	e8 fd c4 ff ff       	call   80101950 <iunlockput>
  end_op();
80105453:	e8 48 d8 ff ff       	call   80102ca0 <end_op>
  return 0;
80105458:	83 c4 10             	add    $0x10,%esp
8010545b:	31 c0                	xor    %eax,%eax
}
8010545d:	c9                   	leave  
8010545e:	c3                   	ret    
8010545f:	90                   	nop
    end_op();
80105460:	e8 3b d8 ff ff       	call   80102ca0 <end_op>
    return -1;
80105465:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010546a:	c9                   	leave  
8010546b:	c3                   	ret    
8010546c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105470 <sys_chdir>:

int
sys_chdir(void)
{
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	56                   	push   %esi
80105474:	53                   	push   %ebx
80105475:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105478:	e8 23 e4 ff ff       	call   801038a0 <myproc>
8010547d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010547f:	e8 ac d7 ff ff       	call   80102c30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105484:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105487:	83 ec 08             	sub    $0x8,%esp
8010548a:	50                   	push   %eax
8010548b:	6a 00                	push   $0x0
8010548d:	e8 be f5 ff ff       	call   80104a50 <argstr>
80105492:	83 c4 10             	add    $0x10,%esp
80105495:	85 c0                	test   %eax,%eax
80105497:	78 77                	js     80105510 <sys_chdir+0xa0>
80105499:	83 ec 0c             	sub    $0xc,%esp
8010549c:	ff 75 f4             	pushl  -0xc(%ebp)
8010549f:	e8 7c ca ff ff       	call   80101f20 <namei>
801054a4:	83 c4 10             	add    $0x10,%esp
801054a7:	85 c0                	test   %eax,%eax
801054a9:	89 c3                	mov    %eax,%ebx
801054ab:	74 63                	je     80105510 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801054ad:	83 ec 0c             	sub    $0xc,%esp
801054b0:	50                   	push   %eax
801054b1:	e8 0a c2 ff ff       	call   801016c0 <ilock>
  if(ip->type != T_DIR){
801054b6:	83 c4 10             	add    $0x10,%esp
801054b9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054be:	75 30                	jne    801054f0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801054c0:	83 ec 0c             	sub    $0xc,%esp
801054c3:	53                   	push   %ebx
801054c4:	e8 d7 c2 ff ff       	call   801017a0 <iunlock>
  iput(curproc->cwd);
801054c9:	58                   	pop    %eax
801054ca:	ff 76 68             	pushl  0x68(%esi)
801054cd:	e8 1e c3 ff ff       	call   801017f0 <iput>
  end_op();
801054d2:	e8 c9 d7 ff ff       	call   80102ca0 <end_op>
  curproc->cwd = ip;
801054d7:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
801054da:	83 c4 10             	add    $0x10,%esp
801054dd:	31 c0                	xor    %eax,%eax
}
801054df:	8d 65 f8             	lea    -0x8(%ebp),%esp
801054e2:	5b                   	pop    %ebx
801054e3:	5e                   	pop    %esi
801054e4:	5d                   	pop    %ebp
801054e5:	c3                   	ret    
801054e6:	8d 76 00             	lea    0x0(%esi),%esi
801054e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
801054f0:	83 ec 0c             	sub    $0xc,%esp
801054f3:	53                   	push   %ebx
801054f4:	e8 57 c4 ff ff       	call   80101950 <iunlockput>
    end_op();
801054f9:	e8 a2 d7 ff ff       	call   80102ca0 <end_op>
    return -1;
801054fe:	83 c4 10             	add    $0x10,%esp
80105501:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105506:	eb d7                	jmp    801054df <sys_chdir+0x6f>
80105508:	90                   	nop
80105509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105510:	e8 8b d7 ff ff       	call   80102ca0 <end_op>
    return -1;
80105515:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010551a:	eb c3                	jmp    801054df <sys_chdir+0x6f>
8010551c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105520 <sys_exec>:

int
sys_exec(void)
{
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
80105523:	57                   	push   %edi
80105524:	56                   	push   %esi
80105525:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105526:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010552c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105532:	50                   	push   %eax
80105533:	6a 00                	push   $0x0
80105535:	e8 16 f5 ff ff       	call   80104a50 <argstr>
8010553a:	83 c4 10             	add    $0x10,%esp
8010553d:	85 c0                	test   %eax,%eax
8010553f:	0f 88 87 00 00 00    	js     801055cc <sys_exec+0xac>
80105545:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010554b:	83 ec 08             	sub    $0x8,%esp
8010554e:	50                   	push   %eax
8010554f:	6a 01                	push   $0x1
80105551:	e8 4a f4 ff ff       	call   801049a0 <argint>
80105556:	83 c4 10             	add    $0x10,%esp
80105559:	85 c0                	test   %eax,%eax
8010555b:	78 6f                	js     801055cc <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010555d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105563:	83 ec 04             	sub    $0x4,%esp
  for(i=0;; i++){
80105566:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
80105568:	68 80 00 00 00       	push   $0x80
8010556d:	6a 00                	push   $0x0
8010556f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105575:	50                   	push   %eax
80105576:	e8 25 f1 ff ff       	call   801046a0 <memset>
8010557b:	83 c4 10             	add    $0x10,%esp
8010557e:	eb 2c                	jmp    801055ac <sys_exec+0x8c>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
80105580:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105586:	85 c0                	test   %eax,%eax
80105588:	74 56                	je     801055e0 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
8010558a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105590:	83 ec 08             	sub    $0x8,%esp
80105593:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105596:	52                   	push   %edx
80105597:	50                   	push   %eax
80105598:	e8 93 f3 ff ff       	call   80104930 <fetchstr>
8010559d:	83 c4 10             	add    $0x10,%esp
801055a0:	85 c0                	test   %eax,%eax
801055a2:	78 28                	js     801055cc <sys_exec+0xac>
  for(i=0;; i++){
801055a4:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
801055a7:	83 fb 20             	cmp    $0x20,%ebx
801055aa:	74 20                	je     801055cc <sys_exec+0xac>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801055ac:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801055b2:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
801055b9:	83 ec 08             	sub    $0x8,%esp
801055bc:	57                   	push   %edi
801055bd:	01 f0                	add    %esi,%eax
801055bf:	50                   	push   %eax
801055c0:	e8 2b f3 ff ff       	call   801048f0 <fetchint>
801055c5:	83 c4 10             	add    $0x10,%esp
801055c8:	85 c0                	test   %eax,%eax
801055ca:	79 b4                	jns    80105580 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
801055cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801055cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801055d4:	5b                   	pop    %ebx
801055d5:	5e                   	pop    %esi
801055d6:	5f                   	pop    %edi
801055d7:	5d                   	pop    %ebp
801055d8:	c3                   	ret    
801055d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
801055e0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801055e6:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
801055e9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801055f0:	00 00 00 00 
  return exec(path, argv);
801055f4:	50                   	push   %eax
801055f5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801055fb:	e8 50 b4 ff ff       	call   80100a50 <exec>
80105600:	83 c4 10             	add    $0x10,%esp
}
80105603:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105606:	5b                   	pop    %ebx
80105607:	5e                   	pop    %esi
80105608:	5f                   	pop    %edi
80105609:	5d                   	pop    %ebp
8010560a:	c3                   	ret    
8010560b:	90                   	nop
8010560c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105610 <sys_pipe>:

int
sys_pipe(void)
{
80105610:	55                   	push   %ebp
80105611:	89 e5                	mov    %esp,%ebp
80105613:	57                   	push   %edi
80105614:	56                   	push   %esi
80105615:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105616:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105619:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010561c:	6a 08                	push   $0x8
8010561e:	50                   	push   %eax
8010561f:	6a 00                	push   $0x0
80105621:	e8 ca f3 ff ff       	call   801049f0 <argptr>
80105626:	83 c4 10             	add    $0x10,%esp
80105629:	85 c0                	test   %eax,%eax
8010562b:	0f 88 ae 00 00 00    	js     801056df <sys_pipe+0xcf>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105631:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105634:	83 ec 08             	sub    $0x8,%esp
80105637:	50                   	push   %eax
80105638:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010563b:	50                   	push   %eax
8010563c:	e8 8f dc ff ff       	call   801032d0 <pipealloc>
80105641:	83 c4 10             	add    $0x10,%esp
80105644:	85 c0                	test   %eax,%eax
80105646:	0f 88 93 00 00 00    	js     801056df <sys_pipe+0xcf>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010564c:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
8010564f:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80105651:	e8 4a e2 ff ff       	call   801038a0 <myproc>
80105656:	eb 10                	jmp    80105668 <sys_pipe+0x58>
80105658:	90                   	nop
80105659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(fd = 0; fd < NOFILE; fd++){
80105660:	83 c3 01             	add    $0x1,%ebx
80105663:	83 fb 10             	cmp    $0x10,%ebx
80105666:	74 60                	je     801056c8 <sys_pipe+0xb8>
    if(curproc->ofile[fd] == 0){
80105668:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010566c:	85 f6                	test   %esi,%esi
8010566e:	75 f0                	jne    80105660 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
80105670:	8d 73 08             	lea    0x8(%ebx),%esi
80105673:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105677:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
8010567a:	e8 21 e2 ff ff       	call   801038a0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
8010567f:	31 d2                	xor    %edx,%edx
80105681:	eb 0d                	jmp    80105690 <sys_pipe+0x80>
80105683:	90                   	nop
80105684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105688:	83 c2 01             	add    $0x1,%edx
8010568b:	83 fa 10             	cmp    $0x10,%edx
8010568e:	74 28                	je     801056b8 <sys_pipe+0xa8>
    if(curproc->ofile[fd] == 0){
80105690:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105694:	85 c9                	test   %ecx,%ecx
80105696:	75 f0                	jne    80105688 <sys_pipe+0x78>
      curproc->ofile[fd] = f;
80105698:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
8010569c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010569f:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801056a1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801056a4:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801056a7:	31 c0                	xor    %eax,%eax
}
801056a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056ac:	5b                   	pop    %ebx
801056ad:	5e                   	pop    %esi
801056ae:	5f                   	pop    %edi
801056af:	5d                   	pop    %ebp
801056b0:	c3                   	ret    
801056b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
801056b8:	e8 e3 e1 ff ff       	call   801038a0 <myproc>
801056bd:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801056c4:	00 
801056c5:	8d 76 00             	lea    0x0(%esi),%esi
    fileclose(rf);
801056c8:	83 ec 0c             	sub    $0xc,%esp
801056cb:	ff 75 e0             	pushl  -0x20(%ebp)
801056ce:	e8 ad b7 ff ff       	call   80100e80 <fileclose>
    fileclose(wf);
801056d3:	58                   	pop    %eax
801056d4:	ff 75 e4             	pushl  -0x1c(%ebp)
801056d7:	e8 a4 b7 ff ff       	call   80100e80 <fileclose>
    return -1;
801056dc:	83 c4 10             	add    $0x10,%esp
801056df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056e4:	eb c3                	jmp    801056a9 <sys_pipe+0x99>
801056e6:	66 90                	xchg   %ax,%ax
801056e8:	66 90                	xchg   %ax,%ax
801056ea:	66 90                	xchg   %ax,%ax
801056ec:	66 90                	xchg   %ax,%ax
801056ee:	66 90                	xchg   %ax,%ax

801056f0 <sys_fork>:
#include "proc.h"
#include "pstat.h"

int
sys_fork(void)
{
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
  return fork();
}
801056f3:	5d                   	pop    %ebp
  return fork();
801056f4:	e9 47 e3 ff ff       	jmp    80103a40 <fork>
801056f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105700 <sys_exit>:

int
sys_exit(void)
{
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
80105703:	83 ec 08             	sub    $0x8,%esp
  exit();
80105706:	e8 35 e6 ff ff       	call   80103d40 <exit>
  return 0;  // not reached
}
8010570b:	31 c0                	xor    %eax,%eax
8010570d:	c9                   	leave  
8010570e:	c3                   	ret    
8010570f:	90                   	nop

80105710 <sys_wait>:

int
sys_wait(void)
{
80105710:	55                   	push   %ebp
80105711:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105713:	5d                   	pop    %ebp
  return wait();
80105714:	e9 67 e8 ff ff       	jmp    80103f80 <wait>
80105719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105720 <sys_kill>:

int
sys_kill(void)
{
80105720:	55                   	push   %ebp
80105721:	89 e5                	mov    %esp,%ebp
80105723:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105726:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105729:	50                   	push   %eax
8010572a:	6a 00                	push   $0x0
8010572c:	e8 6f f2 ff ff       	call   801049a0 <argint>
80105731:	83 c4 10             	add    $0x10,%esp
80105734:	85 c0                	test   %eax,%eax
80105736:	78 18                	js     80105750 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105738:	83 ec 0c             	sub    $0xc,%esp
8010573b:	ff 75 f4             	pushl  -0xc(%ebp)
8010573e:	e8 9d e9 ff ff       	call   801040e0 <kill>
80105743:	83 c4 10             	add    $0x10,%esp
}
80105746:	c9                   	leave  
80105747:	c3                   	ret    
80105748:	90                   	nop
80105749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105750:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105755:	c9                   	leave  
80105756:	c3                   	ret    
80105757:	89 f6                	mov    %esi,%esi
80105759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105760 <sys_getpid>:

int
sys_getpid(void)
{
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
80105763:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105766:	e8 35 e1 ff ff       	call   801038a0 <myproc>
8010576b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010576e:	c9                   	leave  
8010576f:	c3                   	ret    

80105770 <sys_sbrk>:

int
sys_sbrk(void)
{
80105770:	55                   	push   %ebp
80105771:	89 e5                	mov    %esp,%ebp
80105773:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105774:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105777:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010577a:	50                   	push   %eax
8010577b:	6a 00                	push   $0x0
8010577d:	e8 1e f2 ff ff       	call   801049a0 <argint>
80105782:	83 c4 10             	add    $0x10,%esp
80105785:	85 c0                	test   %eax,%eax
80105787:	78 27                	js     801057b0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105789:	e8 12 e1 ff ff       	call   801038a0 <myproc>
  if(growproc(n) < 0)
8010578e:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
80105791:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105793:	ff 75 f4             	pushl  -0xc(%ebp)
80105796:	e8 25 e2 ff ff       	call   801039c0 <growproc>
8010579b:	83 c4 10             	add    $0x10,%esp
8010579e:	85 c0                	test   %eax,%eax
801057a0:	78 0e                	js     801057b0 <sys_sbrk+0x40>
    return -1;
  return addr;
}
801057a2:	89 d8                	mov    %ebx,%eax
801057a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057a7:	c9                   	leave  
801057a8:	c3                   	ret    
801057a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801057b0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801057b5:	eb eb                	jmp    801057a2 <sys_sbrk+0x32>
801057b7:	89 f6                	mov    %esi,%esi
801057b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057c0 <sys_sleep>:

int
sys_sleep(void)
{
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801057c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801057c7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801057ca:	50                   	push   %eax
801057cb:	6a 00                	push   $0x0
801057cd:	e8 ce f1 ff ff       	call   801049a0 <argint>
801057d2:	83 c4 10             	add    $0x10,%esp
801057d5:	85 c0                	test   %eax,%eax
801057d7:	0f 88 8a 00 00 00    	js     80105867 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801057dd:	83 ec 0c             	sub    $0xc,%esp
801057e0:	68 40 68 11 80       	push   $0x80116840
801057e5:	e8 a6 ed ff ff       	call   80104590 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801057ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
801057ed:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
801057f0:	8b 1d 80 70 11 80    	mov    0x80117080,%ebx
  while(ticks - ticks0 < n){
801057f6:	85 d2                	test   %edx,%edx
801057f8:	75 27                	jne    80105821 <sys_sleep+0x61>
801057fa:	eb 54                	jmp    80105850 <sys_sleep+0x90>
801057fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105800:	83 ec 08             	sub    $0x8,%esp
80105803:	68 40 68 11 80       	push   $0x80116840
80105808:	68 80 70 11 80       	push   $0x80117080
8010580d:	e8 ae e6 ff ff       	call   80103ec0 <sleep>
  while(ticks - ticks0 < n){
80105812:	a1 80 70 11 80       	mov    0x80117080,%eax
80105817:	83 c4 10             	add    $0x10,%esp
8010581a:	29 d8                	sub    %ebx,%eax
8010581c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010581f:	73 2f                	jae    80105850 <sys_sleep+0x90>
    if(myproc()->killed){
80105821:	e8 7a e0 ff ff       	call   801038a0 <myproc>
80105826:	8b 40 24             	mov    0x24(%eax),%eax
80105829:	85 c0                	test   %eax,%eax
8010582b:	74 d3                	je     80105800 <sys_sleep+0x40>
      release(&tickslock);
8010582d:	83 ec 0c             	sub    $0xc,%esp
80105830:	68 40 68 11 80       	push   $0x80116840
80105835:	e8 16 ee ff ff       	call   80104650 <release>
      return -1;
8010583a:	83 c4 10             	add    $0x10,%esp
8010583d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105842:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105845:	c9                   	leave  
80105846:	c3                   	ret    
80105847:	89 f6                	mov    %esi,%esi
80105849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
80105850:	83 ec 0c             	sub    $0xc,%esp
80105853:	68 40 68 11 80       	push   $0x80116840
80105858:	e8 f3 ed ff ff       	call   80104650 <release>
  return 0;
8010585d:	83 c4 10             	add    $0x10,%esp
80105860:	31 c0                	xor    %eax,%eax
}
80105862:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105865:	c9                   	leave  
80105866:	c3                   	ret    
    return -1;
80105867:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010586c:	eb f4                	jmp    80105862 <sys_sleep+0xa2>
8010586e:	66 90                	xchg   %ax,%ax

80105870 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105870:	55                   	push   %ebp
80105871:	89 e5                	mov    %esp,%ebp
80105873:	53                   	push   %ebx
80105874:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105877:	68 40 68 11 80       	push   $0x80116840
8010587c:	e8 0f ed ff ff       	call   80104590 <acquire>
  xticks = ticks;
80105881:	8b 1d 80 70 11 80    	mov    0x80117080,%ebx
  release(&tickslock);
80105887:	c7 04 24 40 68 11 80 	movl   $0x80116840,(%esp)
8010588e:	e8 bd ed ff ff       	call   80104650 <release>
  return xticks;
}
80105893:	89 d8                	mov    %ebx,%eax
80105895:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105898:	c9                   	leave  
80105899:	c3                   	ret    
8010589a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801058a0 <sys_gettime>:

int
sys_gettime(void) {
801058a0:	55                   	push   %ebp
801058a1:	89 e5                	mov    %esp,%ebp
801058a3:	83 ec 1c             	sub    $0x1c,%esp
  struct rtcdate *d;
  if (argptr(0, (char **)&d, sizeof(struct rtcdate)) < 0)
801058a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058a9:	6a 18                	push   $0x18
801058ab:	50                   	push   %eax
801058ac:	6a 00                	push   $0x0
801058ae:	e8 3d f1 ff ff       	call   801049f0 <argptr>
801058b3:	83 c4 10             	add    $0x10,%esp
801058b6:	85 c0                	test   %eax,%eax
801058b8:	78 16                	js     801058d0 <sys_gettime+0x30>
      return -1;
  cmostime(d);
801058ba:	83 ec 0c             	sub    $0xc,%esp
801058bd:	ff 75 f4             	pushl  -0xc(%ebp)
801058c0:	e8 8b cf ff ff       	call   80102850 <cmostime>
  return 0;
801058c5:	83 c4 10             	add    $0x10,%esp
801058c8:	31 c0                	xor    %eax,%eax
}
801058ca:	c9                   	leave  
801058cb:	c3                   	ret    
801058cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
801058d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801058d5:	c9                   	leave  
801058d6:	c3                   	ret    
801058d7:	89 f6                	mov    %esi,%esi
801058d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058e0 <sys_settickets>:

int
sys_settickets(void) {
801058e0:	55                   	push   %ebp
801058e1:	89 e5                	mov    %esp,%ebp
801058e3:	83 ec 20             	sub    $0x20,%esp
  int n;
  if(argint(0, &n) < 0) {
801058e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058e9:	50                   	push   %eax
801058ea:	6a 00                	push   $0x0
801058ec:	e8 af f0 ff ff       	call   801049a0 <argint>
801058f1:	83 c4 10             	add    $0x10,%esp
801058f4:	85 c0                	test   %eax,%eax
801058f6:	78 18                	js     80105910 <sys_settickets+0x30>
    return -1;
  }
  else {
    settickets(n);
801058f8:	83 ec 0c             	sub    $0xc,%esp
801058fb:	ff 75 f4             	pushl  -0xc(%ebp)
801058fe:	e8 5d e8 ff ff       	call   80104160 <settickets>
  }
  return 0;
80105903:	83 c4 10             	add    $0x10,%esp
80105906:	31 c0                	xor    %eax,%eax
}
80105908:	c9                   	leave  
80105909:	c3                   	ret    
8010590a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105910:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105915:	c9                   	leave  
80105916:	c3                   	ret    
80105917:	89 f6                	mov    %esi,%esi
80105919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105920 <sys_getpinfo>:

int
sys_getpinfo(void){
80105920:	55                   	push   %ebp
80105921:	89 e5                	mov    %esp,%ebp
80105923:	83 ec 1c             	sub    $0x1c,%esp
    struct pstat *d;
  if (argptr(0, (char **)&d, sizeof(struct pstat)) < 0)
80105926:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105929:	68 00 04 00 00       	push   $0x400
8010592e:	50                   	push   %eax
8010592f:	6a 00                	push   $0x0
80105931:	e8 ba f0 ff ff       	call   801049f0 <argptr>
80105936:	83 c4 10             	add    $0x10,%esp
80105939:	85 c0                	test   %eax,%eax
8010593b:	78 13                	js     80105950 <sys_getpinfo+0x30>
      return -1;
  getpinfo(d);
8010593d:	83 ec 0c             	sub    $0xc,%esp
80105940:	ff 75 f4             	pushl  -0xc(%ebp)
80105943:	e8 88 e8 ff ff       	call   801041d0 <getpinfo>
  return 0;
80105948:	83 c4 10             	add    $0x10,%esp
8010594b:	31 c0                	xor    %eax,%eax
}
8010594d:	c9                   	leave  
8010594e:	c3                   	ret    
8010594f:	90                   	nop
      return -1;
80105950:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105955:	c9                   	leave  
80105956:	c3                   	ret    
80105957:	89 f6                	mov    %esi,%esi
80105959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105960 <sys_getreadcount>:

int
sys_getreadcount(void){
80105960:	55                   	push   %ebp
80105961:	89 e5                	mov    %esp,%ebp
  return getreadcount();
}
80105963:	5d                   	pop    %ebp
  return getreadcount();
80105964:	e9 27 f1 ff ff       	jmp    80104a90 <getreadcount>
80105969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105970 <sys_mprotect>:

int
sys_mprotect(void){
80105970:	55                   	push   %ebp
80105971:	89 e5                	mov    %esp,%ebp
80105973:	83 ec 20             	sub    $0x20,%esp
  int d;
  int n = 0;
  if(argint(0, &d)<0 || argint(1, &n)<0)
80105976:	8d 45 f0             	lea    -0x10(%ebp),%eax
  int n = 0;
80105979:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(argint(0, &d)<0 || argint(1, &n)<0)
80105980:	50                   	push   %eax
80105981:	6a 00                	push   $0x0
80105983:	e8 18 f0 ff ff       	call   801049a0 <argint>
80105988:	83 c4 10             	add    $0x10,%esp
8010598b:	85 c0                	test   %eax,%eax
8010598d:	78 31                	js     801059c0 <sys_mprotect+0x50>
8010598f:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105992:	83 ec 08             	sub    $0x8,%esp
80105995:	50                   	push   %eax
80105996:	6a 01                	push   $0x1
80105998:	e8 03 f0 ff ff       	call   801049a0 <argint>
8010599d:	83 c4 10             	add    $0x10,%esp
801059a0:	85 c0                	test   %eax,%eax
801059a2:	78 1c                	js     801059c0 <sys_mprotect+0x50>
    return -1;
  return mprotect((void *)d,n);
801059a4:	83 ec 08             	sub    $0x8,%esp
801059a7:	ff 75 f4             	pushl  -0xc(%ebp)
801059aa:	ff 75 f0             	pushl  -0x10(%ebp)
801059ad:	e8 fe 18 00 00       	call   801072b0 <mprotect>
801059b2:	83 c4 10             	add    $0x10,%esp

}
801059b5:	c9                   	leave  
801059b6:	c3                   	ret    
801059b7:	89 f6                	mov    %esi,%esi
801059b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
801059c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801059c5:	c9                   	leave  
801059c6:	c3                   	ret    
801059c7:	89 f6                	mov    %esi,%esi
801059c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801059d0 <sys_munprotect>:

int
sys_munprotect(void){
801059d0:	55                   	push   %ebp
801059d1:	89 e5                	mov    %esp,%ebp
801059d3:	83 ec 20             	sub    $0x20,%esp
  int d;
  int n = 0;
  if(argint(0, &d)<0 || argint(1, &n)<0)
801059d6:	8d 45 f0             	lea    -0x10(%ebp),%eax
  int n = 0;
801059d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(argint(0, &d)<0 || argint(1, &n)<0)
801059e0:	50                   	push   %eax
801059e1:	6a 00                	push   $0x0
801059e3:	e8 b8 ef ff ff       	call   801049a0 <argint>
801059e8:	83 c4 10             	add    $0x10,%esp
801059eb:	85 c0                	test   %eax,%eax
801059ed:	78 31                	js     80105a20 <sys_munprotect+0x50>
801059ef:	8d 45 f4             	lea    -0xc(%ebp),%eax
801059f2:	83 ec 08             	sub    $0x8,%esp
801059f5:	50                   	push   %eax
801059f6:	6a 01                	push   $0x1
801059f8:	e8 a3 ef ff ff       	call   801049a0 <argint>
801059fd:	83 c4 10             	add    $0x10,%esp
80105a00:	85 c0                	test   %eax,%eax
80105a02:	78 1c                	js     80105a20 <sys_munprotect+0x50>
    return -1;
  return munprotect((void *)d,n);
80105a04:	83 ec 08             	sub    $0x8,%esp
80105a07:	ff 75 f4             	pushl  -0xc(%ebp)
80105a0a:	ff 75 f0             	pushl  -0x10(%ebp)
80105a0d:	e8 7e 19 00 00       	call   80107390 <munprotect>
80105a12:	83 c4 10             	add    $0x10,%esp

}
80105a15:	c9                   	leave  
80105a16:	c3                   	ret    
80105a17:	89 f6                	mov    %esi,%esi
80105a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80105a20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105a25:	c9                   	leave  
80105a26:	c3                   	ret    

80105a27 <alltraps>:
80105a27:	1e                   	push   %ds
80105a28:	06                   	push   %es
80105a29:	0f a0                	push   %fs
80105a2b:	0f a8                	push   %gs
80105a2d:	60                   	pusha  
80105a2e:	66 b8 10 00          	mov    $0x10,%ax
80105a32:	8e d8                	mov    %eax,%ds
80105a34:	8e c0                	mov    %eax,%es
80105a36:	54                   	push   %esp
80105a37:	e8 c4 00 00 00       	call   80105b00 <trap>
80105a3c:	83 c4 04             	add    $0x4,%esp

80105a3f <trapret>:
80105a3f:	61                   	popa   
80105a40:	0f a9                	pop    %gs
80105a42:	0f a1                	pop    %fs
80105a44:	07                   	pop    %es
80105a45:	1f                   	pop    %ds
80105a46:	83 c4 08             	add    $0x8,%esp
80105a49:	cf                   	iret   
80105a4a:	66 90                	xchg   %ax,%ax
80105a4c:	66 90                	xchg   %ax,%ax
80105a4e:	66 90                	xchg   %ax,%ax

80105a50 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a50:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105a51:	31 c0                	xor    %eax,%eax
{
80105a53:	89 e5                	mov    %esp,%ebp
80105a55:	83 ec 08             	sub    $0x8,%esp
80105a58:	90                   	nop
80105a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105a60:	8b 14 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%edx
80105a67:	c7 04 c5 82 68 11 80 	movl   $0x8e000008,-0x7fee977e(,%eax,8)
80105a6e:	08 00 00 8e 
80105a72:	66 89 14 c5 80 68 11 	mov    %dx,-0x7fee9780(,%eax,8)
80105a79:	80 
80105a7a:	c1 ea 10             	shr    $0x10,%edx
80105a7d:	66 89 14 c5 86 68 11 	mov    %dx,-0x7fee977a(,%eax,8)
80105a84:	80 
  for(i = 0; i < 256; i++)
80105a85:	83 c0 01             	add    $0x1,%eax
80105a88:	3d 00 01 00 00       	cmp    $0x100,%eax
80105a8d:	75 d1                	jne    80105a60 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a8f:	a1 08 b1 10 80       	mov    0x8010b108,%eax

  initlock(&tickslock, "time");
80105a94:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a97:	c7 05 82 6a 11 80 08 	movl   $0xef000008,0x80116a82
80105a9e:	00 00 ef 
  initlock(&tickslock, "time");
80105aa1:	68 f1 7d 10 80       	push   $0x80107df1
80105aa6:	68 40 68 11 80       	push   $0x80116840
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105aab:	66 a3 80 6a 11 80    	mov    %ax,0x80116a80
80105ab1:	c1 e8 10             	shr    $0x10,%eax
80105ab4:	66 a3 86 6a 11 80    	mov    %ax,0x80116a86
  initlock(&tickslock, "time");
80105aba:	e8 91 e9 ff ff       	call   80104450 <initlock>
}
80105abf:	83 c4 10             	add    $0x10,%esp
80105ac2:	c9                   	leave  
80105ac3:	c3                   	ret    
80105ac4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105aca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105ad0 <idtinit>:

void
idtinit(void)
{
80105ad0:	55                   	push   %ebp
  pd[0] = size-1;
80105ad1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105ad6:	89 e5                	mov    %esp,%ebp
80105ad8:	83 ec 10             	sub    $0x10,%esp
80105adb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105adf:	b8 80 68 11 80       	mov    $0x80116880,%eax
80105ae4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105ae8:	c1 e8 10             	shr    $0x10,%eax
80105aeb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105aef:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105af2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105af5:	c9                   	leave  
80105af6:	c3                   	ret    
80105af7:	89 f6                	mov    %esi,%esi
80105af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b00 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105b00:	55                   	push   %ebp
80105b01:	89 e5                	mov    %esp,%ebp
80105b03:	57                   	push   %edi
80105b04:	56                   	push   %esi
80105b05:	53                   	push   %ebx
80105b06:	83 ec 1c             	sub    $0x1c,%esp
80105b09:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
80105b0c:	8b 47 30             	mov    0x30(%edi),%eax
80105b0f:	83 f8 40             	cmp    $0x40,%eax
80105b12:	0f 84 f0 00 00 00    	je     80105c08 <trap+0x108>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105b18:	83 e8 20             	sub    $0x20,%eax
80105b1b:	83 f8 1f             	cmp    $0x1f,%eax
80105b1e:	77 10                	ja     80105b30 <trap+0x30>
80105b20:	ff 24 85 98 7e 10 80 	jmp    *-0x7fef8168(,%eax,4)
80105b27:	89 f6                	mov    %esi,%esi
80105b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105b30:	e8 6b dd ff ff       	call   801038a0 <myproc>
80105b35:	85 c0                	test   %eax,%eax
80105b37:	8b 5f 38             	mov    0x38(%edi),%ebx
80105b3a:	0f 84 14 02 00 00    	je     80105d54 <trap+0x254>
80105b40:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105b44:	0f 84 0a 02 00 00    	je     80105d54 <trap+0x254>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105b4a:	0f 20 d1             	mov    %cr2,%ecx
80105b4d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b50:	e8 2b dd ff ff       	call   80103880 <cpuid>
80105b55:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105b58:	8b 47 34             	mov    0x34(%edi),%eax
80105b5b:	8b 77 30             	mov    0x30(%edi),%esi
80105b5e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105b61:	e8 3a dd ff ff       	call   801038a0 <myproc>
80105b66:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105b69:	e8 32 dd ff ff       	call   801038a0 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b6e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105b71:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105b74:	51                   	push   %ecx
80105b75:	53                   	push   %ebx
80105b76:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
80105b77:	8b 55 e0             	mov    -0x20(%ebp),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b7a:	ff 75 e4             	pushl  -0x1c(%ebp)
80105b7d:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
80105b7e:	83 c2 6c             	add    $0x6c,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b81:	52                   	push   %edx
80105b82:	ff 70 10             	pushl  0x10(%eax)
80105b85:	68 54 7e 10 80       	push   $0x80107e54
80105b8a:	e8 d1 aa ff ff       	call   80100660 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
80105b8f:	83 c4 20             	add    $0x20,%esp
80105b92:	e8 09 dd ff ff       	call   801038a0 <myproc>
80105b97:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105b9e:	e8 fd dc ff ff       	call   801038a0 <myproc>
80105ba3:	85 c0                	test   %eax,%eax
80105ba5:	74 1d                	je     80105bc4 <trap+0xc4>
80105ba7:	e8 f4 dc ff ff       	call   801038a0 <myproc>
80105bac:	8b 50 24             	mov    0x24(%eax),%edx
80105baf:	85 d2                	test   %edx,%edx
80105bb1:	74 11                	je     80105bc4 <trap+0xc4>
80105bb3:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105bb7:	83 e0 03             	and    $0x3,%eax
80105bba:	66 83 f8 03          	cmp    $0x3,%ax
80105bbe:	0f 84 4c 01 00 00    	je     80105d10 <trap+0x210>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105bc4:	e8 d7 dc ff ff       	call   801038a0 <myproc>
80105bc9:	85 c0                	test   %eax,%eax
80105bcb:	74 0b                	je     80105bd8 <trap+0xd8>
80105bcd:	e8 ce dc ff ff       	call   801038a0 <myproc>
80105bd2:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105bd6:	74 68                	je     80105c40 <trap+0x140>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105bd8:	e8 c3 dc ff ff       	call   801038a0 <myproc>
80105bdd:	85 c0                	test   %eax,%eax
80105bdf:	74 19                	je     80105bfa <trap+0xfa>
80105be1:	e8 ba dc ff ff       	call   801038a0 <myproc>
80105be6:	8b 40 24             	mov    0x24(%eax),%eax
80105be9:	85 c0                	test   %eax,%eax
80105beb:	74 0d                	je     80105bfa <trap+0xfa>
80105bed:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105bf1:	83 e0 03             	and    $0x3,%eax
80105bf4:	66 83 f8 03          	cmp    $0x3,%ax
80105bf8:	74 37                	je     80105c31 <trap+0x131>
    exit();
}
80105bfa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105bfd:	5b                   	pop    %ebx
80105bfe:	5e                   	pop    %esi
80105bff:	5f                   	pop    %edi
80105c00:	5d                   	pop    %ebp
80105c01:	c3                   	ret    
80105c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(myproc()->killed)
80105c08:	e8 93 dc ff ff       	call   801038a0 <myproc>
80105c0d:	8b 58 24             	mov    0x24(%eax),%ebx
80105c10:	85 db                	test   %ebx,%ebx
80105c12:	0f 85 e8 00 00 00    	jne    80105d00 <trap+0x200>
    myproc()->tf = tf;
80105c18:	e8 83 dc ff ff       	call   801038a0 <myproc>
80105c1d:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105c20:	e8 7b ee ff ff       	call   80104aa0 <syscall>
    if(myproc()->killed)
80105c25:	e8 76 dc ff ff       	call   801038a0 <myproc>
80105c2a:	8b 48 24             	mov    0x24(%eax),%ecx
80105c2d:	85 c9                	test   %ecx,%ecx
80105c2f:	74 c9                	je     80105bfa <trap+0xfa>
}
80105c31:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c34:	5b                   	pop    %ebx
80105c35:	5e                   	pop    %esi
80105c36:	5f                   	pop    %edi
80105c37:	5d                   	pop    %ebp
      exit();
80105c38:	e9 03 e1 ff ff       	jmp    80103d40 <exit>
80105c3d:	8d 76 00             	lea    0x0(%esi),%esi
  if(myproc() && myproc()->state == RUNNING &&
80105c40:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105c44:	75 92                	jne    80105bd8 <trap+0xd8>
    yield();
80105c46:	e8 25 e2 ff ff       	call   80103e70 <yield>
80105c4b:	eb 8b                	jmp    80105bd8 <trap+0xd8>
80105c4d:	8d 76 00             	lea    0x0(%esi),%esi
    if(cpuid() == 0){
80105c50:	e8 2b dc ff ff       	call   80103880 <cpuid>
80105c55:	85 c0                	test   %eax,%eax
80105c57:	0f 84 c3 00 00 00    	je     80105d20 <trap+0x220>
    lapiceoi();
80105c5d:	e8 2e cb ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105c62:	e8 39 dc ff ff       	call   801038a0 <myproc>
80105c67:	85 c0                	test   %eax,%eax
80105c69:	0f 85 38 ff ff ff    	jne    80105ba7 <trap+0xa7>
80105c6f:	e9 50 ff ff ff       	jmp    80105bc4 <trap+0xc4>
80105c74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
80105c78:	e8 d3 c9 ff ff       	call   80102650 <kbdintr>
    lapiceoi();
80105c7d:	e8 0e cb ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105c82:	e8 19 dc ff ff       	call   801038a0 <myproc>
80105c87:	85 c0                	test   %eax,%eax
80105c89:	0f 85 18 ff ff ff    	jne    80105ba7 <trap+0xa7>
80105c8f:	e9 30 ff ff ff       	jmp    80105bc4 <trap+0xc4>
80105c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80105c98:	e8 53 02 00 00       	call   80105ef0 <uartintr>
    lapiceoi();
80105c9d:	e8 ee ca ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105ca2:	e8 f9 db ff ff       	call   801038a0 <myproc>
80105ca7:	85 c0                	test   %eax,%eax
80105ca9:	0f 85 f8 fe ff ff    	jne    80105ba7 <trap+0xa7>
80105caf:	e9 10 ff ff ff       	jmp    80105bc4 <trap+0xc4>
80105cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105cb8:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105cbc:	8b 77 38             	mov    0x38(%edi),%esi
80105cbf:	e8 bc db ff ff       	call   80103880 <cpuid>
80105cc4:	56                   	push   %esi
80105cc5:	53                   	push   %ebx
80105cc6:	50                   	push   %eax
80105cc7:	68 fc 7d 10 80       	push   $0x80107dfc
80105ccc:	e8 8f a9 ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105cd1:	e8 ba ca ff ff       	call   80102790 <lapiceoi>
    break;
80105cd6:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105cd9:	e8 c2 db ff ff       	call   801038a0 <myproc>
80105cde:	85 c0                	test   %eax,%eax
80105ce0:	0f 85 c1 fe ff ff    	jne    80105ba7 <trap+0xa7>
80105ce6:	e9 d9 fe ff ff       	jmp    80105bc4 <trap+0xc4>
80105ceb:	90                   	nop
80105cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ideintr();
80105cf0:	e8 cb c3 ff ff       	call   801020c0 <ideintr>
80105cf5:	e9 63 ff ff ff       	jmp    80105c5d <trap+0x15d>
80105cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
80105d00:	e8 3b e0 ff ff       	call   80103d40 <exit>
80105d05:	e9 0e ff ff ff       	jmp    80105c18 <trap+0x118>
80105d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
80105d10:	e8 2b e0 ff ff       	call   80103d40 <exit>
80105d15:	e9 aa fe ff ff       	jmp    80105bc4 <trap+0xc4>
80105d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
80105d20:	83 ec 0c             	sub    $0xc,%esp
80105d23:	68 40 68 11 80       	push   $0x80116840
80105d28:	e8 63 e8 ff ff       	call   80104590 <acquire>
      wakeup(&ticks);
80105d2d:	c7 04 24 80 70 11 80 	movl   $0x80117080,(%esp)
      ticks++;
80105d34:	83 05 80 70 11 80 01 	addl   $0x1,0x80117080
      wakeup(&ticks);
80105d3b:	e8 40 e3 ff ff       	call   80104080 <wakeup>
      release(&tickslock);
80105d40:	c7 04 24 40 68 11 80 	movl   $0x80116840,(%esp)
80105d47:	e8 04 e9 ff ff       	call   80104650 <release>
80105d4c:	83 c4 10             	add    $0x10,%esp
80105d4f:	e9 09 ff ff ff       	jmp    80105c5d <trap+0x15d>
80105d54:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105d57:	e8 24 db ff ff       	call   80103880 <cpuid>
80105d5c:	83 ec 0c             	sub    $0xc,%esp
80105d5f:	56                   	push   %esi
80105d60:	53                   	push   %ebx
80105d61:	50                   	push   %eax
80105d62:	ff 77 30             	pushl  0x30(%edi)
80105d65:	68 20 7e 10 80       	push   $0x80107e20
80105d6a:	e8 f1 a8 ff ff       	call   80100660 <cprintf>
      panic("trap");
80105d6f:	83 c4 14             	add    $0x14,%esp
80105d72:	68 f6 7d 10 80       	push   $0x80107df6
80105d77:	e8 14 a6 ff ff       	call   80100390 <panic>
80105d7c:	66 90                	xchg   %ax,%ax
80105d7e:	66 90                	xchg   %ax,%ax

80105d80 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105d80:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
{
80105d85:	55                   	push   %ebp
80105d86:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105d88:	85 c0                	test   %eax,%eax
80105d8a:	74 1c                	je     80105da8 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105d8c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d91:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105d92:	a8 01                	test   $0x1,%al
80105d94:	74 12                	je     80105da8 <uartgetc+0x28>
80105d96:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d9b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105d9c:	0f b6 c0             	movzbl %al,%eax
}
80105d9f:	5d                   	pop    %ebp
80105da0:	c3                   	ret    
80105da1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105da8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105dad:	5d                   	pop    %ebp
80105dae:	c3                   	ret    
80105daf:	90                   	nop

80105db0 <uartputc.part.0>:
uartputc(int c)
80105db0:	55                   	push   %ebp
80105db1:	89 e5                	mov    %esp,%ebp
80105db3:	57                   	push   %edi
80105db4:	56                   	push   %esi
80105db5:	53                   	push   %ebx
80105db6:	89 c7                	mov    %eax,%edi
80105db8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105dbd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105dc2:	83 ec 0c             	sub    $0xc,%esp
80105dc5:	eb 1b                	jmp    80105de2 <uartputc.part.0+0x32>
80105dc7:	89 f6                	mov    %esi,%esi
80105dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
80105dd0:	83 ec 0c             	sub    $0xc,%esp
80105dd3:	6a 0a                	push   $0xa
80105dd5:	e8 d6 c9 ff ff       	call   801027b0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105dda:	83 c4 10             	add    $0x10,%esp
80105ddd:	83 eb 01             	sub    $0x1,%ebx
80105de0:	74 07                	je     80105de9 <uartputc.part.0+0x39>
80105de2:	89 f2                	mov    %esi,%edx
80105de4:	ec                   	in     (%dx),%al
80105de5:	a8 20                	test   $0x20,%al
80105de7:	74 e7                	je     80105dd0 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105de9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dee:	89 f8                	mov    %edi,%eax
80105df0:	ee                   	out    %al,(%dx)
}
80105df1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105df4:	5b                   	pop    %ebx
80105df5:	5e                   	pop    %esi
80105df6:	5f                   	pop    %edi
80105df7:	5d                   	pop    %ebp
80105df8:	c3                   	ret    
80105df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105e00 <uartinit>:
{
80105e00:	55                   	push   %ebp
80105e01:	31 c9                	xor    %ecx,%ecx
80105e03:	89 c8                	mov    %ecx,%eax
80105e05:	89 e5                	mov    %esp,%ebp
80105e07:	57                   	push   %edi
80105e08:	56                   	push   %esi
80105e09:	53                   	push   %ebx
80105e0a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105e0f:	89 da                	mov    %ebx,%edx
80105e11:	83 ec 0c             	sub    $0xc,%esp
80105e14:	ee                   	out    %al,(%dx)
80105e15:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105e1a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105e1f:	89 fa                	mov    %edi,%edx
80105e21:	ee                   	out    %al,(%dx)
80105e22:	b8 0c 00 00 00       	mov    $0xc,%eax
80105e27:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e2c:	ee                   	out    %al,(%dx)
80105e2d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105e32:	89 c8                	mov    %ecx,%eax
80105e34:	89 f2                	mov    %esi,%edx
80105e36:	ee                   	out    %al,(%dx)
80105e37:	b8 03 00 00 00       	mov    $0x3,%eax
80105e3c:	89 fa                	mov    %edi,%edx
80105e3e:	ee                   	out    %al,(%dx)
80105e3f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105e44:	89 c8                	mov    %ecx,%eax
80105e46:	ee                   	out    %al,(%dx)
80105e47:	b8 01 00 00 00       	mov    $0x1,%eax
80105e4c:	89 f2                	mov    %esi,%edx
80105e4e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105e4f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105e54:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105e55:	3c ff                	cmp    $0xff,%al
80105e57:	74 5a                	je     80105eb3 <uartinit+0xb3>
  uart = 1;
80105e59:	c7 05 c0 b5 10 80 01 	movl   $0x1,0x8010b5c0
80105e60:	00 00 00 
80105e63:	89 da                	mov    %ebx,%edx
80105e65:	ec                   	in     (%dx),%al
80105e66:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e6b:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105e6c:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
80105e6f:	bb 18 7f 10 80       	mov    $0x80107f18,%ebx
  ioapicenable(IRQ_COM1, 0);
80105e74:	6a 00                	push   $0x0
80105e76:	6a 04                	push   $0x4
80105e78:	e8 93 c4 ff ff       	call   80102310 <ioapicenable>
80105e7d:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80105e80:	b8 78 00 00 00       	mov    $0x78,%eax
80105e85:	eb 13                	jmp    80105e9a <uartinit+0x9a>
80105e87:	89 f6                	mov    %esi,%esi
80105e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105e90:	83 c3 01             	add    $0x1,%ebx
80105e93:	0f be 03             	movsbl (%ebx),%eax
80105e96:	84 c0                	test   %al,%al
80105e98:	74 19                	je     80105eb3 <uartinit+0xb3>
  if(!uart)
80105e9a:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
80105ea0:	85 d2                	test   %edx,%edx
80105ea2:	74 ec                	je     80105e90 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80105ea4:	83 c3 01             	add    $0x1,%ebx
80105ea7:	e8 04 ff ff ff       	call   80105db0 <uartputc.part.0>
80105eac:	0f be 03             	movsbl (%ebx),%eax
80105eaf:	84 c0                	test   %al,%al
80105eb1:	75 e7                	jne    80105e9a <uartinit+0x9a>
}
80105eb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105eb6:	5b                   	pop    %ebx
80105eb7:	5e                   	pop    %esi
80105eb8:	5f                   	pop    %edi
80105eb9:	5d                   	pop    %ebp
80105eba:	c3                   	ret    
80105ebb:	90                   	nop
80105ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105ec0 <uartputc>:
  if(!uart)
80105ec0:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
{
80105ec6:	55                   	push   %ebp
80105ec7:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105ec9:	85 d2                	test   %edx,%edx
{
80105ecb:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105ece:	74 10                	je     80105ee0 <uartputc+0x20>
}
80105ed0:	5d                   	pop    %ebp
80105ed1:	e9 da fe ff ff       	jmp    80105db0 <uartputc.part.0>
80105ed6:	8d 76 00             	lea    0x0(%esi),%esi
80105ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ee0:	5d                   	pop    %ebp
80105ee1:	c3                   	ret    
80105ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ef0 <uartintr>:

void
uartintr(void)
{
80105ef0:	55                   	push   %ebp
80105ef1:	89 e5                	mov    %esp,%ebp
80105ef3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105ef6:	68 80 5d 10 80       	push   $0x80105d80
80105efb:	e8 50 a9 ff ff       	call   80100850 <consoleintr>
}
80105f00:	83 c4 10             	add    $0x10,%esp
80105f03:	c9                   	leave  
80105f04:	c3                   	ret    

80105f05 <vector0>:
80105f05:	6a 00                	push   $0x0
80105f07:	6a 00                	push   $0x0
80105f09:	e9 19 fb ff ff       	jmp    80105a27 <alltraps>

80105f0e <vector1>:
80105f0e:	6a 00                	push   $0x0
80105f10:	6a 01                	push   $0x1
80105f12:	e9 10 fb ff ff       	jmp    80105a27 <alltraps>

80105f17 <vector2>:
80105f17:	6a 00                	push   $0x0
80105f19:	6a 02                	push   $0x2
80105f1b:	e9 07 fb ff ff       	jmp    80105a27 <alltraps>

80105f20 <vector3>:
80105f20:	6a 00                	push   $0x0
80105f22:	6a 03                	push   $0x3
80105f24:	e9 fe fa ff ff       	jmp    80105a27 <alltraps>

80105f29 <vector4>:
80105f29:	6a 00                	push   $0x0
80105f2b:	6a 04                	push   $0x4
80105f2d:	e9 f5 fa ff ff       	jmp    80105a27 <alltraps>

80105f32 <vector5>:
80105f32:	6a 00                	push   $0x0
80105f34:	6a 05                	push   $0x5
80105f36:	e9 ec fa ff ff       	jmp    80105a27 <alltraps>

80105f3b <vector6>:
80105f3b:	6a 00                	push   $0x0
80105f3d:	6a 06                	push   $0x6
80105f3f:	e9 e3 fa ff ff       	jmp    80105a27 <alltraps>

80105f44 <vector7>:
80105f44:	6a 00                	push   $0x0
80105f46:	6a 07                	push   $0x7
80105f48:	e9 da fa ff ff       	jmp    80105a27 <alltraps>

80105f4d <vector8>:
80105f4d:	6a 08                	push   $0x8
80105f4f:	e9 d3 fa ff ff       	jmp    80105a27 <alltraps>

80105f54 <vector9>:
80105f54:	6a 00                	push   $0x0
80105f56:	6a 09                	push   $0x9
80105f58:	e9 ca fa ff ff       	jmp    80105a27 <alltraps>

80105f5d <vector10>:
80105f5d:	6a 0a                	push   $0xa
80105f5f:	e9 c3 fa ff ff       	jmp    80105a27 <alltraps>

80105f64 <vector11>:
80105f64:	6a 0b                	push   $0xb
80105f66:	e9 bc fa ff ff       	jmp    80105a27 <alltraps>

80105f6b <vector12>:
80105f6b:	6a 0c                	push   $0xc
80105f6d:	e9 b5 fa ff ff       	jmp    80105a27 <alltraps>

80105f72 <vector13>:
80105f72:	6a 0d                	push   $0xd
80105f74:	e9 ae fa ff ff       	jmp    80105a27 <alltraps>

80105f79 <vector14>:
80105f79:	6a 0e                	push   $0xe
80105f7b:	e9 a7 fa ff ff       	jmp    80105a27 <alltraps>

80105f80 <vector15>:
80105f80:	6a 00                	push   $0x0
80105f82:	6a 0f                	push   $0xf
80105f84:	e9 9e fa ff ff       	jmp    80105a27 <alltraps>

80105f89 <vector16>:
80105f89:	6a 00                	push   $0x0
80105f8b:	6a 10                	push   $0x10
80105f8d:	e9 95 fa ff ff       	jmp    80105a27 <alltraps>

80105f92 <vector17>:
80105f92:	6a 11                	push   $0x11
80105f94:	e9 8e fa ff ff       	jmp    80105a27 <alltraps>

80105f99 <vector18>:
80105f99:	6a 00                	push   $0x0
80105f9b:	6a 12                	push   $0x12
80105f9d:	e9 85 fa ff ff       	jmp    80105a27 <alltraps>

80105fa2 <vector19>:
80105fa2:	6a 00                	push   $0x0
80105fa4:	6a 13                	push   $0x13
80105fa6:	e9 7c fa ff ff       	jmp    80105a27 <alltraps>

80105fab <vector20>:
80105fab:	6a 00                	push   $0x0
80105fad:	6a 14                	push   $0x14
80105faf:	e9 73 fa ff ff       	jmp    80105a27 <alltraps>

80105fb4 <vector21>:
80105fb4:	6a 00                	push   $0x0
80105fb6:	6a 15                	push   $0x15
80105fb8:	e9 6a fa ff ff       	jmp    80105a27 <alltraps>

80105fbd <vector22>:
80105fbd:	6a 00                	push   $0x0
80105fbf:	6a 16                	push   $0x16
80105fc1:	e9 61 fa ff ff       	jmp    80105a27 <alltraps>

80105fc6 <vector23>:
80105fc6:	6a 00                	push   $0x0
80105fc8:	6a 17                	push   $0x17
80105fca:	e9 58 fa ff ff       	jmp    80105a27 <alltraps>

80105fcf <vector24>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	6a 18                	push   $0x18
80105fd3:	e9 4f fa ff ff       	jmp    80105a27 <alltraps>

80105fd8 <vector25>:
80105fd8:	6a 00                	push   $0x0
80105fda:	6a 19                	push   $0x19
80105fdc:	e9 46 fa ff ff       	jmp    80105a27 <alltraps>

80105fe1 <vector26>:
80105fe1:	6a 00                	push   $0x0
80105fe3:	6a 1a                	push   $0x1a
80105fe5:	e9 3d fa ff ff       	jmp    80105a27 <alltraps>

80105fea <vector27>:
80105fea:	6a 00                	push   $0x0
80105fec:	6a 1b                	push   $0x1b
80105fee:	e9 34 fa ff ff       	jmp    80105a27 <alltraps>

80105ff3 <vector28>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	6a 1c                	push   $0x1c
80105ff7:	e9 2b fa ff ff       	jmp    80105a27 <alltraps>

80105ffc <vector29>:
80105ffc:	6a 00                	push   $0x0
80105ffe:	6a 1d                	push   $0x1d
80106000:	e9 22 fa ff ff       	jmp    80105a27 <alltraps>

80106005 <vector30>:
80106005:	6a 00                	push   $0x0
80106007:	6a 1e                	push   $0x1e
80106009:	e9 19 fa ff ff       	jmp    80105a27 <alltraps>

8010600e <vector31>:
8010600e:	6a 00                	push   $0x0
80106010:	6a 1f                	push   $0x1f
80106012:	e9 10 fa ff ff       	jmp    80105a27 <alltraps>

80106017 <vector32>:
80106017:	6a 00                	push   $0x0
80106019:	6a 20                	push   $0x20
8010601b:	e9 07 fa ff ff       	jmp    80105a27 <alltraps>

80106020 <vector33>:
80106020:	6a 00                	push   $0x0
80106022:	6a 21                	push   $0x21
80106024:	e9 fe f9 ff ff       	jmp    80105a27 <alltraps>

80106029 <vector34>:
80106029:	6a 00                	push   $0x0
8010602b:	6a 22                	push   $0x22
8010602d:	e9 f5 f9 ff ff       	jmp    80105a27 <alltraps>

80106032 <vector35>:
80106032:	6a 00                	push   $0x0
80106034:	6a 23                	push   $0x23
80106036:	e9 ec f9 ff ff       	jmp    80105a27 <alltraps>

8010603b <vector36>:
8010603b:	6a 00                	push   $0x0
8010603d:	6a 24                	push   $0x24
8010603f:	e9 e3 f9 ff ff       	jmp    80105a27 <alltraps>

80106044 <vector37>:
80106044:	6a 00                	push   $0x0
80106046:	6a 25                	push   $0x25
80106048:	e9 da f9 ff ff       	jmp    80105a27 <alltraps>

8010604d <vector38>:
8010604d:	6a 00                	push   $0x0
8010604f:	6a 26                	push   $0x26
80106051:	e9 d1 f9 ff ff       	jmp    80105a27 <alltraps>

80106056 <vector39>:
80106056:	6a 00                	push   $0x0
80106058:	6a 27                	push   $0x27
8010605a:	e9 c8 f9 ff ff       	jmp    80105a27 <alltraps>

8010605f <vector40>:
8010605f:	6a 00                	push   $0x0
80106061:	6a 28                	push   $0x28
80106063:	e9 bf f9 ff ff       	jmp    80105a27 <alltraps>

80106068 <vector41>:
80106068:	6a 00                	push   $0x0
8010606a:	6a 29                	push   $0x29
8010606c:	e9 b6 f9 ff ff       	jmp    80105a27 <alltraps>

80106071 <vector42>:
80106071:	6a 00                	push   $0x0
80106073:	6a 2a                	push   $0x2a
80106075:	e9 ad f9 ff ff       	jmp    80105a27 <alltraps>

8010607a <vector43>:
8010607a:	6a 00                	push   $0x0
8010607c:	6a 2b                	push   $0x2b
8010607e:	e9 a4 f9 ff ff       	jmp    80105a27 <alltraps>

80106083 <vector44>:
80106083:	6a 00                	push   $0x0
80106085:	6a 2c                	push   $0x2c
80106087:	e9 9b f9 ff ff       	jmp    80105a27 <alltraps>

8010608c <vector45>:
8010608c:	6a 00                	push   $0x0
8010608e:	6a 2d                	push   $0x2d
80106090:	e9 92 f9 ff ff       	jmp    80105a27 <alltraps>

80106095 <vector46>:
80106095:	6a 00                	push   $0x0
80106097:	6a 2e                	push   $0x2e
80106099:	e9 89 f9 ff ff       	jmp    80105a27 <alltraps>

8010609e <vector47>:
8010609e:	6a 00                	push   $0x0
801060a0:	6a 2f                	push   $0x2f
801060a2:	e9 80 f9 ff ff       	jmp    80105a27 <alltraps>

801060a7 <vector48>:
801060a7:	6a 00                	push   $0x0
801060a9:	6a 30                	push   $0x30
801060ab:	e9 77 f9 ff ff       	jmp    80105a27 <alltraps>

801060b0 <vector49>:
801060b0:	6a 00                	push   $0x0
801060b2:	6a 31                	push   $0x31
801060b4:	e9 6e f9 ff ff       	jmp    80105a27 <alltraps>

801060b9 <vector50>:
801060b9:	6a 00                	push   $0x0
801060bb:	6a 32                	push   $0x32
801060bd:	e9 65 f9 ff ff       	jmp    80105a27 <alltraps>

801060c2 <vector51>:
801060c2:	6a 00                	push   $0x0
801060c4:	6a 33                	push   $0x33
801060c6:	e9 5c f9 ff ff       	jmp    80105a27 <alltraps>

801060cb <vector52>:
801060cb:	6a 00                	push   $0x0
801060cd:	6a 34                	push   $0x34
801060cf:	e9 53 f9 ff ff       	jmp    80105a27 <alltraps>

801060d4 <vector53>:
801060d4:	6a 00                	push   $0x0
801060d6:	6a 35                	push   $0x35
801060d8:	e9 4a f9 ff ff       	jmp    80105a27 <alltraps>

801060dd <vector54>:
801060dd:	6a 00                	push   $0x0
801060df:	6a 36                	push   $0x36
801060e1:	e9 41 f9 ff ff       	jmp    80105a27 <alltraps>

801060e6 <vector55>:
801060e6:	6a 00                	push   $0x0
801060e8:	6a 37                	push   $0x37
801060ea:	e9 38 f9 ff ff       	jmp    80105a27 <alltraps>

801060ef <vector56>:
801060ef:	6a 00                	push   $0x0
801060f1:	6a 38                	push   $0x38
801060f3:	e9 2f f9 ff ff       	jmp    80105a27 <alltraps>

801060f8 <vector57>:
801060f8:	6a 00                	push   $0x0
801060fa:	6a 39                	push   $0x39
801060fc:	e9 26 f9 ff ff       	jmp    80105a27 <alltraps>

80106101 <vector58>:
80106101:	6a 00                	push   $0x0
80106103:	6a 3a                	push   $0x3a
80106105:	e9 1d f9 ff ff       	jmp    80105a27 <alltraps>

8010610a <vector59>:
8010610a:	6a 00                	push   $0x0
8010610c:	6a 3b                	push   $0x3b
8010610e:	e9 14 f9 ff ff       	jmp    80105a27 <alltraps>

80106113 <vector60>:
80106113:	6a 00                	push   $0x0
80106115:	6a 3c                	push   $0x3c
80106117:	e9 0b f9 ff ff       	jmp    80105a27 <alltraps>

8010611c <vector61>:
8010611c:	6a 00                	push   $0x0
8010611e:	6a 3d                	push   $0x3d
80106120:	e9 02 f9 ff ff       	jmp    80105a27 <alltraps>

80106125 <vector62>:
80106125:	6a 00                	push   $0x0
80106127:	6a 3e                	push   $0x3e
80106129:	e9 f9 f8 ff ff       	jmp    80105a27 <alltraps>

8010612e <vector63>:
8010612e:	6a 00                	push   $0x0
80106130:	6a 3f                	push   $0x3f
80106132:	e9 f0 f8 ff ff       	jmp    80105a27 <alltraps>

80106137 <vector64>:
80106137:	6a 00                	push   $0x0
80106139:	6a 40                	push   $0x40
8010613b:	e9 e7 f8 ff ff       	jmp    80105a27 <alltraps>

80106140 <vector65>:
80106140:	6a 00                	push   $0x0
80106142:	6a 41                	push   $0x41
80106144:	e9 de f8 ff ff       	jmp    80105a27 <alltraps>

80106149 <vector66>:
80106149:	6a 00                	push   $0x0
8010614b:	6a 42                	push   $0x42
8010614d:	e9 d5 f8 ff ff       	jmp    80105a27 <alltraps>

80106152 <vector67>:
80106152:	6a 00                	push   $0x0
80106154:	6a 43                	push   $0x43
80106156:	e9 cc f8 ff ff       	jmp    80105a27 <alltraps>

8010615b <vector68>:
8010615b:	6a 00                	push   $0x0
8010615d:	6a 44                	push   $0x44
8010615f:	e9 c3 f8 ff ff       	jmp    80105a27 <alltraps>

80106164 <vector69>:
80106164:	6a 00                	push   $0x0
80106166:	6a 45                	push   $0x45
80106168:	e9 ba f8 ff ff       	jmp    80105a27 <alltraps>

8010616d <vector70>:
8010616d:	6a 00                	push   $0x0
8010616f:	6a 46                	push   $0x46
80106171:	e9 b1 f8 ff ff       	jmp    80105a27 <alltraps>

80106176 <vector71>:
80106176:	6a 00                	push   $0x0
80106178:	6a 47                	push   $0x47
8010617a:	e9 a8 f8 ff ff       	jmp    80105a27 <alltraps>

8010617f <vector72>:
8010617f:	6a 00                	push   $0x0
80106181:	6a 48                	push   $0x48
80106183:	e9 9f f8 ff ff       	jmp    80105a27 <alltraps>

80106188 <vector73>:
80106188:	6a 00                	push   $0x0
8010618a:	6a 49                	push   $0x49
8010618c:	e9 96 f8 ff ff       	jmp    80105a27 <alltraps>

80106191 <vector74>:
80106191:	6a 00                	push   $0x0
80106193:	6a 4a                	push   $0x4a
80106195:	e9 8d f8 ff ff       	jmp    80105a27 <alltraps>

8010619a <vector75>:
8010619a:	6a 00                	push   $0x0
8010619c:	6a 4b                	push   $0x4b
8010619e:	e9 84 f8 ff ff       	jmp    80105a27 <alltraps>

801061a3 <vector76>:
801061a3:	6a 00                	push   $0x0
801061a5:	6a 4c                	push   $0x4c
801061a7:	e9 7b f8 ff ff       	jmp    80105a27 <alltraps>

801061ac <vector77>:
801061ac:	6a 00                	push   $0x0
801061ae:	6a 4d                	push   $0x4d
801061b0:	e9 72 f8 ff ff       	jmp    80105a27 <alltraps>

801061b5 <vector78>:
801061b5:	6a 00                	push   $0x0
801061b7:	6a 4e                	push   $0x4e
801061b9:	e9 69 f8 ff ff       	jmp    80105a27 <alltraps>

801061be <vector79>:
801061be:	6a 00                	push   $0x0
801061c0:	6a 4f                	push   $0x4f
801061c2:	e9 60 f8 ff ff       	jmp    80105a27 <alltraps>

801061c7 <vector80>:
801061c7:	6a 00                	push   $0x0
801061c9:	6a 50                	push   $0x50
801061cb:	e9 57 f8 ff ff       	jmp    80105a27 <alltraps>

801061d0 <vector81>:
801061d0:	6a 00                	push   $0x0
801061d2:	6a 51                	push   $0x51
801061d4:	e9 4e f8 ff ff       	jmp    80105a27 <alltraps>

801061d9 <vector82>:
801061d9:	6a 00                	push   $0x0
801061db:	6a 52                	push   $0x52
801061dd:	e9 45 f8 ff ff       	jmp    80105a27 <alltraps>

801061e2 <vector83>:
801061e2:	6a 00                	push   $0x0
801061e4:	6a 53                	push   $0x53
801061e6:	e9 3c f8 ff ff       	jmp    80105a27 <alltraps>

801061eb <vector84>:
801061eb:	6a 00                	push   $0x0
801061ed:	6a 54                	push   $0x54
801061ef:	e9 33 f8 ff ff       	jmp    80105a27 <alltraps>

801061f4 <vector85>:
801061f4:	6a 00                	push   $0x0
801061f6:	6a 55                	push   $0x55
801061f8:	e9 2a f8 ff ff       	jmp    80105a27 <alltraps>

801061fd <vector86>:
801061fd:	6a 00                	push   $0x0
801061ff:	6a 56                	push   $0x56
80106201:	e9 21 f8 ff ff       	jmp    80105a27 <alltraps>

80106206 <vector87>:
80106206:	6a 00                	push   $0x0
80106208:	6a 57                	push   $0x57
8010620a:	e9 18 f8 ff ff       	jmp    80105a27 <alltraps>

8010620f <vector88>:
8010620f:	6a 00                	push   $0x0
80106211:	6a 58                	push   $0x58
80106213:	e9 0f f8 ff ff       	jmp    80105a27 <alltraps>

80106218 <vector89>:
80106218:	6a 00                	push   $0x0
8010621a:	6a 59                	push   $0x59
8010621c:	e9 06 f8 ff ff       	jmp    80105a27 <alltraps>

80106221 <vector90>:
80106221:	6a 00                	push   $0x0
80106223:	6a 5a                	push   $0x5a
80106225:	e9 fd f7 ff ff       	jmp    80105a27 <alltraps>

8010622a <vector91>:
8010622a:	6a 00                	push   $0x0
8010622c:	6a 5b                	push   $0x5b
8010622e:	e9 f4 f7 ff ff       	jmp    80105a27 <alltraps>

80106233 <vector92>:
80106233:	6a 00                	push   $0x0
80106235:	6a 5c                	push   $0x5c
80106237:	e9 eb f7 ff ff       	jmp    80105a27 <alltraps>

8010623c <vector93>:
8010623c:	6a 00                	push   $0x0
8010623e:	6a 5d                	push   $0x5d
80106240:	e9 e2 f7 ff ff       	jmp    80105a27 <alltraps>

80106245 <vector94>:
80106245:	6a 00                	push   $0x0
80106247:	6a 5e                	push   $0x5e
80106249:	e9 d9 f7 ff ff       	jmp    80105a27 <alltraps>

8010624e <vector95>:
8010624e:	6a 00                	push   $0x0
80106250:	6a 5f                	push   $0x5f
80106252:	e9 d0 f7 ff ff       	jmp    80105a27 <alltraps>

80106257 <vector96>:
80106257:	6a 00                	push   $0x0
80106259:	6a 60                	push   $0x60
8010625b:	e9 c7 f7 ff ff       	jmp    80105a27 <alltraps>

80106260 <vector97>:
80106260:	6a 00                	push   $0x0
80106262:	6a 61                	push   $0x61
80106264:	e9 be f7 ff ff       	jmp    80105a27 <alltraps>

80106269 <vector98>:
80106269:	6a 00                	push   $0x0
8010626b:	6a 62                	push   $0x62
8010626d:	e9 b5 f7 ff ff       	jmp    80105a27 <alltraps>

80106272 <vector99>:
80106272:	6a 00                	push   $0x0
80106274:	6a 63                	push   $0x63
80106276:	e9 ac f7 ff ff       	jmp    80105a27 <alltraps>

8010627b <vector100>:
8010627b:	6a 00                	push   $0x0
8010627d:	6a 64                	push   $0x64
8010627f:	e9 a3 f7 ff ff       	jmp    80105a27 <alltraps>

80106284 <vector101>:
80106284:	6a 00                	push   $0x0
80106286:	6a 65                	push   $0x65
80106288:	e9 9a f7 ff ff       	jmp    80105a27 <alltraps>

8010628d <vector102>:
8010628d:	6a 00                	push   $0x0
8010628f:	6a 66                	push   $0x66
80106291:	e9 91 f7 ff ff       	jmp    80105a27 <alltraps>

80106296 <vector103>:
80106296:	6a 00                	push   $0x0
80106298:	6a 67                	push   $0x67
8010629a:	e9 88 f7 ff ff       	jmp    80105a27 <alltraps>

8010629f <vector104>:
8010629f:	6a 00                	push   $0x0
801062a1:	6a 68                	push   $0x68
801062a3:	e9 7f f7 ff ff       	jmp    80105a27 <alltraps>

801062a8 <vector105>:
801062a8:	6a 00                	push   $0x0
801062aa:	6a 69                	push   $0x69
801062ac:	e9 76 f7 ff ff       	jmp    80105a27 <alltraps>

801062b1 <vector106>:
801062b1:	6a 00                	push   $0x0
801062b3:	6a 6a                	push   $0x6a
801062b5:	e9 6d f7 ff ff       	jmp    80105a27 <alltraps>

801062ba <vector107>:
801062ba:	6a 00                	push   $0x0
801062bc:	6a 6b                	push   $0x6b
801062be:	e9 64 f7 ff ff       	jmp    80105a27 <alltraps>

801062c3 <vector108>:
801062c3:	6a 00                	push   $0x0
801062c5:	6a 6c                	push   $0x6c
801062c7:	e9 5b f7 ff ff       	jmp    80105a27 <alltraps>

801062cc <vector109>:
801062cc:	6a 00                	push   $0x0
801062ce:	6a 6d                	push   $0x6d
801062d0:	e9 52 f7 ff ff       	jmp    80105a27 <alltraps>

801062d5 <vector110>:
801062d5:	6a 00                	push   $0x0
801062d7:	6a 6e                	push   $0x6e
801062d9:	e9 49 f7 ff ff       	jmp    80105a27 <alltraps>

801062de <vector111>:
801062de:	6a 00                	push   $0x0
801062e0:	6a 6f                	push   $0x6f
801062e2:	e9 40 f7 ff ff       	jmp    80105a27 <alltraps>

801062e7 <vector112>:
801062e7:	6a 00                	push   $0x0
801062e9:	6a 70                	push   $0x70
801062eb:	e9 37 f7 ff ff       	jmp    80105a27 <alltraps>

801062f0 <vector113>:
801062f0:	6a 00                	push   $0x0
801062f2:	6a 71                	push   $0x71
801062f4:	e9 2e f7 ff ff       	jmp    80105a27 <alltraps>

801062f9 <vector114>:
801062f9:	6a 00                	push   $0x0
801062fb:	6a 72                	push   $0x72
801062fd:	e9 25 f7 ff ff       	jmp    80105a27 <alltraps>

80106302 <vector115>:
80106302:	6a 00                	push   $0x0
80106304:	6a 73                	push   $0x73
80106306:	e9 1c f7 ff ff       	jmp    80105a27 <alltraps>

8010630b <vector116>:
8010630b:	6a 00                	push   $0x0
8010630d:	6a 74                	push   $0x74
8010630f:	e9 13 f7 ff ff       	jmp    80105a27 <alltraps>

80106314 <vector117>:
80106314:	6a 00                	push   $0x0
80106316:	6a 75                	push   $0x75
80106318:	e9 0a f7 ff ff       	jmp    80105a27 <alltraps>

8010631d <vector118>:
8010631d:	6a 00                	push   $0x0
8010631f:	6a 76                	push   $0x76
80106321:	e9 01 f7 ff ff       	jmp    80105a27 <alltraps>

80106326 <vector119>:
80106326:	6a 00                	push   $0x0
80106328:	6a 77                	push   $0x77
8010632a:	e9 f8 f6 ff ff       	jmp    80105a27 <alltraps>

8010632f <vector120>:
8010632f:	6a 00                	push   $0x0
80106331:	6a 78                	push   $0x78
80106333:	e9 ef f6 ff ff       	jmp    80105a27 <alltraps>

80106338 <vector121>:
80106338:	6a 00                	push   $0x0
8010633a:	6a 79                	push   $0x79
8010633c:	e9 e6 f6 ff ff       	jmp    80105a27 <alltraps>

80106341 <vector122>:
80106341:	6a 00                	push   $0x0
80106343:	6a 7a                	push   $0x7a
80106345:	e9 dd f6 ff ff       	jmp    80105a27 <alltraps>

8010634a <vector123>:
8010634a:	6a 00                	push   $0x0
8010634c:	6a 7b                	push   $0x7b
8010634e:	e9 d4 f6 ff ff       	jmp    80105a27 <alltraps>

80106353 <vector124>:
80106353:	6a 00                	push   $0x0
80106355:	6a 7c                	push   $0x7c
80106357:	e9 cb f6 ff ff       	jmp    80105a27 <alltraps>

8010635c <vector125>:
8010635c:	6a 00                	push   $0x0
8010635e:	6a 7d                	push   $0x7d
80106360:	e9 c2 f6 ff ff       	jmp    80105a27 <alltraps>

80106365 <vector126>:
80106365:	6a 00                	push   $0x0
80106367:	6a 7e                	push   $0x7e
80106369:	e9 b9 f6 ff ff       	jmp    80105a27 <alltraps>

8010636e <vector127>:
8010636e:	6a 00                	push   $0x0
80106370:	6a 7f                	push   $0x7f
80106372:	e9 b0 f6 ff ff       	jmp    80105a27 <alltraps>

80106377 <vector128>:
80106377:	6a 00                	push   $0x0
80106379:	68 80 00 00 00       	push   $0x80
8010637e:	e9 a4 f6 ff ff       	jmp    80105a27 <alltraps>

80106383 <vector129>:
80106383:	6a 00                	push   $0x0
80106385:	68 81 00 00 00       	push   $0x81
8010638a:	e9 98 f6 ff ff       	jmp    80105a27 <alltraps>

8010638f <vector130>:
8010638f:	6a 00                	push   $0x0
80106391:	68 82 00 00 00       	push   $0x82
80106396:	e9 8c f6 ff ff       	jmp    80105a27 <alltraps>

8010639b <vector131>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 83 00 00 00       	push   $0x83
801063a2:	e9 80 f6 ff ff       	jmp    80105a27 <alltraps>

801063a7 <vector132>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 84 00 00 00       	push   $0x84
801063ae:	e9 74 f6 ff ff       	jmp    80105a27 <alltraps>

801063b3 <vector133>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 85 00 00 00       	push   $0x85
801063ba:	e9 68 f6 ff ff       	jmp    80105a27 <alltraps>

801063bf <vector134>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 86 00 00 00       	push   $0x86
801063c6:	e9 5c f6 ff ff       	jmp    80105a27 <alltraps>

801063cb <vector135>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 87 00 00 00       	push   $0x87
801063d2:	e9 50 f6 ff ff       	jmp    80105a27 <alltraps>

801063d7 <vector136>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 88 00 00 00       	push   $0x88
801063de:	e9 44 f6 ff ff       	jmp    80105a27 <alltraps>

801063e3 <vector137>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 89 00 00 00       	push   $0x89
801063ea:	e9 38 f6 ff ff       	jmp    80105a27 <alltraps>

801063ef <vector138>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 8a 00 00 00       	push   $0x8a
801063f6:	e9 2c f6 ff ff       	jmp    80105a27 <alltraps>

801063fb <vector139>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 8b 00 00 00       	push   $0x8b
80106402:	e9 20 f6 ff ff       	jmp    80105a27 <alltraps>

80106407 <vector140>:
80106407:	6a 00                	push   $0x0
80106409:	68 8c 00 00 00       	push   $0x8c
8010640e:	e9 14 f6 ff ff       	jmp    80105a27 <alltraps>

80106413 <vector141>:
80106413:	6a 00                	push   $0x0
80106415:	68 8d 00 00 00       	push   $0x8d
8010641a:	e9 08 f6 ff ff       	jmp    80105a27 <alltraps>

8010641f <vector142>:
8010641f:	6a 00                	push   $0x0
80106421:	68 8e 00 00 00       	push   $0x8e
80106426:	e9 fc f5 ff ff       	jmp    80105a27 <alltraps>

8010642b <vector143>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 8f 00 00 00       	push   $0x8f
80106432:	e9 f0 f5 ff ff       	jmp    80105a27 <alltraps>

80106437 <vector144>:
80106437:	6a 00                	push   $0x0
80106439:	68 90 00 00 00       	push   $0x90
8010643e:	e9 e4 f5 ff ff       	jmp    80105a27 <alltraps>

80106443 <vector145>:
80106443:	6a 00                	push   $0x0
80106445:	68 91 00 00 00       	push   $0x91
8010644a:	e9 d8 f5 ff ff       	jmp    80105a27 <alltraps>

8010644f <vector146>:
8010644f:	6a 00                	push   $0x0
80106451:	68 92 00 00 00       	push   $0x92
80106456:	e9 cc f5 ff ff       	jmp    80105a27 <alltraps>

8010645b <vector147>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 93 00 00 00       	push   $0x93
80106462:	e9 c0 f5 ff ff       	jmp    80105a27 <alltraps>

80106467 <vector148>:
80106467:	6a 00                	push   $0x0
80106469:	68 94 00 00 00       	push   $0x94
8010646e:	e9 b4 f5 ff ff       	jmp    80105a27 <alltraps>

80106473 <vector149>:
80106473:	6a 00                	push   $0x0
80106475:	68 95 00 00 00       	push   $0x95
8010647a:	e9 a8 f5 ff ff       	jmp    80105a27 <alltraps>

8010647f <vector150>:
8010647f:	6a 00                	push   $0x0
80106481:	68 96 00 00 00       	push   $0x96
80106486:	e9 9c f5 ff ff       	jmp    80105a27 <alltraps>

8010648b <vector151>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 97 00 00 00       	push   $0x97
80106492:	e9 90 f5 ff ff       	jmp    80105a27 <alltraps>

80106497 <vector152>:
80106497:	6a 00                	push   $0x0
80106499:	68 98 00 00 00       	push   $0x98
8010649e:	e9 84 f5 ff ff       	jmp    80105a27 <alltraps>

801064a3 <vector153>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 99 00 00 00       	push   $0x99
801064aa:	e9 78 f5 ff ff       	jmp    80105a27 <alltraps>

801064af <vector154>:
801064af:	6a 00                	push   $0x0
801064b1:	68 9a 00 00 00       	push   $0x9a
801064b6:	e9 6c f5 ff ff       	jmp    80105a27 <alltraps>

801064bb <vector155>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 9b 00 00 00       	push   $0x9b
801064c2:	e9 60 f5 ff ff       	jmp    80105a27 <alltraps>

801064c7 <vector156>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 9c 00 00 00       	push   $0x9c
801064ce:	e9 54 f5 ff ff       	jmp    80105a27 <alltraps>

801064d3 <vector157>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 9d 00 00 00       	push   $0x9d
801064da:	e9 48 f5 ff ff       	jmp    80105a27 <alltraps>

801064df <vector158>:
801064df:	6a 00                	push   $0x0
801064e1:	68 9e 00 00 00       	push   $0x9e
801064e6:	e9 3c f5 ff ff       	jmp    80105a27 <alltraps>

801064eb <vector159>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 9f 00 00 00       	push   $0x9f
801064f2:	e9 30 f5 ff ff       	jmp    80105a27 <alltraps>

801064f7 <vector160>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 a0 00 00 00       	push   $0xa0
801064fe:	e9 24 f5 ff ff       	jmp    80105a27 <alltraps>

80106503 <vector161>:
80106503:	6a 00                	push   $0x0
80106505:	68 a1 00 00 00       	push   $0xa1
8010650a:	e9 18 f5 ff ff       	jmp    80105a27 <alltraps>

8010650f <vector162>:
8010650f:	6a 00                	push   $0x0
80106511:	68 a2 00 00 00       	push   $0xa2
80106516:	e9 0c f5 ff ff       	jmp    80105a27 <alltraps>

8010651b <vector163>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 a3 00 00 00       	push   $0xa3
80106522:	e9 00 f5 ff ff       	jmp    80105a27 <alltraps>

80106527 <vector164>:
80106527:	6a 00                	push   $0x0
80106529:	68 a4 00 00 00       	push   $0xa4
8010652e:	e9 f4 f4 ff ff       	jmp    80105a27 <alltraps>

80106533 <vector165>:
80106533:	6a 00                	push   $0x0
80106535:	68 a5 00 00 00       	push   $0xa5
8010653a:	e9 e8 f4 ff ff       	jmp    80105a27 <alltraps>

8010653f <vector166>:
8010653f:	6a 00                	push   $0x0
80106541:	68 a6 00 00 00       	push   $0xa6
80106546:	e9 dc f4 ff ff       	jmp    80105a27 <alltraps>

8010654b <vector167>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 a7 00 00 00       	push   $0xa7
80106552:	e9 d0 f4 ff ff       	jmp    80105a27 <alltraps>

80106557 <vector168>:
80106557:	6a 00                	push   $0x0
80106559:	68 a8 00 00 00       	push   $0xa8
8010655e:	e9 c4 f4 ff ff       	jmp    80105a27 <alltraps>

80106563 <vector169>:
80106563:	6a 00                	push   $0x0
80106565:	68 a9 00 00 00       	push   $0xa9
8010656a:	e9 b8 f4 ff ff       	jmp    80105a27 <alltraps>

8010656f <vector170>:
8010656f:	6a 00                	push   $0x0
80106571:	68 aa 00 00 00       	push   $0xaa
80106576:	e9 ac f4 ff ff       	jmp    80105a27 <alltraps>

8010657b <vector171>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 ab 00 00 00       	push   $0xab
80106582:	e9 a0 f4 ff ff       	jmp    80105a27 <alltraps>

80106587 <vector172>:
80106587:	6a 00                	push   $0x0
80106589:	68 ac 00 00 00       	push   $0xac
8010658e:	e9 94 f4 ff ff       	jmp    80105a27 <alltraps>

80106593 <vector173>:
80106593:	6a 00                	push   $0x0
80106595:	68 ad 00 00 00       	push   $0xad
8010659a:	e9 88 f4 ff ff       	jmp    80105a27 <alltraps>

8010659f <vector174>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 ae 00 00 00       	push   $0xae
801065a6:	e9 7c f4 ff ff       	jmp    80105a27 <alltraps>

801065ab <vector175>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 af 00 00 00       	push   $0xaf
801065b2:	e9 70 f4 ff ff       	jmp    80105a27 <alltraps>

801065b7 <vector176>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 b0 00 00 00       	push   $0xb0
801065be:	e9 64 f4 ff ff       	jmp    80105a27 <alltraps>

801065c3 <vector177>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 b1 00 00 00       	push   $0xb1
801065ca:	e9 58 f4 ff ff       	jmp    80105a27 <alltraps>

801065cf <vector178>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 b2 00 00 00       	push   $0xb2
801065d6:	e9 4c f4 ff ff       	jmp    80105a27 <alltraps>

801065db <vector179>:
801065db:	6a 00                	push   $0x0
801065dd:	68 b3 00 00 00       	push   $0xb3
801065e2:	e9 40 f4 ff ff       	jmp    80105a27 <alltraps>

801065e7 <vector180>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 b4 00 00 00       	push   $0xb4
801065ee:	e9 34 f4 ff ff       	jmp    80105a27 <alltraps>

801065f3 <vector181>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 b5 00 00 00       	push   $0xb5
801065fa:	e9 28 f4 ff ff       	jmp    80105a27 <alltraps>

801065ff <vector182>:
801065ff:	6a 00                	push   $0x0
80106601:	68 b6 00 00 00       	push   $0xb6
80106606:	e9 1c f4 ff ff       	jmp    80105a27 <alltraps>

8010660b <vector183>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 b7 00 00 00       	push   $0xb7
80106612:	e9 10 f4 ff ff       	jmp    80105a27 <alltraps>

80106617 <vector184>:
80106617:	6a 00                	push   $0x0
80106619:	68 b8 00 00 00       	push   $0xb8
8010661e:	e9 04 f4 ff ff       	jmp    80105a27 <alltraps>

80106623 <vector185>:
80106623:	6a 00                	push   $0x0
80106625:	68 b9 00 00 00       	push   $0xb9
8010662a:	e9 f8 f3 ff ff       	jmp    80105a27 <alltraps>

8010662f <vector186>:
8010662f:	6a 00                	push   $0x0
80106631:	68 ba 00 00 00       	push   $0xba
80106636:	e9 ec f3 ff ff       	jmp    80105a27 <alltraps>

8010663b <vector187>:
8010663b:	6a 00                	push   $0x0
8010663d:	68 bb 00 00 00       	push   $0xbb
80106642:	e9 e0 f3 ff ff       	jmp    80105a27 <alltraps>

80106647 <vector188>:
80106647:	6a 00                	push   $0x0
80106649:	68 bc 00 00 00       	push   $0xbc
8010664e:	e9 d4 f3 ff ff       	jmp    80105a27 <alltraps>

80106653 <vector189>:
80106653:	6a 00                	push   $0x0
80106655:	68 bd 00 00 00       	push   $0xbd
8010665a:	e9 c8 f3 ff ff       	jmp    80105a27 <alltraps>

8010665f <vector190>:
8010665f:	6a 00                	push   $0x0
80106661:	68 be 00 00 00       	push   $0xbe
80106666:	e9 bc f3 ff ff       	jmp    80105a27 <alltraps>

8010666b <vector191>:
8010666b:	6a 00                	push   $0x0
8010666d:	68 bf 00 00 00       	push   $0xbf
80106672:	e9 b0 f3 ff ff       	jmp    80105a27 <alltraps>

80106677 <vector192>:
80106677:	6a 00                	push   $0x0
80106679:	68 c0 00 00 00       	push   $0xc0
8010667e:	e9 a4 f3 ff ff       	jmp    80105a27 <alltraps>

80106683 <vector193>:
80106683:	6a 00                	push   $0x0
80106685:	68 c1 00 00 00       	push   $0xc1
8010668a:	e9 98 f3 ff ff       	jmp    80105a27 <alltraps>

8010668f <vector194>:
8010668f:	6a 00                	push   $0x0
80106691:	68 c2 00 00 00       	push   $0xc2
80106696:	e9 8c f3 ff ff       	jmp    80105a27 <alltraps>

8010669b <vector195>:
8010669b:	6a 00                	push   $0x0
8010669d:	68 c3 00 00 00       	push   $0xc3
801066a2:	e9 80 f3 ff ff       	jmp    80105a27 <alltraps>

801066a7 <vector196>:
801066a7:	6a 00                	push   $0x0
801066a9:	68 c4 00 00 00       	push   $0xc4
801066ae:	e9 74 f3 ff ff       	jmp    80105a27 <alltraps>

801066b3 <vector197>:
801066b3:	6a 00                	push   $0x0
801066b5:	68 c5 00 00 00       	push   $0xc5
801066ba:	e9 68 f3 ff ff       	jmp    80105a27 <alltraps>

801066bf <vector198>:
801066bf:	6a 00                	push   $0x0
801066c1:	68 c6 00 00 00       	push   $0xc6
801066c6:	e9 5c f3 ff ff       	jmp    80105a27 <alltraps>

801066cb <vector199>:
801066cb:	6a 00                	push   $0x0
801066cd:	68 c7 00 00 00       	push   $0xc7
801066d2:	e9 50 f3 ff ff       	jmp    80105a27 <alltraps>

801066d7 <vector200>:
801066d7:	6a 00                	push   $0x0
801066d9:	68 c8 00 00 00       	push   $0xc8
801066de:	e9 44 f3 ff ff       	jmp    80105a27 <alltraps>

801066e3 <vector201>:
801066e3:	6a 00                	push   $0x0
801066e5:	68 c9 00 00 00       	push   $0xc9
801066ea:	e9 38 f3 ff ff       	jmp    80105a27 <alltraps>

801066ef <vector202>:
801066ef:	6a 00                	push   $0x0
801066f1:	68 ca 00 00 00       	push   $0xca
801066f6:	e9 2c f3 ff ff       	jmp    80105a27 <alltraps>

801066fb <vector203>:
801066fb:	6a 00                	push   $0x0
801066fd:	68 cb 00 00 00       	push   $0xcb
80106702:	e9 20 f3 ff ff       	jmp    80105a27 <alltraps>

80106707 <vector204>:
80106707:	6a 00                	push   $0x0
80106709:	68 cc 00 00 00       	push   $0xcc
8010670e:	e9 14 f3 ff ff       	jmp    80105a27 <alltraps>

80106713 <vector205>:
80106713:	6a 00                	push   $0x0
80106715:	68 cd 00 00 00       	push   $0xcd
8010671a:	e9 08 f3 ff ff       	jmp    80105a27 <alltraps>

8010671f <vector206>:
8010671f:	6a 00                	push   $0x0
80106721:	68 ce 00 00 00       	push   $0xce
80106726:	e9 fc f2 ff ff       	jmp    80105a27 <alltraps>

8010672b <vector207>:
8010672b:	6a 00                	push   $0x0
8010672d:	68 cf 00 00 00       	push   $0xcf
80106732:	e9 f0 f2 ff ff       	jmp    80105a27 <alltraps>

80106737 <vector208>:
80106737:	6a 00                	push   $0x0
80106739:	68 d0 00 00 00       	push   $0xd0
8010673e:	e9 e4 f2 ff ff       	jmp    80105a27 <alltraps>

80106743 <vector209>:
80106743:	6a 00                	push   $0x0
80106745:	68 d1 00 00 00       	push   $0xd1
8010674a:	e9 d8 f2 ff ff       	jmp    80105a27 <alltraps>

8010674f <vector210>:
8010674f:	6a 00                	push   $0x0
80106751:	68 d2 00 00 00       	push   $0xd2
80106756:	e9 cc f2 ff ff       	jmp    80105a27 <alltraps>

8010675b <vector211>:
8010675b:	6a 00                	push   $0x0
8010675d:	68 d3 00 00 00       	push   $0xd3
80106762:	e9 c0 f2 ff ff       	jmp    80105a27 <alltraps>

80106767 <vector212>:
80106767:	6a 00                	push   $0x0
80106769:	68 d4 00 00 00       	push   $0xd4
8010676e:	e9 b4 f2 ff ff       	jmp    80105a27 <alltraps>

80106773 <vector213>:
80106773:	6a 00                	push   $0x0
80106775:	68 d5 00 00 00       	push   $0xd5
8010677a:	e9 a8 f2 ff ff       	jmp    80105a27 <alltraps>

8010677f <vector214>:
8010677f:	6a 00                	push   $0x0
80106781:	68 d6 00 00 00       	push   $0xd6
80106786:	e9 9c f2 ff ff       	jmp    80105a27 <alltraps>

8010678b <vector215>:
8010678b:	6a 00                	push   $0x0
8010678d:	68 d7 00 00 00       	push   $0xd7
80106792:	e9 90 f2 ff ff       	jmp    80105a27 <alltraps>

80106797 <vector216>:
80106797:	6a 00                	push   $0x0
80106799:	68 d8 00 00 00       	push   $0xd8
8010679e:	e9 84 f2 ff ff       	jmp    80105a27 <alltraps>

801067a3 <vector217>:
801067a3:	6a 00                	push   $0x0
801067a5:	68 d9 00 00 00       	push   $0xd9
801067aa:	e9 78 f2 ff ff       	jmp    80105a27 <alltraps>

801067af <vector218>:
801067af:	6a 00                	push   $0x0
801067b1:	68 da 00 00 00       	push   $0xda
801067b6:	e9 6c f2 ff ff       	jmp    80105a27 <alltraps>

801067bb <vector219>:
801067bb:	6a 00                	push   $0x0
801067bd:	68 db 00 00 00       	push   $0xdb
801067c2:	e9 60 f2 ff ff       	jmp    80105a27 <alltraps>

801067c7 <vector220>:
801067c7:	6a 00                	push   $0x0
801067c9:	68 dc 00 00 00       	push   $0xdc
801067ce:	e9 54 f2 ff ff       	jmp    80105a27 <alltraps>

801067d3 <vector221>:
801067d3:	6a 00                	push   $0x0
801067d5:	68 dd 00 00 00       	push   $0xdd
801067da:	e9 48 f2 ff ff       	jmp    80105a27 <alltraps>

801067df <vector222>:
801067df:	6a 00                	push   $0x0
801067e1:	68 de 00 00 00       	push   $0xde
801067e6:	e9 3c f2 ff ff       	jmp    80105a27 <alltraps>

801067eb <vector223>:
801067eb:	6a 00                	push   $0x0
801067ed:	68 df 00 00 00       	push   $0xdf
801067f2:	e9 30 f2 ff ff       	jmp    80105a27 <alltraps>

801067f7 <vector224>:
801067f7:	6a 00                	push   $0x0
801067f9:	68 e0 00 00 00       	push   $0xe0
801067fe:	e9 24 f2 ff ff       	jmp    80105a27 <alltraps>

80106803 <vector225>:
80106803:	6a 00                	push   $0x0
80106805:	68 e1 00 00 00       	push   $0xe1
8010680a:	e9 18 f2 ff ff       	jmp    80105a27 <alltraps>

8010680f <vector226>:
8010680f:	6a 00                	push   $0x0
80106811:	68 e2 00 00 00       	push   $0xe2
80106816:	e9 0c f2 ff ff       	jmp    80105a27 <alltraps>

8010681b <vector227>:
8010681b:	6a 00                	push   $0x0
8010681d:	68 e3 00 00 00       	push   $0xe3
80106822:	e9 00 f2 ff ff       	jmp    80105a27 <alltraps>

80106827 <vector228>:
80106827:	6a 00                	push   $0x0
80106829:	68 e4 00 00 00       	push   $0xe4
8010682e:	e9 f4 f1 ff ff       	jmp    80105a27 <alltraps>

80106833 <vector229>:
80106833:	6a 00                	push   $0x0
80106835:	68 e5 00 00 00       	push   $0xe5
8010683a:	e9 e8 f1 ff ff       	jmp    80105a27 <alltraps>

8010683f <vector230>:
8010683f:	6a 00                	push   $0x0
80106841:	68 e6 00 00 00       	push   $0xe6
80106846:	e9 dc f1 ff ff       	jmp    80105a27 <alltraps>

8010684b <vector231>:
8010684b:	6a 00                	push   $0x0
8010684d:	68 e7 00 00 00       	push   $0xe7
80106852:	e9 d0 f1 ff ff       	jmp    80105a27 <alltraps>

80106857 <vector232>:
80106857:	6a 00                	push   $0x0
80106859:	68 e8 00 00 00       	push   $0xe8
8010685e:	e9 c4 f1 ff ff       	jmp    80105a27 <alltraps>

80106863 <vector233>:
80106863:	6a 00                	push   $0x0
80106865:	68 e9 00 00 00       	push   $0xe9
8010686a:	e9 b8 f1 ff ff       	jmp    80105a27 <alltraps>

8010686f <vector234>:
8010686f:	6a 00                	push   $0x0
80106871:	68 ea 00 00 00       	push   $0xea
80106876:	e9 ac f1 ff ff       	jmp    80105a27 <alltraps>

8010687b <vector235>:
8010687b:	6a 00                	push   $0x0
8010687d:	68 eb 00 00 00       	push   $0xeb
80106882:	e9 a0 f1 ff ff       	jmp    80105a27 <alltraps>

80106887 <vector236>:
80106887:	6a 00                	push   $0x0
80106889:	68 ec 00 00 00       	push   $0xec
8010688e:	e9 94 f1 ff ff       	jmp    80105a27 <alltraps>

80106893 <vector237>:
80106893:	6a 00                	push   $0x0
80106895:	68 ed 00 00 00       	push   $0xed
8010689a:	e9 88 f1 ff ff       	jmp    80105a27 <alltraps>

8010689f <vector238>:
8010689f:	6a 00                	push   $0x0
801068a1:	68 ee 00 00 00       	push   $0xee
801068a6:	e9 7c f1 ff ff       	jmp    80105a27 <alltraps>

801068ab <vector239>:
801068ab:	6a 00                	push   $0x0
801068ad:	68 ef 00 00 00       	push   $0xef
801068b2:	e9 70 f1 ff ff       	jmp    80105a27 <alltraps>

801068b7 <vector240>:
801068b7:	6a 00                	push   $0x0
801068b9:	68 f0 00 00 00       	push   $0xf0
801068be:	e9 64 f1 ff ff       	jmp    80105a27 <alltraps>

801068c3 <vector241>:
801068c3:	6a 00                	push   $0x0
801068c5:	68 f1 00 00 00       	push   $0xf1
801068ca:	e9 58 f1 ff ff       	jmp    80105a27 <alltraps>

801068cf <vector242>:
801068cf:	6a 00                	push   $0x0
801068d1:	68 f2 00 00 00       	push   $0xf2
801068d6:	e9 4c f1 ff ff       	jmp    80105a27 <alltraps>

801068db <vector243>:
801068db:	6a 00                	push   $0x0
801068dd:	68 f3 00 00 00       	push   $0xf3
801068e2:	e9 40 f1 ff ff       	jmp    80105a27 <alltraps>

801068e7 <vector244>:
801068e7:	6a 00                	push   $0x0
801068e9:	68 f4 00 00 00       	push   $0xf4
801068ee:	e9 34 f1 ff ff       	jmp    80105a27 <alltraps>

801068f3 <vector245>:
801068f3:	6a 00                	push   $0x0
801068f5:	68 f5 00 00 00       	push   $0xf5
801068fa:	e9 28 f1 ff ff       	jmp    80105a27 <alltraps>

801068ff <vector246>:
801068ff:	6a 00                	push   $0x0
80106901:	68 f6 00 00 00       	push   $0xf6
80106906:	e9 1c f1 ff ff       	jmp    80105a27 <alltraps>

8010690b <vector247>:
8010690b:	6a 00                	push   $0x0
8010690d:	68 f7 00 00 00       	push   $0xf7
80106912:	e9 10 f1 ff ff       	jmp    80105a27 <alltraps>

80106917 <vector248>:
80106917:	6a 00                	push   $0x0
80106919:	68 f8 00 00 00       	push   $0xf8
8010691e:	e9 04 f1 ff ff       	jmp    80105a27 <alltraps>

80106923 <vector249>:
80106923:	6a 00                	push   $0x0
80106925:	68 f9 00 00 00       	push   $0xf9
8010692a:	e9 f8 f0 ff ff       	jmp    80105a27 <alltraps>

8010692f <vector250>:
8010692f:	6a 00                	push   $0x0
80106931:	68 fa 00 00 00       	push   $0xfa
80106936:	e9 ec f0 ff ff       	jmp    80105a27 <alltraps>

8010693b <vector251>:
8010693b:	6a 00                	push   $0x0
8010693d:	68 fb 00 00 00       	push   $0xfb
80106942:	e9 e0 f0 ff ff       	jmp    80105a27 <alltraps>

80106947 <vector252>:
80106947:	6a 00                	push   $0x0
80106949:	68 fc 00 00 00       	push   $0xfc
8010694e:	e9 d4 f0 ff ff       	jmp    80105a27 <alltraps>

80106953 <vector253>:
80106953:	6a 00                	push   $0x0
80106955:	68 fd 00 00 00       	push   $0xfd
8010695a:	e9 c8 f0 ff ff       	jmp    80105a27 <alltraps>

8010695f <vector254>:
8010695f:	6a 00                	push   $0x0
80106961:	68 fe 00 00 00       	push   $0xfe
80106966:	e9 bc f0 ff ff       	jmp    80105a27 <alltraps>

8010696b <vector255>:
8010696b:	6a 00                	push   $0x0
8010696d:	68 ff 00 00 00       	push   $0xff
80106972:	e9 b0 f0 ff ff       	jmp    80105a27 <alltraps>
80106977:	66 90                	xchg   %ax,%ax
80106979:	66 90                	xchg   %ax,%ax
8010697b:	66 90                	xchg   %ax,%ax
8010697d:	66 90                	xchg   %ax,%ax
8010697f:	90                   	nop

80106980 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106980:	55                   	push   %ebp
80106981:	89 e5                	mov    %esp,%ebp
80106983:	57                   	push   %edi
80106984:	56                   	push   %esi
80106985:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106986:	89 d3                	mov    %edx,%ebx
{
80106988:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
8010698a:	c1 eb 16             	shr    $0x16,%ebx
8010698d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
80106990:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
80106993:	8b 06                	mov    (%esi),%eax
80106995:	a8 01                	test   $0x1,%al
80106997:	74 27                	je     801069c0 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106999:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010699e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801069a4:	c1 ef 0a             	shr    $0xa,%edi
}
801069a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
801069aa:	89 fa                	mov    %edi,%edx
801069ac:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801069b2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
801069b5:	5b                   	pop    %ebx
801069b6:	5e                   	pop    %esi
801069b7:	5f                   	pop    %edi
801069b8:	5d                   	pop    %ebp
801069b9:	c3                   	ret    
801069ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
801069c0:	85 c9                	test   %ecx,%ecx
801069c2:	74 2c                	je     801069f0 <walkpgdir+0x70>
801069c4:	e8 37 bb ff ff       	call   80102500 <kalloc>
801069c9:	85 c0                	test   %eax,%eax
801069cb:	89 c3                	mov    %eax,%ebx
801069cd:	74 21                	je     801069f0 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
801069cf:	83 ec 04             	sub    $0x4,%esp
801069d2:	68 00 10 00 00       	push   $0x1000
801069d7:	6a 00                	push   $0x0
801069d9:	50                   	push   %eax
801069da:	e8 c1 dc ff ff       	call   801046a0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801069df:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801069e5:	83 c4 10             	add    $0x10,%esp
801069e8:	83 c8 07             	or     $0x7,%eax
801069eb:	89 06                	mov    %eax,(%esi)
801069ed:	eb b5                	jmp    801069a4 <walkpgdir+0x24>
801069ef:	90                   	nop
}
801069f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
801069f3:	31 c0                	xor    %eax,%eax
}
801069f5:	5b                   	pop    %ebx
801069f6:	5e                   	pop    %esi
801069f7:	5f                   	pop    %edi
801069f8:	5d                   	pop    %ebp
801069f9:	c3                   	ret    
801069fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106a00 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106a00:	55                   	push   %ebp
80106a01:	89 e5                	mov    %esp,%ebp
80106a03:	57                   	push   %edi
80106a04:	56                   	push   %esi
80106a05:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106a06:	89 d3                	mov    %edx,%ebx
80106a08:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106a0e:	83 ec 1c             	sub    $0x1c,%esp
80106a11:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106a14:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106a18:	8b 7d 08             	mov    0x8(%ebp),%edi
80106a1b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106a20:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106a23:	8b 45 0c             	mov    0xc(%ebp),%eax
80106a26:	29 df                	sub    %ebx,%edi
80106a28:	83 c8 01             	or     $0x1,%eax
80106a2b:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106a2e:	eb 15                	jmp    80106a45 <mappages+0x45>
    if(*pte & PTE_P)
80106a30:	f6 00 01             	testb  $0x1,(%eax)
80106a33:	75 45                	jne    80106a7a <mappages+0x7a>
    *pte = pa | perm | PTE_P;
80106a35:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106a38:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
80106a3b:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106a3d:	74 31                	je     80106a70 <mappages+0x70>
      break;
    a += PGSIZE;
80106a3f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106a45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a48:	b9 01 00 00 00       	mov    $0x1,%ecx
80106a4d:	89 da                	mov    %ebx,%edx
80106a4f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106a52:	e8 29 ff ff ff       	call   80106980 <walkpgdir>
80106a57:	85 c0                	test   %eax,%eax
80106a59:	75 d5                	jne    80106a30 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
80106a5b:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106a5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106a63:	5b                   	pop    %ebx
80106a64:	5e                   	pop    %esi
80106a65:	5f                   	pop    %edi
80106a66:	5d                   	pop    %ebp
80106a67:	c3                   	ret    
80106a68:	90                   	nop
80106a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a70:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106a73:	31 c0                	xor    %eax,%eax
}
80106a75:	5b                   	pop    %ebx
80106a76:	5e                   	pop    %esi
80106a77:	5f                   	pop    %edi
80106a78:	5d                   	pop    %ebp
80106a79:	c3                   	ret    
      panic("remap");
80106a7a:	83 ec 0c             	sub    $0xc,%esp
80106a7d:	68 20 7f 10 80       	push   $0x80107f20
80106a82:	e8 09 99 ff ff       	call   80100390 <panic>
80106a87:	89 f6                	mov    %esi,%esi
80106a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a90 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a90:	55                   	push   %ebp
80106a91:	89 e5                	mov    %esp,%ebp
80106a93:	57                   	push   %edi
80106a94:	56                   	push   %esi
80106a95:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a96:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a9c:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
80106a9e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106aa4:	83 ec 1c             	sub    $0x1c,%esp
80106aa7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106aaa:	39 d3                	cmp    %edx,%ebx
80106aac:	73 66                	jae    80106b14 <deallocuvm.part.0+0x84>
80106aae:	89 d6                	mov    %edx,%esi
80106ab0:	eb 3d                	jmp    80106aef <deallocuvm.part.0+0x5f>
80106ab2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106ab8:	8b 10                	mov    (%eax),%edx
80106aba:	f6 c2 01             	test   $0x1,%dl
80106abd:	74 26                	je     80106ae5 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106abf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106ac5:	74 58                	je     80106b1f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106ac7:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106aca:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106ad0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106ad3:	52                   	push   %edx
80106ad4:	e8 77 b8 ff ff       	call   80102350 <kfree>
      *pte = 0;
80106ad9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106adc:	83 c4 10             	add    $0x10,%esp
80106adf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106ae5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106aeb:	39 f3                	cmp    %esi,%ebx
80106aed:	73 25                	jae    80106b14 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106aef:	31 c9                	xor    %ecx,%ecx
80106af1:	89 da                	mov    %ebx,%edx
80106af3:	89 f8                	mov    %edi,%eax
80106af5:	e8 86 fe ff ff       	call   80106980 <walkpgdir>
    if(!pte)
80106afa:	85 c0                	test   %eax,%eax
80106afc:	75 ba                	jne    80106ab8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106afe:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106b04:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106b0a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b10:	39 f3                	cmp    %esi,%ebx
80106b12:	72 db                	jb     80106aef <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106b14:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106b17:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b1a:	5b                   	pop    %ebx
80106b1b:	5e                   	pop    %esi
80106b1c:	5f                   	pop    %edi
80106b1d:	5d                   	pop    %ebp
80106b1e:	c3                   	ret    
        panic("kfree");
80106b1f:	83 ec 0c             	sub    $0xc,%esp
80106b22:	68 a6 78 10 80       	push   $0x801078a6
80106b27:	e8 64 98 ff ff       	call   80100390 <panic>
80106b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106b30 <seginit>:
{
80106b30:	55                   	push   %ebp
80106b31:	89 e5                	mov    %esp,%ebp
80106b33:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106b36:	e8 45 cd ff ff       	call   80103880 <cpuid>
80106b3b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
  pd[0] = size-1;
80106b41:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106b46:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b4a:	c7 80 d8 41 11 80 ff 	movl   $0xffff,-0x7feebe28(%eax)
80106b51:	ff 00 00 
80106b54:	c7 80 dc 41 11 80 00 	movl   $0xcf9a00,-0x7feebe24(%eax)
80106b5b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b5e:	c7 80 e0 41 11 80 ff 	movl   $0xffff,-0x7feebe20(%eax)
80106b65:	ff 00 00 
80106b68:	c7 80 e4 41 11 80 00 	movl   $0xcf9200,-0x7feebe1c(%eax)
80106b6f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b72:	c7 80 e8 41 11 80 ff 	movl   $0xffff,-0x7feebe18(%eax)
80106b79:	ff 00 00 
80106b7c:	c7 80 ec 41 11 80 00 	movl   $0xcffa00,-0x7feebe14(%eax)
80106b83:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b86:	c7 80 f0 41 11 80 ff 	movl   $0xffff,-0x7feebe10(%eax)
80106b8d:	ff 00 00 
80106b90:	c7 80 f4 41 11 80 00 	movl   $0xcff200,-0x7feebe0c(%eax)
80106b97:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106b9a:	05 d0 41 11 80       	add    $0x801141d0,%eax
  pd[1] = (uint)p;
80106b9f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106ba3:	c1 e8 10             	shr    $0x10,%eax
80106ba6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106baa:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106bad:	0f 01 10             	lgdtl  (%eax)
}
80106bb0:	c9                   	leave  
80106bb1:	c3                   	ret    
80106bb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106bc0 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106bc0:	a1 84 70 11 80       	mov    0x80117084,%eax
{
80106bc5:	55                   	push   %ebp
80106bc6:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106bc8:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106bcd:	0f 22 d8             	mov    %eax,%cr3
}
80106bd0:	5d                   	pop    %ebp
80106bd1:	c3                   	ret    
80106bd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106be0 <switchuvm>:
{
80106be0:	55                   	push   %ebp
80106be1:	89 e5                	mov    %esp,%ebp
80106be3:	57                   	push   %edi
80106be4:	56                   	push   %esi
80106be5:	53                   	push   %ebx
80106be6:	83 ec 1c             	sub    $0x1c,%esp
80106be9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106bec:	85 db                	test   %ebx,%ebx
80106bee:	0f 84 cb 00 00 00    	je     80106cbf <switchuvm+0xdf>
  if(p->kstack == 0)
80106bf4:	8b 43 08             	mov    0x8(%ebx),%eax
80106bf7:	85 c0                	test   %eax,%eax
80106bf9:	0f 84 da 00 00 00    	je     80106cd9 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106bff:	8b 43 04             	mov    0x4(%ebx),%eax
80106c02:	85 c0                	test   %eax,%eax
80106c04:	0f 84 c2 00 00 00    	je     80106ccc <switchuvm+0xec>
  pushcli();
80106c0a:	e8 b1 d8 ff ff       	call   801044c0 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106c0f:	e8 ec cb ff ff       	call   80103800 <mycpu>
80106c14:	89 c6                	mov    %eax,%esi
80106c16:	e8 e5 cb ff ff       	call   80103800 <mycpu>
80106c1b:	89 c7                	mov    %eax,%edi
80106c1d:	e8 de cb ff ff       	call   80103800 <mycpu>
80106c22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c25:	83 c7 08             	add    $0x8,%edi
80106c28:	e8 d3 cb ff ff       	call   80103800 <mycpu>
80106c2d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106c30:	83 c0 08             	add    $0x8,%eax
80106c33:	ba 67 00 00 00       	mov    $0x67,%edx
80106c38:	c1 e8 18             	shr    $0x18,%eax
80106c3b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106c42:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106c49:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106c4f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106c54:	83 c1 08             	add    $0x8,%ecx
80106c57:	c1 e9 10             	shr    $0x10,%ecx
80106c5a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106c60:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106c65:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106c6c:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80106c71:	e8 8a cb ff ff       	call   80103800 <mycpu>
80106c76:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106c7d:	e8 7e cb ff ff       	call   80103800 <mycpu>
80106c82:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106c86:	8b 73 08             	mov    0x8(%ebx),%esi
80106c89:	e8 72 cb ff ff       	call   80103800 <mycpu>
80106c8e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106c94:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106c97:	e8 64 cb ff ff       	call   80103800 <mycpu>
80106c9c:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106ca0:	b8 28 00 00 00       	mov    $0x28,%eax
80106ca5:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106ca8:	8b 43 04             	mov    0x4(%ebx),%eax
80106cab:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106cb0:	0f 22 d8             	mov    %eax,%cr3
}
80106cb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cb6:	5b                   	pop    %ebx
80106cb7:	5e                   	pop    %esi
80106cb8:	5f                   	pop    %edi
80106cb9:	5d                   	pop    %ebp
  popcli();
80106cba:	e9 41 d8 ff ff       	jmp    80104500 <popcli>
    panic("switchuvm: no process");
80106cbf:	83 ec 0c             	sub    $0xc,%esp
80106cc2:	68 26 7f 10 80       	push   $0x80107f26
80106cc7:	e8 c4 96 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
80106ccc:	83 ec 0c             	sub    $0xc,%esp
80106ccf:	68 51 7f 10 80       	push   $0x80107f51
80106cd4:	e8 b7 96 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
80106cd9:	83 ec 0c             	sub    $0xc,%esp
80106cdc:	68 3c 7f 10 80       	push   $0x80107f3c
80106ce1:	e8 aa 96 ff ff       	call   80100390 <panic>
80106ce6:	8d 76 00             	lea    0x0(%esi),%esi
80106ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cf0 <inituvm>:
{
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	57                   	push   %edi
80106cf4:	56                   	push   %esi
80106cf5:	53                   	push   %ebx
80106cf6:	83 ec 1c             	sub    $0x1c,%esp
80106cf9:	8b 75 10             	mov    0x10(%ebp),%esi
80106cfc:	8b 45 08             	mov    0x8(%ebp),%eax
80106cff:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106d02:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80106d08:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106d0b:	77 49                	ja     80106d56 <inituvm+0x66>
  mem = kalloc();
80106d0d:	e8 ee b7 ff ff       	call   80102500 <kalloc>
  memset(mem, 0, PGSIZE);
80106d12:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106d15:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106d17:	68 00 10 00 00       	push   $0x1000
80106d1c:	6a 00                	push   $0x0
80106d1e:	50                   	push   %eax
80106d1f:	e8 7c d9 ff ff       	call   801046a0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106d24:	58                   	pop    %eax
80106d25:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106d2b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106d30:	5a                   	pop    %edx
80106d31:	6a 06                	push   $0x6
80106d33:	50                   	push   %eax
80106d34:	31 d2                	xor    %edx,%edx
80106d36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d39:	e8 c2 fc ff ff       	call   80106a00 <mappages>
  memmove(mem, init, sz);
80106d3e:	89 75 10             	mov    %esi,0x10(%ebp)
80106d41:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106d44:	83 c4 10             	add    $0x10,%esp
80106d47:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106d4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d4d:	5b                   	pop    %ebx
80106d4e:	5e                   	pop    %esi
80106d4f:	5f                   	pop    %edi
80106d50:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106d51:	e9 fa d9 ff ff       	jmp    80104750 <memmove>
    panic("inituvm: more than a page");
80106d56:	83 ec 0c             	sub    $0xc,%esp
80106d59:	68 65 7f 10 80       	push   $0x80107f65
80106d5e:	e8 2d 96 ff ff       	call   80100390 <panic>
80106d63:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d70 <loaduvm>:
{
80106d70:	55                   	push   %ebp
80106d71:	89 e5                	mov    %esp,%ebp
80106d73:	57                   	push   %edi
80106d74:	56                   	push   %esi
80106d75:	53                   	push   %ebx
80106d76:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80106d79:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106d80:	0f 85 91 00 00 00    	jne    80106e17 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80106d86:	8b 75 18             	mov    0x18(%ebp),%esi
80106d89:	31 db                	xor    %ebx,%ebx
80106d8b:	85 f6                	test   %esi,%esi
80106d8d:	75 1a                	jne    80106da9 <loaduvm+0x39>
80106d8f:	eb 6f                	jmp    80106e00 <loaduvm+0x90>
80106d91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d98:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106d9e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106da4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106da7:	76 57                	jbe    80106e00 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106da9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dac:	8b 45 08             	mov    0x8(%ebp),%eax
80106daf:	31 c9                	xor    %ecx,%ecx
80106db1:	01 da                	add    %ebx,%edx
80106db3:	e8 c8 fb ff ff       	call   80106980 <walkpgdir>
80106db8:	85 c0                	test   %eax,%eax
80106dba:	74 4e                	je     80106e0a <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
80106dbc:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106dbe:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80106dc1:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106dc6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106dcb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106dd1:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106dd4:	01 d9                	add    %ebx,%ecx
80106dd6:	05 00 00 00 80       	add    $0x80000000,%eax
80106ddb:	57                   	push   %edi
80106ddc:	51                   	push   %ecx
80106ddd:	50                   	push   %eax
80106dde:	ff 75 10             	pushl  0x10(%ebp)
80106de1:	e8 ba ab ff ff       	call   801019a0 <readi>
80106de6:	83 c4 10             	add    $0x10,%esp
80106de9:	39 f8                	cmp    %edi,%eax
80106deb:	74 ab                	je     80106d98 <loaduvm+0x28>
}
80106ded:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106df0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106df5:	5b                   	pop    %ebx
80106df6:	5e                   	pop    %esi
80106df7:	5f                   	pop    %edi
80106df8:	5d                   	pop    %ebp
80106df9:	c3                   	ret    
80106dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e00:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106e03:	31 c0                	xor    %eax,%eax
}
80106e05:	5b                   	pop    %ebx
80106e06:	5e                   	pop    %esi
80106e07:	5f                   	pop    %edi
80106e08:	5d                   	pop    %ebp
80106e09:	c3                   	ret    
      panic("loaduvm: address should exist");
80106e0a:	83 ec 0c             	sub    $0xc,%esp
80106e0d:	68 7f 7f 10 80       	push   $0x80107f7f
80106e12:	e8 79 95 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
80106e17:	83 ec 0c             	sub    $0xc,%esp
80106e1a:	68 48 80 10 80       	push   $0x80108048
80106e1f:	e8 6c 95 ff ff       	call   80100390 <panic>
80106e24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e30 <allocuvm>:
{
80106e30:	55                   	push   %ebp
80106e31:	89 e5                	mov    %esp,%ebp
80106e33:	57                   	push   %edi
80106e34:	56                   	push   %esi
80106e35:	53                   	push   %ebx
80106e36:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106e39:	8b 7d 10             	mov    0x10(%ebp),%edi
80106e3c:	85 ff                	test   %edi,%edi
80106e3e:	0f 88 8e 00 00 00    	js     80106ed2 <allocuvm+0xa2>
  if(newsz < oldsz)
80106e44:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106e47:	0f 82 93 00 00 00    	jb     80106ee0 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
80106e4d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e50:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106e56:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106e5c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106e5f:	0f 86 7e 00 00 00    	jbe    80106ee3 <allocuvm+0xb3>
80106e65:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106e68:	8b 7d 08             	mov    0x8(%ebp),%edi
80106e6b:	eb 42                	jmp    80106eaf <allocuvm+0x7f>
80106e6d:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80106e70:	83 ec 04             	sub    $0x4,%esp
80106e73:	68 00 10 00 00       	push   $0x1000
80106e78:	6a 00                	push   $0x0
80106e7a:	50                   	push   %eax
80106e7b:	e8 20 d8 ff ff       	call   801046a0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106e80:	58                   	pop    %eax
80106e81:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106e87:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e8c:	5a                   	pop    %edx
80106e8d:	6a 06                	push   $0x6
80106e8f:	50                   	push   %eax
80106e90:	89 da                	mov    %ebx,%edx
80106e92:	89 f8                	mov    %edi,%eax
80106e94:	e8 67 fb ff ff       	call   80106a00 <mappages>
80106e99:	83 c4 10             	add    $0x10,%esp
80106e9c:	85 c0                	test   %eax,%eax
80106e9e:	78 50                	js     80106ef0 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80106ea0:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ea6:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106ea9:	0f 86 81 00 00 00    	jbe    80106f30 <allocuvm+0x100>
    mem = kalloc();
80106eaf:	e8 4c b6 ff ff       	call   80102500 <kalloc>
    if(mem == 0){
80106eb4:	85 c0                	test   %eax,%eax
    mem = kalloc();
80106eb6:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106eb8:	75 b6                	jne    80106e70 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80106eba:	83 ec 0c             	sub    $0xc,%esp
80106ebd:	68 9d 7f 10 80       	push   $0x80107f9d
80106ec2:	e8 99 97 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106ec7:	83 c4 10             	add    $0x10,%esp
80106eca:	8b 45 0c             	mov    0xc(%ebp),%eax
80106ecd:	39 45 10             	cmp    %eax,0x10(%ebp)
80106ed0:	77 6e                	ja     80106f40 <allocuvm+0x110>
}
80106ed2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80106ed5:	31 ff                	xor    %edi,%edi
}
80106ed7:	89 f8                	mov    %edi,%eax
80106ed9:	5b                   	pop    %ebx
80106eda:	5e                   	pop    %esi
80106edb:	5f                   	pop    %edi
80106edc:	5d                   	pop    %ebp
80106edd:	c3                   	ret    
80106ede:	66 90                	xchg   %ax,%ax
    return oldsz;
80106ee0:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
80106ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ee6:	89 f8                	mov    %edi,%eax
80106ee8:	5b                   	pop    %ebx
80106ee9:	5e                   	pop    %esi
80106eea:	5f                   	pop    %edi
80106eeb:	5d                   	pop    %ebp
80106eec:	c3                   	ret    
80106eed:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106ef0:	83 ec 0c             	sub    $0xc,%esp
80106ef3:	68 b5 7f 10 80       	push   $0x80107fb5
80106ef8:	e8 63 97 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106efd:	83 c4 10             	add    $0x10,%esp
80106f00:	8b 45 0c             	mov    0xc(%ebp),%eax
80106f03:	39 45 10             	cmp    %eax,0x10(%ebp)
80106f06:	76 0d                	jbe    80106f15 <allocuvm+0xe5>
80106f08:	89 c1                	mov    %eax,%ecx
80106f0a:	8b 55 10             	mov    0x10(%ebp),%edx
80106f0d:	8b 45 08             	mov    0x8(%ebp),%eax
80106f10:	e8 7b fb ff ff       	call   80106a90 <deallocuvm.part.0>
      kfree(mem);
80106f15:	83 ec 0c             	sub    $0xc,%esp
      return 0;
80106f18:	31 ff                	xor    %edi,%edi
      kfree(mem);
80106f1a:	56                   	push   %esi
80106f1b:	e8 30 b4 ff ff       	call   80102350 <kfree>
      return 0;
80106f20:	83 c4 10             	add    $0x10,%esp
}
80106f23:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f26:	89 f8                	mov    %edi,%eax
80106f28:	5b                   	pop    %ebx
80106f29:	5e                   	pop    %esi
80106f2a:	5f                   	pop    %edi
80106f2b:	5d                   	pop    %ebp
80106f2c:	c3                   	ret    
80106f2d:	8d 76 00             	lea    0x0(%esi),%esi
80106f30:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106f33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f36:	5b                   	pop    %ebx
80106f37:	89 f8                	mov    %edi,%eax
80106f39:	5e                   	pop    %esi
80106f3a:	5f                   	pop    %edi
80106f3b:	5d                   	pop    %ebp
80106f3c:	c3                   	ret    
80106f3d:	8d 76 00             	lea    0x0(%esi),%esi
80106f40:	89 c1                	mov    %eax,%ecx
80106f42:	8b 55 10             	mov    0x10(%ebp),%edx
80106f45:	8b 45 08             	mov    0x8(%ebp),%eax
      return 0;
80106f48:	31 ff                	xor    %edi,%edi
80106f4a:	e8 41 fb ff ff       	call   80106a90 <deallocuvm.part.0>
80106f4f:	eb 92                	jmp    80106ee3 <allocuvm+0xb3>
80106f51:	eb 0d                	jmp    80106f60 <deallocuvm>
80106f53:	90                   	nop
80106f54:	90                   	nop
80106f55:	90                   	nop
80106f56:	90                   	nop
80106f57:	90                   	nop
80106f58:	90                   	nop
80106f59:	90                   	nop
80106f5a:	90                   	nop
80106f5b:	90                   	nop
80106f5c:	90                   	nop
80106f5d:	90                   	nop
80106f5e:	90                   	nop
80106f5f:	90                   	nop

80106f60 <deallocuvm>:
{
80106f60:	55                   	push   %ebp
80106f61:	89 e5                	mov    %esp,%ebp
80106f63:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f66:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106f69:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106f6c:	39 d1                	cmp    %edx,%ecx
80106f6e:	73 10                	jae    80106f80 <deallocuvm+0x20>
}
80106f70:	5d                   	pop    %ebp
80106f71:	e9 1a fb ff ff       	jmp    80106a90 <deallocuvm.part.0>
80106f76:	8d 76 00             	lea    0x0(%esi),%esi
80106f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106f80:	89 d0                	mov    %edx,%eax
80106f82:	5d                   	pop    %ebp
80106f83:	c3                   	ret    
80106f84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106f90 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106f90:	55                   	push   %ebp
80106f91:	89 e5                	mov    %esp,%ebp
80106f93:	57                   	push   %edi
80106f94:	56                   	push   %esi
80106f95:	53                   	push   %ebx
80106f96:	83 ec 0c             	sub    $0xc,%esp
80106f99:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106f9c:	85 f6                	test   %esi,%esi
80106f9e:	74 59                	je     80106ff9 <freevm+0x69>
80106fa0:	31 c9                	xor    %ecx,%ecx
80106fa2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106fa7:	89 f0                	mov    %esi,%eax
80106fa9:	e8 e2 fa ff ff       	call   80106a90 <deallocuvm.part.0>
80106fae:	89 f3                	mov    %esi,%ebx
80106fb0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106fb6:	eb 0f                	jmp    80106fc7 <freevm+0x37>
80106fb8:	90                   	nop
80106fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106fc0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106fc3:	39 fb                	cmp    %edi,%ebx
80106fc5:	74 23                	je     80106fea <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106fc7:	8b 03                	mov    (%ebx),%eax
80106fc9:	a8 01                	test   $0x1,%al
80106fcb:	74 f3                	je     80106fc0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106fcd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80106fd2:	83 ec 0c             	sub    $0xc,%esp
80106fd5:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106fd8:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106fdd:	50                   	push   %eax
80106fde:	e8 6d b3 ff ff       	call   80102350 <kfree>
80106fe3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80106fe6:	39 fb                	cmp    %edi,%ebx
80106fe8:	75 dd                	jne    80106fc7 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
80106fea:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106fed:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ff0:	5b                   	pop    %ebx
80106ff1:	5e                   	pop    %esi
80106ff2:	5f                   	pop    %edi
80106ff3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106ff4:	e9 57 b3 ff ff       	jmp    80102350 <kfree>
    panic("freevm: no pgdir");
80106ff9:	83 ec 0c             	sub    $0xc,%esp
80106ffc:	68 d1 7f 10 80       	push   $0x80107fd1
80107001:	e8 8a 93 ff ff       	call   80100390 <panic>
80107006:	8d 76 00             	lea    0x0(%esi),%esi
80107009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107010 <setupkvm>:
{
80107010:	55                   	push   %ebp
80107011:	89 e5                	mov    %esp,%ebp
80107013:	56                   	push   %esi
80107014:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80107015:	e8 e6 b4 ff ff       	call   80102500 <kalloc>
8010701a:	85 c0                	test   %eax,%eax
8010701c:	89 c6                	mov    %eax,%esi
8010701e:	74 42                	je     80107062 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80107020:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107023:	bb 20 b4 10 80       	mov    $0x8010b420,%ebx
  memset(pgdir, 0, PGSIZE);
80107028:	68 00 10 00 00       	push   $0x1000
8010702d:	6a 00                	push   $0x0
8010702f:	50                   	push   %eax
80107030:	e8 6b d6 ff ff       	call   801046a0 <memset>
80107035:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80107038:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010703b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010703e:	83 ec 08             	sub    $0x8,%esp
80107041:	8b 13                	mov    (%ebx),%edx
80107043:	ff 73 0c             	pushl  0xc(%ebx)
80107046:	50                   	push   %eax
80107047:	29 c1                	sub    %eax,%ecx
80107049:	89 f0                	mov    %esi,%eax
8010704b:	e8 b0 f9 ff ff       	call   80106a00 <mappages>
80107050:	83 c4 10             	add    $0x10,%esp
80107053:	85 c0                	test   %eax,%eax
80107055:	78 19                	js     80107070 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107057:	83 c3 10             	add    $0x10,%ebx
8010705a:	81 fb 60 b4 10 80    	cmp    $0x8010b460,%ebx
80107060:	75 d6                	jne    80107038 <setupkvm+0x28>
}
80107062:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107065:	89 f0                	mov    %esi,%eax
80107067:	5b                   	pop    %ebx
80107068:	5e                   	pop    %esi
80107069:	5d                   	pop    %ebp
8010706a:	c3                   	ret    
8010706b:	90                   	nop
8010706c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80107070:	83 ec 0c             	sub    $0xc,%esp
80107073:	56                   	push   %esi
      return 0;
80107074:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80107076:	e8 15 ff ff ff       	call   80106f90 <freevm>
      return 0;
8010707b:	83 c4 10             	add    $0x10,%esp
}
8010707e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107081:	89 f0                	mov    %esi,%eax
80107083:	5b                   	pop    %ebx
80107084:	5e                   	pop    %esi
80107085:	5d                   	pop    %ebp
80107086:	c3                   	ret    
80107087:	89 f6                	mov    %esi,%esi
80107089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107090 <kvmalloc>:
{
80107090:	55                   	push   %ebp
80107091:	89 e5                	mov    %esp,%ebp
80107093:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107096:	e8 75 ff ff ff       	call   80107010 <setupkvm>
8010709b:	a3 84 70 11 80       	mov    %eax,0x80117084
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801070a0:	05 00 00 00 80       	add    $0x80000000,%eax
801070a5:	0f 22 d8             	mov    %eax,%cr3
}
801070a8:	c9                   	leave  
801070a9:	c3                   	ret    
801070aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801070b0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801070b0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801070b1:	31 c9                	xor    %ecx,%ecx
{
801070b3:	89 e5                	mov    %esp,%ebp
801070b5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
801070b8:	8b 55 0c             	mov    0xc(%ebp),%edx
801070bb:	8b 45 08             	mov    0x8(%ebp),%eax
801070be:	e8 bd f8 ff ff       	call   80106980 <walkpgdir>
  if(pte == 0)
801070c3:	85 c0                	test   %eax,%eax
801070c5:	74 05                	je     801070cc <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801070c7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801070ca:	c9                   	leave  
801070cb:	c3                   	ret    
    panic("clearpteu");
801070cc:	83 ec 0c             	sub    $0xc,%esp
801070cf:	68 e2 7f 10 80       	push   $0x80107fe2
801070d4:	e8 b7 92 ff ff       	call   80100390 <panic>
801070d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801070e0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801070e0:	55                   	push   %ebp
801070e1:	89 e5                	mov    %esp,%ebp
801070e3:	57                   	push   %edi
801070e4:	56                   	push   %esi
801070e5:	53                   	push   %ebx
801070e6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801070e9:	e8 22 ff ff ff       	call   80107010 <setupkvm>
801070ee:	85 c0                	test   %eax,%eax
801070f0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801070f3:	0f 84 9f 00 00 00    	je     80107198 <copyuvm+0xb8>
    return 0;
  for(i = PGSIZE; i < sz; i += PGSIZE){
801070f9:	81 7d 0c 00 10 00 00 	cmpl   $0x1000,0xc(%ebp)
80107100:	0f 86 92 00 00 00    	jbe    80107198 <copyuvm+0xb8>
80107106:	bf 00 10 00 00       	mov    $0x1000,%edi
8010710b:	eb 45                	jmp    80107152 <copyuvm+0x72>
8010710d:	8d 76 00             	lea    0x0(%esi),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107110:	83 ec 04             	sub    $0x4,%esp
80107113:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80107119:	68 00 10 00 00       	push   $0x1000
8010711e:	53                   	push   %ebx
8010711f:	50                   	push   %eax
80107120:	e8 2b d6 ff ff       	call   80104750 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80107125:	58                   	pop    %eax
80107126:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
8010712c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107131:	5a                   	pop    %edx
80107132:	ff 75 e4             	pushl  -0x1c(%ebp)
80107135:	50                   	push   %eax
80107136:	89 fa                	mov    %edi,%edx
80107138:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010713b:	e8 c0 f8 ff ff       	call   80106a00 <mappages>
80107140:	83 c4 10             	add    $0x10,%esp
80107143:	85 c0                	test   %eax,%eax
80107145:	78 61                	js     801071a8 <copyuvm+0xc8>
  for(i = PGSIZE; i < sz; i += PGSIZE){
80107147:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010714d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80107150:	76 46                	jbe    80107198 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107152:	8b 45 08             	mov    0x8(%ebp),%eax
80107155:	31 c9                	xor    %ecx,%ecx
80107157:	89 fa                	mov    %edi,%edx
80107159:	e8 22 f8 ff ff       	call   80106980 <walkpgdir>
8010715e:	85 c0                	test   %eax,%eax
80107160:	74 61                	je     801071c3 <copyuvm+0xe3>
    if(!(*pte & PTE_P))
80107162:	8b 00                	mov    (%eax),%eax
80107164:	a8 01                	test   $0x1,%al
80107166:	74 4e                	je     801071b6 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
80107168:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
8010716a:	25 ff 0f 00 00       	and    $0xfff,%eax
    pa = PTE_ADDR(*pte);
8010716f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80107175:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80107178:	e8 83 b3 ff ff       	call   80102500 <kalloc>
8010717d:	85 c0                	test   %eax,%eax
8010717f:	89 c6                	mov    %eax,%esi
80107181:	75 8d                	jne    80107110 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80107183:	83 ec 0c             	sub    $0xc,%esp
80107186:	ff 75 e0             	pushl  -0x20(%ebp)
80107189:	e8 02 fe ff ff       	call   80106f90 <freevm>
  return 0;
8010718e:	83 c4 10             	add    $0x10,%esp
80107191:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80107198:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010719b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010719e:	5b                   	pop    %ebx
8010719f:	5e                   	pop    %esi
801071a0:	5f                   	pop    %edi
801071a1:	5d                   	pop    %ebp
801071a2:	c3                   	ret    
801071a3:	90                   	nop
801071a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
801071a8:	83 ec 0c             	sub    $0xc,%esp
801071ab:	56                   	push   %esi
801071ac:	e8 9f b1 ff ff       	call   80102350 <kfree>
      goto bad;
801071b1:	83 c4 10             	add    $0x10,%esp
801071b4:	eb cd                	jmp    80107183 <copyuvm+0xa3>
      panic("copyuvm: page not present");
801071b6:	83 ec 0c             	sub    $0xc,%esp
801071b9:	68 06 80 10 80       	push   $0x80108006
801071be:	e8 cd 91 ff ff       	call   80100390 <panic>
      panic("copyuvm: pte should exist");
801071c3:	83 ec 0c             	sub    $0xc,%esp
801071c6:	68 ec 7f 10 80       	push   $0x80107fec
801071cb:	e8 c0 91 ff ff       	call   80100390 <panic>

801071d0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801071d0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801071d1:	31 c9                	xor    %ecx,%ecx
{
801071d3:	89 e5                	mov    %esp,%ebp
801071d5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
801071d8:	8b 55 0c             	mov    0xc(%ebp),%edx
801071db:	8b 45 08             	mov    0x8(%ebp),%eax
801071de:	e8 9d f7 ff ff       	call   80106980 <walkpgdir>
  if((*pte & PTE_P) == 0)
801071e3:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
801071e5:	c9                   	leave  
  if((*pte & PTE_U) == 0)
801071e6:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801071e8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
801071ed:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801071f0:	05 00 00 00 80       	add    $0x80000000,%eax
801071f5:	83 fa 05             	cmp    $0x5,%edx
801071f8:	ba 00 00 00 00       	mov    $0x0,%edx
801071fd:	0f 45 c2             	cmovne %edx,%eax
}
80107200:	c3                   	ret    
80107201:	eb 0d                	jmp    80107210 <copyout>
80107203:	90                   	nop
80107204:	90                   	nop
80107205:	90                   	nop
80107206:	90                   	nop
80107207:	90                   	nop
80107208:	90                   	nop
80107209:	90                   	nop
8010720a:	90                   	nop
8010720b:	90                   	nop
8010720c:	90                   	nop
8010720d:	90                   	nop
8010720e:	90                   	nop
8010720f:	90                   	nop

80107210 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107210:	55                   	push   %ebp
80107211:	89 e5                	mov    %esp,%ebp
80107213:	57                   	push   %edi
80107214:	56                   	push   %esi
80107215:	53                   	push   %ebx
80107216:	83 ec 1c             	sub    $0x1c,%esp
80107219:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010721c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010721f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107222:	85 db                	test   %ebx,%ebx
80107224:	75 40                	jne    80107266 <copyout+0x56>
80107226:	eb 70                	jmp    80107298 <copyout+0x88>
80107228:	90                   	nop
80107229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107230:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107233:	89 f1                	mov    %esi,%ecx
80107235:	29 d1                	sub    %edx,%ecx
80107237:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010723d:	39 d9                	cmp    %ebx,%ecx
8010723f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107242:	29 f2                	sub    %esi,%edx
80107244:	83 ec 04             	sub    $0x4,%esp
80107247:	01 d0                	add    %edx,%eax
80107249:	51                   	push   %ecx
8010724a:	57                   	push   %edi
8010724b:	50                   	push   %eax
8010724c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010724f:	e8 fc d4 ff ff       	call   80104750 <memmove>
    len -= n;
    buf += n;
80107254:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80107257:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
8010725a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
80107260:	01 cf                	add    %ecx,%edi
  while(len > 0){
80107262:	29 cb                	sub    %ecx,%ebx
80107264:	74 32                	je     80107298 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107266:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107268:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
8010726b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010726e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107274:	56                   	push   %esi
80107275:	ff 75 08             	pushl  0x8(%ebp)
80107278:	e8 53 ff ff ff       	call   801071d0 <uva2ka>
    if(pa0 == 0)
8010727d:	83 c4 10             	add    $0x10,%esp
80107280:	85 c0                	test   %eax,%eax
80107282:	75 ac                	jne    80107230 <copyout+0x20>
  }
  return 0;
}
80107284:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80107287:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010728c:	5b                   	pop    %ebx
8010728d:	5e                   	pop    %esi
8010728e:	5f                   	pop    %edi
8010728f:	5d                   	pop    %ebp
80107290:	c3                   	ret    
80107291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107298:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010729b:	31 c0                	xor    %eax,%eax
}
8010729d:	5b                   	pop    %ebx
8010729e:	5e                   	pop    %esi
8010729f:	5f                   	pop    %edi
801072a0:	5d                   	pop    %ebp
801072a1:	c3                   	ret    
801072a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801072a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801072b0 <mprotect>:

//mprotect system call makes page table entries only readable, non-writable
int
mprotect(void *addr, int len){
801072b0:	55                   	push   %ebp
801072b1:	89 e5                	mov    %esp,%ebp
801072b3:	57                   	push   %edi
801072b4:	56                   	push   %esi
801072b5:	53                   	push   %ebx
801072b6:	83 ec 0c             	sub    $0xc,%esp
801072b9:	8b 75 0c             	mov    0xc(%ebp),%esi
801072bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
801072bf:	e8 dc c5 ff ff       	call   801038a0 <myproc>
  if(len <= 0){
801072c4:	85 f6                	test   %esi,%esi
801072c6:	0f 8e a9 00 00 00    	jle    80107375 <mprotect+0xc5>
    cprintf("\nwrong len\n");
    return -1;
  }
  if((int)(((int) addr) % PGSIZE )  != 0){
801072cc:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801072d2:	0f 85 85 00 00 00    	jne    8010735d <mprotect+0xad>
801072d8:	89 c7                	mov    %eax,%edi
    cprintf("\nwrong addr %p\n", addr);
    return -1;
  }
  pte_t *pte;
  pte = walkpgdir(curproc->pgdir, addr, 0);
801072da:	8b 40 04             	mov    0x4(%eax),%eax
801072dd:	31 c9                	xor    %ecx,%ecx
801072df:	89 da                	mov    %ebx,%edx
801072e1:	e8 9a f6 ff ff       	call   80106980 <walkpgdir>
  if (*pte)
801072e6:	8b 00                	mov    (%eax),%eax
801072e8:	85 c0                	test   %eax,%eax
801072ea:	74 5c                	je     80107348 <mprotect+0x98>
  {
    int i;
    for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE)
801072ec:	c1 e6 0c             	shl    $0xc,%esi
801072ef:	01 de                	add    %ebx,%esi
801072f1:	39 f3                	cmp    %esi,%ebx
801072f3:	7c 2b                	jl     80107320 <mprotect+0x70>
801072f5:	eb 51                	jmp    80107348 <mprotect+0x98>
801072f7:	89 f6                	mov    %esi,%esi
801072f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    {
      pte = walkpgdir(curproc->pgdir,(void*) i, 0);
      if( ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
        *pte = (*pte) & (~PTE_W) ;
        cprintf("\nPTR %p:", pte);
80107300:	83 ec 08             	sub    $0x8,%esp
        *pte = (*pte) & (~PTE_W) ;
80107303:	83 e2 fd             	and    $0xfffffffd,%edx
    for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE)
80107306:	81 c3 00 10 00 00    	add    $0x1000,%ebx
        *pte = (*pte) & (~PTE_W) ;
8010730c:	89 10                	mov    %edx,(%eax)
        cprintf("\nPTR %p:", pte);
8010730e:	50                   	push   %eax
8010730f:	68 3c 80 10 80       	push   $0x8010803c
80107314:	e8 47 93 ff ff       	call   80100660 <cprintf>
    for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE)
80107319:	83 c4 10             	add    $0x10,%esp
8010731c:	39 f3                	cmp    %esi,%ebx
8010731e:	7d 28                	jge    80107348 <mprotect+0x98>
      pte = walkpgdir(curproc->pgdir,(void*) i, 0);
80107320:	8b 47 04             	mov    0x4(%edi),%eax
80107323:	31 c9                	xor    %ecx,%ecx
80107325:	89 da                	mov    %ebx,%edx
80107327:	e8 54 f6 ff ff       	call   80106980 <walkpgdir>
      if( ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
8010732c:	8b 10                	mov    (%eax),%edx
8010732e:	89 d1                	mov    %edx,%ecx
80107330:	83 e1 05             	and    $0x5,%ecx
80107333:	83 f9 05             	cmp    $0x5,%ecx
80107336:	74 c8                	je     80107300 <mprotect+0x50>
    }
  }
  lcr3(V2P(curproc->pgdir));  
  
return 0;
}
80107338:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
8010733b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80107340:	5b                   	pop    %ebx
80107341:	5e                   	pop    %esi
80107342:	5f                   	pop    %edi
80107343:	5d                   	pop    %ebp
80107344:	c3                   	ret    
80107345:	8d 76 00             	lea    0x0(%esi),%esi
  lcr3(V2P(curproc->pgdir));  
80107348:	8b 47 04             	mov    0x4(%edi),%eax
8010734b:	05 00 00 00 80       	add    $0x80000000,%eax
80107350:	0f 22 d8             	mov    %eax,%cr3
return 0;
80107353:	31 c0                	xor    %eax,%eax
}
80107355:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107358:	5b                   	pop    %ebx
80107359:	5e                   	pop    %esi
8010735a:	5f                   	pop    %edi
8010735b:	5d                   	pop    %ebp
8010735c:	c3                   	ret    
    cprintf("\nwrong addr %p\n", addr);
8010735d:	83 ec 08             	sub    $0x8,%esp
80107360:	53                   	push   %ebx
80107361:	68 2c 80 10 80       	push   $0x8010802c
80107366:	e8 f5 92 ff ff       	call   80100660 <cprintf>
    return -1;
8010736b:	83 c4 10             	add    $0x10,%esp
8010736e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107373:	eb e0                	jmp    80107355 <mprotect+0xa5>
    cprintf("\nwrong len\n");
80107375:	83 ec 0c             	sub    $0xc,%esp
80107378:	68 20 80 10 80       	push   $0x80108020
8010737d:	e8 de 92 ff ff       	call   80100660 <cprintf>
    return -1;
80107382:	83 c4 10             	add    $0x10,%esp
80107385:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010738a:	eb c9                	jmp    80107355 <mprotect+0xa5>
8010738c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107390 <munprotect>:

//mprotect system call makes page table entries both readable and writable
int
munprotect(void *addr, int len){
80107390:	55                   	push   %ebp
80107391:	89 e5                	mov    %esp,%ebp
80107393:	57                   	push   %edi
80107394:	56                   	push   %esi
80107395:	53                   	push   %ebx
80107396:	83 ec 0c             	sub    $0xc,%esp
80107399:	8b 75 0c             	mov    0xc(%ebp),%esi
8010739c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010739f:	e8 fc c4 ff ff       	call   801038a0 <myproc>
  if(len <= 0){
801073a4:	85 f6                	test   %esi,%esi
801073a6:	0f 8e a9 00 00 00    	jle    80107455 <munprotect+0xc5>
    cprintf("\nwrong len\n");
    return -1;
  }
  if((int)(((int) addr) % PGSIZE )  != 0){
801073ac:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801073b2:	0f 85 85 00 00 00    	jne    8010743d <munprotect+0xad>
801073b8:	89 c7                	mov    %eax,%edi
    cprintf("\nwrong addr %p\n", addr);
    return -1;
  }
  pte_t *pte;
  pte = walkpgdir(curproc->pgdir, addr, 0);
801073ba:	8b 40 04             	mov    0x4(%eax),%eax
801073bd:	31 c9                	xor    %ecx,%ecx
801073bf:	89 da                	mov    %ebx,%edx
801073c1:	e8 ba f5 ff ff       	call   80106980 <walkpgdir>
  if (*pte)
801073c6:	8b 00                	mov    (%eax),%eax
801073c8:	85 c0                	test   %eax,%eax
801073ca:	74 5c                	je     80107428 <munprotect+0x98>
  {
    int i;
    for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE)
801073cc:	c1 e6 0c             	shl    $0xc,%esi
801073cf:	01 de                	add    %ebx,%esi
801073d1:	39 f3                	cmp    %esi,%ebx
801073d3:	7c 2b                	jl     80107400 <munprotect+0x70>
801073d5:	eb 51                	jmp    80107428 <munprotect+0x98>
801073d7:	89 f6                	mov    %esi,%esi
801073d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    {
      pte = walkpgdir(curproc->pgdir,(void*) i, 0);
      if( ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
        *pte = (*pte) | (PTE_W) ;
        cprintf("\nPTR %p:", pte);
801073e0:	83 ec 08             	sub    $0x8,%esp
        *pte = (*pte) | (PTE_W) ;
801073e3:	83 ca 02             	or     $0x2,%edx
    for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE)
801073e6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
        *pte = (*pte) | (PTE_W) ;
801073ec:	89 10                	mov    %edx,(%eax)
        cprintf("\nPTR %p:", pte);
801073ee:	50                   	push   %eax
801073ef:	68 3c 80 10 80       	push   $0x8010803c
801073f4:	e8 67 92 ff ff       	call   80100660 <cprintf>
    for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE)
801073f9:	83 c4 10             	add    $0x10,%esp
801073fc:	39 f3                	cmp    %esi,%ebx
801073fe:	7d 28                	jge    80107428 <munprotect+0x98>
      pte = walkpgdir(curproc->pgdir,(void*) i, 0);
80107400:	8b 47 04             	mov    0x4(%edi),%eax
80107403:	31 c9                	xor    %ecx,%ecx
80107405:	89 da                	mov    %ebx,%edx
80107407:	e8 74 f5 ff ff       	call   80106980 <walkpgdir>
      if( ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
8010740c:	8b 10                	mov    (%eax),%edx
8010740e:	89 d1                	mov    %edx,%ecx
80107410:	83 e1 05             	and    $0x5,%ecx
80107413:	83 f9 05             	cmp    $0x5,%ecx
80107416:	74 c8                	je     801073e0 <munprotect+0x50>
    }
  }
  lcr3(V2P(curproc->pgdir));
  
  return 0;
}
80107418:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
8010741b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80107420:	5b                   	pop    %ebx
80107421:	5e                   	pop    %esi
80107422:	5f                   	pop    %edi
80107423:	5d                   	pop    %ebp
80107424:	c3                   	ret    
80107425:	8d 76 00             	lea    0x0(%esi),%esi
  lcr3(V2P(curproc->pgdir));
80107428:	8b 47 04             	mov    0x4(%edi),%eax
8010742b:	05 00 00 00 80       	add    $0x80000000,%eax
80107430:	0f 22 d8             	mov    %eax,%cr3
  return 0;
80107433:	31 c0                	xor    %eax,%eax
}
80107435:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107438:	5b                   	pop    %ebx
80107439:	5e                   	pop    %esi
8010743a:	5f                   	pop    %edi
8010743b:	5d                   	pop    %ebp
8010743c:	c3                   	ret    
    cprintf("\nwrong addr %p\n", addr);
8010743d:	83 ec 08             	sub    $0x8,%esp
80107440:	53                   	push   %ebx
80107441:	68 2c 80 10 80       	push   $0x8010802c
80107446:	e8 15 92 ff ff       	call   80100660 <cprintf>
    return -1;
8010744b:	83 c4 10             	add    $0x10,%esp
8010744e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107453:	eb e0                	jmp    80107435 <munprotect+0xa5>
    cprintf("\nwrong len\n");
80107455:	83 ec 0c             	sub    $0xc,%esp
80107458:	68 20 80 10 80       	push   $0x80108020
8010745d:	e8 fe 91 ff ff       	call   80100660 <cprintf>
    return -1;
80107462:	83 c4 10             	add    $0x10,%esp
80107465:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010746a:	eb c9                	jmp    80107435 <munprotect+0xa5>
8010746c:	66 90                	xchg   %ax,%ax
8010746e:	66 90                	xchg   %ax,%ax

80107470 <sgenrand>:
80107470:	55                   	push   %ebp
80107471:	b8 e4 b5 10 80       	mov    $0x8010b5e4,%eax
80107476:	b9 9c bf 10 80       	mov    $0x8010bf9c,%ecx
8010747b:	89 e5                	mov    %esp,%ebp
8010747d:	8b 55 08             	mov    0x8(%ebp),%edx
80107480:	89 15 e0 b5 10 80    	mov    %edx,0x8010b5e0
80107486:	eb 0b                	jmp    80107493 <sgenrand+0x23>
80107488:	90                   	nop
80107489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107490:	83 c0 04             	add    $0x4,%eax
80107493:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
80107499:	39 c1                	cmp    %eax,%ecx
8010749b:	89 10                	mov    %edx,(%eax)
8010749d:	75 f1                	jne    80107490 <sgenrand+0x20>
8010749f:	c7 05 60 b4 10 80 70 	movl   $0x270,0x8010b460
801074a6:	02 00 00 
801074a9:	5d                   	pop    %ebp
801074aa:	c3                   	ret    
801074ab:	90                   	nop
801074ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801074b0 <genrand>:
801074b0:	a1 60 b4 10 80       	mov    0x8010b460,%eax
801074b5:	55                   	push   %ebp
801074b6:	89 e5                	mov    %esp,%ebp
801074b8:	56                   	push   %esi
801074b9:	53                   	push   %ebx
801074ba:	3d 6f 02 00 00       	cmp    $0x26f,%eax
801074bf:	0f 8e f9 00 00 00    	jle    801075be <genrand+0x10e>
801074c5:	3d 71 02 00 00       	cmp    $0x271,%eax
801074ca:	0f 84 fa 00 00 00    	je     801075ca <genrand+0x11a>
801074d0:	ba e0 b5 10 80       	mov    $0x8010b5e0,%edx
801074d5:	bb 6c b9 10 80       	mov    $0x8010b96c,%ebx
801074da:	89 d1                	mov    %edx,%ecx
801074dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801074e0:	8b 01                	mov    (%ecx),%eax
801074e2:	8b 71 04             	mov    0x4(%ecx),%esi
801074e5:	83 c1 04             	add    $0x4,%ecx
801074e8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
801074ee:	25 00 00 00 80       	and    $0x80000000,%eax
801074f3:	09 f0                	or     %esi,%eax
801074f5:	89 c6                	mov    %eax,%esi
801074f7:	83 e0 01             	and    $0x1,%eax
801074fa:	d1 ee                	shr    %esi
801074fc:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
80107502:	33 34 85 6c 80 10 80 	xor    -0x7fef7f94(,%eax,4),%esi
80107509:	89 71 fc             	mov    %esi,-0x4(%ecx)
8010750c:	39 cb                	cmp    %ecx,%ebx
8010750e:	75 d0                	jne    801074e0 <genrand+0x30>
80107510:	b9 10 bc 10 80       	mov    $0x8010bc10,%ecx
80107515:	8d 76 00             	lea    0x0(%esi),%esi
80107518:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
8010751e:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
80107524:	83 c2 04             	add    $0x4,%edx
80107527:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
8010752d:	25 00 00 00 80       	and    $0x80000000,%eax
80107532:	09 d8                	or     %ebx,%eax
80107534:	89 c3                	mov    %eax,%ebx
80107536:	83 e0 01             	and    $0x1,%eax
80107539:	d1 eb                	shr    %ebx
8010753b:	33 5a fc             	xor    -0x4(%edx),%ebx
8010753e:	33 1c 85 6c 80 10 80 	xor    -0x7fef7f94(,%eax,4),%ebx
80107545:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
8010754b:	39 d1                	cmp    %edx,%ecx
8010754d:	75 c9                	jne    80107518 <genrand+0x68>
8010754f:	a1 e0 b5 10 80       	mov    0x8010b5e0,%eax
80107554:	8b 0d 9c bf 10 80    	mov    0x8010bf9c,%ecx
8010755a:	89 c2                	mov    %eax,%edx
8010755c:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
80107562:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
80107568:	09 d1                	or     %edx,%ecx
8010756a:	89 ca                	mov    %ecx,%edx
8010756c:	83 e1 01             	and    $0x1,%ecx
8010756f:	d1 ea                	shr    %edx
80107571:	33 15 10 bc 10 80    	xor    0x8010bc10,%edx
80107577:	33 14 8d 6c 80 10 80 	xor    -0x7fef7f94(,%ecx,4),%edx
8010757e:	89 15 9c bf 10 80    	mov    %edx,0x8010bf9c
80107584:	ba 01 00 00 00       	mov    $0x1,%edx
80107589:	89 15 60 b4 10 80    	mov    %edx,0x8010b460
8010758f:	89 c2                	mov    %eax,%edx
80107591:	c1 ea 0b             	shr    $0xb,%edx
80107594:	31 c2                	xor    %eax,%edx
80107596:	89 d0                	mov    %edx,%eax
80107598:	c1 e0 07             	shl    $0x7,%eax
8010759b:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
801075a0:	31 c2                	xor    %eax,%edx
801075a2:	89 d0                	mov    %edx,%eax
801075a4:	c1 e0 0f             	shl    $0xf,%eax
801075a7:	25 00 00 c6 ef       	and    $0xefc60000,%eax
801075ac:	31 d0                	xor    %edx,%eax
801075ae:	89 c2                	mov    %eax,%edx
801075b0:	c1 ea 12             	shr    $0x12,%edx
801075b3:	31 d0                	xor    %edx,%eax
801075b5:	5b                   	pop    %ebx
801075b6:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
801075bb:	5e                   	pop    %esi
801075bc:	5d                   	pop    %ebp
801075bd:	c3                   	ret    
801075be:	8d 50 01             	lea    0x1(%eax),%edx
801075c1:	8b 04 85 e0 b5 10 80 	mov    -0x7fef4a20(,%eax,4),%eax
801075c8:	eb bf                	jmp    80107589 <genrand+0xd9>
801075ca:	c7 05 e0 b5 10 80 05 	movl   $0x1105,0x8010b5e0
801075d1:	11 00 00 
801075d4:	b8 e4 b5 10 80       	mov    $0x8010b5e4,%eax
801075d9:	b9 9c bf 10 80       	mov    $0x8010bf9c,%ecx
801075de:	ba 05 11 00 00       	mov    $0x1105,%edx
801075e3:	eb 06                	jmp    801075eb <genrand+0x13b>
801075e5:	8d 76 00             	lea    0x0(%esi),%esi
801075e8:	83 c0 04             	add    $0x4,%eax
801075eb:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
801075f1:	39 c1                	cmp    %eax,%ecx
801075f3:	89 10                	mov    %edx,(%eax)
801075f5:	75 f1                	jne    801075e8 <genrand+0x138>
801075f7:	e9 d4 fe ff ff       	jmp    801074d0 <genrand+0x20>
801075fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107600 <random_at_most>:
80107600:	55                   	push   %ebp
80107601:	31 d2                	xor    %edx,%edx
80107603:	89 e5                	mov    %esp,%ebp
80107605:	56                   	push   %esi
80107606:	53                   	push   %ebx
80107607:	8b 45 08             	mov    0x8(%ebp),%eax
8010760a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
8010760f:	8d 48 01             	lea    0x1(%eax),%ecx
80107612:	89 d8                	mov    %ebx,%eax
80107614:	f7 f1                	div    %ecx
80107616:	89 c6                	mov    %eax,%esi
80107618:	29 d3                	sub    %edx,%ebx
8010761a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107620:	e8 8b fe ff ff       	call   801074b0 <genrand>
80107625:	39 d8                	cmp    %ebx,%eax
80107627:	73 f7                	jae    80107620 <random_at_most+0x20>
80107629:	31 d2                	xor    %edx,%edx
8010762b:	f7 f6                	div    %esi
8010762d:	5b                   	pop    %ebx
8010762e:	5e                   	pop    %esi
8010762f:	5d                   	pop    %ebp
80107630:	c3                   	ret    
