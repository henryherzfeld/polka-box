function fm_start() {
	if (dj_exists("resized")) return 1
	globalvar
	    fm_maxwidth, fm_maxheight,
	    fm_minwidth, fm_minheight,
	    fm_maxscalex, fm_maxscaley,
	    fm_minscalex, fm_minscaley,
	    fm_hrestrict, fm_vrestrict,
	    fm_proportional,
	    fm_priority,
	    fm_halign, fm_valign,
	    fm_bar_time, fm_bar_int,
	    fm_showflip, fm_showflip_,
	    fm_flipback, fm_fliproom, fm_fliproom_pr,
	    fm_br_width, fm_br_height, fm_br_room,
	    fm_noflipsteps, fm_refresh;
	// size constraints, in pixels (0 to not limit):
	fm_maxwidth = 0
	fm_maxheight = 0
	fm_minwidth = 0
	fm_minheight = 0
	// size constraints, in multiplier (0 to not limit):
	fm_maxscalex = 0
	fm_maxscaley = 0
	fm_minscalex = 0
	fm_minscaley = 0
	// saved width/height/room - no need to edit these
	fm_br_width = 0
	fm_br_height = 0
	fm_br_room = -1
	// Steps until game can transit to 'flip the phone' room:
	fm_noflipsteps = 1
	// If scaling should be kept proportional (recommended):
	fm_proportional = true
	// position restriction - non-zero values don't allow game to be hidden under edge:
	fm_hrestrict = 0
	fm_vrestrict = 1
	fm_refresh = true
	// Priority for sizing
	// 0 : Equal (fit both)
	// 1 : Width (fit horizontally, chop vertically)
	// 2 : Height (fit vertically, chop horizontally)
	fm_priority = 1
	// game canvas alingment (use fa_ constants):
	fm_halign = fa_center
	fm_valign = fa_middle
	// address bar hiding interval:
	fm_bar_int = 500 // ms
	fm_bar_time = 0;
	// bind some JS functions for scripts:
	dj_add1("hide_adrbar", "height", @"
	document.getElementById('gm4html5_div_id').style.height = ~~(height + 128) + 'px';
	window.scrollTo(0, 1)");
	dj_add("orientation", "return window.fm_orientation");
	dj_add("installed", "return window.navigator.standalone ? 1 : 0");
	dj_add("timer", "return (new Date) | 0");
	dj_add("resized", "var r = window.fm_resized; window.fm_resized = 0; return r");
	dj_add("width", "return screen ? screen.width : window.innerWidth");
	dj_add("height", "return screen ? screen.height : window.innerHeight");
	dj_add("dpi_scale", "return window.devicePixelRatio || 1"); // window.devicePixelRatio
	fm_dpi = 1; // modified by fm_set_size
	dj_add3("set_size", "id", "w", "h", @"
	    var c = document.getElementById(id);
	    c.style.width = w + 'px';
	    c.style.height = h + 'px';
	");
	dj_var_def(mouse_x, "mouse_x");
	dj_var_def(mouse_y, "mouse_y");
	// one-time init:
	dj_run(@"var e = document.getElementById('gm4html5_div_id');
	document.body.style.overflow = 'hidden';
	e.style.paddingTop = '20px';
	e.style.position = 'absolute';
	e.style.height = '2048px';
	window.fm_resized = 1;
	window.fm_orientation = window.orientation ? window.orientation : 0;
	document.onorientationchange = window.onorientationchange = function() {
	window.fm_orientation = window.orientation; window.fm_resized = 1
	}
	document.onresize = window.onresize = function() { window.fm_resized = 1 }
	");
	// optional: hide debug console and loading screen (from debug mode):
	dj_run(@"var e;
	if (e = document.getElementById('debug_console')) e.style.display = 'none';
	if (e = document.getElementById('loading_screen')) e.style.display = 'none';");
	// flurry fix
	dj_run("if (!window.FlurryAgent) window.FlurryAgent = { startSession: function() { }, logEvent: function() { } };");



}
