/// @description Insert description here
// You can write your code in this editor

counter = irandom_range(0,100);
holding = spr_inventory_item_pitchfork;
draw_y = 10;

scr_event_register_script(event.rain, id, scr_change_variable, id, "holding", spr_test_umberella);