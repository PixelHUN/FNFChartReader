if(_paused)
{
	draw_set_color(c_black)
	draw_set_alpha(0.5);
	draw_rectangle(0,0,1280,720,false);
	draw_set_color(c_white)
	draw_set_alpha(1);
	draw_set_font(fnt_vcr);
	draw_set_halign(fa_middle);
	draw_text(1280/2,720/2,"PAUSED");
	draw_set_font(-1);
	draw_set_halign(-1);
}

if(vsync) draw_text(8, 8, "FPS: " + string(fps)+" (VSYNC)");
else draw_text(8, 8, "FPS: " + string(fps));
draw_set_halign(fa_right);
draw_set_color(c_black);
draw_text(1272, 692, "Ver. " + version);
draw_set_color(c_white);
draw_text(1270, 690, "Ver. " + version);
draw_set_halign(-1);