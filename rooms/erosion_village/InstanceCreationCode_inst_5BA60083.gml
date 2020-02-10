
text = ds_map_create(); 

text[? "GREET"] = ["What do you observe about the farmer's plants?", ["EXIT", "GREET"], [noone]]
text[? "EXIT"] = ["Leave", []]

var dialogue_scripts = [
	[scr_change_variable, flags.id, "report_crops_to_poppy", true],
	[scr_change_variable, flags.id, "examine_crops", false]
	];

if(flags.examine_crops){
	scripts = [
	[scr_create_textbox, text, "Field", spr_portrait, dialogue_scripts],
	]
}
