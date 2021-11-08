selection = 0;
lastselection = 0;
selectiondisplay = 0;

volume = 1;

difficulty = 1;
dif = "";
//_hue = 0;

songListen = false;

freeplaysonglist = array_create(0);

_breakfast = audio_create_stream("assets/music/breakfast.ogg");
_menusong = audio_play_sound(_breakfast,0,true);

soundtest = 0;

audio_sound_gain(_menusong,0,0)
audio_sound_gain(_menusong,1,3000);

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