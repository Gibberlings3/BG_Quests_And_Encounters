/* General changes to Sil's dialogue, compatible with Lure of Sirine's Call & bg1re "Sil's Blessing") */

REPLACE_STATE_TRIGGER %tutu_var%sil 7 ~!Allegiance(Myself,[ENEMY])~

REPLACE_STATE_TRIGGER %tutu_var%sil 11 ~Allegiance(Myself,[ENEMY])~

REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 0 END BEGIN 0 END ~Shout(1)
Enemy()~ ~~

REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 1 END BEGIN 0 END ~Shout(1)
Enemy()~ ~~

/* bgee */
REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 0 END BEGIN 0 END ~Shout(99)
Enemy()~ ~~
REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 1 END BEGIN 0 END ~Shout(99)
Enemy()~ ~~


ADD_TRANS_TRIGGER %tutu_var%SIL 7 ~False()~ DO 0

EXTEND_BOTTOM %tutu_var%SIL 7
+ ~GlobalLT("C#bgqe_SilCordyr","GLOBAL",2) Global("HelpCordyr","GLOBAL",1)~ + @0 + friendly_sil
++ @1 EXIT
++ @2 + angriff
END

APPEND %tutu_var%SIL
IF ~~ THEN friendly_sil
SAY @3
IF ~~ THEN + friendly_sil_01
IF ~Global("c#lc_silencounter","GLOBAL",2) //bg1re: Sil's Blessing
~ + friendly_sil_03
IF ~Global("J#PirateFight","GLOBAL",3) //Lure of Sirine's Call
~ + friendly_sil_03
END

IF ~~ THEN friendly_sil_01
SAY @4
++ @5 + angriff
++ @6 + angriff
++ @7 + friendly_sil_02
END

IF ~~ THEN friendly_sil_02
SAY @8
IF ~~ THEN + friendly_sil_03
END

IF ~~ THEN friendly_sil_03
SAY @9
++ @10 + friendly_sil_04
++ @11 + angriff
++ @12 + angriff
END

END //APPEND

CHAIN
IF ~~ THEN %tutu_var%SIL friendly_sil_04
@13
 == %tutu_var%SIL IF ~!Global("c#lc_silencounter","GLOBAL",2) !Global("J#PirateFight","GLOBAL",3)~ THEN @14
END
+ ~!Global("c#lc_silencounter","GLOBAL",2) !Global("J#PirateFight","GLOBAL",3)~ + @15 + angriff
++ @16 + friendly_sil_05
++ @17 + angriff

APPEND %tutu_var%SIL

IF ~~ THEN friendly_sil_05
SAY @18
= @19
++ @20 + friendly_sil_07
++ @21 + friendly_sil_06
END

IF ~~ THEN friendly_sil_06
SAY @22
IF ~~ THEN + friendly_sil_07
END

IF ~~ THEN friendly_sil_07
SAY @23
IF ~~ THEN DO ~SetGlobal("C#bgqe_SilCordyr","GLOBAL",2)~ %UNSOLVED_JOURNAL% @30 EXIT
END

IF ~~ THEN angriff
SAY @24
IF ~~ THEN DO ~Shout(1) Enemy()~ EXIT
END

END //APPEND


/* Dialoge state added to Cordyr. Changes compatible with Lure of Sirine's Call & bg1re "Sil's Blessing" */

REPLACE_STATE_TRIGGER %tutu_var%CORDYR 0 ~~

ADD_TRANS_TRIGGER %tutu_var%CORDYR 2 ~!Global("C#bgqe_SilCordyr","GLOBAL",2)~ DO 0

EXTEND_BOTTOM %tutu_var%CORDYR 2
+ ~Global("C#bgqe_SilCordyr","GLOBAL",2) Global("HelpCordyr","GLOBAL",1)~ + @25 DO ~SetGlobal("C#bgqe_SilCordyr","GLOBAL",3)~ + peaceful_sirenes
+ ~Global("C#bgqe_SilCordyr","GLOBAL",2)~ + @31 EXIT
END

APPEND %tutu_var%CORDYR


IF ~~ THEN BEGIN peaceful_sirenes
  SAY @26
= @27
= @28
  IF ~~ THEN DO ~%ERASEJOURNALENTRY_30%
GiveItem("SCRL1H",LastTalkedToBy) GiveItem("SCRL1F",LastTalkedToBy)
AddexperienceParty(1000)
SetGlobal("HelpCordyr","GLOBAL",2)~ %SOLVED_JOURNAL% @29 EXIT
END


END //APPEND