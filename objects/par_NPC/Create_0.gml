/// @description Insert description here
// You can write your code in this editor

name = "Anonymous";
scripts = -1;
portrait = spr_portrait;
textbox = spr_textbox_grey;

text = ds_map_create();
 
text[? "GREET"] = ["Hi", "Hello " + game.name + "!", ["EXIT", "GREET"], [polka, id]];
text[? "EXIT"] = ["Bye.", [], [polka]];