
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc a0 cf 10 80       	mov    $0x8010cfa0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 30 2f 10 80       	mov    $0x80102f30,%eax
  jmp *%eax
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
8010004c:	68 00 79 10 80       	push   $0x80107900
80100051:	68 a0 cf 10 80       	push   $0x8010cfa0
80100056:	e8 45 46 00 00       	call   801046a0 <initlock>
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
80100092:	68 07 79 10 80       	push   $0x80107907
80100097:	50                   	push   %eax
80100098:	e8 d3 44 00 00       	call   80104570 <initsleeplock>
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
801000e4:	e8 f7 46 00 00       	call   801047e0 <acquire>
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
80100162:	e8 39 47 00 00       	call   801048a0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 3e 44 00 00       	call   801045b0 <acquiresleep>
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
80100193:	68 0e 79 10 80       	push   $0x8010790e
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
801001ae:	e8 9d 44 00 00       	call   80104650 <holdingsleep>
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
801001cc:	68 1f 79 10 80       	push   $0x8010791f
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
801001ef:	e8 5c 44 00 00       	call   80104650 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 0c 44 00 00       	call   80104610 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 a0 cf 10 80 	movl   $0x8010cfa0,(%esp)
8010020b:	e8 d0 45 00 00       	call   801047e0 <acquire>
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
8010025c:	e9 3f 46 00 00       	jmp    801048a0 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 26 79 10 80       	push   $0x80107926
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
8010028c:	e8 4f 45 00 00       	call   801047e0 <acquire>
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
801002ef:	e8 ac 45 00 00       	call   801048a0 <release>
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
8010034d:	e8 4e 45 00 00       	call   801048a0 <release>
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
801003b2:	68 2d 79 10 80       	push   $0x8010792d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 97 82 10 80 	movl   $0x80108297,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 e3 42 00 00       	call   801046c0 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 41 79 10 80       	push   $0x80107941
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
8010043a:	e8 31 5d 00 00       	call   80106170 <uartputc>
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
801004ec:	e8 7f 5c 00 00       	call   80106170 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 73 5c 00 00       	call   80106170 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 67 5c 00 00       	call   80106170 <uartputc>
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
80100524:	e8 77 44 00 00       	call   801049a0 <memmove>
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
80100541:	e8 aa 43 00 00       	call   801048f0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
    panic("pos under/overflow");
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 45 79 10 80       	push   $0x80107945
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
801005b1:	0f b6 92 70 79 10 80 	movzbl -0x7fef8690(%edx),%edx
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
8010061b:	e8 c0 41 00 00       	call   801047e0 <acquire>
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
80100647:	e8 54 42 00 00       	call   801048a0 <release>
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
8010071f:	e8 7c 41 00 00       	call   801048a0 <release>
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
80100810:	ba 58 79 10 80       	mov    $0x80107958,%edx
      for(; *s; s++)
80100815:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100818:	b8 28 00 00 00       	mov    $0x28,%eax
8010081d:	89 d3                	mov    %edx,%ebx
8010081f:	eb bf                	jmp    801007e0 <cprintf+0x180>
80100821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
80100828:	83 ec 0c             	sub    $0xc,%esp
8010082b:	68 20 b5 10 80       	push   $0x8010b520
80100830:	e8 ab 3f 00 00       	call   801047e0 <acquire>
80100835:	83 c4 10             	add    $0x10,%esp
80100838:	e9 3c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
8010083d:	83 ec 0c             	sub    $0xc,%esp
80100840:	68 5f 79 10 80       	push   $0x8010795f
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
80100863:	e8 78 3f 00 00       	call   801047e0 <acquire>
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
801008c8:	e8 d3 3f 00 00       	call   801048a0 <release>
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
80100a06:	68 68 79 10 80       	push   $0x80107968
80100a0b:	68 20 b5 10 80       	push   $0x8010b520
80100a10:	e8 8b 3c 00 00       	call   801046a0 <initlock>

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
80100ad4:	e8 e7 67 00 00       	call   801072c0 <setupkvm>
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
80100b3e:	e8 9d 65 00 00       	call   801070e0 <allocuvm>
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
80100b70:	e8 ab 64 00 00       	call   80107020 <loaduvm>
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
80100bba:	e8 81 66 00 00       	call   80107240 <freevm>
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
80100bf2:	e8 e9 64 00 00       	call   801070e0 <allocuvm>
80100bf7:	83 c4 10             	add    $0x10,%esp
80100bfa:	85 c0                	test   %eax,%eax
80100bfc:	89 c6                	mov    %eax,%esi
80100bfe:	75 3a                	jne    80100c3a <exec+0x1ea>
    freevm(pgdir);
80100c00:	83 ec 0c             	sub    $0xc,%esp
80100c03:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c09:	e8 32 66 00 00       	call   80107240 <freevm>
80100c0e:	83 c4 10             	add    $0x10,%esp
  return -1;
80100c11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c16:	e9 a1 fe ff ff       	jmp    80100abc <exec+0x6c>
    end_op();
80100c1b:	e8 80 20 00 00       	call   80102ca0 <end_op>
    cprintf("exec: fail\n");
80100c20:	83 ec 0c             	sub    $0xc,%esp
80100c23:	68 81 79 10 80       	push   $0x80107981
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
80100c4e:	e8 0d 67 00 00       	call   80107360 <clearpteu>
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
80100c81:	e8 8a 3e 00 00       	call   80104b10 <strlen>
80100c86:	f7 d0                	not    %eax
80100c88:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8d:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c8e:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c91:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c94:	e8 77 3e 00 00       	call   80104b10 <strlen>
80100c99:	83 c0 01             	add    $0x1,%eax
80100c9c:	50                   	push   %eax
80100c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100ca0:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ca3:	53                   	push   %ebx
80100ca4:	56                   	push   %esi
80100ca5:	e8 16 68 00 00       	call   801074c0 <copyout>
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
80100d0f:	e8 ac 67 00 00       	call   801074c0 <copyout>
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
80100d52:	e8 79 3d 00 00       	call   80104ad0 <safestrcpy>
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
80100d7c:	e8 0f 61 00 00       	call   80106e90 <switchuvm>
  freevm(oldpgdir);
80100d81:	89 3c 24             	mov    %edi,(%esp)
80100d84:	e8 b7 64 00 00       	call   80107240 <freevm>
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
80100da6:	68 8d 79 10 80       	push   $0x8010798d
80100dab:	68 a0 19 11 80       	push   $0x801119a0
80100db0:	e8 eb 38 00 00       	call   801046a0 <initlock>
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
80100dd1:	e8 0a 3a 00 00       	call   801047e0 <acquire>
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
80100e01:	e8 9a 3a 00 00       	call   801048a0 <release>
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
80100e1a:	e8 81 3a 00 00       	call   801048a0 <release>
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
80100e3f:	e8 9c 39 00 00       	call   801047e0 <acquire>
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
80100e5c:	e8 3f 3a 00 00       	call   801048a0 <release>
  return f;
}
80100e61:	89 d8                	mov    %ebx,%eax
80100e63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e66:	c9                   	leave  
80100e67:	c3                   	ret    
    panic("filedup");
80100e68:	83 ec 0c             	sub    $0xc,%esp
80100e6b:	68 94 79 10 80       	push   $0x80107994
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
80100e91:	e8 4a 39 00 00       	call   801047e0 <acquire>
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
80100ebc:	e9 df 39 00 00       	jmp    801048a0 <release>
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
80100ee8:	e8 b3 39 00 00       	call   801048a0 <release>
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
80100f42:	68 9c 79 10 80       	push   $0x8010799c
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
80101022:	68 a6 79 10 80       	push   $0x801079a6
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
80101135:	68 af 79 10 80       	push   $0x801079af
8010113a:	e8 51 f2 ff ff       	call   80100390 <panic>
  panic("filewrite");
8010113f:	83 ec 0c             	sub    $0xc,%esp
80101142:	68 b5 79 10 80       	push   $0x801079b5
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
801011b3:	68 bf 79 10 80       	push   $0x801079bf
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
80101264:	68 d2 79 10 80       	push   $0x801079d2
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
801012a5:	e8 46 36 00 00       	call   801048f0 <memset>
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
801012ea:	e8 f1 34 00 00       	call   801047e0 <acquire>
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
8010134f:	e8 4c 35 00 00       	call   801048a0 <release>

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
8010137d:	e8 1e 35 00 00       	call   801048a0 <release>
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
80101392:	68 e8 79 10 80       	push   $0x801079e8
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
80101467:	68 f8 79 10 80       	push   $0x801079f8
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
801014a1:	e8 fa 34 00 00       	call   801049a0 <memmove>
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
801014cc:	68 0b 7a 10 80       	push   $0x80107a0b
801014d1:	68 c0 23 11 80       	push   $0x801123c0
801014d6:	e8 c5 31 00 00       	call   801046a0 <initlock>
801014db:	83 c4 10             	add    $0x10,%esp
801014de:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
801014e0:	83 ec 08             	sub    $0x8,%esp
801014e3:	68 12 7a 10 80       	push   $0x80107a12
801014e8:	53                   	push   %ebx
801014e9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014ef:	e8 7c 30 00 00       	call   80104570 <initsleeplock>
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
80101539:	68 78 7a 10 80       	push   $0x80107a78
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
801015ce:	e8 1d 33 00 00       	call   801048f0 <memset>
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
80101603:	68 18 7a 10 80       	push   $0x80107a18
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
80101671:	e8 2a 33 00 00       	call   801049a0 <memmove>
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
8010169f:	e8 3c 31 00 00       	call   801047e0 <acquire>
  ip->ref++;
801016a4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016a8:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
801016af:	e8 ec 31 00 00       	call   801048a0 <release>
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
801016e2:	e8 c9 2e 00 00       	call   801045b0 <acquiresleep>
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
80101758:	e8 43 32 00 00       	call   801049a0 <memmove>
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
8010177d:	68 30 7a 10 80       	push   $0x80107a30
80101782:	e8 09 ec ff ff       	call   80100390 <panic>
    panic("ilock");
80101787:	83 ec 0c             	sub    $0xc,%esp
8010178a:	68 2a 7a 10 80       	push   $0x80107a2a
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
801017b3:	e8 98 2e 00 00       	call   80104650 <holdingsleep>
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
801017cf:	e9 3c 2e 00 00       	jmp    80104610 <releasesleep>
    panic("iunlock");
801017d4:	83 ec 0c             	sub    $0xc,%esp
801017d7:	68 3f 7a 10 80       	push   $0x80107a3f
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
80101800:	e8 ab 2d 00 00       	call   801045b0 <acquiresleep>
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
8010181a:	e8 f1 2d 00 00       	call   80104610 <releasesleep>
  acquire(&icache.lock);
8010181f:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
80101826:	e8 b5 2f 00 00       	call   801047e0 <acquire>
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
80101840:	e9 5b 30 00 00       	jmp    801048a0 <release>
80101845:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101848:	83 ec 0c             	sub    $0xc,%esp
8010184b:	68 c0 23 11 80       	push   $0x801123c0
80101850:	e8 8b 2f 00 00       	call   801047e0 <acquire>
    int r = ip->ref;
80101855:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101858:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
8010185f:	e8 3c 30 00 00       	call   801048a0 <release>
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
80101a47:	e8 54 2f 00 00       	call   801049a0 <memmove>
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
80101b43:	e8 58 2e 00 00       	call   801049a0 <memmove>
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
80101bde:	e8 2d 2e 00 00       	call   80104a10 <strncmp>
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
80101c3d:	e8 ce 2d 00 00       	call   80104a10 <strncmp>
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
80101c82:	68 59 7a 10 80       	push   $0x80107a59
80101c87:	e8 04 e7 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101c8c:	83 ec 0c             	sub    $0xc,%esp
80101c8f:	68 47 7a 10 80       	push   $0x80107a47
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
80101cc9:	e8 12 2b 00 00       	call   801047e0 <acquire>
  ip->ref++;
80101cce:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101cd2:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
80101cd9:	e8 c2 2b 00 00       	call   801048a0 <release>
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
80101d35:	e8 66 2c 00 00       	call   801049a0 <memmove>
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
80101dc8:	e8 d3 2b 00 00       	call   801049a0 <memmove>
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
80101ebd:	e8 ae 2b 00 00       	call   80104a70 <strncpy>
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
80101efb:	68 68 7a 10 80       	push   $0x80107a68
80101f00:	e8 8b e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101f05:	83 ec 0c             	sub    $0xc,%esp
80101f08:	68 7e 80 10 80       	push   $0x8010807e
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
8010201b:	68 d4 7a 10 80       	push   $0x80107ad4
80102020:	e8 6b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80102025:	83 ec 0c             	sub    $0xc,%esp
80102028:	68 cb 7a 10 80       	push   $0x80107acb
8010202d:	e8 5e e3 ff ff       	call   80100390 <panic>
80102032:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102040 <ideinit>:
{
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102046:	68 e6 7a 10 80       	push   $0x80107ae6
8010204b:	68 80 b5 10 80       	push   $0x8010b580
80102050:	e8 4b 26 00 00       	call   801046a0 <initlock>
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
801020ce:	e8 0d 27 00 00       	call   801047e0 <acquire>

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
8010214f:	e8 4c 27 00 00       	call   801048a0 <release>

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
8010216e:	e8 dd 24 00 00       	call   80104650 <holdingsleep>
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
801021a8:	e8 33 26 00 00       	call   801047e0 <acquire>

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
80102216:	e9 85 26 00 00       	jmp    801048a0 <release>
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
8010223a:	68 00 7b 10 80       	push   $0x80107b00
8010223f:	e8 4c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102244:	83 ec 0c             	sub    $0xc,%esp
80102247:	68 ea 7a 10 80       	push   $0x80107aea
8010224c:	e8 3f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102251:	83 ec 0c             	sub    $0xc,%esp
80102254:	68 15 7b 10 80       	push   $0x80107b15
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
801022a7:	68 34 7b 10 80       	push   $0x80107b34
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
80102382:	e8 69 25 00 00       	call   801048f0 <memset>

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
801023bb:	e9 e0 24 00 00       	jmp    801048a0 <release>
    acquire(&kmem.lock);
801023c0:	83 ec 0c             	sub    $0xc,%esp
801023c3:	68 20 40 11 80       	push   $0x80114020
801023c8:	e8 13 24 00 00       	call   801047e0 <acquire>
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	eb c2                	jmp    80102394 <kfree+0x44>
    panic("kfree");
801023d2:	83 ec 0c             	sub    $0xc,%esp
801023d5:	68 66 7b 10 80       	push   $0x80107b66
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
8010243b:	68 6c 7b 10 80       	push   $0x80107b6c
80102440:	68 20 40 11 80       	push   $0x80114020
80102445:	e8 56 22 00 00       	call   801046a0 <initlock>
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
80102533:	e8 a8 22 00 00       	call   801047e0 <acquire>
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
80102561:	e8 3a 23 00 00       	call   801048a0 <release>
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
801025b3:	0f b6 82 a0 7c 10 80 	movzbl -0x7fef8360(%edx),%eax
801025ba:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
801025bc:	0f b6 82 a0 7b 10 80 	movzbl -0x7fef8460(%edx),%eax
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
801025d3:	8b 04 85 80 7b 10 80 	mov    -0x7fef8480(,%eax,4),%eax
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
801025f8:	0f b6 82 a0 7c 10 80 	movzbl -0x7fef8360(%edx),%eax
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
80102977:	e8 c4 1f 00 00       	call   80104940 <memcmp>
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
80102af4:	e8 a7 1e 00 00       	call   801049a0 <memmove>
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
80102b9a:	68 a0 7d 10 80       	push   $0x80107da0
80102b9f:	68 60 40 11 80       	push   $0x80114060
80102ba4:	e8 f7 1a 00 00       	call   801046a0 <initlock>
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
80102c3b:	e8 a0 1b 00 00       	call   801047e0 <acquire>
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
80102c8c:	e8 0f 1c 00 00       	call   801048a0 <release>
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
80102cae:	e8 2d 1b 00 00       	call   801047e0 <acquire>
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
80102cec:	e8 af 1b 00 00       	call   801048a0 <release>
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
80102d46:	e8 55 1c 00 00       	call   801049a0 <memmove>
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
80102d8f:	e8 4c 1a 00 00       	call   801047e0 <acquire>
    wakeup(&log);
80102d94:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
    log.committing = 0;
80102d9b:	c7 05 a0 40 11 80 00 	movl   $0x0,0x801140a0
80102da2:	00 00 00 
    wakeup(&log);
80102da5:	e8 d6 12 00 00       	call   80104080 <wakeup>
    release(&log.lock);
80102daa:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
80102db1:	e8 ea 1a 00 00       	call   801048a0 <release>
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
80102ddc:	e8 bf 1a 00 00       	call   801048a0 <release>
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
80102def:	68 a4 7d 10 80       	push   $0x80107da4
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
80102e3e:	e8 9d 19 00 00       	call   801047e0 <acquire>
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
80102e8d:	e9 0e 1a 00 00       	jmp    801048a0 <release>
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
80102eb9:	68 b3 7d 10 80       	push   $0x80107db3
80102ebe:	e8 cd d4 ff ff       	call   80100390 <panic>
    panic("log_write outside of trans");
80102ec3:	83 ec 0c             	sub    $0xc,%esp
80102ec6:	68 c9 7d 10 80       	push   $0x80107dc9
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
80102ee8:	68 e4 7d 10 80       	push   $0x80107de4
80102eed:	e8 6e d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102ef2:	e8 89 2e 00 00       	call   80105d80 <idtinit>
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
80102f16:	e8 55 3f 00 00       	call   80106e70 <switchkvm>
  seginit();
80102f1b:	e8 c0 3e 00 00       	call   80106de0 <seginit>
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
80102f51:	e8 ea 43 00 00       	call   80107340 <kvmalloc>
  mpinit();        // detect other processors
80102f56:	e8 75 01 00 00       	call   801030d0 <mpinit>
  lapicinit();     // interrupt controller
80102f5b:	e8 10 f7 ff ff       	call   80102670 <lapicinit>
  seginit();       // segment descriptors
80102f60:	e8 7b 3e 00 00       	call   80106de0 <seginit>
  picinit();       // disable pic
80102f65:	e8 46 03 00 00       	call   801032b0 <picinit>
  ioapicinit();    // another interrupt controller
80102f6a:	e8 f1 f2 ff ff       	call   80102260 <ioapicinit>
  consoleinit();   // console hardware
80102f6f:	e8 8c da ff ff       	call   80100a00 <consoleinit>
  uartinit();      // serial port
80102f74:	e8 37 31 00 00       	call   801060b0 <uartinit>
  pinit();         // process table
80102f79:	e8 52 08 00 00       	call   801037d0 <pinit>
  tvinit();        // trap vectors
80102f7e:	e8 7d 2d 00 00       	call   80105d00 <tvinit>
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
80102fa4:	e8 f7 19 00 00       	call   801049a0 <memmove>

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
8010307e:	68 f8 7d 10 80       	push   $0x80107df8
80103083:	56                   	push   %esi
80103084:	e8 b7 18 00 00       	call   80104940 <memcmp>
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
8010313c:	68 15 7e 10 80       	push   $0x80107e15
80103141:	56                   	push   %esi
80103142:	e8 f9 17 00 00       	call   80104940 <memcmp>
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
801031d0:	ff 24 95 3c 7e 10 80 	jmp    *-0x7fef81c4(,%edx,4)
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
80103283:	68 fd 7d 10 80       	push   $0x80107dfd
80103288:	e8 03 d1 ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
8010328d:	83 ec 0c             	sub    $0xc,%esp
80103290:	68 1c 7e 10 80       	push   $0x80107e1c
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
8010338b:	68 50 7e 10 80       	push   $0x80107e50
80103390:	50                   	push   %eax
80103391:	e8 0a 13 00 00       	call   801046a0 <initlock>
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
801033ef:	e8 ec 13 00 00       	call   801047e0 <acquire>
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
80103434:	e9 67 14 00 00       	jmp    801048a0 <release>
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
80103464:	e8 37 14 00 00       	call   801048a0 <release>
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
8010348d:	e8 4e 13 00 00       	call   801047e0 <acquire>
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
80103524:	e8 77 13 00 00       	call   801048a0 <release>
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
8010357b:	e8 20 13 00 00       	call   801048a0 <release>
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
801035a0:	e8 3b 12 00 00       	call   801047e0 <acquire>
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
8010360e:	e8 8d 12 00 00       	call   801048a0 <release>
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
8010366f:	e8 2c 12 00 00       	call   801048a0 <release>
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
801036a1:	e8 3a 11 00 00       	call   801047e0 <acquire>
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
801036fa:	e8 a1 11 00 00       	call   801048a0 <release>

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
8010371f:	c7 40 14 e6 5c 10 80 	movl   $0x80105ce6,0x14(%eax)
  p->context = (struct context*)sp;
80103726:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103729:	6a 14                	push   $0x14
8010372b:	6a 00                	push   $0x0
8010372d:	50                   	push   %eax
8010372e:	e8 bd 11 00 00       	call   801048f0 <memset>
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
8010375a:	e8 41 11 00 00       	call   801048a0 <release>
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
8010378b:	e8 10 11 00 00       	call   801048a0 <release>

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
801037d6:	68 55 7e 10 80       	push   $0x80107e55
801037db:	68 00 47 11 80       	push   $0x80114700
801037e0:	e8 bb 0e 00 00       	call   801046a0 <initlock>
  sgenrand(unixtime());
801037e5:	e8 56 f2 ff ff       	call   80102a40 <unixtime>
801037ea:	89 04 24             	mov    %eax,(%esp)
801037ed:	e8 2e 3f 00 00       	call   80107720 <sgenrand>
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
80103860:	68 5c 7e 10 80       	push   $0x80107e5c
80103865:	e8 26 cb ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
8010386a:	83 ec 0c             	sub    $0xc,%esp
8010386d:	68 3c 7f 10 80       	push   $0x80107f3c
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
801038a7:	e8 64 0e 00 00       	call   80104710 <pushcli>
  c = mycpu();
801038ac:	e8 4f ff ff ff       	call   80103800 <mycpu>
  p = c->proc;
801038b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038b7:	e8 94 0e 00 00       	call   80104750 <popcli>
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
801038e3:	e8 d8 39 00 00       	call   801072c0 <setupkvm>
801038e8:	85 c0                	test   %eax,%eax
801038ea:	89 43 04             	mov    %eax,0x4(%ebx)
801038ed:	0f 84 bd 00 00 00    	je     801039b0 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801038f3:	83 ec 04             	sub    $0x4,%esp
801038f6:	68 2c 00 00 00       	push   $0x2c
801038fb:	68 64 b4 10 80       	push   $0x8010b464
80103900:	50                   	push   %eax
80103901:	e8 9a 36 00 00       	call   80106fa0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103906:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103909:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010390f:	6a 4c                	push   $0x4c
80103911:	6a 00                	push   $0x0
80103913:	ff 73 18             	pushl  0x18(%ebx)
80103916:	e8 d5 0f 00 00       	call   801048f0 <memset>
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
8010396f:	68 85 7e 10 80       	push   $0x80107e85
80103974:	50                   	push   %eax
80103975:	e8 56 11 00 00       	call   80104ad0 <safestrcpy>
  p->cwd = namei("/");
8010397a:	c7 04 24 8e 7e 10 80 	movl   $0x80107e8e,(%esp)
80103981:	e8 9a e5 ff ff       	call   80101f20 <namei>
80103986:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103989:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103990:	e8 4b 0e 00 00       	call   801047e0 <acquire>
  p->state = RUNNABLE;
80103995:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010399c:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
801039a3:	e8 f8 0e 00 00       	call   801048a0 <release>
}
801039a8:	83 c4 10             	add    $0x10,%esp
801039ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039ae:	c9                   	leave  
801039af:	c3                   	ret    
    panic("userinit: out of memory?");
801039b0:	83 ec 0c             	sub    $0xc,%esp
801039b3:	68 6c 7e 10 80       	push   $0x80107e6c
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
801039c8:	e8 43 0d 00 00       	call   80104710 <pushcli>
  c = mycpu();
801039cd:	e8 2e fe ff ff       	call   80103800 <mycpu>
  p = c->proc;
801039d2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801039d8:	e8 73 0d 00 00       	call   80104750 <popcli>
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
801039ec:	e8 9f 34 00 00       	call   80106e90 <switchuvm>
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
80103a0a:	e8 d1 36 00 00       	call   801070e0 <allocuvm>
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
80103a2a:	e8 e1 37 00 00       	call   80107210 <deallocuvm>
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
80103a49:	e8 c2 0c 00 00       	call   80104710 <pushcli>
  c = mycpu();
80103a4e:	e8 ad fd ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103a53:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a59:	e8 f2 0c 00 00       	call   80104750 <popcli>
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
80103a78:	e8 13 39 00 00       	call   80107390 <copyuvm>
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
80103b01:	e8 ca 0f 00 00       	call   80104ad0 <safestrcpy>
  pid = np->pid;
80103b06:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103b09:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103b10:	e8 cb 0c 00 00       	call   801047e0 <acquire>
  np->state = RUNNABLE;
80103b15:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103b1c:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103b23:	e8 78 0d 00 00       	call   801048a0 <release>
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
80103bc9:	e8 12 0c 00 00       	call   801047e0 <acquire>
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
80103bfe:	e8 ad 3c 00 00       	call   801078b0 <random_at_most>
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
80103c1f:	e8 6c 32 00 00       	call   80106e90 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103c24:	58                   	pop    %eax
80103c25:	5a                   	pop    %edx
80103c26:	ff 77 1c             	pushl  0x1c(%edi)
80103c29:	56                   	push   %esi
      p->state = RUNNING;
80103c2a:	c7 47 0c 04 00 00 00 	movl   $0x4,0xc(%edi)
      swtch(&(c->scheduler), p->context);
80103c31:	e8 f5 0e 00 00       	call   80104b2b <swtch>
      switchkvm();
80103c36:	e8 35 32 00 00       	call   80106e70 <switchkvm>
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
80103c57:	e8 44 0c 00 00       	call   801048a0 <release>
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
80103c85:	e8 86 0a 00 00       	call   80104710 <pushcli>
  c = mycpu();
80103c8a:	e8 71 fb ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103c8f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103c95:	e8 b6 0a 00 00       	call   80104750 <popcli>
  if(!holding(&ptable.lock))
80103c9a:	83 ec 0c             	sub    $0xc,%esp
80103c9d:	68 00 47 11 80       	push   $0x80114700
80103ca2:	e8 09 0b 00 00       	call   801047b0 <holding>
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
80103ce3:	e8 43 0e 00 00       	call   80104b2b <swtch>
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
80103d00:	68 90 7e 10 80       	push   $0x80107e90
80103d05:	e8 86 c6 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103d0a:	83 ec 0c             	sub    $0xc,%esp
80103d0d:	68 bc 7e 10 80       	push   $0x80107ebc
80103d12:	e8 79 c6 ff ff       	call   80100390 <panic>
    panic("sched running");
80103d17:	83 ec 0c             	sub    $0xc,%esp
80103d1a:	68 ae 7e 10 80       	push   $0x80107eae
80103d1f:	e8 6c c6 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103d24:	83 ec 0c             	sub    $0xc,%esp
80103d27:	68 a2 7e 10 80       	push   $0x80107ea2
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
80103d49:	e8 c2 09 00 00       	call   80104710 <pushcli>
  c = mycpu();
80103d4e:	e8 ad fa ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103d53:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103d59:	e8 f2 09 00 00       	call   80104750 <popcli>
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
80103db2:	e8 29 0a 00 00       	call   801047e0 <acquire>
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
80103e57:	68 dd 7e 10 80       	push   $0x80107edd
80103e5c:	e8 2f c5 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103e61:	83 ec 0c             	sub    $0xc,%esp
80103e64:	68 d0 7e 10 80       	push   $0x80107ed0
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
80103e7c:	e8 5f 09 00 00       	call   801047e0 <acquire>
  pushcli();
80103e81:	e8 8a 08 00 00       	call   80104710 <pushcli>
  c = mycpu();
80103e86:	e8 75 f9 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103e8b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103e91:	e8 ba 08 00 00       	call   80104750 <popcli>
  myproc()->state = RUNNABLE;
80103e96:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103e9d:	e8 de fd ff ff       	call   80103c80 <sched>
  release(&ptable.lock);
80103ea2:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
80103ea9:	e8 f2 09 00 00       	call   801048a0 <release>
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
80103ecf:	e8 3c 08 00 00       	call   80104710 <pushcli>
  c = mycpu();
80103ed4:	e8 27 f9 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103ed9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103edf:	e8 6c 08 00 00       	call   80104750 <popcli>
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
80103f00:	e8 db 08 00 00       	call   801047e0 <acquire>
    release(lk);
80103f05:	89 34 24             	mov    %esi,(%esp)
80103f08:	e8 93 09 00 00       	call   801048a0 <release>
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
80103f2a:	e8 71 09 00 00       	call   801048a0 <release>
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
80103f3c:	e9 9f 08 00 00       	jmp    801047e0 <acquire>
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
80103f69:	68 ef 7e 10 80       	push   $0x80107eef
80103f6e:	e8 1d c4 ff ff       	call   80100390 <panic>
    panic("sleep");
80103f73:	83 ec 0c             	sub    $0xc,%esp
80103f76:	68 e9 7e 10 80       	push   $0x80107ee9
80103f7b:	e8 10 c4 ff ff       	call   80100390 <panic>

80103f80 <wait>:
{
80103f80:	55                   	push   %ebp
80103f81:	89 e5                	mov    %esp,%ebp
80103f83:	56                   	push   %esi
80103f84:	53                   	push   %ebx
  pushcli();
80103f85:	e8 86 07 00 00       	call   80104710 <pushcli>
  c = mycpu();
80103f8a:	e8 71 f8 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80103f8f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103f95:	e8 b6 07 00 00       	call   80104750 <popcli>
  acquire(&ptable.lock);
80103f9a:	83 ec 0c             	sub    $0xc,%esp
80103f9d:	68 00 47 11 80       	push   $0x80114700
80103fa2:	e8 39 08 00 00       	call   801047e0 <acquire>
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
80104021:	e8 1a 32 00 00       	call   80107240 <freevm>
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
8010404d:	e8 4e 08 00 00       	call   801048a0 <release>
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
8010406b:	e8 30 08 00 00       	call   801048a0 <release>
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
8010408f:	e8 4c 07 00 00       	call   801047e0 <acquire>
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
801040d5:	e9 c6 07 00 00       	jmp    801048a0 <release>
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
801040ef:	e8 ec 06 00 00       	call   801047e0 <acquire>
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
8010412d:	e8 6e 07 00 00       	call   801048a0 <release>
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
80104148:	e8 53 07 00 00       	call   801048a0 <release>
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
8010416c:	e8 9f 05 00 00       	call   80104710 <pushcli>
  c = mycpu();
80104171:	e8 8a f6 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80104176:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010417c:	e8 cf 05 00 00       	call   80104750 <popcli>
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
80104195:	e8 46 06 00 00       	call   801047e0 <acquire>
  release(&ptable.lock);
8010419a:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
  ptable.proc[proc-ptable.proc].tickets = tickets;
801041a1:	89 b3 b0 47 11 80    	mov    %esi,-0x7feeb850(%ebx)
  release(&ptable.lock);
801041a7:	e8 f4 06 00 00       	call   801048a0 <release>
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
801041db:	e8 00 06 00 00       	call   801047e0 <acquire>
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
8010422e:	e8 6d 06 00 00       	call   801048a0 <release>
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
8010425b:	68 97 82 10 80       	push   $0x80108297
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
80104284:	ba 00 7f 10 80       	mov    $0x80107f00,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104289:	77 11                	ja     8010429c <procdump+0x5c>
8010428b:	8b 14 85 64 7f 10 80 	mov    -0x7fef809c(,%eax,4),%edx
      state = "???";
80104292:	b8 00 7f 10 80       	mov    $0x80107f00,%eax
80104297:	85 d2                	test   %edx,%edx
80104299:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %sc%d", p->pid, state, p->name, p->tickets);
8010429c:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010429f:	83 ec 0c             	sub    $0xc,%esp
801042a2:	ff 73 7c             	pushl  0x7c(%ebx)
801042a5:	50                   	push   %eax
801042a6:	52                   	push   %edx
801042a7:	ff 73 10             	pushl  0x10(%ebx)
801042aa:	68 04 7f 10 80       	push   $0x80107f04
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
801042d1:	e8 ea 03 00 00       	call   801046c0 <getcallerpcs>
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
801042f1:	68 41 79 10 80       	push   $0x80107941
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
80104318:	90                   	nop
80104319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104320 <clone>:



int clone(void(*fcn)(void*), void *arg, void*stack)
{
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	57                   	push   %edi
80104324:	56                   	push   %esi
80104325:	53                   	push   %ebx
80104326:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80104329:	e8 e2 03 00 00       	call   80104710 <pushcli>
  c = mycpu();
8010432e:	e8 cd f4 ff ff       	call   80103800 <mycpu>
  p = c->proc;
80104333:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80104339:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  popcli();
8010433c:	e8 0f 04 00 00       	call   80104750 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
  // Allocate process.
  if((np = allocproc()) == 0)
80104341:	e8 4a f3 ff ff       	call   80103690 <allocproc>
80104346:	85 c0                	test   %eax,%eax
80104348:	0f 84 f1 00 00 00    	je     8010443f <clone+0x11f>
    return -1;

  // Copy process data to the new thread
  np->pgdir = p->pgdir;
8010434e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104351:	89 c3                	mov    %eax,%ebx
  np->sz = p->sz;
  np->parent = p;
  *np->tf = *p->tf;
80104353:	b9 13 00 00 00       	mov    $0x13,%ecx
80104358:	8b 7b 18             	mov    0x18(%ebx),%edi
  pid = np->pid;
  np->tf->eax = 0;

  // Move the stack data of the current process(thread)
  // to the stack of the new thread
  memmove((void*)np->tf->esp, stack, PGSIZE);
8010435b:	83 ec 04             	sub    $0x4,%esp
  np->pgdir = p->pgdir;
8010435e:	8b 42 04             	mov    0x4(%edx),%eax
  *np->tf = *p->tf;
80104361:	89 55 e0             	mov    %edx,-0x20(%ebp)
  np->pgdir = p->pgdir;
80104364:	89 43 04             	mov    %eax,0x4(%ebx)
  np->sz = p->sz;
80104367:	8b 02                	mov    (%edx),%eax
  np->parent = p;
80104369:	89 53 14             	mov    %edx,0x14(%ebx)
  np->sz = p->sz;
8010436c:	89 03                	mov    %eax,(%ebx)
  *(uint*)stackRet = 0xFFFFFFF;
8010436e:	8b 45 10             	mov    0x10(%ebp),%eax
  *np->tf = *p->tf;
80104371:	8b 72 18             	mov    0x18(%edx),%esi
80104374:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  *(uint*)stackRet = 0xFFFFFFF;
80104376:	c7 80 f8 0f 00 00 ff 	movl   $0xfffffff,0xff8(%eax)
8010437d:	ff ff 0f 
  *(uint*)stackArg = (uint)arg;
80104380:	8b 4d 10             	mov    0x10(%ebp),%ecx
  np->tf->ebp = np->tf->esp;
  np->tf->eip = (int) fcn;

  // Duplicate the files used by the current process(thread) to be used 
  // also by the new thread
  for(i = 0; i < NOFILE; i++)
80104383:	31 f6                	xor    %esi,%esi
  *(uint*)stackArg = (uint)arg;
80104385:	8b 45 0c             	mov    0xc(%ebp),%eax
80104388:	89 81 fc 0f 00 00    	mov    %eax,0xffc(%ecx)
  np->tf->esp = (int) stack;
8010438e:	8b 43 18             	mov    0x18(%ebx),%eax
80104391:	89 48 44             	mov    %ecx,0x44(%eax)
  np->tf->eax = 0;
80104394:	8b 43 18             	mov    0x18(%ebx),%eax
  pid = np->pid;
80104397:	8b 7b 10             	mov    0x10(%ebx),%edi
  np->tf->eax = 0;
8010439a:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  memmove((void*)np->tf->esp, stack, PGSIZE);
801043a1:	68 00 10 00 00       	push   $0x1000
801043a6:	51                   	push   %ecx
801043a7:	8b 43 18             	mov    0x18(%ebx),%eax
801043aa:	ff 70 44             	pushl  0x44(%eax)
801043ad:	e8 ee 05 00 00       	call   801049a0 <memmove>
  np->tf->esp += PGSIZE -2*sizeof(void*) ;
801043b2:	8b 43 18             	mov    0x18(%ebx),%eax
  for(i = 0; i < NOFILE; i++)
801043b5:	8b 55 e0             	mov    -0x20(%ebp),%edx
  np->tf->eip = (int) fcn;
801043b8:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NOFILE; i++)
801043bb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  np->tf->esp += PGSIZE -2*sizeof(void*) ;
801043be:	81 40 44 f8 0f 00 00 	addl   $0xff8,0x44(%eax)
  for(i = 0; i < NOFILE; i++)
801043c5:	89 d7                	mov    %edx,%edi
  np->tf->ebp = np->tf->esp;
801043c7:	8b 43 18             	mov    0x18(%ebx),%eax
801043ca:	8b 48 44             	mov    0x44(%eax),%ecx
801043cd:	89 48 08             	mov    %ecx,0x8(%eax)
  np->tf->eip = (int) fcn;
801043d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
801043d3:	8b 43 18             	mov    0x18(%ebx),%eax
801043d6:	89 48 38             	mov    %ecx,0x38(%eax)
801043d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p->ofile[i])
801043e0:	8b 44 b7 28          	mov    0x28(%edi,%esi,4),%eax
801043e4:	85 c0                	test   %eax,%eax
801043e6:	74 10                	je     801043f8 <clone+0xd8>
      np->ofile[i] = filedup(p->ofile[i]);
