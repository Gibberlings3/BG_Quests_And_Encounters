BEGIN C#Q05001 //Dauron

IF ~Allegiance(Myself,[ENEMY])~ THEN feindlich
SAY @0
IF ~~ THEN EXIT
END

IF ~Global("C#Q05_PeopleTalk1","GLOBAL",2) Global("C#Q05_RumourTalk","GLOBAL",0)~ THEN paladin_00
SAY @111
++ @112 DO ~SetGlobal("C#Q05_RumourTalk","GLOBAL",1)~ + paladin_12
++ @113 + paladin_14
++ @114 EXIT
END

IF ~True()~ THEN paladin
SAY @1
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2) GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ + @2 + paladin_10
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2) GlobalGT("C#Q05_TalkedToMother","GLOBAL",0) Global("C#Q05_TalkedToNanny","GLOBAL",1)~ + @3 + paladin_11
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",0)~ + @4 DO ~SetGlobal("C#Q06_TalkedToPaladin","GLOBAL",1)~ + paladin_02
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",1)~ + @5 + paladin_05
++ @6 EXIT 
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2)~ + @115 + paladin_13
+ ~!Global("C#Q06_TalkedToPaladin","GLOBAL",0)~ + @7 + paladin_01
END

IF ~~ THEN paladin_01
SAY @8
IF ~~ THEN EXIT
END

IF ~~ THEN paladin_02
SAY @9
++ @10 + paladin_04
++ @11 + paladin_03
++ @12 + paladin_01
END

IF ~~ THEN paladin_03
SAY @13
++ @10 + paladin_04
++ @12 + paladin_01
END

IF ~~ THEN paladin_04
SAY @14
++ @15 + paladin_05
++ @16 EXIT
++ @7 + paladin_01
END

IF ~~ THEN paladin_05
SAY @17
++ @18 DO ~SetGlobal("C#Q06_TalkedToPaladin","GLOBAL",2)~ %UNSOLVED_JOURNAL% @10037 + paladin_06
++ @16 EXIT
++ @7 + paladin_01
END

CHAIN 
IF ~~ THEN C#Q05001 paladin_06
@20
== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @137

== C#Q05001 IF ~InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @138
END
++ @21 + paladin_07
++ @22 EXIT 
++ @23 + paladin_01


APPEND C#Q05001

IF ~~ THEN paladin_07
SAY @24
++ @25 + paladin_09
++ @26 + paladin_08
++ @27 EXIT
END



IF ~~ THEN paladin_08
SAY @28
IF ~~ THEN EXIT
END

IF ~~ THEN paladin_09
SAY @29
IF ~~ THEN EXIT
END

IF ~~ THEN paladin_10
SAY @30
IF ~~ THEN EXIT
END

END //APPEND

CHAIN
IF ~~ THEN C#Q05001 paladin_11
@31
= @32

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN  @139

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @140

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @141

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @142

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @143

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @144

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @145

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @146

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @147

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN  @148

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @149

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN  @150

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @151

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @152

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @153

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @154

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @163 

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @180

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @181   

 //Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @182 

//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @183  

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @164

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @165
END
IF ~~ THEN DO ~%ERASEJOURNALENTRY_10038% 
%ERASEJOURNALENTRY_10039%
%ERASEJOURNALENTRY_10040%
%ERASEJOURNALENTRY_10041%
%ERASEJOURNALENTRY_10042%
%ERASEJOURNALENTRY_10037% AddExperienceParty(500) SetGlobal("C#Q06_TalkedToPaladin","GLOBAL",3) ActionOverride("C#Q05001",EscapeArea())~ %SOLVED_JOURNAL% @10043 EXIT



APPEND C#Q05001 

IF ~~ THEN paladin_12
SAY @116
= @117
IF ~~ THEN EXIT
END

IF ~~ THEN paladin_13
SAY @118
= @119
IF ~~ THEN EXIT
END

IF ~~ THEN paladin_14
SAY @120
+ ~Global("C#Q05_RumourTalk","GLOBAL",0)~ + @121 DO ~SetGlobal("C#Q05_RumourTalk","GLOBAL",1)~ + paladin_12
++ @114 EXIT
END

END //APPEND


BEGIN C#Q05002

IF ~Global("C#Q05_PeopleMove","GLOBAL",2)~ THEN people_2_mother
SAY @122
IF ~~ THEN EXIT
END

IF ~!Dead("C#Q05001") Global("C#Q05_PeopleTalk1","GLOBAL",1)~ THEN people_2_talk2
SAY @39
IF ~~ THEN EXTERN C#Q05005 people_5_talk2
END

