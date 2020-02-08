   /// @description Villy Poppy - dialogue part 1

event_inherited();

text = ds_map_create();    

text[? "GREET"] = ["Hi", "Hey " + game.name + ", I'm a little busy right now.", ["EXIT", "GREET"], [polka, id]]
text[? "EXIT"] = ["Oh, okay.", [], [polka]]	

name = "Villy Poppy";
portrait = spr_portrait_poppy;