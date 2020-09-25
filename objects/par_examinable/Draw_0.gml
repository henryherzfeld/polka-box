/// @description Insert description here
// You can write your code in this editor
draw_self();

if(polka.itemEquiped = enum_item_type.camera or polka.itemEquiped = enum_item_type.tensiometer
	or polka.itemEquiped = enum_item_type.tape){
	draw_text(x + sprite_width/2, y - sprite_height/4, "!");
}