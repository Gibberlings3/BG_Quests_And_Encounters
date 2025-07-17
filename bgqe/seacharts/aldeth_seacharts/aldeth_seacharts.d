
/* aldeth_seacharts.d */

/* additions to Mendas' dialogue */

EXTEND_BOTTOM menda1 5
++ @74 /* ~I'm not sure I like where this is going, but please, continue.~ */ + 8
END

ADD_TRANS_ACTION menda1 BEGIN 5 END BEGIN 0 END
~SetGlobal("C#q14_JournalEntry0","MYAREA",1)~

ADD_TRANS_ACTION menda1 BEGIN 8 END BEGIN 3 END
~SetGlobal("C#q14_JournalEntry1","MYAREA",1)~

ADD_TRANS_ACTION menda1 BEGIN 11 END BEGIN END
~SetGlobal("C#q14_JournalEntry2","MYAREA",1)~



/* GlobalGT("TalkedToMendas","GLOBAL",0): Mendas told PC quest
Global("ChartQuest","GLOBAL",1) : PC agreed to get the sea charts */

/* kieres.dlg state 0 reply option 3 -> ADD_STATE_TRIGGER ~![PC has ring from Aldeth]~ plus new reply option where captain won't become hostile if PC asks for sea charts 

Global("ChartQuest","GLOBAL",1) muss gesetzt werden, um Kieres zu spawnen!... Oder:
AR7408.bcs muss gepatcht werden: aus ~Global("ChartQuest","GLOBAL",1)~ muss ~OR(2) Global("ChartQuest","GLOBAL",1) [aldeth sea charts quest variabe]~ werden! */


/* MENDA1.dlg - give PC additional reply option if he wants the quest but not steal the sea charts */



ADD_TRANS_TRIGGER ~%tutu_var%ALDETH~ 28 ~False()~ DO 0

REPLACE_STATE_TRIGGER ~%tutu_var%ALDETH~ 28 ~Global("HelpAldeth","GLOBAL",2)~

/* this is compatible with Baldurdash and JAP and vice versa independent on install order(JAP 0.7 or higher also considers this accordingly)  */

EXTEND_BOTTOM ~%tutu_var%ALDETH~ 28
/* Allgemeiner Einstieg: PC hat von Mendas Plan geh�rt oder auch zugestimmt, die Seekarten zu besorgen */
+ ~GlobalGT("TalkedToMendas","GLOBAL",0) Global("C#q14SeeCharts_Aldeth","GLOBAL",0)~ + @0 + seamaps

/* zweites mal ansprechen, falls der PC beim ersten mal nicht Mendas versprochen hatte, die Seekarten zu besorgen */ 
+ ~Global("ChartQuest","GLOBAL",1) Global("C#q14SeeCharts_Aldeth","GLOBAL",1)~ + @1 + seamaps_05


/* Wenn man von der Werwolfinsel zur�ck ist, hat <CHARNAME> weitere Dialogzeilen bei Aldeth: */

/* Fall 1: HC kommt nach der Reise zur Werwolfinsel zur�ck, Quest war mit Aldeth abgesprochen (unabh�ngig davon, ob man die Seekarten mit Aldeths Hilfe erhalten hat), und hat Mendas erledigt */
+ ~Dead("MENDAS3") OR(2)
Global("C#q14SeeCharts_Aldeth","GLOBAL",1)
Global("C#q14SeeCharts_Aldeth","GLOBAL",2)~ + @2 DO ~SetGlobal("C#q14SeeCharts_Aldeth","GLOBAL",3)~ + rueckkehr

/* Fall 1b: PC hat nun Mendas get�tet, nachdem er vorher bereits Artefakte an Aldeth verkauft hat */
+ ~Dead("MENDAS3") 
Global("C#q14SeeCharts_Aldeth","GLOBAL",4)~ + @2 DO ~SetGlobal("C#q14SeeCharts_Aldeth","GLOBAL",5)~ + rueckkehr


