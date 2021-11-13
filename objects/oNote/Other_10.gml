if (prevNote == undefined)
	prevNote = self;
	
//x += 50;
//y -= 2000;

if(strumTime < 0)
	strumTime = 0;
	
if(!oChartReader.sevenkeys)
{
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
}
else
{
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
			sprite = spr.rightarrow;
			break;
		case 3:
			x += s_width * 3;
			sprite = spr.uparrow;
			break;
		case 4:
			x += s_width * 4;
			sprite = spr.leftarrow;
			break;
		case 5:
			x += s_width * 5;
			sprite = spr.uparrow;
			break;
		case 6:
			x += s_width * 6;
			sprite = spr.rightarrow;
			break;
	}
}
if(isSusNote && prevNote != undefined)
{
	alpha = 0.6;
	var stepHeight = (0.45 * oConductor.stepCrochet) * oChartReader.daSong.speed;
	
	yOffset = round(-stepHeight + s_width * 0.5);
	
	s_width = 50*oChartReader.notescale;
	s_height = 50*oChartReader.notescale;
	x += s_width;
	
	if(oChartReader.sevenkeys)
	{
		switch(noteData)
		{
			case 0:
				sprite = spr.leftholdend;
				break;
			case 1:
				sprite = spr.downholdend;
				break;
			case 2:
				sprite = spr.rightholdend;
				break;
			case 3:
				sprite = spr.upholdend;
				break;
			case 4:
				sprite = spr.leftholdend;
				break;
			case 5:
				sprite = spr.upholdend;
				break;
			case 6:
				sprite = spr.rightholdend;
				break;
		}
	}
	else
	{
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
	}
	
	if(prevNote.isSusNote)
	{
		if(oChartReader.sevenkeys)
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
					sprite = spr.righthold;
					break;
				case 3:
					sprite = spr.uphold;
					break;
				case 4:
					sprite = spr.lefthold;
					break;
				case 5:
					sprite = spr.uphold;
					break;
				case 6:
					sprite = spr.righthold;
					break;
			}
		}
		else
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
		}
		show_debug_message(string(prevNote.strumTime)+" - "+string(strumTime));
		
		//if(prevNote.isSusNote)
		
	}
	s_height *= (stepHeight + 1) / s_height;
}

