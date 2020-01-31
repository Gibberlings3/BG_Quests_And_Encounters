/* Drunk, in Area Beregost temple */

/* NPC reactions to the drunk */


I_C_T %tutu_var%drunk 4 c#q12_Drunk
== %tutu_var%drunk IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)~ THEN @0
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @1
== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @2
== %XZAR_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("XZAR") Detect("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @3
//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @31
== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @4
== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @5
== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @6
== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @7
//Neera
== %NEERA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("NEERA") Detect("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @32
== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @8
//Rasaad
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @33
== %RASAAD_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("RASAAD") Detect("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @34
== %tutu_var%drunk IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)~ THEN @9 DO ~SetGlobal("C#Q12_FoundDrunk","GLOBAL",1) AddJournalEntry(@10062%QUEST%)~ 
END 


APPEND %tutu_var%drunk

IF WEIGHT #-1
~NumTimesTalkedTo(1)~ THEN drunk_01
SAY @10
++ @11 + drunk_02
++ @12 + 1
++ @13 + drunk_02
END

IF ~~ THEN drunk_02 
SAY @14
IF ~~ THEN EXIT
END

IF WEIGHT #-1
 ~NumTimesTalkedTo(2)~ THEN drunk_03
SAY @16
++ @37 + drunk_02 
++ @39 + drunk_04
++ @40 + drunk_04
END

IF ~~ THEN drunk_04
SAY @38
IF ~~ THEN EXIT
END

END //APPEND

/* Inside the temple */

EXTEND_BOTTOM %tutu_var%KELDDA 0
+ ~Global("C#Q12_FoundDrunk","GLOBAL",1)~ + @17 + drunk
END

APPEND %tutu_var%KELDDA

IF ~~ THEN drunk
SAY @18
= @19
IF ~~ THEN DO ~SetGlobal("C#Q12_FoundDrunk","GLOBAL",2) 
AddexperienceParty(100) %ERASEJOURNALENTRY_10062%~ %SOLVED_JOURNAL%
@10063 EXIT
END


END //APPEND




/* Reaction of NPC if PC gives all the money */

I_C_T %tutu_var%drunk 1 c#q12_GaveAllmoney
== %tutu_var%drunk IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)~ THEN @21
== %IMOEN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @22
== %AJANTIS_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("AJANTIS") Detect("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @23
== %EDWIN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("EDWIN") Detect("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @24
== %MONTARON_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MONTARON") Detect("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN @25
== %KHALID_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("KHALID") Detect("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @26
== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @27
//Dorn
== %DORN_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @35
//Jaheira (Dorn)
== %JAHEIRA_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("JAHEIRA") Detect("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID) InParty("DORN") Detect("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @36
== %MINSC_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("MINSC") Detect("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @28
== %GARRICK_JOINED% IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("GARRICK") Detect("GARRICK") !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN @29
== %tutu_var%drunk IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)~ THEN @30
END


