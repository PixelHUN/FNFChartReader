if(audio_is_playing(oChartReader.musinst))
{
	songPosition = audio_sound_get_track_position(oChartReader.musinst)*1000;
}