BEGIN WASYLAR

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
	SAY @0
	IF ~~ THEN REPLY @1 GOTO 1
	IF ~~ THEN REPLY @2 GOTO 1
	IF ~~ THEN REPLY @3 GOTO 8
END

IF ~~ THEN BEGIN 1
	SAY @4
	IF ~~ THEN REPLY @5 GOTO 2
	IF ~!%PC_Kit_MAGESCHOOL_NECROMANCER%~ THEN REPLY @6 GOTO 3
	IF ~~ THEN REPLY @7 GOTO 8
END

IF ~~ THEN BEGIN 2
	SAY @8
	IF ~~ THEN REPLY @9 GOTO 3
END

IF ~~ THEN BEGIN 3
	SAY @10
	IF ~~ THEN REPLY @9 GOTO 4
END

IF ~~ THEN BEGIN 4
	SAY @11
	IF ~~ THEN REPLY @12 GOTO 5
	IF ~~ THEN REPLY @13 GOTO 6
	IF ~%PC_Kit_MAGESCHOOL_NECROMANCER%~ THEN REPLY @14 GOTO 7
END

IF ~~ THEN BEGIN 5
	SAY @15
	IF ~~ THEN DO ~SetGlobal("WAHelpSylar","Global",1)
	AddJournalEntry(@9003%INFO%)~ EXIT
END

IF ~~ THEN BEGIN 6
	SAY @16
	IF ~~ THEN DO ~AddJournalEntry(@9004%INFO%)~ EXIT
END

IF ~~ THEN BEGIN 7
	SAY @17 
	IF ~~ THEN DO ~SetGlobal("WAHelpSylar","Global",1)
	AddJournalEntry(@9003%INFO%)~ EXIT
END

IF ~~ THEN BEGIN 8
	SAY @16
	IF ~~ THEN EXIT
END

IF ~Global("WAHelpSylar","Global",0)~ THEN BEGIN 9
	SAY @18
	IF ~~ THEN REPLY @19 GOTO 10
	IF ~~ THEN REPLY @20 GOTO 8
END

IF ~~ THEN BEGIN 10
	SAY @21
	IF ~~ THEN DO ~SetGlobal("WAHelpSylar","Global",1)
	%ERASEJOURNALENTRY_9004%
	AddJournalEntry(@9003%INFO%)~ EXIT
END

IF ~GlobalLT("WAHelpSylar","Global",7)~ THEN BEGIN 11
	SAY @22
	IF ~~ THEN REPLY @23 EXIT
	IF ~PartyHasItem("%tutu_var%Misc80") GlobalLT("WAHelpSylar","Global",6)~ THEN REPLY @24 GOTO 12
	IF ~PartyHasItem("%tutu_var%Misc80") Global("WAHelpSylar","Global",6)~ THEN REPLY @24 GOTO 22
END

IF ~~ THEN BEGIN 12
	SAY @25
	IF ~~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	IncrementGlobal("WAHelpSylar","Global",1)~ EXIT
END

/*

IF ~Global("WAHelpSylar","Global",1)~ THEN BEGIN 11
	SAY @22
	IF ~~ THEN REPLY @23 EXIT
	IF ~PartyHasItem("%tutu_var%Misc80")~ THEN REPLY @24 GOTO 12
END

IF ~~ THEN BEGIN 12
	SAY @25
	IF ~~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	SetGlobal("WAHelpSylar","Global",2)~ EXIT
END

IF ~Global("WAHelpSylar","Global",2)~ THEN BEGIN 13
	SAY @26
	IF ~~ THEN REPLY @23 EXIT
	IF ~PartyHasItem("%tutu_var%Misc80")~ THEN REPLY @24 GOTO 14
END

IF ~~ THEN BEGIN 14
	SAY @25
	IF ~~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	SetGlobal("WAHelpSylar","Global",3)~ EXIT
END

IF ~Global("WAHelpSylar","Global",3)~ THEN BEGIN 15
	SAY @26
	IF ~~ THEN REPLY @23 EXIT
	IF ~PartyHasItem("%tutu_var%Misc80")~ THEN REPLY @24 GOTO 16
END

IF ~~ THEN BEGIN 16
	SAY @25
	IF ~~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	SetGlobal("WAHelpSylar","Global",4)~ EXIT
END

IF ~Global("WAHelpSylar","Global",4)~ THEN BEGIN 17
	SAY @26
	IF ~~ THEN REPLY @23 EXIT
	IF ~PartyHasItem("%tutu_var%Misc80")~ THEN REPLY @24 GOTO 18
END

IF ~~ THEN BEGIN 18
	SAY @25
	IF ~~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	SetGlobal("WAHelpSylar","Global",5)~ EXIT
END

IF ~Global("WAHelpSylar","Global",5)~ THEN BEGIN 19
	SAY @26
	IF ~~ THEN REPLY @23 EXIT
	IF ~PartyHasItem("Misc80")~ THEN REPLY @24 GOTO 20
END

IF ~~ THEN BEGIN 20
	SAY @25
	IF ~~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	SetGlobal("WAHelpSylar","Global",6)~ EXIT
END

IF ~Global("WAHelpSylar","Global",6)~ THEN BEGIN 21
	SAY @26
	IF ~~ THEN REPLY @23 EXIT
	IF ~PartyHasItem("%tutu_var%Misc80")~ THEN REPLY @24 GOTO 22
END
*/

IF ~~ THEN BEGIN 22
	SAY @27
	IF ~~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	SetGlobal("WAHelpSylar","Global",7)
	%ERASEJOURNALENTRY_9003%
	EscapeArea()~ EXIT
END
