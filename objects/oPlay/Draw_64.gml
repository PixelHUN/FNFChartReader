if(vsync) draw_text(8, 8, "FPS: " + string(fps)+" (VSYNC)");
else draw_text(8, 8, "FPS: " + string(fps));
draw_set_halign(fa_right);
draw_set_color(c_black);
draw_text(1272, 692, "Ver. " + version);
draw_set_color(c_white);
draw_text(1270, 690, "Ver. " + version);
draw_set_halign(-1);

if(_paused && instance_exists(oConductor))
{
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0,0,1280,720,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_middle);
	draw_set_font(fnt_vcr);
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2,"Paused");
	draw_set_halign(-1);
	draw_set_font(-1);
}