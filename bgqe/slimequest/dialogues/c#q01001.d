
//slime quest (Q01)

BEGIN ~C#Q01001~

IF ~Global("C#Q01_TalkedOutside","GLOBAL",0)~ THEN alanna_talk
SAY @0
++ @1 + alanna_01
++ @2 + alanna_01
++ @3 + alanna_02
END

IF ~~ THEN alanna_01
SAY @4
IF ~~ THEN DO ~DialogInterrupt(FALSE) SetGlobal("C#Q01_TalkedToAlanna","GLOBAL",1) SetGlobal("C#Q01_TalkedOutside","GLOBAL",1) MoveToPoint([1175.1701]) DestroySelf() DialogInterrupt(TRUE)~ %UNSOLVED_JOURNAL% @10001 EXIT
END

IF ~~ THEN alanna_02
SAY @5
IF ~~ THEN DO ~DialogInterrupt(FALSE) SetGlobal("C#Q01_TalkedOutside","GLOBAL",1) MoveToPoint([1175.1701]) DestroySelf() DialogInterrupt(TRUE)~ %UNSOLVED_JOURNAL% @10002 EXIT
END

IF ~Global("C#Q01_Retransformation","GLOBAL",0) GlobalGT("C#Q01_TalkedOutside","GLOBAL",0) Global("C#Q01_TalkedToAlanna","GLOBAL",0)~ THEN alanna_please
SAY @6
++ @7 DO ~SetGlobal("C#Q01_TalkedToAlanna","GLOBAL",1)~ + alanna_03
++ @8 EXIT
END

IF ~Global("C#Q01_Retransformation","GLOBAL",0) Global("C#Q01_TalkedToAlanna","GLOBAL",1)~ THEN alanna_talk2
SAY @9
++ @10 + alanna_03
++ @8 DO ~SetGlobal("C#Q01_TalkedToAlanna","GLOBAL",0)~ EXIT
END

IF ~~ THEN alanna_03
SAY @11
IF ~~ THEN DO ~GiveItemCreate("C#Q01001",[PC],0,0,0)~ + alanna_04
END

CHAIN
IF ~~ THEN C#Q01001 alanna_04
@12

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @111

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @112

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @113

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @224

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @114

== C#Q01001 @13
= @14
END
++ @70 DO ~SetGlobal("C#Q01_TalkedToAlanna","GLOBAL",2)~ + alanna_04_2
++ @71 DO ~SetGlobal("C#Q01_TalkedToAlanna","GLOBAL",2)~ + alanna_04_1
++ @72 DO ~SetGlobal("C#Q01_TalkedToAlanna","GLOBAL",2)~ EXIT


APPEND C#Q01001

IF ~~ THEN alanna_04_1
SAY @73
++ @74 + alanna_04_2
++ @75 + alanna_04_3
++ @76 EXIT
END

END //APPEND

CHAIN
IF ~~ THEN C#Q01001 alanna_04_2
@77

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @115

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @116 

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @117

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @244

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @245

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @118

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @119

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @120

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @121

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @122

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @123

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @124

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @125

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @126

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @127

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @128

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @129

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @130

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @131

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @132

== %QUAYLE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("QUAYLE") Detect("QUAYLE") !StateCheck("QUAYLE",CD_STATE_NOTVALID)~ THEN @133

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @134

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @135 

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @136

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @137

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @138

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @139

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @140

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @141

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @225

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @226

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @227

//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @228
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @229

EXIT

APPEND C#Q01001

IF ~~ THEN alanna_04_3
SAY @78
IF ~~ THEN DO ~GiveGoldForce(30) SetGlobal("C#Q01_AlannasGold","GLOBAL",1)~ + alanna_04_2
END

IF ~Global("C#Q01_AlannaEnddialog","GLOBAL",3) Global("C#Q01_TransformationFailed","GLOBAL",1)~ THEN failed
SAY @79 
+ ~PartyHasItem("C#Q01003")~ + @80 + failed_01
++ @81 + failed_02
++ @82 + failed_03
++ @83 + failed_02
END

IF ~~ THEN failed_01
SAY @84
IF ~~ THEN DO ~	ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("C#Q01003")
	Face(10)
	Wait(1)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	Wait(1)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	ActionOverride("C#Q01003",DestroySelf())
	SetGlobal("C#Q01_Transformation","GLOBAL",1)
	EndCutSceneMode()
