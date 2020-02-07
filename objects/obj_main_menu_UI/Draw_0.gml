/// @description Insert description here
// You can write your code in this editor
/*
draw_text(250, 40, "Use the Arrow Keys to Move");
draw_text(270, 90, "Press E to Interact");
draw_text(240, 140, "Click on an Item to Equip It");
draw_text(250, 190, "Press Space to Use an Item");
draw_text(270, 270, "Press Any Key to Begin");
*/

if(intro){
	draw_sprite(box, 0, 79, 104)
	draw_text_ext(90, 115, text[page], string_height(text[page]), box_width-30);
} else {
	draw_text(280, 320, "Press Enter to continue..");
}