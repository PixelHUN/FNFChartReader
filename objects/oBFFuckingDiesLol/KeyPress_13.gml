if(dead)
{
	audio_stop_sound(gameovermusic);
	music = audio_create_stream("assets/music/gameOverEnd.ogg");
	gameovermusic = audio_play_sound(music,0,false);
	retrying = true;
}