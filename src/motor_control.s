
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
  24:	01 f4       	brne	.+0      	; 0x26 <__vector_5+0x26>
  26:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  2a:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  2e:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  32:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  36:	4c 9b       	sbis	0x09, 4	; 9
  38:	00 c0       	rjmp	.+0      	; 0x3a <__vector_5+0x3a>
  3a:	01 96       	adiw	r24, 0x01	; 1
  3c:	a1 1d       	adc	r26, r1
  3e:	b1 1d       	adc	r27, r1
  40:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  44:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  48:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  4c:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  50:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  54:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  58:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  5c:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  60:	4f 99       	sbic	0x09, 7	; 9
  62:	00 c0       	rjmp	.+0      	; 0x64 <__vector_5+0x64>
  64:	01 97       	sbiw	r24, 0x01	; 1
  66:	a1 09       	sbc	r26, r1
  68:	b1 09       	sbc	r27, r1
  6a:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  6e:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  72:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  76:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  7a:	bf 91       	pop	r27
  7c:	af 91       	pop	r26
  7e:	9f 91       	pop	r25
  80:	8f 91       	pop	r24
  82:	1f 90       	pop	r1
  84:	1f be       	out	0x3f, r1	; 63
  86:	1f 90       	pop	r1
  88:	18 95       	reti
  8a:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  8e:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  92:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  96:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  9a:	4c 9b       	sbis	0x09, 4	; 9
  9c:	00 c0       	rjmp	.+0      	; 0x9e <__vector_5+0x9e>
  9e:	01 96       	adiw	r24, 0x01	; 1
  a0:	a1 1d       	adc	r26, r1
  a2:	b1 1d       	adc	r27, r1
  a4:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  a8:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  ac:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  b0:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  b4:	00 c0       	rjmp	.+0      	; 0xb6 <__vector_5+0xb6>
  b6:	01 96       	adiw	r24, 0x01	; 1
  b8:	a1 1d       	adc	r26, r1
  ba:	b1 1d       	adc	r27, r1
  bc:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  c0:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  c4:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  c8:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  cc:	00 c0       	rjmp	.+0      	; 0xce <__vector_5+0xce>
  ce:	01 97       	sbiw	r24, 0x01	; 1
  d0:	a1 09       	sbc	r26, r1
  d2:	b1 09       	sbc	r27, r1
  d4:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  d8:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  dc:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  e0:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  e4:	00 c0       	rjmp	.+0      	; 0xe6 <__vector_5+0xe6>
  e6:	01 97       	sbiw	r24, 0x01	; 1
  e8:	a1 09       	sbc	r26, r1
  ea:	b1 09       	sbc	r27, r1
  ec:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  f0:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  f4:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  f8:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  fc:	00 c0       	rjmp	.+0      	; 0xfe <__SREG__+0xbf>

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
