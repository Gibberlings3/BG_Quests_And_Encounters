/* Global("OublekBounty1","GLOBAL",1): Brage is brought in (original game variable) 

 Global("BrageRiddle","GLOBAL",5): Brage was brought to garrison / Oublek 

 Global("C#Q13_BragesSwordQuest","GLOBAL",2): active Quest variable 

Global("C#Q13_BragesSwordQuest","GLOBAL",3): collecting of evidence is done, trial awaits (talk to Oublek to trigger)
 
GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) !Global("C#Q13_BragesSwordQuest","GLOBAL",55):Quest is done, except for some thank you dialogues etc. 

Global("C#Q13_BragesSwordQuest","GLOBAL",55): qust is dead (stopped by player)

OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3): PC showed Nalin the cursed sword, Brage will be sentenced innocent (if also letter c#q13le3 is shown to Oublek)

Global("C#q13Brage_NalinVouch","GLOBAL",4): PC whoed a wrong sword, Brage will be sentenced to guilty 


Global("C#q13Brage_FakeMerchant","GLOBAL",1): PC met Borda and let him live. 

"C#q13Brage_FakeMerchant" Triggers Laryssa's second spawn:
Global("C#q13Brage_FakeMerchant","GLOBAL",2/4) and !Dead("BORDA"): Borda wurde noch nicht getroffen, steht noch in der Originalarea [MYSMER weist den Hc nach "Osten"
Global("C#q13Brage_FakeMerchant","GLOBAL",3/5) and !Dead("BORDA"): Borda wurde getroffen, muss nun vor dem Black Lotus Tent spawnen
Dead("BORDA"): Borda taucht kein zweites mal auf, Laryssa gibt keinen Tip 


*/

/* Bardolan - he will tell about Brage always */

I_C_T ~%tutu_var%Bardol~ 1 C#q13Brage_BardolanTold
== ~%tutu_var%Bardol~ IF ~!GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3)~ THEN @0 DO ~AddJournalEntry(@1000,QUEST)~
END

I_C_T ~%tutu_var%Bardol~ 3 C#q13Brage_BardolanTold
== ~%tutu_var%Bardol~ @0 DO ~AddJournalEntry(@1000,QUEST)~
END



/* Hick - Amnish soldier who yells at the PC inside the barracks. He'll wait outside and give him a small text about Brage, after PC went inside the barracks */

APPEND ~%tutu_var%HICK~

/* same dialogue as generic Amnish soldier. Will only show once */
IF WEIGHT #-1
~GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) !Global("C#q13Brage_NalinVouch","GLOBAL",4) 
!Global("C#Q13_BragesSwordQuest","GLOBAL",55) Global("C#Q13_Thankyou","MYAREA",0)
AreaCheck("%Nashkel_Garrison%")~ thankyou
SAY @1
IF ~~ THEN DO ~SetGlobal("C#Q13_Thankyou","MYAREA",1) EscapeArea()~ EXIT
END

IF WEIGHT #-1
~GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_NalinVouch","GLOBAL",4) Global("C#Q13_Thankyou","MYAREA",0)
AreaCheck("%Nashkel_Garrison%")~ omg
SAY @2
IF ~~ THEN DO ~SetGlobal("C#Q13_Thankyou","MYAREA",1) EscapeArea()~ EXIT
END

IF WEIGHT #-1
~NumTimesTalkedToGT(0)~ THEN brage
SAY @3
IF ~~ THEN DO ~EscapeArea()~ UNSOLVED_JOURNAL @1001 EXIT
END
END //APPEND


/* Brage: PC can convince him to go to Oublek/Garrison, also. */

EXTEND_BOTTOM ~%tutu_var%Brage~ 2
+ ~!Dead("oublek")~ + @4 + 3
END

ADD_TRANS_ACTION ~%tutu_var%Brage~ BEGIN 3 END BEGIN END ~SetGlobal("BrageRiddle","GLOBAL",4)
AddexperienceParty(800)
DestroyItem("%tutu_var%SW2H01")
GiveItem("%tutu_var%SW2H03",LastTalkedToBy)
GiveItem("%tutu_var%POTN12",LastTalkedToBy)
AddexperienceParty(1000)
ClearAllActions()
StartCutSceneMode()
StartCutScene("C#Q13Brc")~

APPEND ~%tutu_var%BRAGE~
IF WEIGHT #-1
~Global("BrageRiddle","GLOBAL",4)~ THEN garrison
SAY @5 
IF ~~ THEN DO ~SetGlobal("BrageRiddle","GLOBAL",5)~ EXTERN ~%tutu_var%OUBLEK~ 3
END
END //APPEND



/* Brage - if he is in temple, PC can ask him directly */

ADD_TRANS_TRIGGER ~%tutu_var%BRAGE~ 9 ~OR(2)
GlobalGT("C#q13Brage_AskedQuestions","GLOBAL",0) 
GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",2)~ DO 0

EXTEND_BOTTOM ~%tutu_var%BRAGE~ 9
+ ~Global("C#q13Brage_AskedQuestions","GLOBAL",0) GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3)~ + @6 + brage_01
+ ~Global("C#q13Brage_AskedQuestions","GLOBAL",0) GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3)~ + @7 + brage_08
END

