BEGIN ~C#Q02005~


IF ~Dead("C#Q02006")~ THEN wife_dead_husband
SAY @0
IF ~~ THEN DO ~Enemy() EscapeArea()~ EXIT
END

IF ~Dead("C#Q02007")~ THEN wife_dead_daughter
SAY @1
IF ~~ THEN DO ~Enemy() EscapeArea()~ EXIT
END

IF ~Global("C#Q02_DudleyQuestSolved","GLOBAL",1) !Global("C#Q02_GaveMoney","GLOBAL",0)~ THEN wife_dudley_end
SAY @8 
IF ~~ THEN EXIT
END




IF ~Global("C#Q02_WifeTalk","GLOBAL",0)~ THEN wife_dudley
SAY @2
+ ~Global("C#Q02_HusbandTalk","GLOBAL",0)~ + @3 DO ~SetGlobal("C#Q02_WifeTalk","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10010 + wife_01
+ ~Global("C#Q02_HusbandTalk","GLOBAL",0)~ + @5 DO ~SetGlobal("C#Q02_WifeTalk","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10010 + wife_02
+ ~Global("C#Q02_HusbandTalk","GLOBAL",1)~ + @6 DO ~SetGlobal("C#Q02_WifeTalk","GLOBAL",1)~ + wife_03
+ ~Global("C#Q02_HusbandTalk","GLOBAL",1)~ + @7 DO ~SetGlobal("C#Q02_WifeTalk","GLOBAL",1)~ + wife_03
END

IF ~Global("C#Q02_GaveNecklace","GLOBAL",1)
!Global("C#Q02_DudleyQuestSolved","GLOBAL",1)~ THEN necklace_wife
SAY @14
+ ~PartyHasItem("C#Q02004")~ + @159 DO ~TakePartyItemAll("C#Q02004") DestroyItem("C#Q02004") SetGlobal("C#Q02_GaveNecklace","GLOBAL",2)~ + wife_necklace_back
++ @5 EXIT
END

IF ~~ THEN wife_necklace_back
SAY @162
IF ~~ THEN DO ~SetGlobal("C#Q02_AnnieTalk","GLOBAL",3) SetGlobal("C#Q02_DudleyQuestSolved","GLOBAL",1) %ERASEJOURNALENTRY_10010% 
MoveToPoint([342.265]) DestroySelf()~ %SOLVED_JOURNAL% @10019 EXIT
END







IF ~Global("C#Q02_WifeTalk","GLOBAL",3)
!Global("C#Q02_DudleyQuestSolved","GLOBAL",1)~ THEN wife_dudley_02
SAY @14
IF ~~ THEN EXIT
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",2)~ THEN wife_dudley_03
SAY @15
+ ~!Global("C#Q02_HusbandTalk","GLOBAL",2)~ + @16 + wife_07
+ ~Global("C#Q02_HusbandTalk","GLOBAL",2)~ + @17 + wife_08
++ @18 EXIT
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",1) Global("C#Q02_HusbandTalk","GLOBAL",0)~ THEN wife_dudley_04
SAY @19
IF ~~ THEN EXIT
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",1) Global("C#Q02_HusbandTalk","GLOBAL",1)~ THEN wife_dudley_05
SAY @15
+ ~Global("C#Q02_AnnieTalk","GLOBAL",0)~ + @20 + wife_04
+ ~Global("C#Q02_AnnieTalk","GLOBAL",1)~ + @21 + wife_05
++ @22 EXIT
END



IF ~~ THEN wife_01
SAY @30
IF ~~ THEN EXIT
END

IF ~~ THEN wife_02
SAY @32
IF ~~ THEN EXIT
END

IF ~~ THEN wife_03
SAY @33
IF ~~ THEN + wife_04
END

IF ~~ THEN wife_04
SAY @35
IF ~~ THEN EXIT
END

IF ~~ THEN wife_05
SAY @36
++ @37 DO ~SetGlobal("C#Q02_WifeTalk","GLOBAL",2)~ + wife_06
++ @38 DO ~SetGlobal("C#Q02_WifeTalk","GLOBAL",2)~ EXIT
END

IF ~~ THEN wife_06
SAY @39 
++ @40 + wife_07
++ @41 EXIT
END

IF ~~ THEN wife_07
SAY @42
IF ~~ THEN EXIT
END

IF ~~ THEN wife_08
SAY @43
++ @44 + wife_09
++ @45 EXIT
END

IF ~~ THEN wife_09
SAY @46
++ @47 DO ~SetGlobal("C#Q02_WifeTalk","GLOBAL",3)~ + wife_10
++ @48 DO ~SetGlobal("C#Q02_WifeTalk","GLOBAL",3)~ EXIT
END

IF ~~ THEN wife_10
SAY @49
IF ~~ THEN EXIT
END



BEGIN ~C#Q02006~

IF ~Dead("C#Q02005")~ THEN husband_dead_wife
SAY @0
IF ~~ THEN DO ~Enemy() EscapeArea()~ EXIT
END

IF ~Dead("C#Q02007")~ THEN husband_dead_daughter
SAY @50
IF ~~ THEN DO ~Enemy() EscapeArea()~ EXIT
END

IF ~GlobalGT("C#Q02_DudleysLeave","GLOBAL",0)~ THEN dudleays_leave
SAY @156
IF ~~ THEN EXIT
END

IF ~Global("C#Q02_HusbandTalk","GLOBAL",0)~ THEN husband_dudley
SAY @51
+ ~Global("C#Q02_WifeTalk","GLOBAL",0)~ + @52 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10010 + husband_01
+ ~Global("C#Q02_WifeTalk","GLOBAL",0)~ + @53 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10010 + husband_02
+ ~Global("C#Q02_WifeTalk","GLOBAL",1)~ + @54 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",1)~ + husband_03
+ ~Global("C#Q02_WifeTalk","GLOBAL",1)~ + @7 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",1)~ + husband_03
END



IF ~Global("C#Q02_DudleyQuestSolved","GLOBAL",1) Global("C#Q02_GaveMoney","GLOBAL",1)~ THEN husband_dudley_end
SAY @56 
IF ~~ THEN EXIT
END


IF ~Global("C#Q02_DudleyQuestSolved","GLOBAL",1) !Global("C#Q02_GaveMoney","GLOBAL",1)~ THEN husband_dudley_01
SAY @57
IF ~~ THEN EXTERN C#Q02005 wife_dudley_01
END

IF ~Global("C#Q02_GaveNecklace","GLOBAL",1)~ THEN necklace_husband
SAY @15
++ @58 + husband_09
+ ~PartyHasItem("C#Q02004")~ + @159 DO ~TakePartyItemAll("C#Q02004") DestroyItem("C#Q02004") SetGlobal("C#Q02_GaveNecklace","GLOBAL",2)~ + husband_necklace_back
++ @22 EXIT
END

IF ~Global("C#Q02_HusbandTalk","GLOBAL",0)~ THEN husband_dudley
SAY @51
+ ~Global("C#Q02_WifeTalk","GLOBAL",0)~ + @52 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10010 + husband_01
+ ~Global("C#Q02_WifeTalk","GLOBAL",0)~ + @53 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10010 + husband_02
+ ~Global("C#Q02_WifeTalk","GLOBAL",1)~ + @54 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",1)~ + husband_03
+ ~Global("C#Q02_WifeTalk","GLOBAL",1)~ + @7 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",1)~ + husband_03
END

IF ~~ THEN husband_necklace_back
SAY @161
IF ~~ THEN DO ~SetGlobal("C#Q02_AnnieTalk","GLOBAL",3) SetGlobal("C#Q02_DudleyQuestSolved","GLOBAL",1) %ERASEJOURNALENTRY_10010%~ %SOLVED_JOURNAL% @10019 EXIT
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",3)~ THEN husband_dudley_02
SAY @15
++ @58 + husband_09
++ @22 EXIT
END 

IF ~Global("C#Q02_HusbandTalk","GLOBAL",2)~ THEN husband_dudley_03
SAY @15
++ @59 + husband_08
++ @18 EXIT
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",2)~ THEN husband_dudley_04
SAY @15
++ @60 + husband_07
++ @22 EXIT
END 

IF ~Global("C#Q02_WifeTalk","GLOBAL",0) Global("C#Q02_HusbandTalk","GLOBAL",1)~ THEN husband_dudley_05
SAY @61
IF ~~ THEN EXIT
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",1) Global("C#Q02_HusbandTalk","GLOBAL",1)~ THEN husband_dudley_06
SAY @15
+ ~Global("C#Q02_AnnieTalk","GLOBAL",0)~ + @62 + husband_04
+ ~Global("C#Q02_AnnieTalk","GLOBAL",1)~ + @21 + husband_06
++ @22 EXIT
END

IF ~~ THEN husband_01
SAY @63
IF ~~ THEN EXIT
END

IF ~~ THEN husband_02
SAY @65
IF ~~ THEN EXIT
END

IF ~~ THEN husband_03
SAY @66
++ @67 + husband_04
++ @158 + husband_04
END

IF ~~ THEN husband_04
SAY @68
++ @69 + husband_05
++ @70 EXIT
END

IF ~~ THEN husband_05
SAY @71
IF ~~ THEN EXIT
END 

IF ~~ THEN husband_06
SAY @72
IF ~~ THEN EXIT
END 

IF ~~ THEN husband_07
SAY @73
++ @74 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",2)~ + husband_08
++ @75 DO ~SetGlobal("C#Q02_HusbandTalk","GLOBAL",2)~ EXIT
END 

IF ~~ THEN husband_08
SAY @76
IF ~~ THEN EXIT
END

IF ~~ THEN husband_09
SAY @77
IF ~~ THEN EXIT
END

IF ~~ THEN husband_10
SAY @78
++ @79 + husband_14
++ @80 + husband_13
++ @81 + husband_12
END

IF ~~ THEN husband_11
SAY @82
++ @83 + husband_14
++ @80 + husband_13
++ @81 + husband_12
END

IF ~~ THEN husband_12
SAY @84 
IF ~Global("C#Q02_Gave550","GLOBAL",1)~ THEN DO ~GiveGoldForce(50) SetGlobal("C#Q02_GaveMoneyFollow","GLOBAL",2) %ERASEJOURNALENTRY_10012% MoveToPoint([750.1600]) DestroySelf()~ %SOLVED_JOURNAL% @10016 EXIT
IF ~Global("C#Q02_Gave600","GLOBAL",1)~ THEN DO ~GiveGoldForce(100) SetGlobal("C#Q02_GaveMoneyFollow","GLOBAL",2) %ERASEJOURNALENTRY_10013% MoveToPoint([750.1600]) DestroySelf()~ %SOLVED_JOURNAL% @10016 EXIT
END

IF ~~ THEN husband_13
SAY @85 
IF ~Global("C#Q02_Gave550","GLOBAL",1)~ THEN DO ~GiveGoldForce(50) SetGlobal("C#Q02_GaveMoneyFollow","GLOBAL",2) %ERASEJOURNALENTRY_10012% MoveToPoint([750.1600]) DestroySelf()~ %SOLVED_JOURNAL% @10016 EXIT
IF ~Global("C#Q02_Gave600","GLOBAL",1)~ THEN DO ~GiveGoldForce(100) SetGlobal("C#Q02_GaveMoneyFollow","GLOBAL",2) %ERASEJOURNALENTRY_10013% MoveToPoint([750.1600]) DestroySelf()~ %SOLVED_JOURNAL% @10016 EXIT
END

IF ~~ THEN husband_14
SAY @86
= @87
= @88 
IF ~~ THEN DO ~SetGlobal("C#Q02_GaveMoneyFollow","GLOBAL",2) %ERASEJOURNALENTRY_10012% %ERASEJOURNALENTRY_10013% MoveToPoint([750.1600]) DestroySelf()~ %SOLVED_JOURNAL% @10017 EXIT
END


CHAIN ~C#Q02006~ chain_moneyoffer
@89 
== ~C#Q02005~ @90
= @91
END
++ @92 EXTERN ~C#Q02006~ chain_moneyoffer2
++ @93 EXIT
++ @94 EXIT

CHAIN ~C#Q02006~ chain_moneyoffer2
@95
== ~C#Q02005~ @96
== ~C#Q02006~ @97
== ~C#Q02005~ @98
== ~C#Q02006~ @99
= @100
== ~C#Q02005~ @101
== ~C#Q02006~ @102
== ~C#Q02005~ @103
== ~C#Q02006~ @104
= @105
END
+ ~PartyGoldGT(499)~ + @106 EXTERN ~C#Q02005~ necklace_sold
+ ~PartyGoldGT(499)~ + @107 EXTERN ~C#Q02005~ necklace_sold
+ ~PartyGoldGT(499)~ + @108 EXTERN ~C#Q02005~ necklace_sold
+ ~PartyGoldLT(500)~ + @109 DO ~SetGlobal("C#Q02_MoneyOffer","GLOBAL",1)~ %UNSOLVED_JOURNAL% @10014 EXIT


BEGIN ~C#Q02007~

IF ~Dead("C#Q02005")~ THEN annie_dead_mother
SAY @111
IF ~~ THEN DO ~Enemy() EscapeArea()~ EXIT
END

IF ~Dead("C#Q02006")~ THEN annie_dead_father
SAY @112
IF ~~ THEN DO ~Enemy() EscapeArea()~ EXIT
END

IF ~GlobalGT("C#Q02_DudleysLeave","GLOBAL",0)~ THEN dudleays_leave
SAY @157
IF ~~ THEN EXIT
END

/*
IF ~ReputationLT(Player1,10)~ THEN annie_dudley_replow
SAY @113
IF ~~ THEN EXIT
END
*/

IF ~Global("C#Q02_NecklacePresent","GLOBAL",1)~ THEN annie_ende
SAY @165
IF ~~ THEN EXIT
END

IF ~Global("C#Q02_DudleyQuestSolved","GLOBAL",1) Global("C#Q02_GaveMoney","GLOBAL",1)~ THEN annie_dudley_end
SAY @114 
+ ~PartyHasItem("C#Q02004")~ + @163 + annie_necklace_present
+ ~PartyHasItem("C#Q02004")~ + @121 EXIT
IF ~!PartyHasItem("C#Q02004")~ THEN EXIT
END

IF ~Global("C#Q02_DudleyQuestSolved","GLOBAL",1) !Global("C#Q02_GaveMoney","GLOBAL",1)~ THEN annie_dudley_01
SAY @115
+ ~Global("C#Q02_MoneyOffer","GLOBAL",0) !Global("C#Q02_GotReward","GLOBAL",1)~ + @10 DO ~AddExperienceParty(500) SetGlobal("C#Q02_GotReward","GLOBAL",1)~ EXTERN ~C#Q02006~ chain_moneyoffer
+ ~!Global("C#Q02_GotReward","GLOBAL",1)~ + @11 DO ~AddExperienceParty(500) SetGlobal("C#Q02_GotReward","GLOBAL",1)~ EXIT
+ ~!Global("C#Q02_GotReward","GLOBAL",1)~ + @12 DO ~AddExperienceParty(500) SetGlobal("C#Q02_GotReward","GLOBAL",1)~ EXIT
+ ~Global("C#Q02_MoneyOffer","GLOBAL",0) Global("C#Q02_GotReward","GLOBAL",1)~ + @10 EXTERN ~C#Q02006~ chain_moneyoffer
+ ~Global("C#Q02_GotReward","GLOBAL",1)~ + @11 EXIT
+ ~Global("C#Q02_GotReward","GLOBAL",1)~ + @12 EXIT
+ ~Global("C#Q02_MoneyOffer","GLOBAL",1) PartyGoldGT(499)~ + @13 DO ~SetGlobal("C#Q02_MoneyOffer","GLOBAL",0)~ EXTERN ~C#Q02005~ necklace_sold
END

IF ~Global("C#Q02_GaveNecklace","GLOBAL",1)~ THEN necklace
SAY @148
+ ~PartyHasItem("C#Q02004")~ + @149 DO ~TakePartyItemAll("C#Q02004") DestroyItem("C#Q02004") SetGlobal("C#Q02_GaveNecklace","GLOBAL",2)~ + annie_08
++ @121 EXIT
END

IF ~Global("C#Q02_AnnieTalk","GLOBAL",2)~ THEN annie_dudley_02
SAY @116
++ @117 + annie_08
++ @150 + annie_09
++ @118 EXIT
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",2)~ THEN annie_dudley_03
SAY @119
++ @120 + annie_05
++ @121 EXIT 
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",3)~ THEN annie_dudley_04
SAY @119
++ @120 + annie_05
++ @122 + annie_07
++ @121 EXIT 
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",0) Global("C#Q02_HusbandTalk","GLOBAL",0)~ THEN annie_dudley_05
SAY @123
IF ~~ THEN EXIT
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",1) Global("C#Q02_HusbandTalk","GLOBAL",1)~ THEN annie_dudley_06
SAY @124
++ @125 + annie_03
+ ~!Global("C#Q02_AnnieName","GLOBAL",1)~ + @126 + annie_01
++ @121 EXIT 
END

IF ~Global("C#Q02_WifeTalk","GLOBAL",1)~ THEN annie_dudley_07
SAY @124
++ @127 + annie_02
+ ~!Global("C#Q02_AnnieName","GLOBAL",1)~ + @126 + annie_01
++ @121 EXIT 
END

IF ~Global("C#Q02_HusbandTalk","GLOBAL",1)~ THEN annie_dudley_08
SAY @124
++ @128 + annie_02
+ ~!Global("C#Q02_AnnieName","GLOBAL",1)~ + @126 + annie_01
++ @121 EXIT 
END



IF ~~ THEN annie_01
SAY @129
IF ~~ THEN DO ~SetGlobal("C#Q02_AnnieName","GLOBAL",1)~ EXIT
END

IF ~~ THEN annie_02
SAY @130
IF ~~ THEN EXIT
END

IF ~~ THEN annie_03
SAY @131
++ @132 + annie_04
++ @133 + annie_06
++ @134 EXIT 
END

IF ~~ THEN annie_04
SAY @135
++ @136 DO ~SetGlobal("C#Q02_AnnieTalk","GLOBAL",1)~ + annie_05
++ @45 DO ~SetGlobal("C#Q02_AnnieTalk","GLOBAL",1)~ EXIT
END

IF ~~ THEN annie_05
SAY @137
IF ~!Global("C#Q02_WifeTalk","GLOBAL",3)~ THEN EXIT
+ ~Global("C#Q02_WifeTalk","GLOBAL",3)~ + @122 + annie_07
+ ~Global("C#Q02_WifeTalk","GLOBAL",3)~ + @138 EXIT
END

IF ~~ THEN annie_06
SAY @139
++ @140 + annie_04
++ @134 EXIT 
END

IF ~~ THEN annie_07
SAY @141
++ @117 DO ~SetGlobal("C#Q02_AnnieTalk","GLOBAL",2)~ + annie_08
++ @150 DO ~SetGlobal("C#Q02_AnnieTalk","GLOBAL",2)~ + annie_09
++ @142 DO ~SetGlobal("C#Q02_AnnieTalk","GLOBAL",2)~ EXIT
END

IF ~~ THEN annie_08
SAY @143
IF ~~ THEN DO ~SetGlobal("C#Q02_AnnieTalk","GLOBAL",3) SetGlobal("C#Q02_DudleyQuestSolved","GLOBAL",1) %ERASEJOURNALENTRY_10010% MoveToPoint([748.1603]) DestroySelf()~ %SOLVED_JOURNAL% @10015 EXIT
END

IF ~~ THEN annie_09
SAY @151
++ @152 EXIT
++ @153 + annie_10
END




CHAIN
IF WEIGHT #-1
 ~Global("C#Q02_DudleysLeave","GLOBAL",2)~ THEN C#Q02005 dudleays_leave
@147

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @166

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @167

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @168

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @169 

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @170

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @171
== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @172

//BG:EE NPCs
//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @250   /*= ~These people lost their house? But we didn't *do* anything!~ */

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @252  /* = ~Time was on our side. A very effective and painless method of destroying others.~*/

//Baeloth
== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @253 

//Eldoth  (PartyHasItem("c#q02004"))
== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID) PartyHasItem("c#q02004")~ THEN @251   



END
IF ~~ THEN DO ~SetGlobal("C#Q02_DudleysLeave","GLOBAL",3) ActionOverride("C#Q02006",EscapeArea()) ActionOverride("C#Q02007",EscapeArea()) ReputationInc(-1) %ERASEJOURNALENTRY_10010% ActionOverride("C#Q02005",EscapeArea())~ %SOLVED_JOURNAL% @10018 EXIT



CHAIN
IF WEIGHT #-1
~Global("C#Q02_DudleyQuestSolved","GLOBAL",1) !Global("C#Q02_GaveMoney","GLOBAL",1)~ THEN C#Q02005 wife_dudley_01
@9

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @173

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @174

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @175

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @176

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @177

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @178
== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @179

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @180

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @181

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @182 

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @183
== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @184

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @185

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @186

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @187

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @188 

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @189

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @190

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @191

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @192

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @193

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @194

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @195

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @196

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @197

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @198 

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @199

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @269

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @270

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @200

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @201

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @202

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @203

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @204

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @205
 
== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @206

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @207

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @254

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @255

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @256

== C#Q02005 @249
END
+ ~Global("C#Q02_MoneyOffer","GLOBAL",0) !Global("C#Q02_GotReward","GLOBAL",1)~ + @10 DO ~AddExperienceParty(500) SetGlobal("C#Q02_GotReward","GLOBAL",1)~ EXTERN ~C#Q02006~ chain_moneyoffer
+ ~!Global("C#Q02_GotReward","GLOBAL",1)~ + @11 DO ~AddExperienceParty(500) SetGlobal("C#Q02_GotReward","GLOBAL",1)~ EXIT
+ ~!Global("C#Q02_GotReward","GLOBAL",1)~ + @12 DO ~AddExperienceParty(500) SetGlobal("C#Q02_GotReward","GLOBAL",1)~ EXIT
+ ~Global("C#Q02_MoneyOffer","GLOBAL",0) Global("C#Q02_GotReward","GLOBAL",1)~ + @10 EXTERN ~C#Q02006~ chain_moneyoffer
+ ~Global("C#Q02_GotReward","GLOBAL",1)~ + @11 EXIT
+ ~Global("C#Q02_GotReward","GLOBAL",1)~ + @12 EXIT
+ ~Global("C#Q02_MoneyOffer","GLOBAL",1) PartyGoldGT(499)~ + @13 DO ~SetGlobal("C#Q02_MoneyOffer","GLOBAL",0) %ERASEJOURNALENTRY_10014%~ + necklace_sold


CHAIN
IF ~~ THEN C#Q02005 necklace_sold
@23 

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @208

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @209

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @210

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @211

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @212

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @213

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @214

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @215

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @216

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @217

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @218

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @219

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @220

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @257   

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @258   

== C#Q02005 @248

END
+ ~PartyGoldGT(499)~ + @24 DO ~GiveItemCreate("C#Q02004",[PC],1,0,0) TakePartyGold(500) SetGlobal("C#Q02_GaveMoney","GLOBAL",1) SetGlobalTimer("C#Q02_MoneyTimer","GLOBAL",100) %ERASEJOURNALENTRY_10015%~ %SOLVED_JOURNAL% @10011 EXIT
+ ~PartyGoldGT(549)~ + @26 DO ~GiveItemCreate("C#Q02004",[PC],1,0,0) TakePartyGold(550) SetGlobal("C#Q02_GaveMoney","GLOBAL",1) SetGlobal("C#Q02_Gave550","GLOBAL",1) SetGlobalTimer("C#Q02_MoneyTimer","GLOBAL",100) %ERASEJOURNALENTRY_10015%~ %SOLVED_JOURNAL% @10012 EXIT
+ ~PartyGoldGT(599)~ + @28 DO ~GiveItemCreate("C#Q02004",[PC],1,0,0) TakePartyGold(600) SetGlobal("C#Q02_GaveMoney","GLOBAL",1) SetGlobal("C#Q02_Gave600","GLOBAL",1) SetGlobalTimer("C#Q02_MoneyTimer","GLOBAL",100) %ERASEJOURNALENTRY_10015%~ %SOLVED_JOURNAL% @10013 EXIT


CHAIN
IF WEIGHT #-1
 ~Global("C#Q02_GaveMoneyFollow","GLOBAL",1)~ THEN C#Q02006 husband_too_much
@55

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @221

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @222

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @223

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @224

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @225

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @226

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @227

== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @259

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @228

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @229

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @230

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @231

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @232

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @233 

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @234

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @235

END
IF ~Global("C#Q02_Gave600","GLOBAL",1)~ THEN + husband_10
IF ~Global("C#Q02_Gave550","GLOBAL",1)~ THEN + husband_11


CHAIN
IF ~~ THEN C#Q02007 annie_necklace_present
@164

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @236

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @264

== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @263

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @237

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @260

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @238

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @239

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @261 

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @262

END
IF ~~ THEN DO ~ReputationInc(1) ActionOverride("C#Q02007",TakePartyItemAll("C#Q02004")) ActionOverride("C#Q02007",DestroyItem("C#Q02004")) SetGlobal("C#Q02_NecklacePresent","GLOBAL",1) SetGlobal("C#Q02_GaveNecklace","GLOBAL",2)~ EXIT


CHAIN
IF ~~ THEN C#Q02007 annie_10
@154

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @240

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @241

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @242

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @243

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @244

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @245

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @246

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @247

//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @265

//Neera (Dorn in party)
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @266

//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @267

//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @268

END
IF ~~ THEN DO ~GiveItemCreate("C#Q02004",[PC],1,0,0) SetGlobal("C#Q02_GaveNecklace","GLOBAL",1) SetGlobalTimer("C#Q02_GaveNecklaceT","GLOBAL",TWO_DAYS)~ EXIT 

