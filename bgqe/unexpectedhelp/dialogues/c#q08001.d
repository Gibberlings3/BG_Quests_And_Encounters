A_T_T %tutu_var%POGHM4 3 ~Global("C#Q08_TalkedToTrun","GLOBAL",5)~

EXTEND_BOTTOM %tutu_var%POGHM4 3
+ ~GlobalLT("C#Q08_TalkedToTrun","GLOBAL",5)~ + @0 DO ~SetGlobal("C#Q08_HeardAboutTrun","GLOBAL",1)~ + trun_01
+ ~GlobalLT("C#Q08_TalkedToTrun","GLOBAL",5)~ + @1 + trun_02
END

APPEND %tutu_var%POGHM4 
IF ~~ THEN trun_01
SAY @2
COPY_TRANS %tutu_var%POGHM4 3
END

IF ~~ THEN trun_02
SAY @69
COPY_TRANS %tutu_var%POGHM4 3
END

END //APPEND

A_T_T %tutu_var%FULLER2 4 ~Global("C#Q08_TalkedToTrun","GLOBAL",5)~

EXTEND_BOTTOM %tutu_var%FULLER2 4
+ ~GlobalLT("C#Q08_TalkedToTrun","GLOBAL",5) Global("C#Q08_HeardAboutTrun","GLOBAL",0)~ + @0 DO ~SetGlobal("C#Q08_HeardAboutTrun","GLOBAL",1)~ + trun_01
+ ~GlobalLT("C#Q08_TalkedToTrun","GLOBAL",5) Global("C#Q08_HeardAboutTrun","GLOBAL",0)~ + @1 + trun_02
IF ~GlobalLT("C#Q08_TalkedToTrun","GLOBAL",5) Global("C#Q08_HeardAboutTrun","GLOBAL",1)~ THEN + trun_02
END

APPEND %tutu_var%FULLER2 
IF ~~ THEN trun_01
SAY @3
COPY_TRANS %tutu_var%FULLER2 4
END

IF ~~ THEN trun_02
SAY @69
COPY_TRANS %tutu_var%FULLER2 4
END

END //APPEND

BEGIN C#Q08001

IF ~GlobalGT("C#Q08_TalkedToTrun","GLOBAL",2)~ THEN ritter_00
SAY @4
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",3)~ + @5 DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",4)~ + ritter_09
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",3)~ + @6 + ritter_08
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",3)~ + @7 + ritter_08
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",4)~ + @8 + ritter_10
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",4)~ + @9 + ritter_11
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",4)~ + @10 + ritter_12
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",4)~ + @11 + ritter_11
END

IF ~GlobalLT("C#Q08_TalkedToTrun","GLOBAL",3)~ THEN ritter
SAY @12
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",1) GlobalGT("C#Q08_TalkedToTrun","GLOBAL",0)~ + @13 + ritter_04
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",1) GlobalGT("C#Q08_TalkedToTrun","GLOBAL",0)~ + @14 + ritter_03
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",0)~ + @15 DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",1)~ + ritter_01
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",1) Global("C#Q08_TalkedToTrun","GLOBAL",0)~ + @16 DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",2)~ + ritter_04
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",0) GlobalLT("C#Q08_TalkedToTrun","GLOBAL",2)~ + @17 + ritter_02
+ ~Global("C#Q08_HeardAboutTrun","GLOBAL",1) GlobalGT("C#Q08_TalkedToTrun","GLOBAL",0)~ + @18 DO ~SetGlobal("C#Q08_HeardAboutTrun","GLOBAL",2)~ + ritter_14
++ @19 DO ~SetGlobal("C#Q08_MetTrun","GLOBAL",1)~ EXIT
END

IF ~~ THEN ritter_01
SAY @20
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",0)~ + @17 + ritter_02
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",1)~ + @13 DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",2)~ + ritter_04
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",1)~ + @14 DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",2)~ + ritter_03
++ @19 EXIT
END

IF ~~ THEN ritter_02
SAY @21
IF ~~ THEN DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",2)~ EXIT
END

IF ~~ THEN ritter_03
SAY @22  
++ @23 + ritter_04
++ @24 EXIT
END

IF ~~ THEN ritter_04
SAY @25
= @26
++ @27 + ritter_05
++ @28 + ritter_06
++ @29 + ritter_05 
END

IF ~~ THEN ritter_05
SAY @30
IF ~~ THEN + ritter_07
END

IF ~~ THEN ritter_06
SAY @31
IF ~~ THEN + ritter_07
END

IF ~~ THEN ritter_07
SAY @32
= @33
= @34
= @35
++ @36 DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",4)~ + ritter_09
++ @37 + ritter_08
++ @38 + ritter_08
++ @39 DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",3)~ EXIT
END

IF ~~ THEN ritter_08
SAY @40
IF ~~ THEN DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",3)~ EXIT
END

IF ~~ THEN ritter_09
SAY @41
= @102
++ @42 + ritter_10
++ @43 + ritter_11
++ @10 + ritter_12
++ @44 + ritter_11
++ @45 EXIT
END