/* Mendas tot oder nicht: HC kann weitere Gegenst�nde loswerden, nachdem er mit Aldeth das erste mal gesprochen hat */
+ ~GlobalGT("C#q14SeeCharts_Aldeth","GLOBAL",2)
OR(3)
	PartyHasItem("%tutu_var%BOOK87")
	PartyHasItem("%tutu_var%MISC1B")
	PartyHasItem("%tutu_var%SW1H18")
!Global("c#q14_SoldBOOK87","MYAREA",3)
!Global("c#q14_SoldMISC1B","MYAREA",3)
!Global("c#q14_SoldSW1H18","MYAREA",3)~ + @77 /* ~I have artifacts from Balduran.~ */ + rueckkehr_13

/* Fall 2: HC war auf der Insel, hat die Gegenst�nde, hat aber Mendas noch nicht get�tet */
+ ~!Dead("MENDAS3") 
OR(2)
	Global("C#q14SeeCharts_Aldeth","GLOBAL",1)
	Global("C#q14SeeCharts_Aldeth","GLOBAL",2)
OR(3)
	PartyHasItem("%tutu_var%BOOK87")
	PartyHasItem("%tutu_var%MISC1B")
	PartyHasItem("%tutu_var%SW1H18")~ + @8 DO ~SetGlobal("C#q14SeeCharts_Aldeth","GLOBAL",4)~ + rueckkehr_13

/* Fall 3: HC kommt mit Items, Quest war nicht mit Aldeth abgesprochen. Jetzt m�chte er aber die Gegenst�nde trotzdem verticken! :-) */
+ ~Global("C#q14SeeCharts_Aldeth","GLOBAL",0)
OR(3)
	PartyHasItem("%tutu_var%BOOK87")
	PartyHasItem("%tutu_var%MISC1B")
	PartyHasItem("%tutu_var%SW1H18")~ + @9 DO ~SetGlobal("C#q14SeeCharts_Aldeth","GLOBAL",6)~ + rueckkehr_13


/* Baldurdash: in case Baldurdash is installed, this variable is set to 1. If not, it is 0 and this reply option will not show. */
+ ~Global("VP_MyBank","GLOBAL",1)~ + @10 DO ~StartStore("aldeth",LastTalkedToBy(Myself))~ EXIT

++ @11 EXIT
END

APPEND ~%tutu_var%ALDETH~

IF ~~ THEN seamaps
SAY @12
++ @13 + seamaps_01
++ @14 + seamaps_01
END

IF ~~ THEN seamaps_01
SAY @15
++ @16 + seamaps_02
++ @17 + seamaps_03
END 

IF ~~ THEN seamaps_02
SAY @18
IF ~~ THEN + seamaps_04
END

IF ~~ THEN seamaps_03
SAY @19
IF ~~ THEN + seamaps_04
END

IF ~~ THEN seamaps_04
SAY @20
+ ~Global("ChartQuest","GLOBAL",1)~ + @21 + seamaps_05
IF ~Global("ChartQuest","GLOBAL",0)~ THEN DO ~EraseJournalEntry(@84)
SetGlobal("C#q14SeeCharts_Aldeth","GLOBAL",1)~ UNSOLVED_JOURNAL @81 EXIT
END

IF ~~ THEN seamaps_05
SAY @22
= @23
/* die Gruppe erh�lt die Nachricht an den Kapit�n und den Siegelring der H�ndlerliga */
IF ~~ THEN DO ~GiveItemCreate("c#q14let",[PC],1,0,0) GiveItemCreate("c#q14rng",[PC],3,3,0)
EraseJournalEntry(@81)
EraseJournalEntry(@10104)
EraseJournalEntry(@10105)
EraseJournalEntry(@84)
AddJournalEntry(@24,QUEST)
AddJournalEntry(@10107,QUEST)
SetGlobal("C#q14SeeCharts_Aldeth","GLOBAL",2)~ UNSOLVED_JOURNAL @79 EXIT
END


/*

Dead("MENDAS3") - Mendas after returning from the island

Global("Infected","GLOBAL",1) - after returning from island

*/


