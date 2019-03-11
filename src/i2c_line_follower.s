
i2c_line_follower.o:     file format elf32-avr


Disassembly of section .text._ZN3ino14initialize_i2cEv:

00000000 <ino::initialize_i2c()>:
   0:	61 e0       	ldi	r22, 0x01	; 1
   2:	82 e1       	ldi	r24, 0x12	; 18
   4:	0e 94 00 00 	call	0	; 0x0 <ino::initialize_i2c()>
   8:	61 e0       	ldi	r22, 0x01	; 1
   a:	83 e1       	ldi	r24, 0x13	; 19
   c:	0e 94 00 00 	call	0	; 0x0 <ino::initialize_i2c()>
  10:	e9 eb       	ldi	r30, 0xB9	; 185
  12:	f0 e0       	ldi	r31, 0x00	; 0
  14:	80 81       	ld	r24, Z
  16:	8e 7f       	andi	r24, 0xFE	; 254
  18:	80 83       	st	Z, r24
  1a:	80 81       	ld	r24, Z
  1c:	8d 7f       	andi	r24, 0xFD	; 253
  1e:	80 83       	st	Z, r24
  20:	8c e0       	ldi	r24, 0x0C	; 12
  22:	80 93 b8 00 	sts	0x00B8, r24	; 0x8000b8 <__SREG__+0x800079>
  26:	85 e4       	ldi	r24, 0x45	; 69
  28:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
  2c:	08 95       	ret

Disassembly of section .text._ZN3ino16read_line_sensorEv:

