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