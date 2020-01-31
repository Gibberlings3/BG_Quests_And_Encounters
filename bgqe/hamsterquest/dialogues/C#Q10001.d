/* ACQ13004: Kaninchenzüchter aus Ascalon's Questpack! */


BEGIN C#Q10002
BEGIN C#Q10001 //pet vendor


CHAIN
IF ~Global("C#Q10_HamsterQuest","GLOBAL",0)
InParty("MINSC") 
 Detect("MINSC")
!StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN C#Q10001 pet_vendor
@0

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @92

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @93

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @94

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID) 
Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @95

== %MINSC_JOINED% IF ~InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID) Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @96

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @97

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @98

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @99

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @100

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @101

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @102

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @103

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @164

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @165

//Imoen (Dorn)
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @166

//Dorn (Imoen)
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID) 
InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @167

//Imoen (Dorn)
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @168

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @169

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @104
= @105 

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @106

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @107

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @108

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @109

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @110

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @111

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @112

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @113

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @114

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @115

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @116

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @117

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @118

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @119

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @120

== C#Q10001 @121 
END
++ @1 + pet_vendor_01
++ @2 + pet_vendor_01
+ ~Exists("ACQ13004") !Dead("ACQ13004")~ + @162 + ascalon_questpack
++ @3 + pet_vendor_01



CHAIN
IF ~~ THEN C#Q10001 pet_vendor_01
@4
= @5
== C#Q10002 @6
== C#Q10001 @7
== C#Q10002 @8
== C#Q10001 @9
== C#Q10002 @10
== C#Q10001 @11
= @12
= @13
END
++ @14 + pet_vendor_02
++ @15 + pet_vendor_02
++ @16 + pet_vendor_02

APPEND C#Q10001

IF ~~ THEN ascalon_questpack
SAY @163
++ @1 + pet_vendor_01
++ @2 + pet_vendor_01
++ @3 + pet_vendor_01
END


IF ~~ THEN pet_vendor_02
SAY @17
++ @18 + pet_vendor_03
++ @19 + pet_vendor_03
++ @20 + pet_vendor_03
END

IF ~~ THEN pet_vendor_03
SAY @21
IF ~~ THEN DO ~SetGlobal("C#Q10_HamsterQuest","GLOBAL",1)  
SetGlobalTimer("C#Q10_HamsterTimer","GLOBAL",15) EscapeArea()~ EXIT
END

IF ~GlobalGT("C#Q10_HamsterQuest","GLOBAL",0)~ THEN back
SAY @22
+ ~PartyHasItem("C#Q10001")~ + @23 + back_01
+ ~PartyHasItem("C#Q10001")~ + @24 + back_01
+ ~!PartyHasItem("C#Q10001")~ + @196 + back_09
++ @25 EXIT
END

IF ~~ THEN back_01
SAY @26
++ @70 + back_02
++ @71 + back_02
++ @72 + back_02
END

IF ~~ THEN back_02
SAY @73
= @74
++ @75 + back_03
+ ~PartyHasItem("C#Q10001")~ + @76 + back_04
+ ~PartyHasItem("C#Q10001")~ + @77 + back_04
++ @25 EXIT
END

IF ~~ THEN back_03
SAY @78
= @79
+ ~PartyHasItem("C#Q10001")~ + @76 + back_04
+ ~PartyHasItem("C#Q10001")~ + @77 + back_04
IF ~!PartyHasItem("C#Q10001")~ THEN + back_08
END

IF ~~ THEN back_04
SAY @80
= @81
= @82
= @83
IF ~~ THEN + back_05
IF ~!PartyHasItem("C#Q10002") !PartyHasItem("C#Q10003") !PartyHasItem("C#Q10004")
!PartyHasItem("C#Q10005") !PartyHasItem("C#Q10006")~ THEN + back_07
END

IF ~~ THEN back_05
SAY @84
++ @85 + back_06
++ @86 + back_06
++ @87 + back_07
END

IF ~~ THEN back_06
SAY @88
IF ~~ THEN + back_07
END

IF ~~ THEN back_07
SAY @27
IF ~~ THEN DO ~SetGlobal("C#Q10_MinskHasHamster","GLOBAL",3) TakePartyItem("C#Q10001") %ERASEJOURNALENTRY_10058% EscapeArea()~ %UNSOLVED_JOURNAL% @10059 EXIT
IF ~!PartyHasItem("C#Q10002") !PartyHasItem("C#Q10003") !PartyHasItem("C#Q10004")
!PartyHasItem("C#Q10005") !PartyHasItem("C#Q10006")~ THEN DO ~SetGlobal("C#Q10_MinskHasHamster","GLOBAL",3) TakePartyItem("C#Q10001") %ERASEJOURNALENTRY_10058% %ERASEJOURNALENTRY_10069% EscapeArea()~ %SOLVED_JOURNAL% @10057 EXIT
END

IF ~~ THEN back_08
SAY @27
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN back_09
SAY @197
IF ~~ THEN + back_02
END

