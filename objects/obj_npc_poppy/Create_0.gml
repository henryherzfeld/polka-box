   /// @description Villy Poppy - dialogue part 1

event_inherited();

portraits[enum_portrait.angry] = spr_portrait_poppy_angry;
portraits[enum_portrait.happy] = spr_portrait_poppy_happy;
portraits[enum_portrait.neutral] = spr_portrait_poppy_neutral;
portraits[enum_portrait.sad] = spr_portrait_poppy_sad;

text = ds_map_create();    

text[? "GREET"] = ["Hi", "Hey " + game.name + ", I'm a little busy right now.", ["EXIT", "GREET"], [polka, id]]
text[? "EXIT"] = ["Oh, okay.", [], [polka]]	

name = "Villy Poppy";
portrait = spr_portrait_poppy;