APPEND ~%tutu_var%BRAGE~
IF ~~ THEN brage_01
SAY @8
++ @9 + brage_04
++ @10 DO ~SetGlobal("C#q13Brage_AskedQuestions","GLOBAL",2)~  + brage_03
++ @11 DO ~SetGlobal("C#q13Brage_AskedQuestions","GLOBAL",2)~  + brage_03
+ ~!Global("BrageRiddle","GLOBAL",5)~ + @12 + brage_02
+ ~!Global("BrageRiddle","GLOBAL",5)~ + @13 + brage_02
END

IF ~~ THEN brage_02
SAY @14
IF ~~ THEN EXIT
END

IF ~~ THEN brage_03
SAY @15
= @16
= @17
+ ~GlobalGT("C#q13Brage_NalinVouch","GLOBAL",1)~ + @18 + brage_05
+ ~GlobalLT("C#q13Brage_NalinVouch","GLOBAL",2)~ + @19 + brage_06
++ @20 + brage_07
++ @21 + brage_07
+ ~!Global("BrageRiddle","GLOBAL",5)~ + @22 UNSOLVED_JOURNAL @1002 + brage_08 
+ ~Global("BrageRiddle","GLOBAL",5)~ + @22 UNSOLVED_JOURNAL @1002 + brage_09 
END

IF ~~ THEN brage_04
SAY @23
++ @11 DO ~SetGlobal("C#q13Brage_AskedQuestions","GLOBAL",2)~  + brage_03
+ ~!Global("BrageRiddle","GLOBAL",5)~ + @12 + brage_02
++ @13 + brage_02
END

IF ~~ THEN brage_05
SAY @24
++ @20 + brage_07
++ @21 + brage_07
+ ~!Global("BrageRiddle","GLOBAL",5)~ + @22 UNSOLVED_JOURNAL @1002 + brage_08 
+ ~Global("BrageRiddle","GLOBAL",5)~ + @22 UNSOLVED_JOURNAL @1002 + brage_09 
END

IF ~~ THEN brage_06
SAY @25
++ @20 + brage_07
++ @21 + brage_07
+ ~!Global("BrageRiddle","GLOBAL",5)~ + @22 UNSOLVED_JOURNAL @1002 + brage_08 
+ ~Global("BrageRiddle","GLOBAL",5)~ + @22 UNSOLVED_JOURNAL @1002 + brage_09 
END

IF ~~ THEN brage_07
SAY @26
= @27 
IF ~!Global("BrageRiddle","GLOBAL",5)~ THEN UNSOLVED_JOURNAL @1003 + brage_08
IF ~Global("BrageRiddle","GLOBAL",5)~ THEN UNSOLVED_JOURNAL @1003 + brage_09
END

IF ~~ THEN brage_08
SAY @28
IF ~~ THEN EXIT
END

IF ~~ THEN brage_09
SAY @29
IF ~~ THEN DO ~FadeToColor([20.0],0)
Wait(1)
ActionOverride("Brage",DestroySelf())
ActionOverride("c#q13amn",DestroySelf())
FadeFromColor([20.0],0)~ EXIT
END


/* Brage in temple, after trial */

IF WEIGHT #-1
~Global("C#Q13_BragesSwordQuest","GLOBAL",4)~ THEN questend
SAY @30
= @31
IF ~~ THEN DO ~SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",5) SetGlobal("BrageRiddle","GLOBAL",2)~ EXIT
END

END //APPEND

/* After the trial. The PC can give him his original sword. He payed for it, after all! */

EXTEND_BOTTOM ~%tutu_var%BRAGE~ 9
IF ~PartyHasItem("c#q13swd") Global("C#Q13_BragesSwordQuest","GLOBAL",5)
GlobalLT("C#q13Brage_ConvinceBrage","LOCALS",3)~ THEN + atonement
END

APPEND ~%tutu_var%BRAGE~

IF ~~ THEN atonement
SAY @32
+ ~Global("C#q13Brage_ConvinceBrage","LOCALS",0)~ + @33 DO ~IncrementGlobal("C#q13Brage_ConvinceBrage","LOCALS",1)~ + take_sword_01
+ ~Global("C#q13Brage_ConvinceBrage","LOCALS",1)~ + @34 DO ~IncrementGlobal("C#q13Brage_ConvinceBrage","LOCALS",1)~ + take_sword_02
+ ~Global("C#q13Brage_ConvinceBrage","LOCALS",2)~ + @35 DO ~IncrementGlobal("C#q13Brage_ConvinceBrage","LOCALS",1)~ + take_sword_03
++ @7 EXIT 
END

IF ~~ THEN take_sword_01
SAY @36
IF ~~ THEN EXIT
END

IF ~~ THEN take_sword_02
SAY @37
IF ~~ THEN EXIT
END

IF ~~ THEN take_sword_03
SAY @38
++ @39 + take_sword_04
++ @40 + take_sword_05
END

IF ~~ THEN take_sword_04
SAY @41
IF ~~ THEN + take_sword_06
END

IF ~~ THEN take_sword_05
SAY @42
++ @39 + take_sword_04
++ @43 + take_sword_07
END

IF ~~ THEN take_sword_06
SAY @44
IF ~~ THEN DO ~TakePartyItem("c#q13swd") DestroyItem("c#q13swd")~ + take_sword_07
END

IF ~~ THEN take_sword_07
SAY @45
IF ~~ THEN EXIT
END


