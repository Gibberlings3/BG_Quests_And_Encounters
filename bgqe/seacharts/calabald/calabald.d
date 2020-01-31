APPEND ~%CALAHA%~

IF WEIGHT #-1 ~Global("CalDone","GLOBAL",1) !GlobalGT("C#q14_CalGetMap","GLOBAL",0)~ calab.0
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
+ ~PartyGoldLT(5000)~ + @7 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",1)~ + calab.4
++ @8 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",1)~ + calab.4
END

IF ~~ calab.3
SAY @9 
IF ~~ DO ~TakePartyGold(5000) DestroyGold(0) SetGlobalTimer("C#q14_CalTravBal","GLOBAL",TWO_DAYS) EscapeArea()~ UNSOLVED_JOURNAL @25 EXIT
END

IF ~~ calab.4
SAY @10
IF ~~ EXIT
END

IF WEIGHT #-1 ~Global("CalDone","GLOBAL",1) Global("C#q14_CalGetMap","GLOBAL",3)~ calab.5
SAY @11
= @12
IF ~~ DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",4) EraseJournalEntry(@25)~ + calab.6
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
IF ~~ DO ~TakePartyGold(3000) DestroyGold(0) GiveItemCreate("%tutu_var%MISC1C",Player1,1,0,0) SetGlobal("C#q14_CalGetMap","GLOBAL",5) EraseJournalEntry(@26)~ EXIT
END

IF ~~ calab.8
SAY @18
IF ~~ THEN UNSOLVED_JOURNAL @26 EXIT
END

IF WEIGHT #-1 ~Global("CalDone","GLOBAL",1) Global("C#q14_CalGetMap","GLOBAL",1)~ calab.9
SAY @20
++ @2 + calab.1
++ @19 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",1)~ + 7
++ @3 DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",5)~ + 7
END

IF ~~ calab.10
SAY @22
IF ~~ THEN DO ~SetGlobal("C#q14_CalGetMap","GLOBAL",5) EraseJournalEntry(@25) EraseJournalEntry(@26)~ EXIT
END

END