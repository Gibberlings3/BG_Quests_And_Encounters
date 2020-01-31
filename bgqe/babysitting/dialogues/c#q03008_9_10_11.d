
BEGIN ~C#Q03008~



IF ~ReputationGT(Player1,8)
ReputationLT(Player1,10)
!Alignment(Player1,19)
!Alignment(Player1,35)
!Alignment(Player1,51)~ THEN mother_blackwood_lowrep
SAY @1
IF ~~ THEN EXIT
END

IF ~Global("C#Q03_AbandonedChildren","GLOBAL",3)~ THEN revenge
SAY @2
IF ~~ THEN DO ~SetGlobal("C#Q03_AbandonedChildren","GLOBAL",4) EscapeArea()~ EXIT
END

IF ~Global("C#Q03_StageEnd","GLOBAL",5)~ THEN mother_problem_01
SAY @3
IF ~~ THEN DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",6) Shout(99) Enemy() SetGlobalTimer("C#Q03_AbandonedChildrenT","GLOBAL",10) EscapeArea()~ EXIT
END

IF ~Global("C#Q03_StageEnd","GLOBAL",3)~ THEN mother_end_01
SAY @4
++ @5 + mother_end_05
++ @6 + mother_end_03
++ @7 + mother_end_07
++ @8 + mother_end_02
END


IF ~~ THEN mother_end_02
SAY @9 /* ~What an unfriendly person. I thought better of you! Well, I guess I won't tell people about your help, then. Still, you have been a great help to me. Farewell.~ */
IF ~~ THEN + ending_chain
END

IF ~~ THEN mother_end_03
SAY @11
++ @12 + mother_end_06
++ @7 + mother_end_07
++ @13 + mother_end_04
++ @8 + mother_end_02
END


IF ~~ THEN mother_end_04
SAY @14  /* ~How dare you! I thought better of you! Children, off we go. And quick!~ */
IF ~~ THEN + ending_chain
END

IF ~~ THEN mother_end_05
SAY @16 /* ~Well, yes, in a way... See, I don't have any money. I had to go and talk to their dad... in private. He will pay for our transfer to my family in Amn, and that's all. Bastard! Oops, I am sorry. Children, that is a bad word, don't you ever use it!~ */
= @17 /* ~Well, I guess we have to go now. It might be hard to understand why I can't take them along to their dad... Thank you again so much for your help! I'll tell everyone of your kind generosity.~ */
IF ~~ THEN DO ~ReputationInc(1)~ + ending_chain
END

IF ~~ THEN mother_end_06
SAY @18 /* ~I thank you. You have been a great help, even though it might be hard to understand why I can't take them along to their dad... I'll tell everyone how helpful you have been.~ */
IF ~~ THEN DO ~ReputationInc(1)~ + ending_chain
END

IF ~~ THEN mother_end_07
SAY @19 /* ~Oh! That is a hard one. I would love to have told everybody how helpful you were, but yes, I can keep it to myself if you wish.~ */
= @20 /* ~Well, I guess we have to go now. Again, thank you so much for your help! I won't tell anybody... at least I will try not to.~ */
IF ~~ THEN + ending_chain
END





APPEND ~C#Q03008~

IF ~Global("C#Q03_TalkedToMother","GLOBAL",0)
!Alignment(Player1,19)
!Alignment(Player1,35)
!Alignment(Player1,51)
!ReputationLT(PLayer1,9)~ THEN mother_blackwood
SAY @21
++ @22 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",1)~ + mother_blackwood_01
++ @23 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",1)~ + mother_blackwood_02
++ @24 EXIT
END

IF ~~ THEN mother_blackwood_01
SAY @25
IF ~~ THEN EXIT
END

IF ~~ THEN mother_blackwood_02
SAY @26
IF ~~ THEN EXIT
END

IF ~Global("C#Q03_TalkedToMother","GLOBAL",1)~ THEN mother_blackwood_03
SAY @27
++ @28 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",2)~ + mother_blackwood_04
++ @29 EXIT
END

