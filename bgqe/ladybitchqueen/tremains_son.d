/* Tremain's son: sell him out to his church */

EXTEND_BOTTOM %tutu_var%CHANTH 0
+ ~!PartyHasItem("%tutu_var%MISC54") Global("HelpTremain","GLOBAL",1) Global("TremainMove","GLOBAL",0) Global("C#q15_TremainSellout","GLOBAL",0)~ + @0 DO ~SetGlobal("C#q15_TremainSellout","GLOBAL",1)~ + tremain_sellout
+ ~PartyHasItem("%tutu_var%MISC54") Global("HelpTremain","GLOBAL",1) !Global("C#q15_TremainSellout","GLOBAL",2)~ + @1 + tremain_sellout_01
END

APPEND %tutu_var%CHANTH 

IF ~~ THEN tremain_sellout
SAY @2
IF ~~ THEN DO ~SetGlobal("C#q15_TremainSellout","GLOBAL",1)~ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN %tutu_var%CHANTH tremain_sellout_01
@3
== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @5

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @8

== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @7
END
IF ~~ THEN DO ~SetGlobal("C#q15_TremainSellout","GLOBAL",2)
TakePartyItem("MISC54")
DestroyItem("MISC54")~ EXIT



/* Tremain will not be happy */

CHAIN 

IF WEIGHT #-1
~Global("HelpTremain","GLOBAL",1) Global("C#q15_TremainSellout","GLOBAL",2)~ THEN %tutu_var%TREMAI sellout
@4
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @6
END
IF ~~ THEN DO ~EraseJournalEntry(%tremain_journal_8%) SetGlobal("C#q15_TremainSellout","GLOBAL",3) ActionOverride("Varci",EscapeArea()) EscapeArea()~ EXIT
