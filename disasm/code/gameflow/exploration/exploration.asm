
; ASM FILE code\gameflow\exploration\exploration.asm :
; 0x31CC..0x4544 : Exploration functions
		rts

	; End of function sub_3158

MapOffsetHashTable:
		incbin "data/maps/global/mapoffsethashtable.bin"

; =============== S U B R O U T I N E =======================================

sub_364E:
		movem.w d0-d1/d3-d4/d6,-(sp)
		add.w   d0,d0
		clr.w   d2
		move.b  1(a3,d0.w),d2
		move.b  (a3,d0.w),d0
		ext.w   d0
		add.w   d1,d1
		clr.w   d3
		move.b  1(a3,d1.w),d3
		move.b  (a3,d1.w),d1
		ext.w   d1
		lsl.w   #6,d1
		add.w   d1,d0
		add.w   d0,d0
		move.w  d3,d4
		add.w   d3,d3
		add.w   d4,d3
		add.w   d3,d2
		add.w   d2,d2
		move.w  (a4,d0.w),d0
		cmpi.w  #$C000,d0
		bcs.s   loc_368C
		clr.w   d6
		bra.s   loc_3690
loc_368C:
		move.w  ((word_FFA80E-$1000000)).w,d6
loc_3690:
		andi.w  #$3FF,d0
		add.w   d0,d0
		move.w  d0,d1
		lsl.w   #3,d0
		add.w   d1,d0
		add.w   d0,d2
		move.w  (a5,d2.w),d2
		or.w    d6,d2
		movem.w (sp)+,d0-d1/d3-d4/d6
		rts

	; End of function sub_364E


; =============== S U B R O U T I N E =======================================

SetCameraDest:
		
		movem.w d0-d7,-(sp)
		bra.w   loc_36BE

	; End of function SetCameraDest


; =============== S U B R O U T I N E =======================================

sub_36B2:
		movem.w d0-d7,-(sp)
		lsl.w   #7,d0
		lsl.w   #7,d1
		lsl.w   #7,d2
		lsl.w   #7,d3
loc_36BE:
		move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d4
		move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d5
		move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d6
		move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d7
		lsl.w   #7,d4
		lsl.w   #7,d5
		lsl.w   #7,d6
		lsl.w   #7,d7
		mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d0
		lsr.l   #8,d0
		mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d1
		lsr.l   #8,d1
		mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d2
		lsr.l   #8,d2
		mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d3
		lsr.l   #8,d3
		add.w   d4,d0
		add.w   d5,d1
		add.w   d6,d2
		add.w   d7,d3
		tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
		bne.s   loc_3702
		move.w  d0,((word_FFA818-$1000000)).w
		bra.s   loc_3706
loc_3702:
		move.w  ((word_FFA810-$1000000)).w,d0
loc_3706:
		tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
		bne.s   loc_3712
		move.w  d1,((word_FFA81A-$1000000)).w
		bra.s   loc_3716
loc_3712:
		move.w  ((word_FFA812-$1000000)).w,d1
loc_3716:
		tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		bne.s   loc_3722
		move.w  d2,((word_FFA81C-$1000000)).w
		bra.s   loc_3726
loc_3722:
		move.w  ((word_FFA814-$1000000)).w,d2
loc_3726:
		tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
		bne.s   loc_3732
		move.w  d3,((word_FFA81E-$1000000)).w
		bra.s   loc_3736
loc_3732:
		move.w  ((word_FFA816-$1000000)).w,d3
loc_3736:
		lea     (byte_FF9A04).l,a2
		bsr.w   sub_3758
		bsr.w   sub_37B2
		lea     (byte_FF9A84).l,a2
		bsr.w   sub_380C
		bsr.w   sub_3866
		movem.w (sp)+,d0-d7
		rts

	; End of function sub_36B2


; =============== S U B R O U T I N E =======================================

sub_3758:
		clr.w   ((word_FFA80E-$1000000)).w
		cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
		beq.s   loc_3770
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		beq.s   loc_3770
loc_376A:
		move.w  #$2000,((word_FFA80E-$1000000)).w
loc_3770:
		move.w  ((word_FFA810-$1000000)).w,d4
		cmp.w   d0,d4
		beq.s   return_37B0
		bset    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
		cmp.w   d0,d4
		bge.s   return_37B0
		movem.w d0-d3,-(sp)
		clr.w   d4
		clr.w   d5
		move.w  ((word_FFA810-$1000000)).w,d0
		asr.w   #4,d0
		move.w  ((word_FFA812-$1000000)).w,d1
		asr.w   #4,d1
		addi.w  #$100,d0
		move.w  ((word_FFA804-$1000000)).w,d2
		move.w  ((word_FFA808-$1000000)).w,d3
		lea     (byte_FFC000).l,a1
loc_37A8:
		bsr.w   sub_3158
		movem.w (sp)+,d0-d3
return_37B0:
		rts

	; End of function sub_3758


; =============== S U B R O U T I N E =======================================

sub_37B2:
		clr.w   ((word_FFA80E-$1000000)).w
		cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
		beq.s   loc_37CA
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		beq.s   loc_37CA
		move.w  #$2000,((word_FFA80E-$1000000)).w
loc_37CA:
		move.w  ((word_FFA812-$1000000)).w,d4
		cmp.w   d1,d4
		beq.s   return_380A
		bset    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
		cmp.w   d1,d4
		bge.s   return_380A
		movem.w d0-d3,-(sp)
		clr.w   d4
		clr.w   d5
loc_37E4:
		move.w  ((word_FFA810-$1000000)).w,d0
		asr.w   #4,d0
loc_37EA:
		move.w  ((word_FFA812-$1000000)).w,d1
		asr.w   #4,d1
loc_37F0:
		addi.w  #$100,d1
		move.w  ((word_FFA804-$1000000)).w,d2
		move.w  ((word_FFA808-$1000000)).w,d3
loc_37FC:
		lea     (byte_FFC000).l,a1
		bsr.w   sub_30EE
		movem.w (sp)+,d0-d3
return_380A:
		rts

	; End of function sub_37B2


; =============== S U B R O U T I N E =======================================

sub_380C:
		clr.w   ((word_FFA80E-$1000000)).w
