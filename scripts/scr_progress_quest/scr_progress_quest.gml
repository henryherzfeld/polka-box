///@description scr_progress_quest
///@arg0 quest
function scr_progress_quest(argument0) {

	var quest_idx = argument0;

	with(quests){
		quests_grid[# 1, quest_idx] += 1;
		update_map[? quest_idx] = true;
	}

	return true;


}
