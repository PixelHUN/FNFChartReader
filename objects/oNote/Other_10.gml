if (prevNote == undefined)
	prevNote = self;
	
//x += 50;
//y -= 2000;

if(strumTime < 0)
	strumTime = 0;
	
switch(noteData)
{
	case 0:
		x += s_width * 0;
		sprite = spr.leftarrow;
		break;
	case 1:
		x += s_width * 1;
		sprite = spr.downarrow;
		break;
	case 2:
		x += s_width * 2;
		sprite = spr.uparrow;
		break;
	case 3:
		x += s_width * 3;
		sprite = spr.rightarrow;
		break;
}

if(isSusNote && prevNote != undefined)
{
	alpha = 0.6;
	
	s_width = 50*0.7;
	s_height = 50*0.7;
	x += s_width;
	
	switch(noteData)
	{
		case 0:
			sprite = spr.leftholdend;
			break;
		case 1:
			sprite = spr.downholdend;
			break;
		case 2:
			sprite = spr.upholdend;
			break;
		case 3:
			sprite = spr.rightholdend;
			break;
	}
	
	if(prevNote.isSusNote)
	{
		switch(noteData)
		{
			case 0:
				sprite = spr.lefthold;
				break;
			case 1:
				sprite = spr.downhold;
				break;
			case 2:
				sprite = spr.uphold;
				break;
			case 3:
				sprite = spr.righthold;
				break;
		}
		show_debug_message(string(prevNote.strumTime)+" - "+string(strumTime));
		
		var stepHeight = (0.45 * oConductor.stepCrochet) * oChartReader.daSong.speed;
		
		if(prevNote.prevNote.isSusNote) && (oPlay.downscroll)
			prevNote.s_height = -prevNote.s_height * ((stepHeight + 1) / prevNote.s_height);
		else if(prevNote.prevNote.isSusNote)
			prevNote.s_height *= (stepHeight + 1) / prevNote.s_height;
	}
}

