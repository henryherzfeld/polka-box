////@description lines_intersect
function scr_lines_intersect(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	//@param0 x1
	//@param1 y1
	//@param2 x2
	//@param3 y2
	//@param4 x3
	//@param5 y3
	//@param6 x4
	//@param7 y4
	//@param8 segment {bool}

	var ua, ub, ud, ux, uy, vx, vy, wx, wy;
	ua = 0;
	ux = argument2 - argument0;
	uy = argument3 - argument1;
	vx = argument6 - argument4;
	vy = argument7 - argument5;
	wx = argument0 - argument4;
	wy = argument1 - argument5;
	ud = vy * ux - vx * uy;
	if (ud != 0) 
	{
	    ua = (vx * wy - vy * wx) / ud;
	    if (argument8) 
	    {
	        ub = (ux * wy - uy * wx) / ud;
	        if (ua < 0 || ua > 1 || ub < 0 || ub > 1) ua = 0;
	    }
	}
	return ua;


}
