//Bullshit stuff for note handling <- i had a stroke writing this lol

sortbyshit = function(_a, _b) //same function for sorting as in chart reader
{
	return _a.strumTime - _b.strumTime;
}

if(!oChartReader.sevenkeys)
{
	//get the keys from input handler
	key_up = oInputHandler.key_up;
	key_down = oInputHandler.key_down;
	key_right = oInputHandler.key_right;
	key_left = oInputHandler.key_left;

	up_hold = oInputHandler.up_hold;
	down_hold = oInputHandler.down_hold;
	right_hold = oInputHandler.right_hold;
	left_hold = oInputHandler.left_hold;

	//an array for easier note hit detection stuff
	controlArray = [key_left, key_down, key_up, key_right];

	if(key_up || key_right || key_down || key_left)
	{
		var possibleNotes = [];
		var ignoreList = []; //i dunno what this is for, but apparently it was in the source code
	
		with(oNote)
		{
			//get a list of possible to hit notes
			if(self.canBeHit && self.mustPress && !self.tooLate && !self.wasGoodHit)
			{
				array_push(possibleNotes, self);
				array_push(ignoreList, self.noteData);
			
				array_sort(possibleNotes, other.sortbyshit);
			}
		}
	
		if(array_length(possibleNotes) > 0)
		{
			//daNote should be the first note that's possible to hit
			var daNote = possibleNotes[0];
		
			if(array_length(possibleNotes) >= 2) //ohno there's more than one possible to hit note
			{
				if(possibleNotes[0].strumTime == possibleNotes[1].strumTime) //double notes/chords
				{
					for(var i = 0; i < array_length(possibleNotes); i++)
					{
						if(other.controlArray[possibleNotes[i].noteData])
							possibleNotes[i].wasGoodHit = true;
					}
				}
				else if (possibleNotes[0].noteData == possibleNotes[1].noteData) //double notes but they are literrally the same
				{
					if(other.controlArray[daNote.noteData])
					{
						daNote.wasGoodHit = true;
					}
				}
				else //everything else
				{
					for(var i = 0; i < array_length(possibleNotes); i++)
					{
						if(other.controlArray[possibleNotes[i].noteData])
						{
							possibleNotes[i].wasGoodHit = true;
						}
					}
				}
			}
			else //just a single note
			{
				if(other.controlArray[daNote.noteData])
				{
					daNote.wasGoodHit = true;
				}
			}
		}
		else
		{
			oConductor.hp -= 0.01;
			oConductor.misses++;
			oConductor.songScore -= 10;
			var _misssfx = "assets/sound/missnote"+string(irandom_range(1,3))+".ogg"
			var _sound = audio_create_stream(_misssfx);
			audio_play_sound(_sound,0,false);
			oChartReader._bf.danced = false;
			oChartReader._bf.animtimer = 0;
			oChartReader._bf.animframe = 0;
			if(key_left) oChartReader._bf.animstate = "missLeft";
			if(key_down) oChartReader._bf.animstate = "missDown";
			if(key_up) oChartReader._bf.animstate = "missUp";
			if(key_right) oChartReader._bf.animstate = "missRight";
		}
	}

	if(up_hold || right_hold || down_hold || left_hold) //sustain note hitting
	{
		with(oNote)
		{
			if(self.canBeHit && self.mustPress && self.isSusNote)
			{
				switch(self.noteData)
				{
					case 0:
						if(other.left_hold)
							self.wasGoodHit = true;
						break;
					case 1:
						if(other.down_hold)
							self.wasGoodHit = true;
						break;
					case 2:
						if(other.up_hold)
							self.wasGoodHit = true;
						break;
					case 3:
						if(other.right_hold)
							self.wasGoodHit = true;
						break;
				}
			}
		}
	}
}
else
{
	//get the keys from input handler
	key_up = oInputHandler.key_up;
	key_down = oInputHandler.key_down;
	key_right = oInputHandler.key_right;
	key_left = oInputHandler.key_left;
	key_s = oInputHandler.key_s;
	key_l = oInputHandler.key_l;
	key_space = oInputHandler.key_space;

	up_hold = oInputHandler.up_hold;
	down_hold = oInputHandler.down_hold;
	right_hold = oInputHandler.right_hold;
	left_hold = oInputHandler.left_hold;
	s_hold = oInputHandler.s_hold;
	l_hold = oInputHandler.l_hold;
	space_hold = oInputHandler.space_hold;

	//an array for easier note hit detection stuff
	controlArray = [key_s, key_left, key_down, key_space, key_up, key_right, key_l];

	if(key_up || key_right || key_down || key_left || key_s || key_l || key_space)
	{
		var possibleNotes = [];
		var ignoreList = []; //i dunno what this is for, but apparently it was in the source code
	
		with(oNote)
		{
			//get a list of possible to hit notes
			if(self.canBeHit && self.mustPress && !self.tooLate && !self.wasGoodHit)
			{
				array_push(possibleNotes, self);
				array_push(ignoreList, self.noteData);
			
				array_sort(possibleNotes, other.sortbyshit);
			}
		}
	
		if(array_length(possibleNotes) > 0)
		{
			//daNote should be the first note that's possible to hit
			var daNote = possibleNotes[0];
		
			if(array_length(possibleNotes) >= 2) //ohno there's more than one possible to hit note
			{
				if(possibleNotes[0].strumTime == possibleNotes[1].strumTime) //double notes/chords
				{
					for(var i = 0; i < array_length(possibleNotes); i++)
					{
						if(other.controlArray[possibleNotes[i].noteData])
							possibleNotes[i].wasGoodHit = true;
					}
				}
				else if (possibleNotes[0].noteData == possibleNotes[1].noteData) //double notes but they are literrally the same
				{
					if(other.controlArray[daNote.noteData])
					{
						daNote.wasGoodHit = true;
					}
				}
				else //everything else
				{
					for(var i = 0; i < array_length(possibleNotes); i++)
					{
						if(other.controlArray[possibleNotes[i].noteData])
						{
							possibleNotes[i].wasGoodHit = true;
						}
					}
				}
			}
			else //just a single note
			{
				if(other.controlArray[daNote.noteData])
				{
					daNote.wasGoodHit = true;
				}
			}
		}
		else
		{
			oConductor.hp -= 0.01;
			oConductor.misses++;
			oConductor.songScore -= 10;
			var _misssfx = "assets/sound/missnote"+string(irandom_range(1,3))+".ogg"
			var _sound = audio_create_stream(_misssfx);
			audio_play_sound(_sound,0,false);
			oChartReader._bf.danced = false;
			oChartReader._bf.animtimer = 0;
			oChartReader._bf.animframe = 0;
			if(key_s || key_up) oChartReader._bf.animstate = "missLeft";
			if(key_left) oChartReader._bf.animstate = "missDown";
			if(key_right || key_space) oChartReader._bf.animstate = "missUp";
			if(key_down || key_l) oChartReader._bf.animstate = "missRight";
		}
	}

	if(up_hold || right_hold || down_hold || left_hold || s_hold || l_hold || space_hold) //sustain note hitting
	{
		with(oNote)
		{
			if(self.canBeHit && self.mustPress && self.isSusNote)
			{
				switch(self.noteData)
				{
					case 0:
						if(other.s_hold)
							self.wasGoodHit = true;
						break;
					case 1:
						if(other.left_hold)
							self.wasGoodHit = true;
						break;
					case 2:
						if(other.down_hold)
							self.wasGoodHit = true;
						break;
					case 3:
						if(other.space_hold)
							self.wasGoodHit = true;
						break;
					case 4:
						if(other.up_hold)
							self.wasGoodHit = true;
						break;
					case 5:
						if(other.right_hold)
							self.wasGoodHit = true;
						break;
					case 6:
						if(other.l_hold)
							self.wasGoodHit = true;
						break;
				}
			}
		}
	}
}