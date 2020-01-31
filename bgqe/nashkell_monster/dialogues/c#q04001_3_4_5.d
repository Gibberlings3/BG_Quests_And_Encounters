BEGIN C#Q04001

IF ~Global("C#Q04_InsideCreationAfter","GLOBAL",1)~ THEN end
SAY @54
IF ~~ THEN EXIT
END

CHAIN
IF ~Global("C#Q04_ArnimAndWyrm","GLOBAL",1)~ THEN C#Q04001 help
@0
== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @59
END
IF ~~ THEN DO ~SetGlobalTimer("C#Q04_ArnimAndWyrmT","GLOBAL",5) SetGlobal("C#Q04_ArnimAndWyrm","GLOBAL",2)  SetGlobal("C#Q04_CreateWyrm","GLOBAL",1) ActionOverride("C#Q04001",EscapeArea())~ %UNSOLVED_JOURNAL% @10026 EXIT


BEGIN C#Q04003

IF ~Global("C#Q04_InsideCreationAfter","GLOBAL",1)~ THEN mother_end
SAY @55
IF ~Global("C#Q04_StartTimer","GLOBAL",1)~ THEN EXIT
IF ~Global("C#Q04_StartTimer","GLOBAL",0)~ THEN + mother_end_01
END


IF ~Global("C#Q04_ArnimAndWyrm","GLOBAL",0)~ THEN mother_before
SAY @56 
IF ~~ THEN EXIT
END


IF ~~ THEN mother_end_01
SAY @57
IF ~~ THEN DO ~SetGlobalTimer("C#Q04_ReturnTimer","GLOBAL",ONE_DAY) SetGlobal("C#Q04_StartTimer","GLOBAL",1)~ EXIT
END

IF ~~ THEN mother_01
SAY @2
++ @3 EXTERN C#Q04005 soldier1_03
++ @4 EXTERN C#Q04005 soldier1_02
END

BEGIN C#Q04004

IF ~Global("C#Q04_ArnimAndWyrm","GLOBAL",0)~ THEN father_before
SAY @58
IF ~~ THEN EXIT
END

IF ~~ THEN father_01
SAY @5
++ @6 EXTERN C#Q04003 mother_01
++ @4 EXTERN C#Q04005 soldier1_02
END

IF ~~ THEN father_02
SAY @7
++ @6 EXTERN C#Q04003 mother_01 
++ @4 EXTERN C#Q04005 soldier1_02
END

IF ~~ THEN father_03
SAY @8
++ @9 + father_04
+ ~PartyHasItem("c#q04003")~ + @104 EXTERN C#Q04005 soldier1_05
++ @4 EXTERN C#Q04005 soldier1_02
END

IF ~~ THEN father_04
SAY @10
++ @11 + father_05
++ @4 EXTERN C#Q04005 soldier1_02
END



BEGIN C#Q04005 

IF ~~ THEN soldier1_01
SAY @12
++ @13 EXTERN C#Q04004 father_01
++ @14 EXTERN C#Q04004 father_02
++ @4 + soldier1_02
END

IF ~~ THEN soldier1_02
SAY @15
IF ~~ THEN DO ~SetGlobal("C#Q04_ArnimAndWyrm","GLOBAL",5) SetGlobal("C#Q03_NashkellMonster","GLOBAL",1) %ERASEJOURNALENTRY_10026%~ %SOLVED_JOURNAL% @10028 EXIT 
END

IF ~~ THEN soldier1_03
SAY @17
++ @18 EXTERN C#Q04001 son_01
++ @19 + soldier1_02
++ @4 + soldier1_02
END 

/* soldier1_04 : below */

IF ~~ THEN soldier1_05
SAY @105
IF ~~ THEN EXTERN C#Q04004 father_05
END


CHAIN
IF ~Global("C#Q04_ArnimAndWyrm","GLOBAL",4)~ THEN C#Q04003 mother
@20
== C#Q04001 IF ~Gender(Player1,FEMALE)~ THEN @21
== C#Q04001 IF ~Gender(Player1,MALE)~ THEN @22
== C#Q04003 @23
== C#Q04005 @24
END
++ @25 EXTERN C#Q04005 soldier1_01
++ @26 EXTERN C#Q04004 father_01
++ @14 EXTERN C#Q04004 father_02
++ @4 EXTERN C#Q04005 soldier1_02

CHAIN
IF ~~ THEN C#Q04001 son_01
@27
== C#Q04004 @28
== C#Q04005 IF ~Gender(Player1,MALE)~ THEN @29
== C#Q04005 IF ~Gender(Player1,FEMALE)~ THEN @30
== C#Q04003 @31
== C#Q04004 @32
END
++ @33 EXTERN C#Q04004 father_03
++ @34 EXTERN C#Q04004 father_03
++ @4 EXTERN C#Q04005 soldier1_02

CHAIN
IF ~~ THEN C#Q04004 father_05
@35
= @36
== C#Q04001 @37
== C#Q04001 @38

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @60

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)
Global("C#Q04_WyvernDeliverer","GLOBAL",0)~ THEN @61

== C#Q04003 @39
== C#Q04004 @40
== C#Q04003 @41
== C#Q04005 @42
== C#Q04004 @43
== C#Q04005 @44
== C#Q04003 @45
== C#Q04004 @46
== C#Q04005 @47
END
++ @48 %SOLVED_JOURNAL% @10029 EXTERN C#Q04005 soldier1_04
++ @50 %SOLVED_JOURNAL% @10029 EXTERN C#Q04005 soldier1_04
++ @51 EXTERN C#Q04005 soldier1_02




CHAIN
IF ~~ THEN C#Q04005 soldier1_04
@52
== C#Q04004 @53 

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @62

== C#Q04004 IF ~InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @63

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @64 

== C#Q04005 @65

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @66

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @67

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @68

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @69

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @99

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @100

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @70


//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @101

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @102


== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @71

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @103

== %QUAYLE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("QUAYLE") Detect("QUAYLE") !StateCheck("QUAYLE",CD_STATE_NOTVALID)~ THEN @72

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @73

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @74

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @75

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @76

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @77

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @78

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @79

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @80

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @81

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @82

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @83

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @84

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @85

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @86

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @87

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @88

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @89

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @90

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @91

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @92
= @93

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @94

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @95

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @96

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID) Global("C#Q04_WyvernDeliverer","GLOBAL",0)~ THEN @97

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID) GlobalGT("C#Q04_WyvernDeliverer","GLOBAL",0)~ THEN @98

END
IF ~~ THEN DO ~SetGlobal("C#Q04_ArnimAndWyrm","GLOBAL",5) AddExperienceParty(300) %ERASEJOURNALENTRY_10026% ActionOverride("C#Q04001",EscapeArea()) 
ActionOverride("C#Q04003",EscapeArea())
ActionOverride("C#Q04005",EscapeArea())
ActionOverride("C#Q04006",EscapeArea()) 
ActionOverride("C#Q04004",EscapeArea())~ EXIT