loc_3810:
		cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
		beq.s   loc_3824
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		bne.s   loc_3824
		move.w  #$2000,((word_FFA80E-$1000000)).w
loc_3824:
		move.w  ((word_FFA814-$1000000)).w,d4
		cmp.w   d2,d4
		beq.s   return_3864
		bset    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
		cmp.w   d2,d4
		bge.s   return_3864
		movem.w d0-d3,-(sp)
		clr.w   d4
		clr.w   d5
		move.w  ((word_FFA814-$1000000)).w,d0
		asr.w   #4,d0
		move.w  ((word_FFA816-$1000000)).w,d1
		asr.w   #4,d1
		addi.w  #$100,d0
loc_384E:
		move.w  ((word_FFA806-$1000000)).w,d2
		move.w  ((word_FFA80A-$1000000)).w,d3
		lea     (byte_FFE000).l,a1
		bsr.w   sub_3158
		movem.w (sp)+,d0-d3
return_3864:
		rts

	; End of function sub_380C


; =============== S U B R O U T I N E =======================================

sub_3866:
		clr.w   ((word_FFA80E-$1000000)).w
		cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
		beq.s   loc_387E
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		bne.s   loc_387E
		move.w  #$2000,((word_FFA80E-$1000000)).w
loc_387E:
		move.w  ((word_FFA816-$1000000)).w,d4
		cmp.w   d3,d4
		beq.s   return_38BE
		bset    #0,((CAMERA_SCROLLING_MASK-$1000000)).w
		cmp.w   d3,d4
		bge.s   return_38BE
		movem.w d0-d3,-(sp)
		clr.w   d4
		clr.w   d5
		move.w  ((word_FFA814-$1000000)).w,d0
		asr.w   #4,d0
loc_389E:
		move.w  ((word_FFA816-$1000000)).w,d1
		asr.w   #4,d1
		addi.w  #$100,d1
		move.w  ((word_FFA806-$1000000)).w,d2
		move.w  ((word_FFA80A-$1000000)).w,d3
		lea     (byte_FFE000).l,a1
		bsr.w   sub_30EE
		movem.w (sp)+,d0-d3
return_38BE:
		rts

	; End of function sub_3866


; =============== S U B R O U T I N E =======================================

sub_38C0:
		movem.l d2-d3/a0,-(sp)
		clr.w   d2
		move.b  ((CAMERA_ENTITY-$1000000)).w,d2
		bpl.s   loc_38E6
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		bne.s   loc_38DC
loc_38D2:
		move.w  ((word_FFA810-$1000000)).w,d0
		move.w  ((word_FFA812-$1000000)).w,d1
		bra.s   loc_38E4
loc_38DC:
		move.w  ((word_FFA814-$1000000)).w,d0
		move.w  ((word_FFA816-$1000000)).w,d1
loc_38E4:
		bra.s   loc_392A
loc_38E6:
		lsl.w   #5,d2
		lea     ((ENTITY_DATA-$1000000)).w,a0
		adda.w  d2,a0
		move.w  (a0)+,d2
		move.w  (a0)+,d3
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		bne.s   loc_390A
		sub.w   ((word_FFA814-$1000000)).w,d2
		sub.w   ((word_FFA816-$1000000)).w,d3
loc_3900:
		move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d0
		move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d1
		bra.s   loc_391A
loc_390A:
		sub.w   ((word_FFA810-$1000000)).w,d2
		sub.w   ((word_FFA812-$1000000)).w,d3
		move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d0
		move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d1
loc_391A:
		lsl.w   #7,d0
		lsl.w   #7,d1
		addi.w  #$D80,d0
		addi.w  #$D80,d1
		sub.w   d2,d0
		sub.w   d3,d1
loc_392A:
		movem.l (sp)+,d2-d3/a0
		rts

	; End of function sub_38C0


; =============== S U B R O U T I N E =======================================

; Related to camera position ?

VInt_3930:
		link    a6,#-2
		move.b  ((CAMERA_SCROLLING_MASK-$1000000)).w,d0
		andi.b  #$C,d0
		beq.s   loc_3944
		move.b  #$FF,((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
loc_3944:
		tst.b   ((CAMERA_SCROLLING_MASK-$1000000)).w
		beq.w   loc_3C44
		movem.w d0-d7,-(sp)
		clr.w   ((word_FFA80E-$1000000)).w
		cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
		beq.s   loc_3968
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		beq.s   loc_3968
loc_3962:
		move.w  #$2000,((word_FFA80E-$1000000)).w
loc_3968:
		btst    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
		beq.w   loc_3A1A
		move.w  ((word_FFA810-$1000000)).w,d0
		move.w  d0,d5
		move.w  d0,d7
		move.w  ((word_FFA818-$1000000)).w,d1
		move.w  ((word_FFA820-$1000000)).w,d2
		sub.w   d1,d5
		move.w  d5,-2(a6)
		bge.s   loc_3998
		add.w   d2,d0
		move.w  #$100,d6
		move.w  #1,d4
		clr.w   d5
		bra.s   loc_39A2
loc_3998:
		sub.w   d2,d0
		move.w  #8,d6
		clr.w   d4
		clr.w   d5
loc_39A2:
		eor.w   d0,d7
		btst    #7,d7
		beq.s   loc_39D4
		movem.w d0-d1,-(sp)
		asr.w   #4,d0
		move.w  ((word_FFA812-$1000000)).w,d1
		asr.w   #4,d1
		add.w   d6,d0
		move.w  ((word_FFA804-$1000000)).w,d2
		move.w  ((word_FFA808-$1000000)).w,d3
		lea     (byte_FFC000).l,a1
		lea     (byte_FF9A04).l,a2
		bsr.w   sub_3158
		movem.w (sp)+,d0-d1
loc_39D4:
		move.w  -2(a6),d5
		move.w  d0,d4
		sub.w   d1,d4
		bne.s   loc_39E6
		move.w  d1,d0
		bclr    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_39E6:
		eor.w   d5,d4
		bge.s   loc_39F2
		move.w  d1,d0
		bclr    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_39F2:
		tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
		beq.s   loc_3A0A
		tst.w   d0
		bge.s   loc_3A00
		addi.w  #$6000,d0
