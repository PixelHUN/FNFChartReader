depth = -1000;
var _dx = display_get_gui_width();
var _dy = display_get_gui_height();

draw_set_color(c_black);
if(!instance_exists(oTitle))
	draw_rectangle(0,0,_dx,_dy,false);
draw_set_color(c_white);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);

draw_set_font(font);
draw_text_transformed(_dx/2,_dy/2,string_lower(swagText),0.75,0.75,0);
draw_set_font(-1);

draw_set_halign(-1);
draw_set_valign(-1);