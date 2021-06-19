/// @description Insert description here
// You can write your code in this editor


draw_text(800, 400 , text);

col = c_black;

var mx = device_mouse_x_to_gui(0);						
var my = device_mouse_y_to_gui(0);		

if(point_in_rectangle(mx, my, 700, 600, 900, 650)){
	col = c_red;
	
	if(mouse_check_button_pressed(mb_left)) {
		send_event("Finish" , "Clicked Continue", "");
		text = "The rest of Polka Box is not available at this time.";
		button_draw = false;
	}
}

if(button_draw){
draw_rectangle_color(700, 600, 900, 650, col, col, col, col, false);
draw_text(788, 624, "Keep Playing")
}