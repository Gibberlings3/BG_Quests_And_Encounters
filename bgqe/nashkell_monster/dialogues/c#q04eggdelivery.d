/* Extention to the Nashkel_Monster quest : Where did the other egg go? */

/* The man that trains baby wyvern in the Cloakwood cave */

I_C_T %tutu_var%COKSMTH 3 C#Q04_WyvernDeliverer
== %tutu_var%COKSMTH @0
END

I_C_T %tutu_var%COKSMTH 5 C#Q04_WyvernDeliverer
== %tutu_var%COKSMTH @0
END

I_C_T %tutu_var%COKSMTH 6 C#Q04_WyvernDeliverer
== %tutu_var%COKSMTH @0
END



/* delivery man. AR1603 (cave cloakwood forest). Item name of head stone: c#q04001 and c#q04002, respectively.
Wraith Spider: %tutu_var%SPIDWR
*/

BEGIN C#Q04008

IF ~True()~ THEN delivery
SAY @1
++ @2 + delivery_02
++ @3 + delivery_04
++ @4 + delivery_01
++ @5 + delivery_03
++ @6 + delivery_00
END

IF ~~ THEN delivery_00
SAY @7
IF ~~ THEN DO ~SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",2) 
ActionOverride("C#Q04008",Enemy()) 
ActionOverride("C#Q04008",EscapeArea())~ EXIT
END

IF ~~ THEN delivery_01
SAY @8
IF ~~ THEN + delivery_04
END

IF ~~ THEN delivery_02
SAY @9
IF ~~ THEN + delivery_04
END

IF ~~ THEN delivery_03
SAY @10
IF ~~ THEN + delivery_04
END

IF ~~ THEN delivery_04
SAY @11
= @12
+ ~GlobalGT("C#Q04_ArnimAndWyrm","GLOBAL",0)~ + @13 + delivery_06
+ ~GlobalGT("C#Q04_ArnimAndWyrm","GLOBAL",0)~ + @14 + delivery_09
+ ~Global("C#Q04_ArnimAndWyrm","GLOBAL",0)~ + @15 + delivery_06a
++ @16 + delivery_08
++ @17 + delivery_05
END

IF ~~ THEN delivery_05
SAY @18
IF ~~ THEN + delivery_07a
END


IF ~~ THEN delivery_06
SAY @19
IF ~~ THEN + delivery_07
END

IF ~~ THEN delivery_06a
SAY @20
IF ~~ THEN + delivery_07
END

IF ~~ THEN delivery_07
SAY @21
IF ~~ THEN + delivery_07a
END

IF ~~ THEN delivery_07a
SAY @22
++ @23 + delivery_10
++ @24 + delivery_11
++ @25 + delivery_12
END

IF ~~ THEN delivery_08
SAY @26
IF ~~ THEN + delivery_07
END

IF ~~ THEN delivery_09
SAY @27
IF ~~ THEN + delivery_07
END

IF ~~ THEN delivery_10
SAY @28
IF ~~ THEN + delivery_12
END

IF ~~ THEN delivery_11
SAY @29
IF ~~ THEN + delivery_12
END


