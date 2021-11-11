var _dt = delta_time / 1000000;
selectiondisplay = lerp(selectiondisplay, selection, 10 * _dt);

var _hueNew = lerp(100,160,selection/(array_length(freeplaysonglist)-1)); //255*selection/array_length(freeplaysonglist); //lerp(0,255,selection/array_length(freeplaysonglist)-1);

var _lightness = lerp(200,150, difficulty/2);

var _colNew = make_color_hsv(_hueNew,100,_lightness); //_hue = lerp(_hue,_hueNew, 0.2);

var _rNew = color_get_red(_colNew);
var _gNew = color_get_green(_colNew);
var _bNew = color_get_blue(_colNew);

if(!variable_instance_exists(object_index, "_r"))
{
	_r = _rNew;
	_g = _gNew;
	_b = _bNew;
}

_r = lerp(_r, _rNew+20*difficulty, 0.1);
_g = lerp(_g, _gNew, 0.1);
_b = lerp(_b, _bNew, 0.1);

var _col = make_color_rgb(_r,_g,_b);

draw_sprite_stretched_ext(menuDesat,0,0,0,display_get_gui_width(),display_get_gui_height(),_col,1);

for(var i = 0; i < array_length(freeplaysonglist); i++)
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
	draw_text(_xx,_yy,string_lower(freeplaysonglist[i]));
	draw_set_color(-1);
	draw_set_font(-1);
}

var _offset = 8;

var _rx1 = display_get_gui_width()-380-_offset;
var _rx2 = display_get_gui_width()-_offset;

var _ry1 = 0+_offset;
var _ry2 = 168+_offset;

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_rx1,_ry1,_rx2,_ry2,false);
draw_set_color(-1);
draw_set_alpha(1);

draw_set_font(fnt_vcr);

var _songname = freeplaysonglist[selection];
var _displaysong = "";
var _upper = true;

for(var i = 0; i <= string_length(_songname); i++)
{
	var _chr = string_copy(_songname,i+1,1)
	
	if(_upper)
	{
		_chr = string_upper(_chr);
		_upper = false;
	}
	
	if(_chr == " ")
		_upper = true;
	
	_displaysong = string_insert(_chr,_displaysong,string_length(_displaysong)+1);
}
//var _songname = string_copy(string_upper(_songname),1,1)+string_copy(_songname,2,string_length(_songname))

var _difficultyText = "";

switch(difficulty)
{
	case 0:
		_difficultyText = "Easy";
		dif = "-easy";
		break;
	case 1:
		_difficultyText = "Normal";
		dif = "";
		break;
	case 2:
		_difficultyText = "Hard";
		dif = "-hard";
		break;
}

draw_text(_rx1+8,_ry1+8,_displaysong)

draw_text(_rx1+8,_ry1+8*2+32,_difficultyText);

var _highscore = 12560;
_highscore = seperate_number(_highscore, " ", 3);

draw_text(_rx1+8,_ry1+8*3+32*2,"Personal Best: ");
draw_text(_rx1+8,_ry1+8*4+32*3,_highscore);

draw_text(0,0,string(volume))

draw_set_font(-1);