var _col = c_yellow;

draw_sprite_stretched_ext(menuDesat,0,0,0,display_get_gui_width(),display_get_gui_height(),_col,1);

draw_set_font(font);

var _dt = delta_time / 1000000;
selectiondisplay = lerp(selectiondisplay, selection, 10 * _dt);

for(var i = 0; i < array_length(optionslist); i++)
{
	draw_set_font(font);
	if(selection == i) draw_set_alpha(1);
	else draw_set_alpha(0.4);
	
	//var _disx = 64+32;
	//var _disy = display_get_gui_height()/2-16;
	
	var _xx = 64+16*(i-selectiondisplay);
	var _yy = display_get_gui_height()/2-34+172*(i-selectiondisplay);
	//_disx = lerp(_disx,_xx,0.1);
	//_disy = lerp(_disy,_yy,0.1);
	//draw_set_color(c_black);
	draw_text(_xx,_yy,string_lower(optionslist[i]));
	draw_set_color(-1);
	draw_set_font(-1);
	draw_set_alpha(1);
}

draw_set_font(-1);

if(selection == 0)
	draw_text(8,700,"FPS Cap: "+string(oPlay.fpscap));
if(selection == 1)
	draw_text(8,700,"Vsync: "+string(oPlay.vsync));
if(selection == 2)
	draw_text(8,700,"Downscroll: "+string(oPlay.downscroll));
if(selection == 3)
	draw_text(8,700,"Scroll Speed: "+string(oPlay.songspeed));
	