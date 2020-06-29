////@description scr_event_fire_char
///@arg0 action
///@arg1 char

var temp = argument0;
var ev1 = noone;
var ev2 = noone;

switch argument0 {
	case action.talk: ev1 = event.talk; 
}

switch argument1 {
	case obj_npc_weeraway: ev2 = event.talk_weeraway; break;
}

if ev1 != noone scr_event_fire(ev1);
if ev2 != noone scr_event_fire(ev2);