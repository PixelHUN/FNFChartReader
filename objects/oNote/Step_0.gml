if(mustPress)
{
	if(isSusNote)
	{
		if(strumTime > oConductor.songPosition - (oConductor.safeZoneOffset * 1.5) && strumTime < oConductor.songPosition + (oConductor.safeZoneOffset * 0.5))
			canBeHit = true;
		else
			canBeHit = false;
	}
	else
	{
		if (strumTime > oConductor.songPosition - oConductor.safeZoneOffset && strumTime < oConductor.songPosition + oConductor.safeZoneOffset)
			canBeHit = true;
		else
			canBeHit = false;
	}

	if (strumTime < oConductor.songPosition - oConductor.safeZoneOffset * oConductor.timeScale && !wasGoodHit)
		tooLate = true;
}
else
{
	canBeHit = false;
	
	if(strumTime <= oConductor.songPosition)
		wasGoodHit = true;
}

if(tooLate)
{
	if(alpha > 0.3)
		alpha = 0.3;
}

if(wasGoodHit)
{
	instance_destroy();
}

daSong = oNoteHandler.daSong;
y = (oNoteHandler._disy-sprite_get_height(arrow_static)*0.7/2 - (oConductor.songPosition - strumTime) * (0.45 * daSong.speed));

if(isSusNote)
	y -= s_height;
		
/*if(mustPress && !isSusNote)
{
	switch(noteData)
	{
		case 0:
			if(oInputHandler.key_left && canBeHit)
			{
				wasGoodHit = true;
			}
			break;
		case 1:
			if(oInputHandler.key_down && canBeHit)
			{
				wasGoodHit = true;
			}
			break;
		case 2:
			if(oInputHandler.key_up && canBeHit)
			{
				wasGoodHit = true;
			}
			break;
		case 3:
			if(oInputHandler.key_right && canBeHit)
			{
				wasGoodHit = true;
			}
			break;
	}
}*/

if(oInputHandler.botplay)
	mustPress = false;