IF ~Global("C#Q03_TalkedToMother","GLOBAL",2)~ THEN mother_blackwood_03b
SAY @27
+ ~Global("C#Q03_Babysitter1","GLOBAL",1)~ + @30 + mother_blackwood_05
+ ~Class(PLayer1,PALADIN)~ + @31 + mother_blackwood_09
+ ~!Class(PLayer1,PALADIN) ReputationGT(PLayer1,12)~ + @31 + mother_blackwood_09
+ ~!Class(PLayer1,PALADIN) ReputationLT(PLayer1,13) !PartyHasItem("X#CBABY")~ + @32 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",4)~ + mother_blackwood_08
+ ~!Class(PLayer1,PALADIN) ReputationLT(PLayer1,13) PartyHasItem("X#CBABY")~ + @32 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",4)~ + mother_blackwood_08b
+ ~Global("C#Q03_Babysitter1","GLOBAL",0)~ + @33 EXIT
++ @34 EXIT
END

IF ~~ THEN mother_blackwood_04
SAY @35
+ ~Global("C#Q03_Babysitter1","GLOBAL",1)~ + @30 + mother_blackwood_05
+ ~Class(PLayer1,PALADIN)~ + @31 + mother_blackwood_09
+ ~!Class(PLayer1,PALADIN) ReputationGT(PLayer1,12)~ + @31 + mother_blackwood_09
+ ~!Class(PLayer1,PALADIN) ReputationLT(PLayer1,13) !PartyHasItem("X#CBABY")~ + @32 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",4)~ + mother_blackwood_08
+ ~!Class(PLayer1,PALADIN) ReputationLT(PLayer1,13) PartyHasItem("X#CBABY")~ + @32 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",4)~ + mother_blackwood_08b
+ ~Global("C#Q03_Babysitter1","GLOBAL",0)~ + @36 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",2)~ EXIT
++ @37 EXIT
+ ~!Class(PLayer1,PALADIN)~ + @38 EXIT
END

IF ~~ THEN mother_blackwood_05
SAY @39
IF ~~ THEN DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",3) SetGlobal("C#Q03_MotherMeetsTina","GLOBAL",1) SetGlobal("C#Q03_Babysitter1","GLOBAL",2) ActionOverride("C#Q03009",EscapeArea()) ActionOverride("C#Q03010",EscapeArea())
SetGlobalTimer("C#Q03_BabysitterTimer_1","GLOBAL",300) EscapeArea()~ EXIT
END

IF ~Global("C#Q03_TalkedToMother","GLOBAL",3)~ THEN mother_blackwood_06
SAY @40
++ @41 + mother_blackwood_07
++ @42 EXIT
++ @43 EXIT
END

IF ~~ THEN mother_blackwood_07
SAY @44
+ ~Class(PLayer1,PALADIN)~ + @45 + mother_blackwood_09
+ ~!Class(PLayer1,PALADIN) ReputationGT(PLayer1,12)~ + @45 + mother_blackwood_09
+ ~!Class(PLayer1,PALADIN) ReputationLT(PLayer1,13) !PartyHasItem("X#CBABY")~ + @32 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",4)~ + mother_blackwood_08
+ ~!Class(PLayer1,PALADIN) ReputationLT(PLayer1,13) PartyHasItem("X#CBABY")~ + @32 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",4)~ + mother_blackwood_08b
++ @46 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",4)~ EXIT
++ @47 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",4)~ EXIT
END 

IF ~~ THEN mother_blackwood_08
SAY @48
IF ~~ THEN %UNSOLVED_JOURNAL% @10022 EXIT
END

IF ~~ THEN mother_blackwood_08b
SAY @50
IF ~~ THEN %UNSOLVED_JOURNAL% @10022 EXIT
END

IF ~~ THEN mother_blackwood_09
SAY @51
++ @52 + mother_blackwood_11
++ @53 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",5)~ %UNSOLVED_JOURNAL% @10023 EXIT
++ @55 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",6)~ %UNSOLVED_JOURNAL% @10024 EXIT
END