END //APPEND


/* Oublek: Prevent him from disappearing forever */

REPLACE_TRANS_TRIGGER ~%tutu_var%oublek~ BEGIN 5 END BEGIN 0 END ~EscapeArea()~ ~~

/* BG:EE, Tutu, TotSC */
REPLACE_TRANS_TRIGGER ~%tutu_var%oublek~ BEGIN 22 END BEGIN 0 END ~EscapeArea()~ ~~
/* BGT */
REPLACE_TRANS_TRIGGER ~%tutu_var%oublek~ BEGIN 22 END BEGIN 0 END ~EscapeAreaDestroy(90)~ ~~


/* Questsstart: after delivering Brage, Oublek will say his piece if talked to */


CHAIN
IF WEIGHT #-1
~Global("C#Q13_BragesSwordQuest","GLOBAL",1)~ THEN ~%tutu_var%OUBLEK~ bragequest
@46
== ~%tutu_var%OUBLEK~ IF ~Global("BrageRiddle","GLOBAL",5)~ THEN @47
== ~%tutu_var%OUBLEK~ IF ~!Global("BrageRiddle","GLOBAL",5)~ THEN @48
== ~%tutu_var%OUBLEK~ @49
END
IF ~Global("BrageRiddle","GLOBAL",5)~ THEN DO ~SetGlobal("C#q13Brage_NalinVouch","GLOBAL",1) SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",2)
EraseJournalEntry(%journalentry_oublek_3%) AddJournalEntry(@1004,QUEST)~ EXIT
IF ~!Global("BrageRiddle","GLOBAL",5)~ THEN DO ~SetGlobal("C#q13Brage_NalinVouch","GLOBAL",1) SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",2)
EraseJournalEntry(%journalentry_nalin_4%)
AddJournalEntry(@1005,QUEST)~ EXIT




/* Nalin, priest of Helm - show him the sword */

/* If Brage is in temple, Nalin will tell him the news */

APPEND ~%tutu_var%NALIN~
IF WEIGHT #-1
~Global("C#q13Brage_NalinVouch","GLOBAL",1)
!Global("C#Q13_BragesSwordQuest","GLOBAL",55)
OR(8)
PartyHasItem("%tutu_var%SW2H01")
PartyHasItem("%tutu_var%SW2H01B")
PartyHasItem("%tutu_var%SW2H02")
PartyHasItem("%tutu_var%SW2H05")
PartyHasItem("%tutu_var%SW2H11")
PartyHasItem("%tutu_var%SW2H20")
PartyHasItem("c#q13swd")
PartyHasItem("%tutu_var%SW2H03")~ THEN sword
SAY @50
+ ~PartyHasItem("%tutu_var%SW2H03")~ + @51 + cursed_sword
+ ~!PartyHasItem("%tutu_var%SW2H03")~ + @52 + no_sword
+ ~PartyHasItem("%tutu_var%SW2H03")~ + @53 + sword_for_gold
+ ~OR(7)
PartyHasItem("%tutu_var%SW2H01")
PartyHasItem("%tutu_var%SW2H01B")
PartyHasItem("%tutu_var%SW2H02")
PartyHasItem("%tutu_var%SW2H05")
PartyHasItem("%tutu_var%SW2H11")
PartyHasItem("%tutu_var%SW2H20")
PartyHasItem("c#q13swd")~ + @54 + other_sword
++ @55 + 0
++ @151 DO ~SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",55)~ + stop_quest
END

IF ~~ THEN stop_quest
SAY @152
IF ~~ THEN + 0
END

IF ~~ THEN no_sword
SAY @56
IF ~~ THEN EXIT
END

IF ~~ THEN other_sword
SAY @57
IF ~~ THEN + other_sword_00
/* Kivan */
IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN EXTERN ~%KIVAN_JOINED%~ protest
/* Yeslick */
IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN EXTERN ~%YESLICK_JOINED%~ protest
/* Khalid */
IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN EXTERN ~%KHALID_JOINED%~ protest
/* Dynaheir */
IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN EXTERN ~%DYNAHEIR_JOINED%~ protest
/* Jaheira */
IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN EXTERN ~%JAHEIRA_JOINED%~ protest
/* Rasaad */
IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN EXTERN ~%RASAAD_JOINED%~ protest
/* Ajantis */
IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN EXTERN ~%AJANTIS_JOINED%~ protest
END

END //APPEND

APPEND ~%AJANTIS_JOINED%~
IF ~~ THEN protest
SAY @143
IF ~~ THEN EXTERN ~%tutu_var%NALIN~ no_sword
END
END //APPEND

APPEND ~%RASAAD_JOINED%~
IF ~~ THEN protest
SAY @144
IF ~~ THEN EXTERN ~%tutu_var%NALIN~ no_sword
END
END //APPEND

APPEND ~%JAHEIRA_JOINED%~
IF ~~ THEN protest
SAY @147
IF ~~ THEN EXTERN ~%tutu_var%NALIN~ no_sword
END
END //APPEND

APPEND ~%DYNAHEIR_JOINED%~
IF ~~ THEN protest
SAY @145
IF ~~ THEN EXTERN ~%tutu_var%NALIN~ no_sword
END
END //APPEND

