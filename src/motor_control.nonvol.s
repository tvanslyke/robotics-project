
motor_control.o:     file format elf32-avr


Disassembly of section .text._ZN3ino24setup_encoder_interruptsEv:

00000000 <ino::setup_encoder_interrupts()>:
   0:	e8 e6       	ldi	r30, 0x68	; 104
   2:	f0 e0       	ldi	r31, 0x00	; 0
   4:	80 81       	ld	r24, Z
   6:	8b 7f       	andi	r24, 0xFB	; 251
   8:	80 83       	st	Z, r24
   a:	8c e0       	ldi	r24, 0x0C	; 12
   c:	80 93 6d 00 	sts	0x006D, r24	; 0x80006d <__SREG__+0x80002e>
  10:	52 98       	cbi	0x0a, 2	; 10
  12:	5a 98       	cbi	0x0b, 2	; 11
  14:	53 98       	cbi	0x0a, 3	; 10
  16:	5b 98       	cbi	0x0b, 3	; 11
  18:	89 b1       	in	r24, 0x09	; 9
  1a:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  1e:	80 81       	ld	r24, Z
  20:	84 60       	ori	r24, 0x04	; 4
  22:	80 83       	st	Z, r24
  24:	08 95       	ret

Disassembly of section .text.__vector_5:

00000000 <__vector_5>:
   0:	1f 92       	push	r1
   2:	1f b6       	in	r1, 0x3f	; 63
   4:	1f 92       	push	r1
   6:	11 24       	eor	r1, r1
   8:	8f 93       	push	r24
   a:	9f 93       	push	r25
   c:	af 93       	push	r26
   e:	bf 93       	push	r27
  10:	99 b1       	in	r25, 0x09	; 9
  12:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  16:	89 27       	eor	r24, r25
  18:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  1c:	8c 70       	andi	r24, 0x0C	; 12
  1e:	88 30       	cpi	r24, 0x08	; 8
  20:	01 f0       	breq	.+0      	; 0x22 <__vector_5+0x22>
  22:	8c 30       	cpi	r24, 0x0C	; 12
  24:	01 f0       	breq	.+0      	; 0x26 <__vector_5+0x26>
  26:	84 30       	cpi	r24, 0x04	; 4
  28:	01 f0       	breq	.+0      	; 0x2a <__vector_5+0x2a>
  2a:	bf 91       	pop	r27
  2c:	af 91       	pop	r26
  2e:	9f 91       	pop	r25
  30:	8f 91       	pop	r24
  32:	1f 90       	pop	r1
  34:	1f be       	out	0x3f, r1	; 63
  36:	1f 90       	pop	r1
  38:	18 95       	reti
  3a:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  3e:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  42:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  46:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  4a:	4c 99       	sbic	0x09, 4	; 9
  4c:	00 c0       	rjmp	.+0      	; 0x4e <__vector_5+0x4e>
  4e:	01 97       	sbiw	r24, 0x01	; 1
  50:	a1 09       	sbc	r26, r1
  52:	b1 09       	sbc	r27, r1
  54:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  58:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  5c:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  60:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  64:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  68:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  6c:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  70:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  74:	4f 99       	sbic	0x09, 7	; 9
  76:	00 c0       	rjmp	.+0      	; 0x78 <__vector_5+0x78>
  78:	01 97       	sbiw	r24, 0x01	; 1
  7a:	a1 09       	sbc	r26, r1
  7c:	b1 09       	sbc	r27, r1
  7e:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  82:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  86:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  8a:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  8e:	00 c0       	rjmp	.+0      	; 0x90 <__vector_5+0x90>
  90:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  94:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  98:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  9c:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  a0:	4c 9b       	sbis	0x09, 4	; 9
  a2:	00 c0       	rjmp	.+0      	; 0xa4 <__vector_5+0xa4>
  a4:	01 96       	adiw	r24, 0x01	; 1
  a6:	a1 1d       	adc	r26, r1
  a8:	b1 1d       	adc	r27, r1
  aa:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  ae:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  b2:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  b6:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  ba:	00 c0       	rjmp	.+0      	; 0xbc <__vector_5+0xbc>
  bc:	01 96       	adiw	r24, 0x01	; 1
  be:	a1 1d       	adc	r26, r1
  c0:	b1 1d       	adc	r27, r1
  c2:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  c6:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  ca:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  ce:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  d2:	00 c0       	rjmp	.+0      	; 0xd4 <__vector_5+0xd4>
  d4:	01 96       	adiw	r24, 0x01	; 1
  d6:	a1 1d       	adc	r26, r1
  d8:	b1 1d       	adc	r27, r1
  da:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  de:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  e2:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  e6:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  ea:	00 c0       	rjmp	.+0      	; 0xec <__vector_5+0xec>
  ec:	01 97       	sbiw	r24, 0x01	; 1
  ee:	a1 09       	sbc	r26, r1
  f0:	b1 09       	sbc	r27, r1
  f2:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  f6:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  fa:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  fe:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
 102:	00 c0       	rjmp	.+0      	; 0x104 <__SREG__+0xc5>

Disassembly of section .bss._ZL8pind_old:

00000000 <pind_old>:
	...

Disassembly of section .bss._ZN3ino19right_motor_controlE:

00000000 <ino::right_motor_control>:
   0:	00 00       	nop
	...

Disassembly of section .bss._ZN3ino18left_motor_controlE:

00000000 <ino::left_motor_control>:
   0:	00 00       	nop
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	00 47       	sbci	r16, 0x70	; 112
   2:	43 43       	sbci	r20, 0x33	; 51
   4:	3a 20       	and	r3, r10
   6:	28 47       	sbci	r18, 0x78	; 120
   8:	4e 55       	subi	r20, 0x5E	; 94
   a:	29 20       	and	r2, r9
   c:	38 2e       	mov	r3, r24
   e:	32 2e       	mov	r3, r18
  10:	30 00       	.word	0x0030	; ????
