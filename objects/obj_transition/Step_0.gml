/// @description Insert description here
if disable or not draw exit;

count += 1;

if not ((count+1) mod (2*room_speed)) {
	part_emitter_burst(system_ptr, emitter_bg, part_bg2, 20);
} else {
	part_emitter_burst(system_ptr, emitter_bg, part_bg1, 0);
}
//part_emitter_stream(system_ptr, emitter_fg, part_fg, 2);
//part_emitter_stream(system_ptr, emitter_bg, part_bg, 1);

part_emitter_burst(system_ptr, emitter_fg, part_fg, 1);