/*
Global("C#q14SeeCharts_Aldeth","GLOBAL",3): PC has killed Mendas before talking to Aldeth
Global("C#q14SeeCharts_Aldeth","GLOBAL",4): PC didn't kill Mendas before talking to Aldeth to sell items and returns now to tell about Mendas
Global("C#q14SeeCharts_Aldeth","GLOBAL",5): PC has talked to Aldeth about Mendas' intrigue and sold items
Global("C#q14SeeCharts_Aldeth","GLOBAL",6): PC didn't talk about Mendas with Aldeth but asked about selling items (can now sell more items in case he has some)
*/

IF ~~ THEN karten_zurueck
SAY @25
IF ~~ THEN EXIT
END

IF ~~ THEN rueckkehr
SAY @26
++ @27 + rueckkehr_01
++ @28 + rueckkehr_02
++ @29 + rueckkehr_02_a
END

IF ~~ THEN rueckkehr_01
SAY @30
IF ~~ THEN + rueckkehr_02_b
END

IF ~~ THEN rueckkehr_02
SAY @31
IF ~~ THEN + rueckkehr_02_b
END 

IF ~~ THEN rueckkehr_02_a
SAY @32
IF ~~ THEN + rueckkehr_02_b
END 

IF ~~ THEN rueckkehr_02_b
SAY @33
++ @34 + rueckkehr_03
++ @35 + rueckkehr_01
++ @36 + rueckkehr_04
END

IF ~~ THEN rueckkehr_03
SAY @37
IF ~~ THEN + rueckkehr_04
END

IF ~~ THEN rueckkehr_04
SAY @38
IF ~Global("C#q14SeeCharts_Aldeth","GLOBAL",3)~ THEN DO ~SetGlobal("C#q14SeeCharts_Aldeth","GLOBAL",5) EraseJournalEntry(@24) 
EraseJournalEntry(@24)
EraseJournalEntry(@80)~ UNSOLVED_JOURNAL @78 + rueckkehr_05
IF ~!Global("C#q14SeeCharts_Aldeth","GLOBAL",3)~ THEN DO ~EraseJournalEntry(@24)
EraseJournalEntry(@24)
EraseJournalEntry(@80)~ SOLVED_JOURNAL @78 + rueckkehr_07
END

IF ~~ THEN rueckkehr_05
SAY @39
+ ~OR(3)
	PartyHasItem("%tutu_var%BOOK87")
	PartyHasItem("%tutu_var%MISC1B")
	PartyHasItem("%tutu_var%SW1H18")
!Global("c#q14_SoldBOOK87","MYAREA",3)
!Global("c#q14_SoldMISC1B","MYAREA",3)
!Global("c#q14_SoldSW1H18","MYAREA",3)~ + @75 + sell_items
+ ~OR(3)
	Global("c#q14_SoldBOOK87","MYAREA",0)
	Global("c#q14_SoldMISC1B","MYAREA",0)
	Global("c#q14_SoldSW1H18","MYAREA",0)~ + @40 + rueckkehr_06
++ @41 + rueckkehr_07
END

IF ~~ THEN rueckkehr_06
SAY @42
IF ~OR(2)
Dead("MENDAS3")
!Global("C#q14SeeCharts_Aldeth","GLOBAL",4)~ THEN DO ~EraseJournalEntry(@24)
EraseJournalEntry(@79)
SetGlobal("c#q14_SoldBOOK87","MYAREA",3)
SetGlobal("c#q14_SoldMISC1B","MYAREA",3)
SetGlobal("c#q14_SoldSW1H18","MYAREA",3)~ SOLVED_JOURNAL @86 + rueckkehr_07
IF ~!Dead("MENDAS3") Global("C#q14SeeCharts_Aldeth","GLOBAL",4)~ THEN DO ~EraseJournalEntry(@24)
EraseJournalEntry(@79)
SetGlobal("c#q14_SoldBOOK87","MYAREA",3)
SetGlobal("c#q14_SoldMISC1B","MYAREA",3)
SetGlobal("c#q14_SoldSW1H18","MYAREA",3)~ UNSOLVED_JOURNAL @86 + rueckkehr_14
END

IF ~~ THEN rueckkehr_07
SAY @43
IF ~~ THEN EXIT
END

IF ~~ THEN rueckkehr_08
SAY @44
IF ~~ THEN + sell_items
END

