
motor_control.o:     file format elf32-avr


Disassembly of section .text._ZN3ino24setup_encoder_interruptsEv:

00000000 <ino::setup_encoder_interrupts()>:
   0:	8d b3       	in	r24, 0x1d	; 29
   2:	1d ba       	out	0x1d, r1	; 29
   4:	52 98       	cbi	0x0a, 2	; 10
   6:	5a 98       	cbi	0x0b, 2	; 11
   8:	53 98       	cbi	0x0a, 3	; 10
   a:	5b 98       	cbi	0x0b, 3	; 11
   c:	e9 e6       	ldi	r30, 0x69	; 105
   e:	f0 e0       	ldi	r31, 0x00	; 0
  10:	80 81       	ld	r24, Z
  12:	85 70       	andi	r24, 0x05	; 5
  14:	80 83       	st	Z, r24
  16:	8d b3       	in	r24, 0x1d	; 29
  18:	83 70       	andi	r24, 0x03	; 3
  1a:	8d bb       	out	0x1d, r24	; 29
  1c:	08 95       	ret

Disassembly of section .text.__vector_1:

00000000 <__vector_1>:
   0:	1f 92       	push	r1
   2:	1f b6       	in	r1, 0x3f	; 63
   4:	1f 92       	push	r1
   6:	11 24       	eor	r1, r1
   8:	8f 93       	push	r24
   a:	9f 93       	push	r25
   c:	af 93       	push	r26
   e:	bf 93       	push	r27
  10:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  14:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  18:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  1c:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  20:	4c 9b       	sbis	0x09, 4	; 9
  22:	00 c0       	rjmp	.+0      	; 0x24 <__vector_1+0x24>
  24:	01 96       	adiw	r24, 0x01	; 1
  26:	a1 1d       	adc	r26, r1
  28:	b1 1d       	adc	r27, r1
  2a:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  2e:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  32:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  36:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  3a:	bf 91       	pop	r27
  3c:	af 91       	pop	r26
  3e:	9f 91       	pop	r25
  40:	8f 91       	pop	r24
  42:	1f 90       	pop	r1
  44:	1f be       	out	0x3f, r1	; 63
  46:	1f 90       	pop	r1
  48:	18 95       	reti
  4a:	01 97       	sbiw	r24, 0x01	; 1
  4c:	a1 09       	sbc	r26, r1
  4e:	b1 09       	sbc	r27, r1
  50:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  54:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  58:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  5c:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  60:	00 c0       	rjmp	.+0      	; 0x62 <__SREG__+0x23>

Disassembly of section .text.__vector_2:

00000000 <__vector_2>:
   0:	1f 92       	push	r1
   2:	1f b6       	in	r1, 0x3f	; 63
   4:	1f 92       	push	r1
   6:	11 24       	eor	r1, r1
   8:	8f 93       	push	r24
   a:	9f 93       	push	r25
   c:	af 93       	push	r26
   e:	bf 93       	push	r27
  10:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  14:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  18:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  1c:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  20:	4f 99       	sbic	0x09, 7	; 9
  22:	00 c0       	rjmp	.+0      	; 0x24 <__vector_2+0x24>
  24:	01 97       	sbiw	r24, 0x01	; 1
  26:	a1 09       	sbc	r26, r1
  28:	b1 09       	sbc	r27, r1
  2a:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  2e:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  32:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  36:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  3a:	bf 91       	pop	r27
  3c:	af 91       	pop	r26
  3e:	9f 91       	pop	r25
  40:	8f 91       	pop	r24
  42:	1f 90       	pop	r1
  44:	1f be       	out	0x3f, r1	; 63
  46:	1f 90       	pop	r1
  48:	18 95       	reti
  4a:	01 96       	adiw	r24, 0x01	; 1
  4c:	a1 1d       	adc	r26, r1
  4e:	b1 1d       	adc	r27, r1
  50:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  54:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  58:	a0 93 00 00 	sts	0x0000, r26	; 0x800000 <__SREG__+0x7fffc1>
  5c:	b0 93 00 00 	sts	0x0000, r27	; 0x800000 <__SREG__+0x7fffc1>
  60:	00 c0       	rjmp	.+0      	; 0x62 <__SREG__+0x23>

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