loc_3A00:
		cmpi.w  #$6000,d0
		blt.s   loc_3A0A
		subi.w  #$6000,d0
loc_3A0A:
		move.w  d0,((word_FFA810-$1000000)).w
		lsr.w   #4,d0
		neg.w   d0
		andi.w  #$FF,d0
		move.w  d0,((word_FFA804-$1000000)).w
loc_3A1A:
		btst    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
		beq.w   loc_3AC8
		move.w  ((word_FFA812-$1000000)).w,d0
		move.w  d0,d5
		move.w  d0,d7
		move.w  ((word_FFA81A-$1000000)).w,d1
		move.w  ((word_FFA822-$1000000)).w,d2
		sub.w   d1,d5
		move.w  d5,-2(a6)
		bge.s   loc_3A4A
		add.w   d2,d0
		move.w  #$100,d6
		clr.w   d4
		move.w  #1,d5
		bra.s   loc_3A54
loc_3A4A:
		sub.w   d2,d0
		move.w  #8,d6
		clr.w   d4
		clr.w   d5
loc_3A54:
		eor.w   d0,d7
		btst    #7,d7
		beq.s   loc_3A82
		movem.w d0-d1,-(sp)
		asr.w   #4,d0
		move.w  d0,d1
		move.w  ((word_FFA810-$1000000)).w,d0
		asr.w   #4,d0
		add.w   d6,d1
		move.w  ((word_FFA804-$1000000)).w,d2
		move.w  ((word_FFA808-$1000000)).w,d3
		lea     (byte_FFC000).l,a1
		bsr.w   sub_30EE
		movem.w (sp)+,d0-d1
loc_3A82:
		move.w  -2(a6),d5
		move.w  d0,d4
		sub.w   d1,d4
		bne.s   loc_3A94
		move.w  d1,d0
		bclr    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3A94:
		eor.w   d5,d4
		bge.s   loc_3AA0
		move.w  d1,d0
		bclr    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3AA0:
		tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
		beq.s   loc_3AB8
		tst.w   d0
		bge.s   loc_3AAE
		addi.w  #$6000,d0
loc_3AAE:
		cmpi.w  #$6000,d0
		blt.s   loc_3AB8
		subi.w  #$6000,d0
loc_3AB8:
		move.w  d0,((word_FFA812-$1000000)).w
		lsr.w   #4,d0
		addq.w  #8,d0
		andi.w  #$FF,d0
		move.w  d0,((word_FFA808-$1000000)).w
loc_3AC8:
		clr.w   ((word_FFA80E-$1000000)).w
		cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
		beq.s   loc_3AE0
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		bne.s   loc_3AE0
		move.w  #$2000,((word_FFA80E-$1000000)).w
loc_3AE0:
		btst    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
		beq.w   loc_3B92
		move.w  ((word_FFA814-$1000000)).w,d0
		move.w  d0,d5
		move.w  d0,d7
		move.w  ((word_FFA81C-$1000000)).w,d1
		move.w  ((word_FFA824-$1000000)).w,d2
		sub.w   d1,d5
		move.w  d5,-2(a6)
		bge.s   loc_3B10
		add.w   d2,d0
		move.w  #$100,d6
		move.w  #1,d4
		clr.w   d5
		bra.s   loc_3B1A
loc_3B10:
		sub.w   d2,d0
		move.w  #8,d6
		clr.w   d4
		clr.w   d5
loc_3B1A:
		eor.w   d0,d7
		btst    #7,d7
		beq.s   loc_3B4C
		movem.w d0-d1,-(sp)
		asr.w   #4,d0
		move.w  ((word_FFA816-$1000000)).w,d1
		asr.w   #4,d1
		add.w   d6,d0
		move.w  ((word_FFA806-$1000000)).w,d2
		move.w  ((word_FFA80A-$1000000)).w,d3
		lea     (byte_FFE000).l,a1
		lea     (byte_FF9A84).l,a2
		bsr.w   sub_3158
		movem.w (sp)+,d0-d1
loc_3B4C:
		move.w  -2(a6),d5
		move.w  d0,d4
		sub.w   d1,d4
		bne.s   loc_3B5E
		move.w  d1,d0
		bclr    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3B5E:
		eor.w   d5,d4
		bge.s   loc_3B6A
		move.w  d1,d0
		bclr    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3B6A:
		tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		beq.s   loc_3B82
		tst.w   d0
		bge.s   loc_3B78
		addi.w  #$6000,d0
loc_3B78:
		cmpi.w  #$6000,d0
		blt.s   loc_3B82
		subi.w  #$6000,d0
loc_3B82:
		move.w  d0,((word_FFA814-$1000000)).w
		lsr.w   #4,d0
		neg.w   d0
		andi.w  #$FF,d0
		move.w  d0,((word_FFA806-$1000000)).w
loc_3B92:
		btst    #0,((CAMERA_SCROLLING_MASK-$1000000)).w
		beq.w   loc_3C40
		move.w  ((word_FFA816-$1000000)).w,d0
		move.w  d0,d5
		move.w  d0,d7
		move.w  ((word_FFA81E-$1000000)).w,d1
		move.w  ((word_FFA826-$1000000)).w,d2
		sub.w   d1,d5
		move.w  d5,-2(a6)
		bge.s   loc_3BC2
		add.w   d2,d0
		move.w  #$100,d6
		clr.w   d4
		move.w  #1,d5
		bra.s   loc_3BCC
loc_3BC2:
		sub.w   d2,d0
		move.w  #8,d6
		clr.w   d4
		clr.w   d5
loc_3BCC:
		eor.w   d0,d7
		btst    #7,d7
		beq.s   loc_3BFA
		movem.w d0-d1,-(sp)
		asr.w   #4,d0
		move.w  d0,d1
		move.w  ((word_FFA814-$1000000)).w,d0
		asr.w   #4,d0
		add.w   d6,d1
		move.w  ((word_FFA806-$1000000)).w,d2
		move.w  ((word_FFA80A-$1000000)).w,d3
		lea     (byte_FFE000).l,a1
		bsr.w   sub_30EE
		movem.w (sp)+,d0-d1
