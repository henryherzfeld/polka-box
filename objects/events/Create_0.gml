/// @description Insert description here

event_map = ds_map_create();

enum event {
	talk,
	pause,
	new_evidence,
	test,
	
	rain,
	
	examine_crops,
	
	talk_green_villy,
	talk_weeraway,
	talk_poppy,
	talk_baron,
	talk_cheiftain,
	talk_shopkeeper,
	
	use_camera,
	use_tensiometer,
	use_shovel,
	use_tape,
	length
}

enum action {
	talk,
	use,
	length,
}