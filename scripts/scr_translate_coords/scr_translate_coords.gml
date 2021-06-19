/// @description translate coords
///@arg0 x
///@arg1 y
///@arg2 anchor
///@arg3 ratio
function scr_translate_coords(argument0, argument1, argument2, argument3) {

	var xx;
	var yy;
	var _x = argument0;
	var _y = argument1;
	var _anchor = argument2;
	var _ratio = argument3;

	var _gw = game.gui_width;
	var _gh = game.gui_height;

	var _dw = 1500;
	var _dh = 840;

	var _posx = [_x, _gw/2-(_dw/2-_x), _gw-(_dw-_x)];
	var _posy = [_y, _gh/2-(_dh/2-_y), _gh-(_dh-_y)];

	switch _anchor {
		case enum_anchor.top_left:
			xx = _posx[alignment.left];
			yy = _posy[alignment.top];
			break;
		case enum_anchor.top_center:
			xx = _posx[alignment.center];
			yy = _posy[alignment.top];
			break;
		case enum_anchor.top_right:
			xx = _posx[alignment.right];
			yy = _posy[alignment.top];
			break;
		
		case enum_anchor.middle_left:
			xx = _posx[alignment.left];
			yy = _posy[alignment.center];
			break;
		case enum_anchor.middle_center:
			xx = _posx[alignment.center];
			yy = _posy[alignment.center];
			break;
		case enum_anchor.middle_right:
			xx = _posx[alignment.right];
			yy = _posy[alignment.center];
			break;		

		case enum_anchor.bottom_left:
			xx = _posx[alignment.left];
			yy = _posy[alignment.bottom];
			break;
		case enum_anchor.bottom_center:
			xx = _posx[alignment.center];
			yy = _posy[alignment.bottom];
			break;
		case enum_anchor.bottom_right:
			xx = _posx[alignment.right];
			yy = _posy[alignment.bottom];
			break;
	}
	return [xx, yy];



}