IF ~GlobalGT("C#Q03_TalkedToMother","GLOBAL",3)~ THEN mother_blackwood_10
SAY @27
+ ~Global("C#Q03_TalkedToMother","GLOBAL",5)~ + @57 + mother_blackwood_11
+ ~Global("C#Q03_TalkedToMother","GLOBAL",5)~ + @58 EXIT
+ ~Global("C#Q03_TalkedToMother","GLOBAL",4) !Class(PLayer1,PALADIN) ReputationLT(PLayer1,13) !Global("C#Q03_Babysitter1","GLOBAL",1)~ + @59 EXIT
+ ~Global("C#Q03_TalkedToMother","GLOBAL",4) !Class(PLayer1,PALADIN) ReputationLT(PLayer1,13)~ + @60 + mother_blackwood_10a
+ ~Global("C#Q03_Babysitter1","GLOBAL",1)~ + @30 + mother_blackwood_05
+ ~Global("C#Q03_TalkedToMother","GLOBAL",4) Class(PLayer1,PALADIN)~ + @61 + mother_blackwood_09
+ ~Global("C#Q03_TalkedToMother","GLOBAL",4) 
!Class(PLayer1,PALADIN) 
ReputationGT(PLayer1,12)~ + @61 + mother_blackwood_09
+ ~Global("C#Q03_TalkedToMother","GLOBAL",6)~ + @62 + mother_blackwood_11
++ @63 EXIT
END

IF ~~ THEN mother_blackwood_10a
SAY @64
IF ~~ THEN EXIT
END

IF ~~ THEN mother_blackwood_11
SAY @65
IF ~~ THEN DO ~SetGlobal("C#Q03_HelpMother","GLOBAL",1) GiveItem("C#Q03005",[PC]) GiveItem("C#Q03006",[PC]) GiveItem("C#Q03007",[PC]) GiveItem("C#Q03008",[PC]) GiveItem("C#Q03009",[PC]) GiveItem("C#Q03010",[PC]) GiveItem("C#Q03011",[PC]) GiveItem("C#Q03012",[PC]) EscapeArea()~ %UNSOLVED_JOURNAL% @10025 EXIT
END


/* evil PCs (or rep < 8) */


IF ~True()~ THEN mother_blackwood_toolowrep
SAY @0
+ ~Global("C#Q03_BulliedMother","GLOBAL",0)~ + @404 + evilPC_03
+ ~Global("C#Q03_BulliedMother","GLOBAL",0)~ + @405 + evilPC_02
+ ~Global("C#Q03_BulliedMother","GLOBAL",1)~ + @406 DO ~SetGlobal("C#Q03_BulliedMother","GLOBAL",2)~ + evilPC_04
+ ~Global("C#Q03_BulliedMother","GLOBAL",2)~ + @407 + evilPC_05 
++ @409 + evilPC_01
END

IF ~~ THEN evilPC_01
SAY @21
IF ~~ THEN EXIT
END

IF ~~ THEN evilPC_02
SAY @1
++ @408 DO ~SetGlobal("C#Q03_BulliedMother","GLOBAL",1)~ + evilPC_01
++ @409 + evilPC_01
END

IF ~~ THEN evilPC_03
SAY @410
IF ~~ THEN + evilPC_02
END

IF ~~ THEN evilPC_04
SAY @1
IF ~~ THEN EXIT
END

IF ~~ THEN evilPC_05
SAY @411
++ @412 + evilPC_06
++ @413 + evilPC_07
++ @409 + evilPC_01
END

IF ~~ THEN evilPC_07
SAY @415
++ @412 + evilPC_06
++ @409 + evilPC_01
END


END //APPEND




BEGIN ~C#Q03010~

IF ~GlobalGT("C#Q03_StageEnd","GLOBAL",0)~ THEN tom_end_01
SAY @67
IF ~~ THEN EXIT
END

IF ~Global("C#Q03_Stage7","GLOBAL",1)~ THEN tom_07_01
SAY @68
IF ~~ THEN EXIT
END

IF ~Global("C#Q03_Stage6","GLOBAL",1)~ THEN tom_06_01
SAY @69
IF ~~ THEN EXIT
END

IF ~Global("C#Q03_Stage5","GLOBAL",1)~ THEN tom_05_01
SAY @70
IF ~~ THEN EXIT
END

IF ~Global("C#Q03_Stage4","GLOBAL",1)~ THEN tom_04_01
SAY @71
IF ~~ THEN EXIT
END

