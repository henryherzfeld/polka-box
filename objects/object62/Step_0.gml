/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(scr_check_objective(enum_objective_type.start)){
scripts = [
	[scr_activate_objective, enum_objective_type.find_weeraway],
	[scr_deactivate_objective, enum_objective_type.start],
]
}
else { scripts = []; }