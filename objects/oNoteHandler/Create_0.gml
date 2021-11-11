size = 0.7;
handleInput = false;

_disx = display_get_gui_width()-(sprite_get_width(spr.arrow)*size)*4;

if(oPlay.downscroll)
	_disy = display_get_gui_height()-sprite_get_height(spr.arrow)*size/2-32;
else
	_disy = sprite_get_height(spr.arrow)*size/2+32;