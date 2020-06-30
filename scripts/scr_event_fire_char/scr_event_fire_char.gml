////@description scr_event_fire_char
///@arg0 action
///@arg1 char

var action = argument0;
var char = argument1
var ev_action = noone;
var ev_char = noone;

switch action {
	case action.talk: ev_action = event.talk;
}

switch char {
	case npc_green_villy: ev_char = event.talk_green_villy; break;
	case obj_npc_weeraway: ev_char = event.talk_weeraway; break;
	case obj_npc_poppy: ev_char = event.talk_poppy; break;
	case obj_npc_baron: ev_char = event.talk_baron; break;
	case obj_npc_chieftain: ev_char = event.talk_cheiftain; break;
	case obj_npc_shopkeeper: ev_char = event.talk_shopkeeper; break;
}

if ev_action != noone scr_event_fire(ev_action);
if ev_char != noone scr_event_fire(ev_char);