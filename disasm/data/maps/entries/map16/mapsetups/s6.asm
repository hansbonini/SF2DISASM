
; ASM FILE data\maps\entries\map16\mapsetups\s6.asm :
; 0x51F76..0x52284 : 

; =============== S U B R O U T I N E =======================================

ms_map16_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $298               ; set after the Galam guards catch you sneaking around, but before battle
		beq.s   return_51F86
		move.w  #$91,d0 
		jsr     MoveEntityOutOfMap
return_51F86:
		rts

	; End of function ms_map16_InitFunction

cs_51F88:       textCursor $3C2
		nextSingleText $C0,$80  ; "Listen, everybody!{N}We're going to Granseal!{W1}"
		setFacing $5,DOWN
		setFacing $0,DOWN
		setCamDest 12,11
		nextSingleText $C0,$5   ; "We're too late!{W1}"
		nextText $C0,$80        ; "As you may know, my{N}messenger was killed!{W2}"
		nextText $C0,$80        ; "Granseal must have done{N}this.{W2}"
		nextSingleText $C0,$80  ; "So we're invading them to{N}retaliate!{W1}"
		nextSingleText $FF,$FF  ; "Murmur...murmur....{W1}"
		csWait 20
		setFacing $1C,RIGHT
		csWait 20
		setFacing $1C,LEFT
		csWait 20
		setDest $1C,16,17
		nextText $0,$1C         ; "Quiet!  Everybody listen{N}to me!{W1}"
		nextText $0,$1C         ; "I also don't understand{N}this march!{W2}"
		nextText $0,$1C         ; "But, King Galam must{N}have a good reason!{W2}"
		nextText $0,$1C         ; "I believe the King!{N}How about you?{N}Anyone disagree?{W1}"
		csWait 5
		setActscript $1C,eas_461B6
		csWait 60
		nextSingleText $0,$1C   ; "No?  Good!{W1}"
		setFacing $1C,DOWN
		csWait 20
		setFacing $1C,UP
		csWait 20
		setDest $1C,16,16
		setFacing $1C,RIGHT
		setFacing $80,LEFT
		csWait 20
		setFacing $1C,DOWN
		nextSingleText $C0,$80  ; "Well done, {NAME;28}.{W1}"
		setFacing $80,DOWN
		nextSingleText $0,$1C   ; "King Galam, victory is{N}ours!{W1}"
		nextSingleText $C0,$80  ; "Guards!{N}Open the gate!{N}Lower the bridge!{W1}"
		csWait 30
		playSound SFX_BIG_DOOR_RUMBLE
		csWait 150
		setFacing $80,LEFT
		nextSingleText $C0,$80  ; "{NAME;28}, prove your{N}allegiance.{W1}"
		setFacing $1C,RIGHT
		nextSingleText $0,$1C   ; "What do you mean?{W1}"
		nextSingleText $C0,$80  ; "Show no mercy!{W1}"
		nextSingleText $0,$1C   ; "My Lord...{W1}"
		nextSingleText $C0,$80  ; "Now, go!{W1}"
		setFacing $80,DOWN
		setFacing $1C,DOWN
		csWait 20
		setCamDest 12,18
		setDest $80,17,23
		setDest $1C,17,17
		setDest $1C,17,22
		setDest $1C,18,24
		setFacing $80,UP
		setFacing $1C,UP
		setFacing $81,DOWN
		setFacing $82,DOWN
		setFacing $83,DOWN
		setFacing $84,DOWN
		setFacing $85,DOWN
		setFacing $86,DOWN
		setFacing $87,DOWN
		setFacing $88,DOWN
		setFacing $89,DOWN
		setFacing $8A,DOWN
		setFacing $8B,DOWN
		setFacing $8C,DOWN
		setFacing $8D,DOWN
		setFacing $8E,DOWN
		setFacing $8F,DOWN
		setFacing $90,DOWN
		nextSingleText $0,$80   ; "Crush Granseal!{W1}"
		entityActions $1C
		 moveDown 7
		endActions
		entityActions $80
		 moveDown 7
		endActions
		entityActions $81
		 moveDown 7
		endActions
		entityActions $82
		 moveDown 7
		endActions
		entityActions $83
		 moveDown 7
		endActions
		entityActions $84
		 moveDown 7
		endActions
		entityActions $85
		 moveDown 7
		endActions
		entityActions $86
		 moveDown 7
		endActions
		entityActions $87
		 moveDown 7
		endActions
		entityActions $88
		 moveDown 7
		endActions
		entityActions $89
		 moveDown 7
		endActions
		entityActions $8A
		 moveDown 7
		endActions
		entityActions $8B
		 moveDown 7
		endActions
		entityActions $8C
		 moveDown 7
		endActions
		entityActions $8D
		 moveDown 7
		endActions
		entityActions $8E
		 moveDown 7
		endActions
		entityActions $8F
		 moveDown 7
		endActions
		entityActions $90
		 moveDown 7
		endActions
		setFacing $5,DOWN
		setFacing $0,DOWN
		setCamDest 12,5
		hide $1C
		hide $80
		hide $81
		hide $82
		hide $83
		hide $84
		hide $85
		hide $86
		hide $87
		hide $88
		hide $89
		hide $8A
		hide $8B
		hide $8C
		hide $8D
		hide $8E
		hide $8F
		hide $90
		nextText $C0,$5         ; "They've gone.{N}The war begins.{W1}"
		setFacing $5,LEFT
		setFacing $0,RIGHT
		nextText $C0,$5         ; "So, what should we do?{N}Are you still going to{N}Granseal?{W1}"
		nextText $C0,$5         ; "You're serious?{N}Do you think you can stop{N}the war?{W2}"
		nextSingleText $0,$5    ; "I will leave you once I'm{N}outside the gate!{W1}"
		csc_end
