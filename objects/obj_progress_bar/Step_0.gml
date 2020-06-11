/// @description Insert description here

if game.canvas_change {
	xx = (game.gui_width - w_bar) / 2;
	yy = game.gui_height - 50;
}

text = string(prog_ptr.prog+1) + "/" + string(max_prog);

h_text = string_height(text);