~ EXIT
END

IF ~~ THEN failed_02
SAY @85
+ ~PartyHasItem("C#Q01003")~ + @86 + failed_01
++ @87 + failed_03
+ ~Global("C#Q01_AlannasGold","GLOBAL",0)~ + @88 + failed_05
+ ~GlobalGT("C#Q01_AlannasGold","GLOBAL",0)~ + @88 + failed_06
END

END //APPEND

CHAIN
IF ~~ THEN C#Q01001 failed_03
@89 /*~Kiss... Kiss him? *shudder* I am pretty sure this must be a kind of joke!~ */

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @142

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @143

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @144
 
== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)
!Global("P#CoranMatch","GLOBAL",1)~ THEN @145

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @146

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @147


END
IF ~~ THEN + failed_03a

IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN EXTERN %AJANTIS_JOINED% ajantis_kissinterjection

IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN EXTERN %JAHEIRA_JOINED% JAHEIRA_kissinterjection

IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN EXTERN %DYNAHEIR_JOINED% DYNAHEIR_kissinterjection

IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) 
InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN EXTERN %RASAAD_JOINED% rasaad_kissinterjection

APPEND %AJANTIS_JOINED%
IF ~~ THEN ajantis_kissinterjection
SAY @148
IF ~~ THEN EXTERN C#Q01001 failed_04
END
END //APPEND 

CHAIN 
IF ~~ THEN %JAHEIRA_JOINED% JAHEIRA_kissinterjection
@149
== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @150
END
IF ~~ THEN EXTERN C#Q01001 failed_04


APPEND %DYNAHEIR_JOINED%
IF ~~ THEN DYNAHEIR_kissinterjection
SAY @151
IF ~~ THEN EXTERN C#Q01001 failed_04
END
END //APPEND 

APPEND %RASAAD_JOINED%
IF ~~ THEN rasaad_kissinterjection
SAY @230
IF ~~ THEN EXTERN C#Q01001 failed_04
END
END //APPEND 


APPEND C#Q01001 

IF ~~ THEN failed_03a
SAY @152
++ @90 + failed_04
+ ~PartyHasItem("C#Q01003")~ + @91 + failed_01
++ @92 + failed_07
END

IF ~~ THEN failed_04
SAY @93
IF ~Global("C#Q01_AlannasGold","GLOBAL",0)~ THEN + failed_05
IF ~GlobalGT("C#Q01_AlannasGold","GLOBAL",0)~ THEN + failed_06
END

IF ~~ THEN failed_05
SAY @94
IF ~~ THEN DO ~GiveGoldForce(30)~ + failed_06
END

END //APPEND

CHAIN
IF ~~ THEN C#Q01001 failed_06
@95

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @153

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @154

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)
PartyHasItem("C#Q01003")~ THEN @155

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @156

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @157

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @158

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @159

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @160

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @161

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @162

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @163

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @164

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @165

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @166

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @167

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @168

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @169

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @170

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @171

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @172

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @173

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @174

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @175

== %QUAYLE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("QUAYLE") Detect("QUAYLE") !StateCheck("QUAYLE",CD_STATE_NOTVALID)~ THEN @176

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @177

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @178

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @231

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @232

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @233

END
IF ~~ THEN DO ~ActionOverride("C#Q01001",TakePartyItem("C#Q01002")) AddexperienceParty(500) SetGlobal("C#Q01_Retransformation","GLOBAL",3) %ERASEJOURNALENTRY_10001% %ERASEJOURNALENTRY_10002% %ERASEJOURNALENTRY_10004% %ERASEJOURNALENTRY_10005% ActionOverride("C#Q01003",DestroySelf()) ActionOverride("C#Q01001",EscapeArea())~ %SOLVED_JOURNAL% @10006 EXIT



APPEND C#Q01001

IF ~~ THEN failed_07
SAY @97
++ @98 + failed_09
++ @99 + failed_08
++ @100 + failed_08
END

IF ~~ THEN failed_08
SAY @101
IF ~~ THEN + failed_09
END

END //APPEND

CHAIN
IF ~~ THEN C#Q01001 failed_09
@102

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @179

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @169

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @180

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @181

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @182

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @171

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @183

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @184

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @174

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @175

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @159

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @177

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @163

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @168

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @158

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @161

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @223

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @164

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @185
== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @165

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @166

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @173