IF ~~ THEN ritter_10
SAY @46
++ @43 + ritter_11
++ @10 + ritter_12
++ @44 + ritter_11
++ @45 EXIT
END

IF ~~ THEN ritter_11
SAY @47
IF ~~ THEN EXIT
END

IF ~~ THEN ritter_12
SAY @48
++ @49 + ritter_13
++ @50 + ritter_13
+ ~GlobalGT("Chapter","GLOBAL",%tutu_prologue_reset%)~ + @51 + ritter_13
++ @52 + ritter_13
END

IF ~~ THEN ritter_13
SAY @53
= @54
= @55
= @56
IF ~Global("Chapter","GLOBAL",%tutu_prologue_reset%)~ THEN DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",5) AddExperienceParty(150) ReputationInc(1) %ERASEJOURNALENTRY_10055% SetGlobal("Chapter","GLOBAL",%tutu_prologue%) AddJournalEntry(@10054%QUEST_DONE%) SetGlobal("Chapter","GLOBAL",%tutu_prologue_reset%) EscapeArea()~ EXIT
IF ~GlobalGT("Chapter","GLOBAL",%tutu_prologue_reset%)~ THEN DO ~SetGlobal("C#Q08_TalkedToTrun","GLOBAL",5) AddExperienceParty(150) ReputationInc(1) %ERASEJOURNALENTRY_10055% AddJournalEntry(@10054%QUEST_DONE%)  EscapeArea()~ EXIT
END

IF ~~ THEN ritter_14
SAY @58
++ @59 + ritter_15
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",1)~ + @13 + ritter_04
++ @60 EXIT
END

IF ~~ THEN ritter_15
SAY @61
+ ~Global("C#Q08_KnowsAboutArm","GLOBAL",1)~ + @13 + ritter_04
++ @62 EXIT
++ @24 EXIT 
END

/*

IF ~~ THEN ritter_
SAY ~
END

IF ~~ THEN ritter_
SAY ~
END

*/

BEGIN C#Q08002

IF ~Global("C#Q08_TalkedToTrun","GLOBAL",5)~ THEN quest_solved
SAY @63
= @64
= @65
IF ~~ THEN DO ~SetGlobal("C#Q08_LindaThanked","GLOBAL",1) EscapeArea()~ EXIT
END

IF ~GlobalGT("C#Q08_KnowsAboutArm","GLOBAL",0)~ THEN linda_return
SAY @66
+ ~GlobalGT("C#Q08_TalkedToTrun","GLOBAL",2)~ + @67 + linda_11
++ @68 + linda_11
++ @69 EXIT
++ @70 EXIT
END

IF ~Global("C#Q08_KnowsAboutArm","GLOBAL",0)~ THEN linda
SAY @71
++ @72 + linda_01
++ @73 + linda_01
++ @70 EXIT
END

IF ~~ THEN linda_01
SAY @74
++ @75 + linda_02
++ @76 + linda_10
++ @77 EXIT
END

IF ~~ THEN linda_02
SAY @78
= @79
+ ~GlobalGT("C#Q08_TalkedToTrun","GLOBAL",0)~ + @80 + linda_03
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",0) Global("C#Q08_MetTrun","GLOBAL",0)~ + @81 + linda_03
+ ~Global("C#Q08_TalkedToTrun","GLOBAL",0) Global("C#Q08_MetTrun","GLOBAL",1)~ + @80 + linda_03
++ @82 + linda_03
END

IF ~~ THEN linda_03
SAY @83
IF ~~ THEN DO ~SetGlobal("C#Q08_KnowsAboutArm","GLOBAL",1)~ + linda_04
END

IF ~~ THEN linda_04
SAY @84
++ @85 + linda_05
++ @86 + linda_05
++ @87 + linda_05
++ @88 + linda_06
END

IF ~~ THEN linda_05
SAY @89
= @90
++ @91 + linda_07
++ @92 + linda_09
++ @93 + linda_07
END

IF ~~ THEN linda_06
SAY @94
IF ~~ THEN + linda_05 
END

IF ~~ THEN linda_07
SAY @95
IF ~~ THEN + linda_08
END

IF ~~ THEN linda_08
SAY @96
= @97
IF ~Global("Chapter","GLOBAL",%tutu_prologue_reset%)~ THEN DO ~SetGlobal("Chapter","GLOBAL",%tutu_prologue%) AddJournalEntry(@10055%QUEST%) SetGlobal("Chapter","GLOBAL",%tutu_prologue_reset%)~ EXIT
IF ~GlobalGT("Chapter","GLOBAL",%tutu_prologue_reset%)~ THEN DO ~AddJournalEntry(@10055%QUEST%)~ EXIT
END

IF ~~ THEN linda_09
SAY @99
IF ~~ THEN + linda_07
END

IF ~~ THEN linda_10
SAY @100
IF ~~ THEN + linda_02
END

IF ~~ THEN linda_11
SAY @101
IF ~~ THEN EXIT
END

/*

IF ~~ THEN linda_
SAY ~
END

IF ~~ THEN linda_
SAY ~
END

IF ~~ THEN linda_
SAY ~
END

*/


