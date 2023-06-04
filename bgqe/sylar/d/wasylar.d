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
	IF ~~ THEN REPLY @9 GOTO 4
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
	IF ~OR(2)
PartyHasItem("%tutu_var%Misc80") PartyHasItem("%tutu_scriptbg%%female_body_res%")
GlobalLT("WAHelpSylar","Global",6)~ THEN REPLY @24 GOTO 12
	IF ~OR(2)
PartyHasItem("%tutu_var%Misc80") PartyHasItem("%tutu_scriptbg%%female_body_res%") 
Global("WAHelpSylar","Global",6)~ THEN REPLY @24 GOTO 22
END

IF ~~ THEN BEGIN 12
	SAY @25
	IF ~PartyHasItem("%tutu_scriptbg%%female_body_res%")~ THEN DO ~TakePartyItem("%tutu_scriptbg%%female_body_res%")
	GiveGoldForce(150)
	IncrementGlobal("WAHelpSylar","Global",1)~ EXIT
	IF ~PartyHasItem("%tutu_var%Misc80")~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	IncrementGlobal("WAHelpSylar","Global",1)~ EXIT
END

IF ~~ THEN BEGIN 22
	SAY @27
	IF ~PartyHasItem("%tutu_scriptbg%%female_body_res%")~ THEN DO ~TakePartyItem("%tutu_scriptbg%%female_body_res%")
	GiveGoldForce(150)
	SetGlobal("WAHelpSylar","Global",7)
	%ERASEJOURNALENTRY_9003%
	EscapeArea()~ EXIT
	IF ~PartyHasItem("%tutu_var%Misc80")~ THEN DO ~TakePartyItem("%tutu_var%MISC80")
	GiveGoldForce(150)
	SetGlobal("WAHelpSylar","Global",7)
	%ERASEJOURNALENTRY_9003%
	EscapeArea()~ EXIT
END
