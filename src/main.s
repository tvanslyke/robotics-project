
main.o:     file format elf32-avr


Disassembly of section .text._Z4testv:

00000000 <test()>:
   0:	cf 93       	push	r28
   2:	df 93       	push	r29
   4:	cd b7       	in	r28, 0x3d	; 61
   6:	de b7       	in	r29, 0x3e	; 62
   8:	28 97       	sbiw	r28, 0x08	; 8
   a:	0f b6       	in	r0, 0x3f	; 63
   c:	f8 94       	cli
   e:	de bf       	out	0x3e, r29	; 62
  10:	0f be       	out	0x3f, r0	; 63
  12:	cd bf       	out	0x3d, r28	; 61
  14:	ce 01       	movw	r24, r28
  16:	01 96       	adiw	r24, 0x01	; 1
  18:	0e 94 00 00 	call	0	; 0x0 <test()>
  1c:	88 85       	ldd	r24, Y+8	; 0x08
  1e:	28 96       	adiw	r28, 0x08	; 8
  20:	0f b6       	in	r0, 0x3f	; 63
  22:	f8 94       	cli
  24:	de bf       	out	0x3e, r29	; 62
  26:	0f be       	out	0x3f, r0	; 63
  28:	cd bf       	out	0x3d, r28	; 61
  2a:	df 91       	pop	r29
  2c:	cf 91       	pop	r28
  2e:	08 95       	ret

Disassembly of section .text._Z6escapePv:

00000000 <escape(void*)>:
   0:	08 95       	ret

Disassembly of section .text.setup:

00000000 <setup>:
   0:	40 e0       	ldi	r20, 0x00	; 0
   2:	52 ec       	ldi	r21, 0xC2	; 194
   4:	61 e0       	ldi	r22, 0x01	; 1
   6:	70 e0       	ldi	r23, 0x00	; 0
   8:	80 e0       	ldi	r24, 0x00	; 0
   a:	90 e0       	ldi	r25, 0x00	; 0
   c:	0e 94 00 00 	call	0	; 0x0 <setup>
  10:	4f ef       	ldi	r20, 0xFF	; 255
  12:	5f ef       	ldi	r21, 0xFF	; 255
  14:	6f ef       	ldi	r22, 0xFF	; 255
  16:	7f e7       	ldi	r23, 0x7F	; 127
  18:	80 e0       	ldi	r24, 0x00	; 0
  1a:	90 e0       	ldi	r25, 0x00	; 0
  1c:	0e 94 00 00 	call	0	; 0x0 <setup>
  20:	62 e0       	ldi	r22, 0x02	; 2
  22:	88 e0       	ldi	r24, 0x08	; 8
  24:	0e 94 00 00 	call	0	; 0x0 <setup>
  28:	61 e0       	ldi	r22, 0x01	; 1
  2a:	8d e0       	ldi	r24, 0x0D	; 13
  2c:	0e 94 00 00 	call	0	; 0x0 <setup>
  30:	60 e0       	ldi	r22, 0x00	; 0
  32:	8e e0       	ldi	r24, 0x0E	; 14
  34:	0e 94 00 00 	call	0	; 0x0 <setup>
  38:	0e 94 00 00 	call	0	; 0x0 <setup>
  3c:	55 9a       	sbi	0x0a, 5	; 10
  3e:	22 9a       	sbi	0x04, 2	; 4
  40:	4f ef       	ldi	r20, 0xFF	; 255
  42:	48 bd       	out	0x28, r20	; 40
  44:	2f ef       	ldi	r18, 0xFF	; 255
  46:	30 e0       	ldi	r19, 0x00	; 0
  48:	30 93 8b 00 	sts	0x008B, r19	; 0x80008b <__SREG__+0x80004c>
  4c:	20 93 8a 00 	sts	0x008A, r18	; 0x80008a <__SREG__+0x80004b>
  50:	84 b5       	in	r24, 0x24	; 36
  52:	80 62       	ori	r24, 0x20	; 32
  54:	84 bd       	out	0x24, r24	; 36
  56:	e0 e8       	ldi	r30, 0x80	; 128
  58:	f0 e0       	ldi	r31, 0x00	; 0
  5a:	80 81       	ld	r24, Z
  5c:	80 62       	ori	r24, 0x20	; 32
  5e:	80 83       	st	Z, r24
  60:	91 e0       	ldi	r25, 0x01	; 1
  62:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  66:	56 9a       	sbi	0x0a, 6	; 10
  68:	21 9a       	sbi	0x04, 1	; 4
  6a:	47 bd       	out	0x27, r20	; 39
  6c:	30 93 89 00 	sts	0x0089, r19	; 0x800089 <__SREG__+0x80004a>
  70:	20 93 88 00 	sts	0x0088, r18	; 0x800088 <__SREG__+0x800049>
  74:	84 b5       	in	r24, 0x24	; 36
  76:	80 68       	ori	r24, 0x80	; 128
  78:	84 bd       	out	0x24, r24	; 36
  7a:	80 81       	ld	r24, Z
  7c:	80 68       	ori	r24, 0x80	; 128
  7e:	80 83       	st	Z, r24
  80:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
  84:	0e 94 00 00 	call	0	; 0x0 <setup>
  88:	60 e0       	ldi	r22, 0x00	; 0
  8a:	8e e0       	ldi	r24, 0x0E	; 14
  8c:	0e 94 00 00 	call	0	; 0x0 <setup>
  90:	60 e0       	ldi	r22, 0x00	; 0
  92:	8f e0       	ldi	r24, 0x0F	; 15
  94:	0c 94 00 00 	jmp	0	; 0x0 <setup>

Disassembly of section .text._Z20check_stop_conditionN3ino18LineSensorReadingsE8StopTypeh:

00000000 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)>:
   0:	ef 92       	push	r14
   2:	0f 93       	push	r16
   4:	cf 93       	push	r28
   6:	df 93       	push	r29
   8:	00 d0       	rcall	.+0      	; 0xa <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0xa>
   a:	00 d0       	rcall	.+0      	; 0xc <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0xc>
   c:	00 d0       	rcall	.+0      	; 0xe <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0xe>
   e:	0f 92       	push	r0
  10:	cd b7       	in	r28, 0x3d	; 61
  12:	de b7       	in	r29, 0x3e	; 62
  14:	98 2f       	mov	r25, r24
  16:	01 30       	cpi	r16, 0x01	; 1
  18:	01 f0       	breq	.+0      	; 0x1a <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x1a>
  1a:	01 11       	cpse	r16, r1
  1c:	00 c0       	rjmp	.+0      	; 0x1e <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x1e>
  1e:	e2 16       	cp	r14, r18
  20:	00 f0       	brcs	.+0      	; 0x22 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x22>
  22:	e3 16       	cp	r14, r19
  24:	00 f0       	brcs	.+0      	; 0x26 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x26>
  26:	e4 16       	cp	r14, r20
  28:	00 f0       	brcs	.+0      	; 0x2a <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x2a>
  2a:	e5 16       	cp	r14, r21
  2c:	00 f0       	brcs	.+0      	; 0x2e <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x2e>
  2e:	e6 16       	cp	r14, r22
  30:	00 f0       	brcs	.+0      	; 0x32 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x32>
  32:	e7 16       	cp	r14, r23
  34:	00 f0       	brcs	.+0      	; 0x36 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x36>
  36:	81 e0       	ldi	r24, 0x01	; 1
  38:	e9 16       	cp	r14, r25
  3a:	00 f4       	brcc	.+0      	; 0x3c <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x3c>
  3c:	80 e0       	ldi	r24, 0x00	; 0
  3e:	27 96       	adiw	r28, 0x07	; 7
  40:	0f b6       	in	r0, 0x3f	; 63
  42:	f8 94       	cli
  44:	de bf       	out	0x3e, r29	; 62
  46:	0f be       	out	0x3f, r0	; 63
  48:	cd bf       	out	0x3d, r28	; 61
  4a:	df 91       	pop	r29
  4c:	cf 91       	pop	r28
  4e:	0f 91       	pop	r16
  50:	ef 90       	pop	r14
  52:	08 95       	ret
  54:	e2 16       	cp	r14, r18
  56:	00 f4       	brcc	.+0      	; 0x58 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x58>
  58:	00 c0       	rjmp	.+0      	; 0x5a <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x5a>
  5a:	e2 16       	cp	r14, r18
  5c:	00 f0       	brcs	.+0      	; 0x5e <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x5e>
  5e:	e3 16       	cp	r14, r19
  60:	00 f0       	brcs	.+0      	; 0x62 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x62>
  62:	e4 16       	cp	r14, r20
  64:	00 f0       	brcs	.+0      	; 0x66 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x66>
  66:	e5 16       	cp	r14, r21
  68:	00 f0       	brcs	.+0      	; 0x6a <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x6a>
  6a:	e6 16       	cp	r14, r22
  6c:	00 f0       	brcs	.+0      	; 0x6e <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x6e>
  6e:	e7 16       	cp	r14, r23
  70:	00 f0       	brcs	.+0      	; 0x72 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x72>
  72:	81 e0       	ldi	r24, 0x01	; 1
  74:	e9 16       	cp	r14, r25
  76:	00 f0       	brcs	.+0      	; 0x78 <check_stop_condition(ino::LineSensorReadings, StopType, unsigned char)+0x78>
  78:	00 c0       	rjmp	.+0      	; 0x7a <__SREG__+0x3b>

Disassembly of section .text._Z10move_until8StopType:

00000000 <move_until(StopType)>:
   0:	2f 92       	push	r2
   2:	3f 92       	push	r3
   4:	4f 92       	push	r4
   6:	5f 92       	push	r5
   8:	6f 92       	push	r6
   a:	7f 92       	push	r7
   c:	8f 92       	push	r8
   e:	9f 92       	push	r9
  10:	af 92       	push	r10
  12:	bf 92       	push	r11
  14:	cf 92       	push	r12
  16:	df 92       	push	r13
  18:	ef 92       	push	r14
  1a:	ff 92       	push	r15
  1c:	0f 93       	push	r16
  1e:	1f 93       	push	r17
  20:	cf 93       	push	r28
  22:	df 93       	push	r29
  24:	cd b7       	in	r28, 0x3d	; 61
  26:	de b7       	in	r29, 0x3e	; 62
  28:	a2 97       	sbiw	r28, 0x22	; 34
  2a:	0f b6       	in	r0, 0x3f	; 63
  2c:	f8 94       	cli
  2e:	de bf       	out	0x3e, r29	; 62
  30:	0f be       	out	0x3f, r0	; 63
  32:	cd bf       	out	0x3d, r28	; 61
  34:	9e 01       	movw	r18, r28
  36:	27 5f       	subi	r18, 0xF7	; 247
  38:	3f 4f       	sbci	r19, 0xFF	; 255
  3a:	38 a3       	std	Y+32, r19	; 0x20
  3c:	2f 8f       	std	Y+31, r18	; 0x1f
  3e:	3f 8d       	ldd	r19, Y+31	; 0x1f
  40:	39 a3       	std	Y+33, r19	; 0x21
  42:	48 a1       	ldd	r20, Y+32	; 0x20
  44:	4a a3       	std	Y+34, r20	; 0x22
  46:	66 24       	eor	r6, r6
  48:	6a 94       	dec	r6
  4a:	71 2c       	mov	r7, r1
  4c:	ce 01       	movw	r24, r28
  4e:	09 96       	adiw	r24, 0x09	; 9
  50:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
  54:	88 89       	ldd	r24, Y+16	; 0x10
  56:	81 11       	cpse	r24, r1
  58:	00 c0       	rjmp	.+0      	; 0x5a <move_until(StopType)+0x5a>
  5a:	ce 01       	movw	r24, r28
  5c:	01 96       	adiw	r24, 0x01	; 1
  5e:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
  62:	88 85       	ldd	r24, Y+8	; 0x08
  64:	88 23       	and	r24, r24
  66:	01 f4       	brne	.+0      	; 0x68 <move_until(StopType)+0x68>
  68:	00 c0       	rjmp	.+0      	; 0x6a <move_until(StopType)+0x6a>
  6a:	87 e0       	ldi	r24, 0x07	; 7
  6c:	e9 a1       	ldd	r30, Y+33	; 0x21
  6e:	fa a1       	ldd	r31, Y+34	; 0x22
  70:	de 01       	movw	r26, r28
  72:	51 96       	adiw	r26, 0x11	; 17
  74:	01 90       	ld	r0, Z+
  76:	0d 92       	st	X+, r0
  78:	8a 95       	dec	r24
  7a:	01 f4       	brne	.+0      	; 0x7c <move_until(StopType)+0x7c>
  7c:	87 e0       	ldi	r24, 0x07	; 7
  7e:	fe 01       	movw	r30, r28
  80:	71 96       	adiw	r30, 0x11	; 17
  82:	de 01       	movw	r26, r28
  84:	58 96       	adiw	r26, 0x18	; 24
  86:	01 90       	ld	r0, Z+
  88:	0d 92       	st	X+, r0
  8a:	8a 95       	dec	r24
  8c:	01 f4       	brne	.+0      	; 0x8e <move_until(StopType)+0x8e>
  8e:	00 e0       	ldi	r16, 0x00	; 0
  90:	10 e0       	ldi	r17, 0x00	; 0
  92:	28 8d       	ldd	r18, Y+24	; 0x18
  94:	39 8d       	ldd	r19, Y+25	; 0x19
  96:	4a 8d       	ldd	r20, Y+26	; 0x1a
  98:	5b 8d       	ldd	r21, Y+27	; 0x1b
  9a:	6c 8d       	ldd	r22, Y+28	; 0x1c
  9c:	7d 8d       	ldd	r23, Y+29	; 0x1d
  9e:	8e 8d       	ldd	r24, Y+30	; 0x1e
  a0:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
  a4:	a3 2e       	mov	r10, r19
  a6:	b4 2e       	mov	r11, r20
  a8:	15 2f       	mov	r17, r21
  aa:	06 2f       	mov	r16, r22
  ac:	f7 2f       	mov	r31, r23
  ae:	e8 2f       	mov	r30, r24
  b0:	29 83       	std	Y+1, r18	; 0x01
  b2:	3a 83       	std	Y+2, r19	; 0x02
  b4:	4b 83       	std	Y+3, r20	; 0x03
  b6:	5c 83       	std	Y+4, r21	; 0x04
  b8:	6d 83       	std	Y+5, r22	; 0x05
  ba:	7e 83       	std	Y+6, r23	; 0x06
  bc:	8f 83       	std	Y+7, r24	; 0x07
  be:	a2 2f       	mov	r26, r18
  c0:	b0 e0       	ldi	r27, 0x00	; 0
  c2:	20 e8       	ldi	r18, 0x80	; 128
  c4:	3f ef       	ldi	r19, 0xFF	; 255
  c6:	4f ef       	ldi	r20, 0xFF	; 255
  c8:	5f ef       	ldi	r21, 0xFF	; 255
  ca:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
  ce:	6b 01       	movw	r12, r22
  d0:	7c 01       	movw	r14, r24
  d2:	aa 2d       	mov	r26, r10
  d4:	b0 e0       	ldi	r27, 0x00	; 0
  d6:	2a ea       	ldi	r18, 0xAA	; 170
  d8:	3f ef       	ldi	r19, 0xFF	; 255
  da:	4f ef       	ldi	r20, 0xFF	; 255
  dc:	5f ef       	ldi	r21, 0xFF	; 255
  de:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
  e2:	c6 0e       	add	r12, r22
  e4:	d7 1e       	adc	r13, r23
  e6:	e8 1e       	adc	r14, r24
  e8:	f9 1e       	adc	r15, r25
  ea:	ab 2d       	mov	r26, r11
  ec:	b0 e0       	ldi	r27, 0x00	; 0
  ee:	24 ed       	ldi	r18, 0xD4	; 212
  f0:	3f ef       	ldi	r19, 0xFF	; 255
  f2:	4f ef       	ldi	r20, 0xFF	; 255
  f4:	5f ef       	ldi	r21, 0xFF	; 255
  f6:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
  fa:	c6 0e       	add	r12, r22
  fc:	d7 1e       	adc	r13, r23
  fe:	e8 1e       	adc	r14, r24
 100:	f9 1e       	adc	r15, r25
 102:	81 2f       	mov	r24, r17
 104:	90 e0       	ldi	r25, 0x00	; 0
 106:	b0 e0       	ldi	r27, 0x00	; 0
 108:	a0 e0       	ldi	r26, 0x00	; 0
 10a:	20 e0       	ldi	r18, 0x00	; 0
 10c:	30 e0       	ldi	r19, 0x00	; 0
 10e:	a9 01       	movw	r20, r18
 110:	28 1b       	sub	r18, r24
 112:	39 0b       	sbc	r19, r25
 114:	4a 0b       	sbc	r20, r26
 116:	5b 0b       	sbc	r21, r27
 118:	ca 01       	movw	r24, r20
 11a:	b9 01       	movw	r22, r18
 11c:	66 0f       	add	r22, r22
 11e:	77 1f       	adc	r23, r23
 120:	88 1f       	adc	r24, r24
 122:	99 1f       	adc	r25, r25
 124:	6c 0d       	add	r22, r12
 126:	7d 1d       	adc	r23, r13
 128:	8e 1d       	adc	r24, r14
 12a:	9f 1d       	adc	r25, r15
 12c:	10 e0       	ldi	r17, 0x00	; 0
 12e:	30 e0       	ldi	r19, 0x00	; 0
 130:	20 e0       	ldi	r18, 0x00	; 0
 132:	68 01       	movw	r12, r16
 134:	79 01       	movw	r14, r18
 136:	cc 0c       	add	r12, r12
 138:	dd 1c       	adc	r13, r13
 13a:	ee 1c       	adc	r14, r14
 13c:	ff 1c       	adc	r15, r15
 13e:	cc 0c       	add	r12, r12
 140:	dd 1c       	adc	r13, r13
 142:	ee 1c       	adc	r14, r14
 144:	ff 1c       	adc	r15, r15
 146:	c0 0e       	add	r12, r16
 148:	d1 1e       	adc	r13, r17
 14a:	e2 1e       	adc	r14, r18
 14c:	f3 1e       	adc	r15, r19
 14e:	cc 0c       	add	r12, r12
 150:	dd 1c       	adc	r13, r13
 152:	ee 1c       	adc	r14, r14
 154:	ff 1c       	adc	r15, r15
 156:	cc 0c       	add	r12, r12
 158:	dd 1c       	adc	r13, r13
 15a:	ee 1c       	adc	r14, r14
 15c:	ff 1c       	adc	r15, r15
 15e:	cc 0c       	add	r12, r12
 160:	dd 1c       	adc	r13, r13
 162:	ee 1c       	adc	r14, r14
 164:	ff 1c       	adc	r15, r15
 166:	c6 0e       	add	r12, r22
 168:	d7 1e       	adc	r13, r23
 16a:	e8 1e       	adc	r14, r24
 16c:	f9 1e       	adc	r15, r25
 16e:	2f 2f       	mov	r18, r31
 170:	30 e0       	ldi	r19, 0x00	; 0
 172:	a2 e5       	ldi	r26, 0x52	; 82
 174:	b0 e0       	ldi	r27, 0x00	; 0
 176:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 17a:	c6 0e       	add	r12, r22
 17c:	d7 1e       	adc	r13, r23
 17e:	e8 1e       	adc	r14, r24
 180:	f9 1e       	adc	r15, r25
 182:	2e 2f       	mov	r18, r30
 184:	30 e0       	ldi	r19, 0x00	; 0
 186:	ac e7       	ldi	r26, 0x7C	; 124
 188:	b0 e0       	ldi	r27, 0x00	; 0
 18a:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 18e:	c6 0e       	add	r12, r22
 190:	d7 1e       	adc	r13, r23
 192:	e8 1e       	adc	r14, r24
 194:	f9 1e       	adc	r15, r25
 196:	c7 01       	movw	r24, r14
 198:	b6 01       	movw	r22, r12
 19a:	20 e0       	ldi	r18, 0x00	; 0
 19c:	37 e0       	ldi	r19, 0x07	; 7
 19e:	40 e0       	ldi	r20, 0x00	; 0
 1a0:	50 e0       	ldi	r21, 0x00	; 0
 1a2:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 1a6:	12 2f       	mov	r17, r18
 1a8:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1ac:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1b0:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1b4:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1b8:	49 01       	movw	r8, r18
 1ba:	5a 01       	movw	r10, r20
 1bc:	88 1a       	sub	r8, r24
 1be:	99 0a       	sbc	r9, r25
 1c0:	aa 0a       	sbc	r10, r26
 1c2:	bb 0a       	sbc	r11, r27
 1c4:	61 e0       	ldi	r22, 0x01	; 1
 1c6:	71 e0       	ldi	r23, 0x01	; 1
 1c8:	c7 16       	cp	r12, r23
 1ca:	79 ef       	ldi	r23, 0xF9	; 249
 1cc:	d7 06       	cpc	r13, r23
 1ce:	7f ef       	ldi	r23, 0xFF	; 255
 1d0:	e7 06       	cpc	r14, r23
 1d2:	f7 06       	cpc	r15, r23
 1d4:	04 f0       	brlt	.+0      	; 0x1d6 <move_until(StopType)+0x1d6>
 1d6:	60 e0       	ldi	r22, 0x00	; 0
 1d8:	88 27       	eor	r24, r24
 1da:	b7 fd       	sbrc	r27, 7
 1dc:	83 95       	inc	r24
 1de:	99 27       	eor	r25, r25
 1e0:	aa 27       	eor	r26, r26
 1e2:	bb 27       	eor	r27, r27
 1e4:	69 01       	movw	r12, r18
 1e6:	7a 01       	movw	r14, r20
 1e8:	68 13       	cpse	r22, r24
 1ea:	00 c0       	rjmp	.+0      	; 0x1ec <move_until(StopType)+0x1ec>
 1ec:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1f0:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1f4:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1f8:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1fc:	c2 0e       	add	r12, r18
 1fe:	d3 1e       	adc	r13, r19
 200:	e4 1e       	adc	r14, r20
 202:	f5 1e       	adc	r15, r21
 204:	20 93 00 00 	sts	0x0000, r18	; 0x800000 <__SREG__+0x7fffc1>
 208:	30 93 00 00 	sts	0x0000, r19	; 0x800000 <__SREG__+0x7fffc1>
 20c:	40 93 00 00 	sts	0x0000, r20	; 0x800000 <__SREG__+0x7fffc1>
 210:	50 93 00 00 	sts	0x0000, r21	; 0x800000 <__SREG__+0x7fffc1>
 214:	c0 92 00 00 	sts	0x0000, r12	; 0x800000 <__SREG__+0x7fffc1>
 218:	d0 92 00 00 	sts	0x0000, r13	; 0x800000 <__SREG__+0x7fffc1>
 21c:	e0 92 00 00 	sts	0x0000, r14	; 0x800000 <__SREG__+0x7fffc1>
 220:	f0 92 00 00 	sts	0x0000, r15	; 0x800000 <__SREG__+0x7fffc1>
 224:	62 2f       	mov	r22, r18
 226:	22 0f       	add	r18, r18
 228:	77 0b       	sbc	r23, r23
 22a:	88 0b       	sbc	r24, r24
 22c:	99 0b       	sbc	r25, r25
 22e:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 232:	2d ec       	ldi	r18, 0xCD	; 205
 234:	3c ec       	ldi	r19, 0xCC	; 204
 236:	4c e4       	ldi	r20, 0x4C	; 76
 238:	5e e3       	ldi	r21, 0x3E	; 62
 23a:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 23e:	1b 01       	movw	r2, r22
 240:	2c 01       	movw	r4, r24
 242:	c7 01       	movw	r24, r14
 244:	b6 01       	movw	r22, r12
 246:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 24a:	2d ec       	ldi	r18, 0xCD	; 205
 24c:	3c ec       	ldi	r19, 0xCC	; 204
 24e:	4c ec       	ldi	r20, 0xCC	; 204
 250:	5d e3       	ldi	r21, 0x3D	; 61
 252:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 256:	9b 01       	movw	r18, r22
 258:	ac 01       	movw	r20, r24
 25a:	c2 01       	movw	r24, r4
 25c:	b1 01       	movw	r22, r2
 25e:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 262:	6b 01       	movw	r12, r22
 264:	7c 01       	movw	r14, r24
 266:	c5 01       	movw	r24, r10
 268:	b4 01       	movw	r22, r8
 26a:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 26e:	9b 01       	movw	r18, r22
 270:	ac 01       	movw	r20, r24
 272:	c7 01       	movw	r24, r14
 274:	b6 01       	movw	r22, r12
 276:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 27a:	6b 01       	movw	r12, r22
 27c:	7c 01       	movw	r14, r24
 27e:	20 e0       	ldi	r18, 0x00	; 0
 280:	30 e0       	ldi	r19, 0x00	; 0
 282:	40 e0       	ldi	r20, 0x00	; 0
 284:	53 ec       	ldi	r21, 0xC3	; 195
 286:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 28a:	87 fd       	sbrc	r24, 7
 28c:	00 c0       	rjmp	.+0      	; 0x28e <move_until(StopType)+0x28e>
 28e:	20 e0       	ldi	r18, 0x00	; 0
 290:	30 e0       	ldi	r19, 0x00	; 0
 292:	4e ef       	ldi	r20, 0xFE	; 254
 294:	52 e4       	ldi	r21, 0x42	; 66
 296:	c7 01       	movw	r24, r14
 298:	b6 01       	movw	r22, r12
 29a:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 29e:	18 16       	cp	r1, r24
 2a0:	04 f4       	brge	.+0      	; 0x2a2 <move_until(StopType)+0x2a2>
 2a2:	00 c0       	rjmp	.+0      	; 0x2a4 <move_until(StopType)+0x2a4>
 2a4:	c7 01       	movw	r24, r14
 2a6:	b6 01       	movw	r22, r12
 2a8:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 2ac:	17 fd       	sbrc	r17, 7
 2ae:	00 c0       	rjmp	.+0      	; 0x2b0 <move_until(StopType)+0x2b0>
 2b0:	6b 35       	cpi	r22, 0x5B	; 91
 2b2:	00 f0       	brcs	.+0      	; 0x2b4 <move_until(StopType)+0x2b4>
 2b4:	6a e5       	ldi	r22, 0x5A	; 90
 2b6:	0a e5       	ldi	r16, 0x5A	; 90
 2b8:	06 0f       	add	r16, r22
 2ba:	00 95       	com	r16
 2bc:	1a e5       	ldi	r17, 0x5A	; 90
 2be:	16 1b       	sub	r17, r22
 2c0:	10 95       	com	r17
 2c2:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 2c6:	81 30       	cpi	r24, 0x01	; 1
 2c8:	01 f0       	breq	.+0      	; 0x2ca <move_until(StopType)+0x2ca>
 2ca:	8f ef       	ldi	r24, 0xFF	; 255
 2cc:	88 bd       	out	0x28, r24	; 40
 2ce:	70 92 8b 00 	sts	0x008B, r7	; 0x80008b <__SREG__+0x80004c>
 2d2:	60 92 8a 00 	sts	0x008A, r6	; 0x80008a <__SREG__+0x80004b>
 2d6:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 2da:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 2de:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 2e2:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 2e6:	00 c0       	rjmp	.+0      	; 0x2e8 <move_until(StopType)+0x2e8>
 2e8:	6c 01       	movw	r12, r24
 2ea:	7d 01       	movw	r14, r26
 2ec:	61 e0       	ldi	r22, 0x01	; 1
 2ee:	70 e0       	ldi	r23, 0x00	; 0
 2f0:	80 e0       	ldi	r24, 0x00	; 0
 2f2:	90 e0       	ldi	r25, 0x00	; 0
 2f4:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 2f8:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 2fc:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 300:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 304:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 308:	8c 15       	cp	r24, r12
 30a:	9d 05       	cpc	r25, r13
 30c:	ae 05       	cpc	r26, r14
 30e:	bf 05       	cpc	r27, r15
 310:	01 f4       	brne	.+0      	; 0x312 <move_until(StopType)+0x312>
 312:	91 e0       	ldi	r25, 0x01	; 1
 314:	90 93 00 00 	sts	0x0000, r25	; 0x800000 <__SREG__+0x7fffc1>
 318:	18 bd       	out	0x28, r17	; 40
 31a:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 31e:	81 30       	cpi	r24, 0x01	; 1
 320:	01 f0       	breq	.+0      	; 0x322 <move_until(StopType)+0x322>
 322:	2f ef       	ldi	r18, 0xFF	; 255
 324:	27 bd       	out	0x27, r18	; 39
 326:	70 92 89 00 	sts	0x0089, r7	; 0x800089 <__SREG__+0x80004a>
 32a:	60 92 88 00 	sts	0x0088, r6	; 0x800088 <__SREG__+0x800049>
 32e:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 332:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 336:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 33a:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 33e:	00 c0       	rjmp	.+0      	; 0x340 <move_until(StopType)+0x340>
 340:	6c 01       	movw	r12, r24
 342:	7d 01       	movw	r14, r26
 344:	61 e0       	ldi	r22, 0x01	; 1
 346:	70 e0       	ldi	r23, 0x00	; 0
 348:	80 e0       	ldi	r24, 0x00	; 0
 34a:	90 e0       	ldi	r25, 0x00	; 0
 34c:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 350:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 354:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 358:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 35c:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 360:	8c 15       	cp	r24, r12
 362:	9d 05       	cpc	r25, r13
 364:	ae 05       	cpc	r26, r14
 366:	bf 05       	cpc	r27, r15
 368:	01 f4       	brne	.+0      	; 0x36a <move_until(StopType)+0x36a>
 36a:	31 e0       	ldi	r19, 0x01	; 1
 36c:	30 93 00 00 	sts	0x0000, r19	; 0x800000 <__SREG__+0x7fffc1>
 370:	07 bd       	out	0x27, r16	; 39
 372:	8e e1       	ldi	r24, 0x1E	; 30
 374:	e8 2e       	mov	r14, r24
 376:	01 e0       	ldi	r16, 0x01	; 1
 378:	29 81       	ldd	r18, Y+1	; 0x01
 37a:	3a 81       	ldd	r19, Y+2	; 0x02
 37c:	4b 81       	ldd	r20, Y+3	; 0x03
 37e:	5c 81       	ldd	r21, Y+4	; 0x04
 380:	6d 81       	ldd	r22, Y+5	; 0x05
 382:	7e 81       	ldd	r23, Y+6	; 0x06
 384:	8f 81       	ldd	r24, Y+7	; 0x07
 386:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 38a:	88 23       	and	r24, r24
 38c:	01 f4       	brne	.+0      	; 0x38e <move_until(StopType)+0x38e>
 38e:	00 c0       	rjmp	.+0      	; 0x390 <move_until(StopType)+0x390>
 390:	8f ef       	ldi	r24, 0xFF	; 255
 392:	88 bd       	out	0x28, r24	; 40
 394:	8f ef       	ldi	r24, 0xFF	; 255
 396:	90 e0       	ldi	r25, 0x00	; 0
 398:	90 93 8b 00 	sts	0x008B, r25	; 0x80008b <__SREG__+0x80004c>
 39c:	80 93 8a 00 	sts	0x008A, r24	; 0x80008a <__SREG__+0x80004b>
 3a0:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3a4:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3a8:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3ac:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3b0:	00 c0       	rjmp	.+0      	; 0x3b2 <move_until(StopType)+0x3b2>
 3b2:	6c 01       	movw	r12, r24
 3b4:	7d 01       	movw	r14, r26
 3b6:	61 e0       	ldi	r22, 0x01	; 1
 3b8:	70 e0       	ldi	r23, 0x00	; 0
 3ba:	80 e0       	ldi	r24, 0x00	; 0
 3bc:	90 e0       	ldi	r25, 0x00	; 0
 3be:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 3c2:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3c6:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3ca:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3ce:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3d2:	8c 15       	cp	r24, r12
 3d4:	9d 05       	cpc	r25, r13
 3d6:	ae 05       	cpc	r26, r14
 3d8:	bf 05       	cpc	r27, r15
 3da:	01 f4       	brne	.+0      	; 0x3dc <move_until(StopType)+0x3dc>
 3dc:	8f ef       	ldi	r24, 0xFF	; 255
 3de:	87 bd       	out	0x27, r24	; 39
 3e0:	8f ef       	ldi	r24, 0xFF	; 255
 3e2:	90 e0       	ldi	r25, 0x00	; 0
 3e4:	90 93 89 00 	sts	0x0089, r25	; 0x800089 <__SREG__+0x80004a>
 3e8:	80 93 88 00 	sts	0x0088, r24	; 0x800088 <__SREG__+0x800049>
 3ec:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3f0:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3f4:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3f8:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 3fc:	00 c0       	rjmp	.+0      	; 0x3fe <move_until(StopType)+0x3fe>
 3fe:	6c 01       	movw	r12, r24
 400:	7d 01       	movw	r14, r26
 402:	61 e0       	ldi	r22, 0x01	; 1
 404:	70 e0       	ldi	r23, 0x00	; 0
 406:	80 e0       	ldi	r24, 0x00	; 0
 408:	90 e0       	ldi	r25, 0x00	; 0
 40a:	0e 94 00 00 	call	0	; 0x0 <move_until(StopType)>
 40e:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 412:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 416:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 41a:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 41e:	8c 15       	cp	r24, r12
 420:	9d 05       	cpc	r25, r13
 422:	ae 05       	cpc	r26, r14
 424:	bf 05       	cpc	r27, r15
 426:	01 f4       	brne	.+0      	; 0x428 <move_until(StopType)+0x428>
 428:	a2 96       	adiw	r28, 0x22	; 34
 42a:	0f b6       	in	r0, 0x3f	; 63
 42c:	f8 94       	cli
 42e:	de bf       	out	0x3e, r29	; 62
 430:	0f be       	out	0x3f, r0	; 63
 432:	cd bf       	out	0x3d, r28	; 61
 434:	df 91       	pop	r29
 436:	cf 91       	pop	r28
 438:	1f 91       	pop	r17
 43a:	0f 91       	pop	r16
 43c:	ff 90       	pop	r15
 43e:	ef 90       	pop	r14
 440:	df 90       	pop	r13
 442:	cf 90       	pop	r12
 444:	bf 90       	pop	r11
 446:	af 90       	pop	r10
 448:	9f 90       	pop	r9
 44a:	8f 90       	pop	r8
 44c:	7f 90       	pop	r7
 44e:	6f 90       	pop	r6
 450:	5f 90       	pop	r5
 452:	4f 90       	pop	r4
 454:	3f 90       	pop	r3
 456:	2f 90       	pop	r2
 458:	08 95       	ret
 45a:	88 89       	ldd	r24, Y+16	; 0x10
 45c:	88 23       	and	r24, r24
 45e:	01 f4       	brne	.+0      	; 0x460 <move_until(StopType)+0x460>
 460:	00 c0       	rjmp	.+0      	; 0x462 <move_until(StopType)+0x462>
 462:	18 8a       	std	Y+16, r1	; 0x10
 464:	00 c0       	rjmp	.+0      	; 0x466 <move_until(StopType)+0x466>
 466:	17 fd       	sbrc	r17, 7
 468:	00 c0       	rjmp	.+0      	; 0x46a <move_until(StopType)+0x46a>
 46a:	1f ef       	ldi	r17, 0xFF	; 255
 46c:	0b e4       	ldi	r16, 0x4B	; 75
 46e:	00 c0       	rjmp	.+0      	; 0x470 <move_until(StopType)+0x470>
 470:	1b e4       	ldi	r17, 0x4B	; 75
 472:	0f ef       	ldi	r16, 0xFF	; 255
 474:	00 c0       	rjmp	.+0      	; 0x476 <move_until(StopType)+0x476>
 476:	61 95       	neg	r22
 478:	6b 35       	cpi	r22, 0x5B	; 91
 47a:	00 f4       	brcc	.+0      	; 0x47c <move_until(StopType)+0x47c>
 47c:	0a e5       	ldi	r16, 0x5A	; 90
 47e:	06 1b       	sub	r16, r22
 480:	00 95       	com	r16
 482:	66 5a       	subi	r22, 0xA6	; 166
 484:	16 2f       	mov	r17, r22
 486:	10 95       	com	r17
 488:	00 c0       	rjmp	.+0      	; 0x48a <move_until(StopType)+0x48a>
 48a:	6a e5       	ldi	r22, 0x5A	; 90
 48c:	0a e5       	ldi	r16, 0x5A	; 90
 48e:	06 1b       	sub	r16, r22
 490:	00 95       	com	r16
 492:	66 5a       	subi	r22, 0xA6	; 166
 494:	16 2f       	mov	r17, r22
 496:	10 95       	com	r17
 498:	00 c0       	rjmp	.+0      	; 0x49a <__SREG__+0x45b>

Disassembly of section .text._Z13move_absolutej:

00000000 <move_absolute(unsigned int)>:
   0:	4f 92       	push	r4
   2:	5f 92       	push	r5
   4:	6f 92       	push	r6
   6:	7f 92       	push	r7
   8:	8f 92       	push	r8
   a:	9f 92       	push	r9
   c:	af 92       	push	r10
   e:	bf 92       	push	r11
  10:	cf 92       	push	r12
  12:	df 92       	push	r13
  14:	ef 92       	push	r14
  16:	ff 92       	push	r15
  18:	1f 93       	push	r17
  1a:	cf 93       	push	r28
  1c:	df 93       	push	r29
  1e:	40 90 00 00 	lds	r4, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  22:	50 90 00 00 	lds	r5, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  26:	60 90 00 00 	lds	r6, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  2a:	70 90 00 00 	lds	r7, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  2e:	4c 01       	movw	r8, r24
  30:	b1 2c       	mov	r11, r1
  32:	a1 2c       	mov	r10, r1
  34:	48 0c       	add	r4, r8
  36:	59 1c       	adc	r5, r9
  38:	6a 1c       	adc	r6, r10
  3a:	7b 1c       	adc	r7, r11
  3c:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  40:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  44:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  48:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  4c:	88 0e       	add	r8, r24
  4e:	99 1e       	adc	r9, r25
  50:	aa 1e       	adc	r10, r26
  52:	bb 1e       	adc	r11, r27
  54:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  58:	81 30       	cpi	r24, 0x01	; 1
  5a:	01 f0       	breq	.+0      	; 0x5c <move_absolute(unsigned int)+0x5c>
  5c:	8f ef       	ldi	r24, 0xFF	; 255
  5e:	88 bd       	out	0x28, r24	; 40
  60:	8f ef       	ldi	r24, 0xFF	; 255
  62:	90 e0       	ldi	r25, 0x00	; 0
  64:	90 93 8b 00 	sts	0x008B, r25	; 0x80008b <__SREG__+0x80004c>
  68:	80 93 8a 00 	sts	0x008A, r24	; 0x80008a <__SREG__+0x80004b>
  6c:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  70:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  74:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  78:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  7c:	00 c0       	rjmp	.+0      	; 0x7e <move_absolute(unsigned int)+0x7e>
  7e:	6c 01       	movw	r12, r24
  80:	7d 01       	movw	r14, r26
  82:	61 e0       	ldi	r22, 0x01	; 1
  84:	70 e0       	ldi	r23, 0x00	; 0
  86:	80 e0       	ldi	r24, 0x00	; 0
  88:	90 e0       	ldi	r25, 0x00	; 0
  8a:	0e 94 00 00 	call	0	; 0x0 <move_absolute(unsigned int)>
  8e:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  92:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  96:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  9a:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  9e:	8c 15       	cp	r24, r12
  a0:	9d 05       	cpc	r25, r13
  a2:	ae 05       	cpc	r26, r14
  a4:	bf 05       	cpc	r27, r15
  a6:	01 f4       	brne	.+0      	; 0xa8 <move_absolute(unsigned int)+0xa8>
  a8:	81 e0       	ldi	r24, 0x01	; 1
  aa:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
  ae:	85 ea       	ldi	r24, 0xA5	; 165
  b0:	88 bd       	out	0x28, r24	; 40
  b2:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  b6:	81 30       	cpi	r24, 0x01	; 1
  b8:	01 f0       	breq	.+0      	; 0xba <move_absolute(unsigned int)+0xba>
  ba:	8f ef       	ldi	r24, 0xFF	; 255
  bc:	87 bd       	out	0x27, r24	; 39
  be:	8f ef       	ldi	r24, 0xFF	; 255
  c0:	90 e0       	ldi	r25, 0x00	; 0
  c2:	90 93 89 00 	sts	0x0089, r25	; 0x800089 <__SREG__+0x80004a>
  c6:	80 93 88 00 	sts	0x0088, r24	; 0x800088 <__SREG__+0x800049>
  ca:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  ce:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  d2:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  d6:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  da:	00 c0       	rjmp	.+0      	; 0xdc <move_absolute(unsigned int)+0xdc>
  dc:	6c 01       	movw	r12, r24
  de:	7d 01       	movw	r14, r26
  e0:	61 e0       	ldi	r22, 0x01	; 1
  e2:	70 e0       	ldi	r23, 0x00	; 0
  e4:	80 e0       	ldi	r24, 0x00	; 0
  e6:	90 e0       	ldi	r25, 0x00	; 0
  e8:	0e 94 00 00 	call	0	; 0x0 <move_absolute(unsigned int)>
  ec:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  f0:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  f4:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  f8:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
  fc:	8c 15       	cp	r24, r12
  fe:	9d 05       	cpc	r25, r13
 100:	ae 05       	cpc	r26, r14
 102:	bf 05       	cpc	r27, r15
 104:	01 f4       	brne	.+0      	; 0x106 <move_absolute(unsigned int)+0x106>
 106:	81 e0       	ldi	r24, 0x01	; 1
 108:	80 93 00 00 	sts	0x0000, r24	; 0x800000 <__SREG__+0x7fffc1>
 10c:	85 ea       	ldi	r24, 0xA5	; 165
 10e:	87 bd       	out	0x27, r24	; 39
 110:	1f ef       	ldi	r17, 0xFF	; 255
 112:	cf ef       	ldi	r28, 0xFF	; 255
 114:	d0 e0       	ldi	r29, 0x00	; 0
 116:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 11a:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 11e:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 122:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 126:	84 15       	cp	r24, r4
 128:	95 05       	cpc	r25, r5
 12a:	a6 05       	cpc	r26, r6
 12c:	b7 05       	cpc	r27, r7
 12e:	04 f4       	brge	.+0      	; 0x130 <move_absolute(unsigned int)+0x130>
 130:	00 c0       	rjmp	.+0      	; 0x132 <move_absolute(unsigned int)+0x132>
 132:	18 bd       	out	0x28, r17	; 40
 134:	d0 93 8b 00 	sts	0x008B, r29	; 0x80008b <__SREG__+0x80004c>
 138:	c0 93 8a 00 	sts	0x008A, r28	; 0x80008a <__SREG__+0x80004b>
 13c:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 140:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 144:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 148:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 14c:	00 c0       	rjmp	.+0      	; 0x14e <move_absolute(unsigned int)+0x14e>
 14e:	6c 01       	movw	r12, r24
 150:	7d 01       	movw	r14, r26
 152:	61 e0       	ldi	r22, 0x01	; 1
 154:	70 e0       	ldi	r23, 0x00	; 0
 156:	80 e0       	ldi	r24, 0x00	; 0
 158:	90 e0       	ldi	r25, 0x00	; 0
 15a:	0e 94 00 00 	call	0	; 0x0 <move_absolute(unsigned int)>
 15e:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 162:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 166:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 16a:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 16e:	8c 15       	cp	r24, r12
 170:	9d 05       	cpc	r25, r13
 172:	ae 05       	cpc	r26, r14
 174:	bf 05       	cpc	r27, r15
 176:	01 f4       	brne	.+0      	; 0x178 <move_absolute(unsigned int)+0x178>
 178:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 17c:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 180:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 184:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 188:	88 15       	cp	r24, r8
 18a:	99 05       	cpc	r25, r9
 18c:	aa 05       	cpc	r26, r10
 18e:	bb 05       	cpc	r27, r11
 190:	04 f0       	brlt	.+0      	; 0x192 <move_absolute(unsigned int)+0x192>
 192:	8f ef       	ldi	r24, 0xFF	; 255
 194:	87 bd       	out	0x27, r24	; 39
 196:	8f ef       	ldi	r24, 0xFF	; 255
 198:	90 e0       	ldi	r25, 0x00	; 0
 19a:	90 93 89 00 	sts	0x0089, r25	; 0x800089 <__SREG__+0x80004a>
 19e:	80 93 88 00 	sts	0x0088, r24	; 0x800088 <__SREG__+0x800049>
 1a2:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1a6:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1aa:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1ae:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1b2:	00 c0       	rjmp	.+0      	; 0x1b4 <move_absolute(unsigned int)+0x1b4>
 1b4:	6c 01       	movw	r12, r24
 1b6:	7d 01       	movw	r14, r26
 1b8:	61 e0       	ldi	r22, 0x01	; 1
 1ba:	70 e0       	ldi	r23, 0x00	; 0
 1bc:	80 e0       	ldi	r24, 0x00	; 0
 1be:	90 e0       	ldi	r25, 0x00	; 0
 1c0:	0e 94 00 00 	call	0	; 0x0 <move_absolute(unsigned int)>
 1c4:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1c8:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1cc:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1d0:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 1d4:	8c 15       	cp	r24, r12
 1d6:	9d 05       	cpc	r25, r13
 1d8:	ae 05       	cpc	r26, r14
 1da:	bf 05       	cpc	r27, r15
 1dc:	01 f4       	brne	.+0      	; 0x1de <move_absolute(unsigned int)+0x1de>
 1de:	df 91       	pop	r29
 1e0:	cf 91       	pop	r28
 1e2:	1f 91       	pop	r17
 1e4:	ff 90       	pop	r15
 1e6:	ef 90       	pop	r14
 1e8:	df 90       	pop	r13
 1ea:	cf 90       	pop	r12
 1ec:	bf 90       	pop	r11
 1ee:	af 90       	pop	r10
 1f0:	9f 90       	pop	r9
 1f2:	8f 90       	pop	r8
 1f4:	7f 90       	pop	r7
 1f6:	6f 90       	pop	r6
 1f8:	5f 90       	pop	r5
 1fa:	4f 90       	pop	r4
 1fc:	08 95       	ret
 1fe:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 202:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 206:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 20a:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 20e:	88 15       	cp	r24, r8
 210:	99 05       	cpc	r25, r9
 212:	aa 05       	cpc	r26, r10
 214:	bb 05       	cpc	r27, r11
 216:	04 f4       	brge	.+0      	; 0x218 <move_absolute(unsigned int)+0x218>
 218:	00 c0       	rjmp	.+0      	; 0x21a <move_absolute(unsigned int)+0x21a>
 21a:	17 bd       	out	0x27, r17	; 39
 21c:	d0 93 89 00 	sts	0x0089, r29	; 0x800089 <__SREG__+0x80004a>
 220:	c0 93 88 00 	sts	0x0088, r28	; 0x800088 <__SREG__+0x800049>
 224:	c0 90 00 00 	lds	r12, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 228:	d0 90 00 00 	lds	r13, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 22c:	e0 90 00 00 	lds	r14, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 230:	f0 90 00 00 	lds	r15, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 234:	00 c0       	rjmp	.+0      	; 0x236 <move_absolute(unsigned int)+0x236>
 236:	6c 01       	movw	r12, r24
 238:	7d 01       	movw	r14, r26
 23a:	61 e0       	ldi	r22, 0x01	; 1
 23c:	70 e0       	ldi	r23, 0x00	; 0
 23e:	80 e0       	ldi	r24, 0x00	; 0
 240:	90 e0       	ldi	r25, 0x00	; 0
 242:	0e 94 00 00 	call	0	; 0x0 <move_absolute(unsigned int)>
 246:	80 91 00 00 	lds	r24, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 24a:	90 91 00 00 	lds	r25, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 24e:	a0 91 00 00 	lds	r26, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 252:	b0 91 00 00 	lds	r27, 0x0000	; 0x800000 <__SREG__+0x7fffc1>
 256:	8c 15       	cp	r24, r12
 258:	9d 05       	cpc	r25, r13
 25a:	ae 05       	cpc	r26, r14
 25c:	bf 05       	cpc	r27, r15
 25e:	01 f4       	brne	.+0      	; 0x260 <move_absolute(unsigned int)+0x260>
 260:	00 c0       	rjmp	.+0      	; 0x262 <__SREG__+0x223>

Disassembly of section .text.startup.main:

00000000 <main>:
   0:	cd b7       	in	r28, 0x3d	; 61
   2:	de b7       	in	r29, 0x3e	; 62
   4:	6b 97       	sbiw	r28, 0x1b	; 27
   6:	0f b6       	in	r0, 0x3f	; 63
   8:	f8 94       	cli
   a:	de bf       	out	0x3e, r29	; 62
   c:	0f be       	out	0x3f, r0	; 63
   e:	cd bf       	out	0x3d, r28	; 61
  10:	0e 94 00 00 	call	0	; 0x0 <main>
  14:	0e 94 00 00 	call	0	; 0x0 <main>
  18:	ce 01       	movw	r24, r28
  1a:	09 96       	adiw	r24, 0x09	; 9
  1c:	99 8f       	std	Y+25, r25	; 0x19
  1e:	88 8f       	std	Y+24, r24	; 0x18
  20:	08 97       	sbiw	r24, 0x08	; 8
  22:	7c 01       	movw	r14, r24
  24:	48 8c       	ldd	r4, Y+24	; 0x18
  26:	4a 8e       	std	Y+26, r4	; 0x1a
  28:	59 8c       	ldd	r5, Y+25	; 0x19
  2a:	5b 8e       	std	Y+27, r5	; 0x1b
  2c:	f0 e0       	ldi	r31, 0x00	; 0
  2e:	cf 2e       	mov	r12, r31
  30:	f0 e0       	ldi	r31, 0x00	; 0
  32:	df 2e       	mov	r13, r31
  34:	a4 e0       	ldi	r26, 0x04	; 4
  36:	ba 2e       	mov	r11, r26
  38:	00 c0       	rjmp	.+0      	; 0x3a <main+0x3a>
  3a:	87 e0       	ldi	r24, 0x07	; 7
  3c:	ea 8d       	ldd	r30, Y+26	; 0x1a
  3e:	fb 8d       	ldd	r31, Y+27	; 0x1b
  40:	de 01       	movw	r26, r28
  42:	51 96       	adiw	r26, 0x11	; 17
  44:	01 90       	ld	r0, Z+
  46:	0d 92       	st	X+, r0
  48:	8a 95       	dec	r24
  4a:	01 f4       	brne	.+0      	; 0x4c <main+0x4c>
  4c:	87 e0       	ldi	r24, 0x07	; 7
  4e:	fe 01       	movw	r30, r28
  50:	71 96       	adiw	r30, 0x11	; 17
  52:	d7 01       	movw	r26, r14
  54:	01 90       	ld	r0, Z+
  56:	0d 92       	st	X+, r0
  58:	8a 95       	dec	r24
  5a:	01 f4       	brne	.+0      	; 0x5c <main+0x5c>
  5c:	49 80       	ldd	r4, Y+1	; 0x01
  5e:	aa 80       	ldd	r10, Y+2	; 0x02
  60:	7b 80       	ldd	r7, Y+3	; 0x03
  62:	6c 80       	ldd	r6, Y+4	; 0x04
  64:	0d 81       	ldd	r16, Y+5	; 0x05
  66:	8e 80       	ldd	r8, Y+6	; 0x06
  68:	9f 80       	ldd	r9, Y+7	; 0x07
  6a:	10 e0       	ldi	r17, 0x00	; 0
  6c:	13 30       	cpi	r17, 0x03	; 3
  6e:	01 f4       	brne	.+0      	; 0x70 <main+0x70>
  70:	00 c0       	rjmp	.+0      	; 0x72 <main+0x72>
  72:	14 30       	cpi	r17, 0x04	; 4
  74:	00 f4       	brcc	.+0      	; 0x76 <main+0x76>
  76:	00 c0       	rjmp	.+0      	; 0x78 <main+0x78>
  78:	15 30       	cpi	r17, 0x05	; 5
  7a:	01 f4       	brne	.+0      	; 0x7c <main+0x7c>
  7c:	00 c0       	rjmp	.+0      	; 0x7e <main+0x7e>
  7e:	00 f4       	brcc	.+0      	; 0x80 <main+0x80>
  80:	00 c0       	rjmp	.+0      	; 0x82 <main+0x82>
  82:	16 30       	cpi	r17, 0x06	; 6
  84:	01 f0       	breq	.+0      	; 0x86 <main+0x86>
  86:	00 c0       	rjmp	.+0      	; 0x88 <main+0x88>
  88:	1f 92       	push	r1
  8a:	9f 92       	push	r9
  8c:	df 92       	push	r13
  8e:	cf 92       	push	r12
  90:	1f 92       	push	r1
  92:	bf 92       	push	r11
  94:	ff 92       	push	r15
  96:	ef 92       	push	r14
  98:	0e 94 00 00 	call	0	; 0x0 <main>
  9c:	b7 01       	movw	r22, r14
  9e:	80 e0       	ldi	r24, 0x00	; 0
  a0:	90 e0       	ldi	r25, 0x00	; 0
  a2:	0e 94 00 00 	call	0	; 0x0 <main>
  a6:	60 e2       	ldi	r22, 0x20	; 32
  a8:	80 e0       	ldi	r24, 0x00	; 0
  aa:	90 e0       	ldi	r25, 0x00	; 0
  ac:	0e 94 00 00 	call	0	; 0x0 <main>
  b0:	0f b6       	in	r0, 0x3f	; 63
  b2:	f8 94       	cli
  b4:	de bf       	out	0x3e, r29	; 62
  b6:	0f be       	out	0x3f, r0	; 63
  b8:	cd bf       	out	0x3d, r28	; 61
  ba:	6a e3       	ldi	r22, 0x3A	; 58
  bc:	80 e0       	ldi	r24, 0x00	; 0
  be:	90 e0       	ldi	r25, 0x00	; 0
  c0:	0e 94 00 00 	call	0	; 0x0 <main>
  c4:	a4 2d       	mov	r26, r4
  c6:	b0 e0       	ldi	r27, 0x00	; 0
  c8:	20 e8       	ldi	r18, 0x80	; 128
  ca:	3f ef       	ldi	r19, 0xFF	; 255
  cc:	4f ef       	ldi	r20, 0xFF	; 255
  ce:	5f ef       	ldi	r21, 0xFF	; 255
  d0:	0e 94 00 00 	call	0	; 0x0 <main>
  d4:	1b 01       	movw	r2, r22
  d6:	2c 01       	movw	r4, r24
  d8:	aa 2d       	mov	r26, r10
  da:	b0 e0       	ldi	r27, 0x00	; 0
  dc:	2a ea       	ldi	r18, 0xAA	; 170
  de:	3f ef       	ldi	r19, 0xFF	; 255
  e0:	4f ef       	ldi	r20, 0xFF	; 255
  e2:	5f ef       	ldi	r21, 0xFF	; 255
  e4:	0e 94 00 00 	call	0	; 0x0 <main>
  e8:	26 0e       	add	r2, r22
  ea:	37 1e       	adc	r3, r23
  ec:	48 1e       	adc	r4, r24
  ee:	59 1e       	adc	r5, r25
  f0:	a7 2d       	mov	r26, r7
  f2:	b0 e0       	ldi	r27, 0x00	; 0
  f4:	24 ed       	ldi	r18, 0xD4	; 212
  f6:	3f ef       	ldi	r19, 0xFF	; 255
  f8:	4f ef       	ldi	r20, 0xFF	; 255
  fa:	5f ef       	ldi	r21, 0xFF	; 255
  fc:	0e 94 00 00 	call	0	; 0x0 <main>
 100:	ab 01       	movw	r20, r22
 102:	bc 01       	movw	r22, r24
 104:	42 0d       	add	r20, r2
 106:	53 1d       	adc	r21, r3
 108:	64 1d       	adc	r22, r4
 10a:	75 1d       	adc	r23, r5
 10c:	86 2d       	mov	r24, r6
 10e:	90 e0       	ldi	r25, 0x00	; 0
 110:	b0 e0       	ldi	r27, 0x00	; 0
 112:	a0 e0       	ldi	r26, 0x00	; 0
 114:	41 2c       	mov	r4, r1
 116:	51 2c       	mov	r5, r1
 118:	32 01       	movw	r6, r4
 11a:	48 1a       	sub	r4, r24
 11c:	59 0a       	sbc	r5, r25
 11e:	6a 0a       	sbc	r6, r26
 120:	7b 0a       	sbc	r7, r27
 122:	d3 01       	movw	r26, r6
 124:	c2 01       	movw	r24, r4
 126:	88 0f       	add	r24, r24
 128:	99 1f       	adc	r25, r25
 12a:	aa 1f       	adc	r26, r26
 12c:	bb 1f       	adc	r27, r27
 12e:	2a 01       	movw	r4, r20
 130:	3b 01       	movw	r6, r22
 132:	48 0e       	add	r4, r24
 134:	59 1e       	adc	r5, r25
 136:	6a 1e       	adc	r6, r26
 138:	7b 1e       	adc	r7, r27
 13a:	10 e0       	ldi	r17, 0x00	; 0
 13c:	30 e0       	ldi	r19, 0x00	; 0
 13e:	20 e0       	ldi	r18, 0x00	; 0
 140:	c9 01       	movw	r24, r18
 142:	b8 01       	movw	r22, r16
 144:	66 0f       	add	r22, r22
 146:	77 1f       	adc	r23, r23
 148:	88 1f       	adc	r24, r24
 14a:	99 1f       	adc	r25, r25
 14c:	66 0f       	add	r22, r22
 14e:	77 1f       	adc	r23, r23
 150:	88 1f       	adc	r24, r24
 152:	99 1f       	adc	r25, r25
 154:	60 0f       	add	r22, r16
 156:	71 1f       	adc	r23, r17
 158:	82 1f       	adc	r24, r18
 15a:	93 1f       	adc	r25, r19
 15c:	66 0f       	add	r22, r22
 15e:	77 1f       	adc	r23, r23
 160:	88 1f       	adc	r24, r24
 162:	99 1f       	adc	r25, r25
 164:	66 0f       	add	r22, r22
 166:	77 1f       	adc	r23, r23
 168:	88 1f       	adc	r24, r24
 16a:	99 1f       	adc	r25, r25
 16c:	66 0f       	add	r22, r22
 16e:	77 1f       	adc	r23, r23
 170:	88 1f       	adc	r24, r24
 172:	99 1f       	adc	r25, r25
 174:	46 0e       	add	r4, r22
 176:	57 1e       	adc	r5, r23
 178:	68 1e       	adc	r6, r24
 17a:	79 1e       	adc	r7, r25
 17c:	28 2d       	mov	r18, r8
 17e:	30 e0       	ldi	r19, 0x00	; 0
 180:	a2 e5       	ldi	r26, 0x52	; 82
 182:	b0 e0       	ldi	r27, 0x00	; 0
 184:	0e 94 00 00 	call	0	; 0x0 <main>
 188:	46 0e       	add	r4, r22
 18a:	57 1e       	adc	r5, r23
 18c:	68 1e       	adc	r6, r24
 18e:	79 1e       	adc	r7, r25
 190:	29 2d       	mov	r18, r9
 192:	30 e0       	ldi	r19, 0x00	; 0
 194:	ac e7       	ldi	r26, 0x7C	; 124
 196:	b0 e0       	ldi	r27, 0x00	; 0
 198:	0e 94 00 00 	call	0	; 0x0 <main>
 19c:	64 0d       	add	r22, r4
 19e:	75 1d       	adc	r23, r5
 1a0:	86 1d       	adc	r24, r6
 1a2:	97 1d       	adc	r25, r7
 1a4:	20 e0       	ldi	r18, 0x00	; 0
 1a6:	37 e0       	ldi	r19, 0x07	; 7
 1a8:	40 e0       	ldi	r20, 0x00	; 0
 1aa:	50 e0       	ldi	r21, 0x00	; 0
 1ac:	0e 94 00 00 	call	0	; 0x0 <main>
 1b0:	b9 01       	movw	r22, r18
 1b2:	4a e0       	ldi	r20, 0x0A	; 10
 1b4:	50 e0       	ldi	r21, 0x00	; 0
 1b6:	80 e0       	ldi	r24, 0x00	; 0
 1b8:	90 e0       	ldi	r25, 0x00	; 0
 1ba:	0e 94 00 00 	call	0	; 0x0 <main>
 1be:	60 e0       	ldi	r22, 0x00	; 0
 1c0:	70 e0       	ldi	r23, 0x00	; 0
 1c2:	80 e0       	ldi	r24, 0x00	; 0
 1c4:	90 e0       	ldi	r25, 0x00	; 0
 1c6:	0e 94 00 00 	call	0	; 0x0 <main>
 1ca:	ce 01       	movw	r24, r28
 1cc:	09 96       	adiw	r24, 0x09	; 9
 1ce:	0e 94 00 00 	call	0	; 0x0 <main>
 1d2:	88 89       	ldd	r24, Y+16	; 0x10
 1d4:	81 11       	cpse	r24, r1
 1d6:	00 c0       	rjmp	.+0      	; 0x1d8 <main+0x1d8>
 1d8:	c7 01       	movw	r24, r14
 1da:	0e 94 00 00 	call	0	; 0x0 <main>
 1de:	88 85       	ldd	r24, Y+8	; 0x08
 1e0:	81 11       	cpse	r24, r1
 1e2:	00 c0       	rjmp	.+0      	; 0x1e4 <main+0x1e4>
 1e4:	88 89       	ldd	r24, Y+16	; 0x10
 1e6:	88 23       	and	r24, r24
 1e8:	01 f0       	breq	.+0      	; 0x1ea <main+0x1ea>
 1ea:	18 8a       	std	Y+16, r1	; 0x10
 1ec:	00 c0       	rjmp	.+0      	; 0x1ee <main+0x1ee>
 1ee:	11 30       	cpi	r17, 0x01	; 1
 1f0:	01 f0       	breq	.+0      	; 0x1f2 <main+0x1f2>
 1f2:	87 2d       	mov	r24, r7
 1f4:	12 30       	cpi	r17, 0x02	; 2
 1f6:	01 f4       	brne	.+0      	; 0x1f8 <main+0x1f8>
 1f8:	1f 92       	push	r1
 1fa:	8f 93       	push	r24
 1fc:	df 92       	push	r13
 1fe:	cf 92       	push	r12
 200:	1f 92       	push	r1
 202:	bf 92       	push	r11
 204:	ff 92       	push	r15
 206:	ef 92       	push	r14
 208:	0e 94 00 00 	call	0	; 0x0 <main>
 20c:	b7 01       	movw	r22, r14
 20e:	80 e0       	ldi	r24, 0x00	; 0
 210:	90 e0       	ldi	r25, 0x00	; 0
 212:	0e 94 00 00 	call	0	; 0x0 <main>
 216:	60 e2       	ldi	r22, 0x20	; 32
 218:	80 e0       	ldi	r24, 0x00	; 0
 21a:	90 e0       	ldi	r25, 0x00	; 0
 21c:	0e 94 00 00 	call	0	; 0x0 <main>
 220:	0f b6       	in	r0, 0x3f	; 63
 222:	f8 94       	cli
 224:	de bf       	out	0x3e, r29	; 62
 226:	0f be       	out	0x3f, r0	; 63
 228:	cd bf       	out	0x3d, r28	; 61
 22a:	1f 5f       	subi	r17, 0xFF	; 255
 22c:	13 30       	cpi	r17, 0x03	; 3
 22e:	01 f0       	breq	.+0      	; 0x230 <main+0x230>
 230:	00 c0       	rjmp	.+0      	; 0x232 <main+0x232>
 232:	86 2d       	mov	r24, r6
 234:	00 c0       	rjmp	.+0      	; 0x236 <main+0x236>
 236:	8a 2d       	mov	r24, r10
 238:	00 c0       	rjmp	.+0      	; 0x23a <main+0x23a>
 23a:	80 2f       	mov	r24, r16
 23c:	00 c0       	rjmp	.+0      	; 0x23e <main+0x23e>
 23e:	88 2d       	mov	r24, r8
 240:	00 c0       	rjmp	.+0      	; 0x242 <main+0x242>
 242:	1f 92       	push	r1
 244:	4f 92       	push	r4
 246:	df 92       	push	r13
 248:	cf 92       	push	r12
 24a:	1f 92       	push	r1
 24c:	bf 92       	push	r11
 24e:	ff 92       	push	r15
 250:	ef 92       	push	r14
 252:	0e 94 00 00 	call	0	; 0x0 <main>
 256:	b7 01       	movw	r22, r14
 258:	80 e0       	ldi	r24, 0x00	; 0
 25a:	90 e0       	ldi	r25, 0x00	; 0
 25c:	0e 94 00 00 	call	0	; 0x0 <main>
 260:	60 e2       	ldi	r22, 0x20	; 32
 262:	80 e0       	ldi	r24, 0x00	; 0
 264:	90 e0       	ldi	r25, 0x00	; 0
 266:	0e 94 00 00 	call	0	; 0x0 <main>
 26a:	0f b6       	in	r0, 0x3f	; 63
 26c:	f8 94       	cli
 26e:	de bf       	out	0x3e, r29	; 62
 270:	0f be       	out	0x3f, r0	; 63
 272:	cd bf       	out	0x3d, r28	; 61
 274:	16 30       	cpi	r17, 0x06	; 6
 276:	01 f4       	brne	.+0      	; 0x278 <main+0x278>
 278:	00 c0       	rjmp	.+0      	; 0x27a <main+0x27a>
 27a:	1f 5f       	subi	r17, 0xFF	; 255
 27c:	00 c0       	rjmp	.+0      	; 0x27e <__SREG__+0x23f>
