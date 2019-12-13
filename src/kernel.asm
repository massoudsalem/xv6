
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
80100044:	bb d4 bf 10 80       	mov    $0x8010bfd4,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 a0 72 10 80       	push   $0x801072a0
80100051:	68 a0 bf 10 80       	push   $0x8010bfa0
80100056:	e8 35 43 00 00       	call   80104390 <initlock>
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
80100092:	68 a7 72 10 80       	push   $0x801072a7
80100097:	50                   	push   %eax
80100098:	e8 c3 41 00 00       	call   80104260 <initsleeplock>
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
801000e4:	e8 e7 43 00 00       	call   801044d0 <acquire>
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
80100162:	e8 29 44 00 00       	call   80104590 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 2e 41 00 00       	call   801042a0 <acquiresleep>
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
80100193:	68 ae 72 10 80       	push   $0x801072ae
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
801001ae:	e8 8d 41 00 00       	call   80104340 <holdingsleep>
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
801001cc:	68 bf 72 10 80       	push   $0x801072bf
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
801001ef:	e8 4c 41 00 00       	call   80104340 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 fc 40 00 00       	call   80104300 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 a0 bf 10 80 	movl   $0x8010bfa0,(%esp)
8010020b:	e8 c0 42 00 00       	call   801044d0 <acquire>
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
8010025c:	e9 2f 43 00 00       	jmp    80104590 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 c6 72 10 80       	push   $0x801072c6
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
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 3f 42 00 00       	call   801044d0 <acquire>
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
801002db:	e8 b0 35 00 00       	call   80103890 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
        release(&cons.lock);
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 a5 10 80       	push   $0x8010a520
801002ef:	e8 9c 42 00 00       	call   80104590 <release>
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
8010034d:	e8 3e 42 00 00       	call   80104590 <release>
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
801003a9:	e8 c2 23 00 00       	call   80102770 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 cd 72 10 80       	push   $0x801072cd
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 23 7c 10 80 	movl   $0x80107c23,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 d3 3f 00 00       	call   801043b0 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 e1 72 10 80       	push   $0x801072e1
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
8010043a:	e8 a1 58 00 00       	call   80105ce0 <uartputc>
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
801004ec:	e8 ef 57 00 00       	call   80105ce0 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 e3 57 00 00       	call   80105ce0 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 d7 57 00 00       	call   80105ce0 <uartputc>
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
80100524:	e8 67 41 00 00       	call   80104690 <memmove>
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
80100541:	e8 9a 40 00 00       	call   801045e0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
    panic("pos under/overflow");
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 e5 72 10 80       	push   $0x801072e5
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
801005b1:	0f b6 92 10 73 10 80 	movzbl -0x7fef8cf0(%edx),%edx
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
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 b0 3e 00 00       	call   801044d0 <acquire>
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
80100647:	e8 44 3f 00 00       	call   80104590 <release>
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
8010071f:	e8 6c 3e 00 00       	call   80104590 <release>
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
80100810:	ba f8 72 10 80       	mov    $0x801072f8,%edx
      for(; *s; s++)
80100815:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100818:	b8 28 00 00 00       	mov    $0x28,%eax
8010081d:	89 d3                	mov    %edx,%ebx
8010081f:	eb bf                	jmp    801007e0 <cprintf+0x180>
80100821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
80100828:	83 ec 0c             	sub    $0xc,%esp
8010082b:	68 20 a5 10 80       	push   $0x8010a520
80100830:	e8 9b 3c 00 00       	call   801044d0 <acquire>
80100835:	83 c4 10             	add    $0x10,%esp
80100838:	e9 3c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
8010083d:	83 ec 0c             	sub    $0xc,%esp
80100840:	68 ff 72 10 80       	push   $0x801072ff
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
80100863:	e8 68 3c 00 00       	call   801044d0 <acquire>
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
801008c8:	e8 c3 3c 00 00       	call   80104590 <release>
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
80100956:	e8 45 37 00 00       	call   801040a0 <wakeup>
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
801009d7:	e9 a4 37 00 00       	jmp    80104180 <procdump>
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
80100a06:	68 08 73 10 80       	push   $0x80107308
80100a0b:	68 20 a5 10 80       	push   $0x8010a520
80100a10:	e8 7b 39 00 00       	call   80104390 <initlock>

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
80100a5c:	e8 2f 2e 00 00       	call   80103890 <myproc>
80100a61:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a67:	e8 c4 21 00 00       	call   80102c30 <begin_op>

  if((ip = namei(path)) == 0){
80100a6c:	83 ec 0c             	sub    $0xc,%esp
80100a6f:	ff 75 08             	pushl  0x8(%ebp)
80100a72:	e8 a9 14 00 00       	call   80101f20 <namei>
80100a77:	83 c4 10             	add    $0x10,%esp
80100a7a:	85 c0                	test   %eax,%eax
80100a7c:	0f 84 91 01 00 00    	je     80100c13 <exec+0x1c3>
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
80100ad4:	e8 57 63 00 00       	call   80106e30 <setupkvm>
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
80100af9:	0f 84 8c 02 00 00    	je     80100d8b <exec+0x33b>
80100aff:	31 f6                	xor    %esi,%esi
80100b01:	eb 7f                	jmp    80100b82 <exec+0x132>
80100b03:	90                   	nop
80100b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ph.type != ELF_PROG_LOAD)
80100b08:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b0f:	75 63                	jne    80100b74 <exec+0x124>
    if(ph.memsz < ph.filesz)
80100b11:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b17:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b1d:	0f 82 86 00 00 00    	jb     80100ba9 <exec+0x159>
80100b23:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b29:	72 7e                	jb     80100ba9 <exec+0x159>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b2b:	83 ec 04             	sub    $0x4,%esp
80100b2e:	50                   	push   %eax
80100b2f:	57                   	push   %edi
80100b30:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b36:	e8 15 61 00 00       	call   80106c50 <allocuvm>
80100b3b:	83 c4 10             	add    $0x10,%esp
80100b3e:	85 c0                	test   %eax,%eax
80100b40:	89 c7                	mov    %eax,%edi
80100b42:	74 65                	je     80100ba9 <exec+0x159>
    if(ph.vaddr % PGSIZE != 0)
80100b44:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b4a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b4f:	75 58                	jne    80100ba9 <exec+0x159>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b51:	83 ec 0c             	sub    $0xc,%esp
80100b54:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b5a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b60:	53                   	push   %ebx
80100b61:	50                   	push   %eax
80100b62:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b68:	e8 23 60 00 00       	call   80106b90 <loaduvm>
80100b6d:	83 c4 20             	add    $0x20,%esp
80100b70:	85 c0                	test   %eax,%eax
80100b72:	78 35                	js     80100ba9 <exec+0x159>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b74:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b7b:	83 c6 01             	add    $0x1,%esi
80100b7e:	39 f0                	cmp    %esi,%eax
80100b80:	7e 3d                	jle    80100bbf <exec+0x16f>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100b82:	89 f0                	mov    %esi,%eax
80100b84:	6a 20                	push   $0x20
80100b86:	c1 e0 05             	shl    $0x5,%eax
80100b89:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b8f:	50                   	push   %eax
80100b90:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b96:	50                   	push   %eax
80100b97:	53                   	push   %ebx
80100b98:	e8 03 0e 00 00       	call   801019a0 <readi>
80100b9d:	83 c4 10             	add    $0x10,%esp
80100ba0:	83 f8 20             	cmp    $0x20,%eax
80100ba3:	0f 84 5f ff ff ff    	je     80100b08 <exec+0xb8>
    freevm(pgdir);
80100ba9:	83 ec 0c             	sub    $0xc,%esp
80100bac:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bb2:	e8 f9 61 00 00       	call   80106db0 <freevm>
80100bb7:	83 c4 10             	add    $0x10,%esp
80100bba:	e9 e7 fe ff ff       	jmp    80100aa6 <exec+0x56>
80100bbf:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100bc5:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100bcb:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100bd1:	83 ec 0c             	sub    $0xc,%esp
80100bd4:	53                   	push   %ebx
80100bd5:	e8 76 0d 00 00       	call   80101950 <iunlockput>
  end_op();
80100bda:	e8 c1 20 00 00       	call   80102ca0 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100bdf:	83 c4 0c             	add    $0xc,%esp
80100be2:	56                   	push   %esi
80100be3:	57                   	push   %edi
80100be4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bea:	e8 61 60 00 00       	call   80106c50 <allocuvm>
80100bef:	83 c4 10             	add    $0x10,%esp
80100bf2:	85 c0                	test   %eax,%eax
80100bf4:	89 c6                	mov    %eax,%esi
80100bf6:	75 3a                	jne    80100c32 <exec+0x1e2>
    freevm(pgdir);
80100bf8:	83 ec 0c             	sub    $0xc,%esp
80100bfb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c01:	e8 aa 61 00 00       	call   80106db0 <freevm>
80100c06:	83 c4 10             	add    $0x10,%esp
  return -1;
80100c09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c0e:	e9 a9 fe ff ff       	jmp    80100abc <exec+0x6c>
    end_op();
80100c13:	e8 88 20 00 00       	call   80102ca0 <end_op>
    cprintf("exec: fail\n");
80100c18:	83 ec 0c             	sub    $0xc,%esp
80100c1b:	68 21 73 10 80       	push   $0x80107321
80100c20:	e8 3b fa ff ff       	call   80100660 <cprintf>
    return -1;
80100c25:	83 c4 10             	add    $0x10,%esp
80100c28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c2d:	e9 8a fe ff ff       	jmp    80100abc <exec+0x6c>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c32:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100c38:	83 ec 08             	sub    $0x8,%esp
  for(argc = 0; argv[argc]; argc++) {
80100c3b:	31 ff                	xor    %edi,%edi
80100c3d:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c3f:	50                   	push   %eax
80100c40:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c46:	e8 85 62 00 00       	call   80106ed0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c4b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4e:	83 c4 10             	add    $0x10,%esp
80100c51:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c57:	8b 00                	mov    (%eax),%eax
80100c59:	85 c0                	test   %eax,%eax
80100c5b:	74 70                	je     80100ccd <exec+0x27d>
80100c5d:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c63:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c69:	eb 0a                	jmp    80100c75 <exec+0x225>
80100c6b:	90                   	nop
80100c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(argc >= MAXARG)
80100c70:	83 ff 20             	cmp    $0x20,%edi
80100c73:	74 83                	je     80100bf8 <exec+0x1a8>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c75:	83 ec 0c             	sub    $0xc,%esp
80100c78:	50                   	push   %eax
80100c79:	e8 82 3b 00 00       	call   80104800 <strlen>
80100c7e:	f7 d0                	not    %eax
80100c80:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c82:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c85:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c86:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c89:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c8c:	e8 6f 3b 00 00       	call   80104800 <strlen>
80100c91:	83 c0 01             	add    $0x1,%eax
80100c94:	50                   	push   %eax
80100c95:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c98:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c9b:	53                   	push   %ebx
80100c9c:	56                   	push   %esi
80100c9d:	e8 8e 63 00 00       	call   80107030 <copyout>
80100ca2:	83 c4 20             	add    $0x20,%esp
80100ca5:	85 c0                	test   %eax,%eax
80100ca7:	0f 88 4b ff ff ff    	js     80100bf8 <exec+0x1a8>
  for(argc = 0; argv[argc]; argc++) {
80100cad:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100cb0:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100cb7:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100cba:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100cc0:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100cc3:	85 c0                	test   %eax,%eax
80100cc5:	75 a9                	jne    80100c70 <exec+0x220>
80100cc7:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ccd:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100cd4:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100cd6:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100cdd:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100ce1:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100ce8:	ff ff ff 
  ustack[1] = argc;
80100ceb:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cf1:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100cf3:	83 c0 0c             	add    $0xc,%eax
80100cf6:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cf8:	50                   	push   %eax
80100cf9:	52                   	push   %edx
80100cfa:	53                   	push   %ebx
80100cfb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d01:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d07:	e8 24 63 00 00       	call   80107030 <copyout>
80100d0c:	83 c4 10             	add    $0x10,%esp
80100d0f:	85 c0                	test   %eax,%eax
80100d11:	0f 88 e1 fe ff ff    	js     80100bf8 <exec+0x1a8>
  for(last=s=path; *s; s++)
80100d17:	8b 45 08             	mov    0x8(%ebp),%eax
80100d1a:	0f b6 00             	movzbl (%eax),%eax
80100d1d:	84 c0                	test   %al,%al
80100d1f:	74 17                	je     80100d38 <exec+0x2e8>
80100d21:	8b 55 08             	mov    0x8(%ebp),%edx
80100d24:	89 d1                	mov    %edx,%ecx
80100d26:	83 c1 01             	add    $0x1,%ecx
80100d29:	3c 2f                	cmp    $0x2f,%al
80100d2b:	0f b6 01             	movzbl (%ecx),%eax
80100d2e:	0f 44 d1             	cmove  %ecx,%edx
80100d31:	84 c0                	test   %al,%al
80100d33:	75 f1                	jne    80100d26 <exec+0x2d6>
80100d35:	89 55 08             	mov    %edx,0x8(%ebp)
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d38:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100d3e:	50                   	push   %eax
80100d3f:	6a 10                	push   $0x10
80100d41:	ff 75 08             	pushl  0x8(%ebp)
80100d44:	89 f8                	mov    %edi,%eax
80100d46:	83 c0 6c             	add    $0x6c,%eax
80100d49:	50                   	push   %eax
80100d4a:	e8 71 3a 00 00       	call   801047c0 <safestrcpy>
  curproc->pgdir = pgdir;
80100d4f:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
  oldpgdir = curproc->pgdir;
80100d55:	89 f9                	mov    %edi,%ecx
80100d57:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->tf->eip = elf.entry;  // main
80100d5a:	8b 41 18             	mov    0x18(%ecx),%eax
  curproc->sz = sz;
80100d5d:	89 31                	mov    %esi,(%ecx)
  curproc->pgdir = pgdir;
80100d5f:	89 51 04             	mov    %edx,0x4(%ecx)
  curproc->tf->eip = elf.entry;  // main
80100d62:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d68:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d6b:	8b 41 18             	mov    0x18(%ecx),%eax
80100d6e:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d71:	89 0c 24             	mov    %ecx,(%esp)
80100d74:	e8 87 5c 00 00       	call   80106a00 <switchuvm>
  freevm(oldpgdir);
80100d79:	89 3c 24             	mov    %edi,(%esp)
80100d7c:	e8 2f 60 00 00       	call   80106db0 <freevm>
  return 0;
80100d81:	83 c4 10             	add    $0x10,%esp
80100d84:	31 c0                	xor    %eax,%eax
80100d86:	e9 31 fd ff ff       	jmp    80100abc <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d8b:	be 00 20 00 00       	mov    $0x2000,%esi
80100d90:	e9 3c fe ff ff       	jmp    80100bd1 <exec+0x181>
80100d95:	66 90                	xchg   %ax,%ax
80100d97:	66 90                	xchg   %ax,%ax
80100d99:	66 90                	xchg   %ax,%ax
80100d9b:	66 90                	xchg   %ax,%ax
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
80100da6:	68 2d 73 10 80       	push   $0x8010732d
80100dab:	68 a0 09 11 80       	push   $0x801109a0
80100db0:	e8 db 35 00 00       	call   80104390 <initlock>
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
80100dc4:	bb d4 09 11 80       	mov    $0x801109d4,%ebx
{
80100dc9:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100dcc:	68 a0 09 11 80       	push   $0x801109a0
80100dd1:	e8 fa 36 00 00       	call   801044d0 <acquire>
80100dd6:	83 c4 10             	add    $0x10,%esp
80100dd9:	eb 10                	jmp    80100deb <filealloc+0x2b>
80100ddb:	90                   	nop
80100ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100de0:	83 c3 18             	add    $0x18,%ebx
80100de3:	81 fb 34 13 11 80    	cmp    $0x80111334,%ebx
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
80100dfc:	68 a0 09 11 80       	push   $0x801109a0
80100e01:	e8 8a 37 00 00       	call   80104590 <release>
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
80100e15:	68 a0 09 11 80       	push   $0x801109a0
80100e1a:	e8 71 37 00 00       	call   80104590 <release>
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
80100e3a:	68 a0 09 11 80       	push   $0x801109a0
80100e3f:	e8 8c 36 00 00       	call   801044d0 <acquire>
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
80100e57:	68 a0 09 11 80       	push   $0x801109a0
80100e5c:	e8 2f 37 00 00       	call   80104590 <release>
  return f;
}
80100e61:	89 d8                	mov    %ebx,%eax
80100e63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e66:	c9                   	leave  
80100e67:	c3                   	ret    
    panic("filedup");
80100e68:	83 ec 0c             	sub    $0xc,%esp
80100e6b:	68 34 73 10 80       	push   $0x80107334
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
80100e8c:	68 a0 09 11 80       	push   $0x801109a0
80100e91:	e8 3a 36 00 00       	call   801044d0 <acquire>
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
80100eae:	c7 45 08 a0 09 11 80 	movl   $0x801109a0,0x8(%ebp)
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
80100ebc:	e9 cf 36 00 00       	jmp    80104590 <release>
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
80100ee0:	68 a0 09 11 80       	push   $0x801109a0
  ff = *f;
80100ee5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100ee8:	e8 a3 36 00 00       	call   80104590 <release>
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
80100f42:	68 3c 73 10 80       	push   $0x8010733c
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
80101022:	68 46 73 10 80       	push   $0x80107346
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
80101135:	68 4f 73 10 80       	push   $0x8010734f
8010113a:	e8 51 f2 ff ff       	call   80100390 <panic>
  panic("filewrite");
8010113f:	83 ec 0c             	sub    $0xc,%esp
80101142:	68 55 73 10 80       	push   $0x80107355
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
8010115a:	03 15 b8 13 11 80    	add    0x801113b8,%edx
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
801011b3:	68 5f 73 10 80       	push   $0x8010735f
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
801011c9:	8b 0d a0 13 11 80    	mov    0x801113a0,%ecx
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
801011ec:	03 05 b8 13 11 80    	add    0x801113b8,%eax
801011f2:	50                   	push   %eax
801011f3:	ff 75 d8             	pushl  -0x28(%ebp)
801011f6:	e8 d5 ee ff ff       	call   801000d0 <bread>
801011fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801011fe:	a1 a0 13 11 80       	mov    0x801113a0,%eax
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
80101259:	39 05 a0 13 11 80    	cmp    %eax,0x801113a0
8010125f:	77 80                	ja     801011e1 <balloc+0x21>
  panic("balloc: out of blocks");
80101261:	83 ec 0c             	sub    $0xc,%esp
80101264:	68 72 73 10 80       	push   $0x80107372
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
801012a5:	e8 36 33 00 00       	call   801045e0 <memset>
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
801012da:	bb f4 13 11 80       	mov    $0x801113f4,%ebx
{
801012df:	83 ec 28             	sub    $0x28,%esp
801012e2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
801012e5:	68 c0 13 11 80       	push   $0x801113c0
801012ea:	e8 e1 31 00 00       	call   801044d0 <acquire>
801012ef:	83 c4 10             	add    $0x10,%esp
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012f5:	eb 17                	jmp    8010130e <iget+0x3e>
801012f7:	89 f6                	mov    %esi,%esi
801012f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101300:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101306:	81 fb 14 30 11 80    	cmp    $0x80113014,%ebx
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
80101328:	81 fb 14 30 11 80    	cmp    $0x80113014,%ebx
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
8010134a:	68 c0 13 11 80       	push   $0x801113c0
8010134f:	e8 3c 32 00 00       	call   80104590 <release>

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
80101375:	68 c0 13 11 80       	push   $0x801113c0
      ip->ref++;
8010137a:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
8010137d:	e8 0e 32 00 00       	call   80104590 <release>
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
80101392:	68 88 73 10 80       	push   $0x80107388
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
80101467:	68 98 73 10 80       	push   $0x80107398
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
801014a1:	e8 ea 31 00 00       	call   80104690 <memmove>
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
801014c4:	bb 00 14 11 80       	mov    $0x80111400,%ebx
801014c9:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
801014cc:	68 ab 73 10 80       	push   $0x801073ab
801014d1:	68 c0 13 11 80       	push   $0x801113c0
801014d6:	e8 b5 2e 00 00       	call   80104390 <initlock>
801014db:	83 c4 10             	add    $0x10,%esp
801014de:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
801014e0:	83 ec 08             	sub    $0x8,%esp
801014e3:	68 b2 73 10 80       	push   $0x801073b2
801014e8:	53                   	push   %ebx
801014e9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014ef:	e8 6c 2d 00 00       	call   80104260 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801014f4:	83 c4 10             	add    $0x10,%esp
801014f7:	81 fb 20 30 11 80    	cmp    $0x80113020,%ebx
801014fd:	75 e1                	jne    801014e0 <iinit+0x20>
  readsb(dev, &sb);
801014ff:	83 ec 08             	sub    $0x8,%esp
80101502:	68 a0 13 11 80       	push   $0x801113a0
80101507:	ff 75 08             	pushl  0x8(%ebp)
8010150a:	e8 71 ff ff ff       	call   80101480 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010150f:	ff 35 b8 13 11 80    	pushl  0x801113b8
80101515:	ff 35 b4 13 11 80    	pushl  0x801113b4
8010151b:	ff 35 b0 13 11 80    	pushl  0x801113b0
80101521:	ff 35 ac 13 11 80    	pushl  0x801113ac
80101527:	ff 35 a8 13 11 80    	pushl  0x801113a8
8010152d:	ff 35 a4 13 11 80    	pushl  0x801113a4
80101533:	ff 35 a0 13 11 80    	pushl  0x801113a0
80101539:	68 18 74 10 80       	push   $0x80107418
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
80101559:	83 3d a8 13 11 80 01 	cmpl   $0x1,0x801113a8
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
8010158f:	39 1d a8 13 11 80    	cmp    %ebx,0x801113a8
80101595:	76 69                	jbe    80101600 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101597:	89 d8                	mov    %ebx,%eax
80101599:	83 ec 08             	sub    $0x8,%esp
8010159c:	c1 e8 03             	shr    $0x3,%eax
8010159f:	03 05 b4 13 11 80    	add    0x801113b4,%eax
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
801015ce:	e8 0d 30 00 00       	call   801045e0 <memset>
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
80101603:	68 b8 73 10 80       	push   $0x801073b8
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
80101624:	03 05 b4 13 11 80    	add    0x801113b4,%eax
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
80101671:	e8 1a 30 00 00       	call   80104690 <memmove>
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
8010169a:	68 c0 13 11 80       	push   $0x801113c0
8010169f:	e8 2c 2e 00 00       	call   801044d0 <acquire>
  ip->ref++;
801016a4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016a8:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
801016af:	e8 dc 2e 00 00       	call   80104590 <release>
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
801016e2:	e8 b9 2b 00 00       	call   801042a0 <acquiresleep>
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
80101709:	03 05 b4 13 11 80    	add    0x801113b4,%eax
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
80101758:	e8 33 2f 00 00       	call   80104690 <memmove>
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
8010177d:	68 d0 73 10 80       	push   $0x801073d0
80101782:	e8 09 ec ff ff       	call   80100390 <panic>
    panic("ilock");
80101787:	83 ec 0c             	sub    $0xc,%esp
8010178a:	68 ca 73 10 80       	push   $0x801073ca
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
801017b3:	e8 88 2b 00 00       	call   80104340 <holdingsleep>
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
801017cf:	e9 2c 2b 00 00       	jmp    80104300 <releasesleep>
    panic("iunlock");
801017d4:	83 ec 0c             	sub    $0xc,%esp
801017d7:	68 df 73 10 80       	push   $0x801073df
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
80101800:	e8 9b 2a 00 00       	call   801042a0 <acquiresleep>
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
8010181a:	e8 e1 2a 00 00       	call   80104300 <releasesleep>
  acquire(&icache.lock);
8010181f:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101826:	e8 a5 2c 00 00       	call   801044d0 <acquire>
  ip->ref--;
8010182b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010182f:	83 c4 10             	add    $0x10,%esp
80101832:	c7 45 08 c0 13 11 80 	movl   $0x801113c0,0x8(%ebp)
}
80101839:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010183c:	5b                   	pop    %ebx
8010183d:	5e                   	pop    %esi
8010183e:	5f                   	pop    %edi
8010183f:	5d                   	pop    %ebp
  release(&icache.lock);
80101840:	e9 4b 2d 00 00       	jmp    80104590 <release>
80101845:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101848:	83 ec 0c             	sub    $0xc,%esp
8010184b:	68 c0 13 11 80       	push   $0x801113c0
80101850:	e8 7b 2c 00 00       	call   801044d0 <acquire>
    int r = ip->ref;
80101855:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101858:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
8010185f:	e8 2c 2d 00 00       	call   80104590 <release>
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
80101a47:	e8 44 2c 00 00       	call   80104690 <memmove>
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
80101a7a:	8b 04 c5 40 13 11 80 	mov    -0x7feeecc0(,%eax,8),%eax
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
80101b43:	e8 48 2b 00 00       	call   80104690 <memmove>
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
80101b8a:	8b 04 c5 44 13 11 80 	mov    -0x7feeecbc(,%eax,8),%eax
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
80101bde:	e8 1d 2b 00 00       	call   80104700 <strncmp>
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
80101c3d:	e8 be 2a 00 00       	call   80104700 <strncmp>
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
80101c82:	68 f9 73 10 80       	push   $0x801073f9
80101c87:	e8 04 e7 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101c8c:	83 ec 0c             	sub    $0xc,%esp
80101c8f:	68 e7 73 10 80       	push   $0x801073e7
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
80101cb9:	e8 d2 1b 00 00       	call   80103890 <myproc>
  acquire(&icache.lock);
80101cbe:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101cc1:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101cc4:	68 c0 13 11 80       	push   $0x801113c0
80101cc9:	e8 02 28 00 00       	call   801044d0 <acquire>
  ip->ref++;
80101cce:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101cd2:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101cd9:	e8 b2 28 00 00       	call   80104590 <release>
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
80101d35:	e8 56 29 00 00       	call   80104690 <memmove>
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
80101dc8:	e8 c3 28 00 00       	call   80104690 <memmove>
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
80101ebd:	e8 9e 28 00 00       	call   80104760 <strncpy>
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
80101efb:	68 08 74 10 80       	push   $0x80107408
80101f00:	e8 8b e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101f05:	83 ec 0c             	sub    $0xc,%esp
80101f08:	68 0a 7a 10 80       	push   $0x80107a0a
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
8010201b:	68 74 74 10 80       	push   $0x80107474
80102020:	e8 6b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80102025:	83 ec 0c             	sub    $0xc,%esp
80102028:	68 6b 74 10 80       	push   $0x8010746b
8010202d:	e8 5e e3 ff ff       	call   80100390 <panic>
80102032:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102040 <ideinit>:
{
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102046:	68 86 74 10 80       	push   $0x80107486
8010204b:	68 80 a5 10 80       	push   $0x8010a580
80102050:	e8 3b 23 00 00       	call   80104390 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102055:	58                   	pop    %eax
80102056:	a1 e0 36 11 80       	mov    0x801136e0,%eax
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
8010209a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
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
801020c9:	68 80 a5 10 80       	push   $0x8010a580
801020ce:	e8 fd 23 00 00       	call   801044d0 <acquire>

  if((b = idequeue) == 0){
801020d3:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801020d9:	83 c4 10             	add    $0x10,%esp
801020dc:	85 db                	test   %ebx,%ebx
801020de:	74 67                	je     80102147 <ideintr+0x87>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
801020e0:	8b 43 58             	mov    0x58(%ebx),%eax
801020e3:	a3 64 a5 10 80       	mov    %eax,0x8010a564

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
80102131:	e8 6a 1f 00 00       	call   801040a0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102136:	a1 64 a5 10 80       	mov    0x8010a564,%eax
8010213b:	83 c4 10             	add    $0x10,%esp
8010213e:	85 c0                	test   %eax,%eax
80102140:	74 05                	je     80102147 <ideintr+0x87>
    idestart(idequeue);
80102142:	e8 19 fe ff ff       	call   80101f60 <idestart>
    release(&idelock);
80102147:	83 ec 0c             	sub    $0xc,%esp
8010214a:	68 80 a5 10 80       	push   $0x8010a580
8010214f:	e8 3c 24 00 00       	call   80104590 <release>

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
8010216e:	e8 cd 21 00 00       	call   80104340 <holdingsleep>
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
80102193:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102198:	85 c0                	test   %eax,%eax
8010219a:	0f 84 b1 00 00 00    	je     80102251 <iderw+0xf1>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
801021a0:	83 ec 0c             	sub    $0xc,%esp
801021a3:	68 80 a5 10 80       	push   $0x8010a580
801021a8:	e8 23 23 00 00       	call   801044d0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021ad:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
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
801021d6:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
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
801021f3:	68 80 a5 10 80       	push   $0x8010a580
801021f8:	53                   	push   %ebx
801021f9:	e8 f2 1c 00 00       	call   80103ef0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021fe:	8b 03                	mov    (%ebx),%eax
80102200:	83 c4 10             	add    $0x10,%esp
80102203:	83 e0 06             	and    $0x6,%eax
80102206:	83 f8 02             	cmp    $0x2,%eax
80102209:	75 e5                	jne    801021f0 <iderw+0x90>
  }


  release(&idelock);
8010220b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
80102212:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102215:	c9                   	leave  
  release(&idelock);
80102216:	e9 75 23 00 00       	jmp    80104590 <release>
8010221b:	90                   	nop
8010221c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    idestart(b);
80102220:	89 d8                	mov    %ebx,%eax
80102222:	e8 39 fd ff ff       	call   80101f60 <idestart>
80102227:	eb b5                	jmp    801021de <iderw+0x7e>
80102229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102230:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102235:	eb 9d                	jmp    801021d4 <iderw+0x74>
    panic("iderw: nothing to do");
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 a0 74 10 80       	push   $0x801074a0
8010223f:	e8 4c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102244:	83 ec 0c             	sub    $0xc,%esp
80102247:	68 8a 74 10 80       	push   $0x8010748a
8010224c:	e8 3f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102251:	83 ec 0c             	sub    $0xc,%esp
80102254:	68 b5 74 10 80       	push   $0x801074b5
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
80102261:	c7 05 14 30 11 80 00 	movl   $0xfec00000,0x80113014
80102268:	00 c0 fe 
{
8010226b:	89 e5                	mov    %esp,%ebp
8010226d:	56                   	push   %esi
8010226e:	53                   	push   %ebx
  ioapic->reg = reg;
8010226f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102276:	00 00 00 
  return ioapic->data;
80102279:	a1 14 30 11 80       	mov    0x80113014,%eax
8010227e:	8b 58 10             	mov    0x10(%eax),%ebx
  ioapic->reg = reg;
80102281:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return ioapic->data;
80102287:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010228d:	0f b6 15 40 31 11 80 	movzbl 0x80113140,%edx
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
801022a7:	68 d4 74 10 80       	push   $0x801074d4
801022ac:	e8 af e3 ff ff       	call   80100660 <cprintf>
801022b1:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
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
801022d2:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx

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
801022f0:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
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
80102311:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
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
80102325:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010232b:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
8010232e:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102331:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
80102334:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102336:	a1 14 30 11 80       	mov    0x80113014,%eax
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
80102362:	81 fb 88 5f 11 80    	cmp    $0x80115f88,%ebx
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
80102382:	e8 59 22 00 00       	call   801045e0 <memset>

  if(kmem.use_lock)
80102387:	8b 15 54 30 11 80    	mov    0x80113054,%edx
8010238d:	83 c4 10             	add    $0x10,%esp
80102390:	85 d2                	test   %edx,%edx
80102392:	75 2c                	jne    801023c0 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102394:	a1 58 30 11 80       	mov    0x80113058,%eax
80102399:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010239b:	a1 54 30 11 80       	mov    0x80113054,%eax
  kmem.freelist = r;
801023a0:	89 1d 58 30 11 80    	mov    %ebx,0x80113058
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
801023b0:	c7 45 08 20 30 11 80 	movl   $0x80113020,0x8(%ebp)
}
801023b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ba:	c9                   	leave  
    release(&kmem.lock);
801023bb:	e9 d0 21 00 00       	jmp    80104590 <release>
    acquire(&kmem.lock);
801023c0:	83 ec 0c             	sub    $0xc,%esp
801023c3:	68 20 30 11 80       	push   $0x80113020
801023c8:	e8 03 21 00 00       	call   801044d0 <acquire>
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	eb c2                	jmp    80102394 <kfree+0x44>
    panic("kfree");
801023d2:	83 ec 0c             	sub    $0xc,%esp
801023d5:	68 06 75 10 80       	push   $0x80107506
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
8010243b:	68 0c 75 10 80       	push   $0x8010750c
80102440:	68 20 30 11 80       	push   $0x80113020
80102445:	e8 46 1f 00 00       	call   80104390 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
8010244a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010244d:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
80102450:	c7 05 54 30 11 80 00 	movl   $0x0,0x80113054
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
801024e4:	c7 05 54 30 11 80 01 	movl   $0x1,0x80113054
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
80102500:	a1 54 30 11 80       	mov    0x80113054,%eax
80102505:	85 c0                	test   %eax,%eax
80102507:	75 1f                	jne    80102528 <kalloc+0x28>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102509:	a1 58 30 11 80       	mov    0x80113058,%eax
  if(r)
8010250e:	85 c0                	test   %eax,%eax
80102510:	74 0e                	je     80102520 <kalloc+0x20>
    kmem.freelist = r->next;
80102512:	8b 10                	mov    (%eax),%edx
80102514:	89 15 58 30 11 80    	mov    %edx,0x80113058
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
8010252e:	68 20 30 11 80       	push   $0x80113020
80102533:	e8 98 1f 00 00       	call   801044d0 <acquire>
  r = kmem.freelist;
80102538:	a1 58 30 11 80       	mov    0x80113058,%eax
  if(r)
8010253d:	83 c4 10             	add    $0x10,%esp
80102540:	8b 15 54 30 11 80    	mov    0x80113054,%edx
80102546:	85 c0                	test   %eax,%eax
80102548:	74 08                	je     80102552 <kalloc+0x52>
    kmem.freelist = r->next;
8010254a:	8b 08                	mov    (%eax),%ecx
8010254c:	89 0d 58 30 11 80    	mov    %ecx,0x80113058
  if(kmem.use_lock)
80102552:	85 d2                	test   %edx,%edx
80102554:	74 16                	je     8010256c <kalloc+0x6c>
    release(&kmem.lock);
80102556:	83 ec 0c             	sub    $0xc,%esp
80102559:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010255c:	68 20 30 11 80       	push   $0x80113020
80102561:	e8 2a 20 00 00       	call   80104590 <release>
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
80102587:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx

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
801025b3:	0f b6 82 40 76 10 80 	movzbl -0x7fef89c0(%edx),%eax
801025ba:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
801025bc:	0f b6 82 40 75 10 80 	movzbl -0x7fef8ac0(%edx),%eax
801025c3:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801025c5:	89 c8                	mov    %ecx,%eax
  shift ^= togglecode[data];
801025c7:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
801025cd:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801025d0:	83 e1 08             	and    $0x8,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801025d3:	8b 04 85 20 75 10 80 	mov    -0x7fef8ae0(,%eax,4),%eax
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
801025f8:	0f b6 82 40 76 10 80 	movzbl -0x7fef89c0(%edx),%eax
801025ff:	83 c8 40             	or     $0x40,%eax
80102602:	0f b6 c0             	movzbl %al,%eax
80102605:	f7 d0                	not    %eax
80102607:	21 c1                	and    %eax,%ecx
    return 0;
80102609:	31 c0                	xor    %eax,%eax
    shift &= ~(shiftcode[data] | E0ESC);
8010260b:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
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
8010261d:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
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
80102670:	a1 5c 30 11 80       	mov    0x8011305c,%eax
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
80102770:	8b 15 5c 30 11 80    	mov    0x8011305c,%edx
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
80102790:	a1 5c 30 11 80       	mov    0x8011305c,%eax
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
801027fe:	a1 5c 30 11 80       	mov    0x8011305c,%eax
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
80102977:	e8 b4 1c 00 00       	call   80104630 <memcmp>
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
80102a90:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
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
80102ab0:	a1 94 30 11 80       	mov    0x80113094,%eax
80102ab5:	83 ec 08             	sub    $0x8,%esp
80102ab8:	01 d8                	add    %ebx,%eax
80102aba:	83 c0 01             	add    $0x1,%eax
80102abd:	50                   	push   %eax
80102abe:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102ac4:	e8 07 d6 ff ff       	call   801000d0 <bread>
80102ac9:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102acb:	58                   	pop    %eax
80102acc:	5a                   	pop    %edx
80102acd:	ff 34 9d ac 30 11 80 	pushl  -0x7feecf54(,%ebx,4)
80102ad4:	ff 35 a4 30 11 80    	pushl  0x801130a4
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
80102af4:	e8 97 1b 00 00       	call   80104690 <memmove>
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
80102b14:	39 1d a8 30 11 80    	cmp    %ebx,0x801130a8
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
80102b38:	ff 35 94 30 11 80    	pushl  0x80113094
80102b3e:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102b44:	e8 87 d5 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102b49:	8b 1d a8 30 11 80    	mov    0x801130a8,%ebx
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
80102b60:	8b 8a ac 30 11 80    	mov    -0x7feecf54(%edx),%ecx
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
80102b9a:	68 40 77 10 80       	push   $0x80107740
80102b9f:	68 60 30 11 80       	push   $0x80113060
80102ba4:	e8 e7 17 00 00       	call   80104390 <initlock>
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
80102bbc:	89 1d a4 30 11 80    	mov    %ebx,0x801130a4
  log.size = sb.nlog;
80102bc2:	89 15 98 30 11 80    	mov    %edx,0x80113098
  log.start = sb.logstart;
80102bc8:	a3 94 30 11 80       	mov    %eax,0x80113094
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
80102bdd:	89 1d a8 30 11 80    	mov    %ebx,0x801130a8
  for (i = 0; i < log.lh.n; i++) {
80102be3:	7e 1c                	jle    80102c01 <initlog+0x71>
80102be5:	c1 e3 02             	shl    $0x2,%ebx
80102be8:	31 d2                	xor    %edx,%edx
80102bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    log.lh.block[i] = lh->block[i];
80102bf0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102bf4:	83 c2 04             	add    $0x4,%edx
80102bf7:	89 8a a8 30 11 80    	mov    %ecx,-0x7feecf58(%edx)
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
80102c0f:	c7 05 a8 30 11 80 00 	movl   $0x0,0x801130a8
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
80102c36:	68 60 30 11 80       	push   $0x80113060
80102c3b:	e8 90 18 00 00       	call   801044d0 <acquire>
80102c40:	83 c4 10             	add    $0x10,%esp
80102c43:	eb 18                	jmp    80102c5d <begin_op+0x2d>
80102c45:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102c48:	83 ec 08             	sub    $0x8,%esp
80102c4b:	68 60 30 11 80       	push   $0x80113060
80102c50:	68 60 30 11 80       	push   $0x80113060
80102c55:	e8 96 12 00 00       	call   80103ef0 <sleep>
80102c5a:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102c5d:	a1 a0 30 11 80       	mov    0x801130a0,%eax
80102c62:	85 c0                	test   %eax,%eax
80102c64:	75 e2                	jne    80102c48 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102c66:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102c6b:	8b 15 a8 30 11 80    	mov    0x801130a8,%edx
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
80102c82:	a3 9c 30 11 80       	mov    %eax,0x8011309c
      release(&log.lock);
80102c87:	68 60 30 11 80       	push   $0x80113060
80102c8c:	e8 ff 18 00 00       	call   80104590 <release>
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
80102ca9:	68 60 30 11 80       	push   $0x80113060
80102cae:	e8 1d 18 00 00       	call   801044d0 <acquire>
  log.outstanding -= 1;
80102cb3:	a1 9c 30 11 80       	mov    0x8011309c,%eax
  if(log.committing)
80102cb8:	8b 35 a0 30 11 80    	mov    0x801130a0,%esi
80102cbe:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102cc1:	8d 58 ff             	lea    -0x1(%eax),%ebx
  if(log.committing)
80102cc4:	85 f6                	test   %esi,%esi
  log.outstanding -= 1;
80102cc6:	89 1d 9c 30 11 80    	mov    %ebx,0x8011309c
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
80102cdd:	c7 05 a0 30 11 80 01 	movl   $0x1,0x801130a0
80102ce4:	00 00 00 
  release(&log.lock);
80102ce7:	68 60 30 11 80       	push   $0x80113060
80102cec:	e8 9f 18 00 00       	call   80104590 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102cf1:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102cf7:	83 c4 10             	add    $0x10,%esp
80102cfa:	85 c9                	test   %ecx,%ecx
80102cfc:	0f 8e 85 00 00 00    	jle    80102d87 <end_op+0xe7>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102d02:	a1 94 30 11 80       	mov    0x80113094,%eax
80102d07:	83 ec 08             	sub    $0x8,%esp
80102d0a:	01 d8                	add    %ebx,%eax
80102d0c:	83 c0 01             	add    $0x1,%eax
80102d0f:	50                   	push   %eax
80102d10:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102d16:	e8 b5 d3 ff ff       	call   801000d0 <bread>
80102d1b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102d1d:	58                   	pop    %eax
80102d1e:	5a                   	pop    %edx
80102d1f:	ff 34 9d ac 30 11 80 	pushl  -0x7feecf54(,%ebx,4)
80102d26:	ff 35 a4 30 11 80    	pushl  0x801130a4
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
80102d46:	e8 45 19 00 00       	call   80104690 <memmove>
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
80102d66:	3b 1d a8 30 11 80    	cmp    0x801130a8,%ebx
80102d6c:	7c 94                	jl     80102d02 <end_op+0x62>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102d6e:	e8 bd fd ff ff       	call   80102b30 <write_head>
    install_trans(); // Now install writes to home locations
80102d73:	e8 18 fd ff ff       	call   80102a90 <install_trans>
    log.lh.n = 0;
80102d78:	c7 05 a8 30 11 80 00 	movl   $0x0,0x801130a8
80102d7f:	00 00 00 
    write_head();    // Erase the transaction from the log
80102d82:	e8 a9 fd ff ff       	call   80102b30 <write_head>
    acquire(&log.lock);
80102d87:	83 ec 0c             	sub    $0xc,%esp
80102d8a:	68 60 30 11 80       	push   $0x80113060
80102d8f:	e8 3c 17 00 00       	call   801044d0 <acquire>
    wakeup(&log);
80102d94:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
    log.committing = 0;
80102d9b:	c7 05 a0 30 11 80 00 	movl   $0x0,0x801130a0
80102da2:	00 00 00 
    wakeup(&log);
80102da5:	e8 f6 12 00 00       	call   801040a0 <wakeup>
    release(&log.lock);
80102daa:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102db1:	e8 da 17 00 00       	call   80104590 <release>
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
80102dcb:	68 60 30 11 80       	push   $0x80113060
80102dd0:	e8 cb 12 00 00       	call   801040a0 <wakeup>
  release(&log.lock);
80102dd5:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102ddc:	e8 af 17 00 00       	call   80104590 <release>
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
80102def:	68 44 77 10 80       	push   $0x80107744
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
80102e07:	8b 15 a8 30 11 80    	mov    0x801130a8,%edx
{
80102e0d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102e10:	83 fa 1d             	cmp    $0x1d,%edx
80102e13:	0f 8f 9d 00 00 00    	jg     80102eb6 <log_write+0xb6>
80102e19:	a1 98 30 11 80       	mov    0x80113098,%eax
80102e1e:	83 e8 01             	sub    $0x1,%eax
80102e21:	39 c2                	cmp    %eax,%edx
80102e23:	0f 8d 8d 00 00 00    	jge    80102eb6 <log_write+0xb6>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102e29:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102e2e:	85 c0                	test   %eax,%eax
80102e30:	0f 8e 8d 00 00 00    	jle    80102ec3 <log_write+0xc3>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	68 60 30 11 80       	push   $0x80113060
80102e3e:	e8 8d 16 00 00       	call   801044d0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102e43:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102e49:	83 c4 10             	add    $0x10,%esp
80102e4c:	83 f9 00             	cmp    $0x0,%ecx
80102e4f:	7e 57                	jle    80102ea8 <log_write+0xa8>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e51:	8b 53 08             	mov    0x8(%ebx),%edx
  for (i = 0; i < log.lh.n; i++) {
80102e54:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e56:	3b 15 ac 30 11 80    	cmp    0x801130ac,%edx
80102e5c:	75 0b                	jne    80102e69 <log_write+0x69>
80102e5e:	eb 38                	jmp    80102e98 <log_write+0x98>
80102e60:	39 14 85 ac 30 11 80 	cmp    %edx,-0x7feecf54(,%eax,4)
80102e67:	74 2f                	je     80102e98 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80102e69:	83 c0 01             	add    $0x1,%eax
80102e6c:	39 c1                	cmp    %eax,%ecx
80102e6e:	75 f0                	jne    80102e60 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80102e70:	89 14 85 ac 30 11 80 	mov    %edx,-0x7feecf54(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
80102e77:	83 c0 01             	add    $0x1,%eax
80102e7a:	a3 a8 30 11 80       	mov    %eax,0x801130a8
  b->flags |= B_DIRTY; // prevent eviction
80102e7f:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102e82:	c7 45 08 60 30 11 80 	movl   $0x80113060,0x8(%ebp)
}
80102e89:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e8c:	c9                   	leave  
  release(&log.lock);
80102e8d:	e9 fe 16 00 00       	jmp    80104590 <release>
80102e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80102e98:	89 14 85 ac 30 11 80 	mov    %edx,-0x7feecf54(,%eax,4)
80102e9f:	eb de                	jmp    80102e7f <log_write+0x7f>
80102ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ea8:	8b 43 08             	mov    0x8(%ebx),%eax
80102eab:	a3 ac 30 11 80       	mov    %eax,0x801130ac
  if (i == log.lh.n)
80102eb0:	75 cd                	jne    80102e7f <log_write+0x7f>
80102eb2:	31 c0                	xor    %eax,%eax
80102eb4:	eb c1                	jmp    80102e77 <log_write+0x77>
    panic("too big a transaction");
80102eb6:	83 ec 0c             	sub    $0xc,%esp
80102eb9:	68 53 77 10 80       	push   $0x80107753
80102ebe:	e8 cd d4 ff ff       	call   80100390 <panic>
    panic("log_write outside of trans");
80102ec3:	83 ec 0c             	sub    $0xc,%esp
80102ec6:	68 69 77 10 80       	push   $0x80107769
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
80102ed7:	e8 94 09 00 00       	call   80103870 <cpuid>
80102edc:	89 c3                	mov    %eax,%ebx
80102ede:	e8 8d 09 00 00       	call   80103870 <cpuid>
80102ee3:	83 ec 04             	sub    $0x4,%esp
80102ee6:	53                   	push   %ebx
80102ee7:	50                   	push   %eax
80102ee8:	68 84 77 10 80       	push   $0x80107784
80102eed:	e8 6e d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102ef2:	e8 f9 29 00 00       	call   801058f0 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102ef7:	e8 f4 08 00 00       	call   801037f0 <mycpu>
80102efc:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102efe:	b8 01 00 00 00       	mov    $0x1,%eax
80102f03:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102f0a:	e8 71 0c 00 00       	call   80103b80 <scheduler>
80102f0f:	90                   	nop

80102f10 <mpenter>:
{
80102f10:	55                   	push   %ebp
80102f11:	89 e5                	mov    %esp,%ebp
80102f13:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102f16:	e8 c5 3a 00 00       	call   801069e0 <switchkvm>
  seginit();
80102f1b:	e8 30 3a 00 00       	call   80106950 <seginit>
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
80102f47:	68 88 5f 11 80       	push   $0x80115f88
80102f4c:	e8 df f4 ff ff       	call   80102430 <kinit1>
  kvmalloc();      // kernel page table
80102f51:	e8 5a 3f 00 00       	call   80106eb0 <kvmalloc>
  mpinit();        // detect other processors
80102f56:	e8 75 01 00 00       	call   801030d0 <mpinit>
  lapicinit();     // interrupt controller
80102f5b:	e8 10 f7 ff ff       	call   80102670 <lapicinit>
  seginit();       // segment descriptors
80102f60:	e8 eb 39 00 00       	call   80106950 <seginit>
  picinit();       // disable pic
80102f65:	e8 46 03 00 00       	call   801032b0 <picinit>
  ioapicinit();    // another interrupt controller
80102f6a:	e8 f1 f2 ff ff       	call   80102260 <ioapicinit>
  consoleinit();   // console hardware
80102f6f:	e8 8c da ff ff       	call   80100a00 <consoleinit>
  uartinit();      // serial port
80102f74:	e8 a7 2c 00 00       	call   80105c20 <uartinit>
  pinit();         // process table
80102f79:	e8 42 08 00 00       	call   801037c0 <pinit>
  tvinit();        // trap vectors
80102f7e:	e8 ed 28 00 00       	call   80105870 <tvinit>
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
80102f9a:	68 90 a4 10 80       	push   $0x8010a490
80102f9f:	68 00 70 00 80       	push   $0x80007000
80102fa4:	e8 e7 16 00 00       	call   80104690 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102fa9:	69 05 e0 36 11 80 b0 	imul   $0xb0,0x801136e0,%eax
80102fb0:	00 00 00 
80102fb3:	83 c4 10             	add    $0x10,%esp
80102fb6:	05 60 31 11 80       	add    $0x80113160,%eax
80102fbb:	3d 60 31 11 80       	cmp    $0x80113160,%eax
80102fc0:	76 71                	jbe    80103033 <main+0x103>
80102fc2:	bb 60 31 11 80       	mov    $0x80113160,%ebx
80102fc7:	89 f6                	mov    %esi,%esi
80102fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == mycpu())  // We've started already.
80102fd0:	e8 1b 08 00 00       	call   801037f0 <mycpu>
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
80102fed:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102ff4:	90 10 00 
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
8010301a:	69 05 e0 36 11 80 b0 	imul   $0xb0,0x801136e0,%eax
80103021:	00 00 00 
80103024:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
8010302a:	05 60 31 11 80       	add    $0x80113160,%eax
8010302f:	39 c3                	cmp    %eax,%ebx
80103031:	72 9d                	jb     80102fd0 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103033:	83 ec 08             	sub    $0x8,%esp
80103036:	68 00 00 00 8e       	push   $0x8e000000
8010303b:	68 00 00 40 80       	push   $0x80400000
80103040:	e8 5b f4 ff ff       	call   801024a0 <kinit2>
  userinit();      // first user process
80103045:	e8 76 08 00 00       	call   801038c0 <userinit>
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
8010307e:	68 98 77 10 80       	push   $0x80107798
80103083:	56                   	push   %esi
80103084:	e8 a7 15 00 00       	call   80104630 <memcmp>
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
8010313c:	68 b5 77 10 80       	push   $0x801077b5
80103141:	56                   	push   %esi
80103142:	e8 e9 14 00 00       	call   80104630 <memcmp>
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
801031a7:	a3 5c 30 11 80       	mov    %eax,0x8011305c
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
801031d0:	ff 24 95 dc 77 10 80 	jmp    *-0x7fef8824(,%edx,4)
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
80103218:	8b 0d e0 36 11 80    	mov    0x801136e0,%ecx
8010321e:	83 f9 07             	cmp    $0x7,%ecx
80103221:	7f 19                	jg     8010323c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103223:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103227:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010322d:	83 c1 01             	add    $0x1,%ecx
80103230:	89 0d e0 36 11 80    	mov    %ecx,0x801136e0
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103236:	88 97 60 31 11 80    	mov    %dl,-0x7feecea0(%edi)
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
8010324f:	88 15 40 31 11 80    	mov    %dl,0x80113140
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
80103283:	68 9d 77 10 80       	push   $0x8010779d
80103288:	e8 03 d1 ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
8010328d:	83 ec 0c             	sub    $0xc,%esp
80103290:	68 bc 77 10 80       	push   $0x801077bc
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
8010338b:	68 f0 77 10 80       	push   $0x801077f0
80103390:	50                   	push   %eax
80103391:	e8 fa 0f 00 00       	call   80104390 <initlock>
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
801033ef:	e8 dc 10 00 00       	call   801044d0 <acquire>
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
8010340f:	e8 8c 0c 00 00       	call   801040a0 <wakeup>
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
80103434:	e9 57 11 00 00       	jmp    80104590 <release>
80103439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
80103440:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103446:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
80103449:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103450:	00 00 00 
    wakeup(&p->nwrite);
80103453:	50                   	push   %eax
80103454:	e8 47 0c 00 00       	call   801040a0 <wakeup>
80103459:	83 c4 10             	add    $0x10,%esp
8010345c:	eb b9                	jmp    80103417 <pipeclose+0x37>
8010345e:	66 90                	xchg   %ax,%ax
    release(&p->lock);
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	53                   	push   %ebx
80103464:	e8 27 11 00 00       	call   80104590 <release>
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
8010348d:	e8 3e 10 00 00       	call   801044d0 <acquire>
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
801034e4:	e8 b7 0b 00 00       	call   801040a0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801034e9:	5a                   	pop    %edx
801034ea:	59                   	pop    %ecx
801034eb:	53                   	push   %ebx
801034ec:	56                   	push   %esi
801034ed:	e8 fe 09 00 00       	call   80103ef0 <sleep>
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
80103514:	e8 77 03 00 00       	call   80103890 <myproc>
80103519:	8b 40 24             	mov    0x24(%eax),%eax
8010351c:	85 c0                	test   %eax,%eax
8010351e:	74 c0                	je     801034e0 <pipewrite+0x60>
        release(&p->lock);
80103520:	83 ec 0c             	sub    $0xc,%esp
80103523:	53                   	push   %ebx
80103524:	e8 67 10 00 00       	call   80104590 <release>
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
80103573:	e8 28 0b 00 00       	call   801040a0 <wakeup>
  release(&p->lock);
80103578:	89 1c 24             	mov    %ebx,(%esp)
8010357b:	e8 10 10 00 00       	call   80104590 <release>
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
801035a0:	e8 2b 0f 00 00       	call   801044d0 <acquire>
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
801035d5:	e8 16 09 00 00       	call   80103ef0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801035da:	83 c4 10             	add    $0x10,%esp
801035dd:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035e3:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035e9:	75 35                	jne    80103620 <piperead+0x90>
801035eb:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
801035f1:	85 d2                	test   %edx,%edx
801035f3:	0f 84 8f 00 00 00    	je     80103688 <piperead+0xf8>
    if(myproc()->killed){
801035f9:	e8 92 02 00 00       	call   80103890 <myproc>
801035fe:	8b 48 24             	mov    0x24(%eax),%ecx
80103601:	85 c9                	test   %ecx,%ecx
80103603:	74 cb                	je     801035d0 <piperead+0x40>
      release(&p->lock);
80103605:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103608:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
8010360d:	56                   	push   %esi
8010360e:	e8 7d 0f 00 00       	call   80104590 <release>
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
80103667:	e8 34 0a 00 00       	call   801040a0 <wakeup>
  release(&p->lock);
8010366c:	89 34 24             	mov    %esi,(%esp)
8010366f:	e8 1c 0f 00 00       	call   80104590 <release>
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
80103694:	bb 34 37 11 80       	mov    $0x80113734,%ebx
{
80103699:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010369c:	68 00 37 11 80       	push   $0x80113700
801036a1:	e8 2a 0e 00 00       	call   801044d0 <acquire>
801036a6:	83 c4 10             	add    $0x10,%esp
801036a9:	eb 14                	jmp    801036bf <allocproc+0x2f>
801036ab:	90                   	nop
801036ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036b0:	83 eb 80             	sub    $0xffffff80,%ebx
801036b3:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
801036b9:	0f 83 81 00 00 00    	jae    80103740 <allocproc+0xb0>
    if(p->state == UNUSED)
801036bf:	8b 43 0c             	mov    0xc(%ebx),%eax
801036c2:	85 c0                	test   %eax,%eax
801036c4:	75 ea                	jne    801036b0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036c6:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  p->tickets = 10;
  release(&ptable.lock);
801036cb:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
801036ce:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->tickets = 10;
801036d5:	c7 43 7c 0a 00 00 00 	movl   $0xa,0x7c(%ebx)
  p->pid = nextpid++;
801036dc:	8d 50 01             	lea    0x1(%eax),%edx
801036df:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
801036e2:	68 00 37 11 80       	push   $0x80113700
  p->pid = nextpid++;
801036e7:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
801036ed:	e8 9e 0e 00 00       	call   80104590 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801036f2:	e8 09 ee ff ff       	call   80102500 <kalloc>
801036f7:	83 c4 10             	add    $0x10,%esp
801036fa:	85 c0                	test   %eax,%eax
801036fc:	89 43 08             	mov    %eax,0x8(%ebx)
801036ff:	74 58                	je     80103759 <allocproc+0xc9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103701:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103707:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010370a:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010370f:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
80103712:	c7 40 14 61 58 10 80 	movl   $0x80105861,0x14(%eax)
  p->context = (struct context*)sp;
80103719:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010371c:	6a 14                	push   $0x14
8010371e:	6a 00                	push   $0x0
80103720:	50                   	push   %eax
80103721:	e8 ba 0e 00 00       	call   801045e0 <memset>
  p->context->eip = (uint)forkret;
80103726:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103729:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
8010372c:	c7 40 10 70 37 10 80 	movl   $0x80103770,0x10(%eax)
}
80103733:	89 d8                	mov    %ebx,%eax
80103735:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103738:	c9                   	leave  
80103739:	c3                   	ret    
8010373a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80103740:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103743:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103745:	68 00 37 11 80       	push   $0x80113700
8010374a:	e8 41 0e 00 00       	call   80104590 <release>
}
8010374f:	89 d8                	mov    %ebx,%eax
  return 0;
80103751:	83 c4 10             	add    $0x10,%esp
}
80103754:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103757:	c9                   	leave  
80103758:	c3                   	ret    
    p->state = UNUSED;
80103759:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103760:	31 db                	xor    %ebx,%ebx
80103762:	eb cf                	jmp    80103733 <allocproc+0xa3>
80103764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010376a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103770 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103770:	55                   	push   %ebp
80103771:	89 e5                	mov    %esp,%ebp
80103773:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103776:	68 00 37 11 80       	push   $0x80113700
8010377b:	e8 10 0e 00 00       	call   80104590 <release>

  if (first) {
80103780:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103785:	83 c4 10             	add    $0x10,%esp
80103788:	85 c0                	test   %eax,%eax
8010378a:	75 04                	jne    80103790 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010378c:	c9                   	leave  
8010378d:	c3                   	ret    
8010378e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
80103790:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
80103793:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010379a:	00 00 00 
    iinit(ROOTDEV);
8010379d:	6a 01                	push   $0x1
8010379f:	e8 1c dd ff ff       	call   801014c0 <iinit>
    initlog(ROOTDEV);
801037a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801037ab:	e8 e0 f3 ff ff       	call   80102b90 <initlog>
801037b0:	83 c4 10             	add    $0x10,%esp
}
801037b3:	c9                   	leave  
801037b4:	c3                   	ret    
801037b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037c0 <pinit>:
{
801037c0:	55                   	push   %ebp
801037c1:	89 e5                	mov    %esp,%ebp
801037c3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801037c6:	68 f5 77 10 80       	push   $0x801077f5
801037cb:	68 00 37 11 80       	push   $0x80113700
801037d0:	e8 bb 0b 00 00       	call   80104390 <initlock>
  sgenrand(unixtime());
801037d5:	e8 66 f2 ff ff       	call   80102a40 <unixtime>
801037da:	89 04 24             	mov    %eax,(%esp)
801037dd:	e8 ee 38 00 00       	call   801070d0 <sgenrand>
}
801037e2:	83 c4 10             	add    $0x10,%esp
801037e5:	c9                   	leave  
801037e6:	c3                   	ret    
801037e7:	89 f6                	mov    %esi,%esi
801037e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037f0 <mycpu>:
{
801037f0:	55                   	push   %ebp
801037f1:	89 e5                	mov    %esp,%ebp
801037f3:	56                   	push   %esi
801037f4:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801037f5:	9c                   	pushf  
801037f6:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801037f7:	f6 c4 02             	test   $0x2,%ah
801037fa:	75 5e                	jne    8010385a <mycpu+0x6a>
  apicid = lapicid();
801037fc:	e8 6f ef ff ff       	call   80102770 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103801:	8b 35 e0 36 11 80    	mov    0x801136e0,%esi
80103807:	85 f6                	test   %esi,%esi
80103809:	7e 42                	jle    8010384d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010380b:	0f b6 15 60 31 11 80 	movzbl 0x80113160,%edx
80103812:	39 d0                	cmp    %edx,%eax
80103814:	74 30                	je     80103846 <mycpu+0x56>
80103816:	b9 10 32 11 80       	mov    $0x80113210,%ecx
  for (i = 0; i < ncpu; ++i) {
8010381b:	31 d2                	xor    %edx,%edx
8010381d:	8d 76 00             	lea    0x0(%esi),%esi
80103820:	83 c2 01             	add    $0x1,%edx
80103823:	39 f2                	cmp    %esi,%edx
80103825:	74 26                	je     8010384d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
80103827:	0f b6 19             	movzbl (%ecx),%ebx
8010382a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103830:	39 c3                	cmp    %eax,%ebx
80103832:	75 ec                	jne    80103820 <mycpu+0x30>
80103834:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010383a:	05 60 31 11 80       	add    $0x80113160,%eax
}
8010383f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103842:	5b                   	pop    %ebx
80103843:	5e                   	pop    %esi
80103844:	5d                   	pop    %ebp
80103845:	c3                   	ret    
    if (cpus[i].apicid == apicid)
80103846:	b8 60 31 11 80       	mov    $0x80113160,%eax
      return &cpus[i];
8010384b:	eb f2                	jmp    8010383f <mycpu+0x4f>
  panic("unknown apicid\n");
8010384d:	83 ec 0c             	sub    $0xc,%esp
80103850:	68 fc 77 10 80       	push   $0x801077fc
80103855:	e8 36 cb ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
8010385a:	83 ec 0c             	sub    $0xc,%esp
8010385d:	68 dc 78 10 80       	push   $0x801078dc
80103862:	e8 29 cb ff ff       	call   80100390 <panic>
80103867:	89 f6                	mov    %esi,%esi
80103869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103870 <cpuid>:
cpuid() {
80103870:	55                   	push   %ebp
80103871:	89 e5                	mov    %esp,%ebp
80103873:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103876:	e8 75 ff ff ff       	call   801037f0 <mycpu>
8010387b:	2d 60 31 11 80       	sub    $0x80113160,%eax
}
80103880:	c9                   	leave  
  return mycpu()-cpus;
80103881:	c1 f8 04             	sar    $0x4,%eax
80103884:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010388a:	c3                   	ret    
8010388b:	90                   	nop
8010388c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103890 <myproc>:
myproc(void) {
80103890:	55                   	push   %ebp
80103891:	89 e5                	mov    %esp,%ebp
80103893:	53                   	push   %ebx
80103894:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103897:	e8 64 0b 00 00       	call   80104400 <pushcli>
  c = mycpu();
8010389c:	e8 4f ff ff ff       	call   801037f0 <mycpu>
  p = c->proc;
801038a1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038a7:	e8 94 0b 00 00       	call   80104440 <popcli>
}
801038ac:	83 c4 04             	add    $0x4,%esp
801038af:	89 d8                	mov    %ebx,%eax
801038b1:	5b                   	pop    %ebx
801038b2:	5d                   	pop    %ebp
801038b3:	c3                   	ret    
801038b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801038c0 <userinit>:
{
801038c0:	55                   	push   %ebp
801038c1:	89 e5                	mov    %esp,%ebp
801038c3:	53                   	push   %ebx
801038c4:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
801038c7:	e8 c4 fd ff ff       	call   80103690 <allocproc>
801038cc:	89 c3                	mov    %eax,%ebx
  initproc = p;
801038ce:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
801038d3:	e8 58 35 00 00       	call   80106e30 <setupkvm>
801038d8:	85 c0                	test   %eax,%eax
801038da:	89 43 04             	mov    %eax,0x4(%ebx)
801038dd:	0f 84 bd 00 00 00    	je     801039a0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801038e3:	83 ec 04             	sub    $0x4,%esp
801038e6:	68 2c 00 00 00       	push   $0x2c
801038eb:	68 64 a4 10 80       	push   $0x8010a464
801038f0:	50                   	push   %eax
801038f1:	e8 1a 32 00 00       	call   80106b10 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
801038f6:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
801038f9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801038ff:	6a 4c                	push   $0x4c
80103901:	6a 00                	push   $0x0
80103903:	ff 73 18             	pushl  0x18(%ebx)
80103906:	e8 d5 0c 00 00       	call   801045e0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010390b:	8b 43 18             	mov    0x18(%ebx),%eax
8010390e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103913:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103918:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010391b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010391f:	8b 43 18             	mov    0x18(%ebx),%eax
80103922:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103926:	8b 43 18             	mov    0x18(%ebx),%eax
80103929:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010392d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103931:	8b 43 18             	mov    0x18(%ebx),%eax
80103934:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103938:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010393c:	8b 43 18             	mov    0x18(%ebx),%eax
8010393f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103946:	8b 43 18             	mov    0x18(%ebx),%eax
80103949:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103950:	8b 43 18             	mov    0x18(%ebx),%eax
80103953:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010395a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010395d:	6a 10                	push   $0x10
8010395f:	68 25 78 10 80       	push   $0x80107825
80103964:	50                   	push   %eax
80103965:	e8 56 0e 00 00       	call   801047c0 <safestrcpy>
  p->cwd = namei("/");
8010396a:	c7 04 24 2e 78 10 80 	movl   $0x8010782e,(%esp)
80103971:	e8 aa e5 ff ff       	call   80101f20 <namei>
80103976:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103979:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103980:	e8 4b 0b 00 00       	call   801044d0 <acquire>
  p->state = RUNNABLE;
80103985:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010398c:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103993:	e8 f8 0b 00 00       	call   80104590 <release>
}
80103998:	83 c4 10             	add    $0x10,%esp
8010399b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010399e:	c9                   	leave  
8010399f:	c3                   	ret    
    panic("userinit: out of memory?");
801039a0:	83 ec 0c             	sub    $0xc,%esp
801039a3:	68 0c 78 10 80       	push   $0x8010780c
801039a8:	e8 e3 c9 ff ff       	call   80100390 <panic>
801039ad:	8d 76 00             	lea    0x0(%esi),%esi

801039b0 <growproc>:
{
801039b0:	55                   	push   %ebp
801039b1:	89 e5                	mov    %esp,%ebp
801039b3:	56                   	push   %esi
801039b4:	53                   	push   %ebx
801039b5:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
801039b8:	e8 43 0a 00 00       	call   80104400 <pushcli>
  c = mycpu();
801039bd:	e8 2e fe ff ff       	call   801037f0 <mycpu>
  p = c->proc;
801039c2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801039c8:	e8 73 0a 00 00       	call   80104440 <popcli>
  if(n > 0){
801039cd:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
801039d0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801039d2:	7f 1c                	jg     801039f0 <growproc+0x40>
  } else if(n < 0){
801039d4:	75 3a                	jne    80103a10 <growproc+0x60>
  switchuvm(curproc);
801039d6:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
801039d9:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801039db:	53                   	push   %ebx
801039dc:	e8 1f 30 00 00       	call   80106a00 <switchuvm>
  return 0;
801039e1:	83 c4 10             	add    $0x10,%esp
801039e4:	31 c0                	xor    %eax,%eax
}
801039e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039e9:	5b                   	pop    %ebx
801039ea:	5e                   	pop    %esi
801039eb:	5d                   	pop    %ebp
801039ec:	c3                   	ret    
801039ed:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801039f0:	83 ec 04             	sub    $0x4,%esp
801039f3:	01 c6                	add    %eax,%esi
801039f5:	56                   	push   %esi
801039f6:	50                   	push   %eax
801039f7:	ff 73 04             	pushl  0x4(%ebx)
801039fa:	e8 51 32 00 00       	call   80106c50 <allocuvm>
801039ff:	83 c4 10             	add    $0x10,%esp
80103a02:	85 c0                	test   %eax,%eax
80103a04:	75 d0                	jne    801039d6 <growproc+0x26>
      return -1;
80103a06:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a0b:	eb d9                	jmp    801039e6 <growproc+0x36>
80103a0d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a10:	83 ec 04             	sub    $0x4,%esp
80103a13:	01 c6                	add    %eax,%esi
80103a15:	56                   	push   %esi
80103a16:	50                   	push   %eax
80103a17:	ff 73 04             	pushl  0x4(%ebx)
80103a1a:	e8 61 33 00 00       	call   80106d80 <deallocuvm>
80103a1f:	83 c4 10             	add    $0x10,%esp
80103a22:	85 c0                	test   %eax,%eax
80103a24:	75 b0                	jne    801039d6 <growproc+0x26>
80103a26:	eb de                	jmp    80103a06 <growproc+0x56>
80103a28:	90                   	nop
80103a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103a30 <fork>:
{
80103a30:	55                   	push   %ebp
80103a31:	89 e5                	mov    %esp,%ebp
80103a33:	57                   	push   %edi
80103a34:	56                   	push   %esi
80103a35:	53                   	push   %ebx
80103a36:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103a39:	e8 c2 09 00 00       	call   80104400 <pushcli>
  c = mycpu();
80103a3e:	e8 ad fd ff ff       	call   801037f0 <mycpu>
  p = c->proc;
80103a43:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a49:	e8 f2 09 00 00       	call   80104440 <popcli>
  if((np = allocproc()) == 0){
80103a4e:	e8 3d fc ff ff       	call   80103690 <allocproc>
80103a53:	85 c0                	test   %eax,%eax
80103a55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a58:	0f 84 b7 00 00 00    	je     80103b15 <fork+0xe5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103a5e:	83 ec 08             	sub    $0x8,%esp
80103a61:	ff 33                	pushl  (%ebx)
80103a63:	ff 73 04             	pushl  0x4(%ebx)
80103a66:	89 c7                	mov    %eax,%edi
80103a68:	e8 93 34 00 00       	call   80106f00 <copyuvm>
80103a6d:	83 c4 10             	add    $0x10,%esp
80103a70:	85 c0                	test   %eax,%eax
80103a72:	89 47 04             	mov    %eax,0x4(%edi)
80103a75:	0f 84 a1 00 00 00    	je     80103b1c <fork+0xec>
  np->sz = curproc->sz;
80103a7b:	8b 03                	mov    (%ebx),%eax
80103a7d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103a80:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103a82:	89 59 14             	mov    %ebx,0x14(%ecx)
80103a85:	89 c8                	mov    %ecx,%eax
  *np->tf = *curproc->tf;
80103a87:	8b 79 18             	mov    0x18(%ecx),%edi
80103a8a:	8b 73 18             	mov    0x18(%ebx),%esi
80103a8d:	b9 13 00 00 00       	mov    $0x13,%ecx
80103a92:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103a94:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103a96:	8b 40 18             	mov    0x18(%eax),%eax
80103a99:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if(curproc->ofile[i])
80103aa0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103aa4:	85 c0                	test   %eax,%eax
80103aa6:	74 13                	je     80103abb <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103aa8:	83 ec 0c             	sub    $0xc,%esp
80103aab:	50                   	push   %eax
80103aac:	e8 7f d3 ff ff       	call   80100e30 <filedup>
80103ab1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ab4:	83 c4 10             	add    $0x10,%esp
80103ab7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103abb:	83 c6 01             	add    $0x1,%esi
80103abe:	83 fe 10             	cmp    $0x10,%esi
80103ac1:	75 dd                	jne    80103aa0 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103ac3:	83 ec 0c             	sub    $0xc,%esp
80103ac6:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103ac9:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103acc:	e8 bf db ff ff       	call   80101690 <idup>
80103ad1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103ad4:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103ad7:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103ada:	8d 47 6c             	lea    0x6c(%edi),%eax
80103add:	6a 10                	push   $0x10
80103adf:	53                   	push   %ebx
80103ae0:	50                   	push   %eax
80103ae1:	e8 da 0c 00 00       	call   801047c0 <safestrcpy>
  pid = np->pid;
80103ae6:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103ae9:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103af0:	e8 db 09 00 00       	call   801044d0 <acquire>
  np->state = RUNNABLE;
80103af5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103afc:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b03:	e8 88 0a 00 00       	call   80104590 <release>
  return pid;
80103b08:	83 c4 10             	add    $0x10,%esp
}
80103b0b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b0e:	89 d8                	mov    %ebx,%eax
80103b10:	5b                   	pop    %ebx
80103b11:	5e                   	pop    %esi
80103b12:	5f                   	pop    %edi
80103b13:	5d                   	pop    %ebp
80103b14:	c3                   	ret    
    return -1;
80103b15:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b1a:	eb ef                	jmp    80103b0b <fork+0xdb>
    kfree(np->kstack);
80103b1c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b1f:	83 ec 0c             	sub    $0xc,%esp
80103b22:	ff 73 08             	pushl  0x8(%ebx)
80103b25:	e8 26 e8 ff ff       	call   80102350 <kfree>
    np->kstack = 0;
80103b2a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b31:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103b38:	83 c4 10             	add    $0x10,%esp
80103b3b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b40:	eb c9                	jmp    80103b0b <fork+0xdb>
80103b42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b50 <lottery_total>:
lottery_total(void){
80103b50:	55                   	push   %ebp
  int ticket_aggregate=0;
80103b51:	31 c0                	xor    %eax,%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b53:	ba 34 37 11 80       	mov    $0x80113734,%edx
lottery_total(void){
80103b58:	89 e5                	mov    %esp,%ebp
80103b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p->state==RUNNABLE){
80103b60:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103b64:	75 03                	jne    80103b69 <lottery_total+0x19>
      ticket_aggregate+=p->tickets;
80103b66:	03 42 7c             	add    0x7c(%edx),%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b69:	83 ea 80             	sub    $0xffffff80,%edx
80103b6c:	81 fa 34 57 11 80    	cmp    $0x80115734,%edx
80103b72:	72 ec                	jb     80103b60 <lottery_total+0x10>
}
80103b74:	5d                   	pop    %ebp
80103b75:	c3                   	ret    
80103b76:	8d 76 00             	lea    0x0(%esi),%esi
80103b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b80 <scheduler>:
{
80103b80:	55                   	push   %ebp
80103b81:	89 e5                	mov    %esp,%ebp
80103b83:	57                   	push   %edi
80103b84:	56                   	push   %esi
80103b85:	53                   	push   %ebx
  long counter = 0;
80103b86:	31 ff                	xor    %edi,%edi
  long total_tickets = 0;
80103b88:	31 f6                	xor    %esi,%esi
{
80103b8a:	83 ec 2c             	sub    $0x2c,%esp
  struct cpu *c = mycpu();
80103b8d:	e8 5e fc ff ff       	call   801037f0 <mycpu>
  int got_total = 0; // 0 is False, 1 is True
80103b92:	31 d2                	xor    %edx,%edx
  c->proc = 0;
80103b94:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103b9b:	00 00 00 
  struct cpu *c = mycpu();
80103b9e:	89 45 d8             	mov    %eax,-0x28(%ebp)
80103ba1:	83 c0 04             	add    $0x4,%eax
  int winner_found = 0;
80103ba4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  long winner = 0;
80103bab:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80103bb2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80103bb5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80103bb8:	e9 85 00 00 00       	jmp    80103c42 <scheduler+0xc2>
80103bbd:	8d 76 00             	lea    0x0(%esi),%esi
      if (got_total == 0) {
80103bc0:	85 d2                	test   %edx,%edx
80103bc2:	8b 43 7c             	mov    0x7c(%ebx),%eax
80103bc5:	0f 84 b5 00 00 00    	je     80103c80 <scheduler+0x100>
      counter += p->tickets;
80103bcb:	01 c7                	add    %eax,%edi
      if (counter < winner) {
80103bcd:	39 7d e0             	cmp    %edi,-0x20(%ebp)
80103bd0:	0f 8f aa 00 00 00    	jg     80103c80 <scheduler+0x100>
      if (winner_found) {
80103bd6:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80103bd9:	85 c9                	test   %ecx,%ecx
80103bdb:	0f 85 9f 00 00 00    	jne    80103c80 <scheduler+0x100>
      c->proc = p;
80103be1:	8b 45 d8             	mov    -0x28(%ebp),%eax
      switchuvm(p);
80103be4:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103be7:	89 98 ac 00 00 00    	mov    %ebx,0xac(%eax)
      switchuvm(p);
80103bed:	53                   	push   %ebx
80103bee:	e8 0d 2e 00 00       	call   80106a00 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103bf3:	58                   	pop    %eax
80103bf4:	5a                   	pop    %edx
80103bf5:	ff 73 1c             	pushl  0x1c(%ebx)
80103bf8:	ff 75 d4             	pushl  -0x2c(%ebp)
      p->state = RUNNING;
80103bfb:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&(c->scheduler), p->context);
80103c02:	e8 14 0c 00 00       	call   8010481b <swtch>
      switchkvm();
80103c07:	e8 d4 2d 00 00       	call   801069e0 <switchkvm>
      if (p->state == RUNNABLE) {
80103c0c:	83 c4 10             	add    $0x10,%esp
80103c0f:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c13:	75 09                	jne    80103c1e <scheduler+0x9e>
      winner_found = 1;
80103c15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
            total_tickets += p->tickets;
80103c18:	03 73 7c             	add    0x7c(%ebx),%esi
      winner_found = 1;
80103c1b:	89 45 dc             	mov    %eax,-0x24(%ebp)
      c->proc = 0;
80103c1e:	8b 45 d8             	mov    -0x28(%ebp),%eax
80103c21:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103c28:	00 00 00 
    release(&ptable.lock);
80103c2b:	83 ec 0c             	sub    $0xc,%esp
80103c2e:	68 00 37 11 80       	push   $0x80113700
80103c33:	e8 58 09 00 00       	call   80104590 <release>
    got_total = 1;
80103c38:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    sti();
80103c3f:	83 c4 10             	add    $0x10,%esp
  asm volatile("sti");
80103c42:	fb                   	sti    
    if (got_total == 1) {
80103c43:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
80103c47:	74 47                	je     80103c90 <scheduler+0x110>
    acquire(&ptable.lock);
80103c49:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c4c:	bb 34 37 11 80       	mov    $0x80113734,%ebx
    acquire(&ptable.lock);
80103c51:	68 00 37 11 80       	push   $0x80113700
80103c56:	e8 75 08 00 00       	call   801044d0 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c5b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    acquire(&ptable.lock);
80103c5e:	83 c4 10             	add    $0x10,%esp
80103c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->state != RUNNABLE) {
80103c68:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c6c:	0f 84 4e ff ff ff    	je     80103bc0 <scheduler+0x40>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c72:	83 eb 80             	sub    $0xffffff80,%ebx
80103c75:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
80103c7b:	72 eb                	jb     80103c68 <scheduler+0xe8>
80103c7d:	eb ac                	jmp    80103c2b <scheduler+0xab>
80103c7f:	90                   	nop
80103c80:	83 eb 80             	sub    $0xffffff80,%ebx
            total_tickets += p->tickets;
80103c83:	01 c6                	add    %eax,%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c85:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
80103c8b:	72 db                	jb     80103c68 <scheduler+0xe8>
80103c8d:	eb 9c                	jmp    80103c2b <scheduler+0xab>
80103c8f:	90                   	nop
         winner = random_at_most(total_tickets);
80103c90:	83 ec 0c             	sub    $0xc,%esp
         counter = 0;
80103c93:	31 ff                	xor    %edi,%edi
         winner = random_at_most(total_tickets);
80103c95:	56                   	push   %esi
         total_tickets = 0;
80103c96:	31 f6                	xor    %esi,%esi
         winner = random_at_most(total_tickets);
80103c98:	e8 c3 35 00 00       	call   80107260 <random_at_most>
80103c9d:	83 c4 10             	add    $0x10,%esp
80103ca0:	89 45 e0             	mov    %eax,-0x20(%ebp)
         winner_found = 0;
80103ca3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80103caa:	eb 9d                	jmp    80103c49 <scheduler+0xc9>
80103cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103cb0 <sched>:
{
80103cb0:	55                   	push   %ebp
80103cb1:	89 e5                	mov    %esp,%ebp
80103cb3:	56                   	push   %esi
80103cb4:	53                   	push   %ebx
  pushcli();
80103cb5:	e8 46 07 00 00       	call   80104400 <pushcli>
  c = mycpu();
80103cba:	e8 31 fb ff ff       	call   801037f0 <mycpu>
  p = c->proc;
80103cbf:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103cc5:	e8 76 07 00 00       	call   80104440 <popcli>
  if(!holding(&ptable.lock))
80103cca:	83 ec 0c             	sub    $0xc,%esp
80103ccd:	68 00 37 11 80       	push   $0x80113700
80103cd2:	e8 c9 07 00 00       	call   801044a0 <holding>
80103cd7:	83 c4 10             	add    $0x10,%esp
80103cda:	85 c0                	test   %eax,%eax
80103cdc:	74 4f                	je     80103d2d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103cde:	e8 0d fb ff ff       	call   801037f0 <mycpu>
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
80103cf9:	e8 f2 fa ff ff       	call   801037f0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103cfe:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103d01:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103d07:	e8 e4 fa ff ff       	call   801037f0 <mycpu>
80103d0c:	83 ec 08             	sub    $0x8,%esp
80103d0f:	ff 70 04             	pushl  0x4(%eax)
80103d12:	53                   	push   %ebx
80103d13:	e8 03 0b 00 00       	call   8010481b <swtch>
  mycpu()->intena = intena;
80103d18:	e8 d3 fa ff ff       	call   801037f0 <mycpu>
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
80103d30:	68 30 78 10 80       	push   $0x80107830
80103d35:	e8 56 c6 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103d3a:	83 ec 0c             	sub    $0xc,%esp
80103d3d:	68 5c 78 10 80       	push   $0x8010785c
80103d42:	e8 49 c6 ff ff       	call   80100390 <panic>
    panic("sched running");
80103d47:	83 ec 0c             	sub    $0xc,%esp
80103d4a:	68 4e 78 10 80       	push   $0x8010784e
80103d4f:	e8 3c c6 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103d54:	83 ec 0c             	sub    $0xc,%esp
80103d57:	68 42 78 10 80       	push   $0x80107842
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
80103d79:	e8 82 06 00 00       	call   80104400 <pushcli>
  c = mycpu();
80103d7e:	e8 6d fa ff ff       	call   801037f0 <mycpu>
  p = c->proc;
80103d83:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103d89:	e8 b2 06 00 00       	call   80104440 <popcli>
  if(curproc == initproc)
80103d8e:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103d94:	8d 5e 28             	lea    0x28(%esi),%ebx
80103d97:	8d 7e 68             	lea    0x68(%esi),%edi
80103d9a:	0f 84 e7 00 00 00    	je     80103e87 <exit+0x117>
    if(curproc->ofile[fd]){
80103da0:	8b 03                	mov    (%ebx),%eax
80103da2:	85 c0                	test   %eax,%eax
80103da4:	74 12                	je     80103db8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103da6:	83 ec 0c             	sub    $0xc,%esp
80103da9:	50                   	push   %eax
80103daa:	e8 d1 d0 ff ff       	call   80100e80 <fileclose>
      curproc->ofile[fd] = 0;
80103daf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103db5:	83 c4 10             	add    $0x10,%esp
80103db8:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103dbb:	39 fb                	cmp    %edi,%ebx
80103dbd:	75 e1                	jne    80103da0 <exit+0x30>
  begin_op();
80103dbf:	e8 6c ee ff ff       	call   80102c30 <begin_op>
  iput(curproc->cwd);
80103dc4:	83 ec 0c             	sub    $0xc,%esp
80103dc7:	ff 76 68             	pushl  0x68(%esi)
80103dca:	e8 21 da ff ff       	call   801017f0 <iput>
  end_op();
80103dcf:	e8 cc ee ff ff       	call   80102ca0 <end_op>
  curproc->cwd = 0;
80103dd4:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103ddb:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103de2:	e8 e9 06 00 00       	call   801044d0 <acquire>
  wakeup1(curproc->parent);
80103de7:	8b 56 14             	mov    0x14(%esi),%edx
80103dea:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ded:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103df2:	eb 0e                	jmp    80103e02 <exit+0x92>
80103df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103df8:	83 e8 80             	sub    $0xffffff80,%eax
80103dfb:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80103e00:	73 1c                	jae    80103e1e <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103e02:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e06:	75 f0                	jne    80103df8 <exit+0x88>
80103e08:	3b 50 20             	cmp    0x20(%eax),%edx
80103e0b:	75 eb                	jne    80103df8 <exit+0x88>
      p->state = RUNNABLE;
80103e0d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e14:	83 e8 80             	sub    $0xffffff80,%eax
80103e17:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80103e1c:	72 e4                	jb     80103e02 <exit+0x92>
      p->parent = initproc;
80103e1e:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e24:	ba 34 37 11 80       	mov    $0x80113734,%edx
80103e29:	eb 10                	jmp    80103e3b <exit+0xcb>
80103e2b:	90                   	nop
80103e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e30:	83 ea 80             	sub    $0xffffff80,%edx
80103e33:	81 fa 34 57 11 80    	cmp    $0x80115734,%edx
80103e39:	73 33                	jae    80103e6e <exit+0xfe>
    if(p->parent == curproc){
80103e3b:	39 72 14             	cmp    %esi,0x14(%edx)
80103e3e:	75 f0                	jne    80103e30 <exit+0xc0>
      if(p->state == ZOMBIE)
80103e40:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103e44:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e47:	75 e7                	jne    80103e30 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e49:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103e4e:	eb 0a                	jmp    80103e5a <exit+0xea>
80103e50:	83 e8 80             	sub    $0xffffff80,%eax
80103e53:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80103e58:	73 d6                	jae    80103e30 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103e5a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e5e:	75 f0                	jne    80103e50 <exit+0xe0>
80103e60:	3b 48 20             	cmp    0x20(%eax),%ecx
80103e63:	75 eb                	jne    80103e50 <exit+0xe0>
      p->state = RUNNABLE;
80103e65:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e6c:	eb e2                	jmp    80103e50 <exit+0xe0>
  curproc->state = ZOMBIE;
80103e6e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103e75:	e8 36 fe ff ff       	call   80103cb0 <sched>
  panic("zombie exit");
80103e7a:	83 ec 0c             	sub    $0xc,%esp
80103e7d:	68 7d 78 10 80       	push   $0x8010787d
80103e82:	e8 09 c5 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103e87:	83 ec 0c             	sub    $0xc,%esp
80103e8a:	68 70 78 10 80       	push   $0x80107870
80103e8f:	e8 fc c4 ff ff       	call   80100390 <panic>
80103e94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103ea0 <yield>:
{
80103ea0:	55                   	push   %ebp
80103ea1:	89 e5                	mov    %esp,%ebp
80103ea3:	53                   	push   %ebx
80103ea4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103ea7:	68 00 37 11 80       	push   $0x80113700
80103eac:	e8 1f 06 00 00       	call   801044d0 <acquire>
  pushcli();
80103eb1:	e8 4a 05 00 00       	call   80104400 <pushcli>
  c = mycpu();
80103eb6:	e8 35 f9 ff ff       	call   801037f0 <mycpu>
  p = c->proc;
80103ebb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ec1:	e8 7a 05 00 00       	call   80104440 <popcli>
  myproc()->state = RUNNABLE;
80103ec6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103ecd:	e8 de fd ff ff       	call   80103cb0 <sched>
  release(&ptable.lock);
80103ed2:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103ed9:	e8 b2 06 00 00       	call   80104590 <release>
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
80103eff:	e8 fc 04 00 00       	call   80104400 <pushcli>
  c = mycpu();
80103f04:	e8 e7 f8 ff ff       	call   801037f0 <mycpu>
  p = c->proc;
80103f09:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103f0f:	e8 2c 05 00 00       	call   80104440 <popcli>
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
80103f30:	e8 9b 05 00 00       	call   801044d0 <acquire>
    release(lk);
80103f35:	89 34 24             	mov    %esi,(%esp)
80103f38:	e8 53 06 00 00       	call   80104590 <release>
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
80103f5a:	e8 31 06 00 00       	call   80104590 <release>
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
80103f6c:	e9 5f 05 00 00       	jmp    801044d0 <acquire>
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
80103f99:	68 8f 78 10 80       	push   $0x8010788f
80103f9e:	e8 ed c3 ff ff       	call   80100390 <panic>
    panic("sleep");
80103fa3:	83 ec 0c             	sub    $0xc,%esp
80103fa6:	68 89 78 10 80       	push   $0x80107889
80103fab:	e8 e0 c3 ff ff       	call   80100390 <panic>

80103fb0 <wait>:
{
80103fb0:	55                   	push   %ebp
80103fb1:	89 e5                	mov    %esp,%ebp
80103fb3:	56                   	push   %esi
80103fb4:	53                   	push   %ebx
  pushcli();
80103fb5:	e8 46 04 00 00       	call   80104400 <pushcli>
  c = mycpu();
80103fba:	e8 31 f8 ff ff       	call   801037f0 <mycpu>
  p = c->proc;
80103fbf:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103fc5:	e8 76 04 00 00       	call   80104440 <popcli>
  acquire(&ptable.lock);
80103fca:	83 ec 0c             	sub    $0xc,%esp
80103fcd:	68 00 37 11 80       	push   $0x80113700
80103fd2:	e8 f9 04 00 00       	call   801044d0 <acquire>
80103fd7:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103fda:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fdc:	bb 34 37 11 80       	mov    $0x80113734,%ebx
80103fe1:	eb 10                	jmp    80103ff3 <wait+0x43>
80103fe3:	90                   	nop
80103fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fe8:	83 eb 80             	sub    $0xffffff80,%ebx
80103feb:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
80103ff1:	73 1b                	jae    8010400e <wait+0x5e>
      if(p->parent != curproc)
80103ff3:	39 73 14             	cmp    %esi,0x14(%ebx)
80103ff6:	75 f0                	jne    80103fe8 <wait+0x38>
      if(p->state == ZOMBIE){
80103ff8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103ffc:	74 32                	je     80104030 <wait+0x80>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ffe:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
80104001:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104006:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
8010400c:	72 e5                	jb     80103ff3 <wait+0x43>
    if(!havekids || curproc->killed){
8010400e:	85 c0                	test   %eax,%eax
80104010:	74 74                	je     80104086 <wait+0xd6>
80104012:	8b 46 24             	mov    0x24(%esi),%eax
80104015:	85 c0                	test   %eax,%eax
80104017:	75 6d                	jne    80104086 <wait+0xd6>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80104019:	83 ec 08             	sub    $0x8,%esp
8010401c:	68 00 37 11 80       	push   $0x80113700
80104021:	56                   	push   %esi
80104022:	e8 c9 fe ff ff       	call   80103ef0 <sleep>
    havekids = 0;
80104027:	83 c4 10             	add    $0x10,%esp
8010402a:	eb ae                	jmp    80103fda <wait+0x2a>
8010402c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        kfree(p->kstack);
80104030:	83 ec 0c             	sub    $0xc,%esp
80104033:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
80104036:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104039:	e8 12 e3 ff ff       	call   80102350 <kfree>
        freevm(p->pgdir);
8010403e:	5a                   	pop    %edx
8010403f:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
80104042:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104049:	e8 62 2d 00 00       	call   80106db0 <freevm>
        release(&ptable.lock);
8010404e:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
        p->pid = 0;
80104055:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
8010405c:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80104063:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80104067:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
8010406e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80104075:	e8 16 05 00 00       	call   80104590 <release>
        return pid;
8010407a:	83 c4 10             	add    $0x10,%esp
}
8010407d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104080:	89 f0                	mov    %esi,%eax
80104082:	5b                   	pop    %ebx
80104083:	5e                   	pop    %esi
80104084:	5d                   	pop    %ebp
80104085:	c3                   	ret    
      release(&ptable.lock);
80104086:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104089:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
8010408e:	68 00 37 11 80       	push   $0x80113700
80104093:	e8 f8 04 00 00       	call   80104590 <release>
      return -1;
80104098:	83 c4 10             	add    $0x10,%esp
8010409b:	eb e0                	jmp    8010407d <wait+0xcd>
8010409d:	8d 76 00             	lea    0x0(%esi),%esi

801040a0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
801040a0:	55                   	push   %ebp
801040a1:	89 e5                	mov    %esp,%ebp
801040a3:	53                   	push   %ebx
801040a4:	83 ec 10             	sub    $0x10,%esp
801040a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
801040aa:	68 00 37 11 80       	push   $0x80113700
801040af:	e8 1c 04 00 00       	call   801044d0 <acquire>
801040b4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040b7:	b8 34 37 11 80       	mov    $0x80113734,%eax
801040bc:	eb 0c                	jmp    801040ca <wakeup+0x2a>
801040be:	66 90                	xchg   %ax,%ax
801040c0:	83 e8 80             	sub    $0xffffff80,%eax
801040c3:	3d 34 57 11 80       	cmp    $0x80115734,%eax
801040c8:	73 1c                	jae    801040e6 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
801040ca:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040ce:	75 f0                	jne    801040c0 <wakeup+0x20>
801040d0:	3b 58 20             	cmp    0x20(%eax),%ebx
801040d3:	75 eb                	jne    801040c0 <wakeup+0x20>
      p->state = RUNNABLE;
801040d5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040dc:	83 e8 80             	sub    $0xffffff80,%eax
801040df:	3d 34 57 11 80       	cmp    $0x80115734,%eax
801040e4:	72 e4                	jb     801040ca <wakeup+0x2a>
  wakeup1(chan);
  release(&ptable.lock);
801040e6:	c7 45 08 00 37 11 80 	movl   $0x80113700,0x8(%ebp)
}
801040ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040f0:	c9                   	leave  
  release(&ptable.lock);
801040f1:	e9 9a 04 00 00       	jmp    80104590 <release>
801040f6:	8d 76 00             	lea    0x0(%esi),%esi
801040f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104100 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104100:	55                   	push   %ebp
80104101:	89 e5                	mov    %esp,%ebp
80104103:	53                   	push   %ebx
80104104:	83 ec 10             	sub    $0x10,%esp
80104107:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010410a:	68 00 37 11 80       	push   $0x80113700
8010410f:	e8 bc 03 00 00       	call   801044d0 <acquire>
80104114:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104117:	b8 34 37 11 80       	mov    $0x80113734,%eax
8010411c:	eb 0c                	jmp    8010412a <kill+0x2a>
8010411e:	66 90                	xchg   %ax,%ax
80104120:	83 e8 80             	sub    $0xffffff80,%eax
80104123:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80104128:	73 36                	jae    80104160 <kill+0x60>
    if(p->pid == pid){
8010412a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010412d:	75 f1                	jne    80104120 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010412f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104133:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010413a:	75 07                	jne    80104143 <kill+0x43>
        p->state = RUNNABLE;
8010413c:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104143:	83 ec 0c             	sub    $0xc,%esp
80104146:	68 00 37 11 80       	push   $0x80113700
8010414b:	e8 40 04 00 00       	call   80104590 <release>
      return 0;
80104150:	83 c4 10             	add    $0x10,%esp
80104153:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104155:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104158:	c9                   	leave  
80104159:	c3                   	ret    
8010415a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80104160:	83 ec 0c             	sub    $0xc,%esp
80104163:	68 00 37 11 80       	push   $0x80113700
80104168:	e8 23 04 00 00       	call   80104590 <release>
  return -1;
8010416d:	83 c4 10             	add    $0x10,%esp
80104170:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104175:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104178:	c9                   	leave  
80104179:	c3                   	ret    
8010417a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104180 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104180:	55                   	push   %ebp
80104181:	89 e5                	mov    %esp,%ebp
80104183:	57                   	push   %edi
80104184:	56                   	push   %esi
80104185:	53                   	push   %ebx
80104186:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104189:	bb 34 37 11 80       	mov    $0x80113734,%ebx
{
8010418e:	83 ec 3c             	sub    $0x3c,%esp
80104191:	eb 24                	jmp    801041b7 <procdump+0x37>
80104193:	90                   	nop
80104194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    // cprintf(" %d", p->tickets);
    // cprintf(" %d", winning_ticket);
    // cprintf(" %d", total_tickets);
    cprintf("\n");
80104198:	83 ec 0c             	sub    $0xc,%esp
8010419b:	68 23 7c 10 80       	push   $0x80107c23
801041a0:	e8 bb c4 ff ff       	call   80100660 <cprintf>
801041a5:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801041a8:	83 eb 80             	sub    $0xffffff80,%ebx
801041ab:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
801041b1:	0f 83 99 00 00 00    	jae    80104250 <procdump+0xd0>
    if(p->state == UNUSED)
801041b7:	8b 43 0c             	mov    0xc(%ebx),%eax
801041ba:	85 c0                	test   %eax,%eax
801041bc:	74 ea                	je     801041a8 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041be:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
801041c1:	ba a0 78 10 80       	mov    $0x801078a0,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041c6:	77 11                	ja     801041d9 <procdump+0x59>
801041c8:	8b 14 85 04 79 10 80 	mov    -0x7fef86fc(,%eax,4),%edx
      state = "???";
801041cf:	b8 a0 78 10 80       	mov    $0x801078a0,%eax
801041d4:	85 d2                	test   %edx,%edx
801041d6:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %sc%d", p->pid, state, p->name, p->tickets);
801041d9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801041dc:	83 ec 0c             	sub    $0xc,%esp
801041df:	ff 73 7c             	pushl  0x7c(%ebx)
801041e2:	50                   	push   %eax
801041e3:	52                   	push   %edx
801041e4:	ff 73 10             	pushl  0x10(%ebx)
801041e7:	68 a4 78 10 80       	push   $0x801078a4
801041ec:	e8 6f c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
801041f1:	83 c4 20             	add    $0x20,%esp
801041f4:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
801041f8:	75 9e                	jne    80104198 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801041fa:	8d 45 c0             	lea    -0x40(%ebp),%eax
801041fd:	83 ec 08             	sub    $0x8,%esp
80104200:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104203:	50                   	push   %eax
80104204:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104207:	8b 40 0c             	mov    0xc(%eax),%eax
8010420a:	83 c0 08             	add    $0x8,%eax
8010420d:	50                   	push   %eax
8010420e:	e8 9d 01 00 00       	call   801043b0 <getcallerpcs>
80104213:	83 c4 10             	add    $0x10,%esp
80104216:	8d 76 00             	lea    0x0(%esi),%esi
80104219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      for(i=0; i<10 && pc[i] != 0; i++)
80104220:	8b 17                	mov    (%edi),%edx
80104222:	85 d2                	test   %edx,%edx
80104224:	0f 84 6e ff ff ff    	je     80104198 <procdump+0x18>
        cprintf(" %p", pc[i]);
8010422a:	83 ec 08             	sub    $0x8,%esp
8010422d:	83 c7 04             	add    $0x4,%edi
80104230:	52                   	push   %edx
80104231:	68 e1 72 10 80       	push   $0x801072e1
80104236:	e8 25 c4 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
8010423b:	83 c4 10             	add    $0x10,%esp
8010423e:	39 fe                	cmp    %edi,%esi
80104240:	75 de                	jne    80104220 <procdump+0xa0>
80104242:	e9 51 ff ff ff       	jmp    80104198 <procdump+0x18>
80104247:	89 f6                	mov    %esi,%esi
80104249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
}
80104250:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104253:	5b                   	pop    %ebx
80104254:	5e                   	pop    %esi
80104255:	5f                   	pop    %edi
80104256:	5d                   	pop    %ebp
80104257:	c3                   	ret    
80104258:	66 90                	xchg   %ax,%ax
8010425a:	66 90                	xchg   %ax,%ax
8010425c:	66 90                	xchg   %ax,%ax
8010425e:	66 90                	xchg   %ax,%ax

80104260 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	53                   	push   %ebx
80104264:	83 ec 0c             	sub    $0xc,%esp
80104267:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010426a:	68 1c 79 10 80       	push   $0x8010791c
8010426f:	8d 43 04             	lea    0x4(%ebx),%eax
80104272:	50                   	push   %eax
80104273:	e8 18 01 00 00       	call   80104390 <initlock>
  lk->name = name;
80104278:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010427b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104281:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104284:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010428b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010428e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104291:	c9                   	leave  
80104292:	c3                   	ret    
80104293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042a0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801042a0:	55                   	push   %ebp
801042a1:	89 e5                	mov    %esp,%ebp
801042a3:	56                   	push   %esi
801042a4:	53                   	push   %ebx
801042a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801042a8:	83 ec 0c             	sub    $0xc,%esp
801042ab:	8d 73 04             	lea    0x4(%ebx),%esi
801042ae:	56                   	push   %esi
801042af:	e8 1c 02 00 00       	call   801044d0 <acquire>
  while (lk->locked) {
801042b4:	8b 13                	mov    (%ebx),%edx
801042b6:	83 c4 10             	add    $0x10,%esp
801042b9:	85 d2                	test   %edx,%edx
801042bb:	74 16                	je     801042d3 <acquiresleep+0x33>
801042bd:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801042c0:	83 ec 08             	sub    $0x8,%esp
801042c3:	56                   	push   %esi
801042c4:	53                   	push   %ebx
801042c5:	e8 26 fc ff ff       	call   80103ef0 <sleep>
  while (lk->locked) {
801042ca:	8b 03                	mov    (%ebx),%eax
801042cc:	83 c4 10             	add    $0x10,%esp
801042cf:	85 c0                	test   %eax,%eax
801042d1:	75 ed                	jne    801042c0 <acquiresleep+0x20>
  }
  lk->locked = 1;
801042d3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801042d9:	e8 b2 f5 ff ff       	call   80103890 <myproc>
801042de:	8b 40 10             	mov    0x10(%eax),%eax
801042e1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801042e4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801042e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042ea:	5b                   	pop    %ebx
801042eb:	5e                   	pop    %esi
801042ec:	5d                   	pop    %ebp
  release(&lk->lk);
801042ed:	e9 9e 02 00 00       	jmp    80104590 <release>
801042f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104300 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	56                   	push   %esi
80104304:	53                   	push   %ebx
80104305:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104308:	83 ec 0c             	sub    $0xc,%esp
8010430b:	8d 73 04             	lea    0x4(%ebx),%esi
8010430e:	56                   	push   %esi
8010430f:	e8 bc 01 00 00       	call   801044d0 <acquire>
  lk->locked = 0;
80104314:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010431a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104321:	89 1c 24             	mov    %ebx,(%esp)
80104324:	e8 77 fd ff ff       	call   801040a0 <wakeup>
  release(&lk->lk);
80104329:	89 75 08             	mov    %esi,0x8(%ebp)
8010432c:	83 c4 10             	add    $0x10,%esp
}
8010432f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104332:	5b                   	pop    %ebx
80104333:	5e                   	pop    %esi
80104334:	5d                   	pop    %ebp
  release(&lk->lk);
80104335:	e9 56 02 00 00       	jmp    80104590 <release>
8010433a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104340 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	57                   	push   %edi
80104344:	56                   	push   %esi
80104345:	53                   	push   %ebx
80104346:	31 ff                	xor    %edi,%edi
80104348:	83 ec 18             	sub    $0x18,%esp
8010434b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010434e:	8d 73 04             	lea    0x4(%ebx),%esi
80104351:	56                   	push   %esi
80104352:	e8 79 01 00 00       	call   801044d0 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104357:	8b 03                	mov    (%ebx),%eax
80104359:	83 c4 10             	add    $0x10,%esp
8010435c:	85 c0                	test   %eax,%eax
8010435e:	74 13                	je     80104373 <holdingsleep+0x33>
80104360:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104363:	e8 28 f5 ff ff       	call   80103890 <myproc>
80104368:	39 58 10             	cmp    %ebx,0x10(%eax)
8010436b:	0f 94 c0             	sete   %al
8010436e:	0f b6 c0             	movzbl %al,%eax
80104371:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
80104373:	83 ec 0c             	sub    $0xc,%esp
80104376:	56                   	push   %esi
80104377:	e8 14 02 00 00       	call   80104590 <release>
  return r;
}
8010437c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010437f:	89 f8                	mov    %edi,%eax
80104381:	5b                   	pop    %ebx
80104382:	5e                   	pop    %esi
80104383:	5f                   	pop    %edi
80104384:	5d                   	pop    %ebp
80104385:	c3                   	ret    
80104386:	66 90                	xchg   %ax,%ax
80104388:	66 90                	xchg   %ax,%ax
8010438a:	66 90                	xchg   %ax,%ax
8010438c:	66 90                	xchg   %ax,%ax
8010438e:	66 90                	xchg   %ax,%ax

80104390 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104390:	55                   	push   %ebp
80104391:	89 e5                	mov    %esp,%ebp
80104393:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104396:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104399:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010439f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
801043a2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801043a9:	5d                   	pop    %ebp
801043aa:	c3                   	ret    
801043ab:	90                   	nop
801043ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043b0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801043b0:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801043b1:	31 d2                	xor    %edx,%edx
{
801043b3:	89 e5                	mov    %esp,%ebp
801043b5:	53                   	push   %ebx
  ebp = (uint*)v - 2;
801043b6:	8b 45 08             	mov    0x8(%ebp),%eax
{
801043b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
801043bc:	83 e8 08             	sub    $0x8,%eax
801043bf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801043c0:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801043c6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801043cc:	77 1a                	ja     801043e8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801043ce:	8b 58 04             	mov    0x4(%eax),%ebx
801043d1:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
801043d4:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
801043d7:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
801043d9:	83 fa 0a             	cmp    $0xa,%edx
801043dc:	75 e2                	jne    801043c0 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801043de:	5b                   	pop    %ebx
801043df:	5d                   	pop    %ebp
801043e0:	c3                   	ret    
801043e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043e8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801043eb:	83 c1 28             	add    $0x28,%ecx
801043ee:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
801043f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801043f6:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
801043f9:	39 c1                	cmp    %eax,%ecx
801043fb:	75 f3                	jne    801043f0 <getcallerpcs+0x40>
}
801043fd:	5b                   	pop    %ebx
801043fe:	5d                   	pop    %ebp
801043ff:	c3                   	ret    

80104400 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	53                   	push   %ebx
80104404:	83 ec 04             	sub    $0x4,%esp
80104407:	9c                   	pushf  
80104408:	5b                   	pop    %ebx
  asm volatile("cli");
80104409:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010440a:	e8 e1 f3 ff ff       	call   801037f0 <mycpu>
8010440f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104415:	85 c0                	test   %eax,%eax
80104417:	75 11                	jne    8010442a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104419:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010441f:	e8 cc f3 ff ff       	call   801037f0 <mycpu>
80104424:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010442a:	e8 c1 f3 ff ff       	call   801037f0 <mycpu>
8010442f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104436:	83 c4 04             	add    $0x4,%esp
80104439:	5b                   	pop    %ebx
8010443a:	5d                   	pop    %ebp
8010443b:	c3                   	ret    
8010443c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104440 <popcli>:

void
popcli(void)
{
80104440:	55                   	push   %ebp
80104441:	89 e5                	mov    %esp,%ebp
80104443:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104446:	9c                   	pushf  
80104447:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104448:	f6 c4 02             	test   $0x2,%ah
8010444b:	75 35                	jne    80104482 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010444d:	e8 9e f3 ff ff       	call   801037f0 <mycpu>
80104452:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104459:	78 34                	js     8010448f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010445b:	e8 90 f3 ff ff       	call   801037f0 <mycpu>
80104460:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104466:	85 d2                	test   %edx,%edx
80104468:	74 06                	je     80104470 <popcli+0x30>
    sti();
}
8010446a:	c9                   	leave  
8010446b:	c3                   	ret    
8010446c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104470:	e8 7b f3 ff ff       	call   801037f0 <mycpu>
80104475:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010447b:	85 c0                	test   %eax,%eax
8010447d:	74 eb                	je     8010446a <popcli+0x2a>
  asm volatile("sti");
8010447f:	fb                   	sti    
}
80104480:	c9                   	leave  
80104481:	c3                   	ret    
    panic("popcli - interruptible");
80104482:	83 ec 0c             	sub    $0xc,%esp
80104485:	68 27 79 10 80       	push   $0x80107927
8010448a:	e8 01 bf ff ff       	call   80100390 <panic>
    panic("popcli");
8010448f:	83 ec 0c             	sub    $0xc,%esp
80104492:	68 3e 79 10 80       	push   $0x8010793e
80104497:	e8 f4 be ff ff       	call   80100390 <panic>
8010449c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044a0 <holding>:
{
801044a0:	55                   	push   %ebp
801044a1:	89 e5                	mov    %esp,%ebp
801044a3:	56                   	push   %esi
801044a4:	53                   	push   %ebx
801044a5:	8b 75 08             	mov    0x8(%ebp),%esi
801044a8:	31 db                	xor    %ebx,%ebx
  pushcli();
801044aa:	e8 51 ff ff ff       	call   80104400 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801044af:	8b 06                	mov    (%esi),%eax
801044b1:	85 c0                	test   %eax,%eax
801044b3:	74 10                	je     801044c5 <holding+0x25>
801044b5:	8b 5e 08             	mov    0x8(%esi),%ebx
801044b8:	e8 33 f3 ff ff       	call   801037f0 <mycpu>
801044bd:	39 c3                	cmp    %eax,%ebx
801044bf:	0f 94 c3             	sete   %bl
801044c2:	0f b6 db             	movzbl %bl,%ebx
  popcli();
801044c5:	e8 76 ff ff ff       	call   80104440 <popcli>
}
801044ca:	89 d8                	mov    %ebx,%eax
801044cc:	5b                   	pop    %ebx
801044cd:	5e                   	pop    %esi
801044ce:	5d                   	pop    %ebp
801044cf:	c3                   	ret    

801044d0 <acquire>:
{
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	56                   	push   %esi
801044d4:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
801044d5:	e8 26 ff ff ff       	call   80104400 <pushcli>
  if(holding(lk))
801044da:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044dd:	83 ec 0c             	sub    $0xc,%esp
801044e0:	53                   	push   %ebx
801044e1:	e8 ba ff ff ff       	call   801044a0 <holding>
801044e6:	83 c4 10             	add    $0x10,%esp
801044e9:	85 c0                	test   %eax,%eax
801044eb:	0f 85 83 00 00 00    	jne    80104574 <acquire+0xa4>
801044f1:	89 c6                	mov    %eax,%esi
  asm volatile("lock; xchgl %0, %1" :
801044f3:	ba 01 00 00 00       	mov    $0x1,%edx
801044f8:	eb 09                	jmp    80104503 <acquire+0x33>
801044fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104500:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104503:	89 d0                	mov    %edx,%eax
80104505:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
80104508:	85 c0                	test   %eax,%eax
8010450a:	75 f4                	jne    80104500 <acquire+0x30>
  __sync_synchronize();
8010450c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104511:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104514:	e8 d7 f2 ff ff       	call   801037f0 <mycpu>
  getcallerpcs(&lk, lk->pcs);
80104519:	8d 53 0c             	lea    0xc(%ebx),%edx
  lk->cpu = mycpu();
8010451c:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
8010451f:	89 e8                	mov    %ebp,%eax
80104521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104528:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
8010452e:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
80104534:	77 1a                	ja     80104550 <acquire+0x80>
    pcs[i] = ebp[1];     // saved %eip
80104536:	8b 48 04             	mov    0x4(%eax),%ecx
80104539:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
  for(i = 0; i < 10; i++){
8010453c:	83 c6 01             	add    $0x1,%esi
    ebp = (uint*)ebp[0]; // saved %ebp
8010453f:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104541:	83 fe 0a             	cmp    $0xa,%esi
80104544:	75 e2                	jne    80104528 <acquire+0x58>
}
80104546:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104549:	5b                   	pop    %ebx
8010454a:	5e                   	pop    %esi
8010454b:	5d                   	pop    %ebp
8010454c:	c3                   	ret    
8010454d:	8d 76 00             	lea    0x0(%esi),%esi
80104550:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104553:	83 c2 28             	add    $0x28,%edx
80104556:	8d 76 00             	lea    0x0(%esi),%esi
80104559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    pcs[i] = 0;
80104560:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104566:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104569:	39 d0                	cmp    %edx,%eax
8010456b:	75 f3                	jne    80104560 <acquire+0x90>
}
8010456d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104570:	5b                   	pop    %ebx
80104571:	5e                   	pop    %esi
80104572:	5d                   	pop    %ebp
80104573:	c3                   	ret    
    panic("acquire");
80104574:	83 ec 0c             	sub    $0xc,%esp
80104577:	68 45 79 10 80       	push   $0x80107945
8010457c:	e8 0f be ff ff       	call   80100390 <panic>
80104581:	eb 0d                	jmp    80104590 <release>
80104583:	90                   	nop
80104584:	90                   	nop
80104585:	90                   	nop
80104586:	90                   	nop
80104587:	90                   	nop
80104588:	90                   	nop
80104589:	90                   	nop
8010458a:	90                   	nop
8010458b:	90                   	nop
8010458c:	90                   	nop
8010458d:	90                   	nop
8010458e:	90                   	nop
8010458f:	90                   	nop

80104590 <release>:
{
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	53                   	push   %ebx
80104594:	83 ec 10             	sub    $0x10,%esp
80104597:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
8010459a:	53                   	push   %ebx
8010459b:	e8 00 ff ff ff       	call   801044a0 <holding>
801045a0:	83 c4 10             	add    $0x10,%esp
801045a3:	85 c0                	test   %eax,%eax
801045a5:	74 22                	je     801045c9 <release+0x39>
  lk->pcs[0] = 0;
801045a7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801045ae:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
801045b5:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801045ba:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801045c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045c3:	c9                   	leave  
  popcli();
801045c4:	e9 77 fe ff ff       	jmp    80104440 <popcli>
    panic("release");
801045c9:	83 ec 0c             	sub    $0xc,%esp
801045cc:	68 4d 79 10 80       	push   $0x8010794d
801045d1:	e8 ba bd ff ff       	call   80100390 <panic>
801045d6:	66 90                	xchg   %ax,%ax
801045d8:	66 90                	xchg   %ax,%ax
801045da:	66 90                	xchg   %ax,%ax
801045dc:	66 90                	xchg   %ax,%ax
801045de:	66 90                	xchg   %ax,%ax

801045e0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	57                   	push   %edi
801045e4:	53                   	push   %ebx
801045e5:	8b 55 08             	mov    0x8(%ebp),%edx
801045e8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
801045eb:	f6 c2 03             	test   $0x3,%dl
801045ee:	75 05                	jne    801045f5 <memset+0x15>
801045f0:	f6 c1 03             	test   $0x3,%cl
801045f3:	74 13                	je     80104608 <memset+0x28>
  asm volatile("cld; rep stosb" :
801045f5:	89 d7                	mov    %edx,%edi
801045f7:	8b 45 0c             	mov    0xc(%ebp),%eax
801045fa:	fc                   	cld    
801045fb:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
801045fd:	5b                   	pop    %ebx
801045fe:	89 d0                	mov    %edx,%eax
80104600:	5f                   	pop    %edi
80104601:	5d                   	pop    %ebp
80104602:	c3                   	ret    
80104603:	90                   	nop
80104604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
80104608:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010460c:	c1 e9 02             	shr    $0x2,%ecx
8010460f:	89 f8                	mov    %edi,%eax
80104611:	89 fb                	mov    %edi,%ebx
80104613:	c1 e0 18             	shl    $0x18,%eax
80104616:	c1 e3 10             	shl    $0x10,%ebx
80104619:	09 d8                	or     %ebx,%eax
8010461b:	09 f8                	or     %edi,%eax
8010461d:	c1 e7 08             	shl    $0x8,%edi
80104620:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80104622:	89 d7                	mov    %edx,%edi
80104624:	fc                   	cld    
80104625:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104627:	5b                   	pop    %ebx
80104628:	89 d0                	mov    %edx,%eax
8010462a:	5f                   	pop    %edi
8010462b:	5d                   	pop    %ebp
8010462c:	c3                   	ret    
8010462d:	8d 76 00             	lea    0x0(%esi),%esi

80104630 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	57                   	push   %edi
80104634:	56                   	push   %esi
80104635:	53                   	push   %ebx
80104636:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104639:	8b 75 08             	mov    0x8(%ebp),%esi
8010463c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010463f:	85 db                	test   %ebx,%ebx
80104641:	74 29                	je     8010466c <memcmp+0x3c>
    if(*s1 != *s2)
80104643:	0f b6 16             	movzbl (%esi),%edx
80104646:	0f b6 0f             	movzbl (%edi),%ecx
80104649:	38 d1                	cmp    %dl,%cl
8010464b:	75 2b                	jne    80104678 <memcmp+0x48>
8010464d:	b8 01 00 00 00       	mov    $0x1,%eax
80104652:	eb 14                	jmp    80104668 <memcmp+0x38>
80104654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104658:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010465c:	83 c0 01             	add    $0x1,%eax
8010465f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104664:	38 ca                	cmp    %cl,%dl
80104666:	75 10                	jne    80104678 <memcmp+0x48>
  while(n-- > 0){
80104668:	39 d8                	cmp    %ebx,%eax
8010466a:	75 ec                	jne    80104658 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010466c:	5b                   	pop    %ebx
  return 0;
8010466d:	31 c0                	xor    %eax,%eax
}
8010466f:	5e                   	pop    %esi
80104670:	5f                   	pop    %edi
80104671:	5d                   	pop    %ebp
80104672:	c3                   	ret    
80104673:	90                   	nop
80104674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
80104678:	0f b6 c2             	movzbl %dl,%eax
}
8010467b:	5b                   	pop    %ebx
      return *s1 - *s2;
8010467c:	29 c8                	sub    %ecx,%eax
}
8010467e:	5e                   	pop    %esi
8010467f:	5f                   	pop    %edi
80104680:	5d                   	pop    %ebp
80104681:	c3                   	ret    
80104682:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104690 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	56                   	push   %esi
80104694:	53                   	push   %ebx
80104695:	8b 45 08             	mov    0x8(%ebp),%eax
80104698:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010469b:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010469e:	39 c3                	cmp    %eax,%ebx
801046a0:	73 26                	jae    801046c8 <memmove+0x38>
801046a2:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
801046a5:	39 c8                	cmp    %ecx,%eax
801046a7:	73 1f                	jae    801046c8 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
801046a9:	85 f6                	test   %esi,%esi
801046ab:	8d 56 ff             	lea    -0x1(%esi),%edx
801046ae:	74 0f                	je     801046bf <memmove+0x2f>
      *--d = *--s;
801046b0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801046b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
801046b7:	83 ea 01             	sub    $0x1,%edx
801046ba:	83 fa ff             	cmp    $0xffffffff,%edx
801046bd:	75 f1                	jne    801046b0 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801046bf:	5b                   	pop    %ebx
801046c0:	5e                   	pop    %esi
801046c1:	5d                   	pop    %ebp
801046c2:	c3                   	ret    
801046c3:	90                   	nop
801046c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
801046c8:	31 d2                	xor    %edx,%edx
801046ca:	85 f6                	test   %esi,%esi
801046cc:	74 f1                	je     801046bf <memmove+0x2f>
801046ce:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
801046d0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801046d4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801046d7:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
801046da:	39 d6                	cmp    %edx,%esi
801046dc:	75 f2                	jne    801046d0 <memmove+0x40>
}
801046de:	5b                   	pop    %ebx
801046df:	5e                   	pop    %esi
801046e0:	5d                   	pop    %ebp
801046e1:	c3                   	ret    
801046e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046f0 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
801046f3:	5d                   	pop    %ebp
  return memmove(dst, src, n);
801046f4:	eb 9a                	jmp    80104690 <memmove>
801046f6:	8d 76 00             	lea    0x0(%esi),%esi
801046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104700 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80104700:	55                   	push   %ebp
80104701:	89 e5                	mov    %esp,%ebp
80104703:	57                   	push   %edi
80104704:	56                   	push   %esi
80104705:	8b 7d 10             	mov    0x10(%ebp),%edi
80104708:	53                   	push   %ebx
80104709:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010470c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010470f:	85 ff                	test   %edi,%edi
80104711:	74 2f                	je     80104742 <strncmp+0x42>
80104713:	0f b6 01             	movzbl (%ecx),%eax
80104716:	0f b6 1e             	movzbl (%esi),%ebx
80104719:	84 c0                	test   %al,%al
8010471b:	74 37                	je     80104754 <strncmp+0x54>
8010471d:	38 c3                	cmp    %al,%bl
8010471f:	75 33                	jne    80104754 <strncmp+0x54>
80104721:	01 f7                	add    %esi,%edi
80104723:	eb 13                	jmp    80104738 <strncmp+0x38>
80104725:	8d 76 00             	lea    0x0(%esi),%esi
80104728:	0f b6 01             	movzbl (%ecx),%eax
8010472b:	84 c0                	test   %al,%al
8010472d:	74 21                	je     80104750 <strncmp+0x50>
8010472f:	0f b6 1a             	movzbl (%edx),%ebx
80104732:	89 d6                	mov    %edx,%esi
80104734:	38 d8                	cmp    %bl,%al
80104736:	75 1c                	jne    80104754 <strncmp+0x54>
    n--, p++, q++;
80104738:	8d 56 01             	lea    0x1(%esi),%edx
8010473b:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
8010473e:	39 fa                	cmp    %edi,%edx
80104740:	75 e6                	jne    80104728 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104742:	5b                   	pop    %ebx
    return 0;
80104743:	31 c0                	xor    %eax,%eax
}
80104745:	5e                   	pop    %esi
80104746:	5f                   	pop    %edi
80104747:	5d                   	pop    %ebp
80104748:	c3                   	ret    
80104749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104750:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104754:	29 d8                	sub    %ebx,%eax
}
80104756:	5b                   	pop    %ebx
80104757:	5e                   	pop    %esi
80104758:	5f                   	pop    %edi
80104759:	5d                   	pop    %ebp
8010475a:	c3                   	ret    
8010475b:	90                   	nop
8010475c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104760 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104760:	55                   	push   %ebp
80104761:	89 e5                	mov    %esp,%ebp
80104763:	56                   	push   %esi
80104764:	53                   	push   %ebx
80104765:	8b 45 08             	mov    0x8(%ebp),%eax
80104768:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010476b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010476e:	89 c2                	mov    %eax,%edx
80104770:	eb 19                	jmp    8010478b <strncpy+0x2b>
80104772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104778:	83 c3 01             	add    $0x1,%ebx
8010477b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010477f:	83 c2 01             	add    $0x1,%edx
80104782:	84 c9                	test   %cl,%cl
80104784:	88 4a ff             	mov    %cl,-0x1(%edx)
80104787:	74 09                	je     80104792 <strncpy+0x32>
80104789:	89 f1                	mov    %esi,%ecx
8010478b:	85 c9                	test   %ecx,%ecx
8010478d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104790:	7f e6                	jg     80104778 <strncpy+0x18>
    ;
  while(n-- > 0)
80104792:	31 c9                	xor    %ecx,%ecx
80104794:	85 f6                	test   %esi,%esi
80104796:	7e 17                	jle    801047af <strncpy+0x4f>
80104798:	90                   	nop
80104799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
801047a0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801047a4:	89 f3                	mov    %esi,%ebx
801047a6:	83 c1 01             	add    $0x1,%ecx
801047a9:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
801047ab:	85 db                	test   %ebx,%ebx
801047ad:	7f f1                	jg     801047a0 <strncpy+0x40>
  return os;
}
801047af:	5b                   	pop    %ebx
801047b0:	5e                   	pop    %esi
801047b1:	5d                   	pop    %ebp
801047b2:	c3                   	ret    
801047b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047c0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	56                   	push   %esi
801047c4:	53                   	push   %ebx
801047c5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801047c8:	8b 45 08             	mov    0x8(%ebp),%eax
801047cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
801047ce:	85 c9                	test   %ecx,%ecx
801047d0:	7e 26                	jle    801047f8 <safestrcpy+0x38>
801047d2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801047d6:	89 c1                	mov    %eax,%ecx
801047d8:	eb 17                	jmp    801047f1 <safestrcpy+0x31>
801047da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
801047e0:	83 c2 01             	add    $0x1,%edx
801047e3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801047e7:	83 c1 01             	add    $0x1,%ecx
801047ea:	84 db                	test   %bl,%bl
801047ec:	88 59 ff             	mov    %bl,-0x1(%ecx)
801047ef:	74 04                	je     801047f5 <safestrcpy+0x35>
801047f1:	39 f2                	cmp    %esi,%edx
801047f3:	75 eb                	jne    801047e0 <safestrcpy+0x20>
    ;
  *s = 0;
801047f5:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
801047f8:	5b                   	pop    %ebx
801047f9:	5e                   	pop    %esi
801047fa:	5d                   	pop    %ebp
801047fb:	c3                   	ret    
801047fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104800 <strlen>:

int
strlen(const char *s)
{
80104800:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104801:	31 c0                	xor    %eax,%eax
{
80104803:	89 e5                	mov    %esp,%ebp
80104805:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104808:	80 3a 00             	cmpb   $0x0,(%edx)
8010480b:	74 0c                	je     80104819 <strlen+0x19>
8010480d:	8d 76 00             	lea    0x0(%esi),%esi
80104810:	83 c0 01             	add    $0x1,%eax
80104813:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104817:	75 f7                	jne    80104810 <strlen+0x10>
    ;
  return n;
}
80104819:	5d                   	pop    %ebp
8010481a:	c3                   	ret    

8010481b <swtch>:
8010481b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010481f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104823:	55                   	push   %ebp
80104824:	53                   	push   %ebx
80104825:	56                   	push   %esi
80104826:	57                   	push   %edi
80104827:	89 20                	mov    %esp,(%eax)
80104829:	89 d4                	mov    %edx,%esp
8010482b:	5f                   	pop    %edi
8010482c:	5e                   	pop    %esi
8010482d:	5b                   	pop    %ebx
8010482e:	5d                   	pop    %ebp
8010482f:	c3                   	ret    

80104830 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	53                   	push   %ebx
80104834:	83 ec 04             	sub    $0x4,%esp
80104837:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010483a:	e8 51 f0 ff ff       	call   80103890 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010483f:	8b 00                	mov    (%eax),%eax
80104841:	39 d8                	cmp    %ebx,%eax
80104843:	76 1b                	jbe    80104860 <fetchint+0x30>
80104845:	8d 53 04             	lea    0x4(%ebx),%edx
80104848:	39 d0                	cmp    %edx,%eax
8010484a:	72 14                	jb     80104860 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010484c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010484f:	8b 13                	mov    (%ebx),%edx
80104851:	89 10                	mov    %edx,(%eax)
  return 0;
80104853:	31 c0                	xor    %eax,%eax
}
80104855:	83 c4 04             	add    $0x4,%esp
80104858:	5b                   	pop    %ebx
80104859:	5d                   	pop    %ebp
8010485a:	c3                   	ret    
8010485b:	90                   	nop
8010485c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104860:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104865:	eb ee                	jmp    80104855 <fetchint+0x25>
80104867:	89 f6                	mov    %esi,%esi
80104869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104870 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104870:	55                   	push   %ebp
80104871:	89 e5                	mov    %esp,%ebp
80104873:	53                   	push   %ebx
80104874:	83 ec 04             	sub    $0x4,%esp
80104877:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010487a:	e8 11 f0 ff ff       	call   80103890 <myproc>

  if(addr >= curproc->sz)
8010487f:	39 18                	cmp    %ebx,(%eax)
80104881:	76 29                	jbe    801048ac <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104883:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104886:	89 da                	mov    %ebx,%edx
80104888:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010488a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010488c:	39 c3                	cmp    %eax,%ebx
8010488e:	73 1c                	jae    801048ac <fetchstr+0x3c>
    if(*s == 0)
80104890:	80 3b 00             	cmpb   $0x0,(%ebx)
80104893:	75 10                	jne    801048a5 <fetchstr+0x35>
80104895:	eb 39                	jmp    801048d0 <fetchstr+0x60>
80104897:	89 f6                	mov    %esi,%esi
80104899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801048a0:	80 3a 00             	cmpb   $0x0,(%edx)
801048a3:	74 1b                	je     801048c0 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
801048a5:	83 c2 01             	add    $0x1,%edx
801048a8:	39 d0                	cmp    %edx,%eax
801048aa:	77 f4                	ja     801048a0 <fetchstr+0x30>
    return -1;
801048ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
801048b1:	83 c4 04             	add    $0x4,%esp
801048b4:	5b                   	pop    %ebx
801048b5:	5d                   	pop    %ebp
801048b6:	c3                   	ret    
801048b7:	89 f6                	mov    %esi,%esi
801048b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801048c0:	83 c4 04             	add    $0x4,%esp
801048c3:	89 d0                	mov    %edx,%eax
801048c5:	29 d8                	sub    %ebx,%eax
801048c7:	5b                   	pop    %ebx
801048c8:	5d                   	pop    %ebp
801048c9:	c3                   	ret    
801048ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s == 0)
801048d0:	31 c0                	xor    %eax,%eax
      return s - *pp;
801048d2:	eb dd                	jmp    801048b1 <fetchstr+0x41>
801048d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801048e0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801048e0:	55                   	push   %ebp
801048e1:	89 e5                	mov    %esp,%ebp
801048e3:	56                   	push   %esi
801048e4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801048e5:	e8 a6 ef ff ff       	call   80103890 <myproc>
801048ea:	8b 40 18             	mov    0x18(%eax),%eax
801048ed:	8b 55 08             	mov    0x8(%ebp),%edx
801048f0:	8b 40 44             	mov    0x44(%eax),%eax
801048f3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
801048f6:	e8 95 ef ff ff       	call   80103890 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801048fb:	8b 00                	mov    (%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801048fd:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104900:	39 c6                	cmp    %eax,%esi
80104902:	73 1c                	jae    80104920 <argint+0x40>
80104904:	8d 53 08             	lea    0x8(%ebx),%edx
80104907:	39 d0                	cmp    %edx,%eax
80104909:	72 15                	jb     80104920 <argint+0x40>
  *ip = *(int*)(addr);
8010490b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010490e:	8b 53 04             	mov    0x4(%ebx),%edx
80104911:	89 10                	mov    %edx,(%eax)
  return 0;
80104913:	31 c0                	xor    %eax,%eax
}
80104915:	5b                   	pop    %ebx
80104916:	5e                   	pop    %esi
80104917:	5d                   	pop    %ebp
80104918:	c3                   	ret    
80104919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104920:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104925:	eb ee                	jmp    80104915 <argint+0x35>
80104927:	89 f6                	mov    %esi,%esi
80104929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104930 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104930:	55                   	push   %ebp
80104931:	89 e5                	mov    %esp,%ebp
80104933:	56                   	push   %esi
80104934:	53                   	push   %ebx
80104935:	83 ec 10             	sub    $0x10,%esp
80104938:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010493b:	e8 50 ef ff ff       	call   80103890 <myproc>
80104940:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104942:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104945:	83 ec 08             	sub    $0x8,%esp
80104948:	50                   	push   %eax
80104949:	ff 75 08             	pushl  0x8(%ebp)
8010494c:	e8 8f ff ff ff       	call   801048e0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104951:	83 c4 10             	add    $0x10,%esp
80104954:	85 c0                	test   %eax,%eax
80104956:	78 28                	js     80104980 <argptr+0x50>
80104958:	85 db                	test   %ebx,%ebx
8010495a:	78 24                	js     80104980 <argptr+0x50>
8010495c:	8b 16                	mov    (%esi),%edx
8010495e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104961:	39 c2                	cmp    %eax,%edx
80104963:	76 1b                	jbe    80104980 <argptr+0x50>
80104965:	01 c3                	add    %eax,%ebx
80104967:	39 da                	cmp    %ebx,%edx
80104969:	72 15                	jb     80104980 <argptr+0x50>
    return -1;
  *pp = (char*)i;
8010496b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010496e:	89 02                	mov    %eax,(%edx)
  return 0;
80104970:	31 c0                	xor    %eax,%eax
}
80104972:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104975:	5b                   	pop    %ebx
80104976:	5e                   	pop    %esi
80104977:	5d                   	pop    %ebp
80104978:	c3                   	ret    
80104979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104980:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104985:	eb eb                	jmp    80104972 <argptr+0x42>
80104987:	89 f6                	mov    %esi,%esi
80104989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104990 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104990:	55                   	push   %ebp
80104991:	89 e5                	mov    %esp,%ebp
80104993:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104996:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104999:	50                   	push   %eax
8010499a:	ff 75 08             	pushl  0x8(%ebp)
8010499d:	e8 3e ff ff ff       	call   801048e0 <argint>
801049a2:	83 c4 10             	add    $0x10,%esp
801049a5:	85 c0                	test   %eax,%eax
801049a7:	78 17                	js     801049c0 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
801049a9:	83 ec 08             	sub    $0x8,%esp
801049ac:	ff 75 0c             	pushl  0xc(%ebp)
801049af:	ff 75 f4             	pushl  -0xc(%ebp)
801049b2:	e8 b9 fe ff ff       	call   80104870 <fetchstr>
801049b7:	83 c4 10             	add    $0x10,%esp
}
801049ba:	c9                   	leave  
801049bb:	c3                   	ret    
801049bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801049c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801049c5:	c9                   	leave  
801049c6:	c3                   	ret    
801049c7:	89 f6                	mov    %esi,%esi
801049c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049d0 <getreadcount>:

int
getreadcount(void){
801049d0:	55                   	push   %ebp
  return counter;
}
801049d1:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
getreadcount(void){
801049d6:	89 e5                	mov    %esp,%ebp
}
801049d8:	5d                   	pop    %ebp
801049d9:	c3                   	ret    
801049da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801049e0 <syscall>:
};


void
syscall(void)
{
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	53                   	push   %ebx
801049e4:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
801049e7:	e8 a4 ee ff ff       	call   80103890 <myproc>
801049ec:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
801049ee:	8b 40 18             	mov    0x18(%eax),%eax
801049f1:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801049f4:	8d 50 ff             	lea    -0x1(%eax),%edx
801049f7:	83 fa 17             	cmp    $0x17,%edx
801049fa:	77 24                	ja     80104a20 <syscall+0x40>
801049fc:	8b 14 85 80 79 10 80 	mov    -0x7fef8680(,%eax,4),%edx
80104a03:	85 d2                	test   %edx,%edx
80104a05:	74 19                	je     80104a20 <syscall+0x40>

    if(num == SYS_read) counter++;
80104a07:	83 f8 05             	cmp    $0x5,%eax
80104a0a:	75 07                	jne    80104a13 <syscall+0x33>
80104a0c:	83 05 bc a5 10 80 01 	addl   $0x1,0x8010a5bc
    
    curproc->tf->eax = syscalls[num]();
80104a13:	ff d2                	call   *%edx
80104a15:	8b 53 18             	mov    0x18(%ebx),%edx
80104a18:	89 42 1c             	mov    %eax,0x1c(%edx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104a1b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a1e:	c9                   	leave  
80104a1f:	c3                   	ret    
    cprintf("%d %s: unknown sys call %d\n",
80104a20:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104a21:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104a24:	50                   	push   %eax
80104a25:	ff 73 10             	pushl  0x10(%ebx)
80104a28:	68 55 79 10 80       	push   $0x80107955
80104a2d:	e8 2e bc ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
80104a32:	8b 43 18             	mov    0x18(%ebx),%eax
80104a35:	83 c4 10             	add    $0x10,%esp
80104a38:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104a3f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a42:	c9                   	leave  
80104a43:	c3                   	ret    
80104a44:	66 90                	xchg   %ax,%ax
80104a46:	66 90                	xchg   %ax,%ax
80104a48:	66 90                	xchg   %ax,%ax
80104a4a:	66 90                	xchg   %ax,%ax
80104a4c:	66 90                	xchg   %ax,%ax
80104a4e:	66 90                	xchg   %ax,%ax

80104a50 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104a50:	55                   	push   %ebp
80104a51:	89 e5                	mov    %esp,%ebp
80104a53:	57                   	push   %edi
80104a54:	56                   	push   %esi
80104a55:	53                   	push   %ebx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104a56:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104a59:	83 ec 34             	sub    $0x34,%esp
80104a5c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104a5f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104a62:	56                   	push   %esi
80104a63:	50                   	push   %eax
{
80104a64:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104a67:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104a6a:	e8 d1 d4 ff ff       	call   80101f40 <nameiparent>
80104a6f:	83 c4 10             	add    $0x10,%esp
80104a72:	85 c0                	test   %eax,%eax
80104a74:	0f 84 46 01 00 00    	je     80104bc0 <create+0x170>
    return 0;
  ilock(dp);
80104a7a:	83 ec 0c             	sub    $0xc,%esp
80104a7d:	89 c3                	mov    %eax,%ebx
80104a7f:	50                   	push   %eax
80104a80:	e8 3b cc ff ff       	call   801016c0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104a85:	83 c4 0c             	add    $0xc,%esp
80104a88:	6a 00                	push   $0x0
80104a8a:	56                   	push   %esi
80104a8b:	53                   	push   %ebx
80104a8c:	e8 5f d1 ff ff       	call   80101bf0 <dirlookup>
80104a91:	83 c4 10             	add    $0x10,%esp
80104a94:	85 c0                	test   %eax,%eax
80104a96:	89 c7                	mov    %eax,%edi
80104a98:	74 36                	je     80104ad0 <create+0x80>
    iunlockput(dp);
80104a9a:	83 ec 0c             	sub    $0xc,%esp
80104a9d:	53                   	push   %ebx
80104a9e:	e8 ad ce ff ff       	call   80101950 <iunlockput>
    ilock(ip);
80104aa3:	89 3c 24             	mov    %edi,(%esp)
80104aa6:	e8 15 cc ff ff       	call   801016c0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104aab:	83 c4 10             	add    $0x10,%esp
80104aae:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104ab3:	0f 85 97 00 00 00    	jne    80104b50 <create+0x100>
80104ab9:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104abe:	0f 85 8c 00 00 00    	jne    80104b50 <create+0x100>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104ac4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ac7:	89 f8                	mov    %edi,%eax
80104ac9:	5b                   	pop    %ebx
80104aca:	5e                   	pop    %esi
80104acb:	5f                   	pop    %edi
80104acc:	5d                   	pop    %ebp
80104acd:	c3                   	ret    
80104ace:	66 90                	xchg   %ax,%ax
  if((ip = ialloc(dp->dev, type)) == 0)
80104ad0:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104ad4:	83 ec 08             	sub    $0x8,%esp
80104ad7:	50                   	push   %eax
80104ad8:	ff 33                	pushl  (%ebx)
80104ada:	e8 71 ca ff ff       	call   80101550 <ialloc>
80104adf:	83 c4 10             	add    $0x10,%esp
80104ae2:	85 c0                	test   %eax,%eax
80104ae4:	89 c7                	mov    %eax,%edi
80104ae6:	0f 84 e8 00 00 00    	je     80104bd4 <create+0x184>
  ilock(ip);
80104aec:	83 ec 0c             	sub    $0xc,%esp
80104aef:	50                   	push   %eax
80104af0:	e8 cb cb ff ff       	call   801016c0 <ilock>
  ip->major = major;
80104af5:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104af9:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104afd:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104b01:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104b05:	b8 01 00 00 00       	mov    $0x1,%eax
80104b0a:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104b0e:	89 3c 24             	mov    %edi,(%esp)
80104b11:	e8 fa ca ff ff       	call   80101610 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104b16:	83 c4 10             	add    $0x10,%esp
80104b19:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104b1e:	74 50                	je     80104b70 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104b20:	83 ec 04             	sub    $0x4,%esp
80104b23:	ff 77 04             	pushl  0x4(%edi)
80104b26:	56                   	push   %esi
80104b27:	53                   	push   %ebx
80104b28:	e8 33 d3 ff ff       	call   80101e60 <dirlink>
80104b2d:	83 c4 10             	add    $0x10,%esp
80104b30:	85 c0                	test   %eax,%eax
80104b32:	0f 88 8f 00 00 00    	js     80104bc7 <create+0x177>
  iunlockput(dp);
80104b38:	83 ec 0c             	sub    $0xc,%esp
80104b3b:	53                   	push   %ebx
80104b3c:	e8 0f ce ff ff       	call   80101950 <iunlockput>
  return ip;
80104b41:	83 c4 10             	add    $0x10,%esp
}
80104b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b47:	89 f8                	mov    %edi,%eax
80104b49:	5b                   	pop    %ebx
80104b4a:	5e                   	pop    %esi
80104b4b:	5f                   	pop    %edi
80104b4c:	5d                   	pop    %ebp
80104b4d:	c3                   	ret    
80104b4e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104b50:	83 ec 0c             	sub    $0xc,%esp
80104b53:	57                   	push   %edi
    return 0;
80104b54:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104b56:	e8 f5 cd ff ff       	call   80101950 <iunlockput>
    return 0;
80104b5b:	83 c4 10             	add    $0x10,%esp
}
80104b5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b61:	89 f8                	mov    %edi,%eax
80104b63:	5b                   	pop    %ebx
80104b64:	5e                   	pop    %esi
80104b65:	5f                   	pop    %edi
80104b66:	5d                   	pop    %ebp
80104b67:	c3                   	ret    
80104b68:	90                   	nop
80104b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink++;  // for ".."
80104b70:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104b75:	83 ec 0c             	sub    $0xc,%esp
80104b78:	53                   	push   %ebx
80104b79:	e8 92 ca ff ff       	call   80101610 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104b7e:	83 c4 0c             	add    $0xc,%esp
80104b81:	ff 77 04             	pushl  0x4(%edi)
80104b84:	68 00 7a 10 80       	push   $0x80107a00
80104b89:	57                   	push   %edi
80104b8a:	e8 d1 d2 ff ff       	call   80101e60 <dirlink>
80104b8f:	83 c4 10             	add    $0x10,%esp
80104b92:	85 c0                	test   %eax,%eax
80104b94:	78 1c                	js     80104bb2 <create+0x162>
80104b96:	83 ec 04             	sub    $0x4,%esp
80104b99:	ff 73 04             	pushl  0x4(%ebx)
80104b9c:	68 ff 79 10 80       	push   $0x801079ff
80104ba1:	57                   	push   %edi
80104ba2:	e8 b9 d2 ff ff       	call   80101e60 <dirlink>
80104ba7:	83 c4 10             	add    $0x10,%esp
80104baa:	85 c0                	test   %eax,%eax
80104bac:	0f 89 6e ff ff ff    	jns    80104b20 <create+0xd0>
      panic("create dots");
80104bb2:	83 ec 0c             	sub    $0xc,%esp
80104bb5:	68 f3 79 10 80       	push   $0x801079f3
80104bba:	e8 d1 b7 ff ff       	call   80100390 <panic>
80104bbf:	90                   	nop
    return 0;
80104bc0:	31 ff                	xor    %edi,%edi
80104bc2:	e9 fd fe ff ff       	jmp    80104ac4 <create+0x74>
    panic("create: dirlink");
80104bc7:	83 ec 0c             	sub    $0xc,%esp
80104bca:	68 02 7a 10 80       	push   $0x80107a02
80104bcf:	e8 bc b7 ff ff       	call   80100390 <panic>
    panic("create: ialloc");
80104bd4:	83 ec 0c             	sub    $0xc,%esp
80104bd7:	68 e4 79 10 80       	push   $0x801079e4
80104bdc:	e8 af b7 ff ff       	call   80100390 <panic>
80104be1:	eb 0d                	jmp    80104bf0 <argfd.constprop.0>
80104be3:	90                   	nop
80104be4:	90                   	nop
80104be5:	90                   	nop
80104be6:	90                   	nop
80104be7:	90                   	nop
80104be8:	90                   	nop
80104be9:	90                   	nop
80104bea:	90                   	nop
80104beb:	90                   	nop
80104bec:	90                   	nop
80104bed:	90                   	nop
80104bee:	90                   	nop
80104bef:	90                   	nop

80104bf0 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104bf0:	55                   	push   %ebp
80104bf1:	89 e5                	mov    %esp,%ebp
80104bf3:	56                   	push   %esi
80104bf4:	53                   	push   %ebx
80104bf5:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80104bf7:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104bfa:	89 d6                	mov    %edx,%esi
80104bfc:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104bff:	50                   	push   %eax
80104c00:	6a 00                	push   $0x0
80104c02:	e8 d9 fc ff ff       	call   801048e0 <argint>
80104c07:	83 c4 10             	add    $0x10,%esp
80104c0a:	85 c0                	test   %eax,%eax
80104c0c:	78 2a                	js     80104c38 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104c0e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104c12:	77 24                	ja     80104c38 <argfd.constprop.0+0x48>
80104c14:	e8 77 ec ff ff       	call   80103890 <myproc>
80104c19:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104c1c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104c20:	85 c0                	test   %eax,%eax
80104c22:	74 14                	je     80104c38 <argfd.constprop.0+0x48>
  if(pfd)
80104c24:	85 db                	test   %ebx,%ebx
80104c26:	74 02                	je     80104c2a <argfd.constprop.0+0x3a>
    *pfd = fd;
80104c28:	89 13                	mov    %edx,(%ebx)
    *pf = f;
80104c2a:	89 06                	mov    %eax,(%esi)
  return 0;
80104c2c:	31 c0                	xor    %eax,%eax
}
80104c2e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c31:	5b                   	pop    %ebx
80104c32:	5e                   	pop    %esi
80104c33:	5d                   	pop    %ebp
80104c34:	c3                   	ret    
80104c35:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104c38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c3d:	eb ef                	jmp    80104c2e <argfd.constprop.0+0x3e>
80104c3f:	90                   	nop

80104c40 <sys_dup>:
{
80104c40:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104c41:	31 c0                	xor    %eax,%eax
{
80104c43:	89 e5                	mov    %esp,%ebp
80104c45:	56                   	push   %esi
80104c46:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104c47:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104c4a:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104c4d:	e8 9e ff ff ff       	call   80104bf0 <argfd.constprop.0>
80104c52:	85 c0                	test   %eax,%eax
80104c54:	78 42                	js     80104c98 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
80104c56:	8b 75 f4             	mov    -0xc(%ebp),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104c59:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80104c5b:	e8 30 ec ff ff       	call   80103890 <myproc>
80104c60:	eb 0e                	jmp    80104c70 <sys_dup+0x30>
80104c62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104c68:	83 c3 01             	add    $0x1,%ebx
80104c6b:	83 fb 10             	cmp    $0x10,%ebx
80104c6e:	74 28                	je     80104c98 <sys_dup+0x58>
    if(curproc->ofile[fd] == 0){
80104c70:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104c74:	85 d2                	test   %edx,%edx
80104c76:	75 f0                	jne    80104c68 <sys_dup+0x28>
      curproc->ofile[fd] = f;
80104c78:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104c7c:	83 ec 0c             	sub    $0xc,%esp
80104c7f:	ff 75 f4             	pushl  -0xc(%ebp)
80104c82:	e8 a9 c1 ff ff       	call   80100e30 <filedup>
  return fd;
80104c87:	83 c4 10             	add    $0x10,%esp
}
80104c8a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c8d:	89 d8                	mov    %ebx,%eax
80104c8f:	5b                   	pop    %ebx
80104c90:	5e                   	pop    %esi
80104c91:	5d                   	pop    %ebp
80104c92:	c3                   	ret    
80104c93:	90                   	nop
80104c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c98:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104c9b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104ca0:	89 d8                	mov    %ebx,%eax
80104ca2:	5b                   	pop    %ebx
80104ca3:	5e                   	pop    %esi
80104ca4:	5d                   	pop    %ebp
80104ca5:	c3                   	ret    
80104ca6:	8d 76 00             	lea    0x0(%esi),%esi
80104ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cb0 <sys_read>:
{
80104cb0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104cb1:	31 c0                	xor    %eax,%eax
{
80104cb3:	89 e5                	mov    %esp,%ebp
80104cb5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104cb8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104cbb:	e8 30 ff ff ff       	call   80104bf0 <argfd.constprop.0>
80104cc0:	85 c0                	test   %eax,%eax
80104cc2:	78 4c                	js     80104d10 <sys_read+0x60>
80104cc4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cc7:	83 ec 08             	sub    $0x8,%esp
80104cca:	50                   	push   %eax
80104ccb:	6a 02                	push   $0x2
80104ccd:	e8 0e fc ff ff       	call   801048e0 <argint>
80104cd2:	83 c4 10             	add    $0x10,%esp
80104cd5:	85 c0                	test   %eax,%eax
80104cd7:	78 37                	js     80104d10 <sys_read+0x60>
80104cd9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cdc:	83 ec 04             	sub    $0x4,%esp
80104cdf:	ff 75 f0             	pushl  -0x10(%ebp)
80104ce2:	50                   	push   %eax
80104ce3:	6a 01                	push   $0x1
80104ce5:	e8 46 fc ff ff       	call   80104930 <argptr>
80104cea:	83 c4 10             	add    $0x10,%esp
80104ced:	85 c0                	test   %eax,%eax
80104cef:	78 1f                	js     80104d10 <sys_read+0x60>
  return fileread(f, p, n);
80104cf1:	83 ec 04             	sub    $0x4,%esp
80104cf4:	ff 75 f0             	pushl  -0x10(%ebp)
80104cf7:	ff 75 f4             	pushl  -0xc(%ebp)
80104cfa:	ff 75 ec             	pushl  -0x14(%ebp)
80104cfd:	e8 9e c2 ff ff       	call   80100fa0 <fileread>
80104d02:	83 c4 10             	add    $0x10,%esp
}
80104d05:	c9                   	leave  
80104d06:	c3                   	ret    
80104d07:	89 f6                	mov    %esi,%esi
80104d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104d10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d15:	c9                   	leave  
80104d16:	c3                   	ret    
80104d17:	89 f6                	mov    %esi,%esi
80104d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d20 <sys_write>:
{
80104d20:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d21:	31 c0                	xor    %eax,%eax
{
80104d23:	89 e5                	mov    %esp,%ebp
80104d25:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d28:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d2b:	e8 c0 fe ff ff       	call   80104bf0 <argfd.constprop.0>
80104d30:	85 c0                	test   %eax,%eax
80104d32:	78 4c                	js     80104d80 <sys_write+0x60>
80104d34:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d37:	83 ec 08             	sub    $0x8,%esp
80104d3a:	50                   	push   %eax
80104d3b:	6a 02                	push   $0x2
80104d3d:	e8 9e fb ff ff       	call   801048e0 <argint>
80104d42:	83 c4 10             	add    $0x10,%esp
80104d45:	85 c0                	test   %eax,%eax
80104d47:	78 37                	js     80104d80 <sys_write+0x60>
80104d49:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d4c:	83 ec 04             	sub    $0x4,%esp
80104d4f:	ff 75 f0             	pushl  -0x10(%ebp)
80104d52:	50                   	push   %eax
80104d53:	6a 01                	push   $0x1
80104d55:	e8 d6 fb ff ff       	call   80104930 <argptr>
80104d5a:	83 c4 10             	add    $0x10,%esp
80104d5d:	85 c0                	test   %eax,%eax
80104d5f:	78 1f                	js     80104d80 <sys_write+0x60>
  return filewrite(f, p, n);
80104d61:	83 ec 04             	sub    $0x4,%esp
80104d64:	ff 75 f0             	pushl  -0x10(%ebp)
80104d67:	ff 75 f4             	pushl  -0xc(%ebp)
80104d6a:	ff 75 ec             	pushl  -0x14(%ebp)
80104d6d:	e8 be c2 ff ff       	call   80101030 <filewrite>
80104d72:	83 c4 10             	add    $0x10,%esp
}
80104d75:	c9                   	leave  
80104d76:	c3                   	ret    
80104d77:	89 f6                	mov    %esi,%esi
80104d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104d80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d85:	c9                   	leave  
80104d86:	c3                   	ret    
80104d87:	89 f6                	mov    %esi,%esi
80104d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d90 <sys_close>:
{
80104d90:	55                   	push   %ebp
80104d91:	89 e5                	mov    %esp,%ebp
80104d93:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104d96:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104d99:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d9c:	e8 4f fe ff ff       	call   80104bf0 <argfd.constprop.0>
80104da1:	85 c0                	test   %eax,%eax
80104da3:	78 2b                	js     80104dd0 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
80104da5:	e8 e6 ea ff ff       	call   80103890 <myproc>
80104daa:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104dad:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80104db0:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104db7:	00 
  fileclose(f);
80104db8:	ff 75 f4             	pushl  -0xc(%ebp)
80104dbb:	e8 c0 c0 ff ff       	call   80100e80 <fileclose>
  return 0;
80104dc0:	83 c4 10             	add    $0x10,%esp
80104dc3:	31 c0                	xor    %eax,%eax
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

80104de0 <sys_fstat>:
{
80104de0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104de1:	31 c0                	xor    %eax,%eax
{
80104de3:	89 e5                	mov    %esp,%ebp
80104de5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104de8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104deb:	e8 00 fe ff ff       	call   80104bf0 <argfd.constprop.0>
80104df0:	85 c0                	test   %eax,%eax
80104df2:	78 2c                	js     80104e20 <sys_fstat+0x40>
80104df4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104df7:	83 ec 04             	sub    $0x4,%esp
80104dfa:	6a 14                	push   $0x14
80104dfc:	50                   	push   %eax
80104dfd:	6a 01                	push   $0x1
80104dff:	e8 2c fb ff ff       	call   80104930 <argptr>
80104e04:	83 c4 10             	add    $0x10,%esp
80104e07:	85 c0                	test   %eax,%eax
80104e09:	78 15                	js     80104e20 <sys_fstat+0x40>
  return filestat(f, st);
80104e0b:	83 ec 08             	sub    $0x8,%esp
80104e0e:	ff 75 f4             	pushl  -0xc(%ebp)
80104e11:	ff 75 f0             	pushl  -0x10(%ebp)
80104e14:	e8 37 c1 ff ff       	call   80100f50 <filestat>
80104e19:	83 c4 10             	add    $0x10,%esp
}
80104e1c:	c9                   	leave  
80104e1d:	c3                   	ret    
80104e1e:	66 90                	xchg   %ax,%ax
    return -1;
80104e20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e25:	c9                   	leave  
80104e26:	c3                   	ret    
80104e27:	89 f6                	mov    %esi,%esi
80104e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e30 <sys_link>:
{
80104e30:	55                   	push   %ebp
80104e31:	89 e5                	mov    %esp,%ebp
80104e33:	57                   	push   %edi
80104e34:	56                   	push   %esi
80104e35:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104e36:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104e39:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104e3c:	50                   	push   %eax
80104e3d:	6a 00                	push   $0x0
80104e3f:	e8 4c fb ff ff       	call   80104990 <argstr>
80104e44:	83 c4 10             	add    $0x10,%esp
80104e47:	85 c0                	test   %eax,%eax
80104e49:	0f 88 fb 00 00 00    	js     80104f4a <sys_link+0x11a>
80104e4f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104e52:	83 ec 08             	sub    $0x8,%esp
80104e55:	50                   	push   %eax
80104e56:	6a 01                	push   $0x1
80104e58:	e8 33 fb ff ff       	call   80104990 <argstr>
80104e5d:	83 c4 10             	add    $0x10,%esp
80104e60:	85 c0                	test   %eax,%eax
80104e62:	0f 88 e2 00 00 00    	js     80104f4a <sys_link+0x11a>
  begin_op();
80104e68:	e8 c3 dd ff ff       	call   80102c30 <begin_op>
  if((ip = namei(old)) == 0){
80104e6d:	83 ec 0c             	sub    $0xc,%esp
80104e70:	ff 75 d4             	pushl  -0x2c(%ebp)
80104e73:	e8 a8 d0 ff ff       	call   80101f20 <namei>
80104e78:	83 c4 10             	add    $0x10,%esp
80104e7b:	85 c0                	test   %eax,%eax
80104e7d:	89 c3                	mov    %eax,%ebx
80104e7f:	0f 84 ea 00 00 00    	je     80104f6f <sys_link+0x13f>
  ilock(ip);
80104e85:	83 ec 0c             	sub    $0xc,%esp
80104e88:	50                   	push   %eax
80104e89:	e8 32 c8 ff ff       	call   801016c0 <ilock>
  if(ip->type == T_DIR){
80104e8e:	83 c4 10             	add    $0x10,%esp
80104e91:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104e96:	0f 84 bb 00 00 00    	je     80104f57 <sys_link+0x127>
  ip->nlink++;
80104e9c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ea1:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80104ea4:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104ea7:	53                   	push   %ebx
80104ea8:	e8 63 c7 ff ff       	call   80101610 <iupdate>
  iunlock(ip);
80104ead:	89 1c 24             	mov    %ebx,(%esp)
80104eb0:	e8 eb c8 ff ff       	call   801017a0 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104eb5:	58                   	pop    %eax
80104eb6:	5a                   	pop    %edx
80104eb7:	57                   	push   %edi
80104eb8:	ff 75 d0             	pushl  -0x30(%ebp)
80104ebb:	e8 80 d0 ff ff       	call   80101f40 <nameiparent>
80104ec0:	83 c4 10             	add    $0x10,%esp
80104ec3:	85 c0                	test   %eax,%eax
80104ec5:	89 c6                	mov    %eax,%esi
80104ec7:	74 5b                	je     80104f24 <sys_link+0xf4>
  ilock(dp);
80104ec9:	83 ec 0c             	sub    $0xc,%esp
80104ecc:	50                   	push   %eax
80104ecd:	e8 ee c7 ff ff       	call   801016c0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104ed2:	83 c4 10             	add    $0x10,%esp
80104ed5:	8b 03                	mov    (%ebx),%eax
80104ed7:	39 06                	cmp    %eax,(%esi)
80104ed9:	75 3d                	jne    80104f18 <sys_link+0xe8>
80104edb:	83 ec 04             	sub    $0x4,%esp
80104ede:	ff 73 04             	pushl  0x4(%ebx)
80104ee1:	57                   	push   %edi
80104ee2:	56                   	push   %esi
80104ee3:	e8 78 cf ff ff       	call   80101e60 <dirlink>
80104ee8:	83 c4 10             	add    $0x10,%esp
80104eeb:	85 c0                	test   %eax,%eax
80104eed:	78 29                	js     80104f18 <sys_link+0xe8>
  iunlockput(dp);
80104eef:	83 ec 0c             	sub    $0xc,%esp
80104ef2:	56                   	push   %esi
80104ef3:	e8 58 ca ff ff       	call   80101950 <iunlockput>
  iput(ip);
80104ef8:	89 1c 24             	mov    %ebx,(%esp)
80104efb:	e8 f0 c8 ff ff       	call   801017f0 <iput>
  end_op();
80104f00:	e8 9b dd ff ff       	call   80102ca0 <end_op>
  return 0;
80104f05:	83 c4 10             	add    $0x10,%esp
80104f08:	31 c0                	xor    %eax,%eax
}
80104f0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f0d:	5b                   	pop    %ebx
80104f0e:	5e                   	pop    %esi
80104f0f:	5f                   	pop    %edi
80104f10:	5d                   	pop    %ebp
80104f11:	c3                   	ret    
80104f12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80104f18:	83 ec 0c             	sub    $0xc,%esp
80104f1b:	56                   	push   %esi
80104f1c:	e8 2f ca ff ff       	call   80101950 <iunlockput>
    goto bad;
80104f21:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104f24:	83 ec 0c             	sub    $0xc,%esp
80104f27:	53                   	push   %ebx
80104f28:	e8 93 c7 ff ff       	call   801016c0 <ilock>
  ip->nlink--;
80104f2d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f32:	89 1c 24             	mov    %ebx,(%esp)
80104f35:	e8 d6 c6 ff ff       	call   80101610 <iupdate>
  iunlockput(ip);
80104f3a:	89 1c 24             	mov    %ebx,(%esp)
80104f3d:	e8 0e ca ff ff       	call   80101950 <iunlockput>
  end_op();
80104f42:	e8 59 dd ff ff       	call   80102ca0 <end_op>
  return -1;
80104f47:	83 c4 10             	add    $0x10,%esp
}
80104f4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
80104f4d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f52:	5b                   	pop    %ebx
80104f53:	5e                   	pop    %esi
80104f54:	5f                   	pop    %edi
80104f55:	5d                   	pop    %ebp
80104f56:	c3                   	ret    
    iunlockput(ip);
80104f57:	83 ec 0c             	sub    $0xc,%esp
80104f5a:	53                   	push   %ebx
80104f5b:	e8 f0 c9 ff ff       	call   80101950 <iunlockput>
    end_op();
80104f60:	e8 3b dd ff ff       	call   80102ca0 <end_op>
    return -1;
80104f65:	83 c4 10             	add    $0x10,%esp
80104f68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f6d:	eb 9b                	jmp    80104f0a <sys_link+0xda>
    end_op();
80104f6f:	e8 2c dd ff ff       	call   80102ca0 <end_op>
    return -1;
80104f74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f79:	eb 8f                	jmp    80104f0a <sys_link+0xda>
80104f7b:	90                   	nop
80104f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104f80 <sys_unlink>:
{
80104f80:	55                   	push   %ebp
80104f81:	89 e5                	mov    %esp,%ebp
80104f83:	57                   	push   %edi
80104f84:	56                   	push   %esi
80104f85:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80104f86:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80104f89:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
80104f8c:	50                   	push   %eax
80104f8d:	6a 00                	push   $0x0
80104f8f:	e8 fc f9 ff ff       	call   80104990 <argstr>
80104f94:	83 c4 10             	add    $0x10,%esp
80104f97:	85 c0                	test   %eax,%eax
80104f99:	0f 88 77 01 00 00    	js     80105116 <sys_unlink+0x196>
  if((dp = nameiparent(path, name)) == 0){
80104f9f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
80104fa2:	e8 89 dc ff ff       	call   80102c30 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104fa7:	83 ec 08             	sub    $0x8,%esp
80104faa:	53                   	push   %ebx
80104fab:	ff 75 c0             	pushl  -0x40(%ebp)
80104fae:	e8 8d cf ff ff       	call   80101f40 <nameiparent>
80104fb3:	83 c4 10             	add    $0x10,%esp
80104fb6:	85 c0                	test   %eax,%eax
80104fb8:	89 c6                	mov    %eax,%esi
80104fba:	0f 84 60 01 00 00    	je     80105120 <sys_unlink+0x1a0>
  ilock(dp);
80104fc0:	83 ec 0c             	sub    $0xc,%esp
80104fc3:	50                   	push   %eax
80104fc4:	e8 f7 c6 ff ff       	call   801016c0 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104fc9:	58                   	pop    %eax
80104fca:	5a                   	pop    %edx
80104fcb:	68 00 7a 10 80       	push   $0x80107a00
80104fd0:	53                   	push   %ebx
80104fd1:	e8 fa cb ff ff       	call   80101bd0 <namecmp>
80104fd6:	83 c4 10             	add    $0x10,%esp
80104fd9:	85 c0                	test   %eax,%eax
80104fdb:	0f 84 03 01 00 00    	je     801050e4 <sys_unlink+0x164>
80104fe1:	83 ec 08             	sub    $0x8,%esp
80104fe4:	68 ff 79 10 80       	push   $0x801079ff
80104fe9:	53                   	push   %ebx
80104fea:	e8 e1 cb ff ff       	call   80101bd0 <namecmp>
80104fef:	83 c4 10             	add    $0x10,%esp
80104ff2:	85 c0                	test   %eax,%eax
80104ff4:	0f 84 ea 00 00 00    	je     801050e4 <sys_unlink+0x164>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104ffa:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104ffd:	83 ec 04             	sub    $0x4,%esp
80105000:	50                   	push   %eax
80105001:	53                   	push   %ebx
80105002:	56                   	push   %esi
80105003:	e8 e8 cb ff ff       	call   80101bf0 <dirlookup>
80105008:	83 c4 10             	add    $0x10,%esp
8010500b:	85 c0                	test   %eax,%eax
8010500d:	89 c3                	mov    %eax,%ebx
8010500f:	0f 84 cf 00 00 00    	je     801050e4 <sys_unlink+0x164>
  ilock(ip);
80105015:	83 ec 0c             	sub    $0xc,%esp
80105018:	50                   	push   %eax
80105019:	e8 a2 c6 ff ff       	call   801016c0 <ilock>
  if(ip->nlink < 1)
8010501e:	83 c4 10             	add    $0x10,%esp
80105021:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80105026:	0f 8e 10 01 00 00    	jle    8010513c <sys_unlink+0x1bc>
  if(ip->type == T_DIR && !isdirempty(ip)){
8010502c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105031:	74 6d                	je     801050a0 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80105033:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105036:	83 ec 04             	sub    $0x4,%esp
80105039:	6a 10                	push   $0x10
8010503b:	6a 00                	push   $0x0
8010503d:	50                   	push   %eax
8010503e:	e8 9d f5 ff ff       	call   801045e0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105043:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105046:	6a 10                	push   $0x10
80105048:	ff 75 c4             	pushl  -0x3c(%ebp)
8010504b:	50                   	push   %eax
8010504c:	56                   	push   %esi
8010504d:	e8 4e ca ff ff       	call   80101aa0 <writei>
80105052:	83 c4 20             	add    $0x20,%esp
80105055:	83 f8 10             	cmp    $0x10,%eax
80105058:	0f 85 eb 00 00 00    	jne    80105149 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
8010505e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105063:	0f 84 97 00 00 00    	je     80105100 <sys_unlink+0x180>
  iunlockput(dp);
80105069:	83 ec 0c             	sub    $0xc,%esp
8010506c:	56                   	push   %esi
8010506d:	e8 de c8 ff ff       	call   80101950 <iunlockput>
  ip->nlink--;
80105072:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105077:	89 1c 24             	mov    %ebx,(%esp)
8010507a:	e8 91 c5 ff ff       	call   80101610 <iupdate>
  iunlockput(ip);
8010507f:	89 1c 24             	mov    %ebx,(%esp)
80105082:	e8 c9 c8 ff ff       	call   80101950 <iunlockput>
  end_op();
80105087:	e8 14 dc ff ff       	call   80102ca0 <end_op>
  return 0;
8010508c:	83 c4 10             	add    $0x10,%esp
8010508f:	31 c0                	xor    %eax,%eax
}
80105091:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105094:	5b                   	pop    %ebx
80105095:	5e                   	pop    %esi
80105096:	5f                   	pop    %edi
80105097:	5d                   	pop    %ebp
80105098:	c3                   	ret    
80105099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801050a0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801050a4:	76 8d                	jbe    80105033 <sys_unlink+0xb3>
801050a6:	bf 20 00 00 00       	mov    $0x20,%edi
801050ab:	eb 0f                	jmp    801050bc <sys_unlink+0x13c>
801050ad:	8d 76 00             	lea    0x0(%esi),%esi
801050b0:	83 c7 10             	add    $0x10,%edi
801050b3:	3b 7b 58             	cmp    0x58(%ebx),%edi
801050b6:	0f 83 77 ff ff ff    	jae    80105033 <sys_unlink+0xb3>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801050bc:	8d 45 d8             	lea    -0x28(%ebp),%eax
801050bf:	6a 10                	push   $0x10
801050c1:	57                   	push   %edi
801050c2:	50                   	push   %eax
801050c3:	53                   	push   %ebx
801050c4:	e8 d7 c8 ff ff       	call   801019a0 <readi>
801050c9:	83 c4 10             	add    $0x10,%esp
801050cc:	83 f8 10             	cmp    $0x10,%eax
801050cf:	75 5e                	jne    8010512f <sys_unlink+0x1af>
    if(de.inum != 0)
801050d1:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801050d6:	74 d8                	je     801050b0 <sys_unlink+0x130>
    iunlockput(ip);
801050d8:	83 ec 0c             	sub    $0xc,%esp
801050db:	53                   	push   %ebx
801050dc:	e8 6f c8 ff ff       	call   80101950 <iunlockput>
    goto bad;
801050e1:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
801050e4:	83 ec 0c             	sub    $0xc,%esp
801050e7:	56                   	push   %esi
801050e8:	e8 63 c8 ff ff       	call   80101950 <iunlockput>
  end_op();
801050ed:	e8 ae db ff ff       	call   80102ca0 <end_op>
  return -1;
801050f2:	83 c4 10             	add    $0x10,%esp
801050f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050fa:	eb 95                	jmp    80105091 <sys_unlink+0x111>
801050fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
80105100:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
    iupdate(dp);
80105105:	83 ec 0c             	sub    $0xc,%esp
80105108:	56                   	push   %esi
80105109:	e8 02 c5 ff ff       	call   80101610 <iupdate>
8010510e:	83 c4 10             	add    $0x10,%esp
80105111:	e9 53 ff ff ff       	jmp    80105069 <sys_unlink+0xe9>
    return -1;
80105116:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010511b:	e9 71 ff ff ff       	jmp    80105091 <sys_unlink+0x111>
    end_op();
80105120:	e8 7b db ff ff       	call   80102ca0 <end_op>
    return -1;
80105125:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010512a:	e9 62 ff ff ff       	jmp    80105091 <sys_unlink+0x111>
      panic("isdirempty: readi");
8010512f:	83 ec 0c             	sub    $0xc,%esp
80105132:	68 24 7a 10 80       	push   $0x80107a24
80105137:	e8 54 b2 ff ff       	call   80100390 <panic>
    panic("unlink: nlink < 1");
8010513c:	83 ec 0c             	sub    $0xc,%esp
8010513f:	68 12 7a 10 80       	push   $0x80107a12
80105144:	e8 47 b2 ff ff       	call   80100390 <panic>
    panic("unlink: writei");
80105149:	83 ec 0c             	sub    $0xc,%esp
8010514c:	68 36 7a 10 80       	push   $0x80107a36
80105151:	e8 3a b2 ff ff       	call   80100390 <panic>
80105156:	8d 76 00             	lea    0x0(%esi),%esi
80105159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105160 <sys_open>:

int
sys_open(void)
{
80105160:	55                   	push   %ebp
80105161:	89 e5                	mov    %esp,%ebp
80105163:	57                   	push   %edi
80105164:	56                   	push   %esi
80105165:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105166:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105169:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010516c:	50                   	push   %eax
8010516d:	6a 00                	push   $0x0
8010516f:	e8 1c f8 ff ff       	call   80104990 <argstr>
80105174:	83 c4 10             	add    $0x10,%esp
80105177:	85 c0                	test   %eax,%eax
80105179:	0f 88 1d 01 00 00    	js     8010529c <sys_open+0x13c>
8010517f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105182:	83 ec 08             	sub    $0x8,%esp
80105185:	50                   	push   %eax
80105186:	6a 01                	push   $0x1
80105188:	e8 53 f7 ff ff       	call   801048e0 <argint>
8010518d:	83 c4 10             	add    $0x10,%esp
80105190:	85 c0                	test   %eax,%eax
80105192:	0f 88 04 01 00 00    	js     8010529c <sys_open+0x13c>
    return -1;

  begin_op();
80105198:	e8 93 da ff ff       	call   80102c30 <begin_op>

  if(omode & O_CREATE){
8010519d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801051a1:	0f 85 a9 00 00 00    	jne    80105250 <sys_open+0xf0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801051a7:	83 ec 0c             	sub    $0xc,%esp
801051aa:	ff 75 e0             	pushl  -0x20(%ebp)
801051ad:	e8 6e cd ff ff       	call   80101f20 <namei>
801051b2:	83 c4 10             	add    $0x10,%esp
801051b5:	85 c0                	test   %eax,%eax
801051b7:	89 c6                	mov    %eax,%esi
801051b9:	0f 84 b2 00 00 00    	je     80105271 <sys_open+0x111>
      end_op();
      return -1;
    }
    ilock(ip);
801051bf:	83 ec 0c             	sub    $0xc,%esp
801051c2:	50                   	push   %eax
801051c3:	e8 f8 c4 ff ff       	call   801016c0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801051c8:	83 c4 10             	add    $0x10,%esp
801051cb:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801051d0:	0f 84 aa 00 00 00    	je     80105280 <sys_open+0x120>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801051d6:	e8 e5 bb ff ff       	call   80100dc0 <filealloc>
801051db:	85 c0                	test   %eax,%eax
801051dd:	89 c7                	mov    %eax,%edi
801051df:	0f 84 a6 00 00 00    	je     8010528b <sys_open+0x12b>
  struct proc *curproc = myproc();
801051e5:	e8 a6 e6 ff ff       	call   80103890 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801051ea:	31 db                	xor    %ebx,%ebx
801051ec:	eb 0e                	jmp    801051fc <sys_open+0x9c>
801051ee:	66 90                	xchg   %ax,%ax
801051f0:	83 c3 01             	add    $0x1,%ebx
801051f3:	83 fb 10             	cmp    $0x10,%ebx
801051f6:	0f 84 ac 00 00 00    	je     801052a8 <sys_open+0x148>
    if(curproc->ofile[fd] == 0){
801051fc:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105200:	85 d2                	test   %edx,%edx
80105202:	75 ec                	jne    801051f0 <sys_open+0x90>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105204:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80105207:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
8010520b:	56                   	push   %esi
8010520c:	e8 8f c5 ff ff       	call   801017a0 <iunlock>
  end_op();
80105211:	e8 8a da ff ff       	call   80102ca0 <end_op>

  f->type = FD_INODE;
80105216:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
8010521c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010521f:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
80105222:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105225:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
8010522c:	89 d0                	mov    %edx,%eax
8010522e:	f7 d0                	not    %eax
80105230:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105233:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
80105236:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105239:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
8010523d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105240:	89 d8                	mov    %ebx,%eax
80105242:	5b                   	pop    %ebx
80105243:	5e                   	pop    %esi
80105244:	5f                   	pop    %edi
80105245:	5d                   	pop    %ebp
80105246:	c3                   	ret    
80105247:	89 f6                	mov    %esi,%esi
80105249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ip = create(path, T_FILE, 0, 0);
80105250:	83 ec 0c             	sub    $0xc,%esp
80105253:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105256:	31 c9                	xor    %ecx,%ecx
80105258:	6a 00                	push   $0x0
8010525a:	ba 02 00 00 00       	mov    $0x2,%edx
8010525f:	e8 ec f7 ff ff       	call   80104a50 <create>
    if(ip == 0){
80105264:	83 c4 10             	add    $0x10,%esp
80105267:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105269:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010526b:	0f 85 65 ff ff ff    	jne    801051d6 <sys_open+0x76>
      end_op();
80105271:	e8 2a da ff ff       	call   80102ca0 <end_op>
      return -1;
80105276:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010527b:	eb c0                	jmp    8010523d <sys_open+0xdd>
8010527d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105280:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105283:	85 c9                	test   %ecx,%ecx
80105285:	0f 84 4b ff ff ff    	je     801051d6 <sys_open+0x76>
    iunlockput(ip);
8010528b:	83 ec 0c             	sub    $0xc,%esp
8010528e:	56                   	push   %esi
8010528f:	e8 bc c6 ff ff       	call   80101950 <iunlockput>
    end_op();
80105294:	e8 07 da ff ff       	call   80102ca0 <end_op>
    return -1;
80105299:	83 c4 10             	add    $0x10,%esp
8010529c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801052a1:	eb 9a                	jmp    8010523d <sys_open+0xdd>
801052a3:	90                   	nop
801052a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
801052a8:	83 ec 0c             	sub    $0xc,%esp
801052ab:	57                   	push   %edi
801052ac:	e8 cf bb ff ff       	call   80100e80 <fileclose>
801052b1:	83 c4 10             	add    $0x10,%esp
801052b4:	eb d5                	jmp    8010528b <sys_open+0x12b>
801052b6:	8d 76 00             	lea    0x0(%esi),%esi
801052b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801052c0 <sys_mkdir>:

int
sys_mkdir(void)
{
801052c0:	55                   	push   %ebp
801052c1:	89 e5                	mov    %esp,%ebp
801052c3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801052c6:	e8 65 d9 ff ff       	call   80102c30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801052cb:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052ce:	83 ec 08             	sub    $0x8,%esp
801052d1:	50                   	push   %eax
801052d2:	6a 00                	push   $0x0
801052d4:	e8 b7 f6 ff ff       	call   80104990 <argstr>
801052d9:	83 c4 10             	add    $0x10,%esp
801052dc:	85 c0                	test   %eax,%eax
801052de:	78 30                	js     80105310 <sys_mkdir+0x50>
801052e0:	83 ec 0c             	sub    $0xc,%esp
801052e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801052e6:	31 c9                	xor    %ecx,%ecx
801052e8:	6a 00                	push   $0x0
801052ea:	ba 01 00 00 00       	mov    $0x1,%edx
801052ef:	e8 5c f7 ff ff       	call   80104a50 <create>
801052f4:	83 c4 10             	add    $0x10,%esp
801052f7:	85 c0                	test   %eax,%eax
801052f9:	74 15                	je     80105310 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801052fb:	83 ec 0c             	sub    $0xc,%esp
801052fe:	50                   	push   %eax
801052ff:	e8 4c c6 ff ff       	call   80101950 <iunlockput>
  end_op();
80105304:	e8 97 d9 ff ff       	call   80102ca0 <end_op>
  return 0;
80105309:	83 c4 10             	add    $0x10,%esp
8010530c:	31 c0                	xor    %eax,%eax
}
8010530e:	c9                   	leave  
8010530f:	c3                   	ret    
    end_op();
80105310:	e8 8b d9 ff ff       	call   80102ca0 <end_op>
    return -1;
80105315:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010531a:	c9                   	leave  
8010531b:	c3                   	ret    
8010531c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105320 <sys_mknod>:

int
sys_mknod(void)
{
80105320:	55                   	push   %ebp
80105321:	89 e5                	mov    %esp,%ebp
80105323:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105326:	e8 05 d9 ff ff       	call   80102c30 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010532b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010532e:	83 ec 08             	sub    $0x8,%esp
80105331:	50                   	push   %eax
80105332:	6a 00                	push   $0x0
80105334:	e8 57 f6 ff ff       	call   80104990 <argstr>
80105339:	83 c4 10             	add    $0x10,%esp
8010533c:	85 c0                	test   %eax,%eax
8010533e:	78 60                	js     801053a0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105340:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105343:	83 ec 08             	sub    $0x8,%esp
80105346:	50                   	push   %eax
80105347:	6a 01                	push   $0x1
80105349:	e8 92 f5 ff ff       	call   801048e0 <argint>
  if((argstr(0, &path)) < 0 ||
8010534e:	83 c4 10             	add    $0x10,%esp
80105351:	85 c0                	test   %eax,%eax
80105353:	78 4b                	js     801053a0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105355:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105358:	83 ec 08             	sub    $0x8,%esp
8010535b:	50                   	push   %eax
8010535c:	6a 02                	push   $0x2
8010535e:	e8 7d f5 ff ff       	call   801048e0 <argint>
     argint(1, &major) < 0 ||
80105363:	83 c4 10             	add    $0x10,%esp
80105366:	85 c0                	test   %eax,%eax
80105368:	78 36                	js     801053a0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010536a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010536e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105371:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
80105375:	ba 03 00 00 00       	mov    $0x3,%edx
8010537a:	50                   	push   %eax
8010537b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010537e:	e8 cd f6 ff ff       	call   80104a50 <create>
80105383:	83 c4 10             	add    $0x10,%esp
80105386:	85 c0                	test   %eax,%eax
80105388:	74 16                	je     801053a0 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010538a:	83 ec 0c             	sub    $0xc,%esp
8010538d:	50                   	push   %eax
8010538e:	e8 bd c5 ff ff       	call   80101950 <iunlockput>
  end_op();
80105393:	e8 08 d9 ff ff       	call   80102ca0 <end_op>
  return 0;
80105398:	83 c4 10             	add    $0x10,%esp
8010539b:	31 c0                	xor    %eax,%eax
}
8010539d:	c9                   	leave  
8010539e:	c3                   	ret    
8010539f:	90                   	nop
    end_op();
801053a0:	e8 fb d8 ff ff       	call   80102ca0 <end_op>
    return -1;
801053a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053aa:	c9                   	leave  
801053ab:	c3                   	ret    
801053ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053b0 <sys_chdir>:

int
sys_chdir(void)
{
801053b0:	55                   	push   %ebp
801053b1:	89 e5                	mov    %esp,%ebp
801053b3:	56                   	push   %esi
801053b4:	53                   	push   %ebx
801053b5:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
801053b8:	e8 d3 e4 ff ff       	call   80103890 <myproc>
801053bd:	89 c6                	mov    %eax,%esi
  
  begin_op();
801053bf:	e8 6c d8 ff ff       	call   80102c30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801053c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053c7:	83 ec 08             	sub    $0x8,%esp
801053ca:	50                   	push   %eax
801053cb:	6a 00                	push   $0x0
801053cd:	e8 be f5 ff ff       	call   80104990 <argstr>
801053d2:	83 c4 10             	add    $0x10,%esp
801053d5:	85 c0                	test   %eax,%eax
801053d7:	78 77                	js     80105450 <sys_chdir+0xa0>
801053d9:	83 ec 0c             	sub    $0xc,%esp
801053dc:	ff 75 f4             	pushl  -0xc(%ebp)
801053df:	e8 3c cb ff ff       	call   80101f20 <namei>
801053e4:	83 c4 10             	add    $0x10,%esp
801053e7:	85 c0                	test   %eax,%eax
801053e9:	89 c3                	mov    %eax,%ebx
801053eb:	74 63                	je     80105450 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801053ed:	83 ec 0c             	sub    $0xc,%esp
801053f0:	50                   	push   %eax
801053f1:	e8 ca c2 ff ff       	call   801016c0 <ilock>
  if(ip->type != T_DIR){
801053f6:	83 c4 10             	add    $0x10,%esp
801053f9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801053fe:	75 30                	jne    80105430 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105400:	83 ec 0c             	sub    $0xc,%esp
80105403:	53                   	push   %ebx
80105404:	e8 97 c3 ff ff       	call   801017a0 <iunlock>
  iput(curproc->cwd);
80105409:	58                   	pop    %eax
8010540a:	ff 76 68             	pushl  0x68(%esi)
8010540d:	e8 de c3 ff ff       	call   801017f0 <iput>
  end_op();
80105412:	e8 89 d8 ff ff       	call   80102ca0 <end_op>
  curproc->cwd = ip;
80105417:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010541a:	83 c4 10             	add    $0x10,%esp
8010541d:	31 c0                	xor    %eax,%eax
}
8010541f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105422:	5b                   	pop    %ebx
80105423:	5e                   	pop    %esi
80105424:	5d                   	pop    %ebp
80105425:	c3                   	ret    
80105426:	8d 76 00             	lea    0x0(%esi),%esi
80105429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
80105430:	83 ec 0c             	sub    $0xc,%esp
80105433:	53                   	push   %ebx
80105434:	e8 17 c5 ff ff       	call   80101950 <iunlockput>
    end_op();
80105439:	e8 62 d8 ff ff       	call   80102ca0 <end_op>
    return -1;
8010543e:	83 c4 10             	add    $0x10,%esp
80105441:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105446:	eb d7                	jmp    8010541f <sys_chdir+0x6f>
80105448:	90                   	nop
80105449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105450:	e8 4b d8 ff ff       	call   80102ca0 <end_op>
    return -1;
80105455:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010545a:	eb c3                	jmp    8010541f <sys_chdir+0x6f>
8010545c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105460 <sys_exec>:

int
sys_exec(void)
{
80105460:	55                   	push   %ebp
80105461:	89 e5                	mov    %esp,%ebp
80105463:	57                   	push   %edi
80105464:	56                   	push   %esi
80105465:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105466:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010546c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105472:	50                   	push   %eax
80105473:	6a 00                	push   $0x0
80105475:	e8 16 f5 ff ff       	call   80104990 <argstr>
8010547a:	83 c4 10             	add    $0x10,%esp
8010547d:	85 c0                	test   %eax,%eax
8010547f:	0f 88 87 00 00 00    	js     8010550c <sys_exec+0xac>
80105485:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010548b:	83 ec 08             	sub    $0x8,%esp
8010548e:	50                   	push   %eax
8010548f:	6a 01                	push   $0x1
80105491:	e8 4a f4 ff ff       	call   801048e0 <argint>
80105496:	83 c4 10             	add    $0x10,%esp
80105499:	85 c0                	test   %eax,%eax
8010549b:	78 6f                	js     8010550c <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010549d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801054a3:	83 ec 04             	sub    $0x4,%esp
  for(i=0;; i++){
801054a6:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
801054a8:	68 80 00 00 00       	push   $0x80
801054ad:	6a 00                	push   $0x0
801054af:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801054b5:	50                   	push   %eax
801054b6:	e8 25 f1 ff ff       	call   801045e0 <memset>
801054bb:	83 c4 10             	add    $0x10,%esp
801054be:	eb 2c                	jmp    801054ec <sys_exec+0x8c>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
801054c0:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801054c6:	85 c0                	test   %eax,%eax
801054c8:	74 56                	je     80105520 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801054ca:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
801054d0:	83 ec 08             	sub    $0x8,%esp
801054d3:	8d 14 31             	lea    (%ecx,%esi,1),%edx
801054d6:	52                   	push   %edx
801054d7:	50                   	push   %eax
801054d8:	e8 93 f3 ff ff       	call   80104870 <fetchstr>
801054dd:	83 c4 10             	add    $0x10,%esp
801054e0:	85 c0                	test   %eax,%eax
801054e2:	78 28                	js     8010550c <sys_exec+0xac>
  for(i=0;; i++){
801054e4:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
801054e7:	83 fb 20             	cmp    $0x20,%ebx
801054ea:	74 20                	je     8010550c <sys_exec+0xac>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801054ec:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801054f2:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
801054f9:	83 ec 08             	sub    $0x8,%esp
801054fc:	57                   	push   %edi
801054fd:	01 f0                	add    %esi,%eax
801054ff:	50                   	push   %eax
80105500:	e8 2b f3 ff ff       	call   80104830 <fetchint>
80105505:	83 c4 10             	add    $0x10,%esp
80105508:	85 c0                	test   %eax,%eax
8010550a:	79 b4                	jns    801054c0 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
8010550c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010550f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105514:	5b                   	pop    %ebx
80105515:	5e                   	pop    %esi
80105516:	5f                   	pop    %edi
80105517:	5d                   	pop    %ebp
80105518:	c3                   	ret    
80105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
80105520:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105526:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
80105529:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105530:	00 00 00 00 
  return exec(path, argv);
80105534:	50                   	push   %eax
80105535:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010553b:	e8 10 b5 ff ff       	call   80100a50 <exec>
80105540:	83 c4 10             	add    $0x10,%esp
}
80105543:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105546:	5b                   	pop    %ebx
80105547:	5e                   	pop    %esi
80105548:	5f                   	pop    %edi
80105549:	5d                   	pop    %ebp
8010554a:	c3                   	ret    
8010554b:	90                   	nop
8010554c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105550 <sys_pipe>:

int
sys_pipe(void)
{
80105550:	55                   	push   %ebp
80105551:	89 e5                	mov    %esp,%ebp
80105553:	57                   	push   %edi
80105554:	56                   	push   %esi
80105555:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105556:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105559:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010555c:	6a 08                	push   $0x8
8010555e:	50                   	push   %eax
8010555f:	6a 00                	push   $0x0
80105561:	e8 ca f3 ff ff       	call   80104930 <argptr>
80105566:	83 c4 10             	add    $0x10,%esp
80105569:	85 c0                	test   %eax,%eax
8010556b:	0f 88 ae 00 00 00    	js     8010561f <sys_pipe+0xcf>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105571:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105574:	83 ec 08             	sub    $0x8,%esp
80105577:	50                   	push   %eax
80105578:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010557b:	50                   	push   %eax
8010557c:	e8 4f dd ff ff       	call   801032d0 <pipealloc>
80105581:	83 c4 10             	add    $0x10,%esp
80105584:	85 c0                	test   %eax,%eax
80105586:	0f 88 93 00 00 00    	js     8010561f <sys_pipe+0xcf>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010558c:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
8010558f:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80105591:	e8 fa e2 ff ff       	call   80103890 <myproc>
80105596:	eb 10                	jmp    801055a8 <sys_pipe+0x58>
80105598:	90                   	nop
80105599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(fd = 0; fd < NOFILE; fd++){
801055a0:	83 c3 01             	add    $0x1,%ebx
801055a3:	83 fb 10             	cmp    $0x10,%ebx
801055a6:	74 60                	je     80105608 <sys_pipe+0xb8>
    if(curproc->ofile[fd] == 0){
801055a8:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801055ac:	85 f6                	test   %esi,%esi
801055ae:	75 f0                	jne    801055a0 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
801055b0:	8d 73 08             	lea    0x8(%ebx),%esi
801055b3:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801055b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
801055ba:	e8 d1 e2 ff ff       	call   80103890 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801055bf:	31 d2                	xor    %edx,%edx
801055c1:	eb 0d                	jmp    801055d0 <sys_pipe+0x80>
801055c3:	90                   	nop
801055c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801055c8:	83 c2 01             	add    $0x1,%edx
801055cb:	83 fa 10             	cmp    $0x10,%edx
801055ce:	74 28                	je     801055f8 <sys_pipe+0xa8>
    if(curproc->ofile[fd] == 0){
801055d0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801055d4:	85 c9                	test   %ecx,%ecx
801055d6:	75 f0                	jne    801055c8 <sys_pipe+0x78>
      curproc->ofile[fd] = f;
801055d8:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801055dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
801055df:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801055e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801055e4:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801055e7:	31 c0                	xor    %eax,%eax
}
801055e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055ec:	5b                   	pop    %ebx
801055ed:	5e                   	pop    %esi
801055ee:	5f                   	pop    %edi
801055ef:	5d                   	pop    %ebp
801055f0:	c3                   	ret    
801055f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
801055f8:	e8 93 e2 ff ff       	call   80103890 <myproc>
801055fd:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105604:	00 
80105605:	8d 76 00             	lea    0x0(%esi),%esi
    fileclose(rf);
80105608:	83 ec 0c             	sub    $0xc,%esp
8010560b:	ff 75 e0             	pushl  -0x20(%ebp)
8010560e:	e8 6d b8 ff ff       	call   80100e80 <fileclose>
    fileclose(wf);
80105613:	58                   	pop    %eax
80105614:	ff 75 e4             	pushl  -0x1c(%ebp)
80105617:	e8 64 b8 ff ff       	call   80100e80 <fileclose>
    return -1;
8010561c:	83 c4 10             	add    $0x10,%esp
8010561f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105624:	eb c3                	jmp    801055e9 <sys_pipe+0x99>
80105626:	66 90                	xchg   %ax,%ax
80105628:	66 90                	xchg   %ax,%ax
8010562a:	66 90                	xchg   %ax,%ax
8010562c:	66 90                	xchg   %ax,%ax
8010562e:	66 90                	xchg   %ax,%ax

80105630 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105630:	55                   	push   %ebp
80105631:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105633:	5d                   	pop    %ebp
  return fork();
80105634:	e9 f7 e3 ff ff       	jmp    80103a30 <fork>
80105639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105640 <sys_exit>:

int
sys_exit(void)
{
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	83 ec 08             	sub    $0x8,%esp
  exit();
80105646:	e8 25 e7 ff ff       	call   80103d70 <exit>
  return 0;  // not reached
}
8010564b:	31 c0                	xor    %eax,%eax
8010564d:	c9                   	leave  
8010564e:	c3                   	ret    
8010564f:	90                   	nop

80105650 <sys_wait>:

int
sys_wait(void)
{
80105650:	55                   	push   %ebp
80105651:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105653:	5d                   	pop    %ebp
  return wait();
80105654:	e9 57 e9 ff ff       	jmp    80103fb0 <wait>
80105659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105660 <sys_kill>:

int
sys_kill(void)
{
80105660:	55                   	push   %ebp
80105661:	89 e5                	mov    %esp,%ebp
80105663:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105666:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105669:	50                   	push   %eax
8010566a:	6a 00                	push   $0x0
8010566c:	e8 6f f2 ff ff       	call   801048e0 <argint>
80105671:	83 c4 10             	add    $0x10,%esp
80105674:	85 c0                	test   %eax,%eax
80105676:	78 18                	js     80105690 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105678:	83 ec 0c             	sub    $0xc,%esp
8010567b:	ff 75 f4             	pushl  -0xc(%ebp)
8010567e:	e8 7d ea ff ff       	call   80104100 <kill>
80105683:	83 c4 10             	add    $0x10,%esp
}
80105686:	c9                   	leave  
80105687:	c3                   	ret    
80105688:	90                   	nop
80105689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105695:	c9                   	leave  
80105696:	c3                   	ret    
80105697:	89 f6                	mov    %esi,%esi
80105699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801056a0 <sys_getpid>:

int
sys_getpid(void)
{
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801056a6:	e8 e5 e1 ff ff       	call   80103890 <myproc>
801056ab:	8b 40 10             	mov    0x10(%eax),%eax
}
801056ae:	c9                   	leave  
801056af:	c3                   	ret    

801056b0 <sys_sbrk>:

int
sys_sbrk(void)
{
801056b0:	55                   	push   %ebp
801056b1:	89 e5                	mov    %esp,%ebp
801056b3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
801056b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801056b7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801056ba:	50                   	push   %eax
801056bb:	6a 00                	push   $0x0
801056bd:	e8 1e f2 ff ff       	call   801048e0 <argint>
801056c2:	83 c4 10             	add    $0x10,%esp
801056c5:	85 c0                	test   %eax,%eax
801056c7:	78 27                	js     801056f0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
801056c9:	e8 c2 e1 ff ff       	call   80103890 <myproc>
  if(growproc(n) < 0)
801056ce:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
801056d1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801056d3:	ff 75 f4             	pushl  -0xc(%ebp)
801056d6:	e8 d5 e2 ff ff       	call   801039b0 <growproc>
801056db:	83 c4 10             	add    $0x10,%esp
801056de:	85 c0                	test   %eax,%eax
801056e0:	78 0e                	js     801056f0 <sys_sbrk+0x40>
    return -1;
  return addr;
}
801056e2:	89 d8                	mov    %ebx,%eax
801056e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056e7:	c9                   	leave  
801056e8:	c3                   	ret    
801056e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801056f0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801056f5:	eb eb                	jmp    801056e2 <sys_sbrk+0x32>
801056f7:	89 f6                	mov    %esi,%esi
801056f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105700 <sys_sleep>:

int
sys_sleep(void)
{
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
80105703:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105704:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105707:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010570a:	50                   	push   %eax
8010570b:	6a 00                	push   $0x0
8010570d:	e8 ce f1 ff ff       	call   801048e0 <argint>
80105712:	83 c4 10             	add    $0x10,%esp
80105715:	85 c0                	test   %eax,%eax
80105717:	0f 88 8a 00 00 00    	js     801057a7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010571d:	83 ec 0c             	sub    $0xc,%esp
80105720:	68 40 57 11 80       	push   $0x80115740
80105725:	e8 a6 ed ff ff       	call   801044d0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010572a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010572d:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105730:	8b 1d 80 5f 11 80    	mov    0x80115f80,%ebx
  while(ticks - ticks0 < n){
80105736:	85 d2                	test   %edx,%edx
80105738:	75 27                	jne    80105761 <sys_sleep+0x61>
8010573a:	eb 54                	jmp    80105790 <sys_sleep+0x90>
8010573c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105740:	83 ec 08             	sub    $0x8,%esp
80105743:	68 40 57 11 80       	push   $0x80115740
80105748:	68 80 5f 11 80       	push   $0x80115f80
8010574d:	e8 9e e7 ff ff       	call   80103ef0 <sleep>
  while(ticks - ticks0 < n){
80105752:	a1 80 5f 11 80       	mov    0x80115f80,%eax
80105757:	83 c4 10             	add    $0x10,%esp
8010575a:	29 d8                	sub    %ebx,%eax
8010575c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010575f:	73 2f                	jae    80105790 <sys_sleep+0x90>
    if(myproc()->killed){
80105761:	e8 2a e1 ff ff       	call   80103890 <myproc>
80105766:	8b 40 24             	mov    0x24(%eax),%eax
80105769:	85 c0                	test   %eax,%eax
8010576b:	74 d3                	je     80105740 <sys_sleep+0x40>
      release(&tickslock);
8010576d:	83 ec 0c             	sub    $0xc,%esp
80105770:	68 40 57 11 80       	push   $0x80115740
80105775:	e8 16 ee ff ff       	call   80104590 <release>
      return -1;
8010577a:	83 c4 10             	add    $0x10,%esp
8010577d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105782:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105785:	c9                   	leave  
80105786:	c3                   	ret    
80105787:	89 f6                	mov    %esi,%esi
80105789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
80105790:	83 ec 0c             	sub    $0xc,%esp
80105793:	68 40 57 11 80       	push   $0x80115740
80105798:	e8 f3 ed ff ff       	call   80104590 <release>
  return 0;
8010579d:	83 c4 10             	add    $0x10,%esp
801057a0:	31 c0                	xor    %eax,%eax
}
801057a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057a5:	c9                   	leave  
801057a6:	c3                   	ret    
    return -1;
801057a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057ac:	eb f4                	jmp    801057a2 <sys_sleep+0xa2>
801057ae:	66 90                	xchg   %ax,%ax

801057b0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801057b0:	55                   	push   %ebp
801057b1:	89 e5                	mov    %esp,%ebp
801057b3:	53                   	push   %ebx
801057b4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
801057b7:	68 40 57 11 80       	push   $0x80115740
801057bc:	e8 0f ed ff ff       	call   801044d0 <acquire>
  xticks = ticks;
801057c1:	8b 1d 80 5f 11 80    	mov    0x80115f80,%ebx
  release(&tickslock);
801057c7:	c7 04 24 40 57 11 80 	movl   $0x80115740,(%esp)
801057ce:	e8 bd ed ff ff       	call   80104590 <release>
  return xticks;
}
801057d3:	89 d8                	mov    %ebx,%eax
801057d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057d8:	c9                   	leave  
801057d9:	c3                   	ret    
801057da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801057e0 <sys_gettime>:

int
sys_gettime(void) {
801057e0:	55                   	push   %ebp
801057e1:	89 e5                	mov    %esp,%ebp
801057e3:	83 ec 1c             	sub    $0x1c,%esp
  struct rtcdate *d;
  if (argptr(0, (char **)&d, sizeof(struct rtcdate)) < 0)
801057e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057e9:	6a 18                	push   $0x18
801057eb:	50                   	push   %eax
801057ec:	6a 00                	push   $0x0
801057ee:	e8 3d f1 ff ff       	call   80104930 <argptr>
801057f3:	83 c4 10             	add    $0x10,%esp
801057f6:	85 c0                	test   %eax,%eax
801057f8:	78 16                	js     80105810 <sys_gettime+0x30>
      return -1;
  cmostime(d);
801057fa:	83 ec 0c             	sub    $0xc,%esp
801057fd:	ff 75 f4             	pushl  -0xc(%ebp)
80105800:	e8 4b d0 ff ff       	call   80102850 <cmostime>
  return 0;
80105805:	83 c4 10             	add    $0x10,%esp
80105808:	31 c0                	xor    %eax,%eax
}
8010580a:	c9                   	leave  
8010580b:	c3                   	ret    
8010580c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80105810:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105815:	c9                   	leave  
80105816:	c3                   	ret    
80105817:	89 f6                	mov    %esi,%esi
80105819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105820 <sys_settickets>:

int
sys_settickets(void) {
80105820:	55                   	push   %ebp
80105821:	89 e5                	mov    %esp,%ebp
80105823:	83 ec 20             	sub    $0x20,%esp
  struct proc *proc;
  int n;
  if(argint(0, &n) < 0) {
80105826:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105829:	50                   	push   %eax
8010582a:	6a 00                	push   $0x0
8010582c:	e8 af f0 ff ff       	call   801048e0 <argint>
  }
  else {
    proc->tickets = n;
  }
  return 0;
}
80105831:	31 c0                	xor    %eax,%eax
80105833:	c9                   	leave  
80105834:	c3                   	ret    
80105835:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105840 <sys_getreadcount>:

int
sys_getreadcount(void){
80105840:	55                   	push   %ebp
80105841:	89 e5                	mov    %esp,%ebp
  return getreadcount();
}
80105843:	5d                   	pop    %ebp
  return getreadcount();
80105844:	e9 87 f1 ff ff       	jmp    801049d0 <getreadcount>

80105849 <alltraps>:
80105849:	1e                   	push   %ds
8010584a:	06                   	push   %es
8010584b:	0f a0                	push   %fs
8010584d:	0f a8                	push   %gs
8010584f:	60                   	pusha  
80105850:	66 b8 10 00          	mov    $0x10,%ax
80105854:	8e d8                	mov    %eax,%ds
80105856:	8e c0                	mov    %eax,%es
80105858:	54                   	push   %esp
80105859:	e8 c2 00 00 00       	call   80105920 <trap>
8010585e:	83 c4 04             	add    $0x4,%esp

80105861 <trapret>:
80105861:	61                   	popa   
80105862:	0f a9                	pop    %gs
80105864:	0f a1                	pop    %fs
80105866:	07                   	pop    %es
80105867:	1f                   	pop    %ds
80105868:	83 c4 08             	add    $0x8,%esp
8010586b:	cf                   	iret   
8010586c:	66 90                	xchg   %ax,%ax
8010586e:	66 90                	xchg   %ax,%ax

80105870 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105870:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105871:	31 c0                	xor    %eax,%eax
{
80105873:	89 e5                	mov    %esp,%ebp
80105875:	83 ec 08             	sub    $0x8,%esp
80105878:	90                   	nop
80105879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105880:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105887:	c7 04 c5 82 57 11 80 	movl   $0x8e000008,-0x7feea87e(,%eax,8)
8010588e:	08 00 00 8e 
80105892:	66 89 14 c5 80 57 11 	mov    %dx,-0x7feea880(,%eax,8)
80105899:	80 
8010589a:	c1 ea 10             	shr    $0x10,%edx
8010589d:	66 89 14 c5 86 57 11 	mov    %dx,-0x7feea87a(,%eax,8)
801058a4:	80 
  for(i = 0; i < 256; i++)
801058a5:	83 c0 01             	add    $0x1,%eax
801058a8:	3d 00 01 00 00       	cmp    $0x100,%eax
801058ad:	75 d1                	jne    80105880 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058af:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
801058b4:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058b7:	c7 05 82 59 11 80 08 	movl   $0xef000008,0x80115982
801058be:	00 00 ef 
  initlock(&tickslock, "time");
801058c1:	68 45 7a 10 80       	push   $0x80107a45
801058c6:	68 40 57 11 80       	push   $0x80115740
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058cb:	66 a3 80 59 11 80    	mov    %ax,0x80115980
801058d1:	c1 e8 10             	shr    $0x10,%eax
801058d4:	66 a3 86 59 11 80    	mov    %ax,0x80115986
  initlock(&tickslock, "time");
801058da:	e8 b1 ea ff ff       	call   80104390 <initlock>
}
801058df:	83 c4 10             	add    $0x10,%esp
801058e2:	c9                   	leave  
801058e3:	c3                   	ret    
801058e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801058ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801058f0 <idtinit>:

void
idtinit(void)
{
801058f0:	55                   	push   %ebp
  pd[0] = size-1;
801058f1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801058f6:	89 e5                	mov    %esp,%ebp
801058f8:	83 ec 10             	sub    $0x10,%esp
801058fb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
801058ff:	b8 80 57 11 80       	mov    $0x80115780,%eax
80105904:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105908:	c1 e8 10             	shr    $0x10,%eax
8010590b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
8010590f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105912:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105915:	c9                   	leave  
80105916:	c3                   	ret    
80105917:	89 f6                	mov    %esi,%esi
80105919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105920 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105920:	55                   	push   %ebp
80105921:	89 e5                	mov    %esp,%ebp
80105923:	57                   	push   %edi
80105924:	56                   	push   %esi
80105925:	53                   	push   %ebx
80105926:	83 ec 1c             	sub    $0x1c,%esp
80105929:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
8010592c:	8b 47 30             	mov    0x30(%edi),%eax
8010592f:	83 f8 40             	cmp    $0x40,%eax
80105932:	0f 84 f0 00 00 00    	je     80105a28 <trap+0x108>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105938:	83 e8 20             	sub    $0x20,%eax
8010593b:	83 f8 1f             	cmp    $0x1f,%eax
8010593e:	77 10                	ja     80105950 <trap+0x30>
80105940:	ff 24 85 ec 7a 10 80 	jmp    *-0x7fef8514(,%eax,4)
80105947:	89 f6                	mov    %esi,%esi
80105949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105950:	e8 3b df ff ff       	call   80103890 <myproc>
80105955:	85 c0                	test   %eax,%eax
80105957:	8b 5f 38             	mov    0x38(%edi),%ebx
8010595a:	0f 84 14 02 00 00    	je     80105b74 <trap+0x254>
80105960:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105964:	0f 84 0a 02 00 00    	je     80105b74 <trap+0x254>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
8010596a:	0f 20 d1             	mov    %cr2,%ecx
8010596d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105970:	e8 fb de ff ff       	call   80103870 <cpuid>
80105975:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105978:	8b 47 34             	mov    0x34(%edi),%eax
8010597b:	8b 77 30             	mov    0x30(%edi),%esi
8010597e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105981:	e8 0a df ff ff       	call   80103890 <myproc>
80105986:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105989:	e8 02 df ff ff       	call   80103890 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010598e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105991:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105994:	51                   	push   %ecx
80105995:	53                   	push   %ebx
80105996:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
80105997:	8b 55 e0             	mov    -0x20(%ebp),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010599a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010599d:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
8010599e:	83 c2 6c             	add    $0x6c,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059a1:	52                   	push   %edx
801059a2:	ff 70 10             	pushl  0x10(%eax)
801059a5:	68 a8 7a 10 80       	push   $0x80107aa8
801059aa:	e8 b1 ac ff ff       	call   80100660 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
801059af:	83 c4 20             	add    $0x20,%esp
801059b2:	e8 d9 de ff ff       	call   80103890 <myproc>
801059b7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801059be:	e8 cd de ff ff       	call   80103890 <myproc>
801059c3:	85 c0                	test   %eax,%eax
801059c5:	74 1d                	je     801059e4 <trap+0xc4>
801059c7:	e8 c4 de ff ff       	call   80103890 <myproc>
801059cc:	8b 50 24             	mov    0x24(%eax),%edx
801059cf:	85 d2                	test   %edx,%edx
801059d1:	74 11                	je     801059e4 <trap+0xc4>
801059d3:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801059d7:	83 e0 03             	and    $0x3,%eax
801059da:	66 83 f8 03          	cmp    $0x3,%ax
801059de:	0f 84 4c 01 00 00    	je     80105b30 <trap+0x210>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801059e4:	e8 a7 de ff ff       	call   80103890 <myproc>
801059e9:	85 c0                	test   %eax,%eax
801059eb:	74 0b                	je     801059f8 <trap+0xd8>
801059ed:	e8 9e de ff ff       	call   80103890 <myproc>
801059f2:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801059f6:	74 68                	je     80105a60 <trap+0x140>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801059f8:	e8 93 de ff ff       	call   80103890 <myproc>
801059fd:	85 c0                	test   %eax,%eax
801059ff:	74 19                	je     80105a1a <trap+0xfa>
80105a01:	e8 8a de ff ff       	call   80103890 <myproc>
80105a06:	8b 40 24             	mov    0x24(%eax),%eax
80105a09:	85 c0                	test   %eax,%eax
80105a0b:	74 0d                	je     80105a1a <trap+0xfa>
80105a0d:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105a11:	83 e0 03             	and    $0x3,%eax
80105a14:	66 83 f8 03          	cmp    $0x3,%ax
80105a18:	74 37                	je     80105a51 <trap+0x131>
    exit();
}
80105a1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a1d:	5b                   	pop    %ebx
80105a1e:	5e                   	pop    %esi
80105a1f:	5f                   	pop    %edi
80105a20:	5d                   	pop    %ebp
80105a21:	c3                   	ret    
80105a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(myproc()->killed)
80105a28:	e8 63 de ff ff       	call   80103890 <myproc>
80105a2d:	8b 58 24             	mov    0x24(%eax),%ebx
80105a30:	85 db                	test   %ebx,%ebx
80105a32:	0f 85 e8 00 00 00    	jne    80105b20 <trap+0x200>
    myproc()->tf = tf;
80105a38:	e8 53 de ff ff       	call   80103890 <myproc>
80105a3d:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105a40:	e8 9b ef ff ff       	call   801049e0 <syscall>
    if(myproc()->killed)
80105a45:	e8 46 de ff ff       	call   80103890 <myproc>
80105a4a:	8b 48 24             	mov    0x24(%eax),%ecx
80105a4d:	85 c9                	test   %ecx,%ecx
80105a4f:	74 c9                	je     80105a1a <trap+0xfa>
}
80105a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a54:	5b                   	pop    %ebx
80105a55:	5e                   	pop    %esi
80105a56:	5f                   	pop    %edi
80105a57:	5d                   	pop    %ebp
      exit();
80105a58:	e9 13 e3 ff ff       	jmp    80103d70 <exit>
80105a5d:	8d 76 00             	lea    0x0(%esi),%esi
  if(myproc() && myproc()->state == RUNNING &&
80105a60:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105a64:	75 92                	jne    801059f8 <trap+0xd8>
    yield();
80105a66:	e8 35 e4 ff ff       	call   80103ea0 <yield>
80105a6b:	eb 8b                	jmp    801059f8 <trap+0xd8>
80105a6d:	8d 76 00             	lea    0x0(%esi),%esi
    if(cpuid() == 0){
80105a70:	e8 fb dd ff ff       	call   80103870 <cpuid>
80105a75:	85 c0                	test   %eax,%eax
80105a77:	0f 84 c3 00 00 00    	je     80105b40 <trap+0x220>
    lapiceoi();
80105a7d:	e8 0e cd ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105a82:	e8 09 de ff ff       	call   80103890 <myproc>
80105a87:	85 c0                	test   %eax,%eax
80105a89:	0f 85 38 ff ff ff    	jne    801059c7 <trap+0xa7>
80105a8f:	e9 50 ff ff ff       	jmp    801059e4 <trap+0xc4>
80105a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
80105a98:	e8 b3 cb ff ff       	call   80102650 <kbdintr>
    lapiceoi();
80105a9d:	e8 ee cc ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105aa2:	e8 e9 dd ff ff       	call   80103890 <myproc>
80105aa7:	85 c0                	test   %eax,%eax
80105aa9:	0f 85 18 ff ff ff    	jne    801059c7 <trap+0xa7>
80105aaf:	e9 30 ff ff ff       	jmp    801059e4 <trap+0xc4>
80105ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80105ab8:	e8 53 02 00 00       	call   80105d10 <uartintr>
    lapiceoi();
80105abd:	e8 ce cc ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105ac2:	e8 c9 dd ff ff       	call   80103890 <myproc>
80105ac7:	85 c0                	test   %eax,%eax
80105ac9:	0f 85 f8 fe ff ff    	jne    801059c7 <trap+0xa7>
80105acf:	e9 10 ff ff ff       	jmp    801059e4 <trap+0xc4>
80105ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105ad8:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105adc:	8b 77 38             	mov    0x38(%edi),%esi
80105adf:	e8 8c dd ff ff       	call   80103870 <cpuid>
80105ae4:	56                   	push   %esi
80105ae5:	53                   	push   %ebx
80105ae6:	50                   	push   %eax
80105ae7:	68 50 7a 10 80       	push   $0x80107a50
80105aec:	e8 6f ab ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105af1:	e8 9a cc ff ff       	call   80102790 <lapiceoi>
    break;
80105af6:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105af9:	e8 92 dd ff ff       	call   80103890 <myproc>
80105afe:	85 c0                	test   %eax,%eax
80105b00:	0f 85 c1 fe ff ff    	jne    801059c7 <trap+0xa7>
80105b06:	e9 d9 fe ff ff       	jmp    801059e4 <trap+0xc4>
80105b0b:	90                   	nop
80105b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ideintr();
80105b10:	e8 ab c5 ff ff       	call   801020c0 <ideintr>
80105b15:	e9 63 ff ff ff       	jmp    80105a7d <trap+0x15d>
80105b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
80105b20:	e8 4b e2 ff ff       	call   80103d70 <exit>
80105b25:	e9 0e ff ff ff       	jmp    80105a38 <trap+0x118>
80105b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
80105b30:	e8 3b e2 ff ff       	call   80103d70 <exit>
80105b35:	e9 aa fe ff ff       	jmp    801059e4 <trap+0xc4>
80105b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
80105b40:	83 ec 0c             	sub    $0xc,%esp
80105b43:	68 40 57 11 80       	push   $0x80115740
80105b48:	e8 83 e9 ff ff       	call   801044d0 <acquire>
      wakeup(&ticks);
80105b4d:	c7 04 24 80 5f 11 80 	movl   $0x80115f80,(%esp)
      ticks++;
80105b54:	83 05 80 5f 11 80 01 	addl   $0x1,0x80115f80
      wakeup(&ticks);
80105b5b:	e8 40 e5 ff ff       	call   801040a0 <wakeup>
      release(&tickslock);
80105b60:	c7 04 24 40 57 11 80 	movl   $0x80115740,(%esp)
80105b67:	e8 24 ea ff ff       	call   80104590 <release>
80105b6c:	83 c4 10             	add    $0x10,%esp
80105b6f:	e9 09 ff ff ff       	jmp    80105a7d <trap+0x15d>
80105b74:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105b77:	e8 f4 dc ff ff       	call   80103870 <cpuid>
80105b7c:	83 ec 0c             	sub    $0xc,%esp
80105b7f:	56                   	push   %esi
80105b80:	53                   	push   %ebx
80105b81:	50                   	push   %eax
80105b82:	ff 77 30             	pushl  0x30(%edi)
80105b85:	68 74 7a 10 80       	push   $0x80107a74
80105b8a:	e8 d1 aa ff ff       	call   80100660 <cprintf>
      panic("trap");
80105b8f:	83 c4 14             	add    $0x14,%esp
80105b92:	68 4a 7a 10 80       	push   $0x80107a4a
80105b97:	e8 f4 a7 ff ff       	call   80100390 <panic>
80105b9c:	66 90                	xchg   %ax,%ax
80105b9e:	66 90                	xchg   %ax,%ax

80105ba0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105ba0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
{
80105ba5:	55                   	push   %ebp
80105ba6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105ba8:	85 c0                	test   %eax,%eax
80105baa:	74 1c                	je     80105bc8 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105bac:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105bb1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105bb2:	a8 01                	test   $0x1,%al
80105bb4:	74 12                	je     80105bc8 <uartgetc+0x28>
80105bb6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105bbb:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105bbc:	0f b6 c0             	movzbl %al,%eax
}
80105bbf:	5d                   	pop    %ebp
80105bc0:	c3                   	ret    
80105bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105bc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105bcd:	5d                   	pop    %ebp
80105bce:	c3                   	ret    
80105bcf:	90                   	nop

80105bd0 <uartputc.part.0>:
uartputc(int c)
80105bd0:	55                   	push   %ebp
80105bd1:	89 e5                	mov    %esp,%ebp
80105bd3:	57                   	push   %edi
80105bd4:	56                   	push   %esi
80105bd5:	53                   	push   %ebx
80105bd6:	89 c7                	mov    %eax,%edi
80105bd8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105bdd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105be2:	83 ec 0c             	sub    $0xc,%esp
80105be5:	eb 1b                	jmp    80105c02 <uartputc.part.0+0x32>
80105be7:	89 f6                	mov    %esi,%esi
80105be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
80105bf0:	83 ec 0c             	sub    $0xc,%esp
80105bf3:	6a 0a                	push   $0xa
80105bf5:	e8 b6 cb ff ff       	call   801027b0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105bfa:	83 c4 10             	add    $0x10,%esp
80105bfd:	83 eb 01             	sub    $0x1,%ebx
80105c00:	74 07                	je     80105c09 <uartputc.part.0+0x39>
80105c02:	89 f2                	mov    %esi,%edx
80105c04:	ec                   	in     (%dx),%al
80105c05:	a8 20                	test   $0x20,%al
80105c07:	74 e7                	je     80105bf0 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105c09:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c0e:	89 f8                	mov    %edi,%eax
80105c10:	ee                   	out    %al,(%dx)
}
80105c11:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c14:	5b                   	pop    %ebx
80105c15:	5e                   	pop    %esi
80105c16:	5f                   	pop    %edi
80105c17:	5d                   	pop    %ebp
80105c18:	c3                   	ret    
80105c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105c20 <uartinit>:
{
80105c20:	55                   	push   %ebp
80105c21:	31 c9                	xor    %ecx,%ecx
80105c23:	89 c8                	mov    %ecx,%eax
80105c25:	89 e5                	mov    %esp,%ebp
80105c27:	57                   	push   %edi
80105c28:	56                   	push   %esi
80105c29:	53                   	push   %ebx
80105c2a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105c2f:	89 da                	mov    %ebx,%edx
80105c31:	83 ec 0c             	sub    $0xc,%esp
80105c34:	ee                   	out    %al,(%dx)
80105c35:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105c3a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105c3f:	89 fa                	mov    %edi,%edx
80105c41:	ee                   	out    %al,(%dx)
80105c42:	b8 0c 00 00 00       	mov    $0xc,%eax
80105c47:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c4c:	ee                   	out    %al,(%dx)
80105c4d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105c52:	89 c8                	mov    %ecx,%eax
80105c54:	89 f2                	mov    %esi,%edx
80105c56:	ee                   	out    %al,(%dx)
80105c57:	b8 03 00 00 00       	mov    $0x3,%eax
80105c5c:	89 fa                	mov    %edi,%edx
80105c5e:	ee                   	out    %al,(%dx)
80105c5f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105c64:	89 c8                	mov    %ecx,%eax
80105c66:	ee                   	out    %al,(%dx)
80105c67:	b8 01 00 00 00       	mov    $0x1,%eax
80105c6c:	89 f2                	mov    %esi,%edx
80105c6e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105c6f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105c74:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105c75:	3c ff                	cmp    $0xff,%al
80105c77:	74 5a                	je     80105cd3 <uartinit+0xb3>
  uart = 1;
80105c79:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105c80:	00 00 00 
80105c83:	89 da                	mov    %ebx,%edx
80105c85:	ec                   	in     (%dx),%al
80105c86:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c8b:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105c8c:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
80105c8f:	bb 6c 7b 10 80       	mov    $0x80107b6c,%ebx
  ioapicenable(IRQ_COM1, 0);
80105c94:	6a 00                	push   $0x0
80105c96:	6a 04                	push   $0x4
80105c98:	e8 73 c6 ff ff       	call   80102310 <ioapicenable>
80105c9d:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80105ca0:	b8 78 00 00 00       	mov    $0x78,%eax
80105ca5:	eb 13                	jmp    80105cba <uartinit+0x9a>
80105ca7:	89 f6                	mov    %esi,%esi
80105ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105cb0:	83 c3 01             	add    $0x1,%ebx
80105cb3:	0f be 03             	movsbl (%ebx),%eax
80105cb6:	84 c0                	test   %al,%al
80105cb8:	74 19                	je     80105cd3 <uartinit+0xb3>
  if(!uart)
80105cba:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105cc0:	85 d2                	test   %edx,%edx
80105cc2:	74 ec                	je     80105cb0 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80105cc4:	83 c3 01             	add    $0x1,%ebx
80105cc7:	e8 04 ff ff ff       	call   80105bd0 <uartputc.part.0>
80105ccc:	0f be 03             	movsbl (%ebx),%eax
80105ccf:	84 c0                	test   %al,%al
80105cd1:	75 e7                	jne    80105cba <uartinit+0x9a>
}
80105cd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cd6:	5b                   	pop    %ebx
80105cd7:	5e                   	pop    %esi
80105cd8:	5f                   	pop    %edi
80105cd9:	5d                   	pop    %ebp
80105cda:	c3                   	ret    
80105cdb:	90                   	nop
80105cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105ce0 <uartputc>:
  if(!uart)
80105ce0:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
{
80105ce6:	55                   	push   %ebp
80105ce7:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105ce9:	85 d2                	test   %edx,%edx
{
80105ceb:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105cee:	74 10                	je     80105d00 <uartputc+0x20>
}
80105cf0:	5d                   	pop    %ebp
80105cf1:	e9 da fe ff ff       	jmp    80105bd0 <uartputc.part.0>
80105cf6:	8d 76 00             	lea    0x0(%esi),%esi
80105cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105d00:	5d                   	pop    %ebp
80105d01:	c3                   	ret    
80105d02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d10 <uartintr>:

void
uartintr(void)
{
80105d10:	55                   	push   %ebp
80105d11:	89 e5                	mov    %esp,%ebp
80105d13:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105d16:	68 a0 5b 10 80       	push   $0x80105ba0
80105d1b:	e8 30 ab ff ff       	call   80100850 <consoleintr>
}
80105d20:	83 c4 10             	add    $0x10,%esp
80105d23:	c9                   	leave  
80105d24:	c3                   	ret    

80105d25 <vector0>:
80105d25:	6a 00                	push   $0x0
80105d27:	6a 00                	push   $0x0
80105d29:	e9 1b fb ff ff       	jmp    80105849 <alltraps>

80105d2e <vector1>:
80105d2e:	6a 00                	push   $0x0
80105d30:	6a 01                	push   $0x1
80105d32:	e9 12 fb ff ff       	jmp    80105849 <alltraps>

80105d37 <vector2>:
80105d37:	6a 00                	push   $0x0
80105d39:	6a 02                	push   $0x2
80105d3b:	e9 09 fb ff ff       	jmp    80105849 <alltraps>

80105d40 <vector3>:
80105d40:	6a 00                	push   $0x0
80105d42:	6a 03                	push   $0x3
80105d44:	e9 00 fb ff ff       	jmp    80105849 <alltraps>

80105d49 <vector4>:
80105d49:	6a 00                	push   $0x0
80105d4b:	6a 04                	push   $0x4
80105d4d:	e9 f7 fa ff ff       	jmp    80105849 <alltraps>

80105d52 <vector5>:
80105d52:	6a 00                	push   $0x0
80105d54:	6a 05                	push   $0x5
80105d56:	e9 ee fa ff ff       	jmp    80105849 <alltraps>

80105d5b <vector6>:
80105d5b:	6a 00                	push   $0x0
80105d5d:	6a 06                	push   $0x6
80105d5f:	e9 e5 fa ff ff       	jmp    80105849 <alltraps>

80105d64 <vector7>:
80105d64:	6a 00                	push   $0x0
80105d66:	6a 07                	push   $0x7
80105d68:	e9 dc fa ff ff       	jmp    80105849 <alltraps>

80105d6d <vector8>:
80105d6d:	6a 08                	push   $0x8
80105d6f:	e9 d5 fa ff ff       	jmp    80105849 <alltraps>

80105d74 <vector9>:
80105d74:	6a 00                	push   $0x0
80105d76:	6a 09                	push   $0x9
80105d78:	e9 cc fa ff ff       	jmp    80105849 <alltraps>

80105d7d <vector10>:
80105d7d:	6a 0a                	push   $0xa
80105d7f:	e9 c5 fa ff ff       	jmp    80105849 <alltraps>

80105d84 <vector11>:
80105d84:	6a 0b                	push   $0xb
80105d86:	e9 be fa ff ff       	jmp    80105849 <alltraps>

80105d8b <vector12>:
80105d8b:	6a 0c                	push   $0xc
80105d8d:	e9 b7 fa ff ff       	jmp    80105849 <alltraps>

80105d92 <vector13>:
80105d92:	6a 0d                	push   $0xd
80105d94:	e9 b0 fa ff ff       	jmp    80105849 <alltraps>

80105d99 <vector14>:
80105d99:	6a 0e                	push   $0xe
80105d9b:	e9 a9 fa ff ff       	jmp    80105849 <alltraps>

80105da0 <vector15>:
80105da0:	6a 00                	push   $0x0
80105da2:	6a 0f                	push   $0xf
80105da4:	e9 a0 fa ff ff       	jmp    80105849 <alltraps>

80105da9 <vector16>:
80105da9:	6a 00                	push   $0x0
80105dab:	6a 10                	push   $0x10
80105dad:	e9 97 fa ff ff       	jmp    80105849 <alltraps>

80105db2 <vector17>:
80105db2:	6a 11                	push   $0x11
80105db4:	e9 90 fa ff ff       	jmp    80105849 <alltraps>

80105db9 <vector18>:
80105db9:	6a 00                	push   $0x0
80105dbb:	6a 12                	push   $0x12
80105dbd:	e9 87 fa ff ff       	jmp    80105849 <alltraps>

80105dc2 <vector19>:
80105dc2:	6a 00                	push   $0x0
80105dc4:	6a 13                	push   $0x13
80105dc6:	e9 7e fa ff ff       	jmp    80105849 <alltraps>

80105dcb <vector20>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	6a 14                	push   $0x14
80105dcf:	e9 75 fa ff ff       	jmp    80105849 <alltraps>

80105dd4 <vector21>:
80105dd4:	6a 00                	push   $0x0
80105dd6:	6a 15                	push   $0x15
80105dd8:	e9 6c fa ff ff       	jmp    80105849 <alltraps>

80105ddd <vector22>:
80105ddd:	6a 00                	push   $0x0
80105ddf:	6a 16                	push   $0x16
80105de1:	e9 63 fa ff ff       	jmp    80105849 <alltraps>

80105de6 <vector23>:
80105de6:	6a 00                	push   $0x0
80105de8:	6a 17                	push   $0x17
80105dea:	e9 5a fa ff ff       	jmp    80105849 <alltraps>

80105def <vector24>:
80105def:	6a 00                	push   $0x0
80105df1:	6a 18                	push   $0x18
80105df3:	e9 51 fa ff ff       	jmp    80105849 <alltraps>

80105df8 <vector25>:
80105df8:	6a 00                	push   $0x0
80105dfa:	6a 19                	push   $0x19
80105dfc:	e9 48 fa ff ff       	jmp    80105849 <alltraps>

80105e01 <vector26>:
80105e01:	6a 00                	push   $0x0
80105e03:	6a 1a                	push   $0x1a
80105e05:	e9 3f fa ff ff       	jmp    80105849 <alltraps>

80105e0a <vector27>:
80105e0a:	6a 00                	push   $0x0
80105e0c:	6a 1b                	push   $0x1b
80105e0e:	e9 36 fa ff ff       	jmp    80105849 <alltraps>

80105e13 <vector28>:
80105e13:	6a 00                	push   $0x0
80105e15:	6a 1c                	push   $0x1c
80105e17:	e9 2d fa ff ff       	jmp    80105849 <alltraps>

80105e1c <vector29>:
80105e1c:	6a 00                	push   $0x0
80105e1e:	6a 1d                	push   $0x1d
80105e20:	e9 24 fa ff ff       	jmp    80105849 <alltraps>

80105e25 <vector30>:
80105e25:	6a 00                	push   $0x0
80105e27:	6a 1e                	push   $0x1e
80105e29:	e9 1b fa ff ff       	jmp    80105849 <alltraps>

80105e2e <vector31>:
80105e2e:	6a 00                	push   $0x0
80105e30:	6a 1f                	push   $0x1f
80105e32:	e9 12 fa ff ff       	jmp    80105849 <alltraps>

80105e37 <vector32>:
80105e37:	6a 00                	push   $0x0
80105e39:	6a 20                	push   $0x20
80105e3b:	e9 09 fa ff ff       	jmp    80105849 <alltraps>

80105e40 <vector33>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 21                	push   $0x21
80105e44:	e9 00 fa ff ff       	jmp    80105849 <alltraps>

80105e49 <vector34>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 22                	push   $0x22
80105e4d:	e9 f7 f9 ff ff       	jmp    80105849 <alltraps>

80105e52 <vector35>:
80105e52:	6a 00                	push   $0x0
80105e54:	6a 23                	push   $0x23
80105e56:	e9 ee f9 ff ff       	jmp    80105849 <alltraps>

80105e5b <vector36>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	6a 24                	push   $0x24
80105e5f:	e9 e5 f9 ff ff       	jmp    80105849 <alltraps>

80105e64 <vector37>:
80105e64:	6a 00                	push   $0x0
80105e66:	6a 25                	push   $0x25
80105e68:	e9 dc f9 ff ff       	jmp    80105849 <alltraps>

80105e6d <vector38>:
80105e6d:	6a 00                	push   $0x0
80105e6f:	6a 26                	push   $0x26
80105e71:	e9 d3 f9 ff ff       	jmp    80105849 <alltraps>

80105e76 <vector39>:
80105e76:	6a 00                	push   $0x0
80105e78:	6a 27                	push   $0x27
80105e7a:	e9 ca f9 ff ff       	jmp    80105849 <alltraps>

80105e7f <vector40>:
80105e7f:	6a 00                	push   $0x0
80105e81:	6a 28                	push   $0x28
80105e83:	e9 c1 f9 ff ff       	jmp    80105849 <alltraps>

80105e88 <vector41>:
80105e88:	6a 00                	push   $0x0
80105e8a:	6a 29                	push   $0x29
80105e8c:	e9 b8 f9 ff ff       	jmp    80105849 <alltraps>

80105e91 <vector42>:
80105e91:	6a 00                	push   $0x0
80105e93:	6a 2a                	push   $0x2a
80105e95:	e9 af f9 ff ff       	jmp    80105849 <alltraps>

80105e9a <vector43>:
80105e9a:	6a 00                	push   $0x0
80105e9c:	6a 2b                	push   $0x2b
80105e9e:	e9 a6 f9 ff ff       	jmp    80105849 <alltraps>

80105ea3 <vector44>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	6a 2c                	push   $0x2c
80105ea7:	e9 9d f9 ff ff       	jmp    80105849 <alltraps>

80105eac <vector45>:
80105eac:	6a 00                	push   $0x0
80105eae:	6a 2d                	push   $0x2d
80105eb0:	e9 94 f9 ff ff       	jmp    80105849 <alltraps>

80105eb5 <vector46>:
80105eb5:	6a 00                	push   $0x0
80105eb7:	6a 2e                	push   $0x2e
80105eb9:	e9 8b f9 ff ff       	jmp    80105849 <alltraps>

80105ebe <vector47>:
80105ebe:	6a 00                	push   $0x0
80105ec0:	6a 2f                	push   $0x2f
80105ec2:	e9 82 f9 ff ff       	jmp    80105849 <alltraps>

80105ec7 <vector48>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	6a 30                	push   $0x30
80105ecb:	e9 79 f9 ff ff       	jmp    80105849 <alltraps>

80105ed0 <vector49>:
80105ed0:	6a 00                	push   $0x0
80105ed2:	6a 31                	push   $0x31
80105ed4:	e9 70 f9 ff ff       	jmp    80105849 <alltraps>

80105ed9 <vector50>:
80105ed9:	6a 00                	push   $0x0
80105edb:	6a 32                	push   $0x32
80105edd:	e9 67 f9 ff ff       	jmp    80105849 <alltraps>

80105ee2 <vector51>:
80105ee2:	6a 00                	push   $0x0
80105ee4:	6a 33                	push   $0x33
80105ee6:	e9 5e f9 ff ff       	jmp    80105849 <alltraps>

80105eeb <vector52>:
80105eeb:	6a 00                	push   $0x0
80105eed:	6a 34                	push   $0x34
80105eef:	e9 55 f9 ff ff       	jmp    80105849 <alltraps>

80105ef4 <vector53>:
80105ef4:	6a 00                	push   $0x0
80105ef6:	6a 35                	push   $0x35
80105ef8:	e9 4c f9 ff ff       	jmp    80105849 <alltraps>

80105efd <vector54>:
80105efd:	6a 00                	push   $0x0
80105eff:	6a 36                	push   $0x36
80105f01:	e9 43 f9 ff ff       	jmp    80105849 <alltraps>

80105f06 <vector55>:
80105f06:	6a 00                	push   $0x0
80105f08:	6a 37                	push   $0x37
80105f0a:	e9 3a f9 ff ff       	jmp    80105849 <alltraps>

80105f0f <vector56>:
80105f0f:	6a 00                	push   $0x0
80105f11:	6a 38                	push   $0x38
80105f13:	e9 31 f9 ff ff       	jmp    80105849 <alltraps>

80105f18 <vector57>:
80105f18:	6a 00                	push   $0x0
80105f1a:	6a 39                	push   $0x39
80105f1c:	e9 28 f9 ff ff       	jmp    80105849 <alltraps>

80105f21 <vector58>:
80105f21:	6a 00                	push   $0x0
80105f23:	6a 3a                	push   $0x3a
80105f25:	e9 1f f9 ff ff       	jmp    80105849 <alltraps>

80105f2a <vector59>:
80105f2a:	6a 00                	push   $0x0
80105f2c:	6a 3b                	push   $0x3b
80105f2e:	e9 16 f9 ff ff       	jmp    80105849 <alltraps>

80105f33 <vector60>:
80105f33:	6a 00                	push   $0x0
80105f35:	6a 3c                	push   $0x3c
80105f37:	e9 0d f9 ff ff       	jmp    80105849 <alltraps>

80105f3c <vector61>:
80105f3c:	6a 00                	push   $0x0
80105f3e:	6a 3d                	push   $0x3d
80105f40:	e9 04 f9 ff ff       	jmp    80105849 <alltraps>

80105f45 <vector62>:
80105f45:	6a 00                	push   $0x0
80105f47:	6a 3e                	push   $0x3e
80105f49:	e9 fb f8 ff ff       	jmp    80105849 <alltraps>

80105f4e <vector63>:
80105f4e:	6a 00                	push   $0x0
80105f50:	6a 3f                	push   $0x3f
80105f52:	e9 f2 f8 ff ff       	jmp    80105849 <alltraps>

80105f57 <vector64>:
80105f57:	6a 00                	push   $0x0
80105f59:	6a 40                	push   $0x40
80105f5b:	e9 e9 f8 ff ff       	jmp    80105849 <alltraps>

80105f60 <vector65>:
80105f60:	6a 00                	push   $0x0
80105f62:	6a 41                	push   $0x41
80105f64:	e9 e0 f8 ff ff       	jmp    80105849 <alltraps>

80105f69 <vector66>:
80105f69:	6a 00                	push   $0x0
80105f6b:	6a 42                	push   $0x42
80105f6d:	e9 d7 f8 ff ff       	jmp    80105849 <alltraps>

80105f72 <vector67>:
80105f72:	6a 00                	push   $0x0
80105f74:	6a 43                	push   $0x43
80105f76:	e9 ce f8 ff ff       	jmp    80105849 <alltraps>

80105f7b <vector68>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	6a 44                	push   $0x44
80105f7f:	e9 c5 f8 ff ff       	jmp    80105849 <alltraps>

80105f84 <vector69>:
80105f84:	6a 00                	push   $0x0
80105f86:	6a 45                	push   $0x45
80105f88:	e9 bc f8 ff ff       	jmp    80105849 <alltraps>

80105f8d <vector70>:
80105f8d:	6a 00                	push   $0x0
80105f8f:	6a 46                	push   $0x46
80105f91:	e9 b3 f8 ff ff       	jmp    80105849 <alltraps>

80105f96 <vector71>:
80105f96:	6a 00                	push   $0x0
80105f98:	6a 47                	push   $0x47
80105f9a:	e9 aa f8 ff ff       	jmp    80105849 <alltraps>

80105f9f <vector72>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	6a 48                	push   $0x48
80105fa3:	e9 a1 f8 ff ff       	jmp    80105849 <alltraps>

80105fa8 <vector73>:
80105fa8:	6a 00                	push   $0x0
80105faa:	6a 49                	push   $0x49
80105fac:	e9 98 f8 ff ff       	jmp    80105849 <alltraps>

80105fb1 <vector74>:
80105fb1:	6a 00                	push   $0x0
80105fb3:	6a 4a                	push   $0x4a
80105fb5:	e9 8f f8 ff ff       	jmp    80105849 <alltraps>

80105fba <vector75>:
80105fba:	6a 00                	push   $0x0
80105fbc:	6a 4b                	push   $0x4b
80105fbe:	e9 86 f8 ff ff       	jmp    80105849 <alltraps>

80105fc3 <vector76>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	6a 4c                	push   $0x4c
80105fc7:	e9 7d f8 ff ff       	jmp    80105849 <alltraps>

80105fcc <vector77>:
80105fcc:	6a 00                	push   $0x0
80105fce:	6a 4d                	push   $0x4d
80105fd0:	e9 74 f8 ff ff       	jmp    80105849 <alltraps>

80105fd5 <vector78>:
80105fd5:	6a 00                	push   $0x0
80105fd7:	6a 4e                	push   $0x4e
80105fd9:	e9 6b f8 ff ff       	jmp    80105849 <alltraps>

80105fde <vector79>:
80105fde:	6a 00                	push   $0x0
80105fe0:	6a 4f                	push   $0x4f
80105fe2:	e9 62 f8 ff ff       	jmp    80105849 <alltraps>

80105fe7 <vector80>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	6a 50                	push   $0x50
80105feb:	e9 59 f8 ff ff       	jmp    80105849 <alltraps>

80105ff0 <vector81>:
80105ff0:	6a 00                	push   $0x0
80105ff2:	6a 51                	push   $0x51
80105ff4:	e9 50 f8 ff ff       	jmp    80105849 <alltraps>

80105ff9 <vector82>:
80105ff9:	6a 00                	push   $0x0
80105ffb:	6a 52                	push   $0x52
80105ffd:	e9 47 f8 ff ff       	jmp    80105849 <alltraps>

80106002 <vector83>:
80106002:	6a 00                	push   $0x0
80106004:	6a 53                	push   $0x53
80106006:	e9 3e f8 ff ff       	jmp    80105849 <alltraps>

8010600b <vector84>:
8010600b:	6a 00                	push   $0x0
8010600d:	6a 54                	push   $0x54
8010600f:	e9 35 f8 ff ff       	jmp    80105849 <alltraps>

80106014 <vector85>:
80106014:	6a 00                	push   $0x0
80106016:	6a 55                	push   $0x55
80106018:	e9 2c f8 ff ff       	jmp    80105849 <alltraps>

8010601d <vector86>:
8010601d:	6a 00                	push   $0x0
8010601f:	6a 56                	push   $0x56
80106021:	e9 23 f8 ff ff       	jmp    80105849 <alltraps>

80106026 <vector87>:
80106026:	6a 00                	push   $0x0
80106028:	6a 57                	push   $0x57
8010602a:	e9 1a f8 ff ff       	jmp    80105849 <alltraps>

8010602f <vector88>:
8010602f:	6a 00                	push   $0x0
80106031:	6a 58                	push   $0x58
80106033:	e9 11 f8 ff ff       	jmp    80105849 <alltraps>

80106038 <vector89>:
80106038:	6a 00                	push   $0x0
8010603a:	6a 59                	push   $0x59
8010603c:	e9 08 f8 ff ff       	jmp    80105849 <alltraps>

80106041 <vector90>:
80106041:	6a 00                	push   $0x0
80106043:	6a 5a                	push   $0x5a
80106045:	e9 ff f7 ff ff       	jmp    80105849 <alltraps>

8010604a <vector91>:
8010604a:	6a 00                	push   $0x0
8010604c:	6a 5b                	push   $0x5b
8010604e:	e9 f6 f7 ff ff       	jmp    80105849 <alltraps>

80106053 <vector92>:
80106053:	6a 00                	push   $0x0
80106055:	6a 5c                	push   $0x5c
80106057:	e9 ed f7 ff ff       	jmp    80105849 <alltraps>

8010605c <vector93>:
8010605c:	6a 00                	push   $0x0
8010605e:	6a 5d                	push   $0x5d
80106060:	e9 e4 f7 ff ff       	jmp    80105849 <alltraps>

80106065 <vector94>:
80106065:	6a 00                	push   $0x0
80106067:	6a 5e                	push   $0x5e
80106069:	e9 db f7 ff ff       	jmp    80105849 <alltraps>

8010606e <vector95>:
8010606e:	6a 00                	push   $0x0
80106070:	6a 5f                	push   $0x5f
80106072:	e9 d2 f7 ff ff       	jmp    80105849 <alltraps>

80106077 <vector96>:
80106077:	6a 00                	push   $0x0
80106079:	6a 60                	push   $0x60
8010607b:	e9 c9 f7 ff ff       	jmp    80105849 <alltraps>

80106080 <vector97>:
80106080:	6a 00                	push   $0x0
80106082:	6a 61                	push   $0x61
80106084:	e9 c0 f7 ff ff       	jmp    80105849 <alltraps>

80106089 <vector98>:
80106089:	6a 00                	push   $0x0
8010608b:	6a 62                	push   $0x62
8010608d:	e9 b7 f7 ff ff       	jmp    80105849 <alltraps>

80106092 <vector99>:
80106092:	6a 00                	push   $0x0
80106094:	6a 63                	push   $0x63
80106096:	e9 ae f7 ff ff       	jmp    80105849 <alltraps>

8010609b <vector100>:
8010609b:	6a 00                	push   $0x0
8010609d:	6a 64                	push   $0x64
8010609f:	e9 a5 f7 ff ff       	jmp    80105849 <alltraps>

801060a4 <vector101>:
801060a4:	6a 00                	push   $0x0
801060a6:	6a 65                	push   $0x65
801060a8:	e9 9c f7 ff ff       	jmp    80105849 <alltraps>

801060ad <vector102>:
801060ad:	6a 00                	push   $0x0
801060af:	6a 66                	push   $0x66
801060b1:	e9 93 f7 ff ff       	jmp    80105849 <alltraps>

801060b6 <vector103>:
801060b6:	6a 00                	push   $0x0
801060b8:	6a 67                	push   $0x67
801060ba:	e9 8a f7 ff ff       	jmp    80105849 <alltraps>

801060bf <vector104>:
801060bf:	6a 00                	push   $0x0
801060c1:	6a 68                	push   $0x68
801060c3:	e9 81 f7 ff ff       	jmp    80105849 <alltraps>

801060c8 <vector105>:
801060c8:	6a 00                	push   $0x0
801060ca:	6a 69                	push   $0x69
801060cc:	e9 78 f7 ff ff       	jmp    80105849 <alltraps>

801060d1 <vector106>:
801060d1:	6a 00                	push   $0x0
801060d3:	6a 6a                	push   $0x6a
801060d5:	e9 6f f7 ff ff       	jmp    80105849 <alltraps>

801060da <vector107>:
801060da:	6a 00                	push   $0x0
801060dc:	6a 6b                	push   $0x6b
801060de:	e9 66 f7 ff ff       	jmp    80105849 <alltraps>

801060e3 <vector108>:
801060e3:	6a 00                	push   $0x0
801060e5:	6a 6c                	push   $0x6c
801060e7:	e9 5d f7 ff ff       	jmp    80105849 <alltraps>

801060ec <vector109>:
801060ec:	6a 00                	push   $0x0
801060ee:	6a 6d                	push   $0x6d
801060f0:	e9 54 f7 ff ff       	jmp    80105849 <alltraps>

801060f5 <vector110>:
801060f5:	6a 00                	push   $0x0
801060f7:	6a 6e                	push   $0x6e
801060f9:	e9 4b f7 ff ff       	jmp    80105849 <alltraps>

801060fe <vector111>:
801060fe:	6a 00                	push   $0x0
80106100:	6a 6f                	push   $0x6f
80106102:	e9 42 f7 ff ff       	jmp    80105849 <alltraps>

80106107 <vector112>:
80106107:	6a 00                	push   $0x0
80106109:	6a 70                	push   $0x70
8010610b:	e9 39 f7 ff ff       	jmp    80105849 <alltraps>

80106110 <vector113>:
80106110:	6a 00                	push   $0x0
80106112:	6a 71                	push   $0x71
80106114:	e9 30 f7 ff ff       	jmp    80105849 <alltraps>

80106119 <vector114>:
80106119:	6a 00                	push   $0x0
8010611b:	6a 72                	push   $0x72
8010611d:	e9 27 f7 ff ff       	jmp    80105849 <alltraps>

80106122 <vector115>:
80106122:	6a 00                	push   $0x0
80106124:	6a 73                	push   $0x73
80106126:	e9 1e f7 ff ff       	jmp    80105849 <alltraps>

8010612b <vector116>:
8010612b:	6a 00                	push   $0x0
8010612d:	6a 74                	push   $0x74
8010612f:	e9 15 f7 ff ff       	jmp    80105849 <alltraps>

80106134 <vector117>:
80106134:	6a 00                	push   $0x0
80106136:	6a 75                	push   $0x75
80106138:	e9 0c f7 ff ff       	jmp    80105849 <alltraps>

8010613d <vector118>:
8010613d:	6a 00                	push   $0x0
8010613f:	6a 76                	push   $0x76
80106141:	e9 03 f7 ff ff       	jmp    80105849 <alltraps>

80106146 <vector119>:
80106146:	6a 00                	push   $0x0
80106148:	6a 77                	push   $0x77
8010614a:	e9 fa f6 ff ff       	jmp    80105849 <alltraps>

8010614f <vector120>:
8010614f:	6a 00                	push   $0x0
80106151:	6a 78                	push   $0x78
80106153:	e9 f1 f6 ff ff       	jmp    80105849 <alltraps>

80106158 <vector121>:
80106158:	6a 00                	push   $0x0
8010615a:	6a 79                	push   $0x79
8010615c:	e9 e8 f6 ff ff       	jmp    80105849 <alltraps>

80106161 <vector122>:
80106161:	6a 00                	push   $0x0
80106163:	6a 7a                	push   $0x7a
80106165:	e9 df f6 ff ff       	jmp    80105849 <alltraps>

8010616a <vector123>:
8010616a:	6a 00                	push   $0x0
8010616c:	6a 7b                	push   $0x7b
8010616e:	e9 d6 f6 ff ff       	jmp    80105849 <alltraps>

80106173 <vector124>:
80106173:	6a 00                	push   $0x0
80106175:	6a 7c                	push   $0x7c
80106177:	e9 cd f6 ff ff       	jmp    80105849 <alltraps>

8010617c <vector125>:
8010617c:	6a 00                	push   $0x0
8010617e:	6a 7d                	push   $0x7d
80106180:	e9 c4 f6 ff ff       	jmp    80105849 <alltraps>

80106185 <vector126>:
80106185:	6a 00                	push   $0x0
80106187:	6a 7e                	push   $0x7e
80106189:	e9 bb f6 ff ff       	jmp    80105849 <alltraps>

8010618e <vector127>:
8010618e:	6a 00                	push   $0x0
80106190:	6a 7f                	push   $0x7f
80106192:	e9 b2 f6 ff ff       	jmp    80105849 <alltraps>

80106197 <vector128>:
80106197:	6a 00                	push   $0x0
80106199:	68 80 00 00 00       	push   $0x80
8010619e:	e9 a6 f6 ff ff       	jmp    80105849 <alltraps>

801061a3 <vector129>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 81 00 00 00       	push   $0x81
801061aa:	e9 9a f6 ff ff       	jmp    80105849 <alltraps>

801061af <vector130>:
801061af:	6a 00                	push   $0x0
801061b1:	68 82 00 00 00       	push   $0x82
801061b6:	e9 8e f6 ff ff       	jmp    80105849 <alltraps>

801061bb <vector131>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 83 00 00 00       	push   $0x83
801061c2:	e9 82 f6 ff ff       	jmp    80105849 <alltraps>

801061c7 <vector132>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 84 00 00 00       	push   $0x84
801061ce:	e9 76 f6 ff ff       	jmp    80105849 <alltraps>

801061d3 <vector133>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 85 00 00 00       	push   $0x85
801061da:	e9 6a f6 ff ff       	jmp    80105849 <alltraps>

801061df <vector134>:
801061df:	6a 00                	push   $0x0
801061e1:	68 86 00 00 00       	push   $0x86
801061e6:	e9 5e f6 ff ff       	jmp    80105849 <alltraps>

801061eb <vector135>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 87 00 00 00       	push   $0x87
801061f2:	e9 52 f6 ff ff       	jmp    80105849 <alltraps>

801061f7 <vector136>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 88 00 00 00       	push   $0x88
801061fe:	e9 46 f6 ff ff       	jmp    80105849 <alltraps>

80106203 <vector137>:
80106203:	6a 00                	push   $0x0
80106205:	68 89 00 00 00       	push   $0x89
8010620a:	e9 3a f6 ff ff       	jmp    80105849 <alltraps>

8010620f <vector138>:
8010620f:	6a 00                	push   $0x0
80106211:	68 8a 00 00 00       	push   $0x8a
80106216:	e9 2e f6 ff ff       	jmp    80105849 <alltraps>

8010621b <vector139>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 8b 00 00 00       	push   $0x8b
80106222:	e9 22 f6 ff ff       	jmp    80105849 <alltraps>

80106227 <vector140>:
80106227:	6a 00                	push   $0x0
80106229:	68 8c 00 00 00       	push   $0x8c
8010622e:	e9 16 f6 ff ff       	jmp    80105849 <alltraps>

80106233 <vector141>:
80106233:	6a 00                	push   $0x0
80106235:	68 8d 00 00 00       	push   $0x8d
8010623a:	e9 0a f6 ff ff       	jmp    80105849 <alltraps>

8010623f <vector142>:
8010623f:	6a 00                	push   $0x0
80106241:	68 8e 00 00 00       	push   $0x8e
80106246:	e9 fe f5 ff ff       	jmp    80105849 <alltraps>

8010624b <vector143>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 8f 00 00 00       	push   $0x8f
80106252:	e9 f2 f5 ff ff       	jmp    80105849 <alltraps>

80106257 <vector144>:
80106257:	6a 00                	push   $0x0
80106259:	68 90 00 00 00       	push   $0x90
8010625e:	e9 e6 f5 ff ff       	jmp    80105849 <alltraps>

80106263 <vector145>:
80106263:	6a 00                	push   $0x0
80106265:	68 91 00 00 00       	push   $0x91
8010626a:	e9 da f5 ff ff       	jmp    80105849 <alltraps>

8010626f <vector146>:
8010626f:	6a 00                	push   $0x0
80106271:	68 92 00 00 00       	push   $0x92
80106276:	e9 ce f5 ff ff       	jmp    80105849 <alltraps>

8010627b <vector147>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 93 00 00 00       	push   $0x93
80106282:	e9 c2 f5 ff ff       	jmp    80105849 <alltraps>

80106287 <vector148>:
80106287:	6a 00                	push   $0x0
80106289:	68 94 00 00 00       	push   $0x94
8010628e:	e9 b6 f5 ff ff       	jmp    80105849 <alltraps>

80106293 <vector149>:
80106293:	6a 00                	push   $0x0
80106295:	68 95 00 00 00       	push   $0x95
8010629a:	e9 aa f5 ff ff       	jmp    80105849 <alltraps>

8010629f <vector150>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 96 00 00 00       	push   $0x96
801062a6:	e9 9e f5 ff ff       	jmp    80105849 <alltraps>

801062ab <vector151>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 97 00 00 00       	push   $0x97
801062b2:	e9 92 f5 ff ff       	jmp    80105849 <alltraps>

801062b7 <vector152>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 98 00 00 00       	push   $0x98
801062be:	e9 86 f5 ff ff       	jmp    80105849 <alltraps>

801062c3 <vector153>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 99 00 00 00       	push   $0x99
801062ca:	e9 7a f5 ff ff       	jmp    80105849 <alltraps>

801062cf <vector154>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 9a 00 00 00       	push   $0x9a
801062d6:	e9 6e f5 ff ff       	jmp    80105849 <alltraps>

801062db <vector155>:
801062db:	6a 00                	push   $0x0
801062dd:	68 9b 00 00 00       	push   $0x9b
801062e2:	e9 62 f5 ff ff       	jmp    80105849 <alltraps>

801062e7 <vector156>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 9c 00 00 00       	push   $0x9c
801062ee:	e9 56 f5 ff ff       	jmp    80105849 <alltraps>

801062f3 <vector157>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 9d 00 00 00       	push   $0x9d
801062fa:	e9 4a f5 ff ff       	jmp    80105849 <alltraps>

801062ff <vector158>:
801062ff:	6a 00                	push   $0x0
80106301:	68 9e 00 00 00       	push   $0x9e
80106306:	e9 3e f5 ff ff       	jmp    80105849 <alltraps>

8010630b <vector159>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 9f 00 00 00       	push   $0x9f
80106312:	e9 32 f5 ff ff       	jmp    80105849 <alltraps>

80106317 <vector160>:
80106317:	6a 00                	push   $0x0
80106319:	68 a0 00 00 00       	push   $0xa0
8010631e:	e9 26 f5 ff ff       	jmp    80105849 <alltraps>

80106323 <vector161>:
80106323:	6a 00                	push   $0x0
80106325:	68 a1 00 00 00       	push   $0xa1
8010632a:	e9 1a f5 ff ff       	jmp    80105849 <alltraps>

8010632f <vector162>:
8010632f:	6a 00                	push   $0x0
80106331:	68 a2 00 00 00       	push   $0xa2
80106336:	e9 0e f5 ff ff       	jmp    80105849 <alltraps>

8010633b <vector163>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 a3 00 00 00       	push   $0xa3
80106342:	e9 02 f5 ff ff       	jmp    80105849 <alltraps>

80106347 <vector164>:
80106347:	6a 00                	push   $0x0
80106349:	68 a4 00 00 00       	push   $0xa4
8010634e:	e9 f6 f4 ff ff       	jmp    80105849 <alltraps>

80106353 <vector165>:
80106353:	6a 00                	push   $0x0
80106355:	68 a5 00 00 00       	push   $0xa5
8010635a:	e9 ea f4 ff ff       	jmp    80105849 <alltraps>

8010635f <vector166>:
8010635f:	6a 00                	push   $0x0
80106361:	68 a6 00 00 00       	push   $0xa6
80106366:	e9 de f4 ff ff       	jmp    80105849 <alltraps>

8010636b <vector167>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 a7 00 00 00       	push   $0xa7
80106372:	e9 d2 f4 ff ff       	jmp    80105849 <alltraps>

80106377 <vector168>:
80106377:	6a 00                	push   $0x0
80106379:	68 a8 00 00 00       	push   $0xa8
8010637e:	e9 c6 f4 ff ff       	jmp    80105849 <alltraps>

80106383 <vector169>:
80106383:	6a 00                	push   $0x0
80106385:	68 a9 00 00 00       	push   $0xa9
8010638a:	e9 ba f4 ff ff       	jmp    80105849 <alltraps>

8010638f <vector170>:
8010638f:	6a 00                	push   $0x0
80106391:	68 aa 00 00 00       	push   $0xaa
80106396:	e9 ae f4 ff ff       	jmp    80105849 <alltraps>

8010639b <vector171>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 ab 00 00 00       	push   $0xab
801063a2:	e9 a2 f4 ff ff       	jmp    80105849 <alltraps>

801063a7 <vector172>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 ac 00 00 00       	push   $0xac
801063ae:	e9 96 f4 ff ff       	jmp    80105849 <alltraps>

801063b3 <vector173>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 ad 00 00 00       	push   $0xad
801063ba:	e9 8a f4 ff ff       	jmp    80105849 <alltraps>

801063bf <vector174>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 ae 00 00 00       	push   $0xae
801063c6:	e9 7e f4 ff ff       	jmp    80105849 <alltraps>

801063cb <vector175>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 af 00 00 00       	push   $0xaf
801063d2:	e9 72 f4 ff ff       	jmp    80105849 <alltraps>

801063d7 <vector176>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 b0 00 00 00       	push   $0xb0
801063de:	e9 66 f4 ff ff       	jmp    80105849 <alltraps>

801063e3 <vector177>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 b1 00 00 00       	push   $0xb1
801063ea:	e9 5a f4 ff ff       	jmp    80105849 <alltraps>

801063ef <vector178>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 b2 00 00 00       	push   $0xb2
801063f6:	e9 4e f4 ff ff       	jmp    80105849 <alltraps>

801063fb <vector179>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 b3 00 00 00       	push   $0xb3
80106402:	e9 42 f4 ff ff       	jmp    80105849 <alltraps>

80106407 <vector180>:
80106407:	6a 00                	push   $0x0
80106409:	68 b4 00 00 00       	push   $0xb4
8010640e:	e9 36 f4 ff ff       	jmp    80105849 <alltraps>

80106413 <vector181>:
80106413:	6a 00                	push   $0x0
80106415:	68 b5 00 00 00       	push   $0xb5
8010641a:	e9 2a f4 ff ff       	jmp    80105849 <alltraps>

8010641f <vector182>:
8010641f:	6a 00                	push   $0x0
80106421:	68 b6 00 00 00       	push   $0xb6
80106426:	e9 1e f4 ff ff       	jmp    80105849 <alltraps>

8010642b <vector183>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 b7 00 00 00       	push   $0xb7
80106432:	e9 12 f4 ff ff       	jmp    80105849 <alltraps>

80106437 <vector184>:
80106437:	6a 00                	push   $0x0
80106439:	68 b8 00 00 00       	push   $0xb8
8010643e:	e9 06 f4 ff ff       	jmp    80105849 <alltraps>

80106443 <vector185>:
80106443:	6a 00                	push   $0x0
80106445:	68 b9 00 00 00       	push   $0xb9
8010644a:	e9 fa f3 ff ff       	jmp    80105849 <alltraps>

8010644f <vector186>:
8010644f:	6a 00                	push   $0x0
80106451:	68 ba 00 00 00       	push   $0xba
80106456:	e9 ee f3 ff ff       	jmp    80105849 <alltraps>

8010645b <vector187>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 bb 00 00 00       	push   $0xbb
80106462:	e9 e2 f3 ff ff       	jmp    80105849 <alltraps>

80106467 <vector188>:
80106467:	6a 00                	push   $0x0
80106469:	68 bc 00 00 00       	push   $0xbc
8010646e:	e9 d6 f3 ff ff       	jmp    80105849 <alltraps>

80106473 <vector189>:
80106473:	6a 00                	push   $0x0
80106475:	68 bd 00 00 00       	push   $0xbd
8010647a:	e9 ca f3 ff ff       	jmp    80105849 <alltraps>

8010647f <vector190>:
8010647f:	6a 00                	push   $0x0
80106481:	68 be 00 00 00       	push   $0xbe
80106486:	e9 be f3 ff ff       	jmp    80105849 <alltraps>

8010648b <vector191>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 bf 00 00 00       	push   $0xbf
80106492:	e9 b2 f3 ff ff       	jmp    80105849 <alltraps>

80106497 <vector192>:
80106497:	6a 00                	push   $0x0
80106499:	68 c0 00 00 00       	push   $0xc0
8010649e:	e9 a6 f3 ff ff       	jmp    80105849 <alltraps>

801064a3 <vector193>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 c1 00 00 00       	push   $0xc1
801064aa:	e9 9a f3 ff ff       	jmp    80105849 <alltraps>

801064af <vector194>:
801064af:	6a 00                	push   $0x0
801064b1:	68 c2 00 00 00       	push   $0xc2
801064b6:	e9 8e f3 ff ff       	jmp    80105849 <alltraps>

801064bb <vector195>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 c3 00 00 00       	push   $0xc3
801064c2:	e9 82 f3 ff ff       	jmp    80105849 <alltraps>

801064c7 <vector196>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 c4 00 00 00       	push   $0xc4
801064ce:	e9 76 f3 ff ff       	jmp    80105849 <alltraps>

801064d3 <vector197>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 c5 00 00 00       	push   $0xc5
801064da:	e9 6a f3 ff ff       	jmp    80105849 <alltraps>

801064df <vector198>:
801064df:	6a 00                	push   $0x0
801064e1:	68 c6 00 00 00       	push   $0xc6
801064e6:	e9 5e f3 ff ff       	jmp    80105849 <alltraps>

801064eb <vector199>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 c7 00 00 00       	push   $0xc7
801064f2:	e9 52 f3 ff ff       	jmp    80105849 <alltraps>

801064f7 <vector200>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 c8 00 00 00       	push   $0xc8
801064fe:	e9 46 f3 ff ff       	jmp    80105849 <alltraps>

80106503 <vector201>:
80106503:	6a 00                	push   $0x0
80106505:	68 c9 00 00 00       	push   $0xc9
8010650a:	e9 3a f3 ff ff       	jmp    80105849 <alltraps>

8010650f <vector202>:
8010650f:	6a 00                	push   $0x0
80106511:	68 ca 00 00 00       	push   $0xca
80106516:	e9 2e f3 ff ff       	jmp    80105849 <alltraps>

8010651b <vector203>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 cb 00 00 00       	push   $0xcb
80106522:	e9 22 f3 ff ff       	jmp    80105849 <alltraps>

80106527 <vector204>:
80106527:	6a 00                	push   $0x0
80106529:	68 cc 00 00 00       	push   $0xcc
8010652e:	e9 16 f3 ff ff       	jmp    80105849 <alltraps>

80106533 <vector205>:
80106533:	6a 00                	push   $0x0
80106535:	68 cd 00 00 00       	push   $0xcd
8010653a:	e9 0a f3 ff ff       	jmp    80105849 <alltraps>

8010653f <vector206>:
8010653f:	6a 00                	push   $0x0
80106541:	68 ce 00 00 00       	push   $0xce
80106546:	e9 fe f2 ff ff       	jmp    80105849 <alltraps>

8010654b <vector207>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 cf 00 00 00       	push   $0xcf
80106552:	e9 f2 f2 ff ff       	jmp    80105849 <alltraps>

80106557 <vector208>:
80106557:	6a 00                	push   $0x0
80106559:	68 d0 00 00 00       	push   $0xd0
8010655e:	e9 e6 f2 ff ff       	jmp    80105849 <alltraps>

80106563 <vector209>:
80106563:	6a 00                	push   $0x0
80106565:	68 d1 00 00 00       	push   $0xd1
8010656a:	e9 da f2 ff ff       	jmp    80105849 <alltraps>

8010656f <vector210>:
8010656f:	6a 00                	push   $0x0
80106571:	68 d2 00 00 00       	push   $0xd2
80106576:	e9 ce f2 ff ff       	jmp    80105849 <alltraps>

8010657b <vector211>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 d3 00 00 00       	push   $0xd3
80106582:	e9 c2 f2 ff ff       	jmp    80105849 <alltraps>

80106587 <vector212>:
80106587:	6a 00                	push   $0x0
80106589:	68 d4 00 00 00       	push   $0xd4
8010658e:	e9 b6 f2 ff ff       	jmp    80105849 <alltraps>

80106593 <vector213>:
80106593:	6a 00                	push   $0x0
80106595:	68 d5 00 00 00       	push   $0xd5
8010659a:	e9 aa f2 ff ff       	jmp    80105849 <alltraps>

8010659f <vector214>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 d6 00 00 00       	push   $0xd6
801065a6:	e9 9e f2 ff ff       	jmp    80105849 <alltraps>

801065ab <vector215>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 d7 00 00 00       	push   $0xd7
801065b2:	e9 92 f2 ff ff       	jmp    80105849 <alltraps>

801065b7 <vector216>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 d8 00 00 00       	push   $0xd8
801065be:	e9 86 f2 ff ff       	jmp    80105849 <alltraps>

801065c3 <vector217>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 d9 00 00 00       	push   $0xd9
801065ca:	e9 7a f2 ff ff       	jmp    80105849 <alltraps>

801065cf <vector218>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 da 00 00 00       	push   $0xda
801065d6:	e9 6e f2 ff ff       	jmp    80105849 <alltraps>

801065db <vector219>:
801065db:	6a 00                	push   $0x0
801065dd:	68 db 00 00 00       	push   $0xdb
801065e2:	e9 62 f2 ff ff       	jmp    80105849 <alltraps>

801065e7 <vector220>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 dc 00 00 00       	push   $0xdc
801065ee:	e9 56 f2 ff ff       	jmp    80105849 <alltraps>

801065f3 <vector221>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 dd 00 00 00       	push   $0xdd
801065fa:	e9 4a f2 ff ff       	jmp    80105849 <alltraps>

801065ff <vector222>:
801065ff:	6a 00                	push   $0x0
80106601:	68 de 00 00 00       	push   $0xde
80106606:	e9 3e f2 ff ff       	jmp    80105849 <alltraps>

8010660b <vector223>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 df 00 00 00       	push   $0xdf
80106612:	e9 32 f2 ff ff       	jmp    80105849 <alltraps>

80106617 <vector224>:
80106617:	6a 00                	push   $0x0
80106619:	68 e0 00 00 00       	push   $0xe0
8010661e:	e9 26 f2 ff ff       	jmp    80105849 <alltraps>

80106623 <vector225>:
80106623:	6a 00                	push   $0x0
80106625:	68 e1 00 00 00       	push   $0xe1
8010662a:	e9 1a f2 ff ff       	jmp    80105849 <alltraps>

8010662f <vector226>:
8010662f:	6a 00                	push   $0x0
80106631:	68 e2 00 00 00       	push   $0xe2
80106636:	e9 0e f2 ff ff       	jmp    80105849 <alltraps>

8010663b <vector227>:
8010663b:	6a 00                	push   $0x0
8010663d:	68 e3 00 00 00       	push   $0xe3
80106642:	e9 02 f2 ff ff       	jmp    80105849 <alltraps>

80106647 <vector228>:
80106647:	6a 00                	push   $0x0
80106649:	68 e4 00 00 00       	push   $0xe4
8010664e:	e9 f6 f1 ff ff       	jmp    80105849 <alltraps>

80106653 <vector229>:
80106653:	6a 00                	push   $0x0
80106655:	68 e5 00 00 00       	push   $0xe5
8010665a:	e9 ea f1 ff ff       	jmp    80105849 <alltraps>

8010665f <vector230>:
8010665f:	6a 00                	push   $0x0
80106661:	68 e6 00 00 00       	push   $0xe6
80106666:	e9 de f1 ff ff       	jmp    80105849 <alltraps>

8010666b <vector231>:
8010666b:	6a 00                	push   $0x0
8010666d:	68 e7 00 00 00       	push   $0xe7
80106672:	e9 d2 f1 ff ff       	jmp    80105849 <alltraps>

80106677 <vector232>:
80106677:	6a 00                	push   $0x0
80106679:	68 e8 00 00 00       	push   $0xe8
8010667e:	e9 c6 f1 ff ff       	jmp    80105849 <alltraps>

80106683 <vector233>:
80106683:	6a 00                	push   $0x0
80106685:	68 e9 00 00 00       	push   $0xe9
8010668a:	e9 ba f1 ff ff       	jmp    80105849 <alltraps>

8010668f <vector234>:
8010668f:	6a 00                	push   $0x0
80106691:	68 ea 00 00 00       	push   $0xea
80106696:	e9 ae f1 ff ff       	jmp    80105849 <alltraps>

8010669b <vector235>:
8010669b:	6a 00                	push   $0x0
8010669d:	68 eb 00 00 00       	push   $0xeb
801066a2:	e9 a2 f1 ff ff       	jmp    80105849 <alltraps>

801066a7 <vector236>:
801066a7:	6a 00                	push   $0x0
801066a9:	68 ec 00 00 00       	push   $0xec
801066ae:	e9 96 f1 ff ff       	jmp    80105849 <alltraps>

801066b3 <vector237>:
801066b3:	6a 00                	push   $0x0
801066b5:	68 ed 00 00 00       	push   $0xed
801066ba:	e9 8a f1 ff ff       	jmp    80105849 <alltraps>

801066bf <vector238>:
801066bf:	6a 00                	push   $0x0
801066c1:	68 ee 00 00 00       	push   $0xee
801066c6:	e9 7e f1 ff ff       	jmp    80105849 <alltraps>

801066cb <vector239>:
801066cb:	6a 00                	push   $0x0
801066cd:	68 ef 00 00 00       	push   $0xef
801066d2:	e9 72 f1 ff ff       	jmp    80105849 <alltraps>

801066d7 <vector240>:
801066d7:	6a 00                	push   $0x0
801066d9:	68 f0 00 00 00       	push   $0xf0
801066de:	e9 66 f1 ff ff       	jmp    80105849 <alltraps>

801066e3 <vector241>:
801066e3:	6a 00                	push   $0x0
801066e5:	68 f1 00 00 00       	push   $0xf1
801066ea:	e9 5a f1 ff ff       	jmp    80105849 <alltraps>

801066ef <vector242>:
801066ef:	6a 00                	push   $0x0
801066f1:	68 f2 00 00 00       	push   $0xf2
801066f6:	e9 4e f1 ff ff       	jmp    80105849 <alltraps>

801066fb <vector243>:
801066fb:	6a 00                	push   $0x0
801066fd:	68 f3 00 00 00       	push   $0xf3
80106702:	e9 42 f1 ff ff       	jmp    80105849 <alltraps>

80106707 <vector244>:
80106707:	6a 00                	push   $0x0
80106709:	68 f4 00 00 00       	push   $0xf4
8010670e:	e9 36 f1 ff ff       	jmp    80105849 <alltraps>

80106713 <vector245>:
80106713:	6a 00                	push   $0x0
80106715:	68 f5 00 00 00       	push   $0xf5
8010671a:	e9 2a f1 ff ff       	jmp    80105849 <alltraps>

8010671f <vector246>:
8010671f:	6a 00                	push   $0x0
80106721:	68 f6 00 00 00       	push   $0xf6
80106726:	e9 1e f1 ff ff       	jmp    80105849 <alltraps>

8010672b <vector247>:
8010672b:	6a 00                	push   $0x0
8010672d:	68 f7 00 00 00       	push   $0xf7
80106732:	e9 12 f1 ff ff       	jmp    80105849 <alltraps>

80106737 <vector248>:
80106737:	6a 00                	push   $0x0
80106739:	68 f8 00 00 00       	push   $0xf8
8010673e:	e9 06 f1 ff ff       	jmp    80105849 <alltraps>

80106743 <vector249>:
80106743:	6a 00                	push   $0x0
80106745:	68 f9 00 00 00       	push   $0xf9
8010674a:	e9 fa f0 ff ff       	jmp    80105849 <alltraps>

8010674f <vector250>:
8010674f:	6a 00                	push   $0x0
80106751:	68 fa 00 00 00       	push   $0xfa
80106756:	e9 ee f0 ff ff       	jmp    80105849 <alltraps>

8010675b <vector251>:
8010675b:	6a 00                	push   $0x0
8010675d:	68 fb 00 00 00       	push   $0xfb
80106762:	e9 e2 f0 ff ff       	jmp    80105849 <alltraps>

80106767 <vector252>:
80106767:	6a 00                	push   $0x0
80106769:	68 fc 00 00 00       	push   $0xfc
8010676e:	e9 d6 f0 ff ff       	jmp    80105849 <alltraps>

80106773 <vector253>:
80106773:	6a 00                	push   $0x0
80106775:	68 fd 00 00 00       	push   $0xfd
8010677a:	e9 ca f0 ff ff       	jmp    80105849 <alltraps>

8010677f <vector254>:
8010677f:	6a 00                	push   $0x0
80106781:	68 fe 00 00 00       	push   $0xfe
80106786:	e9 be f0 ff ff       	jmp    80105849 <alltraps>

8010678b <vector255>:
8010678b:	6a 00                	push   $0x0
8010678d:	68 ff 00 00 00       	push   $0xff
80106792:	e9 b2 f0 ff ff       	jmp    80105849 <alltraps>
80106797:	66 90                	xchg   %ax,%ax
80106799:	66 90                	xchg   %ax,%ax
8010679b:	66 90                	xchg   %ax,%ax
8010679d:	66 90                	xchg   %ax,%ax
8010679f:	90                   	nop

801067a0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801067a0:	55                   	push   %ebp
801067a1:	89 e5                	mov    %esp,%ebp
801067a3:	57                   	push   %edi
801067a4:	56                   	push   %esi
801067a5:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801067a6:	89 d3                	mov    %edx,%ebx
{
801067a8:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
801067aa:	c1 eb 16             	shr    $0x16,%ebx
801067ad:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
801067b0:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
801067b3:	8b 06                	mov    (%esi),%eax
801067b5:	a8 01                	test   $0x1,%al
801067b7:	74 27                	je     801067e0 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801067b9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801067be:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801067c4:	c1 ef 0a             	shr    $0xa,%edi
}
801067c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
801067ca:	89 fa                	mov    %edi,%edx
801067cc:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801067d2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
801067d5:	5b                   	pop    %ebx
801067d6:	5e                   	pop    %esi
801067d7:	5f                   	pop    %edi
801067d8:	5d                   	pop    %ebp
801067d9:	c3                   	ret    
801067da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
801067e0:	85 c9                	test   %ecx,%ecx
801067e2:	74 2c                	je     80106810 <walkpgdir+0x70>
801067e4:	e8 17 bd ff ff       	call   80102500 <kalloc>
801067e9:	85 c0                	test   %eax,%eax
801067eb:	89 c3                	mov    %eax,%ebx
801067ed:	74 21                	je     80106810 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
801067ef:	83 ec 04             	sub    $0x4,%esp
801067f2:	68 00 10 00 00       	push   $0x1000
801067f7:	6a 00                	push   $0x0
801067f9:	50                   	push   %eax
801067fa:	e8 e1 dd ff ff       	call   801045e0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801067ff:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106805:	83 c4 10             	add    $0x10,%esp
80106808:	83 c8 07             	or     $0x7,%eax
8010680b:	89 06                	mov    %eax,(%esi)
8010680d:	eb b5                	jmp    801067c4 <walkpgdir+0x24>
8010680f:	90                   	nop
}
80106810:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106813:	31 c0                	xor    %eax,%eax
}
80106815:	5b                   	pop    %ebx
80106816:	5e                   	pop    %esi
80106817:	5f                   	pop    %edi
80106818:	5d                   	pop    %ebp
80106819:	c3                   	ret    
8010681a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106820 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106820:	55                   	push   %ebp
80106821:	89 e5                	mov    %esp,%ebp
80106823:	57                   	push   %edi
80106824:	56                   	push   %esi
80106825:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106826:	89 d3                	mov    %edx,%ebx
80106828:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
8010682e:	83 ec 1c             	sub    $0x1c,%esp
80106831:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106834:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106838:	8b 7d 08             	mov    0x8(%ebp),%edi
8010683b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106840:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106843:	8b 45 0c             	mov    0xc(%ebp),%eax
80106846:	29 df                	sub    %ebx,%edi
80106848:	83 c8 01             	or     $0x1,%eax
8010684b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010684e:	eb 15                	jmp    80106865 <mappages+0x45>
    if(*pte & PTE_P)
80106850:	f6 00 01             	testb  $0x1,(%eax)
80106853:	75 45                	jne    8010689a <mappages+0x7a>
    *pte = pa | perm | PTE_P;
80106855:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106858:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
8010685b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010685d:	74 31                	je     80106890 <mappages+0x70>
      break;
    a += PGSIZE;
8010685f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106865:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106868:	b9 01 00 00 00       	mov    $0x1,%ecx
8010686d:	89 da                	mov    %ebx,%edx
8010686f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106872:	e8 29 ff ff ff       	call   801067a0 <walkpgdir>
80106877:	85 c0                	test   %eax,%eax
80106879:	75 d5                	jne    80106850 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
8010687b:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
8010687e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106883:	5b                   	pop    %ebx
80106884:	5e                   	pop    %esi
80106885:	5f                   	pop    %edi
80106886:	5d                   	pop    %ebp
80106887:	c3                   	ret    
80106888:	90                   	nop
80106889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106890:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106893:	31 c0                	xor    %eax,%eax
}
80106895:	5b                   	pop    %ebx
80106896:	5e                   	pop    %esi
80106897:	5f                   	pop    %edi
80106898:	5d                   	pop    %ebp
80106899:	c3                   	ret    
      panic("remap");
8010689a:	83 ec 0c             	sub    $0xc,%esp
8010689d:	68 74 7b 10 80       	push   $0x80107b74
801068a2:	e8 e9 9a ff ff       	call   80100390 <panic>
801068a7:	89 f6                	mov    %esi,%esi
801068a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068b0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068b0:	55                   	push   %ebp
801068b1:	89 e5                	mov    %esp,%ebp
801068b3:	57                   	push   %edi
801068b4:	56                   	push   %esi
801068b5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801068b6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068bc:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
801068be:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068c4:	83 ec 1c             	sub    $0x1c,%esp
801068c7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
801068ca:	39 d3                	cmp    %edx,%ebx
801068cc:	73 66                	jae    80106934 <deallocuvm.part.0+0x84>
801068ce:	89 d6                	mov    %edx,%esi
801068d0:	eb 3d                	jmp    8010690f <deallocuvm.part.0+0x5f>
801068d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801068d8:	8b 10                	mov    (%eax),%edx
801068da:	f6 c2 01             	test   $0x1,%dl
801068dd:	74 26                	je     80106905 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801068df:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801068e5:	74 58                	je     8010693f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
801068e7:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
801068ea:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801068f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
801068f3:	52                   	push   %edx
801068f4:	e8 57 ba ff ff       	call   80102350 <kfree>
      *pte = 0;
801068f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801068fc:	83 c4 10             	add    $0x10,%esp
801068ff:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106905:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010690b:	39 f3                	cmp    %esi,%ebx
8010690d:	73 25                	jae    80106934 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010690f:	31 c9                	xor    %ecx,%ecx
80106911:	89 da                	mov    %ebx,%edx
80106913:	89 f8                	mov    %edi,%eax
80106915:	e8 86 fe ff ff       	call   801067a0 <walkpgdir>
    if(!pte)
8010691a:	85 c0                	test   %eax,%eax
8010691c:	75 ba                	jne    801068d8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010691e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106924:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
8010692a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106930:	39 f3                	cmp    %esi,%ebx
80106932:	72 db                	jb     8010690f <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106934:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106937:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010693a:	5b                   	pop    %ebx
8010693b:	5e                   	pop    %esi
8010693c:	5f                   	pop    %edi
8010693d:	5d                   	pop    %ebp
8010693e:	c3                   	ret    
        panic("kfree");
8010693f:	83 ec 0c             	sub    $0xc,%esp
80106942:	68 06 75 10 80       	push   $0x80107506
80106947:	e8 44 9a ff ff       	call   80100390 <panic>
8010694c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106950 <seginit>:
{
80106950:	55                   	push   %ebp
80106951:	89 e5                	mov    %esp,%ebp
80106953:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106956:	e8 15 cf ff ff       	call   80103870 <cpuid>
8010695b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
  pd[0] = size-1;
80106961:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106966:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010696a:	c7 80 d8 31 11 80 ff 	movl   $0xffff,-0x7feece28(%eax)
80106971:	ff 00 00 
80106974:	c7 80 dc 31 11 80 00 	movl   $0xcf9a00,-0x7feece24(%eax)
8010697b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010697e:	c7 80 e0 31 11 80 ff 	movl   $0xffff,-0x7feece20(%eax)
80106985:	ff 00 00 
80106988:	c7 80 e4 31 11 80 00 	movl   $0xcf9200,-0x7feece1c(%eax)
8010698f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106992:	c7 80 e8 31 11 80 ff 	movl   $0xffff,-0x7feece18(%eax)
80106999:	ff 00 00 
8010699c:	c7 80 ec 31 11 80 00 	movl   $0xcffa00,-0x7feece14(%eax)
801069a3:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801069a6:	c7 80 f0 31 11 80 ff 	movl   $0xffff,-0x7feece10(%eax)
801069ad:	ff 00 00 
801069b0:	c7 80 f4 31 11 80 00 	movl   $0xcff200,-0x7feece0c(%eax)
801069b7:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
801069ba:	05 d0 31 11 80       	add    $0x801131d0,%eax
  pd[1] = (uint)p;
801069bf:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
801069c3:	c1 e8 10             	shr    $0x10,%eax
801069c6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
801069ca:	8d 45 f2             	lea    -0xe(%ebp),%eax
801069cd:	0f 01 10             	lgdtl  (%eax)
}
801069d0:	c9                   	leave  
801069d1:	c3                   	ret    
801069d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069e0 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801069e0:	a1 84 5f 11 80       	mov    0x80115f84,%eax
{
801069e5:	55                   	push   %ebp
801069e6:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801069e8:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801069ed:	0f 22 d8             	mov    %eax,%cr3
}
801069f0:	5d                   	pop    %ebp
801069f1:	c3                   	ret    
801069f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a00 <switchuvm>:
{
80106a00:	55                   	push   %ebp
80106a01:	89 e5                	mov    %esp,%ebp
80106a03:	57                   	push   %edi
80106a04:	56                   	push   %esi
80106a05:	53                   	push   %ebx
80106a06:	83 ec 1c             	sub    $0x1c,%esp
80106a09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106a0c:	85 db                	test   %ebx,%ebx
80106a0e:	0f 84 cb 00 00 00    	je     80106adf <switchuvm+0xdf>
  if(p->kstack == 0)
80106a14:	8b 43 08             	mov    0x8(%ebx),%eax
80106a17:	85 c0                	test   %eax,%eax
80106a19:	0f 84 da 00 00 00    	je     80106af9 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106a1f:	8b 43 04             	mov    0x4(%ebx),%eax
80106a22:	85 c0                	test   %eax,%eax
80106a24:	0f 84 c2 00 00 00    	je     80106aec <switchuvm+0xec>
  pushcli();
80106a2a:	e8 d1 d9 ff ff       	call   80104400 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106a2f:	e8 bc cd ff ff       	call   801037f0 <mycpu>
80106a34:	89 c6                	mov    %eax,%esi
80106a36:	e8 b5 cd ff ff       	call   801037f0 <mycpu>
80106a3b:	89 c7                	mov    %eax,%edi
80106a3d:	e8 ae cd ff ff       	call   801037f0 <mycpu>
80106a42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106a45:	83 c7 08             	add    $0x8,%edi
80106a48:	e8 a3 cd ff ff       	call   801037f0 <mycpu>
80106a4d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106a50:	83 c0 08             	add    $0x8,%eax
80106a53:	ba 67 00 00 00       	mov    $0x67,%edx
80106a58:	c1 e8 18             	shr    $0x18,%eax
80106a5b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106a62:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106a69:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106a6f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106a74:	83 c1 08             	add    $0x8,%ecx
80106a77:	c1 e9 10             	shr    $0x10,%ecx
80106a7a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106a80:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106a85:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106a8c:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80106a91:	e8 5a cd ff ff       	call   801037f0 <mycpu>
80106a96:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106a9d:	e8 4e cd ff ff       	call   801037f0 <mycpu>
80106aa2:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106aa6:	8b 73 08             	mov    0x8(%ebx),%esi
80106aa9:	e8 42 cd ff ff       	call   801037f0 <mycpu>
80106aae:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106ab4:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106ab7:	e8 34 cd ff ff       	call   801037f0 <mycpu>
80106abc:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106ac0:	b8 28 00 00 00       	mov    $0x28,%eax
80106ac5:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106ac8:	8b 43 04             	mov    0x4(%ebx),%eax
80106acb:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106ad0:	0f 22 d8             	mov    %eax,%cr3
}
80106ad3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ad6:	5b                   	pop    %ebx
80106ad7:	5e                   	pop    %esi
80106ad8:	5f                   	pop    %edi
80106ad9:	5d                   	pop    %ebp
  popcli();
80106ada:	e9 61 d9 ff ff       	jmp    80104440 <popcli>
    panic("switchuvm: no process");
80106adf:	83 ec 0c             	sub    $0xc,%esp
80106ae2:	68 7a 7b 10 80       	push   $0x80107b7a
80106ae7:	e8 a4 98 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
80106aec:	83 ec 0c             	sub    $0xc,%esp
80106aef:	68 a5 7b 10 80       	push   $0x80107ba5
80106af4:	e8 97 98 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
80106af9:	83 ec 0c             	sub    $0xc,%esp
80106afc:	68 90 7b 10 80       	push   $0x80107b90
80106b01:	e8 8a 98 ff ff       	call   80100390 <panic>
80106b06:	8d 76 00             	lea    0x0(%esi),%esi
80106b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b10 <inituvm>:
{
80106b10:	55                   	push   %ebp
80106b11:	89 e5                	mov    %esp,%ebp
80106b13:	57                   	push   %edi
80106b14:	56                   	push   %esi
80106b15:	53                   	push   %ebx
80106b16:	83 ec 1c             	sub    $0x1c,%esp
80106b19:	8b 75 10             	mov    0x10(%ebp),%esi
80106b1c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b1f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106b22:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80106b28:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106b2b:	77 49                	ja     80106b76 <inituvm+0x66>
  mem = kalloc();
80106b2d:	e8 ce b9 ff ff       	call   80102500 <kalloc>
  memset(mem, 0, PGSIZE);
80106b32:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106b35:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106b37:	68 00 10 00 00       	push   $0x1000
80106b3c:	6a 00                	push   $0x0
80106b3e:	50                   	push   %eax
80106b3f:	e8 9c da ff ff       	call   801045e0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106b44:	58                   	pop    %eax
80106b45:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106b4b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b50:	5a                   	pop    %edx
80106b51:	6a 06                	push   $0x6
80106b53:	50                   	push   %eax
80106b54:	31 d2                	xor    %edx,%edx
80106b56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b59:	e8 c2 fc ff ff       	call   80106820 <mappages>
  memmove(mem, init, sz);
80106b5e:	89 75 10             	mov    %esi,0x10(%ebp)
80106b61:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106b64:	83 c4 10             	add    $0x10,%esp
80106b67:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106b6a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b6d:	5b                   	pop    %ebx
80106b6e:	5e                   	pop    %esi
80106b6f:	5f                   	pop    %edi
80106b70:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106b71:	e9 1a db ff ff       	jmp    80104690 <memmove>
    panic("inituvm: more than a page");
80106b76:	83 ec 0c             	sub    $0xc,%esp
80106b79:	68 b9 7b 10 80       	push   $0x80107bb9
80106b7e:	e8 0d 98 ff ff       	call   80100390 <panic>
80106b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b90 <loaduvm>:
{
80106b90:	55                   	push   %ebp
80106b91:	89 e5                	mov    %esp,%ebp
80106b93:	57                   	push   %edi
80106b94:	56                   	push   %esi
80106b95:	53                   	push   %ebx
80106b96:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80106b99:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106ba0:	0f 85 91 00 00 00    	jne    80106c37 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80106ba6:	8b 75 18             	mov    0x18(%ebp),%esi
80106ba9:	31 db                	xor    %ebx,%ebx
80106bab:	85 f6                	test   %esi,%esi
80106bad:	75 1a                	jne    80106bc9 <loaduvm+0x39>
80106baf:	eb 6f                	jmp    80106c20 <loaduvm+0x90>
80106bb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bb8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106bbe:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106bc4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106bc7:	76 57                	jbe    80106c20 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106bc9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106bcc:	8b 45 08             	mov    0x8(%ebp),%eax
80106bcf:	31 c9                	xor    %ecx,%ecx
80106bd1:	01 da                	add    %ebx,%edx
80106bd3:	e8 c8 fb ff ff       	call   801067a0 <walkpgdir>
80106bd8:	85 c0                	test   %eax,%eax
80106bda:	74 4e                	je     80106c2a <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
80106bdc:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106bde:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80106be1:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106be6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106beb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106bf1:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106bf4:	01 d9                	add    %ebx,%ecx
80106bf6:	05 00 00 00 80       	add    $0x80000000,%eax
80106bfb:	57                   	push   %edi
80106bfc:	51                   	push   %ecx
80106bfd:	50                   	push   %eax
80106bfe:	ff 75 10             	pushl  0x10(%ebp)
80106c01:	e8 9a ad ff ff       	call   801019a0 <readi>
80106c06:	83 c4 10             	add    $0x10,%esp
80106c09:	39 f8                	cmp    %edi,%eax
80106c0b:	74 ab                	je     80106bb8 <loaduvm+0x28>
}
80106c0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106c10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106c15:	5b                   	pop    %ebx
80106c16:	5e                   	pop    %esi
80106c17:	5f                   	pop    %edi
80106c18:	5d                   	pop    %ebp
80106c19:	c3                   	ret    
80106c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106c23:	31 c0                	xor    %eax,%eax
}
80106c25:	5b                   	pop    %ebx
80106c26:	5e                   	pop    %esi
80106c27:	5f                   	pop    %edi
80106c28:	5d                   	pop    %ebp
80106c29:	c3                   	ret    
      panic("loaduvm: address should exist");
80106c2a:	83 ec 0c             	sub    $0xc,%esp
80106c2d:	68 d3 7b 10 80       	push   $0x80107bd3
80106c32:	e8 59 97 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
80106c37:	83 ec 0c             	sub    $0xc,%esp
80106c3a:	68 74 7c 10 80       	push   $0x80107c74
80106c3f:	e8 4c 97 ff ff       	call   80100390 <panic>
80106c44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c50 <allocuvm>:
{
80106c50:	55                   	push   %ebp
80106c51:	89 e5                	mov    %esp,%ebp
80106c53:	57                   	push   %edi
80106c54:	56                   	push   %esi
80106c55:	53                   	push   %ebx
80106c56:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106c59:	8b 7d 10             	mov    0x10(%ebp),%edi
80106c5c:	85 ff                	test   %edi,%edi
80106c5e:	0f 88 8e 00 00 00    	js     80106cf2 <allocuvm+0xa2>
  if(newsz < oldsz)
80106c64:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c67:	0f 82 93 00 00 00    	jb     80106d00 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
80106c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c70:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106c76:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106c7c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106c7f:	0f 86 7e 00 00 00    	jbe    80106d03 <allocuvm+0xb3>
80106c85:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106c88:	8b 7d 08             	mov    0x8(%ebp),%edi
80106c8b:	eb 42                	jmp    80106ccf <allocuvm+0x7f>
80106c8d:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80106c90:	83 ec 04             	sub    $0x4,%esp
80106c93:	68 00 10 00 00       	push   $0x1000
80106c98:	6a 00                	push   $0x0
80106c9a:	50                   	push   %eax
80106c9b:	e8 40 d9 ff ff       	call   801045e0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106ca0:	58                   	pop    %eax
80106ca1:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106ca7:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106cac:	5a                   	pop    %edx
80106cad:	6a 06                	push   $0x6
80106caf:	50                   	push   %eax
80106cb0:	89 da                	mov    %ebx,%edx
80106cb2:	89 f8                	mov    %edi,%eax
80106cb4:	e8 67 fb ff ff       	call   80106820 <mappages>
80106cb9:	83 c4 10             	add    $0x10,%esp
80106cbc:	85 c0                	test   %eax,%eax
80106cbe:	78 50                	js     80106d10 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80106cc0:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106cc6:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106cc9:	0f 86 81 00 00 00    	jbe    80106d50 <allocuvm+0x100>
    mem = kalloc();
80106ccf:	e8 2c b8 ff ff       	call   80102500 <kalloc>
    if(mem == 0){
80106cd4:	85 c0                	test   %eax,%eax
    mem = kalloc();
80106cd6:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106cd8:	75 b6                	jne    80106c90 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80106cda:	83 ec 0c             	sub    $0xc,%esp
80106cdd:	68 f1 7b 10 80       	push   $0x80107bf1
80106ce2:	e8 79 99 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106ce7:	83 c4 10             	add    $0x10,%esp
80106cea:	8b 45 0c             	mov    0xc(%ebp),%eax
80106ced:	39 45 10             	cmp    %eax,0x10(%ebp)
80106cf0:	77 6e                	ja     80106d60 <allocuvm+0x110>
}
80106cf2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80106cf5:	31 ff                	xor    %edi,%edi
}
80106cf7:	89 f8                	mov    %edi,%eax
80106cf9:	5b                   	pop    %ebx
80106cfa:	5e                   	pop    %esi
80106cfb:	5f                   	pop    %edi
80106cfc:	5d                   	pop    %ebp
80106cfd:	c3                   	ret    
80106cfe:	66 90                	xchg   %ax,%ax
    return oldsz;
80106d00:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
80106d03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d06:	89 f8                	mov    %edi,%eax
80106d08:	5b                   	pop    %ebx
80106d09:	5e                   	pop    %esi
80106d0a:	5f                   	pop    %edi
80106d0b:	5d                   	pop    %ebp
80106d0c:	c3                   	ret    
80106d0d:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106d10:	83 ec 0c             	sub    $0xc,%esp
80106d13:	68 09 7c 10 80       	push   $0x80107c09
80106d18:	e8 43 99 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106d1d:	83 c4 10             	add    $0x10,%esp
80106d20:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d23:	39 45 10             	cmp    %eax,0x10(%ebp)
80106d26:	76 0d                	jbe    80106d35 <allocuvm+0xe5>
80106d28:	89 c1                	mov    %eax,%ecx
80106d2a:	8b 55 10             	mov    0x10(%ebp),%edx
80106d2d:	8b 45 08             	mov    0x8(%ebp),%eax
80106d30:	e8 7b fb ff ff       	call   801068b0 <deallocuvm.part.0>
      kfree(mem);
80106d35:	83 ec 0c             	sub    $0xc,%esp
      return 0;
80106d38:	31 ff                	xor    %edi,%edi
      kfree(mem);
80106d3a:	56                   	push   %esi
80106d3b:	e8 10 b6 ff ff       	call   80102350 <kfree>
      return 0;
80106d40:	83 c4 10             	add    $0x10,%esp
}
80106d43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d46:	89 f8                	mov    %edi,%eax
80106d48:	5b                   	pop    %ebx
80106d49:	5e                   	pop    %esi
80106d4a:	5f                   	pop    %edi
80106d4b:	5d                   	pop    %ebp
80106d4c:	c3                   	ret    
80106d4d:	8d 76 00             	lea    0x0(%esi),%esi
80106d50:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106d53:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d56:	5b                   	pop    %ebx
80106d57:	89 f8                	mov    %edi,%eax
80106d59:	5e                   	pop    %esi
80106d5a:	5f                   	pop    %edi
80106d5b:	5d                   	pop    %ebp
80106d5c:	c3                   	ret    
80106d5d:	8d 76 00             	lea    0x0(%esi),%esi
80106d60:	89 c1                	mov    %eax,%ecx
80106d62:	8b 55 10             	mov    0x10(%ebp),%edx
80106d65:	8b 45 08             	mov    0x8(%ebp),%eax
      return 0;
80106d68:	31 ff                	xor    %edi,%edi
80106d6a:	e8 41 fb ff ff       	call   801068b0 <deallocuvm.part.0>
80106d6f:	eb 92                	jmp    80106d03 <allocuvm+0xb3>
80106d71:	eb 0d                	jmp    80106d80 <deallocuvm>
80106d73:	90                   	nop
80106d74:	90                   	nop
80106d75:	90                   	nop
80106d76:	90                   	nop
80106d77:	90                   	nop
80106d78:	90                   	nop
80106d79:	90                   	nop
80106d7a:	90                   	nop
80106d7b:	90                   	nop
80106d7c:	90                   	nop
80106d7d:	90                   	nop
80106d7e:	90                   	nop
80106d7f:	90                   	nop

80106d80 <deallocuvm>:
{
80106d80:	55                   	push   %ebp
80106d81:	89 e5                	mov    %esp,%ebp
80106d83:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d86:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106d89:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106d8c:	39 d1                	cmp    %edx,%ecx
80106d8e:	73 10                	jae    80106da0 <deallocuvm+0x20>
}
80106d90:	5d                   	pop    %ebp
80106d91:	e9 1a fb ff ff       	jmp    801068b0 <deallocuvm.part.0>
80106d96:	8d 76 00             	lea    0x0(%esi),%esi
80106d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106da0:	89 d0                	mov    %edx,%eax
80106da2:	5d                   	pop    %ebp
80106da3:	c3                   	ret    
80106da4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106daa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106db0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106db0:	55                   	push   %ebp
80106db1:	89 e5                	mov    %esp,%ebp
80106db3:	57                   	push   %edi
80106db4:	56                   	push   %esi
80106db5:	53                   	push   %ebx
80106db6:	83 ec 0c             	sub    $0xc,%esp
80106db9:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106dbc:	85 f6                	test   %esi,%esi
80106dbe:	74 59                	je     80106e19 <freevm+0x69>
80106dc0:	31 c9                	xor    %ecx,%ecx
80106dc2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106dc7:	89 f0                	mov    %esi,%eax
80106dc9:	e8 e2 fa ff ff       	call   801068b0 <deallocuvm.part.0>
80106dce:	89 f3                	mov    %esi,%ebx
80106dd0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106dd6:	eb 0f                	jmp    80106de7 <freevm+0x37>
80106dd8:	90                   	nop
80106dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106de0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106de3:	39 fb                	cmp    %edi,%ebx
80106de5:	74 23                	je     80106e0a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106de7:	8b 03                	mov    (%ebx),%eax
80106de9:	a8 01                	test   $0x1,%al
80106deb:	74 f3                	je     80106de0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106ded:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80106df2:	83 ec 0c             	sub    $0xc,%esp
80106df5:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106df8:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106dfd:	50                   	push   %eax
80106dfe:	e8 4d b5 ff ff       	call   80102350 <kfree>
80106e03:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80106e06:	39 fb                	cmp    %edi,%ebx
80106e08:	75 dd                	jne    80106de7 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
80106e0a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106e0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e10:	5b                   	pop    %ebx
80106e11:	5e                   	pop    %esi
80106e12:	5f                   	pop    %edi
80106e13:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106e14:	e9 37 b5 ff ff       	jmp    80102350 <kfree>
    panic("freevm: no pgdir");
80106e19:	83 ec 0c             	sub    $0xc,%esp
80106e1c:	68 25 7c 10 80       	push   $0x80107c25
80106e21:	e8 6a 95 ff ff       	call   80100390 <panic>
80106e26:	8d 76 00             	lea    0x0(%esi),%esi
80106e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e30 <setupkvm>:
{
80106e30:	55                   	push   %ebp
80106e31:	89 e5                	mov    %esp,%ebp
80106e33:	56                   	push   %esi
80106e34:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106e35:	e8 c6 b6 ff ff       	call   80102500 <kalloc>
80106e3a:	85 c0                	test   %eax,%eax
80106e3c:	89 c6                	mov    %eax,%esi
80106e3e:	74 42                	je     80106e82 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80106e40:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106e43:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
80106e48:	68 00 10 00 00       	push   $0x1000
80106e4d:	6a 00                	push   $0x0
80106e4f:	50                   	push   %eax
80106e50:	e8 8b d7 ff ff       	call   801045e0 <memset>
80106e55:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80106e58:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106e5b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106e5e:	83 ec 08             	sub    $0x8,%esp
80106e61:	8b 13                	mov    (%ebx),%edx
80106e63:	ff 73 0c             	pushl  0xc(%ebx)
80106e66:	50                   	push   %eax
80106e67:	29 c1                	sub    %eax,%ecx
80106e69:	89 f0                	mov    %esi,%eax
80106e6b:	e8 b0 f9 ff ff       	call   80106820 <mappages>
80106e70:	83 c4 10             	add    $0x10,%esp
80106e73:	85 c0                	test   %eax,%eax
80106e75:	78 19                	js     80106e90 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106e77:	83 c3 10             	add    $0x10,%ebx
80106e7a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106e80:	75 d6                	jne    80106e58 <setupkvm+0x28>
}
80106e82:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106e85:	89 f0                	mov    %esi,%eax
80106e87:	5b                   	pop    %ebx
80106e88:	5e                   	pop    %esi
80106e89:	5d                   	pop    %ebp
80106e8a:	c3                   	ret    
80106e8b:	90                   	nop
80106e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80106e90:	83 ec 0c             	sub    $0xc,%esp
80106e93:	56                   	push   %esi
      return 0;
80106e94:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80106e96:	e8 15 ff ff ff       	call   80106db0 <freevm>
      return 0;
80106e9b:	83 c4 10             	add    $0x10,%esp
}
80106e9e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106ea1:	89 f0                	mov    %esi,%eax
80106ea3:	5b                   	pop    %ebx
80106ea4:	5e                   	pop    %esi
80106ea5:	5d                   	pop    %ebp
80106ea6:	c3                   	ret    
80106ea7:	89 f6                	mov    %esi,%esi
80106ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106eb0 <kvmalloc>:
{
80106eb0:	55                   	push   %ebp
80106eb1:	89 e5                	mov    %esp,%ebp
80106eb3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106eb6:	e8 75 ff ff ff       	call   80106e30 <setupkvm>
80106ebb:	a3 84 5f 11 80       	mov    %eax,0x80115f84
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106ec0:	05 00 00 00 80       	add    $0x80000000,%eax
80106ec5:	0f 22 d8             	mov    %eax,%cr3
}
80106ec8:	c9                   	leave  
80106ec9:	c3                   	ret    
80106eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106ed0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106ed0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106ed1:	31 c9                	xor    %ecx,%ecx
{
80106ed3:	89 e5                	mov    %esp,%ebp
80106ed5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106ed8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106edb:	8b 45 08             	mov    0x8(%ebp),%eax
80106ede:	e8 bd f8 ff ff       	call   801067a0 <walkpgdir>
  if(pte == 0)
80106ee3:	85 c0                	test   %eax,%eax
80106ee5:	74 05                	je     80106eec <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106ee7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106eea:	c9                   	leave  
80106eeb:	c3                   	ret    
    panic("clearpteu");
80106eec:	83 ec 0c             	sub    $0xc,%esp
80106eef:	68 36 7c 10 80       	push   $0x80107c36
80106ef4:	e8 97 94 ff ff       	call   80100390 <panic>
80106ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106f00 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106f00:	55                   	push   %ebp
80106f01:	89 e5                	mov    %esp,%ebp
80106f03:	57                   	push   %edi
80106f04:	56                   	push   %esi
80106f05:	53                   	push   %ebx
80106f06:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106f09:	e8 22 ff ff ff       	call   80106e30 <setupkvm>
80106f0e:	85 c0                	test   %eax,%eax
80106f10:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106f13:	0f 84 9f 00 00 00    	je     80106fb8 <copyuvm+0xb8>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f19:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f1c:	85 c9                	test   %ecx,%ecx
80106f1e:	0f 84 94 00 00 00    	je     80106fb8 <copyuvm+0xb8>
80106f24:	31 ff                	xor    %edi,%edi
80106f26:	eb 4a                	jmp    80106f72 <copyuvm+0x72>
80106f28:	90                   	nop
80106f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106f30:	83 ec 04             	sub    $0x4,%esp
80106f33:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106f39:	68 00 10 00 00       	push   $0x1000
80106f3e:	53                   	push   %ebx
80106f3f:	50                   	push   %eax
80106f40:	e8 4b d7 ff ff       	call   80104690 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106f45:	58                   	pop    %eax
80106f46:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f4c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f51:	5a                   	pop    %edx
80106f52:	ff 75 e4             	pushl  -0x1c(%ebp)
80106f55:	50                   	push   %eax
80106f56:	89 fa                	mov    %edi,%edx
80106f58:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f5b:	e8 c0 f8 ff ff       	call   80106820 <mappages>
80106f60:	83 c4 10             	add    $0x10,%esp
80106f63:	85 c0                	test   %eax,%eax
80106f65:	78 61                	js     80106fc8 <copyuvm+0xc8>
  for(i = 0; i < sz; i += PGSIZE){
80106f67:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106f6d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106f70:	76 46                	jbe    80106fb8 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106f72:	8b 45 08             	mov    0x8(%ebp),%eax
80106f75:	31 c9                	xor    %ecx,%ecx
80106f77:	89 fa                	mov    %edi,%edx
80106f79:	e8 22 f8 ff ff       	call   801067a0 <walkpgdir>
80106f7e:	85 c0                	test   %eax,%eax
80106f80:	74 61                	je     80106fe3 <copyuvm+0xe3>
    if(!(*pte & PTE_P))
80106f82:	8b 00                	mov    (%eax),%eax
80106f84:	a8 01                	test   $0x1,%al
80106f86:	74 4e                	je     80106fd6 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
80106f88:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
80106f8a:	25 ff 0f 00 00       	and    $0xfff,%eax
    pa = PTE_ADDR(*pte);
80106f8f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80106f95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80106f98:	e8 63 b5 ff ff       	call   80102500 <kalloc>
80106f9d:	85 c0                	test   %eax,%eax
80106f9f:	89 c6                	mov    %eax,%esi
80106fa1:	75 8d                	jne    80106f30 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80106fa3:	83 ec 0c             	sub    $0xc,%esp
80106fa6:	ff 75 e0             	pushl  -0x20(%ebp)
80106fa9:	e8 02 fe ff ff       	call   80106db0 <freevm>
  return 0;
80106fae:	83 c4 10             	add    $0x10,%esp
80106fb1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80106fb8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106fbb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fbe:	5b                   	pop    %ebx
80106fbf:	5e                   	pop    %esi
80106fc0:	5f                   	pop    %edi
80106fc1:	5d                   	pop    %ebp
80106fc2:	c3                   	ret    
80106fc3:	90                   	nop
80106fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80106fc8:	83 ec 0c             	sub    $0xc,%esp
80106fcb:	56                   	push   %esi
80106fcc:	e8 7f b3 ff ff       	call   80102350 <kfree>
      goto bad;
80106fd1:	83 c4 10             	add    $0x10,%esp
80106fd4:	eb cd                	jmp    80106fa3 <copyuvm+0xa3>
      panic("copyuvm: page not present");
80106fd6:	83 ec 0c             	sub    $0xc,%esp
80106fd9:	68 5a 7c 10 80       	push   $0x80107c5a
80106fde:	e8 ad 93 ff ff       	call   80100390 <panic>
      panic("copyuvm: pte should exist");
80106fe3:	83 ec 0c             	sub    $0xc,%esp
80106fe6:	68 40 7c 10 80       	push   $0x80107c40
80106feb:	e8 a0 93 ff ff       	call   80100390 <panic>

80106ff0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106ff0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106ff1:	31 c9                	xor    %ecx,%ecx
{
80106ff3:	89 e5                	mov    %esp,%ebp
80106ff5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106ff8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ffb:	8b 45 08             	mov    0x8(%ebp),%eax
80106ffe:	e8 9d f7 ff ff       	call   801067a0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107003:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107005:	c9                   	leave  
  if((*pte & PTE_U) == 0)
80107006:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107008:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
8010700d:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107010:	05 00 00 00 80       	add    $0x80000000,%eax
80107015:	83 fa 05             	cmp    $0x5,%edx
80107018:	ba 00 00 00 00       	mov    $0x0,%edx
8010701d:	0f 45 c2             	cmovne %edx,%eax
}
80107020:	c3                   	ret    
80107021:	eb 0d                	jmp    80107030 <copyout>
80107023:	90                   	nop
80107024:	90                   	nop
80107025:	90                   	nop
80107026:	90                   	nop
80107027:	90                   	nop
80107028:	90                   	nop
80107029:	90                   	nop
8010702a:	90                   	nop
8010702b:	90                   	nop
8010702c:	90                   	nop
8010702d:	90                   	nop
8010702e:	90                   	nop
8010702f:	90                   	nop

80107030 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107030:	55                   	push   %ebp
80107031:	89 e5                	mov    %esp,%ebp
80107033:	57                   	push   %edi
80107034:	56                   	push   %esi
80107035:	53                   	push   %ebx
80107036:	83 ec 1c             	sub    $0x1c,%esp
80107039:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010703c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010703f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107042:	85 db                	test   %ebx,%ebx
80107044:	75 40                	jne    80107086 <copyout+0x56>
80107046:	eb 70                	jmp    801070b8 <copyout+0x88>
80107048:	90                   	nop
80107049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107050:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107053:	89 f1                	mov    %esi,%ecx
80107055:	29 d1                	sub    %edx,%ecx
80107057:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010705d:	39 d9                	cmp    %ebx,%ecx
8010705f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107062:	29 f2                	sub    %esi,%edx
80107064:	83 ec 04             	sub    $0x4,%esp
80107067:	01 d0                	add    %edx,%eax
80107069:	51                   	push   %ecx
8010706a:	57                   	push   %edi
8010706b:	50                   	push   %eax
8010706c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010706f:	e8 1c d6 ff ff       	call   80104690 <memmove>
    len -= n;
    buf += n;
80107074:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80107077:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
8010707a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
80107080:	01 cf                	add    %ecx,%edi
  while(len > 0){
80107082:	29 cb                	sub    %ecx,%ebx
80107084:	74 32                	je     801070b8 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107086:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107088:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
8010708b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010708e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107094:	56                   	push   %esi
80107095:	ff 75 08             	pushl  0x8(%ebp)
80107098:	e8 53 ff ff ff       	call   80106ff0 <uva2ka>
    if(pa0 == 0)
8010709d:	83 c4 10             	add    $0x10,%esp
801070a0:	85 c0                	test   %eax,%eax
801070a2:	75 ac                	jne    80107050 <copyout+0x20>
  }
  return 0;
}
801070a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801070a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801070ac:	5b                   	pop    %ebx
801070ad:	5e                   	pop    %esi
801070ae:	5f                   	pop    %edi
801070af:	5d                   	pop    %ebp
801070b0:	c3                   	ret    
801070b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801070bb:	31 c0                	xor    %eax,%eax
}
801070bd:	5b                   	pop    %ebx
801070be:	5e                   	pop    %esi
801070bf:	5f                   	pop    %edi
801070c0:	5d                   	pop    %ebp
801070c1:	c3                   	ret    
801070c2:	66 90                	xchg   %ax,%ax
801070c4:	66 90                	xchg   %ax,%ax
801070c6:	66 90                	xchg   %ax,%ax
801070c8:	66 90                	xchg   %ax,%ax
801070ca:	66 90                	xchg   %ax,%ax
801070cc:	66 90                	xchg   %ax,%ax
801070ce:	66 90                	xchg   %ax,%ax

801070d0 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
801070d0:	55                   	push   %ebp
801070d1:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
801070d6:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
801070db:	89 e5                	mov    %esp,%ebp
801070dd:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
801070e0:	89 15 e0 a5 10 80    	mov    %edx,0x8010a5e0
801070e6:	eb 0b                	jmp    801070f3 <sgenrand+0x23>
801070e8:	90                   	nop
801070e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070f0:	83 c0 04             	add    $0x4,%eax
    for (mti=1; mti<N; mti++)
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
801070f3:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
801070f9:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
801070fb:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
801070fd:	75 f1                	jne    801070f0 <sgenrand+0x20>
801070ff:	c7 05 60 a4 10 80 70 	movl   $0x270,0x8010a460
80107106:	02 00 00 
}
80107109:	5d                   	pop    %ebp
8010710a:	c3                   	ret    
8010710b:	90                   	nop
8010710c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107110 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
80107110:	a1 60 a4 10 80       	mov    0x8010a460,%eax
{
80107115:	55                   	push   %ebp
80107116:	89 e5                	mov    %esp,%ebp
80107118:	56                   	push   %esi
80107119:	53                   	push   %ebx
    if (mti >= N) { /* generate N words at one time */
8010711a:	3d 6f 02 00 00       	cmp    $0x26f,%eax
8010711f:	0f 8e f9 00 00 00    	jle    8010721e <genrand+0x10e>
        int kk;

        if (mti == N+1)   /* if sgenrand() has not been called, */
80107125:	3d 71 02 00 00       	cmp    $0x271,%eax
8010712a:	0f 84 fa 00 00 00    	je     8010722a <genrand+0x11a>
80107130:	ba e0 a5 10 80       	mov    $0x8010a5e0,%edx
80107135:	bb 6c a9 10 80       	mov    $0x8010a96c,%ebx
    mt[0]= seed & 0xffffffff;
8010713a:	89 d1                	mov    %edx,%ecx
8010713c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            sgenrand(4357); /* a default initial seed is used   */

        for (kk=0;kk<N-M;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
80107140:	8b 01                	mov    (%ecx),%eax
80107142:	8b 71 04             	mov    0x4(%ecx),%esi
80107145:	83 c1 04             	add    $0x4,%ecx
80107148:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
8010714e:	25 00 00 00 80       	and    $0x80000000,%eax
80107153:	09 f0                	or     %esi,%eax
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
80107155:	89 c6                	mov    %eax,%esi
80107157:	83 e0 01             	and    $0x1,%eax
8010715a:	d1 ee                	shr    %esi
8010715c:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
80107162:	33 34 85 98 7c 10 80 	xor    -0x7fef8368(,%eax,4),%esi
80107169:	89 71 fc             	mov    %esi,-0x4(%ecx)
        for (kk=0;kk<N-M;kk++) {
8010716c:	39 cb                	cmp    %ecx,%ebx
8010716e:	75 d0                	jne    80107140 <genrand+0x30>
80107170:	b9 10 ac 10 80       	mov    $0x8010ac10,%ecx
80107175:	8d 76 00             	lea    0x0(%esi),%esi
        }
        for (;kk<N-1;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
80107178:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
8010717e:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
80107184:	83 c2 04             	add    $0x4,%edx
80107187:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
8010718d:	25 00 00 00 80       	and    $0x80000000,%eax
80107192:	09 d8                	or     %ebx,%eax
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
80107194:	89 c3                	mov    %eax,%ebx
80107196:	83 e0 01             	and    $0x1,%eax
80107199:	d1 eb                	shr    %ebx
8010719b:	33 5a fc             	xor    -0x4(%edx),%ebx
8010719e:	33 1c 85 98 7c 10 80 	xor    -0x7fef8368(,%eax,4),%ebx
801071a5:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
        for (;kk<N-1;kk++) {
801071ab:	39 d1                	cmp    %edx,%ecx
801071ad:	75 c9                	jne    80107178 <genrand+0x68>
        }
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
801071af:	a1 e0 a5 10 80       	mov    0x8010a5e0,%eax
801071b4:	8b 0d 9c af 10 80    	mov    0x8010af9c,%ecx
801071ba:	89 c2                	mov    %eax,%edx
801071bc:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
801071c2:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
801071c8:	09 d1                	or     %edx,%ecx
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
801071ca:	89 ca                	mov    %ecx,%edx
801071cc:	83 e1 01             	and    $0x1,%ecx
801071cf:	d1 ea                	shr    %edx
801071d1:	33 15 10 ac 10 80    	xor    0x8010ac10,%edx
801071d7:	33 14 8d 98 7c 10 80 	xor    -0x7fef8368(,%ecx,4),%edx
801071de:	89 15 9c af 10 80    	mov    %edx,0x8010af9c
801071e4:	ba 01 00 00 00       	mov    $0x1,%edx

        mti = 0;
    }
  
    y = mt[mti++];
801071e9:	89 15 60 a4 10 80    	mov    %edx,0x8010a460
    y ^= TEMPERING_SHIFT_U(y);
801071ef:	89 c2                	mov    %eax,%edx
801071f1:	c1 ea 0b             	shr    $0xb,%edx
801071f4:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
801071f6:	89 d0                	mov    %edx,%eax
801071f8:	c1 e0 07             	shl    $0x7,%eax
801071fb:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
80107200:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
80107202:	89 d0                	mov    %edx,%eax
80107204:	c1 e0 0f             	shl    $0xf,%eax
80107207:	25 00 00 c6 ef       	and    $0xefc60000,%eax
8010720c:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_L(y);
8010720e:	89 c2                	mov    %eax,%edx
80107210:	c1 ea 12             	shr    $0x12,%edx
80107213:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
}
80107215:	5b                   	pop    %ebx
    return y & RAND_MAX;
80107216:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
8010721b:	5e                   	pop    %esi
8010721c:	5d                   	pop    %ebp
8010721d:	c3                   	ret    
8010721e:	8d 50 01             	lea    0x1(%eax),%edx
80107221:	8b 04 85 e0 a5 10 80 	mov    -0x7fef5a20(,%eax,4),%eax
80107228:	eb bf                	jmp    801071e9 <genrand+0xd9>
    mt[0]= seed & 0xffffffff;
8010722a:	c7 05 e0 a5 10 80 05 	movl   $0x1105,0x8010a5e0
80107231:	11 00 00 
80107234:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
80107239:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
8010723e:	ba 05 11 00 00       	mov    $0x1105,%edx
80107243:	eb 06                	jmp    8010724b <genrand+0x13b>
80107245:	8d 76 00             	lea    0x0(%esi),%esi
80107248:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
8010724b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
80107251:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
80107253:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
80107255:	75 f1                	jne    80107248 <genrand+0x138>
80107257:	e9 d4 fe ff ff       	jmp    80107130 <genrand+0x20>
8010725c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107260 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
80107260:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
80107261:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
80107263:	89 e5                	mov    %esp,%ebp
80107265:	56                   	push   %esi
80107266:	53                   	push   %ebx
    num_bins = (unsigned long) max + 1,
80107267:	8b 45 08             	mov    0x8(%ebp),%eax
    bin_size = num_rand / num_bins,
8010726a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
8010726f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
80107272:	89 d8                	mov    %ebx,%eax
80107274:	f7 f1                	div    %ecx
80107276:	89 c6                	mov    %eax,%esi
80107278:	29 d3                	sub    %edx,%ebx
8010727a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    defect   = num_rand % num_bins;

  long x;
  do {
   x = genrand();
80107280:	e8 8b fe ff ff       	call   80107110 <genrand>
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
80107285:	39 d8                	cmp    %ebx,%eax
80107287:	73 f7                	jae    80107280 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
80107289:	31 d2                	xor    %edx,%edx
8010728b:	f7 f6                	div    %esi
}
8010728d:	5b                   	pop    %ebx
8010728e:	5e                   	pop    %esi
8010728f:	5d                   	pop    %ebp
80107290:	c3                   	ret    
