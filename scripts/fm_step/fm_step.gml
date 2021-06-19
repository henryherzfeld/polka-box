function fm_step() {
	var fm_xscale, fm_yscale, fm_width, fm_height, fm_width_, fm_height_, fm_now,
	    fm_left, fm_top, fm_br_width_, fm_br_height_;
	// restrict game from resizing in first few steps of execution:
	if (fm_noflipsteps > 0) {
	    fm_noflipsteps -= 1;
	    return 0;
	}
	fm_now = fm_timer();
	fm_br_width_ = browser_width;
	fm_br_height_ = browser_height;
	// 'normal' resize event is not enough:
	if (fm_was_resized() || fm_br_room != room || fm_refresh) {
	    fm_refresh = false;
	    //
	    fm_br_width = fm_br_width_;
	    fm_br_height = fm_br_height_;
	    fm_br_room = room;
	    //
	    fm_hide_adressbar();
	    fm_bar_time = fm_now;
	    // find normal size of canvas:
	    fm_width = fm_game_width();
	    fm_height = fm_game_height();
	    // save original size:
	    fm_width_ = fm_width;
	    fm_height_ = fm_height;
	    //
	    fm_showflip = (((fm_br_width / fm_br_height) > 1) != ((fm_width_ / fm_height_) > 1));
    
	    if (fm_mobile()) {
	      if (room != rm_flip) {
	         room_persistent = 0;
	      }
	       if (fm_showflip && (room != rm_flip)) {
	           if (fm_priority != 0) fm_priority = 3 - fm_priority;
	           fm_fliproom = room;
	           room_persistent = 1;
	           room_goto(rm_flip);
	       }
	       if (fm_showflip && (room == rm_flip)) {
	           if (fm_priority != 0) fm_priority = 3 - fm_priority;
	           room_goto(fm_fliproom);
	       }
	       if (!fm_showflip && (room != rm_flip) && fm_fliproom_pr) {
	           fm_fliproom_pr = false;
	       }
	    }
	    // find scaling required:
	    fm_xscale = fm_br_width / fm_width;
	    fm_yscale = fm_br_height / fm_height;
	    if (fm_priority == 1) fm_yscale = fm_xscale;
	    if (fm_priority == 2) fm_xscale = fm_yscale;
	    // scale limits:
	    if (fm_maxscalex != 0) fm_xscale = min(fm_xscale, fm_maxscalex);
	    if (fm_minscalex != 0) fm_xscale = max(fm_xscale, fm_minscalex);
	    if (fm_maxscaley != 0) fm_yscale = min(fm_yscale, fm_maxscaley);
	    if (fm_minscaley != 0) fm_yscale = max(fm_yscale, fm_minscaley);
	    fm_width *= fm_xscale;
	    fm_height *= fm_yscale;
	    // pixel limits:
	    if (fm_maxwidth != 0 && fm_width > fm_maxwidth) fm_width = fm_maxwidth;
	    if (fm_maxheight != 0 && fm_height > fm_maxheight) fm_height = fm_maxheight;
	    // find new scaling:
	    fm_xscale = fm_width / fm_width_;
	    fm_yscale = fm_height / fm_height_;
	    // proportions:
	    if (fm_proportional) {
	        fm_xscale = min(fm_xscale, fm_yscale);
	        fm_yscale = fm_xscale;
	    }
	    fm_width = fm_width_ * fm_xscale;
	    fm_height = fm_height_ * fm_yscale;
	    // round sizes:
	    fm_width = round(fm_width);
	    fm_height = round(fm_height);
	    // position:
	    fm_left = fm_halign / 2 * (browser_width - fm_width);
	    fm_top = 1 + fm_valign / 2 * (browser_height - fm_height);
	    // restrictions:
	    if (fm_hrestrict > 0) fm_left = max(fm_left, 0);
	    if (fm_hrestrict < 0) fm_left = min(fm_left, fm_br_width - fm_width);
	    if (fm_vrestrict > 0) fm_top = max(fm_top, 0);
	    if (fm_vrestrict < 0) fm_top = min(fm_top, fm_br_height - fm_height);
	    // position window:
	    window_set_position(fm_left, fm_top);
	    // scale window:
	    fm_set_size(fm_width, fm_height);
	}
	// periodic address bar hiding:
	if (fm_now - fm_bar_time > fm_bar_int || fm_bar_time > fm_now) {
	    fm_hide_adressbar();
	    fm_bar_time = fm_now;
	}



}
