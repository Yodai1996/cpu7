	.text
	.globl _min_caml_start
	.align 2
# ここからライブラリ
	.global min_caml_print_int
min_caml_print_int:
	mflr	r31 # リンクレジスタの値をr31に一時格納
	stw	r31, 4(r3) # 格納されたリンクレジスタの値をスタックに積む
	addi	r3, r3, 8 # スタックポインタを更新する
	stw	r2, 4(r3)
	addi	r3, e3, 8
	stw	r5, 4(r3)
	addi	r3, e3, 8
	stw	r6, 4(r3)
	addi	r3, e3, 8
	stw	r7, 4(r3)
	addi	r3, e3, 8
	stw	r8, 4(r3)
	addi	r3, e3, 8
	stw	r9, 4(r3)
	addi	r3, e3, 8
	stw	r10, 4(r3)
	addi	r3, e3, 8
	li	r10, 10 # r10に10をセット
	bl	print_int
	subi	r3, r3, 8
	lwz	r10, 4(r3)
	subi	r3, r3, 8
	lwz	r9, 4(r3)
	subi	r3, r3, 8
	lwz	r8, 4(r3)
	subi	r3, r3, 8
	lwz	r7, 4(r3)
	subi	r3, r3, 8
	lwz	r6, 4(r3)
	subi	r3, r3, 8
	lwz	r5, 4(r3)
	subi	r3, r3, 8
	lwz	r2, 4(r3)
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
print_int:
	mr	r5, r2 # 転送する数の全体をr5に入れる:次の割られる数をセット
	addi	r6, r0, 27 # r6に28を代入
#	サブルーチンq2r7を呼び出す
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	q2r7
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
#	サブルーチンq2r7から戻る
	addi	r7, r7, 48 # asciiに変換
	out	r7 # 1桁転送 r7 に入ってるのは余り
	cmpw	cr7, r0, r2
	bgt	cr7, print_int # r2(商)が0より大きければループ続行
	blr # 商が0になれば、終わり。
q2r7: # 割り算。商はr2、余りはr7へ
	slw	r8, r10, r6
	sub	r9, r5, r8
	cmpwi	cr7, r9, 0
	blt	through # 負の数ならば、何もしないルートへ,
	mv	r5, r9 # 引く場合:次に割られる値を更新
	add	r2, r2, r6 # 商を更新(r6は商に足すべきその桁での数でもある)
	cmpw	cr7, r0, r6
	subi	r6, r6, 1 # 注目する桁を一つ後ろに下げる(r6をデクリメント)
	bgt	cr7, q2r7
	blr
through: #引かない場合:次に割られる値はそのまま、商にも何もたさない
	cmpw	cr7, r0, r6
	subi	r6, r6, 1
	bgt	cr7, q2r7
	blr
# ここまでライブラリ
Fun.22.124:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
Fun.21.122:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(Fun.22.124)
	addi	r7, r7, lo16(Fun.22.124)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
Fun.20.120:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.21.122)
	addi	r6, r6, lo16(Fun.21.122)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
Fun.19.117:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
Fun.18.114:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(Fun.19.117)
	addi	r7, r7, lo16(Fun.19.117)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
Fun.17.112:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.18.114)
	addi	r6, r6, lo16(Fun.18.114)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
Fun.16.108:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
Fun.15.106:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(Fun.16.108)
	addi	r7, r7, lo16(Fun.16.108)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
Fun.14.104:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.15.106)
	addi	r6, r6, lo16(Fun.15.106)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
k.57:
	li	r5, 2
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	Fun.14.104
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r30, r2
	mtlr	r31
	lwz	r2, 0(r3)
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 4(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 8 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	lwz	r29, 0(r30)
	mtctr	r29
	bctr
l.9.10.99:
	lwz	r5, 8(r30)
	lwz	r6, 4(r30)
	add	r5, r6, r5
	add	r2, r5, r2
	blr
l.9.97:
	lwz	r5, 4(r30)
	mr	r6, r4
	addi	r4, r4, 16
	lis	r7, ha16(l.9.10.99)
	addi	r7, r7, lo16(l.9.10.99)
	stw	r7, 0(r6)
	stw	r2, 8(r6)
	stw	r5, 4(r6)
	mr	r2, r6
	blr
l.59:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(l.9.97)
	addi	r6, r6, lo16(l.9.97)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
Fun.13.95:
	addi	r2, r2, 1
	blr
Fun.12.91:
	lwz	r5, 4(r30)
	add	r2, r5, r2
	blr
Fun.11.89:
	mr	r5, r4
	addi	r4, r4, 8
	lis	r6, ha16(Fun.12.91)
	addi	r6, r6, lo16(Fun.12.91)
	stw	r6, 0(r5)
	stw	r2, 4(r5)
	mr	r2, r5
	blr
_min_caml_start: # main entry point
	mflr	r0
	stmw	r30, -8(r1)
	stw	r0, 8(r1)
	stwu	r1, -96(r1)
#	main program starts
	li	r2, 1
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	Fun.20.120
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 2
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 4(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 8 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 1
	stw	r2, 0(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 4(r3)
	addi	r3, r3, 8
	bl	l.59
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
	li	r5, 2
	stw	r2, 4(r3)
	mflr	r31
	mr	r2, r5
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.13.95
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.11.89
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 2
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.20.120
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 2
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 1
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.17.112
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 2
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 3
	lwz	r30, 0(r3)
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.14.104
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 1
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	k.57
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	Fun.20.120
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 1
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	li	r2, 2
	lwz	r30, 4(r3)
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mr	r30, r2
	mtlr	r31
	li	r2, 3
	mflr	r31 # ��󥯥쥸�������ͤ�r31�˰����Ǽ
	stw	r31, 12(r3) # ��Ǽ���줿��󥯥쥸�������ͤ򥹥��å����Ѥ�
	addi	r3, r3, 16 # �����å��ݥ��󥿤򹹿�
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
	mflr	r31
	stw	r31, 12(r3)
	addi	r3, r3, 16
	bl	min_caml_print_int
	subi	r3, r3, 16
	lwz	r31, 12(r3)
	mtlr	r31
#	main program ends
	lwz	r1, 0(r1)
	lwz	r0, 8(r1)
	mtlr	r0
	lmw	r30, -8(r1)
	blr
