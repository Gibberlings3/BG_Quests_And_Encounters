/* Give game cres in quest areas different dialogues 
BGT/Tutu version (AreaCheck() available) */

APPEND %tutu_var%MTOB8



IF WEIGHT #-1
~RandomNum(4,1) AreaCheck("%NBaldursGate_House1_L1%")~ THEN quest_dialog_01
SAY @0
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~RandomNum(4,2) AreaCheck("%NBaldursGate_House1_L1%")~ THEN quest_dialog_02
SAY @1
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~RandomNum(4,3) AreaCheck("%NBaldursGate_House1_L1%")~ THEN quest_dialog_03
SAY @2
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~RandomNum(4,4) AreaCheck("%NBaldursGate_House1_L1%")~ THEN quest_dialog_04
SAY @3
IF ~~ THEN EXIT
END



END
