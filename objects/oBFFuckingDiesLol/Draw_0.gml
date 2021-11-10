var _disw = display_get_gui_width();
var _dish = display_get_gui_height();

draw_set_color(c_black);
draw_rectangle(x-_disw,y-_dish,x+_disw,y+_dish,false);
draw_set_color(c_white);

draw_sprite(_deadbf,floor(_animkey),x,y);

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(x-_disw,y-_dish,x+_disw,y+_dish,false);
draw_set_color(c_white);
draw_set_alpha(1);