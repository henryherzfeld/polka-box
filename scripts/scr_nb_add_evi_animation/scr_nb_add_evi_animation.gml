////@description scr_nb_add_evi_animation
///@arg0 evidence

var evi = argument0;

var cam_x = camera_get_view_width(view_camera[0]);
var cam_y = camera_get_view_height(view_camera[0]);

var x_conv = game.gui_width/cam_x;
var y_conv = game.gui_height/cam_y;
var start_x = (polka.x-4-camera_get_view_x(view_camera[0])) * x_conv;
var start_y = (polka.y-48-camera_get_view_y(view_camera[0])) * y_conv;

var inst = instance_create_layer(start_x, start_y, "Menus", ui_nb_evi_add);
inst.spr = obj_notebook.evi_def[evi, enum_evi_state.sprite];
inst.spr_h = sprite_get_height(inst.spr);
inst.spr_w = sprite_get_width(inst.spr);

inst.x_dest = obj_overlay.nb_x1-4*obj_tile_manager.cell_size;
inst.y_dest = obj_overlay.nb_y1;
inst.spd = 1;
inst.alarm[0] = room_speed;