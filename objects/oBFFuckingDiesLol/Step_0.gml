_animkey += framerate/room_speed;

if(_animkey >= 57 && !dead)
{
	dead = true;
}

if(retrying)
{
	alpha += 0.025;
	if(alpha >= 1.5)
	{
		room_restart()
	}
}

if(dead)
{
	beatHit = false;
	if(_deadbf != _deadbfloop)
		_deadbf = _deadbfloop;
	framerate = 12;
	
	if(!audio_is_playing(gameovermusic) && !retrying)
	{
		music = audio_create_stream("assets/music/gameOver.ogg")
		gameovermusic = audio_play_sound(music, 0, true);
	}
	else
	{
		//set song position in ms
		songPosition = audio_sound_get_track_position(gameovermusic)*1000;
	
		//set curBeat as float
		curDecimalBeat = (songPosition / 1000) * bpm / 60;
	
		//getting the curStep (with some crazy shit)
		nextStep = floor(songPosition / stepCrochet);
		if (nextStep >= 0)
		{
			if (nextStep > curStep)
			{
				for(var i = curStep; i <= nextStep; i++)
				{
					curStep++;
					stepHit = true;
				}
			}
			if (nextStep < curStep)
			{
				curStep = nextStep;
				stepHit = true;
			}
		}
	
		//wowie we hit a step (and we hit da beat too if we can)
		if(stepHit)
		{
			lastBeat = curBeat;
			curBeat = floor(curStep / 4);
			if(curStep mod 4 == 0)
				beatHit = true;
		}	
	}
	if(_animkey >= 9)
		_animkey = 9;
	if(beatHit)
		_animkey = 1;
}