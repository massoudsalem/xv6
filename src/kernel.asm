
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
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc a0 bf 10 80       	mov    $0x8010bfa0,%esp
8010002d:	b8 60 2f 10 80       	mov    $0x80102f60,%eax
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
80100044:	bb d4 bf 10 80       	mov    $0x8010bfd4,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 c0 73 10 80       	push   $0x801073c0
80100051:	68 a0 bf 10 80       	push   $0x8010bfa0
80100056:	e8 f5 43 00 00       	call   80104450 <initlock>
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 ec 06 11 80 9c 	movl   $0x8011069c,0x801106ec
80100062:	06 11 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 f0 06 11 80 9c 	movl   $0x8011069c,0x801106f0
8010006c:	06 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 9c 06 11 80       	mov    $0x8011069c,%edx
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
8010008b:	c7 43 50 9c 06 11 80 	movl   $0x8011069c,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 c7 73 10 80       	push   $0x801073c7
80100097:	50                   	push   %eax
80100098:	e8 83 42 00 00       	call   80104320 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 f0 06 11 80       	mov    0x801106f0,%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    bcache.head.next = b;
801000b0:	89 1d f0 06 11 80    	mov    %ebx,0x801106f0
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d 9c 06 11 80       	cmp    $0x8011069c,%eax
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
801000df:	68 a0 bf 10 80       	push   $0x8010bfa0
801000e4:	e8 a7 44 00 00       	call   80104590 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d f0 06 11 80    	mov    0x801106f0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 9c 06 11 80    	cmp    $0x8011069c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 9c 06 11 80    	cmp    $0x8011069c,%ebx
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
80100120:	8b 1d ec 06 11 80    	mov    0x801106ec,%ebx
80100126:	81 fb 9c 06 11 80    	cmp    $0x8011069c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 9c 06 11 80    	cmp    $0x8011069c,%ebx
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
8010015d:	68 a0 bf 10 80       	push   $0x8010bfa0
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
8010017e:	e8 0d 20 00 00       	call   80102190 <iderw>
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
80100193:	68 ce 73 10 80       	push   $0x801073ce
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
801001c4:	e9 c7 1f 00 00       	jmp    80102190 <iderw>
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 df 73 10 80       	push   $0x801073df
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
80100204:	c7 04 24 a0 bf 10 80 	movl   $0x8010bfa0,(%esp)
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
80100232:	a1 f0 06 11 80       	mov    0x801106f0,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 9c 06 11 80 	movl   $0x8011069c,0x50(%ebx)
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100241:	a1 f0 06 11 80       	mov    0x801106f0,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d f0 06 11 80    	mov    %ebx,0x801106f0
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 a0 bf 10 80 	movl   $0x8010bfa0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
  release(&bcache.lock);
8010025c:	e9 ef 43 00 00       	jmp    80104650 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 e6 73 10 80       	push   $0x801073e6
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
80100280:	e8 4b 15 00 00       	call   801017d0 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 ff 42 00 00       	call   80104590 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
    while(input.r == input.w){
801002a1:	8b 15 80 09 11 80    	mov    0x80110980,%edx
801002a7:	39 15 84 09 11 80    	cmp    %edx,0x80110984
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
801002bb:	68 20 a5 10 80       	push   $0x8010a520
801002c0:	68 80 09 11 80       	push   $0x80110980
801002c5:	e8 26 3c 00 00       	call   80103ef0 <sleep>
    while(input.r == input.w){
801002ca:	8b 15 80 09 11 80    	mov    0x80110980,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 84 09 11 80    	cmp    0x80110984,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
      if(myproc()->killed){
801002db:	e8 f0 35 00 00       	call   801038d0 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
        release(&cons.lock);
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 a5 10 80       	push   $0x8010a520
801002ef:	e8 5c 43 00 00       	call   80104650 <release>
        ilock(ip);
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 f4 13 00 00       	call   801016f0 <ilock>
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
80100313:	a3 80 09 11 80       	mov    %eax,0x80110980
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 00 09 11 80 	movsbl -0x7feef700(%eax),%eax
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
80100348:	68 20 a5 10 80       	push   $0x8010a520
8010034d:	e8 fe 42 00 00       	call   80104650 <release>
  ilock(ip);
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 96 13 00 00       	call   801016f0 <ilock>
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
80100372:	89 15 80 09 11 80    	mov    %edx,0x80110980
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
80100399:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
801003a0:	00 00 00 
  getcallerpcs(&s, pcs);
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
801003a9:	e8 f2 23 00 00       	call   801027a0 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 ed 73 10 80       	push   $0x801073ed
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 47 7d 10 80 	movl   $0x80107d47,(%esp)
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
801003e8:	68 01 74 10 80       	push   $0x80107401
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
  for(i=0; i<10; i++)
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003f9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
  if(panicked){
80100410:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
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
8010043a:	e8 c1 59 00 00       	call   80105e00 <uartputc>
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
801004ec:	e8 0f 59 00 00       	call   80105e00 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 03 59 00 00       	call   80105e00 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 f7 58 00 00       	call   80105e00 <uartputc>
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
80100551:	68 05 74 10 80       	push   $0x80107405
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
801005b1:	0f b6 92 30 74 10 80 	movzbl -0x7fef8bd0(%edx),%edx
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
8010060f:	e8 bc 11 00 00       	call   801017d0 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
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
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 04 40 00 00       	call   80104650 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 9b 10 00 00       	call   801016f0 <ilock>

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
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
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
8010071a:	68 20 a5 10 80       	push   $0x8010a520
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
80100810:	ba 18 74 10 80       	mov    $0x80107418,%edx
      for(; *s; s++)
80100815:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100818:	b8 28 00 00 00       	mov    $0x28,%eax
8010081d:	89 d3                	mov    %edx,%ebx
8010081f:	eb bf                	jmp    801007e0 <cprintf+0x180>
80100821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
80100828:	83 ec 0c             	sub    $0xc,%esp
8010082b:	68 20 a5 10 80       	push   $0x8010a520
80100830:	e8 5b 3d 00 00       	call   80104590 <acquire>
80100835:	83 c4 10             	add    $0x10,%esp
80100838:	e9 3c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
8010083d:	83 ec 0c             	sub    $0xc,%esp
80100840:	68 1f 74 10 80       	push   $0x8010741f
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
8010085e:	68 20 a5 10 80       	push   $0x8010a520
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
80100891:	a1 88 09 11 80       	mov    0x80110988,%eax
80100896:	3b 05 84 09 11 80    	cmp    0x80110984,%eax
8010089c:	74 d2                	je     80100870 <consoleintr+0x20>
        input.e--;
8010089e:	83 e8 01             	sub    $0x1,%eax
801008a1:	a3 88 09 11 80       	mov    %eax,0x80110988
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
801008c3:	68 20 a5 10 80       	push   $0x8010a520
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
801008e9:	a1 88 09 11 80       	mov    0x80110988,%eax
801008ee:	89 c2                	mov    %eax,%edx
801008f0:	2b 15 80 09 11 80    	sub    0x80110980,%edx
801008f6:	83 fa 7f             	cmp    $0x7f,%edx
801008f9:	0f 87 71 ff ff ff    	ja     80100870 <consoleintr+0x20>
801008ff:	8d 50 01             	lea    0x1(%eax),%edx
80100902:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
80100905:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100908:	89 15 88 09 11 80    	mov    %edx,0x80110988
        c = (c == '\r') ? '\n' : c;
8010090e:	0f 84 cc 00 00 00    	je     801009e0 <consoleintr+0x190>
        input.buf[input.e++ % INPUT_BUF] = c;
80100914:	89 f9                	mov    %edi,%ecx
80100916:	88 88 00 09 11 80    	mov    %cl,-0x7feef700(%eax)
        consputc(c);
8010091c:	89 f8                	mov    %edi,%eax
8010091e:	e8 ed fa ff ff       	call   80100410 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
80100923:	83 ff 0a             	cmp    $0xa,%edi
80100926:	0f 84 c5 00 00 00    	je     801009f1 <consoleintr+0x1a1>
8010092c:	83 ff 04             	cmp    $0x4,%edi
8010092f:	0f 84 bc 00 00 00    	je     801009f1 <consoleintr+0x1a1>
80100935:	a1 80 09 11 80       	mov    0x80110980,%eax
8010093a:	83 e8 80             	sub    $0xffffff80,%eax
8010093d:	39 05 88 09 11 80    	cmp    %eax,0x80110988
80100943:	0f 85 27 ff ff ff    	jne    80100870 <consoleintr+0x20>
          wakeup(&input.r);
80100949:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
8010094c:	a3 84 09 11 80       	mov    %eax,0x80110984
          wakeup(&input.r);
80100951:	68 80 09 11 80       	push   $0x80110980
80100956:	e8 55 37 00 00       	call   801040b0 <wakeup>
8010095b:	83 c4 10             	add    $0x10,%esp
8010095e:	e9 0d ff ff ff       	jmp    80100870 <consoleintr+0x20>
80100963:	90                   	nop
80100964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      doprocdump = 1;
80100968:	be 01 00 00 00       	mov    $0x1,%esi
8010096d:	e9 fe fe ff ff       	jmp    80100870 <consoleintr+0x20>
80100972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      while(input.e != input.w &&
80100978:	a1 88 09 11 80       	mov    0x80110988,%eax
8010097d:	39 05 84 09 11 80    	cmp    %eax,0x80110984
80100983:	75 2b                	jne    801009b0 <consoleintr+0x160>
80100985:	e9 e6 fe ff ff       	jmp    80100870 <consoleintr+0x20>
8010098a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100990:	a3 88 09 11 80       	mov    %eax,0x80110988
        consputc(BACKSPACE);
80100995:	b8 00 01 00 00       	mov    $0x100,%eax
8010099a:	e8 71 fa ff ff       	call   80100410 <consputc>
      while(input.e != input.w &&
8010099f:	a1 88 09 11 80       	mov    0x80110988,%eax
801009a4:	3b 05 84 09 11 80    	cmp    0x80110984,%eax
801009aa:	0f 84 c0 fe ff ff    	je     80100870 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
801009b0:	83 e8 01             	sub    $0x1,%eax
801009b3:	89 c2                	mov    %eax,%edx
801009b5:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
801009b8:	80 ba 00 09 11 80 0a 	cmpb   $0xa,-0x7feef700(%edx)
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
801009e0:	c6 80 00 09 11 80 0a 	movb   $0xa,-0x7feef700(%eax)
        consputc(c);
801009e7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ec:	e8 1f fa ff ff       	call   80100410 <consputc>
801009f1:	a1 88 09 11 80       	mov    0x80110988,%eax
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
80100a06:	68 28 74 10 80       	push   $0x80107428
80100a0b:	68 20 a5 10 80       	push   $0x8010a520
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
80100a1b:	c7 05 4c 13 11 80 00 	movl   $0x80100600,0x8011134c
80100a22:	06 10 80 
  devsw[CONSOLE].read = consoleread;
80100a25:	c7 05 48 13 11 80 70 	movl   $0x80100270,0x80111348
80100a2c:	02 10 80 
  cons.locking = 1;
80100a2f:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
80100a36:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
80100a39:	e8 02 19 00 00       	call   80102340 <ioapicenable>
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
  int i, off;
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  struct proc *curproc = myproc();
80100a5c:	e8 6f 2e 00 00       	call   801038d0 <myproc>
80100a61:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
  pde_t *pgdir, *oldpgdir;
  
  begin_op();
80100a67:	e8 f4 21 00 00       	call   80102c60 <begin_op>
  if((ip = namei(path)) == 0){
80100a6c:	83 ec 0c             	sub    $0xc,%esp
80100a6f:	ff 75 08             	pushl  0x8(%ebp)
80100a72:	e8 d9 14 00 00       	call   80101f50 <namei>
80100a77:	83 c4 10             	add    $0x10,%esp
80100a7a:	85 c0                	test   %eax,%eax
80100a7c:	0f 84 c1 01 00 00    	je     80100c43 <exec+0x1f3>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a82:	83 ec 0c             	sub    $0xc,%esp
80100a85:	89 c3                	mov    %eax,%ebx
80100a87:	50                   	push   %eax
80100a88:	e8 63 0c 00 00       	call   801016f0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a8d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a93:	6a 34                	push   $0x34
80100a95:	6a 00                	push   $0x0
80100a97:	50                   	push   %eax
80100a98:	53                   	push   %ebx
80100a99:	e8 32 0f 00 00       	call   801019d0 <readi>
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
80100aaa:	e8 d1 0e 00 00       	call   80101980 <iunlockput>
    end_op();
80100aaf:	e8 1c 22 00 00       	call   80102cd0 <end_op>
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
80100ad4:	e8 77 64 00 00       	call   80106f50 <setupkvm>
80100ad9:	85 c0                	test   %eax,%eax
80100adb:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100ae1:	74 c3                	je     80100aa6 <exec+0x56>
  sz = 0;
80100ae3:	31 ff                	xor    %edi,%edi
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100ae5:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aec:	00 
80100aed:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100af3:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100af9:	0f 84 bc 02 00 00    	je     80100dbb <exec+0x36b>
80100aff:	31 f6                	xor    %esi,%esi
80100b01:	e9 ac 00 00 00       	jmp    80100bb2 <exec+0x162>
80100b06:	8d 76 00             	lea    0x0(%esi),%esi
80100b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ph.type != ELF_PROG_LOAD)
80100b10:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b17:	0f 85 87 00 00 00    	jne    80100ba4 <exec+0x154>
    if(ph.memsz < ph.filesz)
80100b1d:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b23:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b29:	0f 82 aa 00 00 00    	jb     80100bd9 <exec+0x189>
   cprintf("pid %d %d %d ",curproc->pid, sz, ph.vaddr + ph.memsz ); 
80100b2f:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b35:	50                   	push   %eax
80100b36:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b3c:	57                   	push   %edi
80100b3d:	ff 70 10             	pushl  0x10(%eax)
80100b40:	68 4d 74 10 80       	push   $0x8010744d
80100b45:	e8 16 fb ff ff       	call   80100660 <cprintf>
80100b4a:	83 c4 10             	add    $0x10,%esp
80100b4d:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b53:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b59:	72 7e                	jb     80100bd9 <exec+0x189>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b5b:	83 ec 04             	sub    $0x4,%esp
80100b5e:	50                   	push   %eax
80100b5f:	57                   	push   %edi
80100b60:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b66:	e8 05 62 00 00       	call   80106d70 <allocuvm>
80100b6b:	83 c4 10             	add    $0x10,%esp
80100b6e:	85 c0                	test   %eax,%eax
80100b70:	89 c7                	mov    %eax,%edi
80100b72:	74 65                	je     80100bd9 <exec+0x189>
    if(ph.vaddr % PGSIZE != 0)
80100b74:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b7a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b7f:	75 58                	jne    80100bd9 <exec+0x189>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b81:	83 ec 0c             	sub    $0xc,%esp
80100b84:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b8a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b90:	53                   	push   %ebx
80100b91:	50                   	push   %eax
80100b92:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b98:	e8 13 61 00 00       	call   80106cb0 <loaduvm>
80100b9d:	83 c4 20             	add    $0x20,%esp
80100ba0:	85 c0                	test   %eax,%eax
80100ba2:	78 35                	js     80100bd9 <exec+0x189>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100ba4:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bab:	83 c6 01             	add    $0x1,%esi
80100bae:	39 f0                	cmp    %esi,%eax
80100bb0:	7e 3d                	jle    80100bef <exec+0x19f>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100bb2:	89 f0                	mov    %esi,%eax
80100bb4:	6a 20                	push   $0x20
80100bb6:	c1 e0 05             	shl    $0x5,%eax
80100bb9:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100bbf:	50                   	push   %eax
80100bc0:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100bc6:	50                   	push   %eax
80100bc7:	53                   	push   %ebx
80100bc8:	e8 03 0e 00 00       	call   801019d0 <readi>
80100bcd:	83 c4 10             	add    $0x10,%esp
80100bd0:	83 f8 20             	cmp    $0x20,%eax
80100bd3:	0f 84 37 ff ff ff    	je     80100b10 <exec+0xc0>
    freevm(pgdir);
80100bd9:	83 ec 0c             	sub    $0xc,%esp
80100bdc:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100be2:	e8 e9 62 00 00       	call   80106ed0 <freevm>
80100be7:	83 c4 10             	add    $0x10,%esp
80100bea:	e9 b7 fe ff ff       	jmp    80100aa6 <exec+0x56>
80100bef:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100bf5:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100bfb:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100c01:	83 ec 0c             	sub    $0xc,%esp
80100c04:	53                   	push   %ebx
80100c05:	e8 76 0d 00 00       	call   80101980 <iunlockput>
  end_op();
80100c0a:	e8 c1 20 00 00       	call   80102cd0 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c0f:	83 c4 0c             	add    $0xc,%esp
80100c12:	56                   	push   %esi
80100c13:	57                   	push   %edi
80100c14:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c1a:	e8 51 61 00 00       	call   80106d70 <allocuvm>
80100c1f:	83 c4 10             	add    $0x10,%esp
80100c22:	85 c0                	test   %eax,%eax
80100c24:	89 c6                	mov    %eax,%esi
80100c26:	75 3a                	jne    80100c62 <exec+0x212>
    freevm(pgdir);
80100c28:	83 ec 0c             	sub    $0xc,%esp
80100c2b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c31:	e8 9a 62 00 00       	call   80106ed0 <freevm>
80100c36:	83 c4 10             	add    $0x10,%esp
  return -1;
80100c39:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c3e:	e9 79 fe ff ff       	jmp    80100abc <exec+0x6c>
    end_op();
80100c43:	e8 88 20 00 00       	call   80102cd0 <end_op>
    cprintf("exec: fail\n");
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	68 41 74 10 80       	push   $0x80107441
80100c50:	e8 0b fa ff ff       	call   80100660 <cprintf>
    return -1;
80100c55:	83 c4 10             	add    $0x10,%esp
80100c58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c5d:	e9 5a fe ff ff       	jmp    80100abc <exec+0x6c>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c62:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100c68:	83 ec 08             	sub    $0x8,%esp
  for(argc = 0; argv[argc]; argc++) {
80100c6b:	31 ff                	xor    %edi,%edi
80100c6d:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c6f:	50                   	push   %eax
80100c70:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c76:	e8 75 63 00 00       	call   80106ff0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c7b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c7e:	83 c4 10             	add    $0x10,%esp
80100c81:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c87:	8b 00                	mov    (%eax),%eax
80100c89:	85 c0                	test   %eax,%eax
80100c8b:	74 70                	je     80100cfd <exec+0x2ad>
80100c8d:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c93:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c99:	eb 0a                	jmp    80100ca5 <exec+0x255>
80100c9b:	90                   	nop
80100c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(argc >= MAXARG)
80100ca0:	83 ff 20             	cmp    $0x20,%edi
80100ca3:	74 83                	je     80100c28 <exec+0x1d8>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ca5:	83 ec 0c             	sub    $0xc,%esp
80100ca8:	50                   	push   %eax
80100ca9:	e8 12 3c 00 00       	call   801048c0 <strlen>
80100cae:	f7 d0                	not    %eax
80100cb0:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cb2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cb5:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cb6:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cb9:	ff 34 b8             	pushl  (%eax,%edi,4)
80100cbc:	e8 ff 3b 00 00       	call   801048c0 <strlen>
80100cc1:	83 c0 01             	add    $0x1,%eax
80100cc4:	50                   	push   %eax
80100cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cc8:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ccb:	53                   	push   %ebx
80100ccc:	56                   	push   %esi
80100ccd:	e8 7e 64 00 00       	call   80107150 <copyout>
80100cd2:	83 c4 20             	add    $0x20,%esp
80100cd5:	85 c0                	test   %eax,%eax
80100cd7:	0f 88 4b ff ff ff    	js     80100c28 <exec+0x1d8>
  for(argc = 0; argv[argc]; argc++) {
80100cdd:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100ce0:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100ce7:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100cea:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100cf0:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100cf3:	85 c0                	test   %eax,%eax
80100cf5:	75 a9                	jne    80100ca0 <exec+0x250>
80100cf7:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cfd:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100d04:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100d06:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100d0d:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100d11:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d18:	ff ff ff 
  ustack[1] = argc;
80100d1b:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d21:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100d23:	83 c0 0c             	add    $0xc,%eax
80100d26:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d28:	50                   	push   %eax
80100d29:	52                   	push   %edx
80100d2a:	53                   	push   %ebx
80100d2b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d31:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d37:	e8 14 64 00 00       	call   80107150 <copyout>
80100d3c:	83 c4 10             	add    $0x10,%esp
80100d3f:	85 c0                	test   %eax,%eax
80100d41:	0f 88 e1 fe ff ff    	js     80100c28 <exec+0x1d8>
  for(last=s=path; *s; s++)
80100d47:	8b 45 08             	mov    0x8(%ebp),%eax
80100d4a:	0f b6 00             	movzbl (%eax),%eax
80100d4d:	84 c0                	test   %al,%al
80100d4f:	74 17                	je     80100d68 <exec+0x318>
80100d51:	8b 55 08             	mov    0x8(%ebp),%edx
80100d54:	89 d1                	mov    %edx,%ecx
80100d56:	83 c1 01             	add    $0x1,%ecx
80100d59:	3c 2f                	cmp    $0x2f,%al
80100d5b:	0f b6 01             	movzbl (%ecx),%eax
80100d5e:	0f 44 d1             	cmove  %ecx,%edx
80100d61:	84 c0                	test   %al,%al
80100d63:	75 f1                	jne    80100d56 <exec+0x306>
80100d65:	89 55 08             	mov    %edx,0x8(%ebp)
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d68:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100d6e:	50                   	push   %eax
80100d6f:	6a 10                	push   $0x10
80100d71:	ff 75 08             	pushl  0x8(%ebp)
80100d74:	89 f8                	mov    %edi,%eax
80100d76:	83 c0 6c             	add    $0x6c,%eax
80100d79:	50                   	push   %eax
80100d7a:	e8 01 3b 00 00       	call   80104880 <safestrcpy>
  curproc->pgdir = pgdir;
80100d7f:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
  oldpgdir = curproc->pgdir;
80100d85:	89 f9                	mov    %edi,%ecx
80100d87:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->tf->eip = elf.entry;  // main
80100d8a:	8b 41 18             	mov    0x18(%ecx),%eax
  curproc->sz = sz;
80100d8d:	89 31                	mov    %esi,(%ecx)
  curproc->pgdir = pgdir;
80100d8f:	89 51 04             	mov    %edx,0x4(%ecx)
  curproc->tf->eip = elf.entry;  // main
80100d92:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d98:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d9b:	8b 41 18             	mov    0x18(%ecx),%eax
80100d9e:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100da1:	89 0c 24             	mov    %ecx,(%esp)
80100da4:	e8 77 5d 00 00       	call   80106b20 <switchuvm>
  freevm(oldpgdir);
80100da9:	89 3c 24             	mov    %edi,(%esp)
80100dac:	e8 1f 61 00 00       	call   80106ed0 <freevm>
  return 0;
80100db1:	83 c4 10             	add    $0x10,%esp
80100db4:	31 c0                	xor    %eax,%eax
80100db6:	e9 01 fd ff ff       	jmp    80100abc <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100dbb:	be 00 20 00 00       	mov    $0x2000,%esi
80100dc0:	e9 3c fe ff ff       	jmp    80100c01 <exec+0x1b1>
80100dc5:	66 90                	xchg   %ax,%ax
80100dc7:	66 90                	xchg   %ax,%ax
80100dc9:	66 90                	xchg   %ax,%ax
80100dcb:	66 90                	xchg   %ax,%ax
80100dcd:	66 90                	xchg   %ax,%ax
80100dcf:	90                   	nop

80100dd0 <fileinit>:
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	83 ec 10             	sub    $0x10,%esp
80100dd6:	68 5b 74 10 80       	push   $0x8010745b
80100ddb:	68 a0 09 11 80       	push   $0x801109a0
80100de0:	e8 6b 36 00 00       	call   80104450 <initlock>
80100de5:	83 c4 10             	add    $0x10,%esp
80100de8:	c9                   	leave  
80100de9:	c3                   	ret    
80100dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100df0 <filealloc>:
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	53                   	push   %ebx
80100df4:	bb d4 09 11 80       	mov    $0x801109d4,%ebx
80100df9:	83 ec 10             	sub    $0x10,%esp
80100dfc:	68 a0 09 11 80       	push   $0x801109a0
80100e01:	e8 8a 37 00 00       	call   80104590 <acquire>
80100e06:	83 c4 10             	add    $0x10,%esp
80100e09:	eb 10                	jmp    80100e1b <filealloc+0x2b>
80100e0b:	90                   	nop
80100e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e10:	83 c3 18             	add    $0x18,%ebx
80100e13:	81 fb 34 13 11 80    	cmp    $0x80111334,%ebx
80100e19:	73 25                	jae    80100e40 <filealloc+0x50>
80100e1b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e1e:	85 c0                	test   %eax,%eax
80100e20:	75 ee                	jne    80100e10 <filealloc+0x20>
80100e22:	83 ec 0c             	sub    $0xc,%esp
80100e25:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100e2c:	68 a0 09 11 80       	push   $0x801109a0
80100e31:	e8 1a 38 00 00       	call   80104650 <release>
80100e36:	89 d8                	mov    %ebx,%eax
80100e38:	83 c4 10             	add    $0x10,%esp
80100e3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e3e:	c9                   	leave  
80100e3f:	c3                   	ret    
80100e40:	83 ec 0c             	sub    $0xc,%esp
80100e43:	31 db                	xor    %ebx,%ebx
80100e45:	68 a0 09 11 80       	push   $0x801109a0
80100e4a:	e8 01 38 00 00       	call   80104650 <release>
80100e4f:	89 d8                	mov    %ebx,%eax
80100e51:	83 c4 10             	add    $0x10,%esp
80100e54:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e57:	c9                   	leave  
80100e58:	c3                   	ret    
80100e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e60 <filedup>:
80100e60:	55                   	push   %ebp
80100e61:	89 e5                	mov    %esp,%ebp
80100e63:	53                   	push   %ebx
80100e64:	83 ec 10             	sub    $0x10,%esp
80100e67:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e6a:	68 a0 09 11 80       	push   $0x801109a0
80100e6f:	e8 1c 37 00 00       	call   80104590 <acquire>
80100e74:	8b 43 04             	mov    0x4(%ebx),%eax
80100e77:	83 c4 10             	add    $0x10,%esp
80100e7a:	85 c0                	test   %eax,%eax
80100e7c:	7e 1a                	jle    80100e98 <filedup+0x38>
80100e7e:	83 c0 01             	add    $0x1,%eax
80100e81:	83 ec 0c             	sub    $0xc,%esp
80100e84:	89 43 04             	mov    %eax,0x4(%ebx)
80100e87:	68 a0 09 11 80       	push   $0x801109a0
80100e8c:	e8 bf 37 00 00       	call   80104650 <release>
80100e91:	89 d8                	mov    %ebx,%eax
80100e93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e96:	c9                   	leave  
80100e97:	c3                   	ret    
80100e98:	83 ec 0c             	sub    $0xc,%esp
80100e9b:	68 62 74 10 80       	push   $0x80107462
80100ea0:	e8 eb f4 ff ff       	call   80100390 <panic>
80100ea5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100eb0 <fileclose>:
80100eb0:	55                   	push   %ebp
80100eb1:	89 e5                	mov    %esp,%ebp
80100eb3:	57                   	push   %edi
80100eb4:	56                   	push   %esi
80100eb5:	53                   	push   %ebx
80100eb6:	83 ec 28             	sub    $0x28,%esp
80100eb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100ebc:	68 a0 09 11 80       	push   $0x801109a0
80100ec1:	e8 ca 36 00 00       	call   80104590 <acquire>
80100ec6:	8b 43 04             	mov    0x4(%ebx),%eax
80100ec9:	83 c4 10             	add    $0x10,%esp
80100ecc:	85 c0                	test   %eax,%eax
80100ece:	0f 8e 9b 00 00 00    	jle    80100f6f <fileclose+0xbf>
80100ed4:	83 e8 01             	sub    $0x1,%eax
80100ed7:	85 c0                	test   %eax,%eax
80100ed9:	89 43 04             	mov    %eax,0x4(%ebx)
80100edc:	74 1a                	je     80100ef8 <fileclose+0x48>
80100ede:	c7 45 08 a0 09 11 80 	movl   $0x801109a0,0x8(%ebp)
80100ee5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee8:	5b                   	pop    %ebx
80100ee9:	5e                   	pop    %esi
80100eea:	5f                   	pop    %edi
80100eeb:	5d                   	pop    %ebp
80100eec:	e9 5f 37 00 00       	jmp    80104650 <release>
80100ef1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100ef8:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100efc:	8b 3b                	mov    (%ebx),%edi
80100efe:	83 ec 0c             	sub    $0xc,%esp
80100f01:	8b 73 0c             	mov    0xc(%ebx),%esi
80100f04:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100f0a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f0d:	8b 43 10             	mov    0x10(%ebx),%eax
80100f10:	68 a0 09 11 80       	push   $0x801109a0
80100f15:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100f18:	e8 33 37 00 00       	call   80104650 <release>
80100f1d:	83 c4 10             	add    $0x10,%esp
80100f20:	83 ff 01             	cmp    $0x1,%edi
80100f23:	74 13                	je     80100f38 <fileclose+0x88>
80100f25:	83 ff 02             	cmp    $0x2,%edi
80100f28:	74 26                	je     80100f50 <fileclose+0xa0>
80100f2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f2d:	5b                   	pop    %ebx
80100f2e:	5e                   	pop    %esi
80100f2f:	5f                   	pop    %edi
80100f30:	5d                   	pop    %ebp
80100f31:	c3                   	ret    
80100f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f38:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100f3c:	83 ec 08             	sub    $0x8,%esp
80100f3f:	53                   	push   %ebx
80100f40:	56                   	push   %esi
80100f41:	e8 ca 24 00 00       	call   80103410 <pipeclose>
80100f46:	83 c4 10             	add    $0x10,%esp
80100f49:	eb df                	jmp    80100f2a <fileclose+0x7a>
80100f4b:	90                   	nop
80100f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f50:	e8 0b 1d 00 00       	call   80102c60 <begin_op>
80100f55:	83 ec 0c             	sub    $0xc,%esp
80100f58:	ff 75 e0             	pushl  -0x20(%ebp)
80100f5b:	e8 c0 08 00 00       	call   80101820 <iput>
80100f60:	83 c4 10             	add    $0x10,%esp
80100f63:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f66:	5b                   	pop    %ebx
80100f67:	5e                   	pop    %esi
80100f68:	5f                   	pop    %edi
80100f69:	5d                   	pop    %ebp
80100f6a:	e9 61 1d 00 00       	jmp    80102cd0 <end_op>
80100f6f:	83 ec 0c             	sub    $0xc,%esp
80100f72:	68 6a 74 10 80       	push   $0x8010746a
80100f77:	e8 14 f4 ff ff       	call   80100390 <panic>
80100f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f80 <filestat>:
80100f80:	55                   	push   %ebp
80100f81:	89 e5                	mov    %esp,%ebp
80100f83:	53                   	push   %ebx
80100f84:	83 ec 04             	sub    $0x4,%esp
80100f87:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f8a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f8d:	75 31                	jne    80100fc0 <filestat+0x40>
80100f8f:	83 ec 0c             	sub    $0xc,%esp
80100f92:	ff 73 10             	pushl  0x10(%ebx)
80100f95:	e8 56 07 00 00       	call   801016f0 <ilock>
80100f9a:	58                   	pop    %eax
80100f9b:	5a                   	pop    %edx
80100f9c:	ff 75 0c             	pushl  0xc(%ebp)
80100f9f:	ff 73 10             	pushl  0x10(%ebx)
80100fa2:	e8 f9 09 00 00       	call   801019a0 <stati>
80100fa7:	59                   	pop    %ecx
80100fa8:	ff 73 10             	pushl  0x10(%ebx)
80100fab:	e8 20 08 00 00       	call   801017d0 <iunlock>
80100fb0:	83 c4 10             	add    $0x10,%esp
80100fb3:	31 c0                	xor    %eax,%eax
80100fb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100fb8:	c9                   	leave  
80100fb9:	c3                   	ret    
80100fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fc5:	eb ee                	jmp    80100fb5 <filestat+0x35>
80100fc7:	89 f6                	mov    %esi,%esi
80100fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fd0 <fileread>:
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 0c             	sub    $0xc,%esp
80100fd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fdc:	8b 75 0c             	mov    0xc(%ebp),%esi
80100fdf:	8b 7d 10             	mov    0x10(%ebp),%edi
80100fe2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100fe6:	74 60                	je     80101048 <fileread+0x78>
80100fe8:	8b 03                	mov    (%ebx),%eax
80100fea:	83 f8 01             	cmp    $0x1,%eax
80100fed:	74 41                	je     80101030 <fileread+0x60>
80100fef:	83 f8 02             	cmp    $0x2,%eax
80100ff2:	75 5b                	jne    8010104f <fileread+0x7f>
80100ff4:	83 ec 0c             	sub    $0xc,%esp
80100ff7:	ff 73 10             	pushl  0x10(%ebx)
80100ffa:	e8 f1 06 00 00       	call   801016f0 <ilock>
80100fff:	57                   	push   %edi
80101000:	ff 73 14             	pushl  0x14(%ebx)
80101003:	56                   	push   %esi
80101004:	ff 73 10             	pushl  0x10(%ebx)
80101007:	e8 c4 09 00 00       	call   801019d0 <readi>
8010100c:	83 c4 20             	add    $0x20,%esp
8010100f:	85 c0                	test   %eax,%eax
80101011:	89 c6                	mov    %eax,%esi
80101013:	7e 03                	jle    80101018 <fileread+0x48>
80101015:	01 43 14             	add    %eax,0x14(%ebx)
80101018:	83 ec 0c             	sub    $0xc,%esp
8010101b:	ff 73 10             	pushl  0x10(%ebx)
8010101e:	e8 ad 07 00 00       	call   801017d0 <iunlock>
80101023:	83 c4 10             	add    $0x10,%esp
80101026:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101029:	89 f0                	mov    %esi,%eax
8010102b:	5b                   	pop    %ebx
8010102c:	5e                   	pop    %esi
8010102d:	5f                   	pop    %edi
8010102e:	5d                   	pop    %ebp
8010102f:	c3                   	ret    
80101030:	8b 43 0c             	mov    0xc(%ebx),%eax
80101033:	89 45 08             	mov    %eax,0x8(%ebp)
80101036:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101039:	5b                   	pop    %ebx
8010103a:	5e                   	pop    %esi
8010103b:	5f                   	pop    %edi
8010103c:	5d                   	pop    %ebp
8010103d:	e9 7e 25 00 00       	jmp    801035c0 <piperead>
80101042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101048:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010104d:	eb d7                	jmp    80101026 <fileread+0x56>
8010104f:	83 ec 0c             	sub    $0xc,%esp
80101052:	68 74 74 10 80       	push   $0x80107474
80101057:	e8 34 f3 ff ff       	call   80100390 <panic>
8010105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101060 <filewrite>:
80101060:	55                   	push   %ebp
80101061:	89 e5                	mov    %esp,%ebp
80101063:	57                   	push   %edi
80101064:	56                   	push   %esi
80101065:	53                   	push   %ebx
80101066:	83 ec 1c             	sub    $0x1c,%esp
80101069:	8b 75 08             	mov    0x8(%ebp),%esi
8010106c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010106f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101073:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101076:	8b 45 10             	mov    0x10(%ebp),%eax
80101079:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010107c:	0f 84 aa 00 00 00    	je     8010112c <filewrite+0xcc>
80101082:	8b 06                	mov    (%esi),%eax
80101084:	83 f8 01             	cmp    $0x1,%eax
80101087:	0f 84 c3 00 00 00    	je     80101150 <filewrite+0xf0>
8010108d:	83 f8 02             	cmp    $0x2,%eax
80101090:	0f 85 d9 00 00 00    	jne    8010116f <filewrite+0x10f>
80101096:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101099:	31 ff                	xor    %edi,%edi
8010109b:	85 c0                	test   %eax,%eax
8010109d:	7f 34                	jg     801010d3 <filewrite+0x73>
8010109f:	e9 9c 00 00 00       	jmp    80101140 <filewrite+0xe0>
801010a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010a8:	01 46 14             	add    %eax,0x14(%esi)
801010ab:	83 ec 0c             	sub    $0xc,%esp
801010ae:	ff 76 10             	pushl  0x10(%esi)
801010b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010b4:	e8 17 07 00 00       	call   801017d0 <iunlock>
801010b9:	e8 12 1c 00 00       	call   80102cd0 <end_op>
801010be:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010c1:	83 c4 10             	add    $0x10,%esp
801010c4:	39 c3                	cmp    %eax,%ebx
801010c6:	0f 85 96 00 00 00    	jne    80101162 <filewrite+0x102>
801010cc:	01 df                	add    %ebx,%edi
801010ce:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010d1:	7e 6d                	jle    80101140 <filewrite+0xe0>
801010d3:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801010d6:	b8 00 06 00 00       	mov    $0x600,%eax
801010db:	29 fb                	sub    %edi,%ebx
801010dd:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
801010e3:	0f 4f d8             	cmovg  %eax,%ebx
801010e6:	e8 75 1b 00 00       	call   80102c60 <begin_op>
801010eb:	83 ec 0c             	sub    $0xc,%esp
801010ee:	ff 76 10             	pushl  0x10(%esi)
801010f1:	e8 fa 05 00 00       	call   801016f0 <ilock>
801010f6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010f9:	53                   	push   %ebx
801010fa:	ff 76 14             	pushl  0x14(%esi)
801010fd:	01 f8                	add    %edi,%eax
801010ff:	50                   	push   %eax
80101100:	ff 76 10             	pushl  0x10(%esi)
80101103:	e8 c8 09 00 00       	call   80101ad0 <writei>
80101108:	83 c4 20             	add    $0x20,%esp
8010110b:	85 c0                	test   %eax,%eax
8010110d:	7f 99                	jg     801010a8 <filewrite+0x48>
8010110f:	83 ec 0c             	sub    $0xc,%esp
80101112:	ff 76 10             	pushl  0x10(%esi)
80101115:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101118:	e8 b3 06 00 00       	call   801017d0 <iunlock>
8010111d:	e8 ae 1b 00 00       	call   80102cd0 <end_op>
80101122:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101125:	83 c4 10             	add    $0x10,%esp
80101128:	85 c0                	test   %eax,%eax
8010112a:	74 98                	je     801010c4 <filewrite+0x64>
8010112c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010112f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80101134:	89 f8                	mov    %edi,%eax
80101136:	5b                   	pop    %ebx
80101137:	5e                   	pop    %esi
80101138:	5f                   	pop    %edi
80101139:	5d                   	pop    %ebp
8010113a:	c3                   	ret    
8010113b:	90                   	nop
8010113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101140:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101143:	75 e7                	jne    8010112c <filewrite+0xcc>
80101145:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101148:	89 f8                	mov    %edi,%eax
8010114a:	5b                   	pop    %ebx
8010114b:	5e                   	pop    %esi
8010114c:	5f                   	pop    %edi
8010114d:	5d                   	pop    %ebp
8010114e:	c3                   	ret    
8010114f:	90                   	nop
80101150:	8b 46 0c             	mov    0xc(%esi),%eax
80101153:	89 45 08             	mov    %eax,0x8(%ebp)
80101156:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101159:	5b                   	pop    %ebx
8010115a:	5e                   	pop    %esi
8010115b:	5f                   	pop    %edi
8010115c:	5d                   	pop    %ebp
8010115d:	e9 4e 23 00 00       	jmp    801034b0 <pipewrite>
80101162:	83 ec 0c             	sub    $0xc,%esp
80101165:	68 7d 74 10 80       	push   $0x8010747d
8010116a:	e8 21 f2 ff ff       	call   80100390 <panic>
8010116f:	83 ec 0c             	sub    $0xc,%esp
80101172:	68 83 74 10 80       	push   $0x80107483
80101177:	e8 14 f2 ff ff       	call   80100390 <panic>
8010117c:	66 90                	xchg   %ax,%ax
8010117e:	66 90                	xchg   %ax,%ax

80101180 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80101180:	55                   	push   %ebp
80101181:	89 e5                	mov    %esp,%ebp
80101183:	56                   	push   %esi
80101184:	53                   	push   %ebx
80101185:	89 d3                	mov    %edx,%ebx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80101187:	c1 ea 0c             	shr    $0xc,%edx
8010118a:	03 15 b8 13 11 80    	add    0x801113b8,%edx
80101190:	83 ec 08             	sub    $0x8,%esp
80101193:	52                   	push   %edx
80101194:	50                   	push   %eax
80101195:	e8 36 ef ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010119a:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010119c:	c1 fb 03             	sar    $0x3,%ebx
  m = 1 << (bi % 8);
8010119f:	ba 01 00 00 00       	mov    $0x1,%edx
801011a4:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
801011a7:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
801011ad:	83 c4 10             	add    $0x10,%esp
  m = 1 << (bi % 8);
801011b0:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
801011b2:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
801011b7:	85 d1                	test   %edx,%ecx
801011b9:	74 25                	je     801011e0 <bfree+0x60>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
801011bb:	f7 d2                	not    %edx
801011bd:	89 c6                	mov    %eax,%esi
  log_write(bp);
801011bf:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
801011c2:	21 ca                	and    %ecx,%edx
801011c4:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
  log_write(bp);
801011c8:	56                   	push   %esi
801011c9:	e8 62 1c 00 00       	call   80102e30 <log_write>
  brelse(bp);
801011ce:	89 34 24             	mov    %esi,(%esp)
801011d1:	e8 0a f0 ff ff       	call   801001e0 <brelse>
}
801011d6:	83 c4 10             	add    $0x10,%esp
801011d9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801011dc:	5b                   	pop    %ebx
801011dd:	5e                   	pop    %esi
801011de:	5d                   	pop    %ebp
801011df:	c3                   	ret    
    panic("freeing free block");
801011e0:	83 ec 0c             	sub    $0xc,%esp
801011e3:	68 8d 74 10 80       	push   $0x8010748d
801011e8:	e8 a3 f1 ff ff       	call   80100390 <panic>
801011ed:	8d 76 00             	lea    0x0(%esi),%esi

801011f0 <balloc>:
{
801011f0:	55                   	push   %ebp
801011f1:	89 e5                	mov    %esp,%ebp
801011f3:	57                   	push   %edi
801011f4:	56                   	push   %esi
801011f5:	53                   	push   %ebx
801011f6:	83 ec 1c             	sub    $0x1c,%esp
  for(b = 0; b < sb.size; b += BPB){
801011f9:	8b 0d a0 13 11 80    	mov    0x801113a0,%ecx
{
801011ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101202:	85 c9                	test   %ecx,%ecx
80101204:	0f 84 87 00 00 00    	je     80101291 <balloc+0xa1>
8010120a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101211:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101214:	83 ec 08             	sub    $0x8,%esp
80101217:	89 f0                	mov    %esi,%eax
80101219:	c1 f8 0c             	sar    $0xc,%eax
8010121c:	03 05 b8 13 11 80    	add    0x801113b8,%eax
80101222:	50                   	push   %eax
80101223:	ff 75 d8             	pushl  -0x28(%ebp)
80101226:	e8 a5 ee ff ff       	call   801000d0 <bread>
8010122b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010122e:	a1 a0 13 11 80       	mov    0x801113a0,%eax
80101233:	83 c4 10             	add    $0x10,%esp
80101236:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101239:	31 c0                	xor    %eax,%eax
8010123b:	eb 2f                	jmp    8010126c <balloc+0x7c>
8010123d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101240:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101242:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
80101245:	bb 01 00 00 00       	mov    $0x1,%ebx
8010124a:	83 e1 07             	and    $0x7,%ecx
8010124d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010124f:	89 c1                	mov    %eax,%ecx
80101251:	c1 f9 03             	sar    $0x3,%ecx
80101254:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101259:	85 df                	test   %ebx,%edi
8010125b:	89 fa                	mov    %edi,%edx
8010125d:	74 41                	je     801012a0 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010125f:	83 c0 01             	add    $0x1,%eax
80101262:	83 c6 01             	add    $0x1,%esi
80101265:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010126a:	74 05                	je     80101271 <balloc+0x81>
8010126c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010126f:	77 cf                	ja     80101240 <balloc+0x50>
    brelse(bp);
80101271:	83 ec 0c             	sub    $0xc,%esp
80101274:	ff 75 e4             	pushl  -0x1c(%ebp)
80101277:	e8 64 ef ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010127c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101283:	83 c4 10             	add    $0x10,%esp
80101286:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101289:	39 05 a0 13 11 80    	cmp    %eax,0x801113a0
8010128f:	77 80                	ja     80101211 <balloc+0x21>
  panic("balloc: out of blocks");
80101291:	83 ec 0c             	sub    $0xc,%esp
80101294:	68 a0 74 10 80       	push   $0x801074a0
80101299:	e8 f2 f0 ff ff       	call   80100390 <panic>
8010129e:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
801012a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801012a3:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
801012a6:	09 da                	or     %ebx,%edx
801012a8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801012ac:	57                   	push   %edi
801012ad:	e8 7e 1b 00 00       	call   80102e30 <log_write>
        brelse(bp);
801012b2:	89 3c 24             	mov    %edi,(%esp)
801012b5:	e8 26 ef ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
801012ba:	58                   	pop    %eax
801012bb:	5a                   	pop    %edx
801012bc:	56                   	push   %esi
801012bd:	ff 75 d8             	pushl  -0x28(%ebp)
801012c0:	e8 0b ee ff ff       	call   801000d0 <bread>
801012c5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801012c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801012ca:	83 c4 0c             	add    $0xc,%esp
801012cd:	68 00 02 00 00       	push   $0x200
801012d2:	6a 00                	push   $0x0
801012d4:	50                   	push   %eax
801012d5:	e8 c6 33 00 00       	call   801046a0 <memset>
  log_write(bp);
801012da:	89 1c 24             	mov    %ebx,(%esp)
801012dd:	e8 4e 1b 00 00       	call   80102e30 <log_write>
  brelse(bp);
801012e2:	89 1c 24             	mov    %ebx,(%esp)
801012e5:	e8 f6 ee ff ff       	call   801001e0 <brelse>
}
801012ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ed:	89 f0                	mov    %esi,%eax
801012ef:	5b                   	pop    %ebx
801012f0:	5e                   	pop    %esi
801012f1:	5f                   	pop    %edi
801012f2:	5d                   	pop    %ebp
801012f3:	c3                   	ret    
801012f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801012fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101300 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101300:	55                   	push   %ebp
80101301:	89 e5                	mov    %esp,%ebp
80101303:	57                   	push   %edi
80101304:	56                   	push   %esi
80101305:	53                   	push   %ebx
80101306:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101308:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010130a:	bb f4 13 11 80       	mov    $0x801113f4,%ebx
{
8010130f:	83 ec 28             	sub    $0x28,%esp
80101312:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
80101315:	68 c0 13 11 80       	push   $0x801113c0
8010131a:	e8 71 32 00 00       	call   80104590 <acquire>
8010131f:	83 c4 10             	add    $0x10,%esp
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101322:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101325:	eb 17                	jmp    8010133e <iget+0x3e>
80101327:	89 f6                	mov    %esi,%esi
80101329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101330:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101336:	81 fb 14 30 11 80    	cmp    $0x80113014,%ebx
8010133c:	73 22                	jae    80101360 <iget+0x60>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010133e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101341:	85 c9                	test   %ecx,%ecx
80101343:	7e 04                	jle    80101349 <iget+0x49>
80101345:	39 3b                	cmp    %edi,(%ebx)
80101347:	74 4f                	je     80101398 <iget+0x98>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101349:	85 f6                	test   %esi,%esi
8010134b:	75 e3                	jne    80101330 <iget+0x30>
8010134d:	85 c9                	test   %ecx,%ecx
8010134f:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101352:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101358:	81 fb 14 30 11 80    	cmp    $0x80113014,%ebx
8010135e:	72 de                	jb     8010133e <iget+0x3e>
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101360:	85 f6                	test   %esi,%esi
80101362:	74 5b                	je     801013bf <iget+0xbf>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
80101364:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
80101367:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101369:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010136c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101373:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010137a:	68 c0 13 11 80       	push   $0x801113c0
8010137f:	e8 cc 32 00 00       	call   80104650 <release>

  return ip;
80101384:	83 c4 10             	add    $0x10,%esp
}
80101387:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010138a:	89 f0                	mov    %esi,%eax
8010138c:	5b                   	pop    %ebx
8010138d:	5e                   	pop    %esi
8010138e:	5f                   	pop    %edi
8010138f:	5d                   	pop    %ebp
80101390:	c3                   	ret    
80101391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101398:	39 53 04             	cmp    %edx,0x4(%ebx)
8010139b:	75 ac                	jne    80101349 <iget+0x49>
      release(&icache.lock);
8010139d:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
801013a0:	83 c1 01             	add    $0x1,%ecx
      return ip;
801013a3:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
801013a5:	68 c0 13 11 80       	push   $0x801113c0
      ip->ref++;
801013aa:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
801013ad:	e8 9e 32 00 00       	call   80104650 <release>
      return ip;
801013b2:	83 c4 10             	add    $0x10,%esp
}
801013b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013b8:	89 f0                	mov    %esi,%eax
801013ba:	5b                   	pop    %ebx
801013bb:	5e                   	pop    %esi
801013bc:	5f                   	pop    %edi
801013bd:	5d                   	pop    %ebp
801013be:	c3                   	ret    
    panic("iget: no inodes");
801013bf:	83 ec 0c             	sub    $0xc,%esp
801013c2:	68 b6 74 10 80       	push   $0x801074b6
801013c7:	e8 c4 ef ff ff       	call   80100390 <panic>
801013cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801013d0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	57                   	push   %edi
801013d4:	56                   	push   %esi
801013d5:	53                   	push   %ebx
801013d6:	89 c6                	mov    %eax,%esi
801013d8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801013db:	83 fa 0b             	cmp    $0xb,%edx
801013de:	77 18                	ja     801013f8 <bmap+0x28>
801013e0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
    if((addr = ip->addrs[bn]) == 0)
801013e3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801013e6:	85 db                	test   %ebx,%ebx
801013e8:	74 76                	je     80101460 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801013ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013ed:	89 d8                	mov    %ebx,%eax
801013ef:	5b                   	pop    %ebx
801013f0:	5e                   	pop    %esi
801013f1:	5f                   	pop    %edi
801013f2:	5d                   	pop    %ebp
801013f3:	c3                   	ret    
801013f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;
801013f8:	8d 5a f4             	lea    -0xc(%edx),%ebx
  if(bn < NINDIRECT){
801013fb:	83 fb 7f             	cmp    $0x7f,%ebx
801013fe:	0f 87 90 00 00 00    	ja     80101494 <bmap+0xc4>
    if((addr = ip->addrs[NDIRECT]) == 0)
80101404:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
8010140a:	8b 00                	mov    (%eax),%eax
8010140c:	85 d2                	test   %edx,%edx
8010140e:	74 70                	je     80101480 <bmap+0xb0>
    bp = bread(ip->dev, addr);
80101410:	83 ec 08             	sub    $0x8,%esp
80101413:	52                   	push   %edx
80101414:	50                   	push   %eax
80101415:	e8 b6 ec ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
8010141a:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010141e:	83 c4 10             	add    $0x10,%esp
    bp = bread(ip->dev, addr);
80101421:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
80101423:	8b 1a                	mov    (%edx),%ebx
80101425:	85 db                	test   %ebx,%ebx
80101427:	75 1d                	jne    80101446 <bmap+0x76>
      a[bn] = addr = balloc(ip->dev);
80101429:	8b 06                	mov    (%esi),%eax
8010142b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010142e:	e8 bd fd ff ff       	call   801011f0 <balloc>
80101433:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101436:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
80101439:	89 c3                	mov    %eax,%ebx
8010143b:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010143d:	57                   	push   %edi
8010143e:	e8 ed 19 00 00       	call   80102e30 <log_write>
80101443:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101446:	83 ec 0c             	sub    $0xc,%esp
80101449:	57                   	push   %edi
8010144a:	e8 91 ed ff ff       	call   801001e0 <brelse>
8010144f:	83 c4 10             	add    $0x10,%esp
}
80101452:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101455:	89 d8                	mov    %ebx,%eax
80101457:	5b                   	pop    %ebx
80101458:	5e                   	pop    %esi
80101459:	5f                   	pop    %edi
8010145a:	5d                   	pop    %ebp
8010145b:	c3                   	ret    
8010145c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ip->addrs[bn] = addr = balloc(ip->dev);
80101460:	8b 00                	mov    (%eax),%eax
80101462:	e8 89 fd ff ff       	call   801011f0 <balloc>
80101467:	89 47 5c             	mov    %eax,0x5c(%edi)
}
8010146a:	8d 65 f4             	lea    -0xc(%ebp),%esp
      ip->addrs[bn] = addr = balloc(ip->dev);
8010146d:	89 c3                	mov    %eax,%ebx
}
8010146f:	89 d8                	mov    %ebx,%eax
80101471:	5b                   	pop    %ebx
80101472:	5e                   	pop    %esi
80101473:	5f                   	pop    %edi
80101474:	5d                   	pop    %ebp
80101475:	c3                   	ret    
80101476:	8d 76 00             	lea    0x0(%esi),%esi
80101479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101480:	e8 6b fd ff ff       	call   801011f0 <balloc>
80101485:	89 c2                	mov    %eax,%edx
80101487:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010148d:	8b 06                	mov    (%esi),%eax
8010148f:	e9 7c ff ff ff       	jmp    80101410 <bmap+0x40>
  panic("bmap: out of range");
80101494:	83 ec 0c             	sub    $0xc,%esp
80101497:	68 c6 74 10 80       	push   $0x801074c6
8010149c:	e8 ef ee ff ff       	call   80100390 <panic>
801014a1:	eb 0d                	jmp    801014b0 <readsb>
801014a3:	90                   	nop
801014a4:	90                   	nop
801014a5:	90                   	nop
801014a6:	90                   	nop
801014a7:	90                   	nop
801014a8:	90                   	nop
801014a9:	90                   	nop
801014aa:	90                   	nop
801014ab:	90                   	nop
801014ac:	90                   	nop
801014ad:	90                   	nop
801014ae:	90                   	nop
801014af:	90                   	nop

801014b0 <readsb>:
{
801014b0:	55                   	push   %ebp
801014b1:	89 e5                	mov    %esp,%ebp
801014b3:	56                   	push   %esi
801014b4:	53                   	push   %ebx
801014b5:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
801014b8:	83 ec 08             	sub    $0x8,%esp
801014bb:	6a 01                	push   $0x1
801014bd:	ff 75 08             	pushl  0x8(%ebp)
801014c0:	e8 0b ec ff ff       	call   801000d0 <bread>
801014c5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801014c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801014ca:	83 c4 0c             	add    $0xc,%esp
801014cd:	6a 1c                	push   $0x1c
801014cf:	50                   	push   %eax
801014d0:	56                   	push   %esi
801014d1:	e8 7a 32 00 00       	call   80104750 <memmove>
  brelse(bp);
801014d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801014d9:	83 c4 10             	add    $0x10,%esp
}
801014dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801014df:	5b                   	pop    %ebx
801014e0:	5e                   	pop    %esi
801014e1:	5d                   	pop    %ebp
  brelse(bp);
801014e2:	e9 f9 ec ff ff       	jmp    801001e0 <brelse>
801014e7:	89 f6                	mov    %esi,%esi
801014e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801014f0 <iinit>:
{
801014f0:	55                   	push   %ebp
801014f1:	89 e5                	mov    %esp,%ebp
801014f3:	53                   	push   %ebx
801014f4:	bb 00 14 11 80       	mov    $0x80111400,%ebx
801014f9:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
801014fc:	68 d9 74 10 80       	push   $0x801074d9
80101501:	68 c0 13 11 80       	push   $0x801113c0
80101506:	e8 45 2f 00 00       	call   80104450 <initlock>
8010150b:	83 c4 10             	add    $0x10,%esp
8010150e:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
80101510:	83 ec 08             	sub    $0x8,%esp
80101513:	68 e0 74 10 80       	push   $0x801074e0
80101518:	53                   	push   %ebx
80101519:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010151f:	e8 fc 2d 00 00       	call   80104320 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
80101524:	83 c4 10             	add    $0x10,%esp
80101527:	81 fb 20 30 11 80    	cmp    $0x80113020,%ebx
8010152d:	75 e1                	jne    80101510 <iinit+0x20>
  readsb(dev, &sb);
8010152f:	83 ec 08             	sub    $0x8,%esp
80101532:	68 a0 13 11 80       	push   $0x801113a0
80101537:	ff 75 08             	pushl  0x8(%ebp)
8010153a:	e8 71 ff ff ff       	call   801014b0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010153f:	ff 35 b8 13 11 80    	pushl  0x801113b8
80101545:	ff 35 b4 13 11 80    	pushl  0x801113b4
8010154b:	ff 35 b0 13 11 80    	pushl  0x801113b0
80101551:	ff 35 ac 13 11 80    	pushl  0x801113ac
80101557:	ff 35 a8 13 11 80    	pushl  0x801113a8
8010155d:	ff 35 a4 13 11 80    	pushl  0x801113a4
80101563:	ff 35 a0 13 11 80    	pushl  0x801113a0
80101569:	68 44 75 10 80       	push   $0x80107544
8010156e:	e8 ed f0 ff ff       	call   80100660 <cprintf>
}
80101573:	83 c4 30             	add    $0x30,%esp
80101576:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101579:	c9                   	leave  
8010157a:	c3                   	ret    
8010157b:	90                   	nop
8010157c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101580 <ialloc>:
{
80101580:	55                   	push   %ebp
80101581:	89 e5                	mov    %esp,%ebp
80101583:	57                   	push   %edi
80101584:	56                   	push   %esi
80101585:	53                   	push   %ebx
80101586:	83 ec 1c             	sub    $0x1c,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101589:	83 3d a8 13 11 80 01 	cmpl   $0x1,0x801113a8
{
80101590:	8b 45 0c             	mov    0xc(%ebp),%eax
80101593:	8b 75 08             	mov    0x8(%ebp),%esi
80101596:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101599:	0f 86 91 00 00 00    	jbe    80101630 <ialloc+0xb0>
8010159f:	bb 01 00 00 00       	mov    $0x1,%ebx
801015a4:	eb 21                	jmp    801015c7 <ialloc+0x47>
801015a6:	8d 76 00             	lea    0x0(%esi),%esi
801015a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    brelse(bp);
801015b0:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
801015b3:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
801015b6:	57                   	push   %edi
801015b7:	e8 24 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
801015bc:	83 c4 10             	add    $0x10,%esp
801015bf:	39 1d a8 13 11 80    	cmp    %ebx,0x801113a8
801015c5:	76 69                	jbe    80101630 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
801015c7:	89 d8                	mov    %ebx,%eax
801015c9:	83 ec 08             	sub    $0x8,%esp
801015cc:	c1 e8 03             	shr    $0x3,%eax
801015cf:	03 05 b4 13 11 80    	add    0x801113b4,%eax
801015d5:	50                   	push   %eax
801015d6:	56                   	push   %esi
801015d7:	e8 f4 ea ff ff       	call   801000d0 <bread>
801015dc:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
801015de:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
801015e0:	83 c4 10             	add    $0x10,%esp
    dip = (struct dinode*)bp->data + inum%IPB;
801015e3:	83 e0 07             	and    $0x7,%eax
801015e6:	c1 e0 06             	shl    $0x6,%eax
801015e9:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
801015ed:	66 83 39 00          	cmpw   $0x0,(%ecx)
801015f1:	75 bd                	jne    801015b0 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
801015f3:	83 ec 04             	sub    $0x4,%esp
801015f6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015f9:	6a 40                	push   $0x40
801015fb:	6a 00                	push   $0x0
801015fd:	51                   	push   %ecx
801015fe:	e8 9d 30 00 00       	call   801046a0 <memset>
      dip->type = type;
80101603:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101607:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010160a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010160d:	89 3c 24             	mov    %edi,(%esp)
80101610:	e8 1b 18 00 00       	call   80102e30 <log_write>
      brelse(bp);
80101615:	89 3c 24             	mov    %edi,(%esp)
80101618:	e8 c3 eb ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010161d:	83 c4 10             	add    $0x10,%esp
}
80101620:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
80101623:	89 da                	mov    %ebx,%edx
80101625:	89 f0                	mov    %esi,%eax
}
80101627:	5b                   	pop    %ebx
80101628:	5e                   	pop    %esi
80101629:	5f                   	pop    %edi
8010162a:	5d                   	pop    %ebp
      return iget(dev, inum);
8010162b:	e9 d0 fc ff ff       	jmp    80101300 <iget>
  panic("ialloc: no inodes");
80101630:	83 ec 0c             	sub    $0xc,%esp
80101633:	68 e6 74 10 80       	push   $0x801074e6
80101638:	e8 53 ed ff ff       	call   80100390 <panic>
8010163d:	8d 76 00             	lea    0x0(%esi),%esi

80101640 <iupdate>:
{
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	56                   	push   %esi
80101644:	53                   	push   %ebx
80101645:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101648:	83 ec 08             	sub    $0x8,%esp
8010164b:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010164e:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101651:	c1 e8 03             	shr    $0x3,%eax
80101654:	03 05 b4 13 11 80    	add    0x801113b4,%eax
8010165a:	50                   	push   %eax
8010165b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010165e:	e8 6d ea ff ff       	call   801000d0 <bread>
80101663:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101665:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
80101668:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010166c:	83 c4 0c             	add    $0xc,%esp
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010166f:	83 e0 07             	and    $0x7,%eax
80101672:	c1 e0 06             	shl    $0x6,%eax
80101675:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101679:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010167c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101680:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101683:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101687:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010168b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010168f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101693:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101697:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010169a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010169d:	6a 34                	push   $0x34
8010169f:	53                   	push   %ebx
801016a0:	50                   	push   %eax
801016a1:	e8 aa 30 00 00       	call   80104750 <memmove>
  log_write(bp);
801016a6:	89 34 24             	mov    %esi,(%esp)
801016a9:	e8 82 17 00 00       	call   80102e30 <log_write>
  brelse(bp);
801016ae:	89 75 08             	mov    %esi,0x8(%ebp)
801016b1:	83 c4 10             	add    $0x10,%esp
}
801016b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016b7:	5b                   	pop    %ebx
801016b8:	5e                   	pop    %esi
801016b9:	5d                   	pop    %ebp
  brelse(bp);
801016ba:	e9 21 eb ff ff       	jmp    801001e0 <brelse>
801016bf:	90                   	nop

801016c0 <idup>:
{
801016c0:	55                   	push   %ebp
801016c1:	89 e5                	mov    %esp,%ebp
801016c3:	53                   	push   %ebx
801016c4:	83 ec 10             	sub    $0x10,%esp
801016c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
801016ca:	68 c0 13 11 80       	push   $0x801113c0
801016cf:	e8 bc 2e 00 00       	call   80104590 <acquire>
  ip->ref++;
801016d4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016d8:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
801016df:	e8 6c 2f 00 00       	call   80104650 <release>
}
801016e4:	89 d8                	mov    %ebx,%eax
801016e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801016e9:	c9                   	leave  
801016ea:	c3                   	ret    
801016eb:	90                   	nop
801016ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801016f0 <ilock>:
{
801016f0:	55                   	push   %ebp
801016f1:	89 e5                	mov    %esp,%ebp
801016f3:	56                   	push   %esi
801016f4:	53                   	push   %ebx
801016f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
801016f8:	85 db                	test   %ebx,%ebx
801016fa:	0f 84 b7 00 00 00    	je     801017b7 <ilock+0xc7>
80101700:	8b 53 08             	mov    0x8(%ebx),%edx
80101703:	85 d2                	test   %edx,%edx
80101705:	0f 8e ac 00 00 00    	jle    801017b7 <ilock+0xc7>
  acquiresleep(&ip->lock);
8010170b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010170e:	83 ec 0c             	sub    $0xc,%esp
80101711:	50                   	push   %eax
80101712:	e8 49 2c 00 00       	call   80104360 <acquiresleep>
  if(ip->valid == 0){
80101717:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010171a:	83 c4 10             	add    $0x10,%esp
8010171d:	85 c0                	test   %eax,%eax
8010171f:	74 0f                	je     80101730 <ilock+0x40>
}
80101721:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101724:	5b                   	pop    %ebx
80101725:	5e                   	pop    %esi
80101726:	5d                   	pop    %ebp
80101727:	c3                   	ret    
80101728:	90                   	nop
80101729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101730:	8b 43 04             	mov    0x4(%ebx),%eax
80101733:	83 ec 08             	sub    $0x8,%esp
80101736:	c1 e8 03             	shr    $0x3,%eax
80101739:	03 05 b4 13 11 80    	add    0x801113b4,%eax
8010173f:	50                   	push   %eax
80101740:	ff 33                	pushl  (%ebx)
80101742:	e8 89 e9 ff ff       	call   801000d0 <bread>
80101747:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101749:	8b 43 04             	mov    0x4(%ebx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010174c:	83 c4 0c             	add    $0xc,%esp
    dip = (struct dinode*)bp->data + ip->inum%IPB;
8010174f:	83 e0 07             	and    $0x7,%eax
80101752:	c1 e0 06             	shl    $0x6,%eax
80101755:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
80101759:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010175c:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
8010175f:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101763:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101767:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
8010176b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010176f:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101773:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101777:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010177b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010177e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101781:	6a 34                	push   $0x34
80101783:	50                   	push   %eax
80101784:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101787:	50                   	push   %eax
80101788:	e8 c3 2f 00 00       	call   80104750 <memmove>
    brelse(bp);
8010178d:	89 34 24             	mov    %esi,(%esp)
80101790:	e8 4b ea ff ff       	call   801001e0 <brelse>
    if(ip->type == 0)
80101795:	83 c4 10             	add    $0x10,%esp
80101798:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010179d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
801017a4:	0f 85 77 ff ff ff    	jne    80101721 <ilock+0x31>
      panic("ilock: no type");
801017aa:	83 ec 0c             	sub    $0xc,%esp
801017ad:	68 fe 74 10 80       	push   $0x801074fe
801017b2:	e8 d9 eb ff ff       	call   80100390 <panic>
    panic("ilock");
801017b7:	83 ec 0c             	sub    $0xc,%esp
801017ba:	68 f8 74 10 80       	push   $0x801074f8
801017bf:	e8 cc eb ff ff       	call   80100390 <panic>
801017c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801017ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801017d0 <iunlock>:
{
801017d0:	55                   	push   %ebp
801017d1:	89 e5                	mov    %esp,%ebp
801017d3:	56                   	push   %esi
801017d4:	53                   	push   %ebx
801017d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
801017d8:	85 db                	test   %ebx,%ebx
801017da:	74 28                	je     80101804 <iunlock+0x34>
801017dc:	8d 73 0c             	lea    0xc(%ebx),%esi
801017df:	83 ec 0c             	sub    $0xc,%esp
801017e2:	56                   	push   %esi
801017e3:	e8 18 2c 00 00       	call   80104400 <holdingsleep>
801017e8:	83 c4 10             	add    $0x10,%esp
801017eb:	85 c0                	test   %eax,%eax
801017ed:	74 15                	je     80101804 <iunlock+0x34>
801017ef:	8b 43 08             	mov    0x8(%ebx),%eax
801017f2:	85 c0                	test   %eax,%eax
801017f4:	7e 0e                	jle    80101804 <iunlock+0x34>
  releasesleep(&ip->lock);
801017f6:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017f9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017fc:	5b                   	pop    %ebx
801017fd:	5e                   	pop    %esi
801017fe:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
801017ff:	e9 bc 2b 00 00       	jmp    801043c0 <releasesleep>
    panic("iunlock");
80101804:	83 ec 0c             	sub    $0xc,%esp
80101807:	68 0d 75 10 80       	push   $0x8010750d
8010180c:	e8 7f eb ff ff       	call   80100390 <panic>
80101811:	eb 0d                	jmp    80101820 <iput>
80101813:	90                   	nop
80101814:	90                   	nop
80101815:	90                   	nop
80101816:	90                   	nop
80101817:	90                   	nop
80101818:	90                   	nop
80101819:	90                   	nop
8010181a:	90                   	nop
8010181b:	90                   	nop
8010181c:	90                   	nop
8010181d:	90                   	nop
8010181e:	90                   	nop
8010181f:	90                   	nop

80101820 <iput>:
{
80101820:	55                   	push   %ebp
80101821:	89 e5                	mov    %esp,%ebp
80101823:	57                   	push   %edi
80101824:	56                   	push   %esi
80101825:	53                   	push   %ebx
80101826:	83 ec 28             	sub    $0x28,%esp
80101829:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
8010182c:	8d 7b 0c             	lea    0xc(%ebx),%edi
8010182f:	57                   	push   %edi
80101830:	e8 2b 2b 00 00       	call   80104360 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
80101835:	8b 53 4c             	mov    0x4c(%ebx),%edx
80101838:	83 c4 10             	add    $0x10,%esp
8010183b:	85 d2                	test   %edx,%edx
8010183d:	74 07                	je     80101846 <iput+0x26>
8010183f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101844:	74 32                	je     80101878 <iput+0x58>
  releasesleep(&ip->lock);
80101846:	83 ec 0c             	sub    $0xc,%esp
80101849:	57                   	push   %edi
8010184a:	e8 71 2b 00 00       	call   801043c0 <releasesleep>
  acquire(&icache.lock);
8010184f:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101856:	e8 35 2d 00 00       	call   80104590 <acquire>
  ip->ref--;
8010185b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010185f:	83 c4 10             	add    $0x10,%esp
80101862:	c7 45 08 c0 13 11 80 	movl   $0x801113c0,0x8(%ebp)
}
80101869:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010186c:	5b                   	pop    %ebx
8010186d:	5e                   	pop    %esi
8010186e:	5f                   	pop    %edi
8010186f:	5d                   	pop    %ebp
  release(&icache.lock);
80101870:	e9 db 2d 00 00       	jmp    80104650 <release>
80101875:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101878:	83 ec 0c             	sub    $0xc,%esp
8010187b:	68 c0 13 11 80       	push   $0x801113c0
80101880:	e8 0b 2d 00 00       	call   80104590 <acquire>
    int r = ip->ref;
80101885:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101888:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
8010188f:	e8 bc 2d 00 00       	call   80104650 <release>
    if(r == 1){
80101894:	83 c4 10             	add    $0x10,%esp
80101897:	83 fe 01             	cmp    $0x1,%esi
8010189a:	75 aa                	jne    80101846 <iput+0x26>
8010189c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
801018a2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801018a5:	8d 73 5c             	lea    0x5c(%ebx),%esi
801018a8:	89 cf                	mov    %ecx,%edi
801018aa:	eb 0b                	jmp    801018b7 <iput+0x97>
801018ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801018b0:	83 c6 04             	add    $0x4,%esi
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
801018b3:	39 fe                	cmp    %edi,%esi
801018b5:	74 19                	je     801018d0 <iput+0xb0>
    if(ip->addrs[i]){
801018b7:	8b 16                	mov    (%esi),%edx
801018b9:	85 d2                	test   %edx,%edx
801018bb:	74 f3                	je     801018b0 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
801018bd:	8b 03                	mov    (%ebx),%eax
801018bf:	e8 bc f8 ff ff       	call   80101180 <bfree>
      ip->addrs[i] = 0;
801018c4:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801018ca:	eb e4                	jmp    801018b0 <iput+0x90>
801018cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
801018d0:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
801018d6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801018d9:	85 c0                	test   %eax,%eax
801018db:	75 33                	jne    80101910 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
801018dd:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
801018e0:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
801018e7:	53                   	push   %ebx
801018e8:	e8 53 fd ff ff       	call   80101640 <iupdate>
      ip->type = 0;
801018ed:	31 c0                	xor    %eax,%eax
801018ef:	66 89 43 50          	mov    %ax,0x50(%ebx)
      iupdate(ip);
801018f3:	89 1c 24             	mov    %ebx,(%esp)
801018f6:	e8 45 fd ff ff       	call   80101640 <iupdate>
      ip->valid = 0;
801018fb:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101902:	83 c4 10             	add    $0x10,%esp
80101905:	e9 3c ff ff ff       	jmp    80101846 <iput+0x26>
8010190a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101910:	83 ec 08             	sub    $0x8,%esp
80101913:	50                   	push   %eax
80101914:	ff 33                	pushl  (%ebx)
80101916:	e8 b5 e7 ff ff       	call   801000d0 <bread>
8010191b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101921:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101924:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101927:	8d 70 5c             	lea    0x5c(%eax),%esi
8010192a:	83 c4 10             	add    $0x10,%esp
8010192d:	89 cf                	mov    %ecx,%edi
8010192f:	eb 0e                	jmp    8010193f <iput+0x11f>
80101931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101938:	83 c6 04             	add    $0x4,%esi
    for(j = 0; j < NINDIRECT; j++){
8010193b:	39 fe                	cmp    %edi,%esi
8010193d:	74 0f                	je     8010194e <iput+0x12e>
      if(a[j])
8010193f:	8b 16                	mov    (%esi),%edx
80101941:	85 d2                	test   %edx,%edx
80101943:	74 f3                	je     80101938 <iput+0x118>
        bfree(ip->dev, a[j]);
80101945:	8b 03                	mov    (%ebx),%eax
80101947:	e8 34 f8 ff ff       	call   80101180 <bfree>
8010194c:	eb ea                	jmp    80101938 <iput+0x118>
    brelse(bp);
8010194e:	83 ec 0c             	sub    $0xc,%esp
80101951:	ff 75 e4             	pushl  -0x1c(%ebp)
80101954:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101957:	e8 84 e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
8010195c:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101962:	8b 03                	mov    (%ebx),%eax
80101964:	e8 17 f8 ff ff       	call   80101180 <bfree>
    ip->addrs[NDIRECT] = 0;
80101969:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101970:	00 00 00 
80101973:	83 c4 10             	add    $0x10,%esp
80101976:	e9 62 ff ff ff       	jmp    801018dd <iput+0xbd>
8010197b:	90                   	nop
8010197c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101980 <iunlockput>:
{
80101980:	55                   	push   %ebp
80101981:	89 e5                	mov    %esp,%ebp
80101983:	53                   	push   %ebx
80101984:	83 ec 10             	sub    $0x10,%esp
80101987:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010198a:	53                   	push   %ebx
8010198b:	e8 40 fe ff ff       	call   801017d0 <iunlock>
  iput(ip);
80101990:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101993:	83 c4 10             	add    $0x10,%esp
}
80101996:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101999:	c9                   	leave  
  iput(ip);
8010199a:	e9 81 fe ff ff       	jmp    80101820 <iput>
8010199f:	90                   	nop

801019a0 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
801019a0:	55                   	push   %ebp
801019a1:	89 e5                	mov    %esp,%ebp
801019a3:	8b 55 08             	mov    0x8(%ebp),%edx
801019a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
801019a9:	8b 0a                	mov    (%edx),%ecx
801019ab:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
801019ae:	8b 4a 04             	mov    0x4(%edx),%ecx
801019b1:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
801019b4:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
801019b8:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
801019bb:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
801019bf:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
801019c3:	8b 52 58             	mov    0x58(%edx),%edx
801019c6:	89 50 10             	mov    %edx,0x10(%eax)
}
801019c9:	5d                   	pop    %ebp
801019ca:	c3                   	ret    
801019cb:	90                   	nop
801019cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801019d0 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
801019d0:	55                   	push   %ebp
801019d1:	89 e5                	mov    %esp,%ebp
801019d3:	57                   	push   %edi
801019d4:	56                   	push   %esi
801019d5:	53                   	push   %ebx
801019d6:	83 ec 1c             	sub    $0x1c,%esp
801019d9:	8b 45 08             	mov    0x8(%ebp),%eax
801019dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801019df:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
801019e2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
801019e7:	89 75 e0             	mov    %esi,-0x20(%ebp)
801019ea:	89 45 d8             	mov    %eax,-0x28(%ebp)
801019ed:	8b 75 10             	mov    0x10(%ebp),%esi
801019f0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
801019f3:	0f 84 a7 00 00 00    	je     80101aa0 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
801019f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
801019fc:	8b 40 58             	mov    0x58(%eax),%eax
801019ff:	39 c6                	cmp    %eax,%esi
80101a01:	0f 87 ba 00 00 00    	ja     80101ac1 <readi+0xf1>
80101a07:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101a0a:	89 f9                	mov    %edi,%ecx
80101a0c:	01 f1                	add    %esi,%ecx
80101a0e:	0f 82 ad 00 00 00    	jb     80101ac1 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101a14:	89 c2                	mov    %eax,%edx
80101a16:	29 f2                	sub    %esi,%edx
80101a18:	39 c8                	cmp    %ecx,%eax
80101a1a:	0f 43 d7             	cmovae %edi,%edx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a1d:	31 ff                	xor    %edi,%edi
80101a1f:	85 d2                	test   %edx,%edx
    n = ip->size - off;
80101a21:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a24:	74 6c                	je     80101a92 <readi+0xc2>
80101a26:	8d 76 00             	lea    0x0(%esi),%esi
80101a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a30:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101a33:	89 f2                	mov    %esi,%edx
80101a35:	c1 ea 09             	shr    $0x9,%edx
80101a38:	89 d8                	mov    %ebx,%eax
80101a3a:	e8 91 f9 ff ff       	call   801013d0 <bmap>
80101a3f:	83 ec 08             	sub    $0x8,%esp
80101a42:	50                   	push   %eax
80101a43:	ff 33                	pushl  (%ebx)
80101a45:	e8 86 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101a4a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a4d:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a4f:	89 f0                	mov    %esi,%eax
80101a51:	25 ff 01 00 00       	and    $0x1ff,%eax
80101a56:	b9 00 02 00 00       	mov    $0x200,%ecx
80101a5b:	83 c4 0c             	add    $0xc,%esp
80101a5e:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
80101a60:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a64:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101a67:	29 fb                	sub    %edi,%ebx
80101a69:	39 d9                	cmp    %ebx,%ecx
80101a6b:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101a6e:	53                   	push   %ebx
80101a6f:	50                   	push   %eax
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a70:	01 df                	add    %ebx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101a72:	ff 75 e0             	pushl  -0x20(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a75:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101a77:	e8 d4 2c 00 00       	call   80104750 <memmove>
    brelse(bp);
80101a7c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a7f:	89 14 24             	mov    %edx,(%esp)
80101a82:	e8 59 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a87:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a8a:	83 c4 10             	add    $0x10,%esp
80101a8d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a90:	77 9e                	ja     80101a30 <readi+0x60>
  }
  return n;
80101a92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a95:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a98:	5b                   	pop    %ebx
80101a99:	5e                   	pop    %esi
80101a9a:	5f                   	pop    %edi
80101a9b:	5d                   	pop    %ebp
80101a9c:	c3                   	ret    
80101a9d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101aa0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101aa4:	66 83 f8 09          	cmp    $0x9,%ax
80101aa8:	77 17                	ja     80101ac1 <readi+0xf1>
80101aaa:	8b 04 c5 40 13 11 80 	mov    -0x7feeecc0(,%eax,8),%eax
80101ab1:	85 c0                	test   %eax,%eax
80101ab3:	74 0c                	je     80101ac1 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101ab5:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101ab8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101abb:	5b                   	pop    %ebx
80101abc:	5e                   	pop    %esi
80101abd:	5f                   	pop    %edi
80101abe:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101abf:	ff e0                	jmp    *%eax
      return -1;
80101ac1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ac6:	eb cd                	jmp    80101a95 <readi+0xc5>
80101ac8:	90                   	nop
80101ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101ad0 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101ad0:	55                   	push   %ebp
80101ad1:	89 e5                	mov    %esp,%ebp
80101ad3:	57                   	push   %edi
80101ad4:	56                   	push   %esi
80101ad5:	53                   	push   %ebx
80101ad6:	83 ec 1c             	sub    $0x1c,%esp
80101ad9:	8b 45 08             	mov    0x8(%ebp),%eax
80101adc:	8b 75 0c             	mov    0xc(%ebp),%esi
80101adf:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ae2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101ae7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101aea:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101aed:	8b 75 10             	mov    0x10(%ebp),%esi
80101af0:	89 7d e0             	mov    %edi,-0x20(%ebp)
  if(ip->type == T_DEV){
80101af3:	0f 84 b7 00 00 00    	je     80101bb0 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101af9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101afc:	39 70 58             	cmp    %esi,0x58(%eax)
80101aff:	0f 82 eb 00 00 00    	jb     80101bf0 <writei+0x120>
80101b05:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101b08:	31 d2                	xor    %edx,%edx
80101b0a:	89 f8                	mov    %edi,%eax
80101b0c:	01 f0                	add    %esi,%eax
80101b0e:	0f 92 c2             	setb   %dl
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101b11:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101b16:	0f 87 d4 00 00 00    	ja     80101bf0 <writei+0x120>
80101b1c:	85 d2                	test   %edx,%edx
80101b1e:	0f 85 cc 00 00 00    	jne    80101bf0 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b24:	85 ff                	test   %edi,%edi
80101b26:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101b2d:	74 72                	je     80101ba1 <writei+0xd1>
80101b2f:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b30:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101b33:	89 f2                	mov    %esi,%edx
80101b35:	c1 ea 09             	shr    $0x9,%edx
80101b38:	89 f8                	mov    %edi,%eax
80101b3a:	e8 91 f8 ff ff       	call   801013d0 <bmap>
80101b3f:	83 ec 08             	sub    $0x8,%esp
80101b42:	50                   	push   %eax
80101b43:	ff 37                	pushl  (%edi)
80101b45:	e8 86 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101b4a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101b4d:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b50:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101b52:	89 f0                	mov    %esi,%eax
80101b54:	b9 00 02 00 00       	mov    $0x200,%ecx
80101b59:	83 c4 0c             	add    $0xc,%esp
80101b5c:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b61:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101b63:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101b67:	39 d9                	cmp    %ebx,%ecx
80101b69:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101b6c:	53                   	push   %ebx
80101b6d:	ff 75 dc             	pushl  -0x24(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b70:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101b72:	50                   	push   %eax
80101b73:	e8 d8 2b 00 00       	call   80104750 <memmove>
    log_write(bp);
80101b78:	89 3c 24             	mov    %edi,(%esp)
80101b7b:	e8 b0 12 00 00       	call   80102e30 <log_write>
    brelse(bp);
80101b80:	89 3c 24             	mov    %edi,(%esp)
80101b83:	e8 58 e6 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b88:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b8b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b8e:	83 c4 10             	add    $0x10,%esp
80101b91:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b94:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b97:	77 97                	ja     80101b30 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101b99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b9c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b9f:	77 37                	ja     80101bd8 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101ba1:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ba7:	5b                   	pop    %ebx
80101ba8:	5e                   	pop    %esi
80101ba9:	5f                   	pop    %edi
80101baa:	5d                   	pop    %ebp
80101bab:	c3                   	ret    
80101bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101bb0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101bb4:	66 83 f8 09          	cmp    $0x9,%ax
80101bb8:	77 36                	ja     80101bf0 <writei+0x120>
80101bba:	8b 04 c5 44 13 11 80 	mov    -0x7feeecbc(,%eax,8),%eax
80101bc1:	85 c0                	test   %eax,%eax
80101bc3:	74 2b                	je     80101bf0 <writei+0x120>
    return devsw[ip->major].write(ip, src, n);
80101bc5:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101bc8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bcb:	5b                   	pop    %ebx
80101bcc:	5e                   	pop    %esi
80101bcd:	5f                   	pop    %edi
80101bce:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101bcf:	ff e0                	jmp    *%eax
80101bd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101bd8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101bdb:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101bde:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101be1:	50                   	push   %eax
80101be2:	e8 59 fa ff ff       	call   80101640 <iupdate>
80101be7:	83 c4 10             	add    $0x10,%esp
80101bea:	eb b5                	jmp    80101ba1 <writei+0xd1>
80101bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101bf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bf5:	eb ad                	jmp    80101ba4 <writei+0xd4>
80101bf7:	89 f6                	mov    %esi,%esi
80101bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c00 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101c00:	55                   	push   %ebp
80101c01:	89 e5                	mov    %esp,%ebp
80101c03:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101c06:	6a 0e                	push   $0xe
80101c08:	ff 75 0c             	pushl  0xc(%ebp)
80101c0b:	ff 75 08             	pushl  0x8(%ebp)
80101c0e:	e8 ad 2b 00 00       	call   801047c0 <strncmp>
}
80101c13:	c9                   	leave  
80101c14:	c3                   	ret    
80101c15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c20 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101c20:	55                   	push   %ebp
80101c21:	89 e5                	mov    %esp,%ebp
80101c23:	57                   	push   %edi
80101c24:	56                   	push   %esi
80101c25:	53                   	push   %ebx
80101c26:	83 ec 1c             	sub    $0x1c,%esp
80101c29:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101c2c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101c31:	0f 85 85 00 00 00    	jne    80101cbc <dirlookup+0x9c>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101c37:	8b 53 58             	mov    0x58(%ebx),%edx
80101c3a:	31 ff                	xor    %edi,%edi
80101c3c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c3f:	85 d2                	test   %edx,%edx
80101c41:	74 3e                	je     80101c81 <dirlookup+0x61>
80101c43:	90                   	nop
80101c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c48:	6a 10                	push   $0x10
80101c4a:	57                   	push   %edi
80101c4b:	56                   	push   %esi
80101c4c:	53                   	push   %ebx
80101c4d:	e8 7e fd ff ff       	call   801019d0 <readi>
80101c52:	83 c4 10             	add    $0x10,%esp
80101c55:	83 f8 10             	cmp    $0x10,%eax
80101c58:	75 55                	jne    80101caf <dirlookup+0x8f>
      panic("dirlookup read");
    if(de.inum == 0)
80101c5a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c5f:	74 18                	je     80101c79 <dirlookup+0x59>
  return strncmp(s, t, DIRSIZ);
80101c61:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c64:	83 ec 04             	sub    $0x4,%esp
80101c67:	6a 0e                	push   $0xe
80101c69:	50                   	push   %eax
80101c6a:	ff 75 0c             	pushl  0xc(%ebp)
80101c6d:	e8 4e 2b 00 00       	call   801047c0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101c72:	83 c4 10             	add    $0x10,%esp
80101c75:	85 c0                	test   %eax,%eax
80101c77:	74 17                	je     80101c90 <dirlookup+0x70>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101c79:	83 c7 10             	add    $0x10,%edi
80101c7c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c7f:	72 c7                	jb     80101c48 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101c81:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101c84:	31 c0                	xor    %eax,%eax
}
80101c86:	5b                   	pop    %ebx
80101c87:	5e                   	pop    %esi
80101c88:	5f                   	pop    %edi
80101c89:	5d                   	pop    %ebp
80101c8a:	c3                   	ret    
80101c8b:	90                   	nop
80101c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(poff)
80101c90:	8b 45 10             	mov    0x10(%ebp),%eax
80101c93:	85 c0                	test   %eax,%eax
80101c95:	74 05                	je     80101c9c <dirlookup+0x7c>
        *poff = off;
80101c97:	8b 45 10             	mov    0x10(%ebp),%eax
80101c9a:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c9c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101ca0:	8b 03                	mov    (%ebx),%eax
80101ca2:	e8 59 f6 ff ff       	call   80101300 <iget>
}
80101ca7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101caa:	5b                   	pop    %ebx
80101cab:	5e                   	pop    %esi
80101cac:	5f                   	pop    %edi
80101cad:	5d                   	pop    %ebp
80101cae:	c3                   	ret    
      panic("dirlookup read");
80101caf:	83 ec 0c             	sub    $0xc,%esp
80101cb2:	68 27 75 10 80       	push   $0x80107527
80101cb7:	e8 d4 e6 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101cbc:	83 ec 0c             	sub    $0xc,%esp
80101cbf:	68 15 75 10 80       	push   $0x80107515
80101cc4:	e8 c7 e6 ff ff       	call   80100390 <panic>
80101cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101cd0 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101cd0:	55                   	push   %ebp
80101cd1:	89 e5                	mov    %esp,%ebp
80101cd3:	57                   	push   %edi
80101cd4:	56                   	push   %esi
80101cd5:	53                   	push   %ebx
80101cd6:	89 cf                	mov    %ecx,%edi
80101cd8:	89 c3                	mov    %eax,%ebx
80101cda:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101cdd:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101ce0:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101ce3:	0f 84 67 01 00 00    	je     80101e50 <namex+0x180>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101ce9:	e8 e2 1b 00 00       	call   801038d0 <myproc>
  acquire(&icache.lock);
80101cee:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101cf1:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101cf4:	68 c0 13 11 80       	push   $0x801113c0
80101cf9:	e8 92 28 00 00       	call   80104590 <acquire>
  ip->ref++;
80101cfe:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101d02:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101d09:	e8 42 29 00 00       	call   80104650 <release>
80101d0e:	83 c4 10             	add    $0x10,%esp
80101d11:	eb 08                	jmp    80101d1b <namex+0x4b>
80101d13:	90                   	nop
80101d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101d18:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d1b:	0f b6 03             	movzbl (%ebx),%eax
80101d1e:	3c 2f                	cmp    $0x2f,%al
80101d20:	74 f6                	je     80101d18 <namex+0x48>
  if(*path == 0)
80101d22:	84 c0                	test   %al,%al
80101d24:	0f 84 ee 00 00 00    	je     80101e18 <namex+0x148>
  while(*path != '/' && *path != 0)
80101d2a:	0f b6 03             	movzbl (%ebx),%eax
80101d2d:	3c 2f                	cmp    $0x2f,%al
80101d2f:	0f 84 b3 00 00 00    	je     80101de8 <namex+0x118>
80101d35:	84 c0                	test   %al,%al
80101d37:	89 da                	mov    %ebx,%edx
80101d39:	75 09                	jne    80101d44 <namex+0x74>
80101d3b:	e9 a8 00 00 00       	jmp    80101de8 <namex+0x118>
80101d40:	84 c0                	test   %al,%al
80101d42:	74 0a                	je     80101d4e <namex+0x7e>
    path++;
80101d44:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101d47:	0f b6 02             	movzbl (%edx),%eax
80101d4a:	3c 2f                	cmp    $0x2f,%al
80101d4c:	75 f2                	jne    80101d40 <namex+0x70>
80101d4e:	89 d1                	mov    %edx,%ecx
80101d50:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101d52:	83 f9 0d             	cmp    $0xd,%ecx
80101d55:	0f 8e 91 00 00 00    	jle    80101dec <namex+0x11c>
    memmove(name, s, DIRSIZ);
80101d5b:	83 ec 04             	sub    $0x4,%esp
80101d5e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d61:	6a 0e                	push   $0xe
80101d63:	53                   	push   %ebx
80101d64:	57                   	push   %edi
80101d65:	e8 e6 29 00 00       	call   80104750 <memmove>
    path++;
80101d6a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    memmove(name, s, DIRSIZ);
80101d6d:	83 c4 10             	add    $0x10,%esp
    path++;
80101d70:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101d72:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d75:	75 11                	jne    80101d88 <namex+0xb8>
80101d77:	89 f6                	mov    %esi,%esi
80101d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d80:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d83:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d86:	74 f8                	je     80101d80 <namex+0xb0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d88:	83 ec 0c             	sub    $0xc,%esp
80101d8b:	56                   	push   %esi
80101d8c:	e8 5f f9 ff ff       	call   801016f0 <ilock>
    if(ip->type != T_DIR){
80101d91:	83 c4 10             	add    $0x10,%esp
80101d94:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d99:	0f 85 91 00 00 00    	jne    80101e30 <namex+0x160>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d9f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101da2:	85 d2                	test   %edx,%edx
80101da4:	74 09                	je     80101daf <namex+0xdf>
80101da6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101da9:	0f 84 b7 00 00 00    	je     80101e66 <namex+0x196>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101daf:	83 ec 04             	sub    $0x4,%esp
80101db2:	6a 00                	push   $0x0
80101db4:	57                   	push   %edi
80101db5:	56                   	push   %esi
80101db6:	e8 65 fe ff ff       	call   80101c20 <dirlookup>
80101dbb:	83 c4 10             	add    $0x10,%esp
80101dbe:	85 c0                	test   %eax,%eax
80101dc0:	74 6e                	je     80101e30 <namex+0x160>
  iunlock(ip);
80101dc2:	83 ec 0c             	sub    $0xc,%esp
80101dc5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101dc8:	56                   	push   %esi
80101dc9:	e8 02 fa ff ff       	call   801017d0 <iunlock>
  iput(ip);
80101dce:	89 34 24             	mov    %esi,(%esp)
80101dd1:	e8 4a fa ff ff       	call   80101820 <iput>
80101dd6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101dd9:	83 c4 10             	add    $0x10,%esp
80101ddc:	89 c6                	mov    %eax,%esi
80101dde:	e9 38 ff ff ff       	jmp    80101d1b <namex+0x4b>
80101de3:	90                   	nop
80101de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*path != '/' && *path != 0)
80101de8:	89 da                	mov    %ebx,%edx
80101dea:	31 c9                	xor    %ecx,%ecx
    memmove(name, s, len);
80101dec:	83 ec 04             	sub    $0x4,%esp
80101def:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101df2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101df5:	51                   	push   %ecx
80101df6:	53                   	push   %ebx
80101df7:	57                   	push   %edi
80101df8:	e8 53 29 00 00       	call   80104750 <memmove>
    name[len] = 0;
80101dfd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101e00:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101e03:	83 c4 10             	add    $0x10,%esp
80101e06:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101e0a:	89 d3                	mov    %edx,%ebx
80101e0c:	e9 61 ff ff ff       	jmp    80101d72 <namex+0xa2>
80101e11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101e18:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101e1b:	85 c0                	test   %eax,%eax
80101e1d:	75 5d                	jne    80101e7c <namex+0x1ac>
    iput(ip);
    return 0;
  }
  return ip;
}
80101e1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e22:	89 f0                	mov    %esi,%eax
80101e24:	5b                   	pop    %ebx
80101e25:	5e                   	pop    %esi
80101e26:	5f                   	pop    %edi
80101e27:	5d                   	pop    %ebp
80101e28:	c3                   	ret    
80101e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  iunlock(ip);
80101e30:	83 ec 0c             	sub    $0xc,%esp
80101e33:	56                   	push   %esi
80101e34:	e8 97 f9 ff ff       	call   801017d0 <iunlock>
  iput(ip);
80101e39:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101e3c:	31 f6                	xor    %esi,%esi
  iput(ip);
80101e3e:	e8 dd f9 ff ff       	call   80101820 <iput>
      return 0;
80101e43:	83 c4 10             	add    $0x10,%esp
}
80101e46:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e49:	89 f0                	mov    %esi,%eax
80101e4b:	5b                   	pop    %ebx
80101e4c:	5e                   	pop    %esi
80101e4d:	5f                   	pop    %edi
80101e4e:	5d                   	pop    %ebp
80101e4f:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101e50:	ba 01 00 00 00       	mov    $0x1,%edx
80101e55:	b8 01 00 00 00       	mov    $0x1,%eax
80101e5a:	e8 a1 f4 ff ff       	call   80101300 <iget>
80101e5f:	89 c6                	mov    %eax,%esi
80101e61:	e9 b5 fe ff ff       	jmp    80101d1b <namex+0x4b>
      iunlock(ip);
80101e66:	83 ec 0c             	sub    $0xc,%esp
80101e69:	56                   	push   %esi
80101e6a:	e8 61 f9 ff ff       	call   801017d0 <iunlock>
      return ip;
80101e6f:	83 c4 10             	add    $0x10,%esp
}
80101e72:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e75:	89 f0                	mov    %esi,%eax
80101e77:	5b                   	pop    %ebx
80101e78:	5e                   	pop    %esi
80101e79:	5f                   	pop    %edi
80101e7a:	5d                   	pop    %ebp
80101e7b:	c3                   	ret    
    iput(ip);
80101e7c:	83 ec 0c             	sub    $0xc,%esp
80101e7f:	56                   	push   %esi
    return 0;
80101e80:	31 f6                	xor    %esi,%esi
    iput(ip);
80101e82:	e8 99 f9 ff ff       	call   80101820 <iput>
    return 0;
80101e87:	83 c4 10             	add    $0x10,%esp
80101e8a:	eb 93                	jmp    80101e1f <namex+0x14f>
80101e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e90 <dirlink>:
{
80101e90:	55                   	push   %ebp
80101e91:	89 e5                	mov    %esp,%ebp
80101e93:	57                   	push   %edi
80101e94:	56                   	push   %esi
80101e95:	53                   	push   %ebx
80101e96:	83 ec 20             	sub    $0x20,%esp
80101e99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e9c:	6a 00                	push   $0x0
80101e9e:	ff 75 0c             	pushl  0xc(%ebp)
80101ea1:	53                   	push   %ebx
80101ea2:	e8 79 fd ff ff       	call   80101c20 <dirlookup>
80101ea7:	83 c4 10             	add    $0x10,%esp
80101eaa:	85 c0                	test   %eax,%eax
80101eac:	75 67                	jne    80101f15 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101eae:	8b 7b 58             	mov    0x58(%ebx),%edi
80101eb1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101eb4:	85 ff                	test   %edi,%edi
80101eb6:	74 29                	je     80101ee1 <dirlink+0x51>
80101eb8:	31 ff                	xor    %edi,%edi
80101eba:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101ebd:	eb 09                	jmp    80101ec8 <dirlink+0x38>
80101ebf:	90                   	nop
80101ec0:	83 c7 10             	add    $0x10,%edi
80101ec3:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101ec6:	73 19                	jae    80101ee1 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ec8:	6a 10                	push   $0x10
80101eca:	57                   	push   %edi
80101ecb:	56                   	push   %esi
80101ecc:	53                   	push   %ebx
80101ecd:	e8 fe fa ff ff       	call   801019d0 <readi>
80101ed2:	83 c4 10             	add    $0x10,%esp
80101ed5:	83 f8 10             	cmp    $0x10,%eax
80101ed8:	75 4e                	jne    80101f28 <dirlink+0x98>
    if(de.inum == 0)
80101eda:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101edf:	75 df                	jne    80101ec0 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80101ee1:	8d 45 da             	lea    -0x26(%ebp),%eax
80101ee4:	83 ec 04             	sub    $0x4,%esp
80101ee7:	6a 0e                	push   $0xe
80101ee9:	ff 75 0c             	pushl  0xc(%ebp)
80101eec:	50                   	push   %eax
80101eed:	e8 2e 29 00 00       	call   80104820 <strncpy>
  de.inum = inum;
80101ef2:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ef5:	6a 10                	push   $0x10
80101ef7:	57                   	push   %edi
80101ef8:	56                   	push   %esi
80101ef9:	53                   	push   %ebx
  de.inum = inum;
80101efa:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101efe:	e8 cd fb ff ff       	call   80101ad0 <writei>
80101f03:	83 c4 20             	add    $0x20,%esp
80101f06:	83 f8 10             	cmp    $0x10,%eax
80101f09:	75 2a                	jne    80101f35 <dirlink+0xa5>
  return 0;
80101f0b:	31 c0                	xor    %eax,%eax
}
80101f0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f10:	5b                   	pop    %ebx
80101f11:	5e                   	pop    %esi
80101f12:	5f                   	pop    %edi
80101f13:	5d                   	pop    %ebp
80101f14:	c3                   	ret    
    iput(ip);
80101f15:	83 ec 0c             	sub    $0xc,%esp
80101f18:	50                   	push   %eax
80101f19:	e8 02 f9 ff ff       	call   80101820 <iput>
    return -1;
80101f1e:	83 c4 10             	add    $0x10,%esp
80101f21:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f26:	eb e5                	jmp    80101f0d <dirlink+0x7d>
      panic("dirlink read");
80101f28:	83 ec 0c             	sub    $0xc,%esp
80101f2b:	68 36 75 10 80       	push   $0x80107536
80101f30:	e8 5b e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101f35:	83 ec 0c             	sub    $0xc,%esp
80101f38:	68 2e 7b 10 80       	push   $0x80107b2e
80101f3d:	e8 4e e4 ff ff       	call   80100390 <panic>
80101f42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f50 <namei>:

struct inode*
namei(char *path)
{
80101f50:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f51:	31 d2                	xor    %edx,%edx
{
80101f53:	89 e5                	mov    %esp,%ebp
80101f55:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101f58:	8b 45 08             	mov    0x8(%ebp),%eax
80101f5b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f5e:	e8 6d fd ff ff       	call   80101cd0 <namex>
}
80101f63:	c9                   	leave  
80101f64:	c3                   	ret    
80101f65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f70 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f70:	55                   	push   %ebp
  return namex(path, 1, name);
80101f71:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101f76:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f78:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f7b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f7e:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101f7f:	e9 4c fd ff ff       	jmp    80101cd0 <namex>
80101f84:	66 90                	xchg   %ax,%ax
80101f86:	66 90                	xchg   %ax,%ax
80101f88:	66 90                	xchg   %ax,%ax
80101f8a:	66 90                	xchg   %ax,%ax
80101f8c:	66 90                	xchg   %ax,%ax
80101f8e:	66 90                	xchg   %ax,%ax

80101f90 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f90:	55                   	push   %ebp
80101f91:	89 e5                	mov    %esp,%ebp
80101f93:	57                   	push   %edi
80101f94:	56                   	push   %esi
80101f95:	53                   	push   %ebx
80101f96:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
80101f99:	85 c0                	test   %eax,%eax
80101f9b:	0f 84 b4 00 00 00    	je     80102055 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101fa1:	8b 58 08             	mov    0x8(%eax),%ebx
80101fa4:	89 c6                	mov    %eax,%esi
80101fa6:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101fac:	0f 87 96 00 00 00    	ja     80102048 <idestart+0xb8>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fb2:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101fb7:	89 f6                	mov    %esi,%esi
80101fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101fc0:	89 ca                	mov    %ecx,%edx
80101fc2:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101fc3:	83 e0 c0             	and    $0xffffffc0,%eax
80101fc6:	3c 40                	cmp    $0x40,%al
80101fc8:	75 f6                	jne    80101fc0 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101fca:	31 ff                	xor    %edi,%edi
80101fcc:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101fd1:	89 f8                	mov    %edi,%eax
80101fd3:	ee                   	out    %al,(%dx)
80101fd4:	b8 01 00 00 00       	mov    $0x1,%eax
80101fd9:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101fde:	ee                   	out    %al,(%dx)
80101fdf:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101fe4:	89 d8                	mov    %ebx,%eax
80101fe6:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101fe7:	89 d8                	mov    %ebx,%eax
80101fe9:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101fee:	c1 f8 08             	sar    $0x8,%eax
80101ff1:	ee                   	out    %al,(%dx)
80101ff2:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101ff7:	89 f8                	mov    %edi,%eax
80101ff9:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101ffa:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101ffe:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102003:	c1 e0 04             	shl    $0x4,%eax
80102006:	83 e0 10             	and    $0x10,%eax
80102009:	83 c8 e0             	or     $0xffffffe0,%eax
8010200c:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
8010200d:	f6 06 04             	testb  $0x4,(%esi)
80102010:	75 16                	jne    80102028 <idestart+0x98>
80102012:	b8 20 00 00 00       	mov    $0x20,%eax
80102017:	89 ca                	mov    %ecx,%edx
80102019:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
8010201a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010201d:	5b                   	pop    %ebx
8010201e:	5e                   	pop    %esi
8010201f:	5f                   	pop    %edi
80102020:	5d                   	pop    %ebp
80102021:	c3                   	ret    
80102022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102028:	b8 30 00 00 00       	mov    $0x30,%eax
8010202d:	89 ca                	mov    %ecx,%edx
8010202f:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80102030:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80102035:	83 c6 5c             	add    $0x5c,%esi
80102038:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010203d:	fc                   	cld    
8010203e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80102040:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102043:	5b                   	pop    %ebx
80102044:	5e                   	pop    %esi
80102045:	5f                   	pop    %edi
80102046:	5d                   	pop    %ebp
80102047:	c3                   	ret    
    panic("incorrect blockno");
80102048:	83 ec 0c             	sub    $0xc,%esp
8010204b:	68 a0 75 10 80       	push   $0x801075a0
80102050:	e8 3b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80102055:	83 ec 0c             	sub    $0xc,%esp
80102058:	68 97 75 10 80       	push   $0x80107597
8010205d:	e8 2e e3 ff ff       	call   80100390 <panic>
80102062:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102070 <ideinit>:
{
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102076:	68 b2 75 10 80       	push   $0x801075b2
8010207b:	68 80 a5 10 80       	push   $0x8010a580
80102080:	e8 cb 23 00 00       	call   80104450 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102085:	58                   	pop    %eax
80102086:	a1 e0 36 11 80       	mov    0x801136e0,%eax
8010208b:	5a                   	pop    %edx
8010208c:	83 e8 01             	sub    $0x1,%eax
8010208f:	50                   	push   %eax
80102090:	6a 0e                	push   $0xe
80102092:	e8 a9 02 00 00       	call   80102340 <ioapicenable>
80102097:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010209a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010209f:	90                   	nop
801020a0:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020a1:	83 e0 c0             	and    $0xffffffc0,%eax
801020a4:	3c 40                	cmp    $0x40,%al
801020a6:	75 f8                	jne    801020a0 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801020a8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
801020ad:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020b2:	ee                   	out    %al,(%dx)
801020b3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020b8:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020bd:	eb 06                	jmp    801020c5 <ideinit+0x55>
801020bf:	90                   	nop
  for(i=0; i<1000; i++){
801020c0:	83 e9 01             	sub    $0x1,%ecx
801020c3:	74 0f                	je     801020d4 <ideinit+0x64>
801020c5:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
801020c6:	84 c0                	test   %al,%al
801020c8:	74 f6                	je     801020c0 <ideinit+0x50>
      havedisk1 = 1;
801020ca:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
801020d1:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801020d4:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801020d9:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020de:	ee                   	out    %al,(%dx)
}
801020df:	c9                   	leave  
801020e0:	c3                   	ret    
801020e1:	eb 0d                	jmp    801020f0 <ideintr>
801020e3:	90                   	nop
801020e4:	90                   	nop
801020e5:	90                   	nop
801020e6:	90                   	nop
801020e7:	90                   	nop
801020e8:	90                   	nop
801020e9:	90                   	nop
801020ea:	90                   	nop
801020eb:	90                   	nop
801020ec:	90                   	nop
801020ed:	90                   	nop
801020ee:	90                   	nop
801020ef:	90                   	nop

801020f0 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	57                   	push   %edi
801020f4:	56                   	push   %esi
801020f5:	53                   	push   %ebx
801020f6:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801020f9:	68 80 a5 10 80       	push   $0x8010a580
801020fe:	e8 8d 24 00 00       	call   80104590 <acquire>

  if((b = idequeue) == 0){
80102103:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102109:	83 c4 10             	add    $0x10,%esp
8010210c:	85 db                	test   %ebx,%ebx
8010210e:	74 67                	je     80102177 <ideintr+0x87>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102110:	8b 43 58             	mov    0x58(%ebx),%eax
80102113:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102118:	8b 3b                	mov    (%ebx),%edi
8010211a:	f7 c7 04 00 00 00    	test   $0x4,%edi
80102120:	75 31                	jne    80102153 <ideintr+0x63>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102122:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102127:	89 f6                	mov    %esi,%esi
80102129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102130:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102131:	89 c6                	mov    %eax,%esi
80102133:	83 e6 c0             	and    $0xffffffc0,%esi
80102136:	89 f1                	mov    %esi,%ecx
80102138:	80 f9 40             	cmp    $0x40,%cl
8010213b:	75 f3                	jne    80102130 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
8010213d:	a8 21                	test   $0x21,%al
8010213f:	75 12                	jne    80102153 <ideintr+0x63>
    insl(0x1f0, b->data, BSIZE/4);
80102141:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80102144:	b9 80 00 00 00       	mov    $0x80,%ecx
80102149:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010214e:	fc                   	cld    
8010214f:	f3 6d                	rep insl (%dx),%es:(%edi)
80102151:	8b 3b                	mov    (%ebx),%edi

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102153:	83 e7 fb             	and    $0xfffffffb,%edi
  wakeup(b);
80102156:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
80102159:	89 f9                	mov    %edi,%ecx
8010215b:	83 c9 02             	or     $0x2,%ecx
8010215e:	89 0b                	mov    %ecx,(%ebx)
  wakeup(b);
80102160:	53                   	push   %ebx
80102161:	e8 4a 1f 00 00       	call   801040b0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102166:	a1 64 a5 10 80       	mov    0x8010a564,%eax
8010216b:	83 c4 10             	add    $0x10,%esp
8010216e:	85 c0                	test   %eax,%eax
80102170:	74 05                	je     80102177 <ideintr+0x87>
    idestart(idequeue);
80102172:	e8 19 fe ff ff       	call   80101f90 <idestart>
    release(&idelock);
80102177:	83 ec 0c             	sub    $0xc,%esp
8010217a:	68 80 a5 10 80       	push   $0x8010a580
8010217f:	e8 cc 24 00 00       	call   80104650 <release>

  release(&idelock);
}
80102184:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102187:	5b                   	pop    %ebx
80102188:	5e                   	pop    %esi
80102189:	5f                   	pop    %edi
8010218a:	5d                   	pop    %ebp
8010218b:	c3                   	ret    
8010218c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102190 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102190:	55                   	push   %ebp
80102191:	89 e5                	mov    %esp,%ebp
80102193:	53                   	push   %ebx
80102194:	83 ec 10             	sub    $0x10,%esp
80102197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010219a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010219d:	50                   	push   %eax
8010219e:	e8 5d 22 00 00       	call   80104400 <holdingsleep>
801021a3:	83 c4 10             	add    $0x10,%esp
801021a6:	85 c0                	test   %eax,%eax
801021a8:	0f 84 c6 00 00 00    	je     80102274 <iderw+0xe4>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 e0 06             	and    $0x6,%eax
801021b3:	83 f8 02             	cmp    $0x2,%eax
801021b6:	0f 84 ab 00 00 00    	je     80102267 <iderw+0xd7>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
801021bc:	8b 53 04             	mov    0x4(%ebx),%edx
801021bf:	85 d2                	test   %edx,%edx
801021c1:	74 0d                	je     801021d0 <iderw+0x40>
801021c3:	a1 60 a5 10 80       	mov    0x8010a560,%eax
801021c8:	85 c0                	test   %eax,%eax
801021ca:	0f 84 b1 00 00 00    	je     80102281 <iderw+0xf1>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
801021d0:	83 ec 0c             	sub    $0xc,%esp
801021d3:	68 80 a5 10 80       	push   $0x8010a580
801021d8:	e8 b3 23 00 00       	call   80104590 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021dd:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
801021e3:	83 c4 10             	add    $0x10,%esp
  b->qnext = 0;
801021e6:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021ed:	85 d2                	test   %edx,%edx
801021ef:	75 09                	jne    801021fa <iderw+0x6a>
801021f1:	eb 6d                	jmp    80102260 <iderw+0xd0>
801021f3:	90                   	nop
801021f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801021f8:	89 c2                	mov    %eax,%edx
801021fa:	8b 42 58             	mov    0x58(%edx),%eax
801021fd:	85 c0                	test   %eax,%eax
801021ff:	75 f7                	jne    801021f8 <iderw+0x68>
80102201:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102204:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102206:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
8010220c:	74 42                	je     80102250 <iderw+0xc0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010220e:	8b 03                	mov    (%ebx),%eax
80102210:	83 e0 06             	and    $0x6,%eax
80102213:	83 f8 02             	cmp    $0x2,%eax
80102216:	74 23                	je     8010223b <iderw+0xab>
80102218:	90                   	nop
80102219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102220:	83 ec 08             	sub    $0x8,%esp
80102223:	68 80 a5 10 80       	push   $0x8010a580
80102228:	53                   	push   %ebx
80102229:	e8 c2 1c 00 00       	call   80103ef0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010222e:	8b 03                	mov    (%ebx),%eax
80102230:	83 c4 10             	add    $0x10,%esp
80102233:	83 e0 06             	and    $0x6,%eax
80102236:	83 f8 02             	cmp    $0x2,%eax
80102239:	75 e5                	jne    80102220 <iderw+0x90>
  }


  release(&idelock);
8010223b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
80102242:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102245:	c9                   	leave  
  release(&idelock);
80102246:	e9 05 24 00 00       	jmp    80104650 <release>
8010224b:	90                   	nop
8010224c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    idestart(b);
80102250:	89 d8                	mov    %ebx,%eax
80102252:	e8 39 fd ff ff       	call   80101f90 <idestart>
80102257:	eb b5                	jmp    8010220e <iderw+0x7e>
80102259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102260:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102265:	eb 9d                	jmp    80102204 <iderw+0x74>
    panic("iderw: nothing to do");
80102267:	83 ec 0c             	sub    $0xc,%esp
8010226a:	68 cc 75 10 80       	push   $0x801075cc
8010226f:	e8 1c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 b6 75 10 80       	push   $0x801075b6
8010227c:	e8 0f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102281:	83 ec 0c             	sub    $0xc,%esp
80102284:	68 e1 75 10 80       	push   $0x801075e1
80102289:	e8 02 e1 ff ff       	call   80100390 <panic>
8010228e:	66 90                	xchg   %ax,%ax

80102290 <ioapicinit>:
80102290:	55                   	push   %ebp
80102291:	c7 05 14 30 11 80 00 	movl   $0xfec00000,0x80113014
80102298:	00 c0 fe 
8010229b:	89 e5                	mov    %esp,%ebp
8010229d:	56                   	push   %esi
8010229e:	53                   	push   %ebx
8010229f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801022a6:	00 00 00 
801022a9:	a1 14 30 11 80       	mov    0x80113014,%eax
801022ae:	8b 58 10             	mov    0x10(%eax),%ebx
801022b1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801022b7:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
801022bd:	0f b6 15 40 31 11 80 	movzbl 0x80113140,%edx
801022c4:	c1 eb 10             	shr    $0x10,%ebx
801022c7:	8b 41 10             	mov    0x10(%ecx),%eax
801022ca:	0f b6 db             	movzbl %bl,%ebx
801022cd:	c1 e8 18             	shr    $0x18,%eax
801022d0:	39 c2                	cmp    %eax,%edx
801022d2:	74 16                	je     801022ea <ioapicinit+0x5a>
801022d4:	83 ec 0c             	sub    $0xc,%esp
801022d7:	68 00 76 10 80       	push   $0x80107600
801022dc:	e8 7f e3 ff ff       	call   80100660 <cprintf>
801022e1:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
801022e7:	83 c4 10             	add    $0x10,%esp
801022ea:	83 c3 21             	add    $0x21,%ebx
801022ed:	ba 10 00 00 00       	mov    $0x10,%edx
801022f2:	b8 20 00 00 00       	mov    $0x20,%eax
801022f7:	89 f6                	mov    %esi,%esi
801022f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102300:	89 11                	mov    %edx,(%ecx)
80102302:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
80102308:	89 c6                	mov    %eax,%esi
8010230a:	81 ce 00 00 01 00    	or     $0x10000,%esi
80102310:	83 c0 01             	add    $0x1,%eax
80102313:	89 71 10             	mov    %esi,0x10(%ecx)
80102316:	8d 72 01             	lea    0x1(%edx),%esi
80102319:	83 c2 02             	add    $0x2,%edx
8010231c:	39 d8                	cmp    %ebx,%eax
8010231e:	89 31                	mov    %esi,(%ecx)
80102320:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
80102326:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010232d:	75 d1                	jne    80102300 <ioapicinit+0x70>
8010232f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102332:	5b                   	pop    %ebx
80102333:	5e                   	pop    %esi
80102334:	5d                   	pop    %ebp
80102335:	c3                   	ret    
80102336:	8d 76 00             	lea    0x0(%esi),%esi
80102339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102340 <ioapicenable>:
80102340:	55                   	push   %ebp
80102341:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
80102347:	89 e5                	mov    %esp,%ebp
80102349:	8b 45 08             	mov    0x8(%ebp),%eax
8010234c:	8d 50 20             	lea    0x20(%eax),%edx
8010234f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102353:	89 01                	mov    %eax,(%ecx)
80102355:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
8010235b:	83 c0 01             	add    $0x1,%eax
8010235e:	89 51 10             	mov    %edx,0x10(%ecx)
80102361:	8b 55 0c             	mov    0xc(%ebp),%edx
80102364:	89 01                	mov    %eax,(%ecx)
80102366:	a1 14 30 11 80       	mov    0x80113014,%eax
8010236b:	c1 e2 18             	shl    $0x18,%edx
8010236e:	89 50 10             	mov    %edx,0x10(%eax)
80102371:	5d                   	pop    %ebp
80102372:	c3                   	ret    
80102373:	66 90                	xchg   %ax,%ax
80102375:	66 90                	xchg   %ax,%ax
80102377:	66 90                	xchg   %ax,%ax
80102379:	66 90                	xchg   %ax,%ax
8010237b:	66 90                	xchg   %ax,%ax
8010237d:	66 90                	xchg   %ax,%ax
8010237f:	90                   	nop

80102380 <kfree>:
80102380:	55                   	push   %ebp
80102381:	89 e5                	mov    %esp,%ebp
80102383:	53                   	push   %ebx
80102384:	83 ec 04             	sub    $0x4,%esp
80102387:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010238a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102390:	75 70                	jne    80102402 <kfree+0x82>
80102392:	81 fb 88 60 11 80    	cmp    $0x80116088,%ebx
80102398:	72 68                	jb     80102402 <kfree+0x82>
8010239a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801023a0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801023a5:	77 5b                	ja     80102402 <kfree+0x82>
801023a7:	83 ec 04             	sub    $0x4,%esp
801023aa:	68 00 10 00 00       	push   $0x1000
801023af:	6a 01                	push   $0x1
801023b1:	53                   	push   %ebx
801023b2:	e8 e9 22 00 00       	call   801046a0 <memset>
801023b7:	8b 15 54 30 11 80    	mov    0x80113054,%edx
801023bd:	83 c4 10             	add    $0x10,%esp
801023c0:	85 d2                	test   %edx,%edx
801023c2:	75 2c                	jne    801023f0 <kfree+0x70>
801023c4:	a1 58 30 11 80       	mov    0x80113058,%eax
801023c9:	89 03                	mov    %eax,(%ebx)
801023cb:	a1 54 30 11 80       	mov    0x80113054,%eax
801023d0:	89 1d 58 30 11 80    	mov    %ebx,0x80113058
801023d6:	85 c0                	test   %eax,%eax
801023d8:	75 06                	jne    801023e0 <kfree+0x60>
801023da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023dd:	c9                   	leave  
801023de:	c3                   	ret    
801023df:	90                   	nop
801023e0:	c7 45 08 20 30 11 80 	movl   $0x80113020,0x8(%ebp)
801023e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ea:	c9                   	leave  
801023eb:	e9 60 22 00 00       	jmp    80104650 <release>
801023f0:	83 ec 0c             	sub    $0xc,%esp
801023f3:	68 20 30 11 80       	push   $0x80113020
801023f8:	e8 93 21 00 00       	call   80104590 <acquire>
801023fd:	83 c4 10             	add    $0x10,%esp
80102400:	eb c2                	jmp    801023c4 <kfree+0x44>
80102402:	83 ec 0c             	sub    $0xc,%esp
80102405:	68 32 76 10 80       	push   $0x80107632
8010240a:	e8 81 df ff ff       	call   80100390 <panic>
8010240f:	90                   	nop

80102410 <freerange>:
80102410:	55                   	push   %ebp
80102411:	89 e5                	mov    %esp,%ebp
80102413:	56                   	push   %esi
80102414:	53                   	push   %ebx
80102415:	8b 45 08             	mov    0x8(%ebp),%eax
80102418:	8b 75 0c             	mov    0xc(%ebp),%esi
8010241b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102421:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102427:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010242d:	39 de                	cmp    %ebx,%esi
8010242f:	72 23                	jb     80102454 <freerange+0x44>
80102431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102438:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010243e:	83 ec 0c             	sub    $0xc,%esp
80102441:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102447:	50                   	push   %eax
80102448:	e8 33 ff ff ff       	call   80102380 <kfree>
8010244d:	83 c4 10             	add    $0x10,%esp
80102450:	39 f3                	cmp    %esi,%ebx
80102452:	76 e4                	jbe    80102438 <freerange+0x28>
80102454:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102457:	5b                   	pop    %ebx
80102458:	5e                   	pop    %esi
80102459:	5d                   	pop    %ebp
8010245a:	c3                   	ret    
8010245b:	90                   	nop
8010245c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102460 <kinit1>:
80102460:	55                   	push   %ebp
80102461:	89 e5                	mov    %esp,%ebp
80102463:	56                   	push   %esi
80102464:	53                   	push   %ebx
80102465:	8b 75 0c             	mov    0xc(%ebp),%esi
80102468:	83 ec 08             	sub    $0x8,%esp
8010246b:	68 38 76 10 80       	push   $0x80107638
80102470:	68 20 30 11 80       	push   $0x80113020
80102475:	e8 d6 1f 00 00       	call   80104450 <initlock>
8010247a:	8b 45 08             	mov    0x8(%ebp),%eax
8010247d:	83 c4 10             	add    $0x10,%esp
80102480:	c7 05 54 30 11 80 00 	movl   $0x0,0x80113054
80102487:	00 00 00 
8010248a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102490:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102496:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010249c:	39 de                	cmp    %ebx,%esi
8010249e:	72 1c                	jb     801024bc <kinit1+0x5c>
801024a0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024a6:	83 ec 0c             	sub    $0xc,%esp
801024a9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024af:	50                   	push   %eax
801024b0:	e8 cb fe ff ff       	call   80102380 <kfree>
801024b5:	83 c4 10             	add    $0x10,%esp
801024b8:	39 de                	cmp    %ebx,%esi
801024ba:	73 e4                	jae    801024a0 <kinit1+0x40>
801024bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024bf:	5b                   	pop    %ebx
801024c0:	5e                   	pop    %esi
801024c1:	5d                   	pop    %ebp
801024c2:	c3                   	ret    
801024c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801024c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024d0 <kinit2>:
801024d0:	55                   	push   %ebp
801024d1:	89 e5                	mov    %esp,%ebp
801024d3:	56                   	push   %esi
801024d4:	53                   	push   %ebx
801024d5:	8b 45 08             	mov    0x8(%ebp),%eax
801024d8:	8b 75 0c             	mov    0xc(%ebp),%esi
801024db:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024e1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801024e7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024ed:	39 de                	cmp    %ebx,%esi
801024ef:	72 23                	jb     80102514 <kinit2+0x44>
801024f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801024f8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024fe:	83 ec 0c             	sub    $0xc,%esp
80102501:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102507:	50                   	push   %eax
80102508:	e8 73 fe ff ff       	call   80102380 <kfree>
8010250d:	83 c4 10             	add    $0x10,%esp
80102510:	39 de                	cmp    %ebx,%esi
80102512:	73 e4                	jae    801024f8 <kinit2+0x28>
80102514:	c7 05 54 30 11 80 01 	movl   $0x1,0x80113054
8010251b:	00 00 00 
8010251e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102521:	5b                   	pop    %ebx
80102522:	5e                   	pop    %esi
80102523:	5d                   	pop    %ebp
80102524:	c3                   	ret    
80102525:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102530 <kalloc>:
80102530:	a1 54 30 11 80       	mov    0x80113054,%eax
80102535:	85 c0                	test   %eax,%eax
80102537:	75 1f                	jne    80102558 <kalloc+0x28>
80102539:	a1 58 30 11 80       	mov    0x80113058,%eax
8010253e:	85 c0                	test   %eax,%eax
80102540:	74 0e                	je     80102550 <kalloc+0x20>
80102542:	8b 10                	mov    (%eax),%edx
80102544:	89 15 58 30 11 80    	mov    %edx,0x80113058
8010254a:	c3                   	ret    
8010254b:	90                   	nop
8010254c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102550:	f3 c3                	repz ret 
80102552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102558:	55                   	push   %ebp
80102559:	89 e5                	mov    %esp,%ebp
8010255b:	83 ec 24             	sub    $0x24,%esp
8010255e:	68 20 30 11 80       	push   $0x80113020
80102563:	e8 28 20 00 00       	call   80104590 <acquire>
80102568:	a1 58 30 11 80       	mov    0x80113058,%eax
8010256d:	83 c4 10             	add    $0x10,%esp
80102570:	8b 15 54 30 11 80    	mov    0x80113054,%edx
80102576:	85 c0                	test   %eax,%eax
80102578:	74 08                	je     80102582 <kalloc+0x52>
8010257a:	8b 08                	mov    (%eax),%ecx
8010257c:	89 0d 58 30 11 80    	mov    %ecx,0x80113058
80102582:	85 d2                	test   %edx,%edx
80102584:	74 16                	je     8010259c <kalloc+0x6c>
80102586:	83 ec 0c             	sub    $0xc,%esp
80102589:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010258c:	68 20 30 11 80       	push   $0x80113020
80102591:	e8 ba 20 00 00       	call   80104650 <release>
80102596:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102599:	83 c4 10             	add    $0x10,%esp
8010259c:	c9                   	leave  
8010259d:	c3                   	ret    
8010259e:	66 90                	xchg   %ax,%ax

801025a0 <kbdgetc>:
801025a0:	ba 64 00 00 00       	mov    $0x64,%edx
801025a5:	ec                   	in     (%dx),%al
801025a6:	a8 01                	test   $0x1,%al
801025a8:	0f 84 c2 00 00 00    	je     80102670 <kbdgetc+0xd0>
801025ae:	ba 60 00 00 00       	mov    $0x60,%edx
801025b3:	ec                   	in     (%dx),%al
801025b4:	0f b6 d0             	movzbl %al,%edx
801025b7:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
801025bd:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
801025c3:	0f 84 7f 00 00 00    	je     80102648 <kbdgetc+0xa8>
801025c9:	55                   	push   %ebp
801025ca:	89 e5                	mov    %esp,%ebp
801025cc:	53                   	push   %ebx
801025cd:	89 cb                	mov    %ecx,%ebx
801025cf:	83 e3 40             	and    $0x40,%ebx
801025d2:	84 c0                	test   %al,%al
801025d4:	78 4a                	js     80102620 <kbdgetc+0x80>
801025d6:	85 db                	test   %ebx,%ebx
801025d8:	74 09                	je     801025e3 <kbdgetc+0x43>
801025da:	83 c8 80             	or     $0xffffff80,%eax
801025dd:	83 e1 bf             	and    $0xffffffbf,%ecx
801025e0:	0f b6 d0             	movzbl %al,%edx
801025e3:	0f b6 82 60 77 10 80 	movzbl -0x7fef88a0(%edx),%eax
801025ea:	09 c1                	or     %eax,%ecx
801025ec:	0f b6 82 60 76 10 80 	movzbl -0x7fef89a0(%edx),%eax
801025f3:	31 c1                	xor    %eax,%ecx
801025f5:	89 c8                	mov    %ecx,%eax
801025f7:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801025fd:	83 e0 03             	and    $0x3,%eax
80102600:	83 e1 08             	and    $0x8,%ecx
80102603:	8b 04 85 40 76 10 80 	mov    -0x7fef89c0(,%eax,4),%eax
8010260a:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
8010260e:	74 31                	je     80102641 <kbdgetc+0xa1>
80102610:	8d 50 9f             	lea    -0x61(%eax),%edx
80102613:	83 fa 19             	cmp    $0x19,%edx
80102616:	77 40                	ja     80102658 <kbdgetc+0xb8>
80102618:	83 e8 20             	sub    $0x20,%eax
8010261b:	5b                   	pop    %ebx
8010261c:	5d                   	pop    %ebp
8010261d:	c3                   	ret    
8010261e:	66 90                	xchg   %ax,%ax
80102620:	83 e0 7f             	and    $0x7f,%eax
80102623:	85 db                	test   %ebx,%ebx
80102625:	0f 44 d0             	cmove  %eax,%edx
80102628:	0f b6 82 60 77 10 80 	movzbl -0x7fef88a0(%edx),%eax
8010262f:	83 c8 40             	or     $0x40,%eax
80102632:	0f b6 c0             	movzbl %al,%eax
80102635:	f7 d0                	not    %eax
80102637:	21 c1                	and    %eax,%ecx
80102639:	31 c0                	xor    %eax,%eax
8010263b:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102641:	5b                   	pop    %ebx
80102642:	5d                   	pop    %ebp
80102643:	c3                   	ret    
80102644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102648:	83 c9 40             	or     $0x40,%ecx
8010264b:	31 c0                	xor    %eax,%eax
8010264d:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102653:	c3                   	ret    
80102654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102658:	8d 48 bf             	lea    -0x41(%eax),%ecx
8010265b:	8d 50 20             	lea    0x20(%eax),%edx
8010265e:	5b                   	pop    %ebx
8010265f:	83 f9 1a             	cmp    $0x1a,%ecx
80102662:	0f 42 c2             	cmovb  %edx,%eax
80102665:	5d                   	pop    %ebp
80102666:	c3                   	ret    
80102667:	89 f6                	mov    %esi,%esi
80102669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102670:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102675:	c3                   	ret    
80102676:	8d 76 00             	lea    0x0(%esi),%esi
80102679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102680 <kbdintr>:
80102680:	55                   	push   %ebp
80102681:	89 e5                	mov    %esp,%ebp
80102683:	83 ec 14             	sub    $0x14,%esp
80102686:	68 a0 25 10 80       	push   $0x801025a0
8010268b:	e8 c0 e1 ff ff       	call   80100850 <consoleintr>
80102690:	83 c4 10             	add    $0x10,%esp
80102693:	c9                   	leave  
80102694:	c3                   	ret    
80102695:	66 90                	xchg   %ax,%ax
80102697:	66 90                	xchg   %ax,%ax
80102699:	66 90                	xchg   %ax,%ax
8010269b:	66 90                	xchg   %ax,%ax
8010269d:	66 90                	xchg   %ax,%ax
8010269f:	90                   	nop

801026a0 <lapicinit>:
801026a0:	a1 5c 30 11 80       	mov    0x8011305c,%eax
801026a5:	55                   	push   %ebp
801026a6:	89 e5                	mov    %esp,%ebp
801026a8:	85 c0                	test   %eax,%eax
801026aa:	0f 84 c8 00 00 00    	je     80102778 <lapicinit+0xd8>
801026b0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801026b7:	01 00 00 
801026ba:	8b 50 20             	mov    0x20(%eax),%edx
801026bd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801026c4:	00 00 00 
801026c7:	8b 50 20             	mov    0x20(%eax),%edx
801026ca:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026d1:	00 02 00 
801026d4:	8b 50 20             	mov    0x20(%eax),%edx
801026d7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026de:	96 98 00 
801026e1:	8b 50 20             	mov    0x20(%eax),%edx
801026e4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026eb:	00 01 00 
801026ee:	8b 50 20             	mov    0x20(%eax),%edx
801026f1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026f8:	00 01 00 
801026fb:	8b 50 20             	mov    0x20(%eax),%edx
801026fe:	8b 50 30             	mov    0x30(%eax),%edx
80102701:	c1 ea 10             	shr    $0x10,%edx
80102704:	80 fa 03             	cmp    $0x3,%dl
80102707:	77 77                	ja     80102780 <lapicinit+0xe0>
80102709:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102710:	00 00 00 
80102713:	8b 50 20             	mov    0x20(%eax),%edx
80102716:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010271d:	00 00 00 
80102720:	8b 50 20             	mov    0x20(%eax),%edx
80102723:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010272a:	00 00 00 
8010272d:	8b 50 20             	mov    0x20(%eax),%edx
80102730:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102737:	00 00 00 
8010273a:	8b 50 20             	mov    0x20(%eax),%edx
8010273d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102744:	00 00 00 
80102747:	8b 50 20             	mov    0x20(%eax),%edx
8010274a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102751:	85 08 00 
80102754:	8b 50 20             	mov    0x20(%eax),%edx
80102757:	89 f6                	mov    %esi,%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102760:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102766:	80 e6 10             	and    $0x10,%dh
80102769:	75 f5                	jne    80102760 <lapicinit+0xc0>
8010276b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102772:	00 00 00 
80102775:	8b 40 20             	mov    0x20(%eax),%eax
80102778:	5d                   	pop    %ebp
80102779:	c3                   	ret    
8010277a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102780:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102787:	00 01 00 
8010278a:	8b 50 20             	mov    0x20(%eax),%edx
8010278d:	e9 77 ff ff ff       	jmp    80102709 <lapicinit+0x69>
80102792:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027a0 <lapicid>:
801027a0:	8b 15 5c 30 11 80    	mov    0x8011305c,%edx
801027a6:	55                   	push   %ebp
801027a7:	31 c0                	xor    %eax,%eax
801027a9:	89 e5                	mov    %esp,%ebp
801027ab:	85 d2                	test   %edx,%edx
801027ad:	74 06                	je     801027b5 <lapicid+0x15>
801027af:	8b 42 20             	mov    0x20(%edx),%eax
801027b2:	c1 e8 18             	shr    $0x18,%eax
801027b5:	5d                   	pop    %ebp
801027b6:	c3                   	ret    
801027b7:	89 f6                	mov    %esi,%esi
801027b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027c0 <lapiceoi>:
801027c0:	a1 5c 30 11 80       	mov    0x8011305c,%eax
801027c5:	55                   	push   %ebp
801027c6:	89 e5                	mov    %esp,%ebp
801027c8:	85 c0                	test   %eax,%eax
801027ca:	74 0d                	je     801027d9 <lapiceoi+0x19>
801027cc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027d3:	00 00 00 
801027d6:	8b 40 20             	mov    0x20(%eax),%eax
801027d9:	5d                   	pop    %ebp
801027da:	c3                   	ret    
801027db:	90                   	nop
801027dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027e0 <microdelay>:
801027e0:	55                   	push   %ebp
801027e1:	89 e5                	mov    %esp,%ebp
801027e3:	5d                   	pop    %ebp
801027e4:	c3                   	ret    
801027e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027f0 <lapicstartap>:
801027f0:	55                   	push   %ebp
801027f1:	b8 0f 00 00 00       	mov    $0xf,%eax
801027f6:	ba 70 00 00 00       	mov    $0x70,%edx
801027fb:	89 e5                	mov    %esp,%ebp
801027fd:	53                   	push   %ebx
801027fe:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102801:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102804:	ee                   	out    %al,(%dx)
80102805:	b8 0a 00 00 00       	mov    $0xa,%eax
8010280a:	ba 71 00 00 00       	mov    $0x71,%edx
8010280f:	ee                   	out    %al,(%dx)
80102810:	31 c0                	xor    %eax,%eax
80102812:	c1 e3 18             	shl    $0x18,%ebx
80102815:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010281b:	89 c8                	mov    %ecx,%eax
8010281d:	c1 e9 0c             	shr    $0xc,%ecx
80102820:	c1 e8 04             	shr    $0x4,%eax
80102823:	89 da                	mov    %ebx,%edx
80102825:	80 cd 06             	or     $0x6,%ch
80102828:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010282e:	a1 5c 30 11 80       	mov    0x8011305c,%eax
80102833:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102839:	8b 58 20             	mov    0x20(%eax),%ebx
8010283c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102843:	c5 00 00 
80102846:	8b 58 20             	mov    0x20(%eax),%ebx
80102849:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102850:	85 00 00 
80102853:	8b 58 20             	mov    0x20(%eax),%ebx
80102856:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010285c:	8b 58 20             	mov    0x20(%eax),%ebx
8010285f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102865:	8b 58 20             	mov    0x20(%eax),%ebx
80102868:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010286e:	8b 50 20             	mov    0x20(%eax),%edx
80102871:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102877:	8b 40 20             	mov    0x20(%eax),%eax
8010287a:	5b                   	pop    %ebx
8010287b:	5d                   	pop    %ebp
8010287c:	c3                   	ret    
8010287d:	8d 76 00             	lea    0x0(%esi),%esi

80102880 <cmostime>:
80102880:	55                   	push   %ebp
80102881:	b8 0b 00 00 00       	mov    $0xb,%eax
80102886:	ba 70 00 00 00       	mov    $0x70,%edx
8010288b:	89 e5                	mov    %esp,%ebp
8010288d:	57                   	push   %edi
8010288e:	56                   	push   %esi
8010288f:	53                   	push   %ebx
80102890:	83 ec 4c             	sub    $0x4c,%esp
80102893:	ee                   	out    %al,(%dx)
80102894:	ba 71 00 00 00       	mov    $0x71,%edx
80102899:	ec                   	in     (%dx),%al
8010289a:	83 e0 04             	and    $0x4,%eax
8010289d:	bb 70 00 00 00       	mov    $0x70,%ebx
801028a2:	88 45 b3             	mov    %al,-0x4d(%ebp)
801028a5:	8d 76 00             	lea    0x0(%esi),%esi
801028a8:	31 c0                	xor    %eax,%eax
801028aa:	89 da                	mov    %ebx,%edx
801028ac:	ee                   	out    %al,(%dx)
801028ad:	b9 71 00 00 00       	mov    $0x71,%ecx
801028b2:	89 ca                	mov    %ecx,%edx
801028b4:	ec                   	in     (%dx),%al
801028b5:	88 45 b7             	mov    %al,-0x49(%ebp)
801028b8:	89 da                	mov    %ebx,%edx
801028ba:	b8 02 00 00 00       	mov    $0x2,%eax
801028bf:	ee                   	out    %al,(%dx)
801028c0:	89 ca                	mov    %ecx,%edx
801028c2:	ec                   	in     (%dx),%al
801028c3:	88 45 b6             	mov    %al,-0x4a(%ebp)
801028c6:	89 da                	mov    %ebx,%edx
801028c8:	b8 04 00 00 00       	mov    $0x4,%eax
801028cd:	ee                   	out    %al,(%dx)
801028ce:	89 ca                	mov    %ecx,%edx
801028d0:	ec                   	in     (%dx),%al
801028d1:	88 45 b5             	mov    %al,-0x4b(%ebp)
801028d4:	89 da                	mov    %ebx,%edx
801028d6:	b8 07 00 00 00       	mov    $0x7,%eax
801028db:	ee                   	out    %al,(%dx)
801028dc:	89 ca                	mov    %ecx,%edx
801028de:	ec                   	in     (%dx),%al
801028df:	88 45 b4             	mov    %al,-0x4c(%ebp)
801028e2:	89 da                	mov    %ebx,%edx
801028e4:	b8 08 00 00 00       	mov    $0x8,%eax
801028e9:	ee                   	out    %al,(%dx)
801028ea:	89 ca                	mov    %ecx,%edx
801028ec:	ec                   	in     (%dx),%al
801028ed:	89 c7                	mov    %eax,%edi
801028ef:	89 da                	mov    %ebx,%edx
801028f1:	b8 09 00 00 00       	mov    $0x9,%eax
801028f6:	ee                   	out    %al,(%dx)
801028f7:	89 ca                	mov    %ecx,%edx
801028f9:	ec                   	in     (%dx),%al
801028fa:	89 c6                	mov    %eax,%esi
801028fc:	89 da                	mov    %ebx,%edx
801028fe:	b8 0a 00 00 00       	mov    $0xa,%eax
80102903:	ee                   	out    %al,(%dx)
80102904:	89 ca                	mov    %ecx,%edx
80102906:	ec                   	in     (%dx),%al
80102907:	84 c0                	test   %al,%al
80102909:	78 9d                	js     801028a8 <cmostime+0x28>
8010290b:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
8010290f:	89 fa                	mov    %edi,%edx
80102911:	0f b6 fa             	movzbl %dl,%edi
80102914:	89 f2                	mov    %esi,%edx
80102916:	0f b6 f2             	movzbl %dl,%esi
80102919:	89 7d c8             	mov    %edi,-0x38(%ebp)
8010291c:	89 da                	mov    %ebx,%edx
8010291e:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102921:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102924:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80102928:	89 45 bc             	mov    %eax,-0x44(%ebp)
8010292b:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
8010292f:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102932:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102936:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102939:	31 c0                	xor    %eax,%eax
8010293b:	ee                   	out    %al,(%dx)
8010293c:	89 ca                	mov    %ecx,%edx
8010293e:	ec                   	in     (%dx),%al
8010293f:	0f b6 c0             	movzbl %al,%eax
80102942:	89 da                	mov    %ebx,%edx
80102944:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102947:	b8 02 00 00 00       	mov    $0x2,%eax
8010294c:	ee                   	out    %al,(%dx)
8010294d:	89 ca                	mov    %ecx,%edx
8010294f:	ec                   	in     (%dx),%al
80102950:	0f b6 c0             	movzbl %al,%eax
80102953:	89 da                	mov    %ebx,%edx
80102955:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102958:	b8 04 00 00 00       	mov    $0x4,%eax
8010295d:	ee                   	out    %al,(%dx)
8010295e:	89 ca                	mov    %ecx,%edx
80102960:	ec                   	in     (%dx),%al
80102961:	0f b6 c0             	movzbl %al,%eax
80102964:	89 da                	mov    %ebx,%edx
80102966:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102969:	b8 07 00 00 00       	mov    $0x7,%eax
8010296e:	ee                   	out    %al,(%dx)
8010296f:	89 ca                	mov    %ecx,%edx
80102971:	ec                   	in     (%dx),%al
80102972:	0f b6 c0             	movzbl %al,%eax
80102975:	89 da                	mov    %ebx,%edx
80102977:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010297a:	b8 08 00 00 00       	mov    $0x8,%eax
8010297f:	ee                   	out    %al,(%dx)
80102980:	89 ca                	mov    %ecx,%edx
80102982:	ec                   	in     (%dx),%al
80102983:	0f b6 c0             	movzbl %al,%eax
80102986:	89 da                	mov    %ebx,%edx
80102988:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010298b:	b8 09 00 00 00       	mov    $0x9,%eax
80102990:	ee                   	out    %al,(%dx)
80102991:	89 ca                	mov    %ecx,%edx
80102993:	ec                   	in     (%dx),%al
80102994:	0f b6 c0             	movzbl %al,%eax
80102997:	83 ec 04             	sub    $0x4,%esp
8010299a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010299d:	8d 45 d0             	lea    -0x30(%ebp),%eax
801029a0:	6a 18                	push   $0x18
801029a2:	50                   	push   %eax
801029a3:	8d 45 b8             	lea    -0x48(%ebp),%eax
801029a6:	50                   	push   %eax
801029a7:	e8 44 1d 00 00       	call   801046f0 <memcmp>
801029ac:	83 c4 10             	add    $0x10,%esp
801029af:	85 c0                	test   %eax,%eax
801029b1:	0f 85 f1 fe ff ff    	jne    801028a8 <cmostime+0x28>
801029b7:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
801029bb:	75 78                	jne    80102a35 <cmostime+0x1b5>
801029bd:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029c0:	89 c2                	mov    %eax,%edx
801029c2:	83 e0 0f             	and    $0xf,%eax
801029c5:	c1 ea 04             	shr    $0x4,%edx
801029c8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
801029d1:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029d4:	89 c2                	mov    %eax,%edx
801029d6:	83 e0 0f             	and    $0xf,%eax
801029d9:	c1 ea 04             	shr    $0x4,%edx
801029dc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029df:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029e2:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029e5:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e8:	89 c2                	mov    %eax,%edx
801029ea:	83 e0 0f             	and    $0xf,%eax
801029ed:	c1 ea 04             	shr    $0x4,%edx
801029f0:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029f3:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029f6:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029f9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029fc:	89 c2                	mov    %eax,%edx
801029fe:	83 e0 0f             	and    $0xf,%eax
80102a01:	c1 ea 04             	shr    $0x4,%edx
80102a04:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a07:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a0a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102a0d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a10:	89 c2                	mov    %eax,%edx
80102a12:	83 e0 0f             	and    $0xf,%eax
80102a15:	c1 ea 04             	shr    $0x4,%edx
80102a18:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a1b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a1e:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102a21:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a24:	89 c2                	mov    %eax,%edx
80102a26:	83 e0 0f             	and    $0xf,%eax
80102a29:	c1 ea 04             	shr    $0x4,%edx
80102a2c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a2f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a32:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102a35:	8b 75 08             	mov    0x8(%ebp),%esi
80102a38:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a3b:	89 06                	mov    %eax,(%esi)
80102a3d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a40:	89 46 04             	mov    %eax,0x4(%esi)
80102a43:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a46:	89 46 08             	mov    %eax,0x8(%esi)
80102a49:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a4c:	89 46 0c             	mov    %eax,0xc(%esi)
80102a4f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a52:	89 46 10             	mov    %eax,0x10(%esi)
80102a55:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a58:	89 46 14             	mov    %eax,0x14(%esi)
80102a5b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102a62:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a65:	5b                   	pop    %ebx
80102a66:	5e                   	pop    %esi
80102a67:	5f                   	pop    %edi
80102a68:	5d                   	pop    %ebp
80102a69:	c3                   	ret    
80102a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102a70 <unixtime>:
80102a70:	55                   	push   %ebp
80102a71:	89 e5                	mov    %esp,%ebp
80102a73:	83 ec 34             	sub    $0x34,%esp
80102a76:	8d 45 e0             	lea    -0x20(%ebp),%eax
80102a79:	50                   	push   %eax
80102a7a:	e8 01 fe ff ff       	call   80102880 <cmostime>
80102a7f:	69 55 f4 80 33 e1 01 	imul   $0x1e13380,-0xc(%ebp),%edx
80102a86:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102a89:	8d 84 02 00 b1 01 89 	lea    -0x76fe4f00(%edx,%eax,1),%eax
80102a90:	69 55 f0 00 8d 27 00 	imul   $0x278d00,-0x10(%ebp),%edx
80102a97:	01 d0                	add    %edx,%eax
80102a99:	69 55 ec 80 51 01 00 	imul   $0x15180,-0x14(%ebp),%edx
80102aa0:	01 d0                	add    %edx,%eax
80102aa2:	69 55 e8 10 0e 00 00 	imul   $0xe10,-0x18(%ebp),%edx
80102aa9:	01 d0                	add    %edx,%eax
80102aab:	6b 55 e4 3c          	imul   $0x3c,-0x1c(%ebp),%edx
80102aaf:	c9                   	leave  
80102ab0:	01 d0                	add    %edx,%eax
80102ab2:	c3                   	ret    
80102ab3:	66 90                	xchg   %ax,%ax
80102ab5:	66 90                	xchg   %ax,%ax
80102ab7:	66 90                	xchg   %ax,%ax
80102ab9:	66 90                	xchg   %ax,%ax
80102abb:	66 90                	xchg   %ax,%ax
80102abd:	66 90                	xchg   %ax,%ax
80102abf:	90                   	nop

80102ac0 <install_trans>:
80102ac0:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102ac6:	85 c9                	test   %ecx,%ecx
80102ac8:	0f 8e 8a 00 00 00    	jle    80102b58 <install_trans+0x98>
80102ace:	55                   	push   %ebp
80102acf:	89 e5                	mov    %esp,%ebp
80102ad1:	57                   	push   %edi
80102ad2:	56                   	push   %esi
80102ad3:	53                   	push   %ebx
80102ad4:	31 db                	xor    %ebx,%ebx
80102ad6:	83 ec 0c             	sub    $0xc,%esp
80102ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ae0:	a1 94 30 11 80       	mov    0x80113094,%eax
80102ae5:	83 ec 08             	sub    $0x8,%esp
80102ae8:	01 d8                	add    %ebx,%eax
80102aea:	83 c0 01             	add    $0x1,%eax
80102aed:	50                   	push   %eax
80102aee:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102af4:	e8 d7 d5 ff ff       	call   801000d0 <bread>
80102af9:	89 c7                	mov    %eax,%edi
80102afb:	58                   	pop    %eax
80102afc:	5a                   	pop    %edx
80102afd:	ff 34 9d ac 30 11 80 	pushl  -0x7feecf54(,%ebx,4)
80102b04:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102b0a:	83 c3 01             	add    $0x1,%ebx
80102b0d:	e8 be d5 ff ff       	call   801000d0 <bread>
80102b12:	89 c6                	mov    %eax,%esi
80102b14:	8d 47 5c             	lea    0x5c(%edi),%eax
80102b17:	83 c4 0c             	add    $0xc,%esp
80102b1a:	68 00 02 00 00       	push   $0x200
80102b1f:	50                   	push   %eax
80102b20:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b23:	50                   	push   %eax
80102b24:	e8 27 1c 00 00       	call   80104750 <memmove>
80102b29:	89 34 24             	mov    %esi,(%esp)
80102b2c:	e8 6f d6 ff ff       	call   801001a0 <bwrite>
80102b31:	89 3c 24             	mov    %edi,(%esp)
80102b34:	e8 a7 d6 ff ff       	call   801001e0 <brelse>
80102b39:	89 34 24             	mov    %esi,(%esp)
80102b3c:	e8 9f d6 ff ff       	call   801001e0 <brelse>
80102b41:	83 c4 10             	add    $0x10,%esp
80102b44:	39 1d a8 30 11 80    	cmp    %ebx,0x801130a8
80102b4a:	7f 94                	jg     80102ae0 <install_trans+0x20>
80102b4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b4f:	5b                   	pop    %ebx
80102b50:	5e                   	pop    %esi
80102b51:	5f                   	pop    %edi
80102b52:	5d                   	pop    %ebp
80102b53:	c3                   	ret    
80102b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b58:	f3 c3                	repz ret 
80102b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102b60 <write_head>:
80102b60:	55                   	push   %ebp
80102b61:	89 e5                	mov    %esp,%ebp
80102b63:	56                   	push   %esi
80102b64:	53                   	push   %ebx
80102b65:	83 ec 08             	sub    $0x8,%esp
80102b68:	ff 35 94 30 11 80    	pushl  0x80113094
80102b6e:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102b74:	e8 57 d5 ff ff       	call   801000d0 <bread>
80102b79:	8b 1d a8 30 11 80    	mov    0x801130a8,%ebx
80102b7f:	83 c4 10             	add    $0x10,%esp
80102b82:	89 c6                	mov    %eax,%esi
80102b84:	85 db                	test   %ebx,%ebx
80102b86:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102b89:	7e 16                	jle    80102ba1 <write_head+0x41>
80102b8b:	c1 e3 02             	shl    $0x2,%ebx
80102b8e:	31 d2                	xor    %edx,%edx
80102b90:	8b 8a ac 30 11 80    	mov    -0x7feecf54(%edx),%ecx
80102b96:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102b9a:	83 c2 04             	add    $0x4,%edx
80102b9d:	39 da                	cmp    %ebx,%edx
80102b9f:	75 ef                	jne    80102b90 <write_head+0x30>
80102ba1:	83 ec 0c             	sub    $0xc,%esp
80102ba4:	56                   	push   %esi
80102ba5:	e8 f6 d5 ff ff       	call   801001a0 <bwrite>
80102baa:	89 34 24             	mov    %esi,(%esp)
80102bad:	e8 2e d6 ff ff       	call   801001e0 <brelse>
80102bb2:	83 c4 10             	add    $0x10,%esp
80102bb5:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102bb8:	5b                   	pop    %ebx
80102bb9:	5e                   	pop    %esi
80102bba:	5d                   	pop    %ebp
80102bbb:	c3                   	ret    
80102bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102bc0 <initlog>:
80102bc0:	55                   	push   %ebp
80102bc1:	89 e5                	mov    %esp,%ebp
80102bc3:	53                   	push   %ebx
80102bc4:	83 ec 2c             	sub    $0x2c,%esp
80102bc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102bca:	68 60 78 10 80       	push   $0x80107860
80102bcf:	68 60 30 11 80       	push   $0x80113060
80102bd4:	e8 77 18 00 00       	call   80104450 <initlock>
80102bd9:	58                   	pop    %eax
80102bda:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102bdd:	5a                   	pop    %edx
80102bde:	50                   	push   %eax
80102bdf:	53                   	push   %ebx
80102be0:	e8 cb e8 ff ff       	call   801014b0 <readsb>
80102be5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102be8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102beb:	59                   	pop    %ecx
80102bec:	89 1d a4 30 11 80    	mov    %ebx,0x801130a4
80102bf2:	89 15 98 30 11 80    	mov    %edx,0x80113098
80102bf8:	a3 94 30 11 80       	mov    %eax,0x80113094
80102bfd:	5a                   	pop    %edx
80102bfe:	50                   	push   %eax
80102bff:	53                   	push   %ebx
80102c00:	e8 cb d4 ff ff       	call   801000d0 <bread>
80102c05:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102c08:	83 c4 10             	add    $0x10,%esp
80102c0b:	85 db                	test   %ebx,%ebx
80102c0d:	89 1d a8 30 11 80    	mov    %ebx,0x801130a8
80102c13:	7e 1c                	jle    80102c31 <initlog+0x71>
80102c15:	c1 e3 02             	shl    $0x2,%ebx
80102c18:	31 d2                	xor    %edx,%edx
80102c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102c20:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102c24:	83 c2 04             	add    $0x4,%edx
80102c27:	89 8a a8 30 11 80    	mov    %ecx,-0x7feecf58(%edx)
80102c2d:	39 d3                	cmp    %edx,%ebx
80102c2f:	75 ef                	jne    80102c20 <initlog+0x60>
80102c31:	83 ec 0c             	sub    $0xc,%esp
80102c34:	50                   	push   %eax
80102c35:	e8 a6 d5 ff ff       	call   801001e0 <brelse>
80102c3a:	e8 81 fe ff ff       	call   80102ac0 <install_trans>
80102c3f:	c7 05 a8 30 11 80 00 	movl   $0x0,0x801130a8
80102c46:	00 00 00 
80102c49:	e8 12 ff ff ff       	call   80102b60 <write_head>
80102c4e:	83 c4 10             	add    $0x10,%esp
80102c51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c54:	c9                   	leave  
80102c55:	c3                   	ret    
80102c56:	8d 76 00             	lea    0x0(%esi),%esi
80102c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c60 <begin_op>:
80102c60:	55                   	push   %ebp
80102c61:	89 e5                	mov    %esp,%ebp
80102c63:	83 ec 14             	sub    $0x14,%esp
80102c66:	68 60 30 11 80       	push   $0x80113060
80102c6b:	e8 20 19 00 00       	call   80104590 <acquire>
80102c70:	83 c4 10             	add    $0x10,%esp
80102c73:	eb 18                	jmp    80102c8d <begin_op+0x2d>
80102c75:	8d 76 00             	lea    0x0(%esi),%esi
80102c78:	83 ec 08             	sub    $0x8,%esp
80102c7b:	68 60 30 11 80       	push   $0x80113060
80102c80:	68 60 30 11 80       	push   $0x80113060
80102c85:	e8 66 12 00 00       	call   80103ef0 <sleep>
80102c8a:	83 c4 10             	add    $0x10,%esp
80102c8d:	a1 a0 30 11 80       	mov    0x801130a0,%eax
80102c92:	85 c0                	test   %eax,%eax
80102c94:	75 e2                	jne    80102c78 <begin_op+0x18>
80102c96:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102c9b:	8b 15 a8 30 11 80    	mov    0x801130a8,%edx
80102ca1:	83 c0 01             	add    $0x1,%eax
80102ca4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102ca7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102caa:	83 fa 1e             	cmp    $0x1e,%edx
80102cad:	7f c9                	jg     80102c78 <begin_op+0x18>
80102caf:	83 ec 0c             	sub    $0xc,%esp
80102cb2:	a3 9c 30 11 80       	mov    %eax,0x8011309c
80102cb7:	68 60 30 11 80       	push   $0x80113060
80102cbc:	e8 8f 19 00 00       	call   80104650 <release>
80102cc1:	83 c4 10             	add    $0x10,%esp
80102cc4:	c9                   	leave  
80102cc5:	c3                   	ret    
80102cc6:	8d 76 00             	lea    0x0(%esi),%esi
80102cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102cd0 <end_op>:
80102cd0:	55                   	push   %ebp
80102cd1:	89 e5                	mov    %esp,%ebp
80102cd3:	57                   	push   %edi
80102cd4:	56                   	push   %esi
80102cd5:	53                   	push   %ebx
80102cd6:	83 ec 18             	sub    $0x18,%esp
80102cd9:	68 60 30 11 80       	push   $0x80113060
80102cde:	e8 ad 18 00 00       	call   80104590 <acquire>
80102ce3:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102ce8:	8b 35 a0 30 11 80    	mov    0x801130a0,%esi
80102cee:	83 c4 10             	add    $0x10,%esp
80102cf1:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102cf4:	85 f6                	test   %esi,%esi
80102cf6:	89 1d 9c 30 11 80    	mov    %ebx,0x8011309c
80102cfc:	0f 85 1a 01 00 00    	jne    80102e1c <end_op+0x14c>
80102d02:	85 db                	test   %ebx,%ebx
80102d04:	0f 85 ee 00 00 00    	jne    80102df8 <end_op+0x128>
80102d0a:	83 ec 0c             	sub    $0xc,%esp
80102d0d:	c7 05 a0 30 11 80 01 	movl   $0x1,0x801130a0
80102d14:	00 00 00 
80102d17:	68 60 30 11 80       	push   $0x80113060
80102d1c:	e8 2f 19 00 00       	call   80104650 <release>
80102d21:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102d27:	83 c4 10             	add    $0x10,%esp
80102d2a:	85 c9                	test   %ecx,%ecx
80102d2c:	0f 8e 85 00 00 00    	jle    80102db7 <end_op+0xe7>
80102d32:	a1 94 30 11 80       	mov    0x80113094,%eax
80102d37:	83 ec 08             	sub    $0x8,%esp
80102d3a:	01 d8                	add    %ebx,%eax
80102d3c:	83 c0 01             	add    $0x1,%eax
80102d3f:	50                   	push   %eax
80102d40:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102d46:	e8 85 d3 ff ff       	call   801000d0 <bread>
80102d4b:	89 c6                	mov    %eax,%esi
80102d4d:	58                   	pop    %eax
80102d4e:	5a                   	pop    %edx
80102d4f:	ff 34 9d ac 30 11 80 	pushl  -0x7feecf54(,%ebx,4)
80102d56:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102d5c:	83 c3 01             	add    $0x1,%ebx
80102d5f:	e8 6c d3 ff ff       	call   801000d0 <bread>
80102d64:	89 c7                	mov    %eax,%edi
80102d66:	8d 40 5c             	lea    0x5c(%eax),%eax
80102d69:	83 c4 0c             	add    $0xc,%esp
80102d6c:	68 00 02 00 00       	push   $0x200
80102d71:	50                   	push   %eax
80102d72:	8d 46 5c             	lea    0x5c(%esi),%eax
80102d75:	50                   	push   %eax
80102d76:	e8 d5 19 00 00       	call   80104750 <memmove>
80102d7b:	89 34 24             	mov    %esi,(%esp)
80102d7e:	e8 1d d4 ff ff       	call   801001a0 <bwrite>
80102d83:	89 3c 24             	mov    %edi,(%esp)
80102d86:	e8 55 d4 ff ff       	call   801001e0 <brelse>
80102d8b:	89 34 24             	mov    %esi,(%esp)
80102d8e:	e8 4d d4 ff ff       	call   801001e0 <brelse>
80102d93:	83 c4 10             	add    $0x10,%esp
80102d96:	3b 1d a8 30 11 80    	cmp    0x801130a8,%ebx
80102d9c:	7c 94                	jl     80102d32 <end_op+0x62>
80102d9e:	e8 bd fd ff ff       	call   80102b60 <write_head>
80102da3:	e8 18 fd ff ff       	call   80102ac0 <install_trans>
80102da8:	c7 05 a8 30 11 80 00 	movl   $0x0,0x801130a8
80102daf:	00 00 00 
80102db2:	e8 a9 fd ff ff       	call   80102b60 <write_head>
80102db7:	83 ec 0c             	sub    $0xc,%esp
80102dba:	68 60 30 11 80       	push   $0x80113060
80102dbf:	e8 cc 17 00 00       	call   80104590 <acquire>
80102dc4:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102dcb:	c7 05 a0 30 11 80 00 	movl   $0x0,0x801130a0
80102dd2:	00 00 00 
80102dd5:	e8 d6 12 00 00       	call   801040b0 <wakeup>
80102dda:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102de1:	e8 6a 18 00 00       	call   80104650 <release>
80102de6:	83 c4 10             	add    $0x10,%esp
80102de9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dec:	5b                   	pop    %ebx
80102ded:	5e                   	pop    %esi
80102dee:	5f                   	pop    %edi
80102def:	5d                   	pop    %ebp
80102df0:	c3                   	ret    
80102df1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102df8:	83 ec 0c             	sub    $0xc,%esp
80102dfb:	68 60 30 11 80       	push   $0x80113060
80102e00:	e8 ab 12 00 00       	call   801040b0 <wakeup>
80102e05:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102e0c:	e8 3f 18 00 00       	call   80104650 <release>
80102e11:	83 c4 10             	add    $0x10,%esp
80102e14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e17:	5b                   	pop    %ebx
80102e18:	5e                   	pop    %esi
80102e19:	5f                   	pop    %edi
80102e1a:	5d                   	pop    %ebp
80102e1b:	c3                   	ret    
80102e1c:	83 ec 0c             	sub    $0xc,%esp
80102e1f:	68 64 78 10 80       	push   $0x80107864
80102e24:	e8 67 d5 ff ff       	call   80100390 <panic>
80102e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e30 <log_write>:
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	53                   	push   %ebx
80102e34:	83 ec 04             	sub    $0x4,%esp
80102e37:	8b 15 a8 30 11 80    	mov    0x801130a8,%edx
80102e3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e40:	83 fa 1d             	cmp    $0x1d,%edx
80102e43:	0f 8f 9d 00 00 00    	jg     80102ee6 <log_write+0xb6>
80102e49:	a1 98 30 11 80       	mov    0x80113098,%eax
80102e4e:	83 e8 01             	sub    $0x1,%eax
80102e51:	39 c2                	cmp    %eax,%edx
80102e53:	0f 8d 8d 00 00 00    	jge    80102ee6 <log_write+0xb6>
80102e59:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102e5e:	85 c0                	test   %eax,%eax
80102e60:	0f 8e 8d 00 00 00    	jle    80102ef3 <log_write+0xc3>
80102e66:	83 ec 0c             	sub    $0xc,%esp
80102e69:	68 60 30 11 80       	push   $0x80113060
80102e6e:	e8 1d 17 00 00       	call   80104590 <acquire>
80102e73:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102e79:	83 c4 10             	add    $0x10,%esp
80102e7c:	83 f9 00             	cmp    $0x0,%ecx
80102e7f:	7e 57                	jle    80102ed8 <log_write+0xa8>
80102e81:	8b 53 08             	mov    0x8(%ebx),%edx
80102e84:	31 c0                	xor    %eax,%eax
80102e86:	3b 15 ac 30 11 80    	cmp    0x801130ac,%edx
80102e8c:	75 0b                	jne    80102e99 <log_write+0x69>
80102e8e:	eb 38                	jmp    80102ec8 <log_write+0x98>
80102e90:	39 14 85 ac 30 11 80 	cmp    %edx,-0x7feecf54(,%eax,4)
80102e97:	74 2f                	je     80102ec8 <log_write+0x98>
80102e99:	83 c0 01             	add    $0x1,%eax
80102e9c:	39 c1                	cmp    %eax,%ecx
80102e9e:	75 f0                	jne    80102e90 <log_write+0x60>
80102ea0:	89 14 85 ac 30 11 80 	mov    %edx,-0x7feecf54(,%eax,4)
80102ea7:	83 c0 01             	add    $0x1,%eax
80102eaa:	a3 a8 30 11 80       	mov    %eax,0x801130a8
80102eaf:	83 0b 04             	orl    $0x4,(%ebx)
80102eb2:	c7 45 08 60 30 11 80 	movl   $0x80113060,0x8(%ebp)
80102eb9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ebc:	c9                   	leave  
80102ebd:	e9 8e 17 00 00       	jmp    80104650 <release>
80102ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102ec8:	89 14 85 ac 30 11 80 	mov    %edx,-0x7feecf54(,%eax,4)
80102ecf:	eb de                	jmp    80102eaf <log_write+0x7f>
80102ed1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ed8:	8b 43 08             	mov    0x8(%ebx),%eax
80102edb:	a3 ac 30 11 80       	mov    %eax,0x801130ac
80102ee0:	75 cd                	jne    80102eaf <log_write+0x7f>
80102ee2:	31 c0                	xor    %eax,%eax
80102ee4:	eb c1                	jmp    80102ea7 <log_write+0x77>
80102ee6:	83 ec 0c             	sub    $0xc,%esp
80102ee9:	68 73 78 10 80       	push   $0x80107873
80102eee:	e8 9d d4 ff ff       	call   80100390 <panic>
80102ef3:	83 ec 0c             	sub    $0xc,%esp
80102ef6:	68 89 78 10 80       	push   $0x80107889
80102efb:	e8 90 d4 ff ff       	call   80100390 <panic>

80102f00 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102f00:	55                   	push   %ebp
80102f01:	89 e5                	mov    %esp,%ebp
80102f03:	53                   	push   %ebx
80102f04:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102f07:	e8 a4 09 00 00       	call   801038b0 <cpuid>
80102f0c:	89 c3                	mov    %eax,%ebx
80102f0e:	e8 9d 09 00 00       	call   801038b0 <cpuid>
80102f13:	83 ec 04             	sub    $0x4,%esp
80102f16:	53                   	push   %ebx
80102f17:	50                   	push   %eax
80102f18:	68 a4 78 10 80       	push   $0x801078a4
80102f1d:	e8 3e d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102f22:	e8 e9 2a 00 00       	call   80105a10 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102f27:	e8 04 09 00 00       	call   80103830 <mycpu>
80102f2c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102f2e:	b8 01 00 00 00       	mov    $0x1,%eax
80102f33:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102f3a:	e8 81 0c 00 00       	call   80103bc0 <scheduler>
80102f3f:	90                   	nop

80102f40 <mpenter>:
{
80102f40:	55                   	push   %ebp
80102f41:	89 e5                	mov    %esp,%ebp
80102f43:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102f46:	e8 b5 3b 00 00       	call   80106b00 <switchkvm>
  seginit();
80102f4b:	e8 20 3b 00 00       	call   80106a70 <seginit>
  lapicinit();
80102f50:	e8 4b f7 ff ff       	call   801026a0 <lapicinit>
  mpmain();
80102f55:	e8 a6 ff ff ff       	call   80102f00 <mpmain>
80102f5a:	66 90                	xchg   %ax,%ax
80102f5c:	66 90                	xchg   %ax,%ax
80102f5e:	66 90                	xchg   %ax,%ax

80102f60 <main>:
{
80102f60:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102f64:	83 e4 f0             	and    $0xfffffff0,%esp
80102f67:	ff 71 fc             	pushl  -0x4(%ecx)
80102f6a:	55                   	push   %ebp
80102f6b:	89 e5                	mov    %esp,%ebp
80102f6d:	53                   	push   %ebx
80102f6e:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102f6f:	83 ec 08             	sub    $0x8,%esp
80102f72:	68 00 00 40 80       	push   $0x80400000
80102f77:	68 88 60 11 80       	push   $0x80116088
80102f7c:	e8 df f4 ff ff       	call   80102460 <kinit1>
  kvmalloc();      // kernel page table
80102f81:	e8 4a 40 00 00       	call   80106fd0 <kvmalloc>
  mpinit();        // detect other processors
80102f86:	e8 75 01 00 00       	call   80103100 <mpinit>
  lapicinit();     // interrupt controller
80102f8b:	e8 10 f7 ff ff       	call   801026a0 <lapicinit>
  seginit();       // segment descriptors
80102f90:	e8 db 3a 00 00       	call   80106a70 <seginit>
  picinit();       // disable pic
80102f95:	e8 46 03 00 00       	call   801032e0 <picinit>
  ioapicinit();    // another interrupt controller
80102f9a:	e8 f1 f2 ff ff       	call   80102290 <ioapicinit>
  consoleinit();   // console hardware
80102f9f:	e8 5c da ff ff       	call   80100a00 <consoleinit>
  uartinit();      // serial port
80102fa4:	e8 97 2d 00 00       	call   80105d40 <uartinit>
  pinit();         // process table
80102fa9:	e8 52 08 00 00       	call   80103800 <pinit>
  tvinit();        // trap vectors
80102fae:	e8 dd 29 00 00       	call   80105990 <tvinit>
  binit();         // buffer cache
80102fb3:	e8 88 d0 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102fb8:	e8 13 de ff ff       	call   80100dd0 <fileinit>
  ideinit();       // disk 
80102fbd:	e8 ae f0 ff ff       	call   80102070 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102fc2:	83 c4 0c             	add    $0xc,%esp
80102fc5:	68 8a 00 00 00       	push   $0x8a
80102fca:	68 90 a4 10 80       	push   $0x8010a490
80102fcf:	68 00 70 00 80       	push   $0x80007000
80102fd4:	e8 77 17 00 00       	call   80104750 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102fd9:	69 05 e0 36 11 80 b0 	imul   $0xb0,0x801136e0,%eax
80102fe0:	00 00 00 
80102fe3:	83 c4 10             	add    $0x10,%esp
80102fe6:	05 60 31 11 80       	add    $0x80113160,%eax
80102feb:	3d 60 31 11 80       	cmp    $0x80113160,%eax
80102ff0:	76 71                	jbe    80103063 <main+0x103>
80102ff2:	bb 60 31 11 80       	mov    $0x80113160,%ebx
80102ff7:	89 f6                	mov    %esi,%esi
80102ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == mycpu())  // We've started already.
80103000:	e8 2b 08 00 00       	call   80103830 <mycpu>
80103005:	39 d8                	cmp    %ebx,%eax
80103007:	74 41                	je     8010304a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80103009:	e8 22 f5 ff ff       	call   80102530 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
8010300e:	05 00 10 00 00       	add    $0x1000,%eax
    *(void(**)(void))(code-8) = mpenter;
80103013:	c7 05 f8 6f 00 80 40 	movl   $0x80102f40,0x80006ff8
8010301a:	2f 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
8010301d:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80103024:	90 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
80103027:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
8010302c:	0f b6 03             	movzbl (%ebx),%eax
8010302f:	83 ec 08             	sub    $0x8,%esp
80103032:	68 00 70 00 00       	push   $0x7000
80103037:	50                   	push   %eax
80103038:	e8 b3 f7 ff ff       	call   801027f0 <lapicstartap>
8010303d:	83 c4 10             	add    $0x10,%esp

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80103040:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103046:	85 c0                	test   %eax,%eax
80103048:	74 f6                	je     80103040 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
8010304a:	69 05 e0 36 11 80 b0 	imul   $0xb0,0x801136e0,%eax
80103051:	00 00 00 
80103054:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
8010305a:	05 60 31 11 80       	add    $0x80113160,%eax
8010305f:	39 c3                	cmp    %eax,%ebx
80103061:	72 9d                	jb     80103000 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103063:	83 ec 08             	sub    $0x8,%esp
80103066:	68 00 00 00 8e       	push   $0x8e000000
8010306b:	68 00 00 40 80       	push   $0x80400000
80103070:	e8 5b f4 ff ff       	call   801024d0 <kinit2>
  userinit();      // first user process
80103075:	e8 86 08 00 00       	call   80103900 <userinit>
  mpmain();        // finish this processor's setup
8010307a:	e8 81 fe ff ff       	call   80102f00 <mpmain>
8010307f:	90                   	nop

80103080 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103080:	55                   	push   %ebp
80103081:	89 e5                	mov    %esp,%ebp
80103083:	57                   	push   %edi
80103084:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103085:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
8010308b:	53                   	push   %ebx
  e = addr+len;
8010308c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
8010308f:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80103092:	39 de                	cmp    %ebx,%esi
80103094:	72 10                	jb     801030a6 <mpsearch1+0x26>
80103096:	eb 50                	jmp    801030e8 <mpsearch1+0x68>
80103098:	90                   	nop
80103099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030a0:	39 fb                	cmp    %edi,%ebx
801030a2:	89 fe                	mov    %edi,%esi
801030a4:	76 42                	jbe    801030e8 <mpsearch1+0x68>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801030a6:	83 ec 04             	sub    $0x4,%esp
801030a9:	8d 7e 10             	lea    0x10(%esi),%edi
801030ac:	6a 04                	push   $0x4
801030ae:	68 b8 78 10 80       	push   $0x801078b8
801030b3:	56                   	push   %esi
801030b4:	e8 37 16 00 00       	call   801046f0 <memcmp>
801030b9:	83 c4 10             	add    $0x10,%esp
801030bc:	85 c0                	test   %eax,%eax
801030be:	75 e0                	jne    801030a0 <mpsearch1+0x20>
801030c0:	89 f1                	mov    %esi,%ecx
801030c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    sum += addr[i];
801030c8:	0f b6 11             	movzbl (%ecx),%edx
801030cb:	83 c1 01             	add    $0x1,%ecx
801030ce:	01 d0                	add    %edx,%eax
  for(i=0; i<len; i++)
801030d0:	39 f9                	cmp    %edi,%ecx
801030d2:	75 f4                	jne    801030c8 <mpsearch1+0x48>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801030d4:	84 c0                	test   %al,%al
801030d6:	75 c8                	jne    801030a0 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
801030d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030db:	89 f0                	mov    %esi,%eax
801030dd:	5b                   	pop    %ebx
801030de:	5e                   	pop    %esi
801030df:	5f                   	pop    %edi
801030e0:	5d                   	pop    %ebp
801030e1:	c3                   	ret    
801030e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801030eb:	31 f6                	xor    %esi,%esi
}
801030ed:	89 f0                	mov    %esi,%eax
801030ef:	5b                   	pop    %ebx
801030f0:	5e                   	pop    %esi
801030f1:	5f                   	pop    %edi
801030f2:	5d                   	pop    %ebp
801030f3:	c3                   	ret    
801030f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801030fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103100 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103100:	55                   	push   %ebp
80103101:	89 e5                	mov    %esp,%ebp
80103103:	57                   	push   %edi
80103104:	56                   	push   %esi
80103105:	53                   	push   %ebx
80103106:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103109:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103110:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103117:	c1 e0 08             	shl    $0x8,%eax
8010311a:	09 d0                	or     %edx,%eax
8010311c:	c1 e0 04             	shl    $0x4,%eax
8010311f:	85 c0                	test   %eax,%eax
80103121:	75 1b                	jne    8010313e <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103123:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010312a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103131:	c1 e0 08             	shl    $0x8,%eax
80103134:	09 d0                	or     %edx,%eax
80103136:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103139:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
8010313e:	ba 00 04 00 00       	mov    $0x400,%edx
80103143:	e8 38 ff ff ff       	call   80103080 <mpsearch1>
80103148:	85 c0                	test   %eax,%eax
8010314a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010314d:	0f 84 3d 01 00 00    	je     80103290 <mpinit+0x190>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103153:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103156:	8b 58 04             	mov    0x4(%eax),%ebx
80103159:	85 db                	test   %ebx,%ebx
8010315b:	0f 84 4f 01 00 00    	je     801032b0 <mpinit+0x1b0>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103161:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103167:	83 ec 04             	sub    $0x4,%esp
8010316a:	6a 04                	push   $0x4
8010316c:	68 d5 78 10 80       	push   $0x801078d5
80103171:	56                   	push   %esi
80103172:	e8 79 15 00 00       	call   801046f0 <memcmp>
80103177:	83 c4 10             	add    $0x10,%esp
8010317a:	85 c0                	test   %eax,%eax
8010317c:	0f 85 2e 01 00 00    	jne    801032b0 <mpinit+0x1b0>
  if(conf->version != 1 && conf->version != 4)
80103182:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103189:	3c 01                	cmp    $0x1,%al
8010318b:	0f 95 c2             	setne  %dl
8010318e:	3c 04                	cmp    $0x4,%al
80103190:	0f 95 c0             	setne  %al
80103193:	20 c2                	and    %al,%dl
80103195:	0f 85 15 01 00 00    	jne    801032b0 <mpinit+0x1b0>
  if(sum((uchar*)conf, conf->length) != 0)
8010319b:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
  for(i=0; i<len; i++)
801031a2:	66 85 ff             	test   %di,%di
801031a5:	74 1a                	je     801031c1 <mpinit+0xc1>
801031a7:	89 f0                	mov    %esi,%eax
801031a9:	01 f7                	add    %esi,%edi
  sum = 0;
801031ab:	31 d2                	xor    %edx,%edx
801031ad:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
801031b0:	0f b6 08             	movzbl (%eax),%ecx
801031b3:	83 c0 01             	add    $0x1,%eax
801031b6:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
801031b8:	39 c7                	cmp    %eax,%edi
801031ba:	75 f4                	jne    801031b0 <mpinit+0xb0>
801031bc:	84 d2                	test   %dl,%dl
801031be:	0f 95 c2             	setne  %dl
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801031c1:	85 f6                	test   %esi,%esi
801031c3:	0f 84 e7 00 00 00    	je     801032b0 <mpinit+0x1b0>
801031c9:	84 d2                	test   %dl,%dl
801031cb:	0f 85 df 00 00 00    	jne    801032b0 <mpinit+0x1b0>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801031d1:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801031d7:	a3 5c 30 11 80       	mov    %eax,0x8011305c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031dc:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801031e3:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  ismp = 1;
801031e9:	bb 01 00 00 00       	mov    $0x1,%ebx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031ee:	01 d6                	add    %edx,%esi
801031f0:	39 c6                	cmp    %eax,%esi
801031f2:	76 23                	jbe    80103217 <mpinit+0x117>
    switch(*p){
801031f4:	0f b6 10             	movzbl (%eax),%edx
801031f7:	80 fa 04             	cmp    $0x4,%dl
801031fa:	0f 87 ca 00 00 00    	ja     801032ca <mpinit+0x1ca>
80103200:	ff 24 95 fc 78 10 80 	jmp    *-0x7fef8704(,%edx,4)
80103207:	89 f6                	mov    %esi,%esi
80103209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103210:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103213:	39 c6                	cmp    %eax,%esi
80103215:	77 dd                	ja     801031f4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103217:	85 db                	test   %ebx,%ebx
80103219:	0f 84 9e 00 00 00    	je     801032bd <mpinit+0x1bd>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010321f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103222:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103226:	74 15                	je     8010323d <mpinit+0x13d>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103228:	b8 70 00 00 00       	mov    $0x70,%eax
8010322d:	ba 22 00 00 00       	mov    $0x22,%edx
80103232:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103233:	ba 23 00 00 00       	mov    $0x23,%edx
80103238:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103239:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010323c:	ee                   	out    %al,(%dx)
  }
}
8010323d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103240:	5b                   	pop    %ebx
80103241:	5e                   	pop    %esi
80103242:	5f                   	pop    %edi
80103243:	5d                   	pop    %ebp
80103244:	c3                   	ret    
80103245:	8d 76 00             	lea    0x0(%esi),%esi
      if(ncpu < NCPU) {
80103248:	8b 0d e0 36 11 80    	mov    0x801136e0,%ecx
8010324e:	83 f9 07             	cmp    $0x7,%ecx
80103251:	7f 19                	jg     8010326c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103253:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103257:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010325d:	83 c1 01             	add    $0x1,%ecx
80103260:	89 0d e0 36 11 80    	mov    %ecx,0x801136e0
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103266:	88 97 60 31 11 80    	mov    %dl,-0x7feecea0(%edi)
      p += sizeof(struct mpproc);
8010326c:	83 c0 14             	add    $0x14,%eax
      continue;
8010326f:	e9 7c ff ff ff       	jmp    801031f0 <mpinit+0xf0>
80103274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
80103278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010327c:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
8010327f:	88 15 40 31 11 80    	mov    %dl,0x80113140
      continue;
80103285:	e9 66 ff ff ff       	jmp    801031f0 <mpinit+0xf0>
8010328a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return mpsearch1(0xF0000, 0x10000);
80103290:	ba 00 00 01 00       	mov    $0x10000,%edx
80103295:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010329a:	e8 e1 fd ff ff       	call   80103080 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010329f:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
801032a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801032a4:	0f 85 a9 fe ff ff    	jne    80103153 <mpinit+0x53>
801032aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("Expect to run on an SMP");
801032b0:	83 ec 0c             	sub    $0xc,%esp
801032b3:	68 bd 78 10 80       	push   $0x801078bd
801032b8:	e8 d3 d0 ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
801032bd:	83 ec 0c             	sub    $0xc,%esp
801032c0:	68 dc 78 10 80       	push   $0x801078dc
801032c5:	e8 c6 d0 ff ff       	call   80100390 <panic>
      ismp = 0;
801032ca:	31 db                	xor    %ebx,%ebx
801032cc:	e9 26 ff ff ff       	jmp    801031f7 <mpinit+0xf7>
801032d1:	66 90                	xchg   %ax,%ax
801032d3:	66 90                	xchg   %ax,%ax
801032d5:	66 90                	xchg   %ax,%ax
801032d7:	66 90                	xchg   %ax,%ax
801032d9:	66 90                	xchg   %ax,%ax
801032db:	66 90                	xchg   %ax,%ax
801032dd:	66 90                	xchg   %ax,%ax
801032df:	90                   	nop

801032e0 <picinit>:
801032e0:	55                   	push   %ebp
801032e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032e6:	ba 21 00 00 00       	mov    $0x21,%edx
801032eb:	89 e5                	mov    %esp,%ebp
801032ed:	ee                   	out    %al,(%dx)
801032ee:	ba a1 00 00 00       	mov    $0xa1,%edx
801032f3:	ee                   	out    %al,(%dx)
801032f4:	5d                   	pop    %ebp
801032f5:	c3                   	ret    
801032f6:	66 90                	xchg   %ax,%ax
801032f8:	66 90                	xchg   %ax,%ax
801032fa:	66 90                	xchg   %ax,%ax
801032fc:	66 90                	xchg   %ax,%ax
801032fe:	66 90                	xchg   %ax,%ax

80103300 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103300:	55                   	push   %ebp
80103301:	89 e5                	mov    %esp,%ebp
80103303:	57                   	push   %edi
80103304:	56                   	push   %esi
80103305:	53                   	push   %ebx
80103306:	83 ec 0c             	sub    $0xc,%esp
80103309:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010330c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010330f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103315:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010331b:	e8 d0 da ff ff       	call   80100df0 <filealloc>
80103320:	85 c0                	test   %eax,%eax
80103322:	89 03                	mov    %eax,(%ebx)
80103324:	74 22                	je     80103348 <pipealloc+0x48>
80103326:	e8 c5 da ff ff       	call   80100df0 <filealloc>
8010332b:	85 c0                	test   %eax,%eax
8010332d:	89 06                	mov    %eax,(%esi)
8010332f:	74 3f                	je     80103370 <pipealloc+0x70>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103331:	e8 fa f1 ff ff       	call   80102530 <kalloc>
80103336:	85 c0                	test   %eax,%eax
80103338:	89 c7                	mov    %eax,%edi
8010333a:	75 54                	jne    80103390 <pipealloc+0x90>

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
8010333c:	8b 03                	mov    (%ebx),%eax
8010333e:	85 c0                	test   %eax,%eax
80103340:	75 34                	jne    80103376 <pipealloc+0x76>
80103342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    fileclose(*f0);
  if(*f1)
80103348:	8b 06                	mov    (%esi),%eax
8010334a:	85 c0                	test   %eax,%eax
8010334c:	74 0c                	je     8010335a <pipealloc+0x5a>
    fileclose(*f1);
8010334e:	83 ec 0c             	sub    $0xc,%esp
80103351:	50                   	push   %eax
80103352:	e8 59 db ff ff       	call   80100eb0 <fileclose>
80103357:	83 c4 10             	add    $0x10,%esp
  return -1;
}
8010335a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010335d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103362:	5b                   	pop    %ebx
80103363:	5e                   	pop    %esi
80103364:	5f                   	pop    %edi
80103365:	5d                   	pop    %ebp
80103366:	c3                   	ret    
80103367:	89 f6                	mov    %esi,%esi
80103369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(*f0)
80103370:	8b 03                	mov    (%ebx),%eax
80103372:	85 c0                	test   %eax,%eax
80103374:	74 e4                	je     8010335a <pipealloc+0x5a>
    fileclose(*f0);
80103376:	83 ec 0c             	sub    $0xc,%esp
80103379:	50                   	push   %eax
8010337a:	e8 31 db ff ff       	call   80100eb0 <fileclose>
  if(*f1)
8010337f:	8b 06                	mov    (%esi),%eax
    fileclose(*f0);
80103381:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103384:	85 c0                	test   %eax,%eax
80103386:	75 c6                	jne    8010334e <pipealloc+0x4e>
80103388:	eb d0                	jmp    8010335a <pipealloc+0x5a>
8010338a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  initlock(&p->lock, "pipe");
80103390:	83 ec 08             	sub    $0x8,%esp
  p->readopen = 1;
80103393:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010339a:	00 00 00 
  p->writeopen = 1;
8010339d:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801033a4:	00 00 00 
  p->nwrite = 0;
801033a7:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801033ae:	00 00 00 
  p->nread = 0;
801033b1:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801033b8:	00 00 00 
  initlock(&p->lock, "pipe");
801033bb:	68 10 79 10 80       	push   $0x80107910
801033c0:	50                   	push   %eax
801033c1:	e8 8a 10 00 00       	call   80104450 <initlock>
  (*f0)->type = FD_PIPE;
801033c6:	8b 03                	mov    (%ebx),%eax
  return 0;
801033c8:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
801033cb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801033d1:	8b 03                	mov    (%ebx),%eax
801033d3:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801033d7:	8b 03                	mov    (%ebx),%eax
801033d9:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801033dd:	8b 03                	mov    (%ebx),%eax
801033df:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801033e2:	8b 06                	mov    (%esi),%eax
801033e4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801033ea:	8b 06                	mov    (%esi),%eax
801033ec:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801033f0:	8b 06                	mov    (%esi),%eax
801033f2:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801033f6:	8b 06                	mov    (%esi),%eax
801033f8:	89 78 0c             	mov    %edi,0xc(%eax)
}
801033fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801033fe:	31 c0                	xor    %eax,%eax
}
80103400:	5b                   	pop    %ebx
80103401:	5e                   	pop    %esi
80103402:	5f                   	pop    %edi
80103403:	5d                   	pop    %ebp
80103404:	c3                   	ret    
80103405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103410 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103410:	55                   	push   %ebp
80103411:	89 e5                	mov    %esp,%ebp
80103413:	56                   	push   %esi
80103414:	53                   	push   %ebx
80103415:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103418:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010341b:	83 ec 0c             	sub    $0xc,%esp
8010341e:	53                   	push   %ebx
8010341f:	e8 6c 11 00 00       	call   80104590 <acquire>
  if(writable){
80103424:	83 c4 10             	add    $0x10,%esp
80103427:	85 f6                	test   %esi,%esi
80103429:	74 45                	je     80103470 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010342b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103431:	83 ec 0c             	sub    $0xc,%esp
    p->writeopen = 0;
80103434:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010343b:	00 00 00 
    wakeup(&p->nread);
8010343e:	50                   	push   %eax
8010343f:	e8 6c 0c 00 00       	call   801040b0 <wakeup>
80103444:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103447:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010344d:	85 d2                	test   %edx,%edx
8010344f:	75 0a                	jne    8010345b <pipeclose+0x4b>
80103451:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103457:	85 c0                	test   %eax,%eax
80103459:	74 35                	je     80103490 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010345b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010345e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103461:	5b                   	pop    %ebx
80103462:	5e                   	pop    %esi
80103463:	5d                   	pop    %ebp
    release(&p->lock);
80103464:	e9 e7 11 00 00       	jmp    80104650 <release>
80103469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
80103470:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103476:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
80103479:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103480:	00 00 00 
    wakeup(&p->nwrite);
80103483:	50                   	push   %eax
80103484:	e8 27 0c 00 00       	call   801040b0 <wakeup>
80103489:	83 c4 10             	add    $0x10,%esp
8010348c:	eb b9                	jmp    80103447 <pipeclose+0x37>
8010348e:	66 90                	xchg   %ax,%ax
    release(&p->lock);
80103490:	83 ec 0c             	sub    $0xc,%esp
80103493:	53                   	push   %ebx
80103494:	e8 b7 11 00 00       	call   80104650 <release>
    kfree((char*)p);
80103499:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010349c:	83 c4 10             	add    $0x10,%esp
}
8010349f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034a2:	5b                   	pop    %ebx
801034a3:	5e                   	pop    %esi
801034a4:	5d                   	pop    %ebp
    kfree((char*)p);
801034a5:	e9 d6 ee ff ff       	jmp    80102380 <kfree>
801034aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801034b0 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801034b0:	55                   	push   %ebp
801034b1:	89 e5                	mov    %esp,%ebp
801034b3:	57                   	push   %edi
801034b4:	56                   	push   %esi
801034b5:	53                   	push   %ebx
801034b6:	83 ec 28             	sub    $0x28,%esp
801034b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
801034bc:	53                   	push   %ebx
801034bd:	e8 ce 10 00 00       	call   80104590 <acquire>
  for(i = 0; i < n; i++){
801034c2:	8b 45 10             	mov    0x10(%ebp),%eax
801034c5:	83 c4 10             	add    $0x10,%esp
801034c8:	85 c0                	test   %eax,%eax
801034ca:	0f 8e c9 00 00 00    	jle    80103599 <pipewrite+0xe9>
801034d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801034d3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801034d9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801034df:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801034e2:	03 4d 10             	add    0x10(%ebp),%ecx
801034e5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034e8:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801034ee:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801034f4:	39 d0                	cmp    %edx,%eax
801034f6:	75 71                	jne    80103569 <pipewrite+0xb9>
      if(p->readopen == 0 || myproc()->killed){
801034f8:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801034fe:	85 c0                	test   %eax,%eax
80103500:	74 4e                	je     80103550 <pipewrite+0xa0>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103502:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103508:	eb 3a                	jmp    80103544 <pipewrite+0x94>
8010350a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      wakeup(&p->nread);
80103510:	83 ec 0c             	sub    $0xc,%esp
80103513:	57                   	push   %edi
80103514:	e8 97 0b 00 00       	call   801040b0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103519:	5a                   	pop    %edx
8010351a:	59                   	pop    %ecx
8010351b:	53                   	push   %ebx
8010351c:	56                   	push   %esi
8010351d:	e8 ce 09 00 00       	call   80103ef0 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103522:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103528:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010352e:	83 c4 10             	add    $0x10,%esp
80103531:	05 00 02 00 00       	add    $0x200,%eax
80103536:	39 c2                	cmp    %eax,%edx
80103538:	75 36                	jne    80103570 <pipewrite+0xc0>
      if(p->readopen == 0 || myproc()->killed){
8010353a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103540:	85 c0                	test   %eax,%eax
80103542:	74 0c                	je     80103550 <pipewrite+0xa0>
80103544:	e8 87 03 00 00       	call   801038d0 <myproc>
80103549:	8b 40 24             	mov    0x24(%eax),%eax
8010354c:	85 c0                	test   %eax,%eax
8010354e:	74 c0                	je     80103510 <pipewrite+0x60>
        release(&p->lock);
80103550:	83 ec 0c             	sub    $0xc,%esp
80103553:	53                   	push   %ebx
80103554:	e8 f7 10 00 00       	call   80104650 <release>
        return -1;
80103559:	83 c4 10             	add    $0x10,%esp
8010355c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103561:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103564:	5b                   	pop    %ebx
80103565:	5e                   	pop    %esi
80103566:	5f                   	pop    %edi
80103567:	5d                   	pop    %ebp
80103568:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103569:	89 c2                	mov    %eax,%edx
8010356b:	90                   	nop
8010356c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103570:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80103573:	8d 42 01             	lea    0x1(%edx),%eax
80103576:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010357c:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103582:	83 c6 01             	add    $0x1,%esi
80103585:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
  for(i = 0; i < n; i++){
80103589:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010358c:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
8010358f:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
80103593:	0f 85 4f ff ff ff    	jne    801034e8 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103599:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010359f:	83 ec 0c             	sub    $0xc,%esp
801035a2:	50                   	push   %eax
801035a3:	e8 08 0b 00 00       	call   801040b0 <wakeup>
  release(&p->lock);
801035a8:	89 1c 24             	mov    %ebx,(%esp)
801035ab:	e8 a0 10 00 00       	call   80104650 <release>
  return n;
801035b0:	83 c4 10             	add    $0x10,%esp
801035b3:	8b 45 10             	mov    0x10(%ebp),%eax
801035b6:	eb a9                	jmp    80103561 <pipewrite+0xb1>
801035b8:	90                   	nop
801035b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801035c0 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
801035c0:	55                   	push   %ebp
801035c1:	89 e5                	mov    %esp,%ebp
801035c3:	57                   	push   %edi
801035c4:	56                   	push   %esi
801035c5:	53                   	push   %ebx
801035c6:	83 ec 18             	sub    $0x18,%esp
801035c9:	8b 75 08             	mov    0x8(%ebp),%esi
801035cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801035cf:	56                   	push   %esi
801035d0:	e8 bb 0f 00 00       	call   80104590 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801035d5:	83 c4 10             	add    $0x10,%esp
801035d8:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035de:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035e4:	75 6a                	jne    80103650 <piperead+0x90>
801035e6:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
801035ec:	85 db                	test   %ebx,%ebx
801035ee:	0f 84 c4 00 00 00    	je     801036b8 <piperead+0xf8>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801035f4:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801035fa:	eb 2d                	jmp    80103629 <piperead+0x69>
801035fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103600:	83 ec 08             	sub    $0x8,%esp
80103603:	56                   	push   %esi
80103604:	53                   	push   %ebx
80103605:	e8 e6 08 00 00       	call   80103ef0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010360a:	83 c4 10             	add    $0x10,%esp
8010360d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103613:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103619:	75 35                	jne    80103650 <piperead+0x90>
8010361b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103621:	85 d2                	test   %edx,%edx
80103623:	0f 84 8f 00 00 00    	je     801036b8 <piperead+0xf8>
    if(myproc()->killed){
80103629:	e8 a2 02 00 00       	call   801038d0 <myproc>
8010362e:	8b 48 24             	mov    0x24(%eax),%ecx
80103631:	85 c9                	test   %ecx,%ecx
80103633:	74 cb                	je     80103600 <piperead+0x40>
      release(&p->lock);
80103635:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103638:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
8010363d:	56                   	push   %esi
8010363e:	e8 0d 10 00 00       	call   80104650 <release>
      return -1;
80103643:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103646:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103649:	89 d8                	mov    %ebx,%eax
8010364b:	5b                   	pop    %ebx
8010364c:	5e                   	pop    %esi
8010364d:	5f                   	pop    %edi
8010364e:	5d                   	pop    %ebp
8010364f:	c3                   	ret    
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103650:	8b 45 10             	mov    0x10(%ebp),%eax
80103653:	85 c0                	test   %eax,%eax
80103655:	7e 61                	jle    801036b8 <piperead+0xf8>
    if(p->nread == p->nwrite)
80103657:	31 db                	xor    %ebx,%ebx
80103659:	eb 13                	jmp    8010366e <piperead+0xae>
8010365b:	90                   	nop
8010365c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103660:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103666:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
8010366c:	74 1f                	je     8010368d <piperead+0xcd>
    addr[i] = p->data[p->nread++ % PIPESIZE];
8010366e:	8d 41 01             	lea    0x1(%ecx),%eax
80103671:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80103677:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
8010367d:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
80103682:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103685:	83 c3 01             	add    $0x1,%ebx
80103688:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010368b:	75 d3                	jne    80103660 <piperead+0xa0>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010368d:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103693:	83 ec 0c             	sub    $0xc,%esp
80103696:	50                   	push   %eax
80103697:	e8 14 0a 00 00       	call   801040b0 <wakeup>
  release(&p->lock);
8010369c:	89 34 24             	mov    %esi,(%esp)
8010369f:	e8 ac 0f 00 00       	call   80104650 <release>
  return i;
801036a4:	83 c4 10             	add    $0x10,%esp
}
801036a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036aa:	89 d8                	mov    %ebx,%eax
801036ac:	5b                   	pop    %ebx
801036ad:	5e                   	pop    %esi
801036ae:	5f                   	pop    %edi
801036af:	5d                   	pop    %ebp
801036b0:	c3                   	ret    
801036b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801036b8:	31 db                	xor    %ebx,%ebx
801036ba:	eb d1                	jmp    8010368d <piperead+0xcd>
801036bc:	66 90                	xchg   %ax,%ax
801036be:	66 90                	xchg   %ax,%ax

801036c0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801036c0:	55                   	push   %ebp
801036c1:	89 e5                	mov    %esp,%ebp
801036c3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036c4:	bb 34 37 11 80       	mov    $0x80113734,%ebx
{
801036c9:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
801036cc:	68 00 37 11 80       	push   $0x80113700
801036d1:	e8 ba 0e 00 00       	call   80104590 <acquire>
801036d6:	83 c4 10             	add    $0x10,%esp
801036d9:	eb 17                	jmp    801036f2 <allocproc+0x32>
801036db:	90                   	nop
801036dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036e0:	81 c3 84 00 00 00    	add    $0x84,%ebx
801036e6:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
801036ec:	0f 83 8e 00 00 00    	jae    80103780 <allocproc+0xc0>
    if(p->state == UNUSED)
801036f2:	8b 43 0c             	mov    0xc(%ebx),%eax
801036f5:	85 c0                	test   %eax,%eax
801036f7:	75 e7                	jne    801036e0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036f9:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  p->tickets = 10;
  p->ticks = 0;

  release(&ptable.lock);
801036fe:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
80103701:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->tickets = 10;
80103708:	c7 43 7c 0a 00 00 00 	movl   $0xa,0x7c(%ebx)
  p->ticks = 0;
8010370f:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
80103716:	00 00 00 
  p->pid = nextpid++;
80103719:	8d 50 01             	lea    0x1(%eax),%edx
8010371c:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
8010371f:	68 00 37 11 80       	push   $0x80113700
  p->pid = nextpid++;
80103724:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
8010372a:	e8 21 0f 00 00       	call   80104650 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010372f:	e8 fc ed ff ff       	call   80102530 <kalloc>
80103734:	83 c4 10             	add    $0x10,%esp
80103737:	85 c0                	test   %eax,%eax
80103739:	89 43 08             	mov    %eax,0x8(%ebx)
8010373c:	74 5b                	je     80103799 <allocproc+0xd9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010373e:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103744:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
80103747:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010374c:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
8010374f:	c7 40 14 81 59 10 80 	movl   $0x80105981,0x14(%eax)
  p->context = (struct context*)sp;
80103756:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103759:	6a 14                	push   $0x14
8010375b:	6a 00                	push   $0x0
8010375d:	50                   	push   %eax
8010375e:	e8 3d 0f 00 00       	call   801046a0 <memset>
  p->context->eip = (uint)forkret;
80103763:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103766:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
80103769:	c7 40 10 b0 37 10 80 	movl   $0x801037b0,0x10(%eax)
}
80103770:	89 d8                	mov    %ebx,%eax
80103772:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103775:	c9                   	leave  
80103776:	c3                   	ret    
80103777:	89 f6                	mov    %esi,%esi
80103779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&ptable.lock);
80103780:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103783:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103785:	68 00 37 11 80       	push   $0x80113700
8010378a:	e8 c1 0e 00 00       	call   80104650 <release>
}
8010378f:	89 d8                	mov    %ebx,%eax
  return 0;
80103791:	83 c4 10             	add    $0x10,%esp
}
80103794:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103797:	c9                   	leave  
80103798:	c3                   	ret    
    p->state = UNUSED;
80103799:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801037a0:	31 db                	xor    %ebx,%ebx
801037a2:	eb cc                	jmp    80103770 <allocproc+0xb0>
801037a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037b0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801037b0:	55                   	push   %ebp
801037b1:	89 e5                	mov    %esp,%ebp
801037b3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801037b6:	68 00 37 11 80       	push   $0x80113700
801037bb:	e8 90 0e 00 00       	call   80104650 <release>

  if (first) {
801037c0:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801037c5:	83 c4 10             	add    $0x10,%esp
801037c8:	85 c0                	test   %eax,%eax
801037ca:	75 04                	jne    801037d0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801037cc:	c9                   	leave  
801037cd:	c3                   	ret    
801037ce:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
801037d0:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
801037d3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801037da:	00 00 00 
    iinit(ROOTDEV);
801037dd:	6a 01                	push   $0x1
801037df:	e8 0c dd ff ff       	call   801014f0 <iinit>
    initlog(ROOTDEV);
801037e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801037eb:	e8 d0 f3 ff ff       	call   80102bc0 <initlog>
801037f0:	83 c4 10             	add    $0x10,%esp
}
801037f3:	c9                   	leave  
801037f4:	c3                   	ret    
801037f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103800 <pinit>:
{
80103800:	55                   	push   %ebp
80103801:	89 e5                	mov    %esp,%ebp
80103803:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103806:	68 15 79 10 80       	push   $0x80107915
8010380b:	68 00 37 11 80       	push   $0x80113700
80103810:	e8 3b 0c 00 00       	call   80104450 <initlock>
  sgenrand(unixtime());
80103815:	e8 56 f2 ff ff       	call   80102a70 <unixtime>
8010381a:	89 04 24             	mov    %eax,(%esp)
8010381d:	e8 ce 39 00 00       	call   801071f0 <sgenrand>
}
80103822:	83 c4 10             	add    $0x10,%esp
80103825:	c9                   	leave  
80103826:	c3                   	ret    
80103827:	89 f6                	mov    %esi,%esi
80103829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103830 <mycpu>:
{
80103830:	55                   	push   %ebp
80103831:	89 e5                	mov    %esp,%ebp
80103833:	56                   	push   %esi
80103834:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103835:	9c                   	pushf  
80103836:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103837:	f6 c4 02             	test   $0x2,%ah
8010383a:	75 5e                	jne    8010389a <mycpu+0x6a>
  apicid = lapicid();
8010383c:	e8 5f ef ff ff       	call   801027a0 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103841:	8b 35 e0 36 11 80    	mov    0x801136e0,%esi
80103847:	85 f6                	test   %esi,%esi
80103849:	7e 42                	jle    8010388d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010384b:	0f b6 15 60 31 11 80 	movzbl 0x80113160,%edx
80103852:	39 d0                	cmp    %edx,%eax
80103854:	74 30                	je     80103886 <mycpu+0x56>
80103856:	b9 10 32 11 80       	mov    $0x80113210,%ecx
  for (i = 0; i < ncpu; ++i) {
8010385b:	31 d2                	xor    %edx,%edx
8010385d:	8d 76 00             	lea    0x0(%esi),%esi
80103860:	83 c2 01             	add    $0x1,%edx
80103863:	39 f2                	cmp    %esi,%edx
80103865:	74 26                	je     8010388d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
80103867:	0f b6 19             	movzbl (%ecx),%ebx
8010386a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103870:	39 c3                	cmp    %eax,%ebx
80103872:	75 ec                	jne    80103860 <mycpu+0x30>
80103874:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010387a:	05 60 31 11 80       	add    $0x80113160,%eax
}
8010387f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103882:	5b                   	pop    %ebx
80103883:	5e                   	pop    %esi
80103884:	5d                   	pop    %ebp
80103885:	c3                   	ret    
    if (cpus[i].apicid == apicid)
80103886:	b8 60 31 11 80       	mov    $0x80113160,%eax
      return &cpus[i];
8010388b:	eb f2                	jmp    8010387f <mycpu+0x4f>
  panic("unknown apicid\n");
8010388d:	83 ec 0c             	sub    $0xc,%esp
80103890:	68 1c 79 10 80       	push   $0x8010791c
80103895:	e8 f6 ca ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
8010389a:	83 ec 0c             	sub    $0xc,%esp
8010389d:	68 08 7a 10 80       	push   $0x80107a08
801038a2:	e8 e9 ca ff ff       	call   80100390 <panic>
801038a7:	89 f6                	mov    %esi,%esi
801038a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038b0 <cpuid>:
cpuid() {
801038b0:	55                   	push   %ebp
801038b1:	89 e5                	mov    %esp,%ebp
801038b3:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
801038b6:	e8 75 ff ff ff       	call   80103830 <mycpu>
801038bb:	2d 60 31 11 80       	sub    $0x80113160,%eax
}
801038c0:	c9                   	leave  
  return mycpu()-cpus;
801038c1:	c1 f8 04             	sar    $0x4,%eax
801038c4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
801038ca:	c3                   	ret    
801038cb:	90                   	nop
801038cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801038d0 <myproc>:
myproc(void) {
801038d0:	55                   	push   %ebp
801038d1:	89 e5                	mov    %esp,%ebp
801038d3:	53                   	push   %ebx
801038d4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801038d7:	e8 e4 0b 00 00       	call   801044c0 <pushcli>
  c = mycpu();
801038dc:	e8 4f ff ff ff       	call   80103830 <mycpu>
  p = c->proc;
801038e1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038e7:	e8 14 0c 00 00       	call   80104500 <popcli>
}
801038ec:	83 c4 04             	add    $0x4,%esp
801038ef:	89 d8                	mov    %ebx,%eax
801038f1:	5b                   	pop    %ebx
801038f2:	5d                   	pop    %ebp
801038f3:	c3                   	ret    
801038f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103900 <userinit>:
{
80103900:	55                   	push   %ebp
80103901:	89 e5                	mov    %esp,%ebp
80103903:	53                   	push   %ebx
80103904:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103907:	e8 b4 fd ff ff       	call   801036c0 <allocproc>
8010390c:	89 c3                	mov    %eax,%ebx
  initproc = p;
8010390e:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
80103913:	e8 38 36 00 00       	call   80106f50 <setupkvm>
80103918:	85 c0                	test   %eax,%eax
8010391a:	89 43 04             	mov    %eax,0x4(%ebx)
8010391d:	0f 84 bd 00 00 00    	je     801039e0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103923:	83 ec 04             	sub    $0x4,%esp
80103926:	68 2c 00 00 00       	push   $0x2c
8010392b:	68 64 a4 10 80       	push   $0x8010a464
80103930:	50                   	push   %eax
80103931:	e8 fa 32 00 00       	call   80106c30 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103936:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103939:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010393f:	6a 4c                	push   $0x4c
80103941:	6a 00                	push   $0x0
80103943:	ff 73 18             	pushl  0x18(%ebx)
80103946:	e8 55 0d 00 00       	call   801046a0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010394b:	8b 43 18             	mov    0x18(%ebx),%eax
8010394e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103953:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103958:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010395b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010395f:	8b 43 18             	mov    0x18(%ebx),%eax
80103962:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103966:	8b 43 18             	mov    0x18(%ebx),%eax
80103969:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010396d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103971:	8b 43 18             	mov    0x18(%ebx),%eax
80103974:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103978:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010397c:	8b 43 18             	mov    0x18(%ebx),%eax
8010397f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103986:	8b 43 18             	mov    0x18(%ebx),%eax
80103989:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103990:	8b 43 18             	mov    0x18(%ebx),%eax
80103993:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010399a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010399d:	6a 10                	push   $0x10
8010399f:	68 45 79 10 80       	push   $0x80107945
801039a4:	50                   	push   %eax
801039a5:	e8 d6 0e 00 00       	call   80104880 <safestrcpy>
  p->cwd = namei("/");
801039aa:	c7 04 24 4e 79 10 80 	movl   $0x8010794e,(%esp)
801039b1:	e8 9a e5 ff ff       	call   80101f50 <namei>
801039b6:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
801039b9:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
801039c0:	e8 cb 0b 00 00       	call   80104590 <acquire>
  p->state = RUNNABLE;
801039c5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
801039cc:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
801039d3:	e8 78 0c 00 00       	call   80104650 <release>
}
801039d8:	83 c4 10             	add    $0x10,%esp
801039db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039de:	c9                   	leave  
801039df:	c3                   	ret    
    panic("userinit: out of memory?");
801039e0:	83 ec 0c             	sub    $0xc,%esp
801039e3:	68 2c 79 10 80       	push   $0x8010792c
801039e8:	e8 a3 c9 ff ff       	call   80100390 <panic>
801039ed:	8d 76 00             	lea    0x0(%esi),%esi

801039f0 <growproc>:
{
801039f0:	55                   	push   %ebp
801039f1:	89 e5                	mov    %esp,%ebp
801039f3:	56                   	push   %esi
801039f4:	53                   	push   %ebx
801039f5:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
801039f8:	e8 c3 0a 00 00       	call   801044c0 <pushcli>
  c = mycpu();
801039fd:	e8 2e fe ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103a02:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a08:	e8 f3 0a 00 00       	call   80104500 <popcli>
  if(n > 0){
80103a0d:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
80103a10:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103a12:	7f 1c                	jg     80103a30 <growproc+0x40>
  } else if(n < 0){
80103a14:	75 3a                	jne    80103a50 <growproc+0x60>
  switchuvm(curproc);
80103a16:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103a19:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103a1b:	53                   	push   %ebx
80103a1c:	e8 ff 30 00 00       	call   80106b20 <switchuvm>
  return 0;
80103a21:	83 c4 10             	add    $0x10,%esp
80103a24:	31 c0                	xor    %eax,%eax
}
80103a26:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a29:	5b                   	pop    %ebx
80103a2a:	5e                   	pop    %esi
80103a2b:	5d                   	pop    %ebp
80103a2c:	c3                   	ret    
80103a2d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a30:	83 ec 04             	sub    $0x4,%esp
80103a33:	01 c6                	add    %eax,%esi
80103a35:	56                   	push   %esi
80103a36:	50                   	push   %eax
80103a37:	ff 73 04             	pushl  0x4(%ebx)
80103a3a:	e8 31 33 00 00       	call   80106d70 <allocuvm>
80103a3f:	83 c4 10             	add    $0x10,%esp
80103a42:	85 c0                	test   %eax,%eax
80103a44:	75 d0                	jne    80103a16 <growproc+0x26>
      return -1;
80103a46:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a4b:	eb d9                	jmp    80103a26 <growproc+0x36>
80103a4d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a50:	83 ec 04             	sub    $0x4,%esp
80103a53:	01 c6                	add    %eax,%esi
80103a55:	56                   	push   %esi
80103a56:	50                   	push   %eax
80103a57:	ff 73 04             	pushl  0x4(%ebx)
80103a5a:	e8 41 34 00 00       	call   80106ea0 <deallocuvm>
80103a5f:	83 c4 10             	add    $0x10,%esp
80103a62:	85 c0                	test   %eax,%eax
80103a64:	75 b0                	jne    80103a16 <growproc+0x26>
80103a66:	eb de                	jmp    80103a46 <growproc+0x56>
80103a68:	90                   	nop
80103a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103a70 <fork>:
{
80103a70:	55                   	push   %ebp
80103a71:	89 e5                	mov    %esp,%ebp
80103a73:	57                   	push   %edi
80103a74:	56                   	push   %esi
80103a75:	53                   	push   %ebx
80103a76:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103a79:	e8 42 0a 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103a7e:	e8 ad fd ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103a83:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a89:	e8 72 0a 00 00       	call   80104500 <popcli>
  if((np = allocproc()) == 0){
80103a8e:	e8 2d fc ff ff       	call   801036c0 <allocproc>
80103a93:	85 c0                	test   %eax,%eax
80103a95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a98:	0f 84 b7 00 00 00    	je     80103b55 <fork+0xe5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103a9e:	83 ec 08             	sub    $0x8,%esp
80103aa1:	ff 33                	pushl  (%ebx)
80103aa3:	ff 73 04             	pushl  0x4(%ebx)
80103aa6:	89 c7                	mov    %eax,%edi
80103aa8:	e8 73 35 00 00       	call   80107020 <copyuvm>
80103aad:	83 c4 10             	add    $0x10,%esp
80103ab0:	85 c0                	test   %eax,%eax
80103ab2:	89 47 04             	mov    %eax,0x4(%edi)
80103ab5:	0f 84 a1 00 00 00    	je     80103b5c <fork+0xec>
  np->sz = curproc->sz;
80103abb:	8b 03                	mov    (%ebx),%eax
80103abd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103ac0:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103ac2:	89 59 14             	mov    %ebx,0x14(%ecx)
80103ac5:	89 c8                	mov    %ecx,%eax
  *np->tf = *curproc->tf;
80103ac7:	8b 79 18             	mov    0x18(%ecx),%edi
80103aca:	8b 73 18             	mov    0x18(%ebx),%esi
80103acd:	b9 13 00 00 00       	mov    $0x13,%ecx
80103ad2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103ad4:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103ad6:	8b 40 18             	mov    0x18(%eax),%eax
80103ad9:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if(curproc->ofile[i])
80103ae0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103ae4:	85 c0                	test   %eax,%eax
80103ae6:	74 13                	je     80103afb <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103ae8:	83 ec 0c             	sub    $0xc,%esp
80103aeb:	50                   	push   %eax
80103aec:	e8 6f d3 ff ff       	call   80100e60 <filedup>
80103af1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103af4:	83 c4 10             	add    $0x10,%esp
80103af7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103afb:	83 c6 01             	add    $0x1,%esi
80103afe:	83 fe 10             	cmp    $0x10,%esi
80103b01:	75 dd                	jne    80103ae0 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103b03:	83 ec 0c             	sub    $0xc,%esp
80103b06:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b09:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103b0c:	e8 af db ff ff       	call   801016c0 <idup>
80103b11:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b14:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103b17:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b1a:	8d 47 6c             	lea    0x6c(%edi),%eax
80103b1d:	6a 10                	push   $0x10
80103b1f:	53                   	push   %ebx
80103b20:	50                   	push   %eax
80103b21:	e8 5a 0d 00 00       	call   80104880 <safestrcpy>
  pid = np->pid;
80103b26:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103b29:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b30:	e8 5b 0a 00 00       	call   80104590 <acquire>
  np->state = RUNNABLE;
80103b35:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103b3c:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b43:	e8 08 0b 00 00       	call   80104650 <release>
  return pid;
80103b48:	83 c4 10             	add    $0x10,%esp
}
80103b4b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b4e:	89 d8                	mov    %ebx,%eax
80103b50:	5b                   	pop    %ebx
80103b51:	5e                   	pop    %esi
80103b52:	5f                   	pop    %edi
80103b53:	5d                   	pop    %ebp
80103b54:	c3                   	ret    
    return -1;
80103b55:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b5a:	eb ef                	jmp    80103b4b <fork+0xdb>
    kfree(np->kstack);
80103b5c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b5f:	83 ec 0c             	sub    $0xc,%esp
80103b62:	ff 73 08             	pushl  0x8(%ebx)
80103b65:	e8 16 e8 ff ff       	call   80102380 <kfree>
    np->kstack = 0;
80103b6a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b71:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103b78:	83 c4 10             	add    $0x10,%esp
80103b7b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b80:	eb c9                	jmp    80103b4b <fork+0xdb>
80103b82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b90 <lottery_total>:
lottery_total(void){
80103b90:	55                   	push   %ebp
  int ticket_aggregate=0;
80103b91:	31 c0                	xor    %eax,%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b93:	ba 34 37 11 80       	mov    $0x80113734,%edx
lottery_total(void){
80103b98:	89 e5                	mov    %esp,%ebp
80103b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p->state==RUNNABLE){
80103ba0:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103ba4:	75 03                	jne    80103ba9 <lottery_total+0x19>
      ticket_aggregate+=p->tickets;
80103ba6:	03 42 7c             	add    0x7c(%edx),%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ba9:	81 c2 84 00 00 00    	add    $0x84,%edx
80103baf:	81 fa 34 58 11 80    	cmp    $0x80115834,%edx
80103bb5:	72 e9                	jb     80103ba0 <lottery_total+0x10>
}
80103bb7:	5d                   	pop    %ebp
80103bb8:	c3                   	ret    
80103bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103bc0 <scheduler>:
{
80103bc0:	55                   	push   %ebp
80103bc1:	89 e5                	mov    %esp,%ebp
80103bc3:	57                   	push   %edi
80103bc4:	56                   	push   %esi
80103bc5:	53                   	push   %ebx
80103bc6:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103bc9:	e8 62 fc ff ff       	call   80103830 <mycpu>
80103bce:	8d 70 04             	lea    0x4(%eax),%esi
80103bd1:	89 c3                	mov    %eax,%ebx
  c->proc = 0;
80103bd3:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103bda:	00 00 00 
80103bdd:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103be0:	fb                   	sti    
    acquire(&ptable.lock);
80103be1:	83 ec 0c             	sub    $0xc,%esp
80103be4:	68 00 37 11 80       	push   $0x80113700
80103be9:	e8 a2 09 00 00       	call   80104590 <acquire>
80103bee:	83 c4 10             	add    $0x10,%esp
  int ticket_aggregate=0;
80103bf1:	31 d2                	xor    %edx,%edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103bf3:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103bf8:	90                   	nop
80103bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p->state==RUNNABLE){
80103c00:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103c04:	75 03                	jne    80103c09 <scheduler+0x49>
      ticket_aggregate+=p->tickets;
80103c06:	03 50 7c             	add    0x7c(%eax),%edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c09:	05 84 00 00 00       	add    $0x84,%eax
80103c0e:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80103c13:	72 eb                	jb     80103c00 <scheduler+0x40>
    winner = random_at_most(total_tickets);
80103c15:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c18:	bf 34 37 11 80       	mov    $0x80113734,%edi
    winner = random_at_most(total_tickets);
80103c1d:	52                   	push   %edx
80103c1e:	e8 5d 37 00 00       	call   80107380 <random_at_most>
80103c23:	83 c4 10             	add    $0x10,%esp
    counter = 0;
80103c26:	31 d2                	xor    %edx,%edx
      if(p->state != RUNNABLE) {
80103c28:	83 7f 0c 03          	cmpl   $0x3,0xc(%edi)
80103c2c:	75 0b                	jne    80103c39 <scheduler+0x79>
      counter += p->tickets;
80103c2e:	8b 4f 7c             	mov    0x7c(%edi),%ecx
80103c31:	01 ca                	add    %ecx,%edx
      if (counter < winner) {
80103c33:	39 d0                	cmp    %edx,%eax
80103c35:	7e 29                	jle    80103c60 <scheduler+0xa0>
            counter += p->tickets;
80103c37:	01 ca                	add    %ecx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c39:	81 c7 84 00 00 00    	add    $0x84,%edi
80103c3f:	81 ff 34 58 11 80    	cmp    $0x80115834,%edi
80103c45:	72 e1                	jb     80103c28 <scheduler+0x68>
    release(&ptable.lock);
80103c47:	83 ec 0c             	sub    $0xc,%esp
80103c4a:	68 00 37 11 80       	push   $0x80113700
80103c4f:	e8 fc 09 00 00       	call   80104650 <release>
    sti();
80103c54:	83 c4 10             	add    $0x10,%esp
80103c57:	eb 87                	jmp    80103be0 <scheduler+0x20>
80103c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      switchuvm(p);
80103c60:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103c63:	89 bb ac 00 00 00    	mov    %edi,0xac(%ebx)
      switchuvm(p);
80103c69:	57                   	push   %edi
80103c6a:	e8 b1 2e 00 00       	call   80106b20 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103c6f:	58                   	pop    %eax
80103c70:	5a                   	pop    %edx
80103c71:	ff 77 1c             	pushl  0x1c(%edi)
80103c74:	56                   	push   %esi
      p->state = RUNNING;
80103c75:	c7 47 0c 04 00 00 00 	movl   $0x4,0xc(%edi)
      swtch(&(c->scheduler), p->context);
80103c7c:	e8 5a 0c 00 00       	call   801048db <swtch>
      switchkvm();
80103c81:	e8 7a 2e 00 00       	call   80106b00 <switchkvm>
      break;
80103c86:	83 c4 10             	add    $0x10,%esp
      p->ticks += 1;
80103c89:	83 87 80 00 00 00 01 	addl   $0x1,0x80(%edi)
      c->proc = 0;
80103c90:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103c97:	00 00 00 
    release(&ptable.lock);
80103c9a:	83 ec 0c             	sub    $0xc,%esp
80103c9d:	68 00 37 11 80       	push   $0x80113700
80103ca2:	e8 a9 09 00 00       	call   80104650 <release>
    sti();
80103ca7:	83 c4 10             	add    $0x10,%esp
80103caa:	e9 31 ff ff ff       	jmp    80103be0 <scheduler+0x20>
80103caf:	90                   	nop

80103cb0 <sched>:
{
80103cb0:	55                   	push   %ebp
80103cb1:	89 e5                	mov    %esp,%ebp
80103cb3:	56                   	push   %esi
80103cb4:	53                   	push   %ebx
  pushcli();
80103cb5:	e8 06 08 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103cba:	e8 71 fb ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103cbf:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103cc5:	e8 36 08 00 00       	call   80104500 <popcli>
  if(!holding(&ptable.lock))
80103cca:	83 ec 0c             	sub    $0xc,%esp
80103ccd:	68 00 37 11 80       	push   $0x80113700
80103cd2:	e8 89 08 00 00       	call   80104560 <holding>
80103cd7:	83 c4 10             	add    $0x10,%esp
80103cda:	85 c0                	test   %eax,%eax
80103cdc:	74 4f                	je     80103d2d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103cde:	e8 4d fb ff ff       	call   80103830 <mycpu>
80103ce3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103cea:	75 68                	jne    80103d54 <sched+0xa4>
  if(p->state == RUNNING)
80103cec:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103cf0:	74 55                	je     80103d47 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103cf2:	9c                   	pushf  
80103cf3:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103cf4:	f6 c4 02             	test   $0x2,%ah
80103cf7:	75 41                	jne    80103d3a <sched+0x8a>
  intena = mycpu()->intena;
80103cf9:	e8 32 fb ff ff       	call   80103830 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103cfe:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103d01:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103d07:	e8 24 fb ff ff       	call   80103830 <mycpu>
80103d0c:	83 ec 08             	sub    $0x8,%esp
80103d0f:	ff 70 04             	pushl  0x4(%eax)
80103d12:	53                   	push   %ebx
80103d13:	e8 c3 0b 00 00       	call   801048db <swtch>
  mycpu()->intena = intena;
80103d18:	e8 13 fb ff ff       	call   80103830 <mycpu>
}
80103d1d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103d20:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103d26:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103d29:	5b                   	pop    %ebx
80103d2a:	5e                   	pop    %esi
80103d2b:	5d                   	pop    %ebp
80103d2c:	c3                   	ret    
    panic("sched ptable.lock");
80103d2d:	83 ec 0c             	sub    $0xc,%esp
80103d30:	68 50 79 10 80       	push   $0x80107950
80103d35:	e8 56 c6 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103d3a:	83 ec 0c             	sub    $0xc,%esp
80103d3d:	68 7c 79 10 80       	push   $0x8010797c
80103d42:	e8 49 c6 ff ff       	call   80100390 <panic>
    panic("sched running");
80103d47:	83 ec 0c             	sub    $0xc,%esp
80103d4a:	68 6e 79 10 80       	push   $0x8010796e
80103d4f:	e8 3c c6 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103d54:	83 ec 0c             	sub    $0xc,%esp
80103d57:	68 62 79 10 80       	push   $0x80107962
80103d5c:	e8 2f c6 ff ff       	call   80100390 <panic>
80103d61:	eb 0d                	jmp    80103d70 <exit>
80103d63:	90                   	nop
80103d64:	90                   	nop
80103d65:	90                   	nop
80103d66:	90                   	nop
80103d67:	90                   	nop
80103d68:	90                   	nop
80103d69:	90                   	nop
80103d6a:	90                   	nop
80103d6b:	90                   	nop
80103d6c:	90                   	nop
80103d6d:	90                   	nop
80103d6e:	90                   	nop
80103d6f:	90                   	nop

80103d70 <exit>:
{
80103d70:	55                   	push   %ebp
80103d71:	89 e5                	mov    %esp,%ebp
80103d73:	57                   	push   %edi
80103d74:	56                   	push   %esi
80103d75:	53                   	push   %ebx
80103d76:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103d79:	e8 42 07 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103d7e:	e8 ad fa ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103d83:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103d89:	e8 72 07 00 00       	call   80104500 <popcli>
  if(curproc == initproc)
80103d8e:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103d94:	8d 5e 28             	lea    0x28(%esi),%ebx
80103d97:	8d 7e 68             	lea    0x68(%esi),%edi
80103d9a:	0f 84 f1 00 00 00    	je     80103e91 <exit+0x121>
    if(curproc->ofile[fd]){
80103da0:	8b 03                	mov    (%ebx),%eax
80103da2:	85 c0                	test   %eax,%eax
80103da4:	74 12                	je     80103db8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103da6:	83 ec 0c             	sub    $0xc,%esp
80103da9:	50                   	push   %eax
80103daa:	e8 01 d1 ff ff       	call   80100eb0 <fileclose>
      curproc->ofile[fd] = 0;
80103daf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103db5:	83 c4 10             	add    $0x10,%esp
80103db8:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103dbb:	39 fb                	cmp    %edi,%ebx
80103dbd:	75 e1                	jne    80103da0 <exit+0x30>
  begin_op();
80103dbf:	e8 9c ee ff ff       	call   80102c60 <begin_op>
  iput(curproc->cwd);
80103dc4:	83 ec 0c             	sub    $0xc,%esp
80103dc7:	ff 76 68             	pushl  0x68(%esi)
80103dca:	e8 51 da ff ff       	call   80101820 <iput>
  end_op();
80103dcf:	e8 fc ee ff ff       	call   80102cd0 <end_op>
  curproc->cwd = 0;
80103dd4:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103ddb:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103de2:	e8 a9 07 00 00       	call   80104590 <acquire>
  wakeup1(curproc->parent);
80103de7:	8b 56 14             	mov    0x14(%esi),%edx
80103dea:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ded:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103df2:	eb 10                	jmp    80103e04 <exit+0x94>
80103df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103df8:	05 84 00 00 00       	add    $0x84,%eax
80103dfd:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80103e02:	73 1e                	jae    80103e22 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103e04:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e08:	75 ee                	jne    80103df8 <exit+0x88>
80103e0a:	3b 50 20             	cmp    0x20(%eax),%edx
80103e0d:	75 e9                	jne    80103df8 <exit+0x88>
      p->state = RUNNABLE;
80103e0f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e16:	05 84 00 00 00       	add    $0x84,%eax
80103e1b:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80103e20:	72 e2                	jb     80103e04 <exit+0x94>
      p->parent = initproc;
80103e22:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e28:	ba 34 37 11 80       	mov    $0x80113734,%edx
80103e2d:	eb 0f                	jmp    80103e3e <exit+0xce>
80103e2f:	90                   	nop
80103e30:	81 c2 84 00 00 00    	add    $0x84,%edx
80103e36:	81 fa 34 58 11 80    	cmp    $0x80115834,%edx
80103e3c:	73 3a                	jae    80103e78 <exit+0x108>
    if(p->parent == curproc){
80103e3e:	39 72 14             	cmp    %esi,0x14(%edx)
80103e41:	75 ed                	jne    80103e30 <exit+0xc0>
      if(p->state == ZOMBIE)
80103e43:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103e47:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e4a:	75 e4                	jne    80103e30 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e4c:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103e51:	eb 11                	jmp    80103e64 <exit+0xf4>
80103e53:	90                   	nop
80103e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e58:	05 84 00 00 00       	add    $0x84,%eax
80103e5d:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80103e62:	73 cc                	jae    80103e30 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103e64:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e68:	75 ee                	jne    80103e58 <exit+0xe8>
80103e6a:	3b 48 20             	cmp    0x20(%eax),%ecx
80103e6d:	75 e9                	jne    80103e58 <exit+0xe8>
      p->state = RUNNABLE;
80103e6f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e76:	eb e0                	jmp    80103e58 <exit+0xe8>
  curproc->state = ZOMBIE;
80103e78:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103e7f:	e8 2c fe ff ff       	call   80103cb0 <sched>
  panic("zombie exit");
80103e84:	83 ec 0c             	sub    $0xc,%esp
80103e87:	68 9d 79 10 80       	push   $0x8010799d
80103e8c:	e8 ff c4 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103e91:	83 ec 0c             	sub    $0xc,%esp
80103e94:	68 90 79 10 80       	push   $0x80107990
80103e99:	e8 f2 c4 ff ff       	call   80100390 <panic>
80103e9e:	66 90                	xchg   %ax,%ax

80103ea0 <yield>:
{
80103ea0:	55                   	push   %ebp
80103ea1:	89 e5                	mov    %esp,%ebp
80103ea3:	53                   	push   %ebx
80103ea4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103ea7:	68 00 37 11 80       	push   $0x80113700
80103eac:	e8 df 06 00 00       	call   80104590 <acquire>
  pushcli();
80103eb1:	e8 0a 06 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103eb6:	e8 75 f9 ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103ebb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ec1:	e8 3a 06 00 00       	call   80104500 <popcli>
  myproc()->state = RUNNABLE;
80103ec6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103ecd:	e8 de fd ff ff       	call   80103cb0 <sched>
  release(&ptable.lock);
80103ed2:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103ed9:	e8 72 07 00 00       	call   80104650 <release>
}
80103ede:	83 c4 10             	add    $0x10,%esp
80103ee1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ee4:	c9                   	leave  
80103ee5:	c3                   	ret    
80103ee6:	8d 76 00             	lea    0x0(%esi),%esi
80103ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ef0 <sleep>:
{
80103ef0:	55                   	push   %ebp
80103ef1:	89 e5                	mov    %esp,%ebp
80103ef3:	57                   	push   %edi
80103ef4:	56                   	push   %esi
80103ef5:	53                   	push   %ebx
80103ef6:	83 ec 0c             	sub    $0xc,%esp
80103ef9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103efc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103eff:	e8 bc 05 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103f04:	e8 27 f9 ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103f09:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103f0f:	e8 ec 05 00 00       	call   80104500 <popcli>
  if(p == 0)
80103f14:	85 db                	test   %ebx,%ebx
80103f16:	0f 84 87 00 00 00    	je     80103fa3 <sleep+0xb3>
  if(lk == 0)
80103f1c:	85 f6                	test   %esi,%esi
80103f1e:	74 76                	je     80103f96 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103f20:	81 fe 00 37 11 80    	cmp    $0x80113700,%esi
80103f26:	74 50                	je     80103f78 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103f28:	83 ec 0c             	sub    $0xc,%esp
80103f2b:	68 00 37 11 80       	push   $0x80113700
80103f30:	e8 5b 06 00 00       	call   80104590 <acquire>
    release(lk);
80103f35:	89 34 24             	mov    %esi,(%esp)
80103f38:	e8 13 07 00 00       	call   80104650 <release>
  p->chan = chan;
80103f3d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f40:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103f47:	e8 64 fd ff ff       	call   80103cb0 <sched>
  p->chan = 0;
80103f4c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103f53:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103f5a:	e8 f1 06 00 00       	call   80104650 <release>
    acquire(lk);
80103f5f:	89 75 08             	mov    %esi,0x8(%ebp)
80103f62:	83 c4 10             	add    $0x10,%esp
}
80103f65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f68:	5b                   	pop    %ebx
80103f69:	5e                   	pop    %esi
80103f6a:	5f                   	pop    %edi
80103f6b:	5d                   	pop    %ebp
    acquire(lk);
80103f6c:	e9 1f 06 00 00       	jmp    80104590 <acquire>
80103f71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103f78:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f7b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103f82:	e8 29 fd ff ff       	call   80103cb0 <sched>
  p->chan = 0;
80103f87:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103f8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f91:	5b                   	pop    %ebx
80103f92:	5e                   	pop    %esi
80103f93:	5f                   	pop    %edi
80103f94:	5d                   	pop    %ebp
80103f95:	c3                   	ret    
    panic("sleep without lk");
80103f96:	83 ec 0c             	sub    $0xc,%esp
80103f99:	68 af 79 10 80       	push   $0x801079af
80103f9e:	e8 ed c3 ff ff       	call   80100390 <panic>
    panic("sleep");
80103fa3:	83 ec 0c             	sub    $0xc,%esp
80103fa6:	68 a9 79 10 80       	push   $0x801079a9
80103fab:	e8 e0 c3 ff ff       	call   80100390 <panic>

80103fb0 <wait>:
{
80103fb0:	55                   	push   %ebp
80103fb1:	89 e5                	mov    %esp,%ebp
80103fb3:	56                   	push   %esi
80103fb4:	53                   	push   %ebx
  pushcli();
80103fb5:	e8 06 05 00 00       	call   801044c0 <pushcli>
  c = mycpu();
80103fba:	e8 71 f8 ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103fbf:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103fc5:	e8 36 05 00 00       	call   80104500 <popcli>
  acquire(&ptable.lock);
80103fca:	83 ec 0c             	sub    $0xc,%esp
80103fcd:	68 00 37 11 80       	push   $0x80113700
80103fd2:	e8 b9 05 00 00       	call   80104590 <acquire>
80103fd7:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103fda:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fdc:	bb 34 37 11 80       	mov    $0x80113734,%ebx
80103fe1:	eb 13                	jmp    80103ff6 <wait+0x46>
80103fe3:	90                   	nop
80103fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fe8:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103fee:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
80103ff4:	73 1e                	jae    80104014 <wait+0x64>
      if(p->parent != curproc)
80103ff6:	39 73 14             	cmp    %esi,0x14(%ebx)
80103ff9:	75 ed                	jne    80103fe8 <wait+0x38>
      if(p->state == ZOMBIE){
80103ffb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fff:	74 37                	je     80104038 <wait+0x88>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104001:	81 c3 84 00 00 00    	add    $0x84,%ebx
      havekids = 1;
80104007:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010400c:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
80104012:	72 e2                	jb     80103ff6 <wait+0x46>
    if(!havekids || curproc->killed){
80104014:	85 c0                	test   %eax,%eax
80104016:	74 76                	je     8010408e <wait+0xde>
80104018:	8b 46 24             	mov    0x24(%esi),%eax
8010401b:	85 c0                	test   %eax,%eax
8010401d:	75 6f                	jne    8010408e <wait+0xde>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
8010401f:	83 ec 08             	sub    $0x8,%esp
80104022:	68 00 37 11 80       	push   $0x80113700
80104027:	56                   	push   %esi
80104028:	e8 c3 fe ff ff       	call   80103ef0 <sleep>
    havekids = 0;
8010402d:	83 c4 10             	add    $0x10,%esp
80104030:	eb a8                	jmp    80103fda <wait+0x2a>
80104032:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        kfree(p->kstack);
80104038:	83 ec 0c             	sub    $0xc,%esp
8010403b:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
8010403e:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104041:	e8 3a e3 ff ff       	call   80102380 <kfree>
        freevm(p->pgdir);
80104046:	5a                   	pop    %edx
80104047:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
8010404a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104051:	e8 7a 2e 00 00       	call   80106ed0 <freevm>
        release(&ptable.lock);
80104056:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
        p->pid = 0;
8010405d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80104064:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
8010406b:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
8010406f:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80104076:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
8010407d:	e8 ce 05 00 00       	call   80104650 <release>
        return pid;
80104082:	83 c4 10             	add    $0x10,%esp
}
80104085:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104088:	89 f0                	mov    %esi,%eax
8010408a:	5b                   	pop    %ebx
8010408b:	5e                   	pop    %esi
8010408c:	5d                   	pop    %ebp
8010408d:	c3                   	ret    
      release(&ptable.lock);
8010408e:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104091:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80104096:	68 00 37 11 80       	push   $0x80113700
8010409b:	e8 b0 05 00 00       	call   80104650 <release>
      return -1;
801040a0:	83 c4 10             	add    $0x10,%esp
801040a3:	eb e0                	jmp    80104085 <wait+0xd5>
801040a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801040a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040b0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
801040b0:	55                   	push   %ebp
801040b1:	89 e5                	mov    %esp,%ebp
801040b3:	53                   	push   %ebx
801040b4:	83 ec 10             	sub    $0x10,%esp
801040b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
801040ba:	68 00 37 11 80       	push   $0x80113700
801040bf:	e8 cc 04 00 00       	call   80104590 <acquire>
801040c4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040c7:	b8 34 37 11 80       	mov    $0x80113734,%eax
801040cc:	eb 0e                	jmp    801040dc <wakeup+0x2c>
801040ce:	66 90                	xchg   %ax,%ax
801040d0:	05 84 00 00 00       	add    $0x84,%eax
801040d5:	3d 34 58 11 80       	cmp    $0x80115834,%eax
801040da:	73 1e                	jae    801040fa <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
801040dc:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040e0:	75 ee                	jne    801040d0 <wakeup+0x20>
801040e2:	3b 58 20             	cmp    0x20(%eax),%ebx
801040e5:	75 e9                	jne    801040d0 <wakeup+0x20>
      p->state = RUNNABLE;
801040e7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040ee:	05 84 00 00 00       	add    $0x84,%eax
801040f3:	3d 34 58 11 80       	cmp    $0x80115834,%eax
801040f8:	72 e2                	jb     801040dc <wakeup+0x2c>
  wakeup1(chan);
  release(&ptable.lock);
801040fa:	c7 45 08 00 37 11 80 	movl   $0x80113700,0x8(%ebp)
}
80104101:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104104:	c9                   	leave  
  release(&ptable.lock);
80104105:	e9 46 05 00 00       	jmp    80104650 <release>
8010410a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104110 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104110:	55                   	push   %ebp
80104111:	89 e5                	mov    %esp,%ebp
80104113:	53                   	push   %ebx
80104114:	83 ec 10             	sub    $0x10,%esp
80104117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010411a:	68 00 37 11 80       	push   $0x80113700
8010411f:	e8 6c 04 00 00       	call   80104590 <acquire>
80104124:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104127:	b8 34 37 11 80       	mov    $0x80113734,%eax
8010412c:	eb 0e                	jmp    8010413c <kill+0x2c>
8010412e:	66 90                	xchg   %ax,%ax
80104130:	05 84 00 00 00       	add    $0x84,%eax
80104135:	3d 34 58 11 80       	cmp    $0x80115834,%eax
8010413a:	73 34                	jae    80104170 <kill+0x60>
    if(p->pid == pid){
8010413c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010413f:	75 ef                	jne    80104130 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104141:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104145:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010414c:	75 07                	jne    80104155 <kill+0x45>
        p->state = RUNNABLE;
8010414e:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104155:	83 ec 0c             	sub    $0xc,%esp
80104158:	68 00 37 11 80       	push   $0x80113700
8010415d:	e8 ee 04 00 00       	call   80104650 <release>
      return 0;
80104162:	83 c4 10             	add    $0x10,%esp
80104165:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104167:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010416a:	c9                   	leave  
8010416b:	c3                   	ret    
8010416c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104170:	83 ec 0c             	sub    $0xc,%esp
80104173:	68 00 37 11 80       	push   $0x80113700
80104178:	e8 d3 04 00 00       	call   80104650 <release>
  return -1;
8010417d:	83 c4 10             	add    $0x10,%esp
80104180:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104185:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104188:	c9                   	leave  
80104189:	c3                   	ret    
8010418a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104190 <settickets>:

int 
settickets(int tickets){
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	56                   	push   %esi
80104194:	53                   	push   %ebx
80104195:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80104198:	e8 23 03 00 00       	call   801044c0 <pushcli>
  c = mycpu();
8010419d:	e8 8e f6 ff ff       	call   80103830 <mycpu>
  p = c->proc;
801041a2:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801041a8:	e8 53 03 00 00       	call   80104500 <popcli>
  struct proc *proc = myproc();
  proc->tickets = tickets;
  cprintf("tickets is %d", proc->tickets);
801041ad:	83 ec 08             	sub    $0x8,%esp
  proc->tickets = tickets;
801041b0:	89 5e 7c             	mov    %ebx,0x7c(%esi)
  cprintf("tickets is %d", proc->tickets);
801041b3:	53                   	push   %ebx
801041b4:	68 c0 79 10 80       	push   $0x801079c0
801041b9:	e8 a2 c4 ff ff       	call   80100660 <cprintf>
  return 0;
}
801041be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041c1:	31 c0                	xor    %eax,%eax
801041c3:	5b                   	pop    %ebx
801041c4:	5e                   	pop    %esi
801041c5:	5d                   	pop    %ebp
801041c6:	c3                   	ret    
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
801041d6:	68 00 37 11 80       	push   $0x80113700
801041db:	e8 b0 03 00 00       	call   80104590 <acquire>
801041e0:	8b 55 08             	mov    0x8(%ebp),%edx
801041e3:	83 c4 10             	add    $0x10,%esp
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801041e6:	b8 34 37 11 80       	mov    $0x80113734,%eax
801041eb:	90                   	nop
801041ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ps->pid[i] = p->pid;
801041f0:	8b 48 10             	mov    0x10(%eax),%ecx
801041f3:	89 8a 00 02 00 00    	mov    %ecx,0x200(%edx)
    ps->inuse[i] = p->state == UNUSED;
801041f9:	31 c9                	xor    %ecx,%ecx
801041fb:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
801041ff:	0f 94 c1             	sete   %cl
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104202:	05 84 00 00 00       	add    $0x84,%eax
80104207:	83 c2 04             	add    $0x4,%edx
    ps->inuse[i] = p->state == UNUSED;
8010420a:	89 4a fc             	mov    %ecx,-0x4(%edx)
    ps->tickets[i] = p->tickets;
8010420d:	8b 48 f8             	mov    -0x8(%eax),%ecx
80104210:	89 8a fc 00 00 00    	mov    %ecx,0xfc(%edx)
    ps->ticks[i] = p->ticks;
80104216:	8b 48 fc             	mov    -0x4(%eax),%ecx
80104219:	89 8a fc 02 00 00    	mov    %ecx,0x2fc(%edx)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010421f:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80104224:	72 ca                	jb     801041f0 <getpinfo+0x20>
    i++;
  }
  release(&ptable.lock);
80104226:	83 ec 0c             	sub    $0xc,%esp
80104229:	68 00 37 11 80       	push   $0x80113700
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
80104249:	bb 34 37 11 80       	mov    $0x80113734,%ebx
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
8010425b:	68 47 7d 10 80       	push   $0x80107d47
80104260:	e8 fb c3 ff ff       	call   80100660 <cprintf>
80104265:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104268:	81 c3 84 00 00 00    	add    $0x84,%ebx
8010426e:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
80104274:	0f 83 96 00 00 00    	jae    80104310 <procdump+0xd0>
    if(p->state == UNUSED)
8010427a:	8b 43 0c             	mov    0xc(%ebx),%eax
8010427d:	85 c0                	test   %eax,%eax
8010427f:	74 e7                	je     80104268 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104281:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
80104284:	ba ce 79 10 80       	mov    $0x801079ce,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104289:	77 11                	ja     8010429c <procdump+0x5c>
8010428b:	8b 14 85 30 7a 10 80 	mov    -0x7fef85d0(,%eax,4),%edx
      state = "???";
80104292:	b8 ce 79 10 80       	mov    $0x801079ce,%eax
80104297:	85 d2                	test   %edx,%edx
80104299:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %sc%d", p->pid, state, p->name, p->tickets);
8010429c:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010429f:	83 ec 0c             	sub    $0xc,%esp
801042a2:	ff 73 7c             	pushl  0x7c(%ebx)
801042a5:	50                   	push   %eax
801042a6:	52                   	push   %edx
801042a7:	ff 73 10             	pushl  0x10(%ebx)
801042aa:	68 d2 79 10 80       	push   $0x801079d2
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
801042f1:	68 01 74 10 80       	push   $0x80107401
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
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	53                   	push   %ebx
80104324:	83 ec 0c             	sub    $0xc,%esp
80104327:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010432a:	68 48 7a 10 80       	push   $0x80107a48
8010432f:	8d 43 04             	lea    0x4(%ebx),%eax
80104332:	50                   	push   %eax
80104333:	e8 18 01 00 00       	call   80104450 <initlock>
80104338:	8b 45 0c             	mov    0xc(%ebp),%eax
8010433b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104341:	83 c4 10             	add    $0x10,%esp
80104344:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010434b:	89 43 38             	mov    %eax,0x38(%ebx)
8010434e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104351:	c9                   	leave  
80104352:	c3                   	ret    
80104353:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104360 <acquiresleep>:
80104360:	55                   	push   %ebp
80104361:	89 e5                	mov    %esp,%ebp
80104363:	56                   	push   %esi
80104364:	53                   	push   %ebx
80104365:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104368:	83 ec 0c             	sub    $0xc,%esp
8010436b:	8d 73 04             	lea    0x4(%ebx),%esi
8010436e:	56                   	push   %esi
8010436f:	e8 1c 02 00 00       	call   80104590 <acquire>
80104374:	8b 13                	mov    (%ebx),%edx
80104376:	83 c4 10             	add    $0x10,%esp
80104379:	85 d2                	test   %edx,%edx
8010437b:	74 16                	je     80104393 <acquiresleep+0x33>
8010437d:	8d 76 00             	lea    0x0(%esi),%esi
80104380:	83 ec 08             	sub    $0x8,%esp
80104383:	56                   	push   %esi
80104384:	53                   	push   %ebx
80104385:	e8 66 fb ff ff       	call   80103ef0 <sleep>
8010438a:	8b 03                	mov    (%ebx),%eax
8010438c:	83 c4 10             	add    $0x10,%esp
8010438f:	85 c0                	test   %eax,%eax
80104391:	75 ed                	jne    80104380 <acquiresleep+0x20>
80104393:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104399:	e8 32 f5 ff ff       	call   801038d0 <myproc>
8010439e:	8b 40 10             	mov    0x10(%eax),%eax
801043a1:	89 43 3c             	mov    %eax,0x3c(%ebx)
801043a4:	89 75 08             	mov    %esi,0x8(%ebp)
801043a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043aa:	5b                   	pop    %ebx
801043ab:	5e                   	pop    %esi
801043ac:	5d                   	pop    %ebp
801043ad:	e9 9e 02 00 00       	jmp    80104650 <release>
801043b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043c0 <releasesleep>:
801043c0:	55                   	push   %ebp
801043c1:	89 e5                	mov    %esp,%ebp
801043c3:	56                   	push   %esi
801043c4:	53                   	push   %ebx
801043c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043c8:	83 ec 0c             	sub    $0xc,%esp
801043cb:	8d 73 04             	lea    0x4(%ebx),%esi
801043ce:	56                   	push   %esi
801043cf:	e8 bc 01 00 00       	call   80104590 <acquire>
801043d4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801043da:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801043e1:	89 1c 24             	mov    %ebx,(%esp)
801043e4:	e8 c7 fc ff ff       	call   801040b0 <wakeup>
801043e9:	89 75 08             	mov    %esi,0x8(%ebp)
801043ec:	83 c4 10             	add    $0x10,%esp
801043ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043f2:	5b                   	pop    %ebx
801043f3:	5e                   	pop    %esi
801043f4:	5d                   	pop    %ebp
801043f5:	e9 56 02 00 00       	jmp    80104650 <release>
801043fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104400 <holdingsleep>:
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	57                   	push   %edi
80104404:	56                   	push   %esi
80104405:	53                   	push   %ebx
80104406:	31 ff                	xor    %edi,%edi
80104408:	83 ec 18             	sub    $0x18,%esp
8010440b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010440e:	8d 73 04             	lea    0x4(%ebx),%esi
80104411:	56                   	push   %esi
80104412:	e8 79 01 00 00       	call   80104590 <acquire>
80104417:	8b 03                	mov    (%ebx),%eax
80104419:	83 c4 10             	add    $0x10,%esp
8010441c:	85 c0                	test   %eax,%eax
8010441e:	74 13                	je     80104433 <holdingsleep+0x33>
80104420:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104423:	e8 a8 f4 ff ff       	call   801038d0 <myproc>
80104428:	39 58 10             	cmp    %ebx,0x10(%eax)
8010442b:	0f 94 c0             	sete   %al
8010442e:	0f b6 c0             	movzbl %al,%eax
80104431:	89 c7                	mov    %eax,%edi
80104433:	83 ec 0c             	sub    $0xc,%esp
80104436:	56                   	push   %esi
80104437:	e8 14 02 00 00       	call   80104650 <release>
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
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	8b 45 08             	mov    0x8(%ebp),%eax
80104456:	8b 55 0c             	mov    0xc(%ebp),%edx
80104459:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010445f:	89 50 04             	mov    %edx,0x4(%eax)
80104462:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104469:	5d                   	pop    %ebp
8010446a:	c3                   	ret    
8010446b:	90                   	nop
8010446c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104470 <getcallerpcs>:
80104470:	55                   	push   %ebp
80104471:	31 d2                	xor    %edx,%edx
80104473:	89 e5                	mov    %esp,%ebp
80104475:	53                   	push   %ebx
80104476:	8b 45 08             	mov    0x8(%ebp),%eax
80104479:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010447c:	83 e8 08             	sub    $0x8,%eax
8010447f:	90                   	nop
80104480:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104486:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010448c:	77 1a                	ja     801044a8 <getcallerpcs+0x38>
8010448e:	8b 58 04             	mov    0x4(%eax),%ebx
80104491:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
80104494:	83 c2 01             	add    $0x1,%edx
80104497:	8b 00                	mov    (%eax),%eax
80104499:	83 fa 0a             	cmp    $0xa,%edx
8010449c:	75 e2                	jne    80104480 <getcallerpcs+0x10>
8010449e:	5b                   	pop    %ebx
8010449f:	5d                   	pop    %ebp
801044a0:	c3                   	ret    
801044a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044a8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801044ab:	83 c1 28             	add    $0x28,%ecx
801044ae:	66 90                	xchg   %ax,%ax
801044b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801044b6:	83 c0 04             	add    $0x4,%eax
801044b9:	39 c1                	cmp    %eax,%ecx
801044bb:	75 f3                	jne    801044b0 <getcallerpcs+0x40>
801044bd:	5b                   	pop    %ebx
801044be:	5d                   	pop    %ebp
801044bf:	c3                   	ret    

801044c0 <pushcli>:
801044c0:	55                   	push   %ebp
801044c1:	89 e5                	mov    %esp,%ebp
801044c3:	53                   	push   %ebx
801044c4:	83 ec 04             	sub    $0x4,%esp
801044c7:	9c                   	pushf  
801044c8:	5b                   	pop    %ebx
801044c9:	fa                   	cli    
801044ca:	e8 61 f3 ff ff       	call   80103830 <mycpu>
801044cf:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801044d5:	85 c0                	test   %eax,%eax
801044d7:	75 11                	jne    801044ea <pushcli+0x2a>
801044d9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801044df:	e8 4c f3 ff ff       	call   80103830 <mycpu>
801044e4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
801044ea:	e8 41 f3 ff ff       	call   80103830 <mycpu>
801044ef:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
801044f6:	83 c4 04             	add    $0x4,%esp
801044f9:	5b                   	pop    %ebx
801044fa:	5d                   	pop    %ebp
801044fb:	c3                   	ret    
801044fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104500 <popcli>:
80104500:	55                   	push   %ebp
80104501:	89 e5                	mov    %esp,%ebp
80104503:	83 ec 08             	sub    $0x8,%esp
80104506:	9c                   	pushf  
80104507:	58                   	pop    %eax
80104508:	f6 c4 02             	test   $0x2,%ah
8010450b:	75 35                	jne    80104542 <popcli+0x42>
8010450d:	e8 1e f3 ff ff       	call   80103830 <mycpu>
80104512:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104519:	78 34                	js     8010454f <popcli+0x4f>
8010451b:	e8 10 f3 ff ff       	call   80103830 <mycpu>
80104520:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104526:	85 d2                	test   %edx,%edx
80104528:	74 06                	je     80104530 <popcli+0x30>
8010452a:	c9                   	leave  
8010452b:	c3                   	ret    
8010452c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104530:	e8 fb f2 ff ff       	call   80103830 <mycpu>
80104535:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010453b:	85 c0                	test   %eax,%eax
8010453d:	74 eb                	je     8010452a <popcli+0x2a>
8010453f:	fb                   	sti    
80104540:	c9                   	leave  
80104541:	c3                   	ret    
80104542:	83 ec 0c             	sub    $0xc,%esp
80104545:	68 53 7a 10 80       	push   $0x80107a53
8010454a:	e8 41 be ff ff       	call   80100390 <panic>
8010454f:	83 ec 0c             	sub    $0xc,%esp
80104552:	68 6a 7a 10 80       	push   $0x80107a6a
80104557:	e8 34 be ff ff       	call   80100390 <panic>
8010455c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104560 <holding>:
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	56                   	push   %esi
80104564:	53                   	push   %ebx
80104565:	8b 75 08             	mov    0x8(%ebp),%esi
80104568:	31 db                	xor    %ebx,%ebx
8010456a:	e8 51 ff ff ff       	call   801044c0 <pushcli>
8010456f:	8b 06                	mov    (%esi),%eax
80104571:	85 c0                	test   %eax,%eax
80104573:	74 10                	je     80104585 <holding+0x25>
80104575:	8b 5e 08             	mov    0x8(%esi),%ebx
80104578:	e8 b3 f2 ff ff       	call   80103830 <mycpu>
8010457d:	39 c3                	cmp    %eax,%ebx
8010457f:	0f 94 c3             	sete   %bl
80104582:	0f b6 db             	movzbl %bl,%ebx
80104585:	e8 76 ff ff ff       	call   80104500 <popcli>
8010458a:	89 d8                	mov    %ebx,%eax
8010458c:	5b                   	pop    %ebx
8010458d:	5e                   	pop    %esi
8010458e:	5d                   	pop    %ebp
8010458f:	c3                   	ret    

80104590 <acquire>:
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	56                   	push   %esi
80104594:	53                   	push   %ebx
80104595:	e8 26 ff ff ff       	call   801044c0 <pushcli>
8010459a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010459d:	83 ec 0c             	sub    $0xc,%esp
801045a0:	53                   	push   %ebx
801045a1:	e8 ba ff ff ff       	call   80104560 <holding>
801045a6:	83 c4 10             	add    $0x10,%esp
801045a9:	85 c0                	test   %eax,%eax
801045ab:	0f 85 83 00 00 00    	jne    80104634 <acquire+0xa4>
801045b1:	89 c6                	mov    %eax,%esi
801045b3:	ba 01 00 00 00       	mov    $0x1,%edx
801045b8:	eb 09                	jmp    801045c3 <acquire+0x33>
801045ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045c3:	89 d0                	mov    %edx,%eax
801045c5:	f0 87 03             	lock xchg %eax,(%ebx)
801045c8:	85 c0                	test   %eax,%eax
801045ca:	75 f4                	jne    801045c0 <acquire+0x30>
801045cc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801045d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045d4:	e8 57 f2 ff ff       	call   80103830 <mycpu>
801045d9:	8d 53 0c             	lea    0xc(%ebx),%edx
801045dc:	89 43 08             	mov    %eax,0x8(%ebx)
801045df:	89 e8                	mov    %ebp,%eax
801045e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045e8:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
801045ee:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
801045f4:	77 1a                	ja     80104610 <acquire+0x80>
801045f6:	8b 48 04             	mov    0x4(%eax),%ecx
801045f9:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
801045fc:	83 c6 01             	add    $0x1,%esi
801045ff:	8b 00                	mov    (%eax),%eax
80104601:	83 fe 0a             	cmp    $0xa,%esi
80104604:	75 e2                	jne    801045e8 <acquire+0x58>
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
80104620:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104626:	83 c0 04             	add    $0x4,%eax
80104629:	39 d0                	cmp    %edx,%eax
8010462b:	75 f3                	jne    80104620 <acquire+0x90>
8010462d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104630:	5b                   	pop    %ebx
80104631:	5e                   	pop    %esi
80104632:	5d                   	pop    %ebp
80104633:	c3                   	ret    
80104634:	83 ec 0c             	sub    $0xc,%esp
80104637:	68 71 7a 10 80       	push   $0x80107a71
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
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	53                   	push   %ebx
80104654:	83 ec 10             	sub    $0x10,%esp
80104657:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010465a:	53                   	push   %ebx
8010465b:	e8 00 ff ff ff       	call   80104560 <holding>
80104660:	83 c4 10             	add    $0x10,%esp
80104663:	85 c0                	test   %eax,%eax
80104665:	74 22                	je     80104689 <release+0x39>
80104667:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010466e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104675:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
8010467a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104680:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104683:	c9                   	leave  
80104684:	e9 77 fe ff ff       	jmp    80104500 <popcli>
80104689:	83 ec 0c             	sub    $0xc,%esp
8010468c:	68 79 7a 10 80       	push   $0x80107a79
80104691:	e8 fa bc ff ff       	call   80100390 <panic>
80104696:	66 90                	xchg   %ax,%ax
80104698:	66 90                	xchg   %ax,%ax
8010469a:	66 90                	xchg   %ax,%ax
8010469c:	66 90                	xchg   %ax,%ax
8010469e:	66 90                	xchg   %ax,%ax

801046a0 <memset>:
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	57                   	push   %edi
801046a4:	53                   	push   %ebx
801046a5:	8b 55 08             	mov    0x8(%ebp),%edx
801046a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801046ab:	f6 c2 03             	test   $0x3,%dl
801046ae:	75 05                	jne    801046b5 <memset+0x15>
801046b0:	f6 c1 03             	test   $0x3,%cl
801046b3:	74 13                	je     801046c8 <memset+0x28>
801046b5:	89 d7                	mov    %edx,%edi
801046b7:	8b 45 0c             	mov    0xc(%ebp),%eax
801046ba:	fc                   	cld    
801046bb:	f3 aa                	rep stos %al,%es:(%edi)
801046bd:	5b                   	pop    %ebx
801046be:	89 d0                	mov    %edx,%eax
801046c0:	5f                   	pop    %edi
801046c1:	5d                   	pop    %ebp
801046c2:	c3                   	ret    
801046c3:	90                   	nop
801046c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046c8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801046cc:	c1 e9 02             	shr    $0x2,%ecx
801046cf:	89 f8                	mov    %edi,%eax
801046d1:	89 fb                	mov    %edi,%ebx
801046d3:	c1 e0 18             	shl    $0x18,%eax
801046d6:	c1 e3 10             	shl    $0x10,%ebx
801046d9:	09 d8                	or     %ebx,%eax
801046db:	09 f8                	or     %edi,%eax
801046dd:	c1 e7 08             	shl    $0x8,%edi
801046e0:	09 f8                	or     %edi,%eax
801046e2:	89 d7                	mov    %edx,%edi
801046e4:	fc                   	cld    
801046e5:	f3 ab                	rep stos %eax,%es:(%edi)
801046e7:	5b                   	pop    %ebx
801046e8:	89 d0                	mov    %edx,%eax
801046ea:	5f                   	pop    %edi
801046eb:	5d                   	pop    %ebp
801046ec:	c3                   	ret    
801046ed:	8d 76 00             	lea    0x0(%esi),%esi

801046f0 <memcmp>:
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
801046f3:	57                   	push   %edi
801046f4:	56                   	push   %esi
801046f5:	53                   	push   %ebx
801046f6:	8b 5d 10             	mov    0x10(%ebp),%ebx
801046f9:	8b 75 08             	mov    0x8(%ebp),%esi
801046fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801046ff:	85 db                	test   %ebx,%ebx
80104701:	74 29                	je     8010472c <memcmp+0x3c>
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
80104728:	39 d8                	cmp    %ebx,%eax
8010472a:	75 ec                	jne    80104718 <memcmp+0x28>
8010472c:	5b                   	pop    %ebx
8010472d:	31 c0                	xor    %eax,%eax
8010472f:	5e                   	pop    %esi
80104730:	5f                   	pop    %edi
80104731:	5d                   	pop    %ebp
80104732:	c3                   	ret    
80104733:	90                   	nop
80104734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104738:	0f b6 c2             	movzbl %dl,%eax
8010473b:	5b                   	pop    %ebx
8010473c:	29 c8                	sub    %ecx,%eax
8010473e:	5e                   	pop    %esi
8010473f:	5f                   	pop    %edi
80104740:	5d                   	pop    %ebp
80104741:	c3                   	ret    
80104742:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104750 <memmove>:
80104750:	55                   	push   %ebp
80104751:	89 e5                	mov    %esp,%ebp
80104753:	56                   	push   %esi
80104754:	53                   	push   %ebx
80104755:	8b 45 08             	mov    0x8(%ebp),%eax
80104758:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010475b:	8b 75 10             	mov    0x10(%ebp),%esi
8010475e:	39 c3                	cmp    %eax,%ebx
80104760:	73 26                	jae    80104788 <memmove+0x38>
80104762:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80104765:	39 c8                	cmp    %ecx,%eax
80104767:	73 1f                	jae    80104788 <memmove+0x38>
80104769:	85 f6                	test   %esi,%esi
8010476b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010476e:	74 0f                	je     8010477f <memmove+0x2f>
80104770:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104774:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104777:	83 ea 01             	sub    $0x1,%edx
8010477a:	83 fa ff             	cmp    $0xffffffff,%edx
8010477d:	75 f1                	jne    80104770 <memmove+0x20>
8010477f:	5b                   	pop    %ebx
80104780:	5e                   	pop    %esi
80104781:	5d                   	pop    %ebp
80104782:	c3                   	ret    
80104783:	90                   	nop
80104784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104788:	31 d2                	xor    %edx,%edx
8010478a:	85 f6                	test   %esi,%esi
8010478c:	74 f1                	je     8010477f <memmove+0x2f>
8010478e:	66 90                	xchg   %ax,%ax
80104790:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104794:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104797:	83 c2 01             	add    $0x1,%edx
8010479a:	39 d6                	cmp    %edx,%esi
8010479c:	75 f2                	jne    80104790 <memmove+0x40>
8010479e:	5b                   	pop    %ebx
8010479f:	5e                   	pop    %esi
801047a0:	5d                   	pop    %ebp
801047a1:	c3                   	ret    
801047a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047b0 <memcpy>:
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	5d                   	pop    %ebp
801047b4:	eb 9a                	jmp    80104750 <memmove>
801047b6:	8d 76 00             	lea    0x0(%esi),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047c0 <strncmp>:
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	57                   	push   %edi
801047c4:	56                   	push   %esi
801047c5:	8b 7d 10             	mov    0x10(%ebp),%edi
801047c8:	53                   	push   %ebx
801047c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801047cc:	8b 75 0c             	mov    0xc(%ebp),%esi
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
801047f8:	8d 56 01             	lea    0x1(%esi),%edx
801047fb:	83 c1 01             	add    $0x1,%ecx
801047fe:	39 fa                	cmp    %edi,%edx
80104800:	75 e6                	jne    801047e8 <strncmp+0x28>
80104802:	5b                   	pop    %ebx
80104803:	31 c0                	xor    %eax,%eax
80104805:	5e                   	pop    %esi
80104806:	5f                   	pop    %edi
80104807:	5d                   	pop    %ebp
80104808:	c3                   	ret    
80104809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104810:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
80104814:	29 d8                	sub    %ebx,%eax
80104816:	5b                   	pop    %ebx
80104817:	5e                   	pop    %esi
80104818:	5f                   	pop    %edi
80104819:	5d                   	pop    %ebp
8010481a:	c3                   	ret    
8010481b:	90                   	nop
8010481c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104820 <strncpy>:
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	56                   	push   %esi
80104824:	53                   	push   %ebx
80104825:	8b 45 08             	mov    0x8(%ebp),%eax
80104828:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010482b:	8b 4d 10             	mov    0x10(%ebp),%ecx
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
80104852:	31 c9                	xor    %ecx,%ecx
80104854:	85 f6                	test   %esi,%esi
80104856:	7e 17                	jle    8010486f <strncpy+0x4f>
80104858:	90                   	nop
80104859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104860:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104864:	89 f3                	mov    %esi,%ebx
80104866:	83 c1 01             	add    $0x1,%ecx
80104869:	29 cb                	sub    %ecx,%ebx
8010486b:	85 db                	test   %ebx,%ebx
8010486d:	7f f1                	jg     80104860 <strncpy+0x40>
8010486f:	5b                   	pop    %ebx
80104870:	5e                   	pop    %esi
80104871:	5d                   	pop    %ebp
80104872:	c3                   	ret    
80104873:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104880 <safestrcpy>:
80104880:	55                   	push   %ebp
80104881:	89 e5                	mov    %esp,%ebp
80104883:	56                   	push   %esi
80104884:	53                   	push   %ebx
80104885:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104888:	8b 45 08             	mov    0x8(%ebp),%eax
8010488b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010488e:	85 c9                	test   %ecx,%ecx
80104890:	7e 26                	jle    801048b8 <safestrcpy+0x38>
80104892:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104896:	89 c1                	mov    %eax,%ecx
80104898:	eb 17                	jmp    801048b1 <safestrcpy+0x31>
8010489a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048a0:	83 c2 01             	add    $0x1,%edx
801048a3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801048a7:	83 c1 01             	add    $0x1,%ecx
801048aa:	84 db                	test   %bl,%bl
801048ac:	88 59 ff             	mov    %bl,-0x1(%ecx)
801048af:	74 04                	je     801048b5 <safestrcpy+0x35>
801048b1:	39 f2                	cmp    %esi,%edx
801048b3:	75 eb                	jne    801048a0 <safestrcpy+0x20>
801048b5:	c6 01 00             	movb   $0x0,(%ecx)
801048b8:	5b                   	pop    %ebx
801048b9:	5e                   	pop    %esi
801048ba:	5d                   	pop    %ebp
801048bb:	c3                   	ret    
801048bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801048c0 <strlen>:
801048c0:	55                   	push   %ebp
801048c1:	31 c0                	xor    %eax,%eax
801048c3:	89 e5                	mov    %esp,%ebp
801048c5:	8b 55 08             	mov    0x8(%ebp),%edx
801048c8:	80 3a 00             	cmpb   $0x0,(%edx)
801048cb:	74 0c                	je     801048d9 <strlen+0x19>
801048cd:	8d 76 00             	lea    0x0(%esi),%esi
801048d0:	83 c0 01             	add    $0x1,%eax
801048d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801048d7:	75 f7                	jne    801048d0 <strlen+0x10>
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
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	53                   	push   %ebx
801048f4:	83 ec 04             	sub    $0x4,%esp
801048f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801048fa:	e8 d1 ef ff ff       	call   801038d0 <myproc>
801048ff:	8b 00                	mov    (%eax),%eax
80104901:	39 d8                	cmp    %ebx,%eax
80104903:	76 1b                	jbe    80104920 <fetchint+0x30>
80104905:	8d 53 04             	lea    0x4(%ebx),%edx
80104908:	39 d0                	cmp    %edx,%eax
8010490a:	72 14                	jb     80104920 <fetchint+0x30>
8010490c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010490f:	8b 13                	mov    (%ebx),%edx
80104911:	89 10                	mov    %edx,(%eax)
80104913:	31 c0                	xor    %eax,%eax
80104915:	83 c4 04             	add    $0x4,%esp
80104918:	5b                   	pop    %ebx
80104919:	5d                   	pop    %ebp
8010491a:	c3                   	ret    
8010491b:	90                   	nop
8010491c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104920:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104925:	eb ee                	jmp    80104915 <fetchint+0x25>
80104927:	89 f6                	mov    %esi,%esi
80104929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104930 <fetchstr>:
80104930:	55                   	push   %ebp
80104931:	89 e5                	mov    %esp,%ebp
80104933:	53                   	push   %ebx
80104934:	83 ec 04             	sub    $0x4,%esp
80104937:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010493a:	e8 91 ef ff ff       	call   801038d0 <myproc>
8010493f:	39 18                	cmp    %ebx,(%eax)
80104941:	76 29                	jbe    8010496c <fetchstr+0x3c>
80104943:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104946:	89 da                	mov    %ebx,%edx
80104948:	89 19                	mov    %ebx,(%ecx)
8010494a:	8b 00                	mov    (%eax),%eax
8010494c:	39 c3                	cmp    %eax,%ebx
8010494e:	73 1c                	jae    8010496c <fetchstr+0x3c>
80104950:	80 3b 00             	cmpb   $0x0,(%ebx)
80104953:	75 10                	jne    80104965 <fetchstr+0x35>
80104955:	eb 39                	jmp    80104990 <fetchstr+0x60>
80104957:	89 f6                	mov    %esi,%esi
80104959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104960:	80 3a 00             	cmpb   $0x0,(%edx)
80104963:	74 1b                	je     80104980 <fetchstr+0x50>
80104965:	83 c2 01             	add    $0x1,%edx
80104968:	39 d0                	cmp    %edx,%eax
8010496a:	77 f4                	ja     80104960 <fetchstr+0x30>
8010496c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
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
80104990:	31 c0                	xor    %eax,%eax
80104992:	eb dd                	jmp    80104971 <fetchstr+0x41>
80104994:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010499a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801049a0 <argint>:
801049a0:	55                   	push   %ebp
801049a1:	89 e5                	mov    %esp,%ebp
801049a3:	56                   	push   %esi
801049a4:	53                   	push   %ebx
801049a5:	e8 26 ef ff ff       	call   801038d0 <myproc>
801049aa:	8b 40 18             	mov    0x18(%eax),%eax
801049ad:	8b 55 08             	mov    0x8(%ebp),%edx
801049b0:	8b 40 44             	mov    0x44(%eax),%eax
801049b3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801049b6:	e8 15 ef ff ff       	call   801038d0 <myproc>
801049bb:	8b 00                	mov    (%eax),%eax
801049bd:	8d 73 04             	lea    0x4(%ebx),%esi
801049c0:	39 c6                	cmp    %eax,%esi
801049c2:	73 1c                	jae    801049e0 <argint+0x40>
801049c4:	8d 53 08             	lea    0x8(%ebx),%edx
801049c7:	39 d0                	cmp    %edx,%eax
801049c9:	72 15                	jb     801049e0 <argint+0x40>
801049cb:	8b 45 0c             	mov    0xc(%ebp),%eax
801049ce:	8b 53 04             	mov    0x4(%ebx),%edx
801049d1:	89 10                	mov    %edx,(%eax)
801049d3:	31 c0                	xor    %eax,%eax
801049d5:	5b                   	pop    %ebx
801049d6:	5e                   	pop    %esi
801049d7:	5d                   	pop    %ebp
801049d8:	c3                   	ret    
801049d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049e5:	eb ee                	jmp    801049d5 <argint+0x35>
801049e7:	89 f6                	mov    %esi,%esi
801049e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049f0 <argptr>:
801049f0:	55                   	push   %ebp
801049f1:	89 e5                	mov    %esp,%ebp
801049f3:	56                   	push   %esi
801049f4:	53                   	push   %ebx
801049f5:	83 ec 10             	sub    $0x10,%esp
801049f8:	8b 5d 10             	mov    0x10(%ebp),%ebx
801049fb:	e8 d0 ee ff ff       	call   801038d0 <myproc>
80104a00:	89 c6                	mov    %eax,%esi
80104a02:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a05:	83 ec 08             	sub    $0x8,%esp
80104a08:	50                   	push   %eax
80104a09:	ff 75 08             	pushl  0x8(%ebp)
80104a0c:	e8 8f ff ff ff       	call   801049a0 <argint>
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
80104a2b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a2e:	89 02                	mov    %eax,(%edx)
80104a30:	31 c0                	xor    %eax,%eax
80104a32:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a35:	5b                   	pop    %ebx
80104a36:	5e                   	pop    %esi
80104a37:	5d                   	pop    %ebp
80104a38:	c3                   	ret    
80104a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a45:	eb eb                	jmp    80104a32 <argptr+0x42>
80104a47:	89 f6                	mov    %esi,%esi
80104a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a50 <argstr>:
80104a50:	55                   	push   %ebp
80104a51:	89 e5                	mov    %esp,%ebp
80104a53:	83 ec 20             	sub    $0x20,%esp
80104a56:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a59:	50                   	push   %eax
80104a5a:	ff 75 08             	pushl  0x8(%ebp)
80104a5d:	e8 3e ff ff ff       	call   801049a0 <argint>
80104a62:	83 c4 10             	add    $0x10,%esp
80104a65:	85 c0                	test   %eax,%eax
80104a67:	78 17                	js     80104a80 <argstr+0x30>
80104a69:	83 ec 08             	sub    $0x8,%esp
80104a6c:	ff 75 0c             	pushl  0xc(%ebp)
80104a6f:	ff 75 f4             	pushl  -0xc(%ebp)
80104a72:	e8 b9 fe ff ff       	call   80104930 <fetchstr>
80104a77:	83 c4 10             	add    $0x10,%esp
80104a7a:	c9                   	leave  
80104a7b:	c3                   	ret    
80104a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a85:	c9                   	leave  
80104a86:	c3                   	ret    
80104a87:	89 f6                	mov    %esi,%esi
80104a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a90 <getreadcount>:
80104a90:	55                   	push   %ebp
80104a91:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80104a96:	89 e5                	mov    %esp,%ebp
80104a98:	5d                   	pop    %ebp
80104a99:	c3                   	ret    
80104a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104aa0 <syscall>:
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	53                   	push   %ebx
80104aa4:	83 ec 04             	sub    $0x4,%esp
80104aa7:	e8 24 ee ff ff       	call   801038d0 <myproc>
80104aac:	89 c3                	mov    %eax,%ebx
80104aae:	8b 40 18             	mov    0x18(%eax),%eax
80104ab1:	8b 40 1c             	mov    0x1c(%eax),%eax
80104ab4:	8d 50 ff             	lea    -0x1(%eax),%edx
80104ab7:	83 fa 18             	cmp    $0x18,%edx
80104aba:	77 24                	ja     80104ae0 <syscall+0x40>
80104abc:	8b 14 85 a0 7a 10 80 	mov    -0x7fef8560(,%eax,4),%edx
80104ac3:	85 d2                	test   %edx,%edx
80104ac5:	74 19                	je     80104ae0 <syscall+0x40>
80104ac7:	83 f8 05             	cmp    $0x5,%eax
80104aca:	75 07                	jne    80104ad3 <syscall+0x33>
80104acc:	83 05 bc a5 10 80 01 	addl   $0x1,0x8010a5bc
80104ad3:	ff d2                	call   *%edx
80104ad5:	8b 53 18             	mov    0x18(%ebx),%edx
80104ad8:	89 42 1c             	mov    %eax,0x1c(%edx)
80104adb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ade:	c9                   	leave  
80104adf:	c3                   	ret    
80104ae0:	50                   	push   %eax
80104ae1:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104ae4:	50                   	push   %eax
80104ae5:	ff 73 10             	pushl  0x10(%ebx)
80104ae8:	68 81 7a 10 80       	push   $0x80107a81
80104aed:	e8 6e bb ff ff       	call   80100660 <cprintf>
80104af2:	8b 43 18             	mov    0x18(%ebx),%eax
80104af5:	83 c4 10             	add    $0x10,%esp
80104af8:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
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
80104b10:	55                   	push   %ebp
80104b11:	89 e5                	mov    %esp,%ebp
80104b13:	57                   	push   %edi
80104b14:	56                   	push   %esi
80104b15:	53                   	push   %ebx
80104b16:	8d 75 da             	lea    -0x26(%ebp),%esi
80104b19:	83 ec 34             	sub    $0x34,%esp
80104b1c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104b1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104b22:	56                   	push   %esi
80104b23:	50                   	push   %eax
80104b24:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104b27:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80104b2a:	e8 41 d4 ff ff       	call   80101f70 <nameiparent>
80104b2f:	83 c4 10             	add    $0x10,%esp
80104b32:	85 c0                	test   %eax,%eax
80104b34:	0f 84 46 01 00 00    	je     80104c80 <create+0x170>
80104b3a:	83 ec 0c             	sub    $0xc,%esp
80104b3d:	89 c3                	mov    %eax,%ebx
80104b3f:	50                   	push   %eax
80104b40:	e8 ab cb ff ff       	call   801016f0 <ilock>
80104b45:	83 c4 0c             	add    $0xc,%esp
80104b48:	6a 00                	push   $0x0
80104b4a:	56                   	push   %esi
80104b4b:	53                   	push   %ebx
80104b4c:	e8 cf d0 ff ff       	call   80101c20 <dirlookup>
80104b51:	83 c4 10             	add    $0x10,%esp
80104b54:	85 c0                	test   %eax,%eax
80104b56:	89 c7                	mov    %eax,%edi
80104b58:	74 36                	je     80104b90 <create+0x80>
80104b5a:	83 ec 0c             	sub    $0xc,%esp
80104b5d:	53                   	push   %ebx
80104b5e:	e8 1d ce ff ff       	call   80101980 <iunlockput>
80104b63:	89 3c 24             	mov    %edi,(%esp)
80104b66:	e8 85 cb ff ff       	call   801016f0 <ilock>
80104b6b:	83 c4 10             	add    $0x10,%esp
80104b6e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104b73:	0f 85 97 00 00 00    	jne    80104c10 <create+0x100>
80104b79:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104b7e:	0f 85 8c 00 00 00    	jne    80104c10 <create+0x100>
80104b84:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b87:	89 f8                	mov    %edi,%eax
80104b89:	5b                   	pop    %ebx
80104b8a:	5e                   	pop    %esi
80104b8b:	5f                   	pop    %edi
80104b8c:	5d                   	pop    %ebp
80104b8d:	c3                   	ret    
80104b8e:	66 90                	xchg   %ax,%ax
80104b90:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104b94:	83 ec 08             	sub    $0x8,%esp
80104b97:	50                   	push   %eax
80104b98:	ff 33                	pushl  (%ebx)
80104b9a:	e8 e1 c9 ff ff       	call   80101580 <ialloc>
80104b9f:	83 c4 10             	add    $0x10,%esp
80104ba2:	85 c0                	test   %eax,%eax
80104ba4:	89 c7                	mov    %eax,%edi
80104ba6:	0f 84 e8 00 00 00    	je     80104c94 <create+0x184>
80104bac:	83 ec 0c             	sub    $0xc,%esp
80104baf:	50                   	push   %eax
80104bb0:	e8 3b cb ff ff       	call   801016f0 <ilock>
80104bb5:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104bb9:	66 89 47 52          	mov    %ax,0x52(%edi)
80104bbd:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104bc1:	66 89 47 54          	mov    %ax,0x54(%edi)
80104bc5:	b8 01 00 00 00       	mov    $0x1,%eax
80104bca:	66 89 47 56          	mov    %ax,0x56(%edi)
80104bce:	89 3c 24             	mov    %edi,(%esp)
80104bd1:	e8 6a ca ff ff       	call   80101640 <iupdate>
80104bd6:	83 c4 10             	add    $0x10,%esp
80104bd9:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104bde:	74 50                	je     80104c30 <create+0x120>
80104be0:	83 ec 04             	sub    $0x4,%esp
80104be3:	ff 77 04             	pushl  0x4(%edi)
80104be6:	56                   	push   %esi
80104be7:	53                   	push   %ebx
80104be8:	e8 a3 d2 ff ff       	call   80101e90 <dirlink>
80104bed:	83 c4 10             	add    $0x10,%esp
80104bf0:	85 c0                	test   %eax,%eax
80104bf2:	0f 88 8f 00 00 00    	js     80104c87 <create+0x177>
80104bf8:	83 ec 0c             	sub    $0xc,%esp
80104bfb:	53                   	push   %ebx
80104bfc:	e8 7f cd ff ff       	call   80101980 <iunlockput>
80104c01:	83 c4 10             	add    $0x10,%esp
80104c04:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c07:	89 f8                	mov    %edi,%eax
80104c09:	5b                   	pop    %ebx
80104c0a:	5e                   	pop    %esi
80104c0b:	5f                   	pop    %edi
80104c0c:	5d                   	pop    %ebp
80104c0d:	c3                   	ret    
80104c0e:	66 90                	xchg   %ax,%ax
80104c10:	83 ec 0c             	sub    $0xc,%esp
80104c13:	57                   	push   %edi
80104c14:	31 ff                	xor    %edi,%edi
80104c16:	e8 65 cd ff ff       	call   80101980 <iunlockput>
80104c1b:	83 c4 10             	add    $0x10,%esp
80104c1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c21:	89 f8                	mov    %edi,%eax
80104c23:	5b                   	pop    %ebx
80104c24:	5e                   	pop    %esi
80104c25:	5f                   	pop    %edi
80104c26:	5d                   	pop    %ebp
80104c27:	c3                   	ret    
80104c28:	90                   	nop
80104c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c30:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104c35:	83 ec 0c             	sub    $0xc,%esp
80104c38:	53                   	push   %ebx
80104c39:	e8 02 ca ff ff       	call   80101640 <iupdate>
80104c3e:	83 c4 0c             	add    $0xc,%esp
80104c41:	ff 77 04             	pushl  0x4(%edi)
80104c44:	68 24 7b 10 80       	push   $0x80107b24
80104c49:	57                   	push   %edi
80104c4a:	e8 41 d2 ff ff       	call   80101e90 <dirlink>
80104c4f:	83 c4 10             	add    $0x10,%esp
80104c52:	85 c0                	test   %eax,%eax
80104c54:	78 1c                	js     80104c72 <create+0x162>
80104c56:	83 ec 04             	sub    $0x4,%esp
80104c59:	ff 73 04             	pushl  0x4(%ebx)
80104c5c:	68 23 7b 10 80       	push   $0x80107b23
80104c61:	57                   	push   %edi
80104c62:	e8 29 d2 ff ff       	call   80101e90 <dirlink>
80104c67:	83 c4 10             	add    $0x10,%esp
80104c6a:	85 c0                	test   %eax,%eax
80104c6c:	0f 89 6e ff ff ff    	jns    80104be0 <create+0xd0>
80104c72:	83 ec 0c             	sub    $0xc,%esp
80104c75:	68 17 7b 10 80       	push   $0x80107b17
80104c7a:	e8 11 b7 ff ff       	call   80100390 <panic>
80104c7f:	90                   	nop
80104c80:	31 ff                	xor    %edi,%edi
80104c82:	e9 fd fe ff ff       	jmp    80104b84 <create+0x74>
80104c87:	83 ec 0c             	sub    $0xc,%esp
80104c8a:	68 26 7b 10 80       	push   $0x80107b26
80104c8f:	e8 fc b6 ff ff       	call   80100390 <panic>
80104c94:	83 ec 0c             	sub    $0xc,%esp
80104c97:	68 08 7b 10 80       	push   $0x80107b08
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
80104cb0:	55                   	push   %ebp
80104cb1:	89 e5                	mov    %esp,%ebp
80104cb3:	56                   	push   %esi
80104cb4:	53                   	push   %ebx
80104cb5:	89 c3                	mov    %eax,%ebx
80104cb7:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cba:	89 d6                	mov    %edx,%esi
80104cbc:	83 ec 18             	sub    $0x18,%esp
80104cbf:	50                   	push   %eax
80104cc0:	6a 00                	push   $0x0
80104cc2:	e8 d9 fc ff ff       	call   801049a0 <argint>
80104cc7:	83 c4 10             	add    $0x10,%esp
80104cca:	85 c0                	test   %eax,%eax
80104ccc:	78 2a                	js     80104cf8 <argfd.constprop.0+0x48>
80104cce:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104cd2:	77 24                	ja     80104cf8 <argfd.constprop.0+0x48>
80104cd4:	e8 f7 eb ff ff       	call   801038d0 <myproc>
80104cd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104cdc:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104ce0:	85 c0                	test   %eax,%eax
80104ce2:	74 14                	je     80104cf8 <argfd.constprop.0+0x48>
80104ce4:	85 db                	test   %ebx,%ebx
80104ce6:	74 02                	je     80104cea <argfd.constprop.0+0x3a>
80104ce8:	89 13                	mov    %edx,(%ebx)
80104cea:	89 06                	mov    %eax,(%esi)
80104cec:	31 c0                	xor    %eax,%eax
80104cee:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104cf1:	5b                   	pop    %ebx
80104cf2:	5e                   	pop    %esi
80104cf3:	5d                   	pop    %ebp
80104cf4:	c3                   	ret    
80104cf5:	8d 76 00             	lea    0x0(%esi),%esi
80104cf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cfd:	eb ef                	jmp    80104cee <argfd.constprop.0+0x3e>
80104cff:	90                   	nop

80104d00 <sys_dup>:
80104d00:	55                   	push   %ebp
80104d01:	31 c0                	xor    %eax,%eax
80104d03:	89 e5                	mov    %esp,%ebp
80104d05:	56                   	push   %esi
80104d06:	53                   	push   %ebx
80104d07:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104d0a:	83 ec 10             	sub    $0x10,%esp
80104d0d:	e8 9e ff ff ff       	call   80104cb0 <argfd.constprop.0>
80104d12:	85 c0                	test   %eax,%eax
80104d14:	78 42                	js     80104d58 <sys_dup+0x58>
80104d16:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104d19:	31 db                	xor    %ebx,%ebx
80104d1b:	e8 b0 eb ff ff       	call   801038d0 <myproc>
80104d20:	eb 0e                	jmp    80104d30 <sys_dup+0x30>
80104d22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104d28:	83 c3 01             	add    $0x1,%ebx
80104d2b:	83 fb 10             	cmp    $0x10,%ebx
80104d2e:	74 28                	je     80104d58 <sys_dup+0x58>
80104d30:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104d34:	85 d2                	test   %edx,%edx
80104d36:	75 f0                	jne    80104d28 <sys_dup+0x28>
80104d38:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104d3c:	83 ec 0c             	sub    $0xc,%esp
80104d3f:	ff 75 f4             	pushl  -0xc(%ebp)
80104d42:	e8 19 c1 ff ff       	call   80100e60 <filedup>
80104d47:	83 c4 10             	add    $0x10,%esp
80104d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d4d:	89 d8                	mov    %ebx,%eax
80104d4f:	5b                   	pop    %ebx
80104d50:	5e                   	pop    %esi
80104d51:	5d                   	pop    %ebp
80104d52:	c3                   	ret    
80104d53:	90                   	nop
80104d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d58:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d5b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104d60:	89 d8                	mov    %ebx,%eax
80104d62:	5b                   	pop    %ebx
80104d63:	5e                   	pop    %esi
80104d64:	5d                   	pop    %ebp
80104d65:	c3                   	ret    
80104d66:	8d 76 00             	lea    0x0(%esi),%esi
80104d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d70 <sys_read>:
80104d70:	55                   	push   %ebp
80104d71:	31 c0                	xor    %eax,%eax
80104d73:	89 e5                	mov    %esp,%ebp
80104d75:	83 ec 18             	sub    $0x18,%esp
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
80104db1:	83 ec 04             	sub    $0x4,%esp
80104db4:	ff 75 f0             	pushl  -0x10(%ebp)
80104db7:	ff 75 f4             	pushl  -0xc(%ebp)
80104dba:	ff 75 ec             	pushl  -0x14(%ebp)
80104dbd:	e8 0e c2 ff ff       	call   80100fd0 <fileread>
80104dc2:	83 c4 10             	add    $0x10,%esp
80104dc5:	c9                   	leave  
80104dc6:	c3                   	ret    
80104dc7:	89 f6                	mov    %esi,%esi
80104dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104dd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dd5:	c9                   	leave  
80104dd6:	c3                   	ret    
80104dd7:	89 f6                	mov    %esi,%esi
80104dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104de0 <sys_write>:
80104de0:	55                   	push   %ebp
80104de1:	31 c0                	xor    %eax,%eax
80104de3:	89 e5                	mov    %esp,%ebp
80104de5:	83 ec 18             	sub    $0x18,%esp
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
80104e21:	83 ec 04             	sub    $0x4,%esp
80104e24:	ff 75 f0             	pushl  -0x10(%ebp)
80104e27:	ff 75 f4             	pushl  -0xc(%ebp)
80104e2a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e2d:	e8 2e c2 ff ff       	call   80101060 <filewrite>
80104e32:	83 c4 10             	add    $0x10,%esp
80104e35:	c9                   	leave  
80104e36:	c3                   	ret    
80104e37:	89 f6                	mov    %esi,%esi
80104e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e45:	c9                   	leave  
80104e46:	c3                   	ret    
80104e47:	89 f6                	mov    %esi,%esi
80104e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e50 <sys_close>:
80104e50:	55                   	push   %ebp
80104e51:	89 e5                	mov    %esp,%ebp
80104e53:	83 ec 18             	sub    $0x18,%esp
80104e56:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104e59:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e5c:	e8 4f fe ff ff       	call   80104cb0 <argfd.constprop.0>
80104e61:	85 c0                	test   %eax,%eax
80104e63:	78 2b                	js     80104e90 <sys_close+0x40>
80104e65:	e8 66 ea ff ff       	call   801038d0 <myproc>
80104e6a:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104e6d:	83 ec 0c             	sub    $0xc,%esp
80104e70:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104e77:	00 
80104e78:	ff 75 f4             	pushl  -0xc(%ebp)
80104e7b:	e8 30 c0 ff ff       	call   80100eb0 <fileclose>
80104e80:	83 c4 10             	add    $0x10,%esp
80104e83:	31 c0                	xor    %eax,%eax
80104e85:	c9                   	leave  
80104e86:	c3                   	ret    
80104e87:	89 f6                	mov    %esi,%esi
80104e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e95:	c9                   	leave  
80104e96:	c3                   	ret    
80104e97:	89 f6                	mov    %esi,%esi
80104e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ea0 <sys_fstat>:
80104ea0:	55                   	push   %ebp
80104ea1:	31 c0                	xor    %eax,%eax
80104ea3:	89 e5                	mov    %esp,%ebp
80104ea5:	83 ec 18             	sub    $0x18,%esp
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
80104ecb:	83 ec 08             	sub    $0x8,%esp
80104ece:	ff 75 f4             	pushl  -0xc(%ebp)
80104ed1:	ff 75 f0             	pushl  -0x10(%ebp)
80104ed4:	e8 a7 c0 ff ff       	call   80100f80 <filestat>
80104ed9:	83 c4 10             	add    $0x10,%esp
80104edc:	c9                   	leave  
80104edd:	c3                   	ret    
80104ede:	66 90                	xchg   %ax,%ax
80104ee0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ee5:	c9                   	leave  
80104ee6:	c3                   	ret    
80104ee7:	89 f6                	mov    %esi,%esi
80104ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ef0 <sys_link>:
80104ef0:	55                   	push   %ebp
80104ef1:	89 e5                	mov    %esp,%ebp
80104ef3:	57                   	push   %edi
80104ef4:	56                   	push   %esi
80104ef5:	53                   	push   %ebx
80104ef6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104ef9:	83 ec 34             	sub    $0x34,%esp
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
80104f28:	e8 33 dd ff ff       	call   80102c60 <begin_op>
80104f2d:	83 ec 0c             	sub    $0xc,%esp
80104f30:	ff 75 d4             	pushl  -0x2c(%ebp)
80104f33:	e8 18 d0 ff ff       	call   80101f50 <namei>
80104f38:	83 c4 10             	add    $0x10,%esp
80104f3b:	85 c0                	test   %eax,%eax
80104f3d:	89 c3                	mov    %eax,%ebx
80104f3f:	0f 84 ea 00 00 00    	je     8010502f <sys_link+0x13f>
80104f45:	83 ec 0c             	sub    $0xc,%esp
80104f48:	50                   	push   %eax
80104f49:	e8 a2 c7 ff ff       	call   801016f0 <ilock>
80104f4e:	83 c4 10             	add    $0x10,%esp
80104f51:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f56:	0f 84 bb 00 00 00    	je     80105017 <sys_link+0x127>
80104f5c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104f61:	83 ec 0c             	sub    $0xc,%esp
80104f64:	8d 7d da             	lea    -0x26(%ebp),%edi
80104f67:	53                   	push   %ebx
80104f68:	e8 d3 c6 ff ff       	call   80101640 <iupdate>
80104f6d:	89 1c 24             	mov    %ebx,(%esp)
80104f70:	e8 5b c8 ff ff       	call   801017d0 <iunlock>
80104f75:	58                   	pop    %eax
80104f76:	5a                   	pop    %edx
80104f77:	57                   	push   %edi
80104f78:	ff 75 d0             	pushl  -0x30(%ebp)
80104f7b:	e8 f0 cf ff ff       	call   80101f70 <nameiparent>
80104f80:	83 c4 10             	add    $0x10,%esp
80104f83:	85 c0                	test   %eax,%eax
80104f85:	89 c6                	mov    %eax,%esi
80104f87:	74 5b                	je     80104fe4 <sys_link+0xf4>
80104f89:	83 ec 0c             	sub    $0xc,%esp
80104f8c:	50                   	push   %eax
80104f8d:	e8 5e c7 ff ff       	call   801016f0 <ilock>
80104f92:	83 c4 10             	add    $0x10,%esp
80104f95:	8b 03                	mov    (%ebx),%eax
80104f97:	39 06                	cmp    %eax,(%esi)
80104f99:	75 3d                	jne    80104fd8 <sys_link+0xe8>
80104f9b:	83 ec 04             	sub    $0x4,%esp
80104f9e:	ff 73 04             	pushl  0x4(%ebx)
80104fa1:	57                   	push   %edi
80104fa2:	56                   	push   %esi
80104fa3:	e8 e8 ce ff ff       	call   80101e90 <dirlink>
80104fa8:	83 c4 10             	add    $0x10,%esp
80104fab:	85 c0                	test   %eax,%eax
80104fad:	78 29                	js     80104fd8 <sys_link+0xe8>
80104faf:	83 ec 0c             	sub    $0xc,%esp
80104fb2:	56                   	push   %esi
80104fb3:	e8 c8 c9 ff ff       	call   80101980 <iunlockput>
80104fb8:	89 1c 24             	mov    %ebx,(%esp)
80104fbb:	e8 60 c8 ff ff       	call   80101820 <iput>
80104fc0:	e8 0b dd ff ff       	call   80102cd0 <end_op>
80104fc5:	83 c4 10             	add    $0x10,%esp
80104fc8:	31 c0                	xor    %eax,%eax
80104fca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fcd:	5b                   	pop    %ebx
80104fce:	5e                   	pop    %esi
80104fcf:	5f                   	pop    %edi
80104fd0:	5d                   	pop    %ebp
80104fd1:	c3                   	ret    
80104fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104fd8:	83 ec 0c             	sub    $0xc,%esp
80104fdb:	56                   	push   %esi
80104fdc:	e8 9f c9 ff ff       	call   80101980 <iunlockput>
80104fe1:	83 c4 10             	add    $0x10,%esp
80104fe4:	83 ec 0c             	sub    $0xc,%esp
80104fe7:	53                   	push   %ebx
80104fe8:	e8 03 c7 ff ff       	call   801016f0 <ilock>
80104fed:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104ff2:	89 1c 24             	mov    %ebx,(%esp)
80104ff5:	e8 46 c6 ff ff       	call   80101640 <iupdate>
80104ffa:	89 1c 24             	mov    %ebx,(%esp)
80104ffd:	e8 7e c9 ff ff       	call   80101980 <iunlockput>
80105002:	e8 c9 dc ff ff       	call   80102cd0 <end_op>
80105007:	83 c4 10             	add    $0x10,%esp
8010500a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010500d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105012:	5b                   	pop    %ebx
80105013:	5e                   	pop    %esi
80105014:	5f                   	pop    %edi
80105015:	5d                   	pop    %ebp
80105016:	c3                   	ret    
80105017:	83 ec 0c             	sub    $0xc,%esp
8010501a:	53                   	push   %ebx
8010501b:	e8 60 c9 ff ff       	call   80101980 <iunlockput>
80105020:	e8 ab dc ff ff       	call   80102cd0 <end_op>
80105025:	83 c4 10             	add    $0x10,%esp
80105028:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010502d:	eb 9b                	jmp    80104fca <sys_link+0xda>
8010502f:	e8 9c dc ff ff       	call   80102cd0 <end_op>
80105034:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105039:	eb 8f                	jmp    80104fca <sys_link+0xda>
8010503b:	90                   	nop
8010503c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105040 <sys_unlink>:
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	57                   	push   %edi
80105044:	56                   	push   %esi
80105045:	53                   	push   %ebx
80105046:	8d 45 c0             	lea    -0x40(%ebp),%eax
80105049:	83 ec 44             	sub    $0x44,%esp
8010504c:	50                   	push   %eax
8010504d:	6a 00                	push   $0x0
8010504f:	e8 fc f9 ff ff       	call   80104a50 <argstr>
80105054:	83 c4 10             	add    $0x10,%esp
80105057:	85 c0                	test   %eax,%eax
80105059:	0f 88 77 01 00 00    	js     801051d6 <sys_unlink+0x196>
8010505f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80105062:	e8 f9 db ff ff       	call   80102c60 <begin_op>
80105067:	83 ec 08             	sub    $0x8,%esp
8010506a:	53                   	push   %ebx
8010506b:	ff 75 c0             	pushl  -0x40(%ebp)
8010506e:	e8 fd ce ff ff       	call   80101f70 <nameiparent>
80105073:	83 c4 10             	add    $0x10,%esp
80105076:	85 c0                	test   %eax,%eax
80105078:	89 c6                	mov    %eax,%esi
8010507a:	0f 84 60 01 00 00    	je     801051e0 <sys_unlink+0x1a0>
80105080:	83 ec 0c             	sub    $0xc,%esp
80105083:	50                   	push   %eax
80105084:	e8 67 c6 ff ff       	call   801016f0 <ilock>
80105089:	58                   	pop    %eax
8010508a:	5a                   	pop    %edx
8010508b:	68 24 7b 10 80       	push   $0x80107b24
80105090:	53                   	push   %ebx
80105091:	e8 6a cb ff ff       	call   80101c00 <namecmp>
80105096:	83 c4 10             	add    $0x10,%esp
80105099:	85 c0                	test   %eax,%eax
8010509b:	0f 84 03 01 00 00    	je     801051a4 <sys_unlink+0x164>
801050a1:	83 ec 08             	sub    $0x8,%esp
801050a4:	68 23 7b 10 80       	push   $0x80107b23
801050a9:	53                   	push   %ebx
801050aa:	e8 51 cb ff ff       	call   80101c00 <namecmp>
801050af:	83 c4 10             	add    $0x10,%esp
801050b2:	85 c0                	test   %eax,%eax
801050b4:	0f 84 ea 00 00 00    	je     801051a4 <sys_unlink+0x164>
801050ba:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801050bd:	83 ec 04             	sub    $0x4,%esp
801050c0:	50                   	push   %eax
801050c1:	53                   	push   %ebx
801050c2:	56                   	push   %esi
801050c3:	e8 58 cb ff ff       	call   80101c20 <dirlookup>
801050c8:	83 c4 10             	add    $0x10,%esp
801050cb:	85 c0                	test   %eax,%eax
801050cd:	89 c3                	mov    %eax,%ebx
801050cf:	0f 84 cf 00 00 00    	je     801051a4 <sys_unlink+0x164>
801050d5:	83 ec 0c             	sub    $0xc,%esp
801050d8:	50                   	push   %eax
801050d9:	e8 12 c6 ff ff       	call   801016f0 <ilock>
801050de:	83 c4 10             	add    $0x10,%esp
801050e1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801050e6:	0f 8e 10 01 00 00    	jle    801051fc <sys_unlink+0x1bc>
801050ec:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050f1:	74 6d                	je     80105160 <sys_unlink+0x120>
801050f3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801050f6:	83 ec 04             	sub    $0x4,%esp
801050f9:	6a 10                	push   $0x10
801050fb:	6a 00                	push   $0x0
801050fd:	50                   	push   %eax
801050fe:	e8 9d f5 ff ff       	call   801046a0 <memset>
80105103:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105106:	6a 10                	push   $0x10
80105108:	ff 75 c4             	pushl  -0x3c(%ebp)
8010510b:	50                   	push   %eax
8010510c:	56                   	push   %esi
8010510d:	e8 be c9 ff ff       	call   80101ad0 <writei>
80105112:	83 c4 20             	add    $0x20,%esp
80105115:	83 f8 10             	cmp    $0x10,%eax
80105118:	0f 85 eb 00 00 00    	jne    80105209 <sys_unlink+0x1c9>
8010511e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105123:	0f 84 97 00 00 00    	je     801051c0 <sys_unlink+0x180>
80105129:	83 ec 0c             	sub    $0xc,%esp
8010512c:	56                   	push   %esi
8010512d:	e8 4e c8 ff ff       	call   80101980 <iunlockput>
80105132:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105137:	89 1c 24             	mov    %ebx,(%esp)
8010513a:	e8 01 c5 ff ff       	call   80101640 <iupdate>
8010513f:	89 1c 24             	mov    %ebx,(%esp)
80105142:	e8 39 c8 ff ff       	call   80101980 <iunlockput>
80105147:	e8 84 db ff ff       	call   80102cd0 <end_op>
8010514c:	83 c4 10             	add    $0x10,%esp
8010514f:	31 c0                	xor    %eax,%eax
80105151:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105154:	5b                   	pop    %ebx
80105155:	5e                   	pop    %esi
80105156:	5f                   	pop    %edi
80105157:	5d                   	pop    %ebp
80105158:	c3                   	ret    
80105159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105160:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105164:	76 8d                	jbe    801050f3 <sys_unlink+0xb3>
80105166:	bf 20 00 00 00       	mov    $0x20,%edi
8010516b:	eb 0f                	jmp    8010517c <sys_unlink+0x13c>
8010516d:	8d 76 00             	lea    0x0(%esi),%esi
80105170:	83 c7 10             	add    $0x10,%edi
80105173:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105176:	0f 83 77 ff ff ff    	jae    801050f3 <sys_unlink+0xb3>
8010517c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010517f:	6a 10                	push   $0x10
80105181:	57                   	push   %edi
80105182:	50                   	push   %eax
80105183:	53                   	push   %ebx
80105184:	e8 47 c8 ff ff       	call   801019d0 <readi>
80105189:	83 c4 10             	add    $0x10,%esp
8010518c:	83 f8 10             	cmp    $0x10,%eax
8010518f:	75 5e                	jne    801051ef <sys_unlink+0x1af>
80105191:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105196:	74 d8                	je     80105170 <sys_unlink+0x130>
80105198:	83 ec 0c             	sub    $0xc,%esp
8010519b:	53                   	push   %ebx
8010519c:	e8 df c7 ff ff       	call   80101980 <iunlockput>
801051a1:	83 c4 10             	add    $0x10,%esp
801051a4:	83 ec 0c             	sub    $0xc,%esp
801051a7:	56                   	push   %esi
801051a8:	e8 d3 c7 ff ff       	call   80101980 <iunlockput>
801051ad:	e8 1e db ff ff       	call   80102cd0 <end_op>
801051b2:	83 c4 10             	add    $0x10,%esp
801051b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051ba:	eb 95                	jmp    80105151 <sys_unlink+0x111>
801051bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801051c0:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
801051c5:	83 ec 0c             	sub    $0xc,%esp
801051c8:	56                   	push   %esi
801051c9:	e8 72 c4 ff ff       	call   80101640 <iupdate>
801051ce:	83 c4 10             	add    $0x10,%esp
801051d1:	e9 53 ff ff ff       	jmp    80105129 <sys_unlink+0xe9>
801051d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051db:	e9 71 ff ff ff       	jmp    80105151 <sys_unlink+0x111>
801051e0:	e8 eb da ff ff       	call   80102cd0 <end_op>
801051e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051ea:	e9 62 ff ff ff       	jmp    80105151 <sys_unlink+0x111>
801051ef:	83 ec 0c             	sub    $0xc,%esp
801051f2:	68 48 7b 10 80       	push   $0x80107b48
801051f7:	e8 94 b1 ff ff       	call   80100390 <panic>
801051fc:	83 ec 0c             	sub    $0xc,%esp
801051ff:	68 36 7b 10 80       	push   $0x80107b36
80105204:	e8 87 b1 ff ff       	call   80100390 <panic>
80105209:	83 ec 0c             	sub    $0xc,%esp
8010520c:	68 5a 7b 10 80       	push   $0x80107b5a
80105211:	e8 7a b1 ff ff       	call   80100390 <panic>
80105216:	8d 76 00             	lea    0x0(%esi),%esi
80105219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105220 <sys_open>:
80105220:	55                   	push   %ebp
80105221:	89 e5                	mov    %esp,%ebp
80105223:	57                   	push   %edi
80105224:	56                   	push   %esi
80105225:	53                   	push   %ebx
80105226:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105229:	83 ec 24             	sub    $0x24,%esp
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
80105258:	e8 03 da ff ff       	call   80102c60 <begin_op>
8010525d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105261:	0f 85 a9 00 00 00    	jne    80105310 <sys_open+0xf0>
80105267:	83 ec 0c             	sub    $0xc,%esp
8010526a:	ff 75 e0             	pushl  -0x20(%ebp)
8010526d:	e8 de cc ff ff       	call   80101f50 <namei>
80105272:	83 c4 10             	add    $0x10,%esp
80105275:	85 c0                	test   %eax,%eax
80105277:	89 c6                	mov    %eax,%esi
80105279:	0f 84 b2 00 00 00    	je     80105331 <sys_open+0x111>
8010527f:	83 ec 0c             	sub    $0xc,%esp
80105282:	50                   	push   %eax
80105283:	e8 68 c4 ff ff       	call   801016f0 <ilock>
80105288:	83 c4 10             	add    $0x10,%esp
8010528b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105290:	0f 84 aa 00 00 00    	je     80105340 <sys_open+0x120>
80105296:	e8 55 bb ff ff       	call   80100df0 <filealloc>
8010529b:	85 c0                	test   %eax,%eax
8010529d:	89 c7                	mov    %eax,%edi
8010529f:	0f 84 a6 00 00 00    	je     8010534b <sys_open+0x12b>
801052a5:	e8 26 e6 ff ff       	call   801038d0 <myproc>
801052aa:	31 db                	xor    %ebx,%ebx
801052ac:	eb 0e                	jmp    801052bc <sys_open+0x9c>
801052ae:	66 90                	xchg   %ax,%ax
801052b0:	83 c3 01             	add    $0x1,%ebx
801052b3:	83 fb 10             	cmp    $0x10,%ebx
801052b6:	0f 84 ac 00 00 00    	je     80105368 <sys_open+0x148>
801052bc:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801052c0:	85 d2                	test   %edx,%edx
801052c2:	75 ec                	jne    801052b0 <sys_open+0x90>
801052c4:	83 ec 0c             	sub    $0xc,%esp
801052c7:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
801052cb:	56                   	push   %esi
801052cc:	e8 ff c4 ff ff       	call   801017d0 <iunlock>
801052d1:	e8 fa d9 ff ff       	call   80102cd0 <end_op>
801052d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801052dc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801052df:	83 c4 10             	add    $0x10,%esp
801052e2:	89 77 10             	mov    %esi,0x10(%edi)
801052e5:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801052ec:	89 d0                	mov    %edx,%eax
801052ee:	f7 d0                	not    %eax
801052f0:	83 e0 01             	and    $0x1,%eax
801052f3:	83 e2 03             	and    $0x3,%edx
801052f6:	88 47 08             	mov    %al,0x8(%edi)
801052f9:	0f 95 47 09          	setne  0x9(%edi)
801052fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105300:	89 d8                	mov    %ebx,%eax
80105302:	5b                   	pop    %ebx
80105303:	5e                   	pop    %esi
80105304:	5f                   	pop    %edi
80105305:	5d                   	pop    %ebp
80105306:	c3                   	ret    
80105307:	89 f6                	mov    %esi,%esi
80105309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105310:	83 ec 0c             	sub    $0xc,%esp
80105313:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105316:	31 c9                	xor    %ecx,%ecx
80105318:	6a 00                	push   $0x0
8010531a:	ba 02 00 00 00       	mov    $0x2,%edx
8010531f:	e8 ec f7 ff ff       	call   80104b10 <create>
80105324:	83 c4 10             	add    $0x10,%esp
80105327:	85 c0                	test   %eax,%eax
80105329:	89 c6                	mov    %eax,%esi
8010532b:	0f 85 65 ff ff ff    	jne    80105296 <sys_open+0x76>
80105331:	e8 9a d9 ff ff       	call   80102cd0 <end_op>
80105336:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010533b:	eb c0                	jmp    801052fd <sys_open+0xdd>
8010533d:	8d 76 00             	lea    0x0(%esi),%esi
80105340:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105343:	85 c9                	test   %ecx,%ecx
80105345:	0f 84 4b ff ff ff    	je     80105296 <sys_open+0x76>
8010534b:	83 ec 0c             	sub    $0xc,%esp
8010534e:	56                   	push   %esi
8010534f:	e8 2c c6 ff ff       	call   80101980 <iunlockput>
80105354:	e8 77 d9 ff ff       	call   80102cd0 <end_op>
80105359:	83 c4 10             	add    $0x10,%esp
8010535c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105361:	eb 9a                	jmp    801052fd <sys_open+0xdd>
80105363:	90                   	nop
80105364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105368:	83 ec 0c             	sub    $0xc,%esp
8010536b:	57                   	push   %edi
8010536c:	e8 3f bb ff ff       	call   80100eb0 <fileclose>
80105371:	83 c4 10             	add    $0x10,%esp
80105374:	eb d5                	jmp    8010534b <sys_open+0x12b>
80105376:	8d 76 00             	lea    0x0(%esi),%esi
80105379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105380 <sys_mkdir>:
80105380:	55                   	push   %ebp
80105381:	89 e5                	mov    %esp,%ebp
80105383:	83 ec 18             	sub    $0x18,%esp
80105386:	e8 d5 d8 ff ff       	call   80102c60 <begin_op>
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
801053bb:	83 ec 0c             	sub    $0xc,%esp
801053be:	50                   	push   %eax
801053bf:	e8 bc c5 ff ff       	call   80101980 <iunlockput>
801053c4:	e8 07 d9 ff ff       	call   80102cd0 <end_op>
801053c9:	83 c4 10             	add    $0x10,%esp
801053cc:	31 c0                	xor    %eax,%eax
801053ce:	c9                   	leave  
801053cf:	c3                   	ret    
801053d0:	e8 fb d8 ff ff       	call   80102cd0 <end_op>
801053d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053da:	c9                   	leave  
801053db:	c3                   	ret    
801053dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053e0 <sys_mknod>:
801053e0:	55                   	push   %ebp
801053e1:	89 e5                	mov    %esp,%ebp
801053e3:	83 ec 18             	sub    $0x18,%esp
801053e6:	e8 75 d8 ff ff       	call   80102c60 <begin_op>
801053eb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801053ee:	83 ec 08             	sub    $0x8,%esp
801053f1:	50                   	push   %eax
801053f2:	6a 00                	push   $0x0
801053f4:	e8 57 f6 ff ff       	call   80104a50 <argstr>
801053f9:	83 c4 10             	add    $0x10,%esp
801053fc:	85 c0                	test   %eax,%eax
801053fe:	78 60                	js     80105460 <sys_mknod+0x80>
80105400:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105403:	83 ec 08             	sub    $0x8,%esp
80105406:	50                   	push   %eax
80105407:	6a 01                	push   $0x1
80105409:	e8 92 f5 ff ff       	call   801049a0 <argint>
8010540e:	83 c4 10             	add    $0x10,%esp
80105411:	85 c0                	test   %eax,%eax
80105413:	78 4b                	js     80105460 <sys_mknod+0x80>
80105415:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105418:	83 ec 08             	sub    $0x8,%esp
8010541b:	50                   	push   %eax
8010541c:	6a 02                	push   $0x2
8010541e:	e8 7d f5 ff ff       	call   801049a0 <argint>
80105423:	83 c4 10             	add    $0x10,%esp
80105426:	85 c0                	test   %eax,%eax
80105428:	78 36                	js     80105460 <sys_mknod+0x80>
8010542a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010542e:	83 ec 0c             	sub    $0xc,%esp
80105431:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105435:	ba 03 00 00 00       	mov    $0x3,%edx
8010543a:	50                   	push   %eax
8010543b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010543e:	e8 cd f6 ff ff       	call   80104b10 <create>
80105443:	83 c4 10             	add    $0x10,%esp
80105446:	85 c0                	test   %eax,%eax
80105448:	74 16                	je     80105460 <sys_mknod+0x80>
8010544a:	83 ec 0c             	sub    $0xc,%esp
8010544d:	50                   	push   %eax
8010544e:	e8 2d c5 ff ff       	call   80101980 <iunlockput>
80105453:	e8 78 d8 ff ff       	call   80102cd0 <end_op>
80105458:	83 c4 10             	add    $0x10,%esp
8010545b:	31 c0                	xor    %eax,%eax
8010545d:	c9                   	leave  
8010545e:	c3                   	ret    
8010545f:	90                   	nop
80105460:	e8 6b d8 ff ff       	call   80102cd0 <end_op>
80105465:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010546a:	c9                   	leave  
8010546b:	c3                   	ret    
8010546c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105470 <sys_chdir>:
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	56                   	push   %esi
80105474:	53                   	push   %ebx
80105475:	83 ec 10             	sub    $0x10,%esp
80105478:	e8 53 e4 ff ff       	call   801038d0 <myproc>
8010547d:	89 c6                	mov    %eax,%esi
8010547f:	e8 dc d7 ff ff       	call   80102c60 <begin_op>
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
8010549f:	e8 ac ca ff ff       	call   80101f50 <namei>
801054a4:	83 c4 10             	add    $0x10,%esp
801054a7:	85 c0                	test   %eax,%eax
801054a9:	89 c3                	mov    %eax,%ebx
801054ab:	74 63                	je     80105510 <sys_chdir+0xa0>
801054ad:	83 ec 0c             	sub    $0xc,%esp
801054b0:	50                   	push   %eax
801054b1:	e8 3a c2 ff ff       	call   801016f0 <ilock>
801054b6:	83 c4 10             	add    $0x10,%esp
801054b9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054be:	75 30                	jne    801054f0 <sys_chdir+0x80>
801054c0:	83 ec 0c             	sub    $0xc,%esp
801054c3:	53                   	push   %ebx
801054c4:	e8 07 c3 ff ff       	call   801017d0 <iunlock>
801054c9:	58                   	pop    %eax
801054ca:	ff 76 68             	pushl  0x68(%esi)
801054cd:	e8 4e c3 ff ff       	call   80101820 <iput>
801054d2:	e8 f9 d7 ff ff       	call   80102cd0 <end_op>
801054d7:	89 5e 68             	mov    %ebx,0x68(%esi)
801054da:	83 c4 10             	add    $0x10,%esp
801054dd:	31 c0                	xor    %eax,%eax
801054df:	8d 65 f8             	lea    -0x8(%ebp),%esp
801054e2:	5b                   	pop    %ebx
801054e3:	5e                   	pop    %esi
801054e4:	5d                   	pop    %ebp
801054e5:	c3                   	ret    
801054e6:	8d 76 00             	lea    0x0(%esi),%esi
801054e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801054f0:	83 ec 0c             	sub    $0xc,%esp
801054f3:	53                   	push   %ebx
801054f4:	e8 87 c4 ff ff       	call   80101980 <iunlockput>
801054f9:	e8 d2 d7 ff ff       	call   80102cd0 <end_op>
801054fe:	83 c4 10             	add    $0x10,%esp
80105501:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105506:	eb d7                	jmp    801054df <sys_chdir+0x6f>
80105508:	90                   	nop
80105509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105510:	e8 bb d7 ff ff       	call   80102cd0 <end_op>
80105515:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010551a:	eb c3                	jmp    801054df <sys_chdir+0x6f>
8010551c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105520 <sys_exec>:
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
80105523:	57                   	push   %edi
80105524:	56                   	push   %esi
80105525:	53                   	push   %ebx
80105526:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010552c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
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
8010555d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105563:	83 ec 04             	sub    $0x4,%esp
80105566:	31 db                	xor    %ebx,%ebx
80105568:	68 80 00 00 00       	push   $0x80
8010556d:	6a 00                	push   $0x0
8010556f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105575:	50                   	push   %eax
80105576:	e8 25 f1 ff ff       	call   801046a0 <memset>
8010557b:	83 c4 10             	add    $0x10,%esp
8010557e:	eb 2c                	jmp    801055ac <sys_exec+0x8c>
80105580:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105586:	85 c0                	test   %eax,%eax
80105588:	74 56                	je     801055e0 <sys_exec+0xc0>
8010558a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105590:	83 ec 08             	sub    $0x8,%esp
80105593:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105596:	52                   	push   %edx
80105597:	50                   	push   %eax
80105598:	e8 93 f3 ff ff       	call   80104930 <fetchstr>
8010559d:	83 c4 10             	add    $0x10,%esp
801055a0:	85 c0                	test   %eax,%eax
801055a2:	78 28                	js     801055cc <sys_exec+0xac>
801055a4:	83 c3 01             	add    $0x1,%ebx
801055a7:	83 fb 20             	cmp    $0x20,%ebx
801055aa:	74 20                	je     801055cc <sys_exec+0xac>
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
801055cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055d4:	5b                   	pop    %ebx
801055d5:	5e                   	pop    %esi
801055d6:	5f                   	pop    %edi
801055d7:	5d                   	pop    %ebp
801055d8:	c3                   	ret    
801055d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801055e0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801055e6:	83 ec 08             	sub    $0x8,%esp
801055e9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801055f0:	00 00 00 00 
801055f4:	50                   	push   %eax
801055f5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801055fb:	e8 50 b4 ff ff       	call   80100a50 <exec>
80105600:	83 c4 10             	add    $0x10,%esp
80105603:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105606:	5b                   	pop    %ebx
80105607:	5e                   	pop    %esi
80105608:	5f                   	pop    %edi
80105609:	5d                   	pop    %ebp
8010560a:	c3                   	ret    
8010560b:	90                   	nop
8010560c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105610 <sys_pipe>:
80105610:	55                   	push   %ebp
80105611:	89 e5                	mov    %esp,%ebp
80105613:	57                   	push   %edi
80105614:	56                   	push   %esi
80105615:	53                   	push   %ebx
80105616:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105619:	83 ec 20             	sub    $0x20,%esp
8010561c:	6a 08                	push   $0x8
8010561e:	50                   	push   %eax
8010561f:	6a 00                	push   $0x0
80105621:	e8 ca f3 ff ff       	call   801049f0 <argptr>
80105626:	83 c4 10             	add    $0x10,%esp
80105629:	85 c0                	test   %eax,%eax
8010562b:	0f 88 ae 00 00 00    	js     801056df <sys_pipe+0xcf>
80105631:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105634:	83 ec 08             	sub    $0x8,%esp
80105637:	50                   	push   %eax
80105638:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010563b:	50                   	push   %eax
8010563c:	e8 bf dc ff ff       	call   80103300 <pipealloc>
80105641:	83 c4 10             	add    $0x10,%esp
80105644:	85 c0                	test   %eax,%eax
80105646:	0f 88 93 00 00 00    	js     801056df <sys_pipe+0xcf>
8010564c:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010564f:	31 db                	xor    %ebx,%ebx
80105651:	e8 7a e2 ff ff       	call   801038d0 <myproc>
80105656:	eb 10                	jmp    80105668 <sys_pipe+0x58>
80105658:	90                   	nop
80105659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105660:	83 c3 01             	add    $0x1,%ebx
80105663:	83 fb 10             	cmp    $0x10,%ebx
80105666:	74 60                	je     801056c8 <sys_pipe+0xb8>
80105668:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010566c:	85 f6                	test   %esi,%esi
8010566e:	75 f0                	jne    80105660 <sys_pipe+0x50>
80105670:	8d 73 08             	lea    0x8(%ebx),%esi
80105673:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80105677:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010567a:	e8 51 e2 ff ff       	call   801038d0 <myproc>
8010567f:	31 d2                	xor    %edx,%edx
80105681:	eb 0d                	jmp    80105690 <sys_pipe+0x80>
80105683:	90                   	nop
80105684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105688:	83 c2 01             	add    $0x1,%edx
8010568b:	83 fa 10             	cmp    $0x10,%edx
8010568e:	74 28                	je     801056b8 <sys_pipe+0xa8>
80105690:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105694:	85 c9                	test   %ecx,%ecx
80105696:	75 f0                	jne    80105688 <sys_pipe+0x78>
80105698:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
8010569c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010569f:	89 18                	mov    %ebx,(%eax)
801056a1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801056a4:	89 50 04             	mov    %edx,0x4(%eax)
801056a7:	31 c0                	xor    %eax,%eax
801056a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056ac:	5b                   	pop    %ebx
801056ad:	5e                   	pop    %esi
801056ae:	5f                   	pop    %edi
801056af:	5d                   	pop    %ebp
801056b0:	c3                   	ret    
801056b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801056b8:	e8 13 e2 ff ff       	call   801038d0 <myproc>
801056bd:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801056c4:	00 
801056c5:	8d 76 00             	lea    0x0(%esi),%esi
801056c8:	83 ec 0c             	sub    $0xc,%esp
801056cb:	ff 75 e0             	pushl  -0x20(%ebp)
801056ce:	e8 dd b7 ff ff       	call   80100eb0 <fileclose>
801056d3:	58                   	pop    %eax
801056d4:	ff 75 e4             	pushl  -0x1c(%ebp)
801056d7:	e8 d4 b7 ff ff       	call   80100eb0 <fileclose>
801056dc:	83 c4 10             	add    $0x10,%esp
801056df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056e4:	eb c3                	jmp    801056a9 <sys_pipe+0x99>
801056e6:	66 90                	xchg   %ax,%ax
801056e8:	66 90                	xchg   %ax,%ax
801056ea:	66 90                	xchg   %ax,%ax
801056ec:	66 90                	xchg   %ax,%ax
801056ee:	66 90                	xchg   %ax,%ax

801056f0 <sys_fork>:
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	5d                   	pop    %ebp
801056f4:	e9 77 e3 ff ff       	jmp    80103a70 <fork>
801056f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105700 <sys_exit>:
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
80105703:	83 ec 08             	sub    $0x8,%esp
80105706:	e8 65 e6 ff ff       	call   80103d70 <exit>
8010570b:	31 c0                	xor    %eax,%eax
8010570d:	c9                   	leave  
8010570e:	c3                   	ret    
8010570f:	90                   	nop

80105710 <sys_wait>:
80105710:	55                   	push   %ebp
80105711:	89 e5                	mov    %esp,%ebp
80105713:	5d                   	pop    %ebp
80105714:	e9 97 e8 ff ff       	jmp    80103fb0 <wait>
80105719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105720 <sys_kill>:
80105720:	55                   	push   %ebp
80105721:	89 e5                	mov    %esp,%ebp
80105723:	83 ec 20             	sub    $0x20,%esp
80105726:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105729:	50                   	push   %eax
8010572a:	6a 00                	push   $0x0
8010572c:	e8 6f f2 ff ff       	call   801049a0 <argint>
80105731:	83 c4 10             	add    $0x10,%esp
80105734:	85 c0                	test   %eax,%eax
80105736:	78 18                	js     80105750 <sys_kill+0x30>
80105738:	83 ec 0c             	sub    $0xc,%esp
8010573b:	ff 75 f4             	pushl  -0xc(%ebp)
8010573e:	e8 cd e9 ff ff       	call   80104110 <kill>
80105743:	83 c4 10             	add    $0x10,%esp
80105746:	c9                   	leave  
80105747:	c3                   	ret    
80105748:	90                   	nop
80105749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105750:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105755:	c9                   	leave  
80105756:	c3                   	ret    
80105757:	89 f6                	mov    %esi,%esi
80105759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105760 <sys_getpid>:
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
80105763:	83 ec 08             	sub    $0x8,%esp
80105766:	e8 65 e1 ff ff       	call   801038d0 <myproc>
8010576b:	8b 40 10             	mov    0x10(%eax),%eax
8010576e:	c9                   	leave  
8010576f:	c3                   	ret    

80105770 <sys_sbrk>:
80105770:	55                   	push   %ebp
80105771:	89 e5                	mov    %esp,%ebp
80105773:	53                   	push   %ebx
80105774:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105777:	83 ec 1c             	sub    $0x1c,%esp
8010577a:	50                   	push   %eax
8010577b:	6a 00                	push   $0x0
8010577d:	e8 1e f2 ff ff       	call   801049a0 <argint>
80105782:	83 c4 10             	add    $0x10,%esp
80105785:	85 c0                	test   %eax,%eax
80105787:	78 27                	js     801057b0 <sys_sbrk+0x40>
80105789:	e8 42 e1 ff ff       	call   801038d0 <myproc>
8010578e:	83 ec 0c             	sub    $0xc,%esp
80105791:	8b 18                	mov    (%eax),%ebx
80105793:	ff 75 f4             	pushl  -0xc(%ebp)
80105796:	e8 55 e2 ff ff       	call   801039f0 <growproc>
8010579b:	83 c4 10             	add    $0x10,%esp
8010579e:	85 c0                	test   %eax,%eax
801057a0:	78 0e                	js     801057b0 <sys_sbrk+0x40>
801057a2:	89 d8                	mov    %ebx,%eax
801057a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057a7:	c9                   	leave  
801057a8:	c3                   	ret    
801057a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801057b0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801057b5:	eb eb                	jmp    801057a2 <sys_sbrk+0x32>
801057b7:	89 f6                	mov    %esi,%esi
801057b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057c0 <sys_sleep>:
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	53                   	push   %ebx
801057c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057c7:	83 ec 1c             	sub    $0x1c,%esp
801057ca:	50                   	push   %eax
801057cb:	6a 00                	push   $0x0
801057cd:	e8 ce f1 ff ff       	call   801049a0 <argint>
801057d2:	83 c4 10             	add    $0x10,%esp
801057d5:	85 c0                	test   %eax,%eax
801057d7:	0f 88 8a 00 00 00    	js     80105867 <sys_sleep+0xa7>
801057dd:	83 ec 0c             	sub    $0xc,%esp
801057e0:	68 40 58 11 80       	push   $0x80115840
801057e5:	e8 a6 ed ff ff       	call   80104590 <acquire>
801057ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
801057ed:	83 c4 10             	add    $0x10,%esp
801057f0:	8b 1d 80 60 11 80    	mov    0x80116080,%ebx
801057f6:	85 d2                	test   %edx,%edx
801057f8:	75 27                	jne    80105821 <sys_sleep+0x61>
801057fa:	eb 54                	jmp    80105850 <sys_sleep+0x90>
801057fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105800:	83 ec 08             	sub    $0x8,%esp
80105803:	68 40 58 11 80       	push   $0x80115840
80105808:	68 80 60 11 80       	push   $0x80116080
8010580d:	e8 de e6 ff ff       	call   80103ef0 <sleep>
80105812:	a1 80 60 11 80       	mov    0x80116080,%eax
80105817:	83 c4 10             	add    $0x10,%esp
8010581a:	29 d8                	sub    %ebx,%eax
8010581c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010581f:	73 2f                	jae    80105850 <sys_sleep+0x90>
80105821:	e8 aa e0 ff ff       	call   801038d0 <myproc>
80105826:	8b 40 24             	mov    0x24(%eax),%eax
80105829:	85 c0                	test   %eax,%eax
8010582b:	74 d3                	je     80105800 <sys_sleep+0x40>
8010582d:	83 ec 0c             	sub    $0xc,%esp
80105830:	68 40 58 11 80       	push   $0x80115840
80105835:	e8 16 ee ff ff       	call   80104650 <release>
8010583a:	83 c4 10             	add    $0x10,%esp
8010583d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105842:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105845:	c9                   	leave  
80105846:	c3                   	ret    
80105847:	89 f6                	mov    %esi,%esi
80105849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105850:	83 ec 0c             	sub    $0xc,%esp
80105853:	68 40 58 11 80       	push   $0x80115840
80105858:	e8 f3 ed ff ff       	call   80104650 <release>
8010585d:	83 c4 10             	add    $0x10,%esp
80105860:	31 c0                	xor    %eax,%eax
80105862:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105865:	c9                   	leave  
80105866:	c3                   	ret    
80105867:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010586c:	eb f4                	jmp    80105862 <sys_sleep+0xa2>
8010586e:	66 90                	xchg   %ax,%ax

80105870 <sys_uptime>:
80105870:	55                   	push   %ebp
80105871:	89 e5                	mov    %esp,%ebp
80105873:	53                   	push   %ebx
80105874:	83 ec 10             	sub    $0x10,%esp
80105877:	68 40 58 11 80       	push   $0x80115840
8010587c:	e8 0f ed ff ff       	call   80104590 <acquire>
80105881:	8b 1d 80 60 11 80    	mov    0x80116080,%ebx
80105887:	c7 04 24 40 58 11 80 	movl   $0x80115840,(%esp)
8010588e:	e8 bd ed ff ff       	call   80104650 <release>
80105893:	89 d8                	mov    %ebx,%eax
80105895:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105898:	c9                   	leave  
80105899:	c3                   	ret    
8010589a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801058a0 <sys_gettime>:
801058a0:	55                   	push   %ebp
801058a1:	89 e5                	mov    %esp,%ebp
801058a3:	83 ec 1c             	sub    $0x1c,%esp
801058a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058a9:	6a 18                	push   $0x18
801058ab:	50                   	push   %eax
801058ac:	6a 00                	push   $0x0
801058ae:	e8 3d f1 ff ff       	call   801049f0 <argptr>
801058b3:	83 c4 10             	add    $0x10,%esp
801058b6:	85 c0                	test   %eax,%eax
801058b8:	78 16                	js     801058d0 <sys_gettime+0x30>
801058ba:	83 ec 0c             	sub    $0xc,%esp
801058bd:	ff 75 f4             	pushl  -0xc(%ebp)
801058c0:	e8 bb cf ff ff       	call   80102880 <cmostime>
801058c5:	83 c4 10             	add    $0x10,%esp
801058c8:	31 c0                	xor    %eax,%eax
801058ca:	c9                   	leave  
801058cb:	c3                   	ret    
801058cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801058d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058d5:	c9                   	leave  
801058d6:	c3                   	ret    
801058d7:	89 f6                	mov    %esi,%esi
801058d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058e0 <sys_settickets>:
801058e0:	55                   	push   %ebp
801058e1:	89 e5                	mov    %esp,%ebp
801058e3:	83 ec 20             	sub    $0x20,%esp
801058e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058e9:	50                   	push   %eax
801058ea:	6a 00                	push   $0x0
801058ec:	e8 af f0 ff ff       	call   801049a0 <argint>
801058f1:	83 c4 10             	add    $0x10,%esp
801058f4:	85 c0                	test   %eax,%eax
801058f6:	78 18                	js     80105910 <sys_settickets+0x30>
801058f8:	83 ec 0c             	sub    $0xc,%esp
801058fb:	ff 75 f4             	pushl  -0xc(%ebp)
801058fe:	e8 8d e8 ff ff       	call   80104190 <settickets>
80105903:	83 c4 10             	add    $0x10,%esp
80105906:	31 c0                	xor    %eax,%eax
80105908:	c9                   	leave  
80105909:	c3                   	ret    
8010590a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105910:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105915:	c9                   	leave  
80105916:	c3                   	ret    
80105917:	89 f6                	mov    %esi,%esi
80105919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105920 <sys_getpinfo>:
80105920:	55                   	push   %ebp
80105921:	89 e5                	mov    %esp,%ebp
80105923:	83 ec 1c             	sub    $0x1c,%esp
80105926:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105929:	68 00 04 00 00       	push   $0x400
8010592e:	50                   	push   %eax
8010592f:	6a 00                	push   $0x0
80105931:	e8 ba f0 ff ff       	call   801049f0 <argptr>
80105936:	83 c4 10             	add    $0x10,%esp
80105939:	85 c0                	test   %eax,%eax
8010593b:	78 13                	js     80105950 <sys_getpinfo+0x30>
8010593d:	83 ec 0c             	sub    $0xc,%esp
80105940:	ff 75 f4             	pushl  -0xc(%ebp)
80105943:	e8 88 e8 ff ff       	call   801041d0 <getpinfo>
80105948:	83 c4 10             	add    $0x10,%esp
8010594b:	31 c0                	xor    %eax,%eax
8010594d:	c9                   	leave  
8010594e:	c3                   	ret    
8010594f:	90                   	nop
80105950:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105955:	c9                   	leave  
80105956:	c3                   	ret    
80105957:	89 f6                	mov    %esi,%esi
80105959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105960 <sys_getreadcount>:
80105960:	55                   	push   %ebp
80105961:	89 e5                	mov    %esp,%ebp
80105963:	5d                   	pop    %ebp
80105964:	e9 27 f1 ff ff       	jmp    80104a90 <getreadcount>

80105969 <alltraps>:
80105969:	1e                   	push   %ds
8010596a:	06                   	push   %es
8010596b:	0f a0                	push   %fs
8010596d:	0f a8                	push   %gs
8010596f:	60                   	pusha  
80105970:	66 b8 10 00          	mov    $0x10,%ax
80105974:	8e d8                	mov    %eax,%ds
80105976:	8e c0                	mov    %eax,%es
80105978:	54                   	push   %esp
80105979:	e8 c2 00 00 00       	call   80105a40 <trap>
8010597e:	83 c4 04             	add    $0x4,%esp

80105981 <trapret>:
80105981:	61                   	popa   
80105982:	0f a9                	pop    %gs
80105984:	0f a1                	pop    %fs
80105986:	07                   	pop    %es
80105987:	1f                   	pop    %ds
80105988:	83 c4 08             	add    $0x8,%esp
8010598b:	cf                   	iret   
8010598c:	66 90                	xchg   %ax,%ax
8010598e:	66 90                	xchg   %ax,%ax

80105990 <tvinit>:
80105990:	55                   	push   %ebp
80105991:	31 c0                	xor    %eax,%eax
80105993:	89 e5                	mov    %esp,%ebp
80105995:	83 ec 08             	sub    $0x8,%esp
80105998:	90                   	nop
80105999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801059a0:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801059a7:	c7 04 c5 82 58 11 80 	movl   $0x8e000008,-0x7feea77e(,%eax,8)
801059ae:	08 00 00 8e 
801059b2:	66 89 14 c5 80 58 11 	mov    %dx,-0x7feea780(,%eax,8)
801059b9:	80 
801059ba:	c1 ea 10             	shr    $0x10,%edx
801059bd:	66 89 14 c5 86 58 11 	mov    %dx,-0x7feea77a(,%eax,8)
801059c4:	80 
801059c5:	83 c0 01             	add    $0x1,%eax
801059c8:	3d 00 01 00 00       	cmp    $0x100,%eax
801059cd:	75 d1                	jne    801059a0 <tvinit+0x10>
801059cf:	a1 08 a1 10 80       	mov    0x8010a108,%eax
801059d4:	83 ec 08             	sub    $0x8,%esp
801059d7:	c7 05 82 5a 11 80 08 	movl   $0xef000008,0x80115a82
801059de:	00 00 ef 
801059e1:	68 69 7b 10 80       	push   $0x80107b69
801059e6:	68 40 58 11 80       	push   $0x80115840
801059eb:	66 a3 80 5a 11 80    	mov    %ax,0x80115a80
801059f1:	c1 e8 10             	shr    $0x10,%eax
801059f4:	66 a3 86 5a 11 80    	mov    %ax,0x80115a86
801059fa:	e8 51 ea ff ff       	call   80104450 <initlock>
801059ff:	83 c4 10             	add    $0x10,%esp
80105a02:	c9                   	leave  
80105a03:	c3                   	ret    
80105a04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105a0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105a10 <idtinit>:
80105a10:	55                   	push   %ebp
80105a11:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105a16:	89 e5                	mov    %esp,%ebp
80105a18:	83 ec 10             	sub    $0x10,%esp
80105a1b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
80105a1f:	b8 80 58 11 80       	mov    $0x80115880,%eax
80105a24:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105a28:	c1 e8 10             	shr    $0x10,%eax
80105a2b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
80105a2f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105a32:	0f 01 18             	lidtl  (%eax)
80105a35:	c9                   	leave  
80105a36:	c3                   	ret    
80105a37:	89 f6                	mov    %esi,%esi
80105a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a40 <trap>:
80105a40:	55                   	push   %ebp
80105a41:	89 e5                	mov    %esp,%ebp
80105a43:	57                   	push   %edi
80105a44:	56                   	push   %esi
80105a45:	53                   	push   %ebx
80105a46:	83 ec 1c             	sub    $0x1c,%esp
80105a49:	8b 7d 08             	mov    0x8(%ebp),%edi
80105a4c:	8b 47 30             	mov    0x30(%edi),%eax
80105a4f:	83 f8 40             	cmp    $0x40,%eax
80105a52:	0f 84 f0 00 00 00    	je     80105b48 <trap+0x108>
80105a58:	83 e8 20             	sub    $0x20,%eax
80105a5b:	83 f8 1f             	cmp    $0x1f,%eax
80105a5e:	77 10                	ja     80105a70 <trap+0x30>
80105a60:	ff 24 85 10 7c 10 80 	jmp    *-0x7fef83f0(,%eax,4)
80105a67:	89 f6                	mov    %esi,%esi
80105a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105a70:	e8 5b de ff ff       	call   801038d0 <myproc>
80105a75:	85 c0                	test   %eax,%eax
80105a77:	8b 5f 38             	mov    0x38(%edi),%ebx
80105a7a:	0f 84 14 02 00 00    	je     80105c94 <trap+0x254>
80105a80:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105a84:	0f 84 0a 02 00 00    	je     80105c94 <trap+0x254>
80105a8a:	0f 20 d1             	mov    %cr2,%ecx
80105a8d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105a90:	e8 1b de ff ff       	call   801038b0 <cpuid>
80105a95:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105a98:	8b 47 34             	mov    0x34(%edi),%eax
80105a9b:	8b 77 30             	mov    0x30(%edi),%esi
80105a9e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105aa1:	e8 2a de ff ff       	call   801038d0 <myproc>
80105aa6:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105aa9:	e8 22 de ff ff       	call   801038d0 <myproc>
80105aae:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105ab1:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105ab4:	51                   	push   %ecx
80105ab5:	53                   	push   %ebx
80105ab6:	52                   	push   %edx
80105ab7:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105aba:	ff 75 e4             	pushl  -0x1c(%ebp)
80105abd:	56                   	push   %esi
80105abe:	83 c2 6c             	add    $0x6c,%edx
80105ac1:	52                   	push   %edx
80105ac2:	ff 70 10             	pushl  0x10(%eax)
80105ac5:	68 cc 7b 10 80       	push   $0x80107bcc
80105aca:	e8 91 ab ff ff       	call   80100660 <cprintf>
80105acf:	83 c4 20             	add    $0x20,%esp
80105ad2:	e8 f9 dd ff ff       	call   801038d0 <myproc>
80105ad7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105ade:	e8 ed dd ff ff       	call   801038d0 <myproc>
80105ae3:	85 c0                	test   %eax,%eax
80105ae5:	74 1d                	je     80105b04 <trap+0xc4>
80105ae7:	e8 e4 dd ff ff       	call   801038d0 <myproc>
80105aec:	8b 50 24             	mov    0x24(%eax),%edx
80105aef:	85 d2                	test   %edx,%edx
80105af1:	74 11                	je     80105b04 <trap+0xc4>
80105af3:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105af7:	83 e0 03             	and    $0x3,%eax
80105afa:	66 83 f8 03          	cmp    $0x3,%ax
80105afe:	0f 84 4c 01 00 00    	je     80105c50 <trap+0x210>
80105b04:	e8 c7 dd ff ff       	call   801038d0 <myproc>
80105b09:	85 c0                	test   %eax,%eax
80105b0b:	74 0b                	je     80105b18 <trap+0xd8>
80105b0d:	e8 be dd ff ff       	call   801038d0 <myproc>
80105b12:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105b16:	74 68                	je     80105b80 <trap+0x140>
80105b18:	e8 b3 dd ff ff       	call   801038d0 <myproc>
80105b1d:	85 c0                	test   %eax,%eax
80105b1f:	74 19                	je     80105b3a <trap+0xfa>
80105b21:	e8 aa dd ff ff       	call   801038d0 <myproc>
80105b26:	8b 40 24             	mov    0x24(%eax),%eax
80105b29:	85 c0                	test   %eax,%eax
80105b2b:	74 0d                	je     80105b3a <trap+0xfa>
80105b2d:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105b31:	83 e0 03             	and    $0x3,%eax
80105b34:	66 83 f8 03          	cmp    $0x3,%ax
80105b38:	74 37                	je     80105b71 <trap+0x131>
80105b3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b3d:	5b                   	pop    %ebx
80105b3e:	5e                   	pop    %esi
80105b3f:	5f                   	pop    %edi
80105b40:	5d                   	pop    %ebp
80105b41:	c3                   	ret    
80105b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105b48:	e8 83 dd ff ff       	call   801038d0 <myproc>
80105b4d:	8b 58 24             	mov    0x24(%eax),%ebx
80105b50:	85 db                	test   %ebx,%ebx
80105b52:	0f 85 e8 00 00 00    	jne    80105c40 <trap+0x200>
80105b58:	e8 73 dd ff ff       	call   801038d0 <myproc>
80105b5d:	89 78 18             	mov    %edi,0x18(%eax)
80105b60:	e8 3b ef ff ff       	call   80104aa0 <syscall>
80105b65:	e8 66 dd ff ff       	call   801038d0 <myproc>
80105b6a:	8b 48 24             	mov    0x24(%eax),%ecx
80105b6d:	85 c9                	test   %ecx,%ecx
80105b6f:	74 c9                	je     80105b3a <trap+0xfa>
80105b71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b74:	5b                   	pop    %ebx
80105b75:	5e                   	pop    %esi
80105b76:	5f                   	pop    %edi
80105b77:	5d                   	pop    %ebp
80105b78:	e9 f3 e1 ff ff       	jmp    80103d70 <exit>
80105b7d:	8d 76 00             	lea    0x0(%esi),%esi
80105b80:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105b84:	75 92                	jne    80105b18 <trap+0xd8>
80105b86:	e8 15 e3 ff ff       	call   80103ea0 <yield>
80105b8b:	eb 8b                	jmp    80105b18 <trap+0xd8>
80105b8d:	8d 76 00             	lea    0x0(%esi),%esi
80105b90:	e8 1b dd ff ff       	call   801038b0 <cpuid>
80105b95:	85 c0                	test   %eax,%eax
80105b97:	0f 84 c3 00 00 00    	je     80105c60 <trap+0x220>
80105b9d:	e8 1e cc ff ff       	call   801027c0 <lapiceoi>
80105ba2:	e8 29 dd ff ff       	call   801038d0 <myproc>
80105ba7:	85 c0                	test   %eax,%eax
80105ba9:	0f 85 38 ff ff ff    	jne    80105ae7 <trap+0xa7>
80105baf:	e9 50 ff ff ff       	jmp    80105b04 <trap+0xc4>
80105bb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105bb8:	e8 c3 ca ff ff       	call   80102680 <kbdintr>
80105bbd:	e8 fe cb ff ff       	call   801027c0 <lapiceoi>
80105bc2:	e8 09 dd ff ff       	call   801038d0 <myproc>
80105bc7:	85 c0                	test   %eax,%eax
80105bc9:	0f 85 18 ff ff ff    	jne    80105ae7 <trap+0xa7>
80105bcf:	e9 30 ff ff ff       	jmp    80105b04 <trap+0xc4>
80105bd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105bd8:	e8 53 02 00 00       	call   80105e30 <uartintr>
80105bdd:	e8 de cb ff ff       	call   801027c0 <lapiceoi>
80105be2:	e8 e9 dc ff ff       	call   801038d0 <myproc>
80105be7:	85 c0                	test   %eax,%eax
80105be9:	0f 85 f8 fe ff ff    	jne    80105ae7 <trap+0xa7>
80105bef:	e9 10 ff ff ff       	jmp    80105b04 <trap+0xc4>
80105bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105bf8:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105bfc:	8b 77 38             	mov    0x38(%edi),%esi
80105bff:	e8 ac dc ff ff       	call   801038b0 <cpuid>
80105c04:	56                   	push   %esi
80105c05:	53                   	push   %ebx
80105c06:	50                   	push   %eax
80105c07:	68 74 7b 10 80       	push   $0x80107b74
80105c0c:	e8 4f aa ff ff       	call   80100660 <cprintf>
80105c11:	e8 aa cb ff ff       	call   801027c0 <lapiceoi>
80105c16:	83 c4 10             	add    $0x10,%esp
80105c19:	e8 b2 dc ff ff       	call   801038d0 <myproc>
80105c1e:	85 c0                	test   %eax,%eax
80105c20:	0f 85 c1 fe ff ff    	jne    80105ae7 <trap+0xa7>
80105c26:	e9 d9 fe ff ff       	jmp    80105b04 <trap+0xc4>
80105c2b:	90                   	nop
80105c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105c30:	e8 bb c4 ff ff       	call   801020f0 <ideintr>
80105c35:	e9 63 ff ff ff       	jmp    80105b9d <trap+0x15d>
80105c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105c40:	e8 2b e1 ff ff       	call   80103d70 <exit>
80105c45:	e9 0e ff ff ff       	jmp    80105b58 <trap+0x118>
80105c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105c50:	e8 1b e1 ff ff       	call   80103d70 <exit>
80105c55:	e9 aa fe ff ff       	jmp    80105b04 <trap+0xc4>
80105c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105c60:	83 ec 0c             	sub    $0xc,%esp
80105c63:	68 40 58 11 80       	push   $0x80115840
80105c68:	e8 23 e9 ff ff       	call   80104590 <acquire>
80105c6d:	c7 04 24 80 60 11 80 	movl   $0x80116080,(%esp)
80105c74:	83 05 80 60 11 80 01 	addl   $0x1,0x80116080
80105c7b:	e8 30 e4 ff ff       	call   801040b0 <wakeup>
80105c80:	c7 04 24 40 58 11 80 	movl   $0x80115840,(%esp)
80105c87:	e8 c4 e9 ff ff       	call   80104650 <release>
80105c8c:	83 c4 10             	add    $0x10,%esp
80105c8f:	e9 09 ff ff ff       	jmp    80105b9d <trap+0x15d>
80105c94:	0f 20 d6             	mov    %cr2,%esi
80105c97:	e8 14 dc ff ff       	call   801038b0 <cpuid>
80105c9c:	83 ec 0c             	sub    $0xc,%esp
80105c9f:	56                   	push   %esi
80105ca0:	53                   	push   %ebx
80105ca1:	50                   	push   %eax
80105ca2:	ff 77 30             	pushl  0x30(%edi)
80105ca5:	68 98 7b 10 80       	push   $0x80107b98
80105caa:	e8 b1 a9 ff ff       	call   80100660 <cprintf>
80105caf:	83 c4 14             	add    $0x14,%esp
80105cb2:	68 6e 7b 10 80       	push   $0x80107b6e
80105cb7:	e8 d4 a6 ff ff       	call   80100390 <panic>
80105cbc:	66 90                	xchg   %ax,%ax
80105cbe:	66 90                	xchg   %ax,%ax

80105cc0 <uartgetc>:
80105cc0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80105cc5:	55                   	push   %ebp
80105cc6:	89 e5                	mov    %esp,%ebp
80105cc8:	85 c0                	test   %eax,%eax
80105cca:	74 1c                	je     80105ce8 <uartgetc+0x28>
80105ccc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105cd1:	ec                   	in     (%dx),%al
80105cd2:	a8 01                	test   $0x1,%al
80105cd4:	74 12                	je     80105ce8 <uartgetc+0x28>
80105cd6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cdb:	ec                   	in     (%dx),%al
80105cdc:	0f b6 c0             	movzbl %al,%eax
80105cdf:	5d                   	pop    %ebp
80105ce0:	c3                   	ret    
80105ce1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ce8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ced:	5d                   	pop    %ebp
80105cee:	c3                   	ret    
80105cef:	90                   	nop

80105cf0 <uartputc.part.0>:
80105cf0:	55                   	push   %ebp
80105cf1:	89 e5                	mov    %esp,%ebp
80105cf3:	57                   	push   %edi
80105cf4:	56                   	push   %esi
80105cf5:	53                   	push   %ebx
80105cf6:	89 c7                	mov    %eax,%edi
80105cf8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105cfd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105d02:	83 ec 0c             	sub    $0xc,%esp
80105d05:	eb 1b                	jmp    80105d22 <uartputc.part.0+0x32>
80105d07:	89 f6                	mov    %esi,%esi
80105d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105d10:	83 ec 0c             	sub    $0xc,%esp
80105d13:	6a 0a                	push   $0xa
80105d15:	e8 c6 ca ff ff       	call   801027e0 <microdelay>
80105d1a:	83 c4 10             	add    $0x10,%esp
80105d1d:	83 eb 01             	sub    $0x1,%ebx
80105d20:	74 07                	je     80105d29 <uartputc.part.0+0x39>
80105d22:	89 f2                	mov    %esi,%edx
80105d24:	ec                   	in     (%dx),%al
80105d25:	a8 20                	test   $0x20,%al
80105d27:	74 e7                	je     80105d10 <uartputc.part.0+0x20>
80105d29:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d2e:	89 f8                	mov    %edi,%eax
80105d30:	ee                   	out    %al,(%dx)
80105d31:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d34:	5b                   	pop    %ebx
80105d35:	5e                   	pop    %esi
80105d36:	5f                   	pop    %edi
80105d37:	5d                   	pop    %ebp
80105d38:	c3                   	ret    
80105d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105d40 <uartinit>:
80105d40:	55                   	push   %ebp
80105d41:	31 c9                	xor    %ecx,%ecx
80105d43:	89 c8                	mov    %ecx,%eax
80105d45:	89 e5                	mov    %esp,%ebp
80105d47:	57                   	push   %edi
80105d48:	56                   	push   %esi
80105d49:	53                   	push   %ebx
80105d4a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105d4f:	89 da                	mov    %ebx,%edx
80105d51:	83 ec 0c             	sub    $0xc,%esp
80105d54:	ee                   	out    %al,(%dx)
80105d55:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105d5a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105d5f:	89 fa                	mov    %edi,%edx
80105d61:	ee                   	out    %al,(%dx)
80105d62:	b8 0c 00 00 00       	mov    $0xc,%eax
80105d67:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d6c:	ee                   	out    %al,(%dx)
80105d6d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105d72:	89 c8                	mov    %ecx,%eax
80105d74:	89 f2                	mov    %esi,%edx
80105d76:	ee                   	out    %al,(%dx)
80105d77:	b8 03 00 00 00       	mov    $0x3,%eax
80105d7c:	89 fa                	mov    %edi,%edx
80105d7e:	ee                   	out    %al,(%dx)
80105d7f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105d84:	89 c8                	mov    %ecx,%eax
80105d86:	ee                   	out    %al,(%dx)
80105d87:	b8 01 00 00 00       	mov    $0x1,%eax
80105d8c:	89 f2                	mov    %esi,%edx
80105d8e:	ee                   	out    %al,(%dx)
80105d8f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d94:	ec                   	in     (%dx),%al
80105d95:	3c ff                	cmp    $0xff,%al
80105d97:	74 5a                	je     80105df3 <uartinit+0xb3>
80105d99:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105da0:	00 00 00 
80105da3:	89 da                	mov    %ebx,%edx
80105da5:	ec                   	in     (%dx),%al
80105da6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dab:	ec                   	in     (%dx),%al
80105dac:	83 ec 08             	sub    $0x8,%esp
80105daf:	bb 90 7c 10 80       	mov    $0x80107c90,%ebx
80105db4:	6a 00                	push   $0x0
80105db6:	6a 04                	push   $0x4
80105db8:	e8 83 c5 ff ff       	call   80102340 <ioapicenable>
80105dbd:	83 c4 10             	add    $0x10,%esp
80105dc0:	b8 78 00 00 00       	mov    $0x78,%eax
80105dc5:	eb 13                	jmp    80105dda <uartinit+0x9a>
80105dc7:	89 f6                	mov    %esi,%esi
80105dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105dd0:	83 c3 01             	add    $0x1,%ebx
80105dd3:	0f be 03             	movsbl (%ebx),%eax
80105dd6:	84 c0                	test   %al,%al
80105dd8:	74 19                	je     80105df3 <uartinit+0xb3>
80105dda:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105de0:	85 d2                	test   %edx,%edx
80105de2:	74 ec                	je     80105dd0 <uartinit+0x90>
80105de4:	83 c3 01             	add    $0x1,%ebx
80105de7:	e8 04 ff ff ff       	call   80105cf0 <uartputc.part.0>
80105dec:	0f be 03             	movsbl (%ebx),%eax
80105def:	84 c0                	test   %al,%al
80105df1:	75 e7                	jne    80105dda <uartinit+0x9a>
80105df3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105df6:	5b                   	pop    %ebx
80105df7:	5e                   	pop    %esi
80105df8:	5f                   	pop    %edi
80105df9:	5d                   	pop    %ebp
80105dfa:	c3                   	ret    
80105dfb:	90                   	nop
80105dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105e00 <uartputc>:
80105e00:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105e06:	55                   	push   %ebp
80105e07:	89 e5                	mov    %esp,%ebp
80105e09:	85 d2                	test   %edx,%edx
80105e0b:	8b 45 08             	mov    0x8(%ebp),%eax
80105e0e:	74 10                	je     80105e20 <uartputc+0x20>
80105e10:	5d                   	pop    %ebp
80105e11:	e9 da fe ff ff       	jmp    80105cf0 <uartputc.part.0>
80105e16:	8d 76 00             	lea    0x0(%esi),%esi
80105e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105e20:	5d                   	pop    %ebp
80105e21:	c3                   	ret    
80105e22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e30 <uartintr>:
80105e30:	55                   	push   %ebp
80105e31:	89 e5                	mov    %esp,%ebp
80105e33:	83 ec 14             	sub    $0x14,%esp
80105e36:	68 c0 5c 10 80       	push   $0x80105cc0
80105e3b:	e8 10 aa ff ff       	call   80100850 <consoleintr>
80105e40:	83 c4 10             	add    $0x10,%esp
80105e43:	c9                   	leave  
80105e44:	c3                   	ret    

80105e45 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105e45:	6a 00                	push   $0x0
  pushl $0
80105e47:	6a 00                	push   $0x0
  jmp alltraps
80105e49:	e9 1b fb ff ff       	jmp    80105969 <alltraps>

80105e4e <vector1>:
.globl vector1
vector1:
  pushl $0
80105e4e:	6a 00                	push   $0x0
  pushl $1
80105e50:	6a 01                	push   $0x1
  jmp alltraps
80105e52:	e9 12 fb ff ff       	jmp    80105969 <alltraps>

80105e57 <vector2>:
.globl vector2
vector2:
  pushl $0
80105e57:	6a 00                	push   $0x0
  pushl $2
80105e59:	6a 02                	push   $0x2
  jmp alltraps
80105e5b:	e9 09 fb ff ff       	jmp    80105969 <alltraps>

80105e60 <vector3>:
.globl vector3
vector3:
  pushl $0
80105e60:	6a 00                	push   $0x0
  pushl $3
80105e62:	6a 03                	push   $0x3
  jmp alltraps
80105e64:	e9 00 fb ff ff       	jmp    80105969 <alltraps>

80105e69 <vector4>:
.globl vector4
vector4:
  pushl $0
80105e69:	6a 00                	push   $0x0
  pushl $4
80105e6b:	6a 04                	push   $0x4
  jmp alltraps
80105e6d:	e9 f7 fa ff ff       	jmp    80105969 <alltraps>

80105e72 <vector5>:
.globl vector5
vector5:
  pushl $0
80105e72:	6a 00                	push   $0x0
  pushl $5
80105e74:	6a 05                	push   $0x5
  jmp alltraps
80105e76:	e9 ee fa ff ff       	jmp    80105969 <alltraps>

80105e7b <vector6>:
.globl vector6
vector6:
  pushl $0
80105e7b:	6a 00                	push   $0x0
  pushl $6
80105e7d:	6a 06                	push   $0x6
  jmp alltraps
80105e7f:	e9 e5 fa ff ff       	jmp    80105969 <alltraps>

80105e84 <vector7>:
.globl vector7
vector7:
  pushl $0
80105e84:	6a 00                	push   $0x0
  pushl $7
80105e86:	6a 07                	push   $0x7
  jmp alltraps
80105e88:	e9 dc fa ff ff       	jmp    80105969 <alltraps>

80105e8d <vector8>:
.globl vector8
vector8:
  pushl $8
80105e8d:	6a 08                	push   $0x8
  jmp alltraps
80105e8f:	e9 d5 fa ff ff       	jmp    80105969 <alltraps>

80105e94 <vector9>:
.globl vector9
vector9:
  pushl $0
80105e94:	6a 00                	push   $0x0
  pushl $9
80105e96:	6a 09                	push   $0x9
  jmp alltraps
80105e98:	e9 cc fa ff ff       	jmp    80105969 <alltraps>

80105e9d <vector10>:
.globl vector10
vector10:
  pushl $10
80105e9d:	6a 0a                	push   $0xa
  jmp alltraps
80105e9f:	e9 c5 fa ff ff       	jmp    80105969 <alltraps>

80105ea4 <vector11>:
.globl vector11
vector11:
  pushl $11
80105ea4:	6a 0b                	push   $0xb
  jmp alltraps
80105ea6:	e9 be fa ff ff       	jmp    80105969 <alltraps>

80105eab <vector12>:
.globl vector12
vector12:
  pushl $12
80105eab:	6a 0c                	push   $0xc
  jmp alltraps
80105ead:	e9 b7 fa ff ff       	jmp    80105969 <alltraps>

80105eb2 <vector13>:
.globl vector13
vector13:
  pushl $13
80105eb2:	6a 0d                	push   $0xd
  jmp alltraps
80105eb4:	e9 b0 fa ff ff       	jmp    80105969 <alltraps>

80105eb9 <vector14>:
.globl vector14
vector14:
  pushl $14
80105eb9:	6a 0e                	push   $0xe
  jmp alltraps
80105ebb:	e9 a9 fa ff ff       	jmp    80105969 <alltraps>

80105ec0 <vector15>:
.globl vector15
vector15:
  pushl $0
80105ec0:	6a 00                	push   $0x0
  pushl $15
80105ec2:	6a 0f                	push   $0xf
  jmp alltraps
80105ec4:	e9 a0 fa ff ff       	jmp    80105969 <alltraps>

80105ec9 <vector16>:
.globl vector16
vector16:
  pushl $0
80105ec9:	6a 00                	push   $0x0
  pushl $16
80105ecb:	6a 10                	push   $0x10
  jmp alltraps
80105ecd:	e9 97 fa ff ff       	jmp    80105969 <alltraps>

80105ed2 <vector17>:
.globl vector17
vector17:
  pushl $17
80105ed2:	6a 11                	push   $0x11
  jmp alltraps
80105ed4:	e9 90 fa ff ff       	jmp    80105969 <alltraps>

80105ed9 <vector18>:
.globl vector18
vector18:
  pushl $0
80105ed9:	6a 00                	push   $0x0
  pushl $18
80105edb:	6a 12                	push   $0x12
  jmp alltraps
80105edd:	e9 87 fa ff ff       	jmp    80105969 <alltraps>

80105ee2 <vector19>:
.globl vector19
vector19:
  pushl $0
80105ee2:	6a 00                	push   $0x0
  pushl $19
80105ee4:	6a 13                	push   $0x13
  jmp alltraps
80105ee6:	e9 7e fa ff ff       	jmp    80105969 <alltraps>

80105eeb <vector20>:
.globl vector20
vector20:
  pushl $0
80105eeb:	6a 00                	push   $0x0
  pushl $20
80105eed:	6a 14                	push   $0x14
  jmp alltraps
80105eef:	e9 75 fa ff ff       	jmp    80105969 <alltraps>

80105ef4 <vector21>:
.globl vector21
vector21:
  pushl $0
80105ef4:	6a 00                	push   $0x0
  pushl $21
80105ef6:	6a 15                	push   $0x15
  jmp alltraps
80105ef8:	e9 6c fa ff ff       	jmp    80105969 <alltraps>

80105efd <vector22>:
.globl vector22
vector22:
  pushl $0
80105efd:	6a 00                	push   $0x0
  pushl $22
80105eff:	6a 16                	push   $0x16
  jmp alltraps
80105f01:	e9 63 fa ff ff       	jmp    80105969 <alltraps>

80105f06 <vector23>:
.globl vector23
vector23:
  pushl $0
80105f06:	6a 00                	push   $0x0
  pushl $23
80105f08:	6a 17                	push   $0x17
  jmp alltraps
80105f0a:	e9 5a fa ff ff       	jmp    80105969 <alltraps>

80105f0f <vector24>:
.globl vector24
vector24:
  pushl $0
80105f0f:	6a 00                	push   $0x0
  pushl $24
80105f11:	6a 18                	push   $0x18
  jmp alltraps
80105f13:	e9 51 fa ff ff       	jmp    80105969 <alltraps>

80105f18 <vector25>:
.globl vector25
vector25:
  pushl $0
80105f18:	6a 00                	push   $0x0
  pushl $25
80105f1a:	6a 19                	push   $0x19
  jmp alltraps
80105f1c:	e9 48 fa ff ff       	jmp    80105969 <alltraps>

80105f21 <vector26>:
.globl vector26
vector26:
  pushl $0
80105f21:	6a 00                	push   $0x0
  pushl $26
80105f23:	6a 1a                	push   $0x1a
  jmp alltraps
80105f25:	e9 3f fa ff ff       	jmp    80105969 <alltraps>

80105f2a <vector27>:
.globl vector27
vector27:
  pushl $0
80105f2a:	6a 00                	push   $0x0
  pushl $27
80105f2c:	6a 1b                	push   $0x1b
  jmp alltraps
80105f2e:	e9 36 fa ff ff       	jmp    80105969 <alltraps>

80105f33 <vector28>:
.globl vector28
vector28:
  pushl $0
80105f33:	6a 00                	push   $0x0
  pushl $28
80105f35:	6a 1c                	push   $0x1c
  jmp alltraps
80105f37:	e9 2d fa ff ff       	jmp    80105969 <alltraps>

80105f3c <vector29>:
.globl vector29
vector29:
  pushl $0
80105f3c:	6a 00                	push   $0x0
  pushl $29
80105f3e:	6a 1d                	push   $0x1d
  jmp alltraps
80105f40:	e9 24 fa ff ff       	jmp    80105969 <alltraps>

80105f45 <vector30>:
.globl vector30
vector30:
  pushl $0
80105f45:	6a 00                	push   $0x0
  pushl $30
80105f47:	6a 1e                	push   $0x1e
  jmp alltraps
80105f49:	e9 1b fa ff ff       	jmp    80105969 <alltraps>

80105f4e <vector31>:
.globl vector31
vector31:
  pushl $0
80105f4e:	6a 00                	push   $0x0
  pushl $31
80105f50:	6a 1f                	push   $0x1f
  jmp alltraps
80105f52:	e9 12 fa ff ff       	jmp    80105969 <alltraps>

80105f57 <vector32>:
.globl vector32
vector32:
  pushl $0
80105f57:	6a 00                	push   $0x0
  pushl $32
80105f59:	6a 20                	push   $0x20
  jmp alltraps
80105f5b:	e9 09 fa ff ff       	jmp    80105969 <alltraps>

80105f60 <vector33>:
.globl vector33
vector33:
  pushl $0
80105f60:	6a 00                	push   $0x0
  pushl $33
80105f62:	6a 21                	push   $0x21
  jmp alltraps
80105f64:	e9 00 fa ff ff       	jmp    80105969 <alltraps>

80105f69 <vector34>:
.globl vector34
vector34:
  pushl $0
80105f69:	6a 00                	push   $0x0
  pushl $34
80105f6b:	6a 22                	push   $0x22
  jmp alltraps
80105f6d:	e9 f7 f9 ff ff       	jmp    80105969 <alltraps>

80105f72 <vector35>:
.globl vector35
vector35:
  pushl $0
80105f72:	6a 00                	push   $0x0
  pushl $35
80105f74:	6a 23                	push   $0x23
  jmp alltraps
80105f76:	e9 ee f9 ff ff       	jmp    80105969 <alltraps>

80105f7b <vector36>:
.globl vector36
vector36:
  pushl $0
80105f7b:	6a 00                	push   $0x0
  pushl $36
80105f7d:	6a 24                	push   $0x24
  jmp alltraps
80105f7f:	e9 e5 f9 ff ff       	jmp    80105969 <alltraps>

80105f84 <vector37>:
.globl vector37
vector37:
  pushl $0
80105f84:	6a 00                	push   $0x0
  pushl $37
80105f86:	6a 25                	push   $0x25
  jmp alltraps
80105f88:	e9 dc f9 ff ff       	jmp    80105969 <alltraps>

80105f8d <vector38>:
.globl vector38
vector38:
  pushl $0
80105f8d:	6a 00                	push   $0x0
  pushl $38
80105f8f:	6a 26                	push   $0x26
  jmp alltraps
80105f91:	e9 d3 f9 ff ff       	jmp    80105969 <alltraps>

80105f96 <vector39>:
.globl vector39
vector39:
  pushl $0
80105f96:	6a 00                	push   $0x0
  pushl $39
80105f98:	6a 27                	push   $0x27
  jmp alltraps
80105f9a:	e9 ca f9 ff ff       	jmp    80105969 <alltraps>

80105f9f <vector40>:
.globl vector40
vector40:
  pushl $0
80105f9f:	6a 00                	push   $0x0
  pushl $40
80105fa1:	6a 28                	push   $0x28
  jmp alltraps
80105fa3:	e9 c1 f9 ff ff       	jmp    80105969 <alltraps>

80105fa8 <vector41>:
.globl vector41
vector41:
  pushl $0
80105fa8:	6a 00                	push   $0x0
  pushl $41
80105faa:	6a 29                	push   $0x29
  jmp alltraps
80105fac:	e9 b8 f9 ff ff       	jmp    80105969 <alltraps>

80105fb1 <vector42>:
.globl vector42
vector42:
  pushl $0
80105fb1:	6a 00                	push   $0x0
  pushl $42
80105fb3:	6a 2a                	push   $0x2a
  jmp alltraps
80105fb5:	e9 af f9 ff ff       	jmp    80105969 <alltraps>

80105fba <vector43>:
.globl vector43
vector43:
  pushl $0
80105fba:	6a 00                	push   $0x0
  pushl $43
80105fbc:	6a 2b                	push   $0x2b
  jmp alltraps
80105fbe:	e9 a6 f9 ff ff       	jmp    80105969 <alltraps>

80105fc3 <vector44>:
.globl vector44
vector44:
  pushl $0
80105fc3:	6a 00                	push   $0x0
  pushl $44
80105fc5:	6a 2c                	push   $0x2c
  jmp alltraps
80105fc7:	e9 9d f9 ff ff       	jmp    80105969 <alltraps>

80105fcc <vector45>:
.globl vector45
vector45:
  pushl $0
80105fcc:	6a 00                	push   $0x0
  pushl $45
80105fce:	6a 2d                	push   $0x2d
  jmp alltraps
80105fd0:	e9 94 f9 ff ff       	jmp    80105969 <alltraps>

80105fd5 <vector46>:
.globl vector46
vector46:
  pushl $0
80105fd5:	6a 00                	push   $0x0
  pushl $46
80105fd7:	6a 2e                	push   $0x2e
  jmp alltraps
80105fd9:	e9 8b f9 ff ff       	jmp    80105969 <alltraps>

80105fde <vector47>:
.globl vector47
vector47:
  pushl $0
80105fde:	6a 00                	push   $0x0
  pushl $47
80105fe0:	6a 2f                	push   $0x2f
  jmp alltraps
80105fe2:	e9 82 f9 ff ff       	jmp    80105969 <alltraps>

80105fe7 <vector48>:
.globl vector48
vector48:
  pushl $0
80105fe7:	6a 00                	push   $0x0
  pushl $48
80105fe9:	6a 30                	push   $0x30
  jmp alltraps
80105feb:	e9 79 f9 ff ff       	jmp    80105969 <alltraps>

80105ff0 <vector49>:
.globl vector49
vector49:
  pushl $0
80105ff0:	6a 00                	push   $0x0
  pushl $49
80105ff2:	6a 31                	push   $0x31
  jmp alltraps
80105ff4:	e9 70 f9 ff ff       	jmp    80105969 <alltraps>

80105ff9 <vector50>:
.globl vector50
vector50:
  pushl $0
80105ff9:	6a 00                	push   $0x0
  pushl $50
80105ffb:	6a 32                	push   $0x32
  jmp alltraps
80105ffd:	e9 67 f9 ff ff       	jmp    80105969 <alltraps>

80106002 <vector51>:
.globl vector51
vector51:
  pushl $0
80106002:	6a 00                	push   $0x0
  pushl $51
80106004:	6a 33                	push   $0x33
  jmp alltraps
80106006:	e9 5e f9 ff ff       	jmp    80105969 <alltraps>

8010600b <vector52>:
.globl vector52
vector52:
  pushl $0
8010600b:	6a 00                	push   $0x0
  pushl $52
8010600d:	6a 34                	push   $0x34
  jmp alltraps
8010600f:	e9 55 f9 ff ff       	jmp    80105969 <alltraps>

80106014 <vector53>:
.globl vector53
vector53:
  pushl $0
80106014:	6a 00                	push   $0x0
  pushl $53
80106016:	6a 35                	push   $0x35
  jmp alltraps
80106018:	e9 4c f9 ff ff       	jmp    80105969 <alltraps>

8010601d <vector54>:
.globl vector54
vector54:
  pushl $0
8010601d:	6a 00                	push   $0x0
  pushl $54
8010601f:	6a 36                	push   $0x36
  jmp alltraps
80106021:	e9 43 f9 ff ff       	jmp    80105969 <alltraps>

80106026 <vector55>:
.globl vector55
vector55:
  pushl $0
80106026:	6a 00                	push   $0x0
  pushl $55
80106028:	6a 37                	push   $0x37
  jmp alltraps
8010602a:	e9 3a f9 ff ff       	jmp    80105969 <alltraps>

8010602f <vector56>:
.globl vector56
vector56:
  pushl $0
8010602f:	6a 00                	push   $0x0
  pushl $56
80106031:	6a 38                	push   $0x38
  jmp alltraps
80106033:	e9 31 f9 ff ff       	jmp    80105969 <alltraps>

80106038 <vector57>:
.globl vector57
vector57:
  pushl $0
80106038:	6a 00                	push   $0x0
  pushl $57
8010603a:	6a 39                	push   $0x39
  jmp alltraps
8010603c:	e9 28 f9 ff ff       	jmp    80105969 <alltraps>

80106041 <vector58>:
.globl vector58
vector58:
  pushl $0
80106041:	6a 00                	push   $0x0
  pushl $58
80106043:	6a 3a                	push   $0x3a
  jmp alltraps
80106045:	e9 1f f9 ff ff       	jmp    80105969 <alltraps>

8010604a <vector59>:
.globl vector59
vector59:
  pushl $0
8010604a:	6a 00                	push   $0x0
  pushl $59
8010604c:	6a 3b                	push   $0x3b
  jmp alltraps
8010604e:	e9 16 f9 ff ff       	jmp    80105969 <alltraps>

80106053 <vector60>:
.globl vector60
vector60:
  pushl $0
80106053:	6a 00                	push   $0x0
  pushl $60
80106055:	6a 3c                	push   $0x3c
  jmp alltraps
80106057:	e9 0d f9 ff ff       	jmp    80105969 <alltraps>

8010605c <vector61>:
.globl vector61
vector61:
  pushl $0
8010605c:	6a 00                	push   $0x0
  pushl $61
8010605e:	6a 3d                	push   $0x3d
  jmp alltraps
80106060:	e9 04 f9 ff ff       	jmp    80105969 <alltraps>

80106065 <vector62>:
.globl vector62
vector62:
  pushl $0
80106065:	6a 00                	push   $0x0
  pushl $62
80106067:	6a 3e                	push   $0x3e
  jmp alltraps
80106069:	e9 fb f8 ff ff       	jmp    80105969 <alltraps>

8010606e <vector63>:
.globl vector63
vector63:
  pushl $0
8010606e:	6a 00                	push   $0x0
  pushl $63
80106070:	6a 3f                	push   $0x3f
  jmp alltraps
80106072:	e9 f2 f8 ff ff       	jmp    80105969 <alltraps>

80106077 <vector64>:
.globl vector64
vector64:
  pushl $0
80106077:	6a 00                	push   $0x0
  pushl $64
80106079:	6a 40                	push   $0x40
  jmp alltraps
8010607b:	e9 e9 f8 ff ff       	jmp    80105969 <alltraps>

80106080 <vector65>:
.globl vector65
vector65:
  pushl $0
80106080:	6a 00                	push   $0x0
  pushl $65
80106082:	6a 41                	push   $0x41
  jmp alltraps
80106084:	e9 e0 f8 ff ff       	jmp    80105969 <alltraps>

80106089 <vector66>:
.globl vector66
vector66:
  pushl $0
80106089:	6a 00                	push   $0x0
  pushl $66
8010608b:	6a 42                	push   $0x42
  jmp alltraps
8010608d:	e9 d7 f8 ff ff       	jmp    80105969 <alltraps>

80106092 <vector67>:
.globl vector67
vector67:
  pushl $0
80106092:	6a 00                	push   $0x0
  pushl $67
80106094:	6a 43                	push   $0x43
  jmp alltraps
80106096:	e9 ce f8 ff ff       	jmp    80105969 <alltraps>

8010609b <vector68>:
.globl vector68
vector68:
  pushl $0
8010609b:	6a 00                	push   $0x0
  pushl $68
8010609d:	6a 44                	push   $0x44
  jmp alltraps
8010609f:	e9 c5 f8 ff ff       	jmp    80105969 <alltraps>

801060a4 <vector69>:
.globl vector69
vector69:
  pushl $0
801060a4:	6a 00                	push   $0x0
  pushl $69
801060a6:	6a 45                	push   $0x45
  jmp alltraps
801060a8:	e9 bc f8 ff ff       	jmp    80105969 <alltraps>

801060ad <vector70>:
.globl vector70
vector70:
  pushl $0
801060ad:	6a 00                	push   $0x0
  pushl $70
801060af:	6a 46                	push   $0x46
  jmp alltraps
801060b1:	e9 b3 f8 ff ff       	jmp    80105969 <alltraps>

801060b6 <vector71>:
.globl vector71
vector71:
  pushl $0
801060b6:	6a 00                	push   $0x0
  pushl $71
801060b8:	6a 47                	push   $0x47
  jmp alltraps
801060ba:	e9 aa f8 ff ff       	jmp    80105969 <alltraps>

801060bf <vector72>:
.globl vector72
vector72:
  pushl $0
801060bf:	6a 00                	push   $0x0
  pushl $72
801060c1:	6a 48                	push   $0x48
  jmp alltraps
801060c3:	e9 a1 f8 ff ff       	jmp    80105969 <alltraps>

801060c8 <vector73>:
.globl vector73
vector73:
  pushl $0
801060c8:	6a 00                	push   $0x0
  pushl $73
801060ca:	6a 49                	push   $0x49
  jmp alltraps
801060cc:	e9 98 f8 ff ff       	jmp    80105969 <alltraps>

801060d1 <vector74>:
.globl vector74
vector74:
  pushl $0
801060d1:	6a 00                	push   $0x0
  pushl $74
801060d3:	6a 4a                	push   $0x4a
  jmp alltraps
801060d5:	e9 8f f8 ff ff       	jmp    80105969 <alltraps>

801060da <vector75>:
.globl vector75
vector75:
  pushl $0
801060da:	6a 00                	push   $0x0
  pushl $75
801060dc:	6a 4b                	push   $0x4b
  jmp alltraps
801060de:	e9 86 f8 ff ff       	jmp    80105969 <alltraps>

801060e3 <vector76>:
.globl vector76
vector76:
  pushl $0
801060e3:	6a 00                	push   $0x0
  pushl $76
801060e5:	6a 4c                	push   $0x4c
  jmp alltraps
801060e7:	e9 7d f8 ff ff       	jmp    80105969 <alltraps>

801060ec <vector77>:
.globl vector77
vector77:
  pushl $0
801060ec:	6a 00                	push   $0x0
  pushl $77
801060ee:	6a 4d                	push   $0x4d
  jmp alltraps
801060f0:	e9 74 f8 ff ff       	jmp    80105969 <alltraps>

801060f5 <vector78>:
.globl vector78
vector78:
  pushl $0
801060f5:	6a 00                	push   $0x0
  pushl $78
801060f7:	6a 4e                	push   $0x4e
  jmp alltraps
801060f9:	e9 6b f8 ff ff       	jmp    80105969 <alltraps>

801060fe <vector79>:
.globl vector79
vector79:
  pushl $0
801060fe:	6a 00                	push   $0x0
  pushl $79
80106100:	6a 4f                	push   $0x4f
  jmp alltraps
80106102:	e9 62 f8 ff ff       	jmp    80105969 <alltraps>

80106107 <vector80>:
.globl vector80
vector80:
  pushl $0
80106107:	6a 00                	push   $0x0
  pushl $80
80106109:	6a 50                	push   $0x50
  jmp alltraps
8010610b:	e9 59 f8 ff ff       	jmp    80105969 <alltraps>

80106110 <vector81>:
.globl vector81
vector81:
  pushl $0
80106110:	6a 00                	push   $0x0
  pushl $81
80106112:	6a 51                	push   $0x51
  jmp alltraps
80106114:	e9 50 f8 ff ff       	jmp    80105969 <alltraps>

80106119 <vector82>:
.globl vector82
vector82:
  pushl $0
80106119:	6a 00                	push   $0x0
  pushl $82
8010611b:	6a 52                	push   $0x52
  jmp alltraps
8010611d:	e9 47 f8 ff ff       	jmp    80105969 <alltraps>

80106122 <vector83>:
.globl vector83
vector83:
  pushl $0
80106122:	6a 00                	push   $0x0
  pushl $83
80106124:	6a 53                	push   $0x53
  jmp alltraps
80106126:	e9 3e f8 ff ff       	jmp    80105969 <alltraps>

8010612b <vector84>:
.globl vector84
vector84:
  pushl $0
8010612b:	6a 00                	push   $0x0
  pushl $84
8010612d:	6a 54                	push   $0x54
  jmp alltraps
8010612f:	e9 35 f8 ff ff       	jmp    80105969 <alltraps>

80106134 <vector85>:
.globl vector85
vector85:
  pushl $0
80106134:	6a 00                	push   $0x0
  pushl $85
80106136:	6a 55                	push   $0x55
  jmp alltraps
80106138:	e9 2c f8 ff ff       	jmp    80105969 <alltraps>

8010613d <vector86>:
.globl vector86
vector86:
  pushl $0
8010613d:	6a 00                	push   $0x0
  pushl $86
8010613f:	6a 56                	push   $0x56
  jmp alltraps
80106141:	e9 23 f8 ff ff       	jmp    80105969 <alltraps>

80106146 <vector87>:
.globl vector87
vector87:
  pushl $0
80106146:	6a 00                	push   $0x0
  pushl $87
80106148:	6a 57                	push   $0x57
  jmp alltraps
8010614a:	e9 1a f8 ff ff       	jmp    80105969 <alltraps>

8010614f <vector88>:
.globl vector88
vector88:
  pushl $0
8010614f:	6a 00                	push   $0x0
  pushl $88
80106151:	6a 58                	push   $0x58
  jmp alltraps
80106153:	e9 11 f8 ff ff       	jmp    80105969 <alltraps>

80106158 <vector89>:
.globl vector89
vector89:
  pushl $0
80106158:	6a 00                	push   $0x0
  pushl $89
8010615a:	6a 59                	push   $0x59
  jmp alltraps
8010615c:	e9 08 f8 ff ff       	jmp    80105969 <alltraps>

80106161 <vector90>:
.globl vector90
vector90:
  pushl $0
80106161:	6a 00                	push   $0x0
  pushl $90
80106163:	6a 5a                	push   $0x5a
  jmp alltraps
80106165:	e9 ff f7 ff ff       	jmp    80105969 <alltraps>

8010616a <vector91>:
.globl vector91
vector91:
  pushl $0
8010616a:	6a 00                	push   $0x0
  pushl $91
8010616c:	6a 5b                	push   $0x5b
  jmp alltraps
8010616e:	e9 f6 f7 ff ff       	jmp    80105969 <alltraps>

80106173 <vector92>:
.globl vector92
vector92:
  pushl $0
80106173:	6a 00                	push   $0x0
  pushl $92
80106175:	6a 5c                	push   $0x5c
  jmp alltraps
80106177:	e9 ed f7 ff ff       	jmp    80105969 <alltraps>

8010617c <vector93>:
.globl vector93
vector93:
  pushl $0
8010617c:	6a 00                	push   $0x0
  pushl $93
8010617e:	6a 5d                	push   $0x5d
  jmp alltraps
80106180:	e9 e4 f7 ff ff       	jmp    80105969 <alltraps>

80106185 <vector94>:
.globl vector94
vector94:
  pushl $0
80106185:	6a 00                	push   $0x0
  pushl $94
80106187:	6a 5e                	push   $0x5e
  jmp alltraps
80106189:	e9 db f7 ff ff       	jmp    80105969 <alltraps>

8010618e <vector95>:
.globl vector95
vector95:
  pushl $0
8010618e:	6a 00                	push   $0x0
  pushl $95
80106190:	6a 5f                	push   $0x5f
  jmp alltraps
80106192:	e9 d2 f7 ff ff       	jmp    80105969 <alltraps>

80106197 <vector96>:
.globl vector96
vector96:
  pushl $0
80106197:	6a 00                	push   $0x0
  pushl $96
80106199:	6a 60                	push   $0x60
  jmp alltraps
8010619b:	e9 c9 f7 ff ff       	jmp    80105969 <alltraps>

801061a0 <vector97>:
.globl vector97
vector97:
  pushl $0
801061a0:	6a 00                	push   $0x0
  pushl $97
801061a2:	6a 61                	push   $0x61
  jmp alltraps
801061a4:	e9 c0 f7 ff ff       	jmp    80105969 <alltraps>

801061a9 <vector98>:
.globl vector98
vector98:
  pushl $0
801061a9:	6a 00                	push   $0x0
  pushl $98
801061ab:	6a 62                	push   $0x62
  jmp alltraps
801061ad:	e9 b7 f7 ff ff       	jmp    80105969 <alltraps>

801061b2 <vector99>:
.globl vector99
vector99:
  pushl $0
801061b2:	6a 00                	push   $0x0
  pushl $99
801061b4:	6a 63                	push   $0x63
  jmp alltraps
801061b6:	e9 ae f7 ff ff       	jmp    80105969 <alltraps>

801061bb <vector100>:
.globl vector100
vector100:
  pushl $0
801061bb:	6a 00                	push   $0x0
  pushl $100
801061bd:	6a 64                	push   $0x64
  jmp alltraps
801061bf:	e9 a5 f7 ff ff       	jmp    80105969 <alltraps>

801061c4 <vector101>:
.globl vector101
vector101:
  pushl $0
801061c4:	6a 00                	push   $0x0
  pushl $101
801061c6:	6a 65                	push   $0x65
  jmp alltraps
801061c8:	e9 9c f7 ff ff       	jmp    80105969 <alltraps>

801061cd <vector102>:
.globl vector102
vector102:
  pushl $0
801061cd:	6a 00                	push   $0x0
  pushl $102
801061cf:	6a 66                	push   $0x66
  jmp alltraps
801061d1:	e9 93 f7 ff ff       	jmp    80105969 <alltraps>

801061d6 <vector103>:
.globl vector103
vector103:
  pushl $0
801061d6:	6a 00                	push   $0x0
  pushl $103
801061d8:	6a 67                	push   $0x67
  jmp alltraps
801061da:	e9 8a f7 ff ff       	jmp    80105969 <alltraps>

801061df <vector104>:
.globl vector104
vector104:
  pushl $0
801061df:	6a 00                	push   $0x0
  pushl $104
801061e1:	6a 68                	push   $0x68
  jmp alltraps
801061e3:	e9 81 f7 ff ff       	jmp    80105969 <alltraps>

801061e8 <vector105>:
.globl vector105
vector105:
  pushl $0
801061e8:	6a 00                	push   $0x0
  pushl $105
801061ea:	6a 69                	push   $0x69
  jmp alltraps
801061ec:	e9 78 f7 ff ff       	jmp    80105969 <alltraps>

801061f1 <vector106>:
.globl vector106
vector106:
  pushl $0
801061f1:	6a 00                	push   $0x0
  pushl $106
801061f3:	6a 6a                	push   $0x6a
  jmp alltraps
801061f5:	e9 6f f7 ff ff       	jmp    80105969 <alltraps>

801061fa <vector107>:
.globl vector107
vector107:
  pushl $0
801061fa:	6a 00                	push   $0x0
  pushl $107
801061fc:	6a 6b                	push   $0x6b
  jmp alltraps
801061fe:	e9 66 f7 ff ff       	jmp    80105969 <alltraps>

80106203 <vector108>:
.globl vector108
vector108:
  pushl $0
80106203:	6a 00                	push   $0x0
  pushl $108
80106205:	6a 6c                	push   $0x6c
  jmp alltraps
80106207:	e9 5d f7 ff ff       	jmp    80105969 <alltraps>

8010620c <vector109>:
.globl vector109
vector109:
  pushl $0
8010620c:	6a 00                	push   $0x0
  pushl $109
8010620e:	6a 6d                	push   $0x6d
  jmp alltraps
80106210:	e9 54 f7 ff ff       	jmp    80105969 <alltraps>

80106215 <vector110>:
.globl vector110
vector110:
  pushl $0
80106215:	6a 00                	push   $0x0
  pushl $110
80106217:	6a 6e                	push   $0x6e
  jmp alltraps
80106219:	e9 4b f7 ff ff       	jmp    80105969 <alltraps>

8010621e <vector111>:
.globl vector111
vector111:
  pushl $0
8010621e:	6a 00                	push   $0x0
  pushl $111
80106220:	6a 6f                	push   $0x6f
  jmp alltraps
80106222:	e9 42 f7 ff ff       	jmp    80105969 <alltraps>

80106227 <vector112>:
.globl vector112
vector112:
  pushl $0
80106227:	6a 00                	push   $0x0
  pushl $112
80106229:	6a 70                	push   $0x70
  jmp alltraps
8010622b:	e9 39 f7 ff ff       	jmp    80105969 <alltraps>

80106230 <vector113>:
.globl vector113
vector113:
  pushl $0
80106230:	6a 00                	push   $0x0
  pushl $113
80106232:	6a 71                	push   $0x71
  jmp alltraps
80106234:	e9 30 f7 ff ff       	jmp    80105969 <alltraps>

80106239 <vector114>:
.globl vector114
vector114:
  pushl $0
80106239:	6a 00                	push   $0x0
  pushl $114
8010623b:	6a 72                	push   $0x72
  jmp alltraps
8010623d:	e9 27 f7 ff ff       	jmp    80105969 <alltraps>

80106242 <vector115>:
.globl vector115
vector115:
  pushl $0
80106242:	6a 00                	push   $0x0
  pushl $115
80106244:	6a 73                	push   $0x73
  jmp alltraps
80106246:	e9 1e f7 ff ff       	jmp    80105969 <alltraps>

8010624b <vector116>:
.globl vector116
vector116:
  pushl $0
8010624b:	6a 00                	push   $0x0
  pushl $116
8010624d:	6a 74                	push   $0x74
  jmp alltraps
8010624f:	e9 15 f7 ff ff       	jmp    80105969 <alltraps>

80106254 <vector117>:
.globl vector117
vector117:
  pushl $0
80106254:	6a 00                	push   $0x0
  pushl $117
80106256:	6a 75                	push   $0x75
  jmp alltraps
80106258:	e9 0c f7 ff ff       	jmp    80105969 <alltraps>

8010625d <vector118>:
.globl vector118
vector118:
  pushl $0
8010625d:	6a 00                	push   $0x0
  pushl $118
8010625f:	6a 76                	push   $0x76
  jmp alltraps
80106261:	e9 03 f7 ff ff       	jmp    80105969 <alltraps>

80106266 <vector119>:
.globl vector119
vector119:
  pushl $0
80106266:	6a 00                	push   $0x0
  pushl $119
80106268:	6a 77                	push   $0x77
  jmp alltraps
8010626a:	e9 fa f6 ff ff       	jmp    80105969 <alltraps>

8010626f <vector120>:
.globl vector120
vector120:
  pushl $0
8010626f:	6a 00                	push   $0x0
  pushl $120
80106271:	6a 78                	push   $0x78
  jmp alltraps
80106273:	e9 f1 f6 ff ff       	jmp    80105969 <alltraps>

80106278 <vector121>:
.globl vector121
vector121:
  pushl $0
80106278:	6a 00                	push   $0x0
  pushl $121
8010627a:	6a 79                	push   $0x79
  jmp alltraps
8010627c:	e9 e8 f6 ff ff       	jmp    80105969 <alltraps>

80106281 <vector122>:
.globl vector122
vector122:
  pushl $0
80106281:	6a 00                	push   $0x0
  pushl $122
80106283:	6a 7a                	push   $0x7a
  jmp alltraps
80106285:	e9 df f6 ff ff       	jmp    80105969 <alltraps>

8010628a <vector123>:
.globl vector123
vector123:
  pushl $0
8010628a:	6a 00                	push   $0x0
  pushl $123
8010628c:	6a 7b                	push   $0x7b
  jmp alltraps
8010628e:	e9 d6 f6 ff ff       	jmp    80105969 <alltraps>

80106293 <vector124>:
.globl vector124
vector124:
  pushl $0
80106293:	6a 00                	push   $0x0
  pushl $124
80106295:	6a 7c                	push   $0x7c
  jmp alltraps
80106297:	e9 cd f6 ff ff       	jmp    80105969 <alltraps>

8010629c <vector125>:
.globl vector125
vector125:
  pushl $0
8010629c:	6a 00                	push   $0x0
  pushl $125
8010629e:	6a 7d                	push   $0x7d
  jmp alltraps
801062a0:	e9 c4 f6 ff ff       	jmp    80105969 <alltraps>

801062a5 <vector126>:
.globl vector126
vector126:
  pushl $0
801062a5:	6a 00                	push   $0x0
  pushl $126
801062a7:	6a 7e                	push   $0x7e
  jmp alltraps
801062a9:	e9 bb f6 ff ff       	jmp    80105969 <alltraps>

801062ae <vector127>:
.globl vector127
vector127:
  pushl $0
801062ae:	6a 00                	push   $0x0
  pushl $127
801062b0:	6a 7f                	push   $0x7f
  jmp alltraps
801062b2:	e9 b2 f6 ff ff       	jmp    80105969 <alltraps>

801062b7 <vector128>:
.globl vector128
vector128:
  pushl $0
801062b7:	6a 00                	push   $0x0
  pushl $128
801062b9:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801062be:	e9 a6 f6 ff ff       	jmp    80105969 <alltraps>

801062c3 <vector129>:
.globl vector129
vector129:
  pushl $0
801062c3:	6a 00                	push   $0x0
  pushl $129
801062c5:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801062ca:	e9 9a f6 ff ff       	jmp    80105969 <alltraps>

801062cf <vector130>:
.globl vector130
vector130:
  pushl $0
801062cf:	6a 00                	push   $0x0
  pushl $130
801062d1:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801062d6:	e9 8e f6 ff ff       	jmp    80105969 <alltraps>

801062db <vector131>:
.globl vector131
vector131:
  pushl $0
801062db:	6a 00                	push   $0x0
  pushl $131
801062dd:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801062e2:	e9 82 f6 ff ff       	jmp    80105969 <alltraps>

801062e7 <vector132>:
.globl vector132
vector132:
  pushl $0
801062e7:	6a 00                	push   $0x0
  pushl $132
801062e9:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801062ee:	e9 76 f6 ff ff       	jmp    80105969 <alltraps>

801062f3 <vector133>:
.globl vector133
vector133:
  pushl $0
801062f3:	6a 00                	push   $0x0
  pushl $133
801062f5:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801062fa:	e9 6a f6 ff ff       	jmp    80105969 <alltraps>

801062ff <vector134>:
.globl vector134
vector134:
  pushl $0
801062ff:	6a 00                	push   $0x0
  pushl $134
80106301:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106306:	e9 5e f6 ff ff       	jmp    80105969 <alltraps>

8010630b <vector135>:
.globl vector135
vector135:
  pushl $0
8010630b:	6a 00                	push   $0x0
  pushl $135
8010630d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106312:	e9 52 f6 ff ff       	jmp    80105969 <alltraps>

80106317 <vector136>:
.globl vector136
vector136:
  pushl $0
80106317:	6a 00                	push   $0x0
  pushl $136
80106319:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010631e:	e9 46 f6 ff ff       	jmp    80105969 <alltraps>

80106323 <vector137>:
.globl vector137
vector137:
  pushl $0
80106323:	6a 00                	push   $0x0
  pushl $137
80106325:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010632a:	e9 3a f6 ff ff       	jmp    80105969 <alltraps>

8010632f <vector138>:
.globl vector138
vector138:
  pushl $0
8010632f:	6a 00                	push   $0x0
  pushl $138
80106331:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80106336:	e9 2e f6 ff ff       	jmp    80105969 <alltraps>

8010633b <vector139>:
.globl vector139
vector139:
  pushl $0
8010633b:	6a 00                	push   $0x0
  pushl $139
8010633d:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106342:	e9 22 f6 ff ff       	jmp    80105969 <alltraps>

80106347 <vector140>:
.globl vector140
vector140:
  pushl $0
80106347:	6a 00                	push   $0x0
  pushl $140
80106349:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010634e:	e9 16 f6 ff ff       	jmp    80105969 <alltraps>

80106353 <vector141>:
.globl vector141
vector141:
  pushl $0
80106353:	6a 00                	push   $0x0
  pushl $141
80106355:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010635a:	e9 0a f6 ff ff       	jmp    80105969 <alltraps>

8010635f <vector142>:
.globl vector142
vector142:
  pushl $0
8010635f:	6a 00                	push   $0x0
  pushl $142
80106361:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106366:	e9 fe f5 ff ff       	jmp    80105969 <alltraps>

8010636b <vector143>:
.globl vector143
vector143:
  pushl $0
8010636b:	6a 00                	push   $0x0
  pushl $143
8010636d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106372:	e9 f2 f5 ff ff       	jmp    80105969 <alltraps>

80106377 <vector144>:
.globl vector144
vector144:
  pushl $0
80106377:	6a 00                	push   $0x0
  pushl $144
80106379:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010637e:	e9 e6 f5 ff ff       	jmp    80105969 <alltraps>

80106383 <vector145>:
.globl vector145
vector145:
  pushl $0
80106383:	6a 00                	push   $0x0
  pushl $145
80106385:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010638a:	e9 da f5 ff ff       	jmp    80105969 <alltraps>

8010638f <vector146>:
.globl vector146
vector146:
  pushl $0
8010638f:	6a 00                	push   $0x0
  pushl $146
80106391:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106396:	e9 ce f5 ff ff       	jmp    80105969 <alltraps>

8010639b <vector147>:
.globl vector147
vector147:
  pushl $0
8010639b:	6a 00                	push   $0x0
  pushl $147
8010639d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801063a2:	e9 c2 f5 ff ff       	jmp    80105969 <alltraps>

801063a7 <vector148>:
.globl vector148
vector148:
  pushl $0
801063a7:	6a 00                	push   $0x0
  pushl $148
801063a9:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801063ae:	e9 b6 f5 ff ff       	jmp    80105969 <alltraps>

801063b3 <vector149>:
.globl vector149
vector149:
  pushl $0
801063b3:	6a 00                	push   $0x0
  pushl $149
801063b5:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801063ba:	e9 aa f5 ff ff       	jmp    80105969 <alltraps>

801063bf <vector150>:
.globl vector150
vector150:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $150
801063c1:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801063c6:	e9 9e f5 ff ff       	jmp    80105969 <alltraps>

801063cb <vector151>:
.globl vector151
vector151:
  pushl $0
801063cb:	6a 00                	push   $0x0
  pushl $151
801063cd:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801063d2:	e9 92 f5 ff ff       	jmp    80105969 <alltraps>

801063d7 <vector152>:
.globl vector152
vector152:
  pushl $0
801063d7:	6a 00                	push   $0x0
  pushl $152
801063d9:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801063de:	e9 86 f5 ff ff       	jmp    80105969 <alltraps>

801063e3 <vector153>:
.globl vector153
vector153:
  pushl $0
801063e3:	6a 00                	push   $0x0
  pushl $153
801063e5:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801063ea:	e9 7a f5 ff ff       	jmp    80105969 <alltraps>

801063ef <vector154>:
.globl vector154
vector154:
  pushl $0
801063ef:	6a 00                	push   $0x0
  pushl $154
801063f1:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801063f6:	e9 6e f5 ff ff       	jmp    80105969 <alltraps>

801063fb <vector155>:
.globl vector155
vector155:
  pushl $0
801063fb:	6a 00                	push   $0x0
  pushl $155
801063fd:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106402:	e9 62 f5 ff ff       	jmp    80105969 <alltraps>

80106407 <vector156>:
.globl vector156
vector156:
  pushl $0
80106407:	6a 00                	push   $0x0
  pushl $156
80106409:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010640e:	e9 56 f5 ff ff       	jmp    80105969 <alltraps>

80106413 <vector157>:
.globl vector157
vector157:
  pushl $0
80106413:	6a 00                	push   $0x0
  pushl $157
80106415:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010641a:	e9 4a f5 ff ff       	jmp    80105969 <alltraps>

8010641f <vector158>:
.globl vector158
vector158:
  pushl $0
8010641f:	6a 00                	push   $0x0
  pushl $158
80106421:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106426:	e9 3e f5 ff ff       	jmp    80105969 <alltraps>

8010642b <vector159>:
.globl vector159
vector159:
  pushl $0
8010642b:	6a 00                	push   $0x0
  pushl $159
8010642d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106432:	e9 32 f5 ff ff       	jmp    80105969 <alltraps>

80106437 <vector160>:
.globl vector160
vector160:
  pushl $0
80106437:	6a 00                	push   $0x0
  pushl $160
80106439:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
8010643e:	e9 26 f5 ff ff       	jmp    80105969 <alltraps>

80106443 <vector161>:
.globl vector161
vector161:
  pushl $0
80106443:	6a 00                	push   $0x0
  pushl $161
80106445:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010644a:	e9 1a f5 ff ff       	jmp    80105969 <alltraps>

8010644f <vector162>:
.globl vector162
vector162:
  pushl $0
8010644f:	6a 00                	push   $0x0
  pushl $162
80106451:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106456:	e9 0e f5 ff ff       	jmp    80105969 <alltraps>

8010645b <vector163>:
.globl vector163
vector163:
  pushl $0
8010645b:	6a 00                	push   $0x0
  pushl $163
8010645d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106462:	e9 02 f5 ff ff       	jmp    80105969 <alltraps>

80106467 <vector164>:
.globl vector164
vector164:
  pushl $0
80106467:	6a 00                	push   $0x0
  pushl $164
80106469:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010646e:	e9 f6 f4 ff ff       	jmp    80105969 <alltraps>

80106473 <vector165>:
.globl vector165
vector165:
  pushl $0
80106473:	6a 00                	push   $0x0
  pushl $165
80106475:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010647a:	e9 ea f4 ff ff       	jmp    80105969 <alltraps>

8010647f <vector166>:
.globl vector166
vector166:
  pushl $0
8010647f:	6a 00                	push   $0x0
  pushl $166
80106481:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106486:	e9 de f4 ff ff       	jmp    80105969 <alltraps>

8010648b <vector167>:
.globl vector167
vector167:
  pushl $0
8010648b:	6a 00                	push   $0x0
  pushl $167
8010648d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106492:	e9 d2 f4 ff ff       	jmp    80105969 <alltraps>

80106497 <vector168>:
.globl vector168
vector168:
  pushl $0
80106497:	6a 00                	push   $0x0
  pushl $168
80106499:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010649e:	e9 c6 f4 ff ff       	jmp    80105969 <alltraps>

801064a3 <vector169>:
.globl vector169
vector169:
  pushl $0
801064a3:	6a 00                	push   $0x0
  pushl $169
801064a5:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801064aa:	e9 ba f4 ff ff       	jmp    80105969 <alltraps>

801064af <vector170>:
.globl vector170
vector170:
  pushl $0
801064af:	6a 00                	push   $0x0
  pushl $170
801064b1:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801064b6:	e9 ae f4 ff ff       	jmp    80105969 <alltraps>

801064bb <vector171>:
.globl vector171
vector171:
  pushl $0
801064bb:	6a 00                	push   $0x0
  pushl $171
801064bd:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801064c2:	e9 a2 f4 ff ff       	jmp    80105969 <alltraps>

801064c7 <vector172>:
.globl vector172
vector172:
  pushl $0
801064c7:	6a 00                	push   $0x0
  pushl $172
801064c9:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801064ce:	e9 96 f4 ff ff       	jmp    80105969 <alltraps>

801064d3 <vector173>:
.globl vector173
vector173:
  pushl $0
801064d3:	6a 00                	push   $0x0
  pushl $173
801064d5:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801064da:	e9 8a f4 ff ff       	jmp    80105969 <alltraps>

801064df <vector174>:
.globl vector174
vector174:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $174
801064e1:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801064e6:	e9 7e f4 ff ff       	jmp    80105969 <alltraps>

801064eb <vector175>:
.globl vector175
vector175:
  pushl $0
801064eb:	6a 00                	push   $0x0
  pushl $175
801064ed:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801064f2:	e9 72 f4 ff ff       	jmp    80105969 <alltraps>

801064f7 <vector176>:
.globl vector176
vector176:
  pushl $0
801064f7:	6a 00                	push   $0x0
  pushl $176
801064f9:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801064fe:	e9 66 f4 ff ff       	jmp    80105969 <alltraps>

80106503 <vector177>:
.globl vector177
vector177:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $177
80106505:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010650a:	e9 5a f4 ff ff       	jmp    80105969 <alltraps>

8010650f <vector178>:
.globl vector178
vector178:
  pushl $0
8010650f:	6a 00                	push   $0x0
  pushl $178
80106511:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106516:	e9 4e f4 ff ff       	jmp    80105969 <alltraps>

8010651b <vector179>:
.globl vector179
vector179:
  pushl $0
8010651b:	6a 00                	push   $0x0
  pushl $179
8010651d:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106522:	e9 42 f4 ff ff       	jmp    80105969 <alltraps>

80106527 <vector180>:
.globl vector180
vector180:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $180
80106529:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010652e:	e9 36 f4 ff ff       	jmp    80105969 <alltraps>

80106533 <vector181>:
.globl vector181
vector181:
  pushl $0
80106533:	6a 00                	push   $0x0
  pushl $181
80106535:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010653a:	e9 2a f4 ff ff       	jmp    80105969 <alltraps>

8010653f <vector182>:
.globl vector182
vector182:
  pushl $0
8010653f:	6a 00                	push   $0x0
  pushl $182
80106541:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106546:	e9 1e f4 ff ff       	jmp    80105969 <alltraps>

8010654b <vector183>:
.globl vector183
vector183:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $183
8010654d:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106552:	e9 12 f4 ff ff       	jmp    80105969 <alltraps>

80106557 <vector184>:
.globl vector184
vector184:
  pushl $0
80106557:	6a 00                	push   $0x0
  pushl $184
80106559:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010655e:	e9 06 f4 ff ff       	jmp    80105969 <alltraps>

80106563 <vector185>:
.globl vector185
vector185:
  pushl $0
80106563:	6a 00                	push   $0x0
  pushl $185
80106565:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010656a:	e9 fa f3 ff ff       	jmp    80105969 <alltraps>

8010656f <vector186>:
.globl vector186
vector186:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $186
80106571:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106576:	e9 ee f3 ff ff       	jmp    80105969 <alltraps>

8010657b <vector187>:
.globl vector187
vector187:
  pushl $0
8010657b:	6a 00                	push   $0x0
  pushl $187
8010657d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106582:	e9 e2 f3 ff ff       	jmp    80105969 <alltraps>

80106587 <vector188>:
.globl vector188
vector188:
  pushl $0
80106587:	6a 00                	push   $0x0
  pushl $188
80106589:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010658e:	e9 d6 f3 ff ff       	jmp    80105969 <alltraps>

80106593 <vector189>:
.globl vector189
vector189:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $189
80106595:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010659a:	e9 ca f3 ff ff       	jmp    80105969 <alltraps>

8010659f <vector190>:
.globl vector190
vector190:
  pushl $0
8010659f:	6a 00                	push   $0x0
  pushl $190
801065a1:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801065a6:	e9 be f3 ff ff       	jmp    80105969 <alltraps>

801065ab <vector191>:
.globl vector191
vector191:
  pushl $0
801065ab:	6a 00                	push   $0x0
  pushl $191
801065ad:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801065b2:	e9 b2 f3 ff ff       	jmp    80105969 <alltraps>

801065b7 <vector192>:
.globl vector192
vector192:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $192
801065b9:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
801065be:	e9 a6 f3 ff ff       	jmp    80105969 <alltraps>

801065c3 <vector193>:
.globl vector193
vector193:
  pushl $0
801065c3:	6a 00                	push   $0x0
  pushl $193
801065c5:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801065ca:	e9 9a f3 ff ff       	jmp    80105969 <alltraps>

801065cf <vector194>:
.globl vector194
vector194:
  pushl $0
801065cf:	6a 00                	push   $0x0
  pushl $194
801065d1:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801065d6:	e9 8e f3 ff ff       	jmp    80105969 <alltraps>

801065db <vector195>:
.globl vector195
vector195:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $195
801065dd:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801065e2:	e9 82 f3 ff ff       	jmp    80105969 <alltraps>

801065e7 <vector196>:
.globl vector196
vector196:
  pushl $0
801065e7:	6a 00                	push   $0x0
  pushl $196
801065e9:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801065ee:	e9 76 f3 ff ff       	jmp    80105969 <alltraps>

801065f3 <vector197>:
.globl vector197
vector197:
  pushl $0
801065f3:	6a 00                	push   $0x0
  pushl $197
801065f5:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
801065fa:	e9 6a f3 ff ff       	jmp    80105969 <alltraps>

801065ff <vector198>:
.globl vector198
vector198:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $198
80106601:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106606:	e9 5e f3 ff ff       	jmp    80105969 <alltraps>

8010660b <vector199>:
.globl vector199
vector199:
  pushl $0
8010660b:	6a 00                	push   $0x0
  pushl $199
8010660d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106612:	e9 52 f3 ff ff       	jmp    80105969 <alltraps>

80106617 <vector200>:
.globl vector200
vector200:
  pushl $0
80106617:	6a 00                	push   $0x0
  pushl $200
80106619:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010661e:	e9 46 f3 ff ff       	jmp    80105969 <alltraps>

80106623 <vector201>:
.globl vector201
vector201:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $201
80106625:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010662a:	e9 3a f3 ff ff       	jmp    80105969 <alltraps>

8010662f <vector202>:
.globl vector202
vector202:
  pushl $0
8010662f:	6a 00                	push   $0x0
  pushl $202
80106631:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106636:	e9 2e f3 ff ff       	jmp    80105969 <alltraps>

8010663b <vector203>:
.globl vector203
vector203:
  pushl $0
8010663b:	6a 00                	push   $0x0
  pushl $203
8010663d:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106642:	e9 22 f3 ff ff       	jmp    80105969 <alltraps>

80106647 <vector204>:
.globl vector204
vector204:
  pushl $0
80106647:	6a 00                	push   $0x0
  pushl $204
80106649:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010664e:	e9 16 f3 ff ff       	jmp    80105969 <alltraps>

80106653 <vector205>:
.globl vector205
vector205:
  pushl $0
80106653:	6a 00                	push   $0x0
  pushl $205
80106655:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010665a:	e9 0a f3 ff ff       	jmp    80105969 <alltraps>

8010665f <vector206>:
.globl vector206
vector206:
  pushl $0
8010665f:	6a 00                	push   $0x0
  pushl $206
80106661:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106666:	e9 fe f2 ff ff       	jmp    80105969 <alltraps>

8010666b <vector207>:
.globl vector207
vector207:
  pushl $0
8010666b:	6a 00                	push   $0x0
  pushl $207
8010666d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106672:	e9 f2 f2 ff ff       	jmp    80105969 <alltraps>

80106677 <vector208>:
.globl vector208
vector208:
  pushl $0
80106677:	6a 00                	push   $0x0
  pushl $208
80106679:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010667e:	e9 e6 f2 ff ff       	jmp    80105969 <alltraps>

80106683 <vector209>:
.globl vector209
vector209:
  pushl $0
80106683:	6a 00                	push   $0x0
  pushl $209
80106685:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010668a:	e9 da f2 ff ff       	jmp    80105969 <alltraps>

8010668f <vector210>:
.globl vector210
vector210:
  pushl $0
8010668f:	6a 00                	push   $0x0
  pushl $210
80106691:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106696:	e9 ce f2 ff ff       	jmp    80105969 <alltraps>

8010669b <vector211>:
.globl vector211
vector211:
  pushl $0
8010669b:	6a 00                	push   $0x0
  pushl $211
8010669d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801066a2:	e9 c2 f2 ff ff       	jmp    80105969 <alltraps>

801066a7 <vector212>:
.globl vector212
vector212:
  pushl $0
801066a7:	6a 00                	push   $0x0
  pushl $212
801066a9:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801066ae:	e9 b6 f2 ff ff       	jmp    80105969 <alltraps>

801066b3 <vector213>:
.globl vector213
vector213:
  pushl $0
801066b3:	6a 00                	push   $0x0
  pushl $213
801066b5:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
801066ba:	e9 aa f2 ff ff       	jmp    80105969 <alltraps>

801066bf <vector214>:
.globl vector214
vector214:
  pushl $0
801066bf:	6a 00                	push   $0x0
  pushl $214
801066c1:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
801066c6:	e9 9e f2 ff ff       	jmp    80105969 <alltraps>

801066cb <vector215>:
.globl vector215
vector215:
  pushl $0
801066cb:	6a 00                	push   $0x0
  pushl $215
801066cd:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
801066d2:	e9 92 f2 ff ff       	jmp    80105969 <alltraps>

801066d7 <vector216>:
.globl vector216
vector216:
  pushl $0
801066d7:	6a 00                	push   $0x0
  pushl $216
801066d9:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
801066de:	e9 86 f2 ff ff       	jmp    80105969 <alltraps>

801066e3 <vector217>:
.globl vector217
vector217:
  pushl $0
801066e3:	6a 00                	push   $0x0
  pushl $217
801066e5:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801066ea:	e9 7a f2 ff ff       	jmp    80105969 <alltraps>

801066ef <vector218>:
.globl vector218
vector218:
  pushl $0
801066ef:	6a 00                	push   $0x0
  pushl $218
801066f1:	68 da 00 00 00       	push   $0xda
  jmp alltraps
801066f6:	e9 6e f2 ff ff       	jmp    80105969 <alltraps>

801066fb <vector219>:
.globl vector219
vector219:
  pushl $0
801066fb:	6a 00                	push   $0x0
  pushl $219
801066fd:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106702:	e9 62 f2 ff ff       	jmp    80105969 <alltraps>

80106707 <vector220>:
.globl vector220
vector220:
  pushl $0
80106707:	6a 00                	push   $0x0
  pushl $220
80106709:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010670e:	e9 56 f2 ff ff       	jmp    80105969 <alltraps>

80106713 <vector221>:
.globl vector221
vector221:
  pushl $0
80106713:	6a 00                	push   $0x0
  pushl $221
80106715:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
8010671a:	e9 4a f2 ff ff       	jmp    80105969 <alltraps>

8010671f <vector222>:
.globl vector222
vector222:
  pushl $0
8010671f:	6a 00                	push   $0x0
  pushl $222
80106721:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106726:	e9 3e f2 ff ff       	jmp    80105969 <alltraps>

8010672b <vector223>:
.globl vector223
vector223:
  pushl $0
8010672b:	6a 00                	push   $0x0
  pushl $223
8010672d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106732:	e9 32 f2 ff ff       	jmp    80105969 <alltraps>

80106737 <vector224>:
.globl vector224
vector224:
  pushl $0
80106737:	6a 00                	push   $0x0
  pushl $224
80106739:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
8010673e:	e9 26 f2 ff ff       	jmp    80105969 <alltraps>

80106743 <vector225>:
.globl vector225
vector225:
  pushl $0
80106743:	6a 00                	push   $0x0
  pushl $225
80106745:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
8010674a:	e9 1a f2 ff ff       	jmp    80105969 <alltraps>

8010674f <vector226>:
.globl vector226
vector226:
  pushl $0
8010674f:	6a 00                	push   $0x0
  pushl $226
80106751:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106756:	e9 0e f2 ff ff       	jmp    80105969 <alltraps>

8010675b <vector227>:
.globl vector227
vector227:
  pushl $0
8010675b:	6a 00                	push   $0x0
  pushl $227
8010675d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106762:	e9 02 f2 ff ff       	jmp    80105969 <alltraps>

80106767 <vector228>:
.globl vector228
vector228:
  pushl $0
80106767:	6a 00                	push   $0x0
  pushl $228
80106769:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010676e:	e9 f6 f1 ff ff       	jmp    80105969 <alltraps>

80106773 <vector229>:
.globl vector229
vector229:
  pushl $0
80106773:	6a 00                	push   $0x0
  pushl $229
80106775:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010677a:	e9 ea f1 ff ff       	jmp    80105969 <alltraps>

8010677f <vector230>:
.globl vector230
vector230:
  pushl $0
8010677f:	6a 00                	push   $0x0
  pushl $230
80106781:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106786:	e9 de f1 ff ff       	jmp    80105969 <alltraps>

8010678b <vector231>:
.globl vector231
vector231:
  pushl $0
8010678b:	6a 00                	push   $0x0
  pushl $231
8010678d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106792:	e9 d2 f1 ff ff       	jmp    80105969 <alltraps>

80106797 <vector232>:
.globl vector232
vector232:
  pushl $0
80106797:	6a 00                	push   $0x0
  pushl $232
80106799:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010679e:	e9 c6 f1 ff ff       	jmp    80105969 <alltraps>

801067a3 <vector233>:
.globl vector233
vector233:
  pushl $0
801067a3:	6a 00                	push   $0x0
  pushl $233
801067a5:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
801067aa:	e9 ba f1 ff ff       	jmp    80105969 <alltraps>

801067af <vector234>:
.globl vector234
vector234:
  pushl $0
801067af:	6a 00                	push   $0x0
  pushl $234
801067b1:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
801067b6:	e9 ae f1 ff ff       	jmp    80105969 <alltraps>

801067bb <vector235>:
.globl vector235
vector235:
  pushl $0
801067bb:	6a 00                	push   $0x0
  pushl $235
801067bd:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
801067c2:	e9 a2 f1 ff ff       	jmp    80105969 <alltraps>

801067c7 <vector236>:
.globl vector236
vector236:
  pushl $0
801067c7:	6a 00                	push   $0x0
  pushl $236
801067c9:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
801067ce:	e9 96 f1 ff ff       	jmp    80105969 <alltraps>

801067d3 <vector237>:
.globl vector237
vector237:
  pushl $0
801067d3:	6a 00                	push   $0x0
  pushl $237
801067d5:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
801067da:	e9 8a f1 ff ff       	jmp    80105969 <alltraps>

801067df <vector238>:
.globl vector238
vector238:
  pushl $0
801067df:	6a 00                	push   $0x0
  pushl $238
801067e1:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801067e6:	e9 7e f1 ff ff       	jmp    80105969 <alltraps>

801067eb <vector239>:
.globl vector239
vector239:
  pushl $0
801067eb:	6a 00                	push   $0x0
  pushl $239
801067ed:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
801067f2:	e9 72 f1 ff ff       	jmp    80105969 <alltraps>

801067f7 <vector240>:
.globl vector240
vector240:
  pushl $0
801067f7:	6a 00                	push   $0x0
  pushl $240
801067f9:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
801067fe:	e9 66 f1 ff ff       	jmp    80105969 <alltraps>

80106803 <vector241>:
.globl vector241
vector241:
  pushl $0
80106803:	6a 00                	push   $0x0
  pushl $241
80106805:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
8010680a:	e9 5a f1 ff ff       	jmp    80105969 <alltraps>

8010680f <vector242>:
.globl vector242
vector242:
  pushl $0
8010680f:	6a 00                	push   $0x0
  pushl $242
80106811:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106816:	e9 4e f1 ff ff       	jmp    80105969 <alltraps>

8010681b <vector243>:
.globl vector243
vector243:
  pushl $0
8010681b:	6a 00                	push   $0x0
  pushl $243
8010681d:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106822:	e9 42 f1 ff ff       	jmp    80105969 <alltraps>

80106827 <vector244>:
.globl vector244
vector244:
  pushl $0
80106827:	6a 00                	push   $0x0
  pushl $244
80106829:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
8010682e:	e9 36 f1 ff ff       	jmp    80105969 <alltraps>

80106833 <vector245>:
.globl vector245
vector245:
  pushl $0
80106833:	6a 00                	push   $0x0
  pushl $245
80106835:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
8010683a:	e9 2a f1 ff ff       	jmp    80105969 <alltraps>

8010683f <vector246>:
.globl vector246
vector246:
  pushl $0
8010683f:	6a 00                	push   $0x0
  pushl $246
80106841:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106846:	e9 1e f1 ff ff       	jmp    80105969 <alltraps>

8010684b <vector247>:
.globl vector247
vector247:
  pushl $0
8010684b:	6a 00                	push   $0x0
  pushl $247
8010684d:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106852:	e9 12 f1 ff ff       	jmp    80105969 <alltraps>

80106857 <vector248>:
.globl vector248
vector248:
  pushl $0
80106857:	6a 00                	push   $0x0
  pushl $248
80106859:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
8010685e:	e9 06 f1 ff ff       	jmp    80105969 <alltraps>

80106863 <vector249>:
.globl vector249
vector249:
  pushl $0
80106863:	6a 00                	push   $0x0
  pushl $249
80106865:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
8010686a:	e9 fa f0 ff ff       	jmp    80105969 <alltraps>

8010686f <vector250>:
.globl vector250
vector250:
  pushl $0
8010686f:	6a 00                	push   $0x0
  pushl $250
80106871:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106876:	e9 ee f0 ff ff       	jmp    80105969 <alltraps>

8010687b <vector251>:
.globl vector251
vector251:
  pushl $0
8010687b:	6a 00                	push   $0x0
  pushl $251
8010687d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106882:	e9 e2 f0 ff ff       	jmp    80105969 <alltraps>

80106887 <vector252>:
.globl vector252
vector252:
  pushl $0
80106887:	6a 00                	push   $0x0
  pushl $252
80106889:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010688e:	e9 d6 f0 ff ff       	jmp    80105969 <alltraps>

80106893 <vector253>:
.globl vector253
vector253:
  pushl $0
80106893:	6a 00                	push   $0x0
  pushl $253
80106895:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
8010689a:	e9 ca f0 ff ff       	jmp    80105969 <alltraps>

8010689f <vector254>:
.globl vector254
vector254:
  pushl $0
8010689f:	6a 00                	push   $0x0
  pushl $254
801068a1:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
801068a6:	e9 be f0 ff ff       	jmp    80105969 <alltraps>

801068ab <vector255>:
.globl vector255
vector255:
  pushl $0
801068ab:	6a 00                	push   $0x0
  pushl $255
801068ad:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
801068b2:	e9 b2 f0 ff ff       	jmp    80105969 <alltraps>
801068b7:	66 90                	xchg   %ax,%ax
801068b9:	66 90                	xchg   %ax,%ax
801068bb:	66 90                	xchg   %ax,%ax
801068bd:	66 90                	xchg   %ax,%ax
801068bf:	90                   	nop

801068c0 <walkpgdir>:
801068c0:	55                   	push   %ebp
801068c1:	89 e5                	mov    %esp,%ebp
801068c3:	57                   	push   %edi
801068c4:	56                   	push   %esi
801068c5:	53                   	push   %ebx
801068c6:	89 d3                	mov    %edx,%ebx
801068c8:	89 d7                	mov    %edx,%edi
801068ca:	c1 eb 16             	shr    $0x16,%ebx
801068cd:	8d 34 98             	lea    (%eax,%ebx,4),%esi
801068d0:	83 ec 0c             	sub    $0xc,%esp
801068d3:	8b 06                	mov    (%esi),%eax
801068d5:	a8 01                	test   $0x1,%al
801068d7:	74 27                	je     80106900 <walkpgdir+0x40>
801068d9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801068de:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801068e4:	c1 ef 0a             	shr    $0xa,%edi
801068e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068ea:	89 fa                	mov    %edi,%edx
801068ec:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801068f2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
801068f5:	5b                   	pop    %ebx
801068f6:	5e                   	pop    %esi
801068f7:	5f                   	pop    %edi
801068f8:	5d                   	pop    %ebp
801068f9:	c3                   	ret    
801068fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106900:	85 c9                	test   %ecx,%ecx
80106902:	74 2c                	je     80106930 <walkpgdir+0x70>
80106904:	e8 27 bc ff ff       	call   80102530 <kalloc>
80106909:	85 c0                	test   %eax,%eax
8010690b:	89 c3                	mov    %eax,%ebx
8010690d:	74 21                	je     80106930 <walkpgdir+0x70>
8010690f:	83 ec 04             	sub    $0x4,%esp
80106912:	68 00 10 00 00       	push   $0x1000
80106917:	6a 00                	push   $0x0
80106919:	50                   	push   %eax
8010691a:	e8 81 dd ff ff       	call   801046a0 <memset>
8010691f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106925:	83 c4 10             	add    $0x10,%esp
80106928:	83 c8 07             	or     $0x7,%eax
8010692b:	89 06                	mov    %eax,(%esi)
8010692d:	eb b5                	jmp    801068e4 <walkpgdir+0x24>
8010692f:	90                   	nop
80106930:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106933:	31 c0                	xor    %eax,%eax
80106935:	5b                   	pop    %ebx
80106936:	5e                   	pop    %esi
80106937:	5f                   	pop    %edi
80106938:	5d                   	pop    %ebp
80106939:	c3                   	ret    
8010693a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106940 <mappages>:
80106940:	55                   	push   %ebp
80106941:	89 e5                	mov    %esp,%ebp
80106943:	57                   	push   %edi
80106944:	56                   	push   %esi
80106945:	53                   	push   %ebx
80106946:	89 d3                	mov    %edx,%ebx
80106948:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010694e:	83 ec 1c             	sub    $0x1c,%esp
80106951:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106954:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106958:	8b 7d 08             	mov    0x8(%ebp),%edi
8010695b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106960:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106963:	8b 45 0c             	mov    0xc(%ebp),%eax
80106966:	29 df                	sub    %ebx,%edi
80106968:	83 c8 01             	or     $0x1,%eax
8010696b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010696e:	eb 15                	jmp    80106985 <mappages+0x45>
80106970:	f6 00 01             	testb  $0x1,(%eax)
80106973:	75 45                	jne    801069ba <mappages+0x7a>
80106975:	0b 75 dc             	or     -0x24(%ebp),%esi
80106978:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
8010697b:	89 30                	mov    %esi,(%eax)
8010697d:	74 31                	je     801069b0 <mappages+0x70>
8010697f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106985:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106988:	b9 01 00 00 00       	mov    $0x1,%ecx
8010698d:	89 da                	mov    %ebx,%edx
8010698f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106992:	e8 29 ff ff ff       	call   801068c0 <walkpgdir>
80106997:	85 c0                	test   %eax,%eax
80106999:	75 d5                	jne    80106970 <mappages+0x30>
8010699b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010699e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801069a3:	5b                   	pop    %ebx
801069a4:	5e                   	pop    %esi
801069a5:	5f                   	pop    %edi
801069a6:	5d                   	pop    %ebp
801069a7:	c3                   	ret    
801069a8:	90                   	nop
801069a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069b3:	31 c0                	xor    %eax,%eax
801069b5:	5b                   	pop    %ebx
801069b6:	5e                   	pop    %esi
801069b7:	5f                   	pop    %edi
801069b8:	5d                   	pop    %ebp
801069b9:	c3                   	ret    
801069ba:	83 ec 0c             	sub    $0xc,%esp
801069bd:	68 98 7c 10 80       	push   $0x80107c98
801069c2:	e8 c9 99 ff ff       	call   80100390 <panic>
801069c7:	89 f6                	mov    %esi,%esi
801069c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069d0 <deallocuvm.part.0>:
801069d0:	55                   	push   %ebp
801069d1:	89 e5                	mov    %esp,%ebp
801069d3:	57                   	push   %edi
801069d4:	56                   	push   %esi
801069d5:	53                   	push   %ebx
801069d6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
801069dc:	89 c7                	mov    %eax,%edi
801069de:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801069e4:	83 ec 1c             	sub    $0x1c,%esp
801069e7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801069ea:	39 d3                	cmp    %edx,%ebx
801069ec:	73 66                	jae    80106a54 <deallocuvm.part.0+0x84>
801069ee:	89 d6                	mov    %edx,%esi
801069f0:	eb 3d                	jmp    80106a2f <deallocuvm.part.0+0x5f>
801069f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801069f8:	8b 10                	mov    (%eax),%edx
801069fa:	f6 c2 01             	test   $0x1,%dl
801069fd:	74 26                	je     80106a25 <deallocuvm.part.0+0x55>
801069ff:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106a05:	74 58                	je     80106a5f <deallocuvm.part.0+0x8f>
80106a07:	83 ec 0c             	sub    $0xc,%esp
80106a0a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106a10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106a13:	52                   	push   %edx
80106a14:	e8 67 b9 ff ff       	call   80102380 <kfree>
80106a19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a1c:	83 c4 10             	add    $0x10,%esp
80106a1f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106a25:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a2b:	39 f3                	cmp    %esi,%ebx
80106a2d:	73 25                	jae    80106a54 <deallocuvm.part.0+0x84>
80106a2f:	31 c9                	xor    %ecx,%ecx
80106a31:	89 da                	mov    %ebx,%edx
80106a33:	89 f8                	mov    %edi,%eax
80106a35:	e8 86 fe ff ff       	call   801068c0 <walkpgdir>
80106a3a:	85 c0                	test   %eax,%eax
80106a3c:	75 ba                	jne    801069f8 <deallocuvm.part.0+0x28>
80106a3e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106a44:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
80106a4a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a50:	39 f3                	cmp    %esi,%ebx
80106a52:	72 db                	jb     80106a2f <deallocuvm.part.0+0x5f>
80106a54:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106a57:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a5a:	5b                   	pop    %ebx
80106a5b:	5e                   	pop    %esi
80106a5c:	5f                   	pop    %edi
80106a5d:	5d                   	pop    %ebp
80106a5e:	c3                   	ret    
80106a5f:	83 ec 0c             	sub    $0xc,%esp
80106a62:	68 32 76 10 80       	push   $0x80107632
80106a67:	e8 24 99 ff ff       	call   80100390 <panic>
80106a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106a70 <seginit>:
80106a70:	55                   	push   %ebp
80106a71:	89 e5                	mov    %esp,%ebp
80106a73:	83 ec 18             	sub    $0x18,%esp
80106a76:	e8 35 ce ff ff       	call   801038b0 <cpuid>
80106a7b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106a81:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106a86:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106a8a:	c7 80 d8 31 11 80 ff 	movl   $0xffff,-0x7feece28(%eax)
80106a91:	ff 00 00 
80106a94:	c7 80 dc 31 11 80 00 	movl   $0xcf9a00,-0x7feece24(%eax)
80106a9b:	9a cf 00 
80106a9e:	c7 80 e0 31 11 80 ff 	movl   $0xffff,-0x7feece20(%eax)
80106aa5:	ff 00 00 
80106aa8:	c7 80 e4 31 11 80 00 	movl   $0xcf9200,-0x7feece1c(%eax)
80106aaf:	92 cf 00 
80106ab2:	c7 80 e8 31 11 80 ff 	movl   $0xffff,-0x7feece18(%eax)
80106ab9:	ff 00 00 
80106abc:	c7 80 ec 31 11 80 00 	movl   $0xcffa00,-0x7feece14(%eax)
80106ac3:	fa cf 00 
80106ac6:	c7 80 f0 31 11 80 ff 	movl   $0xffff,-0x7feece10(%eax)
80106acd:	ff 00 00 
80106ad0:	c7 80 f4 31 11 80 00 	movl   $0xcff200,-0x7feece0c(%eax)
80106ad7:	f2 cf 00 
80106ada:	05 d0 31 11 80       	add    $0x801131d0,%eax
80106adf:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106ae3:	c1 e8 10             	shr    $0x10,%eax
80106ae6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106aea:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106aed:	0f 01 10             	lgdtl  (%eax)
80106af0:	c9                   	leave  
80106af1:	c3                   	ret    
80106af2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b00 <switchkvm>:
80106b00:	a1 84 60 11 80       	mov    0x80116084,%eax
80106b05:	55                   	push   %ebp
80106b06:	89 e5                	mov    %esp,%ebp
80106b08:	05 00 00 00 80       	add    $0x80000000,%eax
80106b0d:	0f 22 d8             	mov    %eax,%cr3
80106b10:	5d                   	pop    %ebp
80106b11:	c3                   	ret    
80106b12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b20 <switchuvm>:
80106b20:	55                   	push   %ebp
80106b21:	89 e5                	mov    %esp,%ebp
80106b23:	57                   	push   %edi
80106b24:	56                   	push   %esi
80106b25:	53                   	push   %ebx
80106b26:	83 ec 1c             	sub    $0x1c,%esp
80106b29:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106b2c:	85 db                	test   %ebx,%ebx
80106b2e:	0f 84 cb 00 00 00    	je     80106bff <switchuvm+0xdf>
80106b34:	8b 43 08             	mov    0x8(%ebx),%eax
80106b37:	85 c0                	test   %eax,%eax
80106b39:	0f 84 da 00 00 00    	je     80106c19 <switchuvm+0xf9>
80106b3f:	8b 43 04             	mov    0x4(%ebx),%eax
80106b42:	85 c0                	test   %eax,%eax
80106b44:	0f 84 c2 00 00 00    	je     80106c0c <switchuvm+0xec>
80106b4a:	e8 71 d9 ff ff       	call   801044c0 <pushcli>
80106b4f:	e8 dc cc ff ff       	call   80103830 <mycpu>
80106b54:	89 c6                	mov    %eax,%esi
80106b56:	e8 d5 cc ff ff       	call   80103830 <mycpu>
80106b5b:	89 c7                	mov    %eax,%edi
80106b5d:	e8 ce cc ff ff       	call   80103830 <mycpu>
80106b62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106b65:	83 c7 08             	add    $0x8,%edi
80106b68:	e8 c3 cc ff ff       	call   80103830 <mycpu>
80106b6d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106b70:	83 c0 08             	add    $0x8,%eax
80106b73:	ba 67 00 00 00       	mov    $0x67,%edx
80106b78:	c1 e8 18             	shr    $0x18,%eax
80106b7b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106b82:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106b89:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
80106b8f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80106b94:	83 c1 08             	add    $0x8,%ecx
80106b97:	c1 e9 10             	shr    $0x10,%ecx
80106b9a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106ba0:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106ba5:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
80106bac:	be 10 00 00 00       	mov    $0x10,%esi
80106bb1:	e8 7a cc ff ff       	call   80103830 <mycpu>
80106bb6:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106bbd:	e8 6e cc ff ff       	call   80103830 <mycpu>
80106bc2:	66 89 70 10          	mov    %si,0x10(%eax)
80106bc6:	8b 73 08             	mov    0x8(%ebx),%esi
80106bc9:	e8 62 cc ff ff       	call   80103830 <mycpu>
80106bce:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106bd4:	89 70 0c             	mov    %esi,0xc(%eax)
80106bd7:	e8 54 cc ff ff       	call   80103830 <mycpu>
80106bdc:	66 89 78 6e          	mov    %di,0x6e(%eax)
80106be0:	b8 28 00 00 00       	mov    $0x28,%eax
80106be5:	0f 00 d8             	ltr    %ax
80106be8:	8b 43 04             	mov    0x4(%ebx),%eax
80106beb:	05 00 00 00 80       	add    $0x80000000,%eax
80106bf0:	0f 22 d8             	mov    %eax,%cr3
80106bf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bf6:	5b                   	pop    %ebx
80106bf7:	5e                   	pop    %esi
80106bf8:	5f                   	pop    %edi
80106bf9:	5d                   	pop    %ebp
80106bfa:	e9 01 d9 ff ff       	jmp    80104500 <popcli>
80106bff:	83 ec 0c             	sub    $0xc,%esp
80106c02:	68 9e 7c 10 80       	push   $0x80107c9e
80106c07:	e8 84 97 ff ff       	call   80100390 <panic>
80106c0c:	83 ec 0c             	sub    $0xc,%esp
80106c0f:	68 c9 7c 10 80       	push   $0x80107cc9
80106c14:	e8 77 97 ff ff       	call   80100390 <panic>
80106c19:	83 ec 0c             	sub    $0xc,%esp
80106c1c:	68 b4 7c 10 80       	push   $0x80107cb4
80106c21:	e8 6a 97 ff ff       	call   80100390 <panic>
80106c26:	8d 76 00             	lea    0x0(%esi),%esi
80106c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c30 <inituvm>:
80106c30:	55                   	push   %ebp
80106c31:	89 e5                	mov    %esp,%ebp
80106c33:	57                   	push   %edi
80106c34:	56                   	push   %esi
80106c35:	53                   	push   %ebx
80106c36:	83 ec 1c             	sub    $0x1c,%esp
80106c39:	8b 75 10             	mov    0x10(%ebp),%esi
80106c3c:	8b 45 08             	mov    0x8(%ebp),%eax
80106c3f:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106c42:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106c48:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c4b:	77 49                	ja     80106c96 <inituvm+0x66>
80106c4d:	e8 de b8 ff ff       	call   80102530 <kalloc>
80106c52:	83 ec 04             	sub    $0x4,%esp
80106c55:	89 c3                	mov    %eax,%ebx
80106c57:	68 00 10 00 00       	push   $0x1000
80106c5c:	6a 00                	push   $0x0
80106c5e:	50                   	push   %eax
80106c5f:	e8 3c da ff ff       	call   801046a0 <memset>
80106c64:	58                   	pop    %eax
80106c65:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106c6b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c70:	5a                   	pop    %edx
80106c71:	6a 06                	push   $0x6
80106c73:	50                   	push   %eax
80106c74:	31 d2                	xor    %edx,%edx
80106c76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106c79:	e8 c2 fc ff ff       	call   80106940 <mappages>
80106c7e:	89 75 10             	mov    %esi,0x10(%ebp)
80106c81:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106c84:	83 c4 10             	add    $0x10,%esp
80106c87:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106c8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c8d:	5b                   	pop    %ebx
80106c8e:	5e                   	pop    %esi
80106c8f:	5f                   	pop    %edi
80106c90:	5d                   	pop    %ebp
80106c91:	e9 ba da ff ff       	jmp    80104750 <memmove>
80106c96:	83 ec 0c             	sub    $0xc,%esp
80106c99:	68 dd 7c 10 80       	push   $0x80107cdd
80106c9e:	e8 ed 96 ff ff       	call   80100390 <panic>
80106ca3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cb0 <loaduvm>:
80106cb0:	55                   	push   %ebp
80106cb1:	89 e5                	mov    %esp,%ebp
80106cb3:	57                   	push   %edi
80106cb4:	56                   	push   %esi
80106cb5:	53                   	push   %ebx
80106cb6:	83 ec 0c             	sub    $0xc,%esp
80106cb9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106cc0:	0f 85 91 00 00 00    	jne    80106d57 <loaduvm+0xa7>
80106cc6:	8b 75 18             	mov    0x18(%ebp),%esi
80106cc9:	31 db                	xor    %ebx,%ebx
80106ccb:	85 f6                	test   %esi,%esi
80106ccd:	75 1a                	jne    80106ce9 <loaduvm+0x39>
80106ccf:	eb 6f                	jmp    80106d40 <loaduvm+0x90>
80106cd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cd8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106cde:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106ce4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106ce7:	76 57                	jbe    80106d40 <loaduvm+0x90>
80106ce9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106cec:	8b 45 08             	mov    0x8(%ebp),%eax
80106cef:	31 c9                	xor    %ecx,%ecx
80106cf1:	01 da                	add    %ebx,%edx
80106cf3:	e8 c8 fb ff ff       	call   801068c0 <walkpgdir>
80106cf8:	85 c0                	test   %eax,%eax
80106cfa:	74 4e                	je     80106d4a <loaduvm+0x9a>
80106cfc:	8b 00                	mov    (%eax),%eax
80106cfe:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106d01:	bf 00 10 00 00       	mov    $0x1000,%edi
80106d06:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d0b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106d11:	0f 46 fe             	cmovbe %esi,%edi
80106d14:	01 d9                	add    %ebx,%ecx
80106d16:	05 00 00 00 80       	add    $0x80000000,%eax
80106d1b:	57                   	push   %edi
80106d1c:	51                   	push   %ecx
80106d1d:	50                   	push   %eax
80106d1e:	ff 75 10             	pushl  0x10(%ebp)
80106d21:	e8 aa ac ff ff       	call   801019d0 <readi>
80106d26:	83 c4 10             	add    $0x10,%esp
80106d29:	39 f8                	cmp    %edi,%eax
80106d2b:	74 ab                	je     80106cd8 <loaduvm+0x28>
80106d2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106d35:	5b                   	pop    %ebx
80106d36:	5e                   	pop    %esi
80106d37:	5f                   	pop    %edi
80106d38:	5d                   	pop    %ebp
80106d39:	c3                   	ret    
80106d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d40:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d43:	31 c0                	xor    %eax,%eax
80106d45:	5b                   	pop    %ebx
80106d46:	5e                   	pop    %esi
80106d47:	5f                   	pop    %edi
80106d48:	5d                   	pop    %ebp
80106d49:	c3                   	ret    
80106d4a:	83 ec 0c             	sub    $0xc,%esp
80106d4d:	68 f7 7c 10 80       	push   $0x80107cf7
80106d52:	e8 39 96 ff ff       	call   80100390 <panic>
80106d57:	83 ec 0c             	sub    $0xc,%esp
80106d5a:	68 98 7d 10 80       	push   $0x80107d98
80106d5f:	e8 2c 96 ff ff       	call   80100390 <panic>
80106d64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106d70 <allocuvm>:
80106d70:	55                   	push   %ebp
80106d71:	89 e5                	mov    %esp,%ebp
80106d73:	57                   	push   %edi
80106d74:	56                   	push   %esi
80106d75:	53                   	push   %ebx
80106d76:	83 ec 1c             	sub    $0x1c,%esp
80106d79:	8b 7d 10             	mov    0x10(%ebp),%edi
80106d7c:	85 ff                	test   %edi,%edi
80106d7e:	0f 88 8e 00 00 00    	js     80106e12 <allocuvm+0xa2>
80106d84:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106d87:	0f 82 93 00 00 00    	jb     80106e20 <allocuvm+0xb0>
80106d8d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d90:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106d96:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106d9c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106d9f:	0f 86 7e 00 00 00    	jbe    80106e23 <allocuvm+0xb3>
80106da5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106da8:	8b 7d 08             	mov    0x8(%ebp),%edi
80106dab:	eb 42                	jmp    80106def <allocuvm+0x7f>
80106dad:	8d 76 00             	lea    0x0(%esi),%esi
80106db0:	83 ec 04             	sub    $0x4,%esp
80106db3:	68 00 10 00 00       	push   $0x1000
80106db8:	6a 00                	push   $0x0
80106dba:	50                   	push   %eax
80106dbb:	e8 e0 d8 ff ff       	call   801046a0 <memset>
80106dc0:	58                   	pop    %eax
80106dc1:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106dc7:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106dcc:	5a                   	pop    %edx
80106dcd:	6a 06                	push   $0x6
80106dcf:	50                   	push   %eax
80106dd0:	89 da                	mov    %ebx,%edx
80106dd2:	89 f8                	mov    %edi,%eax
80106dd4:	e8 67 fb ff ff       	call   80106940 <mappages>
80106dd9:	83 c4 10             	add    $0x10,%esp
80106ddc:	85 c0                	test   %eax,%eax
80106dde:	78 50                	js     80106e30 <allocuvm+0xc0>
80106de0:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106de6:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106de9:	0f 86 81 00 00 00    	jbe    80106e70 <allocuvm+0x100>
80106def:	e8 3c b7 ff ff       	call   80102530 <kalloc>
80106df4:	85 c0                	test   %eax,%eax
80106df6:	89 c6                	mov    %eax,%esi
80106df8:	75 b6                	jne    80106db0 <allocuvm+0x40>
80106dfa:	83 ec 0c             	sub    $0xc,%esp
80106dfd:	68 15 7d 10 80       	push   $0x80107d15
80106e02:	e8 59 98 ff ff       	call   80100660 <cprintf>
80106e07:	83 c4 10             	add    $0x10,%esp
80106e0a:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e0d:	39 45 10             	cmp    %eax,0x10(%ebp)
80106e10:	77 6e                	ja     80106e80 <allocuvm+0x110>
80106e12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e15:	31 ff                	xor    %edi,%edi
80106e17:	89 f8                	mov    %edi,%eax
80106e19:	5b                   	pop    %ebx
80106e1a:	5e                   	pop    %esi
80106e1b:	5f                   	pop    %edi
80106e1c:	5d                   	pop    %ebp
80106e1d:	c3                   	ret    
80106e1e:	66 90                	xchg   %ax,%ax
80106e20:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106e23:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e26:	89 f8                	mov    %edi,%eax
80106e28:	5b                   	pop    %ebx
80106e29:	5e                   	pop    %esi
80106e2a:	5f                   	pop    %edi
80106e2b:	5d                   	pop    %ebp
80106e2c:	c3                   	ret    
80106e2d:	8d 76 00             	lea    0x0(%esi),%esi
80106e30:	83 ec 0c             	sub    $0xc,%esp
80106e33:	68 2d 7d 10 80       	push   $0x80107d2d
80106e38:	e8 23 98 ff ff       	call   80100660 <cprintf>
80106e3d:	83 c4 10             	add    $0x10,%esp
80106e40:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e43:	39 45 10             	cmp    %eax,0x10(%ebp)
80106e46:	76 0d                	jbe    80106e55 <allocuvm+0xe5>
80106e48:	89 c1                	mov    %eax,%ecx
80106e4a:	8b 55 10             	mov    0x10(%ebp),%edx
80106e4d:	8b 45 08             	mov    0x8(%ebp),%eax
80106e50:	e8 7b fb ff ff       	call   801069d0 <deallocuvm.part.0>
80106e55:	83 ec 0c             	sub    $0xc,%esp
80106e58:	31 ff                	xor    %edi,%edi
80106e5a:	56                   	push   %esi
80106e5b:	e8 20 b5 ff ff       	call   80102380 <kfree>
80106e60:	83 c4 10             	add    $0x10,%esp
80106e63:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e66:	89 f8                	mov    %edi,%eax
80106e68:	5b                   	pop    %ebx
80106e69:	5e                   	pop    %esi
80106e6a:	5f                   	pop    %edi
80106e6b:	5d                   	pop    %ebp
80106e6c:	c3                   	ret    
80106e6d:	8d 76 00             	lea    0x0(%esi),%esi
80106e70:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106e73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e76:	5b                   	pop    %ebx
80106e77:	89 f8                	mov    %edi,%eax
80106e79:	5e                   	pop    %esi
80106e7a:	5f                   	pop    %edi
80106e7b:	5d                   	pop    %ebp
80106e7c:	c3                   	ret    
80106e7d:	8d 76 00             	lea    0x0(%esi),%esi
80106e80:	89 c1                	mov    %eax,%ecx
80106e82:	8b 55 10             	mov    0x10(%ebp),%edx
80106e85:	8b 45 08             	mov    0x8(%ebp),%eax
80106e88:	31 ff                	xor    %edi,%edi
80106e8a:	e8 41 fb ff ff       	call   801069d0 <deallocuvm.part.0>
80106e8f:	eb 92                	jmp    80106e23 <allocuvm+0xb3>
80106e91:	eb 0d                	jmp    80106ea0 <deallocuvm>
80106e93:	90                   	nop
80106e94:	90                   	nop
80106e95:	90                   	nop
80106e96:	90                   	nop
80106e97:	90                   	nop
80106e98:	90                   	nop
80106e99:	90                   	nop
80106e9a:	90                   	nop
80106e9b:	90                   	nop
80106e9c:	90                   	nop
80106e9d:	90                   	nop
80106e9e:	90                   	nop
80106e9f:	90                   	nop

80106ea0 <deallocuvm>:
80106ea0:	55                   	push   %ebp
80106ea1:	89 e5                	mov    %esp,%ebp
80106ea3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ea6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106ea9:	8b 45 08             	mov    0x8(%ebp),%eax
80106eac:	39 d1                	cmp    %edx,%ecx
80106eae:	73 10                	jae    80106ec0 <deallocuvm+0x20>
80106eb0:	5d                   	pop    %ebp
80106eb1:	e9 1a fb ff ff       	jmp    801069d0 <deallocuvm.part.0>
80106eb6:	8d 76 00             	lea    0x0(%esi),%esi
80106eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106ec0:	89 d0                	mov    %edx,%eax
80106ec2:	5d                   	pop    %ebp
80106ec3:	c3                   	ret    
80106ec4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106eca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ed0 <freevm>:
80106ed0:	55                   	push   %ebp
80106ed1:	89 e5                	mov    %esp,%ebp
80106ed3:	57                   	push   %edi
80106ed4:	56                   	push   %esi
80106ed5:	53                   	push   %ebx
80106ed6:	83 ec 0c             	sub    $0xc,%esp
80106ed9:	8b 75 08             	mov    0x8(%ebp),%esi
80106edc:	85 f6                	test   %esi,%esi
80106ede:	74 59                	je     80106f39 <freevm+0x69>
80106ee0:	31 c9                	xor    %ecx,%ecx
80106ee2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106ee7:	89 f0                	mov    %esi,%eax
80106ee9:	e8 e2 fa ff ff       	call   801069d0 <deallocuvm.part.0>
80106eee:	89 f3                	mov    %esi,%ebx
80106ef0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106ef6:	eb 0f                	jmp    80106f07 <freevm+0x37>
80106ef8:	90                   	nop
80106ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f00:	83 c3 04             	add    $0x4,%ebx
80106f03:	39 fb                	cmp    %edi,%ebx
80106f05:	74 23                	je     80106f2a <freevm+0x5a>
80106f07:	8b 03                	mov    (%ebx),%eax
80106f09:	a8 01                	test   $0x1,%al
80106f0b:	74 f3                	je     80106f00 <freevm+0x30>
80106f0d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106f12:	83 ec 0c             	sub    $0xc,%esp
80106f15:	83 c3 04             	add    $0x4,%ebx
80106f18:	05 00 00 00 80       	add    $0x80000000,%eax
80106f1d:	50                   	push   %eax
80106f1e:	e8 5d b4 ff ff       	call   80102380 <kfree>
80106f23:	83 c4 10             	add    $0x10,%esp
80106f26:	39 fb                	cmp    %edi,%ebx
80106f28:	75 dd                	jne    80106f07 <freevm+0x37>
80106f2a:	89 75 08             	mov    %esi,0x8(%ebp)
80106f2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f30:	5b                   	pop    %ebx
80106f31:	5e                   	pop    %esi
80106f32:	5f                   	pop    %edi
80106f33:	5d                   	pop    %ebp
80106f34:	e9 47 b4 ff ff       	jmp    80102380 <kfree>
80106f39:	83 ec 0c             	sub    $0xc,%esp
80106f3c:	68 49 7d 10 80       	push   $0x80107d49
80106f41:	e8 4a 94 ff ff       	call   80100390 <panic>
80106f46:	8d 76 00             	lea    0x0(%esi),%esi
80106f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f50 <setupkvm>:
80106f50:	55                   	push   %ebp
80106f51:	89 e5                	mov    %esp,%ebp
80106f53:	56                   	push   %esi
80106f54:	53                   	push   %ebx
80106f55:	e8 d6 b5 ff ff       	call   80102530 <kalloc>
80106f5a:	85 c0                	test   %eax,%eax
80106f5c:	89 c6                	mov    %eax,%esi
80106f5e:	74 42                	je     80106fa2 <setupkvm+0x52>
80106f60:	83 ec 04             	sub    $0x4,%esp
80106f63:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106f68:	68 00 10 00 00       	push   $0x1000
80106f6d:	6a 00                	push   $0x0
80106f6f:	50                   	push   %eax
80106f70:	e8 2b d7 ff ff       	call   801046a0 <memset>
80106f75:	83 c4 10             	add    $0x10,%esp
80106f78:	8b 43 04             	mov    0x4(%ebx),%eax
80106f7b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106f7e:	83 ec 08             	sub    $0x8,%esp
80106f81:	8b 13                	mov    (%ebx),%edx
80106f83:	ff 73 0c             	pushl  0xc(%ebx)
80106f86:	50                   	push   %eax
80106f87:	29 c1                	sub    %eax,%ecx
80106f89:	89 f0                	mov    %esi,%eax
80106f8b:	e8 b0 f9 ff ff       	call   80106940 <mappages>
80106f90:	83 c4 10             	add    $0x10,%esp
80106f93:	85 c0                	test   %eax,%eax
80106f95:	78 19                	js     80106fb0 <setupkvm+0x60>
80106f97:	83 c3 10             	add    $0x10,%ebx
80106f9a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106fa0:	75 d6                	jne    80106f78 <setupkvm+0x28>
80106fa2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106fa5:	89 f0                	mov    %esi,%eax
80106fa7:	5b                   	pop    %ebx
80106fa8:	5e                   	pop    %esi
80106fa9:	5d                   	pop    %ebp
80106faa:	c3                   	ret    
80106fab:	90                   	nop
80106fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106fb0:	83 ec 0c             	sub    $0xc,%esp
80106fb3:	56                   	push   %esi
80106fb4:	31 f6                	xor    %esi,%esi
80106fb6:	e8 15 ff ff ff       	call   80106ed0 <freevm>
80106fbb:	83 c4 10             	add    $0x10,%esp
80106fbe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106fc1:	89 f0                	mov    %esi,%eax
80106fc3:	5b                   	pop    %ebx
80106fc4:	5e                   	pop    %esi
80106fc5:	5d                   	pop    %ebp
80106fc6:	c3                   	ret    
80106fc7:	89 f6                	mov    %esi,%esi
80106fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fd0 <kvmalloc>:
80106fd0:	55                   	push   %ebp
80106fd1:	89 e5                	mov    %esp,%ebp
80106fd3:	83 ec 08             	sub    $0x8,%esp
80106fd6:	e8 75 ff ff ff       	call   80106f50 <setupkvm>
80106fdb:	a3 84 60 11 80       	mov    %eax,0x80116084
80106fe0:	05 00 00 00 80       	add    $0x80000000,%eax
80106fe5:	0f 22 d8             	mov    %eax,%cr3
80106fe8:	c9                   	leave  
80106fe9:	c3                   	ret    
80106fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106ff0 <clearpteu>:
80106ff0:	55                   	push   %ebp
80106ff1:	31 c9                	xor    %ecx,%ecx
80106ff3:	89 e5                	mov    %esp,%ebp
80106ff5:	83 ec 08             	sub    $0x8,%esp
80106ff8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ffb:	8b 45 08             	mov    0x8(%ebp),%eax
80106ffe:	e8 bd f8 ff ff       	call   801068c0 <walkpgdir>
80107003:	85 c0                	test   %eax,%eax
80107005:	74 05                	je     8010700c <clearpteu+0x1c>
80107007:	83 20 fb             	andl   $0xfffffffb,(%eax)
8010700a:	c9                   	leave  
8010700b:	c3                   	ret    
8010700c:	83 ec 0c             	sub    $0xc,%esp
8010700f:	68 5a 7d 10 80       	push   $0x80107d5a
80107014:	e8 77 93 ff ff       	call   80100390 <panic>
80107019:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107020 <copyuvm>:
80107020:	55                   	push   %ebp
80107021:	89 e5                	mov    %esp,%ebp
80107023:	57                   	push   %edi
80107024:	56                   	push   %esi
80107025:	53                   	push   %ebx
80107026:	83 ec 1c             	sub    $0x1c,%esp
80107029:	e8 22 ff ff ff       	call   80106f50 <setupkvm>
8010702e:	85 c0                	test   %eax,%eax
80107030:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107033:	0f 84 9f 00 00 00    	je     801070d8 <copyuvm+0xb8>
80107039:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010703c:	85 c9                	test   %ecx,%ecx
8010703e:	0f 84 94 00 00 00    	je     801070d8 <copyuvm+0xb8>
80107044:	31 ff                	xor    %edi,%edi
80107046:	eb 4a                	jmp    80107092 <copyuvm+0x72>
80107048:	90                   	nop
80107049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107050:	83 ec 04             	sub    $0x4,%esp
80107053:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80107059:	68 00 10 00 00       	push   $0x1000
8010705e:	53                   	push   %ebx
8010705f:	50                   	push   %eax
80107060:	e8 eb d6 ff ff       	call   80104750 <memmove>
80107065:	58                   	pop    %eax
80107066:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
8010706c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107071:	5a                   	pop    %edx
80107072:	ff 75 e4             	pushl  -0x1c(%ebp)
80107075:	50                   	push   %eax
80107076:	89 fa                	mov    %edi,%edx
80107078:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010707b:	e8 c0 f8 ff ff       	call   80106940 <mappages>
80107080:	83 c4 10             	add    $0x10,%esp
80107083:	85 c0                	test   %eax,%eax
80107085:	78 61                	js     801070e8 <copyuvm+0xc8>
80107087:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010708d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80107090:	76 46                	jbe    801070d8 <copyuvm+0xb8>
80107092:	8b 45 08             	mov    0x8(%ebp),%eax
80107095:	31 c9                	xor    %ecx,%ecx
80107097:	89 fa                	mov    %edi,%edx
80107099:	e8 22 f8 ff ff       	call   801068c0 <walkpgdir>
8010709e:	85 c0                	test   %eax,%eax
801070a0:	74 61                	je     80107103 <copyuvm+0xe3>
801070a2:	8b 00                	mov    (%eax),%eax
801070a4:	a8 01                	test   $0x1,%al
801070a6:	74 4e                	je     801070f6 <copyuvm+0xd6>
801070a8:	89 c3                	mov    %eax,%ebx
801070aa:	25 ff 0f 00 00       	and    $0xfff,%eax
801070af:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801070b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801070b8:	e8 73 b4 ff ff       	call   80102530 <kalloc>
801070bd:	85 c0                	test   %eax,%eax
801070bf:	89 c6                	mov    %eax,%esi
801070c1:	75 8d                	jne    80107050 <copyuvm+0x30>
801070c3:	83 ec 0c             	sub    $0xc,%esp
801070c6:	ff 75 e0             	pushl  -0x20(%ebp)
801070c9:	e8 02 fe ff ff       	call   80106ed0 <freevm>
801070ce:	83 c4 10             	add    $0x10,%esp
801070d1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
801070d8:	8b 45 e0             	mov    -0x20(%ebp),%eax
801070db:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070de:	5b                   	pop    %ebx
801070df:	5e                   	pop    %esi
801070e0:	5f                   	pop    %edi
801070e1:	5d                   	pop    %ebp
801070e2:	c3                   	ret    
801070e3:	90                   	nop
801070e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801070e8:	83 ec 0c             	sub    $0xc,%esp
801070eb:	56                   	push   %esi
801070ec:	e8 8f b2 ff ff       	call   80102380 <kfree>
801070f1:	83 c4 10             	add    $0x10,%esp
801070f4:	eb cd                	jmp    801070c3 <copyuvm+0xa3>
801070f6:	83 ec 0c             	sub    $0xc,%esp
801070f9:	68 7e 7d 10 80       	push   $0x80107d7e
801070fe:	e8 8d 92 ff ff       	call   80100390 <panic>
80107103:	83 ec 0c             	sub    $0xc,%esp
80107106:	68 64 7d 10 80       	push   $0x80107d64
8010710b:	e8 80 92 ff ff       	call   80100390 <panic>

80107110 <uva2ka>:
80107110:	55                   	push   %ebp
80107111:	31 c9                	xor    %ecx,%ecx
80107113:	89 e5                	mov    %esp,%ebp
80107115:	83 ec 08             	sub    $0x8,%esp
80107118:	8b 55 0c             	mov    0xc(%ebp),%edx
8010711b:	8b 45 08             	mov    0x8(%ebp),%eax
8010711e:	e8 9d f7 ff ff       	call   801068c0 <walkpgdir>
80107123:	8b 00                	mov    (%eax),%eax
80107125:	c9                   	leave  
80107126:	89 c2                	mov    %eax,%edx
80107128:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010712d:	83 e2 05             	and    $0x5,%edx
80107130:	05 00 00 00 80       	add    $0x80000000,%eax
80107135:	83 fa 05             	cmp    $0x5,%edx
80107138:	ba 00 00 00 00       	mov    $0x0,%edx
8010713d:	0f 45 c2             	cmovne %edx,%eax
80107140:	c3                   	ret    
80107141:	eb 0d                	jmp    80107150 <copyout>
80107143:	90                   	nop
80107144:	90                   	nop
80107145:	90                   	nop
80107146:	90                   	nop
80107147:	90                   	nop
80107148:	90                   	nop
80107149:	90                   	nop
8010714a:	90                   	nop
8010714b:	90                   	nop
8010714c:	90                   	nop
8010714d:	90                   	nop
8010714e:	90                   	nop
8010714f:	90                   	nop

80107150 <copyout>:
80107150:	55                   	push   %ebp
80107151:	89 e5                	mov    %esp,%ebp
80107153:	57                   	push   %edi
80107154:	56                   	push   %esi
80107155:	53                   	push   %ebx
80107156:	83 ec 1c             	sub    $0x1c,%esp
80107159:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010715c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010715f:	8b 7d 10             	mov    0x10(%ebp),%edi
80107162:	85 db                	test   %ebx,%ebx
80107164:	75 40                	jne    801071a6 <copyout+0x56>
80107166:	eb 70                	jmp    801071d8 <copyout+0x88>
80107168:	90                   	nop
80107169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107170:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107173:	89 f1                	mov    %esi,%ecx
80107175:	29 d1                	sub    %edx,%ecx
80107177:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010717d:	39 d9                	cmp    %ebx,%ecx
8010717f:	0f 47 cb             	cmova  %ebx,%ecx
80107182:	29 f2                	sub    %esi,%edx
80107184:	83 ec 04             	sub    $0x4,%esp
80107187:	01 d0                	add    %edx,%eax
80107189:	51                   	push   %ecx
8010718a:	57                   	push   %edi
8010718b:	50                   	push   %eax
8010718c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010718f:	e8 bc d5 ff ff       	call   80104750 <memmove>
80107194:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80107197:	83 c4 10             	add    $0x10,%esp
8010719a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
801071a0:	01 cf                	add    %ecx,%edi
801071a2:	29 cb                	sub    %ecx,%ebx
801071a4:	74 32                	je     801071d8 <copyout+0x88>
801071a6:	89 d6                	mov    %edx,%esi
801071a8:	83 ec 08             	sub    $0x8,%esp
801071ab:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801071ae:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
801071b4:	56                   	push   %esi
801071b5:	ff 75 08             	pushl  0x8(%ebp)
801071b8:	e8 53 ff ff ff       	call   80107110 <uva2ka>
801071bd:	83 c4 10             	add    $0x10,%esp
801071c0:	85 c0                	test   %eax,%eax
801071c2:	75 ac                	jne    80107170 <copyout+0x20>
801071c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801071cc:	5b                   	pop    %ebx
801071cd:	5e                   	pop    %esi
801071ce:	5f                   	pop    %edi
801071cf:	5d                   	pop    %ebp
801071d0:	c3                   	ret    
801071d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801071d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071db:	31 c0                	xor    %eax,%eax
801071dd:	5b                   	pop    %ebx
801071de:	5e                   	pop    %esi
801071df:	5f                   	pop    %edi
801071e0:	5d                   	pop    %ebp
801071e1:	c3                   	ret    
801071e2:	66 90                	xchg   %ax,%ax
801071e4:	66 90                	xchg   %ax,%ax
801071e6:	66 90                	xchg   %ax,%ax
801071e8:	66 90                	xchg   %ax,%ax
801071ea:	66 90                	xchg   %ax,%ax
801071ec:	66 90                	xchg   %ax,%ax
801071ee:	66 90                	xchg   %ax,%ax

801071f0 <sgenrand>:
801071f0:	55                   	push   %ebp
801071f1:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
801071f6:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
801071fb:	89 e5                	mov    %esp,%ebp
801071fd:	8b 55 08             	mov    0x8(%ebp),%edx
80107200:	89 15 e0 a5 10 80    	mov    %edx,0x8010a5e0
80107206:	eb 0b                	jmp    80107213 <sgenrand+0x23>
80107208:	90                   	nop
80107209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107210:	83 c0 04             	add    $0x4,%eax
80107213:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
80107219:	39 c1                	cmp    %eax,%ecx
8010721b:	89 10                	mov    %edx,(%eax)
8010721d:	75 f1                	jne    80107210 <sgenrand+0x20>
8010721f:	c7 05 60 a4 10 80 70 	movl   $0x270,0x8010a460
80107226:	02 00 00 
80107229:	5d                   	pop    %ebp
8010722a:	c3                   	ret    
8010722b:	90                   	nop
8010722c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107230 <genrand>:
80107230:	a1 60 a4 10 80       	mov    0x8010a460,%eax
80107235:	55                   	push   %ebp
80107236:	89 e5                	mov    %esp,%ebp
80107238:	56                   	push   %esi
80107239:	53                   	push   %ebx
8010723a:	3d 6f 02 00 00       	cmp    $0x26f,%eax
8010723f:	0f 8e f9 00 00 00    	jle    8010733e <genrand+0x10e>
80107245:	3d 71 02 00 00       	cmp    $0x271,%eax
8010724a:	0f 84 fa 00 00 00    	je     8010734a <genrand+0x11a>
80107250:	ba e0 a5 10 80       	mov    $0x8010a5e0,%edx
80107255:	bb 6c a9 10 80       	mov    $0x8010a96c,%ebx
8010725a:	89 d1                	mov    %edx,%ecx
8010725c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107260:	8b 01                	mov    (%ecx),%eax
80107262:	8b 71 04             	mov    0x4(%ecx),%esi
80107265:	83 c1 04             	add    $0x4,%ecx
80107268:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
8010726e:	25 00 00 00 80       	and    $0x80000000,%eax
80107273:	09 f0                	or     %esi,%eax
80107275:	89 c6                	mov    %eax,%esi
80107277:	83 e0 01             	and    $0x1,%eax
8010727a:	d1 ee                	shr    %esi
8010727c:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
80107282:	33 34 85 bc 7d 10 80 	xor    -0x7fef8244(,%eax,4),%esi
80107289:	89 71 fc             	mov    %esi,-0x4(%ecx)
8010728c:	39 cb                	cmp    %ecx,%ebx
8010728e:	75 d0                	jne    80107260 <genrand+0x30>
80107290:	b9 10 ac 10 80       	mov    $0x8010ac10,%ecx
80107295:	8d 76 00             	lea    0x0(%esi),%esi
80107298:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
8010729e:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
801072a4:	83 c2 04             	add    $0x4,%edx
801072a7:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
801072ad:	25 00 00 00 80       	and    $0x80000000,%eax
801072b2:	09 d8                	or     %ebx,%eax
801072b4:	89 c3                	mov    %eax,%ebx
801072b6:	83 e0 01             	and    $0x1,%eax
801072b9:	d1 eb                	shr    %ebx
801072bb:	33 5a fc             	xor    -0x4(%edx),%ebx
801072be:	33 1c 85 bc 7d 10 80 	xor    -0x7fef8244(,%eax,4),%ebx
801072c5:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
801072cb:	39 d1                	cmp    %edx,%ecx
801072cd:	75 c9                	jne    80107298 <genrand+0x68>
801072cf:	a1 e0 a5 10 80       	mov    0x8010a5e0,%eax
801072d4:	8b 0d 9c af 10 80    	mov    0x8010af9c,%ecx
801072da:	89 c2                	mov    %eax,%edx
801072dc:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
801072e2:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
801072e8:	09 d1                	or     %edx,%ecx
801072ea:	89 ca                	mov    %ecx,%edx
801072ec:	83 e1 01             	and    $0x1,%ecx
801072ef:	d1 ea                	shr    %edx
801072f1:	33 15 10 ac 10 80    	xor    0x8010ac10,%edx
801072f7:	33 14 8d bc 7d 10 80 	xor    -0x7fef8244(,%ecx,4),%edx
801072fe:	89 15 9c af 10 80    	mov    %edx,0x8010af9c
80107304:	ba 01 00 00 00       	mov    $0x1,%edx
80107309:	89 15 60 a4 10 80    	mov    %edx,0x8010a460
8010730f:	89 c2                	mov    %eax,%edx
80107311:	c1 ea 0b             	shr    $0xb,%edx
80107314:	31 c2                	xor    %eax,%edx
80107316:	89 d0                	mov    %edx,%eax
80107318:	c1 e0 07             	shl    $0x7,%eax
8010731b:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
80107320:	31 c2                	xor    %eax,%edx
80107322:	89 d0                	mov    %edx,%eax
80107324:	c1 e0 0f             	shl    $0xf,%eax
80107327:	25 00 00 c6 ef       	and    $0xefc60000,%eax
8010732c:	31 d0                	xor    %edx,%eax
8010732e:	89 c2                	mov    %eax,%edx
80107330:	c1 ea 12             	shr    $0x12,%edx
80107333:	31 d0                	xor    %edx,%eax
80107335:	5b                   	pop    %ebx
80107336:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
8010733b:	5e                   	pop    %esi
8010733c:	5d                   	pop    %ebp
8010733d:	c3                   	ret    
8010733e:	8d 50 01             	lea    0x1(%eax),%edx
80107341:	8b 04 85 e0 a5 10 80 	mov    -0x7fef5a20(,%eax,4),%eax
80107348:	eb bf                	jmp    80107309 <genrand+0xd9>
8010734a:	c7 05 e0 a5 10 80 05 	movl   $0x1105,0x8010a5e0
80107351:	11 00 00 
80107354:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
80107359:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
8010735e:	ba 05 11 00 00       	mov    $0x1105,%edx
80107363:	eb 06                	jmp    8010736b <genrand+0x13b>
80107365:	8d 76 00             	lea    0x0(%esi),%esi
80107368:	83 c0 04             	add    $0x4,%eax
8010736b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
80107371:	39 c1                	cmp    %eax,%ecx
80107373:	89 10                	mov    %edx,(%eax)
80107375:	75 f1                	jne    80107368 <genrand+0x138>
80107377:	e9 d4 fe ff ff       	jmp    80107250 <genrand+0x20>
8010737c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107380 <random_at_most>:
80107380:	55                   	push   %ebp
80107381:	31 d2                	xor    %edx,%edx
80107383:	89 e5                	mov    %esp,%ebp
80107385:	56                   	push   %esi
80107386:	53                   	push   %ebx
80107387:	8b 45 08             	mov    0x8(%ebp),%eax
8010738a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
8010738f:	8d 48 01             	lea    0x1(%eax),%ecx
80107392:	89 d8                	mov    %ebx,%eax
80107394:	f7 f1                	div    %ecx
80107396:	89 c6                	mov    %eax,%esi
80107398:	29 d3                	sub    %edx,%ebx
8010739a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801073a0:	e8 8b fe ff ff       	call   80107230 <genrand>
801073a5:	39 d8                	cmp    %ebx,%eax
801073a7:	73 f7                	jae    801073a0 <random_at_most+0x20>
801073a9:	31 d2                	xor    %edx,%edx
801073ab:	f7 f6                	div    %esi
801073ad:	5b                   	pop    %ebx
801073ae:	5e                   	pop    %esi
801073af:	5d                   	pop    %ebp
801073b0:	c3                   	ret    
