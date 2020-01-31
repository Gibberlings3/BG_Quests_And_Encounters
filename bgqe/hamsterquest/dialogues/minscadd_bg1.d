/* addition to Minsc's dialogue, vanilla BG1 only */

APPEND %tutu_var%minscJ


IF WEIGHT #-1
~Global("C#Q10_MinskHasHamster","GLOBAL",2)~ THEN keep_hamster
SAY @62
IF ~~ THEN DO ~TakePartyItem("C#Q10001") SetGlobal("C#Q10_MinskHasHamster","GLOBAL",1)~ EXIT
END

END //APPEND