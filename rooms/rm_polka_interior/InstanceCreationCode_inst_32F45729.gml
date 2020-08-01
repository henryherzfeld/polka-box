
if not scr_check_objective(enum_objective_type.tut_try_to_leave) {
	scripts = [
		[scr_change_variable, instance_find(obj_cutscene, 0), "active", true],
		[scr_activate_objective, enum_objective_type.tut_try_to_leave],
	]
} else {
	scripts = -1;
}