/* A Warm Place for Noober 

*/

ADD_TRANS_ACTION %tutu_var%noober BEGIN 0 END BEGIN END ~SetGlobalTimer("C#LCNOOB_Timer","GLOBAL",TWO_DAYS)~


/* remove the journal entry about Brage added by the Noober component, in case it doesn't match the exact wording of the game 
NALIN 2, 4

OUBLEK 3, 8
*/


BEGIN C#LCNOOB

IF ~Global("C#LCNOOB_Quest","GLOBAL",1)~ THEN %tutu_var%noober
SAY @0
++ @1 + noober_01
++ @2 + noober_01
++ @3 + noober_01
END

IF ~~ THEN noober_01
SAY @4
++ @5 + noober_02
++ @6 + noober_02
++ @7 + noober_03
++ @8 + noober_03 
END

IF ~~ THEN noober_02
SAY @9
IF ~~ THEN DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",2)~ %UNSOLVED_JOURNAL% @10 EXIT
END

IF ~~ THEN noober_03
SAY @9
IF ~~ THEN DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",2)~ %UNSOLVED_JOURNAL% @11 EXIT
END

IF ~GlobalGT("C#LCNOOB_Quest","GLOBAL",1)
GlobalLT("C#LCNOOB_Quest","GLOBAL",4)
~ THEN noober_move
SAY @12
+ ~Global("C#LCNOOB_Quest","GLOBAL",3) !Dead("%tutu_scriptbg%FTOWN2%eet_var%")~ + @13 + noober_move_01
+ ~Dead("%tutu_scriptbg%FTOWN2%eet_var%")~ + @78 + noober_move_01
++ @14 + noober_move_02
++ @15 + noober_move_03
END

IF ~~ THEN noober_move_01
SAY @16
IF ~~ THEN DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",4) 
SetGlobalTimer("C#LCNOOB_Timer","GLOBAL",TWO_DAYS)
%ERASEJOURNALENTRY_17%
EscapeArea()~ %UNSOLVED_JOURNAL% @18 EXIT
END

IF ~~ THEN noober_move_02
SAY @19
IF ~~ THEN EXIT
END

IF ~~ THEN noober_move_03
SAY @20
IF ~~ THEN EXIT
END

IF ~~ THEN noober_move_04
SAY @0
IF ~~ THEN DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",10)
%ERASEJOURNALENTRY_17%
EscapeArea()~ EXIT
END

IF ~GlobalGT("C#LCNOOB_Quest","GLOBAL",4)
!GlobalTimerExpired("C#LCNOOB_Timer","GLOBAL")
!Global("C#LCNOOB_Quest","GLOBAL",7)~ THEN finish_1
SAY @21
IF ~~ THEN EXIT
IF ~Global("C#LCNOOB_Quest","GLOBAL",5)~ THEN EXTERN %tutu_scriptbg%FTOWN2%eet_var% noober_here
IF ~!Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",0)~ THEN EXTERN %tutu_scriptbg%FTOWN2%eet_var% not_welcome
END

IF ~GlobalGT("C#LCNOOB_Quest","GLOBAL",4)
GlobalTimerExpired("C#LCNOOB_Timer","GLOBAL")~ THEN finish_2
SAY @22
IF ~~ THEN EXIT
IF ~Global("C#LCNOOB_Quest","GLOBAL",5)~ THEN EXTERN %tutu_scriptbg%FTOWN2%eet_var% noober_here_02
IF ~Global("C#LCNOOB_Quest","GLOBAL",6)~ THEN EXTERN %tutu_scriptbg%FTOWN2%eet_var% noober_here_03
IF ~GlobalLT("C#LCNOOB_Quest","GLOBAL",7) !Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",0)~ THEN EXTERN %tutu_scriptbg%FTOWN2%eet_var% not_welcome
END


IF ~GlobalGT("C#LCNOOB_Quest","GLOBAL",4)~ THEN finish_3
SAY @23
IF ~~ THEN EXIT
END

/* Ask in town: Who could take in Noober? */

/* priest in temple of Helm: %tutu_var%NALIN (only as long as Brage quest is not solved. Too much trouble to interject into his dialogue, otherwise.) */
EXTEND_BOTTOM %tutu_var%NALIN 1
+ ~Global("C#LCNOOB_Quest","GLOBAL",2) Global("C#LCNOOB_Asked","LOCALS",0)~ + @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ + noober
END

APPEND %tutu_var%NALIN
IF ~~ THEN noober
SAY @25
IF ~~ THEN EXIT
END
END //APPEND

/* shop keeper: %tutu_var%SHOPKN */
EXTEND_BOTTOM %tutu_var%SHOPKN 0
+ ~Global("C#LCNOOB_Quest","GLOBAL",2) Global("C#LCNOOB_Asked","LOCALS",0)~ + @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ + noober
END

