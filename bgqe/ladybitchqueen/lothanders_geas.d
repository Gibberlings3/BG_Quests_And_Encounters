/* Jalantha: PC can get the ban scroll without the book of wisdom
Alternative bei Jalantha

SetGlobal("HelpJalantha","GLOBAL",2) */

/* Jalantha: ~%tutu_var%JALANT~ 5
Ich möchte Euch nur um einen klitzekleinen Gefallen bitten. Das Fest des Sturmrufs steht bevor. Es wird das erste Mal sein, dass ich an diesem hohen Feiertag mit der Leitung der Zeremonien betraut bin. Damit diese Zeremonien reibungslos verlaufen, benötige ich einen Gegenstand der Macht, das so genannte Buch der Weisheit. Es befindet sich im Besitz der Priesterschaft im Tempel von Tymora, der von denen, die diese frivole Gottheit verehren, auch als "Haus der Dame" bezeichnet wird. Wenn Ihr mir dieses Buch verschafft, werde ich Euren Wunsch erfüllen. Wie lautet Euer Entschluss?
*/

EXTEND_BOTTOM ~%tutu_var%JALANT~ 5
++ @0 + wise_idea
END

APPEND ~%tutu_var%JALANT~
IF ~~ THEN wise_idea
SAY @1
  IF ~~ THEN REPLY @2 /* ~We don't like your offer.  We'll be off now.~ */ EXIT
  IF ~~ THEN REPLY @3 /* ~It looks as if we have no other choice, we're in.~ */ GOTO 6
++ @4 DO ~SetGlobal("C#q15_HelpJalantha","GLOBAL",1)~ + wise_idea_01
END

IF ~~ THEN wise_idea_01
SAY @5
  IF ~~ THEN REPLY @2 /* ~We don't like your offer.  We'll be off now.~ */ EXIT
++ @6 + 6
++ @7 + 11
END

IF WEIGHT #-1
~Global("HelpJalantha","GLOBAL",1) Global("C#q15_HelpJalantha","GLOBAL",1)~ THEN wise_idea_02
SAY @8
= @9 /* ~Good.  Take this; an incantation upon this scroll will dispel the geas upon your companion.~ */
  IF ~~ THEN DO ~GiveItem("%tutu_scripts%CRLJALA",LastTalkedToBy)
SetGlobal("C#q15_HelpJalantha","GLOBAL",2)
SetGlobal("ReturnedBook","GLOBAL",1)
SetGlobal("HelpJalantha","GLOBAL",2)
~ EXIT
END

END //APPEND

/* Chanthalas Ulbright, priest of the Lady: try to give back the Book of Wisdom if the PC didn't need it */

EXTEND_BOTTOM ~%tutu_var%CHANTH~ 0
+ ~PartyHasItem("%tutu_var%BOOK08") Global("C#q15_HelpJalantha","GLOBAL",2)~ + @10 + returnbook
END

APPEND ~%tutu_var%CHANTH~

IF ~~ THEN returnbook
SAY @11
IF ~~ THEN DO ~SetGlobal("C#q15_HelpJalantha","GLOBAL",3)~ EXIT
END

END






