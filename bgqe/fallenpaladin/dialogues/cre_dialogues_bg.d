/* Give game cres in quest areas different dialogues 
BG1 version (no AreaCheck() available) */

APPEND MTOB8



IF WEIGHT #-1
~See("C#Q05006") Global("C#Q05_MTOB8","LOCALS",0)~ THEN quest_dialog_01
SAY @0 
IF ~~ THEN DO ~SetGlobal("C#Q05_MTOB8","LOCALS",1)~ EXIT 
END

IF WEIGHT #-1
~RandomNum(4,1) Global("C#Q05_MTOB8","LOCALS",1)~ THEN quest_dialog_02
SAY @0
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~RandomNum(4,2) Global("C#Q05_MTOB8","LOCALS",1)~ THEN quest_dialog_03
SAY @1
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~RandomNum(4,3) Global("C#Q05_MTOB8","LOCALS",1)~ THEN quest_dialog_04
SAY @2
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~RandomNum(4,4) Global("C#Q05_MTOB8","LOCALS",1)~ THEN quest_dialog_05
SAY @3
IF ~~ THEN EXIT
END



END
