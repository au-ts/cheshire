
sw/tests/prime_and_probe_channel.spm_llc_tests.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000010000000 <_start-0x4000>:
	...

0000000010004000 <_start>:
    10004000:	30057073          	csrci	mstatus,10
    10004004:	f14022f3          	csrr	t0,mhartid
    10004008:	00028563          	beqz	t0,10004012 <_start+0x12>
    1000400c:	10500073          	wfi
    10004010:	bff5                	j	1000400c <_start+0xc>
    10004012:	830a                	mv	t1,sp
    10004014:	00000293          	li	t0,0
    10004018:	00028363          	beqz	t0,1000401e <_start+0x1e>
    1000401c:	8116                	mv	sp,t0
    1000401e:	00001297          	auipc	t0,0x1
    10004022:	4d228293          	addi	t0,t0,1234 # 100054f0 <__global_pointer$>
    10004026:	00028363          	beqz	t0,1000402c <_start+0x2c>
    1000402a:	8196                	mv	gp,t0
    1000402c:	1121                	addi	sp,sp,-24
    1000402e:	e01a                	sd	t1,0(sp)
    10004030:	e40e                	sd	gp,8(sp)
    10004032:	e806                	sd	ra,16(sp)
    10004034:	00000297          	auipc	t0,0x0
    10004038:	10c28293          	addi	t0,t0,268 # 10004140 <_trap_handler_wrap>
    1000403c:	30529073          	csrw	mtvec,t0
    10004040:	17018293          	addi	t0,gp,368 # 10005660 <__bss_end>
    10004044:	17018313          	addi	t1,gp,368 # 10005660 <__bss_end>
    10004048:	405303b3          	sub	t2,t1,t0
    1000404c:	4501                	li	a0,0

000000001000404e <_zero_bss_loop>:
    1000404e:	fe038e93          	addi	t4,t2,-32
    10004052:	02705863          	blez	t2,10004082 <_fp_init>
    10004056:	020ec063          	bltz	t4,10004076 <_zero_bss_rem>
    1000405a:	00a2b023          	sd	a0,0(t0)
    1000405e:	00a2b423          	sd	a0,8(t0)
    10004062:	00a2b823          	sd	a0,16(t0)
    10004066:	00a2bc23          	sd	a0,24(t0)
    1000406a:	1381                	addi	t2,t2,-32
    1000406c:	02028293          	addi	t0,t0,32
    10004070:	fc704fe3          	bgtz	t2,1000404e <_zero_bss_loop>
    10004074:	a039                	j	10004082 <_fp_init>

0000000010004076 <_zero_bss_rem>:
    10004076:	00a28023          	sb	a0,0(t0)
    1000407a:	13fd                	addi	t2,t2,-1
    1000407c:	0285                	addi	t0,t0,1
    1000407e:	fe704ce3          	bgtz	t2,10004076 <_zero_bss_rem>

0000000010004082 <_fp_init>:
    10004082:	4305                	li	t1,1
    10004084:	0336                	slli	t1,t1,0xd
    10004086:	30032073          	csrs	mstatus,t1
    1000408a:	d2207053          	fcvt.d.l	ft0,zero
    1000408e:	220000d3          	fmv.d	ft1,ft0
    10004092:	22000153          	fmv.d	ft2,ft0
    10004096:	220001d3          	fmv.d	ft3,ft0
    1000409a:	22000253          	fmv.d	ft4,ft0
    1000409e:	220002d3          	fmv.d	ft5,ft0
    100040a2:	22000353          	fmv.d	ft6,ft0
    100040a6:	220003d3          	fmv.d	ft7,ft0
    100040aa:	22000453          	fmv.d	fs0,ft0
    100040ae:	220004d3          	fmv.d	fs1,ft0
    100040b2:	22000553          	fmv.d	fa0,ft0
    100040b6:	220005d3          	fmv.d	fa1,ft0
    100040ba:	22000653          	fmv.d	fa2,ft0
    100040be:	220006d3          	fmv.d	fa3,ft0
    100040c2:	22000753          	fmv.d	fa4,ft0
    100040c6:	220007d3          	fmv.d	fa5,ft0
    100040ca:	22000853          	fmv.d	fa6,ft0
    100040ce:	220008d3          	fmv.d	fa7,ft0
    100040d2:	22000953          	fmv.d	fs2,ft0
    100040d6:	220009d3          	fmv.d	fs3,ft0
    100040da:	22000a53          	fmv.d	fs4,ft0
    100040de:	22000ad3          	fmv.d	fs5,ft0
    100040e2:	22000b53          	fmv.d	fs6,ft0
    100040e6:	22000bd3          	fmv.d	fs7,ft0
    100040ea:	22000c53          	fmv.d	fs8,ft0
    100040ee:	22000cd3          	fmv.d	fs9,ft0
    100040f2:	22000d53          	fmv.d	fs10,ft0
    100040f6:	22000dd3          	fmv.d	fs11,ft0
    100040fa:	22000e53          	fmv.d	ft8,ft0
    100040fe:	22000ed3          	fmv.d	ft9,ft0
    10004102:	22000f53          	fmv.d	ft10,ft0
    10004106:	22000fd3          	fmv.d	ft11,ft0
    1000410a:	30033073          	csrc	mstatus,t1
    1000410e:	0ff0000f          	fence
    10004112:	0ce000ef          	jal	100041e0 <main>
    10004116:	00000013          	nop
    1000411a:	00000013          	nop
    1000411e:	0001                	nop

0000000010004120 <_exit>:
    10004120:	60c2                	ld	ra,16(sp)
    10004122:	61a2                	ld	gp,8(sp)
    10004124:	6102                	ld	sp,0(sp)
    10004126:	00151293          	slli	t0,a0,0x1
    1000412a:	0012e293          	ori	t0,t0,1
    1000412e:	f2ffc317          	auipc	t1,0xf2ffc
    10004132:	ed230313          	addi	t1,t1,-302 # 3000000 <__base_regs>
    10004136:	00532423          	sw	t0,8(t1)
    1000413a:	8082                	ret
    1000413c:	00000013          	nop

0000000010004140 <_trap_handler_wrap>:
    10004140:	7119                	addi	sp,sp,-128
    10004142:	fc86                	sd	ra,120(sp)
    10004144:	f896                	sd	t0,112(sp)
    10004146:	f49a                	sd	t1,104(sp)
    10004148:	f09e                	sd	t2,96(sp)
    1000414a:	ecaa                	sd	a0,88(sp)
    1000414c:	e8ae                	sd	a1,80(sp)
    1000414e:	e4b2                	sd	a2,72(sp)
    10004150:	e0b6                	sd	a3,64(sp)
    10004152:	fc3a                	sd	a4,56(sp)
    10004154:	f83e                	sd	a5,48(sp)
    10004156:	f442                	sd	a6,40(sp)
    10004158:	f046                	sd	a7,32(sp)
    1000415a:	ec72                	sd	t3,24(sp)
    1000415c:	e876                	sd	t4,16(sp)
    1000415e:	e47a                	sd	t5,8(sp)
    10004160:	e07e                	sd	t6,0(sp)
    10004162:	02e000ef          	jal	10004190 <trap_vector>
    10004166:	70e6                	ld	ra,120(sp)
    10004168:	72c6                	ld	t0,112(sp)
    1000416a:	7326                	ld	t1,104(sp)
    1000416c:	7386                	ld	t2,96(sp)
    1000416e:	6566                	ld	a0,88(sp)
    10004170:	65c6                	ld	a1,80(sp)
    10004172:	6626                	ld	a2,72(sp)
    10004174:	6686                	ld	a3,64(sp)
    10004176:	7762                	ld	a4,56(sp)
    10004178:	77c2                	ld	a5,48(sp)
    1000417a:	7822                	ld	a6,40(sp)
    1000417c:	7882                	ld	a7,32(sp)
    1000417e:	6e62                	ld	t3,24(sp)
    10004180:	6ec2                	ld	t4,16(sp)
    10004182:	6f22                	ld	t5,8(sp)
    10004184:	6f82                	ld	t6,0(sp)
    10004186:	6109                	addi	sp,sp,128
    10004188:	30200073          	mret
    1000418c:	00000013          	nop

0000000010004190 <trap_vector>:
    10004190:	10500073          	wfi
    10004194:	ffdff06f          	j	10004190 <trap_vector>
    10004198:	0001                	nop

000000001000419a <main_continued>:
    1000419a:	1101                	addi	sp,sp,-32
    1000419c:	6fffe617          	auipc	a2,0x6fffe
    100041a0:	006c                	addi	a1,sp,12
    100041a2:	f2ffd717          	auipc	a4,0xf2ffd
    100041a6:	0fe00693          	li	a3,254
    100041aa:	e6460613          	addi	a2,a2,-412 # 80002000 <evict_data>
    100041ae:	f2ffd797          	auipc	a5,0xf2ffd
    100041b2:	ec06                	sd	ra,24(sp)
    100041b4:	e4d72f23          	sw	a3,-418(a4) # 3001000 <__base_llc>
    100041b8:	e5278793          	addi	a5,a5,-430 # 3001000 <__base_llc>
    100041bc:	4705                	li	a4,1
    100041be:	8219                	srli	a2,a2,0x6
    100041c0:	8199                	srli	a1,a1,0x6
    100041c2:	00001517          	auipc	a0,0x1
    100041c6:	0ff67613          	zext.b	a2,a2
    100041ca:	0ff5f593          	zext.b	a1,a1
    100041ce:	1be50513          	addi	a0,a0,446 # 10005380 <_putchar+0x24>
    100041d2:	cb98                	sw	a4,16(a5)
    100041d4:	154010ef          	jal	10005328 <printf_>
    100041d8:	60e2                	ld	ra,24(sp)
    100041da:	4501                	li	a0,0
    100041dc:	6105                	addi	sp,sp,32
    100041de:	8082                	ret

00000000100041e0 <main>:
    100041e0:	bf6d                	j	1000419a <main_continued>

00000000100041e2 <_out_null>:
    100041e2:	8082                	ret

00000000100041e4 <_out_rev>:
    100041e4:	711d                	addi	sp,sp,-96
    100041e6:	e0ca                	sd	s2,64(sp)
    100041e8:	fc4e                	sd	s3,56(sp)
    100041ea:	f852                	sd	s4,48(sp)
    100041ec:	f456                	sd	s5,40(sp)
    100041ee:	f05a                	sd	s6,32(sp)
    100041f0:	e862                	sd	s8,16(sp)
    100041f2:	e466                	sd	s9,8(sp)
    100041f4:	e06a                	sd	s10,0(sp)
    100041f6:	8c46                	mv	s8,a7
    100041f8:	ec86                	sd	ra,88(sp)
    100041fa:	e8a2                	sd	s0,80(sp)
    100041fc:	e4a6                	sd	s1,72(sp)
    100041fe:	0038f893          	andi	a7,a7,3
    10004202:	892a                	mv	s2,a0
    10004204:	8a2e                	mv	s4,a1
    10004206:	89b2                	mv	s3,a2
    10004208:	8ab6                	mv	s5,a3
    1000420a:	8b3a                	mv	s6,a4
    1000420c:	8cbe                	mv	s9,a5
    1000420e:	8d42                	mv	s10,a6
    10004210:	06088963          	beqz	a7,10004282 <_out_rev+0x9e>
    10004214:	cfc1                	beqz	a5,100042ac <_out_rev+0xc8>
    10004216:	ec5e                	sd	s7,24(sp)
    10004218:	84b2                	mv	s1,a2
    1000421a:	019b0433          	add	s0,s6,s9
    1000421e:	00848bb3          	add	s7,s1,s0
    10004222:	fff44503          	lbu	a0,-1(s0)
    10004226:	408b8633          	sub	a2,s7,s0
    1000422a:	86d6                	mv	a3,s5
    1000422c:	85d2                	mv	a1,s4
    1000422e:	147d                	addi	s0,s0,-1
    10004230:	9902                	jalr	s2
    10004232:	fe8b18e3          	bne	s6,s0,10004222 <_out_rev+0x3e>
    10004236:	6be2                	ld	s7,24(sp)
    10004238:	94e6                	add	s1,s1,s9
    1000423a:	002c7c13          	andi	s8,s8,2
    1000423e:	020c0463          	beqz	s8,10004266 <_out_rev+0x82>
    10004242:	020d1b13          	slli	s6,s10,0x20
    10004246:	020b5b13          	srli	s6,s6,0x20
    1000424a:	413489b3          	sub	s3,s1,s3
    1000424e:	0169fc63          	bgeu	s3,s6,10004266 <_out_rev+0x82>
    10004252:	8626                	mv	a2,s1
    10004254:	86d6                	mv	a3,s5
    10004256:	85d2                	mv	a1,s4
    10004258:	02000513          	li	a0,32
    1000425c:	0985                	addi	s3,s3,1
    1000425e:	0485                	addi	s1,s1,1
    10004260:	9902                	jalr	s2
    10004262:	ff69e8e3          	bltu	s3,s6,10004252 <_out_rev+0x6e>
    10004266:	60e6                	ld	ra,88(sp)
    10004268:	6446                	ld	s0,80(sp)
    1000426a:	6906                	ld	s2,64(sp)
    1000426c:	79e2                	ld	s3,56(sp)
    1000426e:	7a42                	ld	s4,48(sp)
    10004270:	7aa2                	ld	s5,40(sp)
    10004272:	7b02                	ld	s6,32(sp)
    10004274:	6c42                	ld	s8,16(sp)
    10004276:	6ca2                	ld	s9,8(sp)
    10004278:	6d02                	ld	s10,0(sp)
    1000427a:	8526                	mv	a0,s1
    1000427c:	64a6                	ld	s1,72(sp)
    1000427e:	6125                	addi	sp,sp,96
    10004280:	8082                	ret
    10004282:	02081493          	slli	s1,a6,0x20
    10004286:	9081                	srli	s1,s1,0x20
    10004288:	0297f463          	bgeu	a5,s1,100042b0 <_out_rev+0xcc>
    1000428c:	8c9d                	sub	s1,s1,a5
    1000428e:	94b2                	add	s1,s1,a2
    10004290:	8432                	mv	s0,a2
    10004292:	8622                	mv	a2,s0
    10004294:	86d6                	mv	a3,s5
    10004296:	0405                	addi	s0,s0,1
    10004298:	85d2                	mv	a1,s4
    1000429a:	02000513          	li	a0,32
    1000429e:	9902                	jalr	s2
    100042a0:	fe9419e3          	bne	s0,s1,10004292 <_out_rev+0xae>
    100042a4:	fc0c81e3          	beqz	s9,10004266 <_out_rev+0x82>
    100042a8:	ec5e                	sd	s7,24(sp)
    100042aa:	bf85                	j	1000421a <_out_rev+0x36>
    100042ac:	84b2                	mv	s1,a2
    100042ae:	b771                	j	1000423a <_out_rev+0x56>
    100042b0:	84b2                	mv	s1,a2
    100042b2:	bfcd                	j	100042a4 <_out_rev+0xc0>

