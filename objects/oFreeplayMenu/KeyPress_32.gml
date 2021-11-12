if(!instance_exists(oTransition))
{
	if(selection != lastselection) && (songListen)
		songListen = songListen;
	else
		songListen = !songListen;

	if(songListen)
	{
	
		audio_sound_gain(global.menusong,0,1000);

		var _songselection = freeplaysonglist[selection];

		switch(_songselection)
		{
			case "satin panties":
				_songselection = "satin-panties";
				break;
		}

		var _song = audio_create_stream("assets/music/"+_songselection+"_Inst.ogg");
		if(audio_is_playing(soundtest))
			audio_stop_sound(soundtest);
		soundtest = audio_play_sound(_song,0,false);
		audio_sound_gain(soundtest,0,0);
		audio_sound_gain(soundtest,1,1500);
		lastselection = selection;
	}
	else
	{
		audio_stop_sound(soundtest);
		audio_sound_gain(global.menusong,1,2000);
	}
}