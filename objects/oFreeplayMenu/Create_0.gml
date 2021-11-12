//this has a lot of shit and i'm not willing to comment all of this xd
selection = 0;
lastselection = 0;
selectiondisplay = 0;

var _fontsprite = sprite_add("assets/sprite/font.png",43,false,true,0,0);

font = font_add_sprite_ext(_fontsprite, "abcdefghijklmnopqrstuvwxyz,_0123456789-.:@~", true, -20);
//sprite_delete(_fontsprite);

volume = 1;

difficulty = 1;
dif = "";
//_hue = 0;

songListen = false;

freeplaysonglist = array_create(0);

_breakfast = audio_create_stream("assets/music/breakfast.ogg");
if(!audio_is_playing(global.menusong))
{
	global.menusong = audio_play_sound(_breakfast,0,true);
	audio_sound_gain(global.menusong,0,0)
	audio_sound_gain(global.menusong,1,3000);
}

soundtest = 0;

//reading all the charts in the '/charts' folder and adding them to an array
var _f = file_find_first("assets/charts/*", fa_directory);
var _i = 0;
while _f != ""
{
	array_push(freeplaysonglist, _f);
	_i++;
	_f = file_find_next();
	switch(_f)
	{
		case "satin-panties":
			_f = "satin panties"
			break;
	}
	show_debug_message(_f);
}