// 

END //APPEND

APPEND C#Q10002 //Boy

IF ~Global("C#Q10_HamsterQuest","GLOBAL",0)~ THEN boy_before
SAY @29
IF ~~ THEN EXIT
END

IF ~GlobalGT("C#Q10_HamsterQuest","GLOBAL",0)
Global("C#Q10_BoyGotHamster","GLOBAL",0)~ THEN boy
SAY @30
+ ~!Global("C#Q10_MinskHasHamster","GLOBAL",3)~ + @31 DO ~SetGlobalTimer("C#Q10_VendorTimer","GLOBAL",TWELVE_DAYS)~ + boy_03
++ @32 DO ~SetGlobalTimer("C#Q10_VendorTimer","GLOBAL",TWELVE_DAYS)~ + boy_02
++ @34 DO ~SetGlobalTimer("C#Q10_VendorTimer","GLOBAL",TWELVE_DAYS)~ + boy_01
++ @35 DO ~SetGlobalTimer("C#Q10_VendorTimer","GLOBAL",TWELVE_DAYS)~ + boy_01
END

IF ~GlobalGT("C#Q10_HamsterQuest","GLOBAL",0)
Global("C#Q10_BoyGotHamster","GLOBAL",1)~ THEN boy_00
SAY @182 /* ~Thank you again for giving me a hamster! All my friends wanted one, too!~ */
IF ~~ THEN + boy_06
IF ~!PartyHasItem("C#Q10002") !PartyHasItem("C#Q10003") !PartyHasItem("C#Q10004")
!PartyHasItem("C#Q10005") !PartyHasItem("C#Q10006")~ THEN + boy_01
IF ~PartyHasItem("C#Q10001")~ + boy_07
END

IF ~~ THEN boy_01
SAY @36
IF ~~ THEN EXIT
END

IF ~~ THEN boy_02
SAY @37
IF ~~ THEN + boy_06
IF ~!PartyHasItem("C#Q10002") !PartyHasItem("C#Q10003") !PartyHasItem("C#Q10004")
!PartyHasItem("C#Q10005") !PartyHasItem("C#Q10006")~ THEN + boy_01
IF ~PartyHasItem("C#Q10001")~ + boy_07
END

IF ~~ THEN boy_03
SAY @180
++ @32 + boy_02
++ @35 + boy_01
END

IF ~~ THEN boy_04
SAY @39
++ @40 + boy_05 
++ @41 + boy_01
END

END //APPEND

CHAIN
IF ~~ THEN C#Q10002 boy_05
@42 

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @122

//rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @170

