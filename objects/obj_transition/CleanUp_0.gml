/// @description Insert description here

if part_initialized {
	part_emitter_destroy_all(system_ptr);
	part_type_destroy(part_fg);
	part_type_destroy(part_bg1);
	part_type_destroy(part_bg2);
	part_system_destroy(system_ptr);
}