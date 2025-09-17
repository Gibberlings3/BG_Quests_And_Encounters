APPEND ~%CALAHA%~

IF WEIGHT #-1 ~Global("CalDone","GLOBAL",1) Global("C#q14_CalGetMap","GLOBAL",0)~ calab.0
SAY @0
= @1
IF ~~ THEN + calab.9
END

IF ~~ calab.1
SAY @4
IF ~~ + calab.2
END

IF ~~ calab.2
SAY @5
+ ~PartyGoldGT(4999)~ + @6 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",2)~ + calab.3
+ ~PartyGoldLT(5000)~ + @7 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",1)~ UNSOLVED_JOURNAL @10108 + calab.11
++ @29 /* ~That's an interesting offer, but I do not have any need of it for now.~ */ DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",1)~ UNSOLVED_JOURNAL @10108 + calab.11
++ @8 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",1)~ UNSOLVED_JOURNAL @10108 + calab.4
END

IF ~~ calab.3
SAY @9 
IF ~~ DO ~TakePartyGold(5000) DestroyGold(0)
EraseJournalEntry(@10104)
EraseJournalEntry(@10105)
EraseJournalEntry(@10108)
SetGlobalTimer("C#q14_CalTravBal","GLOBAL",TWO_DAYS) EscapeArea()~ UNSOLVED_JOURNAL @10101 EXIT
END

IF ~~ calab.4
SAY @10
IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("CalDone","GLOBAL",1) Global("C#q14_CalGetMap","GLOBAL",3)~ calab.5
SAY @11
= @12
IF ~~ THEN + calab.6
END

IF WEIGHT #-1 ~Global("C#q14_CalGetMap","GLOBAL",4)~ calab.6
SAY @13
+ ~PartyGoldGT(2999)~ + @23 + calab.7
+ ~PartyGoldGT(2999)~ + @14 + calab.7
+ ~PartyGoldLT(3000)~ + @24 + calab.8
+ ~PartyGoldLT(3000)~ + @15 + calab.8
++ @21 + calab.10
++ @16 + calab.10
END

IF ~~ calab.7
SAY @17
IF ~~ DO ~TakePartyGold(3000) DestroyGold(0) GiveItemCreate("%tutu_var%MISC1C",Player1,1,0,0) SetGlobal("C#q14_CalGetMap","GLOBAL",5)
EraseJournalEntry(@10102)
EraseJournalEntry(%journalentry_menda1_11_0%)~ SOLVED_JOURNAL @10103 EXIT
END

IF ~~ calab.8
SAY @18
IF ~~ THEN DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",4) EraseJournalEntry(@10101)~ UNSOLVED_JOURNAL @10102 EXIT
END

IF WEIGHT #-1 ~Global("CalDone","GLOBAL",1) Global("C#q14_CalGetMap","GLOBAL",1)~ calab.9
SAY @20
++ @2 + calab.1
++ @19 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",1)~ + 7
++ @3 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",6)~ + 7
END

IF ~~ calab.10
SAY @22
IF ~~ THEN DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",6)
EraseJournalEntry(@10101)
EraseJournalEntry(@10102)
EraseJournalEntry(@10108)~ UNSOLVED_JOURNAL @10109 EXIT
IF ~OR(2)
    Global("C#q14SeeCharts_AldethKieres","GLOBAL",1)
    Global("C#q14_PCStoleSeeCharts","GLOBAL",1)~ THEN DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",6)
EraseJournalEntry(@10101)
EraseJournalEntry(@10102)
EraseJournalEntry(@10108)~  EXIT
END

IF ~~ calab.11
SAY @28
IF ~~ EXIT
END

END
