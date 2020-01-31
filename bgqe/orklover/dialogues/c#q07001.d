/* NPC reactions 
For the half-orc, they could comment on his appearance after the first meeting, on his being engaged to a woman of BG city, and at the end to the false orc-attack rumors. */

BEGIN C#Q07001

IF ~Global("C#Q07_TalkedToHim","GLOBAL",0)~ THEN road
SAY @0
++ @1 DO ~SetGlobal("C#Q07_TalkedToHim","GLOBAL",1)~ + road_01
++ @2 DO ~SetGlobal("C#Q07_TalkedToHim","GLOBAL",1)~ + road_01
++ @3 DO ~SetGlobal("C#Q07_TalkedToHim","GLOBAL",1)~ + road_02
END

IF ~~ THEN road_01
SAY @4
IF ~~ THEN + road_01_b
IF ~%PC_HALFORC%~ THEN + road_01_a
END

IF ~~ THEN road_01_a
SAY @120
IF ~~ THEN + road_01_b
END

IF ~~ THEN road_01_b
SAY @5
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN road_02
SAY @6
++ @7 + road_01
++ @8 DO ~SetGlobal("C#Q07_TalkedToHim","GLOBAL",3) Enemy() Attack([PC])~ EXIT
END

IF ~Dead("C#Q07002")~ THEN viola_dead
SAY @67
IF ~~ THEN DO ~Enemy() Attack([PC])~ EXIT
END

IF ~Dead("C#Q07003")~ THEN mother_dead
SAY @68
IF ~~ THEN DO ~Enemy() Attack([PC])~ EXIT
END

IF ~Dead("C#Q07004")~ THEN father_dead
SAY @68
IF ~~ THEN DO ~Enemy() Attack([PC])~ EXIT
END

IF ~Global("C#Q07_TalkedToHim","GLOBAL",1)~ THEN inn
SAY @9
++ @10 DO ~SetGlobal("C#Q07_TalkedToHim","GLOBAL",2)~ + inn_01a
++ @11 DO ~SetGlobal("C#Q07_TalkedToHim","GLOBAL",2)~ + inn_01b
++ @12 DO ~SetGlobal("C#Q07_TalkedToHim","GLOBAL",2)~ + inn_01
++ @13 EXIT 
END

IF ~~ THEN inn_01
SAY @14
IF ~~ THEN + inn_01b
END 

IF ~~ THEN inn_01a
SAY @15
IF ~~ THEN + inn_01b
END 

IF ~~ THEN inn_01b
SAY @16
++ @17 + inn_02
++ @18 + inn_02
++ @13 EXIT 
END

IF ~~ THEN inn_02
SAY @19
++ @20 + inn_03
++ @21 + inn_04
++ @13 EXIT 
END

IF ~~ THEN inn_03
SAY @22
IF ~~ THEN + inn_04
END

IF ~~ THEN inn_04
SAY @23
++ @24 + inn_06
++ @25 + inn_06
++ @26 + inn_06
++ @27 + inn_05
++ @28 + inn_05
++ @13 EXIT 
END

IF ~~ THEN inn_05
SAY @29 
IF ~~ THEN + inn_07
END

IF ~~ THEN inn_06
SAY @30
IF ~~ THEN + inn_07
END

IF ~~ THEN inn_07
SAY @31
IF ~~ THEN EXIT
END

IF ~Global("C#Q07_TalkedToHim","GLOBAL",2)~ THEN inn_08
SAY @32
= @33
+ ~Gender(Player1,FEMALE)~ + @34 + inn_14
++ @35 + inn_15
++ @36 + inn_15
++ @37 + inn_09
++ @38 + inn_11
++ @39 + inn_12
++ @13 + inn_13
END

IF ~~ THEN inn_09
SAY @40
IF ~~ THEN + inn_10
END




//-----------------------------------------------------------------------------

APPEND C#Q07001

IF ~~ THEN inn_11
SAY @43
IF ~~ THEN + inn_10
END

IF ~~ THEN inn_12
SAY @44
IF ~~ THEN + inn_10
END

IF ~~ THEN inn_13
SAY @45
IF ~~ THEN + inn_10
END

IF ~~ THEN inn_14
SAY @46
IF ~~ THEN + inn_10
END

IF ~~ THEN inn_15
SAY @47
IF ~~ THEN + inn_10
END

END //APPEND

BEGIN C#Q07002

IF ~True()~ THEN viola
SAY @48
IF ~~ THEN EXIT
END

BEGIN C#Q07003

IF ~Dead("C#Q07001")~ THEN mother_ulguth_dead
SAY @69
IF ~~ THEN EXIT
END

IF ~Global("C#Q07_HeardRumour","GLOBAL",0)~ THEN mother
SAY @49
IF ~~ THEN EXIT
END

IF ~GlobalGT("C#Q07_HeardRumour","GLOBAL",0)~ THEN mother_01
SAY @66
IF ~Global("C#Q07_HeardRumour","GLOBAL",2)~ THEN EXIT
IF ~Global("C#Q07_HeardRumour","GLOBAL",1)~ THEN EXTERN C#Q07004 father_00
END

BEGIN C#Q07004

IF ~Dead("C#Q07001")~ THEN father_ulguth_dead
SAY @70
IF ~~ THEN EXIT
END

IF ~Global("C#Q07_HeardRumour","GLOBAL",0)~ THEN father
SAY @50
IF ~~ THEN EXIT
END


IF ~Global("C#Q07_HeardRumour","GLOBAL",1)~ THEN father_00
SAY @51
++ @52 + father_01
++ @53 + father_01
++ @54 EXIT
END

IF ~~ THEN father_01
SAY @55
IF ~~ THEN DO ~%ERASEJOURNALENTRY_10052% AddJournalEntry(@10051%QUEST_DONE%)~ + father_02
END

IF ~~ THEN father_02
SAY @57
= @58
++ @59 EXIT
++ @60 + father_03
++ @61 EXIT
END

IF ~~ THEN father_03
SAY @62
IF ~~ THEN DO ~SetGlobal("C#Q07_HeardRumour","GLOBAL",2)~ EXIT
END

IF ~Global("C#Q07_HeardRumour","GLOBAL",2)~ THEN father_04
SAY @63
IF ~~ THEN EXIT
END

BEGIN C#Q07005

IF ~True()~ THEN rumour
SAY @64
IF ~~ THEN DO ~SetGlobal("C#Q07_HeardRumour","GLOBAL",1) EscapeArea()~ %UNSOLVED_JOURNAL% @10052 EXIT
END



//----------------------------------------------------------------------------

CHAIN
IF ~~ THEN C#Q07001 inn_10
@41
= @42 
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @71
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @72
== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @73
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @74
== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @75
== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @76
== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @77
== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @78
== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @79
== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @80
== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @81
== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @82
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @83
== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @84
== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @85
== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @86 
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @87
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @88
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @89
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @90
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)
InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @91
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)
InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @92
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)
InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @93
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)
InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @94
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)
InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @95
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @96
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @97
== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @98
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @99
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @100
== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @101
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @102
== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @103
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @104
== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @105
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @106
== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @107
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @108
== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @109
== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @110
== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @111
== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @112
== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @113
== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @114
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID) InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @115
== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)
InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @116
== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @117
== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @118

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @119
END

IF ~~ THEN DO ~SetGlobal("C#Q07_TalkedToHim","GLOBAL",3) AddExperienceParty(300) SetGlobalTimer("C#Q07_TalkedToHimT","GLOBAL",THREE_DAYS) ActionOverride("C#Q07001",EscapeArea())~ EXIT
