   /// @description Villy Poppy - dialogue part 1

event_inherited();

text = ds_map_create();    

text[? "GREET"] = ["Hi", "Go away!", ["EXIT", "GREET"], [polka, id]]
text[? "EXIT"] = ["Hm, okay.", [], [polka]]	

name = "Villy Poppy";
portrait = spr_portrait;