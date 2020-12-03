
//this is the .d file for C#Q01004.CRE (Tulbor, elixir vendor)
//slime quest jastey

BEGIN ~C#Q01004~

IF ~Global("C#Q01_TalkedToTulbor","GLOBAL",0)~ THEN tulbor_meeting
SAY @0
++ @1 EXIT 
+ ~GlobalGT("C#Q01_TalkedToAlanna","GLOBAL",1) Global("C#Q01_TulborNoHelp","GLOBAL",0)~ + @2 + tulbor_01
+ ~GlobalGT("C#Q01_TalkedToAlanna","GLOBAL",1) PartyHasItem("C#Q01002")~ + @3 DO ~SetGlobal("C#Q01_TulborDirektbeweis","GLOBAL",1)~ + tulbor_05
+ ~Global("C#Q01_TulborNoHelp","GLOBAL",1) !PartyHasItem("C#Q01002")~ + @4 EXIT
END

IF ~~ THEN tulbor_01
SAY @5 
++ @6 + tulbor_02
++ @7 EXIT 
END

IF ~~ THEN tulbor_02
SAY @8
+ ~!Global("C#Q01_TulborDirektbeweis","GLOBAL",1)~ + @9 DO ~SetGlobal("C#Q01_TulborPrust","GLOBAL",1)~ + tulbor_03
+ ~!Global("C#Q01_TulborDirektbeweis","GLOBAL",1)~ + @10 DO ~SetGlobal("C#Q01_TulborPrust","GLOBAL",1)~ + tulbor_03
+ ~Global("C#Q01_TulborDirektbeweis","GLOBAL",1)~ + @11 + tulbor_06
+ ~Global("C#Q01_TulborDirektbeweis","GLOBAL",1)~ + @12 + tulbor_07
END

