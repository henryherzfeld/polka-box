
text = ds_map_create(); 

text[? "GREET"] = ["What do you observe about the farmer's plants?", ["EXIT", "GREET"], [noone]]
text[? "EXIT"] = ["Leave", []]

var dialogue_scripts = [
	[scr_activate_objective, enum_objective_type.report_crops_to_poppy],
	[scr_deactivate_objective, enum_objective_type.examine_crops]
	];

if(scr_check_objective(enum_objective_type.examine_crops)){
	scripts = [
	[scr_create_textbox, text, "Field", spr_portrait, dialogue_scripts],
	]
}
