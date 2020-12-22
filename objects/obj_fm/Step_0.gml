fm_step();

// audio initiation
if (global.audio_stage >= 1) {
   global.audio_stage += 1;
   
   if (fm_mobile()) {
      if (global.audio_stage == 10) {
         global.audio_stage = -1;
         
         sound_start();
      }
   }
   else {
      global.audio_stage = -1;
      
      sound_start();
   }
}

if (global.audio_stage == 0) {
    if (mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right)) {
        global.audio_stage = 1;
    }
}

// desktop scaling
if (!fm_mobile()) {
    var base_w = fm_game_width();
    var base_h = fm_game_height();
    var max_w = display_get_width();
    var max_h = display_get_height();
    var rescale = min(max_w / base_w,max_h / base_h);
    
    if (rescale > global.desktop_scale) rescale = global.desktop_scale;
    
    var out_w = floor(base_w * rescale);
    var out_h = floor(base_h * rescale);
    fm_set_size(out_w, out_h);
    window_set_position(
        (display_get_width() - out_w) div 2,
        (display_get_height() - out_h) div 2);
}

