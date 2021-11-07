//if (prevNote == undefined)
//	prevNote = object_index;
	
//x += 50;
//y -= 2000;

if(strumTime < 0)
	strumTime = 0;
	
switch(noteData)
{
	case 0:
		x += s_width * 0;
		sprite = purple;
		break;
	case 1:
		x += s_width * 1;
		sprite = blue;
		break;
	case 2:
		x += s_width * 2;
		sprite = green;
		break;
	case 3:
		x += s_width * 3;
		sprite = red;
		break;
}

if(isSusNote && prevNote != undefined)
{
	alpha = 0.6;
	
	x += s_width / 2;
	s_width = 50;
	
	switch(noteData)
	{
		case 0:
			sprite = pruple_end_hold;
			break;
		case 1:
			sprite = blue_hold_end;
			break;
		case 2:
			sprite = green_hold_end;
			break;
		case 3:
			sprite = red_hold_end;
			break;
	}
	
	if(prevNote.isSusNote)
	{
		switch(noteData)
		{
			case 0:
				sprite = purple_hold_piece;
				break;
			case 1:
				sprite = blue_hold_piece;
				break;
			case 2:
				sprite = green_hold_piece;
				break;
			case 3:
				sprite = red_hold_piece;
				break;
		}
	}
	
}