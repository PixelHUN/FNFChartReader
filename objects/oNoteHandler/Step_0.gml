//Bullshit cuz of with();

sortbyshit = function(_a, _b)
{
	return _a.strumTime - _b.strumTime;
}

key_up = oInputHandler.key_up;
key_down = oInputHandler.key_down;
key_right = oInputHandler.key_right;
key_left = oInputHandler.key_left;

up_hold = oInputHandler.up_hold;
down_hold = oInputHandler.down_hold;
right_hold = oInputHandler.right_hold;
left_hold = oInputHandler.left_hold;

controlArray = [key_left, key_down, key_up, key_right];

if(key_up || key_right || key_down || key_left)
{
	var possibleNotes = [];
	var ignoreList = [];
	
	with(oNote)
	{
		if(self.canBeHit && self.mustPress && !self.tooLate && !self.wasGoodHit)
		{
			array_push(possibleNotes, self);
			array_push(ignoreList, self.noteData);
			
			array_sort(possibleNotes, other.sortbyshit);
		}
	}
	
	if(array_length(possibleNotes) > 0)
	{
		var daNote = possibleNotes[0];
		
		if(array_length(possibleNotes) >= 2)
		{
			if(possibleNotes[0].strumTime == possibleNotes[1].strumTime)
			{
				for(var i = 0; i < array_length(possibleNotes); i++)
				{
					if(other.controlArray[possibleNotes[i].noteData])
						possibleNotes[i].wasGoodHit = true;
				}
			}
			else if (possibleNotes[0].noteData == possibleNotes[1].noteData)
			{
				if(other.controlArray[daNote.noteData])
				{
					daNote.wasGoodHit = true;
				}
			}
			else
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
		else
		{
			if(other.controlArray[daNote.noteData])
			{
				daNote.wasGoodHit = true;
			}
		}
	}
}

if(up_hold || right_hold || down_hold || left_hold)
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