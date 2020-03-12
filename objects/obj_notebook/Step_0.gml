/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(notebook_key)){
	switch(draw_evidence){
		case true: draw_evidence = false; break;
		case false: draw_evidence = true; break;
	}
}