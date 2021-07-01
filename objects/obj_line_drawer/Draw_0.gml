/// @description draws the player and drawn lines for platforming, performs masking to hide player sprite behind line

if not surface_exists(surface_mask) {
	surface_mask = surface_create(room_width, room_height);
}

surface_set_target(surface_mask);
draw_clear_alpha(c_white, 0);

// draw player
draw_sprite_ext(polka_pt.sprite_index, 0, polka_pt.x, polka_pt.y, 1, 1, polka_pt.roll_degree, c_white, 1);

var mask_line = false;
if game_pt.curr_path_idx != -1 {
	mask_line = true;
} 

// iterate thru grid
var i = 0;
repeat(game_pt.max_paths) {
	var _objects = game_pt.path_grid[# i, path.objects];
	var _time = game_pt.path_grid[# i, path.time];
	var _angle = game_pt.path_grid[# i, path.angle];
	var mask_line = game_pt.curr_path_idx == i
	
	var j = 0;
	
	repeat(array_length_1d(_objects)) {
		var _object = _objects[j];
		if instance_exists(_object) {
			gpu_set_blendmode(bm_subtract);
			
			if _angle < 90 or _angle > 270 {
				var mod_x = sin(_angle*pi/180)*24;
				var mod_y = cos(_angle*pi/180)*24;
			} else {
				var mod_x = -sin(_angle*pi/180)*24;
				var mod_y = -cos(_angle*pi/180)*24;
			}
			
			if mask_line {
				draw_sprite_ext(spr_draw_line_subtract, 0, _object.x, _object.y, 1, 1, _angle, c_black, 1);
				draw_sprite_ext(spr_draw_line_subtract_tall, 0, _object.x+mod_x, _object.y+mod_y, 1, 1, _angle, c_black, 1);
			}

			gpu_set_blendmode(bm_normal);
			draw_sprite_ext(_object.sprite_index, 0, _object.x, _object.y, 1, 1, _angle, c_white, ((_time+80)/game_pt.path_timeout)*1.2);
			
		}
		j += 1;
	}
	i += 1;
}

surface_reset_target();
draw_surface(surface_mask, 0, 0);

if !global.debug { exit; }

// draw player x and y for debug
draw_circle_color(game_pt.player.x, game_pt.player.y, 5, c_black, c_black, false);