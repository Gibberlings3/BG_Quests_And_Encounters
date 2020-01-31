BEGIN C#Q06001

IF ~Global("C#Q06_TalkedToWife","GLOBAL",0)~ THEN wife
SAY @0
++ @1 + wife_01
++ @2 + wife_02
++ @3 + wife_02
++ @4 + wife_03
END

IF ~~ THEN wife_01
SAY @5
IF ~~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",1) SetGlobal("C#Q06_SpawnZombie","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10046 + wife_04
END

IF ~~ THEN wife_02
SAY @7
IF ~~ THEN + wife_01
END

IF ~~ THEN wife_03
SAY @8
IF ~~ THEN + wife_01
END

IF ~~ THEN wife_04
SAY @9
++ @10 + wife_06
+ ~Global("C#Q06_MonsterType","GLOBAL",0)~ + @11 DO ~SetGlobal("C#Q06_MonsterType","GLOBAL",1)~ + wife_07
++ @12 + wife_05
++ @13 EXIT
END

IF ~~ THEN wife_05
SAY @14
++ @15 + wife_06
+ ~Global("C#Q06_MonsterType","GLOBAL",0)~ + @11 DO ~SetGlobal("C#Q06_MonsterType","GLOBAL",1)~ + wife_07
++ @16 DO ~SetGlobal("C#Q06_Belohnung","GLOBAL",1)~ + wife_08
++ @13 EXIT
END

IF ~~ THEN wife_06
SAY @17
IF ~~ THEN DO ~SetGlobal("C#Q06_PromisedKill","GLOBAL",1)~ EXIT
END

IF ~~ THEN wife_07
SAY @18
++ @19 + wife_06
++ @20 + wife_05
++ @13 EXIT
END

IF ~~ THEN wife_08
SAY @21
++ @15 + wife_06
+ ~Global("C#Q06_MonsterType","GLOBAL",0)~ + @11 DO ~SetGlobal("C#Q06_MonsterType","GLOBAL",1)~ + wife_07
++ @13 EXIT
END

IF ~Global("C#Q06_TalkedToWife","GLOBAL",3)~ THEN wife_08a
SAY @22
+ ~!Dead("C#Q06002")~ + @23 EXIT
+ ~Dead("C#Q06002")~ + @24 DO ~%ERASEJOURNALENTRY_10046% AddJournalEntry(@10047%QUEST_DONE%)~ + wife_14
+ ~!Dead("C#Q06002") Global("C#Q06_Wife13","GLOBAL",1)~ + @26 + wife_18
+ ~!Dead("C#Q06002") Global("C#Q06_Wife13","GLOBAL",0)~ + @26 DO ~SetGlobal("C#Q06_Wife13","GLOBAL",1)~ + wife_13
+ ~!Dead("C#Q06002") Global("C#Q06_Contract","GLOBAL",0)~ + @27 DO ~SetGlobal("C#Q06_Contract","GLOBAL",1)~ + wife_17
++ @28 EXIT
END

IF ~Global("C#Q06_TalkedToWife","GLOBAL",2) Global("C#Q06_Belohnung","GLOBAL",0)~ THEN wife_08ba
SAY @29
IF ~!Global("C#Q06_TalkedToZombie","GLOBAL",2)~ THEN EXIT
+ ~Global("C#Q06_TalkedToZombie","GLOBAL",2)~ + @30 EXIT
+ ~Global("C#Q06_TalkedToZombie","GLOBAL",2)~ + @31 DO ~SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3)~ + wife_20
END

IF ~Global("C#Q06_TalkedToWife","GLOBAL",2) GlobalGT("C#Q06_Belohnung","GLOBAL",0)~ THEN wife_08b
SAY @32
IF ~!Global("C#Q06_TalkedToZombie","GLOBAL",2)~ THEN EXIT
+ ~Global("C#Q06_TalkedToZombie","GLOBAL",2)~ + @33 EXIT
+ ~Global("C#Q06_TalkedToZombie","GLOBAL",2)~ + @31 DO ~SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3)~+ wife_20
END

