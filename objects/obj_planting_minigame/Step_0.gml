/// @description Insert description here

// particle system bursting
if polka.curr_tree != noone and polka.curr_tree.tree_change {
	//if not ((particle_count+1) mod interval) {
		part_system_position(planting_sys_ptr, polka.curr_tree.x, polka.curr_tree.y);
		part_emitter_burst(planting_sys_ptr, emitter_ptr, particle1_idx, 4);
		part_emitter_burst(planting_sys_ptr, emitter_ptr, particle2_idx, 3);
		//interval = irandom_range(interval_max, interval_min);
		//particle_count = 0;
	//}

	//particle_count += 1;
}

if prog_change {
	pbar_ptr.yy += anim_interval;
	
	anim_interval -= 1;
}


if is_done { exit; }
// every interval check planted trees
if not ((update_count+1) mod interval) {
	var temp_count = 0;
	for(var i = 0; i < n; i++){
		var inst = instance_find(obj_plantable_tree, i);
		with inst {
			if trees[curr_tree mod other.n_tree_opts] != default_ {
				temp_count += 1;
			}
		}
	}
	
	// completed if all trees planted
	if temp_count == n {
		is_done = true;
	}
	
	if temp_count != planted_count {
		prog_change = true;
		alarm[0] = 14;
	}

	planted_count = temp_count;
	
	//assigning to progress_bar
	pbar_ptr.prog = planted_count-1;
}

update_count += 1;










