///@description scr_fire_lg_noti
///@argument0 text
///@argument1 bg_color
///@argument2 text_color
function scr_fire_lg_noti(argument0, argument1, argument2) {


	obj_overlay.draw_lg_noti = true;
	obj_overlay.lg_noti_text = argument0;
	obj_overlay.noti_lg_bg_col = argument1;
	obj_overlay.noti_lg_text_col = argument2;



}
