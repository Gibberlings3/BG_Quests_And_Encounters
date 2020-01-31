BEGIN ~C#Q01003~

IF ~True()~ THEN slime_01
SAY @0
++ @1 EXIT

+ ~Global("C#Q01_PokedTooOften","LOCALS",0)~ + @2 DO ~SetGlobal("C#Q01_PokedTooOften","LOCALS",1)~ + slime_03
+ ~Global("C#Q01_PokedTooOften","LOCALS",1)~ + @2 DO ~SetGlobal("C#Q01_PokedTooOften","LOCALS",2)~ + slime_03
+ ~Global("C#Q01_PokedTooOften","LOCALS",2)~ + @2 DO ~SetGlobal("C#Q01_PokedTooOften","LOCALS",3)~ + slime_03
+ ~Global("C#Q01_PokedTooOften","LOCALS",3)~ + @2 DO ~SetGlobal("C#Q01_PokedTooOften","LOCALS",4)~ + slime_03b
+ ~Global("C#Q01_PokedTooOften","LOCALS",4)~ + @2 DO ~SetGlobal("C#Q01_PokedTooOften","LOCALS",5)~ + slime_03
+ ~Global("C#Q01_GotDiary","GLOBAL",0)~ + @3 DO ~SetGlobal("C#Q01_GotDiary","GLOBAL",1)~ + slime_02
+ ~Global("C#Q01_PokedTooOften","LOCALS",5)~ + @2 + slime_04
END

IF ~~ THEN slime_02
SAY @4
IF ~~ THEN DO ~GiveItemCreate("C#Q01002",[PC],1,0,0)~ EXIT
END

IF ~~ THEN slime_03
SAY @5
IF ~~ THEN EXIT
END

IF ~~ THEN slime_03b
SAY @5
IF ~~ THEN EXTERN C#Q01001 stop
END

IF ~~ THEN slime_04
SAY @6
IF ~~ THEN DO ~%ERASEJOURNALENTRY_10001% %ERASEJOURNALENTRY_10002% %ERASEJOURNALENTRY_10004% %ERASEJOURNALENTRY_10005% Enemy() Attack([PC])~ %SOLVED_JOURNAL% @10008 EXIT
END

APPEND C#Q01001

IF ~~ THEN stop
SAY @8
IF ~~ THEN EXIT
END

END