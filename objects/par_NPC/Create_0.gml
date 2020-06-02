/// @description Insert description here
// You can write your code in this editor

name = "Anonymous";
scripts = -1;

portraits = array_create(enum_portrait.length, spr_portrait);

textbox = spr_textbox_grey;

text = ds_map_create();
 
text[? "GREET"] = ["Hi", "Hello " + game.name + "!", ["EXIT", "GREET"], [polka, id]];
text[? "EXIT"] = ["Bye.", [], [polka]];