801043e8:	83 ec 0c             	sub    $0xc,%esp
801043eb:	50                   	push   %eax
801043ec:	e8 3f ca ff ff       	call   80100e30 <filedup>
801043f1:	83 c4 10             	add    $0x10,%esp
801043f4:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
  for(i = 0; i < NOFILE; i++)
801043f8:	83 c6 01             	add    $0x1,%esi
801043fb:	83 fe 10             	cmp    $0x10,%esi
801043fe:	75 e0                	jne    801043e0 <clone+0xc0>
80104400:	89 fa                	mov    %edi,%edx
  // Duplicate the current directory to be used by the new thread
  np->cwd = idup(p->cwd);
80104402:	83 ec 0c             	sub    $0xc,%esp
80104405:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80104408:	ff 72 68             	pushl  0x68(%edx)
8010440b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 
  // Make the state of the new thread to be runnable 
  np->state = RUNNABLE;

  // Make the two threads belong to the current process
  safestrcpy(np->name, p->name, sizeof(p->name));
8010440e:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(p->cwd);
80104411:	e8 7a d2 ff ff       	call   80101690 <idup>
  safestrcpy(np->name, p->name, sizeof(p->name));
80104416:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  np->cwd = idup(p->cwd);
80104419:	89 43 fc             	mov    %eax,-0x4(%ebx)
  safestrcpy(np->name, p->name, sizeof(p->name));
8010441c:	83 c4 0c             	add    $0xc,%esp
  np->state = RUNNABLE;
8010441f:	c7 43 a0 03 00 00 00 	movl   $0x3,-0x60(%ebx)
  safestrcpy(np->name, p->name, sizeof(p->name));
80104426:	6a 10                	push   $0x10
80104428:	83 c2 6c             	add    $0x6c,%edx
8010442b:	52                   	push   %edx
8010442c:	53                   	push   %ebx
8010442d:	e8 9e 06 00 00       	call   80104ad0 <safestrcpy>
  return pid;
80104432:	83 c4 10             	add    $0x10,%esp
}
80104435:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104438:	89 f8                	mov    %edi,%eax
8010443a:	5b                   	pop    %ebx
8010443b:	5e                   	pop    %esi
8010443c:	5f                   	pop    %edi
8010443d:	5d                   	pop    %ebp
8010443e:	c3                   	ret    
    return -1;
8010443f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104444:	eb ef                	jmp    80104435 <clone+0x115>
80104446:	8d 76 00             	lea    0x0(%esi),%esi
80104449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104450 <join>:

int
join(void** stack)
{
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	56                   	push   %esi
80104454:	53                   	push   %ebx
  pushcli();
80104455:	e8 b6 02 00 00       	call   80104710 <pushcli>
  c = mycpu();
8010445a:	e8 a1 f3 ff ff       	call   80103800 <mycpu>
  p = c->proc;
8010445f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80104465:	e8 e6 02 00 00       	call   80104750 <popcli>
  struct proc *p;           // The thread iterator
  int havekids, pid;
  struct proc *cp = myproc();
  acquire(&ptable.lock);
8010446a:	83 ec 0c             	sub    $0xc,%esp
8010446d:	68 00 47 11 80       	push   $0x80114700
80104472:	e8 69 03 00 00       	call   801047e0 <acquire>
80104477:	83 c4 10             	add    $0x10,%esp
  for(;;){
      // Scan through table looking for zombie children.
      havekids = 0;
8010447a:	31 c0                	xor    %eax,%eax
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010447c:	bb 34 47 11 80       	mov    $0x80114734,%ebx
80104481:	eb 13                	jmp    80104496 <join+0x46>
80104483:	90                   	nop
80104484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104488:	81 c3 84 00 00 00    	add    $0x84,%ebx
8010448e:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
80104494:	73 26                	jae    801044bc <join+0x6c>

      // If the current process is not my parent or share the same address space...  
      if(p->parent != cp || p->pgdir != p->parent->pgdir)
80104496:	39 73 14             	cmp    %esi,0x14(%ebx)
80104499:	75 ed                	jne    80104488 <join+0x38>
8010449b:	8b 4e 04             	mov    0x4(%esi),%ecx
8010449e:	39 4b 04             	cmp    %ecx,0x4(%ebx)
801044a1:	75 e5                	jne    80104488 <join+0x38>
        continue; // You are not a thread
       
      havekids = 1;
      if(p->state == ZOMBIE){
801044a3:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801044a7:	74 3f                	je     801044e8 <join+0x98>
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801044a9:	81 c3 84 00 00 00    	add    $0x84,%ebx
      havekids = 1;
801044af:	b8 01 00 00 00       	mov    $0x1,%eax
      for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801044b4:	81 fb 34 68 11 80    	cmp    $0x80116834,%ebx
801044ba:	72 da                	jb     80104496 <join+0x46>
      }
      
    }

    // No point waiting if we don't have any children.
    if(!havekids || cp->killed){
801044bc:	85 c0                	test   %eax,%eax
801044be:	0f 84 91 00 00 00    	je     80104555 <join+0x105>
801044c4:	8b 46 24             	mov    0x24(%esi),%eax
801044c7:	85 c0                	test   %eax,%eax
801044c9:	0f 85 86 00 00 00    	jne    80104555 <join+0x105>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(cp, &ptable.lock);  //DOC: wait-sleep
801044cf:	83 ec 08             	sub    $0x8,%esp
801044d2:	68 00 47 11 80       	push   $0x80114700
801044d7:	56                   	push   %esi
801044d8:	e8 e3 f9 ff ff       	call   80103ec0 <sleep>
      havekids = 0;
801044dd:	83 c4 10             	add    $0x10,%esp
801044e0:	eb 98                	jmp    8010447a <join+0x2a>
801044e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        void *stackAddr = (void*)p->parent->tf->esp + 7 * sizeof(void *);
801044e8:	8b 46 18             	mov    0x18(%esi),%eax
        kfree(p->kstack);
801044eb:	83 ec 0c             	sub    $0xc,%esp
        *(uint *)stackAddr += 3 * sizeof(void *) - PGSIZE;
801044ee:	8b 50 44             	mov    0x44(%eax),%edx
        *(uint *)stackAddr = p->tf->ebp;
801044f1:	8b 43 18             	mov    0x18(%ebx),%eax
        *(uint *)stackAddr += 3 * sizeof(void *) - PGSIZE;
801044f4:	8b 40 08             	mov    0x8(%eax),%eax
801044f7:	2d f4 0f 00 00       	sub    $0xff4,%eax
801044fc:	89 42 1c             	mov    %eax,0x1c(%edx)
        p->tf->esp = cp->tf->esp;
801044ff:	8b 56 18             	mov    0x18(%esi),%edx
80104502:	8b 43 18             	mov    0x18(%ebx),%eax
80104505:	8b 52 44             	mov    0x44(%edx),%edx
80104508:	89 50 44             	mov    %edx,0x44(%eax)
        kfree(p->kstack);
8010450b:	ff 73 08             	pushl  0x8(%ebx)
	      pid = p->pid;
8010450e:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104511:	e8 3a de ff ff       	call   80102350 <kfree>
        release(&ptable.lock);
80104516:	c7 04 24 00 47 11 80 	movl   $0x80114700,(%esp)
        p->kstack = 0;
8010451d:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        p->pid = 0;
80104524:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
8010452b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80104532:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80104536:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
8010453d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80104544:	e8 57 03 00 00       	call   801048a0 <release>
	      return pid;
80104549:	83 c4 10             	add    $0x10,%esp
  }
8010454c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010454f:	89 f0                	mov    %esi,%eax
80104551:	5b                   	pop    %ebx
80104552:	5e                   	pop    %esi
80104553:	5d                   	pop    %ebp
80104554:	c3                   	ret    
      release(&ptable.lock);
80104555:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104558:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
8010455d:	68 00 47 11 80       	push   $0x80114700
80104562:	e8 39 03 00 00       	call   801048a0 <release>
      return -1;
80104567:	83 c4 10             	add    $0x10,%esp
8010456a:	eb e0                	jmp    8010454c <join+0xfc>
8010456c:	66 90                	xchg   %ax,%ax
8010456e:	66 90                	xchg   %ax,%ax

80104570 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104570:	55                   	push   %ebp
80104571:	89 e5                	mov    %esp,%ebp
80104573:	53                   	push   %ebx
80104574:	83 ec 0c             	sub    $0xc,%esp
80104577:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010457a:	68 7c 7f 10 80       	push   $0x80107f7c
8010457f:	8d 43 04             	lea    0x4(%ebx),%eax
80104582:	50                   	push   %eax
80104583:	e8 18 01 00 00       	call   801046a0 <initlock>
  lk->name = name;
80104588:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010458b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104591:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104594:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010459b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010459e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045a1:	c9                   	leave  
801045a2:	c3                   	ret    
801045a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045b0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	56                   	push   %esi
801045b4:	53                   	push   %ebx
801045b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801045b8:	83 ec 0c             	sub    $0xc,%esp
801045bb:	8d 73 04             	lea    0x4(%ebx),%esi
801045be:	56                   	push   %esi
801045bf:	e8 1c 02 00 00       	call   801047e0 <acquire>
  while (lk->locked) {
801045c4:	8b 13                	mov    (%ebx),%edx
801045c6:	83 c4 10             	add    $0x10,%esp
801045c9:	85 d2                	test   %edx,%edx
801045cb:	74 16                	je     801045e3 <acquiresleep+0x33>
801045cd:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801045d0:	83 ec 08             	sub    $0x8,%esp
801045d3:	56                   	push   %esi
801045d4:	53                   	push   %ebx
801045d5:	e8 e6 f8 ff ff       	call   80103ec0 <sleep>
  while (lk->locked) {
801045da:	8b 03                	mov    (%ebx),%eax
801045dc:	83 c4 10             	add    $0x10,%esp
801045df:	85 c0                	test   %eax,%eax
801045e1:	75 ed                	jne    801045d0 <acquiresleep+0x20>
  }
  lk->locked = 1;
801045e3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801045e9:	e8 b2 f2 ff ff       	call   801038a0 <myproc>
801045ee:	8b 40 10             	mov    0x10(%eax),%eax
801045f1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801045f4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801045f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045fa:	5b                   	pop    %ebx
801045fb:	5e                   	pop    %esi
801045fc:	5d                   	pop    %ebp
  release(&lk->lk);
801045fd:	e9 9e 02 00 00       	jmp    801048a0 <release>
80104602:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104610 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	56                   	push   %esi
80104614:	53                   	push   %ebx
80104615:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104618:	83 ec 0c             	sub    $0xc,%esp
8010461b:	8d 73 04             	lea    0x4(%ebx),%esi
8010461e:	56                   	push   %esi
8010461f:	e8 bc 01 00 00       	call   801047e0 <acquire>
  lk->locked = 0;
80104624:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010462a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104631:	89 1c 24             	mov    %ebx,(%esp)
80104634:	e8 47 fa ff ff       	call   80104080 <wakeup>
  release(&lk->lk);
80104639:	89 75 08             	mov    %esi,0x8(%ebp)
8010463c:	83 c4 10             	add    $0x10,%esp
}
8010463f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104642:	5b                   	pop    %ebx
80104643:	5e                   	pop    %esi
80104644:	5d                   	pop    %ebp
  release(&lk->lk);
80104645:	e9 56 02 00 00       	jmp    801048a0 <release>
8010464a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104650 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	57                   	push   %edi
80104654:	56                   	push   %esi
80104655:	53                   	push   %ebx
80104656:	31 ff                	xor    %edi,%edi
80104658:	83 ec 18             	sub    $0x18,%esp
8010465b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010465e:	8d 73 04             	lea    0x4(%ebx),%esi
80104661:	56                   	push   %esi
80104662:	e8 79 01 00 00       	call   801047e0 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
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
  release(&lk->lk);
80104683:	83 ec 0c             	sub    $0xc,%esp
80104686:	56                   	push   %esi
80104687:	e8 14 02 00 00       	call   801048a0 <release>
  return r;
}
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
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801046a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801046a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
801046af:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
801046b2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801046b9:	5d                   	pop    %ebp
801046ba:	c3                   	ret    
801046bb:	90                   	nop
801046bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046c0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801046c0:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801046c1:	31 d2                	xor    %edx,%edx
{
801046c3:	89 e5                	mov    %esp,%ebp
801046c5:	53                   	push   %ebx
  ebp = (uint*)v - 2;
801046c6:	8b 45 08             	mov    0x8(%ebp),%eax
{
801046c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
801046cc:	83 e8 08             	sub    $0x8,%eax
801046cf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801046d0:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801046d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801046dc:	77 1a                	ja     801046f8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801046de:	8b 58 04             	mov    0x4(%eax),%ebx
801046e1:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
801046e4:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
801046e7:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
801046e9:	83 fa 0a             	cmp    $0xa,%edx
801046ec:	75 e2                	jne    801046d0 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801046ee:	5b                   	pop    %ebx
801046ef:	5d                   	pop    %ebp
801046f0:	c3                   	ret    
801046f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046f8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801046fb:	83 c1 28             	add    $0x28,%ecx
801046fe:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
80104700:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104706:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104709:	39 c1                	cmp    %eax,%ecx
8010470b:	75 f3                	jne    80104700 <getcallerpcs+0x40>
}
8010470d:	5b                   	pop    %ebx
8010470e:	5d                   	pop    %ebp
8010470f:	c3                   	ret    

80104710 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	53                   	push   %ebx
80104714:	83 ec 04             	sub    $0x4,%esp
80104717:	9c                   	pushf  
80104718:	5b                   	pop    %ebx
  asm volatile("cli");
80104719:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010471a:	e8 e1 f0 ff ff       	call   80103800 <mycpu>
8010471f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104725:	85 c0                	test   %eax,%eax
80104727:	75 11                	jne    8010473a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104729:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010472f:	e8 cc f0 ff ff       	call   80103800 <mycpu>
80104734:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010473a:	e8 c1 f0 ff ff       	call   80103800 <mycpu>
8010473f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104746:	83 c4 04             	add    $0x4,%esp
80104749:	5b                   	pop    %ebx
8010474a:	5d                   	pop    %ebp
8010474b:	c3                   	ret    
8010474c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104750 <popcli>:

void
popcli(void)
{
80104750:	55                   	push   %ebp
80104751:	89 e5                	mov    %esp,%ebp
80104753:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104756:	9c                   	pushf  
80104757:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104758:	f6 c4 02             	test   $0x2,%ah
8010475b:	75 35                	jne    80104792 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010475d:	e8 9e f0 ff ff       	call   80103800 <mycpu>
80104762:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104769:	78 34                	js     8010479f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010476b:	e8 90 f0 ff ff       	call   80103800 <mycpu>
80104770:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104776:	85 d2                	test   %edx,%edx
80104778:	74 06                	je     80104780 <popcli+0x30>
    sti();
}
8010477a:	c9                   	leave  
8010477b:	c3                   	ret    
8010477c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104780:	e8 7b f0 ff ff       	call   80103800 <mycpu>
80104785:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010478b:	85 c0                	test   %eax,%eax
8010478d:	74 eb                	je     8010477a <popcli+0x2a>
  asm volatile("sti");
8010478f:	fb                   	sti    
}
80104790:	c9                   	leave  
80104791:	c3                   	ret    
    panic("popcli - interruptible");
80104792:	83 ec 0c             	sub    $0xc,%esp
80104795:	68 87 7f 10 80       	push   $0x80107f87
8010479a:	e8 f1 bb ff ff       	call   80100390 <panic>
    panic("popcli");
8010479f:	83 ec 0c             	sub    $0xc,%esp
801047a2:	68 9e 7f 10 80       	push   $0x80107f9e
801047a7:	e8 e4 bb ff ff       	call   80100390 <panic>
801047ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801047b0 <holding>:
{
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	56                   	push   %esi
801047b4:	53                   	push   %ebx
801047b5:	8b 75 08             	mov    0x8(%ebp),%esi
801047b8:	31 db                	xor    %ebx,%ebx
  pushcli();
801047ba:	e8 51 ff ff ff       	call   80104710 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801047bf:	8b 06                	mov    (%esi),%eax
801047c1:	85 c0                	test   %eax,%eax
801047c3:	74 10                	je     801047d5 <holding+0x25>
801047c5:	8b 5e 08             	mov    0x8(%esi),%ebx
801047c8:	e8 33 f0 ff ff       	call   80103800 <mycpu>
801047cd:	39 c3                	cmp    %eax,%ebx
801047cf:	0f 94 c3             	sete   %bl
801047d2:	0f b6 db             	movzbl %bl,%ebx
  popcli();
801047d5:	e8 76 ff ff ff       	call   80104750 <popcli>
}
801047da:	89 d8                	mov    %ebx,%eax
801047dc:	5b                   	pop    %ebx
801047dd:	5e                   	pop    %esi
801047de:	5d                   	pop    %ebp
801047df:	c3                   	ret    

801047e0 <acquire>:
{
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	56                   	push   %esi
801047e4:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
801047e5:	e8 26 ff ff ff       	call   80104710 <pushcli>
  if(holding(lk))
801047ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
801047ed:	83 ec 0c             	sub    $0xc,%esp
801047f0:	53                   	push   %ebx
801047f1:	e8 ba ff ff ff       	call   801047b0 <holding>
801047f6:	83 c4 10             	add    $0x10,%esp
801047f9:	85 c0                	test   %eax,%eax
801047fb:	0f 85 83 00 00 00    	jne    80104884 <acquire+0xa4>
80104801:	89 c6                	mov    %eax,%esi
  asm volatile("lock; xchgl %0, %1" :
80104803:	ba 01 00 00 00       	mov    $0x1,%edx
80104808:	eb 09                	jmp    80104813 <acquire+0x33>
8010480a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104810:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104813:	89 d0                	mov    %edx,%eax
80104815:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
80104818:	85 c0                	test   %eax,%eax
8010481a:	75 f4                	jne    80104810 <acquire+0x30>
  __sync_synchronize();
8010481c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104821:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104824:	e8 d7 ef ff ff       	call   80103800 <mycpu>
  getcallerpcs(&lk, lk->pcs);
80104829:	8d 53 0c             	lea    0xc(%ebx),%edx
  lk->cpu = mycpu();
8010482c:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
8010482f:	89 e8                	mov    %ebp,%eax
80104831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104838:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
8010483e:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
80104844:	77 1a                	ja     80104860 <acquire+0x80>
    pcs[i] = ebp[1];     // saved %eip
80104846:	8b 48 04             	mov    0x4(%eax),%ecx
80104849:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
  for(i = 0; i < 10; i++){
8010484c:	83 c6 01             	add    $0x1,%esi
    ebp = (uint*)ebp[0]; // saved %ebp
8010484f:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104851:	83 fe 0a             	cmp    $0xa,%esi
80104854:	75 e2                	jne    80104838 <acquire+0x58>
}
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
    pcs[i] = 0;
80104870:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104876:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104879:	39 d0                	cmp    %edx,%eax
8010487b:	75 f3                	jne    80104870 <acquire+0x90>
}
8010487d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104880:	5b                   	pop    %ebx
80104881:	5e                   	pop    %esi
80104882:	5d                   	pop    %ebp
80104883:	c3                   	ret    
    panic("acquire");
80104884:	83 ec 0c             	sub    $0xc,%esp
80104887:	68 a5 7f 10 80       	push   $0x80107fa5
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
{
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	53                   	push   %ebx
801048a4:	83 ec 10             	sub    $0x10,%esp
801048a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
801048aa:	53                   	push   %ebx
801048ab:	e8 00 ff ff ff       	call   801047b0 <holding>
801048b0:	83 c4 10             	add    $0x10,%esp
801048b3:	85 c0                	test   %eax,%eax
801048b5:	74 22                	je     801048d9 <release+0x39>
  lk->pcs[0] = 0;
801048b7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801048be:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
801048c5:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801048ca:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801048d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801048d3:	c9                   	leave  
  popcli();
801048d4:	e9 77 fe ff ff       	jmp    80104750 <popcli>
    panic("release");
801048d9:	83 ec 0c             	sub    $0xc,%esp
801048dc:	68 ad 7f 10 80       	push   $0x80107fad
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
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104b2b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104b2f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80104b33:	55                   	push   %ebp
  pushl %ebx
80104b34:	53                   	push   %ebx
  pushl %esi
80104b35:	56                   	push   %esi
  pushl %edi
80104b36:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104b37:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104b39:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
80104b3b:	5f                   	pop    %edi
  popl %esi
80104b3c:	5e                   	pop    %esi
  popl %ebx
80104b3d:	5b                   	pop    %ebx
  popl %ebp
80104b3e:	5d                   	pop    %ebp
  ret
80104b3f:	c3                   	ret    

80104b40 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104b40:	55                   	push   %ebp
80104b41:	89 e5                	mov    %esp,%ebp
80104b43:	53                   	push   %ebx
80104b44:	83 ec 04             	sub    $0x4,%esp
80104b47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80104b4a:	e8 51 ed ff ff       	call   801038a0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104b4f:	8b 00                	mov    (%eax),%eax
80104b51:	39 d8                	cmp    %ebx,%eax
80104b53:	76 1b                	jbe    80104b70 <fetchint+0x30>
80104b55:	8d 53 04             	lea    0x4(%ebx),%edx
80104b58:	39 d0                	cmp    %edx,%eax
80104b5a:	72 14                	jb     80104b70 <fetchint+0x30>
    return -1;
  
  *ip = *(int*)(addr);
80104b5c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b5f:	8b 13                	mov    (%ebx),%edx
80104b61:	89 10                	mov    %edx,(%eax)
  return 0;
80104b63:	31 c0                	xor    %eax,%eax
}
80104b65:	83 c4 04             	add    $0x4,%esp
80104b68:	5b                   	pop    %ebx
80104b69:	5d                   	pop    %ebp
80104b6a:	c3                   	ret    
80104b6b:	90                   	nop
80104b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b75:	eb ee                	jmp    80104b65 <fetchint+0x25>
80104b77:	89 f6                	mov    %esi,%esi
80104b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b80 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104b80:	55                   	push   %ebp
80104b81:	89 e5                	mov    %esp,%ebp
80104b83:	53                   	push   %ebx
80104b84:	83 ec 04             	sub    $0x4,%esp
80104b87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80104b8a:	e8 11 ed ff ff       	call   801038a0 <myproc>

  if(addr >= curproc->sz)
80104b8f:	39 18                	cmp    %ebx,(%eax)
80104b91:	76 29                	jbe    80104bbc <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104b93:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104b96:	89 da                	mov    %ebx,%edx
80104b98:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
80104b9a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
80104b9c:	39 c3                	cmp    %eax,%ebx
80104b9e:	73 1c                	jae    80104bbc <fetchstr+0x3c>
    if(*s == 0)
80104ba0:	80 3b 00             	cmpb   $0x0,(%ebx)
80104ba3:	75 10                	jne    80104bb5 <fetchstr+0x35>
80104ba5:	eb 39                	jmp    80104be0 <fetchstr+0x60>
80104ba7:	89 f6                	mov    %esi,%esi
80104ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104bb0:	80 3a 00             	cmpb   $0x0,(%edx)
80104bb3:	74 1b                	je     80104bd0 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
80104bb5:	83 c2 01             	add    $0x1,%edx
80104bb8:	39 d0                	cmp    %edx,%eax
80104bba:	77 f4                	ja     80104bb0 <fetchstr+0x30>
    return -1;
80104bbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
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
    if(*s == 0)
80104be0:	31 c0                	xor    %eax,%eax
      return s - *pp;
80104be2:	eb dd                	jmp    80104bc1 <fetchstr+0x41>
80104be4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104bea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104bf0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104bf0:	55                   	push   %ebp
80104bf1:	89 e5                	mov    %esp,%ebp
80104bf3:	56                   	push   %esi
80104bf4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104bf5:	e8 a6 ec ff ff       	call   801038a0 <myproc>
80104bfa:	8b 40 18             	mov    0x18(%eax),%eax
80104bfd:	8b 55 08             	mov    0x8(%ebp),%edx
80104c00:	8b 40 44             	mov    0x44(%eax),%eax
80104c03:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104c06:	e8 95 ec ff ff       	call   801038a0 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104c0b:	8b 00                	mov    (%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104c0d:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104c10:	39 c6                	cmp    %eax,%esi
80104c12:	73 1c                	jae    80104c30 <argint+0x40>
80104c14:	8d 53 08             	lea    0x8(%ebx),%edx
80104c17:	39 d0                	cmp    %edx,%eax
80104c19:	72 15                	jb     80104c30 <argint+0x40>
  *ip = *(int*)(addr);
80104c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104c1e:	8b 53 04             	mov    0x4(%ebx),%edx
80104c21:	89 10                	mov    %edx,(%eax)
  return 0;
80104c23:	31 c0                	xor    %eax,%eax
}
80104c25:	5b                   	pop    %ebx
80104c26:	5e                   	pop    %esi
80104c27:	5d                   	pop    %ebp
80104c28:	c3                   	ret    
80104c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104c30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104c35:	eb ee                	jmp    80104c25 <argint+0x35>
80104c37:	89 f6                	mov    %esi,%esi
80104c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c40 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104c40:	55                   	push   %ebp
80104c41:	89 e5                	mov    %esp,%ebp
80104c43:	56                   	push   %esi
80104c44:	53                   	push   %ebx
80104c45:	83 ec 10             	sub    $0x10,%esp
80104c48:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
80104c4b:	e8 50 ec ff ff       	call   801038a0 <myproc>
80104c50:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104c52:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c55:	83 ec 08             	sub    $0x8,%esp
80104c58:	50                   	push   %eax
80104c59:	ff 75 08             	pushl  0x8(%ebp)
80104c5c:	e8 8f ff ff ff       	call   80104bf0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
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
    return -1;
  *pp = (char*)i;
80104c7b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104c7e:	89 02                	mov    %eax,(%edx)
  return 0;
80104c80:	31 c0                	xor    %eax,%eax
}
80104c82:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c85:	5b                   	pop    %ebx
80104c86:	5e                   	pop    %esi
80104c87:	5d                   	pop    %ebp
80104c88:	c3                   	ret    
80104c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c95:	eb eb                	jmp    80104c82 <argptr+0x42>
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ca0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104ca0:	55                   	push   %ebp
80104ca1:	89 e5                	mov    %esp,%ebp
80104ca3:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104ca6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ca9:	50                   	push   %eax
80104caa:	ff 75 08             	pushl  0x8(%ebp)
80104cad:	e8 3e ff ff ff       	call   80104bf0 <argint>
80104cb2:	83 c4 10             	add    $0x10,%esp
80104cb5:	85 c0                	test   %eax,%eax
80104cb7:	78 17                	js     80104cd0 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104cb9:	83 ec 08             	sub    $0x8,%esp
80104cbc:	ff 75 0c             	pushl  0xc(%ebp)
80104cbf:	ff 75 f4             	pushl  -0xc(%ebp)
80104cc2:	e8 b9 fe ff ff       	call   80104b80 <fetchstr>
80104cc7:	83 c4 10             	add    $0x10,%esp
}
80104cca:	c9                   	leave  
80104ccb:	c3                   	ret    
80104ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104cd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104cd5:	c9                   	leave  
80104cd6:	c3                   	ret    
80104cd7:	89 f6                	mov    %esi,%esi
80104cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ce0 <syscall>:
};


void
syscall(void)
{
80104ce0:	55                   	push   %ebp
80104ce1:	89 e5                	mov    %esp,%ebp
80104ce3:	53                   	push   %ebx
80104ce4:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104ce7:	e8 b4 eb ff ff       	call   801038a0 <myproc>
80104cec:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104cee:	8b 40 18             	mov    0x18(%eax),%eax
80104cf1:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104cf4:	8d 50 ff             	lea    -0x1(%eax),%edx
80104cf7:	83 fa 1c             	cmp    $0x1c,%edx
80104cfa:	77 1c                	ja     80104d18 <syscall+0x38>
80104cfc:	8b 14 85 e0 7f 10 80 	mov    -0x7fef8020(,%eax,4),%edx
80104d03:	85 d2                	test   %edx,%edx
80104d05:	74 11                	je     80104d18 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104d07:	ff d2                	call   *%edx
80104d09:	8b 53 18             	mov    0x18(%ebx),%edx
80104d0c:	89 42 1c             	mov    %eax,0x1c(%edx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104d0f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d12:	c9                   	leave  
80104d13:	c3                   	ret    
80104d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
80104d18:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104d19:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104d1c:	50                   	push   %eax
80104d1d:	ff 73 10             	pushl  0x10(%ebx)
80104d20:	68 b5 7f 10 80       	push   $0x80107fb5
80104d25:	e8 36 b9 ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
80104d2a:	8b 43 18             	mov    0x18(%ebx),%eax
80104d2d:	83 c4 10             	add    $0x10,%esp
80104d30:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104d37:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d3a:	c9                   	leave  
80104d3b:	c3                   	ret    
80104d3c:	66 90                	xchg   %ax,%ax
80104d3e:	66 90                	xchg   %ax,%ax

80104d40 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104d40:	55                   	push   %ebp
80104d41:	89 e5                	mov    %esp,%ebp
80104d43:	57                   	push   %edi
80104d44:	56                   	push   %esi
80104d45:	53                   	push   %ebx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104d46:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104d49:	83 ec 34             	sub    $0x34,%esp
80104d4c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104d4f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104d52:	56                   	push   %esi
80104d53:	50                   	push   %eax
{
80104d54:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104d57:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104d5a:	e8 e1 d1 ff ff       	call   80101f40 <nameiparent>
80104d5f:	83 c4 10             	add    $0x10,%esp
80104d62:	85 c0                	test   %eax,%eax
80104d64:	0f 84 46 01 00 00    	je     80104eb0 <create+0x170>
    return 0;
  ilock(dp);
80104d6a:	83 ec 0c             	sub    $0xc,%esp
80104d6d:	89 c3                	mov    %eax,%ebx
80104d6f:	50                   	push   %eax
80104d70:	e8 4b c9 ff ff       	call   801016c0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104d75:	83 c4 0c             	add    $0xc,%esp
80104d78:	6a 00                	push   $0x0
80104d7a:	56                   	push   %esi
80104d7b:	53                   	push   %ebx
80104d7c:	e8 6f ce ff ff       	call   80101bf0 <dirlookup>
80104d81:	83 c4 10             	add    $0x10,%esp
80104d84:	85 c0                	test   %eax,%eax
80104d86:	89 c7                	mov    %eax,%edi
80104d88:	74 36                	je     80104dc0 <create+0x80>
    iunlockput(dp);
80104d8a:	83 ec 0c             	sub    $0xc,%esp
80104d8d:	53                   	push   %ebx
80104d8e:	e8 bd cb ff ff       	call   80101950 <iunlockput>
    ilock(ip);
80104d93:	89 3c 24             	mov    %edi,(%esp)
80104d96:	e8 25 c9 ff ff       	call   801016c0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104d9b:	83 c4 10             	add    $0x10,%esp
80104d9e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104da3:	0f 85 97 00 00 00    	jne    80104e40 <create+0x100>
80104da9:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104dae:	0f 85 8c 00 00 00    	jne    80104e40 <create+0x100>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104db4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104db7:	89 f8                	mov    %edi,%eax
80104db9:	5b                   	pop    %ebx
80104dba:	5e                   	pop    %esi
80104dbb:	5f                   	pop    %edi
80104dbc:	5d                   	pop    %ebp
80104dbd:	c3                   	ret    
80104dbe:	66 90                	xchg   %ax,%ax
  if((ip = ialloc(dp->dev, type)) == 0)
80104dc0:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104dc4:	83 ec 08             	sub    $0x8,%esp
80104dc7:	50                   	push   %eax
80104dc8:	ff 33                	pushl  (%ebx)
80104dca:	e8 81 c7 ff ff       	call   80101550 <ialloc>
80104dcf:	83 c4 10             	add    $0x10,%esp
80104dd2:	85 c0                	test   %eax,%eax
80104dd4:	89 c7                	mov    %eax,%edi
80104dd6:	0f 84 e8 00 00 00    	je     80104ec4 <create+0x184>
  ilock(ip);
80104ddc:	83 ec 0c             	sub    $0xc,%esp
80104ddf:	50                   	push   %eax
80104de0:	e8 db c8 ff ff       	call   801016c0 <ilock>
  ip->major = major;
80104de5:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104de9:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104ded:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104df1:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104df5:	b8 01 00 00 00       	mov    $0x1,%eax
80104dfa:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104dfe:	89 3c 24             	mov    %edi,(%esp)
80104e01:	e8 0a c8 ff ff       	call   80101610 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104e06:	83 c4 10             	add    $0x10,%esp
80104e09:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104e0e:	74 50                	je     80104e60 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104e10:	83 ec 04             	sub    $0x4,%esp
80104e13:	ff 77 04             	pushl  0x4(%edi)
80104e16:	56                   	push   %esi
80104e17:	53                   	push   %ebx
80104e18:	e8 43 d0 ff ff       	call   80101e60 <dirlink>
80104e1d:	83 c4 10             	add    $0x10,%esp
80104e20:	85 c0                	test   %eax,%eax
80104e22:	0f 88 8f 00 00 00    	js     80104eb7 <create+0x177>
  iunlockput(dp);
80104e28:	83 ec 0c             	sub    $0xc,%esp
80104e2b:	53                   	push   %ebx
80104e2c:	e8 1f cb ff ff       	call   80101950 <iunlockput>
  return ip;
80104e31:	83 c4 10             	add    $0x10,%esp
}
80104e34:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e37:	89 f8                	mov    %edi,%eax
80104e39:	5b                   	pop    %ebx
80104e3a:	5e                   	pop    %esi
80104e3b:	5f                   	pop    %edi
80104e3c:	5d                   	pop    %ebp
80104e3d:	c3                   	ret    
80104e3e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104e40:	83 ec 0c             	sub    $0xc,%esp
80104e43:	57                   	push   %edi
    return 0;
80104e44:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104e46:	e8 05 cb ff ff       	call   80101950 <iunlockput>
    return 0;
80104e4b:	83 c4 10             	add    $0x10,%esp
}
80104e4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e51:	89 f8                	mov    %edi,%eax
80104e53:	5b                   	pop    %ebx
80104e54:	5e                   	pop    %esi
80104e55:	5f                   	pop    %edi
80104e56:	5d                   	pop    %ebp
80104e57:	c3                   	ret    
80104e58:	90                   	nop
80104e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink++;  // for ".."
80104e60:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104e65:	83 ec 0c             	sub    $0xc,%esp
80104e68:	53                   	push   %ebx
80104e69:	e8 a2 c7 ff ff       	call   80101610 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104e6e:	83 c4 0c             	add    $0xc,%esp
80104e71:	ff 77 04             	pushl  0x4(%edi)
80104e74:	68 74 80 10 80       	push   $0x80108074
80104e79:	57                   	push   %edi
80104e7a:	e8 e1 cf ff ff       	call   80101e60 <dirlink>
80104e7f:	83 c4 10             	add    $0x10,%esp
80104e82:	85 c0                	test   %eax,%eax
80104e84:	78 1c                	js     80104ea2 <create+0x162>
80104e86:	83 ec 04             	sub    $0x4,%esp
80104e89:	ff 73 04             	pushl  0x4(%ebx)
80104e8c:	68 73 80 10 80       	push   $0x80108073
80104e91:	57                   	push   %edi
80104e92:	e8 c9 cf ff ff       	call   80101e60 <dirlink>
80104e97:	83 c4 10             	add    $0x10,%esp
80104e9a:	85 c0                	test   %eax,%eax
80104e9c:	0f 89 6e ff ff ff    	jns    80104e10 <create+0xd0>
      panic("create dots");
80104ea2:	83 ec 0c             	sub    $0xc,%esp
80104ea5:	68 67 80 10 80       	push   $0x80108067
80104eaa:	e8 e1 b4 ff ff       	call   80100390 <panic>
80104eaf:	90                   	nop
    return 0;
80104eb0:	31 ff                	xor    %edi,%edi
80104eb2:	e9 fd fe ff ff       	jmp    80104db4 <create+0x74>
    panic("create: dirlink");
80104eb7:	83 ec 0c             	sub    $0xc,%esp
80104eba:	68 76 80 10 80       	push   $0x80108076
80104ebf:	e8 cc b4 ff ff       	call   80100390 <panic>
    panic("create: ialloc");
80104ec4:	83 ec 0c             	sub    $0xc,%esp
80104ec7:	68 58 80 10 80       	push   $0x80108058
80104ecc:	e8 bf b4 ff ff       	call   80100390 <panic>
80104ed1:	eb 0d                	jmp    80104ee0 <argfd.constprop.0>
80104ed3:	90                   	nop
80104ed4:	90                   	nop
80104ed5:	90                   	nop
80104ed6:	90                   	nop
80104ed7:	90                   	nop
80104ed8:	90                   	nop
80104ed9:	90                   	nop
80104eda:	90                   	nop
80104edb:	90                   	nop
80104edc:	90                   	nop
80104edd:	90                   	nop
80104ede:	90                   	nop
80104edf:	90                   	nop

80104ee0 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104ee0:	55                   	push   %ebp
80104ee1:	89 e5                	mov    %esp,%ebp
80104ee3:	56                   	push   %esi
80104ee4:	53                   	push   %ebx
80104ee5:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80104ee7:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104eea:	89 d6                	mov    %edx,%esi
80104eec:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104eef:	50                   	push   %eax
80104ef0:	6a 00                	push   $0x0
80104ef2:	e8 f9 fc ff ff       	call   80104bf0 <argint>
80104ef7:	83 c4 10             	add    $0x10,%esp
80104efa:	85 c0                	test   %eax,%eax
80104efc:	78 2a                	js     80104f28 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104efe:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104f02:	77 24                	ja     80104f28 <argfd.constprop.0+0x48>
80104f04:	e8 97 e9 ff ff       	call   801038a0 <myproc>
80104f09:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104f0c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104f10:	85 c0                	test   %eax,%eax
80104f12:	74 14                	je     80104f28 <argfd.constprop.0+0x48>
  if(pfd)
80104f14:	85 db                	test   %ebx,%ebx
80104f16:	74 02                	je     80104f1a <argfd.constprop.0+0x3a>
    *pfd = fd;
80104f18:	89 13                	mov    %edx,(%ebx)
    *pf = f;
80104f1a:	89 06                	mov    %eax,(%esi)
  return 0;
80104f1c:	31 c0                	xor    %eax,%eax
}
80104f1e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f21:	5b                   	pop    %ebx
80104f22:	5e                   	pop    %esi
80104f23:	5d                   	pop    %ebp
80104f24:	c3                   	ret    
80104f25:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104f28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f2d:	eb ef                	jmp    80104f1e <argfd.constprop.0+0x3e>
80104f2f:	90                   	nop

