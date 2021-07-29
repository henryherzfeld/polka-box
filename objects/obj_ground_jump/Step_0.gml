/// @description Insert description here

if game_pt.player.bbox_bottom < y {
	if coll_inst == noone {
		coll_inst = instance_create_layer(x, y, "Collisions", obj_ground);
		coll_inst.mask_index = mask_index;
		coll_inst.image_xscale = image_xscale;
		coll_inst.image_yscale = image_yscale;
	}
} else {
	if coll_inst != noone {
		instance_destroy(coll_inst);
		coll_inst = noone;
	}
}