loc_3BFA:
		move.w  -2(a6),d5
		move.w  d0,d4
		sub.w   d1,d4
		bne.s   loc_3C0C
		move.w  d1,d0
		bclr    #0,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3C0C:
		eor.w   d5,d4
		bge.s   loc_3C18
		move.w  d1,d0
		bclr    #0,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3C18:
		tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
		beq.s   loc_3C30
		tst.w   d0
		bge.s   loc_3C26
		addi.w  #$6000,d0
loc_3C26:
		cmpi.w  #$6000,d0
		blt.s   loc_3C30
		subi.w  #$6000,d0
loc_3C30:
		move.w  d0,((word_FFA816-$1000000)).w
		lsr.w   #4,d0
		addq.w  #8,d0
		andi.w  #$FF,d0
		move.w  d0,((word_FFA80A-$1000000)).w
loc_3C40:
		movem.w (sp)+,d0-d7
loc_3C44:
		unlk    a6
		move.b  ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w,d0
		beq.s   loc_3C88
		cmpi.b  #$80,d0
		bne.s   loc_3C6C
		bsr.w   sub_38C0
		move.w  #$10,((word_FFA820-$1000000)).w
		move.w  d0,((word_FFA818-$1000000)).w
		lea     (byte_FF9904).l,a2
		bsr.w   sub_3758
		bra.s   loc_3C82
loc_3C6C:
		move.w  ((word_FFA810-$1000000)).w,d1
		ext.w   d0
		add.w   d0,d1
		tst.w   d0
		bpl.s   loc_3C7A
		neg.w   d0
loc_3C7A:
		move.w  d0,((word_FFA820-$1000000)).w
		move.w  d1,((word_FFA818-$1000000)).w
loc_3C82:
		bset    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3C88:
		move.b  ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w,d0
		beq.s   loc_3CC4
		cmpi.b  #$80,d0
		bne.s   loc_3CA8
		bsr.w   sub_38C0
		move.w  #8,((word_FFA822-$1000000)).w
		move.w  d1,((word_FFA81A-$1000000)).w
		bsr.w   sub_37B2
		bra.s   loc_3CBE
loc_3CA8:
		move.w  ((word_FFA812-$1000000)).w,d1
		ext.w   d0
		add.w   d0,d1
		tst.w   d0
		bpl.s   loc_3CB6
		neg.w   d0
loc_3CB6:
		move.w  d0,((word_FFA822-$1000000)).w
		move.w  d1,((word_FFA81A-$1000000)).w
loc_3CBE:
		bset    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3CC4:
		move.b  ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w,d0
		beq.s   loc_3D08
		cmpi.b  #$80,d0
		bne.s   loc_3CEC
		bsr.w   sub_38C0
		move.w  #$10,((word_FFA824-$1000000)).w
		move.w  d0,((word_FFA81C-$1000000)).w
		lea     (byte_FF9984).l,a2
		move.w  d0,d2
		bsr.w   sub_380C
		bra.s   loc_3D02
loc_3CEC:
		move.w  ((word_FFA814-$1000000)).w,d1
		ext.w   d0
		add.w   d0,d1
		tst.w   d0
		bpl.s   loc_3CFA
		neg.w   d0
loc_3CFA:
		move.w  d0,((word_FFA824-$1000000)).w
		move.w  d1,((word_FFA81C-$1000000)).w
loc_3D02:
		bset    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3D08:
		move.b  ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w,d0
		beq.s   sub_3D46
		cmpi.b  #$80,d0
		bne.s   loc_3D2A
		bsr.w   sub_38C0
		move.w  #$10,((word_FFA826-$1000000)).w
		move.w  d1,((word_FFA81E-$1000000)).w
		move.w  d1,d3
		bsr.w   sub_3866
		bra.s   loc_3D40
loc_3D2A:
		move.w  ((word_FFA816-$1000000)).w,d1
		ext.w   d0
		add.w   d0,d1
		tst.w   d0
		bpl.s   loc_3D38
		neg.w   d0
loc_3D38:
		move.w  d0,((word_FFA826-$1000000)).w
		move.w  d1,((word_FFA81E-$1000000)).w
loc_3D40:
		bset    #0,((CAMERA_SCROLLING_MASK-$1000000)).w

	; End of function VInt_3930


; =============== S U B R O U T I N E =======================================

sub_3D46:
		move.l  ((word_FFA808-$1000000)).w,(dword_FFD500).l
		move.l  ((word_FFA804-$1000000)).w,(dword_FFD100).l
		move.w  ((QUAKE_AMPLITUDE-$1000000)).w,d6
		beq.s   loc_3D7E
		addq.w  #1,d6
		bsr.w   GetRandomValue
		add.w   d0,(dword_FFD100).l
		add.w   d0,(dword_FFD100+2).l
		bsr.w   GetRandomValue
		add.w   d0,(dword_FFD500).l
		add.w   d0,(dword_FFD500+2).l
loc_3D7E:
		bsr.w   StoreVdpCommands
		bsr.w   StoreVdpCommandsbis
		rts

	; End of function sub_3D46


; =============== S U B R O U T I N E =======================================

GetRandomValue:
		
		bsr.w   UpdateRandomSeed
		move.w  d7,d0
		bsr.w   UpdateRandomSeed
		sub.w   d7,d0
		rts

	; End of function GetRandomValue


; =============== S U B R O U T I N E =======================================

sub_3D96:
		bsr.w   CopyMapBlocks
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		beq.s   loc_3DA8
		bset    #0,((byte_FFA82D-$1000000)).w
		bra.s   return_3DAE
loc_3DA8:
		bset    #1,((byte_FFA82D-$1000000)).w
return_3DAE:
		rts

	; End of function sub_3D96


; =============== S U B R O U T I N E =======================================

CopyMapBlocks:
		
		movem.l d0-d7/a2,-(sp)
		clr.w   d7
		move.b  d1,d7
		subq.w  #1,d7
		move.w  d1,d6
		lsr.w   #8,d6
		subq.w  #1,d6
		clr.w   d3
		move.b  d2,d3
		lsr.w   #8,d2
		lsl.w   #6,d3
		add.w   d3,d2
		add.w   d2,d2
		clr.w   d1
		move.b  d0,d1
		lsr.w   #8,d0
		lsl.w   #6,d1
		add.w   d1,d0
		add.w   d0,d0
		lea     (FF0000_RAM_START).l,a2
