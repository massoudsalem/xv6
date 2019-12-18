
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
8010004c:	68 20 74 10 80       	push   $0x80107420
80100051:	68 a0 bf 10 80       	push   $0x8010bfa0
80100056:	e8 45 44 00 00       	call   801044a0 <initlock>
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
80100092:	68 27 74 10 80       	push   $0x80107427
80100097:	50                   	push   %eax
80100098:	e8 d3 42 00 00       	call   80104370 <initsleeplock>
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
801000e4:	e8 f7 44 00 00       	call   801045e0 <acquire>
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
80100162:	e8 39 45 00 00       	call   801046a0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 3e 42 00 00       	call   801043b0 <acquiresleep>
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
80100193:	68 2e 74 10 80       	push   $0x8010742e
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
801001ae:	e8 9d 42 00 00       	call   80104450 <holdingsleep>
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
801001cc:	68 3f 74 10 80       	push   $0x8010743f
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
801001ef:	e8 5c 42 00 00       	call   80104450 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 0c 42 00 00       	call   80104410 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 a0 bf 10 80 	movl   $0x8010bfa0,(%esp)
8010020b:	e8 d0 43 00 00       	call   801045e0 <acquire>
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
8010025c:	e9 3f 44 00 00       	jmp    801046a0 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 46 74 10 80       	push   $0x80107446
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
8010028c:	e8 4f 43 00 00       	call   801045e0 <acquire>
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
801002c5:	e8 86 3c 00 00       	call   80103f50 <sleep>
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
801002ef:	e8 ac 43 00 00       	call   801046a0 <release>
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
8010034d:	e8 4e 43 00 00       	call   801046a0 <release>
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
801003b2:	68 4d 74 10 80       	push   $0x8010744d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 a7 7d 10 80 	movl   $0x80107da7,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 e3 40 00 00       	call   801044c0 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 61 74 10 80       	push   $0x80107461
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
8010043a:	e8 11 5a 00 00       	call   80105e50 <uartputc>
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
801004ec:	e8 5f 59 00 00       	call   80105e50 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 53 59 00 00       	call   80105e50 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 47 59 00 00       	call   80105e50 <uartputc>
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
80100524:	e8 77 42 00 00       	call   801047a0 <memmove>
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
80100541:	e8 aa 41 00 00       	call   801046f0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
    panic("pos under/overflow");
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 65 74 10 80       	push   $0x80107465
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
801005b1:	0f b6 92 90 74 10 80 	movzbl -0x7fef8b70(%edx),%edx
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
8010061b:	e8 c0 3f 00 00       	call   801045e0 <acquire>
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
80100647:	e8 54 40 00 00       	call   801046a0 <release>
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
8010071f:	e8 7c 3f 00 00       	call   801046a0 <release>
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
80100810:	ba 78 74 10 80       	mov    $0x80107478,%edx
      for(; *s; s++)
80100815:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100818:	b8 28 00 00 00       	mov    $0x28,%eax
8010081d:	89 d3                	mov    %edx,%ebx
8010081f:	eb bf                	jmp    801007e0 <cprintf+0x180>
80100821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
80100828:	83 ec 0c             	sub    $0xc,%esp
8010082b:	68 20 a5 10 80       	push   $0x8010a520
80100830:	e8 ab 3d 00 00       	call   801045e0 <acquire>
80100835:	83 c4 10             	add    $0x10,%esp
80100838:	e9 3c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
8010083d:	83 ec 0c             	sub    $0xc,%esp
80100840:	68 7f 74 10 80       	push   $0x8010747f
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
80100863:	e8 78 3d 00 00       	call   801045e0 <acquire>
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
801008c8:	e8 d3 3d 00 00       	call   801046a0 <release>
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
80100956:	e8 b5 37 00 00       	call   80104110 <wakeup>
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
801009d7:	e9 b4 38 00 00       	jmp    80104290 <procdump>
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
80100a06:	68 88 74 10 80       	push   $0x80107488
80100a0b:	68 20 a5 10 80       	push   $0x8010a520
80100a10:	e8 8b 3a 00 00       	call   801044a0 <initlock>

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
80100ad4:	e8 c7 64 00 00       	call   80106fa0 <setupkvm>
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
80100b40:	68 ad 74 10 80       	push   $0x801074ad
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
80100b66:	e8 55 62 00 00       	call   80106dc0 <allocuvm>
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
80100b98:	e8 63 61 00 00       	call   80106d00 <loaduvm>
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
80100be2:	e8 39 63 00 00       	call   80106f20 <freevm>
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
80100c1a:	e8 a1 61 00 00       	call   80106dc0 <allocuvm>
80100c1f:	83 c4 10             	add    $0x10,%esp
80100c22:	85 c0                	test   %eax,%eax
80100c24:	89 c6                	mov    %eax,%esi
80100c26:	75 3a                	jne    80100c62 <exec+0x212>
    freevm(pgdir);
80100c28:	83 ec 0c             	sub    $0xc,%esp
80100c2b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c31:	e8 ea 62 00 00       	call   80106f20 <freevm>
80100c36:	83 c4 10             	add    $0x10,%esp
  return -1;
80100c39:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c3e:	e9 79 fe ff ff       	jmp    80100abc <exec+0x6c>
    end_op();
80100c43:	e8 88 20 00 00       	call   80102cd0 <end_op>
    cprintf("exec: fail\n");
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	68 a1 74 10 80       	push   $0x801074a1
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
80100c76:	e8 c5 63 00 00       	call   80107040 <clearpteu>
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
80100ca9:	e8 62 3c 00 00       	call   80104910 <strlen>
80100cae:	f7 d0                	not    %eax
80100cb0:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cb2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cb5:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cb6:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cb9:	ff 34 b8             	pushl  (%eax,%edi,4)
80100cbc:	e8 4f 3c 00 00       	call   80104910 <strlen>
80100cc1:	83 c0 01             	add    $0x1,%eax
80100cc4:	50                   	push   %eax
80100cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cc8:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ccb:	53                   	push   %ebx
80100ccc:	56                   	push   %esi
80100ccd:	e8 ce 64 00 00       	call   801071a0 <copyout>
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
80100d37:	e8 64 64 00 00       	call   801071a0 <copyout>
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
80100d7a:	e8 51 3b 00 00       	call   801048d0 <safestrcpy>
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
80100da4:	e8 c7 5d 00 00       	call   80106b70 <switchuvm>
  freevm(oldpgdir);
80100da9:	89 3c 24             	mov    %edi,(%esp)
80100dac:	e8 6f 61 00 00       	call   80106f20 <freevm>
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
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100dd6:	68 bb 74 10 80       	push   $0x801074bb
80100ddb:	68 a0 09 11 80       	push   $0x801109a0
80100de0:	e8 bb 36 00 00       	call   801044a0 <initlock>
}
80100de5:	83 c4 10             	add    $0x10,%esp
80100de8:	c9                   	leave  
80100de9:	c3                   	ret    
80100dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100df0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100df4:	bb d4 09 11 80       	mov    $0x801109d4,%ebx
{
80100df9:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100dfc:	68 a0 09 11 80       	push   $0x801109a0
80100e01:	e8 da 37 00 00       	call   801045e0 <acquire>
80100e06:	83 c4 10             	add    $0x10,%esp
80100e09:	eb 10                	jmp    80100e1b <filealloc+0x2b>
80100e0b:	90                   	nop
80100e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100e10:	83 c3 18             	add    $0x18,%ebx
80100e13:	81 fb 34 13 11 80    	cmp    $0x80111334,%ebx
80100e19:	73 25                	jae    80100e40 <filealloc+0x50>
    if(f->ref == 0){
80100e1b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e1e:	85 c0                	test   %eax,%eax
80100e20:	75 ee                	jne    80100e10 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100e22:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100e25:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100e2c:	68 a0 09 11 80       	push   $0x801109a0
80100e31:	e8 6a 38 00 00       	call   801046a0 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100e36:	89 d8                	mov    %ebx,%eax
      return f;
80100e38:	83 c4 10             	add    $0x10,%esp
}
80100e3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e3e:	c9                   	leave  
80100e3f:	c3                   	ret    
  release(&ftable.lock);
80100e40:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100e43:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100e45:	68 a0 09 11 80       	push   $0x801109a0
80100e4a:	e8 51 38 00 00       	call   801046a0 <release>
}
80100e4f:	89 d8                	mov    %ebx,%eax
  return 0;
80100e51:	83 c4 10             	add    $0x10,%esp
}
80100e54:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e57:	c9                   	leave  
80100e58:	c3                   	ret    
80100e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e60 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100e60:	55                   	push   %ebp
80100e61:	89 e5                	mov    %esp,%ebp
80100e63:	53                   	push   %ebx
80100e64:	83 ec 10             	sub    $0x10,%esp
80100e67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100e6a:	68 a0 09 11 80       	push   $0x801109a0
80100e6f:	e8 6c 37 00 00       	call   801045e0 <acquire>
  if(f->ref < 1)
80100e74:	8b 43 04             	mov    0x4(%ebx),%eax
80100e77:	83 c4 10             	add    $0x10,%esp
80100e7a:	85 c0                	test   %eax,%eax
80100e7c:	7e 1a                	jle    80100e98 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100e7e:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e81:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100e84:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e87:	68 a0 09 11 80       	push   $0x801109a0
80100e8c:	e8 0f 38 00 00       	call   801046a0 <release>
  return f;
}
80100e91:	89 d8                	mov    %ebx,%eax
80100e93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e96:	c9                   	leave  
80100e97:	c3                   	ret    
    panic("filedup");
80100e98:	83 ec 0c             	sub    $0xc,%esp
80100e9b:	68 c2 74 10 80       	push   $0x801074c2
80100ea0:	e8 eb f4 ff ff       	call   80100390 <panic>
80100ea5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100eb0 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100eb0:	55                   	push   %ebp
80100eb1:	89 e5                	mov    %esp,%ebp
80100eb3:	57                   	push   %edi
80100eb4:	56                   	push   %esi
80100eb5:	53                   	push   %ebx
80100eb6:	83 ec 28             	sub    $0x28,%esp
80100eb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
80100ebc:	68 a0 09 11 80       	push   $0x801109a0
80100ec1:	e8 1a 37 00 00       	call   801045e0 <acquire>
  if(f->ref < 1)
80100ec6:	8b 43 04             	mov    0x4(%ebx),%eax
80100ec9:	83 c4 10             	add    $0x10,%esp
80100ecc:	85 c0                	test   %eax,%eax
80100ece:	0f 8e 9b 00 00 00    	jle    80100f6f <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100ed4:	83 e8 01             	sub    $0x1,%eax
80100ed7:	85 c0                	test   %eax,%eax
80100ed9:	89 43 04             	mov    %eax,0x4(%ebx)
80100edc:	74 1a                	je     80100ef8 <fileclose+0x48>
    release(&ftable.lock);
80100ede:	c7 45 08 a0 09 11 80 	movl   $0x801109a0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100ee5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee8:	5b                   	pop    %ebx
80100ee9:	5e                   	pop    %esi
80100eea:	5f                   	pop    %edi
80100eeb:	5d                   	pop    %ebp
    release(&ftable.lock);
80100eec:	e9 af 37 00 00       	jmp    801046a0 <release>
80100ef1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff = *f;
80100ef8:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100efc:	8b 3b                	mov    (%ebx),%edi
  release(&ftable.lock);
80100efe:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100f01:	8b 73 0c             	mov    0xc(%ebx),%esi
  f->type = FD_NONE;
80100f04:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  ff = *f;
80100f0a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f0d:	8b 43 10             	mov    0x10(%ebx),%eax
  release(&ftable.lock);
80100f10:	68 a0 09 11 80       	push   $0x801109a0
  ff = *f;
80100f15:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100f18:	e8 83 37 00 00       	call   801046a0 <release>
  if(ff.type == FD_PIPE)
80100f1d:	83 c4 10             	add    $0x10,%esp
80100f20:	83 ff 01             	cmp    $0x1,%edi
80100f23:	74 13                	je     80100f38 <fileclose+0x88>
  else if(ff.type == FD_INODE){
80100f25:	83 ff 02             	cmp    $0x2,%edi
80100f28:	74 26                	je     80100f50 <fileclose+0xa0>
}
80100f2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f2d:	5b                   	pop    %ebx
80100f2e:	5e                   	pop    %esi
80100f2f:	5f                   	pop    %edi
80100f30:	5d                   	pop    %ebp
80100f31:	c3                   	ret    
80100f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pipeclose(ff.pipe, ff.writable);
80100f38:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100f3c:	83 ec 08             	sub    $0x8,%esp
80100f3f:	53                   	push   %ebx
80100f40:	56                   	push   %esi
80100f41:	e8 ca 24 00 00       	call   80103410 <pipeclose>
80100f46:	83 c4 10             	add    $0x10,%esp
80100f49:	eb df                	jmp    80100f2a <fileclose+0x7a>
80100f4b:	90                   	nop
80100f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    begin_op();
80100f50:	e8 0b 1d 00 00       	call   80102c60 <begin_op>
    iput(ff.ip);
80100f55:	83 ec 0c             	sub    $0xc,%esp
80100f58:	ff 75 e0             	pushl  -0x20(%ebp)
80100f5b:	e8 c0 08 00 00       	call   80101820 <iput>
    end_op();
80100f60:	83 c4 10             	add    $0x10,%esp
}
80100f63:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f66:	5b                   	pop    %ebx
80100f67:	5e                   	pop    %esi
80100f68:	5f                   	pop    %edi
80100f69:	5d                   	pop    %ebp
    end_op();
80100f6a:	e9 61 1d 00 00       	jmp    80102cd0 <end_op>
    panic("fileclose");
80100f6f:	83 ec 0c             	sub    $0xc,%esp
80100f72:	68 ca 74 10 80       	push   $0x801074ca
80100f77:	e8 14 f4 ff ff       	call   80100390 <panic>
80100f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f80 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f80:	55                   	push   %ebp
80100f81:	89 e5                	mov    %esp,%ebp
80100f83:	53                   	push   %ebx
80100f84:	83 ec 04             	sub    $0x4,%esp
80100f87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f8a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f8d:	75 31                	jne    80100fc0 <filestat+0x40>
    ilock(f->ip);
80100f8f:	83 ec 0c             	sub    $0xc,%esp
80100f92:	ff 73 10             	pushl  0x10(%ebx)
80100f95:	e8 56 07 00 00       	call   801016f0 <ilock>
    stati(f->ip, st);
80100f9a:	58                   	pop    %eax
80100f9b:	5a                   	pop    %edx
80100f9c:	ff 75 0c             	pushl  0xc(%ebp)
80100f9f:	ff 73 10             	pushl  0x10(%ebx)
80100fa2:	e8 f9 09 00 00       	call   801019a0 <stati>
    iunlock(f->ip);
80100fa7:	59                   	pop    %ecx
80100fa8:	ff 73 10             	pushl  0x10(%ebx)
80100fab:	e8 20 08 00 00       	call   801017d0 <iunlock>
    return 0;
80100fb0:	83 c4 10             	add    $0x10,%esp
80100fb3:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100fb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100fb8:	c9                   	leave  
80100fb9:	c3                   	ret    
80100fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return -1;
80100fc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fc5:	eb ee                	jmp    80100fb5 <filestat+0x35>
80100fc7:	89 f6                	mov    %esi,%esi
80100fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fd0 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 0c             	sub    $0xc,%esp
80100fd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fdc:	8b 75 0c             	mov    0xc(%ebp),%esi
80100fdf:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100fe2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100fe6:	74 60                	je     80101048 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100fe8:	8b 03                	mov    (%ebx),%eax
80100fea:	83 f8 01             	cmp    $0x1,%eax
80100fed:	74 41                	je     80101030 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100fef:	83 f8 02             	cmp    $0x2,%eax
80100ff2:	75 5b                	jne    8010104f <fileread+0x7f>
    ilock(f->ip);
80100ff4:	83 ec 0c             	sub    $0xc,%esp
80100ff7:	ff 73 10             	pushl  0x10(%ebx)
80100ffa:	e8 f1 06 00 00       	call   801016f0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100fff:	57                   	push   %edi
80101000:	ff 73 14             	pushl  0x14(%ebx)
80101003:	56                   	push   %esi
80101004:	ff 73 10             	pushl  0x10(%ebx)
80101007:	e8 c4 09 00 00       	call   801019d0 <readi>
8010100c:	83 c4 20             	add    $0x20,%esp
8010100f:	85 c0                	test   %eax,%eax
80101011:	89 c6                	mov    %eax,%esi
80101013:	7e 03                	jle    80101018 <fileread+0x48>
      f->off += r;
80101015:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80101018:	83 ec 0c             	sub    $0xc,%esp
8010101b:	ff 73 10             	pushl  0x10(%ebx)
8010101e:	e8 ad 07 00 00       	call   801017d0 <iunlock>
    return r;
80101023:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80101026:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101029:	89 f0                	mov    %esi,%eax
8010102b:	5b                   	pop    %ebx
8010102c:	5e                   	pop    %esi
8010102d:	5f                   	pop    %edi
8010102e:	5d                   	pop    %ebp
8010102f:	c3                   	ret    
    return piperead(f->pipe, addr, n);
80101030:	8b 43 0c             	mov    0xc(%ebx),%eax
80101033:	89 45 08             	mov    %eax,0x8(%ebp)
}
80101036:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101039:	5b                   	pop    %ebx
8010103a:	5e                   	pop    %esi
8010103b:	5f                   	pop    %edi
8010103c:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
8010103d:	e9 7e 25 00 00       	jmp    801035c0 <piperead>
80101042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80101048:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010104d:	eb d7                	jmp    80101026 <fileread+0x56>
  panic("fileread");
8010104f:	83 ec 0c             	sub    $0xc,%esp
80101052:	68 d4 74 10 80       	push   $0x801074d4
80101057:	e8 34 f3 ff ff       	call   80100390 <panic>
8010105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101060 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101060:	55                   	push   %ebp
80101061:	89 e5                	mov    %esp,%ebp
80101063:	57                   	push   %edi
80101064:	56                   	push   %esi
80101065:	53                   	push   %ebx
80101066:	83 ec 1c             	sub    $0x1c,%esp
80101069:	8b 75 08             	mov    0x8(%ebp),%esi
8010106c:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
8010106f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
{
80101073:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101076:	8b 45 10             	mov    0x10(%ebp),%eax
80101079:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
8010107c:	0f 84 aa 00 00 00    	je     8010112c <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101082:	8b 06                	mov    (%esi),%eax
80101084:	83 f8 01             	cmp    $0x1,%eax
80101087:	0f 84 c3 00 00 00    	je     80101150 <filewrite+0xf0>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010108d:	83 f8 02             	cmp    $0x2,%eax
80101090:	0f 85 d9 00 00 00    	jne    8010116f <filewrite+0x10f>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101096:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i = 0;
80101099:	31 ff                	xor    %edi,%edi
    while(i < n){
8010109b:	85 c0                	test   %eax,%eax
8010109d:	7f 34                	jg     801010d3 <filewrite+0x73>
8010109f:	e9 9c 00 00 00       	jmp    80101140 <filewrite+0xe0>
801010a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
801010a8:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
801010ab:	83 ec 0c             	sub    $0xc,%esp
801010ae:	ff 76 10             	pushl  0x10(%esi)
        f->off += r;
801010b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
801010b4:	e8 17 07 00 00       	call   801017d0 <iunlock>
      end_op();
801010b9:	e8 12 1c 00 00       	call   80102cd0 <end_op>
801010be:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010c1:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
801010c4:	39 c3                	cmp    %eax,%ebx
801010c6:	0f 85 96 00 00 00    	jne    80101162 <filewrite+0x102>
        panic("short filewrite");
      i += r;
801010cc:	01 df                	add    %ebx,%edi
    while(i < n){
801010ce:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010d1:	7e 6d                	jle    80101140 <filewrite+0xe0>
      int n1 = n - i;
801010d3:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801010d6:	b8 00 06 00 00       	mov    $0x600,%eax
801010db:	29 fb                	sub    %edi,%ebx
801010dd:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
801010e3:	0f 4f d8             	cmovg  %eax,%ebx
      begin_op();
801010e6:	e8 75 1b 00 00       	call   80102c60 <begin_op>
      ilock(f->ip);
801010eb:	83 ec 0c             	sub    $0xc,%esp
801010ee:	ff 76 10             	pushl  0x10(%esi)
801010f1:	e8 fa 05 00 00       	call   801016f0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
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
      iunlock(f->ip);
8010110f:	83 ec 0c             	sub    $0xc,%esp
80101112:	ff 76 10             	pushl  0x10(%esi)
80101115:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101118:	e8 b3 06 00 00       	call   801017d0 <iunlock>
      end_op();
8010111d:	e8 ae 1b 00 00       	call   80102cd0 <end_op>
      if(r < 0)
80101122:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101125:	83 c4 10             	add    $0x10,%esp
80101128:	85 c0                	test   %eax,%eax
8010112a:	74 98                	je     801010c4 <filewrite+0x64>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
8010112c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010112f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
}
80101134:	89 f8                	mov    %edi,%eax
80101136:	5b                   	pop    %ebx
80101137:	5e                   	pop    %esi
80101138:	5f                   	pop    %edi
80101139:	5d                   	pop    %ebp
8010113a:	c3                   	ret    
8010113b:	90                   	nop
8010113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return i == n ? n : -1;
80101140:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101143:	75 e7                	jne    8010112c <filewrite+0xcc>
}
80101145:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101148:	89 f8                	mov    %edi,%eax
8010114a:	5b                   	pop    %ebx
8010114b:	5e                   	pop    %esi
8010114c:	5f                   	pop    %edi
8010114d:	5d                   	pop    %ebp
8010114e:	c3                   	ret    
8010114f:	90                   	nop
    return pipewrite(f->pipe, addr, n);
80101150:	8b 46 0c             	mov    0xc(%esi),%eax
80101153:	89 45 08             	mov    %eax,0x8(%ebp)
}
80101156:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101159:	5b                   	pop    %ebx
8010115a:	5e                   	pop    %esi
8010115b:	5f                   	pop    %edi
8010115c:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
8010115d:	e9 4e 23 00 00       	jmp    801034b0 <pipewrite>
        panic("short filewrite");
80101162:	83 ec 0c             	sub    $0xc,%esp
80101165:	68 dd 74 10 80       	push   $0x801074dd
8010116a:	e8 21 f2 ff ff       	call   80100390 <panic>
  panic("filewrite");
8010116f:	83 ec 0c             	sub    $0xc,%esp
80101172:	68 e3 74 10 80       	push   $0x801074e3
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
801011e3:	68 ed 74 10 80       	push   $0x801074ed
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
80101294:	68 00 75 10 80       	push   $0x80107500
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
801012d5:	e8 16 34 00 00       	call   801046f0 <memset>
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
8010131a:	e8 c1 32 00 00       	call   801045e0 <acquire>
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
8010137f:	e8 1c 33 00 00       	call   801046a0 <release>

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
801013ad:	e8 ee 32 00 00       	call   801046a0 <release>
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
801013c2:	68 16 75 10 80       	push   $0x80107516
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
80101497:	68 26 75 10 80       	push   $0x80107526
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
801014d1:	e8 ca 32 00 00       	call   801047a0 <memmove>
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
801014fc:	68 39 75 10 80       	push   $0x80107539
80101501:	68 c0 13 11 80       	push   $0x801113c0
80101506:	e8 95 2f 00 00       	call   801044a0 <initlock>
8010150b:	83 c4 10             	add    $0x10,%esp
8010150e:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
80101510:	83 ec 08             	sub    $0x8,%esp
80101513:	68 40 75 10 80       	push   $0x80107540
80101518:	53                   	push   %ebx
80101519:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010151f:	e8 4c 2e 00 00       	call   80104370 <initsleeplock>
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
80101569:	68 a4 75 10 80       	push   $0x801075a4
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
801015fe:	e8 ed 30 00 00       	call   801046f0 <memset>
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
80101633:	68 46 75 10 80       	push   $0x80107546
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
801016a1:	e8 fa 30 00 00       	call   801047a0 <memmove>
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
801016cf:	e8 0c 2f 00 00       	call   801045e0 <acquire>
  ip->ref++;
801016d4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016d8:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
801016df:	e8 bc 2f 00 00       	call   801046a0 <release>
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
80101712:	e8 99 2c 00 00       	call   801043b0 <acquiresleep>
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
80101788:	e8 13 30 00 00       	call   801047a0 <memmove>
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
801017ad:	68 5e 75 10 80       	push   $0x8010755e
801017b2:	e8 d9 eb ff ff       	call   80100390 <panic>
    panic("ilock");
801017b7:	83 ec 0c             	sub    $0xc,%esp
801017ba:	68 58 75 10 80       	push   $0x80107558
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
801017e3:	e8 68 2c 00 00       	call   80104450 <holdingsleep>
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
801017ff:	e9 0c 2c 00 00       	jmp    80104410 <releasesleep>
    panic("iunlock");
80101804:	83 ec 0c             	sub    $0xc,%esp
80101807:	68 6d 75 10 80       	push   $0x8010756d
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
80101830:	e8 7b 2b 00 00       	call   801043b0 <acquiresleep>
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
8010184a:	e8 c1 2b 00 00       	call   80104410 <releasesleep>
  acquire(&icache.lock);
8010184f:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101856:	e8 85 2d 00 00       	call   801045e0 <acquire>
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
80101870:	e9 2b 2e 00 00       	jmp    801046a0 <release>
80101875:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101878:	83 ec 0c             	sub    $0xc,%esp
8010187b:	68 c0 13 11 80       	push   $0x801113c0
80101880:	e8 5b 2d 00 00       	call   801045e0 <acquire>
    int r = ip->ref;
80101885:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101888:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
8010188f:	e8 0c 2e 00 00       	call   801046a0 <release>
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
80101a77:	e8 24 2d 00 00       	call   801047a0 <memmove>
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
80101b73:	e8 28 2c 00 00       	call   801047a0 <memmove>
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
80101c0e:	e8 fd 2b 00 00       	call   80104810 <strncmp>
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
80101c6d:	e8 9e 2b 00 00       	call   80104810 <strncmp>
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
80101cb2:	68 87 75 10 80       	push   $0x80107587
80101cb7:	e8 d4 e6 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101cbc:	83 ec 0c             	sub    $0xc,%esp
80101cbf:	68 75 75 10 80       	push   $0x80107575
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
80101cf9:	e8 e2 28 00 00       	call   801045e0 <acquire>
  ip->ref++;
80101cfe:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101d02:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101d09:	e8 92 29 00 00       	call   801046a0 <release>
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
80101d65:	e8 36 2a 00 00       	call   801047a0 <memmove>
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
80101df8:	e8 a3 29 00 00       	call   801047a0 <memmove>
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
80101eed:	e8 7e 29 00 00       	call   80104870 <strncpy>
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
80101f2b:	68 96 75 10 80       	push   $0x80107596
80101f30:	e8 5b e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101f35:	83 ec 0c             	sub    $0xc,%esp
80101f38:	68 8e 7b 10 80       	push   $0x80107b8e
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
8010204b:	68 00 76 10 80       	push   $0x80107600
80102050:	e8 3b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80102055:	83 ec 0c             	sub    $0xc,%esp
80102058:	68 f7 75 10 80       	push   $0x801075f7
8010205d:	e8 2e e3 ff ff       	call   80100390 <panic>
80102062:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102070 <ideinit>:
{
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102076:	68 12 76 10 80       	push   $0x80107612
8010207b:	68 80 a5 10 80       	push   $0x8010a580
80102080:	e8 1b 24 00 00       	call   801044a0 <initlock>
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
801020fe:	e8 dd 24 00 00       	call   801045e0 <acquire>

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
80102161:	e8 aa 1f 00 00       	call   80104110 <wakeup>

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
8010217f:	e8 1c 25 00 00       	call   801046a0 <release>

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
8010219e:	e8 ad 22 00 00       	call   80104450 <holdingsleep>
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
801021d8:	e8 03 24 00 00       	call   801045e0 <acquire>

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
80102229:	e8 22 1d 00 00       	call   80103f50 <sleep>
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
80102246:	e9 55 24 00 00       	jmp    801046a0 <release>
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
8010226a:	68 2c 76 10 80       	push   $0x8010762c
8010226f:	e8 1c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 16 76 10 80       	push   $0x80107616
8010227c:	e8 0f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102281:	83 ec 0c             	sub    $0xc,%esp
80102284:	68 41 76 10 80       	push   $0x80107641
80102289:	e8 02 e1 ff ff       	call   80100390 <panic>
8010228e:	66 90                	xchg   %ax,%ax

80102290 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102290:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102291:	c7 05 14 30 11 80 00 	movl   $0xfec00000,0x80113014
80102298:	00 c0 fe 
{
8010229b:	89 e5                	mov    %esp,%ebp
8010229d:	56                   	push   %esi
8010229e:	53                   	push   %ebx
  ioapic->reg = reg;
8010229f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801022a6:	00 00 00 
  return ioapic->data;
801022a9:	a1 14 30 11 80       	mov    0x80113014,%eax
801022ae:	8b 58 10             	mov    0x10(%eax),%ebx
  ioapic->reg = reg;
801022b1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return ioapic->data;
801022b7:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801022bd:	0f b6 15 40 31 11 80 	movzbl 0x80113140,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801022c4:	c1 eb 10             	shr    $0x10,%ebx
  return ioapic->data;
801022c7:	8b 41 10             	mov    0x10(%ecx),%eax
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801022ca:	0f b6 db             	movzbl %bl,%ebx
  id = ioapicread(REG_ID) >> 24;
801022cd:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
801022d0:	39 c2                	cmp    %eax,%edx
801022d2:	74 16                	je     801022ea <ioapicinit+0x5a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
801022d4:	83 ec 0c             	sub    $0xc,%esp
801022d7:	68 60 76 10 80       	push   $0x80107660
801022dc:	e8 7f e3 ff ff       	call   80100660 <cprintf>
801022e1:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
801022e7:	83 c4 10             	add    $0x10,%esp
801022ea:	83 c3 21             	add    $0x21,%ebx
{
801022ed:	ba 10 00 00 00       	mov    $0x10,%edx
801022f2:	b8 20 00 00 00       	mov    $0x20,%eax
801022f7:	89 f6                	mov    %esi,%esi
801022f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ioapic->reg = reg;
80102300:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102302:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102308:	89 c6                	mov    %eax,%esi
8010230a:	81 ce 00 00 01 00    	or     $0x10000,%esi
80102310:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
80102313:	89 71 10             	mov    %esi,0x10(%ecx)
80102316:	8d 72 01             	lea    0x1(%edx),%esi
80102319:	83 c2 02             	add    $0x2,%edx
  for(i = 0; i <= maxintr; i++){
8010231c:	39 d8                	cmp    %ebx,%eax
  ioapic->reg = reg;
8010231e:	89 31                	mov    %esi,(%ecx)
  ioapic->data = data;
80102320:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
80102326:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
8010232d:	75 d1                	jne    80102300 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010232f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102332:	5b                   	pop    %ebx
80102333:	5e                   	pop    %esi
80102334:	5d                   	pop    %ebp
80102335:	c3                   	ret    
80102336:	8d 76 00             	lea    0x0(%esi),%esi
80102339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102340 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
80102340:	55                   	push   %ebp
  ioapic->reg = reg;
80102341:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
{
80102347:	89 e5                	mov    %esp,%ebp
80102349:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010234c:	8d 50 20             	lea    0x20(%eax),%edx
8010234f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
80102353:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102355:	8b 0d 14 30 11 80    	mov    0x80113014,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010235b:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
8010235e:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102361:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
80102364:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102366:	a1 14 30 11 80       	mov    0x80113014,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010236b:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
8010236e:	89 50 10             	mov    %edx,0x10(%eax)
}
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
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102380:	55                   	push   %ebp
80102381:	89 e5                	mov    %esp,%ebp
80102383:	53                   	push   %ebx
80102384:	83 ec 04             	sub    $0x4,%esp
80102387:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010238a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102390:	75 70                	jne    80102402 <kfree+0x82>
80102392:	81 fb 88 60 11 80    	cmp    $0x80116088,%ebx
80102398:	72 68                	jb     80102402 <kfree+0x82>
8010239a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801023a0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801023a5:	77 5b                	ja     80102402 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801023a7:	83 ec 04             	sub    $0x4,%esp
801023aa:	68 00 10 00 00       	push   $0x1000
801023af:	6a 01                	push   $0x1
801023b1:	53                   	push   %ebx
801023b2:	e8 39 23 00 00       	call   801046f0 <memset>

  if(kmem.use_lock)
801023b7:	8b 15 54 30 11 80    	mov    0x80113054,%edx
801023bd:	83 c4 10             	add    $0x10,%esp
801023c0:	85 d2                	test   %edx,%edx
801023c2:	75 2c                	jne    801023f0 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
801023c4:	a1 58 30 11 80       	mov    0x80113058,%eax
801023c9:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
801023cb:	a1 54 30 11 80       	mov    0x80113054,%eax
  kmem.freelist = r;
801023d0:	89 1d 58 30 11 80    	mov    %ebx,0x80113058
  if(kmem.use_lock)
801023d6:	85 c0                	test   %eax,%eax
801023d8:	75 06                	jne    801023e0 <kfree+0x60>
    release(&kmem.lock);
}
801023da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023dd:	c9                   	leave  
801023de:	c3                   	ret    
801023df:	90                   	nop
    release(&kmem.lock);
801023e0:	c7 45 08 20 30 11 80 	movl   $0x80113020,0x8(%ebp)
}
801023e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023ea:	c9                   	leave  
    release(&kmem.lock);
801023eb:	e9 b0 22 00 00       	jmp    801046a0 <release>
    acquire(&kmem.lock);
801023f0:	83 ec 0c             	sub    $0xc,%esp
801023f3:	68 20 30 11 80       	push   $0x80113020
801023f8:	e8 e3 21 00 00       	call   801045e0 <acquire>
801023fd:	83 c4 10             	add    $0x10,%esp
80102400:	eb c2                	jmp    801023c4 <kfree+0x44>
    panic("kfree");
80102402:	83 ec 0c             	sub    $0xc,%esp
80102405:	68 92 76 10 80       	push   $0x80107692
8010240a:	e8 81 df ff ff       	call   80100390 <panic>
8010240f:	90                   	nop

80102410 <freerange>:
{
80102410:	55                   	push   %ebp
80102411:	89 e5                	mov    %esp,%ebp
80102413:	56                   	push   %esi
80102414:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
80102415:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102418:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010241b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102421:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102427:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010242d:	39 de                	cmp    %ebx,%esi
8010242f:	72 23                	jb     80102454 <freerange+0x44>
80102431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102438:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010243e:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102441:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102447:	50                   	push   %eax
80102448:	e8 33 ff ff ff       	call   80102380 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010244d:	83 c4 10             	add    $0x10,%esp
80102450:	39 f3                	cmp    %esi,%ebx
80102452:	76 e4                	jbe    80102438 <freerange+0x28>
}
80102454:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102457:	5b                   	pop    %ebx
80102458:	5e                   	pop    %esi
80102459:	5d                   	pop    %ebp
8010245a:	c3                   	ret    
8010245b:	90                   	nop
8010245c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102460 <kinit1>:
{
80102460:	55                   	push   %ebp
80102461:	89 e5                	mov    %esp,%ebp
80102463:	56                   	push   %esi
80102464:	53                   	push   %ebx
80102465:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102468:	83 ec 08             	sub    $0x8,%esp
8010246b:	68 98 76 10 80       	push   $0x80107698
80102470:	68 20 30 11 80       	push   $0x80113020
80102475:	e8 26 20 00 00       	call   801044a0 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
8010247a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010247d:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
80102480:	c7 05 54 30 11 80 00 	movl   $0x0,0x80113054
80102487:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
8010248a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102490:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102496:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010249c:	39 de                	cmp    %ebx,%esi
8010249e:	72 1c                	jb     801024bc <kinit1+0x5c>
    kfree(p);
801024a0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024a6:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024a9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801024af:	50                   	push   %eax
801024b0:	e8 cb fe ff ff       	call   80102380 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024b5:	83 c4 10             	add    $0x10,%esp
801024b8:	39 de                	cmp    %ebx,%esi
801024ba:	73 e4                	jae    801024a0 <kinit1+0x40>
}
801024bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024bf:	5b                   	pop    %ebx
801024c0:	5e                   	pop    %esi
801024c1:	5d                   	pop    %ebp
801024c2:	c3                   	ret    
801024c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801024c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024d0 <kinit2>:
{
801024d0:	55                   	push   %ebp
801024d1:	89 e5                	mov    %esp,%ebp
801024d3:	56                   	push   %esi
801024d4:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
801024d5:	8b 45 08             	mov    0x8(%ebp),%eax
{
801024d8:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801024db:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024e1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024e7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024ed:	39 de                	cmp    %ebx,%esi
801024ef:	72 23                	jb     80102514 <kinit2+0x44>
801024f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801024f8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024fe:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102501:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102507:	50                   	push   %eax
80102508:	e8 73 fe ff ff       	call   80102380 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010250d:	83 c4 10             	add    $0x10,%esp
80102510:	39 de                	cmp    %ebx,%esi
80102512:	73 e4                	jae    801024f8 <kinit2+0x28>
  kmem.use_lock = 1;
80102514:	c7 05 54 30 11 80 01 	movl   $0x1,0x80113054
8010251b:	00 00 00 
}
8010251e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102521:	5b                   	pop    %ebx
80102522:	5e                   	pop    %esi
80102523:	5d                   	pop    %ebp
80102524:	c3                   	ret    
80102525:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102530 <kalloc>:
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
80102530:	a1 54 30 11 80       	mov    0x80113054,%eax
80102535:	85 c0                	test   %eax,%eax
80102537:	75 1f                	jne    80102558 <kalloc+0x28>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102539:	a1 58 30 11 80       	mov    0x80113058,%eax
  if(r)
8010253e:	85 c0                	test   %eax,%eax
80102540:	74 0e                	je     80102550 <kalloc+0x20>
    kmem.freelist = r->next;
80102542:	8b 10                	mov    (%eax),%edx
80102544:	89 15 58 30 11 80    	mov    %edx,0x80113058
8010254a:	c3                   	ret    
8010254b:	90                   	nop
8010254c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(kmem.use_lock)
    release(&kmem.lock);
  return (char*)r;
}
80102550:	f3 c3                	repz ret 
80102552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
80102558:	55                   	push   %ebp
80102559:	89 e5                	mov    %esp,%ebp
8010255b:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
8010255e:	68 20 30 11 80       	push   $0x80113020
80102563:	e8 78 20 00 00       	call   801045e0 <acquire>
  r = kmem.freelist;
80102568:	a1 58 30 11 80       	mov    0x80113058,%eax
  if(r)
8010256d:	83 c4 10             	add    $0x10,%esp
80102570:	8b 15 54 30 11 80    	mov    0x80113054,%edx
80102576:	85 c0                	test   %eax,%eax
80102578:	74 08                	je     80102582 <kalloc+0x52>
    kmem.freelist = r->next;
8010257a:	8b 08                	mov    (%eax),%ecx
8010257c:	89 0d 58 30 11 80    	mov    %ecx,0x80113058
  if(kmem.use_lock)
80102582:	85 d2                	test   %edx,%edx
80102584:	74 16                	je     8010259c <kalloc+0x6c>
    release(&kmem.lock);
80102586:	83 ec 0c             	sub    $0xc,%esp
80102589:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010258c:	68 20 30 11 80       	push   $0x80113020
80102591:	e8 0a 21 00 00       	call   801046a0 <release>
  return (char*)r;
80102596:	8b 45 f4             	mov    -0xc(%ebp),%eax
    release(&kmem.lock);
80102599:	83 c4 10             	add    $0x10,%esp
}
8010259c:	c9                   	leave  
8010259d:	c3                   	ret    
8010259e:	66 90                	xchg   %ax,%ax

801025a0 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025a0:	ba 64 00 00 00       	mov    $0x64,%edx
801025a5:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801025a6:	a8 01                	test   $0x1,%al
801025a8:	0f 84 c2 00 00 00    	je     80102670 <kbdgetc+0xd0>
801025ae:	ba 60 00 00 00       	mov    $0x60,%edx
801025b3:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
801025b4:	0f b6 d0             	movzbl %al,%edx
801025b7:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx

  if(data == 0xE0){
801025bd:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
801025c3:	0f 84 7f 00 00 00    	je     80102648 <kbdgetc+0xa8>
{
801025c9:	55                   	push   %ebp
801025ca:	89 e5                	mov    %esp,%ebp
801025cc:	53                   	push   %ebx
801025cd:	89 cb                	mov    %ecx,%ebx
801025cf:	83 e3 40             	and    $0x40,%ebx
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801025d2:	84 c0                	test   %al,%al
801025d4:	78 4a                	js     80102620 <kbdgetc+0x80>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
801025d6:	85 db                	test   %ebx,%ebx
801025d8:	74 09                	je     801025e3 <kbdgetc+0x43>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
801025da:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
801025dd:	83 e1 bf             	and    $0xffffffbf,%ecx
    data |= 0x80;
801025e0:	0f b6 d0             	movzbl %al,%edx
  }

  shift |= shiftcode[data];
801025e3:	0f b6 82 c0 77 10 80 	movzbl -0x7fef8840(%edx),%eax
801025ea:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
801025ec:	0f b6 82 c0 76 10 80 	movzbl -0x7fef8940(%edx),%eax
801025f3:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801025f5:	89 c8                	mov    %ecx,%eax
  shift ^= togglecode[data];
801025f7:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
801025fd:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
80102600:	83 e1 08             	and    $0x8,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102603:	8b 04 85 a0 76 10 80 	mov    -0x7fef8960(,%eax,4),%eax
8010260a:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
8010260e:	74 31                	je     80102641 <kbdgetc+0xa1>
    if('a' <= c && c <= 'z')
80102610:	8d 50 9f             	lea    -0x61(%eax),%edx
80102613:	83 fa 19             	cmp    $0x19,%edx
80102616:	77 40                	ja     80102658 <kbdgetc+0xb8>
      c += 'A' - 'a';
80102618:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
8010261b:	5b                   	pop    %ebx
8010261c:	5d                   	pop    %ebp
8010261d:	c3                   	ret    
8010261e:	66 90                	xchg   %ax,%ax
    data = (shift & E0ESC ? data : data & 0x7F);
80102620:	83 e0 7f             	and    $0x7f,%eax
80102623:	85 db                	test   %ebx,%ebx
80102625:	0f 44 d0             	cmove  %eax,%edx
    shift &= ~(shiftcode[data] | E0ESC);
80102628:	0f b6 82 c0 77 10 80 	movzbl -0x7fef8840(%edx),%eax
8010262f:	83 c8 40             	or     $0x40,%eax
80102632:	0f b6 c0             	movzbl %al,%eax
80102635:	f7 d0                	not    %eax
80102637:	21 c1                	and    %eax,%ecx
    return 0;
80102639:	31 c0                	xor    %eax,%eax
    shift &= ~(shiftcode[data] | E0ESC);
8010263b:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
}
80102641:	5b                   	pop    %ebx
80102642:	5d                   	pop    %ebp
80102643:	c3                   	ret    
80102644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    shift |= E0ESC;
80102648:	83 c9 40             	or     $0x40,%ecx
    return 0;
8010264b:	31 c0                	xor    %eax,%eax
    shift |= E0ESC;
8010264d:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
    return 0;
80102653:	c3                   	ret    
80102654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    else if('A' <= c && c <= 'Z')
80102658:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
8010265b:	8d 50 20             	lea    0x20(%eax),%edx
}
8010265e:	5b                   	pop    %ebx
      c += 'a' - 'A';
8010265f:	83 f9 1a             	cmp    $0x1a,%ecx
80102662:	0f 42 c2             	cmovb  %edx,%eax
}
80102665:	5d                   	pop    %ebp
80102666:	c3                   	ret    
80102667:	89 f6                	mov    %esi,%esi
80102669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80102670:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102675:	c3                   	ret    
80102676:	8d 76 00             	lea    0x0(%esi),%esi
80102679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102680 <kbdintr>:

void
kbdintr(void)
{
80102680:	55                   	push   %ebp
80102681:	89 e5                	mov    %esp,%ebp
80102683:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102686:	68 a0 25 10 80       	push   $0x801025a0
8010268b:	e8 c0 e1 ff ff       	call   80100850 <consoleintr>
}
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
}

void
lapicinit(void)
{
  if(!lapic)
801026a0:	a1 5c 30 11 80       	mov    0x8011305c,%eax
{
801026a5:	55                   	push   %ebp
801026a6:	89 e5                	mov    %esp,%ebp
  if(!lapic)
801026a8:	85 c0                	test   %eax,%eax
801026aa:	0f 84 c8 00 00 00    	je     80102778 <lapicinit+0xd8>
  lapic[index] = value;
801026b0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801026b7:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026ba:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026bd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801026c4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026c7:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026ca:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026d1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801026d4:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026d7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026de:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801026e1:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026e4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026eb:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026ee:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026f1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026f8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026fb:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801026fe:	8b 50 30             	mov    0x30(%eax),%edx
80102701:	c1 ea 10             	shr    $0x10,%edx
80102704:	80 fa 03             	cmp    $0x3,%dl
80102707:	77 77                	ja     80102780 <lapicinit+0xe0>
  lapic[index] = value;
80102709:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102710:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102713:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102716:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010271d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102720:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102723:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010272a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010272d:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102730:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102737:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010273a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010273d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102744:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102747:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010274a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102751:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102754:	8b 50 20             	mov    0x20(%eax),%edx
80102757:	89 f6                	mov    %esi,%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102760:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102766:	80 e6 10             	and    $0x10,%dh
80102769:	75 f5                	jne    80102760 <lapicinit+0xc0>
  lapic[index] = value;
8010276b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102772:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102775:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102778:	5d                   	pop    %ebp
80102779:	c3                   	ret    
8010277a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic[index] = value;
80102780:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102787:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010278a:	8b 50 20             	mov    0x20(%eax),%edx
8010278d:	e9 77 ff ff ff       	jmp    80102709 <lapicinit+0x69>
80102792:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027a0 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
801027a0:	8b 15 5c 30 11 80    	mov    0x8011305c,%edx
{
801027a6:	55                   	push   %ebp
801027a7:	31 c0                	xor    %eax,%eax
801027a9:	89 e5                	mov    %esp,%ebp
  if (!lapic)
801027ab:	85 d2                	test   %edx,%edx
801027ad:	74 06                	je     801027b5 <lapicid+0x15>
    return 0;
  return lapic[ID] >> 24;
801027af:	8b 42 20             	mov    0x20(%edx),%eax
801027b2:	c1 e8 18             	shr    $0x18,%eax
}
801027b5:	5d                   	pop    %ebp
801027b6:	c3                   	ret    
801027b7:	89 f6                	mov    %esi,%esi
801027b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027c0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
801027c0:	a1 5c 30 11 80       	mov    0x8011305c,%eax
{
801027c5:	55                   	push   %ebp
801027c6:	89 e5                	mov    %esp,%ebp
  if(lapic)
801027c8:	85 c0                	test   %eax,%eax
801027ca:	74 0d                	je     801027d9 <lapiceoi+0x19>
  lapic[index] = value;
801027cc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027d3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027d6:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
801027d9:	5d                   	pop    %ebp
801027da:	c3                   	ret    
801027db:	90                   	nop
801027dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027e0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801027e0:	55                   	push   %ebp
801027e1:	89 e5                	mov    %esp,%ebp
}
801027e3:	5d                   	pop    %ebp
801027e4:	c3                   	ret    
801027e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027f0 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
801027f0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102810:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102812:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
80102815:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010281b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010281d:	c1 e9 0c             	shr    $0xc,%ecx
  wrv[1] = addr >> 4;
80102820:	c1 e8 04             	shr    $0x4,%eax
  lapicw(ICRHI, apicid<<24);
80102823:	89 da                	mov    %ebx,%edx
    lapicw(ICRLO, STARTUP | (addr>>12));
80102825:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
80102828:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
8010282e:	a1 5c 30 11 80       	mov    0x8011305c,%eax
80102833:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102839:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
8010283c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102843:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102846:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102849:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102850:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102853:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102856:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010285c:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
8010285f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102865:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102868:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010286e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102871:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102877:	8b 40 20             	mov    0x20(%eax),%eax
    microdelay(200);
  }
}
8010287a:	5b                   	pop    %ebx
8010287b:	5d                   	pop    %ebp
8010287c:	c3                   	ret    
8010287d:	8d 76 00             	lea    0x0(%esi),%esi

80102880 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102880:	55                   	push   %ebp
80102881:	b8 0b 00 00 00       	mov    $0xb,%eax
80102886:	ba 70 00 00 00       	mov    $0x70,%edx
8010288b:	89 e5                	mov    %esp,%ebp
8010288d:	57                   	push   %edi
8010288e:	56                   	push   %esi
8010288f:	53                   	push   %ebx
80102890:	83 ec 4c             	sub    $0x4c,%esp
80102893:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102894:	ba 71 00 00 00       	mov    $0x71,%edx
80102899:	ec                   	in     (%dx),%al
8010289a:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010289d:	bb 70 00 00 00       	mov    $0x70,%ebx
801028a2:	88 45 b3             	mov    %al,-0x4d(%ebp)
801028a5:	8d 76 00             	lea    0x0(%esi),%esi
801028a8:	31 c0                	xor    %eax,%eax
801028aa:	89 da                	mov    %ebx,%edx
801028ac:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ad:	b9 71 00 00 00       	mov    $0x71,%ecx
801028b2:	89 ca                	mov    %ecx,%edx
801028b4:	ec                   	in     (%dx),%al
801028b5:	88 45 b7             	mov    %al,-0x49(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028b8:	89 da                	mov    %ebx,%edx
801028ba:	b8 02 00 00 00       	mov    $0x2,%eax
801028bf:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028c0:	89 ca                	mov    %ecx,%edx
801028c2:	ec                   	in     (%dx),%al
801028c3:	88 45 b6             	mov    %al,-0x4a(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028c6:	89 da                	mov    %ebx,%edx
801028c8:	b8 04 00 00 00       	mov    $0x4,%eax
801028cd:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ce:	89 ca                	mov    %ecx,%edx
801028d0:	ec                   	in     (%dx),%al
801028d1:	88 45 b5             	mov    %al,-0x4b(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028d4:	89 da                	mov    %ebx,%edx
801028d6:	b8 07 00 00 00       	mov    $0x7,%eax
801028db:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028dc:	89 ca                	mov    %ecx,%edx
801028de:	ec                   	in     (%dx),%al
801028df:	88 45 b4             	mov    %al,-0x4c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e2:	89 da                	mov    %ebx,%edx
801028e4:	b8 08 00 00 00       	mov    $0x8,%eax
801028e9:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ea:	89 ca                	mov    %ecx,%edx
801028ec:	ec                   	in     (%dx),%al
801028ed:	89 c7                	mov    %eax,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028ef:	89 da                	mov    %ebx,%edx
801028f1:	b8 09 00 00 00       	mov    $0x9,%eax
801028f6:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028f7:	89 ca                	mov    %ecx,%edx
801028f9:	ec                   	in     (%dx),%al
801028fa:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028fc:	89 da                	mov    %ebx,%edx
801028fe:	b8 0a 00 00 00       	mov    $0xa,%eax
80102903:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102904:	89 ca                	mov    %ecx,%edx
80102906:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102907:	84 c0                	test   %al,%al
80102909:	78 9d                	js     801028a8 <cmostime+0x28>
  return inb(CMOS_RETURN);
8010290b:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
8010290f:	89 fa                	mov    %edi,%edx
80102911:	0f b6 fa             	movzbl %dl,%edi
80102914:	89 f2                	mov    %esi,%edx
80102916:	0f b6 f2             	movzbl %dl,%esi
80102919:	89 7d c8             	mov    %edi,-0x38(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010293c:	89 ca                	mov    %ecx,%edx
8010293e:	ec                   	in     (%dx),%al
8010293f:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102942:	89 da                	mov    %ebx,%edx
80102944:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102947:	b8 02 00 00 00       	mov    $0x2,%eax
8010294c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010294d:	89 ca                	mov    %ecx,%edx
8010294f:	ec                   	in     (%dx),%al
80102950:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102953:	89 da                	mov    %ebx,%edx
80102955:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102958:	b8 04 00 00 00       	mov    $0x4,%eax
8010295d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010295e:	89 ca                	mov    %ecx,%edx
80102960:	ec                   	in     (%dx),%al
80102961:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102964:	89 da                	mov    %ebx,%edx
80102966:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102969:	b8 07 00 00 00       	mov    $0x7,%eax
8010296e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010296f:	89 ca                	mov    %ecx,%edx
80102971:	ec                   	in     (%dx),%al
80102972:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102975:	89 da                	mov    %ebx,%edx
80102977:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010297a:	b8 08 00 00 00       	mov    $0x8,%eax
8010297f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102980:	89 ca                	mov    %ecx,%edx
80102982:	ec                   	in     (%dx),%al
80102983:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102986:	89 da                	mov    %ebx,%edx
80102988:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010298b:	b8 09 00 00 00       	mov    $0x9,%eax
80102990:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102991:	89 ca                	mov    %ecx,%edx
80102993:	ec                   	in     (%dx),%al
80102994:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102997:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
8010299a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010299d:	8d 45 d0             	lea    -0x30(%ebp),%eax
801029a0:	6a 18                	push   $0x18
801029a2:	50                   	push   %eax
801029a3:	8d 45 b8             	lea    -0x48(%ebp),%eax
801029a6:	50                   	push   %eax
801029a7:	e8 94 1d 00 00       	call   80104740 <memcmp>
801029ac:	83 c4 10             	add    $0x10,%esp
801029af:	85 c0                	test   %eax,%eax
801029b1:	0f 85 f1 fe ff ff    	jne    801028a8 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
801029b7:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
801029bb:	75 78                	jne    80102a35 <cmostime+0x1b5>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
801029bd:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029c0:	89 c2                	mov    %eax,%edx
801029c2:	83 e0 0f             	and    $0xf,%eax
801029c5:	c1 ea 04             	shr    $0x4,%edx
801029c8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
801029d1:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029d4:	89 c2                	mov    %eax,%edx
801029d6:	83 e0 0f             	and    $0xf,%eax
801029d9:	c1 ea 04             	shr    $0x4,%edx
801029dc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029df:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029e2:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801029e5:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e8:	89 c2                	mov    %eax,%edx
801029ea:	83 e0 0f             	and    $0xf,%eax
801029ed:	c1 ea 04             	shr    $0x4,%edx
801029f0:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029f3:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029f6:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
801029f9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029fc:	89 c2                	mov    %eax,%edx
801029fe:	83 e0 0f             	and    $0xf,%eax
80102a01:	c1 ea 04             	shr    $0x4,%edx
80102a04:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a07:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a0a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102a0d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a10:	89 c2                	mov    %eax,%edx
80102a12:	83 e0 0f             	and    $0xf,%eax
80102a15:	c1 ea 04             	shr    $0x4,%edx
80102a18:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a1b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a1e:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102a21:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a24:	89 c2                	mov    %eax,%edx
80102a26:	83 e0 0f             	and    $0xf,%eax
80102a29:	c1 ea 04             	shr    $0x4,%edx
80102a2c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a2f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a32:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
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
  r->year += 2000;
80102a5b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102a62:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a65:	5b                   	pop    %ebx
80102a66:	5e                   	pop    %esi
80102a67:	5f                   	pop    %edi
80102a68:	5d                   	pop    %ebp
80102a69:	c3                   	ret    
80102a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102a70 <unixtime>:

// This is not the "real" UNIX time as it makes many
// simplifying assumptions -- no leap years, months
// that are all the same length (!)
unsigned long unixtime(void) {
80102a70:	55                   	push   %ebp
80102a71:	89 e5                	mov    %esp,%ebp
80102a73:	83 ec 34             	sub    $0x34,%esp
  struct rtcdate t;
  cmostime(&t);
80102a76:	8d 45 e0             	lea    -0x20(%ebp),%eax
80102a79:	50                   	push   %eax
80102a7a:	e8 01 fe ff ff       	call   80102880 <cmostime>
  return ((t.year - 1970) * 365 * 24 * 60 * 60) +
80102a7f:	69 55 f4 80 33 e1 01 	imul   $0x1e13380,-0xc(%ebp),%edx
         (t.month * 30 * 24 * 60 * 60) +
         (t.day * 24 * 60 * 60) +
         (t.hour * 60 * 60) +
         (t.minute * 60) +
80102a86:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102a89:	8d 84 02 00 b1 01 89 	lea    -0x76fe4f00(%edx,%eax,1),%eax
         (t.month * 30 * 24 * 60 * 60) +
80102a90:	69 55 f0 00 8d 27 00 	imul   $0x278d00,-0x10(%ebp),%edx
         (t.minute * 60) +
80102a97:	01 d0                	add    %edx,%eax
         (t.day * 24 * 60 * 60) +
80102a99:	69 55 ec 80 51 01 00 	imul   $0x15180,-0x14(%ebp),%edx
         (t.minute * 60) +
80102aa0:	01 d0                	add    %edx,%eax
         (t.hour * 60 * 60) +
80102aa2:	69 55 e8 10 0e 00 00 	imul   $0xe10,-0x18(%ebp),%edx
         (t.minute * 60) +
80102aa9:	01 d0                	add    %edx,%eax
80102aab:	6b 55 e4 3c          	imul   $0x3c,-0x1c(%ebp),%edx
         (t.second);
80102aaf:	c9                   	leave  
         (t.minute * 60) +
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
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102ac0:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102ac6:	85 c9                	test   %ecx,%ecx
80102ac8:	0f 8e 8a 00 00 00    	jle    80102b58 <install_trans+0x98>
{
80102ace:	55                   	push   %ebp
80102acf:	89 e5                	mov    %esp,%ebp
80102ad1:	57                   	push   %edi
80102ad2:	56                   	push   %esi
80102ad3:	53                   	push   %ebx
  for (tail = 0; tail < log.lh.n; tail++) {
80102ad4:	31 db                	xor    %ebx,%ebx
{
80102ad6:	83 ec 0c             	sub    $0xc,%esp
80102ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102ae0:	a1 94 30 11 80       	mov    0x80113094,%eax
80102ae5:	83 ec 08             	sub    $0x8,%esp
80102ae8:	01 d8                	add    %ebx,%eax
80102aea:	83 c0 01             	add    $0x1,%eax
80102aed:	50                   	push   %eax
80102aee:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102af4:	e8 d7 d5 ff ff       	call   801000d0 <bread>
80102af9:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102afb:	58                   	pop    %eax
80102afc:	5a                   	pop    %edx
80102afd:	ff 34 9d ac 30 11 80 	pushl  -0x7feecf54(,%ebx,4)
80102b04:	ff 35 a4 30 11 80    	pushl  0x801130a4
  for (tail = 0; tail < log.lh.n; tail++) {
80102b0a:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102b0d:	e8 be d5 ff ff       	call   801000d0 <bread>
80102b12:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102b14:	8d 47 5c             	lea    0x5c(%edi),%eax
80102b17:	83 c4 0c             	add    $0xc,%esp
80102b1a:	68 00 02 00 00       	push   $0x200
80102b1f:	50                   	push   %eax
80102b20:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b23:	50                   	push   %eax
80102b24:	e8 77 1c 00 00       	call   801047a0 <memmove>
    bwrite(dbuf);  // write dst to disk
80102b29:	89 34 24             	mov    %esi,(%esp)
80102b2c:	e8 6f d6 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102b31:	89 3c 24             	mov    %edi,(%esp)
80102b34:	e8 a7 d6 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102b39:	89 34 24             	mov    %esi,(%esp)
80102b3c:	e8 9f d6 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102b41:	83 c4 10             	add    $0x10,%esp
80102b44:	39 1d a8 30 11 80    	cmp    %ebx,0x801130a8
80102b4a:	7f 94                	jg     80102ae0 <install_trans+0x20>
  }
}
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
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102b60:	55                   	push   %ebp
80102b61:	89 e5                	mov    %esp,%ebp
80102b63:	56                   	push   %esi
80102b64:	53                   	push   %ebx
  struct buf *buf = bread(log.dev, log.start);
80102b65:	83 ec 08             	sub    $0x8,%esp
80102b68:	ff 35 94 30 11 80    	pushl  0x80113094
80102b6e:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102b74:	e8 57 d5 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102b79:	8b 1d a8 30 11 80    	mov    0x801130a8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102b7f:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102b82:	89 c6                	mov    %eax,%esi
  for (i = 0; i < log.lh.n; i++) {
80102b84:	85 db                	test   %ebx,%ebx
  hb->n = log.lh.n;
80102b86:	89 58 5c             	mov    %ebx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102b89:	7e 16                	jle    80102ba1 <write_head+0x41>
80102b8b:	c1 e3 02             	shl    $0x2,%ebx
80102b8e:	31 d2                	xor    %edx,%edx
    hb->block[i] = log.lh.block[i];
80102b90:	8b 8a ac 30 11 80    	mov    -0x7feecf54(%edx),%ecx
80102b96:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102b9a:	83 c2 04             	add    $0x4,%edx
  for (i = 0; i < log.lh.n; i++) {
80102b9d:	39 da                	cmp    %ebx,%edx
80102b9f:	75 ef                	jne    80102b90 <write_head+0x30>
  }
  bwrite(buf);
80102ba1:	83 ec 0c             	sub    $0xc,%esp
80102ba4:	56                   	push   %esi
80102ba5:	e8 f6 d5 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102baa:	89 34 24             	mov    %esi,(%esp)
80102bad:	e8 2e d6 ff ff       	call   801001e0 <brelse>
}
80102bb2:	83 c4 10             	add    $0x10,%esp
80102bb5:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102bb8:	5b                   	pop    %ebx
80102bb9:	5e                   	pop    %esi
80102bba:	5d                   	pop    %ebp
80102bbb:	c3                   	ret    
80102bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102bc0 <initlog>:
{
80102bc0:	55                   	push   %ebp
80102bc1:	89 e5                	mov    %esp,%ebp
80102bc3:	53                   	push   %ebx
80102bc4:	83 ec 2c             	sub    $0x2c,%esp
80102bc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102bca:	68 c0 78 10 80       	push   $0x801078c0
80102bcf:	68 60 30 11 80       	push   $0x80113060
80102bd4:	e8 c7 18 00 00       	call   801044a0 <initlock>
  readsb(dev, &sb);
80102bd9:	58                   	pop    %eax
80102bda:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102bdd:	5a                   	pop    %edx
80102bde:	50                   	push   %eax
80102bdf:	53                   	push   %ebx
80102be0:	e8 cb e8 ff ff       	call   801014b0 <readsb>
  log.size = sb.nlog;
80102be5:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102be8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102beb:	59                   	pop    %ecx
  log.dev = dev;
80102bec:	89 1d a4 30 11 80    	mov    %ebx,0x801130a4
  log.size = sb.nlog;
80102bf2:	89 15 98 30 11 80    	mov    %edx,0x80113098
  log.start = sb.logstart;
80102bf8:	a3 94 30 11 80       	mov    %eax,0x80113094
  struct buf *buf = bread(log.dev, log.start);
80102bfd:	5a                   	pop    %edx
80102bfe:	50                   	push   %eax
80102bff:	53                   	push   %ebx
80102c00:	e8 cb d4 ff ff       	call   801000d0 <bread>
  log.lh.n = lh->n;
80102c05:	8b 58 5c             	mov    0x5c(%eax),%ebx
  for (i = 0; i < log.lh.n; i++) {
80102c08:	83 c4 10             	add    $0x10,%esp
80102c0b:	85 db                	test   %ebx,%ebx
  log.lh.n = lh->n;
80102c0d:	89 1d a8 30 11 80    	mov    %ebx,0x801130a8
  for (i = 0; i < log.lh.n; i++) {
80102c13:	7e 1c                	jle    80102c31 <initlog+0x71>
80102c15:	c1 e3 02             	shl    $0x2,%ebx
80102c18:	31 d2                	xor    %edx,%edx
80102c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    log.lh.block[i] = lh->block[i];
80102c20:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102c24:	83 c2 04             	add    $0x4,%edx
80102c27:	89 8a a8 30 11 80    	mov    %ecx,-0x7feecf58(%edx)
  for (i = 0; i < log.lh.n; i++) {
80102c2d:	39 d3                	cmp    %edx,%ebx
80102c2f:	75 ef                	jne    80102c20 <initlog+0x60>
  brelse(buf);
80102c31:	83 ec 0c             	sub    $0xc,%esp
80102c34:	50                   	push   %eax
80102c35:	e8 a6 d5 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102c3a:	e8 81 fe ff ff       	call   80102ac0 <install_trans>
  log.lh.n = 0;
80102c3f:	c7 05 a8 30 11 80 00 	movl   $0x0,0x801130a8
80102c46:	00 00 00 
  write_head(); // clear the log
80102c49:	e8 12 ff ff ff       	call   80102b60 <write_head>
}
80102c4e:	83 c4 10             	add    $0x10,%esp
80102c51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c54:	c9                   	leave  
80102c55:	c3                   	ret    
80102c56:	8d 76 00             	lea    0x0(%esi),%esi
80102c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c60 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102c60:	55                   	push   %ebp
80102c61:	89 e5                	mov    %esp,%ebp
80102c63:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102c66:	68 60 30 11 80       	push   $0x80113060
80102c6b:	e8 70 19 00 00       	call   801045e0 <acquire>
80102c70:	83 c4 10             	add    $0x10,%esp
80102c73:	eb 18                	jmp    80102c8d <begin_op+0x2d>
80102c75:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102c78:	83 ec 08             	sub    $0x8,%esp
80102c7b:	68 60 30 11 80       	push   $0x80113060
80102c80:	68 60 30 11 80       	push   $0x80113060
80102c85:	e8 c6 12 00 00       	call   80103f50 <sleep>
80102c8a:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102c8d:	a1 a0 30 11 80       	mov    0x801130a0,%eax
80102c92:	85 c0                	test   %eax,%eax
80102c94:	75 e2                	jne    80102c78 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102c96:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102c9b:	8b 15 a8 30 11 80    	mov    0x801130a8,%edx
80102ca1:	83 c0 01             	add    $0x1,%eax
80102ca4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102ca7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102caa:	83 fa 1e             	cmp    $0x1e,%edx
80102cad:	7f c9                	jg     80102c78 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102caf:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102cb2:	a3 9c 30 11 80       	mov    %eax,0x8011309c
      release(&log.lock);
80102cb7:	68 60 30 11 80       	push   $0x80113060
80102cbc:	e8 df 19 00 00       	call   801046a0 <release>
      break;
    }
  }
}
80102cc1:	83 c4 10             	add    $0x10,%esp
80102cc4:	c9                   	leave  
80102cc5:	c3                   	ret    
80102cc6:	8d 76 00             	lea    0x0(%esi),%esi
80102cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102cd0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102cd0:	55                   	push   %ebp
80102cd1:	89 e5                	mov    %esp,%ebp
80102cd3:	57                   	push   %edi
80102cd4:	56                   	push   %esi
80102cd5:	53                   	push   %ebx
80102cd6:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102cd9:	68 60 30 11 80       	push   $0x80113060
80102cde:	e8 fd 18 00 00       	call   801045e0 <acquire>
  log.outstanding -= 1;
80102ce3:	a1 9c 30 11 80       	mov    0x8011309c,%eax
  if(log.committing)
80102ce8:	8b 35 a0 30 11 80    	mov    0x801130a0,%esi
80102cee:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102cf1:	8d 58 ff             	lea    -0x1(%eax),%ebx
  if(log.committing)
80102cf4:	85 f6                	test   %esi,%esi
  log.outstanding -= 1;
80102cf6:	89 1d 9c 30 11 80    	mov    %ebx,0x8011309c
  if(log.committing)
80102cfc:	0f 85 1a 01 00 00    	jne    80102e1c <end_op+0x14c>
    panic("log.committing");
  if(log.outstanding == 0){
80102d02:	85 db                	test   %ebx,%ebx
80102d04:	0f 85 ee 00 00 00    	jne    80102df8 <end_op+0x128>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102d0a:	83 ec 0c             	sub    $0xc,%esp
    log.committing = 1;
80102d0d:	c7 05 a0 30 11 80 01 	movl   $0x1,0x801130a0
80102d14:	00 00 00 
  release(&log.lock);
80102d17:	68 60 30 11 80       	push   $0x80113060
80102d1c:	e8 7f 19 00 00       	call   801046a0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102d21:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102d27:	83 c4 10             	add    $0x10,%esp
80102d2a:	85 c9                	test   %ecx,%ecx
80102d2c:	0f 8e 85 00 00 00    	jle    80102db7 <end_op+0xe7>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102d32:	a1 94 30 11 80       	mov    0x80113094,%eax
80102d37:	83 ec 08             	sub    $0x8,%esp
80102d3a:	01 d8                	add    %ebx,%eax
80102d3c:	83 c0 01             	add    $0x1,%eax
80102d3f:	50                   	push   %eax
80102d40:	ff 35 a4 30 11 80    	pushl  0x801130a4
80102d46:	e8 85 d3 ff ff       	call   801000d0 <bread>
80102d4b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102d4d:	58                   	pop    %eax
80102d4e:	5a                   	pop    %edx
80102d4f:	ff 34 9d ac 30 11 80 	pushl  -0x7feecf54(,%ebx,4)
80102d56:	ff 35 a4 30 11 80    	pushl  0x801130a4
  for (tail = 0; tail < log.lh.n; tail++) {
80102d5c:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102d5f:	e8 6c d3 ff ff       	call   801000d0 <bread>
80102d64:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102d66:	8d 40 5c             	lea    0x5c(%eax),%eax
80102d69:	83 c4 0c             	add    $0xc,%esp
80102d6c:	68 00 02 00 00       	push   $0x200
80102d71:	50                   	push   %eax
80102d72:	8d 46 5c             	lea    0x5c(%esi),%eax
80102d75:	50                   	push   %eax
80102d76:	e8 25 1a 00 00       	call   801047a0 <memmove>
    bwrite(to);  // write the log
80102d7b:	89 34 24             	mov    %esi,(%esp)
80102d7e:	e8 1d d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102d83:	89 3c 24             	mov    %edi,(%esp)
80102d86:	e8 55 d4 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102d8b:	89 34 24             	mov    %esi,(%esp)
80102d8e:	e8 4d d4 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102d93:	83 c4 10             	add    $0x10,%esp
80102d96:	3b 1d a8 30 11 80    	cmp    0x801130a8,%ebx
80102d9c:	7c 94                	jl     80102d32 <end_op+0x62>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102d9e:	e8 bd fd ff ff       	call   80102b60 <write_head>
    install_trans(); // Now install writes to home locations
80102da3:	e8 18 fd ff ff       	call   80102ac0 <install_trans>
    log.lh.n = 0;
80102da8:	c7 05 a8 30 11 80 00 	movl   $0x0,0x801130a8
80102daf:	00 00 00 
    write_head();    // Erase the transaction from the log
80102db2:	e8 a9 fd ff ff       	call   80102b60 <write_head>
    acquire(&log.lock);
80102db7:	83 ec 0c             	sub    $0xc,%esp
80102dba:	68 60 30 11 80       	push   $0x80113060
80102dbf:	e8 1c 18 00 00       	call   801045e0 <acquire>
    wakeup(&log);
80102dc4:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
    log.committing = 0;
80102dcb:	c7 05 a0 30 11 80 00 	movl   $0x0,0x801130a0
80102dd2:	00 00 00 
    wakeup(&log);
80102dd5:	e8 36 13 00 00       	call   80104110 <wakeup>
    release(&log.lock);
80102dda:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102de1:	e8 ba 18 00 00       	call   801046a0 <release>
80102de6:	83 c4 10             	add    $0x10,%esp
}
80102de9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dec:	5b                   	pop    %ebx
80102ded:	5e                   	pop    %esi
80102dee:	5f                   	pop    %edi
80102def:	5d                   	pop    %ebp
80102df0:	c3                   	ret    
80102df1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&log);
80102df8:	83 ec 0c             	sub    $0xc,%esp
80102dfb:	68 60 30 11 80       	push   $0x80113060
80102e00:	e8 0b 13 00 00       	call   80104110 <wakeup>
  release(&log.lock);
80102e05:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102e0c:	e8 8f 18 00 00       	call   801046a0 <release>
80102e11:	83 c4 10             	add    $0x10,%esp
}
80102e14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e17:	5b                   	pop    %ebx
80102e18:	5e                   	pop    %esi
80102e19:	5f                   	pop    %edi
80102e1a:	5d                   	pop    %ebp
80102e1b:	c3                   	ret    
    panic("log.committing");
80102e1c:	83 ec 0c             	sub    $0xc,%esp
80102e1f:	68 c4 78 10 80       	push   $0x801078c4
80102e24:	e8 67 d5 ff ff       	call   80100390 <panic>
80102e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e30 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	53                   	push   %ebx
80102e34:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102e37:	8b 15 a8 30 11 80    	mov    0x801130a8,%edx
{
80102e3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102e40:	83 fa 1d             	cmp    $0x1d,%edx
80102e43:	0f 8f 9d 00 00 00    	jg     80102ee6 <log_write+0xb6>
80102e49:	a1 98 30 11 80       	mov    0x80113098,%eax
80102e4e:	83 e8 01             	sub    $0x1,%eax
80102e51:	39 c2                	cmp    %eax,%edx
80102e53:	0f 8d 8d 00 00 00    	jge    80102ee6 <log_write+0xb6>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102e59:	a1 9c 30 11 80       	mov    0x8011309c,%eax
80102e5e:	85 c0                	test   %eax,%eax
80102e60:	0f 8e 8d 00 00 00    	jle    80102ef3 <log_write+0xc3>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102e66:	83 ec 0c             	sub    $0xc,%esp
80102e69:	68 60 30 11 80       	push   $0x80113060
80102e6e:	e8 6d 17 00 00       	call   801045e0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102e73:	8b 0d a8 30 11 80    	mov    0x801130a8,%ecx
80102e79:	83 c4 10             	add    $0x10,%esp
80102e7c:	83 f9 00             	cmp    $0x0,%ecx
80102e7f:	7e 57                	jle    80102ed8 <log_write+0xa8>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e81:	8b 53 08             	mov    0x8(%ebx),%edx
  for (i = 0; i < log.lh.n; i++) {
80102e84:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e86:	3b 15 ac 30 11 80    	cmp    0x801130ac,%edx
80102e8c:	75 0b                	jne    80102e99 <log_write+0x69>
80102e8e:	eb 38                	jmp    80102ec8 <log_write+0x98>
80102e90:	39 14 85 ac 30 11 80 	cmp    %edx,-0x7feecf54(,%eax,4)
80102e97:	74 2f                	je     80102ec8 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80102e99:	83 c0 01             	add    $0x1,%eax
80102e9c:	39 c1                	cmp    %eax,%ecx
80102e9e:	75 f0                	jne    80102e90 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80102ea0:	89 14 85 ac 30 11 80 	mov    %edx,-0x7feecf54(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
80102ea7:	83 c0 01             	add    $0x1,%eax
80102eaa:	a3 a8 30 11 80       	mov    %eax,0x801130a8
  b->flags |= B_DIRTY; // prevent eviction
80102eaf:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102eb2:	c7 45 08 60 30 11 80 	movl   $0x80113060,0x8(%ebp)
}
80102eb9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ebc:	c9                   	leave  
  release(&log.lock);
80102ebd:	e9 de 17 00 00       	jmp    801046a0 <release>
80102ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80102ec8:	89 14 85 ac 30 11 80 	mov    %edx,-0x7feecf54(,%eax,4)
80102ecf:	eb de                	jmp    80102eaf <log_write+0x7f>
80102ed1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ed8:	8b 43 08             	mov    0x8(%ebx),%eax
80102edb:	a3 ac 30 11 80       	mov    %eax,0x801130ac
  if (i == log.lh.n)
80102ee0:	75 cd                	jne    80102eaf <log_write+0x7f>
80102ee2:	31 c0                	xor    %eax,%eax
80102ee4:	eb c1                	jmp    80102ea7 <log_write+0x77>
    panic("too big a transaction");
80102ee6:	83 ec 0c             	sub    $0xc,%esp
80102ee9:	68 d3 78 10 80       	push   $0x801078d3
80102eee:	e8 9d d4 ff ff       	call   80100390 <panic>
    panic("log_write outside of trans");
80102ef3:	83 ec 0c             	sub    $0xc,%esp
80102ef6:	68 e9 78 10 80       	push   $0x801078e9
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
80102f18:	68 04 79 10 80       	push   $0x80107904
80102f1d:	e8 3e d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102f22:	e8 39 2b 00 00       	call   80105a60 <idtinit>
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
80102f46:	e8 05 3c 00 00       	call   80106b50 <switchkvm>
  seginit();
80102f4b:	e8 70 3b 00 00       	call   80106ac0 <seginit>
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
80102f81:	e8 9a 40 00 00       	call   80107020 <kvmalloc>
  mpinit();        // detect other processors
80102f86:	e8 75 01 00 00       	call   80103100 <mpinit>
  lapicinit();     // interrupt controller
80102f8b:	e8 10 f7 ff ff       	call   801026a0 <lapicinit>
  seginit();       // segment descriptors
80102f90:	e8 2b 3b 00 00       	call   80106ac0 <seginit>
  picinit();       // disable pic
80102f95:	e8 46 03 00 00       	call   801032e0 <picinit>
  ioapicinit();    // another interrupt controller
80102f9a:	e8 f1 f2 ff ff       	call   80102290 <ioapicinit>
  consoleinit();   // console hardware
80102f9f:	e8 5c da ff ff       	call   80100a00 <consoleinit>
  uartinit();      // serial port
80102fa4:	e8 e7 2d 00 00       	call   80105d90 <uartinit>
  pinit();         // process table
80102fa9:	e8 52 08 00 00       	call   80103800 <pinit>
  tvinit();        // trap vectors
80102fae:	e8 2d 2a 00 00       	call   801059e0 <tvinit>
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
80102fd4:	e8 c7 17 00 00       	call   801047a0 <memmove>

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
801030ae:	68 18 79 10 80       	push   $0x80107918
801030b3:	56                   	push   %esi
801030b4:	e8 87 16 00 00       	call   80104740 <memcmp>
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
8010316c:	68 35 79 10 80       	push   $0x80107935
80103171:	56                   	push   %esi
80103172:	e8 c9 15 00 00       	call   80104740 <memcmp>
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
80103200:	ff 24 95 5c 79 10 80 	jmp    *-0x7fef86a4(,%edx,4)
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
801032b3:	68 1d 79 10 80       	push   $0x8010791d
801032b8:	e8 d3 d0 ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
801032bd:	83 ec 0c             	sub    $0xc,%esp
801032c0:	68 3c 79 10 80       	push   $0x8010793c
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
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
801032e0:	55                   	push   %ebp
801032e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032e6:	ba 21 00 00 00       	mov    $0x21,%edx
801032eb:	89 e5                	mov    %esp,%ebp
801032ed:	ee                   	out    %al,(%dx)
801032ee:	ba a1 00 00 00       	mov    $0xa1,%edx
801032f3:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
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
801033bb:	68 70 79 10 80       	push   $0x80107970
801033c0:	50                   	push   %eax
801033c1:	e8 da 10 00 00       	call   801044a0 <initlock>
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
8010341f:	e8 bc 11 00 00       	call   801045e0 <acquire>
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
8010343f:	e8 cc 0c 00 00       	call   80104110 <wakeup>
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
80103464:	e9 37 12 00 00       	jmp    801046a0 <release>
80103469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
80103470:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103476:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
80103479:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103480:	00 00 00 
    wakeup(&p->nwrite);
80103483:	50                   	push   %eax
80103484:	e8 87 0c 00 00       	call   80104110 <wakeup>
80103489:	83 c4 10             	add    $0x10,%esp
8010348c:	eb b9                	jmp    80103447 <pipeclose+0x37>
8010348e:	66 90                	xchg   %ax,%ax
    release(&p->lock);
80103490:	83 ec 0c             	sub    $0xc,%esp
80103493:	53                   	push   %ebx
80103494:	e8 07 12 00 00       	call   801046a0 <release>
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
801034bd:	e8 1e 11 00 00       	call   801045e0 <acquire>
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
80103514:	e8 f7 0b 00 00       	call   80104110 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103519:	5a                   	pop    %edx
8010351a:	59                   	pop    %ecx
8010351b:	53                   	push   %ebx
8010351c:	56                   	push   %esi
8010351d:	e8 2e 0a 00 00       	call   80103f50 <sleep>
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
80103554:	e8 47 11 00 00       	call   801046a0 <release>
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
801035a3:	e8 68 0b 00 00       	call   80104110 <wakeup>
  release(&p->lock);
801035a8:	89 1c 24             	mov    %ebx,(%esp)
801035ab:	e8 f0 10 00 00       	call   801046a0 <release>
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
801035d0:	e8 0b 10 00 00       	call   801045e0 <acquire>
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
80103605:	e8 46 09 00 00       	call   80103f50 <sleep>
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
8010363e:	e8 5d 10 00 00       	call   801046a0 <release>
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
80103697:	e8 74 0a 00 00       	call   80104110 <wakeup>
  release(&p->lock);
8010369c:	89 34 24             	mov    %esi,(%esp)
8010369f:	e8 fc 0f 00 00       	call   801046a0 <release>
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
801036d1:	e8 0a 0f 00 00       	call   801045e0 <acquire>
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
8010372a:	e8 71 0f 00 00       	call   801046a0 <release>

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
8010374f:	c7 40 14 d1 59 10 80 	movl   $0x801059d1,0x14(%eax)
  p->context = (struct context*)sp;
80103756:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103759:	6a 14                	push   $0x14
8010375b:	6a 00                	push   $0x0
8010375d:	50                   	push   %eax
8010375e:	e8 8d 0f 00 00       	call   801046f0 <memset>
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
8010378a:	e8 11 0f 00 00       	call   801046a0 <release>
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
801037bb:	e8 e0 0e 00 00       	call   801046a0 <release>

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
80103806:	68 75 79 10 80       	push   $0x80107975
8010380b:	68 00 37 11 80       	push   $0x80113700
80103810:	e8 8b 0c 00 00       	call   801044a0 <initlock>
  sgenrand(unixtime());
80103815:	e8 56 f2 ff ff       	call   80102a70 <unixtime>
8010381a:	89 04 24             	mov    %eax,(%esp)
8010381d:	e8 1e 3a 00 00       	call   80107240 <sgenrand>
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
80103890:	68 7c 79 10 80       	push   $0x8010797c
80103895:	e8 f6 ca ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
8010389a:	83 ec 0c             	sub    $0xc,%esp
8010389d:	68 5c 7a 10 80       	push   $0x80107a5c
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
801038d7:	e8 34 0c 00 00       	call   80104510 <pushcli>
  c = mycpu();
801038dc:	e8 4f ff ff ff       	call   80103830 <mycpu>
  p = c->proc;
801038e1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038e7:	e8 64 0c 00 00       	call   80104550 <popcli>
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
80103913:	e8 88 36 00 00       	call   80106fa0 <setupkvm>
80103918:	85 c0                	test   %eax,%eax
8010391a:	89 43 04             	mov    %eax,0x4(%ebx)
8010391d:	0f 84 bd 00 00 00    	je     801039e0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103923:	83 ec 04             	sub    $0x4,%esp
80103926:	68 2c 00 00 00       	push   $0x2c
8010392b:	68 64 a4 10 80       	push   $0x8010a464
80103930:	50                   	push   %eax
80103931:	e8 4a 33 00 00       	call   80106c80 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103936:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103939:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010393f:	6a 4c                	push   $0x4c
80103941:	6a 00                	push   $0x0
80103943:	ff 73 18             	pushl  0x18(%ebx)
80103946:	e8 a5 0d 00 00       	call   801046f0 <memset>
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
8010399f:	68 a5 79 10 80       	push   $0x801079a5
801039a4:	50                   	push   %eax
801039a5:	e8 26 0f 00 00       	call   801048d0 <safestrcpy>
  p->cwd = namei("/");
801039aa:	c7 04 24 ae 79 10 80 	movl   $0x801079ae,(%esp)
801039b1:	e8 9a e5 ff ff       	call   80101f50 <namei>
801039b6:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
801039b9:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
801039c0:	e8 1b 0c 00 00       	call   801045e0 <acquire>
  p->state = RUNNABLE;
801039c5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
801039cc:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
801039d3:	e8 c8 0c 00 00       	call   801046a0 <release>
}
801039d8:	83 c4 10             	add    $0x10,%esp
801039db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039de:	c9                   	leave  
801039df:	c3                   	ret    
    panic("userinit: out of memory?");
801039e0:	83 ec 0c             	sub    $0xc,%esp
801039e3:	68 8c 79 10 80       	push   $0x8010798c
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
801039f8:	e8 13 0b 00 00       	call   80104510 <pushcli>
  c = mycpu();
801039fd:	e8 2e fe ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103a02:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a08:	e8 43 0b 00 00       	call   80104550 <popcli>
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
80103a1c:	e8 4f 31 00 00       	call   80106b70 <switchuvm>
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
80103a3a:	e8 81 33 00 00       	call   80106dc0 <allocuvm>
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
80103a5a:	e8 91 34 00 00       	call   80106ef0 <deallocuvm>
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
80103a79:	e8 92 0a 00 00       	call   80104510 <pushcli>
  c = mycpu();
80103a7e:	e8 ad fd ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103a83:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a89:	e8 c2 0a 00 00       	call   80104550 <popcli>
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
80103aa8:	e8 c3 35 00 00       	call   80107070 <copyuvm>
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
80103b21:	e8 aa 0d 00 00       	call   801048d0 <safestrcpy>
  pid = np->pid;
80103b26:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103b29:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b30:	e8 ab 0a 00 00       	call   801045e0 <acquire>
  np->state = RUNNABLE;
80103b35:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103b3c:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b43:	e8 58 0b 00 00       	call   801046a0 <release>
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
  long counter = 0;
80103bc6:	31 ff                	xor    %edi,%edi
  long total_tickets = 0;
80103bc8:	31 f6                	xor    %esi,%esi
{
80103bca:	83 ec 2c             	sub    $0x2c,%esp
  struct cpu *c = mycpu();
80103bcd:	e8 5e fc ff ff       	call   80103830 <mycpu>
  int got_total = 0; // 0 is False, 1 is True
80103bd2:	31 d2                	xor    %edx,%edx
  c->proc = 0;
80103bd4:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103bdb:	00 00 00 
  struct cpu *c = mycpu();
80103bde:	89 45 d8             	mov    %eax,-0x28(%ebp)
80103be1:	83 c0 04             	add    $0x4,%eax
  int winner_found = 0;
80103be4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  long winner = 0;
80103beb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80103bf2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80103bf5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80103bf8:	e9 8c 00 00 00       	jmp    80103c89 <scheduler+0xc9>
80103bfd:	8d 76 00             	lea    0x0(%esi),%esi
      if (got_total == 0) {
80103c00:	85 d2                	test   %edx,%edx
80103c02:	8b 43 7c             	mov    0x7c(%ebx),%eax
80103c05:	0f 84 c5 00 00 00    	je     80103cd0 <scheduler+0x110>
      counter += p->tickets;
80103c0b:	01 c7                	add    %eax,%edi
      if (counter < winner) {
80103c0d:	39 7d e0             	cmp    %edi,-0x20(%ebp)
80103c10:	0f 8f ba 00 00 00    	jg     80103cd0 <scheduler+0x110>
      if (winner_found) {
80103c16:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80103c19:	85 c9                	test   %ecx,%ecx
80103c1b:	0f 85 af 00 00 00    	jne    80103cd0 <scheduler+0x110>
      c->proc = p;
80103c21:	8b 45 d8             	mov    -0x28(%ebp),%eax
      switchuvm(p);
80103c24:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103c27:	89 98 ac 00 00 00    	mov    %ebx,0xac(%eax)
      switchuvm(p);
80103c2d:	53                   	push   %ebx
80103c2e:	e8 3d 2f 00 00       	call   80106b70 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103c33:	58                   	pop    %eax
80103c34:	5a                   	pop    %edx
80103c35:	ff 73 1c             	pushl  0x1c(%ebx)
80103c38:	ff 75 d4             	pushl  -0x2c(%ebp)
      p->state = RUNNING;
80103c3b:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&(c->scheduler), p->context);
80103c42:	e8 e4 0c 00 00       	call   8010492b <swtch>
      switchkvm();
80103c47:	e8 04 2f 00 00       	call   80106b50 <switchkvm>
      if (p->state == RUNNABLE) {
80103c4c:	83 c4 10             	add    $0x10,%esp
80103c4f:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c53:	75 10                	jne    80103c65 <scheduler+0xa5>
      winner_found = 1;
80103c55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
            total_tickets += p->tickets;
80103c58:	03 73 7c             	add    0x7c(%ebx),%esi
      p->ticks += 1;
80103c5b:	83 83 80 00 00 00 01 	addl   $0x1,0x80(%ebx)
      winner_found = 1;
80103c62:	89 45 dc             	mov    %eax,-0x24(%ebp)
      c->proc = 0;
80103c65:	8b 45 d8             	mov    -0x28(%ebp),%eax
80103c68:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103c6f:	00 00 00 
    release(&ptable.lock);
80103c72:	83 ec 0c             	sub    $0xc,%esp
80103c75:	68 00 37 11 80       	push   $0x80113700
80103c7a:	e8 21 0a 00 00       	call   801046a0 <release>
    got_total = 1;
80103c7f:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    sti();
80103c86:	83 c4 10             	add    $0x10,%esp
  asm volatile("sti");
80103c89:	fb                   	sti    
    if (got_total == 1) {
80103c8a:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
80103c8e:	74 58                	je     80103ce8 <scheduler+0x128>
    acquire(&ptable.lock);
80103c90:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c93:	bb 34 37 11 80       	mov    $0x80113734,%ebx
    acquire(&ptable.lock);
80103c98:	68 00 37 11 80       	push   $0x80113700
80103c9d:	e8 3e 09 00 00       	call   801045e0 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ca2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    acquire(&ptable.lock);
80103ca5:	83 c4 10             	add    $0x10,%esp
80103ca8:	90                   	nop
80103ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->state != RUNNABLE) {
80103cb0:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103cb4:	0f 84 46 ff ff ff    	je     80103c00 <scheduler+0x40>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cba:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103cc0:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
80103cc6:	72 e8                	jb     80103cb0 <scheduler+0xf0>
80103cc8:	eb a8                	jmp    80103c72 <scheduler+0xb2>
80103cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cd0:	81 c3 84 00 00 00    	add    $0x84,%ebx
            total_tickets += p->tickets;
80103cd6:	01 c6                	add    %eax,%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cd8:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
80103cde:	72 d0                	jb     80103cb0 <scheduler+0xf0>
80103ce0:	eb 90                	jmp    80103c72 <scheduler+0xb2>
80103ce2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
         winner = random_at_most(total_tickets);
80103ce8:	83 ec 0c             	sub    $0xc,%esp
         counter = 0;
80103ceb:	31 ff                	xor    %edi,%edi
         winner = random_at_most(total_tickets);
80103ced:	56                   	push   %esi
         total_tickets = 0;
80103cee:	31 f6                	xor    %esi,%esi
         winner = random_at_most(total_tickets);
80103cf0:	e8 db 36 00 00       	call   801073d0 <random_at_most>
80103cf5:	83 c4 10             	add    $0x10,%esp
80103cf8:	89 45 e0             	mov    %eax,-0x20(%ebp)
         winner_found = 0;
80103cfb:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80103d02:	eb 8c                	jmp    80103c90 <scheduler+0xd0>
80103d04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d10 <sched>:
{
80103d10:	55                   	push   %ebp
80103d11:	89 e5                	mov    %esp,%ebp
80103d13:	56                   	push   %esi
80103d14:	53                   	push   %ebx
  pushcli();
80103d15:	e8 f6 07 00 00       	call   80104510 <pushcli>
  c = mycpu();
80103d1a:	e8 11 fb ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103d1f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d25:	e8 26 08 00 00       	call   80104550 <popcli>
  if(!holding(&ptable.lock))
80103d2a:	83 ec 0c             	sub    $0xc,%esp
80103d2d:	68 00 37 11 80       	push   $0x80113700
80103d32:	e8 79 08 00 00       	call   801045b0 <holding>
80103d37:	83 c4 10             	add    $0x10,%esp
80103d3a:	85 c0                	test   %eax,%eax
80103d3c:	74 4f                	je     80103d8d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103d3e:	e8 ed fa ff ff       	call   80103830 <mycpu>
80103d43:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103d4a:	75 68                	jne    80103db4 <sched+0xa4>
  if(p->state == RUNNING)
80103d4c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103d50:	74 55                	je     80103da7 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103d52:	9c                   	pushf  
80103d53:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103d54:	f6 c4 02             	test   $0x2,%ah
80103d57:	75 41                	jne    80103d9a <sched+0x8a>
  intena = mycpu()->intena;
80103d59:	e8 d2 fa ff ff       	call   80103830 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103d5e:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103d61:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103d67:	e8 c4 fa ff ff       	call   80103830 <mycpu>
80103d6c:	83 ec 08             	sub    $0x8,%esp
80103d6f:	ff 70 04             	pushl  0x4(%eax)
80103d72:	53                   	push   %ebx
80103d73:	e8 b3 0b 00 00       	call   8010492b <swtch>
  mycpu()->intena = intena;
80103d78:	e8 b3 fa ff ff       	call   80103830 <mycpu>
}
80103d7d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103d80:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103d86:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103d89:	5b                   	pop    %ebx
80103d8a:	5e                   	pop    %esi
80103d8b:	5d                   	pop    %ebp
80103d8c:	c3                   	ret    
    panic("sched ptable.lock");
80103d8d:	83 ec 0c             	sub    $0xc,%esp
80103d90:	68 b0 79 10 80       	push   $0x801079b0
80103d95:	e8 f6 c5 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103d9a:	83 ec 0c             	sub    $0xc,%esp
80103d9d:	68 dc 79 10 80       	push   $0x801079dc
80103da2:	e8 e9 c5 ff ff       	call   80100390 <panic>
    panic("sched running");
80103da7:	83 ec 0c             	sub    $0xc,%esp
80103daa:	68 ce 79 10 80       	push   $0x801079ce
80103daf:	e8 dc c5 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103db4:	83 ec 0c             	sub    $0xc,%esp
80103db7:	68 c2 79 10 80       	push   $0x801079c2
80103dbc:	e8 cf c5 ff ff       	call   80100390 <panic>
80103dc1:	eb 0d                	jmp    80103dd0 <exit>
80103dc3:	90                   	nop
80103dc4:	90                   	nop
80103dc5:	90                   	nop
80103dc6:	90                   	nop
80103dc7:	90                   	nop
80103dc8:	90                   	nop
80103dc9:	90                   	nop
80103dca:	90                   	nop
80103dcb:	90                   	nop
80103dcc:	90                   	nop
80103dcd:	90                   	nop
80103dce:	90                   	nop
80103dcf:	90                   	nop

80103dd0 <exit>:
{
80103dd0:	55                   	push   %ebp
80103dd1:	89 e5                	mov    %esp,%ebp
80103dd3:	57                   	push   %edi
80103dd4:	56                   	push   %esi
80103dd5:	53                   	push   %ebx
80103dd6:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103dd9:	e8 32 07 00 00       	call   80104510 <pushcli>
  c = mycpu();
80103dde:	e8 4d fa ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103de3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103de9:	e8 62 07 00 00       	call   80104550 <popcli>
  if(curproc == initproc)
80103dee:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103df4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103df7:	8d 7e 68             	lea    0x68(%esi),%edi
80103dfa:	0f 84 f1 00 00 00    	je     80103ef1 <exit+0x121>
    if(curproc->ofile[fd]){
80103e00:	8b 03                	mov    (%ebx),%eax
80103e02:	85 c0                	test   %eax,%eax
80103e04:	74 12                	je     80103e18 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103e06:	83 ec 0c             	sub    $0xc,%esp
80103e09:	50                   	push   %eax
80103e0a:	e8 a1 d0 ff ff       	call   80100eb0 <fileclose>
      curproc->ofile[fd] = 0;
80103e0f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103e15:	83 c4 10             	add    $0x10,%esp
80103e18:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103e1b:	39 fb                	cmp    %edi,%ebx
80103e1d:	75 e1                	jne    80103e00 <exit+0x30>
  begin_op();
80103e1f:	e8 3c ee ff ff       	call   80102c60 <begin_op>
  iput(curproc->cwd);
80103e24:	83 ec 0c             	sub    $0xc,%esp
80103e27:	ff 76 68             	pushl  0x68(%esi)
80103e2a:	e8 f1 d9 ff ff       	call   80101820 <iput>
  end_op();
80103e2f:	e8 9c ee ff ff       	call   80102cd0 <end_op>
  curproc->cwd = 0;
80103e34:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103e3b:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103e42:	e8 99 07 00 00       	call   801045e0 <acquire>
  wakeup1(curproc->parent);
80103e47:	8b 56 14             	mov    0x14(%esi),%edx
80103e4a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e4d:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103e52:	eb 10                	jmp    80103e64 <exit+0x94>
80103e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e58:	05 84 00 00 00       	add    $0x84,%eax
80103e5d:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80103e62:	73 1e                	jae    80103e82 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103e64:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e68:	75 ee                	jne    80103e58 <exit+0x88>
80103e6a:	3b 50 20             	cmp    0x20(%eax),%edx
80103e6d:	75 e9                	jne    80103e58 <exit+0x88>
      p->state = RUNNABLE;
80103e6f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e76:	05 84 00 00 00       	add    $0x84,%eax
80103e7b:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80103e80:	72 e2                	jb     80103e64 <exit+0x94>
      p->parent = initproc;
80103e82:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e88:	ba 34 37 11 80       	mov    $0x80113734,%edx
80103e8d:	eb 0f                	jmp    80103e9e <exit+0xce>
80103e8f:	90                   	nop
80103e90:	81 c2 84 00 00 00    	add    $0x84,%edx
80103e96:	81 fa 34 58 11 80    	cmp    $0x80115834,%edx
80103e9c:	73 3a                	jae    80103ed8 <exit+0x108>
    if(p->parent == curproc){
80103e9e:	39 72 14             	cmp    %esi,0x14(%edx)
80103ea1:	75 ed                	jne    80103e90 <exit+0xc0>
      if(p->state == ZOMBIE)
80103ea3:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103ea7:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103eaa:	75 e4                	jne    80103e90 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103eac:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103eb1:	eb 11                	jmp    80103ec4 <exit+0xf4>
80103eb3:	90                   	nop
80103eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103eb8:	05 84 00 00 00       	add    $0x84,%eax
80103ebd:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80103ec2:	73 cc                	jae    80103e90 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103ec4:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103ec8:	75 ee                	jne    80103eb8 <exit+0xe8>
80103eca:	3b 48 20             	cmp    0x20(%eax),%ecx
80103ecd:	75 e9                	jne    80103eb8 <exit+0xe8>
      p->state = RUNNABLE;
80103ecf:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103ed6:	eb e0                	jmp    80103eb8 <exit+0xe8>
  curproc->state = ZOMBIE;
80103ed8:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103edf:	e8 2c fe ff ff       	call   80103d10 <sched>
  panic("zombie exit");
80103ee4:	83 ec 0c             	sub    $0xc,%esp
80103ee7:	68 fd 79 10 80       	push   $0x801079fd
80103eec:	e8 9f c4 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103ef1:	83 ec 0c             	sub    $0xc,%esp
80103ef4:	68 f0 79 10 80       	push   $0x801079f0
80103ef9:	e8 92 c4 ff ff       	call   80100390 <panic>
80103efe:	66 90                	xchg   %ax,%ax

80103f00 <yield>:
{
80103f00:	55                   	push   %ebp
80103f01:	89 e5                	mov    %esp,%ebp
80103f03:	53                   	push   %ebx
80103f04:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103f07:	68 00 37 11 80       	push   $0x80113700
80103f0c:	e8 cf 06 00 00       	call   801045e0 <acquire>
  pushcli();
80103f11:	e8 fa 05 00 00       	call   80104510 <pushcli>
  c = mycpu();
80103f16:	e8 15 f9 ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103f1b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103f21:	e8 2a 06 00 00       	call   80104550 <popcli>
  myproc()->state = RUNNABLE;
80103f26:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103f2d:	e8 de fd ff ff       	call   80103d10 <sched>
  release(&ptable.lock);
80103f32:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103f39:	e8 62 07 00 00       	call   801046a0 <release>
}
80103f3e:	83 c4 10             	add    $0x10,%esp
80103f41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f44:	c9                   	leave  
80103f45:	c3                   	ret    
80103f46:	8d 76 00             	lea    0x0(%esi),%esi
80103f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f50 <sleep>:
{
80103f50:	55                   	push   %ebp
80103f51:	89 e5                	mov    %esp,%ebp
80103f53:	57                   	push   %edi
80103f54:	56                   	push   %esi
80103f55:	53                   	push   %ebx
80103f56:	83 ec 0c             	sub    $0xc,%esp
80103f59:	8b 7d 08             	mov    0x8(%ebp),%edi
80103f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103f5f:	e8 ac 05 00 00       	call   80104510 <pushcli>
  c = mycpu();
80103f64:	e8 c7 f8 ff ff       	call   80103830 <mycpu>
  p = c->proc;
80103f69:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103f6f:	e8 dc 05 00 00       	call   80104550 <popcli>
  if(p == 0)
80103f74:	85 db                	test   %ebx,%ebx
80103f76:	0f 84 87 00 00 00    	je     80104003 <sleep+0xb3>
  if(lk == 0)
80103f7c:	85 f6                	test   %esi,%esi
80103f7e:	74 76                	je     80103ff6 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103f80:	81 fe 00 37 11 80    	cmp    $0x80113700,%esi
80103f86:	74 50                	je     80103fd8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103f88:	83 ec 0c             	sub    $0xc,%esp
80103f8b:	68 00 37 11 80       	push   $0x80113700
80103f90:	e8 4b 06 00 00       	call   801045e0 <acquire>
    release(lk);
80103f95:	89 34 24             	mov    %esi,(%esp)
80103f98:	e8 03 07 00 00       	call   801046a0 <release>
  p->chan = chan;
80103f9d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103fa0:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103fa7:	e8 64 fd ff ff       	call   80103d10 <sched>
  p->chan = 0;
80103fac:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103fb3:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103fba:	e8 e1 06 00 00       	call   801046a0 <release>
    acquire(lk);
80103fbf:	89 75 08             	mov    %esi,0x8(%ebp)
80103fc2:	83 c4 10             	add    $0x10,%esp
}
80103fc5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103fc8:	5b                   	pop    %ebx
80103fc9:	5e                   	pop    %esi
80103fca:	5f                   	pop    %edi
80103fcb:	5d                   	pop    %ebp
    acquire(lk);
80103fcc:	e9 0f 06 00 00       	jmp    801045e0 <acquire>
80103fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103fd8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103fdb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103fe2:	e8 29 fd ff ff       	call   80103d10 <sched>
  p->chan = 0;
80103fe7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103fee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103ff1:	5b                   	pop    %ebx
80103ff2:	5e                   	pop    %esi
80103ff3:	5f                   	pop    %edi
80103ff4:	5d                   	pop    %ebp
80103ff5:	c3                   	ret    
    panic("sleep without lk");
80103ff6:	83 ec 0c             	sub    $0xc,%esp
80103ff9:	68 0f 7a 10 80       	push   $0x80107a0f
80103ffe:	e8 8d c3 ff ff       	call   80100390 <panic>
    panic("sleep");
80104003:	83 ec 0c             	sub    $0xc,%esp
80104006:	68 09 7a 10 80       	push   $0x80107a09
8010400b:	e8 80 c3 ff ff       	call   80100390 <panic>

80104010 <wait>:
{
80104010:	55                   	push   %ebp
80104011:	89 e5                	mov    %esp,%ebp
80104013:	56                   	push   %esi
80104014:	53                   	push   %ebx
  pushcli();
80104015:	e8 f6 04 00 00       	call   80104510 <pushcli>
  c = mycpu();
8010401a:	e8 11 f8 ff ff       	call   80103830 <mycpu>
  p = c->proc;
8010401f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80104025:	e8 26 05 00 00       	call   80104550 <popcli>
  acquire(&ptable.lock);
8010402a:	83 ec 0c             	sub    $0xc,%esp
8010402d:	68 00 37 11 80       	push   $0x80113700
80104032:	e8 a9 05 00 00       	call   801045e0 <acquire>
80104037:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
8010403a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010403c:	bb 34 37 11 80       	mov    $0x80113734,%ebx
80104041:	eb 13                	jmp    80104056 <wait+0x46>
80104043:	90                   	nop
80104044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104048:	81 c3 84 00 00 00    	add    $0x84,%ebx
8010404e:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
80104054:	73 1e                	jae    80104074 <wait+0x64>
      if(p->parent != curproc)
80104056:	39 73 14             	cmp    %esi,0x14(%ebx)
80104059:	75 ed                	jne    80104048 <wait+0x38>
      if(p->state == ZOMBIE){
8010405b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010405f:	74 37                	je     80104098 <wait+0x88>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104061:	81 c3 84 00 00 00    	add    $0x84,%ebx
      havekids = 1;
80104067:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010406c:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
80104072:	72 e2                	jb     80104056 <wait+0x46>
    if(!havekids || curproc->killed){
80104074:	85 c0                	test   %eax,%eax
80104076:	74 76                	je     801040ee <wait+0xde>
80104078:	8b 46 24             	mov    0x24(%esi),%eax
8010407b:	85 c0                	test   %eax,%eax
8010407d:	75 6f                	jne    801040ee <wait+0xde>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
8010407f:	83 ec 08             	sub    $0x8,%esp
80104082:	68 00 37 11 80       	push   $0x80113700
80104087:	56                   	push   %esi
80104088:	e8 c3 fe ff ff       	call   80103f50 <sleep>
    havekids = 0;
8010408d:	83 c4 10             	add    $0x10,%esp
80104090:	eb a8                	jmp    8010403a <wait+0x2a>
80104092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        kfree(p->kstack);
80104098:	83 ec 0c             	sub    $0xc,%esp
8010409b:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
8010409e:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
801040a1:	e8 da e2 ff ff       	call   80102380 <kfree>
        freevm(p->pgdir);
801040a6:	5a                   	pop    %edx
801040a7:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
801040aa:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
801040b1:	e8 6a 2e 00 00       	call   80106f20 <freevm>
        release(&ptable.lock);
801040b6:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
        p->pid = 0;
801040bd:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
801040c4:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
801040cb:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
801040cf:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
801040d6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
801040dd:	e8 be 05 00 00       	call   801046a0 <release>
        return pid;
801040e2:	83 c4 10             	add    $0x10,%esp
}
801040e5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040e8:	89 f0                	mov    %esi,%eax
801040ea:	5b                   	pop    %ebx
801040eb:	5e                   	pop    %esi
801040ec:	5d                   	pop    %ebp
801040ed:	c3                   	ret    
      release(&ptable.lock);
801040ee:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801040f1:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
801040f6:	68 00 37 11 80       	push   $0x80113700
801040fb:	e8 a0 05 00 00       	call   801046a0 <release>
      return -1;
80104100:	83 c4 10             	add    $0x10,%esp
80104103:	eb e0                	jmp    801040e5 <wait+0xd5>
80104105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104110 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104110:	55                   	push   %ebp
80104111:	89 e5                	mov    %esp,%ebp
80104113:	53                   	push   %ebx
80104114:	83 ec 10             	sub    $0x10,%esp
80104117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010411a:	68 00 37 11 80       	push   $0x80113700
8010411f:	e8 bc 04 00 00       	call   801045e0 <acquire>
80104124:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104127:	b8 34 37 11 80       	mov    $0x80113734,%eax
8010412c:	eb 0e                	jmp    8010413c <wakeup+0x2c>
8010412e:	66 90                	xchg   %ax,%ax
80104130:	05 84 00 00 00       	add    $0x84,%eax
80104135:	3d 34 58 11 80       	cmp    $0x80115834,%eax
8010413a:	73 1e                	jae    8010415a <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
8010413c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104140:	75 ee                	jne    80104130 <wakeup+0x20>
80104142:	3b 58 20             	cmp    0x20(%eax),%ebx
80104145:	75 e9                	jne    80104130 <wakeup+0x20>
      p->state = RUNNABLE;
80104147:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010414e:	05 84 00 00 00       	add    $0x84,%eax
80104153:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80104158:	72 e2                	jb     8010413c <wakeup+0x2c>
  wakeup1(chan);
  release(&ptable.lock);
8010415a:	c7 45 08 00 37 11 80 	movl   $0x80113700,0x8(%ebp)
}
80104161:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104164:	c9                   	leave  
  release(&ptable.lock);
80104165:	e9 36 05 00 00       	jmp    801046a0 <release>
8010416a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104170 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	53                   	push   %ebx
80104174:	83 ec 10             	sub    $0x10,%esp
80104177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010417a:	68 00 37 11 80       	push   $0x80113700
8010417f:	e8 5c 04 00 00       	call   801045e0 <acquire>
80104184:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104187:	b8 34 37 11 80       	mov    $0x80113734,%eax
8010418c:	eb 0e                	jmp    8010419c <kill+0x2c>
8010418e:	66 90                	xchg   %ax,%ax
80104190:	05 84 00 00 00       	add    $0x84,%eax
80104195:	3d 34 58 11 80       	cmp    $0x80115834,%eax
8010419a:	73 34                	jae    801041d0 <kill+0x60>
    if(p->pid == pid){
8010419c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010419f:	75 ef                	jne    80104190 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801041a1:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
801041a5:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
801041ac:	75 07                	jne    801041b5 <kill+0x45>
        p->state = RUNNABLE;
801041ae:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
801041b5:	83 ec 0c             	sub    $0xc,%esp
801041b8:	68 00 37 11 80       	push   $0x80113700
801041bd:	e8 de 04 00 00       	call   801046a0 <release>
      return 0;
801041c2:	83 c4 10             	add    $0x10,%esp
801041c5:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
801041c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041ca:	c9                   	leave  
801041cb:	c3                   	ret    
801041cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
801041d0:	83 ec 0c             	sub    $0xc,%esp
801041d3:	68 00 37 11 80       	push   $0x80113700
801041d8:	e8 c3 04 00 00       	call   801046a0 <release>
  return -1;
801041dd:	83 c4 10             	add    $0x10,%esp
801041e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801041e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041e8:	c9                   	leave  
801041e9:	c3                   	ret    
801041ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801041f0 <settickets>:

int 
settickets(int tickets){
801041f0:	55                   	push   %ebp
801041f1:	89 e5                	mov    %esp,%ebp
801041f3:	53                   	push   %ebx
801041f4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801041f7:	e8 14 03 00 00       	call   80104510 <pushcli>
  c = mycpu();
801041fc:	e8 2f f6 ff ff       	call   80103830 <mycpu>
  p = c->proc;
80104201:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80104207:	e8 44 03 00 00       	call   80104550 <popcli>
  struct proc *proc = myproc();
  proc->tickets = tickets;
8010420c:	8b 45 08             	mov    0x8(%ebp),%eax
8010420f:	89 43 7c             	mov    %eax,0x7c(%ebx)
  return 0;
}
80104212:	83 c4 04             	add    $0x4,%esp
80104215:	31 c0                	xor    %eax,%eax
80104217:	5b                   	pop    %ebx
80104218:	5d                   	pop    %ebp
80104219:	c3                   	ret    
8010421a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104220 <getpinfo>:

int
getpinfo(struct pstat* ps) {
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	83 ec 14             	sub    $0x14,%esp
  int i = 0;
  struct proc *p;
  acquire(&ptable.lock);
80104226:	68 00 37 11 80       	push   $0x80113700
8010422b:	e8 b0 03 00 00       	call   801045e0 <acquire>
80104230:	8b 55 08             	mov    0x8(%ebp),%edx
80104233:	83 c4 10             	add    $0x10,%esp
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104236:	b8 34 37 11 80       	mov    $0x80113734,%eax
8010423b:	90                   	nop
8010423c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ps->pid[i] = p->pid;
80104240:	8b 48 10             	mov    0x10(%eax),%ecx
80104243:	89 8a 00 02 00 00    	mov    %ecx,0x200(%edx)
    ps->inuse[i] = p->state == UNUSED;
80104249:	31 c9                	xor    %ecx,%ecx
8010424b:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
8010424f:	0f 94 c1             	sete   %cl
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104252:	05 84 00 00 00       	add    $0x84,%eax
80104257:	83 c2 04             	add    $0x4,%edx
    ps->inuse[i] = p->state == UNUSED;
8010425a:	89 4a fc             	mov    %ecx,-0x4(%edx)
    ps->tickets[i] = p->tickets;
8010425d:	8b 48 f8             	mov    -0x8(%eax),%ecx
80104260:	89 8a fc 00 00 00    	mov    %ecx,0xfc(%edx)
    ps->ticks[i] = p->ticks;
80104266:	8b 48 fc             	mov    -0x4(%eax),%ecx
80104269:	89 8a fc 02 00 00    	mov    %ecx,0x2fc(%edx)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010426f:	3d 34 58 11 80       	cmp    $0x80115834,%eax
80104274:	72 ca                	jb     80104240 <getpinfo+0x20>
    i++;
  }
  release(&ptable.lock);
80104276:	83 ec 0c             	sub    $0xc,%esp
80104279:	68 00 37 11 80       	push   $0x80113700
8010427e:	e8 1d 04 00 00       	call   801046a0 <release>
  return 0;
}
80104283:	31 c0                	xor    %eax,%eax
80104285:	c9                   	leave  
80104286:	c3                   	ret    
80104287:	89 f6                	mov    %esi,%esi
80104289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104290 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104290:	55                   	push   %ebp
80104291:	89 e5                	mov    %esp,%ebp
80104293:	57                   	push   %edi
80104294:	56                   	push   %esi
80104295:	53                   	push   %ebx
80104296:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104299:	bb 34 37 11 80       	mov    $0x80113734,%ebx
{
8010429e:	83 ec 3c             	sub    $0x3c,%esp
801042a1:	eb 27                	jmp    801042ca <procdump+0x3a>
801042a3:	90                   	nop
801042a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    // cprintf(" %d", p->tickets);
    // cprintf(" %d", winning_ticket);
    // cprintf(" %d", total_tickets);
    cprintf("\n");
801042a8:	83 ec 0c             	sub    $0xc,%esp
801042ab:	68 a7 7d 10 80       	push   $0x80107da7
801042b0:	e8 ab c3 ff ff       	call   80100660 <cprintf>
801042b5:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801042b8:	81 c3 84 00 00 00    	add    $0x84,%ebx
801042be:	81 fb 34 58 11 80    	cmp    $0x80115834,%ebx
801042c4:	0f 83 96 00 00 00    	jae    80104360 <procdump+0xd0>
    if(p->state == UNUSED)
801042ca:	8b 43 0c             	mov    0xc(%ebx),%eax
801042cd:	85 c0                	test   %eax,%eax
801042cf:	74 e7                	je     801042b8 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801042d1:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
801042d4:	ba 20 7a 10 80       	mov    $0x80107a20,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801042d9:	77 11                	ja     801042ec <procdump+0x5c>
801042db:	8b 14 85 84 7a 10 80 	mov    -0x7fef857c(,%eax,4),%edx
      state = "???";
801042e2:	b8 20 7a 10 80       	mov    $0x80107a20,%eax
801042e7:	85 d2                	test   %edx,%edx
801042e9:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %sc%d", p->pid, state, p->name, p->tickets);
801042ec:	8d 43 6c             	lea    0x6c(%ebx),%eax
801042ef:	83 ec 0c             	sub    $0xc,%esp
801042f2:	ff 73 7c             	pushl  0x7c(%ebx)
801042f5:	50                   	push   %eax
801042f6:	52                   	push   %edx
801042f7:	ff 73 10             	pushl  0x10(%ebx)
801042fa:	68 24 7a 10 80       	push   $0x80107a24
801042ff:	e8 5c c3 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104304:	83 c4 20             	add    $0x20,%esp
80104307:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
8010430b:	75 9b                	jne    801042a8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
8010430d:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104310:	83 ec 08             	sub    $0x8,%esp
80104313:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104316:	50                   	push   %eax
80104317:	8b 43 1c             	mov    0x1c(%ebx),%eax
8010431a:	8b 40 0c             	mov    0xc(%eax),%eax
8010431d:	83 c0 08             	add    $0x8,%eax
80104320:	50                   	push   %eax
80104321:	e8 9a 01 00 00       	call   801044c0 <getcallerpcs>
80104326:	83 c4 10             	add    $0x10,%esp
80104329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104330:	8b 17                	mov    (%edi),%edx
80104332:	85 d2                	test   %edx,%edx
80104334:	0f 84 6e ff ff ff    	je     801042a8 <procdump+0x18>
        cprintf(" %p", pc[i]);
8010433a:	83 ec 08             	sub    $0x8,%esp
8010433d:	83 c7 04             	add    $0x4,%edi
80104340:	52                   	push   %edx
80104341:	68 61 74 10 80       	push   $0x80107461
80104346:	e8 15 c3 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
8010434b:	83 c4 10             	add    $0x10,%esp
8010434e:	39 fe                	cmp    %edi,%esi
80104350:	75 de                	jne    80104330 <procdump+0xa0>
80104352:	e9 51 ff ff ff       	jmp    801042a8 <procdump+0x18>
80104357:	89 f6                	mov    %esi,%esi
80104359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
}
80104360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104363:	5b                   	pop    %ebx
80104364:	5e                   	pop    %esi
80104365:	5f                   	pop    %edi
80104366:	5d                   	pop    %ebp
80104367:	c3                   	ret    
80104368:	66 90                	xchg   %ax,%ax
8010436a:	66 90                	xchg   %ax,%ax
8010436c:	66 90                	xchg   %ax,%ax
8010436e:	66 90                	xchg   %ax,%ax

80104370 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	53                   	push   %ebx
80104374:	83 ec 0c             	sub    $0xc,%esp
80104377:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010437a:	68 9c 7a 10 80       	push   $0x80107a9c
8010437f:	8d 43 04             	lea    0x4(%ebx),%eax
80104382:	50                   	push   %eax
80104383:	e8 18 01 00 00       	call   801044a0 <initlock>
  lk->name = name;
80104388:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010438b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104391:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104394:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010439b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010439e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043a1:	c9                   	leave  
801043a2:	c3                   	ret    
801043a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043b0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	56                   	push   %esi
801043b4:	53                   	push   %ebx
801043b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801043b8:	83 ec 0c             	sub    $0xc,%esp
801043bb:	8d 73 04             	lea    0x4(%ebx),%esi
801043be:	56                   	push   %esi
801043bf:	e8 1c 02 00 00       	call   801045e0 <acquire>
  while (lk->locked) {
801043c4:	8b 13                	mov    (%ebx),%edx
801043c6:	83 c4 10             	add    $0x10,%esp
801043c9:	85 d2                	test   %edx,%edx
801043cb:	74 16                	je     801043e3 <acquiresleep+0x33>
801043cd:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801043d0:	83 ec 08             	sub    $0x8,%esp
801043d3:	56                   	push   %esi
801043d4:	53                   	push   %ebx
801043d5:	e8 76 fb ff ff       	call   80103f50 <sleep>
  while (lk->locked) {
801043da:	8b 03                	mov    (%ebx),%eax
801043dc:	83 c4 10             	add    $0x10,%esp
801043df:	85 c0                	test   %eax,%eax
801043e1:	75 ed                	jne    801043d0 <acquiresleep+0x20>
  }
  lk->locked = 1;
801043e3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801043e9:	e8 e2 f4 ff ff       	call   801038d0 <myproc>
801043ee:	8b 40 10             	mov    0x10(%eax),%eax
801043f1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801043f4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801043f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043fa:	5b                   	pop    %ebx
801043fb:	5e                   	pop    %esi
801043fc:	5d                   	pop    %ebp
  release(&lk->lk);
801043fd:	e9 9e 02 00 00       	jmp    801046a0 <release>
80104402:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104410 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	56                   	push   %esi
80104414:	53                   	push   %ebx
80104415:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104418:	83 ec 0c             	sub    $0xc,%esp
8010441b:	8d 73 04             	lea    0x4(%ebx),%esi
8010441e:	56                   	push   %esi
8010441f:	e8 bc 01 00 00       	call   801045e0 <acquire>
  lk->locked = 0;
80104424:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010442a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104431:	89 1c 24             	mov    %ebx,(%esp)
80104434:	e8 d7 fc ff ff       	call   80104110 <wakeup>
  release(&lk->lk);
80104439:	89 75 08             	mov    %esi,0x8(%ebp)
8010443c:	83 c4 10             	add    $0x10,%esp
}
8010443f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104442:	5b                   	pop    %ebx
80104443:	5e                   	pop    %esi
80104444:	5d                   	pop    %ebp
  release(&lk->lk);
80104445:	e9 56 02 00 00       	jmp    801046a0 <release>
8010444a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104450 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	57                   	push   %edi
80104454:	56                   	push   %esi
80104455:	53                   	push   %ebx
80104456:	31 ff                	xor    %edi,%edi
80104458:	83 ec 18             	sub    $0x18,%esp
8010445b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010445e:	8d 73 04             	lea    0x4(%ebx),%esi
80104461:	56                   	push   %esi
80104462:	e8 79 01 00 00       	call   801045e0 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104467:	8b 03                	mov    (%ebx),%eax
80104469:	83 c4 10             	add    $0x10,%esp
8010446c:	85 c0                	test   %eax,%eax
8010446e:	74 13                	je     80104483 <holdingsleep+0x33>
80104470:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104473:	e8 58 f4 ff ff       	call   801038d0 <myproc>
80104478:	39 58 10             	cmp    %ebx,0x10(%eax)
8010447b:	0f 94 c0             	sete   %al
8010447e:	0f b6 c0             	movzbl %al,%eax
80104481:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
80104483:	83 ec 0c             	sub    $0xc,%esp
80104486:	56                   	push   %esi
80104487:	e8 14 02 00 00       	call   801046a0 <release>
  return r;
}
8010448c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010448f:	89 f8                	mov    %edi,%eax
80104491:	5b                   	pop    %ebx
80104492:	5e                   	pop    %esi
80104493:	5f                   	pop    %edi
80104494:	5d                   	pop    %ebp
80104495:	c3                   	ret    
80104496:	66 90                	xchg   %ax,%ax
80104498:	66 90                	xchg   %ax,%ax
8010449a:	66 90                	xchg   %ax,%ax
8010449c:	66 90                	xchg   %ax,%ax
8010449e:	66 90                	xchg   %ax,%ax

801044a0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801044a0:	55                   	push   %ebp
801044a1:	89 e5                	mov    %esp,%ebp
801044a3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801044a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801044a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
801044af:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
801044b2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801044b9:	5d                   	pop    %ebp
801044ba:	c3                   	ret    
801044bb:	90                   	nop
801044bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044c0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801044c0:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801044c1:	31 d2                	xor    %edx,%edx
{
801044c3:	89 e5                	mov    %esp,%ebp
801044c5:	53                   	push   %ebx
  ebp = (uint*)v - 2;
801044c6:	8b 45 08             	mov    0x8(%ebp),%eax
{
801044c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
801044cc:	83 e8 08             	sub    $0x8,%eax
801044cf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801044d0:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801044d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801044dc:	77 1a                	ja     801044f8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801044de:	8b 58 04             	mov    0x4(%eax),%ebx
801044e1:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
801044e4:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
801044e7:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
801044e9:	83 fa 0a             	cmp    $0xa,%edx
801044ec:	75 e2                	jne    801044d0 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801044ee:	5b                   	pop    %ebx
801044ef:	5d                   	pop    %ebp
801044f0:	c3                   	ret    
801044f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044f8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801044fb:	83 c1 28             	add    $0x28,%ecx
801044fe:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
80104500:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104506:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104509:	39 c1                	cmp    %eax,%ecx
8010450b:	75 f3                	jne    80104500 <getcallerpcs+0x40>
}
8010450d:	5b                   	pop    %ebx
8010450e:	5d                   	pop    %ebp
8010450f:	c3                   	ret    

80104510 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104510:	55                   	push   %ebp
80104511:	89 e5                	mov    %esp,%ebp
80104513:	53                   	push   %ebx
80104514:	83 ec 04             	sub    $0x4,%esp
80104517:	9c                   	pushf  
80104518:	5b                   	pop    %ebx
  asm volatile("cli");
80104519:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010451a:	e8 11 f3 ff ff       	call   80103830 <mycpu>
8010451f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104525:	85 c0                	test   %eax,%eax
80104527:	75 11                	jne    8010453a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104529:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010452f:	e8 fc f2 ff ff       	call   80103830 <mycpu>
80104534:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010453a:	e8 f1 f2 ff ff       	call   80103830 <mycpu>
8010453f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104546:	83 c4 04             	add    $0x4,%esp
80104549:	5b                   	pop    %ebx
8010454a:	5d                   	pop    %ebp
8010454b:	c3                   	ret    
8010454c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104550 <popcli>:

void
popcli(void)
{
80104550:	55                   	push   %ebp
80104551:	89 e5                	mov    %esp,%ebp
80104553:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104556:	9c                   	pushf  
80104557:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104558:	f6 c4 02             	test   $0x2,%ah
8010455b:	75 35                	jne    80104592 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010455d:	e8 ce f2 ff ff       	call   80103830 <mycpu>
80104562:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104569:	78 34                	js     8010459f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010456b:	e8 c0 f2 ff ff       	call   80103830 <mycpu>
80104570:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104576:	85 d2                	test   %edx,%edx
80104578:	74 06                	je     80104580 <popcli+0x30>
    sti();
}
8010457a:	c9                   	leave  
8010457b:	c3                   	ret    
8010457c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104580:	e8 ab f2 ff ff       	call   80103830 <mycpu>
80104585:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010458b:	85 c0                	test   %eax,%eax
8010458d:	74 eb                	je     8010457a <popcli+0x2a>
  asm volatile("sti");
8010458f:	fb                   	sti    
}
80104590:	c9                   	leave  
80104591:	c3                   	ret    
    panic("popcli - interruptible");
80104592:	83 ec 0c             	sub    $0xc,%esp
80104595:	68 a7 7a 10 80       	push   $0x80107aa7
8010459a:	e8 f1 bd ff ff       	call   80100390 <panic>
    panic("popcli");
8010459f:	83 ec 0c             	sub    $0xc,%esp
801045a2:	68 be 7a 10 80       	push   $0x80107abe
801045a7:	e8 e4 bd ff ff       	call   80100390 <panic>
801045ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801045b0 <holding>:
{
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	56                   	push   %esi
801045b4:	53                   	push   %ebx
801045b5:	8b 75 08             	mov    0x8(%ebp),%esi
801045b8:	31 db                	xor    %ebx,%ebx
  pushcli();
801045ba:	e8 51 ff ff ff       	call   80104510 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801045bf:	8b 06                	mov    (%esi),%eax
801045c1:	85 c0                	test   %eax,%eax
801045c3:	74 10                	je     801045d5 <holding+0x25>
801045c5:	8b 5e 08             	mov    0x8(%esi),%ebx
801045c8:	e8 63 f2 ff ff       	call   80103830 <mycpu>
801045cd:	39 c3                	cmp    %eax,%ebx
801045cf:	0f 94 c3             	sete   %bl
801045d2:	0f b6 db             	movzbl %bl,%ebx
  popcli();
801045d5:	e8 76 ff ff ff       	call   80104550 <popcli>
}
801045da:	89 d8                	mov    %ebx,%eax
801045dc:	5b                   	pop    %ebx
801045dd:	5e                   	pop    %esi
801045de:	5d                   	pop    %ebp
801045df:	c3                   	ret    

801045e0 <acquire>:
{
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	56                   	push   %esi
801045e4:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
801045e5:	e8 26 ff ff ff       	call   80104510 <pushcli>
  if(holding(lk))
801045ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045ed:	83 ec 0c             	sub    $0xc,%esp
801045f0:	53                   	push   %ebx
801045f1:	e8 ba ff ff ff       	call   801045b0 <holding>
801045f6:	83 c4 10             	add    $0x10,%esp
801045f9:	85 c0                	test   %eax,%eax
801045fb:	0f 85 83 00 00 00    	jne    80104684 <acquire+0xa4>
80104601:	89 c6                	mov    %eax,%esi
  asm volatile("lock; xchgl %0, %1" :
80104603:	ba 01 00 00 00       	mov    $0x1,%edx
80104608:	eb 09                	jmp    80104613 <acquire+0x33>
8010460a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104610:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104613:	89 d0                	mov    %edx,%eax
80104615:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
80104618:	85 c0                	test   %eax,%eax
8010461a:	75 f4                	jne    80104610 <acquire+0x30>
  __sync_synchronize();
8010461c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104621:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104624:	e8 07 f2 ff ff       	call   80103830 <mycpu>
  getcallerpcs(&lk, lk->pcs);
80104629:	8d 53 0c             	lea    0xc(%ebx),%edx
  lk->cpu = mycpu();
8010462c:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
8010462f:	89 e8                	mov    %ebp,%eax
80104631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104638:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
8010463e:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
80104644:	77 1a                	ja     80104660 <acquire+0x80>
    pcs[i] = ebp[1];     // saved %eip
80104646:	8b 48 04             	mov    0x4(%eax),%ecx
80104649:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
  for(i = 0; i < 10; i++){
8010464c:	83 c6 01             	add    $0x1,%esi
    ebp = (uint*)ebp[0]; // saved %ebp
8010464f:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104651:	83 fe 0a             	cmp    $0xa,%esi
80104654:	75 e2                	jne    80104638 <acquire+0x58>
}
80104656:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104659:	5b                   	pop    %ebx
8010465a:	5e                   	pop    %esi
8010465b:	5d                   	pop    %ebp
8010465c:	c3                   	ret    
8010465d:	8d 76 00             	lea    0x0(%esi),%esi
80104660:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104663:	83 c2 28             	add    $0x28,%edx
80104666:	8d 76 00             	lea    0x0(%esi),%esi
80104669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    pcs[i] = 0;
80104670:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104676:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104679:	39 d0                	cmp    %edx,%eax
8010467b:	75 f3                	jne    80104670 <acquire+0x90>
}
8010467d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104680:	5b                   	pop    %ebx
80104681:	5e                   	pop    %esi
80104682:	5d                   	pop    %ebp
80104683:	c3                   	ret    
    panic("acquire");
80104684:	83 ec 0c             	sub    $0xc,%esp
80104687:	68 c5 7a 10 80       	push   $0x80107ac5
8010468c:	e8 ff bc ff ff       	call   80100390 <panic>
80104691:	eb 0d                	jmp    801046a0 <release>
80104693:	90                   	nop
80104694:	90                   	nop
80104695:	90                   	nop
80104696:	90                   	nop
80104697:	90                   	nop
80104698:	90                   	nop
80104699:	90                   	nop
8010469a:	90                   	nop
8010469b:	90                   	nop
8010469c:	90                   	nop
8010469d:	90                   	nop
8010469e:	90                   	nop
8010469f:	90                   	nop

801046a0 <release>:
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	53                   	push   %ebx
801046a4:	83 ec 10             	sub    $0x10,%esp
801046a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
801046aa:	53                   	push   %ebx
801046ab:	e8 00 ff ff ff       	call   801045b0 <holding>
801046b0:	83 c4 10             	add    $0x10,%esp
801046b3:	85 c0                	test   %eax,%eax
801046b5:	74 22                	je     801046d9 <release+0x39>
  lk->pcs[0] = 0;
801046b7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801046be:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
801046c5:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801046ca:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801046d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801046d3:	c9                   	leave  
  popcli();
801046d4:	e9 77 fe ff ff       	jmp    80104550 <popcli>
    panic("release");
801046d9:	83 ec 0c             	sub    $0xc,%esp
801046dc:	68 cd 7a 10 80       	push   $0x80107acd
801046e1:	e8 aa bc ff ff       	call   80100390 <panic>
801046e6:	66 90                	xchg   %ax,%ax
801046e8:	66 90                	xchg   %ax,%ax
801046ea:	66 90                	xchg   %ax,%ax
801046ec:	66 90                	xchg   %ax,%ax
801046ee:	66 90                	xchg   %ax,%ax

801046f0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
801046f3:	57                   	push   %edi
801046f4:	53                   	push   %ebx
801046f5:	8b 55 08             	mov    0x8(%ebp),%edx
801046f8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
801046fb:	f6 c2 03             	test   $0x3,%dl
801046fe:	75 05                	jne    80104705 <memset+0x15>
80104700:	f6 c1 03             	test   $0x3,%cl
80104703:	74 13                	je     80104718 <memset+0x28>
  asm volatile("cld; rep stosb" :
80104705:	89 d7                	mov    %edx,%edi
80104707:	8b 45 0c             	mov    0xc(%ebp),%eax
8010470a:	fc                   	cld    
8010470b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010470d:	5b                   	pop    %ebx
8010470e:	89 d0                	mov    %edx,%eax
80104710:	5f                   	pop    %edi
80104711:	5d                   	pop    %ebp
80104712:	c3                   	ret    
80104713:	90                   	nop
80104714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
80104718:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010471c:	c1 e9 02             	shr    $0x2,%ecx
8010471f:	89 f8                	mov    %edi,%eax
80104721:	89 fb                	mov    %edi,%ebx
80104723:	c1 e0 18             	shl    $0x18,%eax
80104726:	c1 e3 10             	shl    $0x10,%ebx
80104729:	09 d8                	or     %ebx,%eax
8010472b:	09 f8                	or     %edi,%eax
8010472d:	c1 e7 08             	shl    $0x8,%edi
80104730:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80104732:	89 d7                	mov    %edx,%edi
80104734:	fc                   	cld    
80104735:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104737:	5b                   	pop    %ebx
80104738:	89 d0                	mov    %edx,%eax
8010473a:	5f                   	pop    %edi
8010473b:	5d                   	pop    %ebp
8010473c:	c3                   	ret    
8010473d:	8d 76 00             	lea    0x0(%esi),%esi

80104740 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	57                   	push   %edi
80104744:	56                   	push   %esi
80104745:	53                   	push   %ebx
80104746:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104749:	8b 75 08             	mov    0x8(%ebp),%esi
8010474c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010474f:	85 db                	test   %ebx,%ebx
80104751:	74 29                	je     8010477c <memcmp+0x3c>
    if(*s1 != *s2)
80104753:	0f b6 16             	movzbl (%esi),%edx
80104756:	0f b6 0f             	movzbl (%edi),%ecx
80104759:	38 d1                	cmp    %dl,%cl
8010475b:	75 2b                	jne    80104788 <memcmp+0x48>
8010475d:	b8 01 00 00 00       	mov    $0x1,%eax
80104762:	eb 14                	jmp    80104778 <memcmp+0x38>
80104764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104768:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010476c:	83 c0 01             	add    $0x1,%eax
8010476f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104774:	38 ca                	cmp    %cl,%dl
80104776:	75 10                	jne    80104788 <memcmp+0x48>
  while(n-- > 0){
80104778:	39 d8                	cmp    %ebx,%eax
8010477a:	75 ec                	jne    80104768 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010477c:	5b                   	pop    %ebx
  return 0;
8010477d:	31 c0                	xor    %eax,%eax
}
8010477f:	5e                   	pop    %esi
80104780:	5f                   	pop    %edi
80104781:	5d                   	pop    %ebp
80104782:	c3                   	ret    
80104783:	90                   	nop
80104784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
80104788:	0f b6 c2             	movzbl %dl,%eax
}
8010478b:	5b                   	pop    %ebx
      return *s1 - *s2;
8010478c:	29 c8                	sub    %ecx,%eax
}
8010478e:	5e                   	pop    %esi
8010478f:	5f                   	pop    %edi
80104790:	5d                   	pop    %ebp
80104791:	c3                   	ret    
80104792:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047a0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801047a0:	55                   	push   %ebp
801047a1:	89 e5                	mov    %esp,%ebp
801047a3:	56                   	push   %esi
801047a4:	53                   	push   %ebx
801047a5:	8b 45 08             	mov    0x8(%ebp),%eax
801047a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801047ab:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801047ae:	39 c3                	cmp    %eax,%ebx
801047b0:	73 26                	jae    801047d8 <memmove+0x38>
801047b2:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
801047b5:	39 c8                	cmp    %ecx,%eax
801047b7:	73 1f                	jae    801047d8 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
801047b9:	85 f6                	test   %esi,%esi
801047bb:	8d 56 ff             	lea    -0x1(%esi),%edx
801047be:	74 0f                	je     801047cf <memmove+0x2f>
      *--d = *--s;
801047c0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801047c4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
801047c7:	83 ea 01             	sub    $0x1,%edx
801047ca:	83 fa ff             	cmp    $0xffffffff,%edx
801047cd:	75 f1                	jne    801047c0 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801047cf:	5b                   	pop    %ebx
801047d0:	5e                   	pop    %esi
801047d1:	5d                   	pop    %ebp
801047d2:	c3                   	ret    
801047d3:	90                   	nop
801047d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
801047d8:	31 d2                	xor    %edx,%edx
801047da:	85 f6                	test   %esi,%esi
801047dc:	74 f1                	je     801047cf <memmove+0x2f>
801047de:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
801047e0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801047e4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801047e7:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
801047ea:	39 d6                	cmp    %edx,%esi
801047ec:	75 f2                	jne    801047e0 <memmove+0x40>
}
801047ee:	5b                   	pop    %ebx
801047ef:	5e                   	pop    %esi
801047f0:	5d                   	pop    %ebp
801047f1:	c3                   	ret    
801047f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104800 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104800:	55                   	push   %ebp
80104801:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104803:	5d                   	pop    %ebp
  return memmove(dst, src, n);
80104804:	eb 9a                	jmp    801047a0 <memmove>
80104806:	8d 76 00             	lea    0x0(%esi),%esi
80104809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104810 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80104810:	55                   	push   %ebp
80104811:	89 e5                	mov    %esp,%ebp
80104813:	57                   	push   %edi
80104814:	56                   	push   %esi
80104815:	8b 7d 10             	mov    0x10(%ebp),%edi
80104818:	53                   	push   %ebx
80104819:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010481c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010481f:	85 ff                	test   %edi,%edi
80104821:	74 2f                	je     80104852 <strncmp+0x42>
80104823:	0f b6 01             	movzbl (%ecx),%eax
80104826:	0f b6 1e             	movzbl (%esi),%ebx
80104829:	84 c0                	test   %al,%al
8010482b:	74 37                	je     80104864 <strncmp+0x54>
8010482d:	38 c3                	cmp    %al,%bl
8010482f:	75 33                	jne    80104864 <strncmp+0x54>
80104831:	01 f7                	add    %esi,%edi
80104833:	eb 13                	jmp    80104848 <strncmp+0x38>
80104835:	8d 76 00             	lea    0x0(%esi),%esi
80104838:	0f b6 01             	movzbl (%ecx),%eax
8010483b:	84 c0                	test   %al,%al
8010483d:	74 21                	je     80104860 <strncmp+0x50>
8010483f:	0f b6 1a             	movzbl (%edx),%ebx
80104842:	89 d6                	mov    %edx,%esi
80104844:	38 d8                	cmp    %bl,%al
80104846:	75 1c                	jne    80104864 <strncmp+0x54>
    n--, p++, q++;
80104848:	8d 56 01             	lea    0x1(%esi),%edx
8010484b:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
8010484e:	39 fa                	cmp    %edi,%edx
80104850:	75 e6                	jne    80104838 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104852:	5b                   	pop    %ebx
    return 0;
80104853:	31 c0                	xor    %eax,%eax
}
80104855:	5e                   	pop    %esi
80104856:	5f                   	pop    %edi
80104857:	5d                   	pop    %ebp
80104858:	c3                   	ret    
80104859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104860:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104864:	29 d8                	sub    %ebx,%eax
}
80104866:	5b                   	pop    %ebx
80104867:	5e                   	pop    %esi
80104868:	5f                   	pop    %edi
80104869:	5d                   	pop    %ebp
8010486a:	c3                   	ret    
8010486b:	90                   	nop
8010486c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104870 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104870:	55                   	push   %ebp
80104871:	89 e5                	mov    %esp,%ebp
80104873:	56                   	push   %esi
80104874:	53                   	push   %ebx
80104875:	8b 45 08             	mov    0x8(%ebp),%eax
80104878:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010487b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010487e:	89 c2                	mov    %eax,%edx
80104880:	eb 19                	jmp    8010489b <strncpy+0x2b>
80104882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104888:	83 c3 01             	add    $0x1,%ebx
8010488b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010488f:	83 c2 01             	add    $0x1,%edx
80104892:	84 c9                	test   %cl,%cl
80104894:	88 4a ff             	mov    %cl,-0x1(%edx)
80104897:	74 09                	je     801048a2 <strncpy+0x32>
80104899:	89 f1                	mov    %esi,%ecx
8010489b:	85 c9                	test   %ecx,%ecx
8010489d:	8d 71 ff             	lea    -0x1(%ecx),%esi
801048a0:	7f e6                	jg     80104888 <strncpy+0x18>
    ;
  while(n-- > 0)
801048a2:	31 c9                	xor    %ecx,%ecx
801048a4:	85 f6                	test   %esi,%esi
801048a6:	7e 17                	jle    801048bf <strncpy+0x4f>
801048a8:	90                   	nop
801048a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
801048b0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801048b4:	89 f3                	mov    %esi,%ebx
801048b6:	83 c1 01             	add    $0x1,%ecx
801048b9:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
801048bb:	85 db                	test   %ebx,%ebx
801048bd:	7f f1                	jg     801048b0 <strncpy+0x40>
  return os;
}
801048bf:	5b                   	pop    %ebx
801048c0:	5e                   	pop    %esi
801048c1:	5d                   	pop    %ebp
801048c2:	c3                   	ret    
801048c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048d0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
801048d0:	55                   	push   %ebp
801048d1:	89 e5                	mov    %esp,%ebp
801048d3:	56                   	push   %esi
801048d4:	53                   	push   %ebx
801048d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801048d8:	8b 45 08             	mov    0x8(%ebp),%eax
801048db:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
801048de:	85 c9                	test   %ecx,%ecx
801048e0:	7e 26                	jle    80104908 <safestrcpy+0x38>
801048e2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801048e6:	89 c1                	mov    %eax,%ecx
801048e8:	eb 17                	jmp    80104901 <safestrcpy+0x31>
801048ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
801048f0:	83 c2 01             	add    $0x1,%edx
801048f3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801048f7:	83 c1 01             	add    $0x1,%ecx
801048fa:	84 db                	test   %bl,%bl
801048fc:	88 59 ff             	mov    %bl,-0x1(%ecx)
801048ff:	74 04                	je     80104905 <safestrcpy+0x35>
80104901:	39 f2                	cmp    %esi,%edx
80104903:	75 eb                	jne    801048f0 <safestrcpy+0x20>
    ;
  *s = 0;
80104905:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104908:	5b                   	pop    %ebx
80104909:	5e                   	pop    %esi
8010490a:	5d                   	pop    %ebp
8010490b:	c3                   	ret    
8010490c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104910 <strlen>:

int
strlen(const char *s)
{
80104910:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104911:	31 c0                	xor    %eax,%eax
{
80104913:	89 e5                	mov    %esp,%ebp
80104915:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104918:	80 3a 00             	cmpb   $0x0,(%edx)
8010491b:	74 0c                	je     80104929 <strlen+0x19>
8010491d:	8d 76 00             	lea    0x0(%esi),%esi
80104920:	83 c0 01             	add    $0x1,%eax
80104923:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104927:	75 f7                	jne    80104920 <strlen+0x10>
    ;
  return n;
}
80104929:	5d                   	pop    %ebp
8010492a:	c3                   	ret    

8010492b <swtch>:
8010492b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010492f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104933:	55                   	push   %ebp
80104934:	53                   	push   %ebx
80104935:	56                   	push   %esi
80104936:	57                   	push   %edi
80104937:	89 20                	mov    %esp,(%eax)
80104939:	89 d4                	mov    %edx,%esp
8010493b:	5f                   	pop    %edi
8010493c:	5e                   	pop    %esi
8010493d:	5b                   	pop    %ebx
8010493e:	5d                   	pop    %ebp
8010493f:	c3                   	ret    

80104940 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104940:	55                   	push   %ebp
80104941:	89 e5                	mov    %esp,%ebp
80104943:	53                   	push   %ebx
80104944:	83 ec 04             	sub    $0x4,%esp
80104947:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010494a:	e8 81 ef ff ff       	call   801038d0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010494f:	8b 00                	mov    (%eax),%eax
80104951:	39 d8                	cmp    %ebx,%eax
80104953:	76 1b                	jbe    80104970 <fetchint+0x30>
80104955:	8d 53 04             	lea    0x4(%ebx),%edx
80104958:	39 d0                	cmp    %edx,%eax
8010495a:	72 14                	jb     80104970 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010495c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010495f:	8b 13                	mov    (%ebx),%edx
80104961:	89 10                	mov    %edx,(%eax)
  return 0;
80104963:	31 c0                	xor    %eax,%eax
}
80104965:	83 c4 04             	add    $0x4,%esp
80104968:	5b                   	pop    %ebx
80104969:	5d                   	pop    %ebp
8010496a:	c3                   	ret    
8010496b:	90                   	nop
8010496c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104970:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104975:	eb ee                	jmp    80104965 <fetchint+0x25>
80104977:	89 f6                	mov    %esi,%esi
80104979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104980 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104980:	55                   	push   %ebp
80104981:	89 e5                	mov    %esp,%ebp
80104983:	53                   	push   %ebx
80104984:	83 ec 04             	sub    $0x4,%esp
80104987:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010498a:	e8 41 ef ff ff       	call   801038d0 <myproc>

  if(addr >= curproc->sz)
8010498f:	39 18                	cmp    %ebx,(%eax)
80104991:	76 29                	jbe    801049bc <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104993:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104996:	89 da                	mov    %ebx,%edx
80104998:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010499a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010499c:	39 c3                	cmp    %eax,%ebx
8010499e:	73 1c                	jae    801049bc <fetchstr+0x3c>
    if(*s == 0)
801049a0:	80 3b 00             	cmpb   $0x0,(%ebx)
801049a3:	75 10                	jne    801049b5 <fetchstr+0x35>
801049a5:	eb 39                	jmp    801049e0 <fetchstr+0x60>
801049a7:	89 f6                	mov    %esi,%esi
801049a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801049b0:	80 3a 00             	cmpb   $0x0,(%edx)
801049b3:	74 1b                	je     801049d0 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
801049b5:	83 c2 01             	add    $0x1,%edx
801049b8:	39 d0                	cmp    %edx,%eax
801049ba:	77 f4                	ja     801049b0 <fetchstr+0x30>
    return -1;
801049bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
801049c1:	83 c4 04             	add    $0x4,%esp
801049c4:	5b                   	pop    %ebx
801049c5:	5d                   	pop    %ebp
801049c6:	c3                   	ret    
801049c7:	89 f6                	mov    %esi,%esi
801049c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801049d0:	83 c4 04             	add    $0x4,%esp
801049d3:	89 d0                	mov    %edx,%eax
801049d5:	29 d8                	sub    %ebx,%eax
801049d7:	5b                   	pop    %ebx
801049d8:	5d                   	pop    %ebp
801049d9:	c3                   	ret    
801049da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s == 0)
801049e0:	31 c0                	xor    %eax,%eax
      return s - *pp;
801049e2:	eb dd                	jmp    801049c1 <fetchstr+0x41>
801049e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801049f0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801049f0:	55                   	push   %ebp
801049f1:	89 e5                	mov    %esp,%ebp
801049f3:	56                   	push   %esi
801049f4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801049f5:	e8 d6 ee ff ff       	call   801038d0 <myproc>
801049fa:	8b 40 18             	mov    0x18(%eax),%eax
801049fd:	8b 55 08             	mov    0x8(%ebp),%edx
80104a00:	8b 40 44             	mov    0x44(%eax),%eax
80104a03:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104a06:	e8 c5 ee ff ff       	call   801038d0 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104a0b:	8b 00                	mov    (%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104a0d:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104a10:	39 c6                	cmp    %eax,%esi
80104a12:	73 1c                	jae    80104a30 <argint+0x40>
80104a14:	8d 53 08             	lea    0x8(%ebx),%edx
80104a17:	39 d0                	cmp    %edx,%eax
80104a19:	72 15                	jb     80104a30 <argint+0x40>
  *ip = *(int*)(addr);
80104a1b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a1e:	8b 53 04             	mov    0x4(%ebx),%edx
80104a21:	89 10                	mov    %edx,(%eax)
  return 0;
80104a23:	31 c0                	xor    %eax,%eax
}
80104a25:	5b                   	pop    %ebx
80104a26:	5e                   	pop    %esi
80104a27:	5d                   	pop    %ebp
80104a28:	c3                   	ret    
80104a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104a30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104a35:	eb ee                	jmp    80104a25 <argint+0x35>
80104a37:	89 f6                	mov    %esi,%esi
80104a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a40 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104a40:	55                   	push   %ebp
80104a41:	89 e5                	mov    %esp,%ebp
80104a43:	56                   	push   %esi
80104a44:	53                   	push   %ebx
80104a45:	83 ec 10             	sub    $0x10,%esp
80104a48:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
80104a4b:	e8 80 ee ff ff       	call   801038d0 <myproc>
80104a50:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104a52:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a55:	83 ec 08             	sub    $0x8,%esp
80104a58:	50                   	push   %eax
80104a59:	ff 75 08             	pushl  0x8(%ebp)
80104a5c:	e8 8f ff ff ff       	call   801049f0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104a61:	83 c4 10             	add    $0x10,%esp
80104a64:	85 c0                	test   %eax,%eax
80104a66:	78 28                	js     80104a90 <argptr+0x50>
80104a68:	85 db                	test   %ebx,%ebx
80104a6a:	78 24                	js     80104a90 <argptr+0x50>
80104a6c:	8b 16                	mov    (%esi),%edx
80104a6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a71:	39 c2                	cmp    %eax,%edx
80104a73:	76 1b                	jbe    80104a90 <argptr+0x50>
80104a75:	01 c3                	add    %eax,%ebx
80104a77:	39 da                	cmp    %ebx,%edx
80104a79:	72 15                	jb     80104a90 <argptr+0x50>
    return -1;
  *pp = (char*)i;
80104a7b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a7e:	89 02                	mov    %eax,(%edx)
  return 0;
80104a80:	31 c0                	xor    %eax,%eax
}
80104a82:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a85:	5b                   	pop    %ebx
80104a86:	5e                   	pop    %esi
80104a87:	5d                   	pop    %ebp
80104a88:	c3                   	ret    
80104a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104a90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a95:	eb eb                	jmp    80104a82 <argptr+0x42>
80104a97:	89 f6                	mov    %esi,%esi
80104a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104aa0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104aa6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104aa9:	50                   	push   %eax
80104aaa:	ff 75 08             	pushl  0x8(%ebp)
80104aad:	e8 3e ff ff ff       	call   801049f0 <argint>
80104ab2:	83 c4 10             	add    $0x10,%esp
80104ab5:	85 c0                	test   %eax,%eax
80104ab7:	78 17                	js     80104ad0 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104ab9:	83 ec 08             	sub    $0x8,%esp
80104abc:	ff 75 0c             	pushl  0xc(%ebp)
80104abf:	ff 75 f4             	pushl  -0xc(%ebp)
80104ac2:	e8 b9 fe ff ff       	call   80104980 <fetchstr>
80104ac7:	83 c4 10             	add    $0x10,%esp
}
80104aca:	c9                   	leave  
80104acb:	c3                   	ret    
80104acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104ad0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ad5:	c9                   	leave  
80104ad6:	c3                   	ret    
80104ad7:	89 f6                	mov    %esi,%esi
80104ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ae0 <getreadcount>:

int
getreadcount(void){
80104ae0:	55                   	push   %ebp
  return counter;
}
80104ae1:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
getreadcount(void){
80104ae6:	89 e5                	mov    %esp,%ebp
}
80104ae8:	5d                   	pop    %ebp
80104ae9:	c3                   	ret    
80104aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104af0 <syscall>:
};


void
syscall(void)
{
80104af0:	55                   	push   %ebp
80104af1:	89 e5                	mov    %esp,%ebp
80104af3:	53                   	push   %ebx
80104af4:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104af7:	e8 d4 ed ff ff       	call   801038d0 <myproc>
80104afc:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104afe:	8b 40 18             	mov    0x18(%eax),%eax
80104b01:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104b04:	8d 50 ff             	lea    -0x1(%eax),%edx
80104b07:	83 fa 18             	cmp    $0x18,%edx
80104b0a:	77 24                	ja     80104b30 <syscall+0x40>
80104b0c:	8b 14 85 00 7b 10 80 	mov    -0x7fef8500(,%eax,4),%edx
80104b13:	85 d2                	test   %edx,%edx
80104b15:	74 19                	je     80104b30 <syscall+0x40>

    if(num == SYS_read) counter++;
80104b17:	83 f8 05             	cmp    $0x5,%eax
80104b1a:	75 07                	jne    80104b23 <syscall+0x33>
80104b1c:	83 05 bc a5 10 80 01 	addl   $0x1,0x8010a5bc
    
    curproc->tf->eax = syscalls[num]();
80104b23:	ff d2                	call   *%edx
80104b25:	8b 53 18             	mov    0x18(%ebx),%edx
80104b28:	89 42 1c             	mov    %eax,0x1c(%edx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104b2b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b2e:	c9                   	leave  
80104b2f:	c3                   	ret    
    cprintf("%d %s: unknown sys call %d\n",
80104b30:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104b31:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104b34:	50                   	push   %eax
80104b35:	ff 73 10             	pushl  0x10(%ebx)
80104b38:	68 d5 7a 10 80       	push   $0x80107ad5
80104b3d:	e8 1e bb ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
80104b42:	8b 43 18             	mov    0x18(%ebx),%eax
80104b45:	83 c4 10             	add    $0x10,%esp
80104b48:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104b4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b52:	c9                   	leave  
80104b53:	c3                   	ret    
80104b54:	66 90                	xchg   %ax,%ax
80104b56:	66 90                	xchg   %ax,%ax
80104b58:	66 90                	xchg   %ax,%ax
80104b5a:	66 90                	xchg   %ax,%ax
80104b5c:	66 90                	xchg   %ax,%ax
80104b5e:	66 90                	xchg   %ax,%ax

80104b60 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104b60:	55                   	push   %ebp
80104b61:	89 e5                	mov    %esp,%ebp
80104b63:	57                   	push   %edi
80104b64:	56                   	push   %esi
80104b65:	53                   	push   %ebx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104b66:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104b69:	83 ec 34             	sub    $0x34,%esp
80104b6c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104b6f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104b72:	56                   	push   %esi
80104b73:	50                   	push   %eax
{
80104b74:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104b77:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104b7a:	e8 f1 d3 ff ff       	call   80101f70 <nameiparent>
80104b7f:	83 c4 10             	add    $0x10,%esp
80104b82:	85 c0                	test   %eax,%eax
80104b84:	0f 84 46 01 00 00    	je     80104cd0 <create+0x170>
    return 0;
  ilock(dp);
80104b8a:	83 ec 0c             	sub    $0xc,%esp
80104b8d:	89 c3                	mov    %eax,%ebx
80104b8f:	50                   	push   %eax
80104b90:	e8 5b cb ff ff       	call   801016f0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104b95:	83 c4 0c             	add    $0xc,%esp
80104b98:	6a 00                	push   $0x0
80104b9a:	56                   	push   %esi
80104b9b:	53                   	push   %ebx
80104b9c:	e8 7f d0 ff ff       	call   80101c20 <dirlookup>
80104ba1:	83 c4 10             	add    $0x10,%esp
80104ba4:	85 c0                	test   %eax,%eax
80104ba6:	89 c7                	mov    %eax,%edi
80104ba8:	74 36                	je     80104be0 <create+0x80>
    iunlockput(dp);
80104baa:	83 ec 0c             	sub    $0xc,%esp
80104bad:	53                   	push   %ebx
80104bae:	e8 cd cd ff ff       	call   80101980 <iunlockput>
    ilock(ip);
80104bb3:	89 3c 24             	mov    %edi,(%esp)
80104bb6:	e8 35 cb ff ff       	call   801016f0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104bbb:	83 c4 10             	add    $0x10,%esp
80104bbe:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104bc3:	0f 85 97 00 00 00    	jne    80104c60 <create+0x100>
80104bc9:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104bce:	0f 85 8c 00 00 00    	jne    80104c60 <create+0x100>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104bd4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104bd7:	89 f8                	mov    %edi,%eax
80104bd9:	5b                   	pop    %ebx
80104bda:	5e                   	pop    %esi
80104bdb:	5f                   	pop    %edi
80104bdc:	5d                   	pop    %ebp
80104bdd:	c3                   	ret    
80104bde:	66 90                	xchg   %ax,%ax
  if((ip = ialloc(dp->dev, type)) == 0)
80104be0:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104be4:	83 ec 08             	sub    $0x8,%esp
80104be7:	50                   	push   %eax
80104be8:	ff 33                	pushl  (%ebx)
80104bea:	e8 91 c9 ff ff       	call   80101580 <ialloc>
80104bef:	83 c4 10             	add    $0x10,%esp
80104bf2:	85 c0                	test   %eax,%eax
80104bf4:	89 c7                	mov    %eax,%edi
80104bf6:	0f 84 e8 00 00 00    	je     80104ce4 <create+0x184>
  ilock(ip);
80104bfc:	83 ec 0c             	sub    $0xc,%esp
80104bff:	50                   	push   %eax
80104c00:	e8 eb ca ff ff       	call   801016f0 <ilock>
  ip->major = major;
80104c05:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104c09:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104c0d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104c11:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104c15:	b8 01 00 00 00       	mov    $0x1,%eax
80104c1a:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104c1e:	89 3c 24             	mov    %edi,(%esp)
80104c21:	e8 1a ca ff ff       	call   80101640 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104c26:	83 c4 10             	add    $0x10,%esp
80104c29:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104c2e:	74 50                	je     80104c80 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104c30:	83 ec 04             	sub    $0x4,%esp
80104c33:	ff 77 04             	pushl  0x4(%edi)
80104c36:	56                   	push   %esi
80104c37:	53                   	push   %ebx
80104c38:	e8 53 d2 ff ff       	call   80101e90 <dirlink>
80104c3d:	83 c4 10             	add    $0x10,%esp
80104c40:	85 c0                	test   %eax,%eax
80104c42:	0f 88 8f 00 00 00    	js     80104cd7 <create+0x177>
  iunlockput(dp);
80104c48:	83 ec 0c             	sub    $0xc,%esp
80104c4b:	53                   	push   %ebx
80104c4c:	e8 2f cd ff ff       	call   80101980 <iunlockput>
  return ip;
80104c51:	83 c4 10             	add    $0x10,%esp
}
80104c54:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c57:	89 f8                	mov    %edi,%eax
80104c59:	5b                   	pop    %ebx
80104c5a:	5e                   	pop    %esi
80104c5b:	5f                   	pop    %edi
80104c5c:	5d                   	pop    %ebp
80104c5d:	c3                   	ret    
80104c5e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104c60:	83 ec 0c             	sub    $0xc,%esp
80104c63:	57                   	push   %edi
    return 0;
80104c64:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104c66:	e8 15 cd ff ff       	call   80101980 <iunlockput>
    return 0;
80104c6b:	83 c4 10             	add    $0x10,%esp
}
80104c6e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c71:	89 f8                	mov    %edi,%eax
80104c73:	5b                   	pop    %ebx
80104c74:	5e                   	pop    %esi
80104c75:	5f                   	pop    %edi
80104c76:	5d                   	pop    %ebp
80104c77:	c3                   	ret    
80104c78:	90                   	nop
80104c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink++;  // for ".."
80104c80:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104c85:	83 ec 0c             	sub    $0xc,%esp
80104c88:	53                   	push   %ebx
80104c89:	e8 b2 c9 ff ff       	call   80101640 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104c8e:	83 c4 0c             	add    $0xc,%esp
80104c91:	ff 77 04             	pushl  0x4(%edi)
80104c94:	68 84 7b 10 80       	push   $0x80107b84
80104c99:	57                   	push   %edi
80104c9a:	e8 f1 d1 ff ff       	call   80101e90 <dirlink>
80104c9f:	83 c4 10             	add    $0x10,%esp
80104ca2:	85 c0                	test   %eax,%eax
80104ca4:	78 1c                	js     80104cc2 <create+0x162>
80104ca6:	83 ec 04             	sub    $0x4,%esp
80104ca9:	ff 73 04             	pushl  0x4(%ebx)
80104cac:	68 83 7b 10 80       	push   $0x80107b83
80104cb1:	57                   	push   %edi
80104cb2:	e8 d9 d1 ff ff       	call   80101e90 <dirlink>
80104cb7:	83 c4 10             	add    $0x10,%esp
80104cba:	85 c0                	test   %eax,%eax
80104cbc:	0f 89 6e ff ff ff    	jns    80104c30 <create+0xd0>
      panic("create dots");
80104cc2:	83 ec 0c             	sub    $0xc,%esp
80104cc5:	68 77 7b 10 80       	push   $0x80107b77
80104cca:	e8 c1 b6 ff ff       	call   80100390 <panic>
80104ccf:	90                   	nop
    return 0;
80104cd0:	31 ff                	xor    %edi,%edi
80104cd2:	e9 fd fe ff ff       	jmp    80104bd4 <create+0x74>
    panic("create: dirlink");
80104cd7:	83 ec 0c             	sub    $0xc,%esp
80104cda:	68 86 7b 10 80       	push   $0x80107b86
80104cdf:	e8 ac b6 ff ff       	call   80100390 <panic>
    panic("create: ialloc");
80104ce4:	83 ec 0c             	sub    $0xc,%esp
80104ce7:	68 68 7b 10 80       	push   $0x80107b68
80104cec:	e8 9f b6 ff ff       	call   80100390 <panic>
80104cf1:	eb 0d                	jmp    80104d00 <argfd.constprop.0>
80104cf3:	90                   	nop
80104cf4:	90                   	nop
80104cf5:	90                   	nop
80104cf6:	90                   	nop
80104cf7:	90                   	nop
80104cf8:	90                   	nop
80104cf9:	90                   	nop
80104cfa:	90                   	nop
80104cfb:	90                   	nop
80104cfc:	90                   	nop
80104cfd:	90                   	nop
80104cfe:	90                   	nop
80104cff:	90                   	nop

80104d00 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104d00:	55                   	push   %ebp
80104d01:	89 e5                	mov    %esp,%ebp
80104d03:	56                   	push   %esi
80104d04:	53                   	push   %ebx
80104d05:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80104d07:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104d0a:	89 d6                	mov    %edx,%esi
80104d0c:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104d0f:	50                   	push   %eax
80104d10:	6a 00                	push   $0x0
80104d12:	e8 d9 fc ff ff       	call   801049f0 <argint>
80104d17:	83 c4 10             	add    $0x10,%esp
80104d1a:	85 c0                	test   %eax,%eax
80104d1c:	78 2a                	js     80104d48 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104d1e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104d22:	77 24                	ja     80104d48 <argfd.constprop.0+0x48>
80104d24:	e8 a7 eb ff ff       	call   801038d0 <myproc>
80104d29:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104d2c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104d30:	85 c0                	test   %eax,%eax
80104d32:	74 14                	je     80104d48 <argfd.constprop.0+0x48>
  if(pfd)
80104d34:	85 db                	test   %ebx,%ebx
80104d36:	74 02                	je     80104d3a <argfd.constprop.0+0x3a>
    *pfd = fd;
80104d38:	89 13                	mov    %edx,(%ebx)
    *pf = f;
80104d3a:	89 06                	mov    %eax,(%esi)
  return 0;
80104d3c:	31 c0                	xor    %eax,%eax
}
80104d3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d41:	5b                   	pop    %ebx
80104d42:	5e                   	pop    %esi
80104d43:	5d                   	pop    %ebp
80104d44:	c3                   	ret    
80104d45:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104d48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d4d:	eb ef                	jmp    80104d3e <argfd.constprop.0+0x3e>
80104d4f:	90                   	nop

80104d50 <sys_dup>:
{
80104d50:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104d51:	31 c0                	xor    %eax,%eax
{
80104d53:	89 e5                	mov    %esp,%ebp
80104d55:	56                   	push   %esi
80104d56:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104d57:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104d5a:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104d5d:	e8 9e ff ff ff       	call   80104d00 <argfd.constprop.0>
80104d62:	85 c0                	test   %eax,%eax
80104d64:	78 42                	js     80104da8 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
80104d66:	8b 75 f4             	mov    -0xc(%ebp),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104d69:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80104d6b:	e8 60 eb ff ff       	call   801038d0 <myproc>
80104d70:	eb 0e                	jmp    80104d80 <sys_dup+0x30>
80104d72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104d78:	83 c3 01             	add    $0x1,%ebx
80104d7b:	83 fb 10             	cmp    $0x10,%ebx
80104d7e:	74 28                	je     80104da8 <sys_dup+0x58>
    if(curproc->ofile[fd] == 0){
80104d80:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104d84:	85 d2                	test   %edx,%edx
80104d86:	75 f0                	jne    80104d78 <sys_dup+0x28>
      curproc->ofile[fd] = f;
80104d88:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104d8c:	83 ec 0c             	sub    $0xc,%esp
80104d8f:	ff 75 f4             	pushl  -0xc(%ebp)
80104d92:	e8 c9 c0 ff ff       	call   80100e60 <filedup>
  return fd;
80104d97:	83 c4 10             	add    $0x10,%esp
}
80104d9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d9d:	89 d8                	mov    %ebx,%eax
80104d9f:	5b                   	pop    %ebx
80104da0:	5e                   	pop    %esi
80104da1:	5d                   	pop    %ebp
80104da2:	c3                   	ret    
80104da3:	90                   	nop
80104da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104da8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104dab:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104db0:	89 d8                	mov    %ebx,%eax
80104db2:	5b                   	pop    %ebx
80104db3:	5e                   	pop    %esi
80104db4:	5d                   	pop    %ebp
80104db5:	c3                   	ret    
80104db6:	8d 76 00             	lea    0x0(%esi),%esi
80104db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104dc0 <sys_read>:
{
80104dc0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104dc1:	31 c0                	xor    %eax,%eax
{
80104dc3:	89 e5                	mov    %esp,%ebp
80104dc5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104dc8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104dcb:	e8 30 ff ff ff       	call   80104d00 <argfd.constprop.0>
80104dd0:	85 c0                	test   %eax,%eax
80104dd2:	78 4c                	js     80104e20 <sys_read+0x60>
80104dd4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104dd7:	83 ec 08             	sub    $0x8,%esp
80104dda:	50                   	push   %eax
80104ddb:	6a 02                	push   $0x2
80104ddd:	e8 0e fc ff ff       	call   801049f0 <argint>
80104de2:	83 c4 10             	add    $0x10,%esp
80104de5:	85 c0                	test   %eax,%eax
80104de7:	78 37                	js     80104e20 <sys_read+0x60>
80104de9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104dec:	83 ec 04             	sub    $0x4,%esp
80104def:	ff 75 f0             	pushl  -0x10(%ebp)
80104df2:	50                   	push   %eax
80104df3:	6a 01                	push   $0x1
80104df5:	e8 46 fc ff ff       	call   80104a40 <argptr>
80104dfa:	83 c4 10             	add    $0x10,%esp
80104dfd:	85 c0                	test   %eax,%eax
80104dff:	78 1f                	js     80104e20 <sys_read+0x60>
  return fileread(f, p, n);
80104e01:	83 ec 04             	sub    $0x4,%esp
80104e04:	ff 75 f0             	pushl  -0x10(%ebp)
80104e07:	ff 75 f4             	pushl  -0xc(%ebp)
80104e0a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e0d:	e8 be c1 ff ff       	call   80100fd0 <fileread>
80104e12:	83 c4 10             	add    $0x10,%esp
}
80104e15:	c9                   	leave  
80104e16:	c3                   	ret    
80104e17:	89 f6                	mov    %esi,%esi
80104e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104e20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e25:	c9                   	leave  
80104e26:	c3                   	ret    
80104e27:	89 f6                	mov    %esi,%esi
80104e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e30 <sys_write>:
{
80104e30:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e31:	31 c0                	xor    %eax,%eax
{
80104e33:	89 e5                	mov    %esp,%ebp
80104e35:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e38:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104e3b:	e8 c0 fe ff ff       	call   80104d00 <argfd.constprop.0>
80104e40:	85 c0                	test   %eax,%eax
80104e42:	78 4c                	js     80104e90 <sys_write+0x60>
80104e44:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e47:	83 ec 08             	sub    $0x8,%esp
80104e4a:	50                   	push   %eax
80104e4b:	6a 02                	push   $0x2
80104e4d:	e8 9e fb ff ff       	call   801049f0 <argint>
80104e52:	83 c4 10             	add    $0x10,%esp
80104e55:	85 c0                	test   %eax,%eax
80104e57:	78 37                	js     80104e90 <sys_write+0x60>
80104e59:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e5c:	83 ec 04             	sub    $0x4,%esp
80104e5f:	ff 75 f0             	pushl  -0x10(%ebp)
80104e62:	50                   	push   %eax
80104e63:	6a 01                	push   $0x1
80104e65:	e8 d6 fb ff ff       	call   80104a40 <argptr>
80104e6a:	83 c4 10             	add    $0x10,%esp
80104e6d:	85 c0                	test   %eax,%eax
80104e6f:	78 1f                	js     80104e90 <sys_write+0x60>
  return filewrite(f, p, n);
80104e71:	83 ec 04             	sub    $0x4,%esp
80104e74:	ff 75 f0             	pushl  -0x10(%ebp)
80104e77:	ff 75 f4             	pushl  -0xc(%ebp)
80104e7a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e7d:	e8 de c1 ff ff       	call   80101060 <filewrite>
80104e82:	83 c4 10             	add    $0x10,%esp
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

80104ea0 <sys_close>:
{
80104ea0:	55                   	push   %ebp
80104ea1:	89 e5                	mov    %esp,%ebp
80104ea3:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104ea6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104ea9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104eac:	e8 4f fe ff ff       	call   80104d00 <argfd.constprop.0>
80104eb1:	85 c0                	test   %eax,%eax
80104eb3:	78 2b                	js     80104ee0 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
80104eb5:	e8 16 ea ff ff       	call   801038d0 <myproc>
80104eba:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104ebd:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80104ec0:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104ec7:	00 
  fileclose(f);
80104ec8:	ff 75 f4             	pushl  -0xc(%ebp)
80104ecb:	e8 e0 bf ff ff       	call   80100eb0 <fileclose>
  return 0;
80104ed0:	83 c4 10             	add    $0x10,%esp
80104ed3:	31 c0                	xor    %eax,%eax
}
80104ed5:	c9                   	leave  
80104ed6:	c3                   	ret    
80104ed7:	89 f6                	mov    %esi,%esi
80104ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104ee0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ee5:	c9                   	leave  
80104ee6:	c3                   	ret    
80104ee7:	89 f6                	mov    %esi,%esi
80104ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ef0 <sys_fstat>:
{
80104ef0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ef1:	31 c0                	xor    %eax,%eax
{
80104ef3:	89 e5                	mov    %esp,%ebp
80104ef5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ef8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104efb:	e8 00 fe ff ff       	call   80104d00 <argfd.constprop.0>
80104f00:	85 c0                	test   %eax,%eax
80104f02:	78 2c                	js     80104f30 <sys_fstat+0x40>
80104f04:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104f07:	83 ec 04             	sub    $0x4,%esp
80104f0a:	6a 14                	push   $0x14
80104f0c:	50                   	push   %eax
80104f0d:	6a 01                	push   $0x1
80104f0f:	e8 2c fb ff ff       	call   80104a40 <argptr>
80104f14:	83 c4 10             	add    $0x10,%esp
80104f17:	85 c0                	test   %eax,%eax
80104f19:	78 15                	js     80104f30 <sys_fstat+0x40>
  return filestat(f, st);
80104f1b:	83 ec 08             	sub    $0x8,%esp
80104f1e:	ff 75 f4             	pushl  -0xc(%ebp)
80104f21:	ff 75 f0             	pushl  -0x10(%ebp)
80104f24:	e8 57 c0 ff ff       	call   80100f80 <filestat>
80104f29:	83 c4 10             	add    $0x10,%esp
}
80104f2c:	c9                   	leave  
80104f2d:	c3                   	ret    
80104f2e:	66 90                	xchg   %ax,%ax
    return -1;
80104f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f35:	c9                   	leave  
80104f36:	c3                   	ret    
80104f37:	89 f6                	mov    %esi,%esi
80104f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f40 <sys_link>:
{
80104f40:	55                   	push   %ebp
80104f41:	89 e5                	mov    %esp,%ebp
80104f43:	57                   	push   %edi
80104f44:	56                   	push   %esi
80104f45:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104f46:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104f49:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104f4c:	50                   	push   %eax
80104f4d:	6a 00                	push   $0x0
80104f4f:	e8 4c fb ff ff       	call   80104aa0 <argstr>
80104f54:	83 c4 10             	add    $0x10,%esp
80104f57:	85 c0                	test   %eax,%eax
80104f59:	0f 88 fb 00 00 00    	js     8010505a <sys_link+0x11a>
80104f5f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104f62:	83 ec 08             	sub    $0x8,%esp
80104f65:	50                   	push   %eax
80104f66:	6a 01                	push   $0x1
80104f68:	e8 33 fb ff ff       	call   80104aa0 <argstr>
80104f6d:	83 c4 10             	add    $0x10,%esp
80104f70:	85 c0                	test   %eax,%eax
80104f72:	0f 88 e2 00 00 00    	js     8010505a <sys_link+0x11a>
  begin_op();
80104f78:	e8 e3 dc ff ff       	call   80102c60 <begin_op>
  if((ip = namei(old)) == 0){
80104f7d:	83 ec 0c             	sub    $0xc,%esp
80104f80:	ff 75 d4             	pushl  -0x2c(%ebp)
80104f83:	e8 c8 cf ff ff       	call   80101f50 <namei>
80104f88:	83 c4 10             	add    $0x10,%esp
80104f8b:	85 c0                	test   %eax,%eax
80104f8d:	89 c3                	mov    %eax,%ebx
80104f8f:	0f 84 ea 00 00 00    	je     8010507f <sys_link+0x13f>
  ilock(ip);
80104f95:	83 ec 0c             	sub    $0xc,%esp
80104f98:	50                   	push   %eax
80104f99:	e8 52 c7 ff ff       	call   801016f0 <ilock>
  if(ip->type == T_DIR){
80104f9e:	83 c4 10             	add    $0x10,%esp
80104fa1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104fa6:	0f 84 bb 00 00 00    	je     80105067 <sys_link+0x127>
  ip->nlink++;
80104fac:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104fb1:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80104fb4:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104fb7:	53                   	push   %ebx
80104fb8:	e8 83 c6 ff ff       	call   80101640 <iupdate>
  iunlock(ip);
80104fbd:	89 1c 24             	mov    %ebx,(%esp)
80104fc0:	e8 0b c8 ff ff       	call   801017d0 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104fc5:	58                   	pop    %eax
80104fc6:	5a                   	pop    %edx
80104fc7:	57                   	push   %edi
80104fc8:	ff 75 d0             	pushl  -0x30(%ebp)
80104fcb:	e8 a0 cf ff ff       	call   80101f70 <nameiparent>
80104fd0:	83 c4 10             	add    $0x10,%esp
80104fd3:	85 c0                	test   %eax,%eax
80104fd5:	89 c6                	mov    %eax,%esi
80104fd7:	74 5b                	je     80105034 <sys_link+0xf4>
  ilock(dp);
80104fd9:	83 ec 0c             	sub    $0xc,%esp
80104fdc:	50                   	push   %eax
80104fdd:	e8 0e c7 ff ff       	call   801016f0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104fe2:	83 c4 10             	add    $0x10,%esp
80104fe5:	8b 03                	mov    (%ebx),%eax
80104fe7:	39 06                	cmp    %eax,(%esi)
80104fe9:	75 3d                	jne    80105028 <sys_link+0xe8>
80104feb:	83 ec 04             	sub    $0x4,%esp
80104fee:	ff 73 04             	pushl  0x4(%ebx)
80104ff1:	57                   	push   %edi
80104ff2:	56                   	push   %esi
80104ff3:	e8 98 ce ff ff       	call   80101e90 <dirlink>
80104ff8:	83 c4 10             	add    $0x10,%esp
80104ffb:	85 c0                	test   %eax,%eax
80104ffd:	78 29                	js     80105028 <sys_link+0xe8>
  iunlockput(dp);
80104fff:	83 ec 0c             	sub    $0xc,%esp
80105002:	56                   	push   %esi
80105003:	e8 78 c9 ff ff       	call   80101980 <iunlockput>
  iput(ip);
80105008:	89 1c 24             	mov    %ebx,(%esp)
8010500b:	e8 10 c8 ff ff       	call   80101820 <iput>
  end_op();
80105010:	e8 bb dc ff ff       	call   80102cd0 <end_op>
  return 0;
80105015:	83 c4 10             	add    $0x10,%esp
80105018:	31 c0                	xor    %eax,%eax
}
8010501a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010501d:	5b                   	pop    %ebx
8010501e:	5e                   	pop    %esi
8010501f:	5f                   	pop    %edi
80105020:	5d                   	pop    %ebp
80105021:	c3                   	ret    
80105022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80105028:	83 ec 0c             	sub    $0xc,%esp
8010502b:	56                   	push   %esi
8010502c:	e8 4f c9 ff ff       	call   80101980 <iunlockput>
    goto bad;
80105031:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80105034:	83 ec 0c             	sub    $0xc,%esp
80105037:	53                   	push   %ebx
80105038:	e8 b3 c6 ff ff       	call   801016f0 <ilock>
  ip->nlink--;
8010503d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105042:	89 1c 24             	mov    %ebx,(%esp)
80105045:	e8 f6 c5 ff ff       	call   80101640 <iupdate>
  iunlockput(ip);
8010504a:	89 1c 24             	mov    %ebx,(%esp)
8010504d:	e8 2e c9 ff ff       	call   80101980 <iunlockput>
  end_op();
80105052:	e8 79 dc ff ff       	call   80102cd0 <end_op>
  return -1;
80105057:	83 c4 10             	add    $0x10,%esp
}
8010505a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010505d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105062:	5b                   	pop    %ebx
80105063:	5e                   	pop    %esi
80105064:	5f                   	pop    %edi
80105065:	5d                   	pop    %ebp
80105066:	c3                   	ret    
    iunlockput(ip);
80105067:	83 ec 0c             	sub    $0xc,%esp
8010506a:	53                   	push   %ebx
8010506b:	e8 10 c9 ff ff       	call   80101980 <iunlockput>
    end_op();
80105070:	e8 5b dc ff ff       	call   80102cd0 <end_op>
    return -1;
80105075:	83 c4 10             	add    $0x10,%esp
80105078:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010507d:	eb 9b                	jmp    8010501a <sys_link+0xda>
    end_op();
8010507f:	e8 4c dc ff ff       	call   80102cd0 <end_op>
    return -1;
80105084:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105089:	eb 8f                	jmp    8010501a <sys_link+0xda>
8010508b:	90                   	nop
8010508c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105090 <sys_unlink>:
{
80105090:	55                   	push   %ebp
80105091:	89 e5                	mov    %esp,%ebp
80105093:	57                   	push   %edi
80105094:	56                   	push   %esi
80105095:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80105096:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80105099:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
8010509c:	50                   	push   %eax
8010509d:	6a 00                	push   $0x0
8010509f:	e8 fc f9 ff ff       	call   80104aa0 <argstr>
801050a4:	83 c4 10             	add    $0x10,%esp
801050a7:	85 c0                	test   %eax,%eax
801050a9:	0f 88 77 01 00 00    	js     80105226 <sys_unlink+0x196>
  if((dp = nameiparent(path, name)) == 0){
801050af:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
801050b2:	e8 a9 db ff ff       	call   80102c60 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
801050b7:	83 ec 08             	sub    $0x8,%esp
801050ba:	53                   	push   %ebx
801050bb:	ff 75 c0             	pushl  -0x40(%ebp)
801050be:	e8 ad ce ff ff       	call   80101f70 <nameiparent>
801050c3:	83 c4 10             	add    $0x10,%esp
801050c6:	85 c0                	test   %eax,%eax
801050c8:	89 c6                	mov    %eax,%esi
801050ca:	0f 84 60 01 00 00    	je     80105230 <sys_unlink+0x1a0>
  ilock(dp);
801050d0:	83 ec 0c             	sub    $0xc,%esp
801050d3:	50                   	push   %eax
801050d4:	e8 17 c6 ff ff       	call   801016f0 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
801050d9:	58                   	pop    %eax
801050da:	5a                   	pop    %edx
801050db:	68 84 7b 10 80       	push   $0x80107b84
801050e0:	53                   	push   %ebx
801050e1:	e8 1a cb ff ff       	call   80101c00 <namecmp>
801050e6:	83 c4 10             	add    $0x10,%esp
801050e9:	85 c0                	test   %eax,%eax
801050eb:	0f 84 03 01 00 00    	je     801051f4 <sys_unlink+0x164>
801050f1:	83 ec 08             	sub    $0x8,%esp
801050f4:	68 83 7b 10 80       	push   $0x80107b83
801050f9:	53                   	push   %ebx
801050fa:	e8 01 cb ff ff       	call   80101c00 <namecmp>
801050ff:	83 c4 10             	add    $0x10,%esp
80105102:	85 c0                	test   %eax,%eax
80105104:	0f 84 ea 00 00 00    	je     801051f4 <sys_unlink+0x164>
  if((ip = dirlookup(dp, name, &off)) == 0)
8010510a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010510d:	83 ec 04             	sub    $0x4,%esp
80105110:	50                   	push   %eax
80105111:	53                   	push   %ebx
80105112:	56                   	push   %esi
80105113:	e8 08 cb ff ff       	call   80101c20 <dirlookup>
80105118:	83 c4 10             	add    $0x10,%esp
8010511b:	85 c0                	test   %eax,%eax
8010511d:	89 c3                	mov    %eax,%ebx
8010511f:	0f 84 cf 00 00 00    	je     801051f4 <sys_unlink+0x164>
  ilock(ip);
80105125:	83 ec 0c             	sub    $0xc,%esp
80105128:	50                   	push   %eax
80105129:	e8 c2 c5 ff ff       	call   801016f0 <ilock>
  if(ip->nlink < 1)
8010512e:	83 c4 10             	add    $0x10,%esp
80105131:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80105136:	0f 8e 10 01 00 00    	jle    8010524c <sys_unlink+0x1bc>
  if(ip->type == T_DIR && !isdirempty(ip)){
8010513c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105141:	74 6d                	je     801051b0 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80105143:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105146:	83 ec 04             	sub    $0x4,%esp
80105149:	6a 10                	push   $0x10
8010514b:	6a 00                	push   $0x0
8010514d:	50                   	push   %eax
8010514e:	e8 9d f5 ff ff       	call   801046f0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105153:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105156:	6a 10                	push   $0x10
80105158:	ff 75 c4             	pushl  -0x3c(%ebp)
8010515b:	50                   	push   %eax
8010515c:	56                   	push   %esi
8010515d:	e8 6e c9 ff ff       	call   80101ad0 <writei>
80105162:	83 c4 20             	add    $0x20,%esp
80105165:	83 f8 10             	cmp    $0x10,%eax
80105168:	0f 85 eb 00 00 00    	jne    80105259 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
8010516e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105173:	0f 84 97 00 00 00    	je     80105210 <sys_unlink+0x180>
  iunlockput(dp);
80105179:	83 ec 0c             	sub    $0xc,%esp
8010517c:	56                   	push   %esi
8010517d:	e8 fe c7 ff ff       	call   80101980 <iunlockput>
  ip->nlink--;
80105182:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105187:	89 1c 24             	mov    %ebx,(%esp)
8010518a:	e8 b1 c4 ff ff       	call   80101640 <iupdate>
  iunlockput(ip);
8010518f:	89 1c 24             	mov    %ebx,(%esp)
80105192:	e8 e9 c7 ff ff       	call   80101980 <iunlockput>
  end_op();
80105197:	e8 34 db ff ff       	call   80102cd0 <end_op>
  return 0;
8010519c:	83 c4 10             	add    $0x10,%esp
8010519f:	31 c0                	xor    %eax,%eax
}
801051a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051a4:	5b                   	pop    %ebx
801051a5:	5e                   	pop    %esi
801051a6:	5f                   	pop    %edi
801051a7:	5d                   	pop    %ebp
801051a8:	c3                   	ret    
801051a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801051b0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801051b4:	76 8d                	jbe    80105143 <sys_unlink+0xb3>
801051b6:	bf 20 00 00 00       	mov    $0x20,%edi
801051bb:	eb 0f                	jmp    801051cc <sys_unlink+0x13c>
801051bd:	8d 76 00             	lea    0x0(%esi),%esi
801051c0:	83 c7 10             	add    $0x10,%edi
801051c3:	3b 7b 58             	cmp    0x58(%ebx),%edi
801051c6:	0f 83 77 ff ff ff    	jae    80105143 <sys_unlink+0xb3>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801051cc:	8d 45 d8             	lea    -0x28(%ebp),%eax
801051cf:	6a 10                	push   $0x10
801051d1:	57                   	push   %edi
801051d2:	50                   	push   %eax
801051d3:	53                   	push   %ebx
801051d4:	e8 f7 c7 ff ff       	call   801019d0 <readi>
801051d9:	83 c4 10             	add    $0x10,%esp
801051dc:	83 f8 10             	cmp    $0x10,%eax
801051df:	75 5e                	jne    8010523f <sys_unlink+0x1af>
    if(de.inum != 0)
801051e1:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801051e6:	74 d8                	je     801051c0 <sys_unlink+0x130>
    iunlockput(ip);
801051e8:	83 ec 0c             	sub    $0xc,%esp
801051eb:	53                   	push   %ebx
801051ec:	e8 8f c7 ff ff       	call   80101980 <iunlockput>
    goto bad;
801051f1:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
801051f4:	83 ec 0c             	sub    $0xc,%esp
801051f7:	56                   	push   %esi
801051f8:	e8 83 c7 ff ff       	call   80101980 <iunlockput>
  end_op();
801051fd:	e8 ce da ff ff       	call   80102cd0 <end_op>
  return -1;
80105202:	83 c4 10             	add    $0x10,%esp
80105205:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010520a:	eb 95                	jmp    801051a1 <sys_unlink+0x111>
8010520c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
80105210:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
    iupdate(dp);
80105215:	83 ec 0c             	sub    $0xc,%esp
80105218:	56                   	push   %esi
80105219:	e8 22 c4 ff ff       	call   80101640 <iupdate>
8010521e:	83 c4 10             	add    $0x10,%esp
80105221:	e9 53 ff ff ff       	jmp    80105179 <sys_unlink+0xe9>
    return -1;
80105226:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010522b:	e9 71 ff ff ff       	jmp    801051a1 <sys_unlink+0x111>
    end_op();
80105230:	e8 9b da ff ff       	call   80102cd0 <end_op>
    return -1;
80105235:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010523a:	e9 62 ff ff ff       	jmp    801051a1 <sys_unlink+0x111>
      panic("isdirempty: readi");
8010523f:	83 ec 0c             	sub    $0xc,%esp
80105242:	68 a8 7b 10 80       	push   $0x80107ba8
80105247:	e8 44 b1 ff ff       	call   80100390 <panic>
    panic("unlink: nlink < 1");
8010524c:	83 ec 0c             	sub    $0xc,%esp
8010524f:	68 96 7b 10 80       	push   $0x80107b96
80105254:	e8 37 b1 ff ff       	call   80100390 <panic>
    panic("unlink: writei");
80105259:	83 ec 0c             	sub    $0xc,%esp
8010525c:	68 ba 7b 10 80       	push   $0x80107bba
80105261:	e8 2a b1 ff ff       	call   80100390 <panic>
80105266:	8d 76 00             	lea    0x0(%esi),%esi
80105269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105270 <sys_open>:

int
sys_open(void)
{
80105270:	55                   	push   %ebp
80105271:	89 e5                	mov    %esp,%ebp
80105273:	57                   	push   %edi
80105274:	56                   	push   %esi
80105275:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105276:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105279:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010527c:	50                   	push   %eax
8010527d:	6a 00                	push   $0x0
8010527f:	e8 1c f8 ff ff       	call   80104aa0 <argstr>
80105284:	83 c4 10             	add    $0x10,%esp
80105287:	85 c0                	test   %eax,%eax
80105289:	0f 88 1d 01 00 00    	js     801053ac <sys_open+0x13c>
8010528f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105292:	83 ec 08             	sub    $0x8,%esp
80105295:	50                   	push   %eax
80105296:	6a 01                	push   $0x1
80105298:	e8 53 f7 ff ff       	call   801049f0 <argint>
8010529d:	83 c4 10             	add    $0x10,%esp
801052a0:	85 c0                	test   %eax,%eax
801052a2:	0f 88 04 01 00 00    	js     801053ac <sys_open+0x13c>
    return -1;

  begin_op();
801052a8:	e8 b3 d9 ff ff       	call   80102c60 <begin_op>

  if(omode & O_CREATE){
801052ad:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801052b1:	0f 85 a9 00 00 00    	jne    80105360 <sys_open+0xf0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801052b7:	83 ec 0c             	sub    $0xc,%esp
801052ba:	ff 75 e0             	pushl  -0x20(%ebp)
801052bd:	e8 8e cc ff ff       	call   80101f50 <namei>
801052c2:	83 c4 10             	add    $0x10,%esp
801052c5:	85 c0                	test   %eax,%eax
801052c7:	89 c6                	mov    %eax,%esi
801052c9:	0f 84 b2 00 00 00    	je     80105381 <sys_open+0x111>
      end_op();
      return -1;
    }
    ilock(ip);
801052cf:	83 ec 0c             	sub    $0xc,%esp
801052d2:	50                   	push   %eax
801052d3:	e8 18 c4 ff ff       	call   801016f0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801052d8:	83 c4 10             	add    $0x10,%esp
801052db:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801052e0:	0f 84 aa 00 00 00    	je     80105390 <sys_open+0x120>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801052e6:	e8 05 bb ff ff       	call   80100df0 <filealloc>
801052eb:	85 c0                	test   %eax,%eax
801052ed:	89 c7                	mov    %eax,%edi
801052ef:	0f 84 a6 00 00 00    	je     8010539b <sys_open+0x12b>
  struct proc *curproc = myproc();
801052f5:	e8 d6 e5 ff ff       	call   801038d0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801052fa:	31 db                	xor    %ebx,%ebx
801052fc:	eb 0e                	jmp    8010530c <sys_open+0x9c>
801052fe:	66 90                	xchg   %ax,%ax
80105300:	83 c3 01             	add    $0x1,%ebx
80105303:	83 fb 10             	cmp    $0x10,%ebx
80105306:	0f 84 ac 00 00 00    	je     801053b8 <sys_open+0x148>
    if(curproc->ofile[fd] == 0){
8010530c:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105310:	85 d2                	test   %edx,%edx
80105312:	75 ec                	jne    80105300 <sys_open+0x90>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105314:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80105317:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
8010531b:	56                   	push   %esi
8010531c:	e8 af c4 ff ff       	call   801017d0 <iunlock>
  end_op();
80105321:	e8 aa d9 ff ff       	call   80102cd0 <end_op>

  f->type = FD_INODE;
80105326:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
8010532c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010532f:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
80105332:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105335:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
8010533c:	89 d0                	mov    %edx,%eax
8010533e:	f7 d0                	not    %eax
80105340:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105343:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
80105346:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105349:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
8010534d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105350:	89 d8                	mov    %ebx,%eax
80105352:	5b                   	pop    %ebx
80105353:	5e                   	pop    %esi
80105354:	5f                   	pop    %edi
80105355:	5d                   	pop    %ebp
80105356:	c3                   	ret    
80105357:	89 f6                	mov    %esi,%esi
80105359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ip = create(path, T_FILE, 0, 0);
80105360:	83 ec 0c             	sub    $0xc,%esp
80105363:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105366:	31 c9                	xor    %ecx,%ecx
80105368:	6a 00                	push   $0x0
8010536a:	ba 02 00 00 00       	mov    $0x2,%edx
8010536f:	e8 ec f7 ff ff       	call   80104b60 <create>
    if(ip == 0){
80105374:	83 c4 10             	add    $0x10,%esp
80105377:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105379:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010537b:	0f 85 65 ff ff ff    	jne    801052e6 <sys_open+0x76>
      end_op();
80105381:	e8 4a d9 ff ff       	call   80102cd0 <end_op>
      return -1;
80105386:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010538b:	eb c0                	jmp    8010534d <sys_open+0xdd>
8010538d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105390:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105393:	85 c9                	test   %ecx,%ecx
80105395:	0f 84 4b ff ff ff    	je     801052e6 <sys_open+0x76>
    iunlockput(ip);
8010539b:	83 ec 0c             	sub    $0xc,%esp
8010539e:	56                   	push   %esi
8010539f:	e8 dc c5 ff ff       	call   80101980 <iunlockput>
    end_op();
801053a4:	e8 27 d9 ff ff       	call   80102cd0 <end_op>
    return -1;
801053a9:	83 c4 10             	add    $0x10,%esp
801053ac:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801053b1:	eb 9a                	jmp    8010534d <sys_open+0xdd>
801053b3:	90                   	nop
801053b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
801053b8:	83 ec 0c             	sub    $0xc,%esp
801053bb:	57                   	push   %edi
801053bc:	e8 ef ba ff ff       	call   80100eb0 <fileclose>
801053c1:	83 c4 10             	add    $0x10,%esp
801053c4:	eb d5                	jmp    8010539b <sys_open+0x12b>
801053c6:	8d 76 00             	lea    0x0(%esi),%esi
801053c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801053d0 <sys_mkdir>:

int
sys_mkdir(void)
{
801053d0:	55                   	push   %ebp
801053d1:	89 e5                	mov    %esp,%ebp
801053d3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801053d6:	e8 85 d8 ff ff       	call   80102c60 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801053db:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053de:	83 ec 08             	sub    $0x8,%esp
801053e1:	50                   	push   %eax
801053e2:	6a 00                	push   $0x0
801053e4:	e8 b7 f6 ff ff       	call   80104aa0 <argstr>
801053e9:	83 c4 10             	add    $0x10,%esp
801053ec:	85 c0                	test   %eax,%eax
801053ee:	78 30                	js     80105420 <sys_mkdir+0x50>
801053f0:	83 ec 0c             	sub    $0xc,%esp
801053f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801053f6:	31 c9                	xor    %ecx,%ecx
801053f8:	6a 00                	push   $0x0
801053fa:	ba 01 00 00 00       	mov    $0x1,%edx
801053ff:	e8 5c f7 ff ff       	call   80104b60 <create>
80105404:	83 c4 10             	add    $0x10,%esp
80105407:	85 c0                	test   %eax,%eax
80105409:	74 15                	je     80105420 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010540b:	83 ec 0c             	sub    $0xc,%esp
8010540e:	50                   	push   %eax
8010540f:	e8 6c c5 ff ff       	call   80101980 <iunlockput>
  end_op();
80105414:	e8 b7 d8 ff ff       	call   80102cd0 <end_op>
  return 0;
80105419:	83 c4 10             	add    $0x10,%esp
8010541c:	31 c0                	xor    %eax,%eax
}
8010541e:	c9                   	leave  
8010541f:	c3                   	ret    
    end_op();
80105420:	e8 ab d8 ff ff       	call   80102cd0 <end_op>
    return -1;
80105425:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010542a:	c9                   	leave  
8010542b:	c3                   	ret    
8010542c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105430 <sys_mknod>:

int
sys_mknod(void)
{
80105430:	55                   	push   %ebp
80105431:	89 e5                	mov    %esp,%ebp
80105433:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105436:	e8 25 d8 ff ff       	call   80102c60 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010543b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010543e:	83 ec 08             	sub    $0x8,%esp
80105441:	50                   	push   %eax
80105442:	6a 00                	push   $0x0
80105444:	e8 57 f6 ff ff       	call   80104aa0 <argstr>
80105449:	83 c4 10             	add    $0x10,%esp
8010544c:	85 c0                	test   %eax,%eax
8010544e:	78 60                	js     801054b0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105450:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105453:	83 ec 08             	sub    $0x8,%esp
80105456:	50                   	push   %eax
80105457:	6a 01                	push   $0x1
80105459:	e8 92 f5 ff ff       	call   801049f0 <argint>
  if((argstr(0, &path)) < 0 ||
8010545e:	83 c4 10             	add    $0x10,%esp
80105461:	85 c0                	test   %eax,%eax
80105463:	78 4b                	js     801054b0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105465:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105468:	83 ec 08             	sub    $0x8,%esp
8010546b:	50                   	push   %eax
8010546c:	6a 02                	push   $0x2
8010546e:	e8 7d f5 ff ff       	call   801049f0 <argint>
     argint(1, &major) < 0 ||
80105473:	83 c4 10             	add    $0x10,%esp
80105476:	85 c0                	test   %eax,%eax
80105478:	78 36                	js     801054b0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010547a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010547e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105481:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
80105485:	ba 03 00 00 00       	mov    $0x3,%edx
8010548a:	50                   	push   %eax
8010548b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010548e:	e8 cd f6 ff ff       	call   80104b60 <create>
80105493:	83 c4 10             	add    $0x10,%esp
80105496:	85 c0                	test   %eax,%eax
80105498:	74 16                	je     801054b0 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010549a:	83 ec 0c             	sub    $0xc,%esp
8010549d:	50                   	push   %eax
8010549e:	e8 dd c4 ff ff       	call   80101980 <iunlockput>
  end_op();
801054a3:	e8 28 d8 ff ff       	call   80102cd0 <end_op>
  return 0;
801054a8:	83 c4 10             	add    $0x10,%esp
801054ab:	31 c0                	xor    %eax,%eax
}
801054ad:	c9                   	leave  
801054ae:	c3                   	ret    
801054af:	90                   	nop
    end_op();
801054b0:	e8 1b d8 ff ff       	call   80102cd0 <end_op>
    return -1;
801054b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801054ba:	c9                   	leave  
801054bb:	c3                   	ret    
801054bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054c0 <sys_chdir>:

int
sys_chdir(void)
{
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	56                   	push   %esi
801054c4:	53                   	push   %ebx
801054c5:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
801054c8:	e8 03 e4 ff ff       	call   801038d0 <myproc>
801054cd:	89 c6                	mov    %eax,%esi
  
  begin_op();
801054cf:	e8 8c d7 ff ff       	call   80102c60 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801054d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054d7:	83 ec 08             	sub    $0x8,%esp
801054da:	50                   	push   %eax
801054db:	6a 00                	push   $0x0
801054dd:	e8 be f5 ff ff       	call   80104aa0 <argstr>
801054e2:	83 c4 10             	add    $0x10,%esp
801054e5:	85 c0                	test   %eax,%eax
801054e7:	78 77                	js     80105560 <sys_chdir+0xa0>
801054e9:	83 ec 0c             	sub    $0xc,%esp
801054ec:	ff 75 f4             	pushl  -0xc(%ebp)
801054ef:	e8 5c ca ff ff       	call   80101f50 <namei>
801054f4:	83 c4 10             	add    $0x10,%esp
801054f7:	85 c0                	test   %eax,%eax
801054f9:	89 c3                	mov    %eax,%ebx
801054fb:	74 63                	je     80105560 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801054fd:	83 ec 0c             	sub    $0xc,%esp
80105500:	50                   	push   %eax
80105501:	e8 ea c1 ff ff       	call   801016f0 <ilock>
  if(ip->type != T_DIR){
80105506:	83 c4 10             	add    $0x10,%esp
80105509:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010550e:	75 30                	jne    80105540 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105510:	83 ec 0c             	sub    $0xc,%esp
80105513:	53                   	push   %ebx
80105514:	e8 b7 c2 ff ff       	call   801017d0 <iunlock>
  iput(curproc->cwd);
80105519:	58                   	pop    %eax
8010551a:	ff 76 68             	pushl  0x68(%esi)
8010551d:	e8 fe c2 ff ff       	call   80101820 <iput>
  end_op();
80105522:	e8 a9 d7 ff ff       	call   80102cd0 <end_op>
  curproc->cwd = ip;
80105527:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010552a:	83 c4 10             	add    $0x10,%esp
8010552d:	31 c0                	xor    %eax,%eax
}
8010552f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105532:	5b                   	pop    %ebx
80105533:	5e                   	pop    %esi
80105534:	5d                   	pop    %ebp
80105535:	c3                   	ret    
80105536:	8d 76 00             	lea    0x0(%esi),%esi
80105539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
80105540:	83 ec 0c             	sub    $0xc,%esp
80105543:	53                   	push   %ebx
80105544:	e8 37 c4 ff ff       	call   80101980 <iunlockput>
    end_op();
80105549:	e8 82 d7 ff ff       	call   80102cd0 <end_op>
    return -1;
8010554e:	83 c4 10             	add    $0x10,%esp
80105551:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105556:	eb d7                	jmp    8010552f <sys_chdir+0x6f>
80105558:	90                   	nop
80105559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105560:	e8 6b d7 ff ff       	call   80102cd0 <end_op>
    return -1;
80105565:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010556a:	eb c3                	jmp    8010552f <sys_chdir+0x6f>
8010556c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105570 <sys_exec>:

int
sys_exec(void)
{
80105570:	55                   	push   %ebp
80105571:	89 e5                	mov    %esp,%ebp
80105573:	57                   	push   %edi
80105574:	56                   	push   %esi
80105575:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105576:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010557c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105582:	50                   	push   %eax
80105583:	6a 00                	push   $0x0
80105585:	e8 16 f5 ff ff       	call   80104aa0 <argstr>
8010558a:	83 c4 10             	add    $0x10,%esp
8010558d:	85 c0                	test   %eax,%eax
8010558f:	0f 88 87 00 00 00    	js     8010561c <sys_exec+0xac>
80105595:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010559b:	83 ec 08             	sub    $0x8,%esp
8010559e:	50                   	push   %eax
8010559f:	6a 01                	push   $0x1
801055a1:	e8 4a f4 ff ff       	call   801049f0 <argint>
801055a6:	83 c4 10             	add    $0x10,%esp
801055a9:	85 c0                	test   %eax,%eax
801055ab:	78 6f                	js     8010561c <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801055ad:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801055b3:	83 ec 04             	sub    $0x4,%esp
  for(i=0;; i++){
801055b6:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
801055b8:	68 80 00 00 00       	push   $0x80
801055bd:	6a 00                	push   $0x0
801055bf:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801055c5:	50                   	push   %eax
801055c6:	e8 25 f1 ff ff       	call   801046f0 <memset>
801055cb:	83 c4 10             	add    $0x10,%esp
801055ce:	eb 2c                	jmp    801055fc <sys_exec+0x8c>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
801055d0:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801055d6:	85 c0                	test   %eax,%eax
801055d8:	74 56                	je     80105630 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801055da:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
801055e0:	83 ec 08             	sub    $0x8,%esp
801055e3:	8d 14 31             	lea    (%ecx,%esi,1),%edx
801055e6:	52                   	push   %edx
801055e7:	50                   	push   %eax
801055e8:	e8 93 f3 ff ff       	call   80104980 <fetchstr>
801055ed:	83 c4 10             	add    $0x10,%esp
801055f0:	85 c0                	test   %eax,%eax
801055f2:	78 28                	js     8010561c <sys_exec+0xac>
  for(i=0;; i++){
801055f4:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
801055f7:	83 fb 20             	cmp    $0x20,%ebx
801055fa:	74 20                	je     8010561c <sys_exec+0xac>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801055fc:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105602:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105609:	83 ec 08             	sub    $0x8,%esp
8010560c:	57                   	push   %edi
8010560d:	01 f0                	add    %esi,%eax
8010560f:	50                   	push   %eax
80105610:	e8 2b f3 ff ff       	call   80104940 <fetchint>
80105615:	83 c4 10             	add    $0x10,%esp
80105618:	85 c0                	test   %eax,%eax
8010561a:	79 b4                	jns    801055d0 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
8010561c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010561f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105624:	5b                   	pop    %ebx
80105625:	5e                   	pop    %esi
80105626:	5f                   	pop    %edi
80105627:	5d                   	pop    %ebp
80105628:	c3                   	ret    
80105629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
80105630:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105636:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
80105639:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105640:	00 00 00 00 
  return exec(path, argv);
80105644:	50                   	push   %eax
80105645:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010564b:	e8 00 b4 ff ff       	call   80100a50 <exec>
80105650:	83 c4 10             	add    $0x10,%esp
}
80105653:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105656:	5b                   	pop    %ebx
80105657:	5e                   	pop    %esi
80105658:	5f                   	pop    %edi
80105659:	5d                   	pop    %ebp
8010565a:	c3                   	ret    
8010565b:	90                   	nop
8010565c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105660 <sys_pipe>:

int
sys_pipe(void)
{
80105660:	55                   	push   %ebp
80105661:	89 e5                	mov    %esp,%ebp
80105663:	57                   	push   %edi
80105664:	56                   	push   %esi
80105665:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105666:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105669:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010566c:	6a 08                	push   $0x8
8010566e:	50                   	push   %eax
8010566f:	6a 00                	push   $0x0
80105671:	e8 ca f3 ff ff       	call   80104a40 <argptr>
80105676:	83 c4 10             	add    $0x10,%esp
80105679:	85 c0                	test   %eax,%eax
8010567b:	0f 88 ae 00 00 00    	js     8010572f <sys_pipe+0xcf>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105681:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105684:	83 ec 08             	sub    $0x8,%esp
80105687:	50                   	push   %eax
80105688:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010568b:	50                   	push   %eax
8010568c:	e8 6f dc ff ff       	call   80103300 <pipealloc>
80105691:	83 c4 10             	add    $0x10,%esp
80105694:	85 c0                	test   %eax,%eax
80105696:	0f 88 93 00 00 00    	js     8010572f <sys_pipe+0xcf>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010569c:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
8010569f:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
801056a1:	e8 2a e2 ff ff       	call   801038d0 <myproc>
801056a6:	eb 10                	jmp    801056b8 <sys_pipe+0x58>
801056a8:	90                   	nop
801056a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(fd = 0; fd < NOFILE; fd++){
801056b0:	83 c3 01             	add    $0x1,%ebx
801056b3:	83 fb 10             	cmp    $0x10,%ebx
801056b6:	74 60                	je     80105718 <sys_pipe+0xb8>
    if(curproc->ofile[fd] == 0){
801056b8:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801056bc:	85 f6                	test   %esi,%esi
801056be:	75 f0                	jne    801056b0 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
801056c0:	8d 73 08             	lea    0x8(%ebx),%esi
801056c3:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801056c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
801056ca:	e8 01 e2 ff ff       	call   801038d0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801056cf:	31 d2                	xor    %edx,%edx
801056d1:	eb 0d                	jmp    801056e0 <sys_pipe+0x80>
801056d3:	90                   	nop
801056d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801056d8:	83 c2 01             	add    $0x1,%edx
801056db:	83 fa 10             	cmp    $0x10,%edx
801056de:	74 28                	je     80105708 <sys_pipe+0xa8>
    if(curproc->ofile[fd] == 0){
801056e0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801056e4:	85 c9                	test   %ecx,%ecx
801056e6:	75 f0                	jne    801056d8 <sys_pipe+0x78>
      curproc->ofile[fd] = f;
801056e8:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801056ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
801056ef:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801056f1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801056f4:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801056f7:	31 c0                	xor    %eax,%eax
}
801056f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056fc:	5b                   	pop    %ebx
801056fd:	5e                   	pop    %esi
801056fe:	5f                   	pop    %edi
801056ff:	5d                   	pop    %ebp
80105700:	c3                   	ret    
80105701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
80105708:	e8 c3 e1 ff ff       	call   801038d0 <myproc>
8010570d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105714:	00 
80105715:	8d 76 00             	lea    0x0(%esi),%esi
    fileclose(rf);
80105718:	83 ec 0c             	sub    $0xc,%esp
8010571b:	ff 75 e0             	pushl  -0x20(%ebp)
8010571e:	e8 8d b7 ff ff       	call   80100eb0 <fileclose>
    fileclose(wf);
80105723:	58                   	pop    %eax
80105724:	ff 75 e4             	pushl  -0x1c(%ebp)
80105727:	e8 84 b7 ff ff       	call   80100eb0 <fileclose>
    return -1;
8010572c:	83 c4 10             	add    $0x10,%esp
8010572f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105734:	eb c3                	jmp    801056f9 <sys_pipe+0x99>
80105736:	66 90                	xchg   %ax,%ax
80105738:	66 90                	xchg   %ax,%ax
8010573a:	66 90                	xchg   %ax,%ax
8010573c:	66 90                	xchg   %ax,%ax
8010573e:	66 90                	xchg   %ax,%ax

80105740 <sys_fork>:
#include "proc.h"
#include "pstat.h"

int
sys_fork(void)
{
80105740:	55                   	push   %ebp
80105741:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105743:	5d                   	pop    %ebp
  return fork();
80105744:	e9 27 e3 ff ff       	jmp    80103a70 <fork>
80105749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105750 <sys_exit>:

int
sys_exit(void)
{
80105750:	55                   	push   %ebp
80105751:	89 e5                	mov    %esp,%ebp
80105753:	83 ec 08             	sub    $0x8,%esp
  exit();
80105756:	e8 75 e6 ff ff       	call   80103dd0 <exit>
  return 0;  // not reached
}
8010575b:	31 c0                	xor    %eax,%eax
8010575d:	c9                   	leave  
8010575e:	c3                   	ret    
8010575f:	90                   	nop

80105760 <sys_wait>:

int
sys_wait(void)
{
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105763:	5d                   	pop    %ebp
  return wait();
80105764:	e9 a7 e8 ff ff       	jmp    80104010 <wait>
80105769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105770 <sys_kill>:

int
sys_kill(void)
{
80105770:	55                   	push   %ebp
80105771:	89 e5                	mov    %esp,%ebp
80105773:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105776:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105779:	50                   	push   %eax
8010577a:	6a 00                	push   $0x0
8010577c:	e8 6f f2 ff ff       	call   801049f0 <argint>
80105781:	83 c4 10             	add    $0x10,%esp
80105784:	85 c0                	test   %eax,%eax
80105786:	78 18                	js     801057a0 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105788:	83 ec 0c             	sub    $0xc,%esp
8010578b:	ff 75 f4             	pushl  -0xc(%ebp)
8010578e:	e8 dd e9 ff ff       	call   80104170 <kill>
80105793:	83 c4 10             	add    $0x10,%esp
}
80105796:	c9                   	leave  
80105797:	c3                   	ret    
80105798:	90                   	nop
80105799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801057a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801057a5:	c9                   	leave  
801057a6:	c3                   	ret    
801057a7:	89 f6                	mov    %esi,%esi
801057a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057b0 <sys_getpid>:

int
sys_getpid(void)
{
801057b0:	55                   	push   %ebp
801057b1:	89 e5                	mov    %esp,%ebp
801057b3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801057b6:	e8 15 e1 ff ff       	call   801038d0 <myproc>
801057bb:	8b 40 10             	mov    0x10(%eax),%eax
}
801057be:	c9                   	leave  
801057bf:	c3                   	ret    

801057c0 <sys_sbrk>:

int
sys_sbrk(void)
{
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
801057c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801057c7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801057ca:	50                   	push   %eax
801057cb:	6a 00                	push   $0x0
801057cd:	e8 1e f2 ff ff       	call   801049f0 <argint>
801057d2:	83 c4 10             	add    $0x10,%esp
801057d5:	85 c0                	test   %eax,%eax
801057d7:	78 27                	js     80105800 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
801057d9:	e8 f2 e0 ff ff       	call   801038d0 <myproc>
  if(growproc(n) < 0)
801057de:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
801057e1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801057e3:	ff 75 f4             	pushl  -0xc(%ebp)
801057e6:	e8 05 e2 ff ff       	call   801039f0 <growproc>
801057eb:	83 c4 10             	add    $0x10,%esp
801057ee:	85 c0                	test   %eax,%eax
801057f0:	78 0e                	js     80105800 <sys_sbrk+0x40>
    return -1;
  return addr;
}
801057f2:	89 d8                	mov    %ebx,%eax
801057f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057f7:	c9                   	leave  
801057f8:	c3                   	ret    
801057f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105800:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105805:	eb eb                	jmp    801057f2 <sys_sbrk+0x32>
80105807:	89 f6                	mov    %esi,%esi
80105809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105810 <sys_sleep>:

int
sys_sleep(void)
{
80105810:	55                   	push   %ebp
80105811:	89 e5                	mov    %esp,%ebp
80105813:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105814:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105817:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010581a:	50                   	push   %eax
8010581b:	6a 00                	push   $0x0
8010581d:	e8 ce f1 ff ff       	call   801049f0 <argint>
80105822:	83 c4 10             	add    $0x10,%esp
80105825:	85 c0                	test   %eax,%eax
80105827:	0f 88 8a 00 00 00    	js     801058b7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010582d:	83 ec 0c             	sub    $0xc,%esp
80105830:	68 40 58 11 80       	push   $0x80115840
80105835:	e8 a6 ed ff ff       	call   801045e0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010583a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010583d:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105840:	8b 1d 80 60 11 80    	mov    0x80116080,%ebx
  while(ticks - ticks0 < n){
80105846:	85 d2                	test   %edx,%edx
80105848:	75 27                	jne    80105871 <sys_sleep+0x61>
8010584a:	eb 54                	jmp    801058a0 <sys_sleep+0x90>
8010584c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105850:	83 ec 08             	sub    $0x8,%esp
80105853:	68 40 58 11 80       	push   $0x80115840
80105858:	68 80 60 11 80       	push   $0x80116080
8010585d:	e8 ee e6 ff ff       	call   80103f50 <sleep>
  while(ticks - ticks0 < n){
80105862:	a1 80 60 11 80       	mov    0x80116080,%eax
80105867:	83 c4 10             	add    $0x10,%esp
8010586a:	29 d8                	sub    %ebx,%eax
8010586c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010586f:	73 2f                	jae    801058a0 <sys_sleep+0x90>
    if(myproc()->killed){
80105871:	e8 5a e0 ff ff       	call   801038d0 <myproc>
80105876:	8b 40 24             	mov    0x24(%eax),%eax
80105879:	85 c0                	test   %eax,%eax
8010587b:	74 d3                	je     80105850 <sys_sleep+0x40>
      release(&tickslock);
8010587d:	83 ec 0c             	sub    $0xc,%esp
80105880:	68 40 58 11 80       	push   $0x80115840
80105885:	e8 16 ee ff ff       	call   801046a0 <release>
      return -1;
8010588a:	83 c4 10             	add    $0x10,%esp
8010588d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105892:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105895:	c9                   	leave  
80105896:	c3                   	ret    
80105897:	89 f6                	mov    %esi,%esi
80105899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
801058a0:	83 ec 0c             	sub    $0xc,%esp
801058a3:	68 40 58 11 80       	push   $0x80115840
801058a8:	e8 f3 ed ff ff       	call   801046a0 <release>
  return 0;
801058ad:	83 c4 10             	add    $0x10,%esp
801058b0:	31 c0                	xor    %eax,%eax
}
801058b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801058b5:	c9                   	leave  
801058b6:	c3                   	ret    
    return -1;
801058b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058bc:	eb f4                	jmp    801058b2 <sys_sleep+0xa2>
801058be:	66 90                	xchg   %ax,%ax

801058c0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801058c0:	55                   	push   %ebp
801058c1:	89 e5                	mov    %esp,%ebp
801058c3:	53                   	push   %ebx
801058c4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
801058c7:	68 40 58 11 80       	push   $0x80115840
801058cc:	e8 0f ed ff ff       	call   801045e0 <acquire>
  xticks = ticks;
801058d1:	8b 1d 80 60 11 80    	mov    0x80116080,%ebx
  release(&tickslock);
801058d7:	c7 04 24 40 58 11 80 	movl   $0x80115840,(%esp)
801058de:	e8 bd ed ff ff       	call   801046a0 <release>
  return xticks;
}
801058e3:	89 d8                	mov    %ebx,%eax
801058e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801058e8:	c9                   	leave  
801058e9:	c3                   	ret    
801058ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801058f0 <sys_gettime>:

int
sys_gettime(void) {
801058f0:	55                   	push   %ebp
801058f1:	89 e5                	mov    %esp,%ebp
801058f3:	83 ec 1c             	sub    $0x1c,%esp
  struct rtcdate *d;
  if (argptr(0, (char **)&d, sizeof(struct rtcdate)) < 0)
801058f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058f9:	6a 18                	push   $0x18
801058fb:	50                   	push   %eax
801058fc:	6a 00                	push   $0x0
801058fe:	e8 3d f1 ff ff       	call   80104a40 <argptr>
80105903:	83 c4 10             	add    $0x10,%esp
80105906:	85 c0                	test   %eax,%eax
80105908:	78 16                	js     80105920 <sys_gettime+0x30>
      return -1;
  cmostime(d);
8010590a:	83 ec 0c             	sub    $0xc,%esp
8010590d:	ff 75 f4             	pushl  -0xc(%ebp)
80105910:	e8 6b cf ff ff       	call   80102880 <cmostime>
  return 0;
80105915:	83 c4 10             	add    $0x10,%esp
80105918:	31 c0                	xor    %eax,%eax
}
8010591a:	c9                   	leave  
8010591b:	c3                   	ret    
8010591c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80105920:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105925:	c9                   	leave  
80105926:	c3                   	ret    
80105927:	89 f6                	mov    %esi,%esi
80105929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105930 <sys_settickets>:

int
sys_settickets(void) {
80105930:	55                   	push   %ebp
80105931:	89 e5                	mov    %esp,%ebp
80105933:	83 ec 20             	sub    $0x20,%esp
  int n;
  if(argint(0, &n) < 0) {
80105936:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105939:	50                   	push   %eax
8010593a:	6a 00                	push   $0x0
8010593c:	e8 af f0 ff ff       	call   801049f0 <argint>
80105941:	83 c4 10             	add    $0x10,%esp
80105944:	85 c0                	test   %eax,%eax
80105946:	78 18                	js     80105960 <sys_settickets+0x30>
    return -1;
  }
  else {
    settickets(n);
80105948:	83 ec 0c             	sub    $0xc,%esp
8010594b:	ff 75 f4             	pushl  -0xc(%ebp)
8010594e:	e8 9d e8 ff ff       	call   801041f0 <settickets>
  }
  return 0;
80105953:	83 c4 10             	add    $0x10,%esp
80105956:	31 c0                	xor    %eax,%eax
}
80105958:	c9                   	leave  
80105959:	c3                   	ret    
8010595a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105960:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105965:	c9                   	leave  
80105966:	c3                   	ret    
80105967:	89 f6                	mov    %esi,%esi
80105969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105970 <sys_getpinfo>:

int
sys_getpinfo(void){
80105970:	55                   	push   %ebp
80105971:	89 e5                	mov    %esp,%ebp
80105973:	83 ec 1c             	sub    $0x1c,%esp
    struct pstat *d;
  if (argptr(0, (char **)&d, sizeof(struct pstat)) < 0)
80105976:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105979:	68 00 04 00 00       	push   $0x400
8010597e:	50                   	push   %eax
8010597f:	6a 00                	push   $0x0
80105981:	e8 ba f0 ff ff       	call   80104a40 <argptr>
80105986:	83 c4 10             	add    $0x10,%esp
80105989:	85 c0                	test   %eax,%eax
8010598b:	78 13                	js     801059a0 <sys_getpinfo+0x30>
      return -1;
  getpinfo(d);
8010598d:	83 ec 0c             	sub    $0xc,%esp
80105990:	ff 75 f4             	pushl  -0xc(%ebp)
80105993:	e8 88 e8 ff ff       	call   80104220 <getpinfo>
  return 0;
80105998:	83 c4 10             	add    $0x10,%esp
8010599b:	31 c0                	xor    %eax,%eax
}
8010599d:	c9                   	leave  
8010599e:	c3                   	ret    
8010599f:	90                   	nop
      return -1;
801059a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801059a5:	c9                   	leave  
801059a6:	c3                   	ret    
801059a7:	89 f6                	mov    %esi,%esi
801059a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801059b0 <sys_getreadcount>:

int
sys_getreadcount(void){
801059b0:	55                   	push   %ebp
801059b1:	89 e5                	mov    %esp,%ebp
  return getreadcount();
}
801059b3:	5d                   	pop    %ebp
  return getreadcount();
801059b4:	e9 27 f1 ff ff       	jmp    80104ae0 <getreadcount>

801059b9 <alltraps>:
801059b9:	1e                   	push   %ds
801059ba:	06                   	push   %es
801059bb:	0f a0                	push   %fs
801059bd:	0f a8                	push   %gs
801059bf:	60                   	pusha  
801059c0:	66 b8 10 00          	mov    $0x10,%ax
801059c4:	8e d8                	mov    %eax,%ds
801059c6:	8e c0                	mov    %eax,%es
801059c8:	54                   	push   %esp
801059c9:	e8 c2 00 00 00       	call   80105a90 <trap>
801059ce:	83 c4 04             	add    $0x4,%esp

801059d1 <trapret>:
801059d1:	61                   	popa   
801059d2:	0f a9                	pop    %gs
801059d4:	0f a1                	pop    %fs
801059d6:	07                   	pop    %es
801059d7:	1f                   	pop    %ds
801059d8:	83 c4 08             	add    $0x8,%esp
801059db:	cf                   	iret   
801059dc:	66 90                	xchg   %ax,%ax
801059de:	66 90                	xchg   %ax,%ax

801059e0 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801059e0:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
801059e1:	31 c0                	xor    %eax,%eax
{
801059e3:	89 e5                	mov    %esp,%ebp
801059e5:	83 ec 08             	sub    $0x8,%esp
801059e8:	90                   	nop
801059e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801059f0:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801059f7:	c7 04 c5 82 58 11 80 	movl   $0x8e000008,-0x7feea77e(,%eax,8)
801059fe:	08 00 00 8e 
80105a02:	66 89 14 c5 80 58 11 	mov    %dx,-0x7feea780(,%eax,8)
80105a09:	80 
80105a0a:	c1 ea 10             	shr    $0x10,%edx
80105a0d:	66 89 14 c5 86 58 11 	mov    %dx,-0x7feea77a(,%eax,8)
80105a14:	80 
  for(i = 0; i < 256; i++)
80105a15:	83 c0 01             	add    $0x1,%eax
80105a18:	3d 00 01 00 00       	cmp    $0x100,%eax
80105a1d:	75 d1                	jne    801059f0 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a1f:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
80105a24:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a27:	c7 05 82 5a 11 80 08 	movl   $0xef000008,0x80115a82
80105a2e:	00 00 ef 
  initlock(&tickslock, "time");
80105a31:	68 c9 7b 10 80       	push   $0x80107bc9
80105a36:	68 40 58 11 80       	push   $0x80115840
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a3b:	66 a3 80 5a 11 80    	mov    %ax,0x80115a80
80105a41:	c1 e8 10             	shr    $0x10,%eax
80105a44:	66 a3 86 5a 11 80    	mov    %ax,0x80115a86
  initlock(&tickslock, "time");
80105a4a:	e8 51 ea ff ff       	call   801044a0 <initlock>
}
80105a4f:	83 c4 10             	add    $0x10,%esp
80105a52:	c9                   	leave  
80105a53:	c3                   	ret    
80105a54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105a5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105a60 <idtinit>:

void
idtinit(void)
{
80105a60:	55                   	push   %ebp
  pd[0] = size-1;
80105a61:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105a66:	89 e5                	mov    %esp,%ebp
80105a68:	83 ec 10             	sub    $0x10,%esp
80105a6b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105a6f:	b8 80 58 11 80       	mov    $0x80115880,%eax
80105a74:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105a78:	c1 e8 10             	shr    $0x10,%eax
80105a7b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105a7f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105a82:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105a85:	c9                   	leave  
80105a86:	c3                   	ret    
80105a87:	89 f6                	mov    %esi,%esi
80105a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a90 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105a90:	55                   	push   %ebp
80105a91:	89 e5                	mov    %esp,%ebp
80105a93:	57                   	push   %edi
80105a94:	56                   	push   %esi
80105a95:	53                   	push   %ebx
80105a96:	83 ec 1c             	sub    $0x1c,%esp
80105a99:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
80105a9c:	8b 47 30             	mov    0x30(%edi),%eax
80105a9f:	83 f8 40             	cmp    $0x40,%eax
80105aa2:	0f 84 f0 00 00 00    	je     80105b98 <trap+0x108>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105aa8:	83 e8 20             	sub    $0x20,%eax
80105aab:	83 f8 1f             	cmp    $0x1f,%eax
80105aae:	77 10                	ja     80105ac0 <trap+0x30>
80105ab0:	ff 24 85 70 7c 10 80 	jmp    *-0x7fef8390(,%eax,4)
80105ab7:	89 f6                	mov    %esi,%esi
80105ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105ac0:	e8 0b de ff ff       	call   801038d0 <myproc>
80105ac5:	85 c0                	test   %eax,%eax
80105ac7:	8b 5f 38             	mov    0x38(%edi),%ebx
80105aca:	0f 84 14 02 00 00    	je     80105ce4 <trap+0x254>
80105ad0:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105ad4:	0f 84 0a 02 00 00    	je     80105ce4 <trap+0x254>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105ada:	0f 20 d1             	mov    %cr2,%ecx
80105add:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105ae0:	e8 cb dd ff ff       	call   801038b0 <cpuid>
80105ae5:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105ae8:	8b 47 34             	mov    0x34(%edi),%eax
80105aeb:	8b 77 30             	mov    0x30(%edi),%esi
80105aee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105af1:	e8 da dd ff ff       	call   801038d0 <myproc>
80105af6:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105af9:	e8 d2 dd ff ff       	call   801038d0 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105afe:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105b01:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105b04:	51                   	push   %ecx
80105b05:	53                   	push   %ebx
80105b06:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
80105b07:	8b 55 e0             	mov    -0x20(%ebp),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b0a:	ff 75 e4             	pushl  -0x1c(%ebp)
80105b0d:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
80105b0e:	83 c2 6c             	add    $0x6c,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b11:	52                   	push   %edx
80105b12:	ff 70 10             	pushl  0x10(%eax)
80105b15:	68 2c 7c 10 80       	push   $0x80107c2c
80105b1a:	e8 41 ab ff ff       	call   80100660 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
80105b1f:	83 c4 20             	add    $0x20,%esp
80105b22:	e8 a9 dd ff ff       	call   801038d0 <myproc>
80105b27:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105b2e:	e8 9d dd ff ff       	call   801038d0 <myproc>
80105b33:	85 c0                	test   %eax,%eax
80105b35:	74 1d                	je     80105b54 <trap+0xc4>
80105b37:	e8 94 dd ff ff       	call   801038d0 <myproc>
80105b3c:	8b 50 24             	mov    0x24(%eax),%edx
80105b3f:	85 d2                	test   %edx,%edx
80105b41:	74 11                	je     80105b54 <trap+0xc4>
80105b43:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105b47:	83 e0 03             	and    $0x3,%eax
80105b4a:	66 83 f8 03          	cmp    $0x3,%ax
80105b4e:	0f 84 4c 01 00 00    	je     80105ca0 <trap+0x210>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105b54:	e8 77 dd ff ff       	call   801038d0 <myproc>
80105b59:	85 c0                	test   %eax,%eax
80105b5b:	74 0b                	je     80105b68 <trap+0xd8>
80105b5d:	e8 6e dd ff ff       	call   801038d0 <myproc>
80105b62:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105b66:	74 68                	je     80105bd0 <trap+0x140>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105b68:	e8 63 dd ff ff       	call   801038d0 <myproc>
80105b6d:	85 c0                	test   %eax,%eax
80105b6f:	74 19                	je     80105b8a <trap+0xfa>
80105b71:	e8 5a dd ff ff       	call   801038d0 <myproc>
80105b76:	8b 40 24             	mov    0x24(%eax),%eax
80105b79:	85 c0                	test   %eax,%eax
80105b7b:	74 0d                	je     80105b8a <trap+0xfa>
80105b7d:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105b81:	83 e0 03             	and    $0x3,%eax
80105b84:	66 83 f8 03          	cmp    $0x3,%ax
80105b88:	74 37                	je     80105bc1 <trap+0x131>
    exit();
}
80105b8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b8d:	5b                   	pop    %ebx
80105b8e:	5e                   	pop    %esi
80105b8f:	5f                   	pop    %edi
80105b90:	5d                   	pop    %ebp
80105b91:	c3                   	ret    
80105b92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(myproc()->killed)
80105b98:	e8 33 dd ff ff       	call   801038d0 <myproc>
80105b9d:	8b 58 24             	mov    0x24(%eax),%ebx
80105ba0:	85 db                	test   %ebx,%ebx
80105ba2:	0f 85 e8 00 00 00    	jne    80105c90 <trap+0x200>
    myproc()->tf = tf;
80105ba8:	e8 23 dd ff ff       	call   801038d0 <myproc>
80105bad:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105bb0:	e8 3b ef ff ff       	call   80104af0 <syscall>
    if(myproc()->killed)
80105bb5:	e8 16 dd ff ff       	call   801038d0 <myproc>
80105bba:	8b 48 24             	mov    0x24(%eax),%ecx
80105bbd:	85 c9                	test   %ecx,%ecx
80105bbf:	74 c9                	je     80105b8a <trap+0xfa>
}
80105bc1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105bc4:	5b                   	pop    %ebx
80105bc5:	5e                   	pop    %esi
80105bc6:	5f                   	pop    %edi
80105bc7:	5d                   	pop    %ebp
      exit();
80105bc8:	e9 03 e2 ff ff       	jmp    80103dd0 <exit>
80105bcd:	8d 76 00             	lea    0x0(%esi),%esi
  if(myproc() && myproc()->state == RUNNING &&
80105bd0:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105bd4:	75 92                	jne    80105b68 <trap+0xd8>
    yield();
80105bd6:	e8 25 e3 ff ff       	call   80103f00 <yield>
80105bdb:	eb 8b                	jmp    80105b68 <trap+0xd8>
80105bdd:	8d 76 00             	lea    0x0(%esi),%esi
    if(cpuid() == 0){
80105be0:	e8 cb dc ff ff       	call   801038b0 <cpuid>
80105be5:	85 c0                	test   %eax,%eax
80105be7:	0f 84 c3 00 00 00    	je     80105cb0 <trap+0x220>
    lapiceoi();
80105bed:	e8 ce cb ff ff       	call   801027c0 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105bf2:	e8 d9 dc ff ff       	call   801038d0 <myproc>
80105bf7:	85 c0                	test   %eax,%eax
80105bf9:	0f 85 38 ff ff ff    	jne    80105b37 <trap+0xa7>
80105bff:	e9 50 ff ff ff       	jmp    80105b54 <trap+0xc4>
80105c04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
80105c08:	e8 73 ca ff ff       	call   80102680 <kbdintr>
    lapiceoi();
80105c0d:	e8 ae cb ff ff       	call   801027c0 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105c12:	e8 b9 dc ff ff       	call   801038d0 <myproc>
80105c17:	85 c0                	test   %eax,%eax
80105c19:	0f 85 18 ff ff ff    	jne    80105b37 <trap+0xa7>
80105c1f:	e9 30 ff ff ff       	jmp    80105b54 <trap+0xc4>
80105c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80105c28:	e8 53 02 00 00       	call   80105e80 <uartintr>
    lapiceoi();
80105c2d:	e8 8e cb ff ff       	call   801027c0 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105c32:	e8 99 dc ff ff       	call   801038d0 <myproc>
80105c37:	85 c0                	test   %eax,%eax
80105c39:	0f 85 f8 fe ff ff    	jne    80105b37 <trap+0xa7>
80105c3f:	e9 10 ff ff ff       	jmp    80105b54 <trap+0xc4>
80105c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105c48:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105c4c:	8b 77 38             	mov    0x38(%edi),%esi
80105c4f:	e8 5c dc ff ff       	call   801038b0 <cpuid>
80105c54:	56                   	push   %esi
80105c55:	53                   	push   %ebx
80105c56:	50                   	push   %eax
80105c57:	68 d4 7b 10 80       	push   $0x80107bd4
80105c5c:	e8 ff a9 ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105c61:	e8 5a cb ff ff       	call   801027c0 <lapiceoi>
    break;
80105c66:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105c69:	e8 62 dc ff ff       	call   801038d0 <myproc>
80105c6e:	85 c0                	test   %eax,%eax
80105c70:	0f 85 c1 fe ff ff    	jne    80105b37 <trap+0xa7>
80105c76:	e9 d9 fe ff ff       	jmp    80105b54 <trap+0xc4>
80105c7b:	90                   	nop
80105c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ideintr();
80105c80:	e8 6b c4 ff ff       	call   801020f0 <ideintr>
80105c85:	e9 63 ff ff ff       	jmp    80105bed <trap+0x15d>
80105c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
80105c90:	e8 3b e1 ff ff       	call   80103dd0 <exit>
80105c95:	e9 0e ff ff ff       	jmp    80105ba8 <trap+0x118>
80105c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
80105ca0:	e8 2b e1 ff ff       	call   80103dd0 <exit>
80105ca5:	e9 aa fe ff ff       	jmp    80105b54 <trap+0xc4>
80105caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
80105cb0:	83 ec 0c             	sub    $0xc,%esp
80105cb3:	68 40 58 11 80       	push   $0x80115840
80105cb8:	e8 23 e9 ff ff       	call   801045e0 <acquire>
      wakeup(&ticks);
80105cbd:	c7 04 24 80 60 11 80 	movl   $0x80116080,(%esp)
      ticks++;
80105cc4:	83 05 80 60 11 80 01 	addl   $0x1,0x80116080
      wakeup(&ticks);
80105ccb:	e8 40 e4 ff ff       	call   80104110 <wakeup>
      release(&tickslock);
80105cd0:	c7 04 24 40 58 11 80 	movl   $0x80115840,(%esp)
80105cd7:	e8 c4 e9 ff ff       	call   801046a0 <release>
80105cdc:	83 c4 10             	add    $0x10,%esp
80105cdf:	e9 09 ff ff ff       	jmp    80105bed <trap+0x15d>
80105ce4:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105ce7:	e8 c4 db ff ff       	call   801038b0 <cpuid>
80105cec:	83 ec 0c             	sub    $0xc,%esp
80105cef:	56                   	push   %esi
80105cf0:	53                   	push   %ebx
80105cf1:	50                   	push   %eax
80105cf2:	ff 77 30             	pushl  0x30(%edi)
80105cf5:	68 f8 7b 10 80       	push   $0x80107bf8
80105cfa:	e8 61 a9 ff ff       	call   80100660 <cprintf>
      panic("trap");
80105cff:	83 c4 14             	add    $0x14,%esp
80105d02:	68 ce 7b 10 80       	push   $0x80107bce
80105d07:	e8 84 a6 ff ff       	call   80100390 <panic>
80105d0c:	66 90                	xchg   %ax,%ax
80105d0e:	66 90                	xchg   %ax,%ax

80105d10 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105d10:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
{
80105d15:	55                   	push   %ebp
80105d16:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105d18:	85 c0                	test   %eax,%eax
80105d1a:	74 1c                	je     80105d38 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105d1c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d21:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105d22:	a8 01                	test   $0x1,%al
80105d24:	74 12                	je     80105d38 <uartgetc+0x28>
80105d26:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d2b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105d2c:	0f b6 c0             	movzbl %al,%eax
}
80105d2f:	5d                   	pop    %ebp
80105d30:	c3                   	ret    
80105d31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105d38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105d3d:	5d                   	pop    %ebp
80105d3e:	c3                   	ret    
80105d3f:	90                   	nop

80105d40 <uartputc.part.0>:
uartputc(int c)
80105d40:	55                   	push   %ebp
80105d41:	89 e5                	mov    %esp,%ebp
80105d43:	57                   	push   %edi
80105d44:	56                   	push   %esi
80105d45:	53                   	push   %ebx
80105d46:	89 c7                	mov    %eax,%edi
80105d48:	bb 80 00 00 00       	mov    $0x80,%ebx
80105d4d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105d52:	83 ec 0c             	sub    $0xc,%esp
80105d55:	eb 1b                	jmp    80105d72 <uartputc.part.0+0x32>
80105d57:	89 f6                	mov    %esi,%esi
80105d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
80105d60:	83 ec 0c             	sub    $0xc,%esp
80105d63:	6a 0a                	push   $0xa
80105d65:	e8 76 ca ff ff       	call   801027e0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105d6a:	83 c4 10             	add    $0x10,%esp
80105d6d:	83 eb 01             	sub    $0x1,%ebx
80105d70:	74 07                	je     80105d79 <uartputc.part.0+0x39>
80105d72:	89 f2                	mov    %esi,%edx
80105d74:	ec                   	in     (%dx),%al
80105d75:	a8 20                	test   $0x20,%al
80105d77:	74 e7                	je     80105d60 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105d79:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d7e:	89 f8                	mov    %edi,%eax
80105d80:	ee                   	out    %al,(%dx)
}
80105d81:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d84:	5b                   	pop    %ebx
80105d85:	5e                   	pop    %esi
80105d86:	5f                   	pop    %edi
80105d87:	5d                   	pop    %ebp
80105d88:	c3                   	ret    
80105d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105d90 <uartinit>:
{
80105d90:	55                   	push   %ebp
80105d91:	31 c9                	xor    %ecx,%ecx
80105d93:	89 c8                	mov    %ecx,%eax
80105d95:	89 e5                	mov    %esp,%ebp
80105d97:	57                   	push   %edi
80105d98:	56                   	push   %esi
80105d99:	53                   	push   %ebx
80105d9a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105d9f:	89 da                	mov    %ebx,%edx
80105da1:	83 ec 0c             	sub    $0xc,%esp
80105da4:	ee                   	out    %al,(%dx)
80105da5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105daa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105daf:	89 fa                	mov    %edi,%edx
80105db1:	ee                   	out    %al,(%dx)
80105db2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105db7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dbc:	ee                   	out    %al,(%dx)
80105dbd:	be f9 03 00 00       	mov    $0x3f9,%esi
80105dc2:	89 c8                	mov    %ecx,%eax
80105dc4:	89 f2                	mov    %esi,%edx
80105dc6:	ee                   	out    %al,(%dx)
80105dc7:	b8 03 00 00 00       	mov    $0x3,%eax
80105dcc:	89 fa                	mov    %edi,%edx
80105dce:	ee                   	out    %al,(%dx)
80105dcf:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105dd4:	89 c8                	mov    %ecx,%eax
80105dd6:	ee                   	out    %al,(%dx)
80105dd7:	b8 01 00 00 00       	mov    $0x1,%eax
80105ddc:	89 f2                	mov    %esi,%edx
80105dde:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105ddf:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105de4:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105de5:	3c ff                	cmp    $0xff,%al
80105de7:	74 5a                	je     80105e43 <uartinit+0xb3>
  uart = 1;
80105de9:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105df0:	00 00 00 
80105df3:	89 da                	mov    %ebx,%edx
80105df5:	ec                   	in     (%dx),%al
80105df6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dfb:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105dfc:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
80105dff:	bb f0 7c 10 80       	mov    $0x80107cf0,%ebx
  ioapicenable(IRQ_COM1, 0);
80105e04:	6a 00                	push   $0x0
80105e06:	6a 04                	push   $0x4
80105e08:	e8 33 c5 ff ff       	call   80102340 <ioapicenable>
80105e0d:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80105e10:	b8 78 00 00 00       	mov    $0x78,%eax
80105e15:	eb 13                	jmp    80105e2a <uartinit+0x9a>
80105e17:	89 f6                	mov    %esi,%esi
80105e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105e20:	83 c3 01             	add    $0x1,%ebx
80105e23:	0f be 03             	movsbl (%ebx),%eax
80105e26:	84 c0                	test   %al,%al
80105e28:	74 19                	je     80105e43 <uartinit+0xb3>
  if(!uart)
80105e2a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105e30:	85 d2                	test   %edx,%edx
80105e32:	74 ec                	je     80105e20 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80105e34:	83 c3 01             	add    $0x1,%ebx
80105e37:	e8 04 ff ff ff       	call   80105d40 <uartputc.part.0>
80105e3c:	0f be 03             	movsbl (%ebx),%eax
80105e3f:	84 c0                	test   %al,%al
80105e41:	75 e7                	jne    80105e2a <uartinit+0x9a>
}
80105e43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e46:	5b                   	pop    %ebx
80105e47:	5e                   	pop    %esi
80105e48:	5f                   	pop    %edi
80105e49:	5d                   	pop    %ebp
80105e4a:	c3                   	ret    
80105e4b:	90                   	nop
80105e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105e50 <uartputc>:
  if(!uart)
80105e50:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
{
80105e56:	55                   	push   %ebp
80105e57:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105e59:	85 d2                	test   %edx,%edx
{
80105e5b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105e5e:	74 10                	je     80105e70 <uartputc+0x20>
}
80105e60:	5d                   	pop    %ebp
80105e61:	e9 da fe ff ff       	jmp    80105d40 <uartputc.part.0>
80105e66:	8d 76 00             	lea    0x0(%esi),%esi
80105e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105e70:	5d                   	pop    %ebp
80105e71:	c3                   	ret    
80105e72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e80 <uartintr>:

void
uartintr(void)
{
80105e80:	55                   	push   %ebp
80105e81:	89 e5                	mov    %esp,%ebp
80105e83:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105e86:	68 10 5d 10 80       	push   $0x80105d10
80105e8b:	e8 c0 a9 ff ff       	call   80100850 <consoleintr>
}
80105e90:	83 c4 10             	add    $0x10,%esp
80105e93:	c9                   	leave  
80105e94:	c3                   	ret    

80105e95 <vector0>:
80105e95:	6a 00                	push   $0x0
80105e97:	6a 00                	push   $0x0
80105e99:	e9 1b fb ff ff       	jmp    801059b9 <alltraps>

80105e9e <vector1>:
80105e9e:	6a 00                	push   $0x0
80105ea0:	6a 01                	push   $0x1
80105ea2:	e9 12 fb ff ff       	jmp    801059b9 <alltraps>

80105ea7 <vector2>:
80105ea7:	6a 00                	push   $0x0
80105ea9:	6a 02                	push   $0x2
80105eab:	e9 09 fb ff ff       	jmp    801059b9 <alltraps>

80105eb0 <vector3>:
80105eb0:	6a 00                	push   $0x0
80105eb2:	6a 03                	push   $0x3
80105eb4:	e9 00 fb ff ff       	jmp    801059b9 <alltraps>

80105eb9 <vector4>:
80105eb9:	6a 00                	push   $0x0
80105ebb:	6a 04                	push   $0x4
80105ebd:	e9 f7 fa ff ff       	jmp    801059b9 <alltraps>

80105ec2 <vector5>:
80105ec2:	6a 00                	push   $0x0
80105ec4:	6a 05                	push   $0x5
80105ec6:	e9 ee fa ff ff       	jmp    801059b9 <alltraps>

80105ecb <vector6>:
80105ecb:	6a 00                	push   $0x0
80105ecd:	6a 06                	push   $0x6
80105ecf:	e9 e5 fa ff ff       	jmp    801059b9 <alltraps>

80105ed4 <vector7>:
80105ed4:	6a 00                	push   $0x0
80105ed6:	6a 07                	push   $0x7
80105ed8:	e9 dc fa ff ff       	jmp    801059b9 <alltraps>

80105edd <vector8>:
80105edd:	6a 08                	push   $0x8
80105edf:	e9 d5 fa ff ff       	jmp    801059b9 <alltraps>

80105ee4 <vector9>:
80105ee4:	6a 00                	push   $0x0
80105ee6:	6a 09                	push   $0x9
80105ee8:	e9 cc fa ff ff       	jmp    801059b9 <alltraps>

80105eed <vector10>:
80105eed:	6a 0a                	push   $0xa
80105eef:	e9 c5 fa ff ff       	jmp    801059b9 <alltraps>

80105ef4 <vector11>:
80105ef4:	6a 0b                	push   $0xb
80105ef6:	e9 be fa ff ff       	jmp    801059b9 <alltraps>

80105efb <vector12>:
80105efb:	6a 0c                	push   $0xc
80105efd:	e9 b7 fa ff ff       	jmp    801059b9 <alltraps>

80105f02 <vector13>:
80105f02:	6a 0d                	push   $0xd
80105f04:	e9 b0 fa ff ff       	jmp    801059b9 <alltraps>

80105f09 <vector14>:
80105f09:	6a 0e                	push   $0xe
80105f0b:	e9 a9 fa ff ff       	jmp    801059b9 <alltraps>

80105f10 <vector15>:
80105f10:	6a 00                	push   $0x0
80105f12:	6a 0f                	push   $0xf
80105f14:	e9 a0 fa ff ff       	jmp    801059b9 <alltraps>

80105f19 <vector16>:
80105f19:	6a 00                	push   $0x0
80105f1b:	6a 10                	push   $0x10
80105f1d:	e9 97 fa ff ff       	jmp    801059b9 <alltraps>

80105f22 <vector17>:
80105f22:	6a 11                	push   $0x11
80105f24:	e9 90 fa ff ff       	jmp    801059b9 <alltraps>

80105f29 <vector18>:
80105f29:	6a 00                	push   $0x0
80105f2b:	6a 12                	push   $0x12
80105f2d:	e9 87 fa ff ff       	jmp    801059b9 <alltraps>

80105f32 <vector19>:
80105f32:	6a 00                	push   $0x0
80105f34:	6a 13                	push   $0x13
80105f36:	e9 7e fa ff ff       	jmp    801059b9 <alltraps>

80105f3b <vector20>:
80105f3b:	6a 00                	push   $0x0
80105f3d:	6a 14                	push   $0x14
80105f3f:	e9 75 fa ff ff       	jmp    801059b9 <alltraps>

80105f44 <vector21>:
80105f44:	6a 00                	push   $0x0
80105f46:	6a 15                	push   $0x15
80105f48:	e9 6c fa ff ff       	jmp    801059b9 <alltraps>

80105f4d <vector22>:
80105f4d:	6a 00                	push   $0x0
80105f4f:	6a 16                	push   $0x16
80105f51:	e9 63 fa ff ff       	jmp    801059b9 <alltraps>

80105f56 <vector23>:
80105f56:	6a 00                	push   $0x0
80105f58:	6a 17                	push   $0x17
80105f5a:	e9 5a fa ff ff       	jmp    801059b9 <alltraps>

80105f5f <vector24>:
80105f5f:	6a 00                	push   $0x0
80105f61:	6a 18                	push   $0x18
80105f63:	e9 51 fa ff ff       	jmp    801059b9 <alltraps>

80105f68 <vector25>:
80105f68:	6a 00                	push   $0x0
80105f6a:	6a 19                	push   $0x19
80105f6c:	e9 48 fa ff ff       	jmp    801059b9 <alltraps>

80105f71 <vector26>:
80105f71:	6a 00                	push   $0x0
80105f73:	6a 1a                	push   $0x1a
80105f75:	e9 3f fa ff ff       	jmp    801059b9 <alltraps>

80105f7a <vector27>:
80105f7a:	6a 00                	push   $0x0
80105f7c:	6a 1b                	push   $0x1b
80105f7e:	e9 36 fa ff ff       	jmp    801059b9 <alltraps>

80105f83 <vector28>:
80105f83:	6a 00                	push   $0x0
80105f85:	6a 1c                	push   $0x1c
80105f87:	e9 2d fa ff ff       	jmp    801059b9 <alltraps>

80105f8c <vector29>:
80105f8c:	6a 00                	push   $0x0
80105f8e:	6a 1d                	push   $0x1d
80105f90:	e9 24 fa ff ff       	jmp    801059b9 <alltraps>

80105f95 <vector30>:
80105f95:	6a 00                	push   $0x0
80105f97:	6a 1e                	push   $0x1e
80105f99:	e9 1b fa ff ff       	jmp    801059b9 <alltraps>

80105f9e <vector31>:
80105f9e:	6a 00                	push   $0x0
80105fa0:	6a 1f                	push   $0x1f
80105fa2:	e9 12 fa ff ff       	jmp    801059b9 <alltraps>

80105fa7 <vector32>:
80105fa7:	6a 00                	push   $0x0
80105fa9:	6a 20                	push   $0x20
80105fab:	e9 09 fa ff ff       	jmp    801059b9 <alltraps>

80105fb0 <vector33>:
80105fb0:	6a 00                	push   $0x0
80105fb2:	6a 21                	push   $0x21
80105fb4:	e9 00 fa ff ff       	jmp    801059b9 <alltraps>

80105fb9 <vector34>:
80105fb9:	6a 00                	push   $0x0
80105fbb:	6a 22                	push   $0x22
80105fbd:	e9 f7 f9 ff ff       	jmp    801059b9 <alltraps>

80105fc2 <vector35>:
80105fc2:	6a 00                	push   $0x0
80105fc4:	6a 23                	push   $0x23
80105fc6:	e9 ee f9 ff ff       	jmp    801059b9 <alltraps>

80105fcb <vector36>:
80105fcb:	6a 00                	push   $0x0
80105fcd:	6a 24                	push   $0x24
80105fcf:	e9 e5 f9 ff ff       	jmp    801059b9 <alltraps>

80105fd4 <vector37>:
80105fd4:	6a 00                	push   $0x0
80105fd6:	6a 25                	push   $0x25
80105fd8:	e9 dc f9 ff ff       	jmp    801059b9 <alltraps>

80105fdd <vector38>:
80105fdd:	6a 00                	push   $0x0
80105fdf:	6a 26                	push   $0x26
80105fe1:	e9 d3 f9 ff ff       	jmp    801059b9 <alltraps>

80105fe6 <vector39>:
80105fe6:	6a 00                	push   $0x0
80105fe8:	6a 27                	push   $0x27
80105fea:	e9 ca f9 ff ff       	jmp    801059b9 <alltraps>

80105fef <vector40>:
80105fef:	6a 00                	push   $0x0
80105ff1:	6a 28                	push   $0x28
80105ff3:	e9 c1 f9 ff ff       	jmp    801059b9 <alltraps>

80105ff8 <vector41>:
80105ff8:	6a 00                	push   $0x0
80105ffa:	6a 29                	push   $0x29
80105ffc:	e9 b8 f9 ff ff       	jmp    801059b9 <alltraps>

80106001 <vector42>:
80106001:	6a 00                	push   $0x0
80106003:	6a 2a                	push   $0x2a
80106005:	e9 af f9 ff ff       	jmp    801059b9 <alltraps>

8010600a <vector43>:
8010600a:	6a 00                	push   $0x0
8010600c:	6a 2b                	push   $0x2b
8010600e:	e9 a6 f9 ff ff       	jmp    801059b9 <alltraps>

80106013 <vector44>:
80106013:	6a 00                	push   $0x0
80106015:	6a 2c                	push   $0x2c
80106017:	e9 9d f9 ff ff       	jmp    801059b9 <alltraps>

8010601c <vector45>:
8010601c:	6a 00                	push   $0x0
8010601e:	6a 2d                	push   $0x2d
80106020:	e9 94 f9 ff ff       	jmp    801059b9 <alltraps>

80106025 <vector46>:
80106025:	6a 00                	push   $0x0
80106027:	6a 2e                	push   $0x2e
80106029:	e9 8b f9 ff ff       	jmp    801059b9 <alltraps>

8010602e <vector47>:
8010602e:	6a 00                	push   $0x0
80106030:	6a 2f                	push   $0x2f
80106032:	e9 82 f9 ff ff       	jmp    801059b9 <alltraps>

80106037 <vector48>:
80106037:	6a 00                	push   $0x0
80106039:	6a 30                	push   $0x30
8010603b:	e9 79 f9 ff ff       	jmp    801059b9 <alltraps>

80106040 <vector49>:
80106040:	6a 00                	push   $0x0
80106042:	6a 31                	push   $0x31
80106044:	e9 70 f9 ff ff       	jmp    801059b9 <alltraps>

80106049 <vector50>:
80106049:	6a 00                	push   $0x0
8010604b:	6a 32                	push   $0x32
8010604d:	e9 67 f9 ff ff       	jmp    801059b9 <alltraps>

80106052 <vector51>:
80106052:	6a 00                	push   $0x0
80106054:	6a 33                	push   $0x33
80106056:	e9 5e f9 ff ff       	jmp    801059b9 <alltraps>

8010605b <vector52>:
8010605b:	6a 00                	push   $0x0
8010605d:	6a 34                	push   $0x34
8010605f:	e9 55 f9 ff ff       	jmp    801059b9 <alltraps>

80106064 <vector53>:
80106064:	6a 00                	push   $0x0
80106066:	6a 35                	push   $0x35
80106068:	e9 4c f9 ff ff       	jmp    801059b9 <alltraps>

8010606d <vector54>:
8010606d:	6a 00                	push   $0x0
8010606f:	6a 36                	push   $0x36
80106071:	e9 43 f9 ff ff       	jmp    801059b9 <alltraps>

80106076 <vector55>:
80106076:	6a 00                	push   $0x0
80106078:	6a 37                	push   $0x37
8010607a:	e9 3a f9 ff ff       	jmp    801059b9 <alltraps>

8010607f <vector56>:
8010607f:	6a 00                	push   $0x0
80106081:	6a 38                	push   $0x38
80106083:	e9 31 f9 ff ff       	jmp    801059b9 <alltraps>

80106088 <vector57>:
80106088:	6a 00                	push   $0x0
8010608a:	6a 39                	push   $0x39
8010608c:	e9 28 f9 ff ff       	jmp    801059b9 <alltraps>

80106091 <vector58>:
80106091:	6a 00                	push   $0x0
80106093:	6a 3a                	push   $0x3a
80106095:	e9 1f f9 ff ff       	jmp    801059b9 <alltraps>

8010609a <vector59>:
8010609a:	6a 00                	push   $0x0
8010609c:	6a 3b                	push   $0x3b
8010609e:	e9 16 f9 ff ff       	jmp    801059b9 <alltraps>

801060a3 <vector60>:
801060a3:	6a 00                	push   $0x0
801060a5:	6a 3c                	push   $0x3c
801060a7:	e9 0d f9 ff ff       	jmp    801059b9 <alltraps>

801060ac <vector61>:
801060ac:	6a 00                	push   $0x0
801060ae:	6a 3d                	push   $0x3d
801060b0:	e9 04 f9 ff ff       	jmp    801059b9 <alltraps>

801060b5 <vector62>:
801060b5:	6a 00                	push   $0x0
801060b7:	6a 3e                	push   $0x3e
801060b9:	e9 fb f8 ff ff       	jmp    801059b9 <alltraps>

801060be <vector63>:
801060be:	6a 00                	push   $0x0
801060c0:	6a 3f                	push   $0x3f
801060c2:	e9 f2 f8 ff ff       	jmp    801059b9 <alltraps>

801060c7 <vector64>:
801060c7:	6a 00                	push   $0x0
801060c9:	6a 40                	push   $0x40
801060cb:	e9 e9 f8 ff ff       	jmp    801059b9 <alltraps>

801060d0 <vector65>:
801060d0:	6a 00                	push   $0x0
801060d2:	6a 41                	push   $0x41
801060d4:	e9 e0 f8 ff ff       	jmp    801059b9 <alltraps>

801060d9 <vector66>:
801060d9:	6a 00                	push   $0x0
801060db:	6a 42                	push   $0x42
801060dd:	e9 d7 f8 ff ff       	jmp    801059b9 <alltraps>

801060e2 <vector67>:
801060e2:	6a 00                	push   $0x0
801060e4:	6a 43                	push   $0x43
801060e6:	e9 ce f8 ff ff       	jmp    801059b9 <alltraps>

801060eb <vector68>:
801060eb:	6a 00                	push   $0x0
801060ed:	6a 44                	push   $0x44
801060ef:	e9 c5 f8 ff ff       	jmp    801059b9 <alltraps>

801060f4 <vector69>:
801060f4:	6a 00                	push   $0x0
801060f6:	6a 45                	push   $0x45
801060f8:	e9 bc f8 ff ff       	jmp    801059b9 <alltraps>

801060fd <vector70>:
801060fd:	6a 00                	push   $0x0
801060ff:	6a 46                	push   $0x46
80106101:	e9 b3 f8 ff ff       	jmp    801059b9 <alltraps>

80106106 <vector71>:
80106106:	6a 00                	push   $0x0
80106108:	6a 47                	push   $0x47
8010610a:	e9 aa f8 ff ff       	jmp    801059b9 <alltraps>

8010610f <vector72>:
8010610f:	6a 00                	push   $0x0
80106111:	6a 48                	push   $0x48
80106113:	e9 a1 f8 ff ff       	jmp    801059b9 <alltraps>

80106118 <vector73>:
80106118:	6a 00                	push   $0x0
8010611a:	6a 49                	push   $0x49
8010611c:	e9 98 f8 ff ff       	jmp    801059b9 <alltraps>

80106121 <vector74>:
80106121:	6a 00                	push   $0x0
80106123:	6a 4a                	push   $0x4a
80106125:	e9 8f f8 ff ff       	jmp    801059b9 <alltraps>

8010612a <vector75>:
8010612a:	6a 00                	push   $0x0
8010612c:	6a 4b                	push   $0x4b
8010612e:	e9 86 f8 ff ff       	jmp    801059b9 <alltraps>

80106133 <vector76>:
80106133:	6a 00                	push   $0x0
80106135:	6a 4c                	push   $0x4c
80106137:	e9 7d f8 ff ff       	jmp    801059b9 <alltraps>

8010613c <vector77>:
8010613c:	6a 00                	push   $0x0
8010613e:	6a 4d                	push   $0x4d
80106140:	e9 74 f8 ff ff       	jmp    801059b9 <alltraps>

80106145 <vector78>:
80106145:	6a 00                	push   $0x0
80106147:	6a 4e                	push   $0x4e
80106149:	e9 6b f8 ff ff       	jmp    801059b9 <alltraps>

8010614e <vector79>:
8010614e:	6a 00                	push   $0x0
80106150:	6a 4f                	push   $0x4f
80106152:	e9 62 f8 ff ff       	jmp    801059b9 <alltraps>

80106157 <vector80>:
80106157:	6a 00                	push   $0x0
80106159:	6a 50                	push   $0x50
8010615b:	e9 59 f8 ff ff       	jmp    801059b9 <alltraps>

80106160 <vector81>:
80106160:	6a 00                	push   $0x0
80106162:	6a 51                	push   $0x51
80106164:	e9 50 f8 ff ff       	jmp    801059b9 <alltraps>

80106169 <vector82>:
80106169:	6a 00                	push   $0x0
8010616b:	6a 52                	push   $0x52
8010616d:	e9 47 f8 ff ff       	jmp    801059b9 <alltraps>

80106172 <vector83>:
80106172:	6a 00                	push   $0x0
80106174:	6a 53                	push   $0x53
80106176:	e9 3e f8 ff ff       	jmp    801059b9 <alltraps>

8010617b <vector84>:
8010617b:	6a 00                	push   $0x0
8010617d:	6a 54                	push   $0x54
8010617f:	e9 35 f8 ff ff       	jmp    801059b9 <alltraps>

80106184 <vector85>:
80106184:	6a 00                	push   $0x0
80106186:	6a 55                	push   $0x55
80106188:	e9 2c f8 ff ff       	jmp    801059b9 <alltraps>

8010618d <vector86>:
8010618d:	6a 00                	push   $0x0
8010618f:	6a 56                	push   $0x56
80106191:	e9 23 f8 ff ff       	jmp    801059b9 <alltraps>

80106196 <vector87>:
80106196:	6a 00                	push   $0x0
80106198:	6a 57                	push   $0x57
8010619a:	e9 1a f8 ff ff       	jmp    801059b9 <alltraps>

8010619f <vector88>:
8010619f:	6a 00                	push   $0x0
801061a1:	6a 58                	push   $0x58
801061a3:	e9 11 f8 ff ff       	jmp    801059b9 <alltraps>

801061a8 <vector89>:
801061a8:	6a 00                	push   $0x0
801061aa:	6a 59                	push   $0x59
801061ac:	e9 08 f8 ff ff       	jmp    801059b9 <alltraps>

801061b1 <vector90>:
801061b1:	6a 00                	push   $0x0
801061b3:	6a 5a                	push   $0x5a
801061b5:	e9 ff f7 ff ff       	jmp    801059b9 <alltraps>

801061ba <vector91>:
801061ba:	6a 00                	push   $0x0
801061bc:	6a 5b                	push   $0x5b
801061be:	e9 f6 f7 ff ff       	jmp    801059b9 <alltraps>

801061c3 <vector92>:
801061c3:	6a 00                	push   $0x0
801061c5:	6a 5c                	push   $0x5c
801061c7:	e9 ed f7 ff ff       	jmp    801059b9 <alltraps>

801061cc <vector93>:
801061cc:	6a 00                	push   $0x0
801061ce:	6a 5d                	push   $0x5d
801061d0:	e9 e4 f7 ff ff       	jmp    801059b9 <alltraps>

801061d5 <vector94>:
801061d5:	6a 00                	push   $0x0
801061d7:	6a 5e                	push   $0x5e
801061d9:	e9 db f7 ff ff       	jmp    801059b9 <alltraps>

801061de <vector95>:
801061de:	6a 00                	push   $0x0
801061e0:	6a 5f                	push   $0x5f
801061e2:	e9 d2 f7 ff ff       	jmp    801059b9 <alltraps>

801061e7 <vector96>:
801061e7:	6a 00                	push   $0x0
801061e9:	6a 60                	push   $0x60
801061eb:	e9 c9 f7 ff ff       	jmp    801059b9 <alltraps>

801061f0 <vector97>:
801061f0:	6a 00                	push   $0x0
801061f2:	6a 61                	push   $0x61
801061f4:	e9 c0 f7 ff ff       	jmp    801059b9 <alltraps>

801061f9 <vector98>:
801061f9:	6a 00                	push   $0x0
801061fb:	6a 62                	push   $0x62
801061fd:	e9 b7 f7 ff ff       	jmp    801059b9 <alltraps>

80106202 <vector99>:
80106202:	6a 00                	push   $0x0
80106204:	6a 63                	push   $0x63
80106206:	e9 ae f7 ff ff       	jmp    801059b9 <alltraps>

8010620b <vector100>:
8010620b:	6a 00                	push   $0x0
8010620d:	6a 64                	push   $0x64
8010620f:	e9 a5 f7 ff ff       	jmp    801059b9 <alltraps>

80106214 <vector101>:
80106214:	6a 00                	push   $0x0
80106216:	6a 65                	push   $0x65
80106218:	e9 9c f7 ff ff       	jmp    801059b9 <alltraps>

8010621d <vector102>:
8010621d:	6a 00                	push   $0x0
8010621f:	6a 66                	push   $0x66
80106221:	e9 93 f7 ff ff       	jmp    801059b9 <alltraps>

80106226 <vector103>:
80106226:	6a 00                	push   $0x0
80106228:	6a 67                	push   $0x67
8010622a:	e9 8a f7 ff ff       	jmp    801059b9 <alltraps>

8010622f <vector104>:
8010622f:	6a 00                	push   $0x0
80106231:	6a 68                	push   $0x68
80106233:	e9 81 f7 ff ff       	jmp    801059b9 <alltraps>

80106238 <vector105>:
80106238:	6a 00                	push   $0x0
8010623a:	6a 69                	push   $0x69
8010623c:	e9 78 f7 ff ff       	jmp    801059b9 <alltraps>

80106241 <vector106>:
80106241:	6a 00                	push   $0x0
80106243:	6a 6a                	push   $0x6a
80106245:	e9 6f f7 ff ff       	jmp    801059b9 <alltraps>

8010624a <vector107>:
8010624a:	6a 00                	push   $0x0
8010624c:	6a 6b                	push   $0x6b
8010624e:	e9 66 f7 ff ff       	jmp    801059b9 <alltraps>

80106253 <vector108>:
80106253:	6a 00                	push   $0x0
80106255:	6a 6c                	push   $0x6c
80106257:	e9 5d f7 ff ff       	jmp    801059b9 <alltraps>

8010625c <vector109>:
8010625c:	6a 00                	push   $0x0
8010625e:	6a 6d                	push   $0x6d
80106260:	e9 54 f7 ff ff       	jmp    801059b9 <alltraps>

80106265 <vector110>:
80106265:	6a 00                	push   $0x0
80106267:	6a 6e                	push   $0x6e
80106269:	e9 4b f7 ff ff       	jmp    801059b9 <alltraps>

8010626e <vector111>:
8010626e:	6a 00                	push   $0x0
80106270:	6a 6f                	push   $0x6f
80106272:	e9 42 f7 ff ff       	jmp    801059b9 <alltraps>

80106277 <vector112>:
80106277:	6a 00                	push   $0x0
80106279:	6a 70                	push   $0x70
8010627b:	e9 39 f7 ff ff       	jmp    801059b9 <alltraps>

80106280 <vector113>:
80106280:	6a 00                	push   $0x0
80106282:	6a 71                	push   $0x71
80106284:	e9 30 f7 ff ff       	jmp    801059b9 <alltraps>

80106289 <vector114>:
80106289:	6a 00                	push   $0x0
8010628b:	6a 72                	push   $0x72
8010628d:	e9 27 f7 ff ff       	jmp    801059b9 <alltraps>

80106292 <vector115>:
80106292:	6a 00                	push   $0x0
80106294:	6a 73                	push   $0x73
80106296:	e9 1e f7 ff ff       	jmp    801059b9 <alltraps>

8010629b <vector116>:
8010629b:	6a 00                	push   $0x0
8010629d:	6a 74                	push   $0x74
8010629f:	e9 15 f7 ff ff       	jmp    801059b9 <alltraps>

801062a4 <vector117>:
801062a4:	6a 00                	push   $0x0
801062a6:	6a 75                	push   $0x75
801062a8:	e9 0c f7 ff ff       	jmp    801059b9 <alltraps>

801062ad <vector118>:
801062ad:	6a 00                	push   $0x0
801062af:	6a 76                	push   $0x76
801062b1:	e9 03 f7 ff ff       	jmp    801059b9 <alltraps>

801062b6 <vector119>:
801062b6:	6a 00                	push   $0x0
801062b8:	6a 77                	push   $0x77
801062ba:	e9 fa f6 ff ff       	jmp    801059b9 <alltraps>

801062bf <vector120>:
801062bf:	6a 00                	push   $0x0
801062c1:	6a 78                	push   $0x78
801062c3:	e9 f1 f6 ff ff       	jmp    801059b9 <alltraps>

801062c8 <vector121>:
801062c8:	6a 00                	push   $0x0
801062ca:	6a 79                	push   $0x79
801062cc:	e9 e8 f6 ff ff       	jmp    801059b9 <alltraps>

801062d1 <vector122>:
801062d1:	6a 00                	push   $0x0
801062d3:	6a 7a                	push   $0x7a
801062d5:	e9 df f6 ff ff       	jmp    801059b9 <alltraps>

801062da <vector123>:
801062da:	6a 00                	push   $0x0
801062dc:	6a 7b                	push   $0x7b
801062de:	e9 d6 f6 ff ff       	jmp    801059b9 <alltraps>

801062e3 <vector124>:
801062e3:	6a 00                	push   $0x0
801062e5:	6a 7c                	push   $0x7c
801062e7:	e9 cd f6 ff ff       	jmp    801059b9 <alltraps>

801062ec <vector125>:
801062ec:	6a 00                	push   $0x0
801062ee:	6a 7d                	push   $0x7d
801062f0:	e9 c4 f6 ff ff       	jmp    801059b9 <alltraps>

801062f5 <vector126>:
801062f5:	6a 00                	push   $0x0
801062f7:	6a 7e                	push   $0x7e
801062f9:	e9 bb f6 ff ff       	jmp    801059b9 <alltraps>

801062fe <vector127>:
801062fe:	6a 00                	push   $0x0
80106300:	6a 7f                	push   $0x7f
80106302:	e9 b2 f6 ff ff       	jmp    801059b9 <alltraps>

80106307 <vector128>:
80106307:	6a 00                	push   $0x0
80106309:	68 80 00 00 00       	push   $0x80
8010630e:	e9 a6 f6 ff ff       	jmp    801059b9 <alltraps>

80106313 <vector129>:
80106313:	6a 00                	push   $0x0
80106315:	68 81 00 00 00       	push   $0x81
8010631a:	e9 9a f6 ff ff       	jmp    801059b9 <alltraps>

8010631f <vector130>:
8010631f:	6a 00                	push   $0x0
80106321:	68 82 00 00 00       	push   $0x82
80106326:	e9 8e f6 ff ff       	jmp    801059b9 <alltraps>

8010632b <vector131>:
8010632b:	6a 00                	push   $0x0
8010632d:	68 83 00 00 00       	push   $0x83
80106332:	e9 82 f6 ff ff       	jmp    801059b9 <alltraps>

80106337 <vector132>:
80106337:	6a 00                	push   $0x0
80106339:	68 84 00 00 00       	push   $0x84
8010633e:	e9 76 f6 ff ff       	jmp    801059b9 <alltraps>

80106343 <vector133>:
80106343:	6a 00                	push   $0x0
80106345:	68 85 00 00 00       	push   $0x85
8010634a:	e9 6a f6 ff ff       	jmp    801059b9 <alltraps>

8010634f <vector134>:
8010634f:	6a 00                	push   $0x0
80106351:	68 86 00 00 00       	push   $0x86
80106356:	e9 5e f6 ff ff       	jmp    801059b9 <alltraps>

8010635b <vector135>:
8010635b:	6a 00                	push   $0x0
8010635d:	68 87 00 00 00       	push   $0x87
80106362:	e9 52 f6 ff ff       	jmp    801059b9 <alltraps>

80106367 <vector136>:
80106367:	6a 00                	push   $0x0
80106369:	68 88 00 00 00       	push   $0x88
8010636e:	e9 46 f6 ff ff       	jmp    801059b9 <alltraps>

80106373 <vector137>:
80106373:	6a 00                	push   $0x0
80106375:	68 89 00 00 00       	push   $0x89
8010637a:	e9 3a f6 ff ff       	jmp    801059b9 <alltraps>

8010637f <vector138>:
8010637f:	6a 00                	push   $0x0
80106381:	68 8a 00 00 00       	push   $0x8a
80106386:	e9 2e f6 ff ff       	jmp    801059b9 <alltraps>

8010638b <vector139>:
8010638b:	6a 00                	push   $0x0
8010638d:	68 8b 00 00 00       	push   $0x8b
80106392:	e9 22 f6 ff ff       	jmp    801059b9 <alltraps>

80106397 <vector140>:
80106397:	6a 00                	push   $0x0
80106399:	68 8c 00 00 00       	push   $0x8c
8010639e:	e9 16 f6 ff ff       	jmp    801059b9 <alltraps>

801063a3 <vector141>:
801063a3:	6a 00                	push   $0x0
801063a5:	68 8d 00 00 00       	push   $0x8d
801063aa:	e9 0a f6 ff ff       	jmp    801059b9 <alltraps>

801063af <vector142>:
801063af:	6a 00                	push   $0x0
801063b1:	68 8e 00 00 00       	push   $0x8e
801063b6:	e9 fe f5 ff ff       	jmp    801059b9 <alltraps>

801063bb <vector143>:
801063bb:	6a 00                	push   $0x0
801063bd:	68 8f 00 00 00       	push   $0x8f
801063c2:	e9 f2 f5 ff ff       	jmp    801059b9 <alltraps>

801063c7 <vector144>:
801063c7:	6a 00                	push   $0x0
801063c9:	68 90 00 00 00       	push   $0x90
801063ce:	e9 e6 f5 ff ff       	jmp    801059b9 <alltraps>

801063d3 <vector145>:
801063d3:	6a 00                	push   $0x0
801063d5:	68 91 00 00 00       	push   $0x91
801063da:	e9 da f5 ff ff       	jmp    801059b9 <alltraps>

801063df <vector146>:
801063df:	6a 00                	push   $0x0
801063e1:	68 92 00 00 00       	push   $0x92
801063e6:	e9 ce f5 ff ff       	jmp    801059b9 <alltraps>

801063eb <vector147>:
801063eb:	6a 00                	push   $0x0
801063ed:	68 93 00 00 00       	push   $0x93
801063f2:	e9 c2 f5 ff ff       	jmp    801059b9 <alltraps>

801063f7 <vector148>:
801063f7:	6a 00                	push   $0x0
801063f9:	68 94 00 00 00       	push   $0x94
801063fe:	e9 b6 f5 ff ff       	jmp    801059b9 <alltraps>

80106403 <vector149>:
80106403:	6a 00                	push   $0x0
80106405:	68 95 00 00 00       	push   $0x95
8010640a:	e9 aa f5 ff ff       	jmp    801059b9 <alltraps>

8010640f <vector150>:
8010640f:	6a 00                	push   $0x0
80106411:	68 96 00 00 00       	push   $0x96
80106416:	e9 9e f5 ff ff       	jmp    801059b9 <alltraps>

8010641b <vector151>:
8010641b:	6a 00                	push   $0x0
8010641d:	68 97 00 00 00       	push   $0x97
80106422:	e9 92 f5 ff ff       	jmp    801059b9 <alltraps>

80106427 <vector152>:
80106427:	6a 00                	push   $0x0
80106429:	68 98 00 00 00       	push   $0x98
8010642e:	e9 86 f5 ff ff       	jmp    801059b9 <alltraps>

80106433 <vector153>:
80106433:	6a 00                	push   $0x0
80106435:	68 99 00 00 00       	push   $0x99
8010643a:	e9 7a f5 ff ff       	jmp    801059b9 <alltraps>

8010643f <vector154>:
8010643f:	6a 00                	push   $0x0
80106441:	68 9a 00 00 00       	push   $0x9a
80106446:	e9 6e f5 ff ff       	jmp    801059b9 <alltraps>

8010644b <vector155>:
8010644b:	6a 00                	push   $0x0
8010644d:	68 9b 00 00 00       	push   $0x9b
80106452:	e9 62 f5 ff ff       	jmp    801059b9 <alltraps>

80106457 <vector156>:
80106457:	6a 00                	push   $0x0
80106459:	68 9c 00 00 00       	push   $0x9c
8010645e:	e9 56 f5 ff ff       	jmp    801059b9 <alltraps>

80106463 <vector157>:
80106463:	6a 00                	push   $0x0
80106465:	68 9d 00 00 00       	push   $0x9d
8010646a:	e9 4a f5 ff ff       	jmp    801059b9 <alltraps>

8010646f <vector158>:
8010646f:	6a 00                	push   $0x0
80106471:	68 9e 00 00 00       	push   $0x9e
80106476:	e9 3e f5 ff ff       	jmp    801059b9 <alltraps>

8010647b <vector159>:
8010647b:	6a 00                	push   $0x0
8010647d:	68 9f 00 00 00       	push   $0x9f
80106482:	e9 32 f5 ff ff       	jmp    801059b9 <alltraps>

80106487 <vector160>:
80106487:	6a 00                	push   $0x0
80106489:	68 a0 00 00 00       	push   $0xa0
8010648e:	e9 26 f5 ff ff       	jmp    801059b9 <alltraps>

80106493 <vector161>:
80106493:	6a 00                	push   $0x0
80106495:	68 a1 00 00 00       	push   $0xa1
8010649a:	e9 1a f5 ff ff       	jmp    801059b9 <alltraps>

8010649f <vector162>:
8010649f:	6a 00                	push   $0x0
801064a1:	68 a2 00 00 00       	push   $0xa2
801064a6:	e9 0e f5 ff ff       	jmp    801059b9 <alltraps>

801064ab <vector163>:
801064ab:	6a 00                	push   $0x0
801064ad:	68 a3 00 00 00       	push   $0xa3
801064b2:	e9 02 f5 ff ff       	jmp    801059b9 <alltraps>

801064b7 <vector164>:
801064b7:	6a 00                	push   $0x0
801064b9:	68 a4 00 00 00       	push   $0xa4
801064be:	e9 f6 f4 ff ff       	jmp    801059b9 <alltraps>

801064c3 <vector165>:
801064c3:	6a 00                	push   $0x0
801064c5:	68 a5 00 00 00       	push   $0xa5
801064ca:	e9 ea f4 ff ff       	jmp    801059b9 <alltraps>

801064cf <vector166>:
801064cf:	6a 00                	push   $0x0
801064d1:	68 a6 00 00 00       	push   $0xa6
801064d6:	e9 de f4 ff ff       	jmp    801059b9 <alltraps>

801064db <vector167>:
801064db:	6a 00                	push   $0x0
801064dd:	68 a7 00 00 00       	push   $0xa7
801064e2:	e9 d2 f4 ff ff       	jmp    801059b9 <alltraps>

801064e7 <vector168>:
801064e7:	6a 00                	push   $0x0
801064e9:	68 a8 00 00 00       	push   $0xa8
801064ee:	e9 c6 f4 ff ff       	jmp    801059b9 <alltraps>

801064f3 <vector169>:
801064f3:	6a 00                	push   $0x0
801064f5:	68 a9 00 00 00       	push   $0xa9
801064fa:	e9 ba f4 ff ff       	jmp    801059b9 <alltraps>

801064ff <vector170>:
801064ff:	6a 00                	push   $0x0
80106501:	68 aa 00 00 00       	push   $0xaa
80106506:	e9 ae f4 ff ff       	jmp    801059b9 <alltraps>

8010650b <vector171>:
8010650b:	6a 00                	push   $0x0
8010650d:	68 ab 00 00 00       	push   $0xab
80106512:	e9 a2 f4 ff ff       	jmp    801059b9 <alltraps>

80106517 <vector172>:
80106517:	6a 00                	push   $0x0
80106519:	68 ac 00 00 00       	push   $0xac
8010651e:	e9 96 f4 ff ff       	jmp    801059b9 <alltraps>

80106523 <vector173>:
80106523:	6a 00                	push   $0x0
80106525:	68 ad 00 00 00       	push   $0xad
8010652a:	e9 8a f4 ff ff       	jmp    801059b9 <alltraps>

8010652f <vector174>:
8010652f:	6a 00                	push   $0x0
80106531:	68 ae 00 00 00       	push   $0xae
80106536:	e9 7e f4 ff ff       	jmp    801059b9 <alltraps>

8010653b <vector175>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 af 00 00 00       	push   $0xaf
80106542:	e9 72 f4 ff ff       	jmp    801059b9 <alltraps>

80106547 <vector176>:
80106547:	6a 00                	push   $0x0
80106549:	68 b0 00 00 00       	push   $0xb0
8010654e:	e9 66 f4 ff ff       	jmp    801059b9 <alltraps>

80106553 <vector177>:
80106553:	6a 00                	push   $0x0
80106555:	68 b1 00 00 00       	push   $0xb1
8010655a:	e9 5a f4 ff ff       	jmp    801059b9 <alltraps>

8010655f <vector178>:
8010655f:	6a 00                	push   $0x0
80106561:	68 b2 00 00 00       	push   $0xb2
80106566:	e9 4e f4 ff ff       	jmp    801059b9 <alltraps>

8010656b <vector179>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 b3 00 00 00       	push   $0xb3
80106572:	e9 42 f4 ff ff       	jmp    801059b9 <alltraps>

80106577 <vector180>:
80106577:	6a 00                	push   $0x0
80106579:	68 b4 00 00 00       	push   $0xb4
8010657e:	e9 36 f4 ff ff       	jmp    801059b9 <alltraps>

80106583 <vector181>:
80106583:	6a 00                	push   $0x0
80106585:	68 b5 00 00 00       	push   $0xb5
8010658a:	e9 2a f4 ff ff       	jmp    801059b9 <alltraps>

8010658f <vector182>:
8010658f:	6a 00                	push   $0x0
80106591:	68 b6 00 00 00       	push   $0xb6
80106596:	e9 1e f4 ff ff       	jmp    801059b9 <alltraps>

8010659b <vector183>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 b7 00 00 00       	push   $0xb7
801065a2:	e9 12 f4 ff ff       	jmp    801059b9 <alltraps>

801065a7 <vector184>:
801065a7:	6a 00                	push   $0x0
801065a9:	68 b8 00 00 00       	push   $0xb8
801065ae:	e9 06 f4 ff ff       	jmp    801059b9 <alltraps>

801065b3 <vector185>:
801065b3:	6a 00                	push   $0x0
801065b5:	68 b9 00 00 00       	push   $0xb9
801065ba:	e9 fa f3 ff ff       	jmp    801059b9 <alltraps>

801065bf <vector186>:
801065bf:	6a 00                	push   $0x0
801065c1:	68 ba 00 00 00       	push   $0xba
801065c6:	e9 ee f3 ff ff       	jmp    801059b9 <alltraps>

801065cb <vector187>:
801065cb:	6a 00                	push   $0x0
801065cd:	68 bb 00 00 00       	push   $0xbb
801065d2:	e9 e2 f3 ff ff       	jmp    801059b9 <alltraps>

801065d7 <vector188>:
801065d7:	6a 00                	push   $0x0
801065d9:	68 bc 00 00 00       	push   $0xbc
801065de:	e9 d6 f3 ff ff       	jmp    801059b9 <alltraps>

801065e3 <vector189>:
801065e3:	6a 00                	push   $0x0
801065e5:	68 bd 00 00 00       	push   $0xbd
801065ea:	e9 ca f3 ff ff       	jmp    801059b9 <alltraps>

801065ef <vector190>:
801065ef:	6a 00                	push   $0x0
801065f1:	68 be 00 00 00       	push   $0xbe
801065f6:	e9 be f3 ff ff       	jmp    801059b9 <alltraps>

801065fb <vector191>:
801065fb:	6a 00                	push   $0x0
801065fd:	68 bf 00 00 00       	push   $0xbf
80106602:	e9 b2 f3 ff ff       	jmp    801059b9 <alltraps>

80106607 <vector192>:
80106607:	6a 00                	push   $0x0
80106609:	68 c0 00 00 00       	push   $0xc0
8010660e:	e9 a6 f3 ff ff       	jmp    801059b9 <alltraps>

80106613 <vector193>:
80106613:	6a 00                	push   $0x0
80106615:	68 c1 00 00 00       	push   $0xc1
8010661a:	e9 9a f3 ff ff       	jmp    801059b9 <alltraps>

8010661f <vector194>:
8010661f:	6a 00                	push   $0x0
80106621:	68 c2 00 00 00       	push   $0xc2
80106626:	e9 8e f3 ff ff       	jmp    801059b9 <alltraps>

8010662b <vector195>:
8010662b:	6a 00                	push   $0x0
8010662d:	68 c3 00 00 00       	push   $0xc3
80106632:	e9 82 f3 ff ff       	jmp    801059b9 <alltraps>

80106637 <vector196>:
80106637:	6a 00                	push   $0x0
80106639:	68 c4 00 00 00       	push   $0xc4
8010663e:	e9 76 f3 ff ff       	jmp    801059b9 <alltraps>

80106643 <vector197>:
80106643:	6a 00                	push   $0x0
80106645:	68 c5 00 00 00       	push   $0xc5
8010664a:	e9 6a f3 ff ff       	jmp    801059b9 <alltraps>

8010664f <vector198>:
8010664f:	6a 00                	push   $0x0
80106651:	68 c6 00 00 00       	push   $0xc6
80106656:	e9 5e f3 ff ff       	jmp    801059b9 <alltraps>

8010665b <vector199>:
8010665b:	6a 00                	push   $0x0
8010665d:	68 c7 00 00 00       	push   $0xc7
80106662:	e9 52 f3 ff ff       	jmp    801059b9 <alltraps>

80106667 <vector200>:
80106667:	6a 00                	push   $0x0
80106669:	68 c8 00 00 00       	push   $0xc8
8010666e:	e9 46 f3 ff ff       	jmp    801059b9 <alltraps>

80106673 <vector201>:
80106673:	6a 00                	push   $0x0
80106675:	68 c9 00 00 00       	push   $0xc9
8010667a:	e9 3a f3 ff ff       	jmp    801059b9 <alltraps>

8010667f <vector202>:
8010667f:	6a 00                	push   $0x0
80106681:	68 ca 00 00 00       	push   $0xca
80106686:	e9 2e f3 ff ff       	jmp    801059b9 <alltraps>

8010668b <vector203>:
8010668b:	6a 00                	push   $0x0
8010668d:	68 cb 00 00 00       	push   $0xcb
80106692:	e9 22 f3 ff ff       	jmp    801059b9 <alltraps>

80106697 <vector204>:
80106697:	6a 00                	push   $0x0
80106699:	68 cc 00 00 00       	push   $0xcc
8010669e:	e9 16 f3 ff ff       	jmp    801059b9 <alltraps>

801066a3 <vector205>:
801066a3:	6a 00                	push   $0x0
801066a5:	68 cd 00 00 00       	push   $0xcd
801066aa:	e9 0a f3 ff ff       	jmp    801059b9 <alltraps>

801066af <vector206>:
801066af:	6a 00                	push   $0x0
801066b1:	68 ce 00 00 00       	push   $0xce
801066b6:	e9 fe f2 ff ff       	jmp    801059b9 <alltraps>

801066bb <vector207>:
801066bb:	6a 00                	push   $0x0
801066bd:	68 cf 00 00 00       	push   $0xcf
801066c2:	e9 f2 f2 ff ff       	jmp    801059b9 <alltraps>

801066c7 <vector208>:
801066c7:	6a 00                	push   $0x0
801066c9:	68 d0 00 00 00       	push   $0xd0
801066ce:	e9 e6 f2 ff ff       	jmp    801059b9 <alltraps>

801066d3 <vector209>:
801066d3:	6a 00                	push   $0x0
801066d5:	68 d1 00 00 00       	push   $0xd1
801066da:	e9 da f2 ff ff       	jmp    801059b9 <alltraps>

801066df <vector210>:
801066df:	6a 00                	push   $0x0
801066e1:	68 d2 00 00 00       	push   $0xd2
801066e6:	e9 ce f2 ff ff       	jmp    801059b9 <alltraps>

801066eb <vector211>:
801066eb:	6a 00                	push   $0x0
801066ed:	68 d3 00 00 00       	push   $0xd3
801066f2:	e9 c2 f2 ff ff       	jmp    801059b9 <alltraps>

801066f7 <vector212>:
801066f7:	6a 00                	push   $0x0
801066f9:	68 d4 00 00 00       	push   $0xd4
801066fe:	e9 b6 f2 ff ff       	jmp    801059b9 <alltraps>

80106703 <vector213>:
80106703:	6a 00                	push   $0x0
80106705:	68 d5 00 00 00       	push   $0xd5
8010670a:	e9 aa f2 ff ff       	jmp    801059b9 <alltraps>

8010670f <vector214>:
8010670f:	6a 00                	push   $0x0
80106711:	68 d6 00 00 00       	push   $0xd6
80106716:	e9 9e f2 ff ff       	jmp    801059b9 <alltraps>

8010671b <vector215>:
8010671b:	6a 00                	push   $0x0
8010671d:	68 d7 00 00 00       	push   $0xd7
80106722:	e9 92 f2 ff ff       	jmp    801059b9 <alltraps>

80106727 <vector216>:
80106727:	6a 00                	push   $0x0
80106729:	68 d8 00 00 00       	push   $0xd8
8010672e:	e9 86 f2 ff ff       	jmp    801059b9 <alltraps>

80106733 <vector217>:
80106733:	6a 00                	push   $0x0
80106735:	68 d9 00 00 00       	push   $0xd9
8010673a:	e9 7a f2 ff ff       	jmp    801059b9 <alltraps>

8010673f <vector218>:
8010673f:	6a 00                	push   $0x0
80106741:	68 da 00 00 00       	push   $0xda
80106746:	e9 6e f2 ff ff       	jmp    801059b9 <alltraps>

8010674b <vector219>:
8010674b:	6a 00                	push   $0x0
8010674d:	68 db 00 00 00       	push   $0xdb
80106752:	e9 62 f2 ff ff       	jmp    801059b9 <alltraps>

80106757 <vector220>:
80106757:	6a 00                	push   $0x0
80106759:	68 dc 00 00 00       	push   $0xdc
8010675e:	e9 56 f2 ff ff       	jmp    801059b9 <alltraps>

80106763 <vector221>:
80106763:	6a 00                	push   $0x0
80106765:	68 dd 00 00 00       	push   $0xdd
8010676a:	e9 4a f2 ff ff       	jmp    801059b9 <alltraps>

8010676f <vector222>:
8010676f:	6a 00                	push   $0x0
80106771:	68 de 00 00 00       	push   $0xde
80106776:	e9 3e f2 ff ff       	jmp    801059b9 <alltraps>

8010677b <vector223>:
8010677b:	6a 00                	push   $0x0
8010677d:	68 df 00 00 00       	push   $0xdf
80106782:	e9 32 f2 ff ff       	jmp    801059b9 <alltraps>

80106787 <vector224>:
80106787:	6a 00                	push   $0x0
80106789:	68 e0 00 00 00       	push   $0xe0
8010678e:	e9 26 f2 ff ff       	jmp    801059b9 <alltraps>

80106793 <vector225>:
80106793:	6a 00                	push   $0x0
80106795:	68 e1 00 00 00       	push   $0xe1
8010679a:	e9 1a f2 ff ff       	jmp    801059b9 <alltraps>

8010679f <vector226>:
8010679f:	6a 00                	push   $0x0
801067a1:	68 e2 00 00 00       	push   $0xe2
801067a6:	e9 0e f2 ff ff       	jmp    801059b9 <alltraps>

801067ab <vector227>:
801067ab:	6a 00                	push   $0x0
801067ad:	68 e3 00 00 00       	push   $0xe3
801067b2:	e9 02 f2 ff ff       	jmp    801059b9 <alltraps>

801067b7 <vector228>:
801067b7:	6a 00                	push   $0x0
801067b9:	68 e4 00 00 00       	push   $0xe4
801067be:	e9 f6 f1 ff ff       	jmp    801059b9 <alltraps>

801067c3 <vector229>:
801067c3:	6a 00                	push   $0x0
801067c5:	68 e5 00 00 00       	push   $0xe5
801067ca:	e9 ea f1 ff ff       	jmp    801059b9 <alltraps>

801067cf <vector230>:
801067cf:	6a 00                	push   $0x0
801067d1:	68 e6 00 00 00       	push   $0xe6
801067d6:	e9 de f1 ff ff       	jmp    801059b9 <alltraps>

801067db <vector231>:
801067db:	6a 00                	push   $0x0
801067dd:	68 e7 00 00 00       	push   $0xe7
801067e2:	e9 d2 f1 ff ff       	jmp    801059b9 <alltraps>

801067e7 <vector232>:
801067e7:	6a 00                	push   $0x0
801067e9:	68 e8 00 00 00       	push   $0xe8
801067ee:	e9 c6 f1 ff ff       	jmp    801059b9 <alltraps>

801067f3 <vector233>:
801067f3:	6a 00                	push   $0x0
801067f5:	68 e9 00 00 00       	push   $0xe9
801067fa:	e9 ba f1 ff ff       	jmp    801059b9 <alltraps>

801067ff <vector234>:
801067ff:	6a 00                	push   $0x0
80106801:	68 ea 00 00 00       	push   $0xea
80106806:	e9 ae f1 ff ff       	jmp    801059b9 <alltraps>

8010680b <vector235>:
8010680b:	6a 00                	push   $0x0
8010680d:	68 eb 00 00 00       	push   $0xeb
80106812:	e9 a2 f1 ff ff       	jmp    801059b9 <alltraps>

80106817 <vector236>:
80106817:	6a 00                	push   $0x0
80106819:	68 ec 00 00 00       	push   $0xec
8010681e:	e9 96 f1 ff ff       	jmp    801059b9 <alltraps>

80106823 <vector237>:
80106823:	6a 00                	push   $0x0
80106825:	68 ed 00 00 00       	push   $0xed
8010682a:	e9 8a f1 ff ff       	jmp    801059b9 <alltraps>

8010682f <vector238>:
8010682f:	6a 00                	push   $0x0
80106831:	68 ee 00 00 00       	push   $0xee
80106836:	e9 7e f1 ff ff       	jmp    801059b9 <alltraps>

8010683b <vector239>:
8010683b:	6a 00                	push   $0x0
8010683d:	68 ef 00 00 00       	push   $0xef
80106842:	e9 72 f1 ff ff       	jmp    801059b9 <alltraps>

80106847 <vector240>:
80106847:	6a 00                	push   $0x0
80106849:	68 f0 00 00 00       	push   $0xf0
8010684e:	e9 66 f1 ff ff       	jmp    801059b9 <alltraps>

80106853 <vector241>:
80106853:	6a 00                	push   $0x0
80106855:	68 f1 00 00 00       	push   $0xf1
8010685a:	e9 5a f1 ff ff       	jmp    801059b9 <alltraps>

8010685f <vector242>:
8010685f:	6a 00                	push   $0x0
80106861:	68 f2 00 00 00       	push   $0xf2
80106866:	e9 4e f1 ff ff       	jmp    801059b9 <alltraps>

8010686b <vector243>:
8010686b:	6a 00                	push   $0x0
8010686d:	68 f3 00 00 00       	push   $0xf3
80106872:	e9 42 f1 ff ff       	jmp    801059b9 <alltraps>

80106877 <vector244>:
80106877:	6a 00                	push   $0x0
80106879:	68 f4 00 00 00       	push   $0xf4
8010687e:	e9 36 f1 ff ff       	jmp    801059b9 <alltraps>

80106883 <vector245>:
80106883:	6a 00                	push   $0x0
80106885:	68 f5 00 00 00       	push   $0xf5
8010688a:	e9 2a f1 ff ff       	jmp    801059b9 <alltraps>

8010688f <vector246>:
8010688f:	6a 00                	push   $0x0
80106891:	68 f6 00 00 00       	push   $0xf6
80106896:	e9 1e f1 ff ff       	jmp    801059b9 <alltraps>

8010689b <vector247>:
8010689b:	6a 00                	push   $0x0
8010689d:	68 f7 00 00 00       	push   $0xf7
801068a2:	e9 12 f1 ff ff       	jmp    801059b9 <alltraps>

801068a7 <vector248>:
801068a7:	6a 00                	push   $0x0
801068a9:	68 f8 00 00 00       	push   $0xf8
801068ae:	e9 06 f1 ff ff       	jmp    801059b9 <alltraps>

801068b3 <vector249>:
801068b3:	6a 00                	push   $0x0
801068b5:	68 f9 00 00 00       	push   $0xf9
801068ba:	e9 fa f0 ff ff       	jmp    801059b9 <alltraps>

801068bf <vector250>:
801068bf:	6a 00                	push   $0x0
801068c1:	68 fa 00 00 00       	push   $0xfa
801068c6:	e9 ee f0 ff ff       	jmp    801059b9 <alltraps>

801068cb <vector251>:
801068cb:	6a 00                	push   $0x0
801068cd:	68 fb 00 00 00       	push   $0xfb
801068d2:	e9 e2 f0 ff ff       	jmp    801059b9 <alltraps>

801068d7 <vector252>:
801068d7:	6a 00                	push   $0x0
801068d9:	68 fc 00 00 00       	push   $0xfc
801068de:	e9 d6 f0 ff ff       	jmp    801059b9 <alltraps>

801068e3 <vector253>:
801068e3:	6a 00                	push   $0x0
801068e5:	68 fd 00 00 00       	push   $0xfd
801068ea:	e9 ca f0 ff ff       	jmp    801059b9 <alltraps>

801068ef <vector254>:
801068ef:	6a 00                	push   $0x0
801068f1:	68 fe 00 00 00       	push   $0xfe
801068f6:	e9 be f0 ff ff       	jmp    801059b9 <alltraps>

801068fb <vector255>:
801068fb:	6a 00                	push   $0x0
801068fd:	68 ff 00 00 00       	push   $0xff
80106902:	e9 b2 f0 ff ff       	jmp    801059b9 <alltraps>
80106907:	66 90                	xchg   %ax,%ax
80106909:	66 90                	xchg   %ax,%ax
8010690b:	66 90                	xchg   %ax,%ax
8010690d:	66 90                	xchg   %ax,%ax
8010690f:	90                   	nop

80106910 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106910:	55                   	push   %ebp
80106911:	89 e5                	mov    %esp,%ebp
80106913:	57                   	push   %edi
80106914:	56                   	push   %esi
80106915:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106916:	89 d3                	mov    %edx,%ebx
{
80106918:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
8010691a:	c1 eb 16             	shr    $0x16,%ebx
8010691d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
80106920:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
80106923:	8b 06                	mov    (%esi),%eax
80106925:	a8 01                	test   $0x1,%al
80106927:	74 27                	je     80106950 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106929:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010692e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106934:	c1 ef 0a             	shr    $0xa,%edi
}
80106937:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
8010693a:	89 fa                	mov    %edi,%edx
8010693c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106942:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106945:	5b                   	pop    %ebx
80106946:	5e                   	pop    %esi
80106947:	5f                   	pop    %edi
80106948:	5d                   	pop    %ebp
80106949:	c3                   	ret    
8010694a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106950:	85 c9                	test   %ecx,%ecx
80106952:	74 2c                	je     80106980 <walkpgdir+0x70>
80106954:	e8 d7 bb ff ff       	call   80102530 <kalloc>
80106959:	85 c0                	test   %eax,%eax
8010695b:	89 c3                	mov    %eax,%ebx
8010695d:	74 21                	je     80106980 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
8010695f:	83 ec 04             	sub    $0x4,%esp
80106962:	68 00 10 00 00       	push   $0x1000
80106967:	6a 00                	push   $0x0
80106969:	50                   	push   %eax
8010696a:	e8 81 dd ff ff       	call   801046f0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010696f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106975:	83 c4 10             	add    $0x10,%esp
80106978:	83 c8 07             	or     $0x7,%eax
8010697b:	89 06                	mov    %eax,(%esi)
8010697d:	eb b5                	jmp    80106934 <walkpgdir+0x24>
8010697f:	90                   	nop
}
80106980:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106983:	31 c0                	xor    %eax,%eax
}
80106985:	5b                   	pop    %ebx
80106986:	5e                   	pop    %esi
80106987:	5f                   	pop    %edi
80106988:	5d                   	pop    %ebp
80106989:	c3                   	ret    
8010698a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106990 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106990:	55                   	push   %ebp
80106991:	89 e5                	mov    %esp,%ebp
80106993:	57                   	push   %edi
80106994:	56                   	push   %esi
80106995:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106996:	89 d3                	mov    %edx,%ebx
80106998:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
8010699e:	83 ec 1c             	sub    $0x1c,%esp
801069a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
801069a4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801069a8:	8b 7d 08             	mov    0x8(%ebp),%edi
801069ab:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801069b0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801069b3:	8b 45 0c             	mov    0xc(%ebp),%eax
801069b6:	29 df                	sub    %ebx,%edi
801069b8:	83 c8 01             	or     $0x1,%eax
801069bb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801069be:	eb 15                	jmp    801069d5 <mappages+0x45>
    if(*pte & PTE_P)
801069c0:	f6 00 01             	testb  $0x1,(%eax)
801069c3:	75 45                	jne    80106a0a <mappages+0x7a>
    *pte = pa | perm | PTE_P;
801069c5:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
801069c8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
801069cb:	89 30                	mov    %esi,(%eax)
    if(a == last)
801069cd:	74 31                	je     80106a00 <mappages+0x70>
      break;
    a += PGSIZE;
801069cf:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801069d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801069d8:	b9 01 00 00 00       	mov    $0x1,%ecx
801069dd:	89 da                	mov    %ebx,%edx
801069df:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801069e2:	e8 29 ff ff ff       	call   80106910 <walkpgdir>
801069e7:	85 c0                	test   %eax,%eax
801069e9:	75 d5                	jne    801069c0 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
801069eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801069ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801069f3:	5b                   	pop    %ebx
801069f4:	5e                   	pop    %esi
801069f5:	5f                   	pop    %edi
801069f6:	5d                   	pop    %ebp
801069f7:	c3                   	ret    
801069f8:	90                   	nop
801069f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a00:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106a03:	31 c0                	xor    %eax,%eax
}
80106a05:	5b                   	pop    %ebx
80106a06:	5e                   	pop    %esi
80106a07:	5f                   	pop    %edi
80106a08:	5d                   	pop    %ebp
80106a09:	c3                   	ret    
      panic("remap");
80106a0a:	83 ec 0c             	sub    $0xc,%esp
80106a0d:	68 f8 7c 10 80       	push   $0x80107cf8
80106a12:	e8 79 99 ff ff       	call   80100390 <panic>
80106a17:	89 f6                	mov    %esi,%esi
80106a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a20 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a20:	55                   	push   %ebp
80106a21:	89 e5                	mov    %esp,%ebp
80106a23:	57                   	push   %edi
80106a24:	56                   	push   %esi
80106a25:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a26:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a2c:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
80106a2e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a34:	83 ec 1c             	sub    $0x1c,%esp
80106a37:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106a3a:	39 d3                	cmp    %edx,%ebx
80106a3c:	73 66                	jae    80106aa4 <deallocuvm.part.0+0x84>
80106a3e:	89 d6                	mov    %edx,%esi
80106a40:	eb 3d                	jmp    80106a7f <deallocuvm.part.0+0x5f>
80106a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106a48:	8b 10                	mov    (%eax),%edx
80106a4a:	f6 c2 01             	test   $0x1,%dl
80106a4d:	74 26                	je     80106a75 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106a4f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106a55:	74 58                	je     80106aaf <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106a57:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106a5a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106a60:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106a63:	52                   	push   %edx
80106a64:	e8 17 b9 ff ff       	call   80102380 <kfree>
      *pte = 0;
80106a69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a6c:	83 c4 10             	add    $0x10,%esp
80106a6f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106a75:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a7b:	39 f3                	cmp    %esi,%ebx
80106a7d:	73 25                	jae    80106aa4 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106a7f:	31 c9                	xor    %ecx,%ecx
80106a81:	89 da                	mov    %ebx,%edx
80106a83:	89 f8                	mov    %edi,%eax
80106a85:	e8 86 fe ff ff       	call   80106910 <walkpgdir>
    if(!pte)
80106a8a:	85 c0                	test   %eax,%eax
80106a8c:	75 ba                	jne    80106a48 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106a8e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106a94:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106a9a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106aa0:	39 f3                	cmp    %esi,%ebx
80106aa2:	72 db                	jb     80106a7f <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106aa4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106aa7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106aaa:	5b                   	pop    %ebx
80106aab:	5e                   	pop    %esi
80106aac:	5f                   	pop    %edi
80106aad:	5d                   	pop    %ebp
80106aae:	c3                   	ret    
        panic("kfree");
80106aaf:	83 ec 0c             	sub    $0xc,%esp
80106ab2:	68 92 76 10 80       	push   $0x80107692
80106ab7:	e8 d4 98 ff ff       	call   80100390 <panic>
80106abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ac0 <seginit>:
{
80106ac0:	55                   	push   %ebp
80106ac1:	89 e5                	mov    %esp,%ebp
80106ac3:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106ac6:	e8 e5 cd ff ff       	call   801038b0 <cpuid>
80106acb:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
  pd[0] = size-1;
80106ad1:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106ad6:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106ada:	c7 80 d8 31 11 80 ff 	movl   $0xffff,-0x7feece28(%eax)
80106ae1:	ff 00 00 
80106ae4:	c7 80 dc 31 11 80 00 	movl   $0xcf9a00,-0x7feece24(%eax)
80106aeb:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106aee:	c7 80 e0 31 11 80 ff 	movl   $0xffff,-0x7feece20(%eax)
80106af5:	ff 00 00 
80106af8:	c7 80 e4 31 11 80 00 	movl   $0xcf9200,-0x7feece1c(%eax)
80106aff:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b02:	c7 80 e8 31 11 80 ff 	movl   $0xffff,-0x7feece18(%eax)
80106b09:	ff 00 00 
80106b0c:	c7 80 ec 31 11 80 00 	movl   $0xcffa00,-0x7feece14(%eax)
80106b13:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b16:	c7 80 f0 31 11 80 ff 	movl   $0xffff,-0x7feece10(%eax)
80106b1d:	ff 00 00 
80106b20:	c7 80 f4 31 11 80 00 	movl   $0xcff200,-0x7feece0c(%eax)
80106b27:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106b2a:	05 d0 31 11 80       	add    $0x801131d0,%eax
  pd[1] = (uint)p;
80106b2f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106b33:	c1 e8 10             	shr    $0x10,%eax
80106b36:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106b3a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106b3d:	0f 01 10             	lgdtl  (%eax)
}
80106b40:	c9                   	leave  
80106b41:	c3                   	ret    
80106b42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b50 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106b50:	a1 84 60 11 80       	mov    0x80116084,%eax
{
80106b55:	55                   	push   %ebp
80106b56:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106b58:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106b5d:	0f 22 d8             	mov    %eax,%cr3
}
80106b60:	5d                   	pop    %ebp
80106b61:	c3                   	ret    
80106b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b70 <switchuvm>:
{
80106b70:	55                   	push   %ebp
80106b71:	89 e5                	mov    %esp,%ebp
80106b73:	57                   	push   %edi
80106b74:	56                   	push   %esi
80106b75:	53                   	push   %ebx
80106b76:	83 ec 1c             	sub    $0x1c,%esp
80106b79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106b7c:	85 db                	test   %ebx,%ebx
80106b7e:	0f 84 cb 00 00 00    	je     80106c4f <switchuvm+0xdf>
  if(p->kstack == 0)
80106b84:	8b 43 08             	mov    0x8(%ebx),%eax
80106b87:	85 c0                	test   %eax,%eax
80106b89:	0f 84 da 00 00 00    	je     80106c69 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106b8f:	8b 43 04             	mov    0x4(%ebx),%eax
80106b92:	85 c0                	test   %eax,%eax
80106b94:	0f 84 c2 00 00 00    	je     80106c5c <switchuvm+0xec>
  pushcli();
80106b9a:	e8 71 d9 ff ff       	call   80104510 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106b9f:	e8 8c cc ff ff       	call   80103830 <mycpu>
80106ba4:	89 c6                	mov    %eax,%esi
80106ba6:	e8 85 cc ff ff       	call   80103830 <mycpu>
80106bab:	89 c7                	mov    %eax,%edi
80106bad:	e8 7e cc ff ff       	call   80103830 <mycpu>
80106bb2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106bb5:	83 c7 08             	add    $0x8,%edi
80106bb8:	e8 73 cc ff ff       	call   80103830 <mycpu>
80106bbd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106bc0:	83 c0 08             	add    $0x8,%eax
80106bc3:	ba 67 00 00 00       	mov    $0x67,%edx
80106bc8:	c1 e8 18             	shr    $0x18,%eax
80106bcb:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106bd2:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106bd9:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106bdf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106be4:	83 c1 08             	add    $0x8,%ecx
80106be7:	c1 e9 10             	shr    $0x10,%ecx
80106bea:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106bf0:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106bf5:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106bfc:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80106c01:	e8 2a cc ff ff       	call   80103830 <mycpu>
80106c06:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106c0d:	e8 1e cc ff ff       	call   80103830 <mycpu>
80106c12:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106c16:	8b 73 08             	mov    0x8(%ebx),%esi
80106c19:	e8 12 cc ff ff       	call   80103830 <mycpu>
80106c1e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106c24:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106c27:	e8 04 cc ff ff       	call   80103830 <mycpu>
80106c2c:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106c30:	b8 28 00 00 00       	mov    $0x28,%eax
80106c35:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106c38:	8b 43 04             	mov    0x4(%ebx),%eax
80106c3b:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106c40:	0f 22 d8             	mov    %eax,%cr3
}
80106c43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c46:	5b                   	pop    %ebx
80106c47:	5e                   	pop    %esi
80106c48:	5f                   	pop    %edi
80106c49:	5d                   	pop    %ebp
  popcli();
80106c4a:	e9 01 d9 ff ff       	jmp    80104550 <popcli>
    panic("switchuvm: no process");
80106c4f:	83 ec 0c             	sub    $0xc,%esp
80106c52:	68 fe 7c 10 80       	push   $0x80107cfe
80106c57:	e8 34 97 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
80106c5c:	83 ec 0c             	sub    $0xc,%esp
80106c5f:	68 29 7d 10 80       	push   $0x80107d29
80106c64:	e8 27 97 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
80106c69:	83 ec 0c             	sub    $0xc,%esp
80106c6c:	68 14 7d 10 80       	push   $0x80107d14
80106c71:	e8 1a 97 ff ff       	call   80100390 <panic>
80106c76:	8d 76 00             	lea    0x0(%esi),%esi
80106c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c80 <inituvm>:
{
80106c80:	55                   	push   %ebp
80106c81:	89 e5                	mov    %esp,%ebp
80106c83:	57                   	push   %edi
80106c84:	56                   	push   %esi
80106c85:	53                   	push   %ebx
80106c86:	83 ec 1c             	sub    $0x1c,%esp
80106c89:	8b 75 10             	mov    0x10(%ebp),%esi
80106c8c:	8b 45 08             	mov    0x8(%ebp),%eax
80106c8f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106c92:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80106c98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106c9b:	77 49                	ja     80106ce6 <inituvm+0x66>
  mem = kalloc();
80106c9d:	e8 8e b8 ff ff       	call   80102530 <kalloc>
  memset(mem, 0, PGSIZE);
80106ca2:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106ca5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106ca7:	68 00 10 00 00       	push   $0x1000
80106cac:	6a 00                	push   $0x0
80106cae:	50                   	push   %eax
80106caf:	e8 3c da ff ff       	call   801046f0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106cb4:	58                   	pop    %eax
80106cb5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106cbb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106cc0:	5a                   	pop    %edx
80106cc1:	6a 06                	push   $0x6
80106cc3:	50                   	push   %eax
80106cc4:	31 d2                	xor    %edx,%edx
80106cc6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106cc9:	e8 c2 fc ff ff       	call   80106990 <mappages>
  memmove(mem, init, sz);
80106cce:	89 75 10             	mov    %esi,0x10(%ebp)
80106cd1:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106cd4:	83 c4 10             	add    $0x10,%esp
80106cd7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106cda:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cdd:	5b                   	pop    %ebx
80106cde:	5e                   	pop    %esi
80106cdf:	5f                   	pop    %edi
80106ce0:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106ce1:	e9 ba da ff ff       	jmp    801047a0 <memmove>
    panic("inituvm: more than a page");
80106ce6:	83 ec 0c             	sub    $0xc,%esp
80106ce9:	68 3d 7d 10 80       	push   $0x80107d3d
80106cee:	e8 9d 96 ff ff       	call   80100390 <panic>
80106cf3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d00 <loaduvm>:
{
80106d00:	55                   	push   %ebp
80106d01:	89 e5                	mov    %esp,%ebp
80106d03:	57                   	push   %edi
80106d04:	56                   	push   %esi
80106d05:	53                   	push   %ebx
80106d06:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80106d09:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106d10:	0f 85 91 00 00 00    	jne    80106da7 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80106d16:	8b 75 18             	mov    0x18(%ebp),%esi
80106d19:	31 db                	xor    %ebx,%ebx
80106d1b:	85 f6                	test   %esi,%esi
80106d1d:	75 1a                	jne    80106d39 <loaduvm+0x39>
80106d1f:	eb 6f                	jmp    80106d90 <loaduvm+0x90>
80106d21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d28:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106d2e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106d34:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106d37:	76 57                	jbe    80106d90 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106d39:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d3c:	8b 45 08             	mov    0x8(%ebp),%eax
80106d3f:	31 c9                	xor    %ecx,%ecx
80106d41:	01 da                	add    %ebx,%edx
80106d43:	e8 c8 fb ff ff       	call   80106910 <walkpgdir>
80106d48:	85 c0                	test   %eax,%eax
80106d4a:	74 4e                	je     80106d9a <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
80106d4c:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106d4e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80106d51:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106d56:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106d5b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106d61:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106d64:	01 d9                	add    %ebx,%ecx
80106d66:	05 00 00 00 80       	add    $0x80000000,%eax
80106d6b:	57                   	push   %edi
80106d6c:	51                   	push   %ecx
80106d6d:	50                   	push   %eax
80106d6e:	ff 75 10             	pushl  0x10(%ebp)
80106d71:	e8 5a ac ff ff       	call   801019d0 <readi>
80106d76:	83 c4 10             	add    $0x10,%esp
80106d79:	39 f8                	cmp    %edi,%eax
80106d7b:	74 ab                	je     80106d28 <loaduvm+0x28>
}
80106d7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106d80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106d85:	5b                   	pop    %ebx
80106d86:	5e                   	pop    %esi
80106d87:	5f                   	pop    %edi
80106d88:	5d                   	pop    %ebp
80106d89:	c3                   	ret    
80106d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d90:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106d93:	31 c0                	xor    %eax,%eax
}
80106d95:	5b                   	pop    %ebx
80106d96:	5e                   	pop    %esi
80106d97:	5f                   	pop    %edi
80106d98:	5d                   	pop    %ebp
80106d99:	c3                   	ret    
      panic("loaduvm: address should exist");
80106d9a:	83 ec 0c             	sub    $0xc,%esp
80106d9d:	68 57 7d 10 80       	push   $0x80107d57
80106da2:	e8 e9 95 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
80106da7:	83 ec 0c             	sub    $0xc,%esp
80106daa:	68 f8 7d 10 80       	push   $0x80107df8
80106daf:	e8 dc 95 ff ff       	call   80100390 <panic>
80106db4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106dba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106dc0 <allocuvm>:
{
80106dc0:	55                   	push   %ebp
80106dc1:	89 e5                	mov    %esp,%ebp
80106dc3:	57                   	push   %edi
80106dc4:	56                   	push   %esi
80106dc5:	53                   	push   %ebx
80106dc6:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106dc9:	8b 7d 10             	mov    0x10(%ebp),%edi
80106dcc:	85 ff                	test   %edi,%edi
80106dce:	0f 88 8e 00 00 00    	js     80106e62 <allocuvm+0xa2>
  if(newsz < oldsz)
80106dd4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106dd7:	0f 82 93 00 00 00    	jb     80106e70 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
80106ddd:	8b 45 0c             	mov    0xc(%ebp),%eax
80106de0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106de6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106dec:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106def:	0f 86 7e 00 00 00    	jbe    80106e73 <allocuvm+0xb3>
80106df5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106df8:	8b 7d 08             	mov    0x8(%ebp),%edi
80106dfb:	eb 42                	jmp    80106e3f <allocuvm+0x7f>
80106dfd:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80106e00:	83 ec 04             	sub    $0x4,%esp
80106e03:	68 00 10 00 00       	push   $0x1000
80106e08:	6a 00                	push   $0x0
80106e0a:	50                   	push   %eax
80106e0b:	e8 e0 d8 ff ff       	call   801046f0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106e10:	58                   	pop    %eax
80106e11:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106e17:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e1c:	5a                   	pop    %edx
80106e1d:	6a 06                	push   $0x6
80106e1f:	50                   	push   %eax
80106e20:	89 da                	mov    %ebx,%edx
80106e22:	89 f8                	mov    %edi,%eax
80106e24:	e8 67 fb ff ff       	call   80106990 <mappages>
80106e29:	83 c4 10             	add    $0x10,%esp
80106e2c:	85 c0                	test   %eax,%eax
80106e2e:	78 50                	js     80106e80 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80106e30:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e36:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106e39:	0f 86 81 00 00 00    	jbe    80106ec0 <allocuvm+0x100>
    mem = kalloc();
80106e3f:	e8 ec b6 ff ff       	call   80102530 <kalloc>
    if(mem == 0){
80106e44:	85 c0                	test   %eax,%eax
    mem = kalloc();
80106e46:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106e48:	75 b6                	jne    80106e00 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80106e4a:	83 ec 0c             	sub    $0xc,%esp
80106e4d:	68 75 7d 10 80       	push   $0x80107d75
80106e52:	e8 09 98 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106e57:	83 c4 10             	add    $0x10,%esp
80106e5a:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e5d:	39 45 10             	cmp    %eax,0x10(%ebp)
80106e60:	77 6e                	ja     80106ed0 <allocuvm+0x110>
}
80106e62:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80106e65:	31 ff                	xor    %edi,%edi
}
80106e67:	89 f8                	mov    %edi,%eax
80106e69:	5b                   	pop    %ebx
80106e6a:	5e                   	pop    %esi
80106e6b:	5f                   	pop    %edi
80106e6c:	5d                   	pop    %ebp
80106e6d:	c3                   	ret    
80106e6e:	66 90                	xchg   %ax,%ax
    return oldsz;
80106e70:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
80106e73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e76:	89 f8                	mov    %edi,%eax
80106e78:	5b                   	pop    %ebx
80106e79:	5e                   	pop    %esi
80106e7a:	5f                   	pop    %edi
80106e7b:	5d                   	pop    %ebp
80106e7c:	c3                   	ret    
80106e7d:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106e80:	83 ec 0c             	sub    $0xc,%esp
80106e83:	68 8d 7d 10 80       	push   $0x80107d8d
80106e88:	e8 d3 97 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106e8d:	83 c4 10             	add    $0x10,%esp
80106e90:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e93:	39 45 10             	cmp    %eax,0x10(%ebp)
80106e96:	76 0d                	jbe    80106ea5 <allocuvm+0xe5>
80106e98:	89 c1                	mov    %eax,%ecx
80106e9a:	8b 55 10             	mov    0x10(%ebp),%edx
80106e9d:	8b 45 08             	mov    0x8(%ebp),%eax
80106ea0:	e8 7b fb ff ff       	call   80106a20 <deallocuvm.part.0>
      kfree(mem);
80106ea5:	83 ec 0c             	sub    $0xc,%esp
      return 0;
80106ea8:	31 ff                	xor    %edi,%edi
      kfree(mem);
80106eaa:	56                   	push   %esi
80106eab:	e8 d0 b4 ff ff       	call   80102380 <kfree>
      return 0;
80106eb0:	83 c4 10             	add    $0x10,%esp
}
80106eb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106eb6:	89 f8                	mov    %edi,%eax
80106eb8:	5b                   	pop    %ebx
80106eb9:	5e                   	pop    %esi
80106eba:	5f                   	pop    %edi
80106ebb:	5d                   	pop    %ebp
80106ebc:	c3                   	ret    
80106ebd:	8d 76 00             	lea    0x0(%esi),%esi
80106ec0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106ec3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ec6:	5b                   	pop    %ebx
80106ec7:	89 f8                	mov    %edi,%eax
80106ec9:	5e                   	pop    %esi
80106eca:	5f                   	pop    %edi
80106ecb:	5d                   	pop    %ebp
80106ecc:	c3                   	ret    
80106ecd:	8d 76 00             	lea    0x0(%esi),%esi
80106ed0:	89 c1                	mov    %eax,%ecx
80106ed2:	8b 55 10             	mov    0x10(%ebp),%edx
80106ed5:	8b 45 08             	mov    0x8(%ebp),%eax
      return 0;
80106ed8:	31 ff                	xor    %edi,%edi
80106eda:	e8 41 fb ff ff       	call   80106a20 <deallocuvm.part.0>
80106edf:	eb 92                	jmp    80106e73 <allocuvm+0xb3>
80106ee1:	eb 0d                	jmp    80106ef0 <deallocuvm>
80106ee3:	90                   	nop
80106ee4:	90                   	nop
80106ee5:	90                   	nop
80106ee6:	90                   	nop
80106ee7:	90                   	nop
80106ee8:	90                   	nop
80106ee9:	90                   	nop
80106eea:	90                   	nop
80106eeb:	90                   	nop
80106eec:	90                   	nop
80106eed:	90                   	nop
80106eee:	90                   	nop
80106eef:	90                   	nop

80106ef0 <deallocuvm>:
{
80106ef0:	55                   	push   %ebp
80106ef1:	89 e5                	mov    %esp,%ebp
80106ef3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ef6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106ef9:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106efc:	39 d1                	cmp    %edx,%ecx
80106efe:	73 10                	jae    80106f10 <deallocuvm+0x20>
}
80106f00:	5d                   	pop    %ebp
80106f01:	e9 1a fb ff ff       	jmp    80106a20 <deallocuvm.part.0>
80106f06:	8d 76 00             	lea    0x0(%esi),%esi
80106f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106f10:	89 d0                	mov    %edx,%eax
80106f12:	5d                   	pop    %ebp
80106f13:	c3                   	ret    
80106f14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106f20 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106f20:	55                   	push   %ebp
80106f21:	89 e5                	mov    %esp,%ebp
80106f23:	57                   	push   %edi
80106f24:	56                   	push   %esi
80106f25:	53                   	push   %ebx
80106f26:	83 ec 0c             	sub    $0xc,%esp
80106f29:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106f2c:	85 f6                	test   %esi,%esi
80106f2e:	74 59                	je     80106f89 <freevm+0x69>
80106f30:	31 c9                	xor    %ecx,%ecx
80106f32:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106f37:	89 f0                	mov    %esi,%eax
80106f39:	e8 e2 fa ff ff       	call   80106a20 <deallocuvm.part.0>
80106f3e:	89 f3                	mov    %esi,%ebx
80106f40:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106f46:	eb 0f                	jmp    80106f57 <freevm+0x37>
80106f48:	90                   	nop
80106f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f50:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106f53:	39 fb                	cmp    %edi,%ebx
80106f55:	74 23                	je     80106f7a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106f57:	8b 03                	mov    (%ebx),%eax
80106f59:	a8 01                	test   $0x1,%al
80106f5b:	74 f3                	je     80106f50 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106f5d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80106f62:	83 ec 0c             	sub    $0xc,%esp
80106f65:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106f68:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106f6d:	50                   	push   %eax
80106f6e:	e8 0d b4 ff ff       	call   80102380 <kfree>
80106f73:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80106f76:	39 fb                	cmp    %edi,%ebx
80106f78:	75 dd                	jne    80106f57 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
80106f7a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106f7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f80:	5b                   	pop    %ebx
80106f81:	5e                   	pop    %esi
80106f82:	5f                   	pop    %edi
80106f83:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106f84:	e9 f7 b3 ff ff       	jmp    80102380 <kfree>
    panic("freevm: no pgdir");
80106f89:	83 ec 0c             	sub    $0xc,%esp
80106f8c:	68 a9 7d 10 80       	push   $0x80107da9
80106f91:	e8 fa 93 ff ff       	call   80100390 <panic>
80106f96:	8d 76 00             	lea    0x0(%esi),%esi
80106f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fa0 <setupkvm>:
{
80106fa0:	55                   	push   %ebp
80106fa1:	89 e5                	mov    %esp,%ebp
80106fa3:	56                   	push   %esi
80106fa4:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106fa5:	e8 86 b5 ff ff       	call   80102530 <kalloc>
80106faa:	85 c0                	test   %eax,%eax
80106fac:	89 c6                	mov    %eax,%esi
80106fae:	74 42                	je     80106ff2 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80106fb0:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106fb3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
80106fb8:	68 00 10 00 00       	push   $0x1000
80106fbd:	6a 00                	push   $0x0
80106fbf:	50                   	push   %eax
80106fc0:	e8 2b d7 ff ff       	call   801046f0 <memset>
80106fc5:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80106fc8:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106fcb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106fce:	83 ec 08             	sub    $0x8,%esp
80106fd1:	8b 13                	mov    (%ebx),%edx
80106fd3:	ff 73 0c             	pushl  0xc(%ebx)
80106fd6:	50                   	push   %eax
80106fd7:	29 c1                	sub    %eax,%ecx
80106fd9:	89 f0                	mov    %esi,%eax
80106fdb:	e8 b0 f9 ff ff       	call   80106990 <mappages>
80106fe0:	83 c4 10             	add    $0x10,%esp
80106fe3:	85 c0                	test   %eax,%eax
80106fe5:	78 19                	js     80107000 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106fe7:	83 c3 10             	add    $0x10,%ebx
80106fea:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106ff0:	75 d6                	jne    80106fc8 <setupkvm+0x28>
}
80106ff2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106ff5:	89 f0                	mov    %esi,%eax
80106ff7:	5b                   	pop    %ebx
80106ff8:	5e                   	pop    %esi
80106ff9:	5d                   	pop    %ebp
80106ffa:	c3                   	ret    
80106ffb:	90                   	nop
80106ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80107000:	83 ec 0c             	sub    $0xc,%esp
80107003:	56                   	push   %esi
      return 0;
80107004:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80107006:	e8 15 ff ff ff       	call   80106f20 <freevm>
      return 0;
8010700b:	83 c4 10             	add    $0x10,%esp
}
8010700e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107011:	89 f0                	mov    %esi,%eax
80107013:	5b                   	pop    %ebx
80107014:	5e                   	pop    %esi
80107015:	5d                   	pop    %ebp
80107016:	c3                   	ret    
80107017:	89 f6                	mov    %esi,%esi
80107019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107020 <kvmalloc>:
{
80107020:	55                   	push   %ebp
80107021:	89 e5                	mov    %esp,%ebp
80107023:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107026:	e8 75 ff ff ff       	call   80106fa0 <setupkvm>
8010702b:	a3 84 60 11 80       	mov    %eax,0x80116084
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107030:	05 00 00 00 80       	add    $0x80000000,%eax
80107035:	0f 22 d8             	mov    %eax,%cr3
}
80107038:	c9                   	leave  
80107039:	c3                   	ret    
8010703a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107040 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107040:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107041:	31 c9                	xor    %ecx,%ecx
{
80107043:	89 e5                	mov    %esp,%ebp
80107045:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107048:	8b 55 0c             	mov    0xc(%ebp),%edx
8010704b:	8b 45 08             	mov    0x8(%ebp),%eax
8010704e:	e8 bd f8 ff ff       	call   80106910 <walkpgdir>
  if(pte == 0)
80107053:	85 c0                	test   %eax,%eax
80107055:	74 05                	je     8010705c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80107057:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010705a:	c9                   	leave  
8010705b:	c3                   	ret    
    panic("clearpteu");
8010705c:	83 ec 0c             	sub    $0xc,%esp
8010705f:	68 ba 7d 10 80       	push   $0x80107dba
80107064:	e8 27 93 ff ff       	call   80100390 <panic>
80107069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107070 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107070:	55                   	push   %ebp
80107071:	89 e5                	mov    %esp,%ebp
80107073:	57                   	push   %edi
80107074:	56                   	push   %esi
80107075:	53                   	push   %ebx
80107076:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107079:	e8 22 ff ff ff       	call   80106fa0 <setupkvm>
8010707e:	85 c0                	test   %eax,%eax
80107080:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107083:	0f 84 9f 00 00 00    	je     80107128 <copyuvm+0xb8>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107089:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010708c:	85 c9                	test   %ecx,%ecx
8010708e:	0f 84 94 00 00 00    	je     80107128 <copyuvm+0xb8>
80107094:	31 ff                	xor    %edi,%edi
80107096:	eb 4a                	jmp    801070e2 <copyuvm+0x72>
80107098:	90                   	nop
80107099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
801070a0:	83 ec 04             	sub    $0x4,%esp
801070a3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
801070a9:	68 00 10 00 00       	push   $0x1000
801070ae:	53                   	push   %ebx
801070af:	50                   	push   %eax
801070b0:	e8 eb d6 ff ff       	call   801047a0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
801070b5:	58                   	pop    %eax
801070b6:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801070bc:	b9 00 10 00 00       	mov    $0x1000,%ecx
801070c1:	5a                   	pop    %edx
801070c2:	ff 75 e4             	pushl  -0x1c(%ebp)
801070c5:	50                   	push   %eax
801070c6:	89 fa                	mov    %edi,%edx
801070c8:	8b 45 e0             	mov    -0x20(%ebp),%eax
801070cb:	e8 c0 f8 ff ff       	call   80106990 <mappages>
801070d0:	83 c4 10             	add    $0x10,%esp
801070d3:	85 c0                	test   %eax,%eax
801070d5:	78 61                	js     80107138 <copyuvm+0xc8>
  for(i = 0; i < sz; i += PGSIZE){
801070d7:	81 c7 00 10 00 00    	add    $0x1000,%edi
801070dd:	39 7d 0c             	cmp    %edi,0xc(%ebp)
801070e0:	76 46                	jbe    80107128 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
801070e2:	8b 45 08             	mov    0x8(%ebp),%eax
801070e5:	31 c9                	xor    %ecx,%ecx
801070e7:	89 fa                	mov    %edi,%edx
801070e9:	e8 22 f8 ff ff       	call   80106910 <walkpgdir>
801070ee:	85 c0                	test   %eax,%eax
801070f0:	74 61                	je     80107153 <copyuvm+0xe3>
    if(!(*pte & PTE_P))
801070f2:	8b 00                	mov    (%eax),%eax
801070f4:	a8 01                	test   $0x1,%al
801070f6:	74 4e                	je     80107146 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
801070f8:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
801070fa:	25 ff 0f 00 00       	and    $0xfff,%eax
    pa = PTE_ADDR(*pte);
801070ff:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80107105:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80107108:	e8 23 b4 ff ff       	call   80102530 <kalloc>
8010710d:	85 c0                	test   %eax,%eax
8010710f:	89 c6                	mov    %eax,%esi
80107111:	75 8d                	jne    801070a0 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80107113:	83 ec 0c             	sub    $0xc,%esp
80107116:	ff 75 e0             	pushl  -0x20(%ebp)
80107119:	e8 02 fe ff ff       	call   80106f20 <freevm>
  return 0;
8010711e:	83 c4 10             	add    $0x10,%esp
80107121:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80107128:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010712b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010712e:	5b                   	pop    %ebx
8010712f:	5e                   	pop    %esi
80107130:	5f                   	pop    %edi
80107131:	5d                   	pop    %ebp
80107132:	c3                   	ret    
80107133:	90                   	nop
80107134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80107138:	83 ec 0c             	sub    $0xc,%esp
8010713b:	56                   	push   %esi
8010713c:	e8 3f b2 ff ff       	call   80102380 <kfree>
      goto bad;
80107141:	83 c4 10             	add    $0x10,%esp
80107144:	eb cd                	jmp    80107113 <copyuvm+0xa3>
      panic("copyuvm: page not present");
80107146:	83 ec 0c             	sub    $0xc,%esp
80107149:	68 de 7d 10 80       	push   $0x80107dde
8010714e:	e8 3d 92 ff ff       	call   80100390 <panic>
      panic("copyuvm: pte should exist");
80107153:	83 ec 0c             	sub    $0xc,%esp
80107156:	68 c4 7d 10 80       	push   $0x80107dc4
8010715b:	e8 30 92 ff ff       	call   80100390 <panic>

80107160 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107160:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107161:	31 c9                	xor    %ecx,%ecx
{
80107163:	89 e5                	mov    %esp,%ebp
80107165:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107168:	8b 55 0c             	mov    0xc(%ebp),%edx
8010716b:	8b 45 08             	mov    0x8(%ebp),%eax
8010716e:	e8 9d f7 ff ff       	call   80106910 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107173:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107175:	c9                   	leave  
  if((*pte & PTE_U) == 0)
80107176:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107178:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
8010717d:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107180:	05 00 00 00 80       	add    $0x80000000,%eax
80107185:	83 fa 05             	cmp    $0x5,%edx
80107188:	ba 00 00 00 00       	mov    $0x0,%edx
8010718d:	0f 45 c2             	cmovne %edx,%eax
}
80107190:	c3                   	ret    
80107191:	eb 0d                	jmp    801071a0 <copyout>
80107193:	90                   	nop
80107194:	90                   	nop
80107195:	90                   	nop
80107196:	90                   	nop
80107197:	90                   	nop
80107198:	90                   	nop
80107199:	90                   	nop
8010719a:	90                   	nop
8010719b:	90                   	nop
8010719c:	90                   	nop
8010719d:	90                   	nop
8010719e:	90                   	nop
8010719f:	90                   	nop

801071a0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801071a0:	55                   	push   %ebp
801071a1:	89 e5                	mov    %esp,%ebp
801071a3:	57                   	push   %edi
801071a4:	56                   	push   %esi
801071a5:	53                   	push   %ebx
801071a6:	83 ec 1c             	sub    $0x1c,%esp
801071a9:	8b 5d 14             	mov    0x14(%ebp),%ebx
801071ac:	8b 55 0c             	mov    0xc(%ebp),%edx
801071af:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801071b2:	85 db                	test   %ebx,%ebx
801071b4:	75 40                	jne    801071f6 <copyout+0x56>
801071b6:	eb 70                	jmp    80107228 <copyout+0x88>
801071b8:	90                   	nop
801071b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
801071c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801071c3:	89 f1                	mov    %esi,%ecx
801071c5:	29 d1                	sub    %edx,%ecx
801071c7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
801071cd:	39 d9                	cmp    %ebx,%ecx
801071cf:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801071d2:	29 f2                	sub    %esi,%edx
801071d4:	83 ec 04             	sub    $0x4,%esp
801071d7:	01 d0                	add    %edx,%eax
801071d9:	51                   	push   %ecx
801071da:	57                   	push   %edi
801071db:	50                   	push   %eax
801071dc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801071df:	e8 bc d5 ff ff       	call   801047a0 <memmove>
    len -= n;
    buf += n;
801071e4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
801071e7:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
801071ea:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
801071f0:	01 cf                	add    %ecx,%edi
  while(len > 0){
801071f2:	29 cb                	sub    %ecx,%ebx
801071f4:	74 32                	je     80107228 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801071f6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801071f8:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
801071fb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801071fe:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107204:	56                   	push   %esi
80107205:	ff 75 08             	pushl  0x8(%ebp)
80107208:	e8 53 ff ff ff       	call   80107160 <uva2ka>
    if(pa0 == 0)
8010720d:	83 c4 10             	add    $0x10,%esp
80107210:	85 c0                	test   %eax,%eax
80107212:	75 ac                	jne    801071c0 <copyout+0x20>
  }
  return 0;
}
80107214:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80107217:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010721c:	5b                   	pop    %ebx
8010721d:	5e                   	pop    %esi
8010721e:	5f                   	pop    %edi
8010721f:	5d                   	pop    %ebp
80107220:	c3                   	ret    
80107221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107228:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010722b:	31 c0                	xor    %eax,%eax
}
8010722d:	5b                   	pop    %ebx
8010722e:	5e                   	pop    %esi
8010722f:	5f                   	pop    %edi
80107230:	5d                   	pop    %ebp
80107231:	c3                   	ret    
80107232:	66 90                	xchg   %ax,%ax
80107234:	66 90                	xchg   %ax,%ax
80107236:	66 90                	xchg   %ax,%ax
80107238:	66 90                	xchg   %ax,%ax
8010723a:	66 90                	xchg   %ax,%ax
8010723c:	66 90                	xchg   %ax,%ax
8010723e:	66 90                	xchg   %ax,%ax

80107240 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
80107240:	55                   	push   %ebp
80107241:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
80107246:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
8010724b:	89 e5                	mov    %esp,%ebp
8010724d:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
80107250:	89 15 e0 a5 10 80    	mov    %edx,0x8010a5e0
80107256:	eb 0b                	jmp    80107263 <sgenrand+0x23>
80107258:	90                   	nop
80107259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107260:	83 c0 04             	add    $0x4,%eax
    for (mti=1; mti<N; mti++)
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
80107263:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
80107269:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
8010726b:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
8010726d:	75 f1                	jne    80107260 <sgenrand+0x20>
8010726f:	c7 05 60 a4 10 80 70 	movl   $0x270,0x8010a460
80107276:	02 00 00 
}
80107279:	5d                   	pop    %ebp
8010727a:	c3                   	ret    
8010727b:	90                   	nop
8010727c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107280 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
80107280:	a1 60 a4 10 80       	mov    0x8010a460,%eax
{
80107285:	55                   	push   %ebp
80107286:	89 e5                	mov    %esp,%ebp
80107288:	56                   	push   %esi
80107289:	53                   	push   %ebx
    if (mti >= N) { /* generate N words at one time */
8010728a:	3d 6f 02 00 00       	cmp    $0x26f,%eax
8010728f:	0f 8e f9 00 00 00    	jle    8010738e <genrand+0x10e>
        int kk;

        if (mti == N+1)   /* if sgenrand() has not been called, */
80107295:	3d 71 02 00 00       	cmp    $0x271,%eax
8010729a:	0f 84 fa 00 00 00    	je     8010739a <genrand+0x11a>
801072a0:	ba e0 a5 10 80       	mov    $0x8010a5e0,%edx
801072a5:	bb 6c a9 10 80       	mov    $0x8010a96c,%ebx
    mt[0]= seed & 0xffffffff;
801072aa:	89 d1                	mov    %edx,%ecx
801072ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            sgenrand(4357); /* a default initial seed is used   */

        for (kk=0;kk<N-M;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
801072b0:	8b 01                	mov    (%ecx),%eax
801072b2:	8b 71 04             	mov    0x4(%ecx),%esi
801072b5:	83 c1 04             	add    $0x4,%ecx
801072b8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
801072be:	25 00 00 00 80       	and    $0x80000000,%eax
801072c3:	09 f0                	or     %esi,%eax
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
801072c5:	89 c6                	mov    %eax,%esi
801072c7:	83 e0 01             	and    $0x1,%eax
801072ca:	d1 ee                	shr    %esi
801072cc:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
801072d2:	33 34 85 1c 7e 10 80 	xor    -0x7fef81e4(,%eax,4),%esi
801072d9:	89 71 fc             	mov    %esi,-0x4(%ecx)
        for (kk=0;kk<N-M;kk++) {
801072dc:	39 cb                	cmp    %ecx,%ebx
801072de:	75 d0                	jne    801072b0 <genrand+0x30>
801072e0:	b9 10 ac 10 80       	mov    $0x8010ac10,%ecx
801072e5:	8d 76 00             	lea    0x0(%esi),%esi
        }
        for (;kk<N-1;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
801072e8:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
801072ee:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
801072f4:	83 c2 04             	add    $0x4,%edx
801072f7:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
801072fd:	25 00 00 00 80       	and    $0x80000000,%eax
80107302:	09 d8                	or     %ebx,%eax
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
80107304:	89 c3                	mov    %eax,%ebx
80107306:	83 e0 01             	and    $0x1,%eax
80107309:	d1 eb                	shr    %ebx
8010730b:	33 5a fc             	xor    -0x4(%edx),%ebx
8010730e:	33 1c 85 1c 7e 10 80 	xor    -0x7fef81e4(,%eax,4),%ebx
80107315:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
        for (;kk<N-1;kk++) {
8010731b:	39 d1                	cmp    %edx,%ecx
8010731d:	75 c9                	jne    801072e8 <genrand+0x68>
        }
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
8010731f:	a1 e0 a5 10 80       	mov    0x8010a5e0,%eax
80107324:	8b 0d 9c af 10 80    	mov    0x8010af9c,%ecx
8010732a:	89 c2                	mov    %eax,%edx
8010732c:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
80107332:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
80107338:	09 d1                	or     %edx,%ecx
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
8010733a:	89 ca                	mov    %ecx,%edx
8010733c:	83 e1 01             	and    $0x1,%ecx
8010733f:	d1 ea                	shr    %edx
80107341:	33 15 10 ac 10 80    	xor    0x8010ac10,%edx
80107347:	33 14 8d 1c 7e 10 80 	xor    -0x7fef81e4(,%ecx,4),%edx
8010734e:	89 15 9c af 10 80    	mov    %edx,0x8010af9c
80107354:	ba 01 00 00 00       	mov    $0x1,%edx

        mti = 0;
    }
  
    y = mt[mti++];
80107359:	89 15 60 a4 10 80    	mov    %edx,0x8010a460
    y ^= TEMPERING_SHIFT_U(y);
8010735f:	89 c2                	mov    %eax,%edx
80107361:	c1 ea 0b             	shr    $0xb,%edx
80107364:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
80107366:	89 d0                	mov    %edx,%eax
80107368:	c1 e0 07             	shl    $0x7,%eax
8010736b:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
80107370:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
80107372:	89 d0                	mov    %edx,%eax
80107374:	c1 e0 0f             	shl    $0xf,%eax
80107377:	25 00 00 c6 ef       	and    $0xefc60000,%eax
8010737c:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_L(y);
8010737e:	89 c2                	mov    %eax,%edx
80107380:	c1 ea 12             	shr    $0x12,%edx
80107383:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
}
80107385:	5b                   	pop    %ebx
    return y & RAND_MAX;
80107386:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
8010738b:	5e                   	pop    %esi
8010738c:	5d                   	pop    %ebp
8010738d:	c3                   	ret    
8010738e:	8d 50 01             	lea    0x1(%eax),%edx
80107391:	8b 04 85 e0 a5 10 80 	mov    -0x7fef5a20(,%eax,4),%eax
80107398:	eb bf                	jmp    80107359 <genrand+0xd9>
    mt[0]= seed & 0xffffffff;
8010739a:	c7 05 e0 a5 10 80 05 	movl   $0x1105,0x8010a5e0
801073a1:	11 00 00 
801073a4:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
801073a9:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
801073ae:	ba 05 11 00 00       	mov    $0x1105,%edx
801073b3:	eb 06                	jmp    801073bb <genrand+0x13b>
801073b5:	8d 76 00             	lea    0x0(%esi),%esi
801073b8:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
801073bb:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
801073c1:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
801073c3:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
801073c5:	75 f1                	jne    801073b8 <genrand+0x138>
801073c7:	e9 d4 fe ff ff       	jmp    801072a0 <genrand+0x20>
801073cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801073d0 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
801073d0:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
801073d1:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
801073d3:	89 e5                	mov    %esp,%ebp
801073d5:	56                   	push   %esi
801073d6:	53                   	push   %ebx
    num_bins = (unsigned long) max + 1,
801073d7:	8b 45 08             	mov    0x8(%ebp),%eax
    bin_size = num_rand / num_bins,
801073da:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
801073df:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
801073e2:	89 d8                	mov    %ebx,%eax
801073e4:	f7 f1                	div    %ecx
801073e6:	89 c6                	mov    %eax,%esi
801073e8:	29 d3                	sub    %edx,%ebx
801073ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    defect   = num_rand % num_bins;

  long x;
  do {
   x = genrand();
801073f0:	e8 8b fe ff ff       	call   80107280 <genrand>
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
801073f5:	39 d8                	cmp    %ebx,%eax
801073f7:	73 f7                	jae    801073f0 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
801073f9:	31 d2                	xor    %edx,%edx
801073fb:	f7 f6                	div    %esi
}
801073fd:	5b                   	pop    %ebx
801073fe:	5e                   	pop    %esi
801073ff:	5d                   	pop    %ebp
80107400:	c3                   	ret    
