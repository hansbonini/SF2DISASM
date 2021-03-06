
; ASM FILE data\scripting\map\cs_intro1.asm :
; 0x47F7E..0x48380 : Intro cutscene 1
IntroCutscene1: textCursor $105A
		mapLoad 42,2,5
		csWait 1
		loadMapEntities ce_48340
		setActscriptWait $0,eas_Init
		setActscriptWait $83,eas_Init3
		setActscriptWait $84,eas_Init3
		setActscriptWait $85,eas_Init3
		setActscript $82,eas_Transparent
		fadeInFromBlackHalf
		csWait 30
		setPos $5,7,15,UP
		setPos $80,7,16,UP
		setPos $81,7,17,UP
		entityActions $5
		 moveUp 6
		endActions
		entityActions $80
		 moveUp 6
		endActions
		entityActionsWait $81
		 moveUp 6
		endActions
		playSound SFX_INTRO_LIGHTNING
		setQuake 1
		setPos $83,7,12,LEFT
		setPos $84,7,13,UP
		setPos $85,7,14,UP
		csWait 5
		setQuake 0
		setPos $83,63,63,LEFT
		setPos $84,63,63,UP
		setPos $85,63,63,UP
		csWait 10
		setFacing $5,DOWN
		setFacing $80,DOWN
		setFacing $81,DOWN
		setPos $83,7,12,LEFT
		setPos $84,7,13,UP
		setPos $85,7,14,UP
		csWait 5
		setPos $83,63,63,LEFT
		setPos $84,63,63,UP
		setPos $85,63,63,UP
		csWait 10
		setPos $83,7,12,LEFT
		setPos $84,7,13,UP
		setPos $85,7,14,UP
		csWait 5
		setPos $83,63,63,LEFT
		setPos $84,63,63,UP
		setPos $85,63,63,UP
		csWait 10
		setActscript $5,eas_Jump
		setActscript $80,eas_Jump
		setActscriptWait $81,eas_Jump
		setActscript $5,eas_Jump
		setActscript $80,eas_Jump
		setActscriptWait $81,eas_Jump
		csWait 30
		setCameraEntity $5
		entityActions $5
		 moveUp 4
		endActions
		entityActions $80
		 moveUp 4
		endActions
		entityActionsWait $81
		 moveUp 4
		endActions
		setActscriptWait $80,eas_BumpUp
		setActscriptWait $81,eas_BumpUp
		csWait 30
		setFacing $5,DOWN
		nextSingleText $80,$5   ; "Stay here, OK?{D2}"
		nod $80
		entityActionsWait $5
		 moveRight 5
		endActions
		setFacing $80,RIGHT
		setFacing $81,RIGHT
		entityActionsWait $5
		 moveDown 3
		endActions
		csWait 30
		shiver $5
		csWait 30
		nextSingleText $80,$5   ; "Oops, a dead end!{D2}"
		entityActionsWait $5
		 moveUp 3
		 moveLeft 5
		endActions
		setFacing $80,UP
		setFacing $81,UP
		setFacing $5,DOWN
		csWait 20
		headshake $5
		csWait 20
		entityActionsWait $5
		 moveLeft 5
		endActions
		setFacing $80,LEFT
		setFacing $81,LEFT
		entityActionsWait $5
		 moveDown 3
		endActions
		csWait 40
		shiver $5
		csWait 40
		nextSingleText $80,$5   ; "Hey!  I found some hidden{N}stairs!{D2}"
		entityActionsWait $5
		 moveUp 2
		 faceRight 1
		endActions
		nextSingleText $80,$5   ; "Hey, guys!{N}Follow me!{D2}"
		nextSingleText $0,$80   ; "Alright!{D2}"
		setActscript $80,eas_Jump
		setActscriptWait $81,eas_Jump
		setActscript $80,eas_Jump
		setActscriptWait $81,eas_Jump
		entityActions $80
		 moveUp 1
		 moveLeft 5
		 faceDown 1
		endActions
		entityActionsWait $81
		 moveUp 2
		 moveLeft 4
		 faceDown 1
		endActions
		setFacing $5,UP
		csWait 20
		entityActions $5
		 moveDown 3
		endActions
		entityActions $80
		 moveDown 3
		endActions
		entityActionsWait $81
		 moveLeft 1
		 moveDown 2
		endActions
		playSound SFX_WARP
		fadeOutToBlackHalf
		setCameraEntity $FFFF
		setPos $5,19,3,DOWN
		setPos $80,19,3,DOWN
		setPos $81,19,3,DOWN
		reloadMap 15,0
		csWait 10
		fadeInFromBlackHalf
		setCameraEntity $5
		entityActionsWait $5
		 moveDown 1
		endActions
		csWait 10
		nextSingleText $80,$5   ; "Finally, I found the hidden{N}room of the Ancient Shrine!{D2}"
		entityActions $5
		 moveDown 1
		endActions
		entityActionsWait $80
		 moveDown 1
		endActions
		entityActions $5
		 moveDown 2
		endActions
		entityActions $80
		 moveDown 2
		endActions
		entityActionsWait $81
		 moveDown 2
		endActions
		csWait 30
		setActscriptWait $5,eas_Jump
		setActscriptWait $5,eas_Jump
		nextSingleText $80,$5   ; "A treasure chest!{D2}"
		customActscriptWait $5
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $80
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $81
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $5
		 moveDown 2
		endActions
		entityActions $80
		 moveDown 2
		endActions
		entityActionsWait $81
		 moveDown 2
		endActions
		setCamDest 15,5
		shiver $5
		nextSingleText $80,$5   ; "I wonder if they're here?{D2}"
		nextSingleText $FF,$FF  ; "{NAME;5} the thief opened{N}the chest.{D2}"
		setBlocks 7,3,1,1,19,10
		nextSingleText $FF,$FF  ; "He found Power Water.{D2}"
		headshake $5
		nextSingleText $80,$5   ; "No, I don't want this!{D2}"
		nextSingleText $FF,$FF  ; "{NAME;5} discarded the{N}Power Water.{D2}"
		setBlocks 4,3,1,1,19,10
		csWait 30
		setActscriptWait $5,eas_Init
		setActscriptWait $80,eas_Init
		setActscriptWait $81,eas_Init
		entityActionsWait $81
		 moveLeft 1
		 moveDown 2
		 faceRight 1
		endActions
		nextSingleText $0,$81   ; "Where on Earth are those{N}jewels?{D2}"
		csWait 10
		setFacing $5,LEFT
		nextSingleText $80,$5   ; "I'm not sure.{D2}"
		csWait 20
		setCameraEntity $5
		entityActions $5
		 moveRight 5
		endActions
		entityActions $80
		 moveDown 1
		 moveRight 4
		endActions
		entityActionsWait $81
		 eaWait 20
		 moveRight 4
		endActions
		csWait 5
		setActscript $5,eas_461E4
		csWait 5
		setActscript $80,eas_461B6
		csWait 5
		setActscript $81,eas_461B6
		csWait 60
		entityActionsWait $5
		 moveRight 2
		 moveUp 1
		endActions
		nextSingleText $80,$5   ; "Something is shining over{N}there...!{D2}"
		setFacing $80,UP
		setFacing $81,UP
		setCamDest 21,1
		nextSingleText $80,$5   ; "Oh, they must be the jewels{N}of light and evil!{D2}"
		csWait 20
		fadeOutToBlackHalf
		csc_end
ce_48340:       mainEntity 63,63,UP
		entity 63,63,DOWN,5,eas_Init
		entity 63,63,UP,202,eas_Init
		entity 63,63,UP,202,eas_Init
		entity 26,4,DOWN,173,eas_Init
		entity 63,63,LEFT,183,eas_Init
		entity 63,63,UP,183,eas_Init
		entity 63,63,UP,183,eas_Init
		dc.w $FFFF