cs_521BA:       textCursor $3DA
		setPos $92,17,16,UP
		setPos $93,17,15,DOWN
		nextSingleText $0,$91   ; "You!{W1}"
		setCamDest 0,17
		nextSingleText $0,$91   ; "How did you get out?{W1}"
		setActscriptWait $5,eas_Init
		setActscriptWait $0,eas_Init
		setDest $0,3,19
		setDest $5,4,19
		nextSingleText $0,$5    ; "I...{W1}"
		nextSingleText $0,$92   ; "Wow, great jewel!{W1}"
		setCamDest 12,10
		nextSingleText $0,$93   ; "Oh, this?{N}The King gave it to me!{W1}"
		nextSingleText $0,$92   ; "Because you captured that{N}rat?{W1}"
		setCamDest 0,13
		setFacing $0,RIGHT
		setFacing $5,LEFT
		nextText $0,$93         ; "Yes.  I presented them to{N}King Galam.{W2}"
		nextSingleText $0,$93   ; "He was so kind to give me{N}one of the pair, the Jewel{N}of Light!{W1}"
		entityActions $0
		 moveRight 1
		endActions
		entityActionsWait $5
		 moveRight 1
		endActions
		nextSingleText $0,$91   ; "Wait!{W1}"
		setFacing $0,DOWN
		setFacing $5,DOWN
		setCamDest 0,18
		nextSingleText $0,$91   ; "How did you escape?{W1}"
		setFacing $0,RIGHT
		setFacing $5,LEFT
		csWait 20
		setFacing $0,DOWN
		setFacing $5,DOWN
		setDest $91,9,23
		setActscriptWait $91,eas_Jump
		setActscriptWait $91,eas_Jump
		nextSingleText $0,$91   ; "Intruders!  Intruders!{N}Arrest them!{W1}"
		setStoryFlag $5         ; Battle 5 unlocked
cs_5227C:       warp $10,$0,$0,$0
		csc_end
