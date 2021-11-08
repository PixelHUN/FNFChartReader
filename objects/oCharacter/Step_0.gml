animkey += 12/room_speed;

if(oConductor.beatHit && animstate == "idle")
{
	danced = false;
}
if(!danced && animstate == "idle")
{
	x = _x;
	y = _y;
	animkey = 0;
	animtimer = 0;
	danced = true;
}

if(animkey > 6 && animstate == "idle")
{
	animkey = 6;
	animtimer = 0;
}
if(animstate != "idle")
{
	switch(animstate)
	{
		case "singLeft":
			x = _x+offsetleft[0];
			y = _y+offsetleft[1];
			if(!danced)
			{
				animkey = 7;
				danced = true;
			}
			if(animkey >= 8)
				animkey = 8;
			break;
			
		case "singRight":
			x = _x+offsetright[0];
			y = _y+offsetright[1];
			if(!danced)
			{
				animkey = 9;
				danced = true;
			}
			if(animkey >= 10)
				animkey = 10;
			break;
			
		case "singUp":
			x = _x+offsetup[0];
			y = _y+offsetup[1];
			if(!danced)
			{
				animkey = 11;
				danced = true;
			}
			if(animkey >= 12)
				animkey = 12;
			break;
			
		case "singDown":
			x = _x+offsetdown[0];
			y = _y+offsetdown[1];
			if(!danced)
			{
				animkey = 13;
				danced = true;
			}
			if(animkey >= 14)
				animkey = 14;
			break;
	}
	animframe += 12/room_speed;
	animtimer += 1/room_speed * 1000;
}