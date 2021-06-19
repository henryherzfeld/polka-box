/// @description Insert description here

scale = min(game.gui_width/1500, game.gui_height/840);

posx = [0, game.gui_width/2, game.gui_width];
posy = [0, game.gui_height/2, game.gui_height];

pos =   [
		[[posx[0], posy[0]], [posx[1], posy[0]], [posx[2], posy[0]]],
		[[posx[0], posy[1]], [posx[1], posy[1]], [posx[2], posy[1]]],
		[[posx[0], posy[2]], [posx[1], posy[2]], [posx[2], posy[2]]],
	    ]