if(scr_check_objective(enum_objective_type.ero_examine_crops0) and not scr_check_objective(enum_objective_type.ero_examine_crops1)){
	scripts = [
	[scr_draw_notification, "What do you observe about the farmer's plants?"],
	[scr_event_fire, event.examine_crops],
	]
}