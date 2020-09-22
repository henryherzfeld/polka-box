////@description scr_draw_notification
///@description text

var inst = instance_create_layer(0, 0, "Meta", par_menu);

audio_play_sound(snd_prompt, 1, false);

with inst {
	window_map = ds_map_create();

	button_grid = ds_grid_create(1, 6);
	scr_grid_add_button(300, 400, "Close", enum_button_type.click, enum_button_event.exit_, []);

	scr_add_window("noti_main", 200, 200, argument0);

	curr_window = "noti_main";
}

return inst;