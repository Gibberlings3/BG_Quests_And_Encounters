ADD_STATE_TRIGGER %tutu_var%FARMBE 1 ~AreaCheck("%Beregost%")~
ADD_STATE_TRIGGER %tutu_var%FARMBE 1 ~!GlobalGT("WAFARM1","GLOBAL",0)~

ALTER_TRANS %tutu_var%FARMBE BEGIN 1 END BEGIN 0 END BEGIN "JOURNAL" ~@2006~ END
ALTER_TRANS %tutu_var%FARMBE BEGIN 1 END BEGIN 0 END BEGIN "EPILOGUE" ~GOTO WAFARM1~ END


APPEND ~%tutu_var%FARMBE~
IF ~~ THEN BEGIN WAFARM1
SAY @0
IF ~~ THEN REPLY @1 DO 
~
SetGlobal("WAFARM1","Global",1)
ActionOverride(Myself,EscapeArea())
CreateCreature("%tutu_var%FARM",[241.1123]%FACE_1%)~
%UNSOLVED_JOURNAL% @2004
EXIT
IF ~~ THEN REPLY @2 DO ~ActionOverride(Myself,EscapeArea())
CreateCreature("%tutu_var%FARM",[241.1123]%FACE_1%)~ EXIT
END
END