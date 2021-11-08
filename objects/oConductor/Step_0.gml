stepHit = false;
beatHit = false;

if(audio_is_playing(musinst))
{
	songPosition = audio_sound_get_track_position(musinst)*1000;
	
	curDecimalBeat = (songPosition / 1000) * bpm / 60;
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
	
	if(stepHit)
	{
		lastBeat = curBeat;
		curBeat = floor(curStep / 4);
		if(curStep mod 4 == 0)
			beatHit = true;
	}
	
	if(curBeat mod 4 == 0)
	{
		if(oChartReader.daNotes[(curBeat/4)].mustHitSection)
		{
			camera_point_to(0);
		}
		else
		{
			camera_point_to(1);
		}
	}
	
	if(oChartReader._bf.animstate != "idle" && oChartReader._bf.danced && oChartReader._bf.animtimer > stepCrochet * 4 && oChartReader._bf.animframe > 5)
	{
		oChartReader._bf.animtimer = 0;
		oChartReader._bf.animframe = 0;
		oChartReader._bf.animstate = "idle";
	}
	if(oChartReader._dad.animstate != "idle" && oChartReader._dad.danced && oChartReader._dad.animtimer > stepCrochet * 4 && oChartReader._dad.animframe > 5)
	{
		oChartReader._dad.animtimer = 0;
		oChartReader._dad.animframe = 0;
		oChartReader._dad.animstate = "idle";
	}
}
else if(songPosition < 0)
{
	songPosition += 1/room_speed*1000;
	if(songPosition >= -crochet * 4) && (introCounter == 0)
	{
		var _intro = "assets/sound/intro3.ogg";
		_intro = audio_create_stream(_intro);
		audio_play_sound(_intro,0,false);
		introCounter++;
	}
	if(songPosition >= -crochet * 3) && (introCounter == 1)
	{
		var _intro = "assets/sound/intro2.ogg";
		_intro = audio_create_stream(_intro);
		audio_play_sound(_intro,0,false);
		introCounter++;
	}
	if(songPosition >= -crochet * 2) && (introCounter == 2)
	{
		var _intro = "assets/sound/intro1.ogg";
		_intro = audio_create_stream(_intro);
		audio_play_sound(_intro,0,false);
		introCounter++;
	}
	if(songPosition >= -crochet * 1) && (introCounter == 3)
	{
		var _intro = "assets/sound/introGo.ogg";
		_intro = audio_create_stream(_intro);
		audio_play_sound(_intro,0,false);
		introCounter++;
	}
}
else
{
	inst = "assets/music/"+oChartReader.daSong.song+"_Inst.ogg";
	voice = "assets/music/"+oChartReader.daSong.song+"_Voices.ogg";
	
	inststream = audio_create_stream(inst);
	voicestream = audio_create_stream(voice);

	musinst = audio_play_sound(inststream,999,false);
	musvoice = audio_play_sound(voicestream,999,false);
}
if(audio_sound_get_track_position(musinst) >= audio_sound_length(musinst)-0.05)
{
	room_goto(Menu);
}