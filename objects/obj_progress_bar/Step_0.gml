/// @description Insert description here

if game.canvas_change {
	xx = (game.gui_width - w_bar) / 2;
	yy = game.gui_height - 50;
}

if prev_prog != prog {
	prog_change = true;
	prev_prog = prog;
}

text = string(prog+1) + "/" + string(max_prog);

h_text = string_height(text);

if prog_change {
	if anim_count == anim_length {
		prog_change = false;
		anim_count = 0;
	}
	
	/*
	// erroneous
	if prog == max_prog-1 {
		anim_length = anim_length*1.5;
		anim_interval = w_bar/anim_length;
	}
	*/
	
	anim_count += 1;
}