== %QUAYLE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("QUAYLE") Detect("QUAYLE") !StateCheck("QUAYLE",CD_STATE_NOTVALID)~ THEN @176

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @178

//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @234
//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @235

END
IF ~~ THEN DO ~ActionOverride("C#Q01001",TakePartyItem("C#Q01002")) AddexperienceParty(500) SetGlobal("C#Q01_Retransformation","GLOBAL",4) ReputationInc(-1) %ERASEJOURNALENTRY_10001% %ERASEJOURNALENTRY_10002% %ERASEJOURNALENTRY_10004% %ERASEJOURNALENTRY_10005% ActionOverride("C#Q01003",EscapeArea()) ActionOverride("C#Q01001",EscapeArea())~ %SOLVED_JOURNAL% @10064 EXIT

APPEND C#Q01001

IF ~Global("C#Q01_Retransformation","GLOBAL",0) Global("C#Q01_TalkedToAlanna","GLOBAL",2)~ THEN alanna_return
SAY @15
+ ~!PartyHasItem("C#Q01003") PartyHasItem("C#Q01002") Global("C#Q01_TalkedToTulbor","GLOBAL",0) Global("C#Q01_AskedAboutTulbor","GLOBAL",0)~ + @68 DO ~SetGlobal("C#Q01_AskedAboutTulbor","GLOBAL",1)~ + alanna_tulbor
+ ~!PartyHasItem("C#Q01003") Global("C#Q01_TalkedToTulbor","GLOBAL",0)~ + @16 EXIT 
+ ~!PartyHasItem("C#Q01003") Global("C#Q01_TalkedToTulbor","GLOBAL",1) Global("C#Q01_AlannasGold","GLOBAL",0)~ + @17 + alanna_05
+ ~!PartyHasItem("C#Q01003") Global("C#Q01_TalkedToTulbor","GLOBAL",1) Global("C#Q01_AlannasGold","GLOBAL",1)~ + @17 + alanna_05b
+ ~!PartyHasItem("C#Q01003") Global("C#Q01_TalkedToTulbor","GLOBAL",1) Global("C#Q01_AlannasGold","GLOBAL",1)~ + @16 EXIT
+ ~!PartyHasItem("C#Q01003") Global("C#Q01_TulborNoHelp","GLOBAL",1) Global("C#Q01_TalkedToTulbor","GLOBAL",0)~ + @19 EXIT 
+ ~!PartyHasItem("C#Q01003") Global("C#Q01_BoughtAntidote","GLOBAL",1) Global("C#Q01_TalkedToTulbor","GLOBAL",2)~ + @60 EXIT
+ ~!PartyHasItem("C#Q01004") Global("C#Q01_BoughtAlternative","GLOBAL",1) Global("C#Q01_TalkedToTulbor","GLOBAL",2)~ + @60 EXIT
+ ~PartyHasItem("C#Q01003")~ + @104 + alanna_07
+ ~PartyHasItem("C#Q01004")~ + @105 + alanna_08
++ @106 EXIT
++ @107 EXIT
END

IF ~~ THEN alanna_tulbor
SAY @69
IF ~~ THEN EXIT
END

IF ~~ THEN alanna_05
SAY @20
++ @21 + alanna_06
++ @22 DO ~GiveGoldForce(30) SetGlobal("C#Q01_AlannasGold","GLOBAL",2)~ EXIT 
END

IF ~~ THEN alanna_05b
SAY @108 
IF ~~ THEN DO ~SetGlobal("C#Q01_AlannasGold","GLOBAL",2)~ EXIT 
END

IF ~~ THEN alanna_06
SAY @23
IF ~~ THEN EXIT
END

IF ~~ THEN alanna_07
SAY @109
IF ~~ THEN DO ~	ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("C#Q01003")
	MoveToPoint([312.258])
	Wait(2)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	Wait(1)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	ActionOverride("C#Q01003",DestroySelf())
	SetGlobal("C#Q01_Transformation","GLOBAL",1)
	EndCutSceneMode()
~ EXIT
END