IF ~~ THEN rueckkehr_09
SAY @47
= @48
IF ~~ THEN + sell_items
END

IF ~~ THEN rueckkehr_10
SAY @49
= @50
IF ~~ THEN + sell_items
END

IF ~~ THEN rueckkehr_11
SAY @51
= @52
IF ~~ THEN + sell_items
END

IF ~~ THEN rueckkehr_12
SAY @53
= @54
IF ~~ THEN + rueckkehr_08
END

IF ~~ THEN rueckkehr_13
SAY @55
IF ~~ THEN + sell_items
END

IF ~~ THEN rueckkehr_14
SAY @57
++ @58 + rueckkehr_15
++ @59 + rueckkehr_15
++ @60 + rueckkehr_15
END

IF ~~ THEN rueckkehr_15
SAY @61
IF ~~ THEN DO ~EraseJournalEntry(@24)~ UNSOLVED_JOURNAL @80 EXIT
END

IF ~~ THEN sell_items
SAY @76 /* What do you have? */

+ ~PartyHasItem("%tutu_var%BOOK87")
Global("c#q14_SoldBOOK87","MYAREA",0)~ + @3 DO ~TakePartyItem("%tutu_var%BOOK87") DestroyItem("%tutu_var%BOOK87") GiveGoldForce(10000) AddexperienceParty(700)
AddJournalEntry(@88,QUEST)
SetGlobal("c#q14_SoldBOOK87","MYAREA",1)~ + rueckkehr_12
+ ~PartyHasItem("%tutu_var%MISC1B")
Global("c#q14_SoldMISC1B","MYAREA",0)~ + @4 DO ~TakePartyItem("%tutu_var%MISC1B") DestroyItem("%tutu_var%MISC1B") GiveGoldForce(1000) AddexperienceParty(500)
SetGlobal("c#q14_SoldMISC1B","MYAREA",1)~ + rueckkehr_09
+ ~PartyHasItem("%tutu_var%MISC1B") PartyHasItem("%tutu_var%SW1H18")
Global("c#q14_SoldMISC1B","MYAREA",0)
Global("c#q14_SoldSW1H18","MYAREA",0)~ + @5 DO ~TakePartyItem("%tutu_var%MISC1B") DestroyItem("%tutu_var%MISC1B") TakePartyItem("%tutu_var%SW1H18") DestroyItem("%tutu_var%SW1H18") GiveGoldForce(2500) AddexperienceParty(100)
AddJournalEntry(@89,QUEST)
AddJournalEntry(@90,QUEST)
SetGlobal("c#q14_SoldMISC1B","MYAREA",1)
SetGlobal("c#q14_SoldSW1H18","MYAREA",1)~ + rueckkehr_10
+ ~PartyHasItem("%tutu_var%SW1H18")
Global("c#q14_SoldSW1H18","MYAREA",0)~ + @6 DO ~TakePartyItem("%tutu_var%SW1H18") DestroyItem("%tutu_var%SW1H18") GiveGoldForce(3500) AddexperienceParty(500)
AddJournalEntry(@90,QUEST)
SetGlobal("c#q14_SoldSW1H18","MYAREA",1)~  + rueckkehr_11

+ ~OR(3)
	Global("c#q14_SoldBOOK87","MYAREA",0)
	Global("c#q14_SoldMISC1B","MYAREA",0)
	Global("c#q14_SoldSW1H18","MYAREA",0)~ + @40 + rueckkehr_06

+ ~OR(2)
Dead("MENDAS3")
!Global("C#q14SeeCharts_Aldeth","GLOBAL",4)
OR(3)
	Global("c#q14_SoldBOOK87","MYAREA",0)
	Global("c#q14_SoldMISC1B","MYAREA",0)
	Global("c#q14_SoldSW1H18","MYAREA",0)~ + @56 + rueckkehr_07
+ ~!Dead("MENDAS3") Global("C#q14SeeCharts_Aldeth","GLOBAL",4)
OR(3)
	Global("c#q14_SoldBOOK87","MYAREA",0)
	Global("c#q14_SoldMISC1B","MYAREA",0)
	Global("c#q14_SoldSW1H18","MYAREA",0)~ + @56 + rueckkehr_14