IF ~Global("C#Q03_Stage3","GLOBAL",1)~ THEN tom_03_01
SAY @68
IF ~~ THEN EXIT
END



IF ~~ THEN tom_01
SAY @72
++ @73 DO ~ActionOverride("C#Q03009",TakePartyItemAll("C#Q03005")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03006")) SetGlobal("C#Q03_Stage2","GLOBAL",1)~ EXIT
++ @74 DO ~SetGlobal("C#Q03_Stage1","GLOBAL",1)~ EXIT
END

IF ~~ THEN tom_01a
SAY @72
++ @75 + tom_01
++ @73 DO ~ActionOverride("C#Q03009",TakePartyItemAll("C#Q03005")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03006")) SetGlobal("C#Q03_Stage2","GLOBAL",1)~ EXIT
++ @74 DO ~SetGlobal("C#Q03_Stage1","GLOBAL",1)~ EXIT
END

IF ~~ THEN tom_07_02
SAY @76
++ @77 + tom_07_03
++ @78 + tom_07_03
++ @79 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
END

IF ~~ THEN tom_07_03
SAY @80
++ @81 + tom_07_04
++ @79 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
END

BEGIN ~C#Q03009~

IF ~~ THEN sarah_sweets_01
SAY @82
++ @83 DO ~ActionOverride("C#Q03009",TakePartyItemAll("C#Q03009")) ActionOverride("C#Q03009",DestroyItem("C#Q03009")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03010")) ActionOverride("C#Q03009",DestroyItem("C#Q03010")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03011")) ActionOverride("C#Q03009",DestroyItem("C#Q03011")) SetGlobal("C#Q03_Stage3","GLOBAL",1)~ + sarah_sweets_02
++ @84 DO ~SetGlobal("C#Q03_Stage2","GLOBAL",2)~ EXIT 
++ @85 DO ~SetGlobal("C#Q03_Stage2","GLOBAL",2)~ EXIT
END

IF ~~ THEN sarah_sweets_02
SAY @86
++ @87 EXIT 
++ @88 EXIT  
++ @89 EXIT
END

IF ~~ THEN sarah_03_02
SAY @90
++ @91 + sarah_03_03
++ @92 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT
++ @93 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_03_03
SAY @94
++ @95 + sarah_03_04
++ @92 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT
++ @93 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_03_04
SAY @96
++ @97 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT
++ @92 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT
++ @93 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT
END

IF ~GlobalGT("C#Q03_StageEnd","GLOBAL",0)~ THEN sarah_end_01
SAY @98
IF ~~ THEN EXIT
END

IF ~Global("C#Q03_Stage7","GLOBAL",1)~ THEN sarah_07_01
SAY @99 
++ @100 + sarah_07_02
++ @101 + sarah_07_02
++ @79 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_07_02
SAY @102
++ @103 + sarah_07_03
++ @104 + sarah_07_03
++ @79 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_07_03
SAY @105
++ @106 + sarah_07_04
++ @107 + sarah_07_04
++ @79 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_07_04
SAY @108
++ @109 + sarah_07_05
++ @110 + sarah_07_05
++ @111 + sarah_07_05
++ @79 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_07_05
SAY @112
++ @113 EXTERN C#Q03010 tom_07_02
++ @79 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_07_06
SAY @114
++ @115 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
++ @116 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT
END

IF ~Global("C#Q03_Stage6","GLOBAL",1)~ THEN sarah_06_01
SAY @117
++ @118 + sarah_06_02
+ ~Global("C#Q03_SarahDrink","LOCALS",1)~ + @119 + sarah_06_02
++ @120 + sarah_06_02
END

IF ~Global("C#Q03_Stage5","GLOBAL",1)~ THEN sarah_05_01
SAY @121
++ @122 + sarah_05_02
++ @123 + sarah_05_02
++ @124 + sarah_05_02
++ @125 + sarah_05_02
END

IF ~~ THEN sarah_05_02
SAY @126
= @127
IF ~~ THEN + sarah_05_03
END

IF ~~ THEN sarah_05_03
SAY @128
++ @129 + sarah_05_04
++ @130 + sarah_05_04
++ @79 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_04
SAY @131
= @132
++ @133 + sarah_05_05
++ @134 + sarah_05_05
++ @135 + sarah_05_05
++ @79 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_05
SAY @136
++ @122 + sarah_05_06
++ @124 + sarah_05_06
++ @79 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_06
SAY @137
= @138
++ @139 + sarah_05_09
++ @140 + sarah_05_07
++ @141 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_07
SAY @142
++ @143 + sarah_05_08
++ @144 + sarah_05_08
++ @145 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_08
SAY @146
++ @147 + sarah_05_08b
++ @145 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_08b
SAY @146
++ @147 + sarah_05_08c
++ @145 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_08c
SAY @146
++ @147 + sarah_05_08d
++ @148 + sarah_05_09
++ @145 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_08d
SAY @149
++ @150 + sarah_05_08c
++ @148 + sarah_05_09
++ @151 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_09
SAY @152
++ @153 DO ~SetGlobal("C#Q03_SarahDrink","LOCALS",1)~ + sarah_05_10
++ @144 DO ~SetGlobal("C#Q03_SarahDrink","LOCALS",1)~ + sarah_05_08
++ @145 DO ~SetGlobal("C#Q03_SarahDrink","LOCALS",1) SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_05_10
SAY @154
++ @155 + sarah_05_09
++ @156 + sarah_05_08
++ @145 DO ~SetGlobal("C#Q03_Stage6","GLOBAL",1)~ EXIT
END


IF ~Global("C#Q03_Stage4","GLOBAL",1)~ THEN sarah_04_01
SAY @157
++ @158 EXTERN C#Q03010 tom_dirt_01
++ @159 EXTERN C#Q03010 tom_dirt_01
++ @160 DO ~SetGlobal("C#Q03_Stage5","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_03
SAY @161
++ @162 + sarah_06_04
++ @163 + sarah_06_04
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_04
SAY @165
++ @166 + sarah_06_05
++ @167 + sarah_06_05
++ @168 + sarah_06_05
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_05
SAY @169
++ @170 + sarah_06_06
++ @171 + sarah_06_06
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_06
SAY @172
++ @173 + sarah_06_07
++ @163 + sarah_06_07
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_07
SAY @174
++ @175 + sarah_06_08
++ @176 + sarah_06_08
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_08
SAY @177
++ @178 + sarah_06_09
++ @179 + sarah_06_09
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_09
SAY @180
++ @181 + sarah_06_10
++ @182 + sarah_06_10
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_10
SAY @183
++ @184 + sarah_06_11
++ @185 + sarah_06_11
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END

IF ~~ THEN sarah_06_11
SAY @186
++ @187 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT 
++ @188 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT
END


CHAIN
IF ~~ THEN C#Q03010 tom_dirt_01
@189
== C#Q03009 @190
== C#Q03010 @189
== C#Q03009 @191
== C#Q03010 @192
== C#Q03009 @193
== C#Q03010 @194
== C#Q03009 @195
END
++ @196 DO ~SetGlobal("C#Q03_Stage5","GLOBAL",1)~ EXIT
++ @197 DO ~SetGlobal("C#Q03_Stage5","GLOBAL",1)~ EXIT
++ @160 DO ~SetGlobal("C#Q03_Stage5","GLOBAL",1)~ EXIT

CHAIN
IF ~~ THEN C#Q03010 tom_07_04
@198
== C#Q03009 @199
== C#Q03010 @198
== C#Q03009 @190
== C#Q03010 @198
== C#Q03009 @200
== C#Q03010 @198
== C#Q03009 @201
== C#Q03010 @198
== C#Q03009 @201
END
++ @202 EXTERN C#Q03009 sarah_07_06
++ @203 EXTERN C#Q03009 sarah_07_06 
++ @204 DO ~SetGlobal("C#Q03_StageEnd","GLOBAL",1)~ EXIT

CHAIN
IF ~Global("C#Q03_Stage3","GLOBAL",1)~ THEN C#Q03009 sarah_03_01
@205
== C#Q03009 @206
== C#Q03010 @207
END
++ @208 + sarah_03_02
++ @209 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT 
++ @93 DO ~SetGlobal("C#Q03_Stage4","GLOBAL",1)~ EXIT

CHAIN
IF ~~ THEN C#Q03009 sarah_06_02
@210
= @211
== C#Q03010 @212
== C#Q03009 @213
END
++ @214 + sarah_06_03
++ @215 + sarah_06_03
++ @164 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03008")) ActionOverride("C#Q03009",TakePartyItemAll("C#Q03007")) SetGlobal("C#Q03_Stage7","GLOBAL",1)~ EXIT

CHAIN
IF ~Global("C#Q03_Stage2","GLOBAL",2)~ THEN C#Q03010 tom_04
@216
== C#Q03009 @217
== C#Q03010 @216
== C#Q03009 @218
== C#Q03010 @216
== C#Q03009 @219
== C#Q03010 @220
== C#Q03009 @217
END
++ @83 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03009")) ActionOverride("C#Q03010",DestroyItem("C#Q03009")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03010")) ActionOverride("C#Q03010",DestroyItem("C#Q03010")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03011")) ActionOverride("C#Q03010",DestroyItem("C#Q03011")) SetGlobal("C#Q03_Stage3","GLOBAL",1)~ EXTERN C#Q03009 sarah_sweets_02
++ @221 DO ~ActionOverride("C#Q03010",TakePartyItemAll("C#Q03009")) ActionOverride("C#Q03010",DestroyItem("C#Q03009")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03010")) ActionOverride("C#Q03010",DestroyItem("C#Q03010")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03011")) ActionOverride("C#Q03010",DestroyItem("C#Q03011")) SetGlobal("C#Q03_Stage3","GLOBAL",1)~ EXTERN C#Q03009 sarah_sweets_02


CHAIN
IF ~Global("C#Q03_Stage2","GLOBAL",1)~ THEN C#Q03010 tom_03
@222
== C#Q03009 @223
== C#Q03010 @216
== C#Q03009 @218
== C#Q03010 @216
== C#Q03009 @224
== C#Q03010 @220
END
++ @225 EXTERN C#Q03009 sarah_sweets_01
++ @226 EXTERN C#Q03009 sarah_sweets_01 
++ @227 DO ~SetGlobal("C#Q03_Stage2","GLOBAL",2)~ EXIT  

CHAIN
IF ~Global("C#Q03_Stage1","GLOBAL",1)~ THEN C#Q03010 tom_02
@228
== C#Q03009 @229
== C#Q03010 @72
== C#Q03009 @230
== C#Q03010 @228
== C#Q03009 @231
END
++ @232 DO ~ActionOverride("C#Q03009",TakePartyItemAll("C#Q03005")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03006")) SetGlobal("C#Q03_Stage2","GLOBAL",1)~ EXIT
++ @233 DO ~ActionOverride("C#Q03009",TakePartyItemAll("C#Q03005")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03006")) SetGlobal("C#Q03_Stage2","GLOBAL",1)~ EXIT

APPEND C#Q03009 

IF  ~Global("C#Q03_Stage2","GLOBAL",2)~ THEN sarah_stage_2_2
SAY @234
IF ~~ THEN EXIT
END

IF  ~Global("C#Q03_Stage2","GLOBAL",1)~ THEN sarah_stage_2_1
SAY @235
IF ~~ THEN EXIT
END

IF  ~Global("C#Q03_Stage1","GLOBAL",1)~ THEN sarah_stage_1
SAY @236
IF ~~ THEN EXIT
END

END //APPEND

CHAIN
IF ~Global("C#Q03_HelpMother","GLOBAL",1) Global("C#Q03_Stage2","GLOBAL",0)~ THEN C#Q03009 sarah @237
== C#Q03010 @238
== C#Q03009 @239
== C#Q03010 @228
== C#Q03009 @230
== C#Q03010 @228
== C#Q03009 @240
END
++ @232 DO ~ActionOverride("C#Q03009",TakePartyItemAll("C#Q03005")) ActionOverride("C#Q03010",TakePartyItemAll("C#Q03006")) SetGlobal("C#Q03_Stage2","GLOBAL",1)~ EXIT
++ @241 EXTERN C#Q03010 tom_01a
++ @242 EXTERN C#Q03010 tom_01a
++ @243 EXTERN C#Q03010 tom_01


BEGIN ~C#Q03011~

IF ~Global("C#Q03_Babysitter1","GLOBAL",0)~ THEN tina
SAY @244
++ @245 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",1)~ + tina_01b
++ @246 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",1)~ + tina_01
++ @247 EXIT
END

IF ~~ THEN tina_01
SAY @248
+ ~!PartyHasItem("X#CBABY")~ + @249 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",2)~ + tina_05
+ ~!PartyHasItem("X#CBABY") Global("C#Q03_HelpMother","GLOBAL",0) GlobalGT("C#Q03_TalkedToMother","GLOBAL",0)~ + @250 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",2)~ + tina_06
+ ~!PartyHasItem("X#CBABY")~ + @251 EXIT
IF ~PartyHasItem("X#CBABY")~ THEN + tina_02
END

IF ~~ THEN tina_01b
SAY @252
+ ~!PartyHasItem("X#CBABY")~ + @249 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",2)~ + tina_05
+ ~!PartyHasItem("X#CBABY") Global("C#Q03_HelpMother","GLOBAL",0) GlobalGT("C#Q03_TalkedToMother","GLOBAL",0)~ + @250 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",2)~ + tina_06
+ ~!PartyHasItem("X#CBABY")~ + @251 EXIT
IF ~PartyHasItem("X#CBABY")~ THEN + tina_02
END

IF ~~ THEN tina_02
SAY @253
++ @249 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",2)~ + tina_05
+ ~Global("C#Q03_HelpMother","GLOBAL",0) GlobalGT("C#Q03_TalkedToMother","GLOBAL",0)~ + @250 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",2)~ + tina_06
++ @254 EXIT
END

IF ~Global("C#Q03_MotherMeetsTina","GLOBAL",1)~ THEN tina_03
SAY @255
++ @256 DO ~SetGlobal("C#Q03_MotherMeetsTina","GLOBAL",2)~ + tina_08
++ @257 DO ~SetGlobal("C#Q03_MotherMeetsTina","GLOBAL",2)~ + tina_06
++ @258 DO ~SetGlobal("C#Q03_MotherMeetsTina","GLOBAL",2)~ + tina_06
++ @259 EXIT
END

IF ~!Global("C#Q03_MotherMeetsTina","GLOBAL",1) GlobalGT("C#Q03_Babysitter1","GLOBAL",0)~ THEN tina_04
SAY @260
++ @249 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",2)~ + tina_05
+ ~!Global("C#Q03_Babysitter1","GLOBAL",2) Global("C#Q03_HelpMother","GLOBAL",0) GlobalGT("C#Q03_TalkedToMother","GLOBAL",0)~ + @250 DO ~SetGlobal("C#Q03_Babysitter1","GLOBAL",2)~ + tina_06
+ ~Global("C#Q03_Babysitter1","GLOBAL",2)~ + @286 + tina_09
++ @261 EXIT
END

IF ~~ THEN tina_05
SAY @262
++ @263 + tina_09
++ @264 + tina_10
++ @265 + tina_07
END

IF ~~ THEN tina_06
SAY @266
++ @263 + tina_09
++ @264 + tina_10
++ @265 + tina_07
END

IF ~~ THEN tina_07
SAY @267
IF ~~ THEN DO ~MoveToPoint([2359.3435])~ EXIT
END

IF ~~ THEN tina_08
SAY @268
++ @263 + tina_09
++ @264 + tina_10
++ @265 + tina_07
END

IF ~~ THEN tina_09
SAY @269
+ ~PartyGoldGT(4)~ + @270 + tina_11
+ ~PartyGoldGT(19)~ + @271 + tina_11
+ ~PartyGoldLT(5)~ + @272 + tina_07
++ @273 + tina_07 
END

IF ~~ THEN tina_10
SAY @274
++ @275 + tina_09
++ @276 + tina_09
++ @277 + tina_09
++ @273 + tina_07 
END

IF ~~ THEN tina_11
SAY @278
= @279
++ @280 + tina_12
++ @281 + tina_12
++ @282 + tina_13
END

IF ~~ THEN tina_12
SAY @283
IF ~~ THEN + tina_14
END

IF ~~ THEN tina_13
SAY @284
IF ~~ THEN + tina_14
END

IF ~~ THEN tina_14
SAY @285
IF ~~ THEN DO ~EscapeArea()~ EXIT
END


BEGIN ~C#Q03015~

IF ~Global("C#Q03_BulliedMother","GLOBAL",6)~ THEN bully
SAY @416
IF ~~ THEN DO ~
%ERASEJOURNALENTRY_10065%
SetGlobal("C#Q03_BulliedMother","GLOBAL",7) 
Enemy()
ActionOverride("C#Q03016",Enemy()) 
ActionOverride("C#Q03017",Enemy()) 
ActionOverride("C#Q03018",Enemy())
Attack([PC])
ActionOverride("C#Q03016",Attack([PC])) 
ActionOverride("C#Q03017",Attack([PC])) 
ActionOverride("C#Q03018",Attack([PC]))~ %SOLVED_JOURNAL% @10066 EXIT
END



CHAIN
IF ~~ THEN C#Q03008 ending_chain
@291 

== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @417

== %VICONIA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @292

== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)
InParty("VICONIA") Detect("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN @418

== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @419

== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @420

== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @421

== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @422

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @423

== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)
InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @424

== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)
InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @425

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @426

== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID) InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @427

== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @428

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @293

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @295

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @294

== %TIAX_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("TIAX") Detect("TIAX") !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN @296

== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @297

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @298

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @299

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @300

== %YESLICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("YESLICK") Detect("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @301

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @302

== %KIVAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KIVAN") Detect("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN @303

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @304

== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @305

== %QUAYLE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("QUAYLE") Detect("QUAYLE") !StateCheck("QUAYLE",CD_STATE_NOTVALID)~ THEN @306

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @307

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @308

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @309

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @310

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @311

== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @403

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @312

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @313

== %DYNAHEIR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("DYNAHEIR") Detect("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @314

== %ALORA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ALORA") Detect("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @315

== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @316 

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @317

== %SAFANA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN @318

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @319

== %SKIE_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SKIE") Detect("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @400

== %CORAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("CORAN") Detect("CORAN") !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN @401

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @402

END
IF ~~ THEN DO ~
%ERASEJOURNALENTRY_10022%
%ERASEJOURNALENTRY_10023%
%ERASEJOURNALENTRY_10024%
%ERASEJOURNALENTRY_10025%
SetGlobal("C#Q03_HelpMother","GLOBAL",2) 
ActionOverride("C#Q03008",TakePartyItemAll("C#Q03009"))
ActionOverride("C#Q03008",TakePartyItemAll("C#Q03010"))
ActionOverride("C#Q03008",TakePartyItemAll("C#Q03011"))
ActionOverride("C#Q03008",TakePartyItemAll("C#Q03012"))
SetGlobal("C#Q03_StageEnd","GLOBAL",4) 
AddexperienceParty(300) 
ActionOverride("C#Q03009",EscapeArea()) 
ActionOverride("C#Q03010",EscapeArea()) 
ActionOverride("C#Q03008",EscapeArea())~ %SOLVED_JOURNAL% @10021 EXIT


CHAIN
IF ~~ THEN C#Q03008 evilPC_06
@414

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @429

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @430

== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @431

== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @432

== %SHARTEEL_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SHARTEEL") Detect("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN @441

== %FALDORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("FALDORN") Detect("FALDORN") !StateCheck("FALDORN",CD_STATE_NOTVALID)~ THEN @442

== %BRANWEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BRANWEN") Detect("BRANWEN") !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN @433

== %KAGAIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KAGAIN") Detect("KAGAIN") !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @434

== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @435
== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @436

== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @438

== %XAN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XAN") Detect("XAN") !StateCheck("XAN",CD_STATE_NOTVALID)~ THEN @439

== %ELDOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("ELDOTH") Detect("ELDOTH") !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN @440

== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @437

== %BAELOTH_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("BAELOTH") Detect("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @443


END
IF ~~ THEN DO ~SetGlobal("C#Q03_BulliedMother","GLOBAL",5)
ReputationInc(-1)
ActionOverride("C#Q03009",EscapeArea()) 
ActionOverride("C#Q03010",EscapeArea()) 
ActionOverride("C#Q03008",EscapeArea())~ %UNSOLVED_JOURNAL% @10065 EXIT