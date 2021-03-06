
; ASM FILE code\specialscreens\witch\witchactions.asm :
; 0x7406..0x75C4 : Witch actions

; =============== S U B R O U T I N E =======================================

WitchNew:
		trap    #TEXTBOX
		dc.w $DE                ; "What should I call you?{W2}"
		move.b  (SAVE_FLAGS).l,d2
		andi.w  #3,d2
		eori.w  #3,d2
		lsl.w   #1,d2
		btst    #1,d2
		beq.s   loc_7424
		moveq   #1,d0
		bra.s   loc_7426
loc_7424:
		moveq   #2,d0
loc_7426:
		moveq   #1,d1
loc_7428:
		jsr     j_WitchMainMenu
		tst.w   d0
		bmi.s   loc_73C2
		subq.w  #1,d0
		move.w  d0,((SAVE_SLOT_BEING_USED-$1000000)).w
		jsr     j_NewGame
		trap    #TEXTBOX
		dc.w $FFFF
		clr.w   d0
		jsr     j_NameCharacter
		btst    #7,(SAVE_FLAGS).l
		beq.w   loc_7476
		btst    #7,((P1_INPUT-$1000000)).w
		beq.w   loc_7476
		moveq   #1,d0
		moveq   #$1B,d7
loc_7464:
		jsr     j_NameCharacter
loc_746A:
		addq.w  #1,d0
		cmpi.w  #6,d0
		beq.s   loc_746A
		dbf     d7,loc_7464
loc_7476:
		trap    #TEXTBOX
		dc.w $DF                ; "{NAME;0}....{N}Nice name, huh?{W2}"
		bsr.w   CheatModeConfiguration
		trap    #TEXTBOX
		dc.w $E8                ; "I'll let you decide the{N}difficulty level at this time."
		clr.w   d0
		moveq   #3,d1
		moveq   #$F,d2
		jsr     j_WitchMainMenu
		tst.w   d0
		bpl.s   loc_7494
		clr.w   d0
loc_7494:
		btst    #0,d0
		beq.s   loc_749E
		trap    #SET_FLAG
		dc.w $4E                ; Difficulty
loc_749E:
		btst    #1,d0
		beq.s   loc_74A8        
		trap    #SET_FLAG
		dc.w $4F                ; Difficulty
loc_74A8:
		addi.w  #$E9,d0 ; difficulty choice reactions
		bsr.w   DisplayText     
		trap    #TEXTBOX
		dc.w $E0                ; "Now, good luck!{N}You have no time to waste!{W1}"
loc_74B4:
		move.w  ((SAVE_SLOT_BEING_USED-$1000000)).w,d0
		move.b  #3,((CURRENT_MAP-$1000000)).w
		move.b  #3,((EGRESS_MAP_INDEX-$1000000)).w
		bsr.w   SaveGame
                disableSram
		trap    #TEXTBOX
		dc.w $FFFF
		move.b  #3,d0
		move.w  #$38,d1 
		move.w  #3,d2
		move.w  #3,d3
		moveq   #1,d4
loc_74DE:
		bra.w   MainBattleAndExplorationLoop

	; End of function WitchNew


; =============== S U B R O U T I N E =======================================

WitchLoad:
		trap    #TEXTBOX
		dc.w $E1                ; "By the way, who are you?"
		move.b  (SAVE_FLAGS).l,d2
		andi.w  #3,d2
		lsl.w   #1,d2
		btst    #1,d2
		beq.s   loc_74FC
		moveq   #1,d0
		bra.s   loc_74FE
loc_74FC:
		moveq   #2,d0
loc_74FE:
		moveq   #2,d1
		jsr     j_WitchMainMenu
		tst.w   d0
		bmi.w   loc_73C2
		subq.w  #1,d0
		move.w  d0,((SAVE_SLOT_BEING_USED-$1000000)).w
		bsr.w   LoadGame
                disableSram
		trap    #TEXTBOX
		dc.w $E2                ; "{NAME;0}, yes!  I knew it!{W2}"
		bsr.w   CheatModeConfiguration
		trap    #TEXTBOX
		dc.w $E0                ; "Now, good luck!{N}You have no time to waste!{W1}"
		trap    #TEXTBOX
		dc.w $FFFF
		clr.b   ((WINDOW_HIDING_FORBIDDEN-$1000000)).w
		trap    #CHECK_FLAG
		dc.w $58                ; checks if a game has been saved for copying purposes? (or if saved from battle?)
		beq.s   loc_753A
		jsr     j_ExecuteBattleLoop
		bra.w   loc_75E0
loc_753A:
		clr.w   d0
		move.b  ((CURRENT_MAP-$1000000)).w,d0
		jsr     GetEgressPositionForMap(pc)
		nop
		moveq   #$FFFFFFFF,d4
		bra.w   loc_75E0

	; End of function WitchLoad


; =============== S U B R O U T I N E =======================================

WitchCopy:
		trap    #TEXTBOX
		dc.w $E3                ; "Copy?  Really?"
		jsr     j_YesNoChoiceBox
		tst.w   d0
		bne.w   loc_73C2
		move.b  (SAVE_FLAGS).l,d0
		andi.w  #3,d0
		subq.w  #1,d0
		bsr.w   CopySave
		trap    #TEXTBOX
		dc.w $E4                ; "Hee, hee!  It's done.{W2}"
		bra.w   loc_73C2

	; End of function WitchCopy


; =============== S U B R O U T I N E =======================================

WitchDel:
		trap    #TEXTBOX
		dc.w $E5                ; "Delete which one?"
		move.b  (SAVE_FLAGS).l,d2
		andi.w  #3,d2
		lsl.w   #1,d2
		btst    #1,d2
		beq.s   loc_758E
		moveq   #1,d0
		bra.s   loc_7590
loc_758E:
		moveq   #2,d0
loc_7590:
		moveq   #2,d1
		jsr     j_WitchMainMenu
		tst.w   d0
		bmi.w   loc_73C2
		subq.w  #1,d0
		move.w  d0,((SAVE_SLOT_BEING_USED-$1000000)).w
		trap    #TEXTBOX
		dc.w $E6                ; "Delete?  Are you sure?"
		jsr     j_YesNoChoiceBox
		tst.w   d0
		bne.w   loc_73C2
		move.w  ((SAVE_SLOT_BEING_USED-$1000000)).w,d0
		bsr.w   ClearSaveSlotFlag
		trap    #TEXTBOX
		dc.w $E7                ; "Hee, hee!  It's gone!{W2}"
		bra.w   loc_73C2

	; End of function WitchDel

