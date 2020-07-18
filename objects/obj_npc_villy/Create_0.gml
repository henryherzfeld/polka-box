/// @description Insert description here
// You can write your code in this editor
event_inherited();

idle_movement = true;
moving = false;

spd = .5;
idle_range = 5;
idle_sleep_max = 500;
idle_sleep_min = 200;
counter = irandom_range(idle_sleep_min, idle_sleep_max);

facing = 180;

x_move = 0;
y_move = 0;

x_dest = -1;
y_dest = -1;

xx = x;
yy = y;

name = "Villy";

portraits[enum_portrait.angry] = spr_portrait_villy_angry;
portraits[enum_portrait.happy] = spr_portrait_villy_happy;
portraits[enum_portrait.neutral] = spr_portrait_villy_neutral;
portraits[enum_portrait.sad] = spr_portrait_villy_sad;

var temp = dialogue.dialogues[? obj_npc_villy];
text = temp[irandom_range(0, 2)];
show_debug_message(text);