BEGIN C#Q05003

IF ~Global("C#Q05_PeopleMove","GLOBAL",2)~ THEN people_3_mother
SAY @123
IF ~~ THEN EXIT
END

IF ~!Dead("C#Q05001") Global("C#Q05_PeopleTalk1","GLOBAL",1)~ THEN people_3_talk2
SAY @41
IF ~~ THEN EXTERN C#Q05005 people_5_talk2
END

BEGIN C#Q05004

IF ~Global("C#Q05_PeopleMove","GLOBAL",2)~ THEN people_4_mother
SAY @124
IF ~~ THEN EXIT
END

IF ~!Dead("C#Q05001") Global("C#Q05_PeopleTalk1","GLOBAL",1)~ THEN people_4_talk2
SAY @42
IF ~~ THEN EXTERN C#Q05005 people_5_talk2
END

BEGIN C#Q05005

IF ~Global("C#Q05_PeopleMove","GLOBAL",2)~ THEN people_5_mother
SAY @125
IF ~~ THEN EXIT
END

IF ~!Dead("C#Q05001") Global("C#Q05_PeopleTalk1","GLOBAL",1)~ THEN people_5_talk2
SAY @43
+ ~Global("C#Q05_AskedHome","GLOBAL",0)~ + @44 DO ~SetGlobal("C#Q05_AskedHome","GLOBAL",1)~ + people_5_04
++ @45 + people_5_03
+ ~Global("C#Q05_TalkedToMother","GLOBAL",1)~ + @126 + people_5_05_chain
++ @127 EXIT
END

IF ~~ THEN people_5_01
SAY @47
++ @48 EXIT
++ @49 + people_5_03
++ @46 + people_5_02
END

IF ~~ THEN people_5_02
SAY @40
IF ~~ THEN EXIT
END

IF ~~ THEN people_5_03
SAY @50
IF ~~ THEN EXIT
END

IF ~~ THEN people_5_04
SAY @51
IF ~~ THEN %UNSOLVED_JOURNAL% @10042 EXIT
END

CHAIN
IF ~~ THEN C#Q05005 people_5_05_chain
@128
== C#Q05004 @129
== C#Q05003 @130
== C#Q05002 @131
== C#Q05005 @132
== C#Q05004 @133 DO ~SetGlobal("C#Q05_PeopleTalk1","GLOBAL",2)~
== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN  @166

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @167

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @168

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @169

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @170

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @171

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @172

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @173

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @174

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @175

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN 
@184

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @185

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @190

//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @186

EXIT



CHAIN
IF ~Global("C#Q05_PeopleTalk1","GLOBAL",0)~ THEN C#Q05002 people_talk
@52 DO ~SetGlobal("C#Q05_PeopleTalk1","GLOBAL",1)~ 
== C#Q05005 @53
== C#Q05004 @54
== C#Q05003 @55 
END
++ @56 %UNSOLVED_JOURNAL% @10041 EXTERN C#Q05005 people_5_01
++ @57 %UNSOLVED_JOURNAL% @10041 EXTERN C#Q05005 people_5_01 
++ @58 %UNSOLVED_JOURNAL% @10041 EXTERN C#Q05005 people_5_01

CHAIN
IF ~Dead("C#Q05001")~ THEN C#Q05002 paladin_dead
@59
== C#Q05003 @60
== C#Q05005 @61 
== C#Q05004 @62 DO ~%ERASEJOURNALENTRY_10038% 
%ERASEJOURNALENTRY_10039%
%ERASEJOURNALENTRY_10040%
%ERASEJOURNALENTRY_10041%
%ERASEJOURNALENTRY_10042%
%ERASEJOURNALENTRY_10037%
AddJournalEntry(@10044%QUEST_DONE%)
ActionOverride("C#Q05002",EscapeArea()) ActionOverride("C#Q05003",EscapeArea()) ActionOverride("C#Q05004",EscapeArea()) ActionOverride("C#Q05005",EscapeArea())~
EXIT

BEGIN C#Q05006

IF ~Global("C#Q05_TalkedToMother","GLOBAL",3)~ THEN mother_end
SAY @134
IF ~~ THEN EXIT
END

IF ~Global("C#Q05_PeopleMove","GLOBAL",2)~ THEN mother_00
SAY @135
IF ~Global("C#Q05_TalkedToMother","GLOBAL",1)~ THEN DO ~SetGlobal("C#Q05_TalkedToMother","GLOBAL",2) SetGlobalTimer("C#Q05_TalkedToMotherT","GLOBAL",THREE_DAYS)~ EXIT
IF ~Global("C#Q05_TalkedToMother","GLOBAL",2)~ THEN EXIT
END

