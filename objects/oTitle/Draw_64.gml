var _dx = display_get_gui_width();
var _dy = display_get_gui_height();

draw_set_alpha(whiteboxalpha);

draw_rectangle(0,0,_dx,_dy,false);
	
if(whiteboxalpha > 0)
	whiteboxalpha -= 0.025;
	
draw_set_alpha(1);

if(keyboard_check_released(vk_enter))
	enter = false;