00000000100042b4 <_ntoa_long>:
    100042b4:	715d                	addi	sp,sp,-80
    100042b6:	4366                	lw	t1,88(sp)
    100042b8:	fc26                	sd	s1,56(sp)
    100042ba:	f84a                	sd	s2,48(sp)
    100042bc:	e486                	sd	ra,72(sp)
    100042be:	e0a2                	sd	s0,64(sp)
    100042c0:	f44e                	sd	s3,40(sp)
    100042c2:	893e                	mv	s2,a5
    100042c4:	43c6                	lw	t2,80(sp)
    100042c6:	8eba                	mv	t4,a4
    100042c8:	84c6                	mv	s1,a7
    100042ca:	40037793          	andi	a5,t1,1024
    100042ce:	10070463          	beqz	a4,100043d6 <_ntoa_long+0x122>
    100042d2:	01037413          	andi	s0,t1,16
    100042d6:	889a                	mv	a7,t1
    100042d8:	0058d713          	srli	a4,a7,0x5
    100042dc:	8b05                	andi	a4,a4,1
    100042de:	06100293          	li	t0,97
    100042e2:	18071b63          	bnez	a4,10004478 <_ntoa_long+0x1c4>
    100042e6:	32d9                	addiw	t0,t0,-10
    100042e8:	4301                	li	t1,0
    100042ea:	870a                	mv	a4,sp
    100042ec:	4fa5                	li	t6,9
    100042ee:	a00d                	j	10004310 <_ntoa_long+0x5c>
    100042f0:	0305                	addi	t1,t1,1
    100042f2:	030e0e1b          	addiw	t3,t3,48
    100042f6:	00670f33          	add	t5,a4,t1
    100042fa:	ffcf0fa3          	sb	t3,-1(t5)
    100042fe:	fe030e13          	addi	t3,t1,-32
    10004302:	030edf33          	divu	t5,t4,a6
    10004306:	020e0663          	beqz	t3,10004332 <_ntoa_long+0x7e>
    1000430a:	030ee463          	bltu	t4,a6,10004332 <_ntoa_long+0x7e>
    1000430e:	8efa                	mv	t4,t5
    10004310:	030efe33          	remu	t3,t4,a6
    10004314:	fdcffee3          	bgeu	t6,t3,100042f0 <_ntoa_long+0x3c>
    10004318:	0305                	addi	t1,t1,1
    1000431a:	01c28e3b          	addw	t3,t0,t3
    1000431e:	00670f33          	add	t5,a4,t1
    10004322:	ffcf0fa3          	sb	t3,-1(t5)
    10004326:	fe030e13          	addi	t3,t1,-32
    1000432a:	030edf33          	divu	t5,t4,a6
    1000432e:	fc0e1ee3          	bnez	t3,1000430a <_ntoa_long+0x56>
    10004332:	0028fe13          	andi	t3,a7,2
    10004336:	8ec6                	mv	t4,a7
    10004338:	0c0e1763          	bnez	t3,10004406 <_ntoa_long+0x152>
    1000433c:	02049f13          	slli	t5,s1,0x20
    10004340:	020f5f13          	srli	t5,t5,0x20
    10004344:	0a038f63          	beqz	t2,10004402 <_ntoa_long+0x14e>
    10004348:	001efe93          	andi	t4,t4,1
    1000434c:	160e8c63          	beqz	t4,100044c4 <_ntoa_long+0x210>
    10004350:	00091663          	bnez	s2,1000435c <_ntoa_long+0xa8>
    10004354:	00c8fe13          	andi	t3,a7,12
    10004358:	000e0363          	beqz	t3,1000435e <_ntoa_long+0xaa>
    1000435c:	33fd                	addiw	t2,t2,-1
    1000435e:	02039e93          	slli	t4,t2,0x20
    10004362:	020ede93          	srli	t4,t4,0x20
    10004366:	4985                	li	s3,1
    10004368:	13e36763          	bltu	t1,t5,10004496 <_ntoa_long+0x1e2>
    1000436c:	03d37163          	bgeu	t1,t4,1000438e <_ntoa_long+0xda>
    10004370:	02000f13          	li	t5,32
    10004374:	03000f93          	li	t6,48
    10004378:	00098b63          	beqz	s3,1000438e <_ntoa_long+0xda>
    1000437c:	15e30c63          	beq	t1,t5,100044d4 <_ntoa_long+0x220>
    10004380:	0305                	addi	t1,t1,1
    10004382:	00670e33          	add	t3,a4,t1
    10004386:	fffe0fa3          	sb	t6,-1(t3)
    1000438a:	ffd369e3          	bltu	t1,t4,1000437c <_ntoa_long+0xc8>
    1000438e:	c469                	beqz	s0,10004458 <_ntoa_long+0x1a4>
    10004390:	00080e1b          	sext.w	t3,a6
    10004394:	e7d9                	bnez	a5,10004422 <_ntoa_long+0x16e>
    10004396:	06031c63          	bnez	t1,1000440e <_ntoa_long+0x15a>
    1000439a:	47c1                	li	a5,16
    1000439c:	1ef80c63          	beq	a6,a5,10004594 <_ntoa_long+0x2e0>
    100043a0:	4789                	li	a5,2
    100043a2:	1cf81a63          	bne	a6,a5,10004576 <_ntoa_long+0x2c2>
    100043a6:	06200813          	li	a6,98
    100043aa:	03000793          	li	a5,48
    100043ae:	01010023          	sb	a6,0(sp)
    100043b2:	00f100a3          	sb	a5,1(sp)
    100043b6:	4309                	li	t1,2
    100043b8:	0e091d63          	bnez	s2,100044b2 <_ntoa_long+0x1fe>
    100043bc:	0048f793          	andi	a5,a7,4
    100043c0:	12078c63          	beqz	a5,100044f8 <_ntoa_long+0x244>
    100043c4:	00230833          	add	a6,t1,sp
    100043c8:	02b00e13          	li	t3,43
    100043cc:	00130793          	addi	a5,t1,1
    100043d0:	01c80023          	sb	t3,0(a6)
    100043d4:	a841                	j	10004464 <_ntoa_long+0x1b0>
    100043d6:	fef37893          	andi	a7,t1,-17
    100043da:	c3d5                	beqz	a5,1000447e <_ntoa_long+0x1ca>
    100043dc:	00237413          	andi	s0,t1,2
    100043e0:	10041763          	bnez	s0,100044ee <_ntoa_long+0x23a>
    100043e4:	02049f13          	slli	t5,s1,0x20
    100043e8:	020f5f13          	srli	t5,t5,0x20
    100043ec:	08038b63          	beqz	t2,10004482 <_ntoa_long+0x1ce>
    100043f0:	00137313          	andi	t1,t1,1
    100043f4:	0e030863          	beqz	t1,100044e4 <_ntoa_long+0x230>
    100043f8:	4301                	li	t1,0
    100043fa:	40000793          	li	a5,1024
    100043fe:	870a                	mv	a4,sp
    10004400:	bf81                	j	10004350 <_ntoa_long+0x9c>
    10004402:	09e36663          	bltu	t1,t5,1000448e <_ntoa_long+0x1da>
    10004406:	c829                	beqz	s0,10004458 <_ntoa_long+0x1a4>
    10004408:	00080e1b          	sext.w	t3,a6
    1000440c:	eb99                	bnez	a5,10004422 <_ntoa_long+0x16e>
    1000440e:	02039793          	slli	a5,t2,0x20
    10004412:	9381                	srli	a5,a5,0x20
    10004414:	10678d63          	beq	a5,t1,1000452e <_ntoa_long+0x27a>
    10004418:	02049793          	slli	a5,s1,0x20
    1000441c:	9381                	srli	a5,a5,0x20
    1000441e:	10678863          	beq	a5,t1,1000452e <_ntoa_long+0x27a>
    10004422:	47c1                	li	a5,16
    10004424:	0efe0663          	beq	t3,a5,10004510 <_ntoa_long+0x25c>
    10004428:	1e79                	addi	t3,t3,-2
    1000442a:	000e1c63          	bnez	t3,10004442 <_ntoa_long+0x18e>
    1000442e:	fe030793          	addi	a5,t1,-32
    10004432:	cb81                	beqz	a5,10004442 <_ntoa_long+0x18e>
    10004434:	879a                	mv	a5,t1
    10004436:	0305                	addi	t1,t1,1
    10004438:	978a                	add	a5,a5,sp
    1000443a:	06200813          	li	a6,98
    1000443e:	01078023          	sb	a6,0(a5)
    10004442:	02000793          	li	a5,32
    10004446:	00f30d63          	beq	t1,a5,10004460 <_ntoa_long+0x1ac>
    1000444a:	879a                	mv	a5,t1
    1000444c:	0305                	addi	t1,t1,1
    1000444e:	978a                	add	a5,a5,sp
    10004450:	03000813          	li	a6,48
    10004454:	01078023          	sb	a6,0(a5)
    10004458:	02000793          	li	a5,32
    1000445c:	f4f31ee3          	bne	t1,a5,100043b8 <_ntoa_long+0x104>
    10004460:	02000793          	li	a5,32
    10004464:	881e                	mv	a6,t2
    10004466:	d7fff0ef          	jal	100041e4 <_out_rev>
    1000446a:	60a6                	ld	ra,72(sp)
    1000446c:	6406                	ld	s0,64(sp)
    1000446e:	74e2                	ld	s1,56(sp)
    10004470:	7942                	ld	s2,48(sp)
    10004472:	79a2                	ld	s3,40(sp)
    10004474:	6161                	addi	sp,sp,80
    10004476:	8082                	ret
    10004478:	04100293          	li	t0,65
    1000447c:	b5ad                	j	100042e6 <_ntoa_long+0x32>
    1000447e:	4401                	li	s0,0
    10004480:	bda1                	j	100042d8 <_ntoa_long+0x24>
    10004482:	4301                	li	t1,0
    10004484:	40000793          	li	a5,1024
    10004488:	870a                	mv	a4,sp
    1000448a:	060f0263          	beqz	t5,100044ee <_ntoa_long+0x23a>
    1000448e:	0018f993          	andi	s3,a7,1
    10004492:	4e81                	li	t4,0
    10004494:	4381                	li	t2,0
    10004496:	02000f93          	li	t6,32
    1000449a:	03000293          	li	t0,48
    1000449e:	edf307e3          	beq	t1,t6,1000436c <_ntoa_long+0xb8>
    100044a2:	0305                	addi	t1,t1,1
    100044a4:	00670e33          	add	t3,a4,t1
    100044a8:	fe5e0fa3          	sb	t0,-1(t3)
    100044ac:	ffe369e3          	bltu	t1,t5,1000449e <_ntoa_long+0x1ea>
    100044b0:	bd75                	j	1000436c <_ntoa_long+0xb8>
    100044b2:	00230833          	add	a6,t1,sp
    100044b6:	02d00e13          	li	t3,45
    100044ba:	00130793          	addi	a5,t1,1
    100044be:	01c80023          	sb	t3,0(a6)
    100044c2:	b74d                	j	10004464 <_ntoa_long+0x1b0>
    100044c4:	f5e371e3          	bgeu	t1,t5,10004406 <_ntoa_long+0x152>
    100044c8:	02039e93          	slli	t4,t2,0x20
    100044cc:	020ede93          	srli	t4,t4,0x20
    100044d0:	4981                	li	s3,0
    100044d2:	b7d1                	j	10004496 <_ntoa_long+0x1e2>
    100044d4:	d451                	beqz	s0,10004460 <_ntoa_long+0x1ac>
    100044d6:	00080e1b          	sext.w	t3,a6
    100044da:	db95                	beqz	a5,1000440e <_ntoa_long+0x15a>
    100044dc:	47c1                	li	a5,16
    100044de:	f6fe12e3          	bne	t3,a5,10004442 <_ntoa_long+0x18e>
    100044e2:	bfbd                	j	10004460 <_ntoa_long+0x1ac>
    100044e4:	40000793          	li	a5,1024
    100044e8:	870a                	mv	a4,sp
    100044ea:	fc0f1fe3          	bnez	t5,100044c8 <_ntoa_long+0x214>
    100044ee:	4301                	li	t1,0
    100044f0:	870a                	mv	a4,sp
    100044f2:	ec0905e3          	beqz	s2,100043bc <_ntoa_long+0x108>
    100044f6:	bf75                	j	100044b2 <_ntoa_long+0x1fe>
    100044f8:	0088f813          	andi	a6,a7,8
    100044fc:	879a                	mv	a5,t1
    100044fe:	f60803e3          	beqz	a6,10004464 <_ntoa_long+0x1b0>
    10004502:	930a                	add	t1,t1,sp
    10004504:	02000813          	li	a6,32
    10004508:	0785                	addi	a5,a5,1
    1000450a:	01030023          	sb	a6,0(t1)
    1000450e:	bf99                	j	10004464 <_ntoa_long+0x1b0>
    10004510:	0208f793          	andi	a5,a7,32
    10004514:	e3b9                	bnez	a5,1000455a <_ntoa_long+0x2a6>
    10004516:	02000793          	li	a5,32
    1000451a:	f4f303e3          	beq	t1,a5,10004460 <_ntoa_long+0x1ac>
    1000451e:	879a                	mv	a5,t1
    10004520:	0305                	addi	t1,t1,1
    10004522:	978a                	add	a5,a5,sp
    10004524:	07800813          	li	a6,120
    10004528:	01078023          	sb	a6,0(a5)
    1000452c:	bf19                	j	10004442 <_ntoa_long+0x18e>
    1000452e:	fff30793          	addi	a5,t1,-1
    10004532:	cbb1                	beqz	a5,10004586 <_ntoa_long+0x2d2>
    10004534:	ff0e0813          	addi	a6,t3,-16
    10004538:	04081763          	bnez	a6,10004586 <_ntoa_long+0x2d2>
    1000453c:	1379                	addi	t1,t1,-2
    1000453e:	02030413          	addi	s0,t1,32
    10004542:	0208f813          	andi	a6,a7,32
    10004546:	00240333          	add	t1,s0,sp
    1000454a:	04080e63          	beqz	a6,100045a6 <_ntoa_long+0x2f2>
    1000454e:	05800813          	li	a6,88
    10004552:	ff030023          	sb	a6,-32(t1)
    10004556:	833e                	mv	t1,a5
    10004558:	bdcd                	j	1000444a <_ntoa_long+0x196>
    1000455a:	02000793          	li	a5,32
    1000455e:	f0f301e3          	beq	t1,a5,10004460 <_ntoa_long+0x1ac>
    10004562:	879a                	mv	a5,t1
    10004564:	0305                	addi	t1,t1,1
    10004566:	02078793          	addi	a5,a5,32
    1000456a:	978a                	add	a5,a5,sp
    1000456c:	05800813          	li	a6,88
    10004570:	ff078023          	sb	a6,-32(a5)
    10004574:	b5f9                	j	10004442 <_ntoa_long+0x18e>
    10004576:	03000793          	li	a5,48
    1000457a:	00f10023          	sb	a5,0(sp)
    1000457e:	4305                	li	t1,1
    10004580:	e2090ee3          	beqz	s2,100043bc <_ntoa_long+0x108>
    10004584:	b73d                	j	100044b2 <_ntoa_long+0x1fe>
    10004586:	4841                	li	a6,16
    10004588:	030e0563          	beq	t3,a6,100045b2 <_ntoa_long+0x2fe>
    1000458c:	4809                	li	a6,2
    1000458e:	eb0e05e3          	beq	t3,a6,10004438 <_ntoa_long+0x184>
    10004592:	bd75                	j	1000444e <_ntoa_long+0x19a>
    10004594:	0208f793          	andi	a5,a7,32
    10004598:	05800813          	li	a6,88
    1000459c:	e00797e3          	bnez	a5,100043aa <_ntoa_long+0xf6>
    100045a0:	07800813          	li	a6,120
    100045a4:	b519                	j	100043aa <_ntoa_long+0xf6>
    100045a6:	07800813          	li	a6,120
    100045aa:	ff030023          	sb	a6,-32(t1)
    100045ae:	833e                	mv	t1,a5
    100045b0:	bd69                	j	1000444a <_ntoa_long+0x196>
    100045b2:	0208f813          	andi	a6,a7,32
    100045b6:	f60806e3          	beqz	a6,10004522 <_ntoa_long+0x26e>
    100045ba:	b775                	j	10004566 <_ntoa_long+0x2b2>