00000000 <ino::read_line_sensor()>:
   0:	cf 93       	push	r28
   2:	df 93       	push	r29
   4:	00 d0       	rcall	.+0      	; 0x6 <ino::read_line_sensor()+0x6>
   6:	cd b7       	in	r28, 0x3d	; 61
   8:	de b7       	in	r29, 0x3e	; 62
   a:	fc 01       	movw	r30, r24
   c:	84 ea       	ldi	r24, 0xA4	; 164
   e:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
  12:	90 91 bc 00 	lds	r25, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
  16:	97 ff       	sbrs	r25, 7
  18:	00 c0       	rjmp	.+0      	; 0x1a <ino::read_line_sensor()+0x1a>
  1a:	90 91 b9 00 	lds	r25, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
  1e:	98 7f       	andi	r25, 0xF8	; 248
  20:	90 31       	cpi	r25, 0x10	; 16
  22:	01 f0       	breq	.+0      	; 0x24 <ino::read_line_sensor()+0x24>
  24:	98 33       	cpi	r25, 0x38	; 56
  26:	01 f4       	brne	.+0      	; 0x28 <ino::read_line_sensor()+0x28>
  28:	00 c0       	rjmp	.+0      	; 0x2a <ino::read_line_sensor()+0x2a>
  2a:	98 30       	cpi	r25, 0x08	; 8
  2c:	01 f0       	breq	.+0      	; 0x2e <ino::read_line_sensor()+0x2e>
  2e:	10 82       	st	Z, r1
  30:	17 82       	std	Z+7, r1	; 0x07
  32:	cf 01       	movw	r24, r30
  34:	0f 90       	pop	r0
  36:	0f 90       	pop	r0
  38:	df 91       	pop	r29
  3a:	cf 91       	pop	r28
  3c:	08 95       	ret
  3e:	83 e1       	ldi	r24, 0x13	; 19
  40:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__SREG__+0x80007c>
  44:	84 e8       	ldi	r24, 0x84	; 132
  46:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
  4a:	90 91 bc 00 	lds	r25, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
  4e:	97 ff       	sbrs	r25, 7
  50:	00 c0       	rjmp	.+0      	; 0x52 <ino::read_line_sensor()+0x52>
  52:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
  56:	88 7f       	andi	r24, 0xF8	; 248
  58:	88 33       	cpi	r24, 0x38	; 56
  5a:	01 f4       	brne	.+0      	; 0x5c <ino::read_line_sensor()+0x5c>
  5c:	00 c0       	rjmp	.+0      	; 0x5e <ino::read_line_sensor()+0x5e>
  5e:	80 34       	cpi	r24, 0x40	; 64
  60:	01 f0       	breq	.+0      	; 0x62 <ino::read_line_sensor()+0x62>
  62:	00 c0       	rjmp	.+0      	; 0x64 <ino::read_line_sensor()+0x64>
  64:	84 ec       	ldi	r24, 0xC4	; 196
  66:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
  6a:	90 91 bc 00 	lds	r25, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
  6e:	97 ff       	sbrs	r25, 7
  70:	00 c0       	rjmp	.+0      	; 0x72 <ino::read_line_sensor()+0x72>
  72:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
  76:	88 7f       	andi	r24, 0xF8	; 248
  78:	80 35       	cpi	r24, 0x50	; 80
  7a:	01 f0       	breq	.+0      	; 0x7c <ino::read_line_sensor()+0x7c>
  7c:	00 c0       	rjmp	.+0      	; 0x7e <ino::read_line_sensor()+0x7e>
  7e:	90 91 bb 00 	lds	r25, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
  82:	84 ec       	ldi	r24, 0xC4	; 196
  84:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
  88:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
  8c:	87 ff       	sbrs	r24, 7
  8e:	00 c0       	rjmp	.+0      	; 0x90 <ino::read_line_sensor()+0x90>
  90:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
  94:	88 7f       	andi	r24, 0xF8	; 248
  96:	80 35       	cpi	r24, 0x50	; 80
  98:	01 f0       	breq	.+0      	; 0x9a <ino::read_line_sensor()+0x9a>
  9a:	00 c0       	rjmp	.+0      	; 0x9c <ino::read_line_sensor()+0x9c>
  9c:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
  a0:	84 ec       	ldi	r24, 0xC4	; 196
  a2:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
  a6:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
  aa:	87 ff       	sbrs	r24, 7
  ac:	00 c0       	rjmp	.+0      	; 0xae <ino::read_line_sensor()+0xae>
  ae:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
  b2:	88 7f       	andi	r24, 0xF8	; 248
  b4:	80 35       	cpi	r24, 0x50	; 80
  b6:	01 f0       	breq	.+0      	; 0xb8 <ino::read_line_sensor()+0xb8>
  b8:	00 c0       	rjmp	.+0      	; 0xba <ino::read_line_sensor()+0xba>
  ba:	20 91 bb 00 	lds	r18, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
  be:	84 ec       	ldi	r24, 0xC4	; 196
  c0:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
  c4:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
  c8:	87 ff       	sbrs	r24, 7
  ca:	00 c0       	rjmp	.+0      	; 0xcc <ino::read_line_sensor()+0xcc>
  cc:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
  d0:	88 7f       	andi	r24, 0xF8	; 248
  d2:	80 35       	cpi	r24, 0x50	; 80
  d4:	01 f0       	breq	.+0      	; 0xd6 <ino::read_line_sensor()+0xd6>
  d6:	00 c0       	rjmp	.+0      	; 0xd8 <ino::read_line_sensor()+0xd8>
  d8:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
  dc:	84 ec       	ldi	r24, 0xC4	; 196
  de:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
  e2:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
  e6:	87 ff       	sbrs	r24, 7
  e8:	00 c0       	rjmp	.+0      	; 0xea <ino::read_line_sensor()+0xea>
  ea:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
  ee:	88 7f       	andi	r24, 0xF8	; 248
  f0:	80 35       	cpi	r24, 0x50	; 80
  f2:	01 f0       	breq	.+0      	; 0xf4 <ino::read_line_sensor()+0xf4>
  f4:	00 c0       	rjmp	.+0      	; 0xf6 <ino::read_line_sensor()+0xf6>
  f6:	50 91 bb 00 	lds	r21, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
  fa:	84 ec       	ldi	r24, 0xC4	; 196
  fc:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 100:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 104:	87 ff       	sbrs	r24, 7
 106:	00 c0       	rjmp	.+0      	; 0x108 <ino::read_line_sensor()+0x108>
 108:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 10c:	88 7f       	andi	r24, 0xF8	; 248
 10e:	80 35       	cpi	r24, 0x50	; 80
 110:	01 f0       	breq	.+0      	; 0x112 <ino::read_line_sensor()+0x112>
 112:	00 c0       	rjmp	.+0      	; 0x114 <ino::read_line_sensor()+0x114>
 114:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 118:	84 ec       	ldi	r24, 0xC4	; 196
 11a:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 11e:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 122:	87 ff       	sbrs	r24, 7
 124:	00 c0       	rjmp	.+0      	; 0x126 <ino::read_line_sensor()+0x126>
 126:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 12a:	88 7f       	andi	r24, 0xF8	; 248
 12c:	80 35       	cpi	r24, 0x50	; 80
 12e:	01 f0       	breq	.+0      	; 0x130 <ino::read_line_sensor()+0x130>
 130:	00 c0       	rjmp	.+0      	; 0x132 <ino::read_line_sensor()+0x132>
 132:	70 91 bb 00 	lds	r23, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 136:	84 ec       	ldi	r24, 0xC4	; 196
 138:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 13c:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 140:	87 ff       	sbrs	r24, 7
 142:	00 c0       	rjmp	.+0      	; 0x144 <ino::read_line_sensor()+0x144>
 144:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 148:	88 7f       	andi	r24, 0xF8	; 248
 14a:	80 35       	cpi	r24, 0x50	; 80
 14c:	01 f0       	breq	.+0      	; 0x14e <ino::read_line_sensor()+0x14e>
 14e:	00 c0       	rjmp	.+0      	; 0x150 <ino::read_line_sensor()+0x150>
 150:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 154:	84 ec       	ldi	r24, 0xC4	; 196
 156:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 15a:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 15e:	87 ff       	sbrs	r24, 7
 160:	00 c0       	rjmp	.+0      	; 0x162 <ino::read_line_sensor()+0x162>
 162:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 166:	88 7f       	andi	r24, 0xF8	; 248
 168:	80 35       	cpi	r24, 0x50	; 80
 16a:	01 f0       	breq	.+0      	; 0x16c <ino::read_line_sensor()+0x16c>
 16c:	00 c0       	rjmp	.+0      	; 0x16e <ino::read_line_sensor()+0x16e>
 16e:	60 91 bb 00 	lds	r22, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 172:	84 ec       	ldi	r24, 0xC4	; 196
 174:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 178:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 17c:	87 ff       	sbrs	r24, 7
 17e:	00 c0       	rjmp	.+0      	; 0x180 <ino::read_line_sensor()+0x180>
 180:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 184:	88 7f       	andi	r24, 0xF8	; 248
 186:	80 35       	cpi	r24, 0x50	; 80
 188:	01 f0       	breq	.+0      	; 0x18a <ino::read_line_sensor()+0x18a>
 18a:	00 c0       	rjmp	.+0      	; 0x18c <ino::read_line_sensor()+0x18c>
 18c:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 190:	84 ec       	ldi	r24, 0xC4	; 196
 192:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 196:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 19a:	87 ff       	sbrs	r24, 7
 19c:	00 c0       	rjmp	.+0      	; 0x19e <ino::read_line_sensor()+0x19e>
 19e:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 1a2:	88 7f       	andi	r24, 0xF8	; 248
 1a4:	80 35       	cpi	r24, 0x50	; 80
 1a6:	01 f4       	brne	.+0      	; 0x1a8 <ino::read_line_sensor()+0x1a8>
 1a8:	40 91 bb 00 	lds	r20, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 1ac:	84 ec       	ldi	r24, 0xC4	; 196
 1ae:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 1b2:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 1b6:	87 ff       	sbrs	r24, 7
 1b8:	00 c0       	rjmp	.+0      	; 0x1ba <ino::read_line_sensor()+0x1ba>
 1ba:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 1be:	88 7f       	andi	r24, 0xF8	; 248
 1c0:	80 35       	cpi	r24, 0x50	; 80
 1c2:	01 f4       	brne	.+0      	; 0x1c4 <ino::read_line_sensor()+0x1c4>
 1c4:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 1c8:	84 ec       	ldi	r24, 0xC4	; 196
 1ca:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 1ce:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 1d2:	87 ff       	sbrs	r24, 7
 1d4:	00 c0       	rjmp	.+0      	; 0x1d6 <ino::read_line_sensor()+0x1d6>
 1d6:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 1da:	88 7f       	andi	r24, 0xF8	; 248
 1dc:	80 35       	cpi	r24, 0x50	; 80
 1de:	01 f4       	brne	.+0      	; 0x1e0 <ino::read_line_sensor()+0x1e0>
 1e0:	30 91 bb 00 	lds	r19, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 1e4:	84 e8       	ldi	r24, 0x84	; 132
 1e6:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 1ea:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__SREG__+0x80007d>
 1ee:	87 ff       	sbrs	r24, 7
 1f0:	00 c0       	rjmp	.+0      	; 0x1f2 <ino::read_line_sensor()+0x1f2>
 1f2:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__SREG__+0x80007a>
 1f6:	88 7f       	andi	r24, 0xF8	; 248
 1f8:	88 35       	cpi	r24, 0x58	; 88
 1fa:	01 f4       	brne	.+0      	; 0x1fc <ino::read_line_sensor()+0x1fc>
 1fc:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__SREG__+0x80007c>
 200:	90 83       	st	Z, r25
 202:	21 83       	std	Z+1, r18	; 0x01
 204:	52 83       	std	Z+2, r21	; 0x02
 206:	73 83       	std	Z+3, r23	; 0x03
 208:	64 83       	std	Z+4, r22	; 0x04
 20a:	45 83       	std	Z+5, r20	; 0x05
 20c:	36 83       	std	Z+6, r19	; 0x06
 20e:	81 e0       	ldi	r24, 0x01	; 1
 210:	87 83       	std	Z+7, r24	; 0x07
 212:	00 c0       	rjmp	.+0      	; 0x214 <ino::read_line_sensor()+0x214>
 214:	10 82       	st	Z, r1
 216:	17 82       	std	Z+7, r1	; 0x07
 218:	84 e9       	ldi	r24, 0x94	; 148
 21a:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 21e:	cf 01       	movw	r24, r30
 220:	0f 90       	pop	r0
 222:	0f 90       	pop	r0
 224:	df 91       	pop	r29
 226:	cf 91       	pop	r28
 228:	08 95       	ret
 22a:	84 e9       	ldi	r24, 0x94	; 148
 22c:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__SREG__+0x80007d>
 230:	60 e0       	ldi	r22, 0x00	; 0
 232:	70 e0       	ldi	r23, 0x00	; 0
 234:	80 e0       	ldi	r24, 0x00	; 0
 236:	90 e0       	ldi	r25, 0x00	; 0
 238:	0e 94 00 00 	call	0	; 0x0 <ino::read_line_sensor()>
 23c:	60 e0       	ldi	r22, 0x00	; 0
 23e:	70 e0       	ldi	r23, 0x00	; 0
 240:	80 e0       	ldi	r24, 0x00	; 0
 242:	90 e0       	ldi	r25, 0x00	; 0
 244:	0e 94 00 00 	call	0	; 0x0 <ino::read_line_sensor()>
 248:	2a e0       	ldi	r18, 0x0A	; 10
 24a:	30 e0       	ldi	r19, 0x00	; 0
 24c:	4e ec       	ldi	r20, 0xCE	; 206
 24e:	50 e0       	ldi	r21, 0x00	; 0
 250:	60 e0       	ldi	r22, 0x00	; 0
 252:	70 e0       	ldi	r23, 0x00	; 0
 254:	80 e0       	ldi	r24, 0x00	; 0
 256:	90 e0       	ldi	r25, 0x00	; 0
 258:	0e 94 00 00 	call	0	; 0x0 <ino::read_line_sensor()>
 25c:	60 e0       	ldi	r22, 0x00	; 0
 25e:	70 e0       	ldi	r23, 0x00	; 0
 260:	80 e0       	ldi	r24, 0x00	; 0
 262:	90 e0       	ldi	r25, 0x00	; 0
 264:	0e 94 00 00 	call	0	; 0x0 <ino::read_line_sensor()>
 268:	60 e0       	ldi	r22, 0x00	; 0
 26a:	70 e0       	ldi	r23, 0x00	; 0
 26c:	80 e0       	ldi	r24, 0x00	; 0
 26e:	90 e0       	ldi	r25, 0x00	; 0
 270:	0e 94 00 00 	call	0	; 0x0 <ino::read_line_sensor()>
 274:	60 e0       	ldi	r22, 0x00	; 0
 276:	70 e0       	ldi	r23, 0x00	; 0
 278:	80 e0       	ldi	r24, 0x00	; 0
 27a:	90 e0       	ldi	r25, 0x00	; 0
 27c:	0e 94 00 00 	call	0	; 0x0 <ino::read_line_sensor()>
 280:	1a 82       	std	Y+2, r1	; 0x02
 282:	19 82       	std	Y+1, r1	; 0x01
 284:	89 81       	ldd	r24, Y+1	; 0x01
 286:	9a 81       	ldd	r25, Y+2	; 0x02
 288:	01 96       	adiw	r24, 0x01	; 1
 28a:	9a 83       	std	Y+2, r25	; 0x02
 28c:	89 83       	std	Y+1, r24	; 0x01
 28e:	00 c0       	rjmp	.+0      	; 0x290 <__SREG__+0x251>