IF ~GlobalLT("C#Q05_PeopleTalk1","GLOBAL",2)~ THEN mother
SAY @64
++ @65 EXIT
+ ~!Global("C#Q05_PeopleTalk1","GLOBAL",0) Global("C#Q05_TalkedToMother","GLOBAL",0) Global("C#Q05_KnowDetails","GLOBAL",0)~ + @66 DO ~SetGlobal("C#Q05_AskedHome","GLOBAL",1)~ + mother_02
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2) Global("C#Q05_TalkedToMother","GLOBAL",0)
Global("C#Q05_KnowDetails","GLOBAL",1)~ + @82 + mother_07
+ ~Global("C#Q05_TalkedToMother","GLOBAL",1)~ + @67 EXIT
++ @68 + mother_01
END

IF ~~ THEN mother_01
SAY @69
IF ~~ THEN EXIT
END

IF ~~ THEN mother_02
SAY @70
++ @71 EXIT
+ ~Global("C#Q05_PeopleTalk1","GLOBAL",1)~ + @72 + mother_03
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2)~ + @73 + mother_03
++ @74 EXIT
END

IF ~~ THEN mother_03
SAY @75
++ @76 + mother_04
++ @77 + mother_04
++ @78 EXIT
END

IF ~~ THEN mother_04
SAY @79
++ @80 EXIT
+ ~Global("C#Q05_PeopleTalk1","GLOBAL",1)~ + @81 + mother_05
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2)~ + @82 + mother_07
++ @78 EXIT
END

IF ~~ THEN mother_05
SAY @83
++ @84 + mother_06
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2)~ + @82 + mother_07
++ @78 EXIT
END

IF ~~ THEN mother_06
SAY @85
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2)~ + @82 + mother_07
IF ~GlobalLT("C#Q06_TalkedToPaladin","GLOBAL",2)~ THEN + mother_12
+ ~Global("C#Q06_TalkedToPaladin","GLOBAL",2)~ + @86 EXIT
END

IF ~~ THEN mother_07
SAY @87
++ @88 + mother_08
++ @89 EXIT
END

IF ~~ THEN mother_08
SAY @90
++ @91 + mother_09
++ @89 EXIT
END

IF ~~ THEN mother_09
SAY @92
= @93
= @94
IF ~Global("C#Q05_TalkedToNanny","GLOBAL",0)~ THEN DO ~SetGlobal("C#Q05_TalkedToMother","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10040 + mother_09b
IF ~Global("C#Q05_TalkedToNanny","GLOBAL",1)~ THEN DO ~SetGlobal("C#Q05_TalkedToMother","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10039 + mother_09b
END

IF ~~ THEN mother_09b
SAY @95
++ @96 + mother_10
++ @97 + mother_11
++ @98 EXIT
END

IF ~~ THEN mother_10
SAY @99
++ @100 + mother_11
++ @97 + mother_11
++ @98 EXIT
END

IF ~~ THEN mother_11
SAY @101
IF ~~ THEN EXIT
END

IF ~~ THEN mother_12
SAY @136
IF ~~ THEN DO ~SetGlobal("C#Q05_KnowDetails","GLOBAL",1)~ EXIT
END

BEGIN C#Q05007
//Nanny

IF ~True()~ THEN nanny
SAY @102
++ @103 DO ~TakePartyGold(1)~ + nanny_03
++ @104 + nanny_02
++ @105 + nanny_01
END

IF ~~ THEN nanny_01
SAY @106
IF ~~ THEN + nanny_04
END

IF ~~ THEN nanny_02
SAY @107
++ @108 DO ~TakePartyGold(1)~ + nanny_03
++ @105 + nanny_01
END

IF ~~ THEN nanny_03
SAY @109
IF ~~ THEN + nanny_04
END

CHAIN
IF ~~ THEN C#Q05007 nanny_04
@110
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @176

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN  @178

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @177

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @158 

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @179

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @155

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @156

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @157

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @159

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @160

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @161

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @162



//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @187

//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @188

 //Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)
GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN @189

END
IF ~Global("C#Q05_TalkedToMother","GLOBAL",0)~ THEN DO ~SetGlobal("C#Q05_TalkedToNanny","GLOBAL",1) ActionOverride("C#Q05007",EscapeArea())~ EXIT
IF ~GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)~ THEN DO ~SetGlobal("C#Q05_TalkedToNanny","GLOBAL",1) ActionOverride("C#Q05007",EscapeArea())~ %UNSOLVED_JOURNAL% @10038 EXIT
