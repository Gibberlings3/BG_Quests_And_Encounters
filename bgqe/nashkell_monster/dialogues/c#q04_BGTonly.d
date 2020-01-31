/* for BGT: state 35 replaces 1 if talked to Thalantyr more than three times */

EXTEND_BOTTOM %tutu_var%THALAN 35
+ ~PartyHasItem("C#Q04001") Global("C#Q04_ThalantyrSpider","LOCALS",0)~ + @72 + thalantyr
+ ~PartyHasItem("C#Q04001") Global("C#Q04_ThalantyrSpider","LOCALS",1)~ + @102 + thalantyr_06
END
