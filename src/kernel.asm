
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
8010004c:	68 e0 72 10 80       	push   $0x801072e0
80100051:	68 a0 bf 10 80       	push   $0x8010bfa0
80100056:	e8 65 43 00 00       	call   801043c0 <initlock>
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
80100092:	68 e7 72 10 80       	push   $0x801072e7
80100097:	50                   	push   %eax
80100098:	e8 f3 41 00 00       	call   80104290 <initsleeplock>
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
801000e4:	e8 17 44 00 00       	call   80104500 <acquire>
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
80100162:	e8 59 44 00 00       	call   801045c0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 5e 41 00 00       	call   801042d0 <acquiresleep>
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
80100193:	68 ee 72 10 80       	push   $0x801072ee
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
801001ae:	e8 bd 41 00 00       	call   80104370 <holdingsleep>
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
801001cc:	68 ff 72 10 80       	push   $0x801072ff
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
801001ef:	e8 7c 41 00 00       	call   80104370 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 2c 41 00 00       	call   80104330 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 a0 bf 10 80 	movl   $0x8010bfa0,(%esp)
8010020b:	e8 f0 42 00 00       	call   80104500 <acquire>
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
8010025c:	e9 5f 43 00 00       	jmp    801045c0 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 06 73 10 80       	push   $0x80107306
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
8010028c:	e8 6f 42 00 00       	call   80104500 <acquire>
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
801002c5:	e8 56 3c 00 00       	call   80103f20 <sleep>
    while(input.r == input.w){
801002ca:	8b 15 80 09 11 80    	mov    0x80110980,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 84 09 11 80    	cmp    0x80110984,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
      if(myproc()->killed){
801002db:	e8 e0 35 00 00       	call   801038c0 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
        release(&cons.lock);
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 a5 10 80       	push   $0x8010a520
801002ef:	e8 cc 42 00 00       	call   801045c0 <release>
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
8010034d:	e8 6e 42 00 00       	call   801045c0 <release>
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
801003b2:	68 0d 73 10 80       	push   $0x8010730d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 63 7c 10 80 	movl   $0x80107c63,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 03 40 00 00       	call   801043e0 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 21 73 10 80       	push   $0x80107321
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
8010043a:	e8 d1 58 00 00       	call   80105d10 <uartputc>
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
801004ec:	e8 1f 58 00 00       	call   80105d10 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 13 58 00 00       	call   80105d10 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 07 58 00 00       	call   80105d10 <uartputc>
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
80100524:	e8 97 41 00 00       	call   801046c0 <memmove>
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
80100541:	e8 ca 40 00 00       	call   80104610 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
    panic("pos under/overflow");
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 25 73 10 80       	push   $0x80107325
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
801005b1:	0f b6 92 50 73 10 80 	movzbl -0x7fef8cb0(%edx),%edx
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
8010061b:	e8 e0 3e 00 00       	call   80104500 <acquire>
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
80100647:	e8 74 3f 00 00       	call   801045c0 <release>
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
8010071f:	e8 9c 3e 00 00       	call   801045c0 <release>
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
80100810:	ba 38 73 10 80       	mov    $0x80107338,%edx
      for(; *s; s++)
80100815:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100818:	b8 28 00 00 00       	mov    $0x28,%eax
8010081d:	89 d3                	mov    %edx,%ebx
8010081f:	eb bf                	jmp    801007e0 <cprintf+0x180>
80100821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
80100828:	83 ec 0c             	sub    $0xc,%esp
8010082b:	68 20 a5 10 80       	push   $0x8010a520
80100830:	e8 cb 3c 00 00       	call   80104500 <acquire>
80100835:	83 c4 10             	add    $0x10,%esp
80100838:	e9 3c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
8010083d:	83 ec 0c             	sub    $0xc,%esp
80100840:	68 3f 73 10 80       	push   $0x8010733f
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
80100863:	e8 98 3c 00 00       	call   80104500 <acquire>
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
801008c8:	e8 f3 3c 00 00       	call   801045c0 <release>
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
80100956:	e8 75 37 00 00       	call   801040d0 <wakeup>
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
801009d7:	e9 d4 37 00 00       	jmp    801041b0 <procdump>
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
80100a06:	68 48 73 10 80       	push   $0x80107348
80100a0b:	68 20 a5 10 80       	push   $0x8010a520
80100a10:	e8 ab 39 00 00       	call   801043c0 <initlock>

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
80100a5c:	e8 5f 2e 00 00       	call   801038c0 <myproc>
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
80100ad4:	e8 87 63 00 00       	call   80106e60 <setupkvm>
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
80100b40:	68 6d 73 10 80       	push   $0x8010736d
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
80100b66:	e8 15 61 00 00       	call   80106c80 <allocuvm>
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
80100b98:	e8 23 60 00 00       	call   80106bc0 <loaduvm>
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
80100be2:	e8 f9 61 00 00       	call   80106de0 <freevm>
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
80100c1a:	e8 61 60 00 00       	call   80106c80 <allocuvm>
80100c1f:	83 c4 10             	add    $0x10,%esp
80100c22:	85 c0                	test   %eax,%eax
80100c24:	89 c6                	mov    %eax,%esi
80100c26:	75 3a                	jne    80100c62 <exec+0x212>
    freevm(pgdir);
80100c28:	83 ec 0c             	sub    $0xc,%esp
80100c2b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c31:	e8 aa 61 00 00       	call   80106de0 <freevm>
80100c36:	83 c4 10             	add    $0x10,%esp
  return -1;
80100c39:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c3e:	e9 79 fe ff ff       	jmp    80100abc <exec+0x6c>
    end_op();
80100c43:	e8 88 20 00 00       	call   80102cd0 <end_op>
    cprintf("exec: fail\n");
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	68 61 73 10 80       	push   $0x80107361
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
80100c76:	e8 85 62 00 00       	call   80106f00 <clearpteu>
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
80100ca9:	e8 82 3b 00 00       	call   80104830 <strlen>
80100cae:	f7 d0                	not    %eax
80100cb0:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cb2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cb5:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cb6:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cb9:	ff 34 b8             	pushl  (%eax,%edi,4)
80100cbc:	e8 6f 3b 00 00       	call   80104830 <strlen>
80100cc1:	83 c0 01             	add    $0x1,%eax
80100cc4:	50                   	push   %eax
80100cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cc8:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ccb:	53                   	push   %ebx
80100ccc:	56                   	push   %esi
80100ccd:	e8 8e 63 00 00       	call   80107060 <copyout>
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
80100d37:	e8 24 63 00 00       	call   80107060 <copyout>
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
80100d7a:	e8 71 3a 00 00       	call   801047f0 <safestrcpy>
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
80100da4:	e8 87 5c 00 00       	call   80106a30 <switchuvm>
  freevm(oldpgdir);
80100da9:	89 3c 24             	mov    %edi,(%esp)
80100dac:	e8 2f 60 00 00       	call   80106de0 <freevm>
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
80100dd6:	68 7b 73 10 80       	push   $0x8010737b
80100ddb:	68 a0 09 11 80       	push   $0x801109a0
80100de0:	e8 db 35 00 00       	call   801043c0 <initlock>
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
80100e01:	e8 fa 36 00 00       	call   80104500 <acquire>
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
80100e31:	e8 8a 37 00 00       	call   801045c0 <release>
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
80100e4a:	e8 71 37 00 00       	call   801045c0 <release>
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
80100e6f:	e8 8c 36 00 00       	call   80104500 <acquire>
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
80100e8c:	e8 2f 37 00 00       	call   801045c0 <release>
  return f;
}
80100e91:	89 d8                	mov    %ebx,%eax
80100e93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e96:	c9                   	leave  
80100e97:	c3                   	ret    
    panic("filedup");
80100e98:	83 ec 0c             	sub    $0xc,%esp
80100e9b:	68 82 73 10 80       	push   $0x80107382
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
80100ec1:	e8 3a 36 00 00       	call   80104500 <acquire>
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
80100eec:	e9 cf 36 00 00       	jmp    801045c0 <release>
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
80100f18:	e8 a3 36 00 00       	call   801045c0 <release>
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
80100f72:	68 8a 73 10 80       	push   $0x8010738a
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
80101052:	68 94 73 10 80       	push   $0x80107394
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
80101165:	68 9d 73 10 80       	push   $0x8010739d
8010116a:	e8 21 f2 ff ff       	call   80100390 <panic>
  panic("filewrite");
8010116f:	83 ec 0c             	sub    $0xc,%esp
80101172:	68 a3 73 10 80       	push   $0x801073a3
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
801011e3:	68 ad 73 10 80       	push   $0x801073ad
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
80101294:	68 c0 73 10 80       	push   $0x801073c0
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
801012d5:	e8 36 33 00 00       	call   80104610 <memset>
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
8010131a:	e8 e1 31 00 00       	call   80104500 <acquire>
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
8010137f:	e8 3c 32 00 00       	call   801045c0 <release>

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
801013ad:	e8 0e 32 00 00       	call   801045c0 <release>
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
801013c2:	68 d6 73 10 80       	push   $0x801073d6
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
80101497:	68 e6 73 10 80       	push   $0x801073e6
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
801014d1:	e8 ea 31 00 00       	call   801046c0 <memmove>
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
801014fc:	68 f9 73 10 80       	push   $0x801073f9
80101501:	68 c0 13 11 80       	push   $0x801113c0
80101506:	e8 b5 2e 00 00       	call   801043c0 <initlock>
8010150b:	83 c4 10             	add    $0x10,%esp
8010150e:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
80101510:	83 ec 08             	sub    $0x8,%esp
80101513:	68 00 74 10 80       	push   $0x80107400
80101518:	53                   	push   %ebx
80101519:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010151f:	e8 6c 2d 00 00       	call   80104290 <initsleeplock>
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
80101569:	68 64 74 10 80       	push   $0x80107464
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
801015fe:	e8 0d 30 00 00       	call   80104610 <memset>
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
80101633:	68 06 74 10 80       	push   $0x80107406
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
801016a1:	e8 1a 30 00 00       	call   801046c0 <memmove>
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
801016cf:	e8 2c 2e 00 00       	call   80104500 <acquire>
  ip->ref++;
801016d4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016d8:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
801016df:	e8 dc 2e 00 00       	call   801045c0 <release>
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
80101712:	e8 b9 2b 00 00       	call   801042d0 <acquiresleep>
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
80101788:	e8 33 2f 00 00       	call   801046c0 <memmove>
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
801017ad:	68 1e 74 10 80       	push   $0x8010741e
801017b2:	e8 d9 eb ff ff       	call   80100390 <panic>
    panic("ilock");
801017b7:	83 ec 0c             	sub    $0xc,%esp
801017ba:	68 18 74 10 80       	push   $0x80107418
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
801017e3:	e8 88 2b 00 00       	call   80104370 <holdingsleep>
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
801017ff:	e9 2c 2b 00 00       	jmp    80104330 <releasesleep>
    panic("iunlock");
80101804:	83 ec 0c             	sub    $0xc,%esp
80101807:	68 2d 74 10 80       	push   $0x8010742d
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
80101830:	e8 9b 2a 00 00       	call   801042d0 <acquiresleep>
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
8010184a:	e8 e1 2a 00 00       	call   80104330 <releasesleep>
  acquire(&icache.lock);
8010184f:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101856:	e8 a5 2c 00 00       	call   80104500 <acquire>
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
80101870:	e9 4b 2d 00 00       	jmp    801045c0 <release>
80101875:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101878:	83 ec 0c             	sub    $0xc,%esp
8010187b:	68 c0 13 11 80       	push   $0x801113c0
80101880:	e8 7b 2c 00 00       	call   80104500 <acquire>
    int r = ip->ref;
80101885:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101888:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
8010188f:	e8 2c 2d 00 00       	call   801045c0 <release>
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
80101a77:	e8 44 2c 00 00       	call   801046c0 <memmove>
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
80101b73:	e8 48 2b 00 00       	call   801046c0 <memmove>
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
80101c0e:	e8 1d 2b 00 00       	call   80104730 <strncmp>
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
80101c6d:	e8 be 2a 00 00       	call   80104730 <strncmp>
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
80101cb2:	68 47 74 10 80       	push   $0x80107447
80101cb7:	e8 d4 e6 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101cbc:	83 ec 0c             	sub    $0xc,%esp
80101cbf:	68 35 74 10 80       	push   $0x80107435
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
80101ce9:	e8 d2 1b 00 00       	call   801038c0 <myproc>
  acquire(&icache.lock);
80101cee:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101cf1:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101cf4:	68 c0 13 11 80       	push   $0x801113c0
80101cf9:	e8 02 28 00 00       	call   80104500 <acquire>
  ip->ref++;
80101cfe:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101d02:	c7 04 24 c0 13 11 80 	movl   $0x801113c0,(%esp)
80101d09:	e8 b2 28 00 00       	call   801045c0 <release>
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
80101d65:	e8 56 29 00 00       	call   801046c0 <memmove>
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
80101df8:	e8 c3 28 00 00       	call   801046c0 <memmove>
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
80101eed:	e8 9e 28 00 00       	call   80104790 <strncpy>
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
80101f2b:	68 56 74 10 80       	push   $0x80107456
80101f30:	e8 5b e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101f35:	83 ec 0c             	sub    $0xc,%esp
80101f38:	68 4a 7a 10 80       	push   $0x80107a4a
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
8010204b:	68 c0 74 10 80       	push   $0x801074c0
80102050:	e8 3b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80102055:	83 ec 0c             	sub    $0xc,%esp
80102058:	68 b7 74 10 80       	push   $0x801074b7
8010205d:	e8 2e e3 ff ff       	call   80100390 <panic>
80102062:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102070 <ideinit>:
{
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102076:	68 d2 74 10 80       	push   $0x801074d2
8010207b:	68 80 a5 10 80       	push   $0x8010a580
80102080:	e8 3b 23 00 00       	call   801043c0 <initlock>
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
801020fe:	e8 fd 23 00 00       	call   80104500 <acquire>

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
80102161:	e8 6a 1f 00 00       	call   801040d0 <wakeup>

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
8010217f:	e8 3c 24 00 00       	call   801045c0 <release>

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
8010219e:	e8 cd 21 00 00       	call   80104370 <holdingsleep>
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
801021d8:	e8 23 23 00 00       	call   80104500 <acquire>

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
80102229:	e8 f2 1c 00 00       	call   80103f20 <sleep>
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
80102246:	e9 75 23 00 00       	jmp    801045c0 <release>
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
8010226a:	68 ec 74 10 80       	push   $0x801074ec
8010226f:	e8 1c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 d6 74 10 80       	push   $0x801074d6
8010227c:	e8 0f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102281:	83 ec 0c             	sub    $0xc,%esp
80102284:	68 01 75 10 80       	push   $0x80107501
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
801022d7:	68 20 75 10 80       	push   $0x80107520
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
80102392:	81 fb 88 5f 11 80    	cmp    $0x80115f88,%ebx
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
801023b2:	e8 59 22 00 00       	call   80104610 <memset>

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
801023eb:	e9 d0 21 00 00       	jmp    801045c0 <release>
    acquire(&kmem.lock);
801023f0:	83 ec 0c             	sub    $0xc,%esp
801023f3:	68 20 30 11 80       	push   $0x80113020
801023f8:	e8 03 21 00 00       	call   80104500 <acquire>
801023fd:	83 c4 10             	add    $0x10,%esp
80102400:	eb c2                	jmp    801023c4 <kfree+0x44>
    panic("kfree");
80102402:	83 ec 0c             	sub    $0xc,%esp
80102405:	68 52 75 10 80       	push   $0x80107552
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
8010246b:	68 58 75 10 80       	push   $0x80107558
80102470:	68 20 30 11 80       	push   $0x80113020
80102475:	e8 46 1f 00 00       	call   801043c0 <initlock>
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
80102563:	e8 98 1f 00 00       	call   80104500 <acquire>
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
80102591:	e8 2a 20 00 00       	call   801045c0 <release>
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
801025e3:	0f b6 82 80 76 10 80 	movzbl -0x7fef8980(%edx),%eax
801025ea:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
801025ec:	0f b6 82 80 75 10 80 	movzbl -0x7fef8a80(%edx),%eax
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
80102603:	8b 04 85 60 75 10 80 	mov    -0x7fef8aa0(,%eax,4),%eax
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
80102628:	0f b6 82 80 76 10 80 	movzbl -0x7fef8980(%edx),%eax
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
801029a7:	e8 b4 1c 00 00       	call   80104660 <memcmp>
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
80102b24:	e8 97 1b 00 00       	call   801046c0 <memmove>
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
80102bca:	68 80 77 10 80       	push   $0x80107780
80102bcf:	68 60 30 11 80       	push   $0x80113060
80102bd4:	e8 e7 17 00 00       	call   801043c0 <initlock>
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
80102c6b:	e8 90 18 00 00       	call   80104500 <acquire>
80102c70:	83 c4 10             	add    $0x10,%esp
80102c73:	eb 18                	jmp    80102c8d <begin_op+0x2d>
80102c75:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102c78:	83 ec 08             	sub    $0x8,%esp
80102c7b:	68 60 30 11 80       	push   $0x80113060
80102c80:	68 60 30 11 80       	push   $0x80113060
80102c85:	e8 96 12 00 00       	call   80103f20 <sleep>
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
80102cbc:	e8 ff 18 00 00       	call   801045c0 <release>
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
80102cde:	e8 1d 18 00 00       	call   80104500 <acquire>
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
80102d1c:	e8 9f 18 00 00       	call   801045c0 <release>
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
80102d76:	e8 45 19 00 00       	call   801046c0 <memmove>
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
80102dbf:	e8 3c 17 00 00       	call   80104500 <acquire>
    wakeup(&log);
80102dc4:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
    log.committing = 0;
80102dcb:	c7 05 a0 30 11 80 00 	movl   $0x0,0x801130a0
80102dd2:	00 00 00 
    wakeup(&log);
80102dd5:	e8 f6 12 00 00       	call   801040d0 <wakeup>
    release(&log.lock);
80102dda:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102de1:	e8 da 17 00 00       	call   801045c0 <release>
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
80102e00:	e8 cb 12 00 00       	call   801040d0 <wakeup>
  release(&log.lock);
80102e05:	c7 04 24 60 30 11 80 	movl   $0x80113060,(%esp)
80102e0c:	e8 af 17 00 00       	call   801045c0 <release>
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
80102e1f:	68 84 77 10 80       	push   $0x80107784
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
80102e6e:	e8 8d 16 00 00       	call   80104500 <acquire>
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
80102ebd:	e9 fe 16 00 00       	jmp    801045c0 <release>
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
80102ee9:	68 93 77 10 80       	push   $0x80107793
80102eee:	e8 9d d4 ff ff       	call   80100390 <panic>
    panic("log_write outside of trans");
80102ef3:	83 ec 0c             	sub    $0xc,%esp
80102ef6:	68 a9 77 10 80       	push   $0x801077a9
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
80102f07:	e8 94 09 00 00       	call   801038a0 <cpuid>
80102f0c:	89 c3                	mov    %eax,%ebx
80102f0e:	e8 8d 09 00 00       	call   801038a0 <cpuid>
80102f13:	83 ec 04             	sub    $0x4,%esp
80102f16:	53                   	push   %ebx
80102f17:	50                   	push   %eax
80102f18:	68 c4 77 10 80       	push   $0x801077c4
80102f1d:	e8 3e d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102f22:	e8 f9 29 00 00       	call   80105920 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102f27:	e8 f4 08 00 00       	call   80103820 <mycpu>
80102f2c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102f2e:	b8 01 00 00 00       	mov    $0x1,%eax
80102f33:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102f3a:	e8 71 0c 00 00       	call   80103bb0 <scheduler>
80102f3f:	90                   	nop

80102f40 <mpenter>:
{
80102f40:	55                   	push   %ebp
80102f41:	89 e5                	mov    %esp,%ebp
80102f43:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102f46:	e8 c5 3a 00 00       	call   80106a10 <switchkvm>
  seginit();
80102f4b:	e8 30 3a 00 00       	call   80106980 <seginit>
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
80102f77:	68 88 5f 11 80       	push   $0x80115f88
80102f7c:	e8 df f4 ff ff       	call   80102460 <kinit1>
  kvmalloc();      // kernel page table
80102f81:	e8 5a 3f 00 00       	call   80106ee0 <kvmalloc>
  mpinit();        // detect other processors
80102f86:	e8 75 01 00 00       	call   80103100 <mpinit>
  lapicinit();     // interrupt controller
80102f8b:	e8 10 f7 ff ff       	call   801026a0 <lapicinit>
  seginit();       // segment descriptors
80102f90:	e8 eb 39 00 00       	call   80106980 <seginit>
  picinit();       // disable pic
80102f95:	e8 46 03 00 00       	call   801032e0 <picinit>
  ioapicinit();    // another interrupt controller
80102f9a:	e8 f1 f2 ff ff       	call   80102290 <ioapicinit>
  consoleinit();   // console hardware
80102f9f:	e8 5c da ff ff       	call   80100a00 <consoleinit>
  uartinit();      // serial port
80102fa4:	e8 a7 2c 00 00       	call   80105c50 <uartinit>
  pinit();         // process table
80102fa9:	e8 42 08 00 00       	call   801037f0 <pinit>
  tvinit();        // trap vectors
80102fae:	e8 ed 28 00 00       	call   801058a0 <tvinit>
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
80102fd4:	e8 e7 16 00 00       	call   801046c0 <memmove>

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
80103000:	e8 1b 08 00 00       	call   80103820 <mycpu>
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
80103075:	e8 76 08 00 00       	call   801038f0 <userinit>
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
801030ae:	68 d8 77 10 80       	push   $0x801077d8
801030b3:	56                   	push   %esi
801030b4:	e8 a7 15 00 00       	call   80104660 <memcmp>
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
8010316c:	68 f5 77 10 80       	push   $0x801077f5
80103171:	56                   	push   %esi
80103172:	e8 e9 14 00 00       	call   80104660 <memcmp>
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
80103200:	ff 24 95 1c 78 10 80 	jmp    *-0x7fef87e4(,%edx,4)
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
801032b3:	68 dd 77 10 80       	push   $0x801077dd
801032b8:	e8 d3 d0 ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
801032bd:	83 ec 0c             	sub    $0xc,%esp
801032c0:	68 fc 77 10 80       	push   $0x801077fc
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
801033bb:	68 30 78 10 80       	push   $0x80107830
801033c0:	50                   	push   %eax
801033c1:	e8 fa 0f 00 00       	call   801043c0 <initlock>
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
8010341f:	e8 dc 10 00 00       	call   80104500 <acquire>
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
8010343f:	e8 8c 0c 00 00       	call   801040d0 <wakeup>
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
80103464:	e9 57 11 00 00       	jmp    801045c0 <release>
80103469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
80103470:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103476:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
80103479:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103480:	00 00 00 
    wakeup(&p->nwrite);
80103483:	50                   	push   %eax
80103484:	e8 47 0c 00 00       	call   801040d0 <wakeup>
80103489:	83 c4 10             	add    $0x10,%esp
8010348c:	eb b9                	jmp    80103447 <pipeclose+0x37>
8010348e:	66 90                	xchg   %ax,%ax
    release(&p->lock);
80103490:	83 ec 0c             	sub    $0xc,%esp
80103493:	53                   	push   %ebx
80103494:	e8 27 11 00 00       	call   801045c0 <release>
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
801034bd:	e8 3e 10 00 00       	call   80104500 <acquire>
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
80103514:	e8 b7 0b 00 00       	call   801040d0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103519:	5a                   	pop    %edx
8010351a:	59                   	pop    %ecx
8010351b:	53                   	push   %ebx
8010351c:	56                   	push   %esi
8010351d:	e8 fe 09 00 00       	call   80103f20 <sleep>
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
80103544:	e8 77 03 00 00       	call   801038c0 <myproc>
80103549:	8b 40 24             	mov    0x24(%eax),%eax
8010354c:	85 c0                	test   %eax,%eax
8010354e:	74 c0                	je     80103510 <pipewrite+0x60>
        release(&p->lock);
80103550:	83 ec 0c             	sub    $0xc,%esp
80103553:	53                   	push   %ebx
80103554:	e8 67 10 00 00       	call   801045c0 <release>
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
801035a3:	e8 28 0b 00 00       	call   801040d0 <wakeup>
  release(&p->lock);
801035a8:	89 1c 24             	mov    %ebx,(%esp)
801035ab:	e8 10 10 00 00       	call   801045c0 <release>
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
801035d0:	e8 2b 0f 00 00       	call   80104500 <acquire>
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
80103605:	e8 16 09 00 00       	call   80103f20 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010360a:	83 c4 10             	add    $0x10,%esp
8010360d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103613:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103619:	75 35                	jne    80103650 <piperead+0x90>
8010361b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103621:	85 d2                	test   %edx,%edx
80103623:	0f 84 8f 00 00 00    	je     801036b8 <piperead+0xf8>
    if(myproc()->killed){
80103629:	e8 92 02 00 00       	call   801038c0 <myproc>
8010362e:	8b 48 24             	mov    0x24(%eax),%ecx
80103631:	85 c9                	test   %ecx,%ecx
80103633:	74 cb                	je     80103600 <piperead+0x40>
      release(&p->lock);
80103635:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103638:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
8010363d:	56                   	push   %esi
8010363e:	e8 7d 0f 00 00       	call   801045c0 <release>
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
80103697:	e8 34 0a 00 00       	call   801040d0 <wakeup>
  release(&p->lock);
8010369c:	89 34 24             	mov    %esi,(%esp)
8010369f:	e8 1c 0f 00 00       	call   801045c0 <release>
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
801036d1:	e8 2a 0e 00 00       	call   80104500 <acquire>
801036d6:	83 c4 10             	add    $0x10,%esp
801036d9:	eb 14                	jmp    801036ef <allocproc+0x2f>
801036db:	90                   	nop
801036dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036e0:	83 eb 80             	sub    $0xffffff80,%ebx
801036e3:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
801036e9:	0f 83 81 00 00 00    	jae    80103770 <allocproc+0xb0>
    if(p->state == UNUSED)
801036ef:	8b 43 0c             	mov    0xc(%ebx),%eax
801036f2:	85 c0                	test   %eax,%eax
801036f4:	75 ea                	jne    801036e0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036f6:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  p->tickets = 10;
  release(&ptable.lock);
801036fb:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
801036fe:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->tickets = 10;
80103705:	c7 43 7c 0a 00 00 00 	movl   $0xa,0x7c(%ebx)
  p->pid = nextpid++;
8010370c:	8d 50 01             	lea    0x1(%eax),%edx
8010370f:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
80103712:	68 00 37 11 80       	push   $0x80113700
  p->pid = nextpid++;
80103717:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
8010371d:	e8 9e 0e 00 00       	call   801045c0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103722:	e8 09 ee ff ff       	call   80102530 <kalloc>
80103727:	83 c4 10             	add    $0x10,%esp
8010372a:	85 c0                	test   %eax,%eax
8010372c:	89 43 08             	mov    %eax,0x8(%ebx)
8010372f:	74 58                	je     80103789 <allocproc+0xc9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103731:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103737:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010373a:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010373f:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
80103742:	c7 40 14 91 58 10 80 	movl   $0x80105891,0x14(%eax)
  p->context = (struct context*)sp;
80103749:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010374c:	6a 14                	push   $0x14
8010374e:	6a 00                	push   $0x0
80103750:	50                   	push   %eax
80103751:	e8 ba 0e 00 00       	call   80104610 <memset>
  p->context->eip = (uint)forkret;
80103756:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103759:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
8010375c:	c7 40 10 a0 37 10 80 	movl   $0x801037a0,0x10(%eax)
}
80103763:	89 d8                	mov    %ebx,%eax
80103765:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103768:	c9                   	leave  
80103769:	c3                   	ret    
8010376a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80103770:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103773:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103775:	68 00 37 11 80       	push   $0x80113700
8010377a:	e8 41 0e 00 00       	call   801045c0 <release>
}
8010377f:	89 d8                	mov    %ebx,%eax
  return 0;
80103781:	83 c4 10             	add    $0x10,%esp
}
80103784:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103787:	c9                   	leave  
80103788:	c3                   	ret    
    p->state = UNUSED;
80103789:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103790:	31 db                	xor    %ebx,%ebx
80103792:	eb cf                	jmp    80103763 <allocproc+0xa3>
80103794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010379a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037a0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801037a6:	68 00 37 11 80       	push   $0x80113700
801037ab:	e8 10 0e 00 00       	call   801045c0 <release>

  if (first) {
801037b0:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801037b5:	83 c4 10             	add    $0x10,%esp
801037b8:	85 c0                	test   %eax,%eax
801037ba:	75 04                	jne    801037c0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801037bc:	c9                   	leave  
801037bd:	c3                   	ret    
801037be:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
801037c0:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
801037c3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801037ca:	00 00 00 
    iinit(ROOTDEV);
801037cd:	6a 01                	push   $0x1
801037cf:	e8 1c dd ff ff       	call   801014f0 <iinit>
    initlog(ROOTDEV);
801037d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801037db:	e8 e0 f3 ff ff       	call   80102bc0 <initlog>
801037e0:	83 c4 10             	add    $0x10,%esp
}
801037e3:	c9                   	leave  
801037e4:	c3                   	ret    
801037e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037f0 <pinit>:
{
801037f0:	55                   	push   %ebp
801037f1:	89 e5                	mov    %esp,%ebp
801037f3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801037f6:	68 35 78 10 80       	push   $0x80107835
801037fb:	68 00 37 11 80       	push   $0x80113700
80103800:	e8 bb 0b 00 00       	call   801043c0 <initlock>
  sgenrand(unixtime());
80103805:	e8 66 f2 ff ff       	call   80102a70 <unixtime>
8010380a:	89 04 24             	mov    %eax,(%esp)
8010380d:	e8 ee 38 00 00       	call   80107100 <sgenrand>
}
80103812:	83 c4 10             	add    $0x10,%esp
80103815:	c9                   	leave  
80103816:	c3                   	ret    
80103817:	89 f6                	mov    %esi,%esi
80103819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103820 <mycpu>:
{
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	56                   	push   %esi
80103824:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103825:	9c                   	pushf  
80103826:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103827:	f6 c4 02             	test   $0x2,%ah
8010382a:	75 5e                	jne    8010388a <mycpu+0x6a>
  apicid = lapicid();
8010382c:	e8 6f ef ff ff       	call   801027a0 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103831:	8b 35 e0 36 11 80    	mov    0x801136e0,%esi
80103837:	85 f6                	test   %esi,%esi
80103839:	7e 42                	jle    8010387d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010383b:	0f b6 15 60 31 11 80 	movzbl 0x80113160,%edx
80103842:	39 d0                	cmp    %edx,%eax
80103844:	74 30                	je     80103876 <mycpu+0x56>
80103846:	b9 10 32 11 80       	mov    $0x80113210,%ecx
  for (i = 0; i < ncpu; ++i) {
8010384b:	31 d2                	xor    %edx,%edx
8010384d:	8d 76 00             	lea    0x0(%esi),%esi
80103850:	83 c2 01             	add    $0x1,%edx
80103853:	39 f2                	cmp    %esi,%edx
80103855:	74 26                	je     8010387d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
80103857:	0f b6 19             	movzbl (%ecx),%ebx
8010385a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103860:	39 c3                	cmp    %eax,%ebx
80103862:	75 ec                	jne    80103850 <mycpu+0x30>
80103864:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
8010386a:	05 60 31 11 80       	add    $0x80113160,%eax
}
8010386f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103872:	5b                   	pop    %ebx
80103873:	5e                   	pop    %esi
80103874:	5d                   	pop    %ebp
80103875:	c3                   	ret    
    if (cpus[i].apicid == apicid)
80103876:	b8 60 31 11 80       	mov    $0x80113160,%eax
      return &cpus[i];
8010387b:	eb f2                	jmp    8010386f <mycpu+0x4f>
  panic("unknown apicid\n");
8010387d:	83 ec 0c             	sub    $0xc,%esp
80103880:	68 3c 78 10 80       	push   $0x8010783c
80103885:	e8 06 cb ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
8010388a:	83 ec 0c             	sub    $0xc,%esp
8010388d:	68 1c 79 10 80       	push   $0x8010791c
80103892:	e8 f9 ca ff ff       	call   80100390 <panic>
80103897:	89 f6                	mov    %esi,%esi
80103899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038a0 <cpuid>:
cpuid() {
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
801038a6:	e8 75 ff ff ff       	call   80103820 <mycpu>
801038ab:	2d 60 31 11 80       	sub    $0x80113160,%eax
}
801038b0:	c9                   	leave  
  return mycpu()-cpus;
801038b1:	c1 f8 04             	sar    $0x4,%eax
801038b4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
801038ba:	c3                   	ret    
801038bb:	90                   	nop
801038bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801038c0 <myproc>:
myproc(void) {
801038c0:	55                   	push   %ebp
801038c1:	89 e5                	mov    %esp,%ebp
801038c3:	53                   	push   %ebx
801038c4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801038c7:	e8 64 0b 00 00       	call   80104430 <pushcli>
  c = mycpu();
801038cc:	e8 4f ff ff ff       	call   80103820 <mycpu>
  p = c->proc;
801038d1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038d7:	e8 94 0b 00 00       	call   80104470 <popcli>
}
801038dc:	83 c4 04             	add    $0x4,%esp
801038df:	89 d8                	mov    %ebx,%eax
801038e1:	5b                   	pop    %ebx
801038e2:	5d                   	pop    %ebp
801038e3:	c3                   	ret    
801038e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801038f0 <userinit>:
{
801038f0:	55                   	push   %ebp
801038f1:	89 e5                	mov    %esp,%ebp
801038f3:	53                   	push   %ebx
801038f4:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
801038f7:	e8 c4 fd ff ff       	call   801036c0 <allocproc>
801038fc:	89 c3                	mov    %eax,%ebx
  initproc = p;
801038fe:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
80103903:	e8 58 35 00 00       	call   80106e60 <setupkvm>
80103908:	85 c0                	test   %eax,%eax
8010390a:	89 43 04             	mov    %eax,0x4(%ebx)
8010390d:	0f 84 bd 00 00 00    	je     801039d0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103913:	83 ec 04             	sub    $0x4,%esp
80103916:	68 2c 00 00 00       	push   $0x2c
8010391b:	68 64 a4 10 80       	push   $0x8010a464
80103920:	50                   	push   %eax
80103921:	e8 1a 32 00 00       	call   80106b40 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103926:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103929:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010392f:	6a 4c                	push   $0x4c
80103931:	6a 00                	push   $0x0
80103933:	ff 73 18             	pushl  0x18(%ebx)
80103936:	e8 d5 0c 00 00       	call   80104610 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010393b:	8b 43 18             	mov    0x18(%ebx),%eax
8010393e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103943:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103948:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010394b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010394f:	8b 43 18             	mov    0x18(%ebx),%eax
80103952:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103956:	8b 43 18             	mov    0x18(%ebx),%eax
80103959:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010395d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103961:	8b 43 18             	mov    0x18(%ebx),%eax
80103964:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103968:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010396c:	8b 43 18             	mov    0x18(%ebx),%eax
8010396f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103976:	8b 43 18             	mov    0x18(%ebx),%eax
80103979:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103980:	8b 43 18             	mov    0x18(%ebx),%eax
80103983:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010398a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010398d:	6a 10                	push   $0x10
8010398f:	68 65 78 10 80       	push   $0x80107865
80103994:	50                   	push   %eax
80103995:	e8 56 0e 00 00       	call   801047f0 <safestrcpy>
  p->cwd = namei("/");
8010399a:	c7 04 24 6e 78 10 80 	movl   $0x8010786e,(%esp)
801039a1:	e8 aa e5 ff ff       	call   80101f50 <namei>
801039a6:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
801039a9:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
801039b0:	e8 4b 0b 00 00       	call   80104500 <acquire>
  p->state = RUNNABLE;
801039b5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
801039bc:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
801039c3:	e8 f8 0b 00 00       	call   801045c0 <release>
}
801039c8:	83 c4 10             	add    $0x10,%esp
801039cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039ce:	c9                   	leave  
801039cf:	c3                   	ret    
    panic("userinit: out of memory?");
801039d0:	83 ec 0c             	sub    $0xc,%esp
801039d3:	68 4c 78 10 80       	push   $0x8010784c
801039d8:	e8 b3 c9 ff ff       	call   80100390 <panic>
801039dd:	8d 76 00             	lea    0x0(%esi),%esi

801039e0 <growproc>:
{
801039e0:	55                   	push   %ebp
801039e1:	89 e5                	mov    %esp,%ebp
801039e3:	56                   	push   %esi
801039e4:	53                   	push   %ebx
801039e5:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
801039e8:	e8 43 0a 00 00       	call   80104430 <pushcli>
  c = mycpu();
801039ed:	e8 2e fe ff ff       	call   80103820 <mycpu>
  p = c->proc;
801039f2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801039f8:	e8 73 0a 00 00       	call   80104470 <popcli>
  if(n > 0){
801039fd:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
80103a00:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103a02:	7f 1c                	jg     80103a20 <growproc+0x40>
  } else if(n < 0){
80103a04:	75 3a                	jne    80103a40 <growproc+0x60>
  switchuvm(curproc);
80103a06:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103a09:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103a0b:	53                   	push   %ebx
80103a0c:	e8 1f 30 00 00       	call   80106a30 <switchuvm>
  return 0;
80103a11:	83 c4 10             	add    $0x10,%esp
80103a14:	31 c0                	xor    %eax,%eax
}
80103a16:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a19:	5b                   	pop    %ebx
80103a1a:	5e                   	pop    %esi
80103a1b:	5d                   	pop    %ebp
80103a1c:	c3                   	ret    
80103a1d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a20:	83 ec 04             	sub    $0x4,%esp
80103a23:	01 c6                	add    %eax,%esi
80103a25:	56                   	push   %esi
80103a26:	50                   	push   %eax
80103a27:	ff 73 04             	pushl  0x4(%ebx)
80103a2a:	e8 51 32 00 00       	call   80106c80 <allocuvm>
80103a2f:	83 c4 10             	add    $0x10,%esp
80103a32:	85 c0                	test   %eax,%eax
80103a34:	75 d0                	jne    80103a06 <growproc+0x26>
      return -1;
80103a36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a3b:	eb d9                	jmp    80103a16 <growproc+0x36>
80103a3d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a40:	83 ec 04             	sub    $0x4,%esp
80103a43:	01 c6                	add    %eax,%esi
80103a45:	56                   	push   %esi
80103a46:	50                   	push   %eax
80103a47:	ff 73 04             	pushl  0x4(%ebx)
80103a4a:	e8 61 33 00 00       	call   80106db0 <deallocuvm>
80103a4f:	83 c4 10             	add    $0x10,%esp
80103a52:	85 c0                	test   %eax,%eax
80103a54:	75 b0                	jne    80103a06 <growproc+0x26>
80103a56:	eb de                	jmp    80103a36 <growproc+0x56>
80103a58:	90                   	nop
80103a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103a60 <fork>:
{
80103a60:	55                   	push   %ebp
80103a61:	89 e5                	mov    %esp,%ebp
80103a63:	57                   	push   %edi
80103a64:	56                   	push   %esi
80103a65:	53                   	push   %ebx
80103a66:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103a69:	e8 c2 09 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103a6e:	e8 ad fd ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103a73:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a79:	e8 f2 09 00 00       	call   80104470 <popcli>
  if((np = allocproc()) == 0){
80103a7e:	e8 3d fc ff ff       	call   801036c0 <allocproc>
80103a83:	85 c0                	test   %eax,%eax
80103a85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a88:	0f 84 b7 00 00 00    	je     80103b45 <fork+0xe5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103a8e:	83 ec 08             	sub    $0x8,%esp
80103a91:	ff 33                	pushl  (%ebx)
80103a93:	ff 73 04             	pushl  0x4(%ebx)
80103a96:	89 c7                	mov    %eax,%edi
80103a98:	e8 93 34 00 00       	call   80106f30 <copyuvm>
80103a9d:	83 c4 10             	add    $0x10,%esp
80103aa0:	85 c0                	test   %eax,%eax
80103aa2:	89 47 04             	mov    %eax,0x4(%edi)
80103aa5:	0f 84 a1 00 00 00    	je     80103b4c <fork+0xec>
  np->sz = curproc->sz;
80103aab:	8b 03                	mov    (%ebx),%eax
80103aad:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103ab0:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103ab2:	89 59 14             	mov    %ebx,0x14(%ecx)
80103ab5:	89 c8                	mov    %ecx,%eax
  *np->tf = *curproc->tf;
80103ab7:	8b 79 18             	mov    0x18(%ecx),%edi
80103aba:	8b 73 18             	mov    0x18(%ebx),%esi
80103abd:	b9 13 00 00 00       	mov    $0x13,%ecx
80103ac2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103ac4:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103ac6:	8b 40 18             	mov    0x18(%eax),%eax
80103ac9:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if(curproc->ofile[i])
80103ad0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103ad4:	85 c0                	test   %eax,%eax
80103ad6:	74 13                	je     80103aeb <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103ad8:	83 ec 0c             	sub    $0xc,%esp
80103adb:	50                   	push   %eax
80103adc:	e8 7f d3 ff ff       	call   80100e60 <filedup>
80103ae1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ae4:	83 c4 10             	add    $0x10,%esp
80103ae7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103aeb:	83 c6 01             	add    $0x1,%esi
80103aee:	83 fe 10             	cmp    $0x10,%esi
80103af1:	75 dd                	jne    80103ad0 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103af3:	83 ec 0c             	sub    $0xc,%esp
80103af6:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103af9:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103afc:	e8 bf db ff ff       	call   801016c0 <idup>
80103b01:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b04:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103b07:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b0a:	8d 47 6c             	lea    0x6c(%edi),%eax
80103b0d:	6a 10                	push   $0x10
80103b0f:	53                   	push   %ebx
80103b10:	50                   	push   %eax
80103b11:	e8 da 0c 00 00       	call   801047f0 <safestrcpy>
  pid = np->pid;
80103b16:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103b19:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b20:	e8 db 09 00 00       	call   80104500 <acquire>
  np->state = RUNNABLE;
80103b25:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103b2c:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103b33:	e8 88 0a 00 00       	call   801045c0 <release>
  return pid;
80103b38:	83 c4 10             	add    $0x10,%esp
}
80103b3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b3e:	89 d8                	mov    %ebx,%eax
80103b40:	5b                   	pop    %ebx
80103b41:	5e                   	pop    %esi
80103b42:	5f                   	pop    %edi
80103b43:	5d                   	pop    %ebp
80103b44:	c3                   	ret    
    return -1;
80103b45:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b4a:	eb ef                	jmp    80103b3b <fork+0xdb>
    kfree(np->kstack);
80103b4c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b4f:	83 ec 0c             	sub    $0xc,%esp
80103b52:	ff 73 08             	pushl  0x8(%ebx)
80103b55:	e8 26 e8 ff ff       	call   80102380 <kfree>
    np->kstack = 0;
80103b5a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b61:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103b68:	83 c4 10             	add    $0x10,%esp
80103b6b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b70:	eb c9                	jmp    80103b3b <fork+0xdb>
80103b72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b80 <lottery_total>:
lottery_total(void){
80103b80:	55                   	push   %ebp
  int ticket_aggregate=0;
80103b81:	31 c0                	xor    %eax,%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b83:	ba 34 37 11 80       	mov    $0x80113734,%edx
lottery_total(void){
80103b88:	89 e5                	mov    %esp,%ebp
80103b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p->state==RUNNABLE){
80103b90:	83 7a 0c 03          	cmpl   $0x3,0xc(%edx)
80103b94:	75 03                	jne    80103b99 <lottery_total+0x19>
      ticket_aggregate+=p->tickets;
80103b96:	03 42 7c             	add    0x7c(%edx),%eax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b99:	83 ea 80             	sub    $0xffffff80,%edx
80103b9c:	81 fa 34 57 11 80    	cmp    $0x80115734,%edx
80103ba2:	72 ec                	jb     80103b90 <lottery_total+0x10>
}
80103ba4:	5d                   	pop    %ebp
80103ba5:	c3                   	ret    
80103ba6:	8d 76 00             	lea    0x0(%esi),%esi
80103ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103bb0 <scheduler>:
{
80103bb0:	55                   	push   %ebp
80103bb1:	89 e5                	mov    %esp,%ebp
80103bb3:	57                   	push   %edi
80103bb4:	56                   	push   %esi
80103bb5:	53                   	push   %ebx
  long counter = 0;
80103bb6:	31 ff                	xor    %edi,%edi
  long total_tickets = 0;
80103bb8:	31 f6                	xor    %esi,%esi
{
80103bba:	83 ec 2c             	sub    $0x2c,%esp
  struct cpu *c = mycpu();
80103bbd:	e8 5e fc ff ff       	call   80103820 <mycpu>
  int got_total = 0; // 0 is False, 1 is True
80103bc2:	31 d2                	xor    %edx,%edx
  c->proc = 0;
80103bc4:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103bcb:	00 00 00 
  struct cpu *c = mycpu();
80103bce:	89 45 d8             	mov    %eax,-0x28(%ebp)
80103bd1:	83 c0 04             	add    $0x4,%eax
  int winner_found = 0;
80103bd4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  long winner = 0;
80103bdb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80103be2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80103be5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80103be8:	e9 85 00 00 00       	jmp    80103c72 <scheduler+0xc2>
80103bed:	8d 76 00             	lea    0x0(%esi),%esi
      if (got_total == 0) {
80103bf0:	85 d2                	test   %edx,%edx
80103bf2:	8b 43 7c             	mov    0x7c(%ebx),%eax
80103bf5:	0f 84 b5 00 00 00    	je     80103cb0 <scheduler+0x100>
      counter += p->tickets;
80103bfb:	01 c7                	add    %eax,%edi
      if (counter < winner) {
80103bfd:	39 7d e0             	cmp    %edi,-0x20(%ebp)
80103c00:	0f 8f aa 00 00 00    	jg     80103cb0 <scheduler+0x100>
      if (winner_found) {
80103c06:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80103c09:	85 c9                	test   %ecx,%ecx
80103c0b:	0f 85 9f 00 00 00    	jne    80103cb0 <scheduler+0x100>
      c->proc = p;
80103c11:	8b 45 d8             	mov    -0x28(%ebp),%eax
      switchuvm(p);
80103c14:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103c17:	89 98 ac 00 00 00    	mov    %ebx,0xac(%eax)
      switchuvm(p);
80103c1d:	53                   	push   %ebx
80103c1e:	e8 0d 2e 00 00       	call   80106a30 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103c23:	58                   	pop    %eax
80103c24:	5a                   	pop    %edx
80103c25:	ff 73 1c             	pushl  0x1c(%ebx)
80103c28:	ff 75 d4             	pushl  -0x2c(%ebp)
      p->state = RUNNING;
80103c2b:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&(c->scheduler), p->context);
80103c32:	e8 14 0c 00 00       	call   8010484b <swtch>
      switchkvm();
80103c37:	e8 d4 2d 00 00       	call   80106a10 <switchkvm>
      if (p->state == RUNNABLE) {
80103c3c:	83 c4 10             	add    $0x10,%esp
80103c3f:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c43:	75 09                	jne    80103c4e <scheduler+0x9e>
      winner_found = 1;
80103c45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
            total_tickets += p->tickets;
80103c48:	03 73 7c             	add    0x7c(%ebx),%esi
      winner_found = 1;
80103c4b:	89 45 dc             	mov    %eax,-0x24(%ebp)
      c->proc = 0;
80103c4e:	8b 45 d8             	mov    -0x28(%ebp),%eax
80103c51:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103c58:	00 00 00 
    release(&ptable.lock);
80103c5b:	83 ec 0c             	sub    $0xc,%esp
80103c5e:	68 00 37 11 80       	push   $0x80113700
80103c63:	e8 58 09 00 00       	call   801045c0 <release>
    got_total = 1;
80103c68:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    sti();
80103c6f:	83 c4 10             	add    $0x10,%esp
  asm volatile("sti");
80103c72:	fb                   	sti    
    if (got_total == 1) {
80103c73:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
80103c77:	74 47                	je     80103cc0 <scheduler+0x110>
    acquire(&ptable.lock);
80103c79:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c7c:	bb 34 37 11 80       	mov    $0x80113734,%ebx
    acquire(&ptable.lock);
80103c81:	68 00 37 11 80       	push   $0x80113700
80103c86:	e8 75 08 00 00       	call   80104500 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c8b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    acquire(&ptable.lock);
80103c8e:	83 c4 10             	add    $0x10,%esp
80103c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->state != RUNNABLE) {
80103c98:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c9c:	0f 84 4e ff ff ff    	je     80103bf0 <scheduler+0x40>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ca2:	83 eb 80             	sub    $0xffffff80,%ebx
80103ca5:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
80103cab:	72 eb                	jb     80103c98 <scheduler+0xe8>
80103cad:	eb ac                	jmp    80103c5b <scheduler+0xab>
80103caf:	90                   	nop
80103cb0:	83 eb 80             	sub    $0xffffff80,%ebx
            total_tickets += p->tickets;
80103cb3:	01 c6                	add    %eax,%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cb5:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
80103cbb:	72 db                	jb     80103c98 <scheduler+0xe8>
80103cbd:	eb 9c                	jmp    80103c5b <scheduler+0xab>
80103cbf:	90                   	nop
         winner = random_at_most(total_tickets);
80103cc0:	83 ec 0c             	sub    $0xc,%esp
         counter = 0;
80103cc3:	31 ff                	xor    %edi,%edi
         winner = random_at_most(total_tickets);
80103cc5:	56                   	push   %esi
         total_tickets = 0;
80103cc6:	31 f6                	xor    %esi,%esi
         winner = random_at_most(total_tickets);
80103cc8:	e8 c3 35 00 00       	call   80107290 <random_at_most>
80103ccd:	83 c4 10             	add    $0x10,%esp
80103cd0:	89 45 e0             	mov    %eax,-0x20(%ebp)
         winner_found = 0;
80103cd3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80103cda:	eb 9d                	jmp    80103c79 <scheduler+0xc9>
80103cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103ce0 <sched>:
{
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	56                   	push   %esi
80103ce4:	53                   	push   %ebx
  pushcli();
80103ce5:	e8 46 07 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103cea:	e8 31 fb ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103cef:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103cf5:	e8 76 07 00 00       	call   80104470 <popcli>
  if(!holding(&ptable.lock))
80103cfa:	83 ec 0c             	sub    $0xc,%esp
80103cfd:	68 00 37 11 80       	push   $0x80113700
80103d02:	e8 c9 07 00 00       	call   801044d0 <holding>
80103d07:	83 c4 10             	add    $0x10,%esp
80103d0a:	85 c0                	test   %eax,%eax
80103d0c:	74 4f                	je     80103d5d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103d0e:	e8 0d fb ff ff       	call   80103820 <mycpu>
80103d13:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103d1a:	75 68                	jne    80103d84 <sched+0xa4>
  if(p->state == RUNNING)
80103d1c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103d20:	74 55                	je     80103d77 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103d22:	9c                   	pushf  
80103d23:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103d24:	f6 c4 02             	test   $0x2,%ah
80103d27:	75 41                	jne    80103d6a <sched+0x8a>
  intena = mycpu()->intena;
80103d29:	e8 f2 fa ff ff       	call   80103820 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103d2e:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103d31:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103d37:	e8 e4 fa ff ff       	call   80103820 <mycpu>
80103d3c:	83 ec 08             	sub    $0x8,%esp
80103d3f:	ff 70 04             	pushl  0x4(%eax)
80103d42:	53                   	push   %ebx
80103d43:	e8 03 0b 00 00       	call   8010484b <swtch>
  mycpu()->intena = intena;
80103d48:	e8 d3 fa ff ff       	call   80103820 <mycpu>
}
80103d4d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103d50:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103d56:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103d59:	5b                   	pop    %ebx
80103d5a:	5e                   	pop    %esi
80103d5b:	5d                   	pop    %ebp
80103d5c:	c3                   	ret    
    panic("sched ptable.lock");
80103d5d:	83 ec 0c             	sub    $0xc,%esp
80103d60:	68 70 78 10 80       	push   $0x80107870
80103d65:	e8 26 c6 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103d6a:	83 ec 0c             	sub    $0xc,%esp
80103d6d:	68 9c 78 10 80       	push   $0x8010789c
80103d72:	e8 19 c6 ff ff       	call   80100390 <panic>
    panic("sched running");
80103d77:	83 ec 0c             	sub    $0xc,%esp
80103d7a:	68 8e 78 10 80       	push   $0x8010788e
80103d7f:	e8 0c c6 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103d84:	83 ec 0c             	sub    $0xc,%esp
80103d87:	68 82 78 10 80       	push   $0x80107882
80103d8c:	e8 ff c5 ff ff       	call   80100390 <panic>
80103d91:	eb 0d                	jmp    80103da0 <exit>
80103d93:	90                   	nop
80103d94:	90                   	nop
80103d95:	90                   	nop
80103d96:	90                   	nop
80103d97:	90                   	nop
80103d98:	90                   	nop
80103d99:	90                   	nop
80103d9a:	90                   	nop
80103d9b:	90                   	nop
80103d9c:	90                   	nop
80103d9d:	90                   	nop
80103d9e:	90                   	nop
80103d9f:	90                   	nop

80103da0 <exit>:
{
80103da0:	55                   	push   %ebp
80103da1:	89 e5                	mov    %esp,%ebp
80103da3:	57                   	push   %edi
80103da4:	56                   	push   %esi
80103da5:	53                   	push   %ebx
80103da6:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103da9:	e8 82 06 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103dae:	e8 6d fa ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103db3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103db9:	e8 b2 06 00 00       	call   80104470 <popcli>
  if(curproc == initproc)
80103dbe:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103dc4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103dc7:	8d 7e 68             	lea    0x68(%esi),%edi
80103dca:	0f 84 e7 00 00 00    	je     80103eb7 <exit+0x117>
    if(curproc->ofile[fd]){
80103dd0:	8b 03                	mov    (%ebx),%eax
80103dd2:	85 c0                	test   %eax,%eax
80103dd4:	74 12                	je     80103de8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103dd6:	83 ec 0c             	sub    $0xc,%esp
80103dd9:	50                   	push   %eax
80103dda:	e8 d1 d0 ff ff       	call   80100eb0 <fileclose>
      curproc->ofile[fd] = 0;
80103ddf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103de5:	83 c4 10             	add    $0x10,%esp
80103de8:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103deb:	39 fb                	cmp    %edi,%ebx
80103ded:	75 e1                	jne    80103dd0 <exit+0x30>
  begin_op();
80103def:	e8 6c ee ff ff       	call   80102c60 <begin_op>
  iput(curproc->cwd);
80103df4:	83 ec 0c             	sub    $0xc,%esp
80103df7:	ff 76 68             	pushl  0x68(%esi)
80103dfa:	e8 21 da ff ff       	call   80101820 <iput>
  end_op();
80103dff:	e8 cc ee ff ff       	call   80102cd0 <end_op>
  curproc->cwd = 0;
80103e04:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103e0b:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103e12:	e8 e9 06 00 00       	call   80104500 <acquire>
  wakeup1(curproc->parent);
80103e17:	8b 56 14             	mov    0x14(%esi),%edx
80103e1a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e1d:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103e22:	eb 0e                	jmp    80103e32 <exit+0x92>
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	83 e8 80             	sub    $0xffffff80,%eax
80103e2b:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80103e30:	73 1c                	jae    80103e4e <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103e32:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e36:	75 f0                	jne    80103e28 <exit+0x88>
80103e38:	3b 50 20             	cmp    0x20(%eax),%edx
80103e3b:	75 eb                	jne    80103e28 <exit+0x88>
      p->state = RUNNABLE;
80103e3d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e44:	83 e8 80             	sub    $0xffffff80,%eax
80103e47:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80103e4c:	72 e4                	jb     80103e32 <exit+0x92>
      p->parent = initproc;
80103e4e:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e54:	ba 34 37 11 80       	mov    $0x80113734,%edx
80103e59:	eb 10                	jmp    80103e6b <exit+0xcb>
80103e5b:	90                   	nop
80103e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e60:	83 ea 80             	sub    $0xffffff80,%edx
80103e63:	81 fa 34 57 11 80    	cmp    $0x80115734,%edx
80103e69:	73 33                	jae    80103e9e <exit+0xfe>
    if(p->parent == curproc){
80103e6b:	39 72 14             	cmp    %esi,0x14(%edx)
80103e6e:	75 f0                	jne    80103e60 <exit+0xc0>
      if(p->state == ZOMBIE)
80103e70:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103e74:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e77:	75 e7                	jne    80103e60 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e79:	b8 34 37 11 80       	mov    $0x80113734,%eax
80103e7e:	eb 0a                	jmp    80103e8a <exit+0xea>
80103e80:	83 e8 80             	sub    $0xffffff80,%eax
80103e83:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80103e88:	73 d6                	jae    80103e60 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103e8a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e8e:	75 f0                	jne    80103e80 <exit+0xe0>
80103e90:	3b 48 20             	cmp    0x20(%eax),%ecx
80103e93:	75 eb                	jne    80103e80 <exit+0xe0>
      p->state = RUNNABLE;
80103e95:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e9c:	eb e2                	jmp    80103e80 <exit+0xe0>
  curproc->state = ZOMBIE;
80103e9e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103ea5:	e8 36 fe ff ff       	call   80103ce0 <sched>
  panic("zombie exit");
80103eaa:	83 ec 0c             	sub    $0xc,%esp
80103ead:	68 bd 78 10 80       	push   $0x801078bd
80103eb2:	e8 d9 c4 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103eb7:	83 ec 0c             	sub    $0xc,%esp
80103eba:	68 b0 78 10 80       	push   $0x801078b0
80103ebf:	e8 cc c4 ff ff       	call   80100390 <panic>
80103ec4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103eca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103ed0 <yield>:
{
80103ed0:	55                   	push   %ebp
80103ed1:	89 e5                	mov    %esp,%ebp
80103ed3:	53                   	push   %ebx
80103ed4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103ed7:	68 00 37 11 80       	push   $0x80113700
80103edc:	e8 1f 06 00 00       	call   80104500 <acquire>
  pushcli();
80103ee1:	e8 4a 05 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103ee6:	e8 35 f9 ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103eeb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ef1:	e8 7a 05 00 00       	call   80104470 <popcli>
  myproc()->state = RUNNABLE;
80103ef6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103efd:	e8 de fd ff ff       	call   80103ce0 <sched>
  release(&ptable.lock);
80103f02:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103f09:	e8 b2 06 00 00       	call   801045c0 <release>
}
80103f0e:	83 c4 10             	add    $0x10,%esp
80103f11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f14:	c9                   	leave  
80103f15:	c3                   	ret    
80103f16:	8d 76 00             	lea    0x0(%esi),%esi
80103f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f20 <sleep>:
{
80103f20:	55                   	push   %ebp
80103f21:	89 e5                	mov    %esp,%ebp
80103f23:	57                   	push   %edi
80103f24:	56                   	push   %esi
80103f25:	53                   	push   %ebx
80103f26:	83 ec 0c             	sub    $0xc,%esp
80103f29:	8b 7d 08             	mov    0x8(%ebp),%edi
80103f2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103f2f:	e8 fc 04 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103f34:	e8 e7 f8 ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103f39:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103f3f:	e8 2c 05 00 00       	call   80104470 <popcli>
  if(p == 0)
80103f44:	85 db                	test   %ebx,%ebx
80103f46:	0f 84 87 00 00 00    	je     80103fd3 <sleep+0xb3>
  if(lk == 0)
80103f4c:	85 f6                	test   %esi,%esi
80103f4e:	74 76                	je     80103fc6 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103f50:	81 fe 00 37 11 80    	cmp    $0x80113700,%esi
80103f56:	74 50                	je     80103fa8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103f58:	83 ec 0c             	sub    $0xc,%esp
80103f5b:	68 00 37 11 80       	push   $0x80113700
80103f60:	e8 9b 05 00 00       	call   80104500 <acquire>
    release(lk);
80103f65:	89 34 24             	mov    %esi,(%esp)
80103f68:	e8 53 06 00 00       	call   801045c0 <release>
  p->chan = chan;
80103f6d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f70:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103f77:	e8 64 fd ff ff       	call   80103ce0 <sched>
  p->chan = 0;
80103f7c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103f83:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
80103f8a:	e8 31 06 00 00       	call   801045c0 <release>
    acquire(lk);
80103f8f:	89 75 08             	mov    %esi,0x8(%ebp)
80103f92:	83 c4 10             	add    $0x10,%esp
}
80103f95:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f98:	5b                   	pop    %ebx
80103f99:	5e                   	pop    %esi
80103f9a:	5f                   	pop    %edi
80103f9b:	5d                   	pop    %ebp
    acquire(lk);
80103f9c:	e9 5f 05 00 00       	jmp    80104500 <acquire>
80103fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103fa8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103fab:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103fb2:	e8 29 fd ff ff       	call   80103ce0 <sched>
  p->chan = 0;
80103fb7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103fbe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103fc1:	5b                   	pop    %ebx
80103fc2:	5e                   	pop    %esi
80103fc3:	5f                   	pop    %edi
80103fc4:	5d                   	pop    %ebp
80103fc5:	c3                   	ret    
    panic("sleep without lk");
80103fc6:	83 ec 0c             	sub    $0xc,%esp
80103fc9:	68 cf 78 10 80       	push   $0x801078cf
80103fce:	e8 bd c3 ff ff       	call   80100390 <panic>
    panic("sleep");
80103fd3:	83 ec 0c             	sub    $0xc,%esp
80103fd6:	68 c9 78 10 80       	push   $0x801078c9
80103fdb:	e8 b0 c3 ff ff       	call   80100390 <panic>

80103fe0 <wait>:
{
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	56                   	push   %esi
80103fe4:	53                   	push   %ebx
  pushcli();
80103fe5:	e8 46 04 00 00       	call   80104430 <pushcli>
  c = mycpu();
80103fea:	e8 31 f8 ff ff       	call   80103820 <mycpu>
  p = c->proc;
80103fef:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103ff5:	e8 76 04 00 00       	call   80104470 <popcli>
  acquire(&ptable.lock);
80103ffa:	83 ec 0c             	sub    $0xc,%esp
80103ffd:	68 00 37 11 80       	push   $0x80113700
80104002:	e8 f9 04 00 00       	call   80104500 <acquire>
80104007:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
8010400a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010400c:	bb 34 37 11 80       	mov    $0x80113734,%ebx
80104011:	eb 10                	jmp    80104023 <wait+0x43>
80104013:	90                   	nop
80104014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104018:	83 eb 80             	sub    $0xffffff80,%ebx
8010401b:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
80104021:	73 1b                	jae    8010403e <wait+0x5e>
      if(p->parent != curproc)
80104023:	39 73 14             	cmp    %esi,0x14(%ebx)
80104026:	75 f0                	jne    80104018 <wait+0x38>
      if(p->state == ZOMBIE){
80104028:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010402c:	74 32                	je     80104060 <wait+0x80>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010402e:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
80104031:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104036:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
8010403c:	72 e5                	jb     80104023 <wait+0x43>
    if(!havekids || curproc->killed){
8010403e:	85 c0                	test   %eax,%eax
80104040:	74 74                	je     801040b6 <wait+0xd6>
80104042:	8b 46 24             	mov    0x24(%esi),%eax
80104045:	85 c0                	test   %eax,%eax
80104047:	75 6d                	jne    801040b6 <wait+0xd6>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80104049:	83 ec 08             	sub    $0x8,%esp
8010404c:	68 00 37 11 80       	push   $0x80113700
80104051:	56                   	push   %esi
80104052:	e8 c9 fe ff ff       	call   80103f20 <sleep>
    havekids = 0;
80104057:	83 c4 10             	add    $0x10,%esp
8010405a:	eb ae                	jmp    8010400a <wait+0x2a>
8010405c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        kfree(p->kstack);
80104060:	83 ec 0c             	sub    $0xc,%esp
80104063:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
80104066:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104069:	e8 12 e3 ff ff       	call   80102380 <kfree>
        freevm(p->pgdir);
8010406e:	5a                   	pop    %edx
8010406f:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
80104072:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104079:	e8 62 2d 00 00       	call   80106de0 <freevm>
        release(&ptable.lock);
8010407e:	c7 04 24 00 37 11 80 	movl   $0x80113700,(%esp)
        p->pid = 0;
80104085:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
8010408c:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80104093:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80104097:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
8010409e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
801040a5:	e8 16 05 00 00       	call   801045c0 <release>
        return pid;
801040aa:	83 c4 10             	add    $0x10,%esp
}
801040ad:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040b0:	89 f0                	mov    %esi,%eax
801040b2:	5b                   	pop    %ebx
801040b3:	5e                   	pop    %esi
801040b4:	5d                   	pop    %ebp
801040b5:	c3                   	ret    
      release(&ptable.lock);
801040b6:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801040b9:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
801040be:	68 00 37 11 80       	push   $0x80113700
801040c3:	e8 f8 04 00 00       	call   801045c0 <release>
      return -1;
801040c8:	83 c4 10             	add    $0x10,%esp
801040cb:	eb e0                	jmp    801040ad <wait+0xcd>
801040cd:	8d 76 00             	lea    0x0(%esi),%esi

801040d0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	53                   	push   %ebx
801040d4:	83 ec 10             	sub    $0x10,%esp
801040d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
801040da:	68 00 37 11 80       	push   $0x80113700
801040df:	e8 1c 04 00 00       	call   80104500 <acquire>
801040e4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040e7:	b8 34 37 11 80       	mov    $0x80113734,%eax
801040ec:	eb 0c                	jmp    801040fa <wakeup+0x2a>
801040ee:	66 90                	xchg   %ax,%ax
801040f0:	83 e8 80             	sub    $0xffffff80,%eax
801040f3:	3d 34 57 11 80       	cmp    $0x80115734,%eax
801040f8:	73 1c                	jae    80104116 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
801040fa:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040fe:	75 f0                	jne    801040f0 <wakeup+0x20>
80104100:	3b 58 20             	cmp    0x20(%eax),%ebx
80104103:	75 eb                	jne    801040f0 <wakeup+0x20>
      p->state = RUNNABLE;
80104105:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010410c:	83 e8 80             	sub    $0xffffff80,%eax
8010410f:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80104114:	72 e4                	jb     801040fa <wakeup+0x2a>
  wakeup1(chan);
  release(&ptable.lock);
80104116:	c7 45 08 00 37 11 80 	movl   $0x80113700,0x8(%ebp)
}
8010411d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104120:	c9                   	leave  
  release(&ptable.lock);
80104121:	e9 9a 04 00 00       	jmp    801045c0 <release>
80104126:	8d 76 00             	lea    0x0(%esi),%esi
80104129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104130 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	53                   	push   %ebx
80104134:	83 ec 10             	sub    $0x10,%esp
80104137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010413a:	68 00 37 11 80       	push   $0x80113700
8010413f:	e8 bc 03 00 00       	call   80104500 <acquire>
80104144:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104147:	b8 34 37 11 80       	mov    $0x80113734,%eax
8010414c:	eb 0c                	jmp    8010415a <kill+0x2a>
8010414e:	66 90                	xchg   %ax,%ax
80104150:	83 e8 80             	sub    $0xffffff80,%eax
80104153:	3d 34 57 11 80       	cmp    $0x80115734,%eax
80104158:	73 36                	jae    80104190 <kill+0x60>
    if(p->pid == pid){
8010415a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010415d:	75 f1                	jne    80104150 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010415f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104163:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010416a:	75 07                	jne    80104173 <kill+0x43>
        p->state = RUNNABLE;
8010416c:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104173:	83 ec 0c             	sub    $0xc,%esp
80104176:	68 00 37 11 80       	push   $0x80113700
8010417b:	e8 40 04 00 00       	call   801045c0 <release>
      return 0;
80104180:	83 c4 10             	add    $0x10,%esp
80104183:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104185:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104188:	c9                   	leave  
80104189:	c3                   	ret    
8010418a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80104190:	83 ec 0c             	sub    $0xc,%esp
80104193:	68 00 37 11 80       	push   $0x80113700
80104198:	e8 23 04 00 00       	call   801045c0 <release>
  return -1;
8010419d:	83 c4 10             	add    $0x10,%esp
801041a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801041a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041a8:	c9                   	leave  
801041a9:	c3                   	ret    
801041aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801041b0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
801041b0:	55                   	push   %ebp
801041b1:	89 e5                	mov    %esp,%ebp
801041b3:	57                   	push   %edi
801041b4:	56                   	push   %esi
801041b5:	53                   	push   %ebx
801041b6:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801041b9:	bb 34 37 11 80       	mov    $0x80113734,%ebx
{
801041be:	83 ec 3c             	sub    $0x3c,%esp
801041c1:	eb 24                	jmp    801041e7 <procdump+0x37>
801041c3:	90                   	nop
801041c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    // cprintf(" %d", p->tickets);
    // cprintf(" %d", winning_ticket);
    // cprintf(" %d", total_tickets);
    cprintf("\n");
801041c8:	83 ec 0c             	sub    $0xc,%esp
801041cb:	68 63 7c 10 80       	push   $0x80107c63
801041d0:	e8 8b c4 ff ff       	call   80100660 <cprintf>
801041d5:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801041d8:	83 eb 80             	sub    $0xffffff80,%ebx
801041db:	81 fb 34 57 11 80    	cmp    $0x80115734,%ebx
801041e1:	0f 83 99 00 00 00    	jae    80104280 <procdump+0xd0>
    if(p->state == UNUSED)
801041e7:	8b 43 0c             	mov    0xc(%ebx),%eax
801041ea:	85 c0                	test   %eax,%eax
801041ec:	74 ea                	je     801041d8 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041ee:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
801041f1:	ba e0 78 10 80       	mov    $0x801078e0,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041f6:	77 11                	ja     80104209 <procdump+0x59>
801041f8:	8b 14 85 44 79 10 80 	mov    -0x7fef86bc(,%eax,4),%edx
      state = "???";
801041ff:	b8 e0 78 10 80       	mov    $0x801078e0,%eax
80104204:	85 d2                	test   %edx,%edx
80104206:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %sc%d", p->pid, state, p->name, p->tickets);
80104209:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010420c:	83 ec 0c             	sub    $0xc,%esp
8010420f:	ff 73 7c             	pushl  0x7c(%ebx)
80104212:	50                   	push   %eax
80104213:	52                   	push   %edx
80104214:	ff 73 10             	pushl  0x10(%ebx)
80104217:	68 e4 78 10 80       	push   $0x801078e4
8010421c:	e8 3f c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104221:	83 c4 20             	add    $0x20,%esp
80104224:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80104228:	75 9e                	jne    801041c8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
8010422a:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010422d:	83 ec 08             	sub    $0x8,%esp
80104230:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104233:	50                   	push   %eax
80104234:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104237:	8b 40 0c             	mov    0xc(%eax),%eax
8010423a:	83 c0 08             	add    $0x8,%eax
8010423d:	50                   	push   %eax
8010423e:	e8 9d 01 00 00       	call   801043e0 <getcallerpcs>
80104243:	83 c4 10             	add    $0x10,%esp
80104246:	8d 76 00             	lea    0x0(%esi),%esi
80104249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      for(i=0; i<10 && pc[i] != 0; i++)
80104250:	8b 17                	mov    (%edi),%edx
80104252:	85 d2                	test   %edx,%edx
80104254:	0f 84 6e ff ff ff    	je     801041c8 <procdump+0x18>
        cprintf(" %p", pc[i]);
8010425a:	83 ec 08             	sub    $0x8,%esp
8010425d:	83 c7 04             	add    $0x4,%edi
80104260:	52                   	push   %edx
80104261:	68 21 73 10 80       	push   $0x80107321
80104266:	e8 f5 c3 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
8010426b:	83 c4 10             	add    $0x10,%esp
8010426e:	39 fe                	cmp    %edi,%esi
80104270:	75 de                	jne    80104250 <procdump+0xa0>
80104272:	e9 51 ff ff ff       	jmp    801041c8 <procdump+0x18>
80104277:	89 f6                	mov    %esi,%esi
80104279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
}
80104280:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104283:	5b                   	pop    %ebx
80104284:	5e                   	pop    %esi
80104285:	5f                   	pop    %edi
80104286:	5d                   	pop    %ebp
80104287:	c3                   	ret    
80104288:	66 90                	xchg   %ax,%ax
8010428a:	66 90                	xchg   %ax,%ax
8010428c:	66 90                	xchg   %ax,%ax
8010428e:	66 90                	xchg   %ax,%ax

80104290 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104290:	55                   	push   %ebp
80104291:	89 e5                	mov    %esp,%ebp
80104293:	53                   	push   %ebx
80104294:	83 ec 0c             	sub    $0xc,%esp
80104297:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010429a:	68 5c 79 10 80       	push   $0x8010795c
8010429f:	8d 43 04             	lea    0x4(%ebx),%eax
801042a2:	50                   	push   %eax
801042a3:	e8 18 01 00 00       	call   801043c0 <initlock>
  lk->name = name;
801042a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801042ab:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801042b1:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
801042b4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
801042bb:	89 43 38             	mov    %eax,0x38(%ebx)
}
801042be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042c1:	c9                   	leave  
801042c2:	c3                   	ret    
801042c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042d0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801042d0:	55                   	push   %ebp
801042d1:	89 e5                	mov    %esp,%ebp
801042d3:	56                   	push   %esi
801042d4:	53                   	push   %ebx
801042d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801042d8:	83 ec 0c             	sub    $0xc,%esp
801042db:	8d 73 04             	lea    0x4(%ebx),%esi
801042de:	56                   	push   %esi
801042df:	e8 1c 02 00 00       	call   80104500 <acquire>
  while (lk->locked) {
801042e4:	8b 13                	mov    (%ebx),%edx
801042e6:	83 c4 10             	add    $0x10,%esp
801042e9:	85 d2                	test   %edx,%edx
801042eb:	74 16                	je     80104303 <acquiresleep+0x33>
801042ed:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801042f0:	83 ec 08             	sub    $0x8,%esp
801042f3:	56                   	push   %esi
801042f4:	53                   	push   %ebx
801042f5:	e8 26 fc ff ff       	call   80103f20 <sleep>
  while (lk->locked) {
801042fa:	8b 03                	mov    (%ebx),%eax
801042fc:	83 c4 10             	add    $0x10,%esp
801042ff:	85 c0                	test   %eax,%eax
80104301:	75 ed                	jne    801042f0 <acquiresleep+0x20>
  }
  lk->locked = 1;
80104303:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104309:	e8 b2 f5 ff ff       	call   801038c0 <myproc>
8010430e:	8b 40 10             	mov    0x10(%eax),%eax
80104311:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104314:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104317:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010431a:	5b                   	pop    %ebx
8010431b:	5e                   	pop    %esi
8010431c:	5d                   	pop    %ebp
  release(&lk->lk);
8010431d:	e9 9e 02 00 00       	jmp    801045c0 <release>
80104322:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104330 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104330:	55                   	push   %ebp
80104331:	89 e5                	mov    %esp,%ebp
80104333:	56                   	push   %esi
80104334:	53                   	push   %ebx
80104335:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104338:	83 ec 0c             	sub    $0xc,%esp
8010433b:	8d 73 04             	lea    0x4(%ebx),%esi
8010433e:	56                   	push   %esi
8010433f:	e8 bc 01 00 00       	call   80104500 <acquire>
  lk->locked = 0;
80104344:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010434a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104351:	89 1c 24             	mov    %ebx,(%esp)
80104354:	e8 77 fd ff ff       	call   801040d0 <wakeup>
  release(&lk->lk);
80104359:	89 75 08             	mov    %esi,0x8(%ebp)
8010435c:	83 c4 10             	add    $0x10,%esp
}
8010435f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104362:	5b                   	pop    %ebx
80104363:	5e                   	pop    %esi
80104364:	5d                   	pop    %ebp
  release(&lk->lk);
80104365:	e9 56 02 00 00       	jmp    801045c0 <release>
8010436a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104370 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	57                   	push   %edi
80104374:	56                   	push   %esi
80104375:	53                   	push   %ebx
80104376:	31 ff                	xor    %edi,%edi
80104378:	83 ec 18             	sub    $0x18,%esp
8010437b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010437e:	8d 73 04             	lea    0x4(%ebx),%esi
80104381:	56                   	push   %esi
80104382:	e8 79 01 00 00       	call   80104500 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104387:	8b 03                	mov    (%ebx),%eax
80104389:	83 c4 10             	add    $0x10,%esp
8010438c:	85 c0                	test   %eax,%eax
8010438e:	74 13                	je     801043a3 <holdingsleep+0x33>
80104390:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104393:	e8 28 f5 ff ff       	call   801038c0 <myproc>
80104398:	39 58 10             	cmp    %ebx,0x10(%eax)
8010439b:	0f 94 c0             	sete   %al
8010439e:	0f b6 c0             	movzbl %al,%eax
801043a1:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
801043a3:	83 ec 0c             	sub    $0xc,%esp
801043a6:	56                   	push   %esi
801043a7:	e8 14 02 00 00       	call   801045c0 <release>
  return r;
}
801043ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801043af:	89 f8                	mov    %edi,%eax
801043b1:	5b                   	pop    %ebx
801043b2:	5e                   	pop    %esi
801043b3:	5f                   	pop    %edi
801043b4:	5d                   	pop    %ebp
801043b5:	c3                   	ret    
801043b6:	66 90                	xchg   %ax,%ax
801043b8:	66 90                	xchg   %ax,%ax
801043ba:	66 90                	xchg   %ax,%ax
801043bc:	66 90                	xchg   %ax,%ax
801043be:	66 90                	xchg   %ax,%ax

801043c0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801043c0:	55                   	push   %ebp
801043c1:	89 e5                	mov    %esp,%ebp
801043c3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801043c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801043c9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
801043cf:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
801043d2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801043d9:	5d                   	pop    %ebp
801043da:	c3                   	ret    
801043db:	90                   	nop
801043dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043e0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801043e0:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801043e1:	31 d2                	xor    %edx,%edx
{
801043e3:	89 e5                	mov    %esp,%ebp
801043e5:	53                   	push   %ebx
  ebp = (uint*)v - 2;
801043e6:	8b 45 08             	mov    0x8(%ebp),%eax
{
801043e9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
801043ec:	83 e8 08             	sub    $0x8,%eax
801043ef:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801043f0:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801043f6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801043fc:	77 1a                	ja     80104418 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801043fe:	8b 58 04             	mov    0x4(%eax),%ebx
80104401:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
80104404:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
80104407:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104409:	83 fa 0a             	cmp    $0xa,%edx
8010440c:	75 e2                	jne    801043f0 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010440e:	5b                   	pop    %ebx
8010440f:	5d                   	pop    %ebp
80104410:	c3                   	ret    
80104411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104418:	8d 04 91             	lea    (%ecx,%edx,4),%eax
8010441b:	83 c1 28             	add    $0x28,%ecx
8010441e:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
80104420:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104426:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104429:	39 c1                	cmp    %eax,%ecx
8010442b:	75 f3                	jne    80104420 <getcallerpcs+0x40>
}
8010442d:	5b                   	pop    %ebx
8010442e:	5d                   	pop    %ebp
8010442f:	c3                   	ret    

80104430 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104430:	55                   	push   %ebp
80104431:	89 e5                	mov    %esp,%ebp
80104433:	53                   	push   %ebx
80104434:	83 ec 04             	sub    $0x4,%esp
80104437:	9c                   	pushf  
80104438:	5b                   	pop    %ebx
  asm volatile("cli");
80104439:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010443a:	e8 e1 f3 ff ff       	call   80103820 <mycpu>
8010443f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104445:	85 c0                	test   %eax,%eax
80104447:	75 11                	jne    8010445a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104449:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010444f:	e8 cc f3 ff ff       	call   80103820 <mycpu>
80104454:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010445a:	e8 c1 f3 ff ff       	call   80103820 <mycpu>
8010445f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104466:	83 c4 04             	add    $0x4,%esp
80104469:	5b                   	pop    %ebx
8010446a:	5d                   	pop    %ebp
8010446b:	c3                   	ret    
8010446c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104470 <popcli>:

void
popcli(void)
{
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104476:	9c                   	pushf  
80104477:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104478:	f6 c4 02             	test   $0x2,%ah
8010447b:	75 35                	jne    801044b2 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010447d:	e8 9e f3 ff ff       	call   80103820 <mycpu>
80104482:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104489:	78 34                	js     801044bf <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010448b:	e8 90 f3 ff ff       	call   80103820 <mycpu>
80104490:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104496:	85 d2                	test   %edx,%edx
80104498:	74 06                	je     801044a0 <popcli+0x30>
    sti();
}
8010449a:	c9                   	leave  
8010449b:	c3                   	ret    
8010449c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
801044a0:	e8 7b f3 ff ff       	call   80103820 <mycpu>
801044a5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801044ab:	85 c0                	test   %eax,%eax
801044ad:	74 eb                	je     8010449a <popcli+0x2a>
  asm volatile("sti");
801044af:	fb                   	sti    
}
801044b0:	c9                   	leave  
801044b1:	c3                   	ret    
    panic("popcli - interruptible");
801044b2:	83 ec 0c             	sub    $0xc,%esp
801044b5:	68 67 79 10 80       	push   $0x80107967
801044ba:	e8 d1 be ff ff       	call   80100390 <panic>
    panic("popcli");
801044bf:	83 ec 0c             	sub    $0xc,%esp
801044c2:	68 7e 79 10 80       	push   $0x8010797e
801044c7:	e8 c4 be ff ff       	call   80100390 <panic>
801044cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044d0 <holding>:
{
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	56                   	push   %esi
801044d4:	53                   	push   %ebx
801044d5:	8b 75 08             	mov    0x8(%ebp),%esi
801044d8:	31 db                	xor    %ebx,%ebx
  pushcli();
801044da:	e8 51 ff ff ff       	call   80104430 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801044df:	8b 06                	mov    (%esi),%eax
801044e1:	85 c0                	test   %eax,%eax
801044e3:	74 10                	je     801044f5 <holding+0x25>
801044e5:	8b 5e 08             	mov    0x8(%esi),%ebx
801044e8:	e8 33 f3 ff ff       	call   80103820 <mycpu>
801044ed:	39 c3                	cmp    %eax,%ebx
801044ef:	0f 94 c3             	sete   %bl
801044f2:	0f b6 db             	movzbl %bl,%ebx
  popcli();
801044f5:	e8 76 ff ff ff       	call   80104470 <popcli>
}
801044fa:	89 d8                	mov    %ebx,%eax
801044fc:	5b                   	pop    %ebx
801044fd:	5e                   	pop    %esi
801044fe:	5d                   	pop    %ebp
801044ff:	c3                   	ret    

80104500 <acquire>:
{
80104500:	55                   	push   %ebp
80104501:	89 e5                	mov    %esp,%ebp
80104503:	56                   	push   %esi
80104504:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
80104505:	e8 26 ff ff ff       	call   80104430 <pushcli>
  if(holding(lk))
8010450a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010450d:	83 ec 0c             	sub    $0xc,%esp
80104510:	53                   	push   %ebx
80104511:	e8 ba ff ff ff       	call   801044d0 <holding>
80104516:	83 c4 10             	add    $0x10,%esp
80104519:	85 c0                	test   %eax,%eax
8010451b:	0f 85 83 00 00 00    	jne    801045a4 <acquire+0xa4>
80104521:	89 c6                	mov    %eax,%esi
  asm volatile("lock; xchgl %0, %1" :
80104523:	ba 01 00 00 00       	mov    $0x1,%edx
80104528:	eb 09                	jmp    80104533 <acquire+0x33>
8010452a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104530:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104533:	89 d0                	mov    %edx,%eax
80104535:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
80104538:	85 c0                	test   %eax,%eax
8010453a:	75 f4                	jne    80104530 <acquire+0x30>
  __sync_synchronize();
8010453c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104541:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104544:	e8 d7 f2 ff ff       	call   80103820 <mycpu>
  getcallerpcs(&lk, lk->pcs);
80104549:	8d 53 0c             	lea    0xc(%ebx),%edx
  lk->cpu = mycpu();
8010454c:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
8010454f:	89 e8                	mov    %ebp,%eax
80104551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104558:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
8010455e:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
80104564:	77 1a                	ja     80104580 <acquire+0x80>
    pcs[i] = ebp[1];     // saved %eip
80104566:	8b 48 04             	mov    0x4(%eax),%ecx
80104569:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
  for(i = 0; i < 10; i++){
8010456c:	83 c6 01             	add    $0x1,%esi
    ebp = (uint*)ebp[0]; // saved %ebp
8010456f:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104571:	83 fe 0a             	cmp    $0xa,%esi
80104574:	75 e2                	jne    80104558 <acquire+0x58>
}
80104576:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104579:	5b                   	pop    %ebx
8010457a:	5e                   	pop    %esi
8010457b:	5d                   	pop    %ebp
8010457c:	c3                   	ret    
8010457d:	8d 76 00             	lea    0x0(%esi),%esi
80104580:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104583:	83 c2 28             	add    $0x28,%edx
80104586:	8d 76 00             	lea    0x0(%esi),%esi
80104589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    pcs[i] = 0;
80104590:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104596:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104599:	39 d0                	cmp    %edx,%eax
8010459b:	75 f3                	jne    80104590 <acquire+0x90>
}
8010459d:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045a0:	5b                   	pop    %ebx
801045a1:	5e                   	pop    %esi
801045a2:	5d                   	pop    %ebp
801045a3:	c3                   	ret    
    panic("acquire");
801045a4:	83 ec 0c             	sub    $0xc,%esp
801045a7:	68 85 79 10 80       	push   $0x80107985
801045ac:	e8 df bd ff ff       	call   80100390 <panic>
801045b1:	eb 0d                	jmp    801045c0 <release>
801045b3:	90                   	nop
801045b4:	90                   	nop
801045b5:	90                   	nop
801045b6:	90                   	nop
801045b7:	90                   	nop
801045b8:	90                   	nop
801045b9:	90                   	nop
801045ba:	90                   	nop
801045bb:	90                   	nop
801045bc:	90                   	nop
801045bd:	90                   	nop
801045be:	90                   	nop
801045bf:	90                   	nop

801045c0 <release>:
{
801045c0:	55                   	push   %ebp
801045c1:	89 e5                	mov    %esp,%ebp
801045c3:	53                   	push   %ebx
801045c4:	83 ec 10             	sub    $0x10,%esp
801045c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
801045ca:	53                   	push   %ebx
801045cb:	e8 00 ff ff ff       	call   801044d0 <holding>
801045d0:	83 c4 10             	add    $0x10,%esp
801045d3:	85 c0                	test   %eax,%eax
801045d5:	74 22                	je     801045f9 <release+0x39>
  lk->pcs[0] = 0;
801045d7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801045de:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
801045e5:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801045ea:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801045f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045f3:	c9                   	leave  
  popcli();
801045f4:	e9 77 fe ff ff       	jmp    80104470 <popcli>
    panic("release");
801045f9:	83 ec 0c             	sub    $0xc,%esp
801045fc:	68 8d 79 10 80       	push   $0x8010798d
80104601:	e8 8a bd ff ff       	call   80100390 <panic>
80104606:	66 90                	xchg   %ax,%ax
80104608:	66 90                	xchg   %ax,%ax
8010460a:	66 90                	xchg   %ax,%ax
8010460c:	66 90                	xchg   %ax,%ax
8010460e:	66 90                	xchg   %ax,%ax

80104610 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	57                   	push   %edi
80104614:	53                   	push   %ebx
80104615:	8b 55 08             	mov    0x8(%ebp),%edx
80104618:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
8010461b:	f6 c2 03             	test   $0x3,%dl
8010461e:	75 05                	jne    80104625 <memset+0x15>
80104620:	f6 c1 03             	test   $0x3,%cl
80104623:	74 13                	je     80104638 <memset+0x28>
  asm volatile("cld; rep stosb" :
80104625:	89 d7                	mov    %edx,%edi
80104627:	8b 45 0c             	mov    0xc(%ebp),%eax
8010462a:	fc                   	cld    
8010462b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010462d:	5b                   	pop    %ebx
8010462e:	89 d0                	mov    %edx,%eax
80104630:	5f                   	pop    %edi
80104631:	5d                   	pop    %ebp
80104632:	c3                   	ret    
80104633:	90                   	nop
80104634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
80104638:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010463c:	c1 e9 02             	shr    $0x2,%ecx
8010463f:	89 f8                	mov    %edi,%eax
80104641:	89 fb                	mov    %edi,%ebx
80104643:	c1 e0 18             	shl    $0x18,%eax
80104646:	c1 e3 10             	shl    $0x10,%ebx
80104649:	09 d8                	or     %ebx,%eax
8010464b:	09 f8                	or     %edi,%eax
8010464d:	c1 e7 08             	shl    $0x8,%edi
80104650:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80104652:	89 d7                	mov    %edx,%edi
80104654:	fc                   	cld    
80104655:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104657:	5b                   	pop    %ebx
80104658:	89 d0                	mov    %edx,%eax
8010465a:	5f                   	pop    %edi
8010465b:	5d                   	pop    %ebp
8010465c:	c3                   	ret    
8010465d:	8d 76 00             	lea    0x0(%esi),%esi

80104660 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104660:	55                   	push   %ebp
80104661:	89 e5                	mov    %esp,%ebp
80104663:	57                   	push   %edi
80104664:	56                   	push   %esi
80104665:	53                   	push   %ebx
80104666:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104669:	8b 75 08             	mov    0x8(%ebp),%esi
8010466c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010466f:	85 db                	test   %ebx,%ebx
80104671:	74 29                	je     8010469c <memcmp+0x3c>
    if(*s1 != *s2)
80104673:	0f b6 16             	movzbl (%esi),%edx
80104676:	0f b6 0f             	movzbl (%edi),%ecx
80104679:	38 d1                	cmp    %dl,%cl
8010467b:	75 2b                	jne    801046a8 <memcmp+0x48>
8010467d:	b8 01 00 00 00       	mov    $0x1,%eax
80104682:	eb 14                	jmp    80104698 <memcmp+0x38>
80104684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104688:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010468c:	83 c0 01             	add    $0x1,%eax
8010468f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104694:	38 ca                	cmp    %cl,%dl
80104696:	75 10                	jne    801046a8 <memcmp+0x48>
  while(n-- > 0){
80104698:	39 d8                	cmp    %ebx,%eax
8010469a:	75 ec                	jne    80104688 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010469c:	5b                   	pop    %ebx
  return 0;
8010469d:	31 c0                	xor    %eax,%eax
}
8010469f:	5e                   	pop    %esi
801046a0:	5f                   	pop    %edi
801046a1:	5d                   	pop    %ebp
801046a2:	c3                   	ret    
801046a3:	90                   	nop
801046a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
801046a8:	0f b6 c2             	movzbl %dl,%eax
}
801046ab:	5b                   	pop    %ebx
      return *s1 - *s2;
801046ac:	29 c8                	sub    %ecx,%eax
}
801046ae:	5e                   	pop    %esi
801046af:	5f                   	pop    %edi
801046b0:	5d                   	pop    %ebp
801046b1:	c3                   	ret    
801046b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046c0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp
801046c3:	56                   	push   %esi
801046c4:	53                   	push   %ebx
801046c5:	8b 45 08             	mov    0x8(%ebp),%eax
801046c8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801046cb:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801046ce:	39 c3                	cmp    %eax,%ebx
801046d0:	73 26                	jae    801046f8 <memmove+0x38>
801046d2:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
801046d5:	39 c8                	cmp    %ecx,%eax
801046d7:	73 1f                	jae    801046f8 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
801046d9:	85 f6                	test   %esi,%esi
801046db:	8d 56 ff             	lea    -0x1(%esi),%edx
801046de:	74 0f                	je     801046ef <memmove+0x2f>
      *--d = *--s;
801046e0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801046e4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
801046e7:	83 ea 01             	sub    $0x1,%edx
801046ea:	83 fa ff             	cmp    $0xffffffff,%edx
801046ed:	75 f1                	jne    801046e0 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801046ef:	5b                   	pop    %ebx
801046f0:	5e                   	pop    %esi
801046f1:	5d                   	pop    %ebp
801046f2:	c3                   	ret    
801046f3:	90                   	nop
801046f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
801046f8:	31 d2                	xor    %edx,%edx
801046fa:	85 f6                	test   %esi,%esi
801046fc:	74 f1                	je     801046ef <memmove+0x2f>
801046fe:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104700:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104704:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104707:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
8010470a:	39 d6                	cmp    %edx,%esi
8010470c:	75 f2                	jne    80104700 <memmove+0x40>
}
8010470e:	5b                   	pop    %ebx
8010470f:	5e                   	pop    %esi
80104710:	5d                   	pop    %ebp
80104711:	c3                   	ret    
80104712:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104720 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104723:	5d                   	pop    %ebp
  return memmove(dst, src, n);
80104724:	eb 9a                	jmp    801046c0 <memmove>
80104726:	8d 76 00             	lea    0x0(%esi),%esi
80104729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104730 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80104730:	55                   	push   %ebp
80104731:	89 e5                	mov    %esp,%ebp
80104733:	57                   	push   %edi
80104734:	56                   	push   %esi
80104735:	8b 7d 10             	mov    0x10(%ebp),%edi
80104738:	53                   	push   %ebx
80104739:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010473c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010473f:	85 ff                	test   %edi,%edi
80104741:	74 2f                	je     80104772 <strncmp+0x42>
80104743:	0f b6 01             	movzbl (%ecx),%eax
80104746:	0f b6 1e             	movzbl (%esi),%ebx
80104749:	84 c0                	test   %al,%al
8010474b:	74 37                	je     80104784 <strncmp+0x54>
8010474d:	38 c3                	cmp    %al,%bl
8010474f:	75 33                	jne    80104784 <strncmp+0x54>
80104751:	01 f7                	add    %esi,%edi
80104753:	eb 13                	jmp    80104768 <strncmp+0x38>
80104755:	8d 76 00             	lea    0x0(%esi),%esi
80104758:	0f b6 01             	movzbl (%ecx),%eax
8010475b:	84 c0                	test   %al,%al
8010475d:	74 21                	je     80104780 <strncmp+0x50>
8010475f:	0f b6 1a             	movzbl (%edx),%ebx
80104762:	89 d6                	mov    %edx,%esi
80104764:	38 d8                	cmp    %bl,%al
80104766:	75 1c                	jne    80104784 <strncmp+0x54>
    n--, p++, q++;
80104768:	8d 56 01             	lea    0x1(%esi),%edx
8010476b:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
8010476e:	39 fa                	cmp    %edi,%edx
80104770:	75 e6                	jne    80104758 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104772:	5b                   	pop    %ebx
    return 0;
80104773:	31 c0                	xor    %eax,%eax
}
80104775:	5e                   	pop    %esi
80104776:	5f                   	pop    %edi
80104777:	5d                   	pop    %ebp
80104778:	c3                   	ret    
80104779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104780:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104784:	29 d8                	sub    %ebx,%eax
}
80104786:	5b                   	pop    %ebx
80104787:	5e                   	pop    %esi
80104788:	5f                   	pop    %edi
80104789:	5d                   	pop    %ebp
8010478a:	c3                   	ret    
8010478b:	90                   	nop
8010478c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104790 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104790:	55                   	push   %ebp
80104791:	89 e5                	mov    %esp,%ebp
80104793:	56                   	push   %esi
80104794:	53                   	push   %ebx
80104795:	8b 45 08             	mov    0x8(%ebp),%eax
80104798:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010479b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010479e:	89 c2                	mov    %eax,%edx
801047a0:	eb 19                	jmp    801047bb <strncpy+0x2b>
801047a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047a8:	83 c3 01             	add    $0x1,%ebx
801047ab:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801047af:	83 c2 01             	add    $0x1,%edx
801047b2:	84 c9                	test   %cl,%cl
801047b4:	88 4a ff             	mov    %cl,-0x1(%edx)
801047b7:	74 09                	je     801047c2 <strncpy+0x32>
801047b9:	89 f1                	mov    %esi,%ecx
801047bb:	85 c9                	test   %ecx,%ecx
801047bd:	8d 71 ff             	lea    -0x1(%ecx),%esi
801047c0:	7f e6                	jg     801047a8 <strncpy+0x18>
    ;
  while(n-- > 0)
801047c2:	31 c9                	xor    %ecx,%ecx
801047c4:	85 f6                	test   %esi,%esi
801047c6:	7e 17                	jle    801047df <strncpy+0x4f>
801047c8:	90                   	nop
801047c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
801047d0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801047d4:	89 f3                	mov    %esi,%ebx
801047d6:	83 c1 01             	add    $0x1,%ecx
801047d9:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
801047db:	85 db                	test   %ebx,%ebx
801047dd:	7f f1                	jg     801047d0 <strncpy+0x40>
  return os;
}
801047df:	5b                   	pop    %ebx
801047e0:	5e                   	pop    %esi
801047e1:	5d                   	pop    %ebp
801047e2:	c3                   	ret    
801047e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047f0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
801047f0:	55                   	push   %ebp
801047f1:	89 e5                	mov    %esp,%ebp
801047f3:	56                   	push   %esi
801047f4:	53                   	push   %ebx
801047f5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801047f8:	8b 45 08             	mov    0x8(%ebp),%eax
801047fb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
801047fe:	85 c9                	test   %ecx,%ecx
80104800:	7e 26                	jle    80104828 <safestrcpy+0x38>
80104802:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104806:	89 c1                	mov    %eax,%ecx
80104808:	eb 17                	jmp    80104821 <safestrcpy+0x31>
8010480a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104810:	83 c2 01             	add    $0x1,%edx
80104813:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104817:	83 c1 01             	add    $0x1,%ecx
8010481a:	84 db                	test   %bl,%bl
8010481c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010481f:	74 04                	je     80104825 <safestrcpy+0x35>
80104821:	39 f2                	cmp    %esi,%edx
80104823:	75 eb                	jne    80104810 <safestrcpy+0x20>
    ;
  *s = 0;
80104825:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104828:	5b                   	pop    %ebx
80104829:	5e                   	pop    %esi
8010482a:	5d                   	pop    %ebp
8010482b:	c3                   	ret    
8010482c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104830 <strlen>:

int
strlen(const char *s)
{
80104830:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104831:	31 c0                	xor    %eax,%eax
{
80104833:	89 e5                	mov    %esp,%ebp
80104835:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104838:	80 3a 00             	cmpb   $0x0,(%edx)
8010483b:	74 0c                	je     80104849 <strlen+0x19>
8010483d:	8d 76 00             	lea    0x0(%esi),%esi
80104840:	83 c0 01             	add    $0x1,%eax
80104843:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104847:	75 f7                	jne    80104840 <strlen+0x10>
    ;
  return n;
}
80104849:	5d                   	pop    %ebp
8010484a:	c3                   	ret    

8010484b <swtch>:
8010484b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010484f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104853:	55                   	push   %ebp
80104854:	53                   	push   %ebx
80104855:	56                   	push   %esi
80104856:	57                   	push   %edi
80104857:	89 20                	mov    %esp,(%eax)
80104859:	89 d4                	mov    %edx,%esp
8010485b:	5f                   	pop    %edi
8010485c:	5e                   	pop    %esi
8010485d:	5b                   	pop    %ebx
8010485e:	5d                   	pop    %ebp
8010485f:	c3                   	ret    

80104860 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104860:	55                   	push   %ebp
80104861:	89 e5                	mov    %esp,%ebp
80104863:	53                   	push   %ebx
80104864:	83 ec 04             	sub    $0x4,%esp
80104867:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010486a:	e8 51 f0 ff ff       	call   801038c0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010486f:	8b 00                	mov    (%eax),%eax
80104871:	39 d8                	cmp    %ebx,%eax
80104873:	76 1b                	jbe    80104890 <fetchint+0x30>
80104875:	8d 53 04             	lea    0x4(%ebx),%edx
80104878:	39 d0                	cmp    %edx,%eax
8010487a:	72 14                	jb     80104890 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010487c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010487f:	8b 13                	mov    (%ebx),%edx
80104881:	89 10                	mov    %edx,(%eax)
  return 0;
80104883:	31 c0                	xor    %eax,%eax
}
80104885:	83 c4 04             	add    $0x4,%esp
80104888:	5b                   	pop    %ebx
80104889:	5d                   	pop    %ebp
8010488a:	c3                   	ret    
8010488b:	90                   	nop
8010488c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104890:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104895:	eb ee                	jmp    80104885 <fetchint+0x25>
80104897:	89 f6                	mov    %esi,%esi
80104899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048a0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	53                   	push   %ebx
801048a4:	83 ec 04             	sub    $0x4,%esp
801048a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801048aa:	e8 11 f0 ff ff       	call   801038c0 <myproc>

  if(addr >= curproc->sz)
801048af:	39 18                	cmp    %ebx,(%eax)
801048b1:	76 29                	jbe    801048dc <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
801048b3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801048b6:	89 da                	mov    %ebx,%edx
801048b8:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
801048ba:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
801048bc:	39 c3                	cmp    %eax,%ebx
801048be:	73 1c                	jae    801048dc <fetchstr+0x3c>
    if(*s == 0)
801048c0:	80 3b 00             	cmpb   $0x0,(%ebx)
801048c3:	75 10                	jne    801048d5 <fetchstr+0x35>
801048c5:	eb 39                	jmp    80104900 <fetchstr+0x60>
801048c7:	89 f6                	mov    %esi,%esi
801048c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801048d0:	80 3a 00             	cmpb   $0x0,(%edx)
801048d3:	74 1b                	je     801048f0 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
801048d5:	83 c2 01             	add    $0x1,%edx
801048d8:	39 d0                	cmp    %edx,%eax
801048da:	77 f4                	ja     801048d0 <fetchstr+0x30>
    return -1;
801048dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
801048e1:	83 c4 04             	add    $0x4,%esp
801048e4:	5b                   	pop    %ebx
801048e5:	5d                   	pop    %ebp
801048e6:	c3                   	ret    
801048e7:	89 f6                	mov    %esi,%esi
801048e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801048f0:	83 c4 04             	add    $0x4,%esp
801048f3:	89 d0                	mov    %edx,%eax
801048f5:	29 d8                	sub    %ebx,%eax
801048f7:	5b                   	pop    %ebx
801048f8:	5d                   	pop    %ebp
801048f9:	c3                   	ret    
801048fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s == 0)
80104900:	31 c0                	xor    %eax,%eax
      return s - *pp;
80104902:	eb dd                	jmp    801048e1 <fetchstr+0x41>
80104904:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010490a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104910 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	56                   	push   %esi
80104914:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104915:	e8 a6 ef ff ff       	call   801038c0 <myproc>
8010491a:	8b 40 18             	mov    0x18(%eax),%eax
8010491d:	8b 55 08             	mov    0x8(%ebp),%edx
80104920:	8b 40 44             	mov    0x44(%eax),%eax
80104923:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104926:	e8 95 ef ff ff       	call   801038c0 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010492b:	8b 00                	mov    (%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010492d:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104930:	39 c6                	cmp    %eax,%esi
80104932:	73 1c                	jae    80104950 <argint+0x40>
80104934:	8d 53 08             	lea    0x8(%ebx),%edx
80104937:	39 d0                	cmp    %edx,%eax
80104939:	72 15                	jb     80104950 <argint+0x40>
  *ip = *(int*)(addr);
8010493b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010493e:	8b 53 04             	mov    0x4(%ebx),%edx
80104941:	89 10                	mov    %edx,(%eax)
  return 0;
80104943:	31 c0                	xor    %eax,%eax
}
80104945:	5b                   	pop    %ebx
80104946:	5e                   	pop    %esi
80104947:	5d                   	pop    %ebp
80104948:	c3                   	ret    
80104949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104950:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104955:	eb ee                	jmp    80104945 <argint+0x35>
80104957:	89 f6                	mov    %esi,%esi
80104959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104960 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104960:	55                   	push   %ebp
80104961:	89 e5                	mov    %esp,%ebp
80104963:	56                   	push   %esi
80104964:	53                   	push   %ebx
80104965:	83 ec 10             	sub    $0x10,%esp
80104968:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010496b:	e8 50 ef ff ff       	call   801038c0 <myproc>
80104970:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104972:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104975:	83 ec 08             	sub    $0x8,%esp
80104978:	50                   	push   %eax
80104979:	ff 75 08             	pushl  0x8(%ebp)
8010497c:	e8 8f ff ff ff       	call   80104910 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104981:	83 c4 10             	add    $0x10,%esp
80104984:	85 c0                	test   %eax,%eax
80104986:	78 28                	js     801049b0 <argptr+0x50>
80104988:	85 db                	test   %ebx,%ebx
8010498a:	78 24                	js     801049b0 <argptr+0x50>
8010498c:	8b 16                	mov    (%esi),%edx
8010498e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104991:	39 c2                	cmp    %eax,%edx
80104993:	76 1b                	jbe    801049b0 <argptr+0x50>
80104995:	01 c3                	add    %eax,%ebx
80104997:	39 da                	cmp    %ebx,%edx
80104999:	72 15                	jb     801049b0 <argptr+0x50>
    return -1;
  *pp = (char*)i;
8010499b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010499e:	89 02                	mov    %eax,(%edx)
  return 0;
801049a0:	31 c0                	xor    %eax,%eax
}
801049a2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801049a5:	5b                   	pop    %ebx
801049a6:	5e                   	pop    %esi
801049a7:	5d                   	pop    %ebp
801049a8:	c3                   	ret    
801049a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801049b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049b5:	eb eb                	jmp    801049a2 <argptr+0x42>
801049b7:	89 f6                	mov    %esi,%esi
801049b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049c0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801049c0:	55                   	push   %ebp
801049c1:	89 e5                	mov    %esp,%ebp
801049c3:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
801049c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049c9:	50                   	push   %eax
801049ca:	ff 75 08             	pushl  0x8(%ebp)
801049cd:	e8 3e ff ff ff       	call   80104910 <argint>
801049d2:	83 c4 10             	add    $0x10,%esp
801049d5:	85 c0                	test   %eax,%eax
801049d7:	78 17                	js     801049f0 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
801049d9:	83 ec 08             	sub    $0x8,%esp
801049dc:	ff 75 0c             	pushl  0xc(%ebp)
801049df:	ff 75 f4             	pushl  -0xc(%ebp)
801049e2:	e8 b9 fe ff ff       	call   801048a0 <fetchstr>
801049e7:	83 c4 10             	add    $0x10,%esp
}
801049ea:	c9                   	leave  
801049eb:	c3                   	ret    
801049ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801049f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801049f5:	c9                   	leave  
801049f6:	c3                   	ret    
801049f7:	89 f6                	mov    %esi,%esi
801049f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a00 <getreadcount>:

int
getreadcount(void){
80104a00:	55                   	push   %ebp
  return counter;
}
80104a01:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
getreadcount(void){
80104a06:	89 e5                	mov    %esp,%ebp
}
80104a08:	5d                   	pop    %ebp
80104a09:	c3                   	ret    
80104a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104a10 <syscall>:
};


void
syscall(void)
{
80104a10:	55                   	push   %ebp
80104a11:	89 e5                	mov    %esp,%ebp
80104a13:	53                   	push   %ebx
80104a14:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104a17:	e8 a4 ee ff ff       	call   801038c0 <myproc>
80104a1c:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104a1e:	8b 40 18             	mov    0x18(%eax),%eax
80104a21:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104a24:	8d 50 ff             	lea    -0x1(%eax),%edx
80104a27:	83 fa 17             	cmp    $0x17,%edx
80104a2a:	77 24                	ja     80104a50 <syscall+0x40>
80104a2c:	8b 14 85 c0 79 10 80 	mov    -0x7fef8640(,%eax,4),%edx
80104a33:	85 d2                	test   %edx,%edx
80104a35:	74 19                	je     80104a50 <syscall+0x40>

    if(num == SYS_read) counter++;
80104a37:	83 f8 05             	cmp    $0x5,%eax
80104a3a:	75 07                	jne    80104a43 <syscall+0x33>
80104a3c:	83 05 bc a5 10 80 01 	addl   $0x1,0x8010a5bc
    
    curproc->tf->eax = syscalls[num]();
80104a43:	ff d2                	call   *%edx
80104a45:	8b 53 18             	mov    0x18(%ebx),%edx
80104a48:	89 42 1c             	mov    %eax,0x1c(%edx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104a4b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a4e:	c9                   	leave  
80104a4f:	c3                   	ret    
    cprintf("%d %s: unknown sys call %d\n",
80104a50:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104a51:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104a54:	50                   	push   %eax
80104a55:	ff 73 10             	pushl  0x10(%ebx)
80104a58:	68 95 79 10 80       	push   $0x80107995
80104a5d:	e8 fe bb ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
80104a62:	8b 43 18             	mov    0x18(%ebx),%eax
80104a65:	83 c4 10             	add    $0x10,%esp
80104a68:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104a6f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a72:	c9                   	leave  
80104a73:	c3                   	ret    
80104a74:	66 90                	xchg   %ax,%ax
80104a76:	66 90                	xchg   %ax,%ax
80104a78:	66 90                	xchg   %ax,%ax
80104a7a:	66 90                	xchg   %ax,%ax
80104a7c:	66 90                	xchg   %ax,%ax
80104a7e:	66 90                	xchg   %ax,%ax

80104a80 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104a80:	55                   	push   %ebp
80104a81:	89 e5                	mov    %esp,%ebp
80104a83:	57                   	push   %edi
80104a84:	56                   	push   %esi
80104a85:	53                   	push   %ebx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104a86:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104a89:	83 ec 34             	sub    $0x34,%esp
80104a8c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104a8f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104a92:	56                   	push   %esi
80104a93:	50                   	push   %eax
{
80104a94:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104a97:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104a9a:	e8 d1 d4 ff ff       	call   80101f70 <nameiparent>
80104a9f:	83 c4 10             	add    $0x10,%esp
80104aa2:	85 c0                	test   %eax,%eax
80104aa4:	0f 84 46 01 00 00    	je     80104bf0 <create+0x170>
    return 0;
  ilock(dp);
80104aaa:	83 ec 0c             	sub    $0xc,%esp
80104aad:	89 c3                	mov    %eax,%ebx
80104aaf:	50                   	push   %eax
80104ab0:	e8 3b cc ff ff       	call   801016f0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104ab5:	83 c4 0c             	add    $0xc,%esp
80104ab8:	6a 00                	push   $0x0
80104aba:	56                   	push   %esi
80104abb:	53                   	push   %ebx
80104abc:	e8 5f d1 ff ff       	call   80101c20 <dirlookup>
80104ac1:	83 c4 10             	add    $0x10,%esp
80104ac4:	85 c0                	test   %eax,%eax
80104ac6:	89 c7                	mov    %eax,%edi
80104ac8:	74 36                	je     80104b00 <create+0x80>
    iunlockput(dp);
80104aca:	83 ec 0c             	sub    $0xc,%esp
80104acd:	53                   	push   %ebx
80104ace:	e8 ad ce ff ff       	call   80101980 <iunlockput>
    ilock(ip);
80104ad3:	89 3c 24             	mov    %edi,(%esp)
80104ad6:	e8 15 cc ff ff       	call   801016f0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104adb:	83 c4 10             	add    $0x10,%esp
80104ade:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104ae3:	0f 85 97 00 00 00    	jne    80104b80 <create+0x100>
80104ae9:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104aee:	0f 85 8c 00 00 00    	jne    80104b80 <create+0x100>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104af4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104af7:	89 f8                	mov    %edi,%eax
80104af9:	5b                   	pop    %ebx
80104afa:	5e                   	pop    %esi
80104afb:	5f                   	pop    %edi
80104afc:	5d                   	pop    %ebp
80104afd:	c3                   	ret    
80104afe:	66 90                	xchg   %ax,%ax
  if((ip = ialloc(dp->dev, type)) == 0)
80104b00:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104b04:	83 ec 08             	sub    $0x8,%esp
80104b07:	50                   	push   %eax
80104b08:	ff 33                	pushl  (%ebx)
80104b0a:	e8 71 ca ff ff       	call   80101580 <ialloc>
80104b0f:	83 c4 10             	add    $0x10,%esp
80104b12:	85 c0                	test   %eax,%eax
80104b14:	89 c7                	mov    %eax,%edi
80104b16:	0f 84 e8 00 00 00    	je     80104c04 <create+0x184>
  ilock(ip);
80104b1c:	83 ec 0c             	sub    $0xc,%esp
80104b1f:	50                   	push   %eax
80104b20:	e8 cb cb ff ff       	call   801016f0 <ilock>
  ip->major = major;
80104b25:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104b29:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104b2d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104b31:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104b35:	b8 01 00 00 00       	mov    $0x1,%eax
80104b3a:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104b3e:	89 3c 24             	mov    %edi,(%esp)
80104b41:	e8 fa ca ff ff       	call   80101640 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104b46:	83 c4 10             	add    $0x10,%esp
80104b49:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104b4e:	74 50                	je     80104ba0 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104b50:	83 ec 04             	sub    $0x4,%esp
80104b53:	ff 77 04             	pushl  0x4(%edi)
80104b56:	56                   	push   %esi
80104b57:	53                   	push   %ebx
80104b58:	e8 33 d3 ff ff       	call   80101e90 <dirlink>
80104b5d:	83 c4 10             	add    $0x10,%esp
80104b60:	85 c0                	test   %eax,%eax
80104b62:	0f 88 8f 00 00 00    	js     80104bf7 <create+0x177>
  iunlockput(dp);
80104b68:	83 ec 0c             	sub    $0xc,%esp
80104b6b:	53                   	push   %ebx
80104b6c:	e8 0f ce ff ff       	call   80101980 <iunlockput>
  return ip;
80104b71:	83 c4 10             	add    $0x10,%esp
}
80104b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b77:	89 f8                	mov    %edi,%eax
80104b79:	5b                   	pop    %ebx
80104b7a:	5e                   	pop    %esi
80104b7b:	5f                   	pop    %edi
80104b7c:	5d                   	pop    %ebp
80104b7d:	c3                   	ret    
80104b7e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104b80:	83 ec 0c             	sub    $0xc,%esp
80104b83:	57                   	push   %edi
    return 0;
80104b84:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104b86:	e8 f5 cd ff ff       	call   80101980 <iunlockput>
    return 0;
80104b8b:	83 c4 10             	add    $0x10,%esp
}
80104b8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b91:	89 f8                	mov    %edi,%eax
80104b93:	5b                   	pop    %ebx
80104b94:	5e                   	pop    %esi
80104b95:	5f                   	pop    %edi
80104b96:	5d                   	pop    %ebp
80104b97:	c3                   	ret    
80104b98:	90                   	nop
80104b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink++;  // for ".."
80104ba0:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104ba5:	83 ec 0c             	sub    $0xc,%esp
80104ba8:	53                   	push   %ebx
80104ba9:	e8 92 ca ff ff       	call   80101640 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104bae:	83 c4 0c             	add    $0xc,%esp
80104bb1:	ff 77 04             	pushl  0x4(%edi)
80104bb4:	68 40 7a 10 80       	push   $0x80107a40
80104bb9:	57                   	push   %edi
80104bba:	e8 d1 d2 ff ff       	call   80101e90 <dirlink>
80104bbf:	83 c4 10             	add    $0x10,%esp
80104bc2:	85 c0                	test   %eax,%eax
80104bc4:	78 1c                	js     80104be2 <create+0x162>
80104bc6:	83 ec 04             	sub    $0x4,%esp
80104bc9:	ff 73 04             	pushl  0x4(%ebx)
80104bcc:	68 3f 7a 10 80       	push   $0x80107a3f
80104bd1:	57                   	push   %edi
80104bd2:	e8 b9 d2 ff ff       	call   80101e90 <dirlink>
80104bd7:	83 c4 10             	add    $0x10,%esp
80104bda:	85 c0                	test   %eax,%eax
80104bdc:	0f 89 6e ff ff ff    	jns    80104b50 <create+0xd0>
      panic("create dots");
80104be2:	83 ec 0c             	sub    $0xc,%esp
80104be5:	68 33 7a 10 80       	push   $0x80107a33
80104bea:	e8 a1 b7 ff ff       	call   80100390 <panic>
80104bef:	90                   	nop
    return 0;
80104bf0:	31 ff                	xor    %edi,%edi
80104bf2:	e9 fd fe ff ff       	jmp    80104af4 <create+0x74>
    panic("create: dirlink");
80104bf7:	83 ec 0c             	sub    $0xc,%esp
80104bfa:	68 42 7a 10 80       	push   $0x80107a42
80104bff:	e8 8c b7 ff ff       	call   80100390 <panic>
    panic("create: ialloc");
80104c04:	83 ec 0c             	sub    $0xc,%esp
80104c07:	68 24 7a 10 80       	push   $0x80107a24
80104c0c:	e8 7f b7 ff ff       	call   80100390 <panic>
80104c11:	eb 0d                	jmp    80104c20 <argfd.constprop.0>
80104c13:	90                   	nop
80104c14:	90                   	nop
80104c15:	90                   	nop
80104c16:	90                   	nop
80104c17:	90                   	nop
80104c18:	90                   	nop
80104c19:	90                   	nop
80104c1a:	90                   	nop
80104c1b:	90                   	nop
80104c1c:	90                   	nop
80104c1d:	90                   	nop
80104c1e:	90                   	nop
80104c1f:	90                   	nop

80104c20 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104c20:	55                   	push   %ebp
80104c21:	89 e5                	mov    %esp,%ebp
80104c23:	56                   	push   %esi
80104c24:	53                   	push   %ebx
80104c25:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80104c27:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104c2a:	89 d6                	mov    %edx,%esi
80104c2c:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104c2f:	50                   	push   %eax
80104c30:	6a 00                	push   $0x0
80104c32:	e8 d9 fc ff ff       	call   80104910 <argint>
80104c37:	83 c4 10             	add    $0x10,%esp
80104c3a:	85 c0                	test   %eax,%eax
80104c3c:	78 2a                	js     80104c68 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104c3e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104c42:	77 24                	ja     80104c68 <argfd.constprop.0+0x48>
80104c44:	e8 77 ec ff ff       	call   801038c0 <myproc>
80104c49:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104c4c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104c50:	85 c0                	test   %eax,%eax
80104c52:	74 14                	je     80104c68 <argfd.constprop.0+0x48>
  if(pfd)
80104c54:	85 db                	test   %ebx,%ebx
80104c56:	74 02                	je     80104c5a <argfd.constprop.0+0x3a>
    *pfd = fd;
80104c58:	89 13                	mov    %edx,(%ebx)
    *pf = f;
80104c5a:	89 06                	mov    %eax,(%esi)
  return 0;
80104c5c:	31 c0                	xor    %eax,%eax
}
80104c5e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c61:	5b                   	pop    %ebx
80104c62:	5e                   	pop    %esi
80104c63:	5d                   	pop    %ebp
80104c64:	c3                   	ret    
80104c65:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104c68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c6d:	eb ef                	jmp    80104c5e <argfd.constprop.0+0x3e>
80104c6f:	90                   	nop

80104c70 <sys_dup>:
{
80104c70:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104c71:	31 c0                	xor    %eax,%eax
{
80104c73:	89 e5                	mov    %esp,%ebp
80104c75:	56                   	push   %esi
80104c76:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104c77:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104c7a:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104c7d:	e8 9e ff ff ff       	call   80104c20 <argfd.constprop.0>
80104c82:	85 c0                	test   %eax,%eax
80104c84:	78 42                	js     80104cc8 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
80104c86:	8b 75 f4             	mov    -0xc(%ebp),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104c89:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80104c8b:	e8 30 ec ff ff       	call   801038c0 <myproc>
80104c90:	eb 0e                	jmp    80104ca0 <sys_dup+0x30>
80104c92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104c98:	83 c3 01             	add    $0x1,%ebx
80104c9b:	83 fb 10             	cmp    $0x10,%ebx
80104c9e:	74 28                	je     80104cc8 <sys_dup+0x58>
    if(curproc->ofile[fd] == 0){
80104ca0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104ca4:	85 d2                	test   %edx,%edx
80104ca6:	75 f0                	jne    80104c98 <sys_dup+0x28>
      curproc->ofile[fd] = f;
80104ca8:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104cac:	83 ec 0c             	sub    $0xc,%esp
80104caf:	ff 75 f4             	pushl  -0xc(%ebp)
80104cb2:	e8 a9 c1 ff ff       	call   80100e60 <filedup>
  return fd;
80104cb7:	83 c4 10             	add    $0x10,%esp
}
80104cba:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104cbd:	89 d8                	mov    %ebx,%eax
80104cbf:	5b                   	pop    %ebx
80104cc0:	5e                   	pop    %esi
80104cc1:	5d                   	pop    %ebp
80104cc2:	c3                   	ret    
80104cc3:	90                   	nop
80104cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cc8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104ccb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104cd0:	89 d8                	mov    %ebx,%eax
80104cd2:	5b                   	pop    %ebx
80104cd3:	5e                   	pop    %esi
80104cd4:	5d                   	pop    %ebp
80104cd5:	c3                   	ret    
80104cd6:	8d 76 00             	lea    0x0(%esi),%esi
80104cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ce0 <sys_read>:
{
80104ce0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ce1:	31 c0                	xor    %eax,%eax
{
80104ce3:	89 e5                	mov    %esp,%ebp
80104ce5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ce8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104ceb:	e8 30 ff ff ff       	call   80104c20 <argfd.constprop.0>
80104cf0:	85 c0                	test   %eax,%eax
80104cf2:	78 4c                	js     80104d40 <sys_read+0x60>
80104cf4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cf7:	83 ec 08             	sub    $0x8,%esp
80104cfa:	50                   	push   %eax
80104cfb:	6a 02                	push   $0x2
80104cfd:	e8 0e fc ff ff       	call   80104910 <argint>
80104d02:	83 c4 10             	add    $0x10,%esp
80104d05:	85 c0                	test   %eax,%eax
80104d07:	78 37                	js     80104d40 <sys_read+0x60>
80104d09:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d0c:	83 ec 04             	sub    $0x4,%esp
80104d0f:	ff 75 f0             	pushl  -0x10(%ebp)
80104d12:	50                   	push   %eax
80104d13:	6a 01                	push   $0x1
80104d15:	e8 46 fc ff ff       	call   80104960 <argptr>
80104d1a:	83 c4 10             	add    $0x10,%esp
80104d1d:	85 c0                	test   %eax,%eax
80104d1f:	78 1f                	js     80104d40 <sys_read+0x60>
  return fileread(f, p, n);
80104d21:	83 ec 04             	sub    $0x4,%esp
80104d24:	ff 75 f0             	pushl  -0x10(%ebp)
80104d27:	ff 75 f4             	pushl  -0xc(%ebp)
80104d2a:	ff 75 ec             	pushl  -0x14(%ebp)
80104d2d:	e8 9e c2 ff ff       	call   80100fd0 <fileread>
80104d32:	83 c4 10             	add    $0x10,%esp
}
80104d35:	c9                   	leave  
80104d36:	c3                   	ret    
80104d37:	89 f6                	mov    %esi,%esi
80104d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104d40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d45:	c9                   	leave  
80104d46:	c3                   	ret    
80104d47:	89 f6                	mov    %esi,%esi
80104d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d50 <sys_write>:
{
80104d50:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d51:	31 c0                	xor    %eax,%eax
{
80104d53:	89 e5                	mov    %esp,%ebp
80104d55:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d58:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d5b:	e8 c0 fe ff ff       	call   80104c20 <argfd.constprop.0>
80104d60:	85 c0                	test   %eax,%eax
80104d62:	78 4c                	js     80104db0 <sys_write+0x60>
80104d64:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d67:	83 ec 08             	sub    $0x8,%esp
80104d6a:	50                   	push   %eax
80104d6b:	6a 02                	push   $0x2
80104d6d:	e8 9e fb ff ff       	call   80104910 <argint>
80104d72:	83 c4 10             	add    $0x10,%esp
80104d75:	85 c0                	test   %eax,%eax
80104d77:	78 37                	js     80104db0 <sys_write+0x60>
80104d79:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d7c:	83 ec 04             	sub    $0x4,%esp
80104d7f:	ff 75 f0             	pushl  -0x10(%ebp)
80104d82:	50                   	push   %eax
80104d83:	6a 01                	push   $0x1
80104d85:	e8 d6 fb ff ff       	call   80104960 <argptr>
80104d8a:	83 c4 10             	add    $0x10,%esp
80104d8d:	85 c0                	test   %eax,%eax
80104d8f:	78 1f                	js     80104db0 <sys_write+0x60>
  return filewrite(f, p, n);
80104d91:	83 ec 04             	sub    $0x4,%esp
80104d94:	ff 75 f0             	pushl  -0x10(%ebp)
80104d97:	ff 75 f4             	pushl  -0xc(%ebp)
80104d9a:	ff 75 ec             	pushl  -0x14(%ebp)
80104d9d:	e8 be c2 ff ff       	call   80101060 <filewrite>
80104da2:	83 c4 10             	add    $0x10,%esp
}
80104da5:	c9                   	leave  
80104da6:	c3                   	ret    
80104da7:	89 f6                	mov    %esi,%esi
80104da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104db0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104db5:	c9                   	leave  
80104db6:	c3                   	ret    
80104db7:	89 f6                	mov    %esi,%esi
80104db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104dc0 <sys_close>:
{
80104dc0:	55                   	push   %ebp
80104dc1:	89 e5                	mov    %esp,%ebp
80104dc3:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104dc6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104dc9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104dcc:	e8 4f fe ff ff       	call   80104c20 <argfd.constprop.0>
80104dd1:	85 c0                	test   %eax,%eax
80104dd3:	78 2b                	js     80104e00 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
80104dd5:	e8 e6 ea ff ff       	call   801038c0 <myproc>
80104dda:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104ddd:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80104de0:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104de7:	00 
  fileclose(f);
80104de8:	ff 75 f4             	pushl  -0xc(%ebp)
80104deb:	e8 c0 c0 ff ff       	call   80100eb0 <fileclose>
  return 0;
80104df0:	83 c4 10             	add    $0x10,%esp
80104df3:	31 c0                	xor    %eax,%eax
}
80104df5:	c9                   	leave  
80104df6:	c3                   	ret    
80104df7:	89 f6                	mov    %esi,%esi
80104df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104e00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e05:	c9                   	leave  
80104e06:	c3                   	ret    
80104e07:	89 f6                	mov    %esi,%esi
80104e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e10 <sys_fstat>:
{
80104e10:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104e11:	31 c0                	xor    %eax,%eax
{
80104e13:	89 e5                	mov    %esp,%ebp
80104e15:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104e18:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104e1b:	e8 00 fe ff ff       	call   80104c20 <argfd.constprop.0>
80104e20:	85 c0                	test   %eax,%eax
80104e22:	78 2c                	js     80104e50 <sys_fstat+0x40>
80104e24:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e27:	83 ec 04             	sub    $0x4,%esp
80104e2a:	6a 14                	push   $0x14
80104e2c:	50                   	push   %eax
80104e2d:	6a 01                	push   $0x1
80104e2f:	e8 2c fb ff ff       	call   80104960 <argptr>
80104e34:	83 c4 10             	add    $0x10,%esp
80104e37:	85 c0                	test   %eax,%eax
80104e39:	78 15                	js     80104e50 <sys_fstat+0x40>
  return filestat(f, st);
80104e3b:	83 ec 08             	sub    $0x8,%esp
80104e3e:	ff 75 f4             	pushl  -0xc(%ebp)
80104e41:	ff 75 f0             	pushl  -0x10(%ebp)
80104e44:	e8 37 c1 ff ff       	call   80100f80 <filestat>
80104e49:	83 c4 10             	add    $0x10,%esp
}
80104e4c:	c9                   	leave  
80104e4d:	c3                   	ret    
80104e4e:	66 90                	xchg   %ax,%ax
    return -1;
80104e50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e55:	c9                   	leave  
80104e56:	c3                   	ret    
80104e57:	89 f6                	mov    %esi,%esi
80104e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e60 <sys_link>:
{
80104e60:	55                   	push   %ebp
80104e61:	89 e5                	mov    %esp,%ebp
80104e63:	57                   	push   %edi
80104e64:	56                   	push   %esi
80104e65:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104e66:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104e69:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104e6c:	50                   	push   %eax
80104e6d:	6a 00                	push   $0x0
80104e6f:	e8 4c fb ff ff       	call   801049c0 <argstr>
80104e74:	83 c4 10             	add    $0x10,%esp
80104e77:	85 c0                	test   %eax,%eax
80104e79:	0f 88 fb 00 00 00    	js     80104f7a <sys_link+0x11a>
80104e7f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104e82:	83 ec 08             	sub    $0x8,%esp
80104e85:	50                   	push   %eax
80104e86:	6a 01                	push   $0x1
80104e88:	e8 33 fb ff ff       	call   801049c0 <argstr>
80104e8d:	83 c4 10             	add    $0x10,%esp
80104e90:	85 c0                	test   %eax,%eax
80104e92:	0f 88 e2 00 00 00    	js     80104f7a <sys_link+0x11a>
  begin_op();
80104e98:	e8 c3 dd ff ff       	call   80102c60 <begin_op>
  if((ip = namei(old)) == 0){
80104e9d:	83 ec 0c             	sub    $0xc,%esp
80104ea0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104ea3:	e8 a8 d0 ff ff       	call   80101f50 <namei>
80104ea8:	83 c4 10             	add    $0x10,%esp
80104eab:	85 c0                	test   %eax,%eax
80104ead:	89 c3                	mov    %eax,%ebx
80104eaf:	0f 84 ea 00 00 00    	je     80104f9f <sys_link+0x13f>
  ilock(ip);
80104eb5:	83 ec 0c             	sub    $0xc,%esp
80104eb8:	50                   	push   %eax
80104eb9:	e8 32 c8 ff ff       	call   801016f0 <ilock>
  if(ip->type == T_DIR){
80104ebe:	83 c4 10             	add    $0x10,%esp
80104ec1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ec6:	0f 84 bb 00 00 00    	je     80104f87 <sys_link+0x127>
  ip->nlink++;
80104ecc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ed1:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80104ed4:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104ed7:	53                   	push   %ebx
80104ed8:	e8 63 c7 ff ff       	call   80101640 <iupdate>
  iunlock(ip);
80104edd:	89 1c 24             	mov    %ebx,(%esp)
80104ee0:	e8 eb c8 ff ff       	call   801017d0 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104ee5:	58                   	pop    %eax
80104ee6:	5a                   	pop    %edx
80104ee7:	57                   	push   %edi
80104ee8:	ff 75 d0             	pushl  -0x30(%ebp)
80104eeb:	e8 80 d0 ff ff       	call   80101f70 <nameiparent>
80104ef0:	83 c4 10             	add    $0x10,%esp
80104ef3:	85 c0                	test   %eax,%eax
80104ef5:	89 c6                	mov    %eax,%esi
80104ef7:	74 5b                	je     80104f54 <sys_link+0xf4>
  ilock(dp);
80104ef9:	83 ec 0c             	sub    $0xc,%esp
80104efc:	50                   	push   %eax
80104efd:	e8 ee c7 ff ff       	call   801016f0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104f02:	83 c4 10             	add    $0x10,%esp
80104f05:	8b 03                	mov    (%ebx),%eax
80104f07:	39 06                	cmp    %eax,(%esi)
80104f09:	75 3d                	jne    80104f48 <sys_link+0xe8>
80104f0b:	83 ec 04             	sub    $0x4,%esp
80104f0e:	ff 73 04             	pushl  0x4(%ebx)
80104f11:	57                   	push   %edi
80104f12:	56                   	push   %esi
80104f13:	e8 78 cf ff ff       	call   80101e90 <dirlink>
80104f18:	83 c4 10             	add    $0x10,%esp
80104f1b:	85 c0                	test   %eax,%eax
80104f1d:	78 29                	js     80104f48 <sys_link+0xe8>
  iunlockput(dp);
80104f1f:	83 ec 0c             	sub    $0xc,%esp
80104f22:	56                   	push   %esi
80104f23:	e8 58 ca ff ff       	call   80101980 <iunlockput>
  iput(ip);
80104f28:	89 1c 24             	mov    %ebx,(%esp)
80104f2b:	e8 f0 c8 ff ff       	call   80101820 <iput>
  end_op();
80104f30:	e8 9b dd ff ff       	call   80102cd0 <end_op>
  return 0;
80104f35:	83 c4 10             	add    $0x10,%esp
80104f38:	31 c0                	xor    %eax,%eax
}
80104f3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f3d:	5b                   	pop    %ebx
80104f3e:	5e                   	pop    %esi
80104f3f:	5f                   	pop    %edi
80104f40:	5d                   	pop    %ebp
80104f41:	c3                   	ret    
80104f42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80104f48:	83 ec 0c             	sub    $0xc,%esp
80104f4b:	56                   	push   %esi
80104f4c:	e8 2f ca ff ff       	call   80101980 <iunlockput>
    goto bad;
80104f51:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104f54:	83 ec 0c             	sub    $0xc,%esp
80104f57:	53                   	push   %ebx
80104f58:	e8 93 c7 ff ff       	call   801016f0 <ilock>
  ip->nlink--;
80104f5d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f62:	89 1c 24             	mov    %ebx,(%esp)
80104f65:	e8 d6 c6 ff ff       	call   80101640 <iupdate>
  iunlockput(ip);
80104f6a:	89 1c 24             	mov    %ebx,(%esp)
80104f6d:	e8 0e ca ff ff       	call   80101980 <iunlockput>
  end_op();
80104f72:	e8 59 dd ff ff       	call   80102cd0 <end_op>
  return -1;
80104f77:	83 c4 10             	add    $0x10,%esp
}
80104f7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
80104f7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f82:	5b                   	pop    %ebx
80104f83:	5e                   	pop    %esi
80104f84:	5f                   	pop    %edi
80104f85:	5d                   	pop    %ebp
80104f86:	c3                   	ret    
    iunlockput(ip);
80104f87:	83 ec 0c             	sub    $0xc,%esp
80104f8a:	53                   	push   %ebx
80104f8b:	e8 f0 c9 ff ff       	call   80101980 <iunlockput>
    end_op();
80104f90:	e8 3b dd ff ff       	call   80102cd0 <end_op>
    return -1;
80104f95:	83 c4 10             	add    $0x10,%esp
80104f98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f9d:	eb 9b                	jmp    80104f3a <sys_link+0xda>
    end_op();
80104f9f:	e8 2c dd ff ff       	call   80102cd0 <end_op>
    return -1;
80104fa4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fa9:	eb 8f                	jmp    80104f3a <sys_link+0xda>
80104fab:	90                   	nop
80104fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104fb0 <sys_unlink>:
{
80104fb0:	55                   	push   %ebp
80104fb1:	89 e5                	mov    %esp,%ebp
80104fb3:	57                   	push   %edi
80104fb4:	56                   	push   %esi
80104fb5:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80104fb6:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80104fb9:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
80104fbc:	50                   	push   %eax
80104fbd:	6a 00                	push   $0x0
80104fbf:	e8 fc f9 ff ff       	call   801049c0 <argstr>
80104fc4:	83 c4 10             	add    $0x10,%esp
80104fc7:	85 c0                	test   %eax,%eax
80104fc9:	0f 88 77 01 00 00    	js     80105146 <sys_unlink+0x196>
  if((dp = nameiparent(path, name)) == 0){
80104fcf:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
80104fd2:	e8 89 dc ff ff       	call   80102c60 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104fd7:	83 ec 08             	sub    $0x8,%esp
80104fda:	53                   	push   %ebx
80104fdb:	ff 75 c0             	pushl  -0x40(%ebp)
80104fde:	e8 8d cf ff ff       	call   80101f70 <nameiparent>
80104fe3:	83 c4 10             	add    $0x10,%esp
80104fe6:	85 c0                	test   %eax,%eax
80104fe8:	89 c6                	mov    %eax,%esi
80104fea:	0f 84 60 01 00 00    	je     80105150 <sys_unlink+0x1a0>
  ilock(dp);
80104ff0:	83 ec 0c             	sub    $0xc,%esp
80104ff3:	50                   	push   %eax
80104ff4:	e8 f7 c6 ff ff       	call   801016f0 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104ff9:	58                   	pop    %eax
80104ffa:	5a                   	pop    %edx
80104ffb:	68 40 7a 10 80       	push   $0x80107a40
80105000:	53                   	push   %ebx
80105001:	e8 fa cb ff ff       	call   80101c00 <namecmp>
80105006:	83 c4 10             	add    $0x10,%esp
80105009:	85 c0                	test   %eax,%eax
8010500b:	0f 84 03 01 00 00    	je     80105114 <sys_unlink+0x164>
80105011:	83 ec 08             	sub    $0x8,%esp
80105014:	68 3f 7a 10 80       	push   $0x80107a3f
80105019:	53                   	push   %ebx
8010501a:	e8 e1 cb ff ff       	call   80101c00 <namecmp>
8010501f:	83 c4 10             	add    $0x10,%esp
80105022:	85 c0                	test   %eax,%eax
80105024:	0f 84 ea 00 00 00    	je     80105114 <sys_unlink+0x164>
  if((ip = dirlookup(dp, name, &off)) == 0)
8010502a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010502d:	83 ec 04             	sub    $0x4,%esp
80105030:	50                   	push   %eax
80105031:	53                   	push   %ebx
80105032:	56                   	push   %esi
80105033:	e8 e8 cb ff ff       	call   80101c20 <dirlookup>
80105038:	83 c4 10             	add    $0x10,%esp
8010503b:	85 c0                	test   %eax,%eax
8010503d:	89 c3                	mov    %eax,%ebx
8010503f:	0f 84 cf 00 00 00    	je     80105114 <sys_unlink+0x164>
  ilock(ip);
80105045:	83 ec 0c             	sub    $0xc,%esp
80105048:	50                   	push   %eax
80105049:	e8 a2 c6 ff ff       	call   801016f0 <ilock>
  if(ip->nlink < 1)
8010504e:	83 c4 10             	add    $0x10,%esp
80105051:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80105056:	0f 8e 10 01 00 00    	jle    8010516c <sys_unlink+0x1bc>
  if(ip->type == T_DIR && !isdirempty(ip)){
8010505c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105061:	74 6d                	je     801050d0 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80105063:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105066:	83 ec 04             	sub    $0x4,%esp
80105069:	6a 10                	push   $0x10
8010506b:	6a 00                	push   $0x0
8010506d:	50                   	push   %eax
8010506e:	e8 9d f5 ff ff       	call   80104610 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105073:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105076:	6a 10                	push   $0x10
80105078:	ff 75 c4             	pushl  -0x3c(%ebp)
8010507b:	50                   	push   %eax
8010507c:	56                   	push   %esi
8010507d:	e8 4e ca ff ff       	call   80101ad0 <writei>
80105082:	83 c4 20             	add    $0x20,%esp
80105085:	83 f8 10             	cmp    $0x10,%eax
80105088:	0f 85 eb 00 00 00    	jne    80105179 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
8010508e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105093:	0f 84 97 00 00 00    	je     80105130 <sys_unlink+0x180>
  iunlockput(dp);
80105099:	83 ec 0c             	sub    $0xc,%esp
8010509c:	56                   	push   %esi
8010509d:	e8 de c8 ff ff       	call   80101980 <iunlockput>
  ip->nlink--;
801050a2:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801050a7:	89 1c 24             	mov    %ebx,(%esp)
801050aa:	e8 91 c5 ff ff       	call   80101640 <iupdate>
  iunlockput(ip);
801050af:	89 1c 24             	mov    %ebx,(%esp)
801050b2:	e8 c9 c8 ff ff       	call   80101980 <iunlockput>
  end_op();
801050b7:	e8 14 dc ff ff       	call   80102cd0 <end_op>
  return 0;
801050bc:	83 c4 10             	add    $0x10,%esp
801050bf:	31 c0                	xor    %eax,%eax
}
801050c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050c4:	5b                   	pop    %ebx
801050c5:	5e                   	pop    %esi
801050c6:	5f                   	pop    %edi
801050c7:	5d                   	pop    %ebp
801050c8:	c3                   	ret    
801050c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801050d0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801050d4:	76 8d                	jbe    80105063 <sys_unlink+0xb3>
801050d6:	bf 20 00 00 00       	mov    $0x20,%edi
801050db:	eb 0f                	jmp    801050ec <sys_unlink+0x13c>
801050dd:	8d 76 00             	lea    0x0(%esi),%esi
801050e0:	83 c7 10             	add    $0x10,%edi
801050e3:	3b 7b 58             	cmp    0x58(%ebx),%edi
801050e6:	0f 83 77 ff ff ff    	jae    80105063 <sys_unlink+0xb3>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801050ec:	8d 45 d8             	lea    -0x28(%ebp),%eax
801050ef:	6a 10                	push   $0x10
801050f1:	57                   	push   %edi
801050f2:	50                   	push   %eax
801050f3:	53                   	push   %ebx
801050f4:	e8 d7 c8 ff ff       	call   801019d0 <readi>
801050f9:	83 c4 10             	add    $0x10,%esp
801050fc:	83 f8 10             	cmp    $0x10,%eax
801050ff:	75 5e                	jne    8010515f <sys_unlink+0x1af>
    if(de.inum != 0)
80105101:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105106:	74 d8                	je     801050e0 <sys_unlink+0x130>
    iunlockput(ip);
80105108:	83 ec 0c             	sub    $0xc,%esp
8010510b:	53                   	push   %ebx
8010510c:	e8 6f c8 ff ff       	call   80101980 <iunlockput>
    goto bad;
80105111:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
80105114:	83 ec 0c             	sub    $0xc,%esp
80105117:	56                   	push   %esi
80105118:	e8 63 c8 ff ff       	call   80101980 <iunlockput>
  end_op();
8010511d:	e8 ae db ff ff       	call   80102cd0 <end_op>
  return -1;
80105122:	83 c4 10             	add    $0x10,%esp
80105125:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010512a:	eb 95                	jmp    801050c1 <sys_unlink+0x111>
8010512c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
80105130:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
    iupdate(dp);
80105135:	83 ec 0c             	sub    $0xc,%esp
80105138:	56                   	push   %esi
80105139:	e8 02 c5 ff ff       	call   80101640 <iupdate>
8010513e:	83 c4 10             	add    $0x10,%esp
80105141:	e9 53 ff ff ff       	jmp    80105099 <sys_unlink+0xe9>
    return -1;
80105146:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010514b:	e9 71 ff ff ff       	jmp    801050c1 <sys_unlink+0x111>
    end_op();
80105150:	e8 7b db ff ff       	call   80102cd0 <end_op>
    return -1;
80105155:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010515a:	e9 62 ff ff ff       	jmp    801050c1 <sys_unlink+0x111>
      panic("isdirempty: readi");
8010515f:	83 ec 0c             	sub    $0xc,%esp
80105162:	68 64 7a 10 80       	push   $0x80107a64
80105167:	e8 24 b2 ff ff       	call   80100390 <panic>
    panic("unlink: nlink < 1");
8010516c:	83 ec 0c             	sub    $0xc,%esp
8010516f:	68 52 7a 10 80       	push   $0x80107a52
80105174:	e8 17 b2 ff ff       	call   80100390 <panic>
    panic("unlink: writei");
80105179:	83 ec 0c             	sub    $0xc,%esp
8010517c:	68 76 7a 10 80       	push   $0x80107a76
80105181:	e8 0a b2 ff ff       	call   80100390 <panic>
80105186:	8d 76 00             	lea    0x0(%esi),%esi
80105189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105190 <sys_open>:

int
sys_open(void)
{
80105190:	55                   	push   %ebp
80105191:	89 e5                	mov    %esp,%ebp
80105193:	57                   	push   %edi
80105194:	56                   	push   %esi
80105195:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105196:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105199:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010519c:	50                   	push   %eax
8010519d:	6a 00                	push   $0x0
8010519f:	e8 1c f8 ff ff       	call   801049c0 <argstr>
801051a4:	83 c4 10             	add    $0x10,%esp
801051a7:	85 c0                	test   %eax,%eax
801051a9:	0f 88 1d 01 00 00    	js     801052cc <sys_open+0x13c>
801051af:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801051b2:	83 ec 08             	sub    $0x8,%esp
801051b5:	50                   	push   %eax
801051b6:	6a 01                	push   $0x1
801051b8:	e8 53 f7 ff ff       	call   80104910 <argint>
801051bd:	83 c4 10             	add    $0x10,%esp
801051c0:	85 c0                	test   %eax,%eax
801051c2:	0f 88 04 01 00 00    	js     801052cc <sys_open+0x13c>
    return -1;

  begin_op();
801051c8:	e8 93 da ff ff       	call   80102c60 <begin_op>

  if(omode & O_CREATE){
801051cd:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801051d1:	0f 85 a9 00 00 00    	jne    80105280 <sys_open+0xf0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801051d7:	83 ec 0c             	sub    $0xc,%esp
801051da:	ff 75 e0             	pushl  -0x20(%ebp)
801051dd:	e8 6e cd ff ff       	call   80101f50 <namei>
801051e2:	83 c4 10             	add    $0x10,%esp
801051e5:	85 c0                	test   %eax,%eax
801051e7:	89 c6                	mov    %eax,%esi
801051e9:	0f 84 b2 00 00 00    	je     801052a1 <sys_open+0x111>
      end_op();
      return -1;
    }
    ilock(ip);
801051ef:	83 ec 0c             	sub    $0xc,%esp
801051f2:	50                   	push   %eax
801051f3:	e8 f8 c4 ff ff       	call   801016f0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801051f8:	83 c4 10             	add    $0x10,%esp
801051fb:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105200:	0f 84 aa 00 00 00    	je     801052b0 <sys_open+0x120>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105206:	e8 e5 bb ff ff       	call   80100df0 <filealloc>
8010520b:	85 c0                	test   %eax,%eax
8010520d:	89 c7                	mov    %eax,%edi
8010520f:	0f 84 a6 00 00 00    	je     801052bb <sys_open+0x12b>
  struct proc *curproc = myproc();
80105215:	e8 a6 e6 ff ff       	call   801038c0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
8010521a:	31 db                	xor    %ebx,%ebx
8010521c:	eb 0e                	jmp    8010522c <sys_open+0x9c>
8010521e:	66 90                	xchg   %ax,%ax
80105220:	83 c3 01             	add    $0x1,%ebx
80105223:	83 fb 10             	cmp    $0x10,%ebx
80105226:	0f 84 ac 00 00 00    	je     801052d8 <sys_open+0x148>
    if(curproc->ofile[fd] == 0){
8010522c:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105230:	85 d2                	test   %edx,%edx
80105232:	75 ec                	jne    80105220 <sys_open+0x90>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105234:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80105237:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
8010523b:	56                   	push   %esi
8010523c:	e8 8f c5 ff ff       	call   801017d0 <iunlock>
  end_op();
80105241:	e8 8a da ff ff       	call   80102cd0 <end_op>

  f->type = FD_INODE;
80105246:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
8010524c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010524f:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
80105252:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105255:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
8010525c:	89 d0                	mov    %edx,%eax
8010525e:	f7 d0                	not    %eax
80105260:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105263:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
80105266:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105269:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
8010526d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105270:	89 d8                	mov    %ebx,%eax
80105272:	5b                   	pop    %ebx
80105273:	5e                   	pop    %esi
80105274:	5f                   	pop    %edi
80105275:	5d                   	pop    %ebp
80105276:	c3                   	ret    
80105277:	89 f6                	mov    %esi,%esi
80105279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ip = create(path, T_FILE, 0, 0);
80105280:	83 ec 0c             	sub    $0xc,%esp
80105283:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105286:	31 c9                	xor    %ecx,%ecx
80105288:	6a 00                	push   $0x0
8010528a:	ba 02 00 00 00       	mov    $0x2,%edx
8010528f:	e8 ec f7 ff ff       	call   80104a80 <create>
    if(ip == 0){
80105294:	83 c4 10             	add    $0x10,%esp
80105297:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105299:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010529b:	0f 85 65 ff ff ff    	jne    80105206 <sys_open+0x76>
      end_op();
801052a1:	e8 2a da ff ff       	call   80102cd0 <end_op>
      return -1;
801052a6:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801052ab:	eb c0                	jmp    8010526d <sys_open+0xdd>
801052ad:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
801052b0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801052b3:	85 c9                	test   %ecx,%ecx
801052b5:	0f 84 4b ff ff ff    	je     80105206 <sys_open+0x76>
    iunlockput(ip);
801052bb:	83 ec 0c             	sub    $0xc,%esp
801052be:	56                   	push   %esi
801052bf:	e8 bc c6 ff ff       	call   80101980 <iunlockput>
    end_op();
801052c4:	e8 07 da ff ff       	call   80102cd0 <end_op>
    return -1;
801052c9:	83 c4 10             	add    $0x10,%esp
801052cc:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801052d1:	eb 9a                	jmp    8010526d <sys_open+0xdd>
801052d3:	90                   	nop
801052d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
801052d8:	83 ec 0c             	sub    $0xc,%esp
801052db:	57                   	push   %edi
801052dc:	e8 cf bb ff ff       	call   80100eb0 <fileclose>
801052e1:	83 c4 10             	add    $0x10,%esp
801052e4:	eb d5                	jmp    801052bb <sys_open+0x12b>
801052e6:	8d 76 00             	lea    0x0(%esi),%esi
801052e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801052f0 <sys_mkdir>:

int
sys_mkdir(void)
{
801052f0:	55                   	push   %ebp
801052f1:	89 e5                	mov    %esp,%ebp
801052f3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801052f6:	e8 65 d9 ff ff       	call   80102c60 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801052fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052fe:	83 ec 08             	sub    $0x8,%esp
80105301:	50                   	push   %eax
80105302:	6a 00                	push   $0x0
80105304:	e8 b7 f6 ff ff       	call   801049c0 <argstr>
80105309:	83 c4 10             	add    $0x10,%esp
8010530c:	85 c0                	test   %eax,%eax
8010530e:	78 30                	js     80105340 <sys_mkdir+0x50>
80105310:	83 ec 0c             	sub    $0xc,%esp
80105313:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105316:	31 c9                	xor    %ecx,%ecx
80105318:	6a 00                	push   $0x0
8010531a:	ba 01 00 00 00       	mov    $0x1,%edx
8010531f:	e8 5c f7 ff ff       	call   80104a80 <create>
80105324:	83 c4 10             	add    $0x10,%esp
80105327:	85 c0                	test   %eax,%eax
80105329:	74 15                	je     80105340 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010532b:	83 ec 0c             	sub    $0xc,%esp
8010532e:	50                   	push   %eax
8010532f:	e8 4c c6 ff ff       	call   80101980 <iunlockput>
  end_op();
80105334:	e8 97 d9 ff ff       	call   80102cd0 <end_op>
  return 0;
80105339:	83 c4 10             	add    $0x10,%esp
8010533c:	31 c0                	xor    %eax,%eax
}
8010533e:	c9                   	leave  
8010533f:	c3                   	ret    
    end_op();
80105340:	e8 8b d9 ff ff       	call   80102cd0 <end_op>
    return -1;
80105345:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010534a:	c9                   	leave  
8010534b:	c3                   	ret    
8010534c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105350 <sys_mknod>:

int
sys_mknod(void)
{
80105350:	55                   	push   %ebp
80105351:	89 e5                	mov    %esp,%ebp
80105353:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105356:	e8 05 d9 ff ff       	call   80102c60 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010535b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010535e:	83 ec 08             	sub    $0x8,%esp
80105361:	50                   	push   %eax
80105362:	6a 00                	push   $0x0
80105364:	e8 57 f6 ff ff       	call   801049c0 <argstr>
80105369:	83 c4 10             	add    $0x10,%esp
8010536c:	85 c0                	test   %eax,%eax
8010536e:	78 60                	js     801053d0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105370:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105373:	83 ec 08             	sub    $0x8,%esp
80105376:	50                   	push   %eax
80105377:	6a 01                	push   $0x1
80105379:	e8 92 f5 ff ff       	call   80104910 <argint>
  if((argstr(0, &path)) < 0 ||
8010537e:	83 c4 10             	add    $0x10,%esp
80105381:	85 c0                	test   %eax,%eax
80105383:	78 4b                	js     801053d0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105385:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105388:	83 ec 08             	sub    $0x8,%esp
8010538b:	50                   	push   %eax
8010538c:	6a 02                	push   $0x2
8010538e:	e8 7d f5 ff ff       	call   80104910 <argint>
     argint(1, &major) < 0 ||
80105393:	83 c4 10             	add    $0x10,%esp
80105396:	85 c0                	test   %eax,%eax
80105398:	78 36                	js     801053d0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010539a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010539e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
801053a1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
801053a5:	ba 03 00 00 00       	mov    $0x3,%edx
801053aa:	50                   	push   %eax
801053ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
801053ae:	e8 cd f6 ff ff       	call   80104a80 <create>
801053b3:	83 c4 10             	add    $0x10,%esp
801053b6:	85 c0                	test   %eax,%eax
801053b8:	74 16                	je     801053d0 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
801053ba:	83 ec 0c             	sub    $0xc,%esp
801053bd:	50                   	push   %eax
801053be:	e8 bd c5 ff ff       	call   80101980 <iunlockput>
  end_op();
801053c3:	e8 08 d9 ff ff       	call   80102cd0 <end_op>
  return 0;
801053c8:	83 c4 10             	add    $0x10,%esp
801053cb:	31 c0                	xor    %eax,%eax
}
801053cd:	c9                   	leave  
801053ce:	c3                   	ret    
801053cf:	90                   	nop
    end_op();
801053d0:	e8 fb d8 ff ff       	call   80102cd0 <end_op>
    return -1;
801053d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053da:	c9                   	leave  
801053db:	c3                   	ret    
801053dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053e0 <sys_chdir>:

int
sys_chdir(void)
{
801053e0:	55                   	push   %ebp
801053e1:	89 e5                	mov    %esp,%ebp
801053e3:	56                   	push   %esi
801053e4:	53                   	push   %ebx
801053e5:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
801053e8:	e8 d3 e4 ff ff       	call   801038c0 <myproc>
801053ed:	89 c6                	mov    %eax,%esi
  
  begin_op();
801053ef:	e8 6c d8 ff ff       	call   80102c60 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801053f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053f7:	83 ec 08             	sub    $0x8,%esp
801053fa:	50                   	push   %eax
801053fb:	6a 00                	push   $0x0
801053fd:	e8 be f5 ff ff       	call   801049c0 <argstr>
80105402:	83 c4 10             	add    $0x10,%esp
80105405:	85 c0                	test   %eax,%eax
80105407:	78 77                	js     80105480 <sys_chdir+0xa0>
80105409:	83 ec 0c             	sub    $0xc,%esp
8010540c:	ff 75 f4             	pushl  -0xc(%ebp)
8010540f:	e8 3c cb ff ff       	call   80101f50 <namei>
80105414:	83 c4 10             	add    $0x10,%esp
80105417:	85 c0                	test   %eax,%eax
80105419:	89 c3                	mov    %eax,%ebx
8010541b:	74 63                	je     80105480 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010541d:	83 ec 0c             	sub    $0xc,%esp
80105420:	50                   	push   %eax
80105421:	e8 ca c2 ff ff       	call   801016f0 <ilock>
  if(ip->type != T_DIR){
80105426:	83 c4 10             	add    $0x10,%esp
80105429:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010542e:	75 30                	jne    80105460 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105430:	83 ec 0c             	sub    $0xc,%esp
80105433:	53                   	push   %ebx
80105434:	e8 97 c3 ff ff       	call   801017d0 <iunlock>
  iput(curproc->cwd);
80105439:	58                   	pop    %eax
8010543a:	ff 76 68             	pushl  0x68(%esi)
8010543d:	e8 de c3 ff ff       	call   80101820 <iput>
  end_op();
80105442:	e8 89 d8 ff ff       	call   80102cd0 <end_op>
  curproc->cwd = ip;
80105447:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010544a:	83 c4 10             	add    $0x10,%esp
8010544d:	31 c0                	xor    %eax,%eax
}
8010544f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105452:	5b                   	pop    %ebx
80105453:	5e                   	pop    %esi
80105454:	5d                   	pop    %ebp
80105455:	c3                   	ret    
80105456:	8d 76 00             	lea    0x0(%esi),%esi
80105459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
80105460:	83 ec 0c             	sub    $0xc,%esp
80105463:	53                   	push   %ebx
80105464:	e8 17 c5 ff ff       	call   80101980 <iunlockput>
    end_op();
80105469:	e8 62 d8 ff ff       	call   80102cd0 <end_op>
    return -1;
8010546e:	83 c4 10             	add    $0x10,%esp
80105471:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105476:	eb d7                	jmp    8010544f <sys_chdir+0x6f>
80105478:	90                   	nop
80105479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105480:	e8 4b d8 ff ff       	call   80102cd0 <end_op>
    return -1;
80105485:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010548a:	eb c3                	jmp    8010544f <sys_chdir+0x6f>
8010548c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105490 <sys_exec>:

int
sys_exec(void)
{
80105490:	55                   	push   %ebp
80105491:	89 e5                	mov    %esp,%ebp
80105493:	57                   	push   %edi
80105494:	56                   	push   %esi
80105495:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105496:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010549c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801054a2:	50                   	push   %eax
801054a3:	6a 00                	push   $0x0
801054a5:	e8 16 f5 ff ff       	call   801049c0 <argstr>
801054aa:	83 c4 10             	add    $0x10,%esp
801054ad:	85 c0                	test   %eax,%eax
801054af:	0f 88 87 00 00 00    	js     8010553c <sys_exec+0xac>
801054b5:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801054bb:	83 ec 08             	sub    $0x8,%esp
801054be:	50                   	push   %eax
801054bf:	6a 01                	push   $0x1
801054c1:	e8 4a f4 ff ff       	call   80104910 <argint>
801054c6:	83 c4 10             	add    $0x10,%esp
801054c9:	85 c0                	test   %eax,%eax
801054cb:	78 6f                	js     8010553c <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801054cd:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801054d3:	83 ec 04             	sub    $0x4,%esp
  for(i=0;; i++){
801054d6:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
801054d8:	68 80 00 00 00       	push   $0x80
801054dd:	6a 00                	push   $0x0
801054df:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801054e5:	50                   	push   %eax
801054e6:	e8 25 f1 ff ff       	call   80104610 <memset>
801054eb:	83 c4 10             	add    $0x10,%esp
801054ee:	eb 2c                	jmp    8010551c <sys_exec+0x8c>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
801054f0:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801054f6:	85 c0                	test   %eax,%eax
801054f8:	74 56                	je     80105550 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801054fa:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105500:	83 ec 08             	sub    $0x8,%esp
80105503:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105506:	52                   	push   %edx
80105507:	50                   	push   %eax
80105508:	e8 93 f3 ff ff       	call   801048a0 <fetchstr>
8010550d:	83 c4 10             	add    $0x10,%esp
80105510:	85 c0                	test   %eax,%eax
80105512:	78 28                	js     8010553c <sys_exec+0xac>
  for(i=0;; i++){
80105514:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
80105517:	83 fb 20             	cmp    $0x20,%ebx
8010551a:	74 20                	je     8010553c <sys_exec+0xac>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
8010551c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105522:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105529:	83 ec 08             	sub    $0x8,%esp
8010552c:	57                   	push   %edi
8010552d:	01 f0                	add    %esi,%eax
8010552f:	50                   	push   %eax
80105530:	e8 2b f3 ff ff       	call   80104860 <fetchint>
80105535:	83 c4 10             	add    $0x10,%esp
80105538:	85 c0                	test   %eax,%eax
8010553a:	79 b4                	jns    801054f0 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
8010553c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010553f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105544:	5b                   	pop    %ebx
80105545:	5e                   	pop    %esi
80105546:	5f                   	pop    %edi
80105547:	5d                   	pop    %ebp
80105548:	c3                   	ret    
80105549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
80105550:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105556:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
80105559:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105560:	00 00 00 00 
  return exec(path, argv);
80105564:	50                   	push   %eax
80105565:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010556b:	e8 e0 b4 ff ff       	call   80100a50 <exec>
80105570:	83 c4 10             	add    $0x10,%esp
}
80105573:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105576:	5b                   	pop    %ebx
80105577:	5e                   	pop    %esi
80105578:	5f                   	pop    %edi
80105579:	5d                   	pop    %ebp
8010557a:	c3                   	ret    
8010557b:	90                   	nop
8010557c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105580 <sys_pipe>:

int
sys_pipe(void)
{
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	57                   	push   %edi
80105584:	56                   	push   %esi
80105585:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105586:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105589:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010558c:	6a 08                	push   $0x8
8010558e:	50                   	push   %eax
8010558f:	6a 00                	push   $0x0
80105591:	e8 ca f3 ff ff       	call   80104960 <argptr>
80105596:	83 c4 10             	add    $0x10,%esp
80105599:	85 c0                	test   %eax,%eax
8010559b:	0f 88 ae 00 00 00    	js     8010564f <sys_pipe+0xcf>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801055a1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801055a4:	83 ec 08             	sub    $0x8,%esp
801055a7:	50                   	push   %eax
801055a8:	8d 45 e0             	lea    -0x20(%ebp),%eax
801055ab:	50                   	push   %eax
801055ac:	e8 4f dd ff ff       	call   80103300 <pipealloc>
801055b1:	83 c4 10             	add    $0x10,%esp
801055b4:	85 c0                	test   %eax,%eax
801055b6:	0f 88 93 00 00 00    	js     8010564f <sys_pipe+0xcf>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801055bc:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
801055bf:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
801055c1:	e8 fa e2 ff ff       	call   801038c0 <myproc>
801055c6:	eb 10                	jmp    801055d8 <sys_pipe+0x58>
801055c8:	90                   	nop
801055c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(fd = 0; fd < NOFILE; fd++){
801055d0:	83 c3 01             	add    $0x1,%ebx
801055d3:	83 fb 10             	cmp    $0x10,%ebx
801055d6:	74 60                	je     80105638 <sys_pipe+0xb8>
    if(curproc->ofile[fd] == 0){
801055d8:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801055dc:	85 f6                	test   %esi,%esi
801055de:	75 f0                	jne    801055d0 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
801055e0:	8d 73 08             	lea    0x8(%ebx),%esi
801055e3:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801055e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
801055ea:	e8 d1 e2 ff ff       	call   801038c0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801055ef:	31 d2                	xor    %edx,%edx
801055f1:	eb 0d                	jmp    80105600 <sys_pipe+0x80>
801055f3:	90                   	nop
801055f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801055f8:	83 c2 01             	add    $0x1,%edx
801055fb:	83 fa 10             	cmp    $0x10,%edx
801055fe:	74 28                	je     80105628 <sys_pipe+0xa8>
    if(curproc->ofile[fd] == 0){
80105600:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105604:	85 c9                	test   %ecx,%ecx
80105606:	75 f0                	jne    801055f8 <sys_pipe+0x78>
      curproc->ofile[fd] = f;
80105608:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
8010560c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010560f:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80105611:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105614:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
80105617:	31 c0                	xor    %eax,%eax
}
80105619:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010561c:	5b                   	pop    %ebx
8010561d:	5e                   	pop    %esi
8010561e:	5f                   	pop    %edi
8010561f:	5d                   	pop    %ebp
80105620:	c3                   	ret    
80105621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
80105628:	e8 93 e2 ff ff       	call   801038c0 <myproc>
8010562d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105634:	00 
80105635:	8d 76 00             	lea    0x0(%esi),%esi
    fileclose(rf);
80105638:	83 ec 0c             	sub    $0xc,%esp
8010563b:	ff 75 e0             	pushl  -0x20(%ebp)
8010563e:	e8 6d b8 ff ff       	call   80100eb0 <fileclose>
    fileclose(wf);
80105643:	58                   	pop    %eax
80105644:	ff 75 e4             	pushl  -0x1c(%ebp)
80105647:	e8 64 b8 ff ff       	call   80100eb0 <fileclose>
    return -1;
8010564c:	83 c4 10             	add    $0x10,%esp
8010564f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105654:	eb c3                	jmp    80105619 <sys_pipe+0x99>
80105656:	66 90                	xchg   %ax,%ax
80105658:	66 90                	xchg   %ax,%ax
8010565a:	66 90                	xchg   %ax,%ax
8010565c:	66 90                	xchg   %ax,%ax
8010565e:	66 90                	xchg   %ax,%ax

80105660 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105660:	55                   	push   %ebp
80105661:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105663:	5d                   	pop    %ebp
  return fork();
80105664:	e9 f7 e3 ff ff       	jmp    80103a60 <fork>
80105669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105670 <sys_exit>:

int
sys_exit(void)
{
80105670:	55                   	push   %ebp
80105671:	89 e5                	mov    %esp,%ebp
80105673:	83 ec 08             	sub    $0x8,%esp
  exit();
80105676:	e8 25 e7 ff ff       	call   80103da0 <exit>
  return 0;  // not reached
}
8010567b:	31 c0                	xor    %eax,%eax
8010567d:	c9                   	leave  
8010567e:	c3                   	ret    
8010567f:	90                   	nop

80105680 <sys_wait>:

int
sys_wait(void)
{
80105680:	55                   	push   %ebp
80105681:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105683:	5d                   	pop    %ebp
  return wait();
80105684:	e9 57 e9 ff ff       	jmp    80103fe0 <wait>
80105689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105690 <sys_kill>:

int
sys_kill(void)
{
80105690:	55                   	push   %ebp
80105691:	89 e5                	mov    %esp,%ebp
80105693:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105696:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105699:	50                   	push   %eax
8010569a:	6a 00                	push   $0x0
8010569c:	e8 6f f2 ff ff       	call   80104910 <argint>
801056a1:	83 c4 10             	add    $0x10,%esp
801056a4:	85 c0                	test   %eax,%eax
801056a6:	78 18                	js     801056c0 <sys_kill+0x30>
    return -1;
  return kill(pid);
801056a8:	83 ec 0c             	sub    $0xc,%esp
801056ab:	ff 75 f4             	pushl  -0xc(%ebp)
801056ae:	e8 7d ea ff ff       	call   80104130 <kill>
801056b3:	83 c4 10             	add    $0x10,%esp
}
801056b6:	c9                   	leave  
801056b7:	c3                   	ret    
801056b8:	90                   	nop
801056b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801056c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801056c5:	c9                   	leave  
801056c6:	c3                   	ret    
801056c7:	89 f6                	mov    %esi,%esi
801056c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801056d0 <sys_getpid>:

int
sys_getpid(void)
{
801056d0:	55                   	push   %ebp
801056d1:	89 e5                	mov    %esp,%ebp
801056d3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801056d6:	e8 e5 e1 ff ff       	call   801038c0 <myproc>
801056db:	8b 40 10             	mov    0x10(%eax),%eax
}
801056de:	c9                   	leave  
801056df:	c3                   	ret    

801056e0 <sys_sbrk>:

int
sys_sbrk(void)
{
801056e0:	55                   	push   %ebp
801056e1:	89 e5                	mov    %esp,%ebp
801056e3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
801056e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801056e7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801056ea:	50                   	push   %eax
801056eb:	6a 00                	push   $0x0
801056ed:	e8 1e f2 ff ff       	call   80104910 <argint>
801056f2:	83 c4 10             	add    $0x10,%esp
801056f5:	85 c0                	test   %eax,%eax
801056f7:	78 27                	js     80105720 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
801056f9:	e8 c2 e1 ff ff       	call   801038c0 <myproc>
  if(growproc(n) < 0)
801056fe:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
80105701:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105703:	ff 75 f4             	pushl  -0xc(%ebp)
80105706:	e8 d5 e2 ff ff       	call   801039e0 <growproc>
8010570b:	83 c4 10             	add    $0x10,%esp
8010570e:	85 c0                	test   %eax,%eax
80105710:	78 0e                	js     80105720 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80105712:	89 d8                	mov    %ebx,%eax
80105714:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105717:	c9                   	leave  
80105718:	c3                   	ret    
80105719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105720:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105725:	eb eb                	jmp    80105712 <sys_sbrk+0x32>
80105727:	89 f6                	mov    %esi,%esi
80105729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105730 <sys_sleep>:

int
sys_sleep(void)
{
80105730:	55                   	push   %ebp
80105731:	89 e5                	mov    %esp,%ebp
80105733:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105734:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105737:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010573a:	50                   	push   %eax
8010573b:	6a 00                	push   $0x0
8010573d:	e8 ce f1 ff ff       	call   80104910 <argint>
80105742:	83 c4 10             	add    $0x10,%esp
80105745:	85 c0                	test   %eax,%eax
80105747:	0f 88 8a 00 00 00    	js     801057d7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010574d:	83 ec 0c             	sub    $0xc,%esp
80105750:	68 40 57 11 80       	push   $0x80115740
80105755:	e8 a6 ed ff ff       	call   80104500 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010575a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010575d:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105760:	8b 1d 80 5f 11 80    	mov    0x80115f80,%ebx
  while(ticks - ticks0 < n){
80105766:	85 d2                	test   %edx,%edx
80105768:	75 27                	jne    80105791 <sys_sleep+0x61>
8010576a:	eb 54                	jmp    801057c0 <sys_sleep+0x90>
8010576c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105770:	83 ec 08             	sub    $0x8,%esp
80105773:	68 40 57 11 80       	push   $0x80115740
80105778:	68 80 5f 11 80       	push   $0x80115f80
8010577d:	e8 9e e7 ff ff       	call   80103f20 <sleep>
  while(ticks - ticks0 < n){
80105782:	a1 80 5f 11 80       	mov    0x80115f80,%eax
80105787:	83 c4 10             	add    $0x10,%esp
8010578a:	29 d8                	sub    %ebx,%eax
8010578c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010578f:	73 2f                	jae    801057c0 <sys_sleep+0x90>
    if(myproc()->killed){
80105791:	e8 2a e1 ff ff       	call   801038c0 <myproc>
80105796:	8b 40 24             	mov    0x24(%eax),%eax
80105799:	85 c0                	test   %eax,%eax
8010579b:	74 d3                	je     80105770 <sys_sleep+0x40>
      release(&tickslock);
8010579d:	83 ec 0c             	sub    $0xc,%esp
801057a0:	68 40 57 11 80       	push   $0x80115740
801057a5:	e8 16 ee ff ff       	call   801045c0 <release>
      return -1;
801057aa:	83 c4 10             	add    $0x10,%esp
801057ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
801057b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057b5:	c9                   	leave  
801057b6:	c3                   	ret    
801057b7:	89 f6                	mov    %esi,%esi
801057b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
801057c0:	83 ec 0c             	sub    $0xc,%esp
801057c3:	68 40 57 11 80       	push   $0x80115740
801057c8:	e8 f3 ed ff ff       	call   801045c0 <release>
  return 0;
801057cd:	83 c4 10             	add    $0x10,%esp
801057d0:	31 c0                	xor    %eax,%eax
}
801057d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057d5:	c9                   	leave  
801057d6:	c3                   	ret    
    return -1;
801057d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057dc:	eb f4                	jmp    801057d2 <sys_sleep+0xa2>
801057de:	66 90                	xchg   %ax,%ax

801057e0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801057e0:	55                   	push   %ebp
801057e1:	89 e5                	mov    %esp,%ebp
801057e3:	53                   	push   %ebx
801057e4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
801057e7:	68 40 57 11 80       	push   $0x80115740
801057ec:	e8 0f ed ff ff       	call   80104500 <acquire>
  xticks = ticks;
801057f1:	8b 1d 80 5f 11 80    	mov    0x80115f80,%ebx
  release(&tickslock);
801057f7:	c7 04 24 40 57 11 80 	movl   $0x80115740,(%esp)
801057fe:	e8 bd ed ff ff       	call   801045c0 <release>
  return xticks;
}
80105803:	89 d8                	mov    %ebx,%eax
80105805:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105808:	c9                   	leave  
80105809:	c3                   	ret    
8010580a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105810 <sys_gettime>:

int
sys_gettime(void) {
80105810:	55                   	push   %ebp
80105811:	89 e5                	mov    %esp,%ebp
80105813:	83 ec 1c             	sub    $0x1c,%esp
  struct rtcdate *d;
  if (argptr(0, (char **)&d, sizeof(struct rtcdate)) < 0)
80105816:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105819:	6a 18                	push   $0x18
8010581b:	50                   	push   %eax
8010581c:	6a 00                	push   $0x0
8010581e:	e8 3d f1 ff ff       	call   80104960 <argptr>
80105823:	83 c4 10             	add    $0x10,%esp
80105826:	85 c0                	test   %eax,%eax
80105828:	78 16                	js     80105840 <sys_gettime+0x30>
      return -1;
  cmostime(d);
8010582a:	83 ec 0c             	sub    $0xc,%esp
8010582d:	ff 75 f4             	pushl  -0xc(%ebp)
80105830:	e8 4b d0 ff ff       	call   80102880 <cmostime>
  return 0;
80105835:	83 c4 10             	add    $0x10,%esp
80105838:	31 c0                	xor    %eax,%eax
}
8010583a:	c9                   	leave  
8010583b:	c3                   	ret    
8010583c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80105840:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105845:	c9                   	leave  
80105846:	c3                   	ret    
80105847:	89 f6                	mov    %esi,%esi
80105849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105850 <sys_settickets>:

int
sys_settickets(void) {
80105850:	55                   	push   %ebp
80105851:	89 e5                	mov    %esp,%ebp
80105853:	83 ec 20             	sub    $0x20,%esp
  struct proc *proc;
  int n;
  if(argint(0, &n) < 0) {
80105856:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105859:	50                   	push   %eax
8010585a:	6a 00                	push   $0x0
8010585c:	e8 af f0 ff ff       	call   80104910 <argint>
  }
  else {
    proc->tickets = n;
  }
  return 0;
}
80105861:	31 c0                	xor    %eax,%eax
80105863:	c9                   	leave  
80105864:	c3                   	ret    
80105865:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105870 <sys_getreadcount>:

int
sys_getreadcount(void){
80105870:	55                   	push   %ebp
80105871:	89 e5                	mov    %esp,%ebp
  return getreadcount();
}
80105873:	5d                   	pop    %ebp
  return getreadcount();
80105874:	e9 87 f1 ff ff       	jmp    80104a00 <getreadcount>

80105879 <alltraps>:
80105879:	1e                   	push   %ds
8010587a:	06                   	push   %es
8010587b:	0f a0                	push   %fs
8010587d:	0f a8                	push   %gs
8010587f:	60                   	pusha  
80105880:	66 b8 10 00          	mov    $0x10,%ax
80105884:	8e d8                	mov    %eax,%ds
80105886:	8e c0                	mov    %eax,%es
80105888:	54                   	push   %esp
80105889:	e8 c2 00 00 00       	call   80105950 <trap>
8010588e:	83 c4 04             	add    $0x4,%esp

80105891 <trapret>:
80105891:	61                   	popa   
80105892:	0f a9                	pop    %gs
80105894:	0f a1                	pop    %fs
80105896:	07                   	pop    %es
80105897:	1f                   	pop    %ds
80105898:	83 c4 08             	add    $0x8,%esp
8010589b:	cf                   	iret   
8010589c:	66 90                	xchg   %ax,%ax
8010589e:	66 90                	xchg   %ax,%ax

801058a0 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801058a0:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
801058a1:	31 c0                	xor    %eax,%eax
{
801058a3:	89 e5                	mov    %esp,%ebp
801058a5:	83 ec 08             	sub    $0x8,%esp
801058a8:	90                   	nop
801058a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801058b0:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801058b7:	c7 04 c5 82 57 11 80 	movl   $0x8e000008,-0x7feea87e(,%eax,8)
801058be:	08 00 00 8e 
801058c2:	66 89 14 c5 80 57 11 	mov    %dx,-0x7feea880(,%eax,8)
801058c9:	80 
801058ca:	c1 ea 10             	shr    $0x10,%edx
801058cd:	66 89 14 c5 86 57 11 	mov    %dx,-0x7feea87a(,%eax,8)
801058d4:	80 
  for(i = 0; i < 256; i++)
801058d5:	83 c0 01             	add    $0x1,%eax
801058d8:	3d 00 01 00 00       	cmp    $0x100,%eax
801058dd:	75 d1                	jne    801058b0 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058df:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
801058e4:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058e7:	c7 05 82 59 11 80 08 	movl   $0xef000008,0x80115982
801058ee:	00 00 ef 
  initlock(&tickslock, "time");
801058f1:	68 85 7a 10 80       	push   $0x80107a85
801058f6:	68 40 57 11 80       	push   $0x80115740
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058fb:	66 a3 80 59 11 80    	mov    %ax,0x80115980
80105901:	c1 e8 10             	shr    $0x10,%eax
80105904:	66 a3 86 59 11 80    	mov    %ax,0x80115986
  initlock(&tickslock, "time");
8010590a:	e8 b1 ea ff ff       	call   801043c0 <initlock>
}
8010590f:	83 c4 10             	add    $0x10,%esp
80105912:	c9                   	leave  
80105913:	c3                   	ret    
80105914:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010591a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105920 <idtinit>:

void
idtinit(void)
{
80105920:	55                   	push   %ebp
  pd[0] = size-1;
80105921:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105926:	89 e5                	mov    %esp,%ebp
80105928:	83 ec 10             	sub    $0x10,%esp
8010592b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010592f:	b8 80 57 11 80       	mov    $0x80115780,%eax
80105934:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105938:	c1 e8 10             	shr    $0x10,%eax
8010593b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
8010593f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105942:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105945:	c9                   	leave  
80105946:	c3                   	ret    
80105947:	89 f6                	mov    %esi,%esi
80105949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105950 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105950:	55                   	push   %ebp
80105951:	89 e5                	mov    %esp,%ebp
80105953:	57                   	push   %edi
80105954:	56                   	push   %esi
80105955:	53                   	push   %ebx
80105956:	83 ec 1c             	sub    $0x1c,%esp
80105959:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
8010595c:	8b 47 30             	mov    0x30(%edi),%eax
8010595f:	83 f8 40             	cmp    $0x40,%eax
80105962:	0f 84 f0 00 00 00    	je     80105a58 <trap+0x108>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105968:	83 e8 20             	sub    $0x20,%eax
8010596b:	83 f8 1f             	cmp    $0x1f,%eax
8010596e:	77 10                	ja     80105980 <trap+0x30>
80105970:	ff 24 85 2c 7b 10 80 	jmp    *-0x7fef84d4(,%eax,4)
80105977:	89 f6                	mov    %esi,%esi
80105979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105980:	e8 3b df ff ff       	call   801038c0 <myproc>
80105985:	85 c0                	test   %eax,%eax
80105987:	8b 5f 38             	mov    0x38(%edi),%ebx
8010598a:	0f 84 14 02 00 00    	je     80105ba4 <trap+0x254>
80105990:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105994:	0f 84 0a 02 00 00    	je     80105ba4 <trap+0x254>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
8010599a:	0f 20 d1             	mov    %cr2,%ecx
8010599d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059a0:	e8 fb de ff ff       	call   801038a0 <cpuid>
801059a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
801059a8:	8b 47 34             	mov    0x34(%edi),%eax
801059ab:	8b 77 30             	mov    0x30(%edi),%esi
801059ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
801059b1:	e8 0a df ff ff       	call   801038c0 <myproc>
801059b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801059b9:	e8 02 df ff ff       	call   801038c0 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059be:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801059c1:	8b 55 dc             	mov    -0x24(%ebp),%edx
801059c4:	51                   	push   %ecx
801059c5:	53                   	push   %ebx
801059c6:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
801059c7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059ca:	ff 75 e4             	pushl  -0x1c(%ebp)
801059cd:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
801059ce:	83 c2 6c             	add    $0x6c,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801059d1:	52                   	push   %edx
801059d2:	ff 70 10             	pushl  0x10(%eax)
801059d5:	68 e8 7a 10 80       	push   $0x80107ae8
801059da:	e8 81 ac ff ff       	call   80100660 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
801059df:	83 c4 20             	add    $0x20,%esp
801059e2:	e8 d9 de ff ff       	call   801038c0 <myproc>
801059e7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801059ee:	e8 cd de ff ff       	call   801038c0 <myproc>
801059f3:	85 c0                	test   %eax,%eax
801059f5:	74 1d                	je     80105a14 <trap+0xc4>
801059f7:	e8 c4 de ff ff       	call   801038c0 <myproc>
801059fc:	8b 50 24             	mov    0x24(%eax),%edx
801059ff:	85 d2                	test   %edx,%edx
80105a01:	74 11                	je     80105a14 <trap+0xc4>
80105a03:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105a07:	83 e0 03             	and    $0x3,%eax
80105a0a:	66 83 f8 03          	cmp    $0x3,%ax
80105a0e:	0f 84 4c 01 00 00    	je     80105b60 <trap+0x210>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105a14:	e8 a7 de ff ff       	call   801038c0 <myproc>
80105a19:	85 c0                	test   %eax,%eax
80105a1b:	74 0b                	je     80105a28 <trap+0xd8>
80105a1d:	e8 9e de ff ff       	call   801038c0 <myproc>
80105a22:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105a26:	74 68                	je     80105a90 <trap+0x140>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105a28:	e8 93 de ff ff       	call   801038c0 <myproc>
80105a2d:	85 c0                	test   %eax,%eax
80105a2f:	74 19                	je     80105a4a <trap+0xfa>
80105a31:	e8 8a de ff ff       	call   801038c0 <myproc>
80105a36:	8b 40 24             	mov    0x24(%eax),%eax
80105a39:	85 c0                	test   %eax,%eax
80105a3b:	74 0d                	je     80105a4a <trap+0xfa>
80105a3d:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105a41:	83 e0 03             	and    $0x3,%eax
80105a44:	66 83 f8 03          	cmp    $0x3,%ax
80105a48:	74 37                	je     80105a81 <trap+0x131>
    exit();
}
80105a4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a4d:	5b                   	pop    %ebx
80105a4e:	5e                   	pop    %esi
80105a4f:	5f                   	pop    %edi
80105a50:	5d                   	pop    %ebp
80105a51:	c3                   	ret    
80105a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(myproc()->killed)
80105a58:	e8 63 de ff ff       	call   801038c0 <myproc>
80105a5d:	8b 58 24             	mov    0x24(%eax),%ebx
80105a60:	85 db                	test   %ebx,%ebx
80105a62:	0f 85 e8 00 00 00    	jne    80105b50 <trap+0x200>
    myproc()->tf = tf;
80105a68:	e8 53 de ff ff       	call   801038c0 <myproc>
80105a6d:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105a70:	e8 9b ef ff ff       	call   80104a10 <syscall>
    if(myproc()->killed)
80105a75:	e8 46 de ff ff       	call   801038c0 <myproc>
80105a7a:	8b 48 24             	mov    0x24(%eax),%ecx
80105a7d:	85 c9                	test   %ecx,%ecx
80105a7f:	74 c9                	je     80105a4a <trap+0xfa>
}
80105a81:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a84:	5b                   	pop    %ebx
80105a85:	5e                   	pop    %esi
80105a86:	5f                   	pop    %edi
80105a87:	5d                   	pop    %ebp
      exit();
80105a88:	e9 13 e3 ff ff       	jmp    80103da0 <exit>
80105a8d:	8d 76 00             	lea    0x0(%esi),%esi
  if(myproc() && myproc()->state == RUNNING &&
80105a90:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105a94:	75 92                	jne    80105a28 <trap+0xd8>
    yield();
80105a96:	e8 35 e4 ff ff       	call   80103ed0 <yield>
80105a9b:	eb 8b                	jmp    80105a28 <trap+0xd8>
80105a9d:	8d 76 00             	lea    0x0(%esi),%esi
    if(cpuid() == 0){
80105aa0:	e8 fb dd ff ff       	call   801038a0 <cpuid>
80105aa5:	85 c0                	test   %eax,%eax
80105aa7:	0f 84 c3 00 00 00    	je     80105b70 <trap+0x220>
    lapiceoi();
80105aad:	e8 0e cd ff ff       	call   801027c0 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105ab2:	e8 09 de ff ff       	call   801038c0 <myproc>
80105ab7:	85 c0                	test   %eax,%eax
80105ab9:	0f 85 38 ff ff ff    	jne    801059f7 <trap+0xa7>
80105abf:	e9 50 ff ff ff       	jmp    80105a14 <trap+0xc4>
80105ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
80105ac8:	e8 b3 cb ff ff       	call   80102680 <kbdintr>
    lapiceoi();
80105acd:	e8 ee cc ff ff       	call   801027c0 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105ad2:	e8 e9 dd ff ff       	call   801038c0 <myproc>
80105ad7:	85 c0                	test   %eax,%eax
80105ad9:	0f 85 18 ff ff ff    	jne    801059f7 <trap+0xa7>
80105adf:	e9 30 ff ff ff       	jmp    80105a14 <trap+0xc4>
80105ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80105ae8:	e8 53 02 00 00       	call   80105d40 <uartintr>
    lapiceoi();
80105aed:	e8 ce cc ff ff       	call   801027c0 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105af2:	e8 c9 dd ff ff       	call   801038c0 <myproc>
80105af7:	85 c0                	test   %eax,%eax
80105af9:	0f 85 f8 fe ff ff    	jne    801059f7 <trap+0xa7>
80105aff:	e9 10 ff ff ff       	jmp    80105a14 <trap+0xc4>
80105b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105b08:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105b0c:	8b 77 38             	mov    0x38(%edi),%esi
80105b0f:	e8 8c dd ff ff       	call   801038a0 <cpuid>
80105b14:	56                   	push   %esi
80105b15:	53                   	push   %ebx
80105b16:	50                   	push   %eax
80105b17:	68 90 7a 10 80       	push   $0x80107a90
80105b1c:	e8 3f ab ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105b21:	e8 9a cc ff ff       	call   801027c0 <lapiceoi>
    break;
80105b26:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105b29:	e8 92 dd ff ff       	call   801038c0 <myproc>
80105b2e:	85 c0                	test   %eax,%eax
80105b30:	0f 85 c1 fe ff ff    	jne    801059f7 <trap+0xa7>
80105b36:	e9 d9 fe ff ff       	jmp    80105a14 <trap+0xc4>
80105b3b:	90                   	nop
80105b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ideintr();
80105b40:	e8 ab c5 ff ff       	call   801020f0 <ideintr>
80105b45:	e9 63 ff ff ff       	jmp    80105aad <trap+0x15d>
80105b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
80105b50:	e8 4b e2 ff ff       	call   80103da0 <exit>
80105b55:	e9 0e ff ff ff       	jmp    80105a68 <trap+0x118>
80105b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
80105b60:	e8 3b e2 ff ff       	call   80103da0 <exit>
80105b65:	e9 aa fe ff ff       	jmp    80105a14 <trap+0xc4>
80105b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
80105b70:	83 ec 0c             	sub    $0xc,%esp
80105b73:	68 40 57 11 80       	push   $0x80115740
80105b78:	e8 83 e9 ff ff       	call   80104500 <acquire>
      wakeup(&ticks);
80105b7d:	c7 04 24 80 5f 11 80 	movl   $0x80115f80,(%esp)
      ticks++;
80105b84:	83 05 80 5f 11 80 01 	addl   $0x1,0x80115f80
      wakeup(&ticks);
80105b8b:	e8 40 e5 ff ff       	call   801040d0 <wakeup>
      release(&tickslock);
80105b90:	c7 04 24 40 57 11 80 	movl   $0x80115740,(%esp)
80105b97:	e8 24 ea ff ff       	call   801045c0 <release>
80105b9c:	83 c4 10             	add    $0x10,%esp
80105b9f:	e9 09 ff ff ff       	jmp    80105aad <trap+0x15d>
80105ba4:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105ba7:	e8 f4 dc ff ff       	call   801038a0 <cpuid>
80105bac:	83 ec 0c             	sub    $0xc,%esp
80105baf:	56                   	push   %esi
80105bb0:	53                   	push   %ebx
80105bb1:	50                   	push   %eax
80105bb2:	ff 77 30             	pushl  0x30(%edi)
80105bb5:	68 b4 7a 10 80       	push   $0x80107ab4
80105bba:	e8 a1 aa ff ff       	call   80100660 <cprintf>
      panic("trap");
80105bbf:	83 c4 14             	add    $0x14,%esp
80105bc2:	68 8a 7a 10 80       	push   $0x80107a8a
80105bc7:	e8 c4 a7 ff ff       	call   80100390 <panic>
80105bcc:	66 90                	xchg   %ax,%ax
80105bce:	66 90                	xchg   %ax,%ax

80105bd0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105bd0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
{
80105bd5:	55                   	push   %ebp
80105bd6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105bd8:	85 c0                	test   %eax,%eax
80105bda:	74 1c                	je     80105bf8 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105bdc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105be1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105be2:	a8 01                	test   $0x1,%al
80105be4:	74 12                	je     80105bf8 <uartgetc+0x28>
80105be6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105beb:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105bec:	0f b6 c0             	movzbl %al,%eax
}
80105bef:	5d                   	pop    %ebp
80105bf0:	c3                   	ret    
80105bf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105bf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105bfd:	5d                   	pop    %ebp
80105bfe:	c3                   	ret    
80105bff:	90                   	nop

80105c00 <uartputc.part.0>:
uartputc(int c)
80105c00:	55                   	push   %ebp
80105c01:	89 e5                	mov    %esp,%ebp
80105c03:	57                   	push   %edi
80105c04:	56                   	push   %esi
80105c05:	53                   	push   %ebx
80105c06:	89 c7                	mov    %eax,%edi
80105c08:	bb 80 00 00 00       	mov    $0x80,%ebx
80105c0d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105c12:	83 ec 0c             	sub    $0xc,%esp
80105c15:	eb 1b                	jmp    80105c32 <uartputc.part.0+0x32>
80105c17:	89 f6                	mov    %esi,%esi
80105c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
80105c20:	83 ec 0c             	sub    $0xc,%esp
80105c23:	6a 0a                	push   $0xa
80105c25:	e8 b6 cb ff ff       	call   801027e0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105c2a:	83 c4 10             	add    $0x10,%esp
80105c2d:	83 eb 01             	sub    $0x1,%ebx
80105c30:	74 07                	je     80105c39 <uartputc.part.0+0x39>
80105c32:	89 f2                	mov    %esi,%edx
80105c34:	ec                   	in     (%dx),%al
80105c35:	a8 20                	test   $0x20,%al
80105c37:	74 e7                	je     80105c20 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105c39:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c3e:	89 f8                	mov    %edi,%eax
80105c40:	ee                   	out    %al,(%dx)
}
80105c41:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c44:	5b                   	pop    %ebx
80105c45:	5e                   	pop    %esi
80105c46:	5f                   	pop    %edi
80105c47:	5d                   	pop    %ebp
80105c48:	c3                   	ret    
80105c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105c50 <uartinit>:
{
80105c50:	55                   	push   %ebp
80105c51:	31 c9                	xor    %ecx,%ecx
80105c53:	89 c8                	mov    %ecx,%eax
80105c55:	89 e5                	mov    %esp,%ebp
80105c57:	57                   	push   %edi
80105c58:	56                   	push   %esi
80105c59:	53                   	push   %ebx
80105c5a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105c5f:	89 da                	mov    %ebx,%edx
80105c61:	83 ec 0c             	sub    $0xc,%esp
80105c64:	ee                   	out    %al,(%dx)
80105c65:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105c6a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105c6f:	89 fa                	mov    %edi,%edx
80105c71:	ee                   	out    %al,(%dx)
80105c72:	b8 0c 00 00 00       	mov    $0xc,%eax
80105c77:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c7c:	ee                   	out    %al,(%dx)
80105c7d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105c82:	89 c8                	mov    %ecx,%eax
80105c84:	89 f2                	mov    %esi,%edx
80105c86:	ee                   	out    %al,(%dx)
80105c87:	b8 03 00 00 00       	mov    $0x3,%eax
80105c8c:	89 fa                	mov    %edi,%edx
80105c8e:	ee                   	out    %al,(%dx)
80105c8f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105c94:	89 c8                	mov    %ecx,%eax
80105c96:	ee                   	out    %al,(%dx)
80105c97:	b8 01 00 00 00       	mov    $0x1,%eax
80105c9c:	89 f2                	mov    %esi,%edx
80105c9e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105c9f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ca4:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105ca5:	3c ff                	cmp    $0xff,%al
80105ca7:	74 5a                	je     80105d03 <uartinit+0xb3>
  uart = 1;
80105ca9:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105cb0:	00 00 00 
80105cb3:	89 da                	mov    %ebx,%edx
80105cb5:	ec                   	in     (%dx),%al
80105cb6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cbb:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105cbc:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
80105cbf:	bb ac 7b 10 80       	mov    $0x80107bac,%ebx
  ioapicenable(IRQ_COM1, 0);
80105cc4:	6a 00                	push   $0x0
80105cc6:	6a 04                	push   $0x4
80105cc8:	e8 73 c6 ff ff       	call   80102340 <ioapicenable>
80105ccd:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80105cd0:	b8 78 00 00 00       	mov    $0x78,%eax
80105cd5:	eb 13                	jmp    80105cea <uartinit+0x9a>
80105cd7:	89 f6                	mov    %esi,%esi
80105cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ce0:	83 c3 01             	add    $0x1,%ebx
80105ce3:	0f be 03             	movsbl (%ebx),%eax
80105ce6:	84 c0                	test   %al,%al
80105ce8:	74 19                	je     80105d03 <uartinit+0xb3>
  if(!uart)
80105cea:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105cf0:	85 d2                	test   %edx,%edx
80105cf2:	74 ec                	je     80105ce0 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80105cf4:	83 c3 01             	add    $0x1,%ebx
80105cf7:	e8 04 ff ff ff       	call   80105c00 <uartputc.part.0>
80105cfc:	0f be 03             	movsbl (%ebx),%eax
80105cff:	84 c0                	test   %al,%al
80105d01:	75 e7                	jne    80105cea <uartinit+0x9a>
}
80105d03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d06:	5b                   	pop    %ebx
80105d07:	5e                   	pop    %esi
80105d08:	5f                   	pop    %edi
80105d09:	5d                   	pop    %ebp
80105d0a:	c3                   	ret    
80105d0b:	90                   	nop
80105d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105d10 <uartputc>:
  if(!uart)
80105d10:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
{
80105d16:	55                   	push   %ebp
80105d17:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105d19:	85 d2                	test   %edx,%edx
{
80105d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105d1e:	74 10                	je     80105d30 <uartputc+0x20>
}
80105d20:	5d                   	pop    %ebp
80105d21:	e9 da fe ff ff       	jmp    80105c00 <uartputc.part.0>
80105d26:	8d 76 00             	lea    0x0(%esi),%esi
80105d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105d30:	5d                   	pop    %ebp
80105d31:	c3                   	ret    
80105d32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d40 <uartintr>:

void
uartintr(void)
{
80105d40:	55                   	push   %ebp
80105d41:	89 e5                	mov    %esp,%ebp
80105d43:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105d46:	68 d0 5b 10 80       	push   $0x80105bd0
80105d4b:	e8 00 ab ff ff       	call   80100850 <consoleintr>
}
80105d50:	83 c4 10             	add    $0x10,%esp
80105d53:	c9                   	leave  
80105d54:	c3                   	ret    

80105d55 <vector0>:
80105d55:	6a 00                	push   $0x0
80105d57:	6a 00                	push   $0x0
80105d59:	e9 1b fb ff ff       	jmp    80105879 <alltraps>

80105d5e <vector1>:
80105d5e:	6a 00                	push   $0x0
80105d60:	6a 01                	push   $0x1
80105d62:	e9 12 fb ff ff       	jmp    80105879 <alltraps>

80105d67 <vector2>:
80105d67:	6a 00                	push   $0x0
80105d69:	6a 02                	push   $0x2
80105d6b:	e9 09 fb ff ff       	jmp    80105879 <alltraps>

80105d70 <vector3>:
80105d70:	6a 00                	push   $0x0
80105d72:	6a 03                	push   $0x3
80105d74:	e9 00 fb ff ff       	jmp    80105879 <alltraps>

80105d79 <vector4>:
80105d79:	6a 00                	push   $0x0
80105d7b:	6a 04                	push   $0x4
80105d7d:	e9 f7 fa ff ff       	jmp    80105879 <alltraps>

80105d82 <vector5>:
80105d82:	6a 00                	push   $0x0
80105d84:	6a 05                	push   $0x5
80105d86:	e9 ee fa ff ff       	jmp    80105879 <alltraps>

80105d8b <vector6>:
80105d8b:	6a 00                	push   $0x0
80105d8d:	6a 06                	push   $0x6
80105d8f:	e9 e5 fa ff ff       	jmp    80105879 <alltraps>

80105d94 <vector7>:
80105d94:	6a 00                	push   $0x0
80105d96:	6a 07                	push   $0x7
80105d98:	e9 dc fa ff ff       	jmp    80105879 <alltraps>

80105d9d <vector8>:
80105d9d:	6a 08                	push   $0x8
80105d9f:	e9 d5 fa ff ff       	jmp    80105879 <alltraps>

80105da4 <vector9>:
80105da4:	6a 00                	push   $0x0
80105da6:	6a 09                	push   $0x9
80105da8:	e9 cc fa ff ff       	jmp    80105879 <alltraps>

80105dad <vector10>:
80105dad:	6a 0a                	push   $0xa
80105daf:	e9 c5 fa ff ff       	jmp    80105879 <alltraps>

80105db4 <vector11>:
80105db4:	6a 0b                	push   $0xb
80105db6:	e9 be fa ff ff       	jmp    80105879 <alltraps>

80105dbb <vector12>:
80105dbb:	6a 0c                	push   $0xc
80105dbd:	e9 b7 fa ff ff       	jmp    80105879 <alltraps>

80105dc2 <vector13>:
80105dc2:	6a 0d                	push   $0xd
80105dc4:	e9 b0 fa ff ff       	jmp    80105879 <alltraps>

80105dc9 <vector14>:
80105dc9:	6a 0e                	push   $0xe
80105dcb:	e9 a9 fa ff ff       	jmp    80105879 <alltraps>

80105dd0 <vector15>:
80105dd0:	6a 00                	push   $0x0
80105dd2:	6a 0f                	push   $0xf
80105dd4:	e9 a0 fa ff ff       	jmp    80105879 <alltraps>

80105dd9 <vector16>:
80105dd9:	6a 00                	push   $0x0
80105ddb:	6a 10                	push   $0x10
80105ddd:	e9 97 fa ff ff       	jmp    80105879 <alltraps>

80105de2 <vector17>:
80105de2:	6a 11                	push   $0x11
80105de4:	e9 90 fa ff ff       	jmp    80105879 <alltraps>

80105de9 <vector18>:
80105de9:	6a 00                	push   $0x0
80105deb:	6a 12                	push   $0x12
80105ded:	e9 87 fa ff ff       	jmp    80105879 <alltraps>

80105df2 <vector19>:
80105df2:	6a 00                	push   $0x0
80105df4:	6a 13                	push   $0x13
80105df6:	e9 7e fa ff ff       	jmp    80105879 <alltraps>

80105dfb <vector20>:
80105dfb:	6a 00                	push   $0x0
80105dfd:	6a 14                	push   $0x14
80105dff:	e9 75 fa ff ff       	jmp    80105879 <alltraps>

80105e04 <vector21>:
80105e04:	6a 00                	push   $0x0
80105e06:	6a 15                	push   $0x15
80105e08:	e9 6c fa ff ff       	jmp    80105879 <alltraps>

80105e0d <vector22>:
80105e0d:	6a 00                	push   $0x0
80105e0f:	6a 16                	push   $0x16
80105e11:	e9 63 fa ff ff       	jmp    80105879 <alltraps>

80105e16 <vector23>:
80105e16:	6a 00                	push   $0x0
80105e18:	6a 17                	push   $0x17
80105e1a:	e9 5a fa ff ff       	jmp    80105879 <alltraps>

80105e1f <vector24>:
80105e1f:	6a 00                	push   $0x0
80105e21:	6a 18                	push   $0x18
80105e23:	e9 51 fa ff ff       	jmp    80105879 <alltraps>

80105e28 <vector25>:
80105e28:	6a 00                	push   $0x0
80105e2a:	6a 19                	push   $0x19
80105e2c:	e9 48 fa ff ff       	jmp    80105879 <alltraps>

80105e31 <vector26>:
80105e31:	6a 00                	push   $0x0
80105e33:	6a 1a                	push   $0x1a
80105e35:	e9 3f fa ff ff       	jmp    80105879 <alltraps>

80105e3a <vector27>:
80105e3a:	6a 00                	push   $0x0
80105e3c:	6a 1b                	push   $0x1b
80105e3e:	e9 36 fa ff ff       	jmp    80105879 <alltraps>

80105e43 <vector28>:
80105e43:	6a 00                	push   $0x0
80105e45:	6a 1c                	push   $0x1c
80105e47:	e9 2d fa ff ff       	jmp    80105879 <alltraps>

80105e4c <vector29>:
80105e4c:	6a 00                	push   $0x0
80105e4e:	6a 1d                	push   $0x1d
80105e50:	e9 24 fa ff ff       	jmp    80105879 <alltraps>

80105e55 <vector30>:
80105e55:	6a 00                	push   $0x0
80105e57:	6a 1e                	push   $0x1e
80105e59:	e9 1b fa ff ff       	jmp    80105879 <alltraps>

80105e5e <vector31>:
80105e5e:	6a 00                	push   $0x0
80105e60:	6a 1f                	push   $0x1f
80105e62:	e9 12 fa ff ff       	jmp    80105879 <alltraps>

80105e67 <vector32>:
80105e67:	6a 00                	push   $0x0
80105e69:	6a 20                	push   $0x20
80105e6b:	e9 09 fa ff ff       	jmp    80105879 <alltraps>

80105e70 <vector33>:
80105e70:	6a 00                	push   $0x0
80105e72:	6a 21                	push   $0x21
80105e74:	e9 00 fa ff ff       	jmp    80105879 <alltraps>

80105e79 <vector34>:
80105e79:	6a 00                	push   $0x0
80105e7b:	6a 22                	push   $0x22
80105e7d:	e9 f7 f9 ff ff       	jmp    80105879 <alltraps>

80105e82 <vector35>:
80105e82:	6a 00                	push   $0x0
80105e84:	6a 23                	push   $0x23
80105e86:	e9 ee f9 ff ff       	jmp    80105879 <alltraps>

80105e8b <vector36>:
80105e8b:	6a 00                	push   $0x0
80105e8d:	6a 24                	push   $0x24
80105e8f:	e9 e5 f9 ff ff       	jmp    80105879 <alltraps>

80105e94 <vector37>:
80105e94:	6a 00                	push   $0x0
80105e96:	6a 25                	push   $0x25
80105e98:	e9 dc f9 ff ff       	jmp    80105879 <alltraps>

80105e9d <vector38>:
80105e9d:	6a 00                	push   $0x0
80105e9f:	6a 26                	push   $0x26
80105ea1:	e9 d3 f9 ff ff       	jmp    80105879 <alltraps>

80105ea6 <vector39>:
80105ea6:	6a 00                	push   $0x0
80105ea8:	6a 27                	push   $0x27
80105eaa:	e9 ca f9 ff ff       	jmp    80105879 <alltraps>

80105eaf <vector40>:
80105eaf:	6a 00                	push   $0x0
80105eb1:	6a 28                	push   $0x28
80105eb3:	e9 c1 f9 ff ff       	jmp    80105879 <alltraps>

80105eb8 <vector41>:
80105eb8:	6a 00                	push   $0x0
80105eba:	6a 29                	push   $0x29
80105ebc:	e9 b8 f9 ff ff       	jmp    80105879 <alltraps>

80105ec1 <vector42>:
80105ec1:	6a 00                	push   $0x0
80105ec3:	6a 2a                	push   $0x2a
80105ec5:	e9 af f9 ff ff       	jmp    80105879 <alltraps>

80105eca <vector43>:
80105eca:	6a 00                	push   $0x0
80105ecc:	6a 2b                	push   $0x2b
80105ece:	e9 a6 f9 ff ff       	jmp    80105879 <alltraps>

80105ed3 <vector44>:
80105ed3:	6a 00                	push   $0x0
80105ed5:	6a 2c                	push   $0x2c
80105ed7:	e9 9d f9 ff ff       	jmp    80105879 <alltraps>

80105edc <vector45>:
80105edc:	6a 00                	push   $0x0
80105ede:	6a 2d                	push   $0x2d
80105ee0:	e9 94 f9 ff ff       	jmp    80105879 <alltraps>

80105ee5 <vector46>:
80105ee5:	6a 00                	push   $0x0
80105ee7:	6a 2e                	push   $0x2e
80105ee9:	e9 8b f9 ff ff       	jmp    80105879 <alltraps>

80105eee <vector47>:
80105eee:	6a 00                	push   $0x0
80105ef0:	6a 2f                	push   $0x2f
80105ef2:	e9 82 f9 ff ff       	jmp    80105879 <alltraps>

80105ef7 <vector48>:
80105ef7:	6a 00                	push   $0x0
80105ef9:	6a 30                	push   $0x30
80105efb:	e9 79 f9 ff ff       	jmp    80105879 <alltraps>

80105f00 <vector49>:
80105f00:	6a 00                	push   $0x0
80105f02:	6a 31                	push   $0x31
80105f04:	e9 70 f9 ff ff       	jmp    80105879 <alltraps>

80105f09 <vector50>:
80105f09:	6a 00                	push   $0x0
80105f0b:	6a 32                	push   $0x32
80105f0d:	e9 67 f9 ff ff       	jmp    80105879 <alltraps>

80105f12 <vector51>:
80105f12:	6a 00                	push   $0x0
80105f14:	6a 33                	push   $0x33
80105f16:	e9 5e f9 ff ff       	jmp    80105879 <alltraps>

80105f1b <vector52>:
80105f1b:	6a 00                	push   $0x0
80105f1d:	6a 34                	push   $0x34
80105f1f:	e9 55 f9 ff ff       	jmp    80105879 <alltraps>

80105f24 <vector53>:
80105f24:	6a 00                	push   $0x0
80105f26:	6a 35                	push   $0x35
80105f28:	e9 4c f9 ff ff       	jmp    80105879 <alltraps>

80105f2d <vector54>:
80105f2d:	6a 00                	push   $0x0
80105f2f:	6a 36                	push   $0x36
80105f31:	e9 43 f9 ff ff       	jmp    80105879 <alltraps>

80105f36 <vector55>:
80105f36:	6a 00                	push   $0x0
80105f38:	6a 37                	push   $0x37
80105f3a:	e9 3a f9 ff ff       	jmp    80105879 <alltraps>

80105f3f <vector56>:
80105f3f:	6a 00                	push   $0x0
80105f41:	6a 38                	push   $0x38
80105f43:	e9 31 f9 ff ff       	jmp    80105879 <alltraps>

80105f48 <vector57>:
80105f48:	6a 00                	push   $0x0
80105f4a:	6a 39                	push   $0x39
80105f4c:	e9 28 f9 ff ff       	jmp    80105879 <alltraps>

80105f51 <vector58>:
80105f51:	6a 00                	push   $0x0
80105f53:	6a 3a                	push   $0x3a
80105f55:	e9 1f f9 ff ff       	jmp    80105879 <alltraps>

80105f5a <vector59>:
80105f5a:	6a 00                	push   $0x0
80105f5c:	6a 3b                	push   $0x3b
80105f5e:	e9 16 f9 ff ff       	jmp    80105879 <alltraps>

80105f63 <vector60>:
80105f63:	6a 00                	push   $0x0
80105f65:	6a 3c                	push   $0x3c
80105f67:	e9 0d f9 ff ff       	jmp    80105879 <alltraps>

80105f6c <vector61>:
80105f6c:	6a 00                	push   $0x0
80105f6e:	6a 3d                	push   $0x3d
80105f70:	e9 04 f9 ff ff       	jmp    80105879 <alltraps>

80105f75 <vector62>:
80105f75:	6a 00                	push   $0x0
80105f77:	6a 3e                	push   $0x3e
80105f79:	e9 fb f8 ff ff       	jmp    80105879 <alltraps>

80105f7e <vector63>:
80105f7e:	6a 00                	push   $0x0
80105f80:	6a 3f                	push   $0x3f
80105f82:	e9 f2 f8 ff ff       	jmp    80105879 <alltraps>

80105f87 <vector64>:
80105f87:	6a 00                	push   $0x0
80105f89:	6a 40                	push   $0x40
80105f8b:	e9 e9 f8 ff ff       	jmp    80105879 <alltraps>

80105f90 <vector65>:
80105f90:	6a 00                	push   $0x0
80105f92:	6a 41                	push   $0x41
80105f94:	e9 e0 f8 ff ff       	jmp    80105879 <alltraps>

80105f99 <vector66>:
80105f99:	6a 00                	push   $0x0
80105f9b:	6a 42                	push   $0x42
80105f9d:	e9 d7 f8 ff ff       	jmp    80105879 <alltraps>

80105fa2 <vector67>:
80105fa2:	6a 00                	push   $0x0
80105fa4:	6a 43                	push   $0x43
80105fa6:	e9 ce f8 ff ff       	jmp    80105879 <alltraps>

80105fab <vector68>:
80105fab:	6a 00                	push   $0x0
80105fad:	6a 44                	push   $0x44
80105faf:	e9 c5 f8 ff ff       	jmp    80105879 <alltraps>

80105fb4 <vector69>:
80105fb4:	6a 00                	push   $0x0
80105fb6:	6a 45                	push   $0x45
80105fb8:	e9 bc f8 ff ff       	jmp    80105879 <alltraps>

80105fbd <vector70>:
80105fbd:	6a 00                	push   $0x0
80105fbf:	6a 46                	push   $0x46
80105fc1:	e9 b3 f8 ff ff       	jmp    80105879 <alltraps>

80105fc6 <vector71>:
80105fc6:	6a 00                	push   $0x0
80105fc8:	6a 47                	push   $0x47
80105fca:	e9 aa f8 ff ff       	jmp    80105879 <alltraps>

80105fcf <vector72>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	6a 48                	push   $0x48
80105fd3:	e9 a1 f8 ff ff       	jmp    80105879 <alltraps>

80105fd8 <vector73>:
80105fd8:	6a 00                	push   $0x0
80105fda:	6a 49                	push   $0x49
80105fdc:	e9 98 f8 ff ff       	jmp    80105879 <alltraps>

80105fe1 <vector74>:
80105fe1:	6a 00                	push   $0x0
80105fe3:	6a 4a                	push   $0x4a
80105fe5:	e9 8f f8 ff ff       	jmp    80105879 <alltraps>

80105fea <vector75>:
80105fea:	6a 00                	push   $0x0
80105fec:	6a 4b                	push   $0x4b
80105fee:	e9 86 f8 ff ff       	jmp    80105879 <alltraps>

80105ff3 <vector76>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	6a 4c                	push   $0x4c
80105ff7:	e9 7d f8 ff ff       	jmp    80105879 <alltraps>

80105ffc <vector77>:
80105ffc:	6a 00                	push   $0x0
80105ffe:	6a 4d                	push   $0x4d
80106000:	e9 74 f8 ff ff       	jmp    80105879 <alltraps>

80106005 <vector78>:
80106005:	6a 00                	push   $0x0
80106007:	6a 4e                	push   $0x4e
80106009:	e9 6b f8 ff ff       	jmp    80105879 <alltraps>

8010600e <vector79>:
8010600e:	6a 00                	push   $0x0
80106010:	6a 4f                	push   $0x4f
80106012:	e9 62 f8 ff ff       	jmp    80105879 <alltraps>

80106017 <vector80>:
80106017:	6a 00                	push   $0x0
80106019:	6a 50                	push   $0x50
8010601b:	e9 59 f8 ff ff       	jmp    80105879 <alltraps>

80106020 <vector81>:
80106020:	6a 00                	push   $0x0
80106022:	6a 51                	push   $0x51
80106024:	e9 50 f8 ff ff       	jmp    80105879 <alltraps>

80106029 <vector82>:
80106029:	6a 00                	push   $0x0
8010602b:	6a 52                	push   $0x52
8010602d:	e9 47 f8 ff ff       	jmp    80105879 <alltraps>

80106032 <vector83>:
80106032:	6a 00                	push   $0x0
80106034:	6a 53                	push   $0x53
80106036:	e9 3e f8 ff ff       	jmp    80105879 <alltraps>

8010603b <vector84>:
8010603b:	6a 00                	push   $0x0
8010603d:	6a 54                	push   $0x54
8010603f:	e9 35 f8 ff ff       	jmp    80105879 <alltraps>

80106044 <vector85>:
80106044:	6a 00                	push   $0x0
80106046:	6a 55                	push   $0x55
80106048:	e9 2c f8 ff ff       	jmp    80105879 <alltraps>

8010604d <vector86>:
8010604d:	6a 00                	push   $0x0
8010604f:	6a 56                	push   $0x56
80106051:	e9 23 f8 ff ff       	jmp    80105879 <alltraps>

80106056 <vector87>:
80106056:	6a 00                	push   $0x0
80106058:	6a 57                	push   $0x57
8010605a:	e9 1a f8 ff ff       	jmp    80105879 <alltraps>

8010605f <vector88>:
8010605f:	6a 00                	push   $0x0
80106061:	6a 58                	push   $0x58
80106063:	e9 11 f8 ff ff       	jmp    80105879 <alltraps>

80106068 <vector89>:
80106068:	6a 00                	push   $0x0
8010606a:	6a 59                	push   $0x59
8010606c:	e9 08 f8 ff ff       	jmp    80105879 <alltraps>

80106071 <vector90>:
80106071:	6a 00                	push   $0x0
80106073:	6a 5a                	push   $0x5a
80106075:	e9 ff f7 ff ff       	jmp    80105879 <alltraps>

8010607a <vector91>:
8010607a:	6a 00                	push   $0x0
8010607c:	6a 5b                	push   $0x5b
8010607e:	e9 f6 f7 ff ff       	jmp    80105879 <alltraps>

80106083 <vector92>:
80106083:	6a 00                	push   $0x0
80106085:	6a 5c                	push   $0x5c
80106087:	e9 ed f7 ff ff       	jmp    80105879 <alltraps>

8010608c <vector93>:
8010608c:	6a 00                	push   $0x0
8010608e:	6a 5d                	push   $0x5d
80106090:	e9 e4 f7 ff ff       	jmp    80105879 <alltraps>

80106095 <vector94>:
80106095:	6a 00                	push   $0x0
80106097:	6a 5e                	push   $0x5e
80106099:	e9 db f7 ff ff       	jmp    80105879 <alltraps>

8010609e <vector95>:
8010609e:	6a 00                	push   $0x0
801060a0:	6a 5f                	push   $0x5f
801060a2:	e9 d2 f7 ff ff       	jmp    80105879 <alltraps>

801060a7 <vector96>:
801060a7:	6a 00                	push   $0x0
801060a9:	6a 60                	push   $0x60
801060ab:	e9 c9 f7 ff ff       	jmp    80105879 <alltraps>

801060b0 <vector97>:
801060b0:	6a 00                	push   $0x0
801060b2:	6a 61                	push   $0x61
801060b4:	e9 c0 f7 ff ff       	jmp    80105879 <alltraps>

801060b9 <vector98>:
801060b9:	6a 00                	push   $0x0
801060bb:	6a 62                	push   $0x62
801060bd:	e9 b7 f7 ff ff       	jmp    80105879 <alltraps>

801060c2 <vector99>:
801060c2:	6a 00                	push   $0x0
801060c4:	6a 63                	push   $0x63
801060c6:	e9 ae f7 ff ff       	jmp    80105879 <alltraps>

801060cb <vector100>:
801060cb:	6a 00                	push   $0x0
801060cd:	6a 64                	push   $0x64
801060cf:	e9 a5 f7 ff ff       	jmp    80105879 <alltraps>

801060d4 <vector101>:
801060d4:	6a 00                	push   $0x0
801060d6:	6a 65                	push   $0x65
801060d8:	e9 9c f7 ff ff       	jmp    80105879 <alltraps>

801060dd <vector102>:
801060dd:	6a 00                	push   $0x0
801060df:	6a 66                	push   $0x66
801060e1:	e9 93 f7 ff ff       	jmp    80105879 <alltraps>

801060e6 <vector103>:
801060e6:	6a 00                	push   $0x0
801060e8:	6a 67                	push   $0x67
801060ea:	e9 8a f7 ff ff       	jmp    80105879 <alltraps>

801060ef <vector104>:
801060ef:	6a 00                	push   $0x0
801060f1:	6a 68                	push   $0x68
801060f3:	e9 81 f7 ff ff       	jmp    80105879 <alltraps>

801060f8 <vector105>:
801060f8:	6a 00                	push   $0x0
801060fa:	6a 69                	push   $0x69
801060fc:	e9 78 f7 ff ff       	jmp    80105879 <alltraps>

80106101 <vector106>:
80106101:	6a 00                	push   $0x0
80106103:	6a 6a                	push   $0x6a
80106105:	e9 6f f7 ff ff       	jmp    80105879 <alltraps>

8010610a <vector107>:
8010610a:	6a 00                	push   $0x0
8010610c:	6a 6b                	push   $0x6b
8010610e:	e9 66 f7 ff ff       	jmp    80105879 <alltraps>

80106113 <vector108>:
80106113:	6a 00                	push   $0x0
80106115:	6a 6c                	push   $0x6c
80106117:	e9 5d f7 ff ff       	jmp    80105879 <alltraps>

8010611c <vector109>:
8010611c:	6a 00                	push   $0x0
8010611e:	6a 6d                	push   $0x6d
80106120:	e9 54 f7 ff ff       	jmp    80105879 <alltraps>

80106125 <vector110>:
80106125:	6a 00                	push   $0x0
80106127:	6a 6e                	push   $0x6e
80106129:	e9 4b f7 ff ff       	jmp    80105879 <alltraps>

8010612e <vector111>:
8010612e:	6a 00                	push   $0x0
80106130:	6a 6f                	push   $0x6f
80106132:	e9 42 f7 ff ff       	jmp    80105879 <alltraps>

80106137 <vector112>:
80106137:	6a 00                	push   $0x0
80106139:	6a 70                	push   $0x70
8010613b:	e9 39 f7 ff ff       	jmp    80105879 <alltraps>

80106140 <vector113>:
80106140:	6a 00                	push   $0x0
80106142:	6a 71                	push   $0x71
80106144:	e9 30 f7 ff ff       	jmp    80105879 <alltraps>

80106149 <vector114>:
80106149:	6a 00                	push   $0x0
8010614b:	6a 72                	push   $0x72
8010614d:	e9 27 f7 ff ff       	jmp    80105879 <alltraps>

80106152 <vector115>:
80106152:	6a 00                	push   $0x0
80106154:	6a 73                	push   $0x73
80106156:	e9 1e f7 ff ff       	jmp    80105879 <alltraps>

8010615b <vector116>:
8010615b:	6a 00                	push   $0x0
8010615d:	6a 74                	push   $0x74
8010615f:	e9 15 f7 ff ff       	jmp    80105879 <alltraps>

80106164 <vector117>:
80106164:	6a 00                	push   $0x0
80106166:	6a 75                	push   $0x75
80106168:	e9 0c f7 ff ff       	jmp    80105879 <alltraps>

8010616d <vector118>:
8010616d:	6a 00                	push   $0x0
8010616f:	6a 76                	push   $0x76
80106171:	e9 03 f7 ff ff       	jmp    80105879 <alltraps>

80106176 <vector119>:
80106176:	6a 00                	push   $0x0
80106178:	6a 77                	push   $0x77
8010617a:	e9 fa f6 ff ff       	jmp    80105879 <alltraps>

8010617f <vector120>:
8010617f:	6a 00                	push   $0x0
80106181:	6a 78                	push   $0x78
80106183:	e9 f1 f6 ff ff       	jmp    80105879 <alltraps>

80106188 <vector121>:
80106188:	6a 00                	push   $0x0
8010618a:	6a 79                	push   $0x79
8010618c:	e9 e8 f6 ff ff       	jmp    80105879 <alltraps>

80106191 <vector122>:
80106191:	6a 00                	push   $0x0
80106193:	6a 7a                	push   $0x7a
80106195:	e9 df f6 ff ff       	jmp    80105879 <alltraps>

8010619a <vector123>:
8010619a:	6a 00                	push   $0x0
8010619c:	6a 7b                	push   $0x7b
8010619e:	e9 d6 f6 ff ff       	jmp    80105879 <alltraps>

801061a3 <vector124>:
801061a3:	6a 00                	push   $0x0
801061a5:	6a 7c                	push   $0x7c
801061a7:	e9 cd f6 ff ff       	jmp    80105879 <alltraps>

801061ac <vector125>:
801061ac:	6a 00                	push   $0x0
801061ae:	6a 7d                	push   $0x7d
801061b0:	e9 c4 f6 ff ff       	jmp    80105879 <alltraps>

801061b5 <vector126>:
801061b5:	6a 00                	push   $0x0
801061b7:	6a 7e                	push   $0x7e
801061b9:	e9 bb f6 ff ff       	jmp    80105879 <alltraps>

801061be <vector127>:
801061be:	6a 00                	push   $0x0
801061c0:	6a 7f                	push   $0x7f
801061c2:	e9 b2 f6 ff ff       	jmp    80105879 <alltraps>

801061c7 <vector128>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 80 00 00 00       	push   $0x80
801061ce:	e9 a6 f6 ff ff       	jmp    80105879 <alltraps>

801061d3 <vector129>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 81 00 00 00       	push   $0x81
801061da:	e9 9a f6 ff ff       	jmp    80105879 <alltraps>

801061df <vector130>:
801061df:	6a 00                	push   $0x0
801061e1:	68 82 00 00 00       	push   $0x82
801061e6:	e9 8e f6 ff ff       	jmp    80105879 <alltraps>

801061eb <vector131>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 83 00 00 00       	push   $0x83
801061f2:	e9 82 f6 ff ff       	jmp    80105879 <alltraps>

801061f7 <vector132>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 84 00 00 00       	push   $0x84
801061fe:	e9 76 f6 ff ff       	jmp    80105879 <alltraps>

80106203 <vector133>:
80106203:	6a 00                	push   $0x0
80106205:	68 85 00 00 00       	push   $0x85
8010620a:	e9 6a f6 ff ff       	jmp    80105879 <alltraps>

8010620f <vector134>:
8010620f:	6a 00                	push   $0x0
80106211:	68 86 00 00 00       	push   $0x86
80106216:	e9 5e f6 ff ff       	jmp    80105879 <alltraps>

8010621b <vector135>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 87 00 00 00       	push   $0x87
80106222:	e9 52 f6 ff ff       	jmp    80105879 <alltraps>

80106227 <vector136>:
80106227:	6a 00                	push   $0x0
80106229:	68 88 00 00 00       	push   $0x88
8010622e:	e9 46 f6 ff ff       	jmp    80105879 <alltraps>

80106233 <vector137>:
80106233:	6a 00                	push   $0x0
80106235:	68 89 00 00 00       	push   $0x89
8010623a:	e9 3a f6 ff ff       	jmp    80105879 <alltraps>

8010623f <vector138>:
8010623f:	6a 00                	push   $0x0
80106241:	68 8a 00 00 00       	push   $0x8a
80106246:	e9 2e f6 ff ff       	jmp    80105879 <alltraps>

8010624b <vector139>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 8b 00 00 00       	push   $0x8b
80106252:	e9 22 f6 ff ff       	jmp    80105879 <alltraps>

80106257 <vector140>:
80106257:	6a 00                	push   $0x0
80106259:	68 8c 00 00 00       	push   $0x8c
8010625e:	e9 16 f6 ff ff       	jmp    80105879 <alltraps>

80106263 <vector141>:
80106263:	6a 00                	push   $0x0
80106265:	68 8d 00 00 00       	push   $0x8d
8010626a:	e9 0a f6 ff ff       	jmp    80105879 <alltraps>

8010626f <vector142>:
8010626f:	6a 00                	push   $0x0
80106271:	68 8e 00 00 00       	push   $0x8e
80106276:	e9 fe f5 ff ff       	jmp    80105879 <alltraps>

8010627b <vector143>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 8f 00 00 00       	push   $0x8f
80106282:	e9 f2 f5 ff ff       	jmp    80105879 <alltraps>

80106287 <vector144>:
80106287:	6a 00                	push   $0x0
80106289:	68 90 00 00 00       	push   $0x90
8010628e:	e9 e6 f5 ff ff       	jmp    80105879 <alltraps>

80106293 <vector145>:
80106293:	6a 00                	push   $0x0
80106295:	68 91 00 00 00       	push   $0x91
8010629a:	e9 da f5 ff ff       	jmp    80105879 <alltraps>

8010629f <vector146>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 92 00 00 00       	push   $0x92
801062a6:	e9 ce f5 ff ff       	jmp    80105879 <alltraps>

801062ab <vector147>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 93 00 00 00       	push   $0x93
801062b2:	e9 c2 f5 ff ff       	jmp    80105879 <alltraps>

801062b7 <vector148>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 94 00 00 00       	push   $0x94
801062be:	e9 b6 f5 ff ff       	jmp    80105879 <alltraps>

801062c3 <vector149>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 95 00 00 00       	push   $0x95
801062ca:	e9 aa f5 ff ff       	jmp    80105879 <alltraps>

801062cf <vector150>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 96 00 00 00       	push   $0x96
801062d6:	e9 9e f5 ff ff       	jmp    80105879 <alltraps>

801062db <vector151>:
801062db:	6a 00                	push   $0x0
801062dd:	68 97 00 00 00       	push   $0x97
801062e2:	e9 92 f5 ff ff       	jmp    80105879 <alltraps>

801062e7 <vector152>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 98 00 00 00       	push   $0x98
801062ee:	e9 86 f5 ff ff       	jmp    80105879 <alltraps>

801062f3 <vector153>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 99 00 00 00       	push   $0x99
801062fa:	e9 7a f5 ff ff       	jmp    80105879 <alltraps>

801062ff <vector154>:
801062ff:	6a 00                	push   $0x0
80106301:	68 9a 00 00 00       	push   $0x9a
80106306:	e9 6e f5 ff ff       	jmp    80105879 <alltraps>

8010630b <vector155>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 9b 00 00 00       	push   $0x9b
80106312:	e9 62 f5 ff ff       	jmp    80105879 <alltraps>

80106317 <vector156>:
80106317:	6a 00                	push   $0x0
80106319:	68 9c 00 00 00       	push   $0x9c
8010631e:	e9 56 f5 ff ff       	jmp    80105879 <alltraps>

80106323 <vector157>:
80106323:	6a 00                	push   $0x0
80106325:	68 9d 00 00 00       	push   $0x9d
8010632a:	e9 4a f5 ff ff       	jmp    80105879 <alltraps>

8010632f <vector158>:
8010632f:	6a 00                	push   $0x0
80106331:	68 9e 00 00 00       	push   $0x9e
80106336:	e9 3e f5 ff ff       	jmp    80105879 <alltraps>

8010633b <vector159>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 9f 00 00 00       	push   $0x9f
80106342:	e9 32 f5 ff ff       	jmp    80105879 <alltraps>

80106347 <vector160>:
80106347:	6a 00                	push   $0x0
80106349:	68 a0 00 00 00       	push   $0xa0
8010634e:	e9 26 f5 ff ff       	jmp    80105879 <alltraps>

80106353 <vector161>:
80106353:	6a 00                	push   $0x0
80106355:	68 a1 00 00 00       	push   $0xa1
8010635a:	e9 1a f5 ff ff       	jmp    80105879 <alltraps>

8010635f <vector162>:
8010635f:	6a 00                	push   $0x0
80106361:	68 a2 00 00 00       	push   $0xa2
80106366:	e9 0e f5 ff ff       	jmp    80105879 <alltraps>

8010636b <vector163>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 a3 00 00 00       	push   $0xa3
80106372:	e9 02 f5 ff ff       	jmp    80105879 <alltraps>

80106377 <vector164>:
80106377:	6a 00                	push   $0x0
80106379:	68 a4 00 00 00       	push   $0xa4
8010637e:	e9 f6 f4 ff ff       	jmp    80105879 <alltraps>

80106383 <vector165>:
80106383:	6a 00                	push   $0x0
80106385:	68 a5 00 00 00       	push   $0xa5
8010638a:	e9 ea f4 ff ff       	jmp    80105879 <alltraps>

8010638f <vector166>:
8010638f:	6a 00                	push   $0x0
80106391:	68 a6 00 00 00       	push   $0xa6
80106396:	e9 de f4 ff ff       	jmp    80105879 <alltraps>

8010639b <vector167>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 a7 00 00 00       	push   $0xa7
801063a2:	e9 d2 f4 ff ff       	jmp    80105879 <alltraps>

801063a7 <vector168>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 a8 00 00 00       	push   $0xa8
801063ae:	e9 c6 f4 ff ff       	jmp    80105879 <alltraps>

801063b3 <vector169>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 a9 00 00 00       	push   $0xa9
801063ba:	e9 ba f4 ff ff       	jmp    80105879 <alltraps>

801063bf <vector170>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 aa 00 00 00       	push   $0xaa
801063c6:	e9 ae f4 ff ff       	jmp    80105879 <alltraps>

801063cb <vector171>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 ab 00 00 00       	push   $0xab
801063d2:	e9 a2 f4 ff ff       	jmp    80105879 <alltraps>

801063d7 <vector172>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 ac 00 00 00       	push   $0xac
801063de:	e9 96 f4 ff ff       	jmp    80105879 <alltraps>

801063e3 <vector173>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 ad 00 00 00       	push   $0xad
801063ea:	e9 8a f4 ff ff       	jmp    80105879 <alltraps>

801063ef <vector174>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 ae 00 00 00       	push   $0xae
801063f6:	e9 7e f4 ff ff       	jmp    80105879 <alltraps>

801063fb <vector175>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 af 00 00 00       	push   $0xaf
80106402:	e9 72 f4 ff ff       	jmp    80105879 <alltraps>

80106407 <vector176>:
80106407:	6a 00                	push   $0x0
80106409:	68 b0 00 00 00       	push   $0xb0
8010640e:	e9 66 f4 ff ff       	jmp    80105879 <alltraps>

80106413 <vector177>:
80106413:	6a 00                	push   $0x0
80106415:	68 b1 00 00 00       	push   $0xb1
8010641a:	e9 5a f4 ff ff       	jmp    80105879 <alltraps>

8010641f <vector178>:
8010641f:	6a 00                	push   $0x0
80106421:	68 b2 00 00 00       	push   $0xb2
80106426:	e9 4e f4 ff ff       	jmp    80105879 <alltraps>

8010642b <vector179>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 b3 00 00 00       	push   $0xb3
80106432:	e9 42 f4 ff ff       	jmp    80105879 <alltraps>

80106437 <vector180>:
80106437:	6a 00                	push   $0x0
80106439:	68 b4 00 00 00       	push   $0xb4
8010643e:	e9 36 f4 ff ff       	jmp    80105879 <alltraps>

80106443 <vector181>:
80106443:	6a 00                	push   $0x0
80106445:	68 b5 00 00 00       	push   $0xb5
8010644a:	e9 2a f4 ff ff       	jmp    80105879 <alltraps>

8010644f <vector182>:
8010644f:	6a 00                	push   $0x0
80106451:	68 b6 00 00 00       	push   $0xb6
80106456:	e9 1e f4 ff ff       	jmp    80105879 <alltraps>

8010645b <vector183>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 b7 00 00 00       	push   $0xb7
80106462:	e9 12 f4 ff ff       	jmp    80105879 <alltraps>

80106467 <vector184>:
80106467:	6a 00                	push   $0x0
80106469:	68 b8 00 00 00       	push   $0xb8
8010646e:	e9 06 f4 ff ff       	jmp    80105879 <alltraps>

80106473 <vector185>:
80106473:	6a 00                	push   $0x0
80106475:	68 b9 00 00 00       	push   $0xb9
8010647a:	e9 fa f3 ff ff       	jmp    80105879 <alltraps>

8010647f <vector186>:
8010647f:	6a 00                	push   $0x0
80106481:	68 ba 00 00 00       	push   $0xba
80106486:	e9 ee f3 ff ff       	jmp    80105879 <alltraps>

8010648b <vector187>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 bb 00 00 00       	push   $0xbb
80106492:	e9 e2 f3 ff ff       	jmp    80105879 <alltraps>

80106497 <vector188>:
80106497:	6a 00                	push   $0x0
80106499:	68 bc 00 00 00       	push   $0xbc
8010649e:	e9 d6 f3 ff ff       	jmp    80105879 <alltraps>

801064a3 <vector189>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 bd 00 00 00       	push   $0xbd
801064aa:	e9 ca f3 ff ff       	jmp    80105879 <alltraps>

801064af <vector190>:
801064af:	6a 00                	push   $0x0
801064b1:	68 be 00 00 00       	push   $0xbe
801064b6:	e9 be f3 ff ff       	jmp    80105879 <alltraps>

801064bb <vector191>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 bf 00 00 00       	push   $0xbf
801064c2:	e9 b2 f3 ff ff       	jmp    80105879 <alltraps>

801064c7 <vector192>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 c0 00 00 00       	push   $0xc0
801064ce:	e9 a6 f3 ff ff       	jmp    80105879 <alltraps>

801064d3 <vector193>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 c1 00 00 00       	push   $0xc1
801064da:	e9 9a f3 ff ff       	jmp    80105879 <alltraps>

801064df <vector194>:
801064df:	6a 00                	push   $0x0
801064e1:	68 c2 00 00 00       	push   $0xc2
801064e6:	e9 8e f3 ff ff       	jmp    80105879 <alltraps>

801064eb <vector195>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 c3 00 00 00       	push   $0xc3
801064f2:	e9 82 f3 ff ff       	jmp    80105879 <alltraps>

801064f7 <vector196>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 c4 00 00 00       	push   $0xc4
801064fe:	e9 76 f3 ff ff       	jmp    80105879 <alltraps>

80106503 <vector197>:
80106503:	6a 00                	push   $0x0
80106505:	68 c5 00 00 00       	push   $0xc5
8010650a:	e9 6a f3 ff ff       	jmp    80105879 <alltraps>

8010650f <vector198>:
8010650f:	6a 00                	push   $0x0
80106511:	68 c6 00 00 00       	push   $0xc6
80106516:	e9 5e f3 ff ff       	jmp    80105879 <alltraps>

8010651b <vector199>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 c7 00 00 00       	push   $0xc7
80106522:	e9 52 f3 ff ff       	jmp    80105879 <alltraps>

80106527 <vector200>:
80106527:	6a 00                	push   $0x0
80106529:	68 c8 00 00 00       	push   $0xc8
8010652e:	e9 46 f3 ff ff       	jmp    80105879 <alltraps>

80106533 <vector201>:
80106533:	6a 00                	push   $0x0
80106535:	68 c9 00 00 00       	push   $0xc9
8010653a:	e9 3a f3 ff ff       	jmp    80105879 <alltraps>

8010653f <vector202>:
8010653f:	6a 00                	push   $0x0
80106541:	68 ca 00 00 00       	push   $0xca
80106546:	e9 2e f3 ff ff       	jmp    80105879 <alltraps>

8010654b <vector203>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 cb 00 00 00       	push   $0xcb
80106552:	e9 22 f3 ff ff       	jmp    80105879 <alltraps>

80106557 <vector204>:
80106557:	6a 00                	push   $0x0
80106559:	68 cc 00 00 00       	push   $0xcc
8010655e:	e9 16 f3 ff ff       	jmp    80105879 <alltraps>

80106563 <vector205>:
80106563:	6a 00                	push   $0x0
80106565:	68 cd 00 00 00       	push   $0xcd
8010656a:	e9 0a f3 ff ff       	jmp    80105879 <alltraps>

8010656f <vector206>:
8010656f:	6a 00                	push   $0x0
80106571:	68 ce 00 00 00       	push   $0xce
80106576:	e9 fe f2 ff ff       	jmp    80105879 <alltraps>

8010657b <vector207>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 cf 00 00 00       	push   $0xcf
80106582:	e9 f2 f2 ff ff       	jmp    80105879 <alltraps>

80106587 <vector208>:
80106587:	6a 00                	push   $0x0
80106589:	68 d0 00 00 00       	push   $0xd0
8010658e:	e9 e6 f2 ff ff       	jmp    80105879 <alltraps>

80106593 <vector209>:
80106593:	6a 00                	push   $0x0
80106595:	68 d1 00 00 00       	push   $0xd1
8010659a:	e9 da f2 ff ff       	jmp    80105879 <alltraps>

8010659f <vector210>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 d2 00 00 00       	push   $0xd2
801065a6:	e9 ce f2 ff ff       	jmp    80105879 <alltraps>

801065ab <vector211>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 d3 00 00 00       	push   $0xd3
801065b2:	e9 c2 f2 ff ff       	jmp    80105879 <alltraps>

801065b7 <vector212>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 d4 00 00 00       	push   $0xd4
801065be:	e9 b6 f2 ff ff       	jmp    80105879 <alltraps>

801065c3 <vector213>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 d5 00 00 00       	push   $0xd5
801065ca:	e9 aa f2 ff ff       	jmp    80105879 <alltraps>

801065cf <vector214>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 d6 00 00 00       	push   $0xd6
801065d6:	e9 9e f2 ff ff       	jmp    80105879 <alltraps>

801065db <vector215>:
801065db:	6a 00                	push   $0x0
801065dd:	68 d7 00 00 00       	push   $0xd7
801065e2:	e9 92 f2 ff ff       	jmp    80105879 <alltraps>

801065e7 <vector216>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 d8 00 00 00       	push   $0xd8
801065ee:	e9 86 f2 ff ff       	jmp    80105879 <alltraps>

801065f3 <vector217>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 d9 00 00 00       	push   $0xd9
801065fa:	e9 7a f2 ff ff       	jmp    80105879 <alltraps>

801065ff <vector218>:
801065ff:	6a 00                	push   $0x0
80106601:	68 da 00 00 00       	push   $0xda
80106606:	e9 6e f2 ff ff       	jmp    80105879 <alltraps>

8010660b <vector219>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 db 00 00 00       	push   $0xdb
80106612:	e9 62 f2 ff ff       	jmp    80105879 <alltraps>

80106617 <vector220>:
80106617:	6a 00                	push   $0x0
80106619:	68 dc 00 00 00       	push   $0xdc
8010661e:	e9 56 f2 ff ff       	jmp    80105879 <alltraps>

80106623 <vector221>:
80106623:	6a 00                	push   $0x0
80106625:	68 dd 00 00 00       	push   $0xdd
8010662a:	e9 4a f2 ff ff       	jmp    80105879 <alltraps>

8010662f <vector222>:
8010662f:	6a 00                	push   $0x0
80106631:	68 de 00 00 00       	push   $0xde
80106636:	e9 3e f2 ff ff       	jmp    80105879 <alltraps>

8010663b <vector223>:
8010663b:	6a 00                	push   $0x0
8010663d:	68 df 00 00 00       	push   $0xdf
80106642:	e9 32 f2 ff ff       	jmp    80105879 <alltraps>

80106647 <vector224>:
80106647:	6a 00                	push   $0x0
80106649:	68 e0 00 00 00       	push   $0xe0
8010664e:	e9 26 f2 ff ff       	jmp    80105879 <alltraps>

80106653 <vector225>:
80106653:	6a 00                	push   $0x0
80106655:	68 e1 00 00 00       	push   $0xe1
8010665a:	e9 1a f2 ff ff       	jmp    80105879 <alltraps>

8010665f <vector226>:
8010665f:	6a 00                	push   $0x0
80106661:	68 e2 00 00 00       	push   $0xe2
80106666:	e9 0e f2 ff ff       	jmp    80105879 <alltraps>

8010666b <vector227>:
8010666b:	6a 00                	push   $0x0
8010666d:	68 e3 00 00 00       	push   $0xe3
80106672:	e9 02 f2 ff ff       	jmp    80105879 <alltraps>

80106677 <vector228>:
80106677:	6a 00                	push   $0x0
80106679:	68 e4 00 00 00       	push   $0xe4
8010667e:	e9 f6 f1 ff ff       	jmp    80105879 <alltraps>

80106683 <vector229>:
80106683:	6a 00                	push   $0x0
80106685:	68 e5 00 00 00       	push   $0xe5
8010668a:	e9 ea f1 ff ff       	jmp    80105879 <alltraps>

8010668f <vector230>:
8010668f:	6a 00                	push   $0x0
80106691:	68 e6 00 00 00       	push   $0xe6
80106696:	e9 de f1 ff ff       	jmp    80105879 <alltraps>

8010669b <vector231>:
8010669b:	6a 00                	push   $0x0
8010669d:	68 e7 00 00 00       	push   $0xe7
801066a2:	e9 d2 f1 ff ff       	jmp    80105879 <alltraps>

801066a7 <vector232>:
801066a7:	6a 00                	push   $0x0
801066a9:	68 e8 00 00 00       	push   $0xe8
801066ae:	e9 c6 f1 ff ff       	jmp    80105879 <alltraps>

801066b3 <vector233>:
801066b3:	6a 00                	push   $0x0
801066b5:	68 e9 00 00 00       	push   $0xe9
801066ba:	e9 ba f1 ff ff       	jmp    80105879 <alltraps>

801066bf <vector234>:
801066bf:	6a 00                	push   $0x0
801066c1:	68 ea 00 00 00       	push   $0xea
801066c6:	e9 ae f1 ff ff       	jmp    80105879 <alltraps>

801066cb <vector235>:
801066cb:	6a 00                	push   $0x0
801066cd:	68 eb 00 00 00       	push   $0xeb
801066d2:	e9 a2 f1 ff ff       	jmp    80105879 <alltraps>

801066d7 <vector236>:
801066d7:	6a 00                	push   $0x0
801066d9:	68 ec 00 00 00       	push   $0xec
801066de:	e9 96 f1 ff ff       	jmp    80105879 <alltraps>

801066e3 <vector237>:
801066e3:	6a 00                	push   $0x0
801066e5:	68 ed 00 00 00       	push   $0xed
801066ea:	e9 8a f1 ff ff       	jmp    80105879 <alltraps>

801066ef <vector238>:
801066ef:	6a 00                	push   $0x0
801066f1:	68 ee 00 00 00       	push   $0xee
801066f6:	e9 7e f1 ff ff       	jmp    80105879 <alltraps>

801066fb <vector239>:
801066fb:	6a 00                	push   $0x0
801066fd:	68 ef 00 00 00       	push   $0xef
80106702:	e9 72 f1 ff ff       	jmp    80105879 <alltraps>

80106707 <vector240>:
80106707:	6a 00                	push   $0x0
80106709:	68 f0 00 00 00       	push   $0xf0
8010670e:	e9 66 f1 ff ff       	jmp    80105879 <alltraps>

80106713 <vector241>:
80106713:	6a 00                	push   $0x0
80106715:	68 f1 00 00 00       	push   $0xf1
8010671a:	e9 5a f1 ff ff       	jmp    80105879 <alltraps>

8010671f <vector242>:
8010671f:	6a 00                	push   $0x0
80106721:	68 f2 00 00 00       	push   $0xf2
80106726:	e9 4e f1 ff ff       	jmp    80105879 <alltraps>

8010672b <vector243>:
8010672b:	6a 00                	push   $0x0
8010672d:	68 f3 00 00 00       	push   $0xf3
80106732:	e9 42 f1 ff ff       	jmp    80105879 <alltraps>

80106737 <vector244>:
80106737:	6a 00                	push   $0x0
80106739:	68 f4 00 00 00       	push   $0xf4
8010673e:	e9 36 f1 ff ff       	jmp    80105879 <alltraps>

80106743 <vector245>:
80106743:	6a 00                	push   $0x0
80106745:	68 f5 00 00 00       	push   $0xf5
8010674a:	e9 2a f1 ff ff       	jmp    80105879 <alltraps>

8010674f <vector246>:
8010674f:	6a 00                	push   $0x0
80106751:	68 f6 00 00 00       	push   $0xf6
80106756:	e9 1e f1 ff ff       	jmp    80105879 <alltraps>

8010675b <vector247>:
8010675b:	6a 00                	push   $0x0
8010675d:	68 f7 00 00 00       	push   $0xf7
80106762:	e9 12 f1 ff ff       	jmp    80105879 <alltraps>

80106767 <vector248>:
80106767:	6a 00                	push   $0x0
80106769:	68 f8 00 00 00       	push   $0xf8
8010676e:	e9 06 f1 ff ff       	jmp    80105879 <alltraps>

80106773 <vector249>:
80106773:	6a 00                	push   $0x0
80106775:	68 f9 00 00 00       	push   $0xf9
8010677a:	e9 fa f0 ff ff       	jmp    80105879 <alltraps>

8010677f <vector250>:
8010677f:	6a 00                	push   $0x0
80106781:	68 fa 00 00 00       	push   $0xfa
80106786:	e9 ee f0 ff ff       	jmp    80105879 <alltraps>

8010678b <vector251>:
8010678b:	6a 00                	push   $0x0
8010678d:	68 fb 00 00 00       	push   $0xfb
80106792:	e9 e2 f0 ff ff       	jmp    80105879 <alltraps>

80106797 <vector252>:
80106797:	6a 00                	push   $0x0
80106799:	68 fc 00 00 00       	push   $0xfc
8010679e:	e9 d6 f0 ff ff       	jmp    80105879 <alltraps>

801067a3 <vector253>:
801067a3:	6a 00                	push   $0x0
801067a5:	68 fd 00 00 00       	push   $0xfd
801067aa:	e9 ca f0 ff ff       	jmp    80105879 <alltraps>

801067af <vector254>:
801067af:	6a 00                	push   $0x0
801067b1:	68 fe 00 00 00       	push   $0xfe
801067b6:	e9 be f0 ff ff       	jmp    80105879 <alltraps>

801067bb <vector255>:
801067bb:	6a 00                	push   $0x0
801067bd:	68 ff 00 00 00       	push   $0xff
801067c2:	e9 b2 f0 ff ff       	jmp    80105879 <alltraps>
801067c7:	66 90                	xchg   %ax,%ax
801067c9:	66 90                	xchg   %ax,%ax
801067cb:	66 90                	xchg   %ax,%ax
801067cd:	66 90                	xchg   %ax,%ax
801067cf:	90                   	nop

801067d0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801067d0:	55                   	push   %ebp
801067d1:	89 e5                	mov    %esp,%ebp
801067d3:	57                   	push   %edi
801067d4:	56                   	push   %esi
801067d5:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801067d6:	89 d3                	mov    %edx,%ebx
{
801067d8:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
801067da:	c1 eb 16             	shr    $0x16,%ebx
801067dd:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
801067e0:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
801067e3:	8b 06                	mov    (%esi),%eax
801067e5:	a8 01                	test   $0x1,%al
801067e7:	74 27                	je     80106810 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801067e9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801067ee:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801067f4:	c1 ef 0a             	shr    $0xa,%edi
}
801067f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
801067fa:	89 fa                	mov    %edi,%edx
801067fc:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106802:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106805:	5b                   	pop    %ebx
80106806:	5e                   	pop    %esi
80106807:	5f                   	pop    %edi
80106808:	5d                   	pop    %ebp
80106809:	c3                   	ret    
8010680a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106810:	85 c9                	test   %ecx,%ecx
80106812:	74 2c                	je     80106840 <walkpgdir+0x70>
80106814:	e8 17 bd ff ff       	call   80102530 <kalloc>
80106819:	85 c0                	test   %eax,%eax
8010681b:	89 c3                	mov    %eax,%ebx
8010681d:	74 21                	je     80106840 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
8010681f:	83 ec 04             	sub    $0x4,%esp
80106822:	68 00 10 00 00       	push   $0x1000
80106827:	6a 00                	push   $0x0
80106829:	50                   	push   %eax
8010682a:	e8 e1 dd ff ff       	call   80104610 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010682f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106835:	83 c4 10             	add    $0x10,%esp
80106838:	83 c8 07             	or     $0x7,%eax
8010683b:	89 06                	mov    %eax,(%esi)
8010683d:	eb b5                	jmp    801067f4 <walkpgdir+0x24>
8010683f:	90                   	nop
}
80106840:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106843:	31 c0                	xor    %eax,%eax
}
80106845:	5b                   	pop    %ebx
80106846:	5e                   	pop    %esi
80106847:	5f                   	pop    %edi
80106848:	5d                   	pop    %ebp
80106849:	c3                   	ret    
8010684a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106850 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106850:	55                   	push   %ebp
80106851:	89 e5                	mov    %esp,%ebp
80106853:	57                   	push   %edi
80106854:	56                   	push   %esi
80106855:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106856:	89 d3                	mov    %edx,%ebx
80106858:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
8010685e:	83 ec 1c             	sub    $0x1c,%esp
80106861:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106864:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106868:	8b 7d 08             	mov    0x8(%ebp),%edi
8010686b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106870:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106873:	8b 45 0c             	mov    0xc(%ebp),%eax
80106876:	29 df                	sub    %ebx,%edi
80106878:	83 c8 01             	or     $0x1,%eax
8010687b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010687e:	eb 15                	jmp    80106895 <mappages+0x45>
    if(*pte & PTE_P)
80106880:	f6 00 01             	testb  $0x1,(%eax)
80106883:	75 45                	jne    801068ca <mappages+0x7a>
    *pte = pa | perm | PTE_P;
80106885:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106888:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
8010688b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010688d:	74 31                	je     801068c0 <mappages+0x70>
      break;
    a += PGSIZE;
8010688f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106895:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106898:	b9 01 00 00 00       	mov    $0x1,%ecx
8010689d:	89 da                	mov    %ebx,%edx
8010689f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801068a2:	e8 29 ff ff ff       	call   801067d0 <walkpgdir>
801068a7:	85 c0                	test   %eax,%eax
801068a9:	75 d5                	jne    80106880 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
801068ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801068ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801068b3:	5b                   	pop    %ebx
801068b4:	5e                   	pop    %esi
801068b5:	5f                   	pop    %edi
801068b6:	5d                   	pop    %ebp
801068b7:	c3                   	ret    
801068b8:	90                   	nop
801068b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801068c3:	31 c0                	xor    %eax,%eax
}
801068c5:	5b                   	pop    %ebx
801068c6:	5e                   	pop    %esi
801068c7:	5f                   	pop    %edi
801068c8:	5d                   	pop    %ebp
801068c9:	c3                   	ret    
      panic("remap");
801068ca:	83 ec 0c             	sub    $0xc,%esp
801068cd:	68 b4 7b 10 80       	push   $0x80107bb4
801068d2:	e8 b9 9a ff ff       	call   80100390 <panic>
801068d7:	89 f6                	mov    %esi,%esi
801068d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068e0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068e0:	55                   	push   %ebp
801068e1:	89 e5                	mov    %esp,%ebp
801068e3:	57                   	push   %edi
801068e4:	56                   	push   %esi
801068e5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801068e6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068ec:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
801068ee:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068f4:	83 ec 1c             	sub    $0x1c,%esp
801068f7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
801068fa:	39 d3                	cmp    %edx,%ebx
801068fc:	73 66                	jae    80106964 <deallocuvm.part.0+0x84>
801068fe:	89 d6                	mov    %edx,%esi
80106900:	eb 3d                	jmp    8010693f <deallocuvm.part.0+0x5f>
80106902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106908:	8b 10                	mov    (%eax),%edx
8010690a:	f6 c2 01             	test   $0x1,%dl
8010690d:	74 26                	je     80106935 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010690f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106915:	74 58                	je     8010696f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106917:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
8010691a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106920:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106923:	52                   	push   %edx
80106924:	e8 57 ba ff ff       	call   80102380 <kfree>
      *pte = 0;
80106929:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010692c:	83 c4 10             	add    $0x10,%esp
8010692f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106935:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010693b:	39 f3                	cmp    %esi,%ebx
8010693d:	73 25                	jae    80106964 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010693f:	31 c9                	xor    %ecx,%ecx
80106941:	89 da                	mov    %ebx,%edx
80106943:	89 f8                	mov    %edi,%eax
80106945:	e8 86 fe ff ff       	call   801067d0 <walkpgdir>
    if(!pte)
8010694a:	85 c0                	test   %eax,%eax
8010694c:	75 ba                	jne    80106908 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010694e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106954:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
8010695a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106960:	39 f3                	cmp    %esi,%ebx
80106962:	72 db                	jb     8010693f <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106964:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106967:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010696a:	5b                   	pop    %ebx
8010696b:	5e                   	pop    %esi
8010696c:	5f                   	pop    %edi
8010696d:	5d                   	pop    %ebp
8010696e:	c3                   	ret    
        panic("kfree");
8010696f:	83 ec 0c             	sub    $0xc,%esp
80106972:	68 52 75 10 80       	push   $0x80107552
80106977:	e8 14 9a ff ff       	call   80100390 <panic>
8010697c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106980 <seginit>:
{
80106980:	55                   	push   %ebp
80106981:	89 e5                	mov    %esp,%ebp
80106983:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106986:	e8 15 cf ff ff       	call   801038a0 <cpuid>
8010698b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
  pd[0] = size-1;
80106991:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106996:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010699a:	c7 80 d8 31 11 80 ff 	movl   $0xffff,-0x7feece28(%eax)
801069a1:	ff 00 00 
801069a4:	c7 80 dc 31 11 80 00 	movl   $0xcf9a00,-0x7feece24(%eax)
801069ab:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801069ae:	c7 80 e0 31 11 80 ff 	movl   $0xffff,-0x7feece20(%eax)
801069b5:	ff 00 00 
801069b8:	c7 80 e4 31 11 80 00 	movl   $0xcf9200,-0x7feece1c(%eax)
801069bf:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801069c2:	c7 80 e8 31 11 80 ff 	movl   $0xffff,-0x7feece18(%eax)
801069c9:	ff 00 00 
801069cc:	c7 80 ec 31 11 80 00 	movl   $0xcffa00,-0x7feece14(%eax)
801069d3:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801069d6:	c7 80 f0 31 11 80 ff 	movl   $0xffff,-0x7feece10(%eax)
801069dd:	ff 00 00 
801069e0:	c7 80 f4 31 11 80 00 	movl   $0xcff200,-0x7feece0c(%eax)
801069e7:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
801069ea:	05 d0 31 11 80       	add    $0x801131d0,%eax
  pd[1] = (uint)p;
801069ef:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
801069f3:	c1 e8 10             	shr    $0x10,%eax
801069f6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
801069fa:	8d 45 f2             	lea    -0xe(%ebp),%eax
801069fd:	0f 01 10             	lgdtl  (%eax)
}
80106a00:	c9                   	leave  
80106a01:	c3                   	ret    
80106a02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a10 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106a10:	a1 84 5f 11 80       	mov    0x80115f84,%eax
{
80106a15:	55                   	push   %ebp
80106a16:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106a18:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106a1d:	0f 22 d8             	mov    %eax,%cr3
}
80106a20:	5d                   	pop    %ebp
80106a21:	c3                   	ret    
80106a22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a30 <switchuvm>:
{
80106a30:	55                   	push   %ebp
80106a31:	89 e5                	mov    %esp,%ebp
80106a33:	57                   	push   %edi
80106a34:	56                   	push   %esi
80106a35:	53                   	push   %ebx
80106a36:	83 ec 1c             	sub    $0x1c,%esp
80106a39:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106a3c:	85 db                	test   %ebx,%ebx
80106a3e:	0f 84 cb 00 00 00    	je     80106b0f <switchuvm+0xdf>
  if(p->kstack == 0)
80106a44:	8b 43 08             	mov    0x8(%ebx),%eax
80106a47:	85 c0                	test   %eax,%eax
80106a49:	0f 84 da 00 00 00    	je     80106b29 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106a4f:	8b 43 04             	mov    0x4(%ebx),%eax
80106a52:	85 c0                	test   %eax,%eax
80106a54:	0f 84 c2 00 00 00    	je     80106b1c <switchuvm+0xec>
  pushcli();
80106a5a:	e8 d1 d9 ff ff       	call   80104430 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106a5f:	e8 bc cd ff ff       	call   80103820 <mycpu>
80106a64:	89 c6                	mov    %eax,%esi
80106a66:	e8 b5 cd ff ff       	call   80103820 <mycpu>
80106a6b:	89 c7                	mov    %eax,%edi
80106a6d:	e8 ae cd ff ff       	call   80103820 <mycpu>
80106a72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106a75:	83 c7 08             	add    $0x8,%edi
80106a78:	e8 a3 cd ff ff       	call   80103820 <mycpu>
80106a7d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106a80:	83 c0 08             	add    $0x8,%eax
80106a83:	ba 67 00 00 00       	mov    $0x67,%edx
80106a88:	c1 e8 18             	shr    $0x18,%eax
80106a8b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106a92:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106a99:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106a9f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106aa4:	83 c1 08             	add    $0x8,%ecx
80106aa7:	c1 e9 10             	shr    $0x10,%ecx
80106aaa:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106ab0:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106ab5:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106abc:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80106ac1:	e8 5a cd ff ff       	call   80103820 <mycpu>
80106ac6:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106acd:	e8 4e cd ff ff       	call   80103820 <mycpu>
80106ad2:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106ad6:	8b 73 08             	mov    0x8(%ebx),%esi
80106ad9:	e8 42 cd ff ff       	call   80103820 <mycpu>
80106ade:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106ae4:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106ae7:	e8 34 cd ff ff       	call   80103820 <mycpu>
80106aec:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106af0:	b8 28 00 00 00       	mov    $0x28,%eax
80106af5:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106af8:	8b 43 04             	mov    0x4(%ebx),%eax
80106afb:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106b00:	0f 22 d8             	mov    %eax,%cr3
}
80106b03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b06:	5b                   	pop    %ebx
80106b07:	5e                   	pop    %esi
80106b08:	5f                   	pop    %edi
80106b09:	5d                   	pop    %ebp
  popcli();
80106b0a:	e9 61 d9 ff ff       	jmp    80104470 <popcli>
    panic("switchuvm: no process");
80106b0f:	83 ec 0c             	sub    $0xc,%esp
80106b12:	68 ba 7b 10 80       	push   $0x80107bba
80106b17:	e8 74 98 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
80106b1c:	83 ec 0c             	sub    $0xc,%esp
80106b1f:	68 e5 7b 10 80       	push   $0x80107be5
80106b24:	e8 67 98 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
80106b29:	83 ec 0c             	sub    $0xc,%esp
80106b2c:	68 d0 7b 10 80       	push   $0x80107bd0
80106b31:	e8 5a 98 ff ff       	call   80100390 <panic>
80106b36:	8d 76 00             	lea    0x0(%esi),%esi
80106b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b40 <inituvm>:
{
80106b40:	55                   	push   %ebp
80106b41:	89 e5                	mov    %esp,%ebp
80106b43:	57                   	push   %edi
80106b44:	56                   	push   %esi
80106b45:	53                   	push   %ebx
80106b46:	83 ec 1c             	sub    $0x1c,%esp
80106b49:	8b 75 10             	mov    0x10(%ebp),%esi
80106b4c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b4f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106b52:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80106b58:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106b5b:	77 49                	ja     80106ba6 <inituvm+0x66>
  mem = kalloc();
80106b5d:	e8 ce b9 ff ff       	call   80102530 <kalloc>
  memset(mem, 0, PGSIZE);
80106b62:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106b65:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106b67:	68 00 10 00 00       	push   $0x1000
80106b6c:	6a 00                	push   $0x0
80106b6e:	50                   	push   %eax
80106b6f:	e8 9c da ff ff       	call   80104610 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106b74:	58                   	pop    %eax
80106b75:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106b7b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b80:	5a                   	pop    %edx
80106b81:	6a 06                	push   $0x6
80106b83:	50                   	push   %eax
80106b84:	31 d2                	xor    %edx,%edx
80106b86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b89:	e8 c2 fc ff ff       	call   80106850 <mappages>
  memmove(mem, init, sz);
80106b8e:	89 75 10             	mov    %esi,0x10(%ebp)
80106b91:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106b94:	83 c4 10             	add    $0x10,%esp
80106b97:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106b9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b9d:	5b                   	pop    %ebx
80106b9e:	5e                   	pop    %esi
80106b9f:	5f                   	pop    %edi
80106ba0:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106ba1:	e9 1a db ff ff       	jmp    801046c0 <memmove>
    panic("inituvm: more than a page");
80106ba6:	83 ec 0c             	sub    $0xc,%esp
80106ba9:	68 f9 7b 10 80       	push   $0x80107bf9
80106bae:	e8 dd 97 ff ff       	call   80100390 <panic>
80106bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106bc0 <loaduvm>:
{
80106bc0:	55                   	push   %ebp
80106bc1:	89 e5                	mov    %esp,%ebp
80106bc3:	57                   	push   %edi
80106bc4:	56                   	push   %esi
80106bc5:	53                   	push   %ebx
80106bc6:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80106bc9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106bd0:	0f 85 91 00 00 00    	jne    80106c67 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80106bd6:	8b 75 18             	mov    0x18(%ebp),%esi
80106bd9:	31 db                	xor    %ebx,%ebx
80106bdb:	85 f6                	test   %esi,%esi
80106bdd:	75 1a                	jne    80106bf9 <loaduvm+0x39>
80106bdf:	eb 6f                	jmp    80106c50 <loaduvm+0x90>
80106be1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106be8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106bee:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106bf4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106bf7:	76 57                	jbe    80106c50 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106bf9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106bfc:	8b 45 08             	mov    0x8(%ebp),%eax
80106bff:	31 c9                	xor    %ecx,%ecx
80106c01:	01 da                	add    %ebx,%edx
80106c03:	e8 c8 fb ff ff       	call   801067d0 <walkpgdir>
80106c08:	85 c0                	test   %eax,%eax
80106c0a:	74 4e                	je     80106c5a <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
80106c0c:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106c0e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80106c11:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106c16:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106c1b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106c21:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106c24:	01 d9                	add    %ebx,%ecx
80106c26:	05 00 00 00 80       	add    $0x80000000,%eax
80106c2b:	57                   	push   %edi
80106c2c:	51                   	push   %ecx
80106c2d:	50                   	push   %eax
80106c2e:	ff 75 10             	pushl  0x10(%ebp)
80106c31:	e8 9a ad ff ff       	call   801019d0 <readi>
80106c36:	83 c4 10             	add    $0x10,%esp
80106c39:	39 f8                	cmp    %edi,%eax
80106c3b:	74 ab                	je     80106be8 <loaduvm+0x28>
}
80106c3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106c40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106c45:	5b                   	pop    %ebx
80106c46:	5e                   	pop    %esi
80106c47:	5f                   	pop    %edi
80106c48:	5d                   	pop    %ebp
80106c49:	c3                   	ret    
80106c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c50:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106c53:	31 c0                	xor    %eax,%eax
}
80106c55:	5b                   	pop    %ebx
80106c56:	5e                   	pop    %esi
80106c57:	5f                   	pop    %edi
80106c58:	5d                   	pop    %ebp
80106c59:	c3                   	ret    
      panic("loaduvm: address should exist");
80106c5a:	83 ec 0c             	sub    $0xc,%esp
80106c5d:	68 13 7c 10 80       	push   $0x80107c13
80106c62:	e8 29 97 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
80106c67:	83 ec 0c             	sub    $0xc,%esp
80106c6a:	68 b4 7c 10 80       	push   $0x80107cb4
80106c6f:	e8 1c 97 ff ff       	call   80100390 <panic>
80106c74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c80 <allocuvm>:
{
80106c80:	55                   	push   %ebp
80106c81:	89 e5                	mov    %esp,%ebp
80106c83:	57                   	push   %edi
80106c84:	56                   	push   %esi
80106c85:	53                   	push   %ebx
80106c86:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106c89:	8b 7d 10             	mov    0x10(%ebp),%edi
80106c8c:	85 ff                	test   %edi,%edi
80106c8e:	0f 88 8e 00 00 00    	js     80106d22 <allocuvm+0xa2>
  if(newsz < oldsz)
80106c94:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c97:	0f 82 93 00 00 00    	jb     80106d30 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
80106c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106ca0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106ca6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106cac:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106caf:	0f 86 7e 00 00 00    	jbe    80106d33 <allocuvm+0xb3>
80106cb5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106cb8:	8b 7d 08             	mov    0x8(%ebp),%edi
80106cbb:	eb 42                	jmp    80106cff <allocuvm+0x7f>
80106cbd:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80106cc0:	83 ec 04             	sub    $0x4,%esp
80106cc3:	68 00 10 00 00       	push   $0x1000
80106cc8:	6a 00                	push   $0x0
80106cca:	50                   	push   %eax
80106ccb:	e8 40 d9 ff ff       	call   80104610 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106cd0:	58                   	pop    %eax
80106cd1:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106cd7:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106cdc:	5a                   	pop    %edx
80106cdd:	6a 06                	push   $0x6
80106cdf:	50                   	push   %eax
80106ce0:	89 da                	mov    %ebx,%edx
80106ce2:	89 f8                	mov    %edi,%eax
80106ce4:	e8 67 fb ff ff       	call   80106850 <mappages>
80106ce9:	83 c4 10             	add    $0x10,%esp
80106cec:	85 c0                	test   %eax,%eax
80106cee:	78 50                	js     80106d40 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80106cf0:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106cf6:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106cf9:	0f 86 81 00 00 00    	jbe    80106d80 <allocuvm+0x100>
    mem = kalloc();
80106cff:	e8 2c b8 ff ff       	call   80102530 <kalloc>
    if(mem == 0){
80106d04:	85 c0                	test   %eax,%eax
    mem = kalloc();
80106d06:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106d08:	75 b6                	jne    80106cc0 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80106d0a:	83 ec 0c             	sub    $0xc,%esp
80106d0d:	68 31 7c 10 80       	push   $0x80107c31
80106d12:	e8 49 99 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106d17:	83 c4 10             	add    $0x10,%esp
80106d1a:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d1d:	39 45 10             	cmp    %eax,0x10(%ebp)
80106d20:	77 6e                	ja     80106d90 <allocuvm+0x110>
}
80106d22:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80106d25:	31 ff                	xor    %edi,%edi
}
80106d27:	89 f8                	mov    %edi,%eax
80106d29:	5b                   	pop    %ebx
80106d2a:	5e                   	pop    %esi
80106d2b:	5f                   	pop    %edi
80106d2c:	5d                   	pop    %ebp
80106d2d:	c3                   	ret    
80106d2e:	66 90                	xchg   %ax,%ax
    return oldsz;
80106d30:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
80106d33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d36:	89 f8                	mov    %edi,%eax
80106d38:	5b                   	pop    %ebx
80106d39:	5e                   	pop    %esi
80106d3a:	5f                   	pop    %edi
80106d3b:	5d                   	pop    %ebp
80106d3c:	c3                   	ret    
80106d3d:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106d40:	83 ec 0c             	sub    $0xc,%esp
80106d43:	68 49 7c 10 80       	push   $0x80107c49
80106d48:	e8 13 99 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106d4d:	83 c4 10             	add    $0x10,%esp
80106d50:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d53:	39 45 10             	cmp    %eax,0x10(%ebp)
80106d56:	76 0d                	jbe    80106d65 <allocuvm+0xe5>
80106d58:	89 c1                	mov    %eax,%ecx
80106d5a:	8b 55 10             	mov    0x10(%ebp),%edx
80106d5d:	8b 45 08             	mov    0x8(%ebp),%eax
80106d60:	e8 7b fb ff ff       	call   801068e0 <deallocuvm.part.0>
      kfree(mem);
80106d65:	83 ec 0c             	sub    $0xc,%esp
      return 0;
80106d68:	31 ff                	xor    %edi,%edi
      kfree(mem);
80106d6a:	56                   	push   %esi
80106d6b:	e8 10 b6 ff ff       	call   80102380 <kfree>
      return 0;
80106d70:	83 c4 10             	add    $0x10,%esp
}
80106d73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d76:	89 f8                	mov    %edi,%eax
80106d78:	5b                   	pop    %ebx
80106d79:	5e                   	pop    %esi
80106d7a:	5f                   	pop    %edi
80106d7b:	5d                   	pop    %ebp
80106d7c:	c3                   	ret    
80106d7d:	8d 76 00             	lea    0x0(%esi),%esi
80106d80:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106d83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d86:	5b                   	pop    %ebx
80106d87:	89 f8                	mov    %edi,%eax
80106d89:	5e                   	pop    %esi
80106d8a:	5f                   	pop    %edi
80106d8b:	5d                   	pop    %ebp
80106d8c:	c3                   	ret    
80106d8d:	8d 76 00             	lea    0x0(%esi),%esi
80106d90:	89 c1                	mov    %eax,%ecx
80106d92:	8b 55 10             	mov    0x10(%ebp),%edx
80106d95:	8b 45 08             	mov    0x8(%ebp),%eax
      return 0;
80106d98:	31 ff                	xor    %edi,%edi
80106d9a:	e8 41 fb ff ff       	call   801068e0 <deallocuvm.part.0>
80106d9f:	eb 92                	jmp    80106d33 <allocuvm+0xb3>
80106da1:	eb 0d                	jmp    80106db0 <deallocuvm>
80106da3:	90                   	nop
80106da4:	90                   	nop
80106da5:	90                   	nop
80106da6:	90                   	nop
80106da7:	90                   	nop
80106da8:	90                   	nop
80106da9:	90                   	nop
80106daa:	90                   	nop
80106dab:	90                   	nop
80106dac:	90                   	nop
80106dad:	90                   	nop
80106dae:	90                   	nop
80106daf:	90                   	nop

80106db0 <deallocuvm>:
{
80106db0:	55                   	push   %ebp
80106db1:	89 e5                	mov    %esp,%ebp
80106db3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106db6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106db9:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106dbc:	39 d1                	cmp    %edx,%ecx
80106dbe:	73 10                	jae    80106dd0 <deallocuvm+0x20>
}
80106dc0:	5d                   	pop    %ebp
80106dc1:	e9 1a fb ff ff       	jmp    801068e0 <deallocuvm.part.0>
80106dc6:	8d 76 00             	lea    0x0(%esi),%esi
80106dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106dd0:	89 d0                	mov    %edx,%eax
80106dd2:	5d                   	pop    %ebp
80106dd3:	c3                   	ret    
80106dd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106dda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106de0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106de0:	55                   	push   %ebp
80106de1:	89 e5                	mov    %esp,%ebp
80106de3:	57                   	push   %edi
80106de4:	56                   	push   %esi
80106de5:	53                   	push   %ebx
80106de6:	83 ec 0c             	sub    $0xc,%esp
80106de9:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106dec:	85 f6                	test   %esi,%esi
80106dee:	74 59                	je     80106e49 <freevm+0x69>
80106df0:	31 c9                	xor    %ecx,%ecx
80106df2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106df7:	89 f0                	mov    %esi,%eax
80106df9:	e8 e2 fa ff ff       	call   801068e0 <deallocuvm.part.0>
80106dfe:	89 f3                	mov    %esi,%ebx
80106e00:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106e06:	eb 0f                	jmp    80106e17 <freevm+0x37>
80106e08:	90                   	nop
80106e09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e10:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106e13:	39 fb                	cmp    %edi,%ebx
80106e15:	74 23                	je     80106e3a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106e17:	8b 03                	mov    (%ebx),%eax
80106e19:	a8 01                	test   $0x1,%al
80106e1b:	74 f3                	je     80106e10 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106e1d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80106e22:	83 ec 0c             	sub    $0xc,%esp
80106e25:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106e28:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106e2d:	50                   	push   %eax
80106e2e:	e8 4d b5 ff ff       	call   80102380 <kfree>
80106e33:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80106e36:	39 fb                	cmp    %edi,%ebx
80106e38:	75 dd                	jne    80106e17 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
80106e3a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106e3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e40:	5b                   	pop    %ebx
80106e41:	5e                   	pop    %esi
80106e42:	5f                   	pop    %edi
80106e43:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106e44:	e9 37 b5 ff ff       	jmp    80102380 <kfree>
    panic("freevm: no pgdir");
80106e49:	83 ec 0c             	sub    $0xc,%esp
80106e4c:	68 65 7c 10 80       	push   $0x80107c65
80106e51:	e8 3a 95 ff ff       	call   80100390 <panic>
80106e56:	8d 76 00             	lea    0x0(%esi),%esi
80106e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e60 <setupkvm>:
{
80106e60:	55                   	push   %ebp
80106e61:	89 e5                	mov    %esp,%ebp
80106e63:	56                   	push   %esi
80106e64:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106e65:	e8 c6 b6 ff ff       	call   80102530 <kalloc>
80106e6a:	85 c0                	test   %eax,%eax
80106e6c:	89 c6                	mov    %eax,%esi
80106e6e:	74 42                	je     80106eb2 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80106e70:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106e73:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
80106e78:	68 00 10 00 00       	push   $0x1000
80106e7d:	6a 00                	push   $0x0
80106e7f:	50                   	push   %eax
80106e80:	e8 8b d7 ff ff       	call   80104610 <memset>
80106e85:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80106e88:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106e8b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106e8e:	83 ec 08             	sub    $0x8,%esp
80106e91:	8b 13                	mov    (%ebx),%edx
80106e93:	ff 73 0c             	pushl  0xc(%ebx)
80106e96:	50                   	push   %eax
80106e97:	29 c1                	sub    %eax,%ecx
80106e99:	89 f0                	mov    %esi,%eax
80106e9b:	e8 b0 f9 ff ff       	call   80106850 <mappages>
80106ea0:	83 c4 10             	add    $0x10,%esp
80106ea3:	85 c0                	test   %eax,%eax
80106ea5:	78 19                	js     80106ec0 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106ea7:	83 c3 10             	add    $0x10,%ebx
80106eaa:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106eb0:	75 d6                	jne    80106e88 <setupkvm+0x28>
}
80106eb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106eb5:	89 f0                	mov    %esi,%eax
80106eb7:	5b                   	pop    %ebx
80106eb8:	5e                   	pop    %esi
80106eb9:	5d                   	pop    %ebp
80106eba:	c3                   	ret    
80106ebb:	90                   	nop
80106ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80106ec0:	83 ec 0c             	sub    $0xc,%esp
80106ec3:	56                   	push   %esi
      return 0;
80106ec4:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80106ec6:	e8 15 ff ff ff       	call   80106de0 <freevm>
      return 0;
80106ecb:	83 c4 10             	add    $0x10,%esp
}
80106ece:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106ed1:	89 f0                	mov    %esi,%eax
80106ed3:	5b                   	pop    %ebx
80106ed4:	5e                   	pop    %esi
80106ed5:	5d                   	pop    %ebp
80106ed6:	c3                   	ret    
80106ed7:	89 f6                	mov    %esi,%esi
80106ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ee0 <kvmalloc>:
{
80106ee0:	55                   	push   %ebp
80106ee1:	89 e5                	mov    %esp,%ebp
80106ee3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106ee6:	e8 75 ff ff ff       	call   80106e60 <setupkvm>
80106eeb:	a3 84 5f 11 80       	mov    %eax,0x80115f84
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106ef0:	05 00 00 00 80       	add    $0x80000000,%eax
80106ef5:	0f 22 d8             	mov    %eax,%cr3
}
80106ef8:	c9                   	leave  
80106ef9:	c3                   	ret    
80106efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f00 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106f00:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f01:	31 c9                	xor    %ecx,%ecx
{
80106f03:	89 e5                	mov    %esp,%ebp
80106f05:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106f08:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f0b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f0e:	e8 bd f8 ff ff       	call   801067d0 <walkpgdir>
  if(pte == 0)
80106f13:	85 c0                	test   %eax,%eax
80106f15:	74 05                	je     80106f1c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106f17:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106f1a:	c9                   	leave  
80106f1b:	c3                   	ret    
    panic("clearpteu");
80106f1c:	83 ec 0c             	sub    $0xc,%esp
80106f1f:	68 76 7c 10 80       	push   $0x80107c76
80106f24:	e8 67 94 ff ff       	call   80100390 <panic>
80106f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106f30 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106f30:	55                   	push   %ebp
80106f31:	89 e5                	mov    %esp,%ebp
80106f33:	57                   	push   %edi
80106f34:	56                   	push   %esi
80106f35:	53                   	push   %ebx
80106f36:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106f39:	e8 22 ff ff ff       	call   80106e60 <setupkvm>
80106f3e:	85 c0                	test   %eax,%eax
80106f40:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106f43:	0f 84 9f 00 00 00    	je     80106fe8 <copyuvm+0xb8>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f49:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f4c:	85 c9                	test   %ecx,%ecx
80106f4e:	0f 84 94 00 00 00    	je     80106fe8 <copyuvm+0xb8>
80106f54:	31 ff                	xor    %edi,%edi
80106f56:	eb 4a                	jmp    80106fa2 <copyuvm+0x72>
80106f58:	90                   	nop
80106f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106f60:	83 ec 04             	sub    $0x4,%esp
80106f63:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106f69:	68 00 10 00 00       	push   $0x1000
80106f6e:	53                   	push   %ebx
80106f6f:	50                   	push   %eax
80106f70:	e8 4b d7 ff ff       	call   801046c0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106f75:	58                   	pop    %eax
80106f76:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f7c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f81:	5a                   	pop    %edx
80106f82:	ff 75 e4             	pushl  -0x1c(%ebp)
80106f85:	50                   	push   %eax
80106f86:	89 fa                	mov    %edi,%edx
80106f88:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f8b:	e8 c0 f8 ff ff       	call   80106850 <mappages>
80106f90:	83 c4 10             	add    $0x10,%esp
80106f93:	85 c0                	test   %eax,%eax
80106f95:	78 61                	js     80106ff8 <copyuvm+0xc8>
  for(i = 0; i < sz; i += PGSIZE){
80106f97:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106f9d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106fa0:	76 46                	jbe    80106fe8 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106fa2:	8b 45 08             	mov    0x8(%ebp),%eax
80106fa5:	31 c9                	xor    %ecx,%ecx
80106fa7:	89 fa                	mov    %edi,%edx
80106fa9:	e8 22 f8 ff ff       	call   801067d0 <walkpgdir>
80106fae:	85 c0                	test   %eax,%eax
80106fb0:	74 61                	je     80107013 <copyuvm+0xe3>
    if(!(*pte & PTE_P))
80106fb2:	8b 00                	mov    (%eax),%eax
80106fb4:	a8 01                	test   $0x1,%al
80106fb6:	74 4e                	je     80107006 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
80106fb8:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
80106fba:	25 ff 0f 00 00       	and    $0xfff,%eax
    pa = PTE_ADDR(*pte);
80106fbf:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80106fc5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80106fc8:	e8 63 b5 ff ff       	call   80102530 <kalloc>
80106fcd:	85 c0                	test   %eax,%eax
80106fcf:	89 c6                	mov    %eax,%esi
80106fd1:	75 8d                	jne    80106f60 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80106fd3:	83 ec 0c             	sub    $0xc,%esp
80106fd6:	ff 75 e0             	pushl  -0x20(%ebp)
80106fd9:	e8 02 fe ff ff       	call   80106de0 <freevm>
  return 0;
80106fde:	83 c4 10             	add    $0x10,%esp
80106fe1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80106fe8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106feb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fee:	5b                   	pop    %ebx
80106fef:	5e                   	pop    %esi
80106ff0:	5f                   	pop    %edi
80106ff1:	5d                   	pop    %ebp
80106ff2:	c3                   	ret    
80106ff3:	90                   	nop
80106ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80106ff8:	83 ec 0c             	sub    $0xc,%esp
80106ffb:	56                   	push   %esi
80106ffc:	e8 7f b3 ff ff       	call   80102380 <kfree>
      goto bad;
80107001:	83 c4 10             	add    $0x10,%esp
80107004:	eb cd                	jmp    80106fd3 <copyuvm+0xa3>
      panic("copyuvm: page not present");
80107006:	83 ec 0c             	sub    $0xc,%esp
80107009:	68 9a 7c 10 80       	push   $0x80107c9a
8010700e:	e8 7d 93 ff ff       	call   80100390 <panic>
      panic("copyuvm: pte should exist");
80107013:	83 ec 0c             	sub    $0xc,%esp
80107016:	68 80 7c 10 80       	push   $0x80107c80
8010701b:	e8 70 93 ff ff       	call   80100390 <panic>

80107020 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107020:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107021:	31 c9                	xor    %ecx,%ecx
{
80107023:	89 e5                	mov    %esp,%ebp
80107025:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107028:	8b 55 0c             	mov    0xc(%ebp),%edx
8010702b:	8b 45 08             	mov    0x8(%ebp),%eax
8010702e:	e8 9d f7 ff ff       	call   801067d0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107033:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107035:	c9                   	leave  
  if((*pte & PTE_U) == 0)
80107036:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107038:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
8010703d:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107040:	05 00 00 00 80       	add    $0x80000000,%eax
80107045:	83 fa 05             	cmp    $0x5,%edx
80107048:	ba 00 00 00 00       	mov    $0x0,%edx
8010704d:	0f 45 c2             	cmovne %edx,%eax
}
80107050:	c3                   	ret    
80107051:	eb 0d                	jmp    80107060 <copyout>
80107053:	90                   	nop
80107054:	90                   	nop
80107055:	90                   	nop
80107056:	90                   	nop
80107057:	90                   	nop
80107058:	90                   	nop
80107059:	90                   	nop
8010705a:	90                   	nop
8010705b:	90                   	nop
8010705c:	90                   	nop
8010705d:	90                   	nop
8010705e:	90                   	nop
8010705f:	90                   	nop

80107060 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107060:	55                   	push   %ebp
80107061:	89 e5                	mov    %esp,%ebp
80107063:	57                   	push   %edi
80107064:	56                   	push   %esi
80107065:	53                   	push   %ebx
80107066:	83 ec 1c             	sub    $0x1c,%esp
80107069:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010706c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010706f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107072:	85 db                	test   %ebx,%ebx
80107074:	75 40                	jne    801070b6 <copyout+0x56>
80107076:	eb 70                	jmp    801070e8 <copyout+0x88>
80107078:	90                   	nop
80107079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107080:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107083:	89 f1                	mov    %esi,%ecx
80107085:	29 d1                	sub    %edx,%ecx
80107087:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010708d:	39 d9                	cmp    %ebx,%ecx
8010708f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107092:	29 f2                	sub    %esi,%edx
80107094:	83 ec 04             	sub    $0x4,%esp
80107097:	01 d0                	add    %edx,%eax
80107099:	51                   	push   %ecx
8010709a:	57                   	push   %edi
8010709b:	50                   	push   %eax
8010709c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010709f:	e8 1c d6 ff ff       	call   801046c0 <memmove>
    len -= n;
    buf += n;
801070a4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
801070a7:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
801070aa:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
801070b0:	01 cf                	add    %ecx,%edi
  while(len > 0){
801070b2:	29 cb                	sub    %ecx,%ebx
801070b4:	74 32                	je     801070e8 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801070b6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801070b8:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
801070bb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801070be:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801070c4:	56                   	push   %esi
801070c5:	ff 75 08             	pushl  0x8(%ebp)
801070c8:	e8 53 ff ff ff       	call   80107020 <uva2ka>
    if(pa0 == 0)
801070cd:	83 c4 10             	add    $0x10,%esp
801070d0:	85 c0                	test   %eax,%eax
801070d2:	75 ac                	jne    80107080 <copyout+0x20>
  }
  return 0;
}
801070d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801070d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801070dc:	5b                   	pop    %ebx
801070dd:	5e                   	pop    %esi
801070de:	5f                   	pop    %edi
801070df:	5d                   	pop    %ebp
801070e0:	c3                   	ret    
801070e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801070eb:	31 c0                	xor    %eax,%eax
}
801070ed:	5b                   	pop    %ebx
801070ee:	5e                   	pop    %esi
801070ef:	5f                   	pop    %edi
801070f0:	5d                   	pop    %ebp
801070f1:	c3                   	ret    
801070f2:	66 90                	xchg   %ax,%ax
801070f4:	66 90                	xchg   %ax,%ax
801070f6:	66 90                	xchg   %ax,%ax
801070f8:	66 90                	xchg   %ax,%ax
801070fa:	66 90                	xchg   %ax,%ax
801070fc:	66 90                	xchg   %ax,%ax
801070fe:	66 90                	xchg   %ax,%ax

80107100 <sgenrand>:
80107100:	55                   	push   %ebp
80107101:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
80107106:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
8010710b:	89 e5                	mov    %esp,%ebp
8010710d:	8b 55 08             	mov    0x8(%ebp),%edx
80107110:	89 15 e0 a5 10 80    	mov    %edx,0x8010a5e0
80107116:	eb 0b                	jmp    80107123 <sgenrand+0x23>
80107118:	90                   	nop
80107119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107120:	83 c0 04             	add    $0x4,%eax
80107123:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
80107129:	39 c1                	cmp    %eax,%ecx
8010712b:	89 10                	mov    %edx,(%eax)
8010712d:	75 f1                	jne    80107120 <sgenrand+0x20>
8010712f:	c7 05 60 a4 10 80 70 	movl   $0x270,0x8010a460
80107136:	02 00 00 
80107139:	5d                   	pop    %ebp
8010713a:	c3                   	ret    
8010713b:	90                   	nop
8010713c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107140 <genrand>:
80107140:	a1 60 a4 10 80       	mov    0x8010a460,%eax
80107145:	55                   	push   %ebp
80107146:	89 e5                	mov    %esp,%ebp
80107148:	56                   	push   %esi
80107149:	53                   	push   %ebx
8010714a:	3d 6f 02 00 00       	cmp    $0x26f,%eax
8010714f:	0f 8e f9 00 00 00    	jle    8010724e <genrand+0x10e>
80107155:	3d 71 02 00 00       	cmp    $0x271,%eax
8010715a:	0f 84 fa 00 00 00    	je     8010725a <genrand+0x11a>
80107160:	ba e0 a5 10 80       	mov    $0x8010a5e0,%edx
80107165:	bb 6c a9 10 80       	mov    $0x8010a96c,%ebx
8010716a:	89 d1                	mov    %edx,%ecx
8010716c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107170:	8b 01                	mov    (%ecx),%eax
80107172:	8b 71 04             	mov    0x4(%ecx),%esi
80107175:	83 c1 04             	add    $0x4,%ecx
80107178:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
8010717e:	25 00 00 00 80       	and    $0x80000000,%eax
80107183:	09 f0                	or     %esi,%eax
80107185:	89 c6                	mov    %eax,%esi
80107187:	83 e0 01             	and    $0x1,%eax
8010718a:	d1 ee                	shr    %esi
8010718c:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
80107192:	33 34 85 d8 7c 10 80 	xor    -0x7fef8328(,%eax,4),%esi
80107199:	89 71 fc             	mov    %esi,-0x4(%ecx)
8010719c:	39 cb                	cmp    %ecx,%ebx
8010719e:	75 d0                	jne    80107170 <genrand+0x30>
801071a0:	b9 10 ac 10 80       	mov    $0x8010ac10,%ecx
801071a5:	8d 76 00             	lea    0x0(%esi),%esi
801071a8:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
801071ae:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
801071b4:	83 c2 04             	add    $0x4,%edx
801071b7:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
801071bd:	25 00 00 00 80       	and    $0x80000000,%eax
801071c2:	09 d8                	or     %ebx,%eax
801071c4:	89 c3                	mov    %eax,%ebx
801071c6:	83 e0 01             	and    $0x1,%eax
801071c9:	d1 eb                	shr    %ebx
801071cb:	33 5a fc             	xor    -0x4(%edx),%ebx
801071ce:	33 1c 85 d8 7c 10 80 	xor    -0x7fef8328(,%eax,4),%ebx
801071d5:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
801071db:	39 d1                	cmp    %edx,%ecx
801071dd:	75 c9                	jne    801071a8 <genrand+0x68>
801071df:	a1 e0 a5 10 80       	mov    0x8010a5e0,%eax
801071e4:	8b 0d 9c af 10 80    	mov    0x8010af9c,%ecx
801071ea:	89 c2                	mov    %eax,%edx
801071ec:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
801071f2:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
801071f8:	09 d1                	or     %edx,%ecx
801071fa:	89 ca                	mov    %ecx,%edx
801071fc:	83 e1 01             	and    $0x1,%ecx
801071ff:	d1 ea                	shr    %edx
80107201:	33 15 10 ac 10 80    	xor    0x8010ac10,%edx
80107207:	33 14 8d d8 7c 10 80 	xor    -0x7fef8328(,%ecx,4),%edx
8010720e:	89 15 9c af 10 80    	mov    %edx,0x8010af9c
80107214:	ba 01 00 00 00       	mov    $0x1,%edx
80107219:	89 15 60 a4 10 80    	mov    %edx,0x8010a460
8010721f:	89 c2                	mov    %eax,%edx
80107221:	c1 ea 0b             	shr    $0xb,%edx
80107224:	31 c2                	xor    %eax,%edx
80107226:	89 d0                	mov    %edx,%eax
80107228:	c1 e0 07             	shl    $0x7,%eax
8010722b:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
80107230:	31 c2                	xor    %eax,%edx
80107232:	89 d0                	mov    %edx,%eax
80107234:	c1 e0 0f             	shl    $0xf,%eax
80107237:	25 00 00 c6 ef       	and    $0xefc60000,%eax
8010723c:	31 d0                	xor    %edx,%eax
8010723e:	89 c2                	mov    %eax,%edx
80107240:	c1 ea 12             	shr    $0x12,%edx
80107243:	31 d0                	xor    %edx,%eax
80107245:	5b                   	pop    %ebx
80107246:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
8010724b:	5e                   	pop    %esi
8010724c:	5d                   	pop    %ebp
8010724d:	c3                   	ret    
8010724e:	8d 50 01             	lea    0x1(%eax),%edx
80107251:	8b 04 85 e0 a5 10 80 	mov    -0x7fef5a20(,%eax,4),%eax
80107258:	eb bf                	jmp    80107219 <genrand+0xd9>
8010725a:	c7 05 e0 a5 10 80 05 	movl   $0x1105,0x8010a5e0
80107261:	11 00 00 
80107264:	b8 e4 a5 10 80       	mov    $0x8010a5e4,%eax
80107269:	b9 9c af 10 80       	mov    $0x8010af9c,%ecx
8010726e:	ba 05 11 00 00       	mov    $0x1105,%edx
80107273:	eb 06                	jmp    8010727b <genrand+0x13b>
80107275:	8d 76 00             	lea    0x0(%esi),%esi
80107278:	83 c0 04             	add    $0x4,%eax
8010727b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
80107281:	39 c1                	cmp    %eax,%ecx
80107283:	89 10                	mov    %edx,(%eax)
80107285:	75 f1                	jne    80107278 <genrand+0x138>
80107287:	e9 d4 fe ff ff       	jmp    80107160 <genrand+0x20>
8010728c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107290 <random_at_most>:
80107290:	55                   	push   %ebp
80107291:	31 d2                	xor    %edx,%edx
80107293:	89 e5                	mov    %esp,%ebp
80107295:	56                   	push   %esi
80107296:	53                   	push   %ebx
80107297:	8b 45 08             	mov    0x8(%ebp),%eax
8010729a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
8010729f:	8d 48 01             	lea    0x1(%eax),%ecx
801072a2:	89 d8                	mov    %ebx,%eax
801072a4:	f7 f1                	div    %ecx
801072a6:	89 c6                	mov    %eax,%esi
801072a8:	29 d3                	sub    %edx,%ebx
801072aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801072b0:	e8 8b fe ff ff       	call   80107140 <genrand>
801072b5:	39 d8                	cmp    %ebx,%eax
801072b7:	73 f7                	jae    801072b0 <random_at_most+0x20>
801072b9:	31 d2                	xor    %edx,%edx
801072bb:	f7 f6                	div    %esi
801072bd:	5b                   	pop    %ebx
801072be:	5e                   	pop    %esi
801072bf:	5d                   	pop    %ebp
801072c0:	c3                   	ret    