CHAIN 
IF ~~ THEN %tutu_var%SHOPKN noober
@26
== %tutu_var%SHOPKN IF ~!Global("HelpNashkellWoman","GLOBAL",2)~ THEN @27
== %tutu_var%SHOPKN IF ~Global("HelpNashkellWoman","GLOBAL",2)~ THEN @28
== %tutu_var%SHOPKN IF ~!Dead("%tutu_scriptbg%FTOWN2%eet_var%") !Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",1)~ THEN @29
== %tutu_var%SHOPKN IF ~!Dead("%tutu_scriptbg%FTOWN2%eet_var%") Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",1)~ THEN @30 
== %tutu_var%SHOPKN IF ~Dead("%tutu_scriptbg%FTOWN2%eet_var%")~ THEN @79
END
IF ~~ THEN DO ~%ERASEJOURNALENTRY_10% %ERASEJOURNALENTRY_11%~ EXIT
IF ~!Dead("%tutu_scriptbg%FTOWN2%eet_var%")~ THEN DO ~%ERASEJOURNALENTRY_10%
%ERASEJOURNALENTRY_11%
~ %UNSOLVED_JOURNAL% @32 EXIT
IF ~!Dead("%tutu_scriptbg%FTOWN2%eet_var%") Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",1)~ THEN DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",10) 
%ERASEJOURNALENTRY_10%
%ERASEJOURNALENTRY_11%
~ %SOLVED_JOURNAL% @33 EXIT


/* inn keeper: Belching Dragon %tutu_var%BART2 (only to one of the 4 random states, too much trouble bothering about dialogue states with no reply options) */
EXTEND_BOTTOM %tutu_var%BART2 0
+ ~Global("C#LCNOOB_Quest","GLOBAL",2) Global("C#LCNOOB_Asked","LOCALS",0)~ + @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ + noober
END

APPEND %tutu_var%BART2
IF ~~ THEN noober
SAY @34
IF ~~ THEN EXIT
END
END //APPEND


/* Inn keeper:  Nashkel tavern %tutu_var%INNKN2*/
EXTEND_BOTTOM %tutu_var%INNKN2 0
+ ~Global("C#LCNOOB_Quest","GLOBAL",2) Global("C#LCNOOB_Asked","LOCALS",0)~ + @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ + noober
END

APPEND %tutu_var%INNKN2
IF ~~ THEN noober
SAY @35
IF ~~ THEN EXIT
END
END //APPEND

/* Farmer %tutu_var%Karp */
EXTEND_BOTTOM %tutu_var%Karp 0
+ ~Global("C#LCNOOB_Quest","GLOBAL",2) Global("C#LCNOOB_Asked","LOCALS",0)~ + @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ + noober
END

APPEND %tutu_var%Karp
IF ~~ THEN noober
SAY @36
IF ~~ THEN EXIT
END
END //APPEND

/* %tutu_var%Oublek */
EXTEND_BOTTOM %tutu_var%Oublek 0
+ ~Global("C#LCNOOB_Quest","GLOBAL",2) Global("C#LCNOOB_Asked","LOCALS",0)~ + @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ + noober
END

EXTEND_BOTTOM %tutu_var%Oublek 9
+ ~Global("C#LCNOOB_Quest","GLOBAL",2) Global("C#LCNOOB_Asked","LOCALS",0)~ + @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ + noober
END

EXTEND_BOTTOM %tutu_var%Oublek 10
+ ~Global("C#LCNOOB_Quest","GLOBAL",2) Global("C#LCNOOB_Asked","LOCALS",0)~ + @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ + noober
END

APPEND %tutu_var%Oublek
IF ~~ THEN noober
SAY @37
IF ~~ THEN EXIT
END
END //APPEND


/* Joseph's widow : %tutu_scriptbg%FTOWN2%eet_var% */

/* Traced whether the PC behaved badly: states 1, 7 */

ADD_TRANS_ACTION %tutu_scriptbg%FTOWN2%eet_var% BEGIN 1 7 END BEGIN END ~SetGlobal("C#LCNOOB_FTOWN2_Angry","GLOBAL",1)~

EXTEND_BOTTOM %tutu_scriptbg%FTOWN2%eet_var% 0
+ ~Global("C#LCNOOB_Quest","GLOBAL",2)~ + @81 + question
END

APPEND %tutu_scriptbg%FTOWN2%eet_var%
IF ~~ THEN question
SAY @82 
IF ~~ THEN GOTO 2
END
END //APPEND

BEGIN c#lcno01 //Mother: realized by invisible creature beside the bed

APPEND %tutu_scriptbg%FTOWN2%eet_var%

IF WEIGHT #-1
~!PartyHasItem("%tutu_var%RINGJOS")
!NumTimesTalkedTo(0)
Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",0)
Global("C#LCNOOB_Quest","GLOBAL",2) !Global("C#LCNOOB_Asked","LOCALS",2)
!Allegiance(Myself,ENEMY)~ THEN first
SAY @38
IF ~~ THEN + noober_01
IF ~Global("C#LCNOOB_Asked","LOCALS",0)~ THEN DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",1)~ EXTERN c#lcno01 chain_1
END

END //APPEND

