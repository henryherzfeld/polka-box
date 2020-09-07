/// @description Insert description here


enum alignment {
	left = 0,
	center = 1,
	right = 2,
	bottom = 2,
	top = 0,
}

enum enum_anchor {
	top_left,
	top_center,
	top_right,
	middle_left,
	middle_center,
	middle_right,
	bottom_left,
	bottom_center,
	bottom_right
}

anchor = enum_anchor.top_left;

scale = min(game.gui_width/1500, game.gui_height/840);
ratio = game.gui_width/game.gui_height;

if ratio > 16/9 {
	ratio = 16/9;
} else {
	ratio = 4/3;
}

var _posx = [0, 750, 1500];
var _posy = [0, 400, 800];

switch anchor {
	case enum_anchor.top_left:
		x = _posx[alignment.top];
		y = _posy[alignment.left];
		break;
	case enum_anchor.top_center:
		x = _posx[alignment.top];
		y = _posy[alignment.center];
		break;
}