//Jaheira 
== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @171

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @172

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @123

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @124

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @125

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @126

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @127

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
Global("C#Q10_GaveLittleHamsters","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @128


END

/* PC gave all hamsters away, quest is over */
IF ~~ THEN + boy_11

/* PC still has vendor hamster, quest not finished */
IF ~PartyHasItem("C#Q10001")~ THEN DO ~SetGlobal("C#Q10_GaveLittleHamsters","GLOBAL",1)~ + boy_12



APPEND C#Q10002 //Boy

IF ~~ THEN boy_06
SAY @90
++ @33 + boy_04
++ @41 + boy_01
END

IF ~~ THEN boy_07
SAY @183 /* ~That one is a grown one, isn't it?~ */
++ @184 /* ~Well, that's the one we took accidentally from the vendor...~ */ + boy_09
++ @185 /* ~I am not talking about that one, child.~ */ + boy_08
END

IF ~~ THEN boy_08
SAY @186 /* ~Ah, I see.~ */
IF ~~ THEN + boy_06
IF ~!PartyHasItem("C#Q10002") !PartyHasItem("C#Q10003") !PartyHasItem("C#Q10004")
!PartyHasItem("C#Q10005") !PartyHasItem("C#Q10006")~ THEN + boy_01
END

END //APPEND

CHAIN
IF ~~ THEN C#Q10002 boy_09
@187 /* ~Oh, it's so cute. Can I have it? Please? Please?~ */

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @188 /* ~No, little boy. <CHARNAME> and I are looking for vendor man to give back his hamster.~ */

== C#Q10002 @189 /* ~But he said he wouldn't work as a vendor any more! He said he'd go far away! You want to carry a hamster in your backpack while adventuring?~ */

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @190 /* ~Well...~ */
END
++ @191 /* ~I'm afraid my sense of honor dictates me to search for the vendor and bring the hamster back to him, nonetheless.~ */ + boy_08
+ ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ + @192 /* ~The boy has got a point. I know this is not what you wanted, Minsc, but the hamster will stay with the boy and spare us the hassle of searching for that vendor.~ */ + boy_10
++ @193 /* ~Yes, I think I prefer this version. Take the hamster, then.~ */ + boy_10

CHAIN
IF ~~ THEN C#Q10002 boy_10
@194 /* ~Oooh, thank you, thank you, thank you!~ */
== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @195 /* ~Boo says it's not a bad idea. Searching for vendor man might be more difficult than would be good for little hamster, so Minsc agrees.~ */
END
IF ~~ THEN DO ~SetGlobal("C#Q10_BoyGotHamster","GLOBAL",1)
SetGlobal("C#Q10_MinskHasHamster","GLOBAL",3) ActionOverride("C#Q10002",TakePartyItem("C#Q10001")) %ERASEJOURNALENTRY_10058%~ %UNSOLVED_JOURNAL% @10059 + boy_06
IF ~!PartyHasItem("C#Q10002") !PartyHasItem("C#Q10003") !PartyHasItem("C#Q10004")
!PartyHasItem("C#Q10005") !PartyHasItem("C#Q10006")~ THEN DO ~SetGlobal("C#Q10_MinskHasHamster","GLOBAL",3) ActionOverride("C#Q10002",TakePartyItem("C#Q10001")) 
SetGlobal("C#Q10_BoyGotHamster","GLOBAL",1) %ERASEJOURNALENTRY_10058%~ %SOLVED_JOURNAL% @10057 + boy_01

APPEND C#Q10002 //Boy


IF ~~ THEN boy_11
SAY @129
IF ~~ THEN DO ~TakePartyItemAll("C#Q10002") TakePartyItemAll("C#Q10003") 
TakePartyItemAll("C#Q10004") TakePartyItemAll("C#Q10005") TakePartyItemAll("C#Q10006") %ERASEJOURNALENTRY_10058% %ERASEJOURNALENTRY_10059% %ERASEJOURNALENTRY_10069% EscapeArea()~ %SOLVED_JOURNAL% @10060 EXIT
END

IF ~~ THEN boy_12
SAY @181
IF ~~ THEN DO ~SetGlobal("C#Q10_BoyGotHamster","GLOBAL",1)
TakePartyItemAll("C#Q10002") TakePartyItemAll("C#Q10003") 
TakePartyItemAll("C#Q10004") TakePartyItemAll("C#Q10005") TakePartyItemAll("C#Q10006")~ %UNSOLVED_JOURNAL% @10069 EXIT
END

END


APPEND %MINSC_JOINED%

/* -> put this into a separate file (BG1 only)
IF WEIGHT #-1
~Global("C#Q10_MinskHasHamster","GLOBAL",2)~ THEN keep_hamster
SAY @62
IF ~~ THEN DO ~TakePartyItem("C#Q10002") SetGlobal("C#Q10_MinskHasHamster","GLOBAL",1)~ EXIT
END
*/


IF WEIGHT #-1
~Global("C#Q10_HamsterQuest","GLOBAL",2)~ THEN hamster
SAY @43 
IF ~~ THEN DO ~SetGlobal("C#Q10_HamsterQuest","GLOBAL",3) SetGlobalTimer("C#Q10_HamsterTimer","GLOBAL",TWO_DAYS)~ + hamster_00
END

IF ~~ THEN hamster_00
SAY @44
++ @45 + hamster_02
++ @46 + hamster_01
END

IF ~~ THEN hamster_01
SAY @47
IF ~~ THEN + hamster_02
END

IF ~~ THEN hamster_02
SAY @48
++ @49 + hamster_04
++ @50 + hamster_04
++ @51 + hamster_03
END

IF ~~ THEN hamster_03
SAY @47
IF ~~ THEN + hamster_04
END

IF ~~ THEN hamster_04
SAY @52
++ @53 + hamster_07
++ @54 + hamster_06
++ @55 + hamster_05
END

IF ~~ THEN hamster_05
SAY @47
IF ~~ THEN + hamster_06
END

IF ~~ THEN hamster_06
SAY @63
++ @64 + hamster_08
++ @65 + hamster_08
++ @66 + hamster_08
END

IF ~~ THEN hamster_07
SAY @58
IF ~~ THEN + hamster_06
END

IF ~~ THEN hamster_08
SAY @67
++ @68 + hamster_09
++ @66 + hamster_09
END

END //APPEND

CHAIN
IF ~~ THEN %MINSC_JOINED% hamster_09
@69

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @130

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @131

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @173 

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @174

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @132
== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @133
== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID) InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @134

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @135

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @137

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @136

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @138

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @139

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @140

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID) 
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @141

== %MINSC_JOINED% @56
END
IF ~~ THEN %UNSOLVED_JOURNAL% @10058 EXIT



CHAIN
IF WEIGHT #-1
~Global("C#Q10_HamsterQuest","GLOBAL",4)~ THEN %MINSC_JOINED% baby_hamster
@142 
= @143

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @144
= @145

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @146

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @147

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @148

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @149

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @175 

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @176

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @177

//Minsc (Dorn)
==  %MINSC_JOINED% IF ~InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @178

//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @179

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @150

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @151

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @152

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @153

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @154

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @155

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @156

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @157

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @158

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @159

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @160

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @161
END
IF ~~ THEN DO ~SetGlobal("C#Q10_HamsterQuest","GLOBAL",5)~ EXIT


