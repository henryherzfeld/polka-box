function fm_set_size(argument0, argument1) {
	var m = dj_call("dpi_scale");
	fm_dpi = m;
	var w = argument0;
	var h = argument1;
	var i = window_handle();
	window_set_size(w * m, h * m);

	__view_set( e__VW.WPort, 0, w * m );
	__view_set( e__VW.HPort, 0, h * m );

	dj_call3("set_size", i, w, h);


}
