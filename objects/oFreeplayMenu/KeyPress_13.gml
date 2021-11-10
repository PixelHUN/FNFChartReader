if(!instance_exists(oTransition))
{
	oPlay.songname = freeplaysonglist[selection];

	switch(oPlay.songname)
	{
		case "satin panties":
			oPlay.songname = "satin-panties";
			break;
	}

	oPlay.difficulty = dif;

	try
	{
		var _file = file_text_open_read("assets/charts/"+oPlay.songname+"/"+oPlay.songname+oPlay.difficulty+".json");
		var _string = file_text_read_string(_file);
		//_string = string_replace(_string, " ", "");

		file_text_close(_file);
		//parse through chart json
		try
		{
			json_parse(_string);
			
			audio_stop_all();
			var _trans = instance_create_layer(0,0,"Instances",oTransition);
			_trans.transIn = false;
			_trans.roomTo = Room1;
		}
		catch(_e)
		{
			var _sound = audio_create_stream("assets/sound/cancelMenu.ogg");
			audio_play_sound(_sound, 0, false);
			show_debug_message("Chart can't be read. Not starting.")
		}
	}
	catch(_e)
	{
		var _sound = audio_create_stream("assets/sound/cancelMenu.ogg");
		audio_play_sound(_sound, 0, false);
		show_debug_message("Chart file not found. Not continuing.");
	}
}