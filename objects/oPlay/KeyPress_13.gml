if(instance_exists(oConductor) && oConductor.songPosition > oConductor.stepCrochet)
{
	_paused = !_paused;
	
	if(_paused)
	{
		audio_pause_sound(oConductor.musinst);
		audio_pause_sound(oConductor.musvoice);
		if(!audio_is_playing(global.menusong))
		{
			_breakfast = audio_create_stream("assets/music/breakfast.ogg");
			global.menusong = audio_play_sound(_breakfast,0,true);
			audio_sound_gain(global.menusong,0,0)
			audio_sound_gain(global.menusong,1,10000);
		}
	}
	else 
	{
		audio_stop_sound(global.menusong);
		audio_resume_all();
	}
}