00000000100045bc <_etoa>:
    100045bc:	7159                	addi	sp,sp,-112
    100045be:	f0a2                	sd	s0,96(sp)
    100045c0:	842a                	mv	s0,a0
    100045c2:	a2a52553          	feq.d	a0,fa0,fa0
    100045c6:	f486                	sd	ra,104(sp)
    100045c8:	1a050e63          	beqz	a0,10004784 <_etoa+0x1c8>
    100045cc:	00001517          	auipc	a0,0x1
    100045d0:	ffc53787          	fld	fa5,-4(a0) # 100055c8 <pow10.0+0x50>
    100045d4:	a2a79553          	flt.d	a0,fa5,fa0
    100045d8:	1a051663          	bnez	a0,10004784 <_etoa+0x1c8>
    100045dc:	00001517          	auipc	a0,0x1
    100045e0:	ff453787          	fld	fa5,-12(a0) # 100055d0 <pow10.0+0x58>
    100045e4:	a2f51553          	flt.d	a0,fa0,fa5
    100045e8:	18051e63          	bnez	a0,10004784 <_etoa+0x1c8>
    100045ec:	f20007d3          	fmv.d.x	fa5,zero
    100045f0:	e2050e53          	fmv.x.d	t3,fa0
    100045f4:	a2f51553          	flt.d	a0,fa0,fa5
    100045f8:	c509                	beqz	a0,10004602 <_etoa+0x46>
    100045fa:	22a517d3          	fneg.d	fa5,fa0
    100045fe:	e2078e53          	fmv.x.d	t3,fa5
    10004602:	40087f93          	andi	t6,a6,1024
    10004606:	000f9363          	bnez	t6,1000460c <_etoa+0x50>
    1000460a:	4719                	li	a4,6
    1000460c:	034e5513          	srli	a0,t3,0x34
    10004610:	7ff57513          	andi	a0,a0,2047
    10004614:	c015051b          	addiw	a0,a0,-1023
    10004618:	d2050753          	fcvt.d.w	fa4,a0
    1000461c:	00001517          	auipc	a0,0x1
    10004620:	fc453687          	fld	fa3,-60(a0) # 100055e0 <pow10.0+0x68>
    10004624:	00001517          	auipc	a0,0x1
    10004628:	fc453787          	fld	fa5,-60(a0) # 100055e8 <pow10.0+0x70>
    1000462c:	3ff00893          	li	a7,1023
    10004630:	00ce1513          	slli	a0,t3,0xc
    10004634:	18d2                	slli	a7,a7,0x34
    10004636:	8131                	srli	a0,a0,0xc
    10004638:	01156533          	or	a0,a0,a7
    1000463c:	00001317          	auipc	t1,0x1
    10004640:	7ad77743          	fmadd.d	fa4,fa4,fa3,fa5
    10004644:	f20506d3          	fmv.d.x	fa3,a0
    10004648:	f9c33787          	fld	fa5,-100(t1) # 100055d8 <pow10.0+0x60>
    1000464c:	00001517          	auipc	a0,0x1
    10004650:	fa453587          	fld	fa1,-92(a0) # 100055f0 <pow10.0+0x78>
    10004654:	0af6f7d3          	fsub.d	fa5,fa3,fa5
    10004658:	00001517          	auipc	a0,0x1
    1000465c:	fa053687          	fld	fa3,-96(a0) # 100055f8 <pow10.0+0x80>
    10004660:	00001517          	auipc	a0,0x1
    10004664:	fa053607          	fld	fa2,-96(a0) # 10005600 <pow10.0+0x88>
    10004668:	00001517          	auipc	a0,0x1
    1000466c:	fa053187          	fld	ft3,-96(a0) # 10005608 <pow10.0+0x90>
    10004670:	72b7f7c3          	fmadd.d	fa5,fa5,fa1,fa4
    10004674:	00001517          	auipc	a0,0x1
    10004678:	f9c53107          	fld	ft2,-100(a0) # 10005610 <pow10.0+0x98>
    1000467c:	00001517          	auipc	a0,0x1
    10004680:	f9c53707          	fld	fa4,-100(a0) # 10005618 <pow10.0+0xa0>
    10004684:	00001517          	auipc	a0,0x1
    10004688:	f9c53587          	fld	fa1,-100(a0) # 10005620 <pow10.0+0xa8>
    1000468c:	c2079ed3          	fcvt.w.d	t4,fa5,rtz
    10004690:	00001517          	auipc	a0,0x1
    10004694:	f9853087          	fld	ft1,-104(a0) # 10005628 <pow10.0+0xb0>
    10004698:	d20e87d3          	fcvt.d.w	fa5,t4
    1000469c:	00001517          	auipc	a0,0x1
    100046a0:	62d7f6c3          	fmadd.d	fa3,fa5,fa3,fa2
    100046a4:	f9453607          	fld	fa2,-108(a0) # 10005630 <pow10.0+0xb8>
    100046a8:	00001517          	auipc	a0,0x1
    100046ac:	f9053007          	fld	ft0,-112(a0) # 10005638 <pow10.0+0xc0>
    100046b0:	c2069553          	fcvt.w.d	a0,fa3,rtz
    100046b4:	d20506d3          	fcvt.d.w	fa3,a0
    100046b8:	3ff5051b          	addiw	a0,a0,1023
    100046bc:	1552                	slli	a0,a0,0x34
    100046be:	1236f6d3          	fmul.d	fa3,fa3,ft3
    100046c2:	6a27f7c7          	fmsub.d	fa5,fa5,ft2,fa3
    100046c6:	12f7f6d3          	fmul.d	fa3,fa5,fa5
    100046ca:	0af67653          	fsub.d	fa2,fa2,fa5
    100046ce:	02f7f7d3          	fadd.d	fa5,fa5,fa5
    100046d2:	1ae6f753          	fdiv.d	fa4,fa3,fa4
    100046d6:	02b77753          	fadd.d	fa4,fa4,fa1
    100046da:	1ae6f753          	fdiv.d	fa4,fa3,fa4
    100046de:	02177753          	fadd.d	fa4,fa4,ft1
    100046e2:	1ae6f6d3          	fdiv.d	fa3,fa3,fa4
    100046e6:	f2050753          	fmv.d.x	fa4,a0
    100046ea:	02c6f6d3          	fadd.d	fa3,fa3,fa2
    100046ee:	1ad7f7d3          	fdiv.d	fa5,fa5,fa3
    100046f2:	0207f7d3          	fadd.d	fa5,fa5,ft0
    100046f6:	12e7f7d3          	fmul.d	fa5,fa5,fa4
    100046fa:	f20e0753          	fmv.d.x	fa4,t3
    100046fe:	a2f71553          	flt.d	a0,fa4,fa5
    10004702:	e20788d3          	fmv.x.d	a7,fa5
    10004706:	c511                	beqz	a0,10004712 <_etoa+0x156>
    10004708:	1ab7f7d3          	fdiv.d	fa5,fa5,fa1
    1000470c:	3efd                	addiw	t4,t4,-1
    1000470e:	e20788d3          	fmv.x.d	a7,fa5
    10004712:	6505                	lui	a0,0x1
    10004714:	0c600f13          	li	t5,198
    10004718:	80050513          	addi	a0,a0,-2048 # 800 <__stack_pointer$+0x800>
    1000471c:	063e831b          	addiw	t1,t4,99
    10004720:	006f3333          	sltu	t1,t5,t1
    10004724:	00a87533          	and	a0,a6,a0
    10004728:	0311                	addi	t1,t1,4
    1000472a:	00287f13          	andi	t5,a6,2
    1000472e:	c125                	beqz	a0,1000478e <_etoa+0x1d2>
    10004730:	00001517          	auipc	a0,0x1
    10004734:	f1053787          	fld	fa5,-240(a0) # 10005640 <pow10.0+0xc8>
    10004738:	f20e0753          	fmv.d.x	fa4,t3
    1000473c:	a2e78553          	fle.d	a0,fa5,fa4
    10004740:	14050663          	beqz	a0,1000488c <_etoa+0x2d0>
    10004744:	00001517          	auipc	a0,0x1
    10004748:	f0453787          	fld	fa5,-252(a0) # 10005648 <pow10.0+0xd0>
    1000474c:	a2f71553          	flt.d	a0,fa4,fa5
    10004750:	12050e63          	beqz	a0,1000488c <_etoa+0x2d0>
    10004754:	4881                	li	a7,0
    10004756:	00eed563          	bge	t4,a4,10004760 <_etoa+0x1a4>
    1000475a:	41d708bb          	subw	a7,a4,t4
    1000475e:	38fd                	addiw	a7,a7,-1
    10004760:	f20007d3          	fmv.d.x	fa5,zero
    10004764:	a2f51753          	flt.d	a4,fa0,fa5
    10004768:	16071263          	bnez	a4,100048cc <_etoa+0x310>
    1000476c:	757d                	lui	a0,0xfffff
    1000476e:	f20e0553          	fmv.d.x	fa0,t3
    10004772:	7ff50513          	addi	a0,a0,2047 # fffffffffffff7ff <evict_data+0xffffffff7fffd7ff>
    10004776:	00a87833          	and	a6,a6,a0
    1000477a:	8746                	mv	a4,a7
    1000477c:	8522                	mv	a0,s0
    1000477e:	40086813          	ori	a6,a6,1024
    10004782:	a011                	j	10004786 <_etoa+0x1ca>
    10004784:	8522                	mv	a0,s0
    10004786:	7406                	ld	s0,96(sp)
    10004788:	70a6                	ld	ra,104(sp)
    1000478a:	6165                	addi	sp,sp,112
    1000478c:	aaa9                	j	100048e6 <_ftoa>
    1000478e:	eca6                	sd	s1,88(sp)
    10004790:	e8ca                	sd	s2,80(sp)
    10004792:	e4ce                	sd	s3,72(sp)
    10004794:	e0d2                	sd	s4,64(sp)
    10004796:	fc56                	sd	s5,56(sp)
    10004798:	00f37563          	bgeu	t1,a5,100047a2 <_etoa+0x1e6>
    1000479c:	100f0963          	beqz	t5,100048ae <_etoa+0x2f2>
    100047a0:	4f09                	li	t5,2
    100047a2:	000e8a63          	beqz	t4,100047b6 <_etoa+0x1fa>
    100047a6:	f20e07d3          	fmv.d.x	fa5,t3
    100047aa:	f2088753          	fmv.d.x	fa4,a7
    100047ae:	1ae7f7d3          	fdiv.d	fa5,fa5,fa4
    100047b2:	e2078e53          	fmv.x.d	t3,fa5
    100047b6:	f20007d3          	fmv.d.x	fa5,zero
    100047ba:	8abe                	mv	s5,a5
    100047bc:	f47a                	sd	t5,40(sp)
    100047be:	a2f517d3          	flt.d	a5,fa0,fa5
    100047c2:	f01a                	sd	t1,32(sp)
    100047c4:	ec76                	sd	t4,24(sp)
    100047c6:	f20e0553          	fmv.d.x	fa0,t3
    100047ca:	88c2                	mv	a7,a6
    100047cc:	8936                	mv	s2,a3
    100047ce:	8a32                	mv	s4,a2
    100047d0:	84ae                	mv	s1,a1
    100047d2:	10079763          	bnez	a5,100048e0 <_etoa+0x324>
    100047d6:	787d                	lui	a6,0xfffff
    100047d8:	7ff80813          	addi	a6,a6,2047 # fffffffffffff7ff <evict_data+0xffffffff7fffd7ff>
    100047dc:	0108f833          	and	a6,a7,a6
    100047e0:	87aa                	mv	a5,a0
    100047e2:	8652                	mv	a2,s4
    100047e4:	86ca                	mv	a3,s2
    100047e6:	85a6                	mv	a1,s1
    100047e8:	8522                	mv	a0,s0
    100047ea:	e846                	sd	a7,16(sp)
    100047ec:	0fa000ef          	jal	100048e6 <_ftoa>
    100047f0:	68c2                	ld	a7,16(sp)
    100047f2:	862a                	mv	a2,a0
    100047f4:	6ee2                	ld	t4,24(sp)
    100047f6:	0208f813          	andi	a6,a7,32
    100047fa:	7302                	ld	t1,32(sp)
    100047fc:	7f22                	ld	t5,40(sp)
    100047fe:	06500513          	li	a0,101
    10004802:	00080463          	beqz	a6,1000480a <_etoa+0x24e>
    10004806:	04500513          	li	a0,69
    1000480a:	f07a                	sd	t5,32(sp)
    1000480c:	ec1a                	sd	t1,24(sp)
    1000480e:	e876                	sd	t4,16(sp)
    10004810:	86ca                	mv	a3,s2
    10004812:	85a6                	mv	a1,s1
    10004814:	00160993          	addi	s3,a2,1
    10004818:	9402                	jalr	s0
    1000481a:	6ec2                	ld	t4,16(sp)
    1000481c:	6362                	ld	t1,24(sp)
    1000481e:	4715                	li	a4,5
    10004820:	41fed79b          	sraiw	a5,t4,0x1f
    10004824:	337d                	addiw	t1,t1,-1
    10004826:	e43a                	sd	a4,8(sp)
    10004828:	00fec733          	xor	a4,t4,a5
    1000482c:	9f1d                	subw	a4,a4,a5
    1000482e:	e01a                	sd	t1,0(sp)
    10004830:	864e                	mv	a2,s3
    10004832:	01fed79b          	srliw	a5,t4,0x1f
    10004836:	86ca                	mv	a3,s2
    10004838:	85a6                	mv	a1,s1
    1000483a:	8522                	mv	a0,s0
    1000483c:	4881                	li	a7,0
    1000483e:	4829                	li	a6,10
    10004840:	a75ff0ef          	jal	100042b4 <_ntoa_long>
    10004844:	7f02                	ld	t5,32(sp)
    10004846:	872a                	mv	a4,a0
    10004848:	020f0863          	beqz	t5,10004878 <_etoa+0x2bc>
    1000484c:	020a9793          	slli	a5,s5,0x20
    10004850:	9381                	srli	a5,a5,0x20
    10004852:	41450833          	sub	a6,a0,s4
    10004856:	89be                	mv	s3,a5
    10004858:	02f87063          	bgeu	a6,a5,10004878 <_etoa+0x2bc>
    1000485c:	863a                	mv	a2,a4
    1000485e:	0705                	addi	a4,a4,1
    10004860:	ec42                	sd	a6,24(sp)
    10004862:	e83a                	sd	a4,16(sp)
    10004864:	86ca                	mv	a3,s2
    10004866:	85a6                	mv	a1,s1
    10004868:	02000513          	li	a0,32
    1000486c:	9402                	jalr	s0
    1000486e:	6862                	ld	a6,24(sp)
    10004870:	6742                	ld	a4,16(sp)
    10004872:	0805                	addi	a6,a6,1
    10004874:	ff3864e3          	bltu	a6,s3,1000485c <_etoa+0x2a0>
    10004878:	70a6                	ld	ra,104(sp)
    1000487a:	7406                	ld	s0,96(sp)
    1000487c:	64e6                	ld	s1,88(sp)
    1000487e:	6946                	ld	s2,80(sp)
    10004880:	69a6                	ld	s3,72(sp)
    10004882:	6a06                	ld	s4,64(sp)
    10004884:	7ae2                	ld	s5,56(sp)
    10004886:	853a                	mv	a0,a4
    10004888:	6165                	addi	sp,sp,112
    1000488a:	8082                	ret
    1000488c:	eca6                	sd	s1,88(sp)
    1000488e:	e8ca                	sd	s2,80(sp)
    10004890:	e4ce                	sd	s3,72(sp)
    10004892:	e0d2                	sd	s4,64(sp)
    10004894:	fc56                	sd	s5,56(sp)
    10004896:	cf19                	beqz	a4,100048b4 <_etoa+0x2f8>
    10004898:	020f8663          	beqz	t6,100048c4 <_etoa+0x308>
    1000489c:	377d                	addiw	a4,a4,-1
    1000489e:	4501                	li	a0,0
    100048a0:	f0f371e3          	bgeu	t1,a5,100047a2 <_etoa+0x1e6>
    100048a4:	000f0563          	beqz	t5,100048ae <_etoa+0x2f2>
    100048a8:	4f09                	li	t5,2
    100048aa:	4501                	li	a0,0
    100048ac:	bddd                	j	100047a2 <_etoa+0x1e6>
    100048ae:	4067853b          	subw	a0,a5,t1
    100048b2:	bdc5                	j	100047a2 <_etoa+0x1e6>
    100048b4:	4501                	li	a0,0
    100048b6:	eef376e3          	bgeu	t1,a5,100047a2 <_etoa+0x1e6>
    100048ba:	fe0f0ae3          	beqz	t5,100048ae <_etoa+0x2f2>
    100048be:	4501                	li	a0,0
    100048c0:	4f09                	li	t5,2
    100048c2:	b5c5                	j	100047a2 <_etoa+0x1e6>
    100048c4:	fef36be3          	bltu	t1,a5,100048ba <_etoa+0x2fe>
    100048c8:	4501                	li	a0,0
    100048ca:	bde1                	j	100047a2 <_etoa+0x1e6>
    100048cc:	f20e07d3          	fmv.d.x	fa5,t3
    100048d0:	777d                	lui	a4,0xfffff
    100048d2:	7ff70713          	addi	a4,a4,2047 # fffffffffffff7ff <evict_data+0xffffffff7fffd7ff>
    100048d6:	22f79553          	fneg.d	fa0,fa5
    100048da:	00e87833          	and	a6,a6,a4
    100048de:	bd71                	j	1000477a <_etoa+0x1be>
    100048e0:	22a51553          	fneg.d	fa0,fa0
    100048e4:	bdcd                	j	100047d6 <_etoa+0x21a>

