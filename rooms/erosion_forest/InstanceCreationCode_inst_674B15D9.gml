
text = ds_map_create(); 

text[? "GREET"] = ["What do you observe about the farmer's plants?", ["EXIT", "GREET"], [noone]]
text[? "EXIT"] = ["Leave", []]

if(scr_check_objective(enum_objective_type.ero_examine_crops0) and not scr_check_objective(enum_objective_type.ero_examine_crops1)){
	scripts = [
	[scr_create_textbox, text, "Field", spr_portrait, [[scr_event_fire, event.examine_crops]]],
	]
}