Disassembly of section .text._ZN3ino4testEv:

00000000 <ino::test()>:
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
  18:	0e 94 00 00 	call	0	; 0x0 <ino::test()>
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

Disassembly of section .text._ZN3ino20standardize_readingsENS_18LineSensorReadingsERA7_KNS_17SensorCalibrationIhEE:

00000000 <ino::standardize_readings(ino::LineSensorReadings, ino::SensorCalibration<unsigned char> const (&) [7])>:
   0:	bf 92       	push	r11
   2:	cf 92       	push	r12
   4:	df 92       	push	r13
   6:	ef 92       	push	r14
   8:	ff 92       	push	r15
   a:	0f 93       	push	r16
   c:	1f 93       	push	r17
   e:	cf 93       	push	r28
  10:	df 93       	push	r29
  12:	cd b7       	in	r28, 0x3d	; 61
  14:	de b7       	in	r29, 0x3e	; 62
  16:	2e 97       	sbiw	r28, 0x0e	; 14
  18:	0f b6       	in	r0, 0x3f	; 63
  1a:	f8 94       	cli
  1c:	de bf       	out	0x3e, r29	; 62
  1e:	0f be       	out	0x3f, r0	; 63
  20:	cd bf       	out	0x3d, r28	; 61
  22:	d5 2e       	mov	r13, r21
  24:	e6 2e       	mov	r14, r22
  26:	b7 2e       	mov	r11, r23
  28:	f8 2e       	mov	r15, r24
  2a:	f8 01       	movw	r30, r16
  2c:	82 81       	ldd	r24, Z+2	; 0x02
  2e:	a3 2f       	mov	r26, r19
  30:	a8 1b       	sub	r26, r24
  32:	bb 0b       	sbc	r27, r27
  34:	1f ef       	ldi	r17, 0xFF	; 255
  36:	1a 9f       	mul	r17, r26
  38:	c0 01       	movw	r24, r0
  3a:	1b 9f       	mul	r17, r27
  3c:	90 0d       	add	r25, r0
  3e:	11 24       	eor	r1, r1
  40:	63 81       	ldd	r22, Z+3	; 0x03
  42:	70 e0       	ldi	r23, 0x00	; 0
  44:	0e 94 00 00 	call	0	; 0x0 <ino::standardize_readings(ino::LineSensorReadings, ino::SensorCalibration<unsigned char> const (&) [7])>
  48:	c6 2e       	mov	r12, r22
  4a:	84 81       	ldd	r24, Z+4	; 0x04
  4c:	48 1b       	sub	r20, r24
  4e:	55 0b       	sbc	r21, r21
  50:	14 9f       	mul	r17, r20
  52:	c0 01       	movw	r24, r0
  54:	15 9f       	mul	r17, r21
  56:	90 0d       	add	r25, r0
  58:	11 24       	eor	r1, r1
  5a:	65 81       	ldd	r22, Z+5	; 0x05
  5c:	70 e0       	ldi	r23, 0x00	; 0
  5e:	0e 94 00 00 	call	0	; 0x0 <ino::standardize_readings(ino::LineSensorReadings, ino::SensorCalibration<unsigned char> const (&) [7])>
  62:	46 2f       	mov	r20, r22
  64:	86 81       	ldd	r24, Z+6	; 0x06
  66:	ad 2d       	mov	r26, r13
  68:	a8 1b       	sub	r26, r24
  6a:	bb 0b       	sbc	r27, r27
  6c:	1a 9f       	mul	r17, r26
  6e:	c0 01       	movw	r24, r0
  70:	1b 9f       	mul	r17, r27
  72:	90 0d       	add	r25, r0
  74:	11 24       	eor	r1, r1
  76:	67 81       	ldd	r22, Z+7	; 0x07
  78:	70 e0       	ldi	r23, 0x00	; 0
  7a:	0e 94 00 00 	call	0	; 0x0 <ino::standardize_readings(ino::LineSensorReadings, ino::SensorCalibration<unsigned char> const (&) [7])>
  7e:	d6 2e       	mov	r13, r22
  80:	80 85       	ldd	r24, Z+8	; 0x08
  82:	ae 2d       	mov	r26, r14
  84:	a8 1b       	sub	r26, r24
  86:	bb 0b       	sbc	r27, r27
  88:	1a 9f       	mul	r17, r26
  8a:	c0 01       	movw	r24, r0
  8c:	1b 9f       	mul	r17, r27
  8e:	90 0d       	add	r25, r0
  90:	11 24       	eor	r1, r1
  92:	61 85       	ldd	r22, Z+9	; 0x09
  94:	70 e0       	ldi	r23, 0x00	; 0
  96:	0e 94 00 00 	call	0	; 0x0 <ino::standardize_readings(ino::LineSensorReadings, ino::SensorCalibration<unsigned char> const (&) [7])>
  9a:	e6 2e       	mov	r14, r22
  9c:	82 85       	ldd	r24, Z+10	; 0x0a
  9e:	ab 2d       	mov	r26, r11
  a0:	a8 1b       	sub	r26, r24
  a2:	bb 0b       	sbc	r27, r27
  a4:	1a 9f       	mul	r17, r26
  a6:	c0 01       	movw	r24, r0
  a8:	1b 9f       	mul	r17, r27
  aa:	90 0d       	add	r25, r0
  ac:	11 24       	eor	r1, r1
  ae:	63 85       	ldd	r22, Z+11	; 0x0b
  b0:	70 e0       	ldi	r23, 0x00	; 0
  b2:	0e 94 00 00 	call	0	; 0x0 <ino::standardize_readings(ino::LineSensorReadings, ino::SensorCalibration<unsigned char> const (&) [7])>
  b6:	06 2f       	mov	r16, r22
  b8:	84 85       	ldd	r24, Z+12	; 0x0c
  ba:	af 2d       	mov	r26, r15
  bc:	a8 1b       	sub	r26, r24
  be:	bb 0b       	sbc	r27, r27
  c0:	1a 9f       	mul	r17, r26
  c2:	c0 01       	movw	r24, r0
  c4:	1b 9f       	mul	r17, r27
  c6:	90 0d       	add	r25, r0
  c8:	11 24       	eor	r1, r1
  ca:	65 85       	ldd	r22, Z+13	; 0x0d
  cc:	70 e0       	ldi	r23, 0x00	; 0
  ce:	0e 94 00 00 	call	0	; 0x0 <ino::standardize_readings(ino::LineSensorReadings, ino::SensorCalibration<unsigned char> const (&) [7])>
  d2:	f6 2e       	mov	r15, r22
  d4:	80 81       	ld	r24, Z
  d6:	28 1b       	sub	r18, r24
  d8:	33 0b       	sbc	r19, r19
  da:	12 9f       	mul	r17, r18
  dc:	c0 01       	movw	r24, r0
  de:	13 9f       	mul	r17, r19
  e0:	90 0d       	add	r25, r0
  e2:	11 24       	eor	r1, r1
  e4:	61 81       	ldd	r22, Z+1	; 0x01
  e6:	70 e0       	ldi	r23, 0x00	; 0
  e8:	0e 94 00 00 	call	0	; 0x0 <ino::standardize_readings(ino::LineSensorReadings, ino::SensorCalibration<unsigned char> const (&) [7])>
  ec:	26 2f       	mov	r18, r22
  ee:	3c 2d       	mov	r19, r12
  f0:	5d 2d       	mov	r21, r13
  f2:	6e 2d       	mov	r22, r14
  f4:	70 2f       	mov	r23, r16
  f6:	8f 2d       	mov	r24, r15
  f8:	90 e0       	ldi	r25, 0x00	; 0
  fa:	2e 96       	adiw	r28, 0x0e	; 14
  fc:	0f b6       	in	r0, 0x3f	; 63
  fe:	f8 94       	cli
 100:	de bf       	out	0x3e, r29	; 62
 102:	0f be       	out	0x3f, r0	; 63
 104:	cd bf       	out	0x3d, r28	; 61
 106:	df 91       	pop	r29
 108:	cf 91       	pop	r28
 10a:	1f 91       	pop	r17
 10c:	0f 91       	pop	r16
 10e:	ff 90       	pop	r15
 110:	ef 90       	pop	r14
 112:	df 90       	pop	r13
 114:	cf 90       	pop	r12
 116:	bf 90       	pop	r11
 118:	08 95       	ret