loc_3DDE:
		movem.w d0/d2/d6,-(sp)
loc_3DE2:
		move.w  (a2,d0.w),(a2,d2.w)
		addq.w  #2,d0
		addq.w  #2,d2
		dbf     d6,loc_3DE2
		movem.w (sp)+,d0/d2/d6
		addi.w  #$80,d0 
		addi.w  #$80,d2 
		dbf     d7,loc_3DDE
		movem.l (sp)+,d0-d7/a2
		rts

	; End of function CopyMapBlocks


; =============== S U B R O U T I N E =======================================

ResetCurrentMap:
		
		lea     (FF0000_RAM_START).l,a2
		move.w  #$7FF,d7
loc_3E10:
		clr.l   (a2)+
		dbf     d7,loc_3E10
		lea     (FF2000_LOADING_SPACE).l,a2
		move.l  #$C0F8C0F8,(a2)+
		move.l  #$C0F8C0F8,(a2)+
		move.l  #$C0F8C0F8,(a2)+
		move.l  #$C0F8C0F8,(a2)+
		move.w  #$C0F8,(a2)+
		clr.w   d0
		moveq   #$FFFFFFFF,d1   ; reload current map ?
		bra.w   LoadMap         

	; End of function ResetCurrentMap


; =============== S U B R O U T I N E =======================================

; uses door open SFX

OpenDoor:
		cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
		bne.w   return_3F22
		movem.w d0-d7,-(sp)
		lsr.w   #7,d0
		lsr.w   #7,d1
		lea     MapOffsetHashTable(pc), a2
		add.w   d0,d0
		move.b  (a2,d0.w),d0
		andi.w  #$3F,d0 
		add.w   d1,d1
		move.b  (a2,d1.w),d1
		andi.w  #$3F,d1 
		clr.w   d7
		move.b  ((CURRENT_MAP-$1000000)).w,d7
		movea.l (p_pt_MapData).l,a2
		lsl.w   #2,d7
		movea.l (a2,d7.w),a2
		movea.l $16(a2),a2      ; get map step events
loc_3E80:
		tst.b   (a2)
		bmi.w   loc_3F1E
		cmp.b   (a2),d0
		bne.w   loc_3F24
		cmp.b   1(a2),d1
		bne.w   loc_3F24
		tst.w   (a2)+
		move.b  (a2)+,d0
		ext.w   d0
		move.b  (a2)+,d1
		ext.w   d1
		move.b  (a2)+,d6
		ext.w   d6
		subq.b  #1,d6
		move.b  (a2)+,d7
		ext.w   d7
		subq.b  #1,d7
		move.b  (a2)+,d2
		ext.w   d2
		move.b  (a2)+,d3
		ext.w   d3
		lsl.w   #6,d3
		add.w   d3,d2
		add.w   d2,d2
		lsl.w   #6,d1
		add.w   d1,d0
		add.w   d0,d0
		lea     (FF0000_RAM_START).l,a2
		tst.w   d1
		blt.s   loc_3EEC
loc_3EC8:
		movem.w d0/d2/d6,-(sp)
loc_3ECC:
		move.w  (a2,d0.w),(a2,d2.w)
		addq.w  #2,d0
		addq.w  #2,d2
		dbf     d6,loc_3ECC
		movem.w (sp)+,d0/d2/d6
		addi.w  #$80,d0 
		addi.w  #$80,d2 
		dbf     d7,loc_3EC8
		bra.s   loc_3F06
loc_3EEC:
		movem.w d2/d6,-(sp)
loc_3EF0:
		clr.w   (a2,d2.w)
		addq.w  #2,d2
		dbf     d6,loc_3EF0
		movem.w (sp)+,d2/d6
		addi.w  #$80,d2 
		dbf     d7,loc_3EEC
loc_3F06:
		trap    #SOUND_COMMAND
		dc.w SFX_DOOR_OPEN      ; door open
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		beq.s   loc_3F18
		bset    #0,((byte_FFA82D-$1000000)).w
		bra.s   loc_3F1E
loc_3F18:
		bset    #1,((byte_FFA82D-$1000000)).w
loc_3F1E:
		movem.w (sp)+,d0-d7
return_3F22:
		rts
loc_3F24:
		addq.l  #8,a2
		addq.w  #1,d2
		bra.w   loc_3E80

	; End of function OpenDoor


; =============== S U B R O U T I N E =======================================