80104f30 <sys_dup>:
{
80104f30:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104f31:	31 c0                	xor    %eax,%eax
{
80104f33:	89 e5                	mov    %esp,%ebp
80104f35:	56                   	push   %esi
80104f36:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104f37:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104f3a:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104f3d:	e8 9e ff ff ff       	call   80104ee0 <argfd.constprop.0>
80104f42:	85 c0                	test   %eax,%eax
80104f44:	78 42                	js     80104f88 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
80104f46:	8b 75 f4             	mov    -0xc(%ebp),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104f49:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80104f4b:	e8 50 e9 ff ff       	call   801038a0 <myproc>
80104f50:	eb 0e                	jmp    80104f60 <sys_dup+0x30>
80104f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104f58:	83 c3 01             	add    $0x1,%ebx
80104f5b:	83 fb 10             	cmp    $0x10,%ebx
80104f5e:	74 28                	je     80104f88 <sys_dup+0x58>
    if(curproc->ofile[fd] == 0){
80104f60:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104f64:	85 d2                	test   %edx,%edx
80104f66:	75 f0                	jne    80104f58 <sys_dup+0x28>
      curproc->ofile[fd] = f;
80104f68:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104f6c:	83 ec 0c             	sub    $0xc,%esp
80104f6f:	ff 75 f4             	pushl  -0xc(%ebp)
80104f72:	e8 b9 be ff ff       	call   80100e30 <filedup>
  return fd;
80104f77:	83 c4 10             	add    $0x10,%esp
}
80104f7a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f7d:	89 d8                	mov    %ebx,%eax
80104f7f:	5b                   	pop    %ebx
80104f80:	5e                   	pop    %esi
80104f81:	5d                   	pop    %ebp
80104f82:	c3                   	ret    
80104f83:	90                   	nop
80104f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104f88:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104f8b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104f90:	89 d8                	mov    %ebx,%eax
80104f92:	5b                   	pop    %ebx
80104f93:	5e                   	pop    %esi
80104f94:	5d                   	pop    %ebp
80104f95:	c3                   	ret    
80104f96:	8d 76 00             	lea    0x0(%esi),%esi
80104f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104fa0 <sys_getreadcount>:
sys_getreadcount(void){
80104fa0:	55                   	push   %ebp
}
80104fa1:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
sys_getreadcount(void){
80104fa6:	89 e5                	mov    %esp,%ebp
}
80104fa8:	5d                   	pop    %ebp
80104fa9:	c3                   	ret    
80104faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104fb0 <sys_read>:
{
80104fb0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104fb1:	31 c0                	xor    %eax,%eax
{
80104fb3:	89 e5                	mov    %esp,%ebp
80104fb5:	83 ec 18             	sub    $0x18,%esp
  readcount++;
80104fb8:	83 05 bc b5 10 80 01 	addl   $0x1,0x8010b5bc
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104fbf:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104fc2:	e8 19 ff ff ff       	call   80104ee0 <argfd.constprop.0>
80104fc7:	85 c0                	test   %eax,%eax
80104fc9:	78 45                	js     80105010 <sys_read+0x60>
80104fcb:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104fce:	83 ec 08             	sub    $0x8,%esp
80104fd1:	50                   	push   %eax
80104fd2:	6a 02                	push   $0x2
80104fd4:	e8 17 fc ff ff       	call   80104bf0 <argint>
80104fd9:	83 c4 10             	add    $0x10,%esp
80104fdc:	85 c0                	test   %eax,%eax
80104fde:	78 30                	js     80105010 <sys_read+0x60>
80104fe0:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fe3:	83 ec 04             	sub    $0x4,%esp
80104fe6:	ff 75 f0             	pushl  -0x10(%ebp)
80104fe9:	50                   	push   %eax
80104fea:	6a 01                	push   $0x1
80104fec:	e8 4f fc ff ff       	call   80104c40 <argptr>
80104ff1:	83 c4 10             	add    $0x10,%esp
80104ff4:	85 c0                	test   %eax,%eax
80104ff6:	78 18                	js     80105010 <sys_read+0x60>
  return fileread(f, p, n);
80104ff8:	83 ec 04             	sub    $0x4,%esp
80104ffb:	ff 75 f0             	pushl  -0x10(%ebp)
80104ffe:	ff 75 f4             	pushl  -0xc(%ebp)
80105001:	ff 75 ec             	pushl  -0x14(%ebp)
80105004:	e8 97 bf ff ff       	call   80100fa0 <fileread>
80105009:	83 c4 10             	add    $0x10,%esp
}
8010500c:	c9                   	leave  
8010500d:	c3                   	ret    
8010500e:	66 90                	xchg   %ax,%ax
    return -1;
80105010:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105015:	c9                   	leave  
80105016:	c3                   	ret    
80105017:	89 f6                	mov    %esi,%esi
80105019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105020 <sys_write>:
{
80105020:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105021:	31 c0                	xor    %eax,%eax
{
80105023:	89 e5                	mov    %esp,%ebp
80105025:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105028:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010502b:	e8 b0 fe ff ff       	call   80104ee0 <argfd.constprop.0>
80105030:	85 c0                	test   %eax,%eax
80105032:	78 4c                	js     80105080 <sys_write+0x60>
80105034:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105037:	83 ec 08             	sub    $0x8,%esp
8010503a:	50                   	push   %eax
8010503b:	6a 02                	push   $0x2
8010503d:	e8 ae fb ff ff       	call   80104bf0 <argint>
80105042:	83 c4 10             	add    $0x10,%esp
80105045:	85 c0                	test   %eax,%eax
80105047:	78 37                	js     80105080 <sys_write+0x60>
80105049:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010504c:	83 ec 04             	sub    $0x4,%esp
8010504f:	ff 75 f0             	pushl  -0x10(%ebp)
80105052:	50                   	push   %eax
80105053:	6a 01                	push   $0x1
80105055:	e8 e6 fb ff ff       	call   80104c40 <argptr>
8010505a:	83 c4 10             	add    $0x10,%esp
8010505d:	85 c0                	test   %eax,%eax
8010505f:	78 1f                	js     80105080 <sys_write+0x60>
  return filewrite(f, p, n);
80105061:	83 ec 04             	sub    $0x4,%esp
80105064:	ff 75 f0             	pushl  -0x10(%ebp)
80105067:	ff 75 f4             	pushl  -0xc(%ebp)
8010506a:	ff 75 ec             	pushl  -0x14(%ebp)
8010506d:	e8 be bf ff ff       	call   80101030 <filewrite>
80105072:	83 c4 10             	add    $0x10,%esp
}
80105075:	c9                   	leave  
80105076:	c3                   	ret    
80105077:	89 f6                	mov    %esi,%esi
80105079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80105080:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105085:	c9                   	leave  
80105086:	c3                   	ret    
80105087:	89 f6                	mov    %esi,%esi
80105089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105090 <sys_close>:
{
80105090:	55                   	push   %ebp
80105091:	89 e5                	mov    %esp,%ebp
80105093:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80105096:	8d 55 f4             	lea    -0xc(%ebp),%edx
80105099:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010509c:	e8 3f fe ff ff       	call   80104ee0 <argfd.constprop.0>
801050a1:	85 c0                	test   %eax,%eax
801050a3:	78 2b                	js     801050d0 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
801050a5:	e8 f6 e7 ff ff       	call   801038a0 <myproc>
801050aa:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
801050ad:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
801050b0:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
801050b7:	00 
  fileclose(f);
801050b8:	ff 75 f4             	pushl  -0xc(%ebp)
801050bb:	e8 c0 bd ff ff       	call   80100e80 <fileclose>
  return 0;
801050c0:	83 c4 10             	add    $0x10,%esp
801050c3:	31 c0                	xor    %eax,%eax
}
801050c5:	c9                   	leave  
801050c6:	c3                   	ret    
801050c7:	89 f6                	mov    %esi,%esi
801050c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
801050d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801050d5:	c9                   	leave  
801050d6:	c3                   	ret    
801050d7:	89 f6                	mov    %esi,%esi
801050d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801050e0 <sys_fstat>:
{
801050e0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801050e1:	31 c0                	xor    %eax,%eax
{
801050e3:	89 e5                	mov    %esp,%ebp
801050e5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801050e8:	8d 55 f0             	lea    -0x10(%ebp),%edx
801050eb:	e8 f0 fd ff ff       	call   80104ee0 <argfd.constprop.0>
801050f0:	85 c0                	test   %eax,%eax
801050f2:	78 2c                	js     80105120 <sys_fstat+0x40>
801050f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801050f7:	83 ec 04             	sub    $0x4,%esp
801050fa:	6a 14                	push   $0x14
801050fc:	50                   	push   %eax
801050fd:	6a 01                	push   $0x1
801050ff:	e8 3c fb ff ff       	call   80104c40 <argptr>
80105104:	83 c4 10             	add    $0x10,%esp
80105107:	85 c0                	test   %eax,%eax
80105109:	78 15                	js     80105120 <sys_fstat+0x40>
  return filestat(f, st);
8010510b:	83 ec 08             	sub    $0x8,%esp
8010510e:	ff 75 f4             	pushl  -0xc(%ebp)
80105111:	ff 75 f0             	pushl  -0x10(%ebp)
80105114:	e8 37 be ff ff       	call   80100f50 <filestat>
80105119:	83 c4 10             	add    $0x10,%esp
}
8010511c:	c9                   	leave  
8010511d:	c3                   	ret    
8010511e:	66 90                	xchg   %ax,%ax
    return -1;
80105120:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105125:	c9                   	leave  
80105126:	c3                   	ret    
80105127:	89 f6                	mov    %esi,%esi
80105129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105130 <sys_link>:
{
80105130:	55                   	push   %ebp
80105131:	89 e5                	mov    %esp,%ebp
80105133:	57                   	push   %edi
80105134:	56                   	push   %esi
80105135:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80105136:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80105139:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
8010513c:	50                   	push   %eax
8010513d:	6a 00                	push   $0x0
8010513f:	e8 5c fb ff ff       	call   80104ca0 <argstr>
80105144:	83 c4 10             	add    $0x10,%esp
80105147:	85 c0                	test   %eax,%eax
80105149:	0f 88 fb 00 00 00    	js     8010524a <sys_link+0x11a>
8010514f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80105152:	83 ec 08             	sub    $0x8,%esp
80105155:	50                   	push   %eax
80105156:	6a 01                	push   $0x1
80105158:	e8 43 fb ff ff       	call   80104ca0 <argstr>
8010515d:	83 c4 10             	add    $0x10,%esp
80105160:	85 c0                	test   %eax,%eax
80105162:	0f 88 e2 00 00 00    	js     8010524a <sys_link+0x11a>
  begin_op();
80105168:	e8 c3 da ff ff       	call   80102c30 <begin_op>
  if((ip = namei(old)) == 0){
8010516d:	83 ec 0c             	sub    $0xc,%esp
80105170:	ff 75 d4             	pushl  -0x2c(%ebp)
80105173:	e8 a8 cd ff ff       	call   80101f20 <namei>
80105178:	83 c4 10             	add    $0x10,%esp
8010517b:	85 c0                	test   %eax,%eax
8010517d:	89 c3                	mov    %eax,%ebx
8010517f:	0f 84 ea 00 00 00    	je     8010526f <sys_link+0x13f>
  ilock(ip);
80105185:	83 ec 0c             	sub    $0xc,%esp
80105188:	50                   	push   %eax
80105189:	e8 32 c5 ff ff       	call   801016c0 <ilock>
  if(ip->type == T_DIR){
8010518e:	83 c4 10             	add    $0x10,%esp
80105191:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105196:	0f 84 bb 00 00 00    	je     80105257 <sys_link+0x127>
  ip->nlink++;
8010519c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
801051a1:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
801051a4:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
801051a7:	53                   	push   %ebx
801051a8:	e8 63 c4 ff ff       	call   80101610 <iupdate>
  iunlock(ip);
801051ad:	89 1c 24             	mov    %ebx,(%esp)
801051b0:	e8 eb c5 ff ff       	call   801017a0 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
801051b5:	58                   	pop    %eax
801051b6:	5a                   	pop    %edx
801051b7:	57                   	push   %edi
801051b8:	ff 75 d0             	pushl  -0x30(%ebp)
801051bb:	e8 80 cd ff ff       	call   80101f40 <nameiparent>
801051c0:	83 c4 10             	add    $0x10,%esp
801051c3:	85 c0                	test   %eax,%eax
801051c5:	89 c6                	mov    %eax,%esi
801051c7:	74 5b                	je     80105224 <sys_link+0xf4>
  ilock(dp);
801051c9:	83 ec 0c             	sub    $0xc,%esp
801051cc:	50                   	push   %eax
801051cd:	e8 ee c4 ff ff       	call   801016c0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
801051d2:	83 c4 10             	add    $0x10,%esp
801051d5:	8b 03                	mov    (%ebx),%eax
801051d7:	39 06                	cmp    %eax,(%esi)
801051d9:	75 3d                	jne    80105218 <sys_link+0xe8>
801051db:	83 ec 04             	sub    $0x4,%esp
801051de:	ff 73 04             	pushl  0x4(%ebx)
801051e1:	57                   	push   %edi
801051e2:	56                   	push   %esi
801051e3:	e8 78 cc ff ff       	call   80101e60 <dirlink>
801051e8:	83 c4 10             	add    $0x10,%esp
801051eb:	85 c0                	test   %eax,%eax
801051ed:	78 29                	js     80105218 <sys_link+0xe8>
  iunlockput(dp);
801051ef:	83 ec 0c             	sub    $0xc,%esp
801051f2:	56                   	push   %esi
801051f3:	e8 58 c7 ff ff       	call   80101950 <iunlockput>
  iput(ip);
801051f8:	89 1c 24             	mov    %ebx,(%esp)
801051fb:	e8 f0 c5 ff ff       	call   801017f0 <iput>
  end_op();
80105200:	e8 9b da ff ff       	call   80102ca0 <end_op>
  return 0;
80105205:	83 c4 10             	add    $0x10,%esp
80105208:	31 c0                	xor    %eax,%eax
}
8010520a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010520d:	5b                   	pop    %ebx
8010520e:	5e                   	pop    %esi
8010520f:	5f                   	pop    %edi
80105210:	5d                   	pop    %ebp
80105211:	c3                   	ret    
80105212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80105218:	83 ec 0c             	sub    $0xc,%esp
8010521b:	56                   	push   %esi
8010521c:	e8 2f c7 ff ff       	call   80101950 <iunlockput>
    goto bad;
80105221:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80105224:	83 ec 0c             	sub    $0xc,%esp
80105227:	53                   	push   %ebx
80105228:	e8 93 c4 ff ff       	call   801016c0 <ilock>
  ip->nlink--;
8010522d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105232:	89 1c 24             	mov    %ebx,(%esp)
80105235:	e8 d6 c3 ff ff       	call   80101610 <iupdate>
  iunlockput(ip);
8010523a:	89 1c 24             	mov    %ebx,(%esp)
8010523d:	e8 0e c7 ff ff       	call   80101950 <iunlockput>
  end_op();
80105242:	e8 59 da ff ff       	call   80102ca0 <end_op>
  return -1;
80105247:	83 c4 10             	add    $0x10,%esp
}
8010524a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010524d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105252:	5b                   	pop    %ebx
80105253:	5e                   	pop    %esi
80105254:	5f                   	pop    %edi
80105255:	5d                   	pop    %ebp
80105256:	c3                   	ret    
    iunlockput(ip);
80105257:	83 ec 0c             	sub    $0xc,%esp
8010525a:	53                   	push   %ebx
8010525b:	e8 f0 c6 ff ff       	call   80101950 <iunlockput>
    end_op();
80105260:	e8 3b da ff ff       	call   80102ca0 <end_op>
    return -1;
80105265:	83 c4 10             	add    $0x10,%esp
80105268:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010526d:	eb 9b                	jmp    8010520a <sys_link+0xda>
    end_op();
8010526f:	e8 2c da ff ff       	call   80102ca0 <end_op>
    return -1;
80105274:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105279:	eb 8f                	jmp    8010520a <sys_link+0xda>
8010527b:	90                   	nop
8010527c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105280 <sys_unlink>:
{
80105280:	55                   	push   %ebp
80105281:	89 e5                	mov    %esp,%ebp
80105283:	57                   	push   %edi
80105284:	56                   	push   %esi
80105285:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80105286:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80105289:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
8010528c:	50                   	push   %eax
8010528d:	6a 00                	push   $0x0
8010528f:	e8 0c fa ff ff       	call   80104ca0 <argstr>
80105294:	83 c4 10             	add    $0x10,%esp
80105297:	85 c0                	test   %eax,%eax
80105299:	0f 88 77 01 00 00    	js     80105416 <sys_unlink+0x196>
  if((dp = nameiparent(path, name)) == 0){
8010529f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
801052a2:	e8 89 d9 ff ff       	call   80102c30 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
801052a7:	83 ec 08             	sub    $0x8,%esp
801052aa:	53                   	push   %ebx
801052ab:	ff 75 c0             	pushl  -0x40(%ebp)
801052ae:	e8 8d cc ff ff       	call   80101f40 <nameiparent>
801052b3:	83 c4 10             	add    $0x10,%esp
801052b6:	85 c0                	test   %eax,%eax
801052b8:	89 c6                	mov    %eax,%esi
801052ba:	0f 84 60 01 00 00    	je     80105420 <sys_unlink+0x1a0>
  ilock(dp);
801052c0:	83 ec 0c             	sub    $0xc,%esp
801052c3:	50                   	push   %eax
801052c4:	e8 f7 c3 ff ff       	call   801016c0 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
801052c9:	58                   	pop    %eax
801052ca:	5a                   	pop    %edx
801052cb:	68 74 80 10 80       	push   $0x80108074
801052d0:	53                   	push   %ebx
801052d1:	e8 fa c8 ff ff       	call   80101bd0 <namecmp>
801052d6:	83 c4 10             	add    $0x10,%esp
801052d9:	85 c0                	test   %eax,%eax
801052db:	0f 84 03 01 00 00    	je     801053e4 <sys_unlink+0x164>
801052e1:	83 ec 08             	sub    $0x8,%esp
801052e4:	68 73 80 10 80       	push   $0x80108073
801052e9:	53                   	push   %ebx
801052ea:	e8 e1 c8 ff ff       	call   80101bd0 <namecmp>
801052ef:	83 c4 10             	add    $0x10,%esp
801052f2:	85 c0                	test   %eax,%eax
801052f4:	0f 84 ea 00 00 00    	je     801053e4 <sys_unlink+0x164>
  if((ip = dirlookup(dp, name, &off)) == 0)
801052fa:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801052fd:	83 ec 04             	sub    $0x4,%esp
80105300:	50                   	push   %eax
80105301:	53                   	push   %ebx
80105302:	56                   	push   %esi
80105303:	e8 e8 c8 ff ff       	call   80101bf0 <dirlookup>
80105308:	83 c4 10             	add    $0x10,%esp
8010530b:	85 c0                	test   %eax,%eax
8010530d:	89 c3                	mov    %eax,%ebx
8010530f:	0f 84 cf 00 00 00    	je     801053e4 <sys_unlink+0x164>
  ilock(ip);
80105315:	83 ec 0c             	sub    $0xc,%esp
80105318:	50                   	push   %eax
80105319:	e8 a2 c3 ff ff       	call   801016c0 <ilock>
  if(ip->nlink < 1)
8010531e:	83 c4 10             	add    $0x10,%esp
80105321:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80105326:	0f 8e 10 01 00 00    	jle    8010543c <sys_unlink+0x1bc>
  if(ip->type == T_DIR && !isdirempty(ip)){
8010532c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105331:	74 6d                	je     801053a0 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80105333:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105336:	83 ec 04             	sub    $0x4,%esp
80105339:	6a 10                	push   $0x10
8010533b:	6a 00                	push   $0x0
8010533d:	50                   	push   %eax
8010533e:	e8 ad f5 ff ff       	call   801048f0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105343:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105346:	6a 10                	push   $0x10
80105348:	ff 75 c4             	pushl  -0x3c(%ebp)
8010534b:	50                   	push   %eax
8010534c:	56                   	push   %esi
8010534d:	e8 4e c7 ff ff       	call   80101aa0 <writei>
80105352:	83 c4 20             	add    $0x20,%esp
80105355:	83 f8 10             	cmp    $0x10,%eax
80105358:	0f 85 eb 00 00 00    	jne    80105449 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
8010535e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105363:	0f 84 97 00 00 00    	je     80105400 <sys_unlink+0x180>
  iunlockput(dp);
80105369:	83 ec 0c             	sub    $0xc,%esp
8010536c:	56                   	push   %esi
8010536d:	e8 de c5 ff ff       	call   80101950 <iunlockput>
  ip->nlink--;
80105372:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105377:	89 1c 24             	mov    %ebx,(%esp)
8010537a:	e8 91 c2 ff ff       	call   80101610 <iupdate>
  iunlockput(ip);
8010537f:	89 1c 24             	mov    %ebx,(%esp)
80105382:	e8 c9 c5 ff ff       	call   80101950 <iunlockput>
  end_op();
80105387:	e8 14 d9 ff ff       	call   80102ca0 <end_op>
  return 0;
8010538c:	83 c4 10             	add    $0x10,%esp
8010538f:	31 c0                	xor    %eax,%eax
}
80105391:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105394:	5b                   	pop    %ebx
80105395:	5e                   	pop    %esi
80105396:	5f                   	pop    %edi
80105397:	5d                   	pop    %ebp
80105398:	c3                   	ret    
80105399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801053a0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801053a4:	76 8d                	jbe    80105333 <sys_unlink+0xb3>
801053a6:	bf 20 00 00 00       	mov    $0x20,%edi
801053ab:	eb 0f                	jmp    801053bc <sys_unlink+0x13c>
801053ad:	8d 76 00             	lea    0x0(%esi),%esi
801053b0:	83 c7 10             	add    $0x10,%edi
801053b3:	3b 7b 58             	cmp    0x58(%ebx),%edi
801053b6:	0f 83 77 ff ff ff    	jae    80105333 <sys_unlink+0xb3>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801053bc:	8d 45 d8             	lea    -0x28(%ebp),%eax
801053bf:	6a 10                	push   $0x10
801053c1:	57                   	push   %edi
801053c2:	50                   	push   %eax
801053c3:	53                   	push   %ebx
801053c4:	e8 d7 c5 ff ff       	call   801019a0 <readi>
801053c9:	83 c4 10             	add    $0x10,%esp
801053cc:	83 f8 10             	cmp    $0x10,%eax
801053cf:	75 5e                	jne    8010542f <sys_unlink+0x1af>
    if(de.inum != 0)
801053d1:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801053d6:	74 d8                	je     801053b0 <sys_unlink+0x130>
    iunlockput(ip);
801053d8:	83 ec 0c             	sub    $0xc,%esp
801053db:	53                   	push   %ebx
801053dc:	e8 6f c5 ff ff       	call   80101950 <iunlockput>
    goto bad;
801053e1:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
801053e4:	83 ec 0c             	sub    $0xc,%esp
801053e7:	56                   	push   %esi
801053e8:	e8 63 c5 ff ff       	call   80101950 <iunlockput>
  end_op();
801053ed:	e8 ae d8 ff ff       	call   80102ca0 <end_op>
  return -1;
801053f2:	83 c4 10             	add    $0x10,%esp
801053f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053fa:	eb 95                	jmp    80105391 <sys_unlink+0x111>
801053fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
80105400:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
    iupdate(dp);
80105405:	83 ec 0c             	sub    $0xc,%esp
80105408:	56                   	push   %esi
80105409:	e8 02 c2 ff ff       	call   80101610 <iupdate>
8010540e:	83 c4 10             	add    $0x10,%esp
80105411:	e9 53 ff ff ff       	jmp    80105369 <sys_unlink+0xe9>
    return -1;
80105416:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010541b:	e9 71 ff ff ff       	jmp    80105391 <sys_unlink+0x111>
    end_op();
80105420:	e8 7b d8 ff ff       	call   80102ca0 <end_op>
    return -1;
80105425:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010542a:	e9 62 ff ff ff       	jmp    80105391 <sys_unlink+0x111>
      panic("isdirempty: readi");
8010542f:	83 ec 0c             	sub    $0xc,%esp
80105432:	68 98 80 10 80       	push   $0x80108098
80105437:	e8 54 af ff ff       	call   80100390 <panic>
    panic("unlink: nlink < 1");
8010543c:	83 ec 0c             	sub    $0xc,%esp
8010543f:	68 86 80 10 80       	push   $0x80108086
80105444:	e8 47 af ff ff       	call   80100390 <panic>
    panic("unlink: writei");
80105449:	83 ec 0c             	sub    $0xc,%esp
8010544c:	68 aa 80 10 80       	push   $0x801080aa
80105451:	e8 3a af ff ff       	call   80100390 <panic>
80105456:	8d 76 00             	lea    0x0(%esi),%esi
80105459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105460 <sys_open>:

int
sys_open(void)
{
80105460:	55                   	push   %ebp
80105461:	89 e5                	mov    %esp,%ebp
80105463:	57                   	push   %edi
80105464:	56                   	push   %esi
80105465:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105466:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105469:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010546c:	50                   	push   %eax
8010546d:	6a 00                	push   $0x0
8010546f:	e8 2c f8 ff ff       	call   80104ca0 <argstr>
80105474:	83 c4 10             	add    $0x10,%esp
80105477:	85 c0                	test   %eax,%eax
80105479:	0f 88 1d 01 00 00    	js     8010559c <sys_open+0x13c>
8010547f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105482:	83 ec 08             	sub    $0x8,%esp
80105485:	50                   	push   %eax
80105486:	6a 01                	push   $0x1
80105488:	e8 63 f7 ff ff       	call   80104bf0 <argint>
8010548d:	83 c4 10             	add    $0x10,%esp
80105490:	85 c0                	test   %eax,%eax
80105492:	0f 88 04 01 00 00    	js     8010559c <sys_open+0x13c>
    return -1;

  begin_op();
80105498:	e8 93 d7 ff ff       	call   80102c30 <begin_op>

  if(omode & O_CREATE){
8010549d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801054a1:	0f 85 a9 00 00 00    	jne    80105550 <sys_open+0xf0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801054a7:	83 ec 0c             	sub    $0xc,%esp
801054aa:	ff 75 e0             	pushl  -0x20(%ebp)
801054ad:	e8 6e ca ff ff       	call   80101f20 <namei>
801054b2:	83 c4 10             	add    $0x10,%esp
801054b5:	85 c0                	test   %eax,%eax
801054b7:	89 c6                	mov    %eax,%esi
801054b9:	0f 84 b2 00 00 00    	je     80105571 <sys_open+0x111>
      end_op();
      return -1;
    }
    ilock(ip);
801054bf:	83 ec 0c             	sub    $0xc,%esp
801054c2:	50                   	push   %eax
801054c3:	e8 f8 c1 ff ff       	call   801016c0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801054c8:	83 c4 10             	add    $0x10,%esp
801054cb:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801054d0:	0f 84 aa 00 00 00    	je     80105580 <sys_open+0x120>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801054d6:	e8 e5 b8 ff ff       	call   80100dc0 <filealloc>
801054db:	85 c0                	test   %eax,%eax
801054dd:	89 c7                	mov    %eax,%edi
801054df:	0f 84 a6 00 00 00    	je     8010558b <sys_open+0x12b>
  struct proc *curproc = myproc();
801054e5:	e8 b6 e3 ff ff       	call   801038a0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801054ea:	31 db                	xor    %ebx,%ebx
801054ec:	eb 0e                	jmp    801054fc <sys_open+0x9c>
801054ee:	66 90                	xchg   %ax,%ax
801054f0:	83 c3 01             	add    $0x1,%ebx
801054f3:	83 fb 10             	cmp    $0x10,%ebx
801054f6:	0f 84 ac 00 00 00    	je     801055a8 <sys_open+0x148>
    if(curproc->ofile[fd] == 0){
801054fc:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105500:	85 d2                	test   %edx,%edx
80105502:	75 ec                	jne    801054f0 <sys_open+0x90>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105504:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80105507:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
8010550b:	56                   	push   %esi
8010550c:	e8 8f c2 ff ff       	call   801017a0 <iunlock>
  end_op();
80105511:	e8 8a d7 ff ff       	call   80102ca0 <end_op>

  f->type = FD_INODE;
80105516:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
8010551c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010551f:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
80105522:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105525:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
8010552c:	89 d0                	mov    %edx,%eax
8010552e:	f7 d0                	not    %eax
80105530:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105533:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
80105536:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105539:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
8010553d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105540:	89 d8                	mov    %ebx,%eax
80105542:	5b                   	pop    %ebx
80105543:	5e                   	pop    %esi
80105544:	5f                   	pop    %edi
80105545:	5d                   	pop    %ebp
80105546:	c3                   	ret    
80105547:	89 f6                	mov    %esi,%esi
80105549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ip = create(path, T_FILE, 0, 0);
80105550:	83 ec 0c             	sub    $0xc,%esp
80105553:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105556:	31 c9                	xor    %ecx,%ecx
80105558:	6a 00                	push   $0x0
8010555a:	ba 02 00 00 00       	mov    $0x2,%edx
8010555f:	e8 dc f7 ff ff       	call   80104d40 <create>
    if(ip == 0){
80105564:	83 c4 10             	add    $0x10,%esp
80105567:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105569:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010556b:	0f 85 65 ff ff ff    	jne    801054d6 <sys_open+0x76>
      end_op();
80105571:	e8 2a d7 ff ff       	call   80102ca0 <end_op>
      return -1;
80105576:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010557b:	eb c0                	jmp    8010553d <sys_open+0xdd>
8010557d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105580:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105583:	85 c9                	test   %ecx,%ecx
80105585:	0f 84 4b ff ff ff    	je     801054d6 <sys_open+0x76>
    iunlockput(ip);
8010558b:	83 ec 0c             	sub    $0xc,%esp
8010558e:	56                   	push   %esi
8010558f:	e8 bc c3 ff ff       	call   80101950 <iunlockput>
    end_op();
80105594:	e8 07 d7 ff ff       	call   80102ca0 <end_op>
    return -1;
80105599:	83 c4 10             	add    $0x10,%esp
8010559c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801055a1:	eb 9a                	jmp    8010553d <sys_open+0xdd>
801055a3:	90                   	nop
801055a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
801055a8:	83 ec 0c             	sub    $0xc,%esp
801055ab:	57                   	push   %edi
801055ac:	e8 cf b8 ff ff       	call   80100e80 <fileclose>
801055b1:	83 c4 10             	add    $0x10,%esp
801055b4:	eb d5                	jmp    8010558b <sys_open+0x12b>
801055b6:	8d 76 00             	lea    0x0(%esi),%esi
801055b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055c0 <sys_mkdir>:

int
sys_mkdir(void)
{
801055c0:	55                   	push   %ebp
801055c1:	89 e5                	mov    %esp,%ebp
801055c3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801055c6:	e8 65 d6 ff ff       	call   80102c30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801055cb:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055ce:	83 ec 08             	sub    $0x8,%esp
801055d1:	50                   	push   %eax
801055d2:	6a 00                	push   $0x0
801055d4:	e8 c7 f6 ff ff       	call   80104ca0 <argstr>
801055d9:	83 c4 10             	add    $0x10,%esp
801055dc:	85 c0                	test   %eax,%eax
801055de:	78 30                	js     80105610 <sys_mkdir+0x50>
801055e0:	83 ec 0c             	sub    $0xc,%esp
801055e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801055e6:	31 c9                	xor    %ecx,%ecx
801055e8:	6a 00                	push   $0x0
801055ea:	ba 01 00 00 00       	mov    $0x1,%edx
801055ef:	e8 4c f7 ff ff       	call   80104d40 <create>
801055f4:	83 c4 10             	add    $0x10,%esp
801055f7:	85 c0                	test   %eax,%eax
801055f9:	74 15                	je     80105610 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801055fb:	83 ec 0c             	sub    $0xc,%esp
801055fe:	50                   	push   %eax
801055ff:	e8 4c c3 ff ff       	call   80101950 <iunlockput>
  end_op();
80105604:	e8 97 d6 ff ff       	call   80102ca0 <end_op>
  return 0;
80105609:	83 c4 10             	add    $0x10,%esp
8010560c:	31 c0                	xor    %eax,%eax
}
8010560e:	c9                   	leave  
8010560f:	c3                   	ret    
    end_op();
80105610:	e8 8b d6 ff ff       	call   80102ca0 <end_op>
    return -1;
80105615:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010561a:	c9                   	leave  
8010561b:	c3                   	ret    
8010561c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105620 <sys_mknod>:

int
sys_mknod(void)
{
80105620:	55                   	push   %ebp
80105621:	89 e5                	mov    %esp,%ebp
80105623:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105626:	e8 05 d6 ff ff       	call   80102c30 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010562b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010562e:	83 ec 08             	sub    $0x8,%esp
80105631:	50                   	push   %eax
80105632:	6a 00                	push   $0x0
80105634:	e8 67 f6 ff ff       	call   80104ca0 <argstr>
80105639:	83 c4 10             	add    $0x10,%esp
8010563c:	85 c0                	test   %eax,%eax
8010563e:	78 60                	js     801056a0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105640:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105643:	83 ec 08             	sub    $0x8,%esp
80105646:	50                   	push   %eax
80105647:	6a 01                	push   $0x1
80105649:	e8 a2 f5 ff ff       	call   80104bf0 <argint>
  if((argstr(0, &path)) < 0 ||
8010564e:	83 c4 10             	add    $0x10,%esp
80105651:	85 c0                	test   %eax,%eax
80105653:	78 4b                	js     801056a0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105655:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105658:	83 ec 08             	sub    $0x8,%esp
8010565b:	50                   	push   %eax
8010565c:	6a 02                	push   $0x2
8010565e:	e8 8d f5 ff ff       	call   80104bf0 <argint>
     argint(1, &major) < 0 ||
80105663:	83 c4 10             	add    $0x10,%esp
80105666:	85 c0                	test   %eax,%eax
80105668:	78 36                	js     801056a0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010566a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010566e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105671:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
80105675:	ba 03 00 00 00       	mov    $0x3,%edx
8010567a:	50                   	push   %eax
8010567b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010567e:	e8 bd f6 ff ff       	call   80104d40 <create>
80105683:	83 c4 10             	add    $0x10,%esp
80105686:	85 c0                	test   %eax,%eax
80105688:	74 16                	je     801056a0 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010568a:	83 ec 0c             	sub    $0xc,%esp
8010568d:	50                   	push   %eax
8010568e:	e8 bd c2 ff ff       	call   80101950 <iunlockput>
  end_op();
80105693:	e8 08 d6 ff ff       	call   80102ca0 <end_op>
  return 0;
80105698:	83 c4 10             	add    $0x10,%esp
8010569b:	31 c0                	xor    %eax,%eax
}
8010569d:	c9                   	leave  
8010569e:	c3                   	ret    
8010569f:	90                   	nop
    end_op();
801056a0:	e8 fb d5 ff ff       	call   80102ca0 <end_op>
    return -1;
801056a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801056aa:	c9                   	leave  
801056ab:	c3                   	ret    
801056ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056b0 <sys_chdir>:

int
sys_chdir(void)
{
801056b0:	55                   	push   %ebp
801056b1:	89 e5                	mov    %esp,%ebp
801056b3:	56                   	push   %esi
801056b4:	53                   	push   %ebx
801056b5:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
801056b8:	e8 e3 e1 ff ff       	call   801038a0 <myproc>
801056bd:	89 c6                	mov    %eax,%esi
  
  begin_op();
801056bf:	e8 6c d5 ff ff       	call   80102c30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801056c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056c7:	83 ec 08             	sub    $0x8,%esp
801056ca:	50                   	push   %eax
801056cb:	6a 00                	push   $0x0
801056cd:	e8 ce f5 ff ff       	call   80104ca0 <argstr>
801056d2:	83 c4 10             	add    $0x10,%esp
801056d5:	85 c0                	test   %eax,%eax
801056d7:	78 77                	js     80105750 <sys_chdir+0xa0>
801056d9:	83 ec 0c             	sub    $0xc,%esp
801056dc:	ff 75 f4             	pushl  -0xc(%ebp)
801056df:	e8 3c c8 ff ff       	call   80101f20 <namei>
801056e4:	83 c4 10             	add    $0x10,%esp
801056e7:	85 c0                	test   %eax,%eax
801056e9:	89 c3                	mov    %eax,%ebx
801056eb:	74 63                	je     80105750 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801056ed:	83 ec 0c             	sub    $0xc,%esp
801056f0:	50                   	push   %eax
801056f1:	e8 ca bf ff ff       	call   801016c0 <ilock>
  if(ip->type != T_DIR){
801056f6:	83 c4 10             	add    $0x10,%esp
801056f9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801056fe:	75 30                	jne    80105730 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105700:	83 ec 0c             	sub    $0xc,%esp
80105703:	53                   	push   %ebx
80105704:	e8 97 c0 ff ff       	call   801017a0 <iunlock>
  iput(curproc->cwd);
80105709:	58                   	pop    %eax
8010570a:	ff 76 68             	pushl  0x68(%esi)
8010570d:	e8 de c0 ff ff       	call   801017f0 <iput>
  end_op();
80105712:	e8 89 d5 ff ff       	call   80102ca0 <end_op>
  curproc->cwd = ip;
80105717:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010571a:	83 c4 10             	add    $0x10,%esp
8010571d:	31 c0                	xor    %eax,%eax
}
8010571f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105722:	5b                   	pop    %ebx
80105723:	5e                   	pop    %esi
80105724:	5d                   	pop    %ebp
80105725:	c3                   	ret    
80105726:	8d 76 00             	lea    0x0(%esi),%esi
80105729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
80105730:	83 ec 0c             	sub    $0xc,%esp
80105733:	53                   	push   %ebx
80105734:	e8 17 c2 ff ff       	call   80101950 <iunlockput>
    end_op();
80105739:	e8 62 d5 ff ff       	call   80102ca0 <end_op>
    return -1;
8010573e:	83 c4 10             	add    $0x10,%esp
80105741:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105746:	eb d7                	jmp    8010571f <sys_chdir+0x6f>
80105748:	90                   	nop
80105749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105750:	e8 4b d5 ff ff       	call   80102ca0 <end_op>
    return -1;
80105755:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010575a:	eb c3                	jmp    8010571f <sys_chdir+0x6f>
8010575c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105760 <sys_exec>:

int
sys_exec(void)
{
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
80105763:	57                   	push   %edi
80105764:	56                   	push   %esi
80105765:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105766:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010576c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105772:	50                   	push   %eax
80105773:	6a 00                	push   $0x0
80105775:	e8 26 f5 ff ff       	call   80104ca0 <argstr>
8010577a:	83 c4 10             	add    $0x10,%esp
8010577d:	85 c0                	test   %eax,%eax
8010577f:	0f 88 87 00 00 00    	js     8010580c <sys_exec+0xac>
80105785:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010578b:	83 ec 08             	sub    $0x8,%esp
8010578e:	50                   	push   %eax
8010578f:	6a 01                	push   $0x1
80105791:	e8 5a f4 ff ff       	call   80104bf0 <argint>
80105796:	83 c4 10             	add    $0x10,%esp
80105799:	85 c0                	test   %eax,%eax
8010579b:	78 6f                	js     8010580c <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010579d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801057a3:	83 ec 04             	sub    $0x4,%esp
  for(i=0;; i++){
801057a6:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
801057a8:	68 80 00 00 00       	push   $0x80
801057ad:	6a 00                	push   $0x0
801057af:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801057b5:	50                   	push   %eax
801057b6:	e8 35 f1 ff ff       	call   801048f0 <memset>
801057bb:	83 c4 10             	add    $0x10,%esp
801057be:	eb 2c                	jmp    801057ec <sys_exec+0x8c>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
801057c0:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801057c6:	85 c0                	test   %eax,%eax
801057c8:	74 56                	je     80105820 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801057ca:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
801057d0:	83 ec 08             	sub    $0x8,%esp
801057d3:	8d 14 31             	lea    (%ecx,%esi,1),%edx
801057d6:	52                   	push   %edx
801057d7:	50                   	push   %eax
801057d8:	e8 a3 f3 ff ff       	call   80104b80 <fetchstr>
801057dd:	83 c4 10             	add    $0x10,%esp
801057e0:	85 c0                	test   %eax,%eax
801057e2:	78 28                	js     8010580c <sys_exec+0xac>
  for(i=0;; i++){
801057e4:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
801057e7:	83 fb 20             	cmp    $0x20,%ebx
801057ea:	74 20                	je     8010580c <sys_exec+0xac>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801057ec:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801057f2:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
801057f9:	83 ec 08             	sub    $0x8,%esp
801057fc:	57                   	push   %edi
801057fd:	01 f0                	add    %esi,%eax
801057ff:	50                   	push   %eax
80105800:	e8 3b f3 ff ff       	call   80104b40 <fetchint>
80105805:	83 c4 10             	add    $0x10,%esp
80105808:	85 c0                	test   %eax,%eax
8010580a:	79 b4                	jns    801057c0 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
8010580c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010580f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105814:	5b                   	pop    %ebx
80105815:	5e                   	pop    %esi
80105816:	5f                   	pop    %edi
80105817:	5d                   	pop    %ebp
80105818:	c3                   	ret    
80105819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
80105820:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105826:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
80105829:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105830:	00 00 00 00 
  return exec(path, argv);
80105834:	50                   	push   %eax
80105835:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010583b:	e8 10 b2 ff ff       	call   80100a50 <exec>
80105840:	83 c4 10             	add    $0x10,%esp
}
80105843:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105846:	5b                   	pop    %ebx
80105847:	5e                   	pop    %esi
80105848:	5f                   	pop    %edi
80105849:	5d                   	pop    %ebp
8010584a:	c3                   	ret    
8010584b:	90                   	nop
8010584c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105850 <sys_pipe>:

int
sys_pipe(void)
{
80105850:	55                   	push   %ebp
80105851:	89 e5                	mov    %esp,%ebp
80105853:	57                   	push   %edi
80105854:	56                   	push   %esi
80105855:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105856:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105859:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010585c:	6a 08                	push   $0x8
8010585e:	50                   	push   %eax
8010585f:	6a 00                	push   $0x0
80105861:	e8 da f3 ff ff       	call   80104c40 <argptr>
80105866:	83 c4 10             	add    $0x10,%esp
80105869:	85 c0                	test   %eax,%eax
8010586b:	0f 88 ae 00 00 00    	js     8010591f <sys_pipe+0xcf>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105871:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105874:	83 ec 08             	sub    $0x8,%esp
80105877:	50                   	push   %eax
80105878:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010587b:	50                   	push   %eax
8010587c:	e8 4f da ff ff       	call   801032d0 <pipealloc>
80105881:	83 c4 10             	add    $0x10,%esp
80105884:	85 c0                	test   %eax,%eax
80105886:	0f 88 93 00 00 00    	js     8010591f <sys_pipe+0xcf>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010588c:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
8010588f:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80105891:	e8 0a e0 ff ff       	call   801038a0 <myproc>
80105896:	eb 10                	jmp    801058a8 <sys_pipe+0x58>
80105898:	90                   	nop
80105899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(fd = 0; fd < NOFILE; fd++){
801058a0:	83 c3 01             	add    $0x1,%ebx
801058a3:	83 fb 10             	cmp    $0x10,%ebx
801058a6:	74 60                	je     80105908 <sys_pipe+0xb8>
    if(curproc->ofile[fd] == 0){
801058a8:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801058ac:	85 f6                	test   %esi,%esi
801058ae:	75 f0                	jne    801058a0 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
801058b0:	8d 73 08             	lea    0x8(%ebx),%esi
801058b3:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801058b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
801058ba:	e8 e1 df ff ff       	call   801038a0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801058bf:	31 d2                	xor    %edx,%edx
801058c1:	eb 0d                	jmp    801058d0 <sys_pipe+0x80>
801058c3:	90                   	nop
801058c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801058c8:	83 c2 01             	add    $0x1,%edx
801058cb:	83 fa 10             	cmp    $0x10,%edx
801058ce:	74 28                	je     801058f8 <sys_pipe+0xa8>
    if(curproc->ofile[fd] == 0){
801058d0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801058d4:	85 c9                	test   %ecx,%ecx
801058d6:	75 f0                	jne    801058c8 <sys_pipe+0x78>
      curproc->ofile[fd] = f;
801058d8:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801058dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058df:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801058e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058e4:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801058e7:	31 c0                	xor    %eax,%eax
}
801058e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058ec:	5b                   	pop    %ebx
801058ed:	5e                   	pop    %esi
801058ee:	5f                   	pop    %edi
801058ef:	5d                   	pop    %ebp
801058f0:	c3                   	ret    
801058f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
801058f8:	e8 a3 df ff ff       	call   801038a0 <myproc>
801058fd:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105904:	00 
80105905:	8d 76 00             	lea    0x0(%esi),%esi
    fileclose(rf);
80105908:	83 ec 0c             	sub    $0xc,%esp
8010590b:	ff 75 e0             	pushl  -0x20(%ebp)
8010590e:	e8 6d b5 ff ff       	call   80100e80 <fileclose>
    fileclose(wf);
80105913:	58                   	pop    %eax
80105914:	ff 75 e4             	pushl  -0x1c(%ebp)
80105917:	e8 64 b5 ff ff       	call   80100e80 <fileclose>
    return -1;
8010591c:	83 c4 10             	add    $0x10,%esp
8010591f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105924:	eb c3                	jmp    801058e9 <sys_pipe+0x99>
80105926:	66 90                	xchg   %ax,%ax
80105928:	66 90                	xchg   %ax,%ax
8010592a:	66 90                	xchg   %ax,%ax
8010592c:	66 90                	xchg   %ax,%ax
8010592e:	66 90                	xchg   %ax,%ax

80105930 <sys_fork>:
#include "proc.h"
#include "pstat.h"

int
sys_fork(void)
{
80105930:	55                   	push   %ebp
80105931:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105933:	5d                   	pop    %ebp
  return fork();
80105934:	e9 07 e1 ff ff       	jmp    80103a40 <fork>
80105939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105940 <sys_exit>:

int
sys_exit(void)
{
80105940:	55                   	push   %ebp
80105941:	89 e5                	mov    %esp,%ebp
80105943:	83 ec 08             	sub    $0x8,%esp
  exit();
80105946:	e8 f5 e3 ff ff       	call   80103d40 <exit>
  return 0;  // not reached
}
8010594b:	31 c0                	xor    %eax,%eax
8010594d:	c9                   	leave  
8010594e:	c3                   	ret    
8010594f:	90                   	nop

80105950 <sys_wait>:

int
sys_wait(void)
{
80105950:	55                   	push   %ebp
80105951:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105953:	5d                   	pop    %ebp
  return wait();
80105954:	e9 27 e6 ff ff       	jmp    80103f80 <wait>
80105959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105960 <sys_kill>:

int
sys_kill(void)
{
80105960:	55                   	push   %ebp
80105961:	89 e5                	mov    %esp,%ebp
80105963:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105966:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105969:	50                   	push   %eax
8010596a:	6a 00                	push   $0x0
8010596c:	e8 7f f2 ff ff       	call   80104bf0 <argint>
80105971:	83 c4 10             	add    $0x10,%esp
80105974:	85 c0                	test   %eax,%eax
80105976:	78 18                	js     80105990 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105978:	83 ec 0c             	sub    $0xc,%esp
8010597b:	ff 75 f4             	pushl  -0xc(%ebp)
8010597e:	e8 5d e7 ff ff       	call   801040e0 <kill>
80105983:	83 c4 10             	add    $0x10,%esp
}
80105986:	c9                   	leave  
80105987:	c3                   	ret    
80105988:	90                   	nop
80105989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105990:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105995:	c9                   	leave  
80105996:	c3                   	ret    
80105997:	89 f6                	mov    %esi,%esi
80105999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801059a0 <sys_getpid>:

int
sys_getpid(void)
{
801059a0:	55                   	push   %ebp
801059a1:	89 e5                	mov    %esp,%ebp
801059a3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801059a6:	e8 f5 de ff ff       	call   801038a0 <myproc>
801059ab:	8b 40 10             	mov    0x10(%eax),%eax
}
801059ae:	c9                   	leave  
801059af:	c3                   	ret    

801059b0 <sys_sbrk>:

int
sys_sbrk(void)
{
801059b0:	55                   	push   %ebp
801059b1:	89 e5                	mov    %esp,%ebp
801059b3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
801059b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801059b7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801059ba:	50                   	push   %eax
801059bb:	6a 00                	push   $0x0
801059bd:	e8 2e f2 ff ff       	call   80104bf0 <argint>
801059c2:	83 c4 10             	add    $0x10,%esp
801059c5:	85 c0                	test   %eax,%eax
801059c7:	78 27                	js     801059f0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
801059c9:	e8 d2 de ff ff       	call   801038a0 <myproc>
  if(growproc(n) < 0)
801059ce:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
801059d1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801059d3:	ff 75 f4             	pushl  -0xc(%ebp)
801059d6:	e8 e5 df ff ff       	call   801039c0 <growproc>
801059db:	83 c4 10             	add    $0x10,%esp
801059de:	85 c0                	test   %eax,%eax
801059e0:	78 0e                	js     801059f0 <sys_sbrk+0x40>
    return -1;
  return addr;
}
801059e2:	89 d8                	mov    %ebx,%eax
801059e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801059e7:	c9                   	leave  
801059e8:	c3                   	ret    
801059e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801059f0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801059f5:	eb eb                	jmp    801059e2 <sys_sbrk+0x32>
801059f7:	89 f6                	mov    %esi,%esi
801059f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a00 <sys_sleep>:

int
sys_sleep(void)
{
80105a00:	55                   	push   %ebp
80105a01:	89 e5                	mov    %esp,%ebp
80105a03:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105a04:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105a07:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
80105a0a:	50                   	push   %eax
80105a0b:	6a 00                	push   $0x0
80105a0d:	e8 de f1 ff ff       	call   80104bf0 <argint>
80105a12:	83 c4 10             	add    $0x10,%esp
80105a15:	85 c0                	test   %eax,%eax
80105a17:	0f 88 8a 00 00 00    	js     80105aa7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
80105a1d:	83 ec 0c             	sub    $0xc,%esp
80105a20:	68 40 68 11 80       	push   $0x80116840
80105a25:	e8 b6 ed ff ff       	call   801047e0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105a2a:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105a2d:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105a30:	8b 1d 80 70 11 80    	mov    0x80117080,%ebx
  while(ticks - ticks0 < n){
80105a36:	85 d2                	test   %edx,%edx
80105a38:	75 27                	jne    80105a61 <sys_sleep+0x61>
80105a3a:	eb 54                	jmp    80105a90 <sys_sleep+0x90>
80105a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105a40:	83 ec 08             	sub    $0x8,%esp
80105a43:	68 40 68 11 80       	push   $0x80116840
80105a48:	68 80 70 11 80       	push   $0x80117080
80105a4d:	e8 6e e4 ff ff       	call   80103ec0 <sleep>
  while(ticks - ticks0 < n){
80105a52:	a1 80 70 11 80       	mov    0x80117080,%eax
80105a57:	83 c4 10             	add    $0x10,%esp
80105a5a:	29 d8                	sub    %ebx,%eax
80105a5c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105a5f:	73 2f                	jae    80105a90 <sys_sleep+0x90>
    if(myproc()->killed){
80105a61:	e8 3a de ff ff       	call   801038a0 <myproc>
80105a66:	8b 40 24             	mov    0x24(%eax),%eax
80105a69:	85 c0                	test   %eax,%eax
80105a6b:	74 d3                	je     80105a40 <sys_sleep+0x40>
      release(&tickslock);
80105a6d:	83 ec 0c             	sub    $0xc,%esp
80105a70:	68 40 68 11 80       	push   $0x80116840
80105a75:	e8 26 ee ff ff       	call   801048a0 <release>
      return -1;
80105a7a:	83 c4 10             	add    $0x10,%esp
80105a7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105a82:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a85:	c9                   	leave  
80105a86:	c3                   	ret    
80105a87:	89 f6                	mov    %esi,%esi
80105a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
80105a90:	83 ec 0c             	sub    $0xc,%esp
80105a93:	68 40 68 11 80       	push   $0x80116840
80105a98:	e8 03 ee ff ff       	call   801048a0 <release>
  return 0;
80105a9d:	83 c4 10             	add    $0x10,%esp
80105aa0:	31 c0                	xor    %eax,%eax
}
80105aa2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105aa5:	c9                   	leave  
80105aa6:	c3                   	ret    
    return -1;
80105aa7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105aac:	eb f4                	jmp    80105aa2 <sys_sleep+0xa2>
80105aae:	66 90                	xchg   %ax,%ax

80105ab0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105ab0:	55                   	push   %ebp
80105ab1:	89 e5                	mov    %esp,%ebp
80105ab3:	53                   	push   %ebx
80105ab4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105ab7:	68 40 68 11 80       	push   $0x80116840
80105abc:	e8 1f ed ff ff       	call   801047e0 <acquire>
  xticks = ticks;
80105ac1:	8b 1d 80 70 11 80    	mov    0x80117080,%ebx
  release(&tickslock);
80105ac7:	c7 04 24 40 68 11 80 	movl   $0x80116840,(%esp)
80105ace:	e8 cd ed ff ff       	call   801048a0 <release>
  return xticks;
}
80105ad3:	89 d8                	mov    %ebx,%eax
80105ad5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105ad8:	c9                   	leave  
80105ad9:	c3                   	ret    
80105ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105ae0 <sys_gettime>:

int
sys_gettime(void) {
80105ae0:	55                   	push   %ebp
80105ae1:	89 e5                	mov    %esp,%ebp
80105ae3:	83 ec 1c             	sub    $0x1c,%esp
  struct rtcdate *d;
  if (argptr(0, (char **)&d, sizeof(struct rtcdate)) < 0)
80105ae6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105ae9:	6a 18                	push   $0x18
80105aeb:	50                   	push   %eax
80105aec:	6a 00                	push   $0x0
80105aee:	e8 4d f1 ff ff       	call   80104c40 <argptr>
80105af3:	83 c4 10             	add    $0x10,%esp
80105af6:	85 c0                	test   %eax,%eax
80105af8:	78 16                	js     80105b10 <sys_gettime+0x30>
      return -1;
  cmostime(d);
80105afa:	83 ec 0c             	sub    $0xc,%esp
80105afd:	ff 75 f4             	pushl  -0xc(%ebp)
80105b00:	e8 4b cd ff ff       	call   80102850 <cmostime>
  return 0;
80105b05:	83 c4 10             	add    $0x10,%esp
80105b08:	31 c0                	xor    %eax,%eax
}
80105b0a:	c9                   	leave  
80105b0b:	c3                   	ret    
80105b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80105b10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b15:	c9                   	leave  
80105b16:	c3                   	ret    
80105b17:	89 f6                	mov    %esi,%esi
80105b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b20 <sys_settickets>:

int
sys_settickets(void) {
80105b20:	55                   	push   %ebp
80105b21:	89 e5                	mov    %esp,%ebp
80105b23:	83 ec 20             	sub    $0x20,%esp
  int n;
  if(argint(0, &n) < 0) {
80105b26:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b29:	50                   	push   %eax
80105b2a:	6a 00                	push   $0x0
80105b2c:	e8 bf f0 ff ff       	call   80104bf0 <argint>
80105b31:	83 c4 10             	add    $0x10,%esp
80105b34:	85 c0                	test   %eax,%eax
80105b36:	78 18                	js     80105b50 <sys_settickets+0x30>
    return -1;
  }
  else {
    settickets(n);
80105b38:	83 ec 0c             	sub    $0xc,%esp
80105b3b:	ff 75 f4             	pushl  -0xc(%ebp)
80105b3e:	e8 1d e6 ff ff       	call   80104160 <settickets>
  }
  return 0;
80105b43:	83 c4 10             	add    $0x10,%esp
80105b46:	31 c0                	xor    %eax,%eax
}
80105b48:	c9                   	leave  
80105b49:	c3                   	ret    
80105b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105b50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b55:	c9                   	leave  
80105b56:	c3                   	ret    
80105b57:	89 f6                	mov    %esi,%esi
80105b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b60 <sys_getpinfo>:

int
sys_getpinfo(void){
80105b60:	55                   	push   %ebp
80105b61:	89 e5                	mov    %esp,%ebp
80105b63:	83 ec 1c             	sub    $0x1c,%esp
    struct pstat *d;
  if (argptr(0, (char **)&d, sizeof(struct pstat)) < 0)
80105b66:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b69:	68 00 04 00 00       	push   $0x400
80105b6e:	50                   	push   %eax
80105b6f:	6a 00                	push   $0x0
80105b71:	e8 ca f0 ff ff       	call   80104c40 <argptr>
80105b76:	83 c4 10             	add    $0x10,%esp
80105b79:	85 c0                	test   %eax,%eax
80105b7b:	78 13                	js     80105b90 <sys_getpinfo+0x30>
      return -1;
  getpinfo(d);
80105b7d:	83 ec 0c             	sub    $0xc,%esp
80105b80:	ff 75 f4             	pushl  -0xc(%ebp)
80105b83:	e8 48 e6 ff ff       	call   801041d0 <getpinfo>
  return 0;
80105b88:	83 c4 10             	add    $0x10,%esp
80105b8b:	31 c0                	xor    %eax,%eax
}
80105b8d:	c9                   	leave  
80105b8e:	c3                   	ret    
80105b8f:	90                   	nop
      return -1;
80105b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b95:	c9                   	leave  
80105b96:	c3                   	ret    
80105b97:	89 f6                	mov    %esi,%esi
80105b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ba0 <sys_mprotect>:


int
sys_mprotect(void){
80105ba0:	55                   	push   %ebp
80105ba1:	89 e5                	mov    %esp,%ebp
80105ba3:	83 ec 20             	sub    $0x20,%esp
  int d;
  int n = 0;
  if(argint(0, &d)<0 || argint(1, &n)<0)
80105ba6:	8d 45 f0             	lea    -0x10(%ebp),%eax
  int n = 0;
80105ba9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(argint(0, &d)<0 || argint(1, &n)<0)
80105bb0:	50                   	push   %eax
80105bb1:	6a 00                	push   $0x0
80105bb3:	e8 38 f0 ff ff       	call   80104bf0 <argint>
80105bb8:	83 c4 10             	add    $0x10,%esp
80105bbb:	85 c0                	test   %eax,%eax
80105bbd:	78 31                	js     80105bf0 <sys_mprotect+0x50>
80105bbf:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105bc2:	83 ec 08             	sub    $0x8,%esp
80105bc5:	50                   	push   %eax
80105bc6:	6a 01                	push   $0x1
80105bc8:	e8 23 f0 ff ff       	call   80104bf0 <argint>
80105bcd:	83 c4 10             	add    $0x10,%esp
80105bd0:	85 c0                	test   %eax,%eax
80105bd2:	78 1c                	js     80105bf0 <sys_mprotect+0x50>
    return -1;
  return mprotect((void *)d,n);
80105bd4:	83 ec 08             	sub    $0x8,%esp
80105bd7:	ff 75 f4             	pushl  -0xc(%ebp)
80105bda:	ff 75 f0             	pushl  -0x10(%ebp)
80105bdd:	e8 7e 19 00 00       	call   80107560 <mprotect>
80105be2:	83 c4 10             	add    $0x10,%esp

}
80105be5:	c9                   	leave  
80105be6:	c3                   	ret    
80105be7:	89 f6                	mov    %esi,%esi
80105be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80105bf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105bf5:	c9                   	leave  
80105bf6:	c3                   	ret    
80105bf7:	89 f6                	mov    %esi,%esi
80105bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c00 <sys_munprotect>:

int
sys_munprotect(void){
80105c00:	55                   	push   %ebp
80105c01:	89 e5                	mov    %esp,%ebp
80105c03:	83 ec 20             	sub    $0x20,%esp
  int d;
  int n = 0;
  if(argint(0, &d)<0 || argint(1, &n)<0)
80105c06:	8d 45 f0             	lea    -0x10(%ebp),%eax
  int n = 0;
80105c09:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(argint(0, &d)<0 || argint(1, &n)<0)
80105c10:	50                   	push   %eax
80105c11:	6a 00                	push   $0x0
80105c13:	e8 d8 ef ff ff       	call   80104bf0 <argint>
80105c18:	83 c4 10             	add    $0x10,%esp
80105c1b:	85 c0                	test   %eax,%eax
80105c1d:	78 31                	js     80105c50 <sys_munprotect+0x50>
80105c1f:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105c22:	83 ec 08             	sub    $0x8,%esp
80105c25:	50                   	push   %eax
80105c26:	6a 01                	push   $0x1
80105c28:	e8 c3 ef ff ff       	call   80104bf0 <argint>
80105c2d:	83 c4 10             	add    $0x10,%esp
80105c30:	85 c0                	test   %eax,%eax
80105c32:	78 1c                	js     80105c50 <sys_munprotect+0x50>
    return -1;
  return munprotect((void *)d,n);
80105c34:	83 ec 08             	sub    $0x8,%esp
80105c37:	ff 75 f4             	pushl  -0xc(%ebp)
80105c3a:	ff 75 f0             	pushl  -0x10(%ebp)
80105c3d:	e8 fe 19 00 00       	call   80107640 <munprotect>
80105c42:	83 c4 10             	add    $0x10,%esp

}
80105c45:	c9                   	leave  
80105c46:	c3                   	ret    
80105c47:	89 f6                	mov    %esi,%esi
80105c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80105c50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105c55:	c9                   	leave  
80105c56:	c3                   	ret    
80105c57:	89 f6                	mov    %esi,%esi
80105c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c60 <sys_clone>:


int
sys_clone(void)
{
80105c60:	55                   	push   %ebp
80105c61:	89 e5                	mov    %esp,%ebp
80105c63:	57                   	push   %edi
80105c64:	56                   	push   %esi
80105c65:	53                   	push   %ebx
  void * fcn,* arg,* stack;
  int x;
   argint(0, &x);
80105c66:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
{
80105c69:	83 ec 24             	sub    $0x24,%esp
   argint(0, &x);
80105c6c:	53                   	push   %ebx
80105c6d:	6a 00                	push   $0x0
80105c6f:	e8 7c ef ff ff       	call   80104bf0 <argint>
  fcn = (void*) x;
  
   argint(1, &x);
80105c74:	58                   	pop    %eax
80105c75:	5a                   	pop    %edx
80105c76:	53                   	push   %ebx
80105c77:	6a 01                	push   $0x1
  fcn = (void*) x;
80105c79:	8b 75 e4             	mov    -0x1c(%ebp),%esi
   argint(1, &x);
80105c7c:	e8 6f ef ff ff       	call   80104bf0 <argint>
  arg = (void*) x;
  
   argint(2, &x);
80105c81:	59                   	pop    %ecx
80105c82:	58                   	pop    %eax
  arg = (void*) x;
80105c83:	8b 7d e4             	mov    -0x1c(%ebp),%edi
   argint(2, &x);
80105c86:	53                   	push   %ebx
80105c87:	6a 02                	push   $0x2
80105c89:	e8 62 ef ff ff       	call   80104bf0 <argint>
  stack = (void*) x;
  return clone(fcn, arg, stack);
80105c8e:	83 c4 0c             	add    $0xc,%esp
80105c91:	ff 75 e4             	pushl  -0x1c(%ebp)
80105c94:	57                   	push   %edi
80105c95:	56                   	push   %esi
80105c96:	e8 85 e6 ff ff       	call   80104320 <clone>
  
}
80105c9b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c9e:	5b                   	pop    %ebx
80105c9f:	5e                   	pop    %esi
80105ca0:	5f                   	pop    %edi
80105ca1:	5d                   	pop    %ebp
80105ca2:	c3                   	ret    
80105ca3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105cb0 <sys_join>:

int
sys_join(void)
{
80105cb0:	55                   	push   %ebp
80105cb1:	89 e5                	mov    %esp,%ebp
80105cb3:	83 ec 20             	sub    $0x20,%esp
  void **stack;
  int stackArg;
  stackArg = argint(0, &stackArg);
80105cb6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105cb9:	50                   	push   %eax
80105cba:	6a 00                	push   $0x0
80105cbc:	e8 2f ef ff ff       	call   80104bf0 <argint>
80105cc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  stack = (void**) stackArg;
  return join(stack);
80105cc4:	89 04 24             	mov    %eax,(%esp)
80105cc7:	e8 84 e7 ff ff       	call   80104450 <join>
   
}
80105ccc:	c9                   	leave  
80105ccd:	c3                   	ret    

80105cce <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105cce:	1e                   	push   %ds
  pushl %es
80105ccf:	06                   	push   %es
  pushl %fs
80105cd0:	0f a0                	push   %fs
  pushl %gs
80105cd2:	0f a8                	push   %gs
  pushal
80105cd4:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105cd5:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105cd9:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105cdb:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105cdd:	54                   	push   %esp
  call trap
80105cde:	e8 cd 00 00 00       	call   80105db0 <trap>
  addl $4, %esp
80105ce3:	83 c4 04             	add    $0x4,%esp

80105ce6 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105ce6:	61                   	popa   
  popl %gs
80105ce7:	0f a9                	pop    %gs
  popl %fs
80105ce9:	0f a1                	pop    %fs
  popl %es
80105ceb:	07                   	pop    %es
  popl %ds
80105cec:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105ced:	83 c4 08             	add    $0x8,%esp
  iret
80105cf0:	cf                   	iret   
80105cf1:	66 90                	xchg   %ax,%ax
80105cf3:	66 90                	xchg   %ax,%ax
80105cf5:	66 90                	xchg   %ax,%ax
80105cf7:	66 90                	xchg   %ax,%ax
80105cf9:	66 90                	xchg   %ax,%ax
80105cfb:	66 90                	xchg   %ax,%ax
80105cfd:	66 90                	xchg   %ax,%ax
80105cff:	90                   	nop

80105d00 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105d00:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105d01:	31 c0                	xor    %eax,%eax
{
80105d03:	89 e5                	mov    %esp,%ebp
80105d05:	83 ec 08             	sub    $0x8,%esp
80105d08:	90                   	nop
80105d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105d10:	8b 14 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%edx
80105d17:	c7 04 c5 82 68 11 80 	movl   $0x8e000008,-0x7fee977e(,%eax,8)
80105d1e:	08 00 00 8e 
80105d22:	66 89 14 c5 80 68 11 	mov    %dx,-0x7fee9780(,%eax,8)
80105d29:	80 
80105d2a:	c1 ea 10             	shr    $0x10,%edx
80105d2d:	66 89 14 c5 86 68 11 	mov    %dx,-0x7fee977a(,%eax,8)
80105d34:	80 
  for(i = 0; i < 256; i++)
80105d35:	83 c0 01             	add    $0x1,%eax
80105d38:	3d 00 01 00 00       	cmp    $0x100,%eax
80105d3d:	75 d1                	jne    80105d10 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105d3f:	a1 08 b1 10 80       	mov    0x8010b108,%eax

  initlock(&tickslock, "time");
80105d44:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105d47:	c7 05 82 6a 11 80 08 	movl   $0xef000008,0x80116a82
80105d4e:	00 00 ef 
  initlock(&tickslock, "time");
80105d51:	68 b9 80 10 80       	push   $0x801080b9
80105d56:	68 40 68 11 80       	push   $0x80116840
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105d5b:	66 a3 80 6a 11 80    	mov    %ax,0x80116a80
80105d61:	c1 e8 10             	shr    $0x10,%eax
80105d64:	66 a3 86 6a 11 80    	mov    %ax,0x80116a86
  initlock(&tickslock, "time");
80105d6a:	e8 31 e9 ff ff       	call   801046a0 <initlock>
}
80105d6f:	83 c4 10             	add    $0x10,%esp
80105d72:	c9                   	leave  
80105d73:	c3                   	ret    
80105d74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105d7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105d80 <idtinit>:

void
idtinit(void)
{
80105d80:	55                   	push   %ebp
  pd[0] = size-1;
80105d81:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105d86:	89 e5                	mov    %esp,%ebp
80105d88:	83 ec 10             	sub    $0x10,%esp
80105d8b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105d8f:	b8 80 68 11 80       	mov    $0x80116880,%eax
80105d94:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105d98:	c1 e8 10             	shr    $0x10,%eax
80105d9b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105d9f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105da2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105da5:	c9                   	leave  
80105da6:	c3                   	ret    
80105da7:	89 f6                	mov    %esi,%esi
80105da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105db0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105db0:	55                   	push   %ebp
80105db1:	89 e5                	mov    %esp,%ebp
80105db3:	57                   	push   %edi
80105db4:	56                   	push   %esi
80105db5:	53                   	push   %ebx
80105db6:	83 ec 1c             	sub    $0x1c,%esp
80105db9:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
80105dbc:	8b 47 30             	mov    0x30(%edi),%eax
80105dbf:	83 f8 40             	cmp    $0x40,%eax
80105dc2:	0f 84 f0 00 00 00    	je     80105eb8 <trap+0x108>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105dc8:	83 e8 20             	sub    $0x20,%eax
80105dcb:	83 f8 1f             	cmp    $0x1f,%eax
80105dce:	77 10                	ja     80105de0 <trap+0x30>
80105dd0:	ff 24 85 60 81 10 80 	jmp    *-0x7fef7ea0(,%eax,4)
80105dd7:	89 f6                	mov    %esi,%esi
80105dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105de0:	e8 bb da ff ff       	call   801038a0 <myproc>
80105de5:	85 c0                	test   %eax,%eax
80105de7:	8b 5f 38             	mov    0x38(%edi),%ebx
80105dea:	0f 84 14 02 00 00    	je     80106004 <trap+0x254>
80105df0:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105df4:	0f 84 0a 02 00 00    	je     80106004 <trap+0x254>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105dfa:	0f 20 d1             	mov    %cr2,%ecx
80105dfd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105e00:	e8 7b da ff ff       	call   80103880 <cpuid>
80105e05:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105e08:	8b 47 34             	mov    0x34(%edi),%eax
80105e0b:	8b 77 30             	mov    0x30(%edi),%esi
80105e0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105e11:	e8 8a da ff ff       	call   801038a0 <myproc>
80105e16:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105e19:	e8 82 da ff ff       	call   801038a0 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105e1e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105e21:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105e24:	51                   	push   %ecx
80105e25:	53                   	push   %ebx
80105e26:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
80105e27:	8b 55 e0             	mov    -0x20(%ebp),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105e2a:	ff 75 e4             	pushl  -0x1c(%ebp)
80105e2d:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
80105e2e:	83 c2 6c             	add    $0x6c,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105e31:	52                   	push   %edx
80105e32:	ff 70 10             	pushl  0x10(%eax)
80105e35:	68 1c 81 10 80       	push   $0x8010811c
80105e3a:	e8 21 a8 ff ff       	call   80100660 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
80105e3f:	83 c4 20             	add    $0x20,%esp
80105e42:	e8 59 da ff ff       	call   801038a0 <myproc>
80105e47:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105e4e:	e8 4d da ff ff       	call   801038a0 <myproc>
80105e53:	85 c0                	test   %eax,%eax
80105e55:	74 1d                	je     80105e74 <trap+0xc4>
80105e57:	e8 44 da ff ff       	call   801038a0 <myproc>
80105e5c:	8b 50 24             	mov    0x24(%eax),%edx
80105e5f:	85 d2                	test   %edx,%edx
80105e61:	74 11                	je     80105e74 <trap+0xc4>
80105e63:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105e67:	83 e0 03             	and    $0x3,%eax
80105e6a:	66 83 f8 03          	cmp    $0x3,%ax
80105e6e:	0f 84 4c 01 00 00    	je     80105fc0 <trap+0x210>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105e74:	e8 27 da ff ff       	call   801038a0 <myproc>
80105e79:	85 c0                	test   %eax,%eax
80105e7b:	74 0b                	je     80105e88 <trap+0xd8>
80105e7d:	e8 1e da ff ff       	call   801038a0 <myproc>
80105e82:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105e86:	74 68                	je     80105ef0 <trap+0x140>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105e88:	e8 13 da ff ff       	call   801038a0 <myproc>
80105e8d:	85 c0                	test   %eax,%eax
80105e8f:	74 19                	je     80105eaa <trap+0xfa>
80105e91:	e8 0a da ff ff       	call   801038a0 <myproc>
80105e96:	8b 40 24             	mov    0x24(%eax),%eax
80105e99:	85 c0                	test   %eax,%eax
80105e9b:	74 0d                	je     80105eaa <trap+0xfa>
80105e9d:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105ea1:	83 e0 03             	and    $0x3,%eax
80105ea4:	66 83 f8 03          	cmp    $0x3,%ax
80105ea8:	74 37                	je     80105ee1 <trap+0x131>
    exit();
}
80105eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ead:	5b                   	pop    %ebx
80105eae:	5e                   	pop    %esi
80105eaf:	5f                   	pop    %edi
80105eb0:	5d                   	pop    %ebp
80105eb1:	c3                   	ret    
80105eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(myproc()->killed)
80105eb8:	e8 e3 d9 ff ff       	call   801038a0 <myproc>
80105ebd:	8b 58 24             	mov    0x24(%eax),%ebx
80105ec0:	85 db                	test   %ebx,%ebx
80105ec2:	0f 85 e8 00 00 00    	jne    80105fb0 <trap+0x200>
    myproc()->tf = tf;
80105ec8:	e8 d3 d9 ff ff       	call   801038a0 <myproc>
80105ecd:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105ed0:	e8 0b ee ff ff       	call   80104ce0 <syscall>
    if(myproc()->killed)
80105ed5:	e8 c6 d9 ff ff       	call   801038a0 <myproc>
80105eda:	8b 48 24             	mov    0x24(%eax),%ecx
80105edd:	85 c9                	test   %ecx,%ecx
80105edf:	74 c9                	je     80105eaa <trap+0xfa>
}
80105ee1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ee4:	5b                   	pop    %ebx
80105ee5:	5e                   	pop    %esi
80105ee6:	5f                   	pop    %edi
80105ee7:	5d                   	pop    %ebp
      exit();
80105ee8:	e9 53 de ff ff       	jmp    80103d40 <exit>
80105eed:	8d 76 00             	lea    0x0(%esi),%esi
  if(myproc() && myproc()->state == RUNNING &&
80105ef0:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105ef4:	75 92                	jne    80105e88 <trap+0xd8>
    yield();
80105ef6:	e8 75 df ff ff       	call   80103e70 <yield>
80105efb:	eb 8b                	jmp    80105e88 <trap+0xd8>
80105efd:	8d 76 00             	lea    0x0(%esi),%esi
    if(cpuid() == 0){
80105f00:	e8 7b d9 ff ff       	call   80103880 <cpuid>
80105f05:	85 c0                	test   %eax,%eax
80105f07:	0f 84 c3 00 00 00    	je     80105fd0 <trap+0x220>
    lapiceoi();
80105f0d:	e8 7e c8 ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f12:	e8 89 d9 ff ff       	call   801038a0 <myproc>
80105f17:	85 c0                	test   %eax,%eax
80105f19:	0f 85 38 ff ff ff    	jne    80105e57 <trap+0xa7>
80105f1f:	e9 50 ff ff ff       	jmp    80105e74 <trap+0xc4>
80105f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
80105f28:	e8 23 c7 ff ff       	call   80102650 <kbdintr>
    lapiceoi();
80105f2d:	e8 5e c8 ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f32:	e8 69 d9 ff ff       	call   801038a0 <myproc>
80105f37:	85 c0                	test   %eax,%eax
80105f39:	0f 85 18 ff ff ff    	jne    80105e57 <trap+0xa7>
80105f3f:	e9 30 ff ff ff       	jmp    80105e74 <trap+0xc4>
80105f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80105f48:	e8 53 02 00 00       	call   801061a0 <uartintr>
    lapiceoi();
80105f4d:	e8 3e c8 ff ff       	call   80102790 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f52:	e8 49 d9 ff ff       	call   801038a0 <myproc>
80105f57:	85 c0                	test   %eax,%eax
80105f59:	0f 85 f8 fe ff ff    	jne    80105e57 <trap+0xa7>
80105f5f:	e9 10 ff ff ff       	jmp    80105e74 <trap+0xc4>
80105f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105f68:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105f6c:	8b 77 38             	mov    0x38(%edi),%esi
80105f6f:	e8 0c d9 ff ff       	call   80103880 <cpuid>
80105f74:	56                   	push   %esi
80105f75:	53                   	push   %ebx
80105f76:	50                   	push   %eax
80105f77:	68 c4 80 10 80       	push   $0x801080c4
80105f7c:	e8 df a6 ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105f81:	e8 0a c8 ff ff       	call   80102790 <lapiceoi>
    break;
80105f86:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105f89:	e8 12 d9 ff ff       	call   801038a0 <myproc>
80105f8e:	85 c0                	test   %eax,%eax
80105f90:	0f 85 c1 fe ff ff    	jne    80105e57 <trap+0xa7>
80105f96:	e9 d9 fe ff ff       	jmp    80105e74 <trap+0xc4>
80105f9b:	90                   	nop
80105f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ideintr();
80105fa0:	e8 1b c1 ff ff       	call   801020c0 <ideintr>
80105fa5:	e9 63 ff ff ff       	jmp    80105f0d <trap+0x15d>
80105faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
80105fb0:	e8 8b dd ff ff       	call   80103d40 <exit>
80105fb5:	e9 0e ff ff ff       	jmp    80105ec8 <trap+0x118>
80105fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
80105fc0:	e8 7b dd ff ff       	call   80103d40 <exit>
80105fc5:	e9 aa fe ff ff       	jmp    80105e74 <trap+0xc4>
80105fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
80105fd0:	83 ec 0c             	sub    $0xc,%esp
80105fd3:	68 40 68 11 80       	push   $0x80116840
80105fd8:	e8 03 e8 ff ff       	call   801047e0 <acquire>
      wakeup(&ticks);
80105fdd:	c7 04 24 80 70 11 80 	movl   $0x80117080,(%esp)
      ticks++;
80105fe4:	83 05 80 70 11 80 01 	addl   $0x1,0x80117080
      wakeup(&ticks);
80105feb:	e8 90 e0 ff ff       	call   80104080 <wakeup>
      release(&tickslock);
80105ff0:	c7 04 24 40 68 11 80 	movl   $0x80116840,(%esp)
80105ff7:	e8 a4 e8 ff ff       	call   801048a0 <release>
80105ffc:	83 c4 10             	add    $0x10,%esp
80105fff:	e9 09 ff ff ff       	jmp    80105f0d <trap+0x15d>
80106004:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106007:	e8 74 d8 ff ff       	call   80103880 <cpuid>
8010600c:	83 ec 0c             	sub    $0xc,%esp
8010600f:	56                   	push   %esi
80106010:	53                   	push   %ebx
80106011:	50                   	push   %eax
80106012:	ff 77 30             	pushl  0x30(%edi)
80106015:	68 e8 80 10 80       	push   $0x801080e8
8010601a:	e8 41 a6 ff ff       	call   80100660 <cprintf>
      panic("trap");
8010601f:	83 c4 14             	add    $0x14,%esp
80106022:	68 be 80 10 80       	push   $0x801080be
80106027:	e8 64 a3 ff ff       	call   80100390 <panic>
8010602c:	66 90                	xchg   %ax,%ax
8010602e:	66 90                	xchg   %ax,%ax

80106030 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80106030:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
{
80106035:	55                   	push   %ebp
80106036:	89 e5                	mov    %esp,%ebp
  if(!uart)
80106038:	85 c0                	test   %eax,%eax
8010603a:	74 1c                	je     80106058 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010603c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106041:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80106042:	a8 01                	test   $0x1,%al
80106044:	74 12                	je     80106058 <uartgetc+0x28>
80106046:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010604b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
8010604c:	0f b6 c0             	movzbl %al,%eax
}
8010604f:	5d                   	pop    %ebp
80106050:	c3                   	ret    
80106051:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80106058:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010605d:	5d                   	pop    %ebp
8010605e:	c3                   	ret    
8010605f:	90                   	nop

80106060 <uartputc.part.0>:
uartputc(int c)
80106060:	55                   	push   %ebp
80106061:	89 e5                	mov    %esp,%ebp
80106063:	57                   	push   %edi
80106064:	56                   	push   %esi
80106065:	53                   	push   %ebx
80106066:	89 c7                	mov    %eax,%edi
80106068:	bb 80 00 00 00       	mov    $0x80,%ebx
8010606d:	be fd 03 00 00       	mov    $0x3fd,%esi
80106072:	83 ec 0c             	sub    $0xc,%esp
80106075:	eb 1b                	jmp    80106092 <uartputc.part.0+0x32>
80106077:	89 f6                	mov    %esi,%esi
80106079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
80106080:	83 ec 0c             	sub    $0xc,%esp
80106083:	6a 0a                	push   $0xa
80106085:	e8 26 c7 ff ff       	call   801027b0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
8010608a:	83 c4 10             	add    $0x10,%esp
8010608d:	83 eb 01             	sub    $0x1,%ebx
80106090:	74 07                	je     80106099 <uartputc.part.0+0x39>
80106092:	89 f2                	mov    %esi,%edx
80106094:	ec                   	in     (%dx),%al
80106095:	a8 20                	test   $0x20,%al
80106097:	74 e7                	je     80106080 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80106099:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010609e:	89 f8                	mov    %edi,%eax
801060a0:	ee                   	out    %al,(%dx)
}
801060a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801060a4:	5b                   	pop    %ebx
801060a5:	5e                   	pop    %esi
801060a6:	5f                   	pop    %edi
801060a7:	5d                   	pop    %ebp
801060a8:	c3                   	ret    
801060a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801060b0 <uartinit>:
{
801060b0:	55                   	push   %ebp
801060b1:	31 c9                	xor    %ecx,%ecx
801060b3:	89 c8                	mov    %ecx,%eax
801060b5:	89 e5                	mov    %esp,%ebp
801060b7:	57                   	push   %edi
801060b8:	56                   	push   %esi
801060b9:	53                   	push   %ebx
801060ba:	bb fa 03 00 00       	mov    $0x3fa,%ebx
801060bf:	89 da                	mov    %ebx,%edx
801060c1:	83 ec 0c             	sub    $0xc,%esp
801060c4:	ee                   	out    %al,(%dx)
801060c5:	bf fb 03 00 00       	mov    $0x3fb,%edi
801060ca:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801060cf:	89 fa                	mov    %edi,%edx
801060d1:	ee                   	out    %al,(%dx)
801060d2:	b8 0c 00 00 00       	mov    $0xc,%eax
801060d7:	ba f8 03 00 00       	mov    $0x3f8,%edx
801060dc:	ee                   	out    %al,(%dx)
801060dd:	be f9 03 00 00       	mov    $0x3f9,%esi
801060e2:	89 c8                	mov    %ecx,%eax
801060e4:	89 f2                	mov    %esi,%edx
801060e6:	ee                   	out    %al,(%dx)
801060e7:	b8 03 00 00 00       	mov    $0x3,%eax
801060ec:	89 fa                	mov    %edi,%edx
801060ee:	ee                   	out    %al,(%dx)
801060ef:	ba fc 03 00 00       	mov    $0x3fc,%edx
801060f4:	89 c8                	mov    %ecx,%eax
801060f6:	ee                   	out    %al,(%dx)
801060f7:	b8 01 00 00 00       	mov    $0x1,%eax
801060fc:	89 f2                	mov    %esi,%edx
801060fe:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801060ff:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106104:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80106105:	3c ff                	cmp    $0xff,%al
80106107:	74 5a                	je     80106163 <uartinit+0xb3>
  uart = 1;
80106109:	c7 05 c0 b5 10 80 01 	movl   $0x1,0x8010b5c0
80106110:	00 00 00 
80106113:	89 da                	mov    %ebx,%edx
80106115:	ec                   	in     (%dx),%al
80106116:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010611b:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
8010611c:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
8010611f:	bb e0 81 10 80       	mov    $0x801081e0,%ebx
  ioapicenable(IRQ_COM1, 0);
80106124:	6a 00                	push   $0x0
80106126:	6a 04                	push   $0x4
80106128:	e8 e3 c1 ff ff       	call   80102310 <ioapicenable>
8010612d:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80106130:	b8 78 00 00 00       	mov    $0x78,%eax
80106135:	eb 13                	jmp    8010614a <uartinit+0x9a>
80106137:	89 f6                	mov    %esi,%esi
80106139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106140:	83 c3 01             	add    $0x1,%ebx
80106143:	0f be 03             	movsbl (%ebx),%eax
80106146:	84 c0                	test   %al,%al
80106148:	74 19                	je     80106163 <uartinit+0xb3>
  if(!uart)
8010614a:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
80106150:	85 d2                	test   %edx,%edx
80106152:	74 ec                	je     80106140 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80106154:	83 c3 01             	add    $0x1,%ebx
80106157:	e8 04 ff ff ff       	call   80106060 <uartputc.part.0>
8010615c:	0f be 03             	movsbl (%ebx),%eax
8010615f:	84 c0                	test   %al,%al
80106161:	75 e7                	jne    8010614a <uartinit+0x9a>
}
80106163:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106166:	5b                   	pop    %ebx
80106167:	5e                   	pop    %esi
80106168:	5f                   	pop    %edi
80106169:	5d                   	pop    %ebp
8010616a:	c3                   	ret    
8010616b:	90                   	nop
8010616c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106170 <uartputc>:
  if(!uart)
80106170:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
{
80106176:	55                   	push   %ebp
80106177:	89 e5                	mov    %esp,%ebp
  if(!uart)
80106179:	85 d2                	test   %edx,%edx
{
8010617b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
8010617e:	74 10                	je     80106190 <uartputc+0x20>
}
80106180:	5d                   	pop    %ebp
80106181:	e9 da fe ff ff       	jmp    80106060 <uartputc.part.0>
80106186:	8d 76 00             	lea    0x0(%esi),%esi
80106189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106190:	5d                   	pop    %ebp
80106191:	c3                   	ret    
80106192:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801061a0 <uartintr>:

void
uartintr(void)
{
801061a0:	55                   	push   %ebp
801061a1:	89 e5                	mov    %esp,%ebp
801061a3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
801061a6:	68 30 60 10 80       	push   $0x80106030
801061ab:	e8 a0 a6 ff ff       	call   80100850 <consoleintr>
}
801061b0:	83 c4 10             	add    $0x10,%esp
801061b3:	c9                   	leave  
801061b4:	c3                   	ret    

801061b5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
801061b5:	6a 00                	push   $0x0
  pushl $0
801061b7:	6a 00                	push   $0x0
  jmp alltraps
801061b9:	e9 10 fb ff ff       	jmp    80105cce <alltraps>

801061be <vector1>:
.globl vector1
vector1:
  pushl $0
801061be:	6a 00                	push   $0x0
  pushl $1
801061c0:	6a 01                	push   $0x1
  jmp alltraps
801061c2:	e9 07 fb ff ff       	jmp    80105cce <alltraps>

801061c7 <vector2>:
.globl vector2
vector2:
  pushl $0
801061c7:	6a 00                	push   $0x0
  pushl $2
801061c9:	6a 02                	push   $0x2
  jmp alltraps
801061cb:	e9 fe fa ff ff       	jmp    80105cce <alltraps>

801061d0 <vector3>:
.globl vector3
vector3:
  pushl $0
801061d0:	6a 00                	push   $0x0
  pushl $3
801061d2:	6a 03                	push   $0x3
  jmp alltraps
801061d4:	e9 f5 fa ff ff       	jmp    80105cce <alltraps>

801061d9 <vector4>:
.globl vector4
vector4:
  pushl $0
801061d9:	6a 00                	push   $0x0
  pushl $4
801061db:	6a 04                	push   $0x4
  jmp alltraps
801061dd:	e9 ec fa ff ff       	jmp    80105cce <alltraps>

801061e2 <vector5>:
.globl vector5
vector5:
  pushl $0
801061e2:	6a 00                	push   $0x0
  pushl $5
801061e4:	6a 05                	push   $0x5
  jmp alltraps
801061e6:	e9 e3 fa ff ff       	jmp    80105cce <alltraps>

801061eb <vector6>:
.globl vector6
vector6:
  pushl $0
801061eb:	6a 00                	push   $0x0
  pushl $6
801061ed:	6a 06                	push   $0x6
  jmp alltraps
801061ef:	e9 da fa ff ff       	jmp    80105cce <alltraps>

801061f4 <vector7>:
.globl vector7
vector7:
  pushl $0
801061f4:	6a 00                	push   $0x0
  pushl $7
801061f6:	6a 07                	push   $0x7
  jmp alltraps
801061f8:	e9 d1 fa ff ff       	jmp    80105cce <alltraps>

801061fd <vector8>:
.globl vector8
vector8:
  pushl $8
801061fd:	6a 08                	push   $0x8
  jmp alltraps
801061ff:	e9 ca fa ff ff       	jmp    80105cce <alltraps>

80106204 <vector9>:
.globl vector9
vector9:
  pushl $0
80106204:	6a 00                	push   $0x0
  pushl $9
80106206:	6a 09                	push   $0x9
  jmp alltraps
80106208:	e9 c1 fa ff ff       	jmp    80105cce <alltraps>

8010620d <vector10>:
.globl vector10
vector10:
  pushl $10
8010620d:	6a 0a                	push   $0xa
  jmp alltraps
8010620f:	e9 ba fa ff ff       	jmp    80105cce <alltraps>

80106214 <vector11>:
.globl vector11
vector11:
  pushl $11
80106214:	6a 0b                	push   $0xb
  jmp alltraps
80106216:	e9 b3 fa ff ff       	jmp    80105cce <alltraps>

8010621b <vector12>:
.globl vector12
vector12:
  pushl $12
8010621b:	6a 0c                	push   $0xc
  jmp alltraps
8010621d:	e9 ac fa ff ff       	jmp    80105cce <alltraps>

80106222 <vector13>:
.globl vector13
vector13:
  pushl $13
80106222:	6a 0d                	push   $0xd
  jmp alltraps
80106224:	e9 a5 fa ff ff       	jmp    80105cce <alltraps>

80106229 <vector14>:
.globl vector14
vector14:
  pushl $14
80106229:	6a 0e                	push   $0xe
  jmp alltraps
8010622b:	e9 9e fa ff ff       	jmp    80105cce <alltraps>

80106230 <vector15>:
.globl vector15
vector15:
  pushl $0
80106230:	6a 00                	push   $0x0
  pushl $15
80106232:	6a 0f                	push   $0xf
  jmp alltraps
80106234:	e9 95 fa ff ff       	jmp    80105cce <alltraps>

80106239 <vector16>:
.globl vector16
vector16:
  pushl $0
80106239:	6a 00                	push   $0x0
  pushl $16
8010623b:	6a 10                	push   $0x10
  jmp alltraps
8010623d:	e9 8c fa ff ff       	jmp    80105cce <alltraps>

80106242 <vector17>:
.globl vector17
vector17:
  pushl $17
80106242:	6a 11                	push   $0x11
  jmp alltraps
80106244:	e9 85 fa ff ff       	jmp    80105cce <alltraps>

80106249 <vector18>:
.globl vector18
vector18:
  pushl $0
80106249:	6a 00                	push   $0x0
  pushl $18
8010624b:	6a 12                	push   $0x12
  jmp alltraps
8010624d:	e9 7c fa ff ff       	jmp    80105cce <alltraps>

80106252 <vector19>:
.globl vector19
vector19:
  pushl $0
80106252:	6a 00                	push   $0x0
  pushl $19
80106254:	6a 13                	push   $0x13
  jmp alltraps
80106256:	e9 73 fa ff ff       	jmp    80105cce <alltraps>

8010625b <vector20>:
.globl vector20
vector20:
  pushl $0
8010625b:	6a 00                	push   $0x0
  pushl $20
8010625d:	6a 14                	push   $0x14
  jmp alltraps
8010625f:	e9 6a fa ff ff       	jmp    80105cce <alltraps>

80106264 <vector21>:
.globl vector21
vector21:
  pushl $0
80106264:	6a 00                	push   $0x0
  pushl $21
80106266:	6a 15                	push   $0x15
  jmp alltraps
80106268:	e9 61 fa ff ff       	jmp    80105cce <alltraps>

8010626d <vector22>:
.globl vector22
vector22:
  pushl $0
8010626d:	6a 00                	push   $0x0
  pushl $22
8010626f:	6a 16                	push   $0x16
  jmp alltraps
80106271:	e9 58 fa ff ff       	jmp    80105cce <alltraps>

80106276 <vector23>:
.globl vector23
vector23:
  pushl $0
80106276:	6a 00                	push   $0x0
  pushl $23
80106278:	6a 17                	push   $0x17
  jmp alltraps
8010627a:	e9 4f fa ff ff       	jmp    80105cce <alltraps>

8010627f <vector24>:
.globl vector24
vector24:
  pushl $0
8010627f:	6a 00                	push   $0x0
  pushl $24
80106281:	6a 18                	push   $0x18
  jmp alltraps
80106283:	e9 46 fa ff ff       	jmp    80105cce <alltraps>

80106288 <vector25>:
.globl vector25
vector25:
  pushl $0
80106288:	6a 00                	push   $0x0
  pushl $25
8010628a:	6a 19                	push   $0x19
  jmp alltraps
8010628c:	e9 3d fa ff ff       	jmp    80105cce <alltraps>

80106291 <vector26>:
.globl vector26
vector26:
  pushl $0
80106291:	6a 00                	push   $0x0
  pushl $26
80106293:	6a 1a                	push   $0x1a
  jmp alltraps
80106295:	e9 34 fa ff ff       	jmp    80105cce <alltraps>

8010629a <vector27>:
.globl vector27
vector27:
  pushl $0
8010629a:	6a 00                	push   $0x0
  pushl $27
8010629c:	6a 1b                	push   $0x1b
  jmp alltraps
8010629e:	e9 2b fa ff ff       	jmp    80105cce <alltraps>

801062a3 <vector28>:
.globl vector28
vector28:
  pushl $0
801062a3:	6a 00                	push   $0x0
  pushl $28
801062a5:	6a 1c                	push   $0x1c
  jmp alltraps
801062a7:	e9 22 fa ff ff       	jmp    80105cce <alltraps>

801062ac <vector29>:
.globl vector29
vector29:
  pushl $0
801062ac:	6a 00                	push   $0x0
  pushl $29
801062ae:	6a 1d                	push   $0x1d
  jmp alltraps
801062b0:	e9 19 fa ff ff       	jmp    80105cce <alltraps>

801062b5 <vector30>:
.globl vector30
vector30:
  pushl $0
801062b5:	6a 00                	push   $0x0
  pushl $30
801062b7:	6a 1e                	push   $0x1e
  jmp alltraps
801062b9:	e9 10 fa ff ff       	jmp    80105cce <alltraps>

801062be <vector31>:
.globl vector31
vector31:
  pushl $0
801062be:	6a 00                	push   $0x0
  pushl $31
801062c0:	6a 1f                	push   $0x1f
  jmp alltraps
801062c2:	e9 07 fa ff ff       	jmp    80105cce <alltraps>

801062c7 <vector32>:
.globl vector32
vector32:
  pushl $0
801062c7:	6a 00                	push   $0x0
  pushl $32
801062c9:	6a 20                	push   $0x20
  jmp alltraps
801062cb:	e9 fe f9 ff ff       	jmp    80105cce <alltraps>

801062d0 <vector33>:
.globl vector33
vector33:
  pushl $0
801062d0:	6a 00                	push   $0x0
  pushl $33
801062d2:	6a 21                	push   $0x21
  jmp alltraps
801062d4:	e9 f5 f9 ff ff       	jmp    80105cce <alltraps>

801062d9 <vector34>:
.globl vector34
vector34:
  pushl $0
801062d9:	6a 00                	push   $0x0
  pushl $34
801062db:	6a 22                	push   $0x22
  jmp alltraps
801062dd:	e9 ec f9 ff ff       	jmp    80105cce <alltraps>

801062e2 <vector35>:
.globl vector35
vector35:
  pushl $0
801062e2:	6a 00                	push   $0x0
  pushl $35
801062e4:	6a 23                	push   $0x23
  jmp alltraps
801062e6:	e9 e3 f9 ff ff       	jmp    80105cce <alltraps>

801062eb <vector36>:
.globl vector36
vector36:
  pushl $0
801062eb:	6a 00                	push   $0x0
  pushl $36
801062ed:	6a 24                	push   $0x24
  jmp alltraps
801062ef:	e9 da f9 ff ff       	jmp    80105cce <alltraps>

801062f4 <vector37>:
.globl vector37
vector37:
  pushl $0
801062f4:	6a 00                	push   $0x0
  pushl $37
801062f6:	6a 25                	push   $0x25
  jmp alltraps
801062f8:	e9 d1 f9 ff ff       	jmp    80105cce <alltraps>

801062fd <vector38>:
.globl vector38
vector38:
  pushl $0
801062fd:	6a 00                	push   $0x0
  pushl $38
801062ff:	6a 26                	push   $0x26
  jmp alltraps
80106301:	e9 c8 f9 ff ff       	jmp    80105cce <alltraps>

80106306 <vector39>:
.globl vector39
vector39:
  pushl $0
80106306:	6a 00                	push   $0x0
  pushl $39
80106308:	6a 27                	push   $0x27
  jmp alltraps
8010630a:	e9 bf f9 ff ff       	jmp    80105cce <alltraps>

8010630f <vector40>:
.globl vector40
vector40:
  pushl $0
8010630f:	6a 00                	push   $0x0
  pushl $40
80106311:	6a 28                	push   $0x28
  jmp alltraps
80106313:	e9 b6 f9 ff ff       	jmp    80105cce <alltraps>

80106318 <vector41>:
.globl vector41
vector41:
  pushl $0
80106318:	6a 00                	push   $0x0
  pushl $41
8010631a:	6a 29                	push   $0x29
  jmp alltraps
8010631c:	e9 ad f9 ff ff       	jmp    80105cce <alltraps>

80106321 <vector42>:
.globl vector42
vector42:
  pushl $0
80106321:	6a 00                	push   $0x0
  pushl $42
80106323:	6a 2a                	push   $0x2a
  jmp alltraps
80106325:	e9 a4 f9 ff ff       	jmp    80105cce <alltraps>

8010632a <vector43>:
.globl vector43
vector43:
  pushl $0
8010632a:	6a 00                	push   $0x0
  pushl $43
8010632c:	6a 2b                	push   $0x2b
  jmp alltraps
8010632e:	e9 9b f9 ff ff       	jmp    80105cce <alltraps>

80106333 <vector44>:
.globl vector44
vector44:
  pushl $0
80106333:	6a 00                	push   $0x0
  pushl $44
80106335:	6a 2c                	push   $0x2c
  jmp alltraps
80106337:	e9 92 f9 ff ff       	jmp    80105cce <alltraps>

8010633c <vector45>:
.globl vector45
vector45:
  pushl $0
8010633c:	6a 00                	push   $0x0
  pushl $45
8010633e:	6a 2d                	push   $0x2d
  jmp alltraps
80106340:	e9 89 f9 ff ff       	jmp    80105cce <alltraps>

80106345 <vector46>:
.globl vector46
vector46:
  pushl $0
80106345:	6a 00                	push   $0x0
  pushl $46
80106347:	6a 2e                	push   $0x2e
  jmp alltraps
80106349:	e9 80 f9 ff ff       	jmp    80105cce <alltraps>

8010634e <vector47>:
.globl vector47
vector47:
  pushl $0
8010634e:	6a 00                	push   $0x0
  pushl $47
80106350:	6a 2f                	push   $0x2f
  jmp alltraps
80106352:	e9 77 f9 ff ff       	jmp    80105cce <alltraps>

80106357 <vector48>:
.globl vector48
vector48:
  pushl $0
80106357:	6a 00                	push   $0x0
  pushl $48
80106359:	6a 30                	push   $0x30
  jmp alltraps
8010635b:	e9 6e f9 ff ff       	jmp    80105cce <alltraps>

80106360 <vector49>:
.globl vector49
vector49:
  pushl $0
80106360:	6a 00                	push   $0x0
  pushl $49
80106362:	6a 31                	push   $0x31
  jmp alltraps
80106364:	e9 65 f9 ff ff       	jmp    80105cce <alltraps>

80106369 <vector50>:
.globl vector50
vector50:
  pushl $0
80106369:	6a 00                	push   $0x0
  pushl $50
8010636b:	6a 32                	push   $0x32
  jmp alltraps
8010636d:	e9 5c f9 ff ff       	jmp    80105cce <alltraps>

80106372 <vector51>:
.globl vector51
vector51:
  pushl $0
80106372:	6a 00                	push   $0x0
  pushl $51
80106374:	6a 33                	push   $0x33
  jmp alltraps
80106376:	e9 53 f9 ff ff       	jmp    80105cce <alltraps>

8010637b <vector52>:
.globl vector52
vector52:
  pushl $0
8010637b:	6a 00                	push   $0x0
  pushl $52
8010637d:	6a 34                	push   $0x34
  jmp alltraps
8010637f:	e9 4a f9 ff ff       	jmp    80105cce <alltraps>

80106384 <vector53>:
.globl vector53
vector53:
  pushl $0
80106384:	6a 00                	push   $0x0
  pushl $53
80106386:	6a 35                	push   $0x35
  jmp alltraps
80106388:	e9 41 f9 ff ff       	jmp    80105cce <alltraps>

8010638d <vector54>:
.globl vector54
vector54:
  pushl $0
8010638d:	6a 00                	push   $0x0
  pushl $54
8010638f:	6a 36                	push   $0x36
  jmp alltraps
80106391:	e9 38 f9 ff ff       	jmp    80105cce <alltraps>

80106396 <vector55>:
.globl vector55
vector55:
  pushl $0
80106396:	6a 00                	push   $0x0
  pushl $55
80106398:	6a 37                	push   $0x37
  jmp alltraps
8010639a:	e9 2f f9 ff ff       	jmp    80105cce <alltraps>

8010639f <vector56>:
.globl vector56
vector56:
  pushl $0
8010639f:	6a 00                	push   $0x0
  pushl $56
801063a1:	6a 38                	push   $0x38
  jmp alltraps
801063a3:	e9 26 f9 ff ff       	jmp    80105cce <alltraps>

801063a8 <vector57>:
.globl vector57
vector57:
  pushl $0
801063a8:	6a 00                	push   $0x0
  pushl $57
801063aa:	6a 39                	push   $0x39
  jmp alltraps
801063ac:	e9 1d f9 ff ff       	jmp    80105cce <alltraps>

801063b1 <vector58>:
.globl vector58
vector58:
  pushl $0
801063b1:	6a 00                	push   $0x0
  pushl $58
801063b3:	6a 3a                	push   $0x3a
  jmp alltraps
801063b5:	e9 14 f9 ff ff       	jmp    80105cce <alltraps>

801063ba <vector59>:
.globl vector59
vector59:
  pushl $0
801063ba:	6a 00                	push   $0x0
  pushl $59
801063bc:	6a 3b                	push   $0x3b
  jmp alltraps
801063be:	e9 0b f9 ff ff       	jmp    80105cce <alltraps>

801063c3 <vector60>:
.globl vector60
vector60:
  pushl $0
801063c3:	6a 00                	push   $0x0
  pushl $60
801063c5:	6a 3c                	push   $0x3c
  jmp alltraps
801063c7:	e9 02 f9 ff ff       	jmp    80105cce <alltraps>

801063cc <vector61>:
.globl vector61
vector61:
  pushl $0
801063cc:	6a 00                	push   $0x0
  pushl $61
801063ce:	6a 3d                	push   $0x3d
  jmp alltraps
801063d0:	e9 f9 f8 ff ff       	jmp    80105cce <alltraps>

801063d5 <vector62>:
.globl vector62
vector62:
  pushl $0
801063d5:	6a 00                	push   $0x0
  pushl $62
801063d7:	6a 3e                	push   $0x3e
  jmp alltraps
801063d9:	e9 f0 f8 ff ff       	jmp    80105cce <alltraps>

801063de <vector63>:
.globl vector63
vector63:
  pushl $0
801063de:	6a 00                	push   $0x0
  pushl $63
801063e0:	6a 3f                	push   $0x3f
  jmp alltraps
801063e2:	e9 e7 f8 ff ff       	jmp    80105cce <alltraps>

801063e7 <vector64>:
.globl vector64
vector64:
  pushl $0
801063e7:	6a 00                	push   $0x0
  pushl $64
801063e9:	6a 40                	push   $0x40
  jmp alltraps
801063eb:	e9 de f8 ff ff       	jmp    80105cce <alltraps>

801063f0 <vector65>:
.globl vector65
vector65:
  pushl $0
801063f0:	6a 00                	push   $0x0
  pushl $65
801063f2:	6a 41                	push   $0x41
  jmp alltraps
801063f4:	e9 d5 f8 ff ff       	jmp    80105cce <alltraps>

801063f9 <vector66>:
.globl vector66
vector66:
  pushl $0
801063f9:	6a 00                	push   $0x0
  pushl $66
801063fb:	6a 42                	push   $0x42
  jmp alltraps
801063fd:	e9 cc f8 ff ff       	jmp    80105cce <alltraps>

80106402 <vector67>:
.globl vector67
vector67:
  pushl $0
80106402:	6a 00                	push   $0x0
  pushl $67
80106404:	6a 43                	push   $0x43
  jmp alltraps
80106406:	e9 c3 f8 ff ff       	jmp    80105cce <alltraps>

8010640b <vector68>:
.globl vector68
vector68:
  pushl $0
8010640b:	6a 00                	push   $0x0
  pushl $68
8010640d:	6a 44                	push   $0x44
  jmp alltraps
8010640f:	e9 ba f8 ff ff       	jmp    80105cce <alltraps>

80106414 <vector69>:
.globl vector69
vector69:
  pushl $0
80106414:	6a 00                	push   $0x0
  pushl $69
80106416:	6a 45                	push   $0x45
  jmp alltraps
80106418:	e9 b1 f8 ff ff       	jmp    80105cce <alltraps>

8010641d <vector70>:
.globl vector70
vector70:
  pushl $0
8010641d:	6a 00                	push   $0x0
  pushl $70
8010641f:	6a 46                	push   $0x46
  jmp alltraps
80106421:	e9 a8 f8 ff ff       	jmp    80105cce <alltraps>

80106426 <vector71>:
.globl vector71
vector71:
  pushl $0
80106426:	6a 00                	push   $0x0
  pushl $71
80106428:	6a 47                	push   $0x47
  jmp alltraps
8010642a:	e9 9f f8 ff ff       	jmp    80105cce <alltraps>

8010642f <vector72>:
.globl vector72
vector72:
  pushl $0
8010642f:	6a 00                	push   $0x0
  pushl $72
80106431:	6a 48                	push   $0x48
  jmp alltraps
80106433:	e9 96 f8 ff ff       	jmp    80105cce <alltraps>

80106438 <vector73>:
.globl vector73
vector73:
  pushl $0
80106438:	6a 00                	push   $0x0
  pushl $73
8010643a:	6a 49                	push   $0x49
  jmp alltraps
8010643c:	e9 8d f8 ff ff       	jmp    80105cce <alltraps>

80106441 <vector74>:
.globl vector74
vector74:
  pushl $0
80106441:	6a 00                	push   $0x0
  pushl $74
80106443:	6a 4a                	push   $0x4a
  jmp alltraps
80106445:	e9 84 f8 ff ff       	jmp    80105cce <alltraps>

8010644a <vector75>:
.globl vector75
vector75:
  pushl $0
8010644a:	6a 00                	push   $0x0
  pushl $75
8010644c:	6a 4b                	push   $0x4b
  jmp alltraps
8010644e:	e9 7b f8 ff ff       	jmp    80105cce <alltraps>

80106453 <vector76>:
.globl vector76
vector76:
  pushl $0
80106453:	6a 00                	push   $0x0
  pushl $76
80106455:	6a 4c                	push   $0x4c
  jmp alltraps
80106457:	e9 72 f8 ff ff       	jmp    80105cce <alltraps>

8010645c <vector77>:
.globl vector77
vector77:
  pushl $0
8010645c:	6a 00                	push   $0x0
  pushl $77
8010645e:	6a 4d                	push   $0x4d
  jmp alltraps
80106460:	e9 69 f8 ff ff       	jmp    80105cce <alltraps>

80106465 <vector78>:
.globl vector78
vector78:
  pushl $0
80106465:	6a 00                	push   $0x0
  pushl $78
80106467:	6a 4e                	push   $0x4e
  jmp alltraps
80106469:	e9 60 f8 ff ff       	jmp    80105cce <alltraps>

8010646e <vector79>:
.globl vector79
vector79:
  pushl $0
8010646e:	6a 00                	push   $0x0
  pushl $79
80106470:	6a 4f                	push   $0x4f
  jmp alltraps
80106472:	e9 57 f8 ff ff       	jmp    80105cce <alltraps>

80106477 <vector80>:
.globl vector80
vector80:
  pushl $0
80106477:	6a 00                	push   $0x0
  pushl $80
80106479:	6a 50                	push   $0x50
  jmp alltraps
8010647b:	e9 4e f8 ff ff       	jmp    80105cce <alltraps>

80106480 <vector81>:
.globl vector81
vector81:
  pushl $0
80106480:	6a 00                	push   $0x0
  pushl $81
80106482:	6a 51                	push   $0x51
  jmp alltraps
80106484:	e9 45 f8 ff ff       	jmp    80105cce <alltraps>

80106489 <vector82>:
.globl vector82
vector82:
  pushl $0
80106489:	6a 00                	push   $0x0
  pushl $82
8010648b:	6a 52                	push   $0x52
  jmp alltraps
8010648d:	e9 3c f8 ff ff       	jmp    80105cce <alltraps>

80106492 <vector83>:
.globl vector83
vector83:
  pushl $0
80106492:	6a 00                	push   $0x0
  pushl $83
80106494:	6a 53                	push   $0x53
  jmp alltraps
80106496:	e9 33 f8 ff ff       	jmp    80105cce <alltraps>

8010649b <vector84>:
.globl vector84
vector84:
  pushl $0
8010649b:	6a 00                	push   $0x0
  pushl $84
8010649d:	6a 54                	push   $0x54
  jmp alltraps
8010649f:	e9 2a f8 ff ff       	jmp    80105cce <alltraps>

801064a4 <vector85>:
.globl vector85
vector85:
  pushl $0
801064a4:	6a 00                	push   $0x0
  pushl $85
801064a6:	6a 55                	push   $0x55
  jmp alltraps
801064a8:	e9 21 f8 ff ff       	jmp    80105cce <alltraps>

801064ad <vector86>:
.globl vector86
vector86:
  pushl $0
801064ad:	6a 00                	push   $0x0
  pushl $86
801064af:	6a 56                	push   $0x56
  jmp alltraps
801064b1:	e9 18 f8 ff ff       	jmp    80105cce <alltraps>

801064b6 <vector87>:
.globl vector87
vector87:
  pushl $0
801064b6:	6a 00                	push   $0x0
  pushl $87
801064b8:	6a 57                	push   $0x57
  jmp alltraps
801064ba:	e9 0f f8 ff ff       	jmp    80105cce <alltraps>

801064bf <vector88>:
.globl vector88
vector88:
  pushl $0
801064bf:	6a 00                	push   $0x0
  pushl $88
801064c1:	6a 58                	push   $0x58
  jmp alltraps
801064c3:	e9 06 f8 ff ff       	jmp    80105cce <alltraps>

801064c8 <vector89>:
.globl vector89
vector89:
  pushl $0
801064c8:	6a 00                	push   $0x0
  pushl $89
801064ca:	6a 59                	push   $0x59
  jmp alltraps
801064cc:	e9 fd f7 ff ff       	jmp    80105cce <alltraps>

801064d1 <vector90>:
.globl vector90
vector90:
  pushl $0
801064d1:	6a 00                	push   $0x0
  pushl $90
801064d3:	6a 5a                	push   $0x5a
  jmp alltraps
801064d5:	e9 f4 f7 ff ff       	jmp    80105cce <alltraps>

801064da <vector91>:
.globl vector91
vector91:
  pushl $0
801064da:	6a 00                	push   $0x0
  pushl $91
801064dc:	6a 5b                	push   $0x5b
  jmp alltraps
801064de:	e9 eb f7 ff ff       	jmp    80105cce <alltraps>

801064e3 <vector92>:
.globl vector92
vector92:
  pushl $0
801064e3:	6a 00                	push   $0x0
  pushl $92
801064e5:	6a 5c                	push   $0x5c
  jmp alltraps
801064e7:	e9 e2 f7 ff ff       	jmp    80105cce <alltraps>

801064ec <vector93>:
.globl vector93
vector93:
  pushl $0
801064ec:	6a 00                	push   $0x0
  pushl $93
801064ee:	6a 5d                	push   $0x5d
  jmp alltraps
801064f0:	e9 d9 f7 ff ff       	jmp    80105cce <alltraps>

801064f5 <vector94>:
.globl vector94
vector94:
  pushl $0
801064f5:	6a 00                	push   $0x0
  pushl $94
801064f7:	6a 5e                	push   $0x5e
  jmp alltraps
801064f9:	e9 d0 f7 ff ff       	jmp    80105cce <alltraps>

801064fe <vector95>:
.globl vector95
vector95:
  pushl $0
801064fe:	6a 00                	push   $0x0
  pushl $95
80106500:	6a 5f                	push   $0x5f
  jmp alltraps
80106502:	e9 c7 f7 ff ff       	jmp    80105cce <alltraps>

80106507 <vector96>:
.globl vector96
vector96:
  pushl $0
80106507:	6a 00                	push   $0x0
  pushl $96
80106509:	6a 60                	push   $0x60
  jmp alltraps
8010650b:	e9 be f7 ff ff       	jmp    80105cce <alltraps>

80106510 <vector97>:
.globl vector97
vector97:
  pushl $0
80106510:	6a 00                	push   $0x0
  pushl $97
80106512:	6a 61                	push   $0x61
  jmp alltraps
80106514:	e9 b5 f7 ff ff       	jmp    80105cce <alltraps>

80106519 <vector98>:
.globl vector98
vector98:
  pushl $0
80106519:	6a 00                	push   $0x0
  pushl $98
8010651b:	6a 62                	push   $0x62
  jmp alltraps
8010651d:	e9 ac f7 ff ff       	jmp    80105cce <alltraps>

80106522 <vector99>:
.globl vector99
vector99:
  pushl $0
80106522:	6a 00                	push   $0x0
  pushl $99
80106524:	6a 63                	push   $0x63
  jmp alltraps
80106526:	e9 a3 f7 ff ff       	jmp    80105cce <alltraps>

8010652b <vector100>:
.globl vector100
vector100:
  pushl $0
8010652b:	6a 00                	push   $0x0
  pushl $100
8010652d:	6a 64                	push   $0x64
  jmp alltraps
8010652f:	e9 9a f7 ff ff       	jmp    80105cce <alltraps>

80106534 <vector101>:
.globl vector101
vector101:
  pushl $0
80106534:	6a 00                	push   $0x0
  pushl $101
80106536:	6a 65                	push   $0x65
  jmp alltraps
80106538:	e9 91 f7 ff ff       	jmp    80105cce <alltraps>

8010653d <vector102>:
.globl vector102
vector102:
  pushl $0
8010653d:	6a 00                	push   $0x0
  pushl $102
8010653f:	6a 66                	push   $0x66
  jmp alltraps
80106541:	e9 88 f7 ff ff       	jmp    80105cce <alltraps>

80106546 <vector103>:
.globl vector103
vector103:
  pushl $0
80106546:	6a 00                	push   $0x0
  pushl $103
80106548:	6a 67                	push   $0x67
  jmp alltraps
8010654a:	e9 7f f7 ff ff       	jmp    80105cce <alltraps>

8010654f <vector104>:
.globl vector104
vector104:
  pushl $0
8010654f:	6a 00                	push   $0x0
  pushl $104
80106551:	6a 68                	push   $0x68
  jmp alltraps
80106553:	e9 76 f7 ff ff       	jmp    80105cce <alltraps>

80106558 <vector105>:
.globl vector105
vector105:
  pushl $0
80106558:	6a 00                	push   $0x0
  pushl $105
8010655a:	6a 69                	push   $0x69
  jmp alltraps
8010655c:	e9 6d f7 ff ff       	jmp    80105cce <alltraps>

80106561 <vector106>:
.globl vector106
vector106:
  pushl $0
80106561:	6a 00                	push   $0x0
  pushl $106
80106563:	6a 6a                	push   $0x6a
  jmp alltraps
80106565:	e9 64 f7 ff ff       	jmp    80105cce <alltraps>

8010656a <vector107>:
.globl vector107
vector107:
  pushl $0
8010656a:	6a 00                	push   $0x0
  pushl $107
8010656c:	6a 6b                	push   $0x6b
  jmp alltraps
8010656e:	e9 5b f7 ff ff       	jmp    80105cce <alltraps>

80106573 <vector108>:
.globl vector108
vector108:
  pushl $0
80106573:	6a 00                	push   $0x0
  pushl $108
80106575:	6a 6c                	push   $0x6c
  jmp alltraps
80106577:	e9 52 f7 ff ff       	jmp    80105cce <alltraps>

8010657c <vector109>:
.globl vector109
vector109:
  pushl $0
8010657c:	6a 00                	push   $0x0
  pushl $109
8010657e:	6a 6d                	push   $0x6d
  jmp alltraps
80106580:	e9 49 f7 ff ff       	jmp    80105cce <alltraps>

80106585 <vector110>:
.globl vector110
vector110:
  pushl $0
80106585:	6a 00                	push   $0x0
  pushl $110
80106587:	6a 6e                	push   $0x6e
  jmp alltraps
80106589:	e9 40 f7 ff ff       	jmp    80105cce <alltraps>

8010658e <vector111>:
.globl vector111
vector111:
  pushl $0
8010658e:	6a 00                	push   $0x0
  pushl $111
80106590:	6a 6f                	push   $0x6f
  jmp alltraps
80106592:	e9 37 f7 ff ff       	jmp    80105cce <alltraps>

80106597 <vector112>:
.globl vector112
vector112:
  pushl $0
80106597:	6a 00                	push   $0x0
  pushl $112
80106599:	6a 70                	push   $0x70
  jmp alltraps
8010659b:	e9 2e f7 ff ff       	jmp    80105cce <alltraps>

801065a0 <vector113>:
.globl vector113
vector113:
  pushl $0
801065a0:	6a 00                	push   $0x0
  pushl $113
801065a2:	6a 71                	push   $0x71
  jmp alltraps
801065a4:	e9 25 f7 ff ff       	jmp    80105cce <alltraps>

801065a9 <vector114>:
.globl vector114
vector114:
  pushl $0
801065a9:	6a 00                	push   $0x0
  pushl $114
801065ab:	6a 72                	push   $0x72
  jmp alltraps
801065ad:	e9 1c f7 ff ff       	jmp    80105cce <alltraps>

801065b2 <vector115>:
.globl vector115
vector115:
  pushl $0
801065b2:	6a 00                	push   $0x0
  pushl $115
801065b4:	6a 73                	push   $0x73
  jmp alltraps
801065b6:	e9 13 f7 ff ff       	jmp    80105cce <alltraps>

801065bb <vector116>:
.globl vector116
vector116:
  pushl $0
801065bb:	6a 00                	push   $0x0
  pushl $116
801065bd:	6a 74                	push   $0x74
  jmp alltraps
801065bf:	e9 0a f7 ff ff       	jmp    80105cce <alltraps>

801065c4 <vector117>:
.globl vector117
vector117:
  pushl $0
801065c4:	6a 00                	push   $0x0
  pushl $117
801065c6:	6a 75                	push   $0x75
  jmp alltraps
801065c8:	e9 01 f7 ff ff       	jmp    80105cce <alltraps>

801065cd <vector118>:
.globl vector118
vector118:
  pushl $0
801065cd:	6a 00                	push   $0x0
  pushl $118
801065cf:	6a 76                	push   $0x76
  jmp alltraps
801065d1:	e9 f8 f6 ff ff       	jmp    80105cce <alltraps>

801065d6 <vector119>:
.globl vector119
vector119:
  pushl $0
801065d6:	6a 00                	push   $0x0
  pushl $119
801065d8:	6a 77                	push   $0x77
  jmp alltraps
801065da:	e9 ef f6 ff ff       	jmp    80105cce <alltraps>

801065df <vector120>:
.globl vector120
vector120:
  pushl $0
801065df:	6a 00                	push   $0x0
  pushl $120
801065e1:	6a 78                	push   $0x78
  jmp alltraps
801065e3:	e9 e6 f6 ff ff       	jmp    80105cce <alltraps>

801065e8 <vector121>:
.globl vector121
vector121:
  pushl $0
801065e8:	6a 00                	push   $0x0
  pushl $121
801065ea:	6a 79                	push   $0x79
  jmp alltraps
801065ec:	e9 dd f6 ff ff       	jmp    80105cce <alltraps>

801065f1 <vector122>:
.globl vector122
vector122:
  pushl $0
801065f1:	6a 00                	push   $0x0
  pushl $122
801065f3:	6a 7a                	push   $0x7a
  jmp alltraps
801065f5:	e9 d4 f6 ff ff       	jmp    80105cce <alltraps>

801065fa <vector123>:
.globl vector123
vector123:
  pushl $0
801065fa:	6a 00                	push   $0x0
  pushl $123
801065fc:	6a 7b                	push   $0x7b
  jmp alltraps
801065fe:	e9 cb f6 ff ff       	jmp    80105cce <alltraps>

80106603 <vector124>:
.globl vector124
vector124:
  pushl $0
80106603:	6a 00                	push   $0x0
  pushl $124
80106605:	6a 7c                	push   $0x7c
  jmp alltraps
80106607:	e9 c2 f6 ff ff       	jmp    80105cce <alltraps>

8010660c <vector125>:
.globl vector125
vector125:
  pushl $0
8010660c:	6a 00                	push   $0x0
  pushl $125
8010660e:	6a 7d                	push   $0x7d
  jmp alltraps
80106610:	e9 b9 f6 ff ff       	jmp    80105cce <alltraps>

80106615 <vector126>:
.globl vector126
vector126:
  pushl $0
80106615:	6a 00                	push   $0x0
  pushl $126
80106617:	6a 7e                	push   $0x7e
  jmp alltraps
80106619:	e9 b0 f6 ff ff       	jmp    80105cce <alltraps>

8010661e <vector127>:
.globl vector127
vector127:
  pushl $0
8010661e:	6a 00                	push   $0x0
  pushl $127
80106620:	6a 7f                	push   $0x7f
  jmp alltraps
80106622:	e9 a7 f6 ff ff       	jmp    80105cce <alltraps>

80106627 <vector128>:
.globl vector128
vector128:
  pushl $0
80106627:	6a 00                	push   $0x0
  pushl $128
80106629:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010662e:	e9 9b f6 ff ff       	jmp    80105cce <alltraps>

80106633 <vector129>:
.globl vector129
vector129:
  pushl $0
80106633:	6a 00                	push   $0x0
  pushl $129
80106635:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010663a:	e9 8f f6 ff ff       	jmp    80105cce <alltraps>

8010663f <vector130>:
.globl vector130
vector130:
  pushl $0
8010663f:	6a 00                	push   $0x0
  pushl $130
80106641:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106646:	e9 83 f6 ff ff       	jmp    80105cce <alltraps>

8010664b <vector131>:
.globl vector131
vector131:
  pushl $0
8010664b:	6a 00                	push   $0x0
  pushl $131
8010664d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80106652:	e9 77 f6 ff ff       	jmp    80105cce <alltraps>

80106657 <vector132>:
.globl vector132
vector132:
  pushl $0
80106657:	6a 00                	push   $0x0
  pushl $132
80106659:	68 84 00 00 00       	push   $0x84
  jmp alltraps
8010665e:	e9 6b f6 ff ff       	jmp    80105cce <alltraps>

80106663 <vector133>:
.globl vector133
vector133:
  pushl $0
80106663:	6a 00                	push   $0x0
  pushl $133
80106665:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010666a:	e9 5f f6 ff ff       	jmp    80105cce <alltraps>

8010666f <vector134>:
.globl vector134
vector134:
  pushl $0
8010666f:	6a 00                	push   $0x0
  pushl $134
80106671:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106676:	e9 53 f6 ff ff       	jmp    80105cce <alltraps>

8010667b <vector135>:
.globl vector135
vector135:
  pushl $0
8010667b:	6a 00                	push   $0x0
  pushl $135
8010667d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106682:	e9 47 f6 ff ff       	jmp    80105cce <alltraps>

80106687 <vector136>:
.globl vector136
vector136:
  pushl $0
80106687:	6a 00                	push   $0x0
  pushl $136
80106689:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010668e:	e9 3b f6 ff ff       	jmp    80105cce <alltraps>

80106693 <vector137>:
.globl vector137
vector137:
  pushl $0
80106693:	6a 00                	push   $0x0
  pushl $137
80106695:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010669a:	e9 2f f6 ff ff       	jmp    80105cce <alltraps>

8010669f <vector138>:
.globl vector138
vector138:
  pushl $0
8010669f:	6a 00                	push   $0x0
  pushl $138
801066a1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801066a6:	e9 23 f6 ff ff       	jmp    80105cce <alltraps>

801066ab <vector139>:
.globl vector139
vector139:
  pushl $0
801066ab:	6a 00                	push   $0x0
  pushl $139
801066ad:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801066b2:	e9 17 f6 ff ff       	jmp    80105cce <alltraps>

801066b7 <vector140>:
.globl vector140
vector140:
  pushl $0
801066b7:	6a 00                	push   $0x0
  pushl $140
801066b9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801066be:	e9 0b f6 ff ff       	jmp    80105cce <alltraps>

801066c3 <vector141>:
.globl vector141
vector141:
  pushl $0
801066c3:	6a 00                	push   $0x0
  pushl $141
801066c5:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801066ca:	e9 ff f5 ff ff       	jmp    80105cce <alltraps>

801066cf <vector142>:
.globl vector142
vector142:
  pushl $0
801066cf:	6a 00                	push   $0x0
  pushl $142
801066d1:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
801066d6:	e9 f3 f5 ff ff       	jmp    80105cce <alltraps>

801066db <vector143>:
.globl vector143
vector143:
  pushl $0
801066db:	6a 00                	push   $0x0
  pushl $143
801066dd:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
801066e2:	e9 e7 f5 ff ff       	jmp    80105cce <alltraps>

801066e7 <vector144>:
.globl vector144
vector144:
  pushl $0
801066e7:	6a 00                	push   $0x0
  pushl $144
801066e9:	68 90 00 00 00       	push   $0x90
  jmp alltraps
801066ee:	e9 db f5 ff ff       	jmp    80105cce <alltraps>

801066f3 <vector145>:
.globl vector145
vector145:
  pushl $0
801066f3:	6a 00                	push   $0x0
  pushl $145
801066f5:	68 91 00 00 00       	push   $0x91
  jmp alltraps
801066fa:	e9 cf f5 ff ff       	jmp    80105cce <alltraps>

801066ff <vector146>:
.globl vector146
vector146:
  pushl $0
801066ff:	6a 00                	push   $0x0
  pushl $146
80106701:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106706:	e9 c3 f5 ff ff       	jmp    80105cce <alltraps>

8010670b <vector147>:
.globl vector147
vector147:
  pushl $0
8010670b:	6a 00                	push   $0x0
  pushl $147
8010670d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106712:	e9 b7 f5 ff ff       	jmp    80105cce <alltraps>

80106717 <vector148>:
.globl vector148
vector148:
  pushl $0
80106717:	6a 00                	push   $0x0
  pushl $148
80106719:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010671e:	e9 ab f5 ff ff       	jmp    80105cce <alltraps>

80106723 <vector149>:
.globl vector149
vector149:
  pushl $0
80106723:	6a 00                	push   $0x0
  pushl $149
80106725:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010672a:	e9 9f f5 ff ff       	jmp    80105cce <alltraps>

8010672f <vector150>:
.globl vector150
vector150:
  pushl $0
8010672f:	6a 00                	push   $0x0
  pushl $150
80106731:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106736:	e9 93 f5 ff ff       	jmp    80105cce <alltraps>

8010673b <vector151>:
.globl vector151
vector151:
  pushl $0
8010673b:	6a 00                	push   $0x0
  pushl $151
8010673d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106742:	e9 87 f5 ff ff       	jmp    80105cce <alltraps>

80106747 <vector152>:
.globl vector152
vector152:
  pushl $0
80106747:	6a 00                	push   $0x0
  pushl $152
80106749:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010674e:	e9 7b f5 ff ff       	jmp    80105cce <alltraps>

80106753 <vector153>:
.globl vector153
vector153:
  pushl $0
80106753:	6a 00                	push   $0x0
  pushl $153
80106755:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010675a:	e9 6f f5 ff ff       	jmp    80105cce <alltraps>

8010675f <vector154>:
.globl vector154
vector154:
  pushl $0
8010675f:	6a 00                	push   $0x0
  pushl $154
80106761:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106766:	e9 63 f5 ff ff       	jmp    80105cce <alltraps>

8010676b <vector155>:
.globl vector155
vector155:
  pushl $0
8010676b:	6a 00                	push   $0x0
  pushl $155
8010676d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106772:	e9 57 f5 ff ff       	jmp    80105cce <alltraps>

80106777 <vector156>:
.globl vector156
vector156:
  pushl $0
80106777:	6a 00                	push   $0x0
  pushl $156
80106779:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010677e:	e9 4b f5 ff ff       	jmp    80105cce <alltraps>

80106783 <vector157>:
.globl vector157
vector157:
  pushl $0
80106783:	6a 00                	push   $0x0
  pushl $157
80106785:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010678a:	e9 3f f5 ff ff       	jmp    80105cce <alltraps>

8010678f <vector158>:
.globl vector158
vector158:
  pushl $0
8010678f:	6a 00                	push   $0x0
  pushl $158
80106791:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106796:	e9 33 f5 ff ff       	jmp    80105cce <alltraps>

8010679b <vector159>:
.globl vector159
vector159:
  pushl $0
8010679b:	6a 00                	push   $0x0
  pushl $159
8010679d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801067a2:	e9 27 f5 ff ff       	jmp    80105cce <alltraps>

801067a7 <vector160>:
.globl vector160
vector160:
  pushl $0
801067a7:	6a 00                	push   $0x0
  pushl $160
801067a9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801067ae:	e9 1b f5 ff ff       	jmp    80105cce <alltraps>

801067b3 <vector161>:
.globl vector161
vector161:
  pushl $0
801067b3:	6a 00                	push   $0x0
  pushl $161
801067b5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801067ba:	e9 0f f5 ff ff       	jmp    80105cce <alltraps>

801067bf <vector162>:
.globl vector162
vector162:
  pushl $0
801067bf:	6a 00                	push   $0x0
  pushl $162
801067c1:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801067c6:	e9 03 f5 ff ff       	jmp    80105cce <alltraps>

801067cb <vector163>:
.globl vector163
vector163:
  pushl $0
801067cb:	6a 00                	push   $0x0
  pushl $163
801067cd:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801067d2:	e9 f7 f4 ff ff       	jmp    80105cce <alltraps>

801067d7 <vector164>:
.globl vector164
vector164:
  pushl $0
801067d7:	6a 00                	push   $0x0
  pushl $164
801067d9:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801067de:	e9 eb f4 ff ff       	jmp    80105cce <alltraps>

801067e3 <vector165>:
.globl vector165
vector165:
  pushl $0
801067e3:	6a 00                	push   $0x0
  pushl $165
801067e5:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
801067ea:	e9 df f4 ff ff       	jmp    80105cce <alltraps>

801067ef <vector166>:
.globl vector166
vector166:
  pushl $0
801067ef:	6a 00                	push   $0x0
  pushl $166
801067f1:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
801067f6:	e9 d3 f4 ff ff       	jmp    80105cce <alltraps>

801067fb <vector167>:
.globl vector167
vector167:
  pushl $0
801067fb:	6a 00                	push   $0x0
  pushl $167
801067fd:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106802:	e9 c7 f4 ff ff       	jmp    80105cce <alltraps>

80106807 <vector168>:
.globl vector168
vector168:
  pushl $0
80106807:	6a 00                	push   $0x0
  pushl $168
80106809:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010680e:	e9 bb f4 ff ff       	jmp    80105cce <alltraps>

80106813 <vector169>:
.globl vector169
vector169:
  pushl $0
80106813:	6a 00                	push   $0x0
  pushl $169
80106815:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010681a:	e9 af f4 ff ff       	jmp    80105cce <alltraps>

8010681f <vector170>:
.globl vector170
vector170:
  pushl $0
8010681f:	6a 00                	push   $0x0
  pushl $170
80106821:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106826:	e9 a3 f4 ff ff       	jmp    80105cce <alltraps>

8010682b <vector171>:
.globl vector171
vector171:
  pushl $0
8010682b:	6a 00                	push   $0x0
  pushl $171
8010682d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106832:	e9 97 f4 ff ff       	jmp    80105cce <alltraps>

80106837 <vector172>:
.globl vector172
vector172:
  pushl $0
80106837:	6a 00                	push   $0x0
  pushl $172
80106839:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010683e:	e9 8b f4 ff ff       	jmp    80105cce <alltraps>

80106843 <vector173>:
.globl vector173
vector173:
  pushl $0
80106843:	6a 00                	push   $0x0
  pushl $173
80106845:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010684a:	e9 7f f4 ff ff       	jmp    80105cce <alltraps>

8010684f <vector174>:
.globl vector174
vector174:
  pushl $0
8010684f:	6a 00                	push   $0x0
  pushl $174
80106851:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106856:	e9 73 f4 ff ff       	jmp    80105cce <alltraps>

8010685b <vector175>:
.globl vector175
vector175:
  pushl $0
8010685b:	6a 00                	push   $0x0
  pushl $175
8010685d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106862:	e9 67 f4 ff ff       	jmp    80105cce <alltraps>

80106867 <vector176>:
.globl vector176
vector176:
  pushl $0
80106867:	6a 00                	push   $0x0
  pushl $176
80106869:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010686e:	e9 5b f4 ff ff       	jmp    80105cce <alltraps>

80106873 <vector177>:
.globl vector177
vector177:
  pushl $0
80106873:	6a 00                	push   $0x0
  pushl $177
80106875:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010687a:	e9 4f f4 ff ff       	jmp    80105cce <alltraps>

8010687f <vector178>:
.globl vector178
vector178:
  pushl $0
8010687f:	6a 00                	push   $0x0
  pushl $178
80106881:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106886:	e9 43 f4 ff ff       	jmp    80105cce <alltraps>

8010688b <vector179>:
.globl vector179
vector179:
  pushl $0
8010688b:	6a 00                	push   $0x0
  pushl $179
8010688d:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106892:	e9 37 f4 ff ff       	jmp    80105cce <alltraps>

80106897 <vector180>:
.globl vector180
vector180:
  pushl $0
80106897:	6a 00                	push   $0x0
  pushl $180
80106899:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010689e:	e9 2b f4 ff ff       	jmp    80105cce <alltraps>

801068a3 <vector181>:
.globl vector181
vector181:
  pushl $0
801068a3:	6a 00                	push   $0x0
  pushl $181
801068a5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801068aa:	e9 1f f4 ff ff       	jmp    80105cce <alltraps>

801068af <vector182>:
.globl vector182
vector182:
  pushl $0
801068af:	6a 00                	push   $0x0
  pushl $182
801068b1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801068b6:	e9 13 f4 ff ff       	jmp    80105cce <alltraps>

801068bb <vector183>:
.globl vector183
vector183:
  pushl $0
801068bb:	6a 00                	push   $0x0
  pushl $183
801068bd:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801068c2:	e9 07 f4 ff ff       	jmp    80105cce <alltraps>

801068c7 <vector184>:
.globl vector184
vector184:
  pushl $0
801068c7:	6a 00                	push   $0x0
  pushl $184
801068c9:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801068ce:	e9 fb f3 ff ff       	jmp    80105cce <alltraps>

801068d3 <vector185>:
.globl vector185
vector185:
  pushl $0
801068d3:	6a 00                	push   $0x0
  pushl $185
801068d5:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801068da:	e9 ef f3 ff ff       	jmp    80105cce <alltraps>

801068df <vector186>:
.globl vector186
vector186:
  pushl $0
801068df:	6a 00                	push   $0x0
  pushl $186
801068e1:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
801068e6:	e9 e3 f3 ff ff       	jmp    80105cce <alltraps>

801068eb <vector187>:
.globl vector187
vector187:
  pushl $0
801068eb:	6a 00                	push   $0x0
  pushl $187
801068ed:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
801068f2:	e9 d7 f3 ff ff       	jmp    80105cce <alltraps>

801068f7 <vector188>:
.globl vector188
vector188:
  pushl $0
801068f7:	6a 00                	push   $0x0
  pushl $188
801068f9:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
801068fe:	e9 cb f3 ff ff       	jmp    80105cce <alltraps>

80106903 <vector189>:
.globl vector189
vector189:
  pushl $0
80106903:	6a 00                	push   $0x0
  pushl $189
80106905:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010690a:	e9 bf f3 ff ff       	jmp    80105cce <alltraps>

8010690f <vector190>:
.globl vector190
vector190:
  pushl $0
8010690f:	6a 00                	push   $0x0
  pushl $190
80106911:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106916:	e9 b3 f3 ff ff       	jmp    80105cce <alltraps>

8010691b <vector191>:
.globl vector191
vector191:
  pushl $0
8010691b:	6a 00                	push   $0x0
  pushl $191
8010691d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106922:	e9 a7 f3 ff ff       	jmp    80105cce <alltraps>

80106927 <vector192>:
.globl vector192
vector192:
  pushl $0
80106927:	6a 00                	push   $0x0
  pushl $192
80106929:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010692e:	e9 9b f3 ff ff       	jmp    80105cce <alltraps>

80106933 <vector193>:
.globl vector193
vector193:
  pushl $0
80106933:	6a 00                	push   $0x0
  pushl $193
80106935:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010693a:	e9 8f f3 ff ff       	jmp    80105cce <alltraps>

8010693f <vector194>:
.globl vector194
vector194:
  pushl $0
8010693f:	6a 00                	push   $0x0
  pushl $194
80106941:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106946:	e9 83 f3 ff ff       	jmp    80105cce <alltraps>

8010694b <vector195>:
.globl vector195
vector195:
  pushl $0
8010694b:	6a 00                	push   $0x0
  pushl $195
8010694d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106952:	e9 77 f3 ff ff       	jmp    80105cce <alltraps>

80106957 <vector196>:
.globl vector196
vector196:
  pushl $0
80106957:	6a 00                	push   $0x0
  pushl $196
80106959:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010695e:	e9 6b f3 ff ff       	jmp    80105cce <alltraps>

80106963 <vector197>:
.globl vector197
vector197:
  pushl $0
80106963:	6a 00                	push   $0x0
  pushl $197
80106965:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010696a:	e9 5f f3 ff ff       	jmp    80105cce <alltraps>

8010696f <vector198>:
.globl vector198
vector198:
  pushl $0
8010696f:	6a 00                	push   $0x0
  pushl $198
80106971:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106976:	e9 53 f3 ff ff       	jmp    80105cce <alltraps>

8010697b <vector199>:
.globl vector199
vector199:
  pushl $0
8010697b:	6a 00                	push   $0x0
  pushl $199
8010697d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106982:	e9 47 f3 ff ff       	jmp    80105cce <alltraps>

80106987 <vector200>:
.globl vector200
vector200:
  pushl $0
80106987:	6a 00                	push   $0x0
  pushl $200
80106989:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010698e:	e9 3b f3 ff ff       	jmp    80105cce <alltraps>

80106993 <vector201>:
.globl vector201
vector201:
  pushl $0
80106993:	6a 00                	push   $0x0
  pushl $201
80106995:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010699a:	e9 2f f3 ff ff       	jmp    80105cce <alltraps>

8010699f <vector202>:
.globl vector202
vector202:
  pushl $0
8010699f:	6a 00                	push   $0x0
  pushl $202
801069a1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801069a6:	e9 23 f3 ff ff       	jmp    80105cce <alltraps>

801069ab <vector203>:
.globl vector203
vector203:
  pushl $0
801069ab:	6a 00                	push   $0x0
  pushl $203
801069ad:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801069b2:	e9 17 f3 ff ff       	jmp    80105cce <alltraps>

801069b7 <vector204>:
.globl vector204
vector204:
  pushl $0
801069b7:	6a 00                	push   $0x0
  pushl $204
801069b9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801069be:	e9 0b f3 ff ff       	jmp    80105cce <alltraps>

801069c3 <vector205>:
.globl vector205
vector205:
  pushl $0
801069c3:	6a 00                	push   $0x0
  pushl $205
801069c5:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801069ca:	e9 ff f2 ff ff       	jmp    80105cce <alltraps>

801069cf <vector206>:
.globl vector206
vector206:
  pushl $0
801069cf:	6a 00                	push   $0x0
  pushl $206
801069d1:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801069d6:	e9 f3 f2 ff ff       	jmp    80105cce <alltraps>

801069db <vector207>:
.globl vector207
vector207:
  pushl $0
801069db:	6a 00                	push   $0x0
  pushl $207
801069dd:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
801069e2:	e9 e7 f2 ff ff       	jmp    80105cce <alltraps>

801069e7 <vector208>:
.globl vector208
vector208:
  pushl $0
801069e7:	6a 00                	push   $0x0
  pushl $208
801069e9:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
801069ee:	e9 db f2 ff ff       	jmp    80105cce <alltraps>

801069f3 <vector209>:
.globl vector209
vector209:
  pushl $0
801069f3:	6a 00                	push   $0x0
  pushl $209
801069f5:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
801069fa:	e9 cf f2 ff ff       	jmp    80105cce <alltraps>

801069ff <vector210>:
.globl vector210
vector210:
  pushl $0
801069ff:	6a 00                	push   $0x0
  pushl $210
80106a01:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106a06:	e9 c3 f2 ff ff       	jmp    80105cce <alltraps>

80106a0b <vector211>:
.globl vector211
vector211:
  pushl $0
80106a0b:	6a 00                	push   $0x0
  pushl $211
80106a0d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106a12:	e9 b7 f2 ff ff       	jmp    80105cce <alltraps>

80106a17 <vector212>:
.globl vector212
vector212:
  pushl $0
80106a17:	6a 00                	push   $0x0
  pushl $212
80106a19:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80106a1e:	e9 ab f2 ff ff       	jmp    80105cce <alltraps>

80106a23 <vector213>:
.globl vector213
vector213:
  pushl $0
80106a23:	6a 00                	push   $0x0
  pushl $213
80106a25:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106a2a:	e9 9f f2 ff ff       	jmp    80105cce <alltraps>

80106a2f <vector214>:
.globl vector214
vector214:
  pushl $0
80106a2f:	6a 00                	push   $0x0
  pushl $214
80106a31:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106a36:	e9 93 f2 ff ff       	jmp    80105cce <alltraps>

80106a3b <vector215>:
.globl vector215
vector215:
  pushl $0
80106a3b:	6a 00                	push   $0x0
  pushl $215
80106a3d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106a42:	e9 87 f2 ff ff       	jmp    80105cce <alltraps>

80106a47 <vector216>:
.globl vector216
vector216:
  pushl $0
80106a47:	6a 00                	push   $0x0
  pushl $216
80106a49:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80106a4e:	e9 7b f2 ff ff       	jmp    80105cce <alltraps>

80106a53 <vector217>:
.globl vector217
vector217:
  pushl $0
80106a53:	6a 00                	push   $0x0
  pushl $217
80106a55:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106a5a:	e9 6f f2 ff ff       	jmp    80105cce <alltraps>

80106a5f <vector218>:
.globl vector218
vector218:
  pushl $0
80106a5f:	6a 00                	push   $0x0
  pushl $218
80106a61:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106a66:	e9 63 f2 ff ff       	jmp    80105cce <alltraps>

80106a6b <vector219>:
.globl vector219
vector219:
  pushl $0
80106a6b:	6a 00                	push   $0x0
  pushl $219
80106a6d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106a72:	e9 57 f2 ff ff       	jmp    80105cce <alltraps>

80106a77 <vector220>:
.globl vector220
vector220:
  pushl $0
80106a77:	6a 00                	push   $0x0
  pushl $220
80106a79:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106a7e:	e9 4b f2 ff ff       	jmp    80105cce <alltraps>

80106a83 <vector221>:
.globl vector221
vector221:
  pushl $0
80106a83:	6a 00                	push   $0x0
  pushl $221
80106a85:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106a8a:	e9 3f f2 ff ff       	jmp    80105cce <alltraps>

80106a8f <vector222>:
.globl vector222
vector222:
  pushl $0
80106a8f:	6a 00                	push   $0x0
  pushl $222
80106a91:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106a96:	e9 33 f2 ff ff       	jmp    80105cce <alltraps>

80106a9b <vector223>:
.globl vector223
vector223:
  pushl $0
80106a9b:	6a 00                	push   $0x0
  pushl $223
80106a9d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106aa2:	e9 27 f2 ff ff       	jmp    80105cce <alltraps>

80106aa7 <vector224>:
.globl vector224
vector224:
  pushl $0
80106aa7:	6a 00                	push   $0x0
  pushl $224
80106aa9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106aae:	e9 1b f2 ff ff       	jmp    80105cce <alltraps>

80106ab3 <vector225>:
.globl vector225
vector225:
  pushl $0
80106ab3:	6a 00                	push   $0x0
  pushl $225
80106ab5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106aba:	e9 0f f2 ff ff       	jmp    80105cce <alltraps>

80106abf <vector226>:
.globl vector226
vector226:
  pushl $0
80106abf:	6a 00                	push   $0x0
  pushl $226
80106ac1:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106ac6:	e9 03 f2 ff ff       	jmp    80105cce <alltraps>

80106acb <vector227>:
.globl vector227
vector227:
  pushl $0
80106acb:	6a 00                	push   $0x0
  pushl $227
80106acd:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106ad2:	e9 f7 f1 ff ff       	jmp    80105cce <alltraps>

80106ad7 <vector228>:
.globl vector228
vector228:
  pushl $0
80106ad7:	6a 00                	push   $0x0
  pushl $228
80106ad9:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106ade:	e9 eb f1 ff ff       	jmp    80105cce <alltraps>

80106ae3 <vector229>:
.globl vector229
vector229:
  pushl $0
80106ae3:	6a 00                	push   $0x0
  pushl $229
80106ae5:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106aea:	e9 df f1 ff ff       	jmp    80105cce <alltraps>

80106aef <vector230>:
.globl vector230
vector230:
  pushl $0
80106aef:	6a 00                	push   $0x0
  pushl $230
80106af1:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106af6:	e9 d3 f1 ff ff       	jmp    80105cce <alltraps>

80106afb <vector231>:
.globl vector231
vector231:
  pushl $0
80106afb:	6a 00                	push   $0x0
  pushl $231
80106afd:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106b02:	e9 c7 f1 ff ff       	jmp    80105cce <alltraps>

80106b07 <vector232>:
.globl vector232
vector232:
  pushl $0
80106b07:	6a 00                	push   $0x0
  pushl $232
80106b09:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80106b0e:	e9 bb f1 ff ff       	jmp    80105cce <alltraps>

80106b13 <vector233>:
.globl vector233
vector233:
  pushl $0
80106b13:	6a 00                	push   $0x0
  pushl $233
80106b15:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80106b1a:	e9 af f1 ff ff       	jmp    80105cce <alltraps>

80106b1f <vector234>:
.globl vector234
vector234:
  pushl $0
80106b1f:	6a 00                	push   $0x0
  pushl $234
80106b21:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106b26:	e9 a3 f1 ff ff       	jmp    80105cce <alltraps>

80106b2b <vector235>:
.globl vector235
vector235:
  pushl $0
80106b2b:	6a 00                	push   $0x0
  pushl $235
80106b2d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106b32:	e9 97 f1 ff ff       	jmp    80105cce <alltraps>

80106b37 <vector236>:
.globl vector236
vector236:
  pushl $0
80106b37:	6a 00                	push   $0x0
  pushl $236
80106b39:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80106b3e:	e9 8b f1 ff ff       	jmp    80105cce <alltraps>

80106b43 <vector237>:
.globl vector237
vector237:
  pushl $0
80106b43:	6a 00                	push   $0x0
  pushl $237
80106b45:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106b4a:	e9 7f f1 ff ff       	jmp    80105cce <alltraps>

80106b4f <vector238>:
.globl vector238
vector238:
  pushl $0
80106b4f:	6a 00                	push   $0x0
  pushl $238
80106b51:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106b56:	e9 73 f1 ff ff       	jmp    80105cce <alltraps>

80106b5b <vector239>:
.globl vector239
vector239:
  pushl $0
80106b5b:	6a 00                	push   $0x0
  pushl $239
80106b5d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106b62:	e9 67 f1 ff ff       	jmp    80105cce <alltraps>

80106b67 <vector240>:
.globl vector240
vector240:
  pushl $0
80106b67:	6a 00                	push   $0x0
  pushl $240
80106b69:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106b6e:	e9 5b f1 ff ff       	jmp    80105cce <alltraps>

80106b73 <vector241>:
.globl vector241
vector241:
  pushl $0
80106b73:	6a 00                	push   $0x0
  pushl $241
80106b75:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106b7a:	e9 4f f1 ff ff       	jmp    80105cce <alltraps>

80106b7f <vector242>:
.globl vector242
vector242:
  pushl $0
80106b7f:	6a 00                	push   $0x0
  pushl $242
80106b81:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106b86:	e9 43 f1 ff ff       	jmp    80105cce <alltraps>

80106b8b <vector243>:
.globl vector243
vector243:
  pushl $0
80106b8b:	6a 00                	push   $0x0
  pushl $243
80106b8d:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106b92:	e9 37 f1 ff ff       	jmp    80105cce <alltraps>

80106b97 <vector244>:
.globl vector244
vector244:
  pushl $0
80106b97:	6a 00                	push   $0x0
  pushl $244
80106b99:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106b9e:	e9 2b f1 ff ff       	jmp    80105cce <alltraps>

80106ba3 <vector245>:
.globl vector245
vector245:
  pushl $0
80106ba3:	6a 00                	push   $0x0
  pushl $245
80106ba5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106baa:	e9 1f f1 ff ff       	jmp    80105cce <alltraps>

80106baf <vector246>:
.globl vector246
vector246:
  pushl $0
80106baf:	6a 00                	push   $0x0
  pushl $246
80106bb1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106bb6:	e9 13 f1 ff ff       	jmp    80105cce <alltraps>

80106bbb <vector247>:
.globl vector247
vector247:
  pushl $0
80106bbb:	6a 00                	push   $0x0
  pushl $247
80106bbd:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106bc2:	e9 07 f1 ff ff       	jmp    80105cce <alltraps>

80106bc7 <vector248>:
.globl vector248
vector248:
  pushl $0
80106bc7:	6a 00                	push   $0x0
  pushl $248
80106bc9:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106bce:	e9 fb f0 ff ff       	jmp    80105cce <alltraps>

80106bd3 <vector249>:
.globl vector249
vector249:
  pushl $0
80106bd3:	6a 00                	push   $0x0
  pushl $249
80106bd5:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106bda:	e9 ef f0 ff ff       	jmp    80105cce <alltraps>

80106bdf <vector250>:
.globl vector250
vector250:
  pushl $0
80106bdf:	6a 00                	push   $0x0
  pushl $250
80106be1:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106be6:	e9 e3 f0 ff ff       	jmp    80105cce <alltraps>

80106beb <vector251>:
.globl vector251
vector251:
  pushl $0
80106beb:	6a 00                	push   $0x0
  pushl $251
80106bed:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106bf2:	e9 d7 f0 ff ff       	jmp    80105cce <alltraps>

80106bf7 <vector252>:
.globl vector252
vector252:
  pushl $0
80106bf7:	6a 00                	push   $0x0
  pushl $252
80106bf9:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106bfe:	e9 cb f0 ff ff       	jmp    80105cce <alltraps>

80106c03 <vector253>:
.globl vector253
vector253:
  pushl $0
80106c03:	6a 00                	push   $0x0
  pushl $253
80106c05:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106c0a:	e9 bf f0 ff ff       	jmp    80105cce <alltraps>

80106c0f <vector254>:
.globl vector254
vector254:
  pushl $0
80106c0f:	6a 00                	push   $0x0
  pushl $254
80106c11:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106c16:	e9 b3 f0 ff ff       	jmp    80105cce <alltraps>

80106c1b <vector255>:
.globl vector255
vector255:
  pushl $0
80106c1b:	6a 00                	push   $0x0
  pushl $255
80106c1d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106c22:	e9 a7 f0 ff ff       	jmp    80105cce <alltraps>
80106c27:	66 90                	xchg   %ax,%ax
80106c29:	66 90                	xchg   %ax,%ax
80106c2b:	66 90                	xchg   %ax,%ax
80106c2d:	66 90                	xchg   %ax,%ax
80106c2f:	90                   	nop

80106c30 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106c30:	55                   	push   %ebp
80106c31:	89 e5                	mov    %esp,%ebp
80106c33:	57                   	push   %edi
80106c34:	56                   	push   %esi
80106c35:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106c36:	89 d3                	mov    %edx,%ebx
{
80106c38:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
80106c3a:	c1 eb 16             	shr    $0x16,%ebx
80106c3d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
80106c40:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
80106c43:	8b 06                	mov    (%esi),%eax
80106c45:	a8 01                	test   $0x1,%al
80106c47:	74 27                	je     80106c70 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106c49:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c4e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106c54:	c1 ef 0a             	shr    $0xa,%edi
}
80106c57:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
80106c5a:	89 fa                	mov    %edi,%edx
80106c5c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106c62:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106c65:	5b                   	pop    %ebx
80106c66:	5e                   	pop    %esi
80106c67:	5f                   	pop    %edi
80106c68:	5d                   	pop    %ebp
80106c69:	c3                   	ret    
80106c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106c70:	85 c9                	test   %ecx,%ecx
80106c72:	74 2c                	je     80106ca0 <walkpgdir+0x70>
80106c74:	e8 87 b8 ff ff       	call   80102500 <kalloc>
80106c79:	85 c0                	test   %eax,%eax
80106c7b:	89 c3                	mov    %eax,%ebx
80106c7d:	74 21                	je     80106ca0 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
80106c7f:	83 ec 04             	sub    $0x4,%esp
80106c82:	68 00 10 00 00       	push   $0x1000
80106c87:	6a 00                	push   $0x0
80106c89:	50                   	push   %eax
80106c8a:	e8 61 dc ff ff       	call   801048f0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106c8f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106c95:	83 c4 10             	add    $0x10,%esp
80106c98:	83 c8 07             	or     $0x7,%eax
80106c9b:	89 06                	mov    %eax,(%esi)
80106c9d:	eb b5                	jmp    80106c54 <walkpgdir+0x24>
80106c9f:	90                   	nop
}
80106ca0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106ca3:	31 c0                	xor    %eax,%eax
}
80106ca5:	5b                   	pop    %ebx
80106ca6:	5e                   	pop    %esi
80106ca7:	5f                   	pop    %edi
80106ca8:	5d                   	pop    %ebp
80106ca9:	c3                   	ret    
80106caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cb0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106cb0:	55                   	push   %ebp
80106cb1:	89 e5                	mov    %esp,%ebp
80106cb3:	57                   	push   %edi
80106cb4:	56                   	push   %esi
80106cb5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106cb6:	89 d3                	mov    %edx,%ebx
80106cb8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106cbe:	83 ec 1c             	sub    $0x1c,%esp
80106cc1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106cc4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106cc8:	8b 7d 08             	mov    0x8(%ebp),%edi
80106ccb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106cd0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106cd3:	8b 45 0c             	mov    0xc(%ebp),%eax
80106cd6:	29 df                	sub    %ebx,%edi
80106cd8:	83 c8 01             	or     $0x1,%eax
80106cdb:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106cde:	eb 15                	jmp    80106cf5 <mappages+0x45>
    if(*pte & PTE_P)
80106ce0:	f6 00 01             	testb  $0x1,(%eax)
80106ce3:	75 45                	jne    80106d2a <mappages+0x7a>
    *pte = pa | perm | PTE_P;
80106ce5:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106ce8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    *pte = pa | perm | PTE_P;
80106ceb:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106ced:	74 31                	je     80106d20 <mappages+0x70>
      break;
    a += PGSIZE;
80106cef:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106cf5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106cf8:	b9 01 00 00 00       	mov    $0x1,%ecx
80106cfd:	89 da                	mov    %ebx,%edx
80106cff:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106d02:	e8 29 ff ff ff       	call   80106c30 <walkpgdir>
80106d07:	85 c0                	test   %eax,%eax
80106d09:	75 d5                	jne    80106ce0 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
80106d0b:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106d0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106d13:	5b                   	pop    %ebx
80106d14:	5e                   	pop    %esi
80106d15:	5f                   	pop    %edi
80106d16:	5d                   	pop    %ebp
80106d17:	c3                   	ret    
80106d18:	90                   	nop
80106d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d20:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106d23:	31 c0                	xor    %eax,%eax
}
80106d25:	5b                   	pop    %ebx
80106d26:	5e                   	pop    %esi
80106d27:	5f                   	pop    %edi
80106d28:	5d                   	pop    %ebp
80106d29:	c3                   	ret    
      panic("remap");
80106d2a:	83 ec 0c             	sub    $0xc,%esp
80106d2d:	68 e8 81 10 80       	push   $0x801081e8
80106d32:	e8 59 96 ff ff       	call   80100390 <panic>
80106d37:	89 f6                	mov    %esi,%esi
80106d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d40 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d40:	55                   	push   %ebp
80106d41:	89 e5                	mov    %esp,%ebp
80106d43:	57                   	push   %edi
80106d44:	56                   	push   %esi
80106d45:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106d46:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d4c:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
80106d4e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d54:	83 ec 1c             	sub    $0x1c,%esp
80106d57:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106d5a:	39 d3                	cmp    %edx,%ebx
80106d5c:	73 66                	jae    80106dc4 <deallocuvm.part.0+0x84>
80106d5e:	89 d6                	mov    %edx,%esi
80106d60:	eb 3d                	jmp    80106d9f <deallocuvm.part.0+0x5f>
80106d62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106d68:	8b 10                	mov    (%eax),%edx
80106d6a:	f6 c2 01             	test   $0x1,%dl
80106d6d:	74 26                	je     80106d95 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106d6f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106d75:	74 58                	je     80106dcf <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106d77:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106d7a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106d80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106d83:	52                   	push   %edx
80106d84:	e8 c7 b5 ff ff       	call   80102350 <kfree>
      *pte = 0;
80106d89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d8c:	83 c4 10             	add    $0x10,%esp
80106d8f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106d95:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106d9b:	39 f3                	cmp    %esi,%ebx
80106d9d:	73 25                	jae    80106dc4 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106d9f:	31 c9                	xor    %ecx,%ecx
80106da1:	89 da                	mov    %ebx,%edx
80106da3:	89 f8                	mov    %edi,%eax
80106da5:	e8 86 fe ff ff       	call   80106c30 <walkpgdir>
    if(!pte)
80106daa:	85 c0                	test   %eax,%eax
80106dac:	75 ba                	jne    80106d68 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106dae:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106db4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106dba:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106dc0:	39 f3                	cmp    %esi,%ebx
80106dc2:	72 db                	jb     80106d9f <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106dc4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106dc7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dca:	5b                   	pop    %ebx
80106dcb:	5e                   	pop    %esi
80106dcc:	5f                   	pop    %edi
80106dcd:	5d                   	pop    %ebp
80106dce:	c3                   	ret    
        panic("kfree");
80106dcf:	83 ec 0c             	sub    $0xc,%esp
80106dd2:	68 66 7b 10 80       	push   $0x80107b66
80106dd7:	e8 b4 95 ff ff       	call   80100390 <panic>
80106ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106de0 <seginit>:
{
80106de0:	55                   	push   %ebp
80106de1:	89 e5                	mov    %esp,%ebp
80106de3:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106de6:	e8 95 ca ff ff       	call   80103880 <cpuid>
80106deb:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
  pd[0] = size-1;
80106df1:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106df6:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106dfa:	c7 80 d8 41 11 80 ff 	movl   $0xffff,-0x7feebe28(%eax)
80106e01:	ff 00 00 
80106e04:	c7 80 dc 41 11 80 00 	movl   $0xcf9a00,-0x7feebe24(%eax)
80106e0b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106e0e:	c7 80 e0 41 11 80 ff 	movl   $0xffff,-0x7feebe20(%eax)
80106e15:	ff 00 00 
80106e18:	c7 80 e4 41 11 80 00 	movl   $0xcf9200,-0x7feebe1c(%eax)
80106e1f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106e22:	c7 80 e8 41 11 80 ff 	movl   $0xffff,-0x7feebe18(%eax)
80106e29:	ff 00 00 
80106e2c:	c7 80 ec 41 11 80 00 	movl   $0xcffa00,-0x7feebe14(%eax)
80106e33:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106e36:	c7 80 f0 41 11 80 ff 	movl   $0xffff,-0x7feebe10(%eax)
80106e3d:	ff 00 00 
80106e40:	c7 80 f4 41 11 80 00 	movl   $0xcff200,-0x7feebe0c(%eax)
80106e47:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106e4a:	05 d0 41 11 80       	add    $0x801141d0,%eax
  pd[1] = (uint)p;
80106e4f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106e53:	c1 e8 10             	shr    $0x10,%eax
80106e56:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106e5a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106e5d:	0f 01 10             	lgdtl  (%eax)
}
80106e60:	c9                   	leave  
80106e61:	c3                   	ret    
80106e62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e70 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106e70:	a1 84 70 11 80       	mov    0x80117084,%eax
{
80106e75:	55                   	push   %ebp
80106e76:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106e78:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106e7d:	0f 22 d8             	mov    %eax,%cr3
}
80106e80:	5d                   	pop    %ebp
80106e81:	c3                   	ret    
80106e82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e90 <switchuvm>:
{
80106e90:	55                   	push   %ebp
80106e91:	89 e5                	mov    %esp,%ebp
80106e93:	57                   	push   %edi
80106e94:	56                   	push   %esi
80106e95:	53                   	push   %ebx
80106e96:	83 ec 1c             	sub    $0x1c,%esp
80106e99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106e9c:	85 db                	test   %ebx,%ebx
80106e9e:	0f 84 cb 00 00 00    	je     80106f6f <switchuvm+0xdf>
  if(p->kstack == 0)
80106ea4:	8b 43 08             	mov    0x8(%ebx),%eax
80106ea7:	85 c0                	test   %eax,%eax
80106ea9:	0f 84 da 00 00 00    	je     80106f89 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106eaf:	8b 43 04             	mov    0x4(%ebx),%eax
80106eb2:	85 c0                	test   %eax,%eax
80106eb4:	0f 84 c2 00 00 00    	je     80106f7c <switchuvm+0xec>
  pushcli();
80106eba:	e8 51 d8 ff ff       	call   80104710 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106ebf:	e8 3c c9 ff ff       	call   80103800 <mycpu>
80106ec4:	89 c6                	mov    %eax,%esi
80106ec6:	e8 35 c9 ff ff       	call   80103800 <mycpu>
80106ecb:	89 c7                	mov    %eax,%edi
80106ecd:	e8 2e c9 ff ff       	call   80103800 <mycpu>
80106ed2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ed5:	83 c7 08             	add    $0x8,%edi
80106ed8:	e8 23 c9 ff ff       	call   80103800 <mycpu>
80106edd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106ee0:	83 c0 08             	add    $0x8,%eax
80106ee3:	ba 67 00 00 00       	mov    $0x67,%edx
80106ee8:	c1 e8 18             	shr    $0x18,%eax
80106eeb:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106ef2:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106ef9:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106eff:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106f04:	83 c1 08             	add    $0x8,%ecx
80106f07:	c1 e9 10             	shr    $0x10,%ecx
80106f0a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106f10:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106f15:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106f1c:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80106f21:	e8 da c8 ff ff       	call   80103800 <mycpu>
80106f26:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106f2d:	e8 ce c8 ff ff       	call   80103800 <mycpu>
80106f32:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106f36:	8b 73 08             	mov    0x8(%ebx),%esi
80106f39:	e8 c2 c8 ff ff       	call   80103800 <mycpu>
80106f3e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106f44:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106f47:	e8 b4 c8 ff ff       	call   80103800 <mycpu>
80106f4c:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106f50:	b8 28 00 00 00       	mov    $0x28,%eax
80106f55:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106f58:	8b 43 04             	mov    0x4(%ebx),%eax
80106f5b:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106f60:	0f 22 d8             	mov    %eax,%cr3
}
80106f63:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f66:	5b                   	pop    %ebx
80106f67:	5e                   	pop    %esi
80106f68:	5f                   	pop    %edi
80106f69:	5d                   	pop    %ebp
  popcli();
80106f6a:	e9 e1 d7 ff ff       	jmp    80104750 <popcli>
    panic("switchuvm: no process");
80106f6f:	83 ec 0c             	sub    $0xc,%esp
80106f72:	68 ee 81 10 80       	push   $0x801081ee
80106f77:	e8 14 94 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
80106f7c:	83 ec 0c             	sub    $0xc,%esp
80106f7f:	68 19 82 10 80       	push   $0x80108219
80106f84:	e8 07 94 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
80106f89:	83 ec 0c             	sub    $0xc,%esp
80106f8c:	68 04 82 10 80       	push   $0x80108204
80106f91:	e8 fa 93 ff ff       	call   80100390 <panic>
80106f96:	8d 76 00             	lea    0x0(%esi),%esi
80106f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fa0 <inituvm>:
{
80106fa0:	55                   	push   %ebp
80106fa1:	89 e5                	mov    %esp,%ebp
80106fa3:	57                   	push   %edi
80106fa4:	56                   	push   %esi
80106fa5:	53                   	push   %ebx
80106fa6:	83 ec 1c             	sub    $0x1c,%esp
80106fa9:	8b 75 10             	mov    0x10(%ebp),%esi
80106fac:	8b 45 08             	mov    0x8(%ebp),%eax
80106faf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106fb2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80106fb8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106fbb:	77 49                	ja     80107006 <inituvm+0x66>
  mem = kalloc();
80106fbd:	e8 3e b5 ff ff       	call   80102500 <kalloc>
  memset(mem, 0, PGSIZE);
80106fc2:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106fc5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106fc7:	68 00 10 00 00       	push   $0x1000
80106fcc:	6a 00                	push   $0x0
80106fce:	50                   	push   %eax
80106fcf:	e8 1c d9 ff ff       	call   801048f0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106fd4:	58                   	pop    %eax
80106fd5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106fdb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106fe0:	5a                   	pop    %edx
80106fe1:	6a 06                	push   $0x6
80106fe3:	50                   	push   %eax
80106fe4:	31 d2                	xor    %edx,%edx
80106fe6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106fe9:	e8 c2 fc ff ff       	call   80106cb0 <mappages>
  memmove(mem, init, sz);
80106fee:	89 75 10             	mov    %esi,0x10(%ebp)
80106ff1:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106ff4:	83 c4 10             	add    $0x10,%esp
80106ff7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106ffa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ffd:	5b                   	pop    %ebx
80106ffe:	5e                   	pop    %esi
80106fff:	5f                   	pop    %edi
80107000:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80107001:	e9 9a d9 ff ff       	jmp    801049a0 <memmove>
    panic("inituvm: more than a page");
80107006:	83 ec 0c             	sub    $0xc,%esp
80107009:	68 2d 82 10 80       	push   $0x8010822d
8010700e:	e8 7d 93 ff ff       	call   80100390 <panic>
80107013:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107020 <loaduvm>:
{
80107020:	55                   	push   %ebp
80107021:	89 e5                	mov    %esp,%ebp
80107023:	57                   	push   %edi
80107024:	56                   	push   %esi
80107025:	53                   	push   %ebx
80107026:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80107029:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80107030:	0f 85 91 00 00 00    	jne    801070c7 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80107036:	8b 75 18             	mov    0x18(%ebp),%esi
80107039:	31 db                	xor    %ebx,%ebx
8010703b:	85 f6                	test   %esi,%esi
8010703d:	75 1a                	jne    80107059 <loaduvm+0x39>
8010703f:	eb 6f                	jmp    801070b0 <loaduvm+0x90>
80107041:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107048:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010704e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80107054:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80107057:	76 57                	jbe    801070b0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80107059:	8b 55 0c             	mov    0xc(%ebp),%edx
8010705c:	8b 45 08             	mov    0x8(%ebp),%eax
8010705f:	31 c9                	xor    %ecx,%ecx
80107061:	01 da                	add    %ebx,%edx
80107063:	e8 c8 fb ff ff       	call   80106c30 <walkpgdir>
80107068:	85 c0                	test   %eax,%eax
8010706a:	74 4e                	je     801070ba <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
8010706c:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
8010706e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80107071:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80107076:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
8010707b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80107081:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80107084:	01 d9                	add    %ebx,%ecx
80107086:	05 00 00 00 80       	add    $0x80000000,%eax
8010708b:	57                   	push   %edi
8010708c:	51                   	push   %ecx
8010708d:	50                   	push   %eax
8010708e:	ff 75 10             	pushl  0x10(%ebp)
80107091:	e8 0a a9 ff ff       	call   801019a0 <readi>
80107096:	83 c4 10             	add    $0x10,%esp
80107099:	39 f8                	cmp    %edi,%eax
8010709b:	74 ab                	je     80107048 <loaduvm+0x28>
}
8010709d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801070a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801070a5:	5b                   	pop    %ebx
801070a6:	5e                   	pop    %esi
801070a7:	5f                   	pop    %edi
801070a8:	5d                   	pop    %ebp
801070a9:	c3                   	ret    
801070aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801070b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801070b3:	31 c0                	xor    %eax,%eax
}
801070b5:	5b                   	pop    %ebx
801070b6:	5e                   	pop    %esi
801070b7:	5f                   	pop    %edi
801070b8:	5d                   	pop    %ebp
801070b9:	c3                   	ret    
      panic("loaduvm: address should exist");
801070ba:	83 ec 0c             	sub    $0xc,%esp
801070bd:	68 47 82 10 80       	push   $0x80108247
801070c2:	e8 c9 92 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
801070c7:	83 ec 0c             	sub    $0xc,%esp
801070ca:	68 14 83 10 80       	push   $0x80108314
801070cf:	e8 bc 92 ff ff       	call   80100390 <panic>
801070d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801070da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801070e0 <allocuvm>:
{
801070e0:	55                   	push   %ebp
801070e1:	89 e5                	mov    %esp,%ebp
801070e3:	57                   	push   %edi
801070e4:	56                   	push   %esi
801070e5:	53                   	push   %ebx
801070e6:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
801070e9:	8b 7d 10             	mov    0x10(%ebp),%edi
801070ec:	85 ff                	test   %edi,%edi
801070ee:	0f 88 8e 00 00 00    	js     80107182 <allocuvm+0xa2>
  if(newsz < oldsz)
801070f4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
801070f7:	0f 82 93 00 00 00    	jb     80107190 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
801070fd:	8b 45 0c             	mov    0xc(%ebp),%eax
80107100:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80107106:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
8010710c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010710f:	0f 86 7e 00 00 00    	jbe    80107193 <allocuvm+0xb3>
80107115:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80107118:	8b 7d 08             	mov    0x8(%ebp),%edi
8010711b:	eb 42                	jmp    8010715f <allocuvm+0x7f>
8010711d:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80107120:	83 ec 04             	sub    $0x4,%esp
80107123:	68 00 10 00 00       	push   $0x1000
80107128:	6a 00                	push   $0x0
8010712a:	50                   	push   %eax
8010712b:	e8 c0 d7 ff ff       	call   801048f0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80107130:	58                   	pop    %eax
80107131:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80107137:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010713c:	5a                   	pop    %edx
8010713d:	6a 06                	push   $0x6
8010713f:	50                   	push   %eax
80107140:	89 da                	mov    %ebx,%edx
80107142:	89 f8                	mov    %edi,%eax
80107144:	e8 67 fb ff ff       	call   80106cb0 <mappages>
80107149:	83 c4 10             	add    $0x10,%esp
8010714c:	85 c0                	test   %eax,%eax
8010714e:	78 50                	js     801071a0 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80107150:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107156:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80107159:	0f 86 81 00 00 00    	jbe    801071e0 <allocuvm+0x100>
    mem = kalloc();
8010715f:	e8 9c b3 ff ff       	call   80102500 <kalloc>
    if(mem == 0){
80107164:	85 c0                	test   %eax,%eax
    mem = kalloc();
80107166:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80107168:	75 b6                	jne    80107120 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
8010716a:	83 ec 0c             	sub    $0xc,%esp
8010716d:	68 65 82 10 80       	push   $0x80108265
80107172:	e8 e9 94 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80107177:	83 c4 10             	add    $0x10,%esp
8010717a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010717d:	39 45 10             	cmp    %eax,0x10(%ebp)
80107180:	77 6e                	ja     801071f0 <allocuvm+0x110>
}
80107182:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80107185:	31 ff                	xor    %edi,%edi
}
80107187:	89 f8                	mov    %edi,%eax
80107189:	5b                   	pop    %ebx
8010718a:	5e                   	pop    %esi
8010718b:	5f                   	pop    %edi
8010718c:	5d                   	pop    %ebp
8010718d:	c3                   	ret    
8010718e:	66 90                	xchg   %ax,%ax
    return oldsz;
80107190:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
80107193:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107196:	89 f8                	mov    %edi,%eax
80107198:	5b                   	pop    %ebx
80107199:	5e                   	pop    %esi
8010719a:	5f                   	pop    %edi
8010719b:	5d                   	pop    %ebp
8010719c:	c3                   	ret    
8010719d:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
801071a0:	83 ec 0c             	sub    $0xc,%esp
801071a3:	68 7d 82 10 80       	push   $0x8010827d
801071a8:	e8 b3 94 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
801071ad:	83 c4 10             	add    $0x10,%esp
801071b0:	8b 45 0c             	mov    0xc(%ebp),%eax
801071b3:	39 45 10             	cmp    %eax,0x10(%ebp)
801071b6:	76 0d                	jbe    801071c5 <allocuvm+0xe5>
801071b8:	89 c1                	mov    %eax,%ecx
801071ba:	8b 55 10             	mov    0x10(%ebp),%edx
801071bd:	8b 45 08             	mov    0x8(%ebp),%eax
801071c0:	e8 7b fb ff ff       	call   80106d40 <deallocuvm.part.0>
      kfree(mem);
801071c5:	83 ec 0c             	sub    $0xc,%esp
      return 0;
801071c8:	31 ff                	xor    %edi,%edi
      kfree(mem);
801071ca:	56                   	push   %esi
801071cb:	e8 80 b1 ff ff       	call   80102350 <kfree>
      return 0;
801071d0:	83 c4 10             	add    $0x10,%esp
}
801071d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071d6:	89 f8                	mov    %edi,%eax
801071d8:	5b                   	pop    %ebx
801071d9:	5e                   	pop    %esi
801071da:	5f                   	pop    %edi
801071db:	5d                   	pop    %ebp
801071dc:	c3                   	ret    
801071dd:	8d 76 00             	lea    0x0(%esi),%esi
801071e0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801071e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071e6:	5b                   	pop    %ebx
801071e7:	89 f8                	mov    %edi,%eax
801071e9:	5e                   	pop    %esi
801071ea:	5f                   	pop    %edi
801071eb:	5d                   	pop    %ebp
801071ec:	c3                   	ret    
801071ed:	8d 76 00             	lea    0x0(%esi),%esi
801071f0:	89 c1                	mov    %eax,%ecx
801071f2:	8b 55 10             	mov    0x10(%ebp),%edx
801071f5:	8b 45 08             	mov    0x8(%ebp),%eax
      return 0;
801071f8:	31 ff                	xor    %edi,%edi
801071fa:	e8 41 fb ff ff       	call   80106d40 <deallocuvm.part.0>
801071ff:	eb 92                	jmp    80107193 <allocuvm+0xb3>
80107201:	eb 0d                	jmp    80107210 <deallocuvm>
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

80107210 <deallocuvm>:
{
80107210:	55                   	push   %ebp
80107211:	89 e5                	mov    %esp,%ebp
80107213:	8b 55 0c             	mov    0xc(%ebp),%edx
80107216:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107219:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
8010721c:	39 d1                	cmp    %edx,%ecx
8010721e:	73 10                	jae    80107230 <deallocuvm+0x20>
}
80107220:	5d                   	pop    %ebp
80107221:	e9 1a fb ff ff       	jmp    80106d40 <deallocuvm.part.0>
80107226:	8d 76 00             	lea    0x0(%esi),%esi
80107229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107230:	89 d0                	mov    %edx,%eax
80107232:	5d                   	pop    %ebp
80107233:	c3                   	ret    
80107234:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010723a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107240 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107240:	55                   	push   %ebp
80107241:	89 e5                	mov    %esp,%ebp
80107243:	57                   	push   %edi
80107244:	56                   	push   %esi
80107245:	53                   	push   %ebx
80107246:	83 ec 0c             	sub    $0xc,%esp
80107249:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010724c:	85 f6                	test   %esi,%esi
8010724e:	74 59                	je     801072a9 <freevm+0x69>
80107250:	31 c9                	xor    %ecx,%ecx
80107252:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107257:	89 f0                	mov    %esi,%eax
80107259:	e8 e2 fa ff ff       	call   80106d40 <deallocuvm.part.0>
8010725e:	89 f3                	mov    %esi,%ebx
80107260:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107266:	eb 0f                	jmp    80107277 <freevm+0x37>
80107268:	90                   	nop
80107269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107270:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107273:	39 fb                	cmp    %edi,%ebx
80107275:	74 23                	je     8010729a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80107277:	8b 03                	mov    (%ebx),%eax
80107279:	a8 01                	test   $0x1,%al
8010727b:	74 f3                	je     80107270 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
8010727d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80107282:	83 ec 0c             	sub    $0xc,%esp
80107285:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80107288:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
8010728d:	50                   	push   %eax
8010728e:	e8 bd b0 ff ff       	call   80102350 <kfree>
80107293:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80107296:	39 fb                	cmp    %edi,%ebx
80107298:	75 dd                	jne    80107277 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
8010729a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010729d:	8d 65 f4             	lea    -0xc(%ebp),%esp
801072a0:	5b                   	pop    %ebx
801072a1:	5e                   	pop    %esi
801072a2:	5f                   	pop    %edi
801072a3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
801072a4:	e9 a7 b0 ff ff       	jmp    80102350 <kfree>
    panic("freevm: no pgdir");
801072a9:	83 ec 0c             	sub    $0xc,%esp
801072ac:	68 99 82 10 80       	push   $0x80108299
801072b1:	e8 da 90 ff ff       	call   80100390 <panic>
801072b6:	8d 76 00             	lea    0x0(%esi),%esi
801072b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801072c0 <setupkvm>:
{
801072c0:	55                   	push   %ebp
801072c1:	89 e5                	mov    %esp,%ebp
801072c3:	56                   	push   %esi
801072c4:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
801072c5:	e8 36 b2 ff ff       	call   80102500 <kalloc>
801072ca:	85 c0                	test   %eax,%eax
801072cc:	89 c6                	mov    %eax,%esi
801072ce:	74 42                	je     80107312 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
801072d0:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801072d3:	bb 20 b4 10 80       	mov    $0x8010b420,%ebx
  memset(pgdir, 0, PGSIZE);
801072d8:	68 00 10 00 00       	push   $0x1000
801072dd:	6a 00                	push   $0x0
801072df:	50                   	push   %eax
801072e0:	e8 0b d6 ff ff       	call   801048f0 <memset>
801072e5:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
801072e8:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
801072eb:	8b 4b 08             	mov    0x8(%ebx),%ecx
801072ee:	83 ec 08             	sub    $0x8,%esp
801072f1:	8b 13                	mov    (%ebx),%edx
801072f3:	ff 73 0c             	pushl  0xc(%ebx)
801072f6:	50                   	push   %eax
801072f7:	29 c1                	sub    %eax,%ecx
801072f9:	89 f0                	mov    %esi,%eax
801072fb:	e8 b0 f9 ff ff       	call   80106cb0 <mappages>
80107300:	83 c4 10             	add    $0x10,%esp
80107303:	85 c0                	test   %eax,%eax
80107305:	78 19                	js     80107320 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107307:	83 c3 10             	add    $0x10,%ebx
8010730a:	81 fb 60 b4 10 80    	cmp    $0x8010b460,%ebx
80107310:	75 d6                	jne    801072e8 <setupkvm+0x28>
}
80107312:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107315:	89 f0                	mov    %esi,%eax
80107317:	5b                   	pop    %ebx
80107318:	5e                   	pop    %esi
80107319:	5d                   	pop    %ebp
8010731a:	c3                   	ret    
8010731b:	90                   	nop
8010731c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80107320:	83 ec 0c             	sub    $0xc,%esp
80107323:	56                   	push   %esi
      return 0;
80107324:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80107326:	e8 15 ff ff ff       	call   80107240 <freevm>
      return 0;
8010732b:	83 c4 10             	add    $0x10,%esp
}
8010732e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107331:	89 f0                	mov    %esi,%eax
80107333:	5b                   	pop    %ebx
80107334:	5e                   	pop    %esi
80107335:	5d                   	pop    %ebp
80107336:	c3                   	ret    
80107337:	89 f6                	mov    %esi,%esi
80107339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107340 <kvmalloc>:
{
80107340:	55                   	push   %ebp
80107341:	89 e5                	mov    %esp,%ebp
80107343:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107346:	e8 75 ff ff ff       	call   801072c0 <setupkvm>
8010734b:	a3 84 70 11 80       	mov    %eax,0x80117084
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107350:	05 00 00 00 80       	add    $0x80000000,%eax
80107355:	0f 22 d8             	mov    %eax,%cr3
}
80107358:	c9                   	leave  
80107359:	c3                   	ret    
8010735a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107360 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107360:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107361:	31 c9                	xor    %ecx,%ecx
{
80107363:	89 e5                	mov    %esp,%ebp
80107365:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107368:	8b 55 0c             	mov    0xc(%ebp),%edx
8010736b:	8b 45 08             	mov    0x8(%ebp),%eax
8010736e:	e8 bd f8 ff ff       	call   80106c30 <walkpgdir>
  if(pte == 0)
80107373:	85 c0                	test   %eax,%eax
80107375:	74 05                	je     8010737c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80107377:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010737a:	c9                   	leave  
8010737b:	c3                   	ret    
    panic("clearpteu");
8010737c:	83 ec 0c             	sub    $0xc,%esp
8010737f:	68 aa 82 10 80       	push   $0x801082aa
80107384:	e8 07 90 ff ff       	call   80100390 <panic>
80107389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107390 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107390:	55                   	push   %ebp
80107391:	89 e5                	mov    %esp,%ebp
80107393:	57                   	push   %edi
80107394:	56                   	push   %esi
80107395:	53                   	push   %ebx
80107396:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107399:	e8 22 ff ff ff       	call   801072c0 <setupkvm>
8010739e:	85 c0                	test   %eax,%eax
801073a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801073a3:	0f 84 9f 00 00 00    	je     80107448 <copyuvm+0xb8>
    return 0;
  for(i = PGSIZE; i < sz; i += PGSIZE){
801073a9:	81 7d 0c 00 10 00 00 	cmpl   $0x1000,0xc(%ebp)
801073b0:	0f 86 92 00 00 00    	jbe    80107448 <copyuvm+0xb8>
801073b6:	bf 00 10 00 00       	mov    $0x1000,%edi
801073bb:	eb 45                	jmp    80107402 <copyuvm+0x72>
801073bd:	8d 76 00             	lea    0x0(%esi),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
801073c0:	83 ec 04             	sub    $0x4,%esp
801073c3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
801073c9:	68 00 10 00 00       	push   $0x1000
801073ce:	53                   	push   %ebx
801073cf:	50                   	push   %eax
801073d0:	e8 cb d5 ff ff       	call   801049a0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
801073d5:	58                   	pop    %eax
801073d6:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801073dc:	b9 00 10 00 00       	mov    $0x1000,%ecx
801073e1:	5a                   	pop    %edx
801073e2:	ff 75 e4             	pushl  -0x1c(%ebp)
801073e5:	50                   	push   %eax
801073e6:	89 fa                	mov    %edi,%edx
801073e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
801073eb:	e8 c0 f8 ff ff       	call   80106cb0 <mappages>
801073f0:	83 c4 10             	add    $0x10,%esp
801073f3:	85 c0                	test   %eax,%eax
801073f5:	78 61                	js     80107458 <copyuvm+0xc8>
  for(i = PGSIZE; i < sz; i += PGSIZE){
801073f7:	81 c7 00 10 00 00    	add    $0x1000,%edi
801073fd:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80107400:	76 46                	jbe    80107448 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107402:	8b 45 08             	mov    0x8(%ebp),%eax
80107405:	31 c9                	xor    %ecx,%ecx
80107407:	89 fa                	mov    %edi,%edx
80107409:	e8 22 f8 ff ff       	call   80106c30 <walkpgdir>
8010740e:	85 c0                	test   %eax,%eax
80107410:	74 61                	je     80107473 <copyuvm+0xe3>
    if(!(*pte & PTE_P))
80107412:	8b 00                	mov    (%eax),%eax
80107414:	a8 01                	test   $0x1,%al
80107416:	74 4e                	je     80107466 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
80107418:	89 c3                	mov    %eax,%ebx
    flags = PTE_FLAGS(*pte);
8010741a:	25 ff 0f 00 00       	and    $0xfff,%eax
    pa = PTE_ADDR(*pte);
8010741f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    flags = PTE_FLAGS(*pte);
80107425:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if((mem = kalloc()) == 0)
80107428:	e8 d3 b0 ff ff       	call   80102500 <kalloc>
8010742d:	85 c0                	test   %eax,%eax
8010742f:	89 c6                	mov    %eax,%esi
80107431:	75 8d                	jne    801073c0 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
80107433:	83 ec 0c             	sub    $0xc,%esp
80107436:	ff 75 e0             	pushl  -0x20(%ebp)
80107439:	e8 02 fe ff ff       	call   80107240 <freevm>
  return 0;
8010743e:	83 c4 10             	add    $0x10,%esp
80107441:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80107448:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010744b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010744e:	5b                   	pop    %ebx
8010744f:	5e                   	pop    %esi
80107450:	5f                   	pop    %edi
80107451:	5d                   	pop    %ebp
80107452:	c3                   	ret    
80107453:	90                   	nop
80107454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80107458:	83 ec 0c             	sub    $0xc,%esp
8010745b:	56                   	push   %esi
8010745c:	e8 ef ae ff ff       	call   80102350 <kfree>
      goto bad;
80107461:	83 c4 10             	add    $0x10,%esp
80107464:	eb cd                	jmp    80107433 <copyuvm+0xa3>
      panic("copyuvm: page not present");
80107466:	83 ec 0c             	sub    $0xc,%esp
80107469:	68 ce 82 10 80       	push   $0x801082ce
8010746e:	e8 1d 8f ff ff       	call   80100390 <panic>
      panic("copyuvm: pte should exist");
80107473:	83 ec 0c             	sub    $0xc,%esp
80107476:	68 b4 82 10 80       	push   $0x801082b4
8010747b:	e8 10 8f ff ff       	call   80100390 <panic>

80107480 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107480:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107481:	31 c9                	xor    %ecx,%ecx
{
80107483:	89 e5                	mov    %esp,%ebp
80107485:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107488:	8b 55 0c             	mov    0xc(%ebp),%edx
8010748b:	8b 45 08             	mov    0x8(%ebp),%eax
8010748e:	e8 9d f7 ff ff       	call   80106c30 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107493:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107495:	c9                   	leave  
  if((*pte & PTE_U) == 0)
80107496:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107498:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
8010749d:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801074a0:	05 00 00 00 80       	add    $0x80000000,%eax
801074a5:	83 fa 05             	cmp    $0x5,%edx
801074a8:	ba 00 00 00 00       	mov    $0x0,%edx
801074ad:	0f 45 c2             	cmovne %edx,%eax
}
801074b0:	c3                   	ret    
801074b1:	eb 0d                	jmp    801074c0 <copyout>
801074b3:	90                   	nop
801074b4:	90                   	nop
801074b5:	90                   	nop
801074b6:	90                   	nop
801074b7:	90                   	nop
801074b8:	90                   	nop
801074b9:	90                   	nop
801074ba:	90                   	nop
801074bb:	90                   	nop
801074bc:	90                   	nop
801074bd:	90                   	nop
801074be:	90                   	nop
801074bf:	90                   	nop

801074c0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801074c0:	55                   	push   %ebp
801074c1:	89 e5                	mov    %esp,%ebp
801074c3:	57                   	push   %edi
801074c4:	56                   	push   %esi
801074c5:	53                   	push   %ebx
801074c6:	83 ec 1c             	sub    $0x1c,%esp
801074c9:	8b 5d 14             	mov    0x14(%ebp),%ebx
801074cc:	8b 55 0c             	mov    0xc(%ebp),%edx
801074cf:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801074d2:	85 db                	test   %ebx,%ebx
801074d4:	75 40                	jne    80107516 <copyout+0x56>
801074d6:	eb 70                	jmp    80107548 <copyout+0x88>
801074d8:	90                   	nop
801074d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
801074e0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801074e3:	89 f1                	mov    %esi,%ecx
801074e5:	29 d1                	sub    %edx,%ecx
801074e7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
801074ed:	39 d9                	cmp    %ebx,%ecx
801074ef:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801074f2:	29 f2                	sub    %esi,%edx
801074f4:	83 ec 04             	sub    $0x4,%esp
801074f7:	01 d0                	add    %edx,%eax
801074f9:	51                   	push   %ecx
801074fa:	57                   	push   %edi
801074fb:	50                   	push   %eax
801074fc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801074ff:	e8 9c d4 ff ff       	call   801049a0 <memmove>
    len -= n;
    buf += n;
80107504:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80107507:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
8010750a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
80107510:	01 cf                	add    %ecx,%edi
  while(len > 0){
80107512:	29 cb                	sub    %ecx,%ebx
80107514:	74 32                	je     80107548 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107516:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107518:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
8010751b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010751e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107524:	56                   	push   %esi
80107525:	ff 75 08             	pushl  0x8(%ebp)
80107528:	e8 53 ff ff ff       	call   80107480 <uva2ka>
    if(pa0 == 0)
8010752d:	83 c4 10             	add    $0x10,%esp
80107530:	85 c0                	test   %eax,%eax
80107532:	75 ac                	jne    801074e0 <copyout+0x20>
  }
  return 0;
}
80107534:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80107537:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010753c:	5b                   	pop    %ebx
8010753d:	5e                   	pop    %esi
8010753e:	5f                   	pop    %edi
8010753f:	5d                   	pop    %ebp
80107540:	c3                   	ret    
80107541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107548:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010754b:	31 c0                	xor    %eax,%eax
}
8010754d:	5b                   	pop    %ebx
8010754e:	5e                   	pop    %esi
8010754f:	5f                   	pop    %edi
80107550:	5d                   	pop    %ebp
80107551:	c3                   	ret    
80107552:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107560 <mprotect>:

//mprotect system call makes page table entries only readable, non-writable
int
mprotect(void *addr, int len){
80107560:	55                   	push   %ebp
80107561:	89 e5                	mov    %esp,%ebp
80107563:	57                   	push   %edi
80107564:	56                   	push   %esi
80107565:	53                   	push   %ebx
80107566:	83 ec 0c             	sub    $0xc,%esp
80107569:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct proc *curproc = myproc();
8010756c:	e8 2f c3 ff ff       	call   801038a0 <myproc>
  
  //Check if addr points to a region that is not currently a part of the address space
  if(len <= 0 || (int)addr+len*PGSIZE>curproc->sz){
80107571:	85 f6                	test   %esi,%esi
80107573:	0f 8e 8c 00 00 00    	jle    80107605 <mprotect+0xa5>
80107579:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010757c:	c1 e6 0c             	shl    $0xc,%esi
8010757f:	89 c7                	mov    %eax,%edi
80107581:	01 de                	add    %ebx,%esi
80107583:	3b 30                	cmp    (%eax),%esi
80107585:	77 7e                	ja     80107605 <mprotect+0xa5>
    cprintf("\nwrong len\n");
    return -1;
  }

  //Check if addr is not page aligned
  if((int)(((int) addr) % PGSIZE )  != 0){
80107587:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
8010758d:	0f 85 89 00 00 00    	jne    8010761c <mprotect+0xbc>

  
  //loop for each page
  pte_t *pte;
  int i;
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
80107593:	39 f3                	cmp    %esi,%ebx
80107595:	7c 35                	jl     801075cc <mprotect+0x6c>
80107597:	eb 57                	jmp    801075f0 <mprotect+0x90>
80107599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // Getting the address of the PTE in the current process's page table (pgdir)
    // that corresponds to virtual address (i)
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
801075a0:	8b 10                	mov    (%eax),%edx
801075a2:	89 d1                	mov    %edx,%ecx
801075a4:	83 e1 05             	and    $0x5,%ecx
801075a7:	83 f9 05             	cmp    $0x5,%ecx
801075aa:	75 30                	jne    801075dc <mprotect+0x7c>
      *pte = (*pte) & (~PTE_W) ; //Clearing the write bit 
      cprintf("\nPTE : 0x%p\n", pte);
801075ac:	83 ec 08             	sub    $0x8,%esp
      *pte = (*pte) & (~PTE_W) ; //Clearing the write bit 
801075af:	83 e2 fd             	and    $0xfffffffd,%edx
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
801075b2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
      *pte = (*pte) & (~PTE_W) ; //Clearing the write bit 
801075b8:	89 10                	mov    %edx,(%eax)
      cprintf("\nPTE : 0x%p\n", pte);
801075ba:	50                   	push   %eax
801075bb:	68 04 83 10 80       	push   $0x80108304
801075c0:	e8 9b 90 ff ff       	call   80100660 <cprintf>
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
801075c5:	83 c4 10             	add    $0x10,%esp
801075c8:	39 de                	cmp    %ebx,%esi
801075ca:	7e 24                	jle    801075f0 <mprotect+0x90>
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
801075cc:	8b 47 04             	mov    0x4(%edi),%eax
801075cf:	31 c9                	xor    %ecx,%ecx
801075d1:	89 da                	mov    %ebx,%edx
801075d3:	e8 58 f6 ff ff       	call   80106c30 <walkpgdir>
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
801075d8:	85 c0                	test   %eax,%eax
801075da:	75 c4                	jne    801075a0 <mprotect+0x40>
    } else {
      return -1;
801075dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  //Reloading the Control register 3 with the address of page directory 
  //to flush TLB
  lcr3(V2P(curproc->pgdir));  
return 0;
}
801075e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801075e4:	5b                   	pop    %ebx
801075e5:	5e                   	pop    %esi
801075e6:	5f                   	pop    %edi
801075e7:	5d                   	pop    %ebp
801075e8:	c3                   	ret    
801075e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  lcr3(V2P(curproc->pgdir));  
801075f0:	8b 47 04             	mov    0x4(%edi),%eax
801075f3:	05 00 00 00 80       	add    $0x80000000,%eax
801075f8:	0f 22 d8             	mov    %eax,%cr3
}
801075fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
return 0;
801075fe:	31 c0                	xor    %eax,%eax
}
80107600:	5b                   	pop    %ebx
80107601:	5e                   	pop    %esi
80107602:	5f                   	pop    %edi
80107603:	5d                   	pop    %ebp
80107604:	c3                   	ret    
    cprintf("\nwrong len\n");
80107605:	83 ec 0c             	sub    $0xc,%esp
80107608:	68 e8 82 10 80       	push   $0x801082e8
8010760d:	e8 4e 90 ff ff       	call   80100660 <cprintf>
    return -1;
80107612:	83 c4 10             	add    $0x10,%esp
80107615:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010761a:	eb c5                	jmp    801075e1 <mprotect+0x81>
    cprintf("\nwrong addr %p\n", addr);
8010761c:	83 ec 08             	sub    $0x8,%esp
8010761f:	ff 75 08             	pushl  0x8(%ebp)
80107622:	68 f4 82 10 80       	push   $0x801082f4
80107627:	e8 34 90 ff ff       	call   80100660 <cprintf>
    return -1;
8010762c:	83 c4 10             	add    $0x10,%esp
8010762f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107634:	eb ab                	jmp    801075e1 <mprotect+0x81>
80107636:	8d 76 00             	lea    0x0(%esi),%esi
80107639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107640 <munprotect>:

//mprotect system call makes page table entries both readable and writable
int
munprotect(void *addr, int len){
80107640:	55                   	push   %ebp
80107641:	89 e5                	mov    %esp,%ebp
80107643:	57                   	push   %edi
80107644:	56                   	push   %esi
80107645:	53                   	push   %ebx
80107646:	83 ec 0c             	sub    $0xc,%esp
80107649:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct proc *curproc = myproc();
8010764c:	e8 4f c2 ff ff       	call   801038a0 <myproc>
  
  //Check if addr points to a region that is not currently a part of the address space
  if(len <= 0 || (int)addr+len*PGSIZE>curproc->sz){
80107651:	85 f6                	test   %esi,%esi
80107653:	0f 8e 8c 00 00 00    	jle    801076e5 <munprotect+0xa5>
80107659:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010765c:	c1 e6 0c             	shl    $0xc,%esi
8010765f:	89 c7                	mov    %eax,%edi
80107661:	01 de                	add    %ebx,%esi
80107663:	3b 30                	cmp    (%eax),%esi
80107665:	77 7e                	ja     801076e5 <munprotect+0xa5>
    cprintf("\nwrong len\n");
    return -1;
  }

  //Check if addr is not page aligned
  if((int)(((int) addr) % PGSIZE )  != 0){
80107667:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
8010766d:	0f 85 89 00 00 00    	jne    801076fc <munprotect+0xbc>
  }

  //loop for each page
  pte_t *pte;
  int i;
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
80107673:	39 f3                	cmp    %esi,%ebx
80107675:	7c 35                	jl     801076ac <munprotect+0x6c>
80107677:	eb 57                	jmp    801076d0 <munprotect+0x90>
80107679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // Getting the address of the PTE in the current process's page table (pgdir)
    // that corresponds to virtual address (i)
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
80107680:	8b 10                	mov    (%eax),%edx
80107682:	89 d1                	mov    %edx,%ecx
80107684:	83 e1 05             	and    $0x5,%ecx
80107687:	83 f9 05             	cmp    $0x5,%ecx
8010768a:	75 30                	jne    801076bc <munprotect+0x7c>
      *pte = (*pte) | (PTE_W) ; //Setting the write bit 
      cprintf("\nPTE : 0x%p\n", pte);
8010768c:	83 ec 08             	sub    $0x8,%esp
      *pte = (*pte) | (PTE_W) ; //Setting the write bit 
8010768f:	83 ca 02             	or     $0x2,%edx
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
80107692:	81 c3 00 10 00 00    	add    $0x1000,%ebx
      *pte = (*pte) | (PTE_W) ; //Setting the write bit 
80107698:	89 10                	mov    %edx,(%eax)
      cprintf("\nPTE : 0x%p\n", pte);
8010769a:	50                   	push   %eax
8010769b:	68 04 83 10 80       	push   $0x80108304
801076a0:	e8 bb 8f ff ff       	call   80100660 <cprintf>
  for (i = (int) addr; i < ((int) addr + (len) *PGSIZE); i+= PGSIZE){
801076a5:	83 c4 10             	add    $0x10,%esp
801076a8:	39 de                	cmp    %ebx,%esi
801076aa:	7e 24                	jle    801076d0 <munprotect+0x90>
    pte = walkpgdir(curproc->pgdir,(void*) i, 0);
801076ac:	8b 47 04             	mov    0x4(%edi),%eax
801076af:	31 c9                	xor    %ecx,%ecx
801076b1:	89 da                	mov    %ebx,%edx
801076b3:	e8 78 f5 ff ff       	call   80106c30 <walkpgdir>
    if(pte && ((*pte & PTE_U) != 0) && ((*pte & PTE_P) != 0) ){
801076b8:	85 c0                	test   %eax,%eax
801076ba:	75 c4                	jne    80107680 <munprotect+0x40>
    } else {
      return -1;
801076bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  //Reloading the Control register 3 with the address of page directory 
  //to flush TLB
  lcr3(V2P(curproc->pgdir));
  
  return 0;
}
801076c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801076c4:	5b                   	pop    %ebx
801076c5:	5e                   	pop    %esi
801076c6:	5f                   	pop    %edi
801076c7:	5d                   	pop    %ebp
801076c8:	c3                   	ret    
801076c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  lcr3(V2P(curproc->pgdir));
801076d0:	8b 47 04             	mov    0x4(%edi),%eax
801076d3:	05 00 00 00 80       	add    $0x80000000,%eax
801076d8:	0f 22 d8             	mov    %eax,%cr3
}
801076db:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801076de:	31 c0                	xor    %eax,%eax
}
801076e0:	5b                   	pop    %ebx
801076e1:	5e                   	pop    %esi
801076e2:	5f                   	pop    %edi
801076e3:	5d                   	pop    %ebp
801076e4:	c3                   	ret    
    cprintf("\nwrong len\n");
801076e5:	83 ec 0c             	sub    $0xc,%esp
801076e8:	68 e8 82 10 80       	push   $0x801082e8
801076ed:	e8 6e 8f ff ff       	call   80100660 <cprintf>
    return -1;
801076f2:	83 c4 10             	add    $0x10,%esp
801076f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801076fa:	eb c5                	jmp    801076c1 <munprotect+0x81>
    cprintf("\nwrong addr %p\n", addr);
801076fc:	83 ec 08             	sub    $0x8,%esp
801076ff:	ff 75 08             	pushl  0x8(%ebp)
80107702:	68 f4 82 10 80       	push   $0x801082f4
80107707:	e8 54 8f ff ff       	call   80100660 <cprintf>
    return -1;
8010770c:	83 c4 10             	add    $0x10,%esp
8010770f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107714:	eb ab                	jmp    801076c1 <munprotect+0x81>
80107716:	66 90                	xchg   %ax,%ax
80107718:	66 90                	xchg   %ax,%ax
8010771a:	66 90                	xchg   %ax,%ax
8010771c:	66 90                	xchg   %ax,%ax
8010771e:	66 90                	xchg   %ax,%ax

80107720 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
80107720:	55                   	push   %ebp
80107721:	b8 e4 b5 10 80       	mov    $0x8010b5e4,%eax
80107726:	b9 9c bf 10 80       	mov    $0x8010bf9c,%ecx
8010772b:	89 e5                	mov    %esp,%ebp
8010772d:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
80107730:	89 15 e0 b5 10 80    	mov    %edx,0x8010b5e0
80107736:	eb 0b                	jmp    80107743 <sgenrand+0x23>
80107738:	90                   	nop
80107739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107740:	83 c0 04             	add    $0x4,%eax
    for (mti=1; mti<N; mti++)
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
80107743:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
80107749:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
8010774b:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
8010774d:	75 f1                	jne    80107740 <sgenrand+0x20>
8010774f:	c7 05 60 b4 10 80 70 	movl   $0x270,0x8010b460
80107756:	02 00 00 
}
80107759:	5d                   	pop    %ebp
8010775a:	c3                   	ret    
8010775b:	90                   	nop
8010775c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107760 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
80107760:	a1 60 b4 10 80       	mov    0x8010b460,%eax
{
80107765:	55                   	push   %ebp
80107766:	89 e5                	mov    %esp,%ebp
80107768:	56                   	push   %esi
80107769:	53                   	push   %ebx
    if (mti >= N) { /* generate N words at one time */
8010776a:	3d 6f 02 00 00       	cmp    $0x26f,%eax
8010776f:	0f 8e f9 00 00 00    	jle    8010786e <genrand+0x10e>
        int kk;

        if (mti == N+1)   /* if sgenrand() has not been called, */
80107775:	3d 71 02 00 00       	cmp    $0x271,%eax
8010777a:	0f 84 fa 00 00 00    	je     8010787a <genrand+0x11a>
80107780:	ba e0 b5 10 80       	mov    $0x8010b5e0,%edx
80107785:	bb 6c b9 10 80       	mov    $0x8010b96c,%ebx
    mt[0]= seed & 0xffffffff;
8010778a:	89 d1                	mov    %edx,%ecx
8010778c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            sgenrand(4357); /* a default initial seed is used   */

        for (kk=0;kk<N-M;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
80107790:	8b 01                	mov    (%ecx),%eax
80107792:	8b 71 04             	mov    0x4(%ecx),%esi
80107795:	83 c1 04             	add    $0x4,%ecx
80107798:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
8010779e:	25 00 00 00 80       	and    $0x80000000,%eax
801077a3:	09 f0                	or     %esi,%eax
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
801077a5:	89 c6                	mov    %eax,%esi
801077a7:	83 e0 01             	and    $0x1,%eax
801077aa:	d1 ee                	shr    %esi
801077ac:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
801077b2:	33 34 85 38 83 10 80 	xor    -0x7fef7cc8(,%eax,4),%esi
801077b9:	89 71 fc             	mov    %esi,-0x4(%ecx)
        for (kk=0;kk<N-M;kk++) {
801077bc:	39 cb                	cmp    %ecx,%ebx
801077be:	75 d0                	jne    80107790 <genrand+0x30>
801077c0:	b9 10 bc 10 80       	mov    $0x8010bc10,%ecx
801077c5:	8d 76 00             	lea    0x0(%esi),%esi
        }
        for (;kk<N-1;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
801077c8:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
801077ce:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
801077d4:	83 c2 04             	add    $0x4,%edx
801077d7:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
801077dd:	25 00 00 00 80       	and    $0x80000000,%eax
801077e2:	09 d8                	or     %ebx,%eax
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
801077e4:	89 c3                	mov    %eax,%ebx
801077e6:	83 e0 01             	and    $0x1,%eax
801077e9:	d1 eb                	shr    %ebx
801077eb:	33 5a fc             	xor    -0x4(%edx),%ebx
801077ee:	33 1c 85 38 83 10 80 	xor    -0x7fef7cc8(,%eax,4),%ebx
801077f5:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
        for (;kk<N-1;kk++) {
801077fb:	39 d1                	cmp    %edx,%ecx
801077fd:	75 c9                	jne    801077c8 <genrand+0x68>
        }
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
801077ff:	a1 e0 b5 10 80       	mov    0x8010b5e0,%eax
80107804:	8b 0d 9c bf 10 80    	mov    0x8010bf9c,%ecx
8010780a:	89 c2                	mov    %eax,%edx
8010780c:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
80107812:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
80107818:	09 d1                	or     %edx,%ecx
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
8010781a:	89 ca                	mov    %ecx,%edx
8010781c:	83 e1 01             	and    $0x1,%ecx
8010781f:	d1 ea                	shr    %edx
80107821:	33 15 10 bc 10 80    	xor    0x8010bc10,%edx
80107827:	33 14 8d 38 83 10 80 	xor    -0x7fef7cc8(,%ecx,4),%edx
8010782e:	89 15 9c bf 10 80    	mov    %edx,0x8010bf9c
80107834:	ba 01 00 00 00       	mov    $0x1,%edx

        mti = 0;
    }
  
    y = mt[mti++];
80107839:	89 15 60 b4 10 80    	mov    %edx,0x8010b460
    y ^= TEMPERING_SHIFT_U(y);
8010783f:	89 c2                	mov    %eax,%edx
80107841:	c1 ea 0b             	shr    $0xb,%edx
80107844:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
80107846:	89 d0                	mov    %edx,%eax
80107848:	c1 e0 07             	shl    $0x7,%eax
8010784b:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
80107850:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
80107852:	89 d0                	mov    %edx,%eax
80107854:	c1 e0 0f             	shl    $0xf,%eax
80107857:	25 00 00 c6 ef       	and    $0xefc60000,%eax
8010785c:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_L(y);
8010785e:	89 c2                	mov    %eax,%edx
80107860:	c1 ea 12             	shr    $0x12,%edx
80107863:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
}
80107865:	5b                   	pop    %ebx
    return y & RAND_MAX;
80107866:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
8010786b:	5e                   	pop    %esi
8010786c:	5d                   	pop    %ebp
8010786d:	c3                   	ret    
8010786e:	8d 50 01             	lea    0x1(%eax),%edx
80107871:	8b 04 85 e0 b5 10 80 	mov    -0x7fef4a20(,%eax,4),%eax
80107878:	eb bf                	jmp    80107839 <genrand+0xd9>
    mt[0]= seed & 0xffffffff;
8010787a:	c7 05 e0 b5 10 80 05 	movl   $0x1105,0x8010b5e0
80107881:	11 00 00 
80107884:	b8 e4 b5 10 80       	mov    $0x8010b5e4,%eax
80107889:	b9 9c bf 10 80       	mov    $0x8010bf9c,%ecx
8010788e:	ba 05 11 00 00       	mov    $0x1105,%edx
80107893:	eb 06                	jmp    8010789b <genrand+0x13b>
80107895:	8d 76 00             	lea    0x0(%esi),%esi
80107898:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
8010789b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
801078a1:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
801078a3:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
801078a5:	75 f1                	jne    80107898 <genrand+0x138>
801078a7:	e9 d4 fe ff ff       	jmp    80107780 <genrand+0x20>
801078ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801078b0 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
801078b0:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
801078b1:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
801078b3:	89 e5                	mov    %esp,%ebp
801078b5:	56                   	push   %esi
801078b6:	53                   	push   %ebx
    num_bins = (unsigned long) max + 1,
801078b7:	8b 45 08             	mov    0x8(%ebp),%eax
    bin_size = num_rand / num_bins,
801078ba:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
801078bf:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
801078c2:	89 d8                	mov    %ebx,%eax
801078c4:	f7 f1                	div    %ecx
801078c6:	89 c6                	mov    %eax,%esi
801078c8:	29 d3                	sub    %edx,%ebx
801078ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    defect   = num_rand % num_bins;

  long x;
  do {
   x = genrand();
801078d0:	e8 8b fe ff ff       	call   80107760 <genrand>
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
801078d5:	39 d8                	cmp    %ebx,%eax
801078d7:	73 f7                	jae    801078d0 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
801078d9:	31 d2                	xor    %edx,%edx
801078db:	f7 f6                	div    %esi
}
801078dd:	5b                   	pop    %ebx
801078de:	5e                   	pop    %esi
801078df:	5d                   	pop    %ebp
801078e0:	c3                   	ret    
