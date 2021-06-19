/// @description Insert description here
if disable exit;

//show_debug_message([in_procedural_room, next_room==room]);

if game.do_transition and in_procedural_room {
	game.spawn_room = next_room;
	in_procedural_room = false;
}




//show_debug_message([next_room, room]);
// hey if we did the transition and modified spawn room then lets test that it happened
// and disable the transition bool in dungeon manager so we can do this again