+ ~OR(2)
Dead("MENDAS3")
!Global("C#q14SeeCharts_Aldeth","GLOBAL",4)
OR(3)
	Global("c#q14_SoldBOOK87","MYAREA",1)
	Global("c#q14_SoldMISC1B","MYAREA",1)
	Global("c#q14_SoldSW1H18","MYAREA",1)~ + @45 + rueckkehr_07
+ ~!Dead("MENDAS3") Global("C#q14SeeCharts_Aldeth","GLOBAL",4)
OR(3)
	Global("c#q14_SoldBOOK87","MYAREA",1)
	Global("c#q14_SoldMISC1B","MYAREA",1)
	Global("c#q14_SoldSW1H18","MYAREA",1)~ + @45 + rueckkehr_14
END

END //APPEND


/* Z�hlhaus */

/* PartyHasItem("c#q14let") */


/* Ulf, der W�chter im Z�hlhaus f�r Global("ChartQuest","GLOBAL",1) 
~Stehen geblieben, B�rger. Was habt Ihr bei der H�ndlerliga zu suchen?~ */

EXTEND_BOTTOM ~%tutu_var%Ulf~ 0
+ ~PartyHasItem("c#q14rng")~ + @62 + siegelring
END

APPEND ~%tutu_var%Ulf~

IF ~~ THEN siegelring
SAY @63
IF ~~ THEN EXIT
END

END //APPEND

/* Kapit�n Tollar Kieres:
Aaaah, ich bin fast bereit f�r die Meere, und wer st�rt mich jetzt? */

EXTEND_BOTTOM ~%tutu_var%KIERES~ 0
+ ~PartyHasItem("c#q14let")
Global("C#q14SeeCharts_AldethKieres","GLOBAL",0)~ + @64 + aldeths_brief
+ ~PartyHasItem("c#q14let")
Global("C#q14SeeCharts_AldethKieres","GLOBAL",0)~ + @65 + aldeths_brief
+ ~!PartyHasItem("c#q14let") PartyHasItem("c#q14rng") Global("C#q14SeeCharts_AldethKieres","GLOBAL",0)~ + @66 + aldeths_brief_04
END

APPEND ~%tutu_var%KIERES~
IF ~~ THEN aldeths_brief
SAY @67
= @68
IF ~HasItem("%tutu_var%misc1c","Kieres")~ THEN + aldeths_brief_01
IF ~!HasItem("%tutu_var%misc1c","Kieres")~ THEN + aldeths_brief_02
END

IF ~~ THEN aldeths_brief_01
SAY @69
IF ~~ THEN DO ~SetGlobal("C#q14SeeCharts_AldethKieres","GLOBAL",1) TakePartyItem("c#q14let") DestroyItem("c#q14let") GiveItem("%tutu_var%MISC1C",LastTalkedToBy)
EraseJournalEntry(%journalentry_menda1_11_0%)
EraseJournalEntry(%journalentry_kieres_1_0%)
EraseJournalEntry(%journalentry_detran_5_0%)
EraseJournalEntry(%journalentry_detran_7_0%)
EraseJournalEntry(@10104)
EraseJournalEntry(@10105)
EraseJournalEntry(@10107)
EraseJournalEntry(@10109)~ SOLVED_JOURNAL @10106 EXIT
END


IF ~~ THEN aldeths_brief_02
SAY @70
IF ~~ THEN DO ~SetGlobal("C#q14SeeCharts_AldethKieres","GLOBAL",2) TakePartyItem("c#q14let") DestroyItem("c#q14let")~ + 4
END

IF ~NumTimesTalkedToGT(0) PartyHasItem("c#q14let") Global("C#q14SeeCharts_AldethKieres","GLOBAL",0)~ THEN aldeths_brief_03
SAY @71
+ ~PartyHasItem("c#q14let")~ + @64 + aldeths_brief
+ ~PartyHasItem("c#q14let")~ + @65 + aldeths_brief
++ @72 + aldeths_brief_04
END

IF ~~ THEN aldeths_brief_04
SAY @73
IF ~~ THEN EXIT
END

END //APPEND





