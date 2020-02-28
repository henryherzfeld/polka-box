/// @description Insert description here

scr_init_badges();

input_badge = ord("B");
bg_col = c_olive;
draw = false;

header = "Badges"

badge_def = ds_grid_create(enum_badge_type.length, enum_badge_state.length);

badge_x = 100;
badge_y = 100;
badge_x_offset = 200;

scr_badge_add_data(enum_badge_type.complete, spr_badge_lvl_complete, spr_badge_lvl_complete, "Achiever", "Complete the Level", false);
scr_badge_add_data(enum_badge_type.highscore, spr_badge_score, spr_badge_score, "Score Master", "Get a Highscore", false);
scr_badge_add_data(enum_badge_type.time, spr_badge_time, spr_badge_time, "Time Attack", "Beat the Clock", false);

badge_width = sprite_get_width(badge_def[0, enum_badge_state.sprite_col]);
badge_height = sprite_get_height(badge_def[0, enum_badge_state.sprite_col]);