IF ~Global("C#Q06_TalkedToWife","GLOBAL",1)~ THEN wife_08c
SAY @34
+ ~!Dead("C#Q06002")~ + @23 EXIT
+ ~!Dead("C#Q06002") Global("C#Q06_PromisedKill","GLOBAL",1)~ + @35 + wife_21
+ ~Dead("C#Q06002")~ + @24 DO ~%ERASEJOURNALENTRY_10046% AddJournalEntry(@10048%QUEST_DONE%)~ + wife_09
+ ~!Dead("C#Q06002") Global("C#Q06_TalkedToZombie","GLOBAL",2)~ + @37 + wife_10
++ @38 EXIT
END

IF ~~ THEN wife_09
SAY @39
++ @40 + wife_09a
+ ~Global("C#Q06_TalkedToZombie","GLOBAL",2)~ + @41 DO ~SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3)~ + wife_09a
++ @42 + wife_09a
END

IF ~~ THEN wife_09a
SAY @43
= @44
IF ~Global("C#Q06_Belohnung","GLOBAL",1)~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",2) GiveGoldForce(150) GiveItemCreate("%tutu_var%AMUL11",[PC],1,0,0) AddExperienceParty(300)~ EXIT
IF ~Global("C#Q06_Belohnung","GLOBAL",0)~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",2) GiveGoldForce(150) AddExperienceParty(300)~ EXIT
END

IF ~~ THEN wife_10
SAY @45
++ @46 EXIT
++ @47 + wife_11
++ @48 EXIT
END

IF ~~ THEN wife_11
SAY @49
++ @50 EXIT
++ @51 + wife_12
++ @48 EXIT
END



IF ~~ THEN wife_13
SAY @59
++ @60 + wife_18
++ @27 + wife_17
++ @61 EXIT 
++ @58 EXIT
END 

IF ~~ THEN wife_14
SAY @62
IF ~Global("C#Q06_Belohnung","GLOBAL",0)~ THEN + wife_14_0
IF ~Global("C#Q06_Belohnung","GLOBAL",1)~ THEN + wife_14_1
IF ~Global("C#Q06_Belohnung","GLOBAL",3)~ THEN + wife_14_3
IF ~Global("C#Q06_Belohnung","GLOBAL",4)~ THEN + wife_14_4
IF ~Global("C#Q06_Belohnung","GLOBAL",5)~ THEN + wife_14_5
END

IF ~~ THEN wife_14_0
SAY @30
IF ~~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",2)  SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3) GiveGoldForce(150) AddExperienceParty(300)~ EXIT
END

IF ~~ THEN wife_14_1
SAY @63
IF ~~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",2)  SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3) GiveGoldForce(150) GiveItemCreate("%tutu_var%AMUL11",[PC],1,0,0) AddExperienceParty(300)~ EXIT
END

IF ~~ THEN wife_14_3
SAY @64
IF ~~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",2)  SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3) GiveGoldForce(300) AddExperienceParty(300)~ EXIT
END

IF ~~ THEN wife_14_4
SAY @65
IF ~~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",2)  SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3) GiveGoldForce(300) GiveItemCreate("%tutu_var%AMUL11",[PC],1,0,0) AddExperienceParty(300)~ EXIT
END

IF ~~ THEN wife_14_5
SAY @66
IF ~~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",2)  SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3) GiveGoldForce(500) GiveItemCreate("%tutu_var%AMUL11",[PC],1,0,0) AddExperienceParty(300)~ EXIT
END

IF ~~ THEN wife_14c
SAY @62
IF ~~ THEN DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",2)  SetGlobal("C#Q06_TalkedToZombie","GLOBAL",3) GiveGoldForce(150) AddExperienceParty(300)~ EXIT
END

IF ~~ THEN wife_15
SAY @67
++ @68 DO ~SetGlobal("C#Q06_Wife13","GLOBAL",1)~ + wife_13
++ @69 EXIT
+ ~Global("C#Q06_Belohnung","GLOBAL",0)~ + @70 DO ~SetGlobal("C#Q06_Belohnung","GLOBAL",3)~ + wife_15a
+ ~Global("C#Q06_Belohnung","GLOBAL",1)~ + @70 DO ~SetGlobal("C#Q06_Belohnung","GLOBAL",4)~ + wife_15a
++ @71 EXIT
END

