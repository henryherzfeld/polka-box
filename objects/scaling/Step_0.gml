/// @description Insert description here
// You can write your code in this editor

window_count += 1;

if not ((window_count+1) mod 10) {
	if window_height != window_get_height() or window_width != window_get_width() {
		window_height = window_get_height();
		window_width = window_get_width();
		update = true;
	}
} else if window_count > 100 {
	window_count = 0;
}