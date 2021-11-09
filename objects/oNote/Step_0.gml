if(mustPress)
{
	if(isSusNote)
	{
		if(strumTime > oConductor.songPosition - (oConductor.safeZoneOffset * 1.5) && strumTime < oConductor.songPosition + (oConductor.safeZoneOffset * 0.9))
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
	
	if(strumTime <= oConductor.songPosition) && (!isSusNote)
		wasGoodHit = true;
	else if(strumTime <= oConductor.songPosition + 100)
		wasGoodHit = true;
}

if(tooLate)
{
	if(alpha > 0.3)
		alpha = 0.3;
}

if(wasGoodHit)
{
	if(mustPress) && (!isSusNote)
	{
		var _popupScore = instance_create_layer(oChartReader._gf.x,oChartReader._gf.y,"Instances",oPopUp);
		_popupScore.daNote = self;
	}
	
	var _anim = "idle";

	switch(noteData)
	{
		case 0:
			_anim = "singLeft";
			break;
			
		case 1:
			_anim = "singDown";
			break;
			
		case 2:
			_anim = "singUp";
			break;
			
		case 3:
			_anim = "singRight";
			break;
	}
	if(mustPress)
	{
		oChartReader._bf.danced = false;
		oChartReader._bf.animtimer = 0;
		oChartReader._bf.animframe = 0;
		oChartReader._bf.animstate = _anim;
	}
	else
	{
		oChartReader._dad.danced = false;
		oChartReader._dad.animtimer = 0;
		oChartReader._dad.animframe = 0;
		oChartReader._dad.animstate = _anim;
	}
	instance_destroy();
}

daSong = oNoteHandler.daSong;
if(mustPress)
	y = (oNoteHandler._disy-sprite_get_height(arrow_static)*0.7/2 - (oConductor.songPosition - strumTime) * (0.45 * daSong.speed));
else
	y = (oNoteHandler._disy-sprite_get_height(arrow_static)*0.7 - (oConductor.songPosition - strumTime) * (0.45 * daSong.speed));

if(isSusNote)
	y += -s_height + yOffset;
		
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

if(oInputHandler.botplay) && (mustPress)
{
	if(strumTime <= oConductor.songPosition + oConductor.safeZoneOffset/2 && canBeHit)
	{
		switch(noteData)
		{
			case 0:
				keyboard_key_press(oInputHandler.left);
				break;
			case 1:
				keyboard_key_press(oInputHandler.down);
				break;
			case 2:
				keyboard_key_press(oInputHandler.up);
				break;
			case 3:
				keyboard_key_press(oInputHandler.right);
				break;
		}
	}
}