size = oChartReader.notescale;
handleInput = false;

_disx = display_get_gui_width();

if(oPlay.downscroll)
	_disy = display_get_gui_height()-sprite_get_height(spr.arrow)*size/2-32;
else
	_disy = sprite_get_height(spr.arrow)*size/2+32;