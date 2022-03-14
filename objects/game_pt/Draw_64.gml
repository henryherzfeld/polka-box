/// @description Insert description here

// handle fade out and room change for transitions from player coll with transition object
if (do_transition) {
	if (room != spawn_room) {
		black_alpha += 0.1;
		
		if (black_alpha >= 1) {
			room_goto(spawn_room);
		}
	} else {
			//alarm[0] = 2 * room_speed;
			black_alpha -= 0.1;
			if (black_alpha <= 0){
				 do_transition = false;
			}
		}
} else {
	if drawing {
		if black_alpha <= .2 {
			black_alpha += 0.1;
		}
	}
}

if drawing or do_transition {
	// Draw fade
	draw_set_alpha(black_alpha);
	draw_rectangle_colour(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}

var m_but = 128;

// draw collectible count (coins and lives)
draw_text(gui_width-m_but, gui_height-m_but, "Star Coins: " + string(star_coins));
draw_text(gui_width-m_but, gui_height-m_but*1.25, "Coins: " + string(coins));
draw_text(gui_width-m_but, gui_height-m_but*1.5, "Lives : " + string(_lives));

if global.debug {
	var col1 = c_black;
} else {
	var col1 = c_ltgray;
}

if player.move_override {
	var col2 = c_black;
} else {
	var col2 = c_ltgray;
}

if debug_time_slowed {
	var col3 = c_black;
} else {
	var col3 = c_ltgray;
}

draw_rectangle_color(gui_width-m_but, m_but, gui_width, 0, col1, col1, col1, col1, false);
draw_text(gui_width-m_but, m_but/2, "Debug");
draw_rectangle_color(gui_width-m_but*2, m_but, gui_width-m_but, 0, col2, col2, col2, col2, false);
draw_text(gui_width-m_but*2, m_but/2, "Stop \nPlayer");
draw_rectangle_color(gui_width-m_but*3, m_but, gui_width-m_but*2, 0, col3, col3, col3, col3, false);
draw_text(gui_width-m_but*3, m_but/2, "Slow \nTime");
draw_rectangle_color(gui_width-m_but*4, m_but, gui_width-m_but*3, 0, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
draw_text(gui_width-m_but*4, m_but/2, "Reset");

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if input_draw_end {
	if mx < gui_width and mx > gui_width-m_but and my > 0 and my < m_but {
		global.debug = !global.debug;
	} else if mx < gui_width-m_but and mx > gui_width-m_but*2 and my > 0 and my < m_but {
		player.move_override = !player.move_override;
		debug_path_timeout = player.move_override;
	} else if mx < gui_width-m_but*2 and mx > gui_width-m_but*3 and my > 0 and my < m_but {
		debug_time_slowed = !debug_time_slowed;
		if debug_time_slowed {
			room_speed = 10;
		} else {
			room_speed = 60;
		}
	} else if mx < gui_width-m_but*3 and mx > gui_width-m_but*4 and my > 0 and my < m_but {
		scr_restart_room();
		exit;
	}
}

if(!global.debug) {exit;}

draw_set_color(c_black);

var yy = 15;
var m = 50;
var margin = m;
var xx = 15;

draw_text(xx, yy+margin, "Path ID:");
margin += m;
draw_text(xx, yy+margin, "Path Angle: ");
margin += m;
draw_text(xx, yy+margin, "Path Time: ");
margin += m;
draw_text(xx, yy+margin, "Path Type: ");
margin -= m*3;

var i = 0;
var margin2 = string_width("Path Angle: ");

// draw path grid contents to gui
repeat(ds_grid_width(path_grid)) {
	var grid_curr = path_grid[# i, path.path];
	if path_exists(grid_curr) {
		var j = 0;
		var acc = array_create(grid_h, 0);
		repeat(grid_h) {
			if j != path.objects {
				var txt = string(round(path_grid[# i, j]));
				draw_text(xx+margin2, yy+margin+(j*m), txt);
				acc[j] = string_width(txt + " ");
			}
			j += 1;
		}
		
		// get max width value from acc
		var _max = 0;
		var k = 0;
		repeat(grid_h) {
			var w_curr = acc[k];
			if w_curr > _max {
				_max = w_curr;
			}
			k += 1;
		}
		margin2 += _max
	}
	i += 1;
}

margin += m*(grid_h-1);
draw_text(xx, yy+margin, "Path idx: " + string(path_idx));
margin += m;
draw_text(xx, yy+margin, "# Paths: " + string(n_paths));
margin += m;
draw_text(xx, yy+margin, "Path End Buffer: " + string(path_ended_count))
margin += m;
draw_text(xx, yy+margin, "Ridden Path Idx: " + string(curr_path_idx));
margin += m;
draw_text(xx, yy+margin, "Grab Collision Buffer: " + string(path_coll_count));
margin += m;
draw_text(xx, yy+margin, "Jump Count: " + string(player.jump_count));
margin +=m;
draw_text(xx, yy+margin, "Player Ground Detection: " + string(player.on_ground));
margin +=m;
draw_text(xx, yy+margin, "Player Path Position: " + string(player.path_position));

draw_set_color(c_white);