IF ~~ THEN alanna_08
SAY @109
IF ~RandomNum(5,1)~ THEN DO ~
	ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("C#Q01004")
	MoveToPoint([312.258])
	Wait(2)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	Wait(1)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	ActionOverride("C#Q01003",DestroySelf())
	SetGlobal("C#Q01_Transformation","GLOBAL",1)
	EndCutSceneMode()
~ EXIT
IF ~RandomNum(5,2)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("C#Q01004")
	MoveToPoint([312.258])
	Wait(2)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	Wait(1)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	ForceSpellPoint([357.240],RED_SWIRL)
	Wait(1)
	ForceSpellPoint([357.240],RED_SWIRL)
	DestroySelf()
	SetGlobal("C#Q01_SlimeTransformation","GLOBAL",1)
	ReputationInc(-1) AddexperienceParty(500) 
	SetGlobal("C#Q01_Retransformation","GLOBAL",5) %ERASEJOURNALENTRY_10001% %ERASEJOURNALENTRY_10002% %ERASEJOURNALENTRY_10004% %ERASEJOURNALENTRY_10005%
	EndCutSceneMode()
ActionOverride("jaheira",LeaveParty()) ActionOverride("jaheira",Enemy())
ActionOverride("kivan",LeaveParty()) ActionOverride("kivan",Enemy())
ActionOverride("minsc",LeaveParty()) ActionOverride("minsc",Enemy())
ActionOverride("khalid",LeaveParty()) ActionOverride("khalid",Enemy())
ActionOverride("ajantis",LeaveParty()) ActionOverride("ajantis",Enemy())
ActionOverride("dynaheir",LeaveParty()) ActionOverride("dynaheir",Enemy())
ActionOverride("yeslick",LeaveParty()) ActionOverride("yeslick",Enemy())
ActionOverride("rasaad",LeaveParty()) ActionOverride("rasaad",Enemy())
~ %SOLVED_JOURNAL% @10007 EXIT
IF ~RandomNum(5,3)~ THEN DO ~
	ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("C#Q01004")
	MoveToPoint([312.258])
	Wait(2)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	Wait(1)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	SetGlobal("C#Q01_TransformationFailed","GLOBAL",1)
	Wait(2)
	EndCutSceneMode()~ EXIT
IF ~RandomNum(5,4)~ THEN DO ~ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("C#Q01004")
	MoveToPoint([312.258])
	Wait(2)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	Wait(1)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	ForceSpellPoint([357.240],RED_SWIRL)
	Wait(1)
	ForceSpellPoint([357.240],RED_SWIRL)
	DestroySelf()
	SetGlobal("C#Q01_SlimeTransformation","GLOBAL",1)
	ReputationInc(-1) AddexperienceParty(500) 
	SetGlobal("C#Q01_Retransformation","GLOBAL",5) %ERASEJOURNALENTRY_10001% %ERASEJOURNALENTRY_10002% %ERASEJOURNALENTRY_10004% %ERASEJOURNALENTRY_10005%
	EndCutSceneMode()
ActionOverride("jaheira",LeaveParty()) ActionOverride("jaheira",Enemy())
ActionOverride("kivan",LeaveParty()) ActionOverride("kivan",Enemy())
ActionOverride("minsc",LeaveParty()) ActionOverride("minsc",Enemy())
ActionOverride("khalid",LeaveParty()) ActionOverride("khalid",Enemy())
ActionOverride("ajantis",LeaveParty()) ActionOverride("ajantis",Enemy())
ActionOverride("dynaheir",LeaveParty()) ActionOverride("dynaheir",Enemy())
ActionOverride("yeslick",LeaveParty()) ActionOverride("yeslick",Enemy())
ActionOverride("rasaad",LeaveParty()) ActionOverride("rasaad",Enemy())
~ %SOLVED_JOURNAL% @10007 EXIT
IF ~RandomNum(5,5)~ THEN DO ~
	ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("C#Q01004")
	MoveToPoint([312.258])
	Wait(2)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	Wait(1)
	ActionOverride("C#Q01003",ForceSpellPoint([357.250],RED_SWIRL))
	SetGlobal("C#Q01_TransformationFailed","GLOBAL",1)
	Wait(2)
	EndCutSceneMode()~ EXIT
END

IF ~Global("C#Q01_EltoFriendly","GLOBAL",1) Global("C#Q01_Retransformation","GLOBAL",2)~ THEN alanna_end1
SAY @26
IF ~~ THEN EXIT
END

