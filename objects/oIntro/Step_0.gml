songPosition = audio_sound_get_track_position(musinst)*1000;
	
curDecimalBeat = (songPosition / 1000) * bpm / room_speed;
nextStep = floor(songPosition / stepCrochet);

stepHit = false;
beatHit = false;

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

curBeat = floor(curStep/4)

if(keyboard_check_pressed(vk_anykey))
	curBeat = 16;

if(intro)
{
	if(curBeat == 0)
	{
		swagText = "Fluffy\nPresents";
	}
	if(curBeat == 2)
	{
		swagText = "";
	}
	if(curBeat == 3)
	{
		swagText = "Original Game by:\n \n ";
	}
	if(curBeat == 4)
	{
		swagText = "Original Game by:\nninja_muffin99, PhantomArcade,\n evilsk8r, KawaiiSprite";
	}
	if(curBeat == 5)
	{
		swagText = "";
	}
	if(curBeat == 6)
	{
		swagText = "Made in:\n ";
	}
	if(curBeat == 7)
	{
		swagText = "Made in:\nGame Maker Studio 2";
	}
	if(curBeat == 8)
	{
		swagText = "";
	}
	if(curBeat == 9)
	{
		swagText = rndmTextArray[0]+"\n ";
	}
	if(curBeat == 11)
	{
		swagText = rndmTextArray[0]+"\n"+rndmTextArray[1];
	}
	if(curBeat == 12)
	{
		swagText = "";
	}
	if(curBeat == 13)
	{
		swagText = "Friday\n \n ";
	}
	if(curBeat == 14)
	{
		swagText = "Friday\nNight\n ";
	}
	if(curBeat == 15)
	{
		swagText = "Friday\nNight\nFunkin'";
	}
	if(curBeat == 16 && !instance_exists(oTitle))
	{
		swagText = "";
		instance_create_layer(0,0,"Instances",oTitle);
		intro = false;
	}
}