APPEND ~%KHALID_JOINED%~
IF ~~ THEN protest
SAY @148
IF ~~ THEN EXTERN ~%tutu_var%NALIN~ no_sword
END
END //APPEND

APPEND ~%YESLICK_JOINED%~
IF ~~ THEN protest
SAY @149
IF ~~ THEN EXTERN ~%tutu_var%NALIN~ no_sword
END
END //APPEND

APPEND ~%KIVAN_JOINED%~
IF ~~ THEN protest
SAY @150
IF ~~ THEN EXTERN ~%tutu_var%NALIN~ no_sword
END
END //APPEND


CHAIN
IF ~~ THEN ~%tutu_var%NALIN~ other_sword_00
@141
== ~%MINSC_JOINED%~ IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @146
== ~%IMOEN_JOINED%~ IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @142
END
+ ~PartyHasItem("%tutu_var%SW2H03")~ + @58 + cursed_sword 
+ ~PartyHasItem("%tutu_var%SW2H03")~ + @53 + sword_for_gold
++ @59 + other_sword_01
++ @60 EXIT


APPEND ~%tutu_var%NALIN~

IF ~~ THEN sword_for_gold
SAY @61
++ @62 DO ~SetGlobal("C#q13Brage_NalinReward","GLOBAL",500) GiveGoldForce(250)~ + sword_for_gold_01
++ @63 DO ~SetGlobal("C#q13Brage_NalinReward","GLOBAL",400) GiveGoldForce(200)~ + cursed_sword 
++ @64 EXIT
END

IF ~~ THEN sword_for_gold_01
SAY @65
IF ~~ THEN + cursed_sword 
END

END //APPEND

CHAIN
IF WEIGHT #-1
~OR(2)
Global("C#Q13_BragesSwordQuest","GLOBAL",4)
Global("C#Q13_BragesSwordQuest","GLOBAL",5)
GlobalGT("C#q13Brage_NalinReward","GLOBAL",2)~ THEN ~%tutu_var%NALIN~ reward_collected
@66
== ~%tutu_var%NALIN~ IF ~Global("C#q13Brage_NalinReward","GLOBAL",400)~ THEN @67 DO ~GiveGoldForce(200) SetGlobal("C#q13Brage_NalinReward","GLOBAL",2)~
== ~%tutu_var%NALIN~ IF ~Global("C#q13Brage_NalinReward","GLOBAL",500)~ THEN @68 DO ~GiveGoldForce(250) SetGlobal("C#q13Brage_NalinReward","GLOBAL",2)~
EXIT



CHAIN
IF ~~ THEN ~%tutu_var%NALIN~ cursed_sword 
@69
== ~%tutu_var%NALIN~ IF ~InMyArea("Brage")~ THEN @70
== ~%tutu_var%BRAGE~ IF ~InMyArea("Brage") !StateCheck("Brage",CD_STATE_NOTVALID)~ THEN @71
== ~%tutu_var%NALIN~ IF ~InMyArea("Brage") !StateCheck("Brage",CD_STATE_NOTVALID)~ THEN @72
== ~%tutu_var%NALIN~ IF ~InMyArea("Brage")~ THEN @73
== ~%tutu_var%NALIN~ IF ~!InMyArea("Brage")~ THEN @74
END
IF ~~ THEN DO ~SetGlobal("C#q13Brage_NalinVouch","GLOBAL",2)
EraseJournalEntry(@1004)
EraseJournalEntry(@1005)~ UNSOLVED_JOURNAL @1006 EXIT

CHAIN
IF ~~ THEN ~%tutu_var%NALIN~ other_sword_01
@75
== ~%tutu_var%NALIN~ @76
== ~%tutu_var%BRAGE~ IF ~InMyArea("Brage") !StateCheck("Brage",CD_STATE_NOTVALID)~ THEN @77
== ~%tutu_var%NALIN~ IF ~InMyArea("Brage") !StateCheck("Brage",CD_STATE_NOTVALID)~ THEN @78
== ~%tutu_var%NALIN~ IF ~Global("BrageRiddle","GLOBAL",5)~ THEN @79
END
IF ~Global("BrageRiddle","GLOBAL",5)~ THEN DO ~SetGlobal("C#q13Brage_NalinVouch","GLOBAL",4) SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",3)
EraseJournalEntry(@1004)~ UNSOLVED_JOURNAL @1007 EXIT
IF ~!Global("BrageRiddle","GLOBAL",5)~ THEN DO ~SetGlobal("C#q13Brage_NalinVouch","GLOBAL",4) SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",6)
EraseJournalEntry(@1005)~ UNSOLVED_JOURNAL @1008 EXIT




/* After PC showed Nalin the cursed sword (and showed his intention to help Brage), Laryssa will meet with the PC */


BEGIN c#q13lar 

CHAIN
IF ~OR(3)
Dead("BORDA")
Global("C#q13Brage_FakeMerchant","GLOBAL",2)
Global("C#q13Brage_FakeMerchant","GLOBAL",3)~ THEN c#q13lar help
@80
== c#q13lar IF ~Global("BrageRiddle","GLOBAL",5)~ THEN @81 
== c#q13lar IF ~!Global("BrageRiddle","GLOBAL",5)~ THEN @82
== c#q13lar @83 
END
IF ~Global("C#q13Brage_NalinVouch","GLOBAL",4) Global("BrageRiddle","GLOBAL",5)~ THEN + brage_guilty
IF ~Global("C#q13Brage_NalinVouch","GLOBAL",4) !Global("BrageRiddle","GLOBAL",5)~ THEN + brage_guilty_temple
IF ~!Dead("BORDA") !Global("C#q13Brage_NalinVouch","GLOBAL",4)
GlobalLT("C#q13Brage_FakeMerchant","GLOBAL",4)~ THEN + merchant
IF ~Dead("BORDA") !Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN + help_01