IF ~Global("C#Q01_EltoFriendly","GLOBAL",2) Global("C#Q01_Retransformation","GLOBAL",2)~ THEN alanna_end2
SAY @27
IF ~~ THEN EXIT
END

IF WEIGHT #1 ~Global("C#Q01_Eltoltdead","GLOBAL",1)~ THEN eltolth_dead
SAY @62
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

END //APPEND

CHAIN  
IF ~See("C#Q01002") Global("C#Q01_Retransformation","GLOBAL",1)~ THEN C#Q01001 happy_chain
@28
== C#Q01002 @29
== C#Q01001 @30
== C#Q01002 @31
== C#Q01001 @32
== C#Q01002 @33
== C#Q01001 @34
== C#Q01002 @35

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @186

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @112

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @187

== C#Q01001 @36
== C#Q01002 @37
= @38
= @39
== C#Q01001 @40
== C#Q01002 @41
== C#Q01001 @42
== C#Q01002 @43
== C#Q01001 @44
== C#Q01002 @45
== C#Q01001 @46
== C#Q01002 @47
= @48 
== C#Q01001 @49  
END
++ @50 DO ~SetGlobal("C#Q01_Retransformation","GLOBAL",2) 
ActionOverride("C#Q01002",TakePartyItem("C#Q01002"))~ EXTERN C#Q01002 elto_01
+ ~Gender(Player1,male)~ + @51 DO ~SetGlobal("C#Q01_Retransformation","GLOBAL",2)~ EXTERN C#Q01002 elto_03
+ ~Gender(Player1,female)~ + @52 DO ~SetGlobal("C#Q01_Retransformation","GLOBAL",2)~ EXTERN C#Q01002 elto_03
++ @53 DO ~SetGlobal("C#Q01_Retransformation","GLOBAL",2)~ EXTERN C#Q01002 elto_03

BEGIN ~C#Q01002~

IF ~Global("C#Q01_EltoFriendly","GLOBAL",1) Global("C#Q01_Retransformation","GLOBAL",2)~ THEN elto_end1
SAY @54 
IF ~~ THEN EXIT
END

IF ~Global("C#Q01_EltoFriendly","GLOBAL",2) Global("C#Q01_Retransformation","GLOBAL",2)~ THEN elto_end2
SAY @55
IF ~~ THEN EXIT
END

IF ~~ THEN elto_01
SAY @56 
IF ~~ THEN DO ~SetGlobal("C#Q01_EltoFriendly","GLOBAL",1)
//ReputationInc(1)
GiveGoldForce(200) AddexperienceParty(500)~ %SOLVED_JOURNAL% @10003 + elto_02
END

CHAIN
IF ~~ THEN C#Q01002 elto_02
@57

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @188

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @189

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @190
 
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @191

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @192

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @193

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @194

//Dorn (Kagain)
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID) InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @236 

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @195

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @196

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @197

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @198

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @199

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @200

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @201

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @163

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @202

//Neera (Dynaheir)
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID) InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @237

== %QUAYLE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("QUAYLE") Detect("QUAYLE") !StateCheck("QUAYLE",CD_STATE_NOTVALID)~ THEN @203

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @204

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @205

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @206 

//Baeloth (Viconia)
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID) InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @238

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @207

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @208

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @209

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @239

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @210

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @211

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @212

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @177

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @214

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @215

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @216

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @217

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @218

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @240 
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @243

== C#Q01002 IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @241

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @242

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @219

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @220

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @221

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @222

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @213

END
IF ~~ THEN DO ~%ERASEJOURNALENTRY_10001% %ERASEJOURNALENTRY_10002% %ERASEJOURNALENTRY_10004% %ERASEJOURNALENTRY_10005%~ EXIT


APPEND C#Q01002
IF ~~ THEN elto_03
SAY @58
++ @59 DO ~SetGlobal("C#Q01_EltoFriendly","GLOBAL",2) ActionOverride("C#Q01002",TakePartyItem("C#Q01002")) GiveGoldForce(200) AddexperienceParty(500)~ %SOLVED_JOURNAL% @10003 + elto_02
END

IF WEIGHT #1 ~Global("C#Q01_AlannaDead","GLOBAL",1)~ THEN alanna_dead
SAY @61
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

END //APPEND
