//Bullshit cuz of with();
var _data = -1;
var _dataHold = -1;

sortbyshit = function(_a, _b)
{
	return _a.strumTime - _b.strumTime;
}

var _closestNotes = array_create(0);

with(oNote)
{
	if(self.canBeHit && self.mustPress && !self.wasGoodHit)
		array_push(_closestNotes, self);
}

array_sort(_closestNotes, sortbyshit);

var _dataNotes = array_create(0);

for(var i = 0; i < array_length(_closestNotes); i++)
{
	if(!_closestNotes[i].isSusNote)
	{
		switch(_closestNotes[i].noteData)
		{
			case 0:
				if(oInputHandler.key_left) _data = 0;
				break;
			case 1:
				if(oInputHandler.key_down) _data = 1;
				break;
			case 2:
				if(oInputHandler.key_up) _data = 2;
				break;
			case 3:
				if(oInputHandler.key_right) _data = 3;
				break;
		}
	}
	else
	{
		switch(_closestNotes[i].noteData)
		{
			case 0:
				if(oInputHandler.left_hold) _dataHold = 0;
				break;
			case 1:
				if(oInputHandler.down_hold) _dataHold = 1;
				break;
			case 2:
				if(oInputHandler.up_hold) _dataHold = 2;
				break;
			case 3:
				if(oInputHandler.right_hold) _dataHold = 3;
				break;
		}
	}
	if(_closestNotes[i].noteData == _data && !_closestNotes[i].isSusNote)
	{
		array_push(_dataNotes,_closestNotes[i])
	}
	with(oNote)
	{
		if(self.isSusNote && self.canBeHit && self.mustPress && self.susActive && _dataHold == self.noteData)
		{
			self.wasGoodHit = true;
		}
	}
}

var _mustPress = false;

if (array_length(_dataNotes) != 0)
{
	var coolNote = _dataNotes[0];
	
	_mustPress = coolNote.mustPress;
	coolNote.wasGoodHit = true;
}