00000000100048e6 <_ftoa>:
    100048e6:	a2a528d3          	feq.d	a7,fa0,fa0
    100048ea:	12088763          	beqz	a7,10004a18 <_ftoa+0x132>
    100048ee:	00001897          	auipc	a7,0x1
    100048f2:	ce28b787          	fld	fa5,-798(a7) # 100055d0 <pow10.0+0x58>
    100048f6:	a2f518d3          	flt.d	a7,fa0,fa5
    100048fa:	18089363          	bnez	a7,10004a80 <_ftoa+0x19a>
    100048fe:	7139                	addi	sp,sp,-64
    10004900:	f426                	sd	s1,40(sp)
    10004902:	84b6                	mv	s1,a3
    10004904:	00001697          	auipc	a3,0x1
    10004908:	cc46b787          	fld	fa5,-828(a3) # 100055c8 <pow10.0+0x50>
    1000490c:	f822                	sd	s0,48(sp)
    1000490e:	fc06                	sd	ra,56(sp)
    10004910:	a2a796d3          	flt.d	a3,fa5,fa0
    10004914:	842a                	mv	s0,a0
    10004916:	82ae                	mv	t0,a1
    10004918:	83b2                	mv	t2,a2
    1000491a:	eaf1                	bnez	a3,100049ee <_ftoa+0x108>
    1000491c:	00001697          	auipc	a3,0x1
    10004920:	d346b787          	fld	fa5,-716(a3) # 10005650 <pow10.0+0xd8>
    10004924:	a2a796d3          	flt.d	a3,fa5,fa0
    10004928:	14069363          	bnez	a3,10004a6e <_ftoa+0x188>
    1000492c:	00001697          	auipc	a3,0x1
    10004930:	d2c6b787          	fld	fa5,-724(a3) # 10005658 <pow10.0+0xe0>
    10004934:	a2f516d3          	flt.d	a3,fa0,fa5
    10004938:	12069b63          	bnez	a3,10004a6e <_ftoa+0x188>
    1000493c:	f20007d3          	fmv.d.x	fa5,zero
    10004940:	f04a                	sd	s2,32(sp)
    10004942:	4901                	li	s2,0
    10004944:	a2f516d3          	flt.d	a3,fa0,fa5
    10004948:	10069f63          	bnez	a3,10004a66 <_ftoa+0x180>
    1000494c:	40087693          	andi	a3,a6,1024
    10004950:	eee9                	bnez	a3,10004a2a <_ftoa+0x144>
    10004952:	00001717          	auipc	a4,0x1
    10004956:	cf673707          	fld	fa4,-778(a4) # 10005648 <pow10.0+0xd0>
    1000495a:	4301                	li	t1,0
    1000495c:	4719                	li	a4,6
    1000495e:	868a                	mv	a3,sp
    10004960:	c2051f53          	fcvt.w.d	t5,fa0,rtz
    10004964:	00001597          	auipc	a1,0x1
    10004968:	c9c5b687          	fld	fa3,-868(a1) # 10005600 <pow10.0+0x88>
    1000496c:	d20f07d3          	fcvt.d.w	fa5,t5
    10004970:	0af577d3          	fsub.d	fa5,fa0,fa5
    10004974:	12e7f7d3          	fmul.d	fa5,fa5,fa4
    10004978:	c2379553          	fcvt.lu.d	a0,fa5,rtz
    1000497c:	d2357653          	fcvt.d.lu	fa2,a0
    10004980:	0ac7f7d3          	fsub.d	fa5,fa5,fa2
    10004984:	a2f695d3          	flt.d	a1,fa3,fa5
    10004988:	10058563          	beqz	a1,10004a92 <_ftoa+0x1ac>
    1000498c:	0505                	addi	a0,a0,1
    1000498e:	d23577d3          	fcvt.d.lu	fa5,a0
    10004992:	a2f705d3          	fle.d	a1,fa4,fa5
    10004996:	c199                	beqz	a1,1000499c <_ftoa+0xb6>
    10004998:	2f05                	addiw	t5,t5,1
    1000499a:	4501                	li	a0,0
    1000499c:	10070463          	beqz	a4,10004aa4 <_ftoa+0x1be>
    100049a0:	ccccd8b7          	lui	a7,0xccccd
    100049a4:	ccd88893          	addi	a7,a7,-819 # ffffffffcccccccd <evict_data+0xffffffff4cccaccd>
    100049a8:	02089593          	slli	a1,a7,0x20
    100049ac:	fe070e9b          	addiw	t4,a4,-32
    100049b0:	01158fb3          	add	t6,a1,a7
    100049b4:	006e8ebb          	addw	t4,t4,t1
    100049b8:	4625                	li	a2,9
    100049ba:	a015                	j	100049de <_ftoa+0xf8>
    100049bc:	03f535b3          	mulhu	a1,a0,t6
    100049c0:	377d                	addiw	a4,a4,-1
    100049c2:	818d                	srli	a1,a1,0x3
    100049c4:	00259e13          	slli	t3,a1,0x2
    100049c8:	9e2e                	add	t3,t3,a1
    100049ca:	0e06                	slli	t3,t3,0x1
    100049cc:	41c50e33          	sub	t3,a0,t3
    100049d0:	030e0e1b          	addiw	t3,t3,48
    100049d4:	ffc88fa3          	sb	t3,-1(a7)
    100049d8:	1aa67663          	bgeu	a2,a0,10004b84 <_ftoa+0x29e>
    100049dc:	852e                	mv	a0,a1
    100049de:	0305                	addi	t1,t1,1
    100049e0:	006688b3          	add	a7,a3,t1
    100049e4:	fdd71ce3          	bne	a4,t4,100049bc <_ftoa+0xd6>
    100049e8:	02000313          	li	t1,32
    100049ec:	a8d1                	j	10004ac0 <_ftoa+0x1da>
    100049ee:	00487713          	andi	a4,a6,4
    100049f2:	e725                	bnez	a4,10004a5a <_ftoa+0x174>
    100049f4:	00001717          	auipc	a4,0x1
    100049f8:	9cc70713          	addi	a4,a4,-1588 # 100053c0 <_putchar+0x64>
    100049fc:	468d                	li	a3,3
    100049fe:	8522                	mv	a0,s0
    10004a00:	7442                	ld	s0,48(sp)
    10004a02:	70e2                	ld	ra,56(sp)
    10004a04:	88c2                	mv	a7,a6
    10004a06:	883e                	mv	a6,a5
    10004a08:	87b6                	mv	a5,a3
    10004a0a:	86a6                	mv	a3,s1
    10004a0c:	74a2                	ld	s1,40(sp)
    10004a0e:	861e                	mv	a2,t2
    10004a10:	8596                	mv	a1,t0
    10004a12:	6121                	addi	sp,sp,64
    10004a14:	fd0ff06f          	j	100041e4 <_out_rev>
    10004a18:	00001717          	auipc	a4,0x1
    10004a1c:	88c2                	mv	a7,a6
    10004a1e:	9b070713          	addi	a4,a4,-1616 # 100053c8 <_putchar+0x6c>
    10004a22:	883e                	mv	a6,a5
    10004a24:	478d                	li	a5,3
    10004a26:	fbeff06f          	j	100041e4 <_out_rev>
    10004a2a:	45a5                	li	a1,9
    10004a2c:	4301                	li	t1,0
    10004a2e:	868a                	mv	a3,sp
    10004a30:	03000893          	li	a7,48
    10004a34:	1ee5f663          	bgeu	a1,a4,10004c20 <_ftoa+0x33a>
    10004a38:	0305                	addi	t1,t1,1
    10004a3a:	006685b3          	add	a1,a3,t1
    10004a3e:	ff158fa3          	sb	a7,-1(a1)
    10004a42:	377d                	addiw	a4,a4,-1
    10004a44:	fe030593          	addi	a1,t1,-32
    10004a48:	ff770513          	addi	a0,a4,-9
    10004a4c:	c191                	beqz	a1,10004a50 <_ftoa+0x16a>
    10004a4e:	f56d                	bnez	a0,10004a38 <_ftoa+0x152>
    10004a50:	00001597          	auipc	a1,0x1
    10004a54:	c005b707          	fld	fa4,-1024(a1) # 10005650 <pow10.0+0xd8>
    10004a58:	b721                	j	10004960 <_ftoa+0x7a>
    10004a5a:	00001717          	auipc	a4,0x1
    10004a5e:	95670713          	addi	a4,a4,-1706 # 100053b0 <_putchar+0x54>
    10004a62:	4691                	li	a3,4
    10004a64:	bf69                	j	100049fe <_ftoa+0x118>
    10004a66:	0aa7f553          	fsub.d	fa0,fa5,fa0
    10004a6a:	4905                	li	s2,1
    10004a6c:	b5c5                	j	1000494c <_ftoa+0x66>
    10004a6e:	8522                	mv	a0,s0
    10004a70:	7442                	ld	s0,48(sp)
    10004a72:	70e2                	ld	ra,56(sp)
    10004a74:	86a6                	mv	a3,s1
    10004a76:	74a2                	ld	s1,40(sp)
    10004a78:	861e                	mv	a2,t2
    10004a7a:	8596                	mv	a1,t0
    10004a7c:	6121                	addi	sp,sp,64
    10004a7e:	be3d                	j	100045bc <_etoa>
    10004a80:	00001717          	auipc	a4,0x1
    10004a84:	88c2                	mv	a7,a6
    10004a86:	95070713          	addi	a4,a4,-1712 # 100053d0 <_putchar+0x74>
    10004a8a:	883e                	mv	a6,a5
    10004a8c:	4791                	li	a5,4
    10004a8e:	f56ff06f          	j	100041e4 <_out_rev>
    10004a92:	a2d795d3          	flt.d	a1,fa5,fa3
    10004a96:	f00593e3          	bnez	a1,1000499c <_ftoa+0xb6>
    10004a9a:	16051763          	bnez	a0,10004c08 <_ftoa+0x322>
    10004a9e:	0505                	addi	a0,a0,1
    10004aa0:	f00710e3          	bnez	a4,100049a0 <_ftoa+0xba>
    10004aa4:	d20f07d3          	fcvt.d.w	fa5,t5
    10004aa8:	00001717          	auipc	a4,0x1
    10004aac:	b5873707          	fld	fa4,-1192(a4) # 10005600 <pow10.0+0x88>
    10004ab0:	0af57553          	fsub.d	fa0,fa0,fa5
    10004ab4:	a2e51753          	flt.d	a4,fa0,fa4
    10004ab8:	e701                	bnez	a4,10004ac0 <_ftoa+0x1da>
    10004aba:	2f05                	addiw	t5,t5,1
    10004abc:	ffef7f13          	andi	t5,t5,-2
    10004ac0:	66666537          	lui	a0,0x66666
    10004ac4:	66750513          	addi	a0,a0,1639 # 66666667 <__bss_end+0x56661007>
    10004ac8:	02000893          	li	a7,32
    10004acc:	a80d                	j	10004afe <_ftoa+0x218>
    10004ace:	02af0eb3          	mul	t4,t5,a0
    10004ad2:	0305                	addi	t1,t1,1
    10004ad4:	006685b3          	add	a1,a3,t1
    10004ad8:	422ede93          	srai	t4,t4,0x22
    10004adc:	40ee8ebb          	subw	t4,t4,a4
    10004ae0:	002e9e1b          	slliw	t3,t4,0x2
    10004ae4:	01de0e3b          	addw	t3,t3,t4
    10004ae8:	001e1e1b          	slliw	t3,t3,0x1
    10004aec:	41cf0e3b          	subw	t3,t5,t3
    10004af0:	030e0e1b          	addiw	t3,t3,48
    10004af4:	ffc58fa3          	sb	t3,-1(a1)
    10004af8:	8f76                	mv	t5,t4
    10004afa:	040e8363          	beqz	t4,10004b40 <_ftoa+0x25a>
    10004afe:	41ff571b          	sraiw	a4,t5,0x1f
    10004b02:	fd1316e3          	bne	t1,a7,10004ace <_ftoa+0x1e8>
    10004b06:	00387713          	andi	a4,a6,3
    10004b0a:	4585                	li	a1,1
    10004b0c:	04b71c63          	bne	a4,a1,10004b64 <_ftoa+0x27e>
    10004b10:	cbb1                	beqz	a5,10004b64 <_ftoa+0x27e>
    10004b12:	0a090763          	beqz	s2,10004bc0 <_ftoa+0x2da>
    10004b16:	37fd                	addiw	a5,a5,-1
    10004b18:	04f37663          	bgeu	t1,a5,10004b64 <_ftoa+0x27e>
    10004b1c:	02079893          	slli	a7,a5,0x20
    10004b20:	0208d893          	srli	a7,a7,0x20
    10004b24:	02000593          	li	a1,32
    10004b28:	03000513          	li	a0,48
    10004b2c:	02b30c63          	beq	t1,a1,10004b64 <_ftoa+0x27e>
    10004b30:	0305                	addi	t1,t1,1
    10004b32:	00668733          	add	a4,a3,t1
    10004b36:	fea70fa3          	sb	a0,-1(a4)
    10004b3a:	ff1369e3          	bltu	t1,a7,10004b2c <_ftoa+0x246>
    10004b3e:	a031                	j	10004b4a <_ftoa+0x264>
    10004b40:	00387713          	andi	a4,a6,3
    10004b44:	4585                	li	a1,1
    10004b46:	0eb70663          	beq	a4,a1,10004c32 <_ftoa+0x34c>
    10004b4a:	02000713          	li	a4,32
    10004b4e:	00e30b63          	beq	t1,a4,10004b64 <_ftoa+0x27e>
    10004b52:	08090463          	beqz	s2,10004bda <_ftoa+0x2f4>
    10004b56:	00230733          	add	a4,t1,sp
    10004b5a:	02d00613          	li	a2,45
    10004b5e:	00c70023          	sb	a2,0(a4)
    10004b62:	0305                	addi	t1,t1,1
    10004b64:	8522                	mv	a0,s0
    10004b66:	88c2                	mv	a7,a6
    10004b68:	8736                	mv	a4,a3
    10004b6a:	883e                	mv	a6,a5
    10004b6c:	86a6                	mv	a3,s1
    10004b6e:	861e                	mv	a2,t2
    10004b70:	8596                	mv	a1,t0
    10004b72:	879a                	mv	a5,t1
    10004b74:	e70ff0ef          	jal	100041e4 <_out_rev>
    10004b78:	70e2                	ld	ra,56(sp)
    10004b7a:	7442                	ld	s0,48(sp)
    10004b7c:	7902                	ld	s2,32(sp)
    10004b7e:	74a2                	ld	s1,40(sp)
    10004b80:	6121                	addi	sp,sp,64
    10004b82:	8082                	ret
    10004b84:	02000593          	li	a1,32
    10004b88:	e6b300e3          	beq	t1,a1,100049e8 <_ftoa+0x102>
    10004b8c:	02071e13          	slli	t3,a4,0x20
    10004b90:	020e5e13          	srli	t3,t3,0x20
    10004b94:	03000513          	li	a0,48
    10004b98:	9e1a                	add	t3,t3,t1
    10004b9a:	006e0c63          	beq	t3,t1,10004bb2 <_ftoa+0x2cc>
    10004b9e:	0305                	addi	t1,t1,1
    10004ba0:	00668733          	add	a4,a3,t1
    10004ba4:	fea70fa3          	sb	a0,-1(a4)
    10004ba8:	feb319e3          	bne	t1,a1,10004b9a <_ftoa+0x2b4>
    10004bac:	02000313          	li	t1,32
    10004bb0:	bf01                	j	10004ac0 <_ftoa+0x1da>
    10004bb2:	9e0a                	add	t3,t3,sp
    10004bb4:	02e00713          	li	a4,46
    10004bb8:	0305                	addi	t1,t1,1
    10004bba:	00ee0023          	sb	a4,0(t3)
    10004bbe:	b709                	j	10004ac0 <_ftoa+0x1da>
    10004bc0:	00c87713          	andi	a4,a6,12
    10004bc4:	cb21                	beqz	a4,10004c14 <_ftoa+0x32e>
    10004bc6:	37fd                	addiw	a5,a5,-1
    10004bc8:	02079713          	slli	a4,a5,0x20
    10004bcc:	9301                	srli	a4,a4,0x20
    10004bce:	f4e367e3          	bltu	t1,a4,10004b1c <_ftoa+0x236>
    10004bd2:	02000713          	li	a4,32
    10004bd6:	f8e307e3          	beq	t1,a4,10004b64 <_ftoa+0x27e>
    10004bda:	00487713          	andi	a4,a6,4
    10004bde:	cb09                	beqz	a4,10004bf0 <_ftoa+0x30a>
    10004be0:	00230733          	add	a4,t1,sp
    10004be4:	02b00613          	li	a2,43
    10004be8:	00c70023          	sb	a2,0(a4)
    10004bec:	0305                	addi	t1,t1,1
    10004bee:	bf9d                	j	10004b64 <_ftoa+0x27e>
    10004bf0:	00887713          	andi	a4,a6,8
    10004bf4:	db25                	beqz	a4,10004b64 <_ftoa+0x27e>
    10004bf6:	02000613          	li	a2,32
    10004bfa:	00c30733          	add	a4,t1,a2
    10004bfe:	970a                	add	a4,a4,sp
    10004c00:	fec70023          	sb	a2,-32(a4)
    10004c04:	0305                	addi	t1,t1,1
    10004c06:	bfb9                	j	10004b64 <_ftoa+0x27e>
    10004c08:	00157593          	andi	a1,a0,1
    10004c0c:	d80588e3          	beqz	a1,1000499c <_ftoa+0xb6>
    10004c10:	0505                	addi	a0,a0,1
    10004c12:	b579                	j	10004aa0 <_ftoa+0x1ba>
    10004c14:	02079713          	slli	a4,a5,0x20
    10004c18:	9301                	srli	a4,a4,0x20
    10004c1a:	f0e361e3          	bltu	t1,a4,10004b1c <_ftoa+0x236>
    10004c1e:	b799                	j	10004b64 <_ftoa+0x27e>
    10004c20:	02071893          	slli	a7,a4,0x20
    10004c24:	08818593          	addi	a1,gp,136 # 10005578 <pow10.0>
    10004c28:	01d8d513          	srli	a0,a7,0x1d
    10004c2c:	95aa                	add	a1,a1,a0
    10004c2e:	2198                	fld	fa4,0(a1)
    10004c30:	bb05                	j	10004960 <_ftoa+0x7a>
    10004c32:	df81                	beqz	a5,10004b4a <_ftoa+0x264>
    10004c34:	f80906e3          	beqz	s2,10004bc0 <_ftoa+0x2da>
    10004c38:	37fd                	addiw	a5,a5,-1
    10004c3a:	02079713          	slli	a4,a5,0x20
    10004c3e:	9301                	srli	a4,a4,0x20
    10004c40:	ece36ee3          	bltu	t1,a4,10004b1c <_ftoa+0x236>
    10004c44:	f11319e3          	bne	t1,a7,10004b56 <_ftoa+0x270>
    10004c48:	bf31                	j	10004b64 <_ftoa+0x27e>