IF ~~ THEN tulbor_03
SAY @13
= @14
++ @15 DO ~SetGlobal("C#Q01_TulborNoHelp","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10004 EXIT
+ ~PartyHasItem("C#Q01001")~ + @16 + tulbor_04
+ ~PartyHasItem("C#Q01002")~ + @17 + tulbor_05
END

IF ~~ THEN tulbor_04
SAY @18
++ @19 DO ~SetGlobal("C#Q01_TulborNoHelp","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10004 EXIT
+ ~PartyHasItem("C#Q01002")~ + @17 + tulbor_05
END

IF ~~ THEN tulbor_05
SAY @20
+ ~Global("C#Q01_TulborPrust","GLOBAL",1)~ + @11 + tulbor_06
+ ~Global("C#Q01_TulborPrust","GLOBAL",1)~ + @12 + tulbor_07
+ ~Global("C#Q01_TulborPrust","GLOBAL",0)~ + @21 + tulbor_02
END

IF ~~ THEN tulbor_06
SAY @22
IF ~~ THEN + tulbor_08
END

IF ~~ THEN tulbor_07
SAY @24
IF ~~ THEN + tulbor_08
END

IF ~~ THEN tulbor_08
SAY @25
= @26
++ @27 + tulbor_09
++ @28 + tulbor_13
END

IF ~~ THEN tulbor_09
SAY @29
= @30
+ ~PartyGoldGT(99)~ + @31 + tulbor_10
+ ~PartyGoldLT(100)~ + @32 + tulbor_14
++ @33 DO ~SetGlobal("C#Q01_OfferedAlternative","GLOBAL",1)~ + tulbor_11
END 

IF ~~ THEN tulbor_10
SAY @34
IF ~~ THEN DO ~TakePartyGold(100) SetGlobal("C#Q01_TalkedToTulbor","GLOBAL",2) GiveItemCreate("C#Q01003",[PC],1,0,0) SetGlobal("C#Q01_BoughtAntidote","GLOBAL",1)~ EXIT
END

IF ~~ THEN tulbor_11
SAY @35 
+ ~PartyGoldGT(99)~ + @50 + tulbor_10
+ ~PartyGoldLT(100)~ + @51 + tulbor_14
++ @52 DO ~SetGlobal("C#Q01_OfferedAlternative","GLOBAL",2)~ + tulbor_15
END

IF ~~ THEN tulbor_12
SAY @38
IF ~~ THEN DO ~SetGlobal("C#Q01_TalkedToTulbor","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10005 EXIT
END

IF ~~ THEN tulbor_13
SAY @39
IF ~~ THEN + tulbor_09
END

IF ~~ THEN tulbor_14
SAY @40
IF ~Global("C#Q01_TalkedToTulbor","GLOBAL",0)~ THEN DO ~SetGlobal("C#Q01_TalkedToTulbor","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10005 EXIT
IF ~GlobalGT("C#Q01_TalkedToTulbor","GLOBAL",0)~ THEN EXIT
END

IF ~Global("C#Q01_TalkedToTulbor","GLOBAL",1)~ THEN tulbor_elixir
SAY @41
+ ~PartyGoldGT(99) Global("C#Q01_BoughtAntidote","GLOBAL",0)~ + @36 + tulbor_10
+ ~Global("C#Q01_OfferedAlternative","GLOBAL",0)~ + @42 DO ~SetGlobal("C#Q01_OfferedAlternative","GLOBAL",1)~ + tulbor_11
+ ~Global("C#Q01_OfferedAlternative","GLOBAL",1)~ + @53 DO ~SetGlobal("C#Q01_OfferedAlternative","GLOBAL",2)~ + tulbor_15
+ ~PartyGoldGT(19) Global("C#Q01_BoughtAlternative","GLOBAL",0) Global("C#Q01_OfferedAlternative","GLOBAL",2)~ + @54 + tulbor_17
++ @100 EXIT
END

IF ~Global("C#Q01_TalkedToTulbor","GLOBAL",2)~ THEN tulbor_finished
SAY @56
+ ~GlobalGT("C#Q01_TransformationFailed","GLOBAL",0) Global("C#Q01_PCComplaint","LOCALS",0)~ + @57 DO ~SetGlobal("C#Q01_PCComplaint","LOCALS",1)~ + tulbor_finished_04
+ ~GlobalLT("C#Q01_Retransformation","GLOBAL",2) Global("C#Q01_BoughtAlternative","GLOBAL",0) Global("C#Q01_OfferedAlternative","GLOBAL",1)~ + @53 DO ~SetGlobal("C#Q01_OfferedAlternative","GLOBAL",2)~ + tulbor_15
+ ~GlobalLT("C#Q01_Retransformation","GLOBAL",2) PartyGoldGT(19) Global("C#Q01_BoughtAlternative","GLOBAL",0) Global("C#Q01_OfferedAlternative","GLOBAL",2)~ + @58 + tulbor_17
+ ~GlobalLT("C#Q01_Retransformation","GLOBAL",2) PartyGoldGT(99) Global("C#Q01_BoughtAntidote","GLOBAL",0)~ + @59 + tulbor_10
+ ~Global("C#Q01_BoughtAntidote","GLOBAL",1) PartyHasItem("C#Q01003")~ + @60 + tulbor_19
+ ~GlobalGT("C#Q01_Retransformation","GLOBAL",1)~ + @61 + tulbor_finished_01
++ @62 EXIT
END

IF ~~ THEN tulbor_finished_01
SAY @63
+ ~PartyHasItem("C#Q01001")~ + @64 + tulbor_finished_02
+ ~!PartyHasItem("C#Q01001")~ + @65 + tulbor_finished_03
++ @66 + tulbor_finished_03
END

IF ~~ THEN tulbor_finished_02
SAY @67
IF ~~ THEN DO ~GiveItemCreate("%tutu_var%POTN08",[PC],1,0,0) TakePartyItem("C#Q01001") SetGlobal("C#Q01_TalkedToTulbor","GLOBAL",4) EscapeArea()~ EXIT
END

IF ~~ THEN tulbor_finished_03
SAY @68
IF ~~ THEN DO ~SetGlobal("C#Q01_TalkedToTulbor","GLOBAL",3)~ EXIT
END

IF ~~ THEN tulbor_finished_04
SAY @69
IF ~~ THEN EXIT
END

IF ~Global("C#Q01_TalkedToTulbor","GLOBAL",3)~ THEN tulbor_finished_05
SAY @70
+ ~PartyHasItem("C#Q01001")~ + @71 + tulbor_finished_02
+ ~!PartyHasItem("C#Q01001")~ + @72 + tulbor_finished_03
+ ~PartyHasItem("C#Q01001")~ + @72 + tulbor_finished_03
END

CHAIN 
IF ~~ THEN C#Q01004 tulbor_15
@73
END
++ @74 + tulbor_16
+ ~PartyGoldGT(99) Global("C#Q01_BoughtAntidote","GLOBAL",0)~ + @75 + tulbor_10
+ ~PartyGoldLT(100) Global("C#Q01_BoughtAntidote","GLOBAL",0)~ + @76 + tulbor_14
+ ~PartyGoldGT(19)~ + @77 + tulbor_17
+ ~PartyGoldLT(20)~ + @78 + tulbor_14
++ @66 + tulbor_14
++ @79 + tulbor_14


APPEND C#Q01004

IF ~~ THEN tulbor_16
SAY @80
+ ~PartyGoldGT(99) Global("C#Q01_BoughtAntidote","GLOBAL",0)~ + @75 + tulbor_10
+ ~PartyGoldLT(100) Global("C#Q01_BoughtAntidote","GLOBAL",0)~ + @76 + tulbor_14
+ ~PartyGoldGT(19)~ + @81 + tulbor_17
+ ~PartyGoldLT(20)~ + @78 + tulbor_14
++ @66 + tulbor_14
++ @79 + tulbor_14
END


IF ~~ THEN tulbor_18
SAY @83
++ @84 + tulbor_14
+ ~PartyGoldGT(99)~ + @31 + tulbor_10
+ ~PartyGoldLT(100)~ + @32 + tulbor_14
END


IF ~~ THEN tulbor_19
SAY @85
+ ~GlobalLT("C#Q01_Retransformation","GLOBAL",2) Global("C#Q01_BoughtAlternative","GLOBAL",1)~ + @86 EXIT
+ ~GlobalLT("C#Q01_Retransformation","GLOBAL",2) PartyGoldGT(19) Global("C#Q01_BoughtAlternative","GLOBAL",0) Global("C#Q01_OfferedAlternative","GLOBAL",0)~ + @87 + tulbor_20
+ ~GlobalLT("C#Q01_Retransformation","GLOBAL",2) PartyGoldGT(19) Global("C#Q01_BoughtAlternative","GLOBAL",0) Global("C#Q01_OfferedAlternative","GLOBAL",2)~ + @88 + tulbor_17
++ @89 EXIT
END

IF ~~ THEN tulbor_20
SAY @90
IF ~~ THEN DO ~SetGlobal("C#Q01_OfferedAlternative","GLOBAL",2)~ + tulbor_15
END

END 

CHAIN 
IF ~~ THEN C#Q01004 tulbor_17
@82

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @101

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @102

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @103

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @104

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @105

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @106

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @107

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @108

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @111

//Neera, for Melicamp the chicken
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)
PartyHasItem("MISC49")~ THEN @112

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @113

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @109

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @110
END

IF ~Global("C#Q01_BoughtAntidote","GLOBAL",0)~ THEN DO ~ActionOverride("C#Q01004",TakePartyGold(20)) 
GiveItemCreate("C#Q01004",[PC],1,0,0)
SetGlobal("C#Q01_TalkedToTulbor","GLOBAL",2) SetGlobal("C#Q01_BoughtAlternative","GLOBAL",1)~ + tulbor_18
IF ~Global("C#Q01_BoughtAntidote","GLOBAL",1)~ THEN DO ~ActionOverride("C#Q01004",TakePartyGold(20)) 
GiveItemCreate("C#Q01004",[PC],1,0,0)
SetGlobal("C#Q01_TalkedToTulbor","GLOBAL",2) SetGlobal("C#Q01_BoughtAlternative","GLOBAL",1)~ EXIT
