///@description scr_cutscene_notification
///@arg text
function scr_cutscene_notification(argument0) {

	if notification_inst == -1 {
		notification_inst = scr_draw_notification(argument0);
	} else if not instance_exists(notification_inst) {
		notification_inst = -1;
		scr_cutscene_end_action();
	}


}