0000000010004c4a <_out_char>:
    10004c4a:	e111                	bnez	a0,10004c4e <_out_char+0x4>
    10004c4c:	8082                	ret
    10004c4e:	a739                	j	1000535c <_putchar>

0000000010004c50 <_vsnprintf>:
    10004c50:	7135                	addi	sp,sp,-160
    10004c52:	e526                	sd	s1,136(sp)
    10004c54:	e14a                	sd	s2,128(sp)
    10004c56:	fcce                	sd	s3,120(sp)
    10004c58:	f0da                	sd	s6,96(sp)
    10004c5a:	e8e2                	sd	s8,80(sp)
    10004c5c:	ed06                	sd	ra,152(sp)
    10004c5e:	e922                	sd	s0,144(sp)
    10004c60:	fc6e                	sd	s11,56(sp)
    10004c62:	89ae                	mv	s3,a1
    10004c64:	8c36                	mv	s8,a3
    10004c66:	8b3a                	mv	s6,a4
    10004c68:	8932                	mv	s2,a2
    10004c6a:	84aa                	mv	s1,a0
    10004c6c:	3a058c63          	beqz	a1,10005024 <_vsnprintf+0x3d4>
    10004c70:	000c4503          	lbu	a0,0(s8)
    10004c74:	4d81                	li	s11,0
    10004c76:	3c050063          	beqz	a0,10005036 <_vsnprintf+0x3e6>
    10004c7a:	f8d2                	sd	s4,112(sp)
    10004c7c:	f4d6                	sd	s5,104(sp)
    10004c7e:	ecde                	sd	s7,88(sp)
    10004c80:	e4e6                	sd	s9,72(sp)
    10004c82:	e0ea                	sd	s10,64(sp)
    10004c84:	02500a93          	li	s5,37
    10004c88:	4441                	li	s0,16
    10004c8a:	4a25                	li	s4,9
    10004c8c:	a811                	j	10004ca0 <_vsnprintf+0x50>
    10004c8e:	866e                	mv	a2,s11
    10004c90:	86ca                	mv	a3,s2
    10004c92:	85ce                	mv	a1,s3
    10004c94:	9482                	jalr	s1
    10004c96:	0d85                	addi	s11,s11,1
    10004c98:	000c4503          	lbu	a0,0(s8)
    10004c9c:	12050963          	beqz	a0,10004dce <_vsnprintf+0x17e>
    10004ca0:	0c05                	addi	s8,s8,1
    10004ca2:	ff5516e3          	bne	a0,s5,10004c8e <_vsnprintf+0x3e>
    10004ca6:	4801                	li	a6,0
    10004ca8:	000c4503          	lbu	a0,0(s8)
    10004cac:	001c0713          	addi	a4,s8,1
    10004cb0:	fe05079b          	addiw	a5,a0,-32
    10004cb4:	0ff7f793          	zext.b	a5,a5
    10004cb8:	00f46963          	bltu	s0,a5,10004cca <_vsnprintf+0x7a>
    10004cbc:	ee818693          	addi	a3,gp,-280 # 100053d8 <_putchar+0x7c>
    10004cc0:	078a                	slli	a5,a5,0x2
    10004cc2:	97b6                	add	a5,a5,a3
    10004cc4:	439c                	lw	a5,0(a5)
    10004cc6:	97b6                	add	a5,a5,a3
    10004cc8:	8782                	jr	a5
    10004cca:	fd05079b          	addiw	a5,a0,-48
    10004cce:	0ff7f793          	zext.b	a5,a5
    10004cd2:	0afa7163          	bgeu	s4,a5,10004d74 <_vsnprintf+0x124>
    10004cd6:	02a00693          	li	a3,42
    10004cda:	4d01                	li	s10,0
    10004cdc:	1ad50363          	beq	a0,a3,10004e82 <_vsnprintf+0x232>
    10004ce0:	02e00793          	li	a5,46
    10004ce4:	4b81                	li	s7,0
    10004ce6:	0cf50063          	beq	a0,a5,10004da6 <_vsnprintf+0x156>
    10004cea:	f985069b          	addiw	a3,a0,-104
    10004cee:	0ff6f693          	zext.b	a3,a3
    10004cf2:	47c9                	li	a5,18
    10004cf4:	04d7e863          	bltu	a5,a3,10004d44 <_vsnprintf+0xf4>
    10004cf8:	f2c18613          	addi	a2,gp,-212 # 1000541c <_putchar+0xc0>
    10004cfc:	068a                	slli	a3,a3,0x2
    10004cfe:	96b2                	add	a3,a3,a2
    10004d00:	4294                	lw	a3,0(a3)
    10004d02:	96b2                	add	a3,a3,a2
    10004d04:	8682                	jr	a3
    10004d06:	00186813          	ori	a6,a6,1
    10004d0a:	2801                	sext.w	a6,a6
    10004d0c:	8c3a                	mv	s8,a4
    10004d0e:	bf69                	j	10004ca8 <_vsnprintf+0x58>
    10004d10:	00286813          	ori	a6,a6,2
    10004d14:	2801                	sext.w	a6,a6
    10004d16:	8c3a                	mv	s8,a4
    10004d18:	bf41                	j	10004ca8 <_vsnprintf+0x58>
    10004d1a:	00486813          	ori	a6,a6,4
    10004d1e:	2801                	sext.w	a6,a6
    10004d20:	8c3a                	mv	s8,a4
    10004d22:	b759                	j	10004ca8 <_vsnprintf+0x58>
    10004d24:	01086813          	ori	a6,a6,16
    10004d28:	2801                	sext.w	a6,a6
    10004d2a:	8c3a                	mv	s8,a4
    10004d2c:	bfb5                	j	10004ca8 <_vsnprintf+0x58>
    10004d2e:	00886813          	ori	a6,a6,8
    10004d32:	2801                	sext.w	a6,a6
    10004d34:	8c3a                	mv	s8,a4
    10004d36:	bf8d                	j	10004ca8 <_vsnprintf+0x58>
    10004d38:	001c4503          	lbu	a0,1(s8)
    10004d3c:	10086813          	ori	a6,a6,256
    10004d40:	2801                	sext.w	a6,a6
    10004d42:	0705                	addi	a4,a4,1
    10004d44:	06700793          	li	a5,103
    10004d48:	8c3a                	mv	s8,a4
    10004d4a:	0aa7ed63          	bltu	a5,a0,10004e04 <_vsnprintf+0x1b4>
    10004d4e:	02400793          	li	a5,36
    10004d52:	f2a7fee3          	bgeu	a5,a0,10004c8e <_vsnprintf+0x3e>
    10004d56:	fdb5071b          	addiw	a4,a0,-37
    10004d5a:	0ff77713          	zext.b	a4,a4
    10004d5e:	04200693          	li	a3,66
    10004d62:	f2e6e6e3          	bltu	a3,a4,10004c8e <_vsnprintf+0x3e>
    10004d66:	f7818693          	addi	a3,gp,-136 # 10005468 <_putchar+0x10c>
    10004d6a:	070a                	slli	a4,a4,0x2
    10004d6c:	9736                	add	a4,a4,a3
    10004d6e:	4318                	lw	a4,0(a4)
    10004d70:	9736                	add	a4,a4,a3
    10004d72:	8702                	jr	a4
    10004d74:	4d01                	li	s10,0
    10004d76:	002d169b          	slliw	a3,s10,0x2
    10004d7a:	01a686bb          	addw	a3,a3,s10
    10004d7e:	0016969b          	slliw	a3,a3,0x1
    10004d82:	9ea9                	addw	a3,a3,a0
    10004d84:	00074503          	lbu	a0,0(a4)
    10004d88:	fd068d1b          	addiw	s10,a3,-48
    10004d8c:	8c3a                	mv	s8,a4
    10004d8e:	fd05069b          	addiw	a3,a0,-48
    10004d92:	0ff6f693          	zext.b	a3,a3
    10004d96:	0705                	addi	a4,a4,1
    10004d98:	fcda7fe3          	bgeu	s4,a3,10004d76 <_vsnprintf+0x126>
    10004d9c:	02e00793          	li	a5,46
    10004da0:	4b81                	li	s7,0
    10004da2:	f4f514e3          	bne	a0,a5,10004cea <_vsnprintf+0x9a>
    10004da6:	001c4503          	lbu	a0,1(s8)
    10004daa:	40086813          	ori	a6,a6,1024
    10004dae:	4625                	li	a2,9
    10004db0:	fd05059b          	addiw	a1,a0,-48
    10004db4:	0ff5f593          	zext.b	a1,a1
    10004db8:	2801                	sext.w	a6,a6
    10004dba:	86ba                	mv	a3,a4
    10004dbc:	08b67d63          	bgeu	a2,a1,10004e56 <_vsnprintf+0x206>
    10004dc0:	02a00693          	li	a3,42
    10004dc4:	28d50c63          	beq	a0,a3,1000505c <_vsnprintf+0x40c>
    10004dc8:	8c3a                	mv	s8,a4
    10004dca:	0705                	addi	a4,a4,1
    10004dcc:	bf39                	j	10004cea <_vsnprintf+0x9a>
    10004dce:	7a46                	ld	s4,112(sp)
    10004dd0:	7aa6                	ld	s5,104(sp)
    10004dd2:	6be6                	ld	s7,88(sp)
    10004dd4:	6ca6                	ld	s9,72(sp)
    10004dd6:	6d06                	ld	s10,64(sp)
    10004dd8:	000d841b          	sext.w	s0,s11
    10004ddc:	012de463          	bltu	s11,s2,10004de4 <_vsnprintf+0x194>
    10004de0:	fff90d93          	addi	s11,s2,-1
    10004de4:	86ca                	mv	a3,s2
    10004de6:	866e                	mv	a2,s11
    10004de8:	85ce                	mv	a1,s3
    10004dea:	4501                	li	a0,0
    10004dec:	9482                	jalr	s1
    10004dee:	60ea                	ld	ra,152(sp)
    10004df0:	8522                	mv	a0,s0
    10004df2:	644a                	ld	s0,144(sp)
    10004df4:	64aa                	ld	s1,136(sp)
    10004df6:	690a                	ld	s2,128(sp)
    10004df8:	79e6                	ld	s3,120(sp)
    10004dfa:	7b06                	ld	s6,96(sp)
    10004dfc:	6c46                	ld	s8,80(sp)
    10004dfe:	7de2                	ld	s11,56(sp)
    10004e00:	610d                	addi	sp,sp,160
    10004e02:	8082                	ret
    10004e04:	f975071b          	addiw	a4,a0,-105
    10004e08:	0ff77713          	zext.b	a4,a4
    10004e0c:	46bd                	li	a3,15
    10004e0e:	e8e6e0e3          	bltu	a3,a4,10004c8e <_vsnprintf+0x3e>
    10004e12:	4685                	li	a3,1
    10004e14:	6625                	lui	a2,0x9
    10004e16:	00e696b3          	sll	a3,a3,a4
    10004e1a:	04160613          	addi	a2,a2,65 # 9041 <__stack_pointer$+0x9041>
    10004e1e:	8ef1                	and	a3,a3,a2
    10004e20:	20069f63          	bnez	a3,1000503e <_vsnprintf+0x3ee>
    10004e24:	46a9                	li	a3,10
    10004e26:	06d70963          	beq	a4,a3,10004e98 <_vsnprintf+0x248>
    10004e2a:	479d                	li	a5,7
    10004e2c:	e6f711e3          	bne	a4,a5,10004c8e <_vsnprintf+0x3e>
    10004e30:	000b3703          	ld	a4,0(s6)
    10004e34:	02186793          	ori	a5,a6,33
    10004e38:	2781                	sext.w	a5,a5
    10004e3a:	4841                	li	a6,16
    10004e3c:	e43e                	sd	a5,8(sp)
    10004e3e:	866e                	mv	a2,s11
    10004e40:	88de                	mv	a7,s7
    10004e42:	e042                	sd	a6,0(sp)
    10004e44:	4781                	li	a5,0
    10004e46:	86ca                	mv	a3,s2
    10004e48:	85ce                	mv	a1,s3
    10004e4a:	8526                	mv	a0,s1
    10004e4c:	c68ff0ef          	jal	100042b4 <_ntoa_long>
    10004e50:	0b21                	addi	s6,s6,8
    10004e52:	8daa                	mv	s11,a0
    10004e54:	b591                	j	10004c98 <_vsnprintf+0x48>
    10004e56:	002b971b          	slliw	a4,s7,0x2
    10004e5a:	0177073b          	addw	a4,a4,s7
    10004e5e:	0685                	addi	a3,a3,1
    10004e60:	0017171b          	slliw	a4,a4,0x1
    10004e64:	9f29                	addw	a4,a4,a0
    10004e66:	0006c503          	lbu	a0,0(a3)
    10004e6a:	fd070b9b          	addiw	s7,a4,-48
    10004e6e:	fd05071b          	addiw	a4,a0,-48
    10004e72:	0ff77713          	zext.b	a4,a4
    10004e76:	fee670e3          	bgeu	a2,a4,10004e56 <_vsnprintf+0x206>
    10004e7a:	8c36                	mv	s8,a3
    10004e7c:	00168713          	addi	a4,a3,1
    10004e80:	b5ad                	j	10004cea <_vsnprintf+0x9a>
    10004e82:	000b2783          	lw	a5,0(s6)
    10004e86:	0b21                	addi	s6,s6,8
    10004e88:	0807cc63          	bltz	a5,10004f20 <_vsnprintf+0x2d0>
    10004e8c:	001c4503          	lbu	a0,1(s8)
    10004e90:	8d3e                	mv	s10,a5
    10004e92:	8c3a                	mv	s8,a4
    10004e94:	0705                	addi	a4,a4,1
    10004e96:	b5a9                	j	10004ce0 <_vsnprintf+0x90>
    10004e98:	008b0793          	addi	a5,s6,8
    10004e9c:	f43e                	sd	a5,40(sp)
    10004e9e:	000b3b03          	ld	s6,0(s6)
    10004ea2:	567d                	li	a2,-1
    10004ea4:	000b8563          	beqz	s7,10004eae <_vsnprintf+0x25e>
    10004ea8:	020b9613          	slli	a2,s7,0x20
    10004eac:	9201                	srli	a2,a2,0x20
    10004eae:	000b4503          	lbu	a0,0(s6)
    10004eb2:	965a                	add	a2,a2,s6
    10004eb4:	875a                	mv	a4,s6
    10004eb6:	32050763          	beqz	a0,100051e4 <_vsnprintf+0x594>
    10004eba:	22e60e63          	beq	a2,a4,100050f6 <_vsnprintf+0x4a6>
    10004ebe:	00174683          	lbu	a3,1(a4)
    10004ec2:	0705                	addi	a4,a4,1
    10004ec4:	fafd                	bnez	a3,10004eba <_vsnprintf+0x26a>
    10004ec6:	416707bb          	subw	a5,a4,s6
    10004eca:	ec3e                	sd	a5,24(sp)
    10004ecc:	40087793          	andi	a5,a6,1024
    10004ed0:	e83e                	sd	a5,16(sp)
    10004ed2:	cb89                	beqz	a5,10004ee4 <_vsnprintf+0x294>
    10004ed4:	67e2                	ld	a5,24(sp)
    10004ed6:	875e                	mv	a4,s7
    10004ed8:	0177f363          	bgeu	a5,s7,10004ede <_vsnprintf+0x28e>
    10004edc:	873e                	mv	a4,a5
    10004ede:	0007079b          	sext.w	a5,a4
    10004ee2:	ec3e                	sd	a5,24(sp)
    10004ee4:	00287793          	andi	a5,a6,2
    10004ee8:	f03e                	sd	a5,32(sp)
    10004eea:	26078663          	beqz	a5,10005156 <_vsnprintf+0x506>
    10004eee:	4789                	li	a5,2
    10004ef0:	f03e                	sd	a5,32(sp)
    10004ef2:	8cee                	mv	s9,s11
    10004ef4:	67c2                	ld	a5,16(sp)
    10004ef6:	c781                	beqz	a5,10004efe <_vsnprintf+0x2ae>
    10004ef8:	000b8e63          	beqz	s7,10004f14 <_vsnprintf+0x2c4>
    10004efc:	3bfd                	addiw	s7,s7,-1
    10004efe:	86ca                	mv	a3,s2
    10004f00:	8666                	mv	a2,s9
    10004f02:	85ce                	mv	a1,s3
    10004f04:	9482                	jalr	s1
    10004f06:	0c85                	addi	s9,s9,1
    10004f08:	41bc86b3          	sub	a3,s9,s11
    10004f0c:	96da                	add	a3,a3,s6
    10004f0e:	0006c503          	lbu	a0,0(a3)
    10004f12:	f16d                	bnez	a0,10004ef4 <_vsnprintf+0x2a4>
    10004f14:	7782                	ld	a5,32(sp)
    10004f16:	28079963          	bnez	a5,100051a8 <_vsnprintf+0x558>
    10004f1a:	7b22                	ld	s6,40(sp)
    10004f1c:	8de6                	mv	s11,s9
    10004f1e:	bbad                	j	10004c98 <_vsnprintf+0x48>
    10004f20:	00286813          	ori	a6,a6,2
    10004f24:	40f007bb          	negw	a5,a5
    10004f28:	001c4503          	lbu	a0,1(s8)
    10004f2c:	2801                	sext.w	a6,a6
    10004f2e:	8c3a                	mv	s8,a4
    10004f30:	8d3e                	mv	s10,a5
    10004f32:	0705                	addi	a4,a4,1
    10004f34:	b375                	j	10004ce0 <_vsnprintf+0x90>
    10004f36:	001c4503          	lbu	a0,1(s8)
    10004f3a:	06c00693          	li	a3,108
    10004f3e:	ded51fe3          	bne	a0,a3,10004d3c <_vsnprintf+0xec>
    10004f42:	30086813          	ori	a6,a6,768
    10004f46:	002c4503          	lbu	a0,2(s8)
    10004f4a:	2801                	sext.w	a6,a6
    10004f4c:	003c0713          	addi	a4,s8,3
    10004f50:	bbd5                	j	10004d44 <_vsnprintf+0xf4>
    10004f52:	001c4503          	lbu	a0,1(s8)
    10004f56:	06800693          	li	a3,104
    10004f5a:	1ad50263          	beq	a0,a3,100050fe <_vsnprintf+0x4ae>
    10004f5e:	08086813          	ori	a6,a6,128
    10004f62:	2801                	sext.w	a6,a6
    10004f64:	0705                	addi	a4,a4,1
    10004f66:	bbf9                	j	10004d44 <_vsnprintf+0xf4>
    10004f68:	0fd57713          	andi	a4,a0,253
    10004f6c:	0df57693          	andi	a3,a0,223
    10004f70:	fbb70713          	addi	a4,a4,-69
    10004f74:	fb968693          	addi	a3,a3,-71
    10004f78:	00173713          	seqz	a4,a4
    10004f7c:	0016b693          	seqz	a3,a3
    10004f80:	00b6969b          	slliw	a3,a3,0xb
    10004f84:	0057171b          	slliw	a4,a4,0x5
    10004f88:	8f55                	or	a4,a4,a3
    10004f8a:	000b3507          	fld	fa0,0(s6)
    10004f8e:	01076833          	or	a6,a4,a6
    10004f92:	866e                	mv	a2,s11
    10004f94:	87ea                	mv	a5,s10
    10004f96:	875e                	mv	a4,s7
    10004f98:	2801                	sext.w	a6,a6
    10004f9a:	86ca                	mv	a3,s2
    10004f9c:	85ce                	mv	a1,s3
    10004f9e:	8526                	mv	a0,s1
    10004fa0:	e1cff0ef          	jal	100045bc <_etoa>
    10004fa4:	0b21                	addi	s6,s6,8
    10004fa6:	8daa                	mv	s11,a0
    10004fa8:	b9c5                	j	10004c98 <_vsnprintf+0x48>
    10004faa:	04600713          	li	a4,70
    10004fae:	0ce50663          	beq	a0,a4,1000507a <_vsnprintf+0x42a>
    10004fb2:	000b3507          	fld	fa0,0(s6)
    10004fb6:	866e                	mv	a2,s11
    10004fb8:	87ea                	mv	a5,s10
    10004fba:	875e                	mv	a4,s7
    10004fbc:	86ca                	mv	a3,s2
    10004fbe:	85ce                	mv	a1,s3
    10004fc0:	8526                	mv	a0,s1
    10004fc2:	925ff0ef          	jal	100048e6 <_ftoa>
    10004fc6:	0b21                	addi	s6,s6,8
    10004fc8:	8daa                	mv	s11,a0
    10004fca:	b1f9                	j	10004c98 <_vsnprintf+0x48>
    10004fcc:	00287813          	andi	a6,a6,2
    10004fd0:	008b0c93          	addi	s9,s6,8
    10004fd4:	001d8b93          	addi	s7,s11,1
    10004fd8:	12080f63          	beqz	a6,10005116 <_vsnprintf+0x4c6>
    10004fdc:	000b4503          	lbu	a0,0(s6)
    10004fe0:	86ca                	mv	a3,s2
    10004fe2:	866e                	mv	a2,s11
    10004fe4:	85ce                	mv	a1,s3
    10004fe6:	9482                	jalr	s1
    10004fe8:	4705                	li	a4,1
    10004fea:	21a77e63          	bgeu	a4,s10,10005206 <_vsnprintf+0x5b6>
    10004fee:	ffed079b          	addiw	a5,s10,-2
    10004ff2:	1782                	slli	a5,a5,0x20
    10004ff4:	9381                	srli	a5,a5,0x20
    10004ff6:	002d8e13          	addi	t3,s11,2
    10004ffa:	01c78db3          	add	s11,a5,t3
    10004ffe:	865e                	mv	a2,s7
    10005000:	86ca                	mv	a3,s2
    10005002:	0b85                	addi	s7,s7,1
    10005004:	85ce                	mv	a1,s3
    10005006:	02000513          	li	a0,32
    1000500a:	9482                	jalr	s1
    1000500c:	ff7d99e3          	bne	s11,s7,10004ffe <_vsnprintf+0x3ae>
    10005010:	8b66                	mv	s6,s9
    10005012:	b159                	j	10004c98 <_vsnprintf+0x48>
    10005014:	866e                	mv	a2,s11
    10005016:	86ca                	mv	a3,s2
    10005018:	85ce                	mv	a1,s3
    1000501a:	02500513          	li	a0,37
    1000501e:	9482                	jalr	s1
    10005020:	0d85                	addi	s11,s11,1
    10005022:	b99d                	j	10004c98 <_vsnprintf+0x48>
    10005024:	000c4503          	lbu	a0,0(s8)
    10005028:	fffff497          	auipc	s1,0xfffff
    1000502c:	1ba48493          	addi	s1,s1,442 # 100041e2 <_out_null>
    10005030:	4d81                	li	s11,0
    10005032:	c40514e3          	bnez	a0,10004c7a <_vsnprintf+0x2a>
    10005036:	4401                	li	s0,0
    10005038:	db2de6e3          	bltu	s11,s2,10004de4 <_vsnprintf+0x194>
    1000503c:	b355                	j	10004de0 <_vsnprintf+0x190>
    1000503e:	06f00713          	li	a4,111
    10005042:	04e50063          	beq	a0,a4,10005082 <_vsnprintf+0x432>
    10005046:	1ea77363          	bgeu	a4,a0,1000522c <_vsnprintf+0x5dc>
    1000504a:	07800713          	li	a4,120
    1000504e:	4641                	li	a2,16
    10005050:	02e50a63          	beq	a0,a4,10005084 <_vsnprintf+0x434>
    10005054:	fef87813          	andi	a6,a6,-17
    10005058:	4629                	li	a2,10
    1000505a:	a02d                	j	10005084 <_vsnprintf+0x434>
    1000505c:	000b2703          	lw	a4,0(s6)
    10005060:	0b21                	addi	s6,s6,8
    10005062:	88ba                	mv	a7,a4
    10005064:	00075363          	bgez	a4,1000506a <_vsnprintf+0x41a>
    10005068:	4881                	li	a7,0
    1000506a:	002c4503          	lbu	a0,2(s8)
    1000506e:	0c09                	addi	s8,s8,2
    10005070:	00088b9b          	sext.w	s7,a7
    10005074:	001c0713          	addi	a4,s8,1
    10005078:	b98d                	j	10004cea <_vsnprintf+0x9a>
    1000507a:	02086813          	ori	a6,a6,32
    1000507e:	2801                	sext.w	a6,a6
    10005080:	bf0d                	j	10004fb2 <_vsnprintf+0x362>
    10005082:	4621                	li	a2,8
    10005084:	40087713          	andi	a4,a6,1024
    10005088:	10070a63          	beqz	a4,1000519c <_vsnprintf+0x54c>
    1000508c:	ff287693          	andi	a3,a6,-14
    10005090:	2681                	sext.w	a3,a3
    10005092:	008b0c93          	addi	s9,s6,8
    10005096:	2006f713          	andi	a4,a3,512
    1000509a:	85b6                	mv	a1,a3
    1000509c:	16071863          	bnez	a4,1000520c <_vsnprintf+0x5bc>
    100050a0:	1006f713          	andi	a4,a3,256
    100050a4:	22071e63          	bnez	a4,100052e0 <_vsnprintf+0x690>
    100050a8:	0406f713          	andi	a4,a3,64
    100050ac:	12071963          	bnez	a4,100051de <_vsnprintf+0x58e>
    100050b0:	0805f593          	andi	a1,a1,128
    100050b4:	24058363          	beqz	a1,100052fa <_vsnprintf+0x6aa>
    100050b8:	000b5703          	lhu	a4,0(s6)
    100050bc:	1702                	slli	a4,a4,0x20
    100050be:	e436                	sd	a3,8(sp)
    100050c0:	e06a                	sd	s10,0(sp)
    100050c2:	9301                	srli	a4,a4,0x20
    100050c4:	8832                	mv	a6,a2
    100050c6:	88de                	mv	a7,s7
    100050c8:	866e                	mv	a2,s11
    100050ca:	4781                	li	a5,0
    100050cc:	86ca                	mv	a3,s2
    100050ce:	85ce                	mv	a1,s3
    100050d0:	8526                	mv	a0,s1
    100050d2:	9e2ff0ef          	jal	100042b4 <_ntoa_long>
    100050d6:	8b66                	mv	s6,s9
    100050d8:	8daa                	mv	s11,a0
    100050da:	be7d                	j	10004c98 <_vsnprintf+0x48>
    100050dc:	05800713          	li	a4,88
    100050e0:	02e50763          	beq	a0,a4,1000510e <_vsnprintf+0x4be>
    100050e4:	06200713          	li	a4,98
    100050e8:	4609                	li	a2,2
    100050ea:	f8e50de3          	beq	a0,a4,10005084 <_vsnprintf+0x434>
    100050ee:	fef87693          	andi	a3,a6,-17
    100050f2:	2681                	sext.w	a3,a3
    100050f4:	a299                	j	1000523a <_vsnprintf+0x5ea>
    100050f6:	416607bb          	subw	a5,a2,s6
    100050fa:	ec3e                	sd	a5,24(sp)
    100050fc:	bbc1                	j	10004ecc <_vsnprintf+0x27c>
    100050fe:	0c086813          	ori	a6,a6,192
    10005102:	002c4503          	lbu	a0,2(s8)
    10005106:	2801                	sext.w	a6,a6
    10005108:	003c0713          	addi	a4,s8,3
    1000510c:	b925                	j	10004d44 <_vsnprintf+0xf4>
    1000510e:	02086813          	ori	a6,a6,32
    10005112:	4641                	li	a2,16
    10005114:	bf85                	j	10005084 <_vsnprintf+0x434>
    10005116:	4705                	li	a4,1
    10005118:	0fa77163          	bgeu	a4,s10,100051fa <_vsnprintf+0x5aa>
    1000511c:	ffed079b          	addiw	a5,s10,-2
    10005120:	1782                	slli	a5,a5,0x20
    10005122:	9381                	srli	a5,a5,0x20
    10005124:	e83e                	sd	a5,16(sp)
    10005126:	8d6e                	mv	s10,s11
    10005128:	9bbe                	add	s7,s7,a5
    1000512a:	866a                	mv	a2,s10
    1000512c:	86ca                	mv	a3,s2
    1000512e:	0d05                	addi	s10,s10,1
    10005130:	85ce                	mv	a1,s3
    10005132:	02000513          	li	a0,32
    10005136:	9482                	jalr	s1
    10005138:	ff7d19e3          	bne	s10,s7,1000512a <_vsnprintf+0x4da>
    1000513c:	000b4503          	lbu	a0,0(s6)
    10005140:	67c2                	ld	a5,16(sp)
    10005142:	002d8e13          	addi	t3,s11,2
    10005146:	866a                	mv	a2,s10
    10005148:	86ca                	mv	a3,s2
    1000514a:	85ce                	mv	a1,s3
    1000514c:	01c78db3          	add	s11,a5,t3
    10005150:	8b66                	mv	s6,s9
    10005152:	9482                	jalr	s1
    10005154:	b691                	j	10004c98 <_vsnprintf+0x48>
    10005156:	67e2                	ld	a5,24(sp)
    10005158:	1ba7fe63          	bgeu	a5,s10,10005314 <_vsnprintf+0x6c4>
    1000515c:	67e2                	ld	a5,24(sp)
    1000515e:	fffd071b          	addiw	a4,s10,-1
    10005162:	001d8813          	addi	a6,s11,1
    10005166:	9f1d                	subw	a4,a4,a5
    10005168:	1702                	slli	a4,a4,0x20
    1000516a:	9301                	srli	a4,a4,0x20
    1000516c:	01070cb3          	add	s9,a4,a6
    10005170:	a019                	j	10005176 <_vsnprintf+0x526>
    10005172:	6862                	ld	a6,24(sp)
    10005174:	0805                	addi	a6,a6,1
    10005176:	866e                	mv	a2,s11
    10005178:	86ca                	mv	a3,s2
    1000517a:	8dc2                	mv	s11,a6
    1000517c:	85ce                	mv	a1,s3
    1000517e:	02000513          	li	a0,32
    10005182:	ec42                	sd	a6,24(sp)
    10005184:	9482                	jalr	s1
    10005186:	ff9d96e3          	bne	s11,s9,10005172 <_vsnprintf+0x522>
    1000518a:	000b4503          	lbu	a0,0(s6)
    1000518e:	d80506e3          	beqz	a0,10004f1a <_vsnprintf+0x2ca>
    10005192:	001d079b          	addiw	a5,s10,1
    10005196:	ec3e                	sd	a5,24(sp)
    10005198:	f002                	sd	zero,32(sp)
    1000519a:	bba1                	j	10004ef2 <_vsnprintf+0x2a2>
    1000519c:	ff387693          	andi	a3,a6,-13
    100051a0:	2681                	sext.w	a3,a3
    100051a2:	008b0c93          	addi	s9,s6,8
    100051a6:	bdc5                	j	10005096 <_vsnprintf+0x446>
    100051a8:	8de6                	mv	s11,s9
    100051aa:	67e2                	ld	a5,24(sp)
    100051ac:	17a7f263          	bgeu	a5,s10,10005310 <_vsnprintf+0x6c0>
    100051b0:	fffd071b          	addiw	a4,s10,-1
    100051b4:	9f1d                	subw	a4,a4,a5
    100051b6:	1702                	slli	a4,a4,0x20
    100051b8:	9301                	srli	a4,a4,0x20
    100051ba:	001d8813          	addi	a6,s11,1
    100051be:	01070cb3          	add	s9,a4,a6
    100051c2:	a011                	j	100051c6 <_vsnprintf+0x576>
    100051c4:	0805                	addi	a6,a6,1
    100051c6:	866e                	mv	a2,s11
    100051c8:	e842                	sd	a6,16(sp)
    100051ca:	86ca                	mv	a3,s2
    100051cc:	85ce                	mv	a1,s3
    100051ce:	02000513          	li	a0,32
    100051d2:	8dc2                	mv	s11,a6
    100051d4:	9482                	jalr	s1
    100051d6:	6842                	ld	a6,16(sp)
    100051d8:	ff9816e3          	bne	a6,s9,100051c4 <_vsnprintf+0x574>
    100051dc:	bb3d                	j	10004f1a <_vsnprintf+0x2ca>
    100051de:	000b4703          	lbu	a4,0(s6)
    100051e2:	bde9                	j	100050bc <_vsnprintf+0x46c>
    100051e4:	40087793          	andi	a5,a6,1024
    100051e8:	ec3e                	sd	a5,24(sp)
    100051ea:	10078b63          	beqz	a5,10005300 <_vsnprintf+0x6b0>
    100051ee:	00287813          	andi	a6,a6,2
    100051f2:	12080463          	beqz	a6,1000531a <_vsnprintf+0x6ca>
    100051f6:	ec02                	sd	zero,24(sp)
    100051f8:	bf4d                	j	100051aa <_vsnprintf+0x55a>
    100051fa:	000b4503          	lbu	a0,0(s6)
    100051fe:	866e                	mv	a2,s11
    10005200:	86ca                	mv	a3,s2
    10005202:	85ce                	mv	a1,s3
    10005204:	9482                	jalr	s1
    10005206:	8dde                	mv	s11,s7
    10005208:	8b66                	mv	s6,s9
    1000520a:	b479                	j	10004c98 <_vsnprintf+0x48>
    1000520c:	000b3703          	ld	a4,0(s6)
    10005210:	8832                	mv	a6,a2
    10005212:	e436                	sd	a3,8(sp)
    10005214:	e06a                	sd	s10,0(sp)
    10005216:	88de                	mv	a7,s7
    10005218:	866e                	mv	a2,s11
    1000521a:	4781                	li	a5,0
    1000521c:	86ca                	mv	a3,s2
    1000521e:	85ce                	mv	a1,s3
    10005220:	8526                	mv	a0,s1
    10005222:	892ff0ef          	jal	100042b4 <_ntoa_long>
    10005226:	8b66                	mv	s6,s9
    10005228:	8daa                	mv	s11,a0
    1000522a:	b4bd                	j	10004c98 <_vsnprintf+0x48>
    1000522c:	fef87693          	andi	a3,a6,-17
    10005230:	06900713          	li	a4,105
    10005234:	2681                	sext.w	a3,a3
    10005236:	0ee51663          	bne	a0,a4,10005322 <_vsnprintf+0x6d2>
    1000523a:	40087713          	andi	a4,a6,1024
    1000523e:	c701                	beqz	a4,10005246 <_vsnprintf+0x5f6>
    10005240:	fee87693          	andi	a3,a6,-18
    10005244:	2681                	sext.w	a3,a3
    10005246:	f9750713          	addi	a4,a0,-105
    1000524a:	008b0c93          	addi	s9,s6,8
    1000524e:	2501                	sext.w	a0,a0
    10005250:	c701                	beqz	a4,10005258 <_vsnprintf+0x608>
    10005252:	f9c50513          	addi	a0,a0,-100
    10005256:	e951                	bnez	a0,100052ea <_vsnprintf+0x69a>
    10005258:	2006f713          	andi	a4,a3,512
    1000525c:	85b6                	mv	a1,a3
    1000525e:	e705                	bnez	a4,10005286 <_vsnprintf+0x636>
    10005260:	1006f713          	andi	a4,a3,256
    10005264:	ef39                	bnez	a4,100052c2 <_vsnprintf+0x672>
    10005266:	0406f713          	andi	a4,a3,64
    1000526a:	000b2783          	lw	a5,0(s6)
    1000526e:	cb1d                	beqz	a4,100052a4 <_vsnprintf+0x654>
    10005270:	0ff7f793          	zext.b	a5,a5
    10005274:	873e                	mv	a4,a5
    10005276:	e436                	sd	a3,8(sp)
    10005278:	e06a                	sd	s10,0(sp)
    1000527a:	88de                	mv	a7,s7
    1000527c:	01f7d79b          	srliw	a5,a5,0x1f
    10005280:	866e                	mv	a2,s11
    10005282:	4829                	li	a6,10
    10005284:	b5a1                	j	100050cc <_vsnprintf+0x47c>
    10005286:	000b3583          	ld	a1,0(s6)
    1000528a:	88de                	mv	a7,s7
    1000528c:	e436                	sd	a3,8(sp)
    1000528e:	43f5d793          	srai	a5,a1,0x3f
    10005292:	00b7c733          	xor	a4,a5,a1
    10005296:	8f1d                	sub	a4,a4,a5
    10005298:	e06a                	sd	s10,0(sp)
    1000529a:	866e                	mv	a2,s11
    1000529c:	03f5d793          	srli	a5,a1,0x3f
    100052a0:	4829                	li	a6,10
    100052a2:	bfad                	j	1000521c <_vsnprintf+0x5cc>
    100052a4:	0805f593          	andi	a1,a1,128
    100052a8:	c1b9                	beqz	a1,100052ee <_vsnprintf+0x69e>
    100052aa:	0107979b          	slliw	a5,a5,0x10
    100052ae:	4107d79b          	sraiw	a5,a5,0x10
    100052b2:	40f7d59b          	sraiw	a1,a5,0xf
    100052b6:	00b7c733          	xor	a4,a5,a1
    100052ba:	9f0d                	subw	a4,a4,a1
    100052bc:	1742                	slli	a4,a4,0x30
    100052be:	9341                	srli	a4,a4,0x30
    100052c0:	bf5d                	j	10005276 <_vsnprintf+0x626>
    100052c2:	000b3583          	ld	a1,0(s6)
    100052c6:	88de                	mv	a7,s7
    100052c8:	e436                	sd	a3,8(sp)
    100052ca:	43f5d793          	srai	a5,a1,0x3f
    100052ce:	00b7c733          	xor	a4,a5,a1
    100052d2:	8f1d                	sub	a4,a4,a5
    100052d4:	e06a                	sd	s10,0(sp)
    100052d6:	866e                	mv	a2,s11
    100052d8:	03f5d793          	srli	a5,a1,0x3f
    100052dc:	4829                	li	a6,10
    100052de:	b3fd                	j	100050cc <_vsnprintf+0x47c>
    100052e0:	000b3703          	ld	a4,0(s6)
    100052e4:	e436                	sd	a3,8(sp)
    100052e6:	e06a                	sd	s10,0(sp)
    100052e8:	bbf1                	j	100050c4 <_vsnprintf+0x474>
    100052ea:	4629                	li	a2,10
    100052ec:	b36d                	j	10005096 <_vsnprintf+0x446>
    100052ee:	41f7d59b          	sraiw	a1,a5,0x1f
    100052f2:	00b7c733          	xor	a4,a5,a1
    100052f6:	9f0d                	subw	a4,a4,a1
    100052f8:	bfbd                	j	10005276 <_vsnprintf+0x626>
    100052fa:	000b2703          	lw	a4,0(s6)
    100052fe:	bb7d                	j	100050bc <_vsnprintf+0x46c>
    10005300:	00287793          	andi	a5,a6,2
    10005304:	e83e                	sd	a5,16(sp)
    10005306:	ea0792e3          	bnez	a5,100051aa <_vsnprintf+0x55a>
    1000530a:	ec02                	sd	zero,24(sp)
    1000530c:	e40d18e3          	bnez	s10,1000515c <_vsnprintf+0x50c>
    10005310:	8cee                	mv	s9,s11
    10005312:	b121                	j	10004f1a <_vsnprintf+0x2ca>
    10005314:	2785                	addiw	a5,a5,1
    10005316:	ec3e                	sd	a5,24(sp)
    10005318:	bee9                	j	10004ef2 <_vsnprintf+0x2a2>
    1000531a:	40000793          	li	a5,1024
    1000531e:	e83e                	sd	a5,16(sp)
    10005320:	b7ed                	j	1000530a <_vsnprintf+0x6ba>
    10005322:	8836                	mv	a6,a3
    10005324:	4629                	li	a2,10
    10005326:	bbb9                	j	10005084 <_vsnprintf+0x434>

