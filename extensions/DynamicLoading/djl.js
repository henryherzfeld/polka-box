// (key:string, defValue, ...rest)
function dj_loading_value(key, defValue) {
	var f = window.gml_Script_gmcallback_dj_loading, v = null;
	if (f) {
		var p = Array.prototype.slice.call(arguments, 2);
		p.unshift(key);
		p.unshift(null);
		p.unshift(null);
		v = f.apply(this, p);
	}
	return v != null ? v : defValue;
}
function dj_loading_color(key, defValue) {
	var v = dj_loading_value.apply(this, arguments);
	if (typeof v == "number") {
		v = ((v >> 16) & 0xff) | (v & 0xff00) | ((v & 0xff) << 16); // BGR -> RGB
		v = v.toString(16);
		while (v.length < 6) v = "0" + v;
		v = "#" + v;
	}
	return v;
}
function dj_loading_number(key, defValue) {
	var v = dj_loading_value.apply(this, arguments);
	if (typeof v != "number") v = defValue;
	return v;
}
function dj_loading_string(key, defValue) {
	var v = dj_loading_value.apply(this, arguments);
	if (typeof v != "string") v = defValue;
	return v;
}


var dj_loading_logo = new Image();
dj_loading_logo.src = "html5game/" + dj_loading_string("logo_path", "load.png");


var dj_loading_current = 0;
///
function dj_loading_get_current() { return dj_loading_current; }
/// dj_loading_current = dj_loading_get_current():


var dj_loading_total = 0;
///
function dj_loading_get_total() { return dj_loading_total; }
/// dj_loading_total = dj_loading_get_total():


var dj_loading_width = 0;
///
function dj_loading_get_width() { return dj_loading_width; }
/// dj_loading_width = dj_loading_get_width():


var dj_loading_height = 0;
///
function dj_loading_get_height() { return dj_loading_height; }
/// dj_loading_height = dj_loading_get_height():


///
function dj_loading(ctx, width, height, total, current, _) {
	//
	var node = ctx.canvas;
	
	// Force fullscreen mode:
	width = window.innerWidth;
	if (node.width != width) node.width = width;
	height = window.innerHeight;
	if (node.height != height) node.height = height;
	
	// Store parameters:
	dj_loading_current = current;
	dj_loading_total = total;
	dj_loading_width = width;
	dj_loading_height = height;
	
	// Draw background:
	if (!dj_loading_value("draw_background")) {
		ctx.fillStyle = dj_loading_color("background", "#2a2a2a");
		ctx.fillRect(0, 0, width, height);
	}
	
	// Sizing:
	var barWidth = Math.round(dj_loading_number("bar_width", width * 0.3));
	var barHeight = Math.round(dj_loading_number("bar_height", 20));
	var logoWidth = Math.round(dj_loading_number("logo_width", dj_loading_logo.width||300));
	var logoHeight = Math.round(dj_loading_number("logo_height", dj_loading_logo.height||300));
	
	// Scale to fit:
	var logoScale = Math.min(1, Math.min(
		width * 0.5 / logoWidth,
		height * 0.6 / (logoHeight + barHeight)
	));
	logoWidth *= logoScale;
	logoHeight *= logoScale;
	
	// Logo:
	var logoLeft = dj_loading_number("logo_left", (width - logoWidth) / 2);
	var logoTop = dj_loading_number("logo_top", (height - logoHeight - barHeight) / 2);
	if (logoWidth|0 == logoWidth) logoLeft = Math.round(logoLeft);
	if (logoHeight|0 == logoHeight) logoTop = Math.round(logoTop);
	if (!dj_loading_value("draw_logo") && logoWidth > 0 && logoHeight > 0) {
		ctx.save();
		ctx.translate(logoLeft, logoTop);
		ctx.scale(logoWidth / dj_loading_logo.width, logoHeight / dj_loading_logo.height);
		ctx.drawImage(dj_loading_logo, 0, 0);
		ctx.restore();
	}
	
	// Loading bar:
	if (!dj_loading_value("draw_bar")) {
		var barLeft = Math.round(dj_loading_number("bar_left", (width - barWidth) / 2));
		var barTop = Math.round(dj_loading_number("bar_top", logoTop + logoHeight));
		var barBackground = dj_loading_color("bar_background", "#ff8000");
		var barForeground = dj_loading_color("bar_foreground", "#ffffff");
		var barBorderWidth = Math.round(dj_loading_number("bar_border_width", 0));
		var barBorderColor = dj_loading_color("bar_border_color", barBackground);
		//
		var barFill = Math.round(current / total * barWidth);
		window.dj_loading_fill = Math.min((window.dj_loading_fill || 0) + 1, barFill);
		//
		if (barBorderWidth > 0) {
			ctx.fillStyle = barBorderColor;
			ctx.fillRect(barLeft - barBorderWidth, barTop - barBorderWidth,
				barWidth + barBorderWidth * 2, barHeight + barBorderWidth * 2);
		}
		//
		ctx.fillStyle = barBackground;
		ctx.fillRect(barLeft, barTop, barWidth, barHeight);
		//
		ctx.fillStyle = barForeground;
		ctx.fillRect(barLeft, barTop, window.dj_loading_fill, barHeight);
		//
	}
	
	//
	dj_loading_value("draw_post");
}