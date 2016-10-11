
; SCRIPT SECTION system\tech\bytecopy :
; Byte-copy function

; =============== S U B R O U T I N E =======================================

;     Copy D7 bytes from A0 to A1.
;     In: A0 = src address
;         A1 = dest address
;         D7 = number of bytes to copy

CopyBytes:
										
										movem.l d7-a1,-(sp)
										cmpa.l  a0,a1
										bgt.w   loc_16EE
										subq.w  #1,d7
loc_16E2:
										move.b  (a0)+,(a1)+
										dbf     d7,loc_16E2
										movem.l (sp)+,d7-a1
										rts
loc_16EE:
										adda.w  d7,a0
										adda.w  d7,a1
										subq.w  #1,d7
loc_16F4:
										move.b  -(a0),-(a1)
										dbf     d7,loc_16F4
										movem.l (sp)+,d7-a1
										rts

	; End of function CopyBytes