APPEND c#q13lar 

IF ~~ THEN brage_guilty_temple
SAY @84
IF ~~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",10) EscapeArea()~ EXIT 
END

IF ~~ THEN brage_guilty
SAY @85
IF ~~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",10) EscapeArea()~ EXIT 
END

IF ~~ THEN help_01
SAY @86
IF ~~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",10) EscapeArea()~ EXIT
END

IF ~~ THEN merchant
SAY @87
= @140
IF ~~ THEN DO ~IncrementGlobal("C#q13Brage_FakeMerchant","GLOBAL",2) EscapeArea()~ UNSOLVED_JOURNAL @1009 EXIT
END
END //APPEND



/* Evidence:
-letter found with Mulahey [not enough on its own]
-vouch from a trusted authority that sword is cursed 
-letter found with Borda about his role in replacing the original sword with a cursed one

To convince Nashkell authorities, the PC needs two things:

-vouch from Nalin that Brage's sword is cursed
-letter fround with Borda

The letter from Mulahey is a nice plus to shed light on what is happening overall. */


/* bring Oublek the evidence */

EXTEND_BOTTOM ~%tutu_var%OUBLEK~ 9


/* before Brage is found */
+ ~Global("OublekBounty1","GLOBAL",0) PartyHasItem("c#q13le2") GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_OublekBrageEvidence2","GLOBAL",0)~ + @88 DO ~SetGlobal("C#q13Brage_OublekBrageEvidence2","GLOBAL",1)~ + evidence_03_before

+ ~Global("OublekBounty1","GLOBAL",0) PartyHasItem("c#q13le1") GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_OublekBrageEvidence1","LOCALS",0)~ + @89 DO ~SetGlobal("C#q13Brage_OublekBrageEvidence1","LOCALS",1)~ + evidence_01

+ ~Global("OublekBounty1","GLOBAL",1) GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3)
GlobalLT("C#q13Brage_NalinVouch","GLOBAL",4)
OR(4)
Global("C#q13Brage_NalinVouch","GLOBAL",0)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_OublekBrageEvidence1","LOCALS",0)
Global("C#q13Brage_OublekBrageEvidence2","GLOBAL",0)~ + @90 + brage_oublekinfo
END

EXTEND_BOTTOM ~%tutu_var%OUBLEK~ 10
/* before Brage is found */
+ ~Global("OublekBounty1","GLOBAL",0) PartyHasItem("c#q13le2") GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_OublekBrageEvidence2","GLOBAL",0)~ + @88 DO ~SetGlobal("C#q13Brage_OublekBrageEvidence2","GLOBAL",1)~ + evidence_03_before

+ ~Global("OublekBounty1","GLOBAL",0) PartyHasItem("c#q13le1") GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_OublekBrageEvidence1","LOCALS",0)~ + @89 DO ~SetGlobal("C#q13Brage_OublekBrageEvidence1","LOCALS",1)~ + evidence_01

+ ~Global("OublekBounty1","GLOBAL",1) GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3)
GlobalLT("C#q13Brage_NalinVouch","GLOBAL",4)
OR(4)
Global("C#q13Brage_NalinVouch","GLOBAL",0)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_OublekBrageEvidence1","LOCALS",0)
Global("C#q13Brage_OublekBrageEvidence2","GLOBAL",0)~ + @90 + brage_oublekinfo
END

APPEND ~%tutu_var%OUBLEK~

IF ~~ THEN brage_oublekinfo
SAY @91
+ ~Global("OublekBounty1","GLOBAL",1) Global("BrageRiddle","GLOBAL",5) GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_AskedQuestions","GLOBAL",0)~ + @92 DO ~SetGlobal("C#q13Brage_AskedQuestions","GLOBAL",1)~ + talk


+ ~Global("C#q13Brage_NalinVouch","GLOBAL",2)~ + @93 DO ~SetGlobal("C#q13Brage_NalinVouch","GLOBAL",3)~ + evidence_02
+ ~PartyHasItem("c#q13le1") GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_OublekBrageEvidence1","LOCALS",0)~ + @89 DO ~SetGlobal("C#q13Brage_OublekBrageEvidence1","LOCALS",1)~ + evidence_01
+ ~Global("OublekBounty1","GLOBAL",1) PartyHasItem("c#q13le2") GlobalLT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_OublekBrageEvidence2","GLOBAL",0)~ + @88 DO ~SetGlobal("C#q13Brage_OublekBrageEvidence2","GLOBAL",1)~ + evidence_03

++ @94 EXIT
END


IF ~~ THEN evidence_01
SAY @95
IF ~~ THEN DO ~TakePartyItem("c#q13le1") DestroyItem("c#q13le1")~ EXIT
END

IF ~~ THEN evidence_02
SAY @96
IF ~Global("C#q13Brage_OublekBrageEvidence2","GLOBAL",0)~ THEN + evidence_02_01
IF ~Global("C#q13Brage_OublekBrageEvidence2","GLOBAL",1)~ THEN + all_evidence
END

