///@description scr_progress_quest
///@arg0 quest

var quest_idx = argument0;

with(quests){
	quests_grid[# 1, quest_idx] += 1;
	register_events = true;
	update_map[? quest_idx] = true;
}

return true;