
; ASM FILE data\maps\entries\map07\mapsetups\s3.asm :
; 0x5579E..0x557EE : 
ms_map7_ZoneEvents:
		dc.b 9
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.b $A
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.b $B
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.b $C
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.b $D
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.w $FD00
		dc.w return_557EC-ms_map7_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_557B6:
		trap    #CHECK_FLAG
		dc.w $322
		bne.s   loc_557D8
		trap    #CHECK_FLAG
		dc.w $2BD
		beq.s   loc_557D6
		trap    #CHECK_FLAG
		dc.w $2BE
		bne.s   loc_557D6
		lea     cs_55A36(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2BE               ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		trap    #SET_FLAG
		dc.w $43                ; Peter is a follower
loc_557D6:
		bra.s   return_557EC
loc_557D8:
		trap    #CHECK_FLAG
		dc.w $325
		bne.s   return_557EC
		lea     cs_55BEE(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $325               ; set after coming back to New Granseal after Creed's Mansion,when Astral joins
		trap    #SET_FLAG
		dc.w $46                ; Astral is a follower
return_557EC:
		rts

	; End of function sub_557B6

