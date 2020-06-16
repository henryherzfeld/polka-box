/// @description Insert description here
var grid = quests_grid;

var i = 0; repeat(quests_grid_n) {
	switch(i) {
		#region test1
		case quest.test1:
			switch(grid[# 1, i]) {
				case 0:
					scr_event_register_script(event.pause, quests, scr_progress_quest, quest.test1);
				break;
				case 1:
					scr_event_register_script(event.test, quests, scr_progress_quest, quest.test1);
				break;
			}
		break;
		#endregion
	
		#region test2
		case quest.test2:
		break;
		#endregion
	}
	
	i++;
}