; display (or don't) map roof depending on player's start location

ToggleRoofOnMapLoad:
		
		movem.l d0-a1,-(sp)
		move.b  ((CAMERA_ENTITY-$1000000)).w,d4
		bpl.s   loc_3F38
		clr.w   d4
loc_3F38:
		andi.w  #$3F,d4 
		lsl.w   #5,d4
		lea     ((ENTITY_DATA-$1000000)).w,a0
		move.w  2(a0,d4.w),d5
		move.w  (a0,d4.w),d4
		clr.w   d1
		move.b  ((CURRENT_MAP-$1000000)).w,d1
		movea.l (p_pt_MapData).l,a0
		lsl.w   #2,d1
		movea.l (a0,d1.w),a0
		movea.l $1A(a0),a0
loc_3F60:
		tst.b   (a0)
		bmi.w   loc_3FE4
		move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d2
		ext.l   d2
		divs.w  #3,d2
		move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d3
		ext.l   d3
		divs.w  #3,d3
		clr.w   d0
		clr.w   d1
		move.b  6(a0),d0
		move.b  7(a0),d1
		sub.w   d2,d0
		sub.w   d3,d1
		clr.w   d2
		clr.w   d3
		move.b  4(a0),d2
		move.b  5(a0),d3
		add.b   d0,d2
		subq.b  #1,d2
		add.b   d1,d3
		subq.b  #1,d3
		mulu.w  #$180,d0
		mulu.w  #$180,d1
		mulu.w  #$180,d2
		mulu.w  #$180,d3
		cmp.w   d0,d4
		blt.w   loc_3FCA
		cmp.w   d1,d5
loc_3FB6:
		blt.w   loc_3FCA
		cmp.w   d2,d4
loc_3FBC:
		bgt.w   loc_3FCA
		cmp.w   d3,d5
		bgt.w   loc_3FCA
loc_3FC6:
		bra.w   loc_3FCE
loc_3FCA:
		addq.l  #8,a0
		bra.s   loc_3F60
loc_3FCE:
		clr.w   d0
		move.b  (a0),d0         ; get x trigger coord of block copy script
		mulu.w  #$180,d0
		clr.w   d1
		move.b  1(a0),d1        ; get y trigger coord of block copy script
		mulu.w  #$180,d1
		bsr.w   PerformMapBlockCopyScript
loc_3FE4:
		movem.l (sp)+,d0-a1
		rts

	; End of function ToggleRoofOnMapLoad


; =============== S U B R O U T I N E =======================================

PerformMapBlockCopyScript:
		
		move.w  d7,-(sp)
		tst.w   ((word_FFAF42-$1000000)).w
		bne.w   loc_40E6
		lsr.w   #7,d0
		lsr.w   #7,d1
		moveq   #1,d2
		lea     MapOffsetHashTable(pc), a3
		add.w   d0,d0
		move.b  (a3,d0.w),d0
		andi.w  #$3F,d0 
		add.w   d1,d1
		move.b  (a3,d1.w),d1
		andi.w  #$3F,d1 
		clr.w   d7
		move.b  ((CURRENT_MAP-$1000000)).w,d7
		movea.l (p_pt_MapData).l,a2
		lsl.w   #2,d7
		movea.l (a2,d7.w),a2
		movea.l $1A(a2),a2
loc_4028:
		tst.b   (a2)
		bmi.w   loc_40E6
		cmp.b   (a2),d0
		bne.w   loc_40EA
		cmp.b   1(a2),d1
		bne.w   loc_40EA
		move.w  d2,((word_FFAF42-$1000000)).w
		tst.w   (a2)+
		move.b  (a2)+,d0
		ext.w   d0
		move.b  (a2)+,d1
		ext.w   d1
		move.b  (a2)+,d6
		ext.w   d6
		subq.b  #1,d6
		move.b  (a2)+,d7
		ext.w   d7
		subq.b  #1,d7
		move.b  (a2)+,d2
		ext.w   d2
		move.b  (a2)+,d3
		ext.w   d3
		move.w  d2,(word_FF5C00).l
		move.w  d3,(word_FF5C02).l
		move.w  d6,(word_FF5C04).l
		move.w  d7,(word_FF5C06).l
		lsl.w   #6,d3
		add.w   d3,d2
		add.w   d2,d2
		lsl.w   #6,d1
		add.w   d1,d0
		add.w   d0,d0
		lea     (FF0000_RAM_START).l,a2
		lea     (byte_FF5C08).l,a3
		tst.w   d1
		blt.s   loc_40BA
loc_4092:
		movem.w d0/d2-d6,-(sp)
loc_4096:
		move.w  (a2,d2.w),(a3)+
		move.w  (a2,d0.w),(a2,d2.w)
		addq.w  #2,d0
		addq.w  #2,d2
		dbf     d6,loc_4096
		movem.w (sp)+,d0/d2-d6
		addi.w  #$80,d0 
		addi.w  #$80,d2 
		dbf     d7,loc_4092
		bra.s   loc_40D8
loc_40BA:
		movem.w d2/d6,-(sp)
loc_40BE:
		move.w  (a2,d2.w),(a3)+
		clr.w   (a2,d2.w)
		addq.w  #2,d2
		dbf     d6,loc_40BE
		movem.w (sp)+,d2/d6
		addi.w  #$80,d2 
		dbf     d7,loc_40BA
loc_40D8:
		move.w  #$FFFF,(a3)
		trap    #SOUND_COMMAND
		dc.w MUSIC_NOTHING
		bset    #0,((byte_FFA82D-$1000000)).w
loc_40E6:
		move.w  (sp)+,d7
		rts
loc_40EA:
		addq.l  #8,a2
		addq.w  #1,d2
		bra.w   loc_4028

	; End of function PerformMapBlockCopyScript


; =============== S U B R O U T I N E =======================================

sub_40F2:
		movem.w d7,-(sp)
		tst.w   ((word_FFAF42-$1000000)).w
		beq.w   loc_4150
		clr.w   ((word_FFAF42-$1000000)).w
		move.w  (word_FF5C00).l,d2
		move.w  (word_FF5C02).l,d3
		move.w  (word_FF5C04).l,d6
		move.w  (word_FF5C06).l,d7
		lsl.w   #6,d3
		add.w   d3,d2
		add.w   d2,d2
		lea     (FF0000_RAM_START).l,a2
		lea     (byte_FF5C08).l,a3
loc_412C:
		movem.w d2/d6,-(sp)
loc_4130:
		move.w  (a3)+,(a2,d2.w)
		addq.w  #2,d2
		dbf     d6,loc_4130
		movem.w (sp)+,d2/d6
		addi.w  #$80,d2 
		dbf     d7,loc_412C
		trap    #SOUND_COMMAND
		dc.w MUSIC_NOTHING
		bset    #0,((byte_FFA82D-$1000000)).w
loc_4150:
		movem.w (sp)+,d7
		rts

	; End of function sub_40F2


; =============== S U B R O U T I N E =======================================

OpenChest:
		movem.l d0-d1/a2,-(sp)
		bsr.w   GetChestItem
		tst.w   d0
		blt.s   loc_418E
		jsr     j_CheckFlag
		beq.s   loc_416E
		move.w  #ITEMIDX_NOTHING,d2
loc_416E:
		jsr     j_SetFlag
		move.w  #MAP_BLOCKIDX_OPENCHEST,(a2,d0.w)
						; set block idx to open chest
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		beq.s   loc_4188
		bset    #0,((byte_FFA82D-$1000000)).w
		bra.s   loc_418E
loc_4188:
		bset    #1,((byte_FFA82D-$1000000)).w
loc_418E:
		movem.l (sp)+,d0-d1/a2
		rts

	; End of function OpenChest


; =============== S U B R O U T I N E =======================================

CloseChest:
		movem.l d0-d1/a2,-(sp)
		bsr.w   GetChestItem
		tst.w   d0
		blt.s   loc_41C0
		jsr     j_ClearFlag
		move.w  #MAP_BLOCKIDX_CLOSEDCHEST,(a2,d0.w)
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		beq.s   loc_41BA
		bset    #0,((byte_FFA82D-$1000000)).w
		bra.s   loc_41C0
loc_41BA:
		bset    #1,((byte_FFA82D-$1000000)).w
loc_41C0:
		movem.l (sp)+,d0-d1/a2
		rts

	; End of function CloseChest


; =============== S U B R O U T I N E =======================================

CheckChestItem:
		
		movem.l d0-d1/a2,-(sp)
		bsr.w   GetChestItem
		tst.w   d0
		blt.s   loc_41F0
		jsr     j_CheckFlag
		beq.s   loc_41DE
		move.w  #$7F,d2 
loc_41DE:
		move.w  (a2,d0.w),d0
		andi.w  #$3C00,d0
		cmpi.w  #$1800,d0
		beq.s   loc_41F0
		move.w  #$FFFF,d2
loc_41F0:
		movem.l (sp)+,d0-d1/a2
		rts

	; End of function CheckChestItem


; =============== S U B R O U T I N E =======================================

CheckNonChestItem:
		
		movem.l d0-d1/a2,-(sp)
		bsr.w   GetNonChestItem
		tst.w   d0
		blt.s   loc_4214
		jsr     j_CheckFlag
		beq.s   loc_420E
		move.w  #$7F,d2 
loc_420E:
		jsr     j_SetFlag
loc_4214:
		movem.l (sp)+,d0-d1/a2
		rts

	; End of function CheckNonChestItem


; =============== S U B R O U T I N E =======================================

RefillNonChestItem:
		
		movem.l d0-d1/a2,-(sp)
		bsr.w   GetNonChestItem
		tst.w   d0
		blt.s   loc_422C
		jsr     j_ClearFlag
loc_422C:
		movem.l (sp)+,d0-d1/a2
		rts

	; End of function RefillNonChestItem


; =============== S U B R O U T I N E =======================================

GetChestItem:
		clr.w   d2
		move.b  ((CURRENT_MAP-$1000000)).w,d2
						; current map I guess
		movea.l (p_pt_MapData).l,a2
		lsl.w   #2,d2
		movea.l (a2,d2.w),a2    ; a2 points to current map data
		movea.l $22(a2),a2      ; get address of current map's chest item data
		bra.w   GetItem         

	; End of function GetChestItem


; =============== S U B R O U T I N E =======================================

GetNonChestItem:
		
		clr.w   d2
		move.b  ((CURRENT_MAP-$1000000)).w,d2
		movea.l (p_pt_MapData).l,a2
		lsl.w   #2,d2
		movea.l (a2,d2.w),a2
		movea.l $26(a2),a2      ; get address of current map's non-chest item data

	; End of function GetNonChestItem


; =============== S U B R O U T I N E =======================================

; IN : 
; - d0\d1 : candidate coordinates
; OUT :
; - d0 : layout block offset
; - d1 : item flag
; - d2 : item index
; - a2 : map layout offset

GetItem:
		movem.w d4-d5,-(sp)
		move.w  d0,d4           ; save d0 and d1
		move.w  d1,d5
		clr.w   d2
		move.b  ((CURRENT_BATTLE-$1000000)).w,d2
		cmpi.b  #$FF,d2
		beq.w   loc_4290        ; if we are not in battle branch
		movem.l a0,-(sp)
		conditionalWordAddr lea,BattleMapCoords,a0
		mulu.w  #5,d2           ; US/EU "Open chest in battle" bug here ! Should be 7, not 5 !
		add.b   1(a0,d2.w),d0
		add.b   2(a0,d2.w),d1   ; add x1 and y1 of battle camera bounds
		movem.l (sp)+,a0
loc_4290:
		tst.b   (a2)
		bmi.w   loc_42C6        ; if negative, then value > map max coord, so value = FF : end of data
		cmp.b   (a2),d0
		bne.w   loc_42D8        ; test coords
		cmp.b   1(a2),d1
		bne.w   loc_42D8        
		move.w  d4,d0           ; get back original coords
		move.w  d5,d1
		andi.w  #$3F,d1 
		lsl.w   #6,d1
		andi.w  #$3F,d0 
		add.w   d1,d0
		add.w   d0,d0           ; get map layout block offset ?
		clr.w   d1
		move.b  2(a2),d1        ; item flag
		clr.w   d2
		move.b  3(a2),d2        ; item index
		bra.w   loc_42CC
loc_42C6:
		moveq   #$FFFFFFFF,d0
		move.w  d0,d1
		move.w  d0,d2
loc_42CC:
		lea     (FF0000_RAM_START).l,a2
		movem.w (sp)+,d4-d5
		rts
loc_42D8:
		addq.l  #4,a2           ; go to next item
		bra.s   loc_4290

	; End of function GetItem


; =============== S U B R O U T I N E =======================================

WarpIfSetAtPoint:
		
		movem.l d0-d1/d7,-(sp)
		ext.l   d0
		ext.l   d1
		divs.w  #$180,d0
		divs.w  #$180,d1
		clr.w   d7
		move.b  ((CURRENT_MAP-$1000000)).w,d7
		movea.l (p_pt_MapData).l,a2
		lsl.w   #2,d7
		movea.l (a2,d7.w),a2
		movea.l $1E(a2),a2
loc_4302:
		cmpi.w  #$FFFF,(a2)
		beq.w   loc_433A
		tst.b   (a2)
		blt.s   loc_4314
		cmp.b   (a2),d0
		bne.w   loc_4340
loc_4314:
		tst.b   1(a2)
		blt.s   loc_4322
		cmp.b   1(a2),d1
		bne.w   loc_4340
loc_4322:
		move.w  #1,((MAP_EVENT_TYPE-$1000000)).w
		move.l  2(a2),((MAP_EVENT_PARAM_1-$1000000)).w
		move.w  6(a2),((MAP_EVENT_PARAM_5-$1000000)).w
		move.w  #SFX_WARP,((WARP_SFX-$1000000)).w
loc_433A:
		movem.l (sp)+,d0-d1/d7
		rts
loc_4340:
		addq.l  #8,a2
		bra.s   loc_4302

	; End of function WarpIfSetAtPoint


; =============== S U B R O U T I N E =======================================

sub_4344:
		movem.l a0-a1,-(sp)
		movem.w d7,-(sp)
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		bne.s   loc_4358
		clr.w   ((word_FFA80E-$1000000)).w
		bra.s   loc_435E
loc_4358:
		move.w  #$2000,((word_FFA80E-$1000000)).w
loc_435E:
		move.w  ((word_FFA810-$1000000)).w,d0
		move.w  ((word_FFA812-$1000000)).w,d1
		move.w  ((word_FFA804-$1000000)).w,d2
		move.w  ((word_FFA808-$1000000)).w,d3
		lea     (byte_FFC000).l,a1
		bsr.w   sub_43F8
		movea.l ((WINDOW_TILES_END-$1000000)).w,a1
		cmpa.l  #VDP_TILE_IDX_LIST,a1
		bne.s   loc_439A
		lea     (byte_FFC000).l,a0
		lea     ($C000).l,a1
		move.w  #$400,d0
		moveq   #2,d1
		bsr.w   sub_119E        
loc_439A:
		movem.w (sp)+,d7
		movem.l (sp)+,a0-a1
		rts

	; End of function sub_4344


; =============== S U B R O U T I N E =======================================

sub_43A4:
		movem.l a0-a1,-(sp)
		movem.w d7,-(sp)
		tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
		beq.s   loc_43B8
		clr.w   ((word_FFA80E-$1000000)).w
		bra.s   loc_43BE
loc_43B8:
		move.w  #$2000,((word_FFA80E-$1000000)).w
loc_43BE:
		move.w  ((word_FFA814-$1000000)).w,d0
		move.w  ((word_FFA816-$1000000)).w,d1
		move.w  ((word_FFA806-$1000000)).w,d2
		move.w  ((word_FFA80A-$1000000)).w,d3
		lea     (byte_FFE000).l,a1
		bsr.w   sub_43F8
		lea     (byte_FFE000).l,a0
		lea     ($E000).l,a1
		move.w  #$400,d0
		moveq   #2,d1
		bsr.w   sub_119E        
		movem.w (sp)+,d7
		movem.l (sp)+,a0-a1
		rts

	; End of function sub_43A4


; =============== S U B R O U T I N E =======================================

sub_43F8:
		neg.w   d2
		andi.w  #$FF,d2
		lsr.w   #3,d2
		add.w   d2,d2
		subq.w  #8,d3
		andi.w  #$FF,d3
		lsr.w   #3,d3
		add.w   d3,d3
		lsl.w   #5,d3
		andi.w  #$7FE,d3
		add.w   d2,d3
		lsr.w   #7,d0
		lsr.w   #7,d1
		lea     MapOffsetHashTable(pc), a3
		lea     (FF0000_RAM_START).l,a4
		lea     (FF2000_LOADING_SPACE).l,a5
		cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
		bne.w   loc_44B4
		moveq   #$20,d7 
loc_4434:
		movem.w d0/d3,-(sp)
		moveq   #$20,d6 
loc_443A:
		movem.w d0-d1,-(sp)
		add.w   d0,d0
		clr.w   d2
		move.b  1(a3,d0.w),d2
		move.b  (a3,d0.w),d0
		ext.w   d0
		add.w   d1,d1
		clr.w   d5
		move.b  1(a3,d1.w),d5
		move.b  (a3,d1.w),d1
		ext.w   d1
		lsl.w   #6,d1
		add.w   d1,d0
		add.w   d0,d0
		move.w  d5,d4
		add.w   d5,d5
		add.w   d4,d5
		add.w   d5,d2
		add.w   d2,d2
		move.w  (a4,d0.w),d0
		andi.w  #$3FF,d0
		add.w   d0,d0
		move.w  d0,d1
		lsl.w   #3,d0
		add.w   d1,d0
		add.w   d0,d2
		movem.w (sp)+,d0-d1
		move.w  (a5,d2.w),(a1,d3.w)
		move.w  d3,d2
		addq.w  #2,d3
		eor.w   d3,d2
		btst    #6,d2
		beq.s   loc_4496
		subi.w  #$40,d3 
loc_4496:
		addq.w  #1,d0
		dbf     d6,loc_443A
		movem.w (sp)+,d0/d3
		addi.w  #$40,d3 
		bclr    #$B,d3
		addq.w  #1,d1
		dbf     d7,loc_4434
		bsr.w   sub_3D46
		rts
loc_44B4:
		moveq   #$20,d7 
loc_44B6:
		movem.w d0/d3,-(sp)
		moveq   #$20,d6 
loc_44BC:
		movem.w d0-d1,-(sp)
		add.w   d0,d0
		clr.w   d2
		move.b  1(a3,d0.w),d2
		move.b  (a3,d0.w),d0
		ext.w   d0
		add.w   d1,d1
		clr.w   d5
loc_44D2:
		move.b  1(a3,d1.w),d5
		move.b  (a3,d1.w),d1
		ext.w   d1
		lsl.w   #6,d1
		add.w   d1,d0
		add.w   d0,d0
		move.w  d5,d4
		add.w   d5,d5
		add.w   d4,d5
		add.w   d5,d2
		add.w   d2,d2
		move.w  (a4,d0.w),d0
loc_44F0:
		cmpi.w  #$C000,d0
		bcs.s   loc_44FA
		clr.w   d4
		bra.s   loc_44FE
loc_44FA:
		move.w  ((word_FFA80E-$1000000)).w,d4
loc_44FE:
		andi.w  #$3FF,d0
		add.w   d0,d0
		move.w  d0,d1
		lsl.w   #3,d0
		add.w   d1,d0
		add.w   d0,d2
		movem.w (sp)+,d0-d1
		move.w  (a5,d2.w),(a1,d3.w)
		or.w    d4,(a1,d3.w)
		move.w  d3,d2
		addq.w  #2,d3
		eor.w   d3,d2
		btst    #6,d2
		beq.s   loc_452A
		subi.w  #$40,d3 
loc_452A:
		addq.w  #1,d0
		dbf     d6,loc_44BC
		movem.w (sp)+,d0/d3
		addi.w  #$40,d3 
		bclr    #$B,d3
		addq.w  #1,d1
		dbf     d7,loc_44B6
		rts

	; End of function sub_43F8