CHAIN
IF ~~ THEN c#lcno01 chain_1
@39  
== %tutu_scriptbg%FTOWN2%eet_var% @40
== c#lcno01 @41
== %tutu_scriptbg%FTOWN2%eet_var% @42
== c#lcno01 @41
== %tutu_scriptbg%FTOWN2%eet_var% @43
== c#lcno01 @44
== %tutu_scriptbg%FTOWN2%eet_var% @45
= @46
END
++ @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",2)~ EXTERN %tutu_scriptbg%FTOWN2%eet_var% noober
++ @47 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",2)~ EXTERN %tutu_scriptbg%FTOWN2%eet_var% noober
++ @48 EXTERN %tutu_scriptbg%FTOWN2%eet_var% noober_02

APPEND %tutu_scriptbg%FTOWN2%eet_var%
IF ~~ THEN noober
SAY @49
= @50
IF ~~ THEN DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",3) 
%ERASEJOURNALENTRY_10%
%ERASEJOURNALENTRY_11%
%ERASEJOURNALENTRY_32%
~ %UNSOLVED_JOURNAL% @17 EXIT
END

IF ~~ THEN noober_01
SAY @52
++ @24 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",2)~ EXTERN %tutu_scriptbg%FTOWN2%eet_var% noober
++ @47 DO ~SetGlobal("C#LCNOOB_Asked","LOCALS",2)~ EXTERN %tutu_scriptbg%FTOWN2%eet_var% noober
++ @48 + noober_02
END

IF ~~ THEN noober_02
SAY @53
IF ~~ THEN EXIT
END


END //APPEND


CHAIN
IF WEIGHT #-1
~Global("C#LCNOOB_Quest","GLOBAL",5)
!Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",0)
!Allegiance(Myself,ENEMY)
!Dead("C#LCNOOB")
!Allegiance("C#LCNOOB",ENEMY)~ THEN %tutu_scriptbg%FTOWN2%eet_var% not_welcome
@54
DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",7)~
EXIT


CHAIN
IF WEIGHT #-1
~Global("C#LCNOOB_Quest","GLOBAL",5)
!PartyHasItem("%tutu_var%RINGJOS")
!NumTimesTalkedTo(0)
Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",0)
!Allegiance(Myself,ENEMY)
!Dead("C#LCNOOB")
!Allegiance("C#LCNOOB",ENEMY)
!GlobalTimerExpired("C#LCNOOB_Timer","GLOBAL")~ THEN %tutu_scriptbg%FTOWN2%eet_var% noober_here
@55
== %tutu_scriptbg%FTOWN2%eet_var% @80
== C#LCNOOB @12
== %tutu_scriptbg%FTOWN2%eet_var% @56
== c#lcno01 @41
== %tutu_scriptbg%FTOWN2%eet_var% @57
= @58
END
IF ~~ THEN DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",6)
%ERASEJOURNALENTRY_18%
~ %UNSOLVED_JOURNAL% @83 EXIT
IF ~Global("HelpNashkellWoman","GLOBAL",2)~ THEN DO ~SetGlobal("C#LCNOOB_Quest","GLOBAL",6)
%ERASEJOURNALENTRY_18%
~ %UNSOLVED_JOURNAL% @59 EXIT


CHAIN
IF WEIGHT #-1
~Global("C#LCNOOB_Quest","GLOBAL",5)
!PartyHasItem("%tutu_var%RINGJOS")
!NumTimesTalkedTo(0)
Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",0)
!Allegiance(Myself,ENEMY)
!Dead("C#LCNOOB")
!Allegiance("C#LCNOOB",ENEMY)
GlobalTimerExpired("C#LCNOOB_Timer","GLOBAL")~ THEN %tutu_scriptbg%FTOWN2%eet_var% noober_here_02
@55
END
IF ~~ THEN + noober_here_03

CHAIN
IF WEIGHT #-1
~Global("C#LCNOOB_Quest","GLOBAL",6)
!PartyHasItem("%tutu_var%RINGJOS")
!NumTimesTalkedTo(0)
Global("C#LCNOOB_FTOWN2_Angry","GLOBAL",0)
!Allegiance(Myself,ENEMY)
!Dead("C#LCNOOB")
!Allegiance("C#LCNOOB",ENEMY)
GlobalTimerExpired("C#LCNOOB_Timer","GLOBAL")~ THEN %tutu_scriptbg%FTOWN2%eet_var% noober_here_03
@61
== %tutu_scriptbg%FTOWN2%eet_var% IF ~!Global("HelpNashkellWoman","GLOBAL",1)~ THEN @62
== %tutu_scriptbg%FTOWN2%eet_var% IF ~Global("HelpNashkellWoman","GLOBAL",1)~ THEN @63
= @64
END
IF ~~ THEN DO ~AddexperienceParty(150) 
%ERASEJOURNALENTRY_18%
%ERASEJOURNALENTRY_59%
SetGlobal("C#LCNOOB_Quest","GLOBAL",7)~ %SOLVED_JOURNAL% @84 EXIT
IF ~Global("HelpNashkellWoman","GLOBAL",2)~ THEN DO ~AddexperienceParty(150) 
%ERASEJOURNALENTRY_18%
%ERASEJOURNALENTRY_59%
SetGlobal("C#LCNOOB_Quest","GLOBAL",7)~ %SOLVED_JOURNAL% @65 EXIT






