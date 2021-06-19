destroy = false;

inst = instance_find(obj_cutscene, 0);
scripts = [
	[scr_change_variable, inst, "active", true]
] 