IF ~~ THEN evidence_02_01
SAY @97 
IF ~~ THEN DO ~EraseJournalEntry(@1006)~ UNSOLVED_JOURNAL @1010 EXIT
IF ~Global("C#q13Brage_OublekBrageEvidence2","GLOBAL",1)~ THEN + all_evidence
END

IF ~~ THEN evidence_03
SAY @98 
IF ~~ THEN DO ~TakePartyItem("c#q13le2") DestroyItem("c#q13le2")~ + evidence_03_01
IF ~OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3)~ THEN DO ~TakePartyItem("c#q13le2") DestroyItem("c#q13le2")~ + all_evidence
END

IF ~~ THEN evidence_03_01
SAY @99 
IF ~~ THEN DO ~ 
EraseJournalEntry(@1002)
EraseJournalEntry(@1003) 
EraseJournalEntry(@1009)

EraseJournalEntry(@1011)
EraseJournalEntry(@1012)

EraseJournalEntry(@1016)~ UNSOLVED_JOURNAL @1013 EXIT
END

IF ~~ THEN all_evidence
SAY @100 
IF ~~ THEN DO ~SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",3)  
EraseJournalEntry(@1000)
EraseJournalEntry(@1001)
EraseJournalEntry(@1002)
EraseJournalEntry(@1003)  

EraseJournalEntry(@1006)

EraseJournalEntry(@1009)
EraseJournalEntry(@1010)
EraseJournalEntry(@1011)
EraseJournalEntry(@1012)
EraseJournalEntry(@1013)
EraseJournalEntry(@1015)
EraseJournalEntry(@1016)~ UNSOLVED_JOURNAL @1014 EXIT
END



IF ~~ THEN evidence_03_before
SAY @101
IF ~~ THEN DO ~TakePartyItem("c#q13le2") DestroyItem("c#q13le2")~ UNSOLVED_JOURNAL @1015 EXIT
END

IF ~~ THEN talk
SAY @102
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("C#Q13cu2")~ EXIT
END

END //APPEND

CHAIN
IF WEIGHT #-1
~Global("C#q13Brage_AskedQuestions","GLOBAL",1)~ THEN ~%tutu_var%Brage~ talk_brage
@103
== ~%tutu_var%Oublek~ @104
END
IF ~~ THEN DO ~SetGlobal("C#q13Brage_AskedQuestions","GLOBAL",2)~ EXTERN ~%tutu_var%BRAGE~ brage_01




CHAIN
IF WEIGHT #-1
~Global("C#Q13_BragesSwordQuest","GLOBAL",3)~ THEN ~%tutu_var%OUBLEK~ trial
@105
== ~%tutu_var%OUBLEK~ IF ~!Global("BrageRiddle","GLOBAL",5)~ THEN @106
== ~%tutu_var%OUBLEK~ @107
END
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("C#Q13cu3")~ EXIT


APPEND ~%tutu_var%OUBLEK~

IF WEIGHT #-1
~Global("C#Q13_BragesSwordQuest","GLOBAL",6)
Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN trial
SAY @108
IF ~~ THEN DO ~SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",7) 
EraseJournalEntry(@1000)
EraseJournalEntry(@1001)
EraseJournalEntry(@1002) 
EraseJournalEntry(@1003)

EraseJournalEntry(@1005)

EraseJournalEntry(@1008)

EraseJournalEntry(@1013)
EraseJournalEntry(@1015)

~ SOLVED_JOURNAL @1018 EXIT
END

END //APPEND

BEGIN c#q13brn
BEGIN c#q13oub


CHAIN
IF WEIGHT #-1
~Global("C#Q13_BragesSwordQuest","GLOBAL",3)~ THEN c#q13brn trial_01
@109
== ~%tutu_var%BRAGE~ @110
== c#q13brn @111

/* innocence path */
== c#q13oub IF ~OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3)~ THEN @112
== ~%tutu_var%BRAGE~ IF ~OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3)~ THEN @113
== c#q13brn IF ~OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3)~ THEN @114
== ~%tutu_var%BRAGE~ IF ~OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3)~ THEN @115
== c#q13brn IF ~OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3)~ THEN @116

/* 'guilt' path */
== c#q13oub IF ~Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN @117
== c#q13brn IF ~Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN @118
== ~%tutu_var%BRAGE~ IF ~Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN @119

END
IF ~Global("BrageRiddle","GLOBAL",5) OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3)~ THEN DO ~FadeToColor([20.0],0) SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",4) ReputationInc(1) 

EraseJournalEntry(@1001)
EraseJournalEntry(@1014)

ActionOverride("Brage",MoveBetweenAreas("%Nashkel_TempleofHelm%",[517.416],10)) ActionOverride("c#q13oub",DestroySelf()) 
ActionOverride("c#q13amn",DestroySelf())Wait(1) FadeFromColor([20.0],0) DestroySelf()~ SOLVED_JOURNAL @1019 EXIT
IF ~!Global("BrageRiddle","GLOBAL",5) OR(2)
Global("C#q13Brage_NalinVouch","GLOBAL",2)
Global("C#q13Brage_NalinVouch","GLOBAL",3)~ THEN DO ~FadeToColor([20.0],0) SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",4)  

