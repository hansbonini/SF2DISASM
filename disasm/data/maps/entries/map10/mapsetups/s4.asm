
; ASM FILE data\maps\entries\map10\mapsetups\s4.asm :
; 0x56FE0..0x57028 : 

; =============== S U B R O U T I N E =======================================

ms_map10_AreaDescriptions:
		
		move.w  #$1007,d3
		lea     word_56FF0(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map10_AreaDescriptions

word_56FF0:     dc.w $2017
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 0
		dc.w $1E1B
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 1
		dc.w $2623
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 2
		dc.w $2822
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 3
		dc.w $B2A
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 4
		dc.w $C2A
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 5
		dc.w $1D30
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 6
		dc.w $1E30
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 7
		dc.w $2819
		dc.b 0
		dc.b 0
		dc.b 6
		dc.b 8
		dc.w $FD00
