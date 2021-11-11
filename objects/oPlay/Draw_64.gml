if(vsync) draw_text(8, 8, "FPS: " + string(fps)+" (VSYNC)");
else draw_text(8, 8, "FPS: " + string(fps));
draw_set_halign(fa_right);
draw_set_color(c_black);
draw_text(1272, 692, "Ver. " + version);
draw_set_color(c_white);
draw_text(1270, 690, "Ver. " + version);
draw_set_halign(-1);