EraseJournalEntry(@1001)
EraseJournalEntry(@1014)

ActionOverride("Brage",DestroySelf()) ActionOverride("c#q13oub",DestroySelf()) 
ActionOverride("c#q13amn",DestroySelf()) Wait(1) FadeFromColor([20.0],0) DestroySelf()~ SOLVED_JOURNAL @1019 EXIT
IF ~Global("C#q13Brage_NalinVouch","GLOBAL",4)~ THEN DO ~FadeToColor([20.0],0) 
SetGlobal("C#Q13_BragesSwordQuest","GLOBAL",7)  

EraseJournalEntry(@1001)
EraseJournalEntry(@1007)

ActionOverride("Brage",DestroySelf()) ActionOverride("c#q13oub",DestroySelf()) 
ActionOverride("c#q13amn",DestroySelf()) Wait(1) FadeFromColor([20.0],0) DestroySelf()~ SOLVED_JOURNAL @1020 EXIT



/* after trial - soldier in the barracks gives a "yay" dialogue */

APPEND ~%tutu_var%AMNIS~
IF WEIGHT #-1
~GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) !Global("C#q13Brage_NalinVouch","GLOBAL",4) Global("C#Q13_Thankyou","MYAREA",0)
AreaCheck("%Nashkel_Garrison%")~ thankyou
SAY @1
IF ~~ THEN DO ~SetGlobal("C#Q13_Thankyou","MYAREA",1)~ EXIT
END

IF WEIGHT #-1
~GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) Global("C#q13Brage_NalinVouch","GLOBAL",4) Global("C#Q13_Thankyou","MYAREA",0)
AreaCheck("%Nashkel_Garrison%")~ omg
SAY @2
IF ~~ THEN DO ~SetGlobal("C#Q13_Thankyou","MYAREA",1) EscapeArea()~ EXIT
END

END //APPEND

/* after trial - if Berrun is still around, he will give a thank you speech, too. Berrun is there until the mines are cleared. [Note: Berrun will greet the PC for clearing the mines, and unfortunately, the questpack did not add to the original greetings dialogue but added a new one for the tainted ore quest. Patching these dialogues is difficult.] */

APPEND ~%tutu_var%BERRUN~
IF WEIGHT #-1
~GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) !Global("C#q13Brage_NalinVouch","GLOBAL",4)
Global("C#Q13_Thankyou","LOCALS",0)~ thankyou
SAY @120
IF ~~ THEN DO ~SetGlobal("C#Q13_Thankyou","LOCALS",1)~ + 14
END
END //APPEND



/* Texts for Bardolan in case he is still there (Bardolan after first meeting: is introduced by Jarl's Adventure Pack)  */
/* wenn man Brief bei Mulahey gefunden hat */
/* Begrüßungsdialog, Brage ist gefunden und zurückgebracht (entweder tot oder in Tempel). Weiterer Quest ist noch nicht erledigt  */

CHAIN
IF WEIGHT #-1
~GlobalGT("C#Q13_BragesSwordQuest","GLOBAL",3) !Global("C#q13Brage_NalinVouch","GLOBAL",4) Global("C#Q13_Thankyou","LOCALS",0)~ THEN ~%tutu_var%Bardol~ thankyou
@121
== ~%tutu_var%Bardol~ IF ~GlobalGT("Chapter","GLOBAL",%tutu_chapter_2%)~ THEN @122
== ~%tutu_var%Bardol~ IF ~!GlobalGT("Chapter","GLOBAL",%tutu_chapter_2%)~ THEN @123
== ~%tutu_var%Bardol~ @124
END
IF ~~ THEN DO ~SetGlobal("C#Q13_Thankyou","LOCALS",1)~ EXIT




/* Mysmer.dlg - merchant who sells strange potions at the Nashkel Carnival */

ADD_TRANS_TRIGGER ~%tutu_var%MYSMER~ 7 ~Global("C#q13Brage_MysmerInfo","LOCALS",1)~
ADD_TRANS_TRIGGER ~%tutu_var%MYSMER~ 8 ~Global("C#q13Brage_MysmerInfo","LOCALS",1)~

EXTEND_BOTTOM ~%tutu_var%MYSMER~ 0
+ ~PartyHasItem("c#q13le3") Global("C#q13Brage_MysmerInfo","LOCALS",0)~ + @125 DO ~SetGlobal("C#q13Brage_MysmerInfo","LOCALS",1)~ + talk
+ ~OR(2)
Global("C#q13Brage_FakeMerchant","GLOBAL",4)
Global("C#q13Brage_FakeMerchant","GLOBAL",5) Global("C#q13Brage_MysmerInfo","LOCALS",0)~ + @126 DO ~SetGlobal("C#q13Brage_MysmerInfo","LOCALS",1)~ + talk
END

EXTEND_BOTTOM ~%tutu_var%MYSMER~ 7
+ ~PartyHasItem("c#q13le3") Global("C#q13Brage_MysmerInfo","LOCALS",0)~ + @127 DO ~SetGlobal("C#q13Brage_MysmerInfo","LOCALS",1)~ + talk
+ ~OR(2)
Global("C#q13Brage_FakeMerchant","GLOBAL",4)
Global("C#q13Brage_FakeMerchant","GLOBAL",5) Global("C#q13Brage_MysmerInfo","LOCALS",0)~ + @126 DO ~SetGlobal("C#q13Brage_MysmerInfo","LOCALS",1)~ + talk
+ ~Global("C#q13Brage_MysmerInfo","LOCALS",0)~ + @7 EXIT
END

