if(!oPlay._paused)
{
	animkey += framerate/room_speed;

	//is the character gf?
	if(character != "gf")
	{
		//idle shit
		if(oConductor.curBeat mod 2 == 0 && animstate == "idle" && !animplaying)
		{
			danced = false;
			animplaying = true;
			x = _x;
			y = _y;
		}
		if(!danced && animstate == "idle" && animkey != 0)
		{
			x = _x;
			y = _y;
			animkey = 0;
			animtimer = 0;
			danced = true;
		}

		if(animkey > 6 && animstate == "idle")
		{
			x = _x;
			y = _y;
			animkey = 6;
			animtimer = 0;
			animplaying = false;
		}
		if(animstate != "idle")
		{
			switch(animstate) //OMG A SWITCH STATEMENT AM I NOT YANDEREDEV?
			{
				case "singLeft":
					x = _x+offsetleft[0];
					y = _y+offsetleft[1];
					if(xscale == -1)
					{
						if(!danced)
						{
							animkey = 9;
							danced = true;
						}
						if(animkey >= 10)
							animkey = 10;
					}
					else
					{
						if(!danced)
						{
							animkey = 7;
							danced = true;
						}
						if(animkey >= 8)
							animkey = 8;
					}
					break;
			
				case "singRight":
					x = _x+offsetright[0];
					y = _y+offsetright[1];
					if(xscale == -1)
					{
						if(!danced)
						{
							animkey = 7;
							danced = true;
						}
						if(animkey >= 8)
							animkey = 8;
					}
					else
					{
						if(!danced)
						{
							animkey = 9;
							danced = true;
						}
						if(animkey >= 10)
							animkey = 10;
					}
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
				case "missLeft":
					x = _x+offsetleft[0];
					y = _y+offsetleft[1]-10;
					if(!danced)
					{
						animkey = 15;
						danced = true;
					}
					if(animkey >= 16)
						animkey = 16;
					break;
			
				case "missRight":
					x = _x+offsetright[0];
					y = _y+offsetright[1]-10;
					if(!danced)
					{
						animkey = 17;
						danced = true;
					}
					if(animkey >= 18)
						animkey = 18;
					break;
			
				case "missUp":
					x = _x+offsetup[0];
					y = _y+offsetup[1]-10;
					if(!danced)
					{
						animkey = 19;
						danced = true;
					}
					if(animkey >= 20)
						animkey = 20;
					break;
			
				case "missDown":
					x = _x+offsetdown[0];
					y = _y+offsetdown[1]-10;
					if(!danced)
					{
						animkey = 21;
						danced = true;
					}
					if(animkey >= 22)
						animkey = 22;
					break;
			}
			animframe += framerate/room_speed;
			animtimer += 1/room_speed * 1000;
		}
	}
	else
	{
		//gf dancing - head boppin' shit
		if(instance_exists(oConductor))
		{
			if(oConductor.beatHit)
			{
				danceLeft = !danceLeft
				if(danceLeft)
					animkey = 0;
				else
					animkey = 15;
			}
		}
		else
		{
			if(oIntro.beatHit)
			{
				danceLeft = !danceLeft
				if(danceLeft)
					animkey = 0;
				else
					animkey = 15;
			}
		}
		if(danceLeft && animkey >= 14)
			animkey = 14;
		if(!danceLeft && animkey >= 29)
			animkey = 29;
	}
}