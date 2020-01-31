/* Give game cres in quest areas different dialogues (Tutu, BGT, BG:EE) */

APPEND %tutu_var%BOYBA2


IF WEIGHT #-1
~RandomNum(4,1) AreaCheck("%EBaldursGate_House6_L1%")~ THEN quest_dialog_01
SAY #4858
IF ~~ THEN EXIT
END

END

APPEND %tutu_var%GIRBA1

IF WEIGHT #-1
~RandomNum(4,2) AreaCheck("%EBaldursGate_House6_L1%")~ THEN quest_dialog_02
SAY #4861
IF ~~ THEN EXIT
END

END