EXTEND_BOTTOM ~%tutu_var%MYSMER~ 8
+ ~PartyHasItem("c#q13le3") Global("C#q13Brage_MysmerInfo","LOCALS",0)~ + @128 DO ~SetGlobal("C#q13Brage_MysmerInfo","LOCALS",1)~ + talk
+ ~OR(2)
Global("C#q13Brage_FakeMerchant","GLOBAL",4)
Global("C#q13Brage_FakeMerchant","GLOBAL",5) Global("C#q13Brage_MysmerInfo","LOCALS",0)~ + @126 DO ~SetGlobal("C#q13Brage_MysmerInfo","LOCALS",1)~ + talk
+ ~Global("C#q13Brage_MysmerInfo","LOCALS",0)~ + @7 EXIT
END

APPEND ~%tutu_var%MYSMER~

IF ~~ THEN talk
SAY @129
IF ~!Dead("BORDA") 
OR(3)
PartyHasItem("c#q13le3")
Global("C#q13Brage_FakeMerchant","GLOBAL",4)
Global("C#q13Brage_FakeMerchant","GLOBAL",5)~ THEN + talk_01
IF ~Dead("Borda")~ THEN + talk_03
END

END //APPEND

CHAIN
IF ~~ THEN ~%tutu_var%MYSMER~ talk_01
@130
== ~%tutu_var%MYSMER~ IF ~Global("C#q13Brage_FakeMerchant","GLOBAL",4)~ THEN @131
== ~%tutu_var%MYSMER~ @132
END

/* Borda was not met yet */
IF ~OR(2)
	Global("C#q13Brage_FakeMerchant","GLOBAL",0) /* PC came with third letter fromTazok's tent */
	Global("C#q13Brage_FakeMerchant","GLOBAL",4)~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",6) EraseJournalEntry(@1009)~ UNSOLVED_JOURNAL @1016 EXIT
IF ~OR(2)
	Global("C#q13Brage_FakeMerchant","GLOBAL",0)
	Global("C#q13Brage_FakeMerchant","GLOBAL",4) 
Global("BoughtPotions","GLOBAL",0)~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",6) EraseJournalEntry(@1009)~ UNSOLVED_JOURNAL @1016 + talk_02


/* Borda was already met */
IF ~OR(2)
	Global("C#q13Brage_FakeMerchant","GLOBAL",1)
	Global("C#q13Brage_FakeMerchant","GLOBAL",5)~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",7) EraseJournalEntry(@1009)~ UNSOLVED_JOURNAL @1017 EXIT
IF ~OR(2)
	Global("C#q13Brage_FakeMerchant","GLOBAL",1)
	Global("C#q13Brage_FakeMerchant","GLOBAL",5) 
Global("BoughtPotions","GLOBAL",0)~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",7) EraseJournalEntry(@1009)~ UNSOLVED_JOURNAL @1017 + talk_02

APPEND ~%tutu_var%MYSMER~

IF ~~ THEN talk_02
SAY @133
++ @134 EXIT
COPY_TRANS %tutu_var%MYSMER 0
END

IF ~~ THEN talk_03
SAY @135
IF ~~ THEN EXIT
IF ~Global("BoughtPotions","GLOBAL",0)~ THEN + talk_02
END

END //APPEND


/* Borda, der Händler verfluchter Waren */
/* if met before, Borda will approach the PC after he made inquiries at MYSMER */


EXTEND_BOTTOM ~%tutu_var%BORDA~ 0
/* PC heard from Laryssa about merchant of cursed items but didn't talk to MYSMER at Carneval and just tries his luck */
+ ~Global("C#q13Brage_FakeMerchant","GLOBAL",4)~ + @136 + confrontation_01

/*
/* PC spoke to MYSMER and confronts Borda */
+ ~Global("C#q13Brage_FakeMerchant","GLOBAL",6)~ + @137 + confrontation_02
*/
END

APPEND ~%tutu_var%BORDA~
IF ~~ THEN confrontation_01
SAY @138
IF ~~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",10) 
EraseJournalEntry(@1002)
EraseJournalEntry(@1003)
EraseJournalEntry(@1009) 
Enemy()~ UNSOLVED_JOURNAL @1012 EXIT
END

IF WEIGHT #-1
~Global("C#q13Brage_FakeMerchant","GLOBAL",6)~ THEN confrontation_02
SAY @139
IF ~~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",10) 
EraseJournalEntry(@1002)
EraseJournalEntry(@1003) 
EraseJournalEntry(@1009)
EraseJournalEntry(@1016) Enemy()~ UNSOLVED_JOURNAL @1012 EXIT
END

END


BEGIN c#q13bor
IF ~True()~ THEN confrontation
SAY @139
IF ~~ THEN DO ~SetGlobal("C#q13Brage_FakeMerchant","GLOBAL",10)  
EraseJournalEntry(@1002)
EraseJournalEntry(@1003)
EraseJournalEntry(@1016)
EraseJournalEntry(@1017) Enemy()~ UNSOLVED_JOURNAL @1011 EXIT
END