CHAIN
IF ~~ THEN C#Q04008 delivery_12
@30
= @31

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @33

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
GlobalGT("C#Q04_ArnimAndWyrm","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @34

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
GlobalGT("C#Q04_ArnimAndWyrm","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @35

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
GlobalGT("C#Q04_ArnimAndWyrm","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @36 

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
GlobalGT("C#Q04_ArnimAndWyrm","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @37

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @38

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @39

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @40

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @41

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @115

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @117

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @42

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q04_ArnimAndWyrm","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @43

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @44

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @45

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @46

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @47

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @48

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @49

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @50

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @51

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @52

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @53

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @54

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @55

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @56

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @57

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @58

== %QUAYLE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("QUAYLE") Detect("QUAYLE") !StateCheck("QUAYLE",CD_STATE_NOTVALID)~ THEN @59

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @60

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @61

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @62

//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @119

== C#Q04008 @32
END
IF ~~ THEN DO ~GiveItemCreate("C#Q04001",[PC],0,0,0)
SetGlobalTimer("c#q04_SpiderTimer","GLOBAL",TWELVE_DAYS)
SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",3)
ActionOverride("C#Q04008",EscapeArea())~ %UNSOLVED_JOURNAL% @10033 EXIT

IF ~InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN DO ~GiveItemCreate("C#Q04001",[PC],0,0,0)
SetGlobalTimer("c#q04_SpiderTimer","GLOBAL",TWELVE_DAYS)
SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",3)
ActionOverride("C#Q04008",EscapeArea())~ %UNSOLVED_JOURNAL% @10067 EXIT

IF ~InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN DO ~GiveItemCreate("C#Q04001",[PC],0,0,0)
SetGlobalTimer("c#q04_SpiderTimer","GLOBAL",TWELVE_DAYS)
SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",3)
ActionOverride("C#Q04008",EscapeArea())~ %UNSOLVED_JOURNAL% @10067 EXIT


/* Mage, near Fishing Village, or in front of BG bridge? 
created if Global("C#Q04_WyvernDeliverer","GLOBAL",3)
*/

BEGIN C#Q04007

IF ~True()~ THEN mage
SAY @63
++ @64 + mage_01
++ @65 + mage_01
++ @66 + mage_01
++ @67 + mage_01
END

IF ~~ THEN mage_01
SAY @68
= @69
= @70
IF ~~ THEN DO ~SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",5)
ActionOverride("C#Q04007",EscapeArea())~ %UNSOLVED_JOURNAL% @10031 EXIT
END



/* addition of the reply option to the magic shop in E BG 


// c#q04cut.baf - "fade to black". -> not for BG1. Halbaz has no DV!!

IF
    True()
THEN
    RESPONSE #100
        CutSceneId(Player1)
        FadeToColor([20.0],0)
        Wait(5)
        FadeFromColor([20.0],0)
	EndcutSceneMode()
        ActionOverride("%tutu_var%HALBAZ",StartDialogueNoSet(Player1))
END 

*/

EXTEND_BOTTOM %tutu_var%HALBAZ 0
+ ~PartyHasItem("C#Q04001")~ + @72 + egg
END

EXTEND_BOTTOM %tutu_var%HALBAZ 1
+ ~PartyHasItem("C#Q04001")~ + @72 + egg
END

APPEND %tutu_var%HALBAZ //

IF WEIGHT #-1
~Global("C#Q04_WyvernDeliverer","GLOBAL",6)
PartyHasItem("C#Q04001")~ THEN egg_inside
SAY @73
+ ~PartyGoldGT(1199)~ + @74 + egg_04
+ ~PartyGoldLT(1200)~ + @75 + egg_02
++ @76 EXIT
END


IF ~~ THEN egg
SAY @77
= @78
= @79
+ ~PartyGoldGT(1199)~ + @80 + egg_04
+ ~PartyGoldLT(1200)~ + @81 + egg_02
++ @82 + egg_01
END

IF ~~ THEN egg_01
SAY @83
IF ~~ THEN + egg_03
END

IF ~~ THEN egg_02
SAY @84
IF ~~ THEN + egg_03
END

IF ~~ THEN egg_03
SAY @85
IF ~~ THEN DO ~SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",6)~ EXIT
END


IF ~~ THEN egg_04
SAY @86
= @118
= @103
= @87
IF ~~ THEN DO ~TakePartyGold(1200)
TakePartyItem("c#q04001")
DestroyItem("c#q04001")
GiveItemCreate("C#Q04002",[PC],0,0,0) 
SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",8) %ERASEJOURNALENTRY_10031% %ERASEJOURNALENTRY_10033% %ERASEJOURNALENTRY_10067%~
%SOLVED_JOURNAL% @10032 EXIT
END

END //APPEND

/* Thalantyr 
BGT: state 35 covered in extra file
*/
EXTEND_BOTTOM %tutu_var%THALAN 1
+ ~PartyHasItem("C#Q04001") Global("C#Q04_ThalantyrSpider","LOCALS",0)~ + @72 + thalantyr
+ ~PartyHasItem("C#Q04001") Global("C#Q04_ThalantyrSpider","LOCALS",1)~ + @102 + thalantyr_06

END

APPEND %tutu_var%THALAN
IF ~~ THEN thalantyr
SAY @89
++ @90 + thalantyr_02
++ @91 + thalantyr_03
++ @92 + thalantyr_01
END

IF ~~ THEN thalantyr_01
SAY @93
IF ~~ THEN + thalantyr_04
END

IF ~~ THEN thalantyr_02
SAY @94
IF ~~ THEN + thalantyr_04
END

IF ~~ THEN thalantyr_03
SAY @95
++ @90 + thalantyr_02
++ @92 + thalantyr_01
END

END //APPEND

CHAIN
IF ~~ THEN %tutu_var%THALAN thalantyr_04
@96 DO ~SetGlobal("C#Q04_ThalantyrSpider","LOCALS",1)~
== %tutu_var%MELICA IF ~See("Melicamp") !Dead("Melicamp") !StateCheck("Melicamp",CD_STATE_NOTVALID)~ THEN @97
== %tutu_var%THALAN IF ~See("Melicamp") !Dead("Melicamp") !StateCheck("Melicamp",CD_STATE_NOTVALID)~ THEN @98
== %tutu_var%MELICA IF ~See("Melicamp") !Dead("Melicamp") !StateCheck("Melicamp",CD_STATE_NOTVALID)~ THEN @99
== %tutu_var%THALAN IF ~See("Melicamp") !Dead("Melicamp") !StateCheck("Melicamp",CD_STATE_NOTVALID)~ THEN @100
END
++ @102 + thalantyr_06
++ @101 EXIT


APPEND %tutu_var%THALAN
IF ~~ THEN thalantyr_05
SAY @104
IF ~~ THEN EXIT
END

IF ~~ THEN thalantyr_06
SAY @105
++ @106 + thalantyr_10
++ @107 + thalantyr_08
+ ~Global("C#Q04_WyvernDeliverer","GLOBAL",6)~ + @108 + thalantyr_07
++ @109 + thalantyr_05
END

IF ~~ THEN thalantyr_07
SAY @110
IF ~~ THEN + thalantyr_09
END

IF ~~ THEN thalantyr_08
SAY @111
IF ~~ THEN + thalantyr_09
END

IF ~~ THEN thalantyr_09
SAY @112
++ @113 + thalantyr_10
++ @109 + thalantyr_05
END

IF ~~ THEN thalantyr_10
SAY @114
IF ~~ THEN DO ~TakePartyItem("c#q04001")
DestroyItem("c#q04001")
SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",9) %ERASEJOURNALENTRY_10031% %ERASEJOURNALENTRY_10033% %ERASEJOURNALENTRY_10067%~ %SOLVED_JOURNAL% @10034 EXIT
END

END //APPEND

BEGIN C#Q04009

IF WEIGHT #-1
~Global("C#Q04_WyvernDeliverer","GLOBAL",10)~ THEN hereiam
SAY @116
IF ~~ THEN DO ~SetGlobal("C#Q04_WyvernDeliverer","GLOBAL",11)
%ERASEJOURNALENTRY_10031%
%ERASEJOURNALENTRY_10033% 
%ERASEJOURNALENTRY_10067%
AddJournalEntry(@10035%QUEST_DONE%)
CreateCreature("C#Q04009",[-1.-1]%FACE_0%)~ EXIT
END