IF ~~ THEN wife_15a
SAY @72
++ @73 DO ~SetGlobal("C#Q06_Belohnung","GLOBAL",5)~ + wife_15b
++ @74 EXIT
++ @75 EXIT
END

IF ~~ THEN wife_15b
SAY @76
++ @74 EXIT
++ @75 EXIT
END

IF ~~ THEN wife_16
SAY @77
++ @78 DO ~SetGlobal("C#Q06_Wife13","GLOBAL",1)~ + wife_13
++ @79 EXIT
++ @80 + wife_15
++ @81 EXIT
END

IF ~~ THEN wife_17
SAY @82
+ ~Global("C#Q06_Wife13","GLOBAL",1)~ + @60 + wife_18
+ ~Global("C#Q06_Wife13","GLOBAL",0)~ + @60 DO ~SetGlobal("C#Q06_Wife13","GLOBAL",1)~ + wife_13
++ @61 EXIT 
++ @58 EXIT
END

IF ~~ THEN wife_18
SAY @83
++ @84 DO ~TakePartyGold(50)~ + wife_19
++ @85 + wife_19
++ @86 EXIT
END

IF ~~ THEN wife_19
SAY @87
IF ~~ THEN DO ~SetGlobal("C#Q06_DestroyZombie","GLOBAL",1) AddExperienceParty(300) %ERASEJOURNALENTRY_10046% AddJournalEntry(@10049%QUEST_DONE%) EscapeArea()~ EXIT
END

IF ~~ THEN wife_20
SAY @89
IF ~~ THEN EXIT
END

IF ~~ THEN wife_21
SAY @90
IF ~~ THEN EXIT
END


BEGIN C#Q06002

IF ~Allegiance(Myself,ENEMY)~ THEN enemy
SAY @91
IF ~~ THEN EXIT
END

IF ~Global("C#Q06_TalkedToZombie","GLOBAL",0)~ THEN zombie
SAY @92
++ @93 + zombie_01
++ @94 + zombie_01
++ @95 DO ~SetGlobal("C#Q06_TalkedToZombie","GLOBAL",1) Enemy() Attack([PC])~ EXIT
END

IF ~~ THEN zombie_01
SAY @96
++ @97 + zombie_02
++ @98 + zombie_02
++ @99 DO ~SetGlobal("C#Q06_TalkedToZombie","GLOBAL",1) Enemy() Attack([PC])~ EXIT
END

IF ~~ THEN zombie_02
SAY @100
++ @101 + zombie_03
++ @102 DO ~SetGlobal("C#Q06_TalkedToZombie","GLOBAL",1) Enemy() Attack([PC])~ EXIT
END

IF ~~ THEN zombie_03
SAY @103
++ @104 DO ~SetGlobal("C#Q06_TalkedToZombie","GLOBAL",2)~ EXIT
++ @105 DO ~SetGlobal("C#Q06_TalkedToZombie","GLOBAL",2)~ EXIT
END

IF ~GlobalGT("C#Q06_TalkedToZombie","GLOBAL",0)~ THEN zombie_04
SAY @106
++ @107 EXIT
++ @108 DO ~Enemy() Attack([PC])~ EXIT
END


CHAIN
IF ~~ THEN C#Q06001 wife_12
 @52
== C#Q06001 @53

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @109

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @110

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @111

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @112

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @113

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @114 

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @115


== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @116

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @117

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @118 

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @119

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @120

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @121

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @122

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @123

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @124

== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @131

== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @132

== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @133

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @125

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @126

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @127

//Imoen, for Rasaad but no Ajantis in party
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @129

//Imoen, for Rasaad and Ajantis in party
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)
InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @130

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @128

== C#Q06001 @54
END
++ @55 DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",3) SetGlobal("C#Q06_Wife13","GLOBAL",1)~ + wife_13
++ @56 DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",3)~ EXIT
++ @57 DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",3)~ + wife_16
++ @58 DO ~SetGlobal("C#Q06_TalkedToWife","GLOBAL",3)~ EXIT
