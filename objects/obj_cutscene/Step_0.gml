/// @description Insert description here
// You can write your code in this editor

if(!is_array(scene_info)) {instance_destroy();}
if(active){
	scr_script_execute_array_1d(scene_info[scene])
}