selectiondisplay = lerp(selectiondisplay, selection, 0.25);

for(var i = 0; i < array_length(freeplaysonglist); i++)
{
	draw_set_font(fnt_fnf);
	
	//var _disx = 64+32;
	//var _disy = display_get_gui_height()/2-16;
	
	var _xx = 32+32*(i-selectiondisplay);
	var _yy = display_get_gui_height()/2-16+128*(i-selectiondisplay-1);
	//_disx = lerp(_disx,_xx,0.1);
	//_disy = lerp(_disy,_yy,0.1);
	draw_text(_xx,_yy,string_upper(freeplaysonglist[i]));
	draw_set_font(-1);
}