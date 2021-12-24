//Resetting the hitting
stepHit = false;
beatHit = false;

//check if music is playing
if(audio_is_playing(musinst))
{
	//set song position in ms
	songPosition = audio_sound_get_track_position(musinst)*1000;
	
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
	
	_zoom = lerp(_zoom, 1, 0.1);
	//stuff happens when we hit da beat lmao
	if(beatHit)
	{
		if(array_length(oChartReader.daNotes)-1 > curSection) && (curBeat mod 4 == 0) //zooming on every bar
		{
			curSection++;
			var _z = 0.07;
			var newW = cam.vw/(cam.zoom+_z);
			var newH = cam.vh/(cam.zoom+_z);
			camera_set_view_size(view_camera[0], newW, newH);
			camera_set_view_pos(view_camera[0],(cam.cx+cam.ox)-newW/2,(cam.cy+cam.oy)-newH/2);
			cam.set_zoom(1);
		}
		//Hardcoded MILF zooming shit
		if(oChartReader.daSong.song = "Milf" && curBeat >= 168 && curBeat <= 200)
		{
			var _z = 0.08;
			var newW = cam.vw/(cam.zoom+_z);
			var newH = cam.vh/(cam.zoom+_z);
			camera_set_view_size(view_camera[0], newW, newH);
			camera_set_view_pos(view_camera[0],(cam.cx+cam.ox)-newW/2,(cam.cy+cam.oy)-newH/2);
			cam.set_zoom(1);
		}
		
		if(oChartReader._dad.character = "gf") //hardcoding for gf zooming shit
		{
			if(oChartReader.daNotes[curSection].mustHitSection) //if mustHit is true then focus on bf
			{
				cam.set_target();
				cam.target_position(oChartReader._bf._x-oChartReader._bf.camoffsetx, oChartReader._bf._y-oChartReader._bf.camoffsety);
				cam.set_zoom(1)
			}
			else //focus on gf
			{
				cam.set_target(oChartReader._gf);
				cam.set_zoom(1.5);
			}
		}
		else
		{
			if(oChartReader.daNotes[curSection].mustHitSection) //if mustHit is true then focus on bf
			{
				cam.target_position(oChartReader._bf._x-oChartReader._bf.camoffsetx, oChartReader._bf._y-oChartReader._bf.camoffsety);
			}
			else //focus on dad
			{
				cam.target_position(oChartReader._dad._x+oChartReader._dad.camoffsetx, oChartReader._dad._y-oChartReader._dad.camoffsety);
			}
		}
		//SCROLL PAST THIS SHIT, I WAS HAVING FUN
		//if(variable_struct_exists(oChartReader.daNotes[curSection], "altAnim")) && (oChartReader.daNotes[(curBeat/4)].altAnim)
			//oChartReader._dad.character = "mom";
		//else
			//oChartReader._dad.character = "dad";
		//with(oChartReader._dad) event_user(0);
	}
	
	//Reseting to 'idle' animation when we need to
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
else if(songPosition < 0) //oh no... we need to countdown!
{
	songPosition += 1/room_speed*1000; //change songPosition by frame since music is not playing yet
	if(songPosition >= -crochet * 4) && (introCounter == 0) // Three
	{
		var _intro = "assets/sound/intro3.ogg";
		_intro = audio_create_stream(_intro);
		audio_play_sound(_intro,0,false);
		introCounter++;
	}
	if(songPosition >= -crochet * 3) && (introCounter == 1) // Two
	{
		var _intro = "assets/sound/intro2.ogg";
		_intro = audio_create_stream(_intro);
		audio_play_sound(_intro,0,false);
		introCounter++;
	}
	if(songPosition >= -crochet * 2) && (introCounter == 2) // One
	{
		var _intro = "assets/sound/intro1.ogg";
		_intro = audio_create_stream(_intro);
		audio_play_sound(_intro,0,false);
		introCounter++;
	}
	if(songPosition >= -crochet * 1) && (introCounter == 3) // GO! (omg gf has a hot voice xd)
	{
		var _intro = "assets/sound/introGo.ogg";
		_intro = audio_create_stream(_intro);
		audio_play_sound(_intro,0,false);
		introCounter++;
	}
}
else if(songPosition >= 0 && songPosition <= crochet && !instance_exists(oTransition)) //countdown finished but music is not playing... what now?
{
	inst = "assets/music/"+oChartReader.daSong.song+"_Inst.ogg"; //instrumental file location
	inststream = audio_create_stream(inst); //read instrumental and create a playable audio stream
	musinst = audio_play_sound(inststream,999,false); //actually play the instrumental
	
	//do the same as with the instrumental, but with the voices
	if(variable_struct_exists(oChartReader.daSong, "needsVoices")) && (oChartReader.daSong.needsVoices) //check if chart needs voices (tutorial doesn't need one)
	{
		voice = "assets/music/"+oChartReader.daSong.song+"_Voices.ogg"; 
		voicestream = audio_create_stream(voice);
		musvoice = audio_play_sound(voicestream,999,false);
	}
	switch(oPlay.difficulty)
	{
		case "":
			dif = "Normal";
			break;
		case "-easy":
			dif = "Easy";
			break;
		case "-hard":
			dif = "Hard";
			break;
	}
	rousr_dissonance_set_details("Playing Song:");
	rousr_dissonance_set_timestamps(0,audio_sound_length(musinst));
}

//song ended so transition back to freeplay
if(audio_sound_get_track_position(musinst) >= audio_sound_length(musinst)-0.05) && (!instance_exists(oTransition))
{
	var _trans = instance_create_layer(0,0,"Instances",oTransition);
	_trans.transIn = false;
	_trans.roomTo = Freeplay;
}

//hp = 0? if yes bf should fucking die
if(hp <= 0)
{
	instance_create_layer(oChartReader._bf.x-100,oChartReader._bf.y-100,"Instances",oBFFuckingDiesLol);
}

//hp more than max? make it max
if(hp > 2)
	hp = 2;

if(!instance_exists(oBFFuckingDiesLol)) rousr_dissonance_set_state(oChartReader.daSong.song+" ("+dif+") Score: "+string(songScore));