0000000010005328 <printf_>:
    10005328:	711d                	addi	sp,sp,-96
    1000532a:	02810313          	addi	t1,sp,40
    1000532e:	8e2a                	mv	t3,a0
    10005330:	00000517          	auipc	a0,0x0
    10005334:	f42e                	sd	a1,40(sp)
    10005336:	f832                	sd	a2,48(sp)
    10005338:	fc36                	sd	a3,56(sp)
    1000533a:	e0ba                	sd	a4,64(sp)
    1000533c:	858a                	mv	a1,sp
    1000533e:	86f2                	mv	a3,t3
    10005340:	871a                	mv	a4,t1
    10005342:	91a50513          	addi	a0,a0,-1766 # 10004c4a <_out_char>
    10005346:	567d                	li	a2,-1
    10005348:	ec06                	sd	ra,24(sp)
    1000534a:	e4be                	sd	a5,72(sp)
    1000534c:	e8c2                	sd	a6,80(sp)
    1000534e:	ecc6                	sd	a7,88(sp)
    10005350:	e41a                	sd	t1,8(sp)
    10005352:	8ffff0ef          	jal	10004c50 <_vsnprintf>
    10005356:	60e2                	ld	ra,24(sp)
    10005358:	6125                	addi	sp,sp,96
    1000535a:	8082                	ret

000000001000535c <_putchar>:
    1000535c:	f2ffd797          	auipc	a5,0xf2ffd
    10005360:	ca478793          	addi	a5,a5,-860 # 3002000 <__base_uart>
    10005364:	0147c783          	lbu	a5,20(a5)
    10005368:	0207f793          	andi	a5,a5,32
    1000536c:	dbe5                	beqz	a5,1000535c <_putchar>
    1000536e:	f2ffd797          	auipc	a5,0xf2ffd
    10005372:	c8a78923          	sb	a0,-878(a5) # 3002000 <__base_uart>
    10005376:	8082                	ret
