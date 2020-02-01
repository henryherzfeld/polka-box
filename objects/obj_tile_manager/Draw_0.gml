/// @description Insert description here

var cs = cell_size;
var xx = x_proj div cs;
var yy = y_proj div cs;

xx = xx*cs;
yy = yy*cs;





if(game.debug){
	draw_circle_color(x_proj, y_proj, 12, c_yellow, c_yellow, true);
	draw_rectangle_color(xx, yy, xx+cs, yy+cs, c_navy, c_navy, c_navy, c_navy, true);
}