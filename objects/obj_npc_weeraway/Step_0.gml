/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(polka.in_dialogue and game.find_weeraway){
	crying = false;
}

if (!crying){
	sprite_index = spr_weeraway_front;
} else{
	sprite_index = spr_weeraway_crying;
}