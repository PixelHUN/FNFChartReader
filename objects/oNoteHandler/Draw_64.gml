var _disx = display_get_gui_width()-(sprite_get_width(spr.arrow)*size)*4;
_disy = sprite_get_height(spr.arrow)*size/2+32;

for(var i = 0; i < 4; i++)
{
	var _rot = 0;
	switch(i)
	{
		case 0:
			_rot = 90;
			break;
		case 1:
			_rot = 180;
			break;
		case 2:
			_rot = 0;
			break;
		case 3:
			_rot = -90;
			break;
	}
	draw_sprite_ext(spr.arrow,0,_disx-16+(sprite_get_width(spr.arrow)*size)*i+sprite_get_width(spr.arrow)*size/2,_disy,size,size,_rot,c_white,1);
}

for(var i = 0; i < 4; i++)
{
	var _rot = 0;
	switch(i)
	{
		case 0:
			_rot = 90;
			break;
		case 1:
			_rot = 180;
			break;
		case 2:
			_rot = 0;
			break;
		case 3:
			_rot = -90;
			break;
	}
	draw_sprite_ext(spr.arrow,0,16+(sprite_get_width(spr.arrow)*size)*i+sprite_get_width(spr.arrow)*size/2,_disy,size,size,_rot,c_white,1);
}