Disassembly of section .text._ZN3ino21calibrate_line_sensorERA7_NS_17SensorCalibrationIhEEi:

00000000 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>:
   0:	bf 92       	push	r11
   2:	cf 92       	push	r12
   4:	df 92       	push	r13
   6:	ef 92       	push	r14
   8:	ff 92       	push	r15
   a:	0f 93       	push	r16
   c:	1f 93       	push	r17
   e:	cf 93       	push	r28
  10:	df 93       	push	r29
  12:	cd b7       	in	r28, 0x3d	; 61
  14:	de b7       	in	r29, 0x3e	; 62
  16:	6e 97       	sbiw	r28, 0x1e	; 30
  18:	0f b6       	in	r0, 0x3f	; 63
  1a:	f8 94       	cli
  1c:	de bf       	out	0x3e, r29	; 62
  1e:	0f be       	out	0x3f, r0	; 63
  20:	cd bf       	out	0x3d, r28	; 61
  22:	6c 01       	movw	r12, r24
  24:	e6 2e       	mov	r14, r22
  26:	61 e0       	ldi	r22, 0x01	; 1
  28:	8d e0       	ldi	r24, 0x0D	; 13
  2a:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
  2e:	61 e0       	ldi	r22, 0x01	; 1
  30:	8d e0       	ldi	r24, 0x0D	; 13
  32:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
  36:	8e 2d       	mov	r24, r14
  38:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
  3c:	01 97       	sbiw	r24, 0x01	; 1
  3e:	01 f0       	breq	.+0      	; 0x40 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x40>
  40:	60 e0       	ldi	r22, 0x00	; 0
  42:	8d e0       	ldi	r24, 0x0D	; 13
  44:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
  48:	87 e0       	ldi	r24, 0x07	; 7
  4a:	e0 e0       	ldi	r30, 0x00	; 0
  4c:	f0 e0       	ldi	r31, 0x00	; 0
  4e:	de 01       	movw	r26, r28
  50:	58 96       	adiw	r26, 0x18	; 24
  52:	01 90       	ld	r0, Z+
  54:	0d 92       	st	X+, r0
  56:	8a 95       	dec	r24
  58:	01 f4       	brne	.+0      	; 0x5a <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x5a>
  5a:	8e 01       	movw	r16, r28
  5c:	0f 5e       	subi	r16, 0xEF	; 239
  5e:	1f 4f       	sbci	r17, 0xFF	; 255
  60:	87 e0       	ldi	r24, 0x07	; 7
  62:	f8 01       	movw	r30, r16
  64:	11 92       	st	Z+, r1
  66:	8a 95       	dec	r24
  68:	01 f4       	brne	.+0      	; 0x6a <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x6a>
  6a:	68 ee       	ldi	r22, 0xE8	; 232
  6c:	73 e0       	ldi	r23, 0x03	; 3
  6e:	80 e0       	ldi	r24, 0x00	; 0
  70:	90 e0       	ldi	r25, 0x00	; 0
  72:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
  76:	ff 24       	eor	r15, r15
  78:	f3 94       	inc	r15
  7a:	8e 2d       	mov	r24, r14
  7c:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
  80:	01 97       	sbiw	r24, 0x01	; 1
  82:	01 f0       	breq	.+0      	; 0x84 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x84>
  84:	00 c0       	rjmp	.+0      	; 0x86 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x86>
  86:	ce 01       	movw	r24, r28
  88:	09 96       	adiw	r24, 0x09	; 9
  8a:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
  8e:	88 89       	ldd	r24, Y+16	; 0x10
  90:	81 11       	cpse	r24, r1
  92:	00 c0       	rjmp	.+0      	; 0x94 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x94>
  94:	ce 01       	movw	r24, r28
  96:	01 96       	adiw	r24, 0x01	; 1
  98:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
  9c:	88 85       	ldd	r24, Y+8	; 0x08
  9e:	88 23       	and	r24, r24
  a0:	01 f0       	breq	.+0      	; 0xa2 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xa2>
  a2:	f8 8a       	std	Y+16, r15	; 0x10
  a4:	7e 85       	ldd	r23, Y+14	; 0x0e
  a6:	bd 84       	ldd	r11, Y+13	; 0x0d
  a8:	5c 85       	ldd	r21, Y+12	; 0x0c
  aa:	6b 85       	ldd	r22, Y+11	; 0x0b
  ac:	2a 85       	ldd	r18, Y+10	; 0x0a
  ae:	99 85       	ldd	r25, Y+9	; 0x09
  b0:	4f 85       	ldd	r20, Y+15	; 0x0f
  b2:	fe 01       	movw	r30, r28
  b4:	78 96       	adiw	r30, 0x18	; 24
  b6:	d8 01       	movw	r26, r16
  b8:	80 e0       	ldi	r24, 0x00	; 0
  ba:	30 81       	ld	r19, Z
  bc:	93 17       	cp	r25, r19
  be:	00 f0       	brcs	.+0      	; 0xc0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xc0>
  c0:	3c 91       	ld	r19, X
  c2:	39 17       	cp	r19, r25
  c4:	00 f4       	brcc	.+0      	; 0xc6 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xc6>
  c6:	9c 93       	st	X, r25
  c8:	8f 5f       	subi	r24, 0xFF	; 255
  ca:	31 96       	adiw	r30, 0x01	; 1
  cc:	11 96       	adiw	r26, 0x01	; 1
  ce:	87 30       	cpi	r24, 0x07	; 7
  d0:	01 f0       	breq	.+0      	; 0xd2 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xd2>
  d2:	9b 2d       	mov	r25, r11
  d4:	84 30       	cpi	r24, 0x04	; 4
  d6:	01 f0       	breq	.+0      	; 0xd8 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xd8>
  d8:	00 f4       	brcc	.+0      	; 0xda <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xda>
  da:	96 2f       	mov	r25, r22
  dc:	82 30       	cpi	r24, 0x02	; 2
  de:	01 f0       	breq	.+0      	; 0xe0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xe0>
  e0:	95 2f       	mov	r25, r21
  e2:	83 30       	cpi	r24, 0x03	; 3
  e4:	01 f0       	breq	.+0      	; 0xe6 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xe6>
  e6:	92 2f       	mov	r25, r18
  e8:	30 81       	ld	r19, Z
  ea:	93 17       	cp	r25, r19
  ec:	00 f4       	brcc	.+0      	; 0xee <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xee>
  ee:	90 83       	st	Z, r25
  f0:	00 c0       	rjmp	.+0      	; 0xf2 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xf2>
  f2:	97 2f       	mov	r25, r23
  f4:	85 30       	cpi	r24, 0x05	; 5
  f6:	01 f0       	breq	.+0      	; 0xf8 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xf8>
  f8:	94 2f       	mov	r25, r20
  fa:	86 30       	cpi	r24, 0x06	; 6
  fc:	01 f0       	breq	.+0      	; 0xfe <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0xfe>
  fe:	92 2f       	mov	r25, r18
 100:	00 c0       	rjmp	.+0      	; 0x102 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x102>
 102:	88 89       	ldd	r24, Y+16	; 0x10
 104:	88 23       	and	r24, r24
 106:	01 f0       	breq	.+0      	; 0x108 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x108>
 108:	18 8a       	std	Y+16, r1	; 0x10
 10a:	00 c0       	rjmp	.+0      	; 0x10c <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x10c>
 10c:	9e 01       	movw	r18, r28
 10e:	28 5e       	subi	r18, 0xE8	; 232
 110:	3f 4f       	sbci	r19, 0xFF	; 255
 112:	d6 01       	movw	r26, r12
 114:	ae 01       	movw	r20, r28
 116:	47 5e       	subi	r20, 0xE7	; 231
 118:	5f 4f       	sbci	r21, 0xFF	; 255
 11a:	f8 01       	movw	r30, r16
 11c:	81 91       	ld	r24, Z+
 11e:	8f 01       	movw	r16, r30
 120:	f9 01       	movw	r30, r18
 122:	91 91       	ld	r25, Z+
 124:	9f 01       	movw	r18, r30
 126:	9c 93       	st	X, r25
 128:	89 1b       	sub	r24, r25
 12a:	11 96       	adiw	r26, 0x01	; 1
 12c:	8c 93       	st	X, r24
 12e:	11 97       	sbiw	r26, 0x01	; 1
 130:	12 96       	adiw	r26, 0x02	; 2
 132:	40 17       	cp	r20, r16
 134:	51 07       	cpc	r21, r17
 136:	01 f4       	brne	.+0      	; 0x138 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)+0x138>
 138:	61 e0       	ldi	r22, 0x01	; 1
 13a:	8d e0       	ldi	r24, 0x0D	; 13
 13c:	0e 94 00 00 	call	0	; 0x0 <ino::calibrate_line_sensor(ino::SensorCalibration<unsigned char> (&) [7], int)>
 140:	6e 96       	adiw	r28, 0x1e	; 30
 142:	0f b6       	in	r0, 0x3f	; 63
 144:	f8 94       	cli
 146:	de bf       	out	0x3e, r29	; 62
 148:	0f be       	out	0x3f, r0	; 63
 14a:	cd bf       	out	0x3d, r28	; 61
 14c:	df 91       	pop	r29
 14e:	cf 91       	pop	r28
 150:	1f 91       	pop	r17
 152:	0f 91       	pop	r16
 154:	ff 90       	pop	r15
 156:	ef 90       	pop	r14
 158:	df 90       	pop	r13
 15a:	cf 90       	pop	r12
 15c:	bf 90       	pop	r11
 15e:	08 95       	ret
