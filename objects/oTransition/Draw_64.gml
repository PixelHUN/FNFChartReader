depth = -1000;
if(transIn)
{
	if(transTimer == 0)
		_y = -(1000-720);
	_y = lerp(0,1000,transTimer/transSpeed);
	if(_y >= 1000)
		instance_destroy();
	transTimer++
}
else
{
	_y = lerp(-1000,-(1000-720),transTimer/transSpeed);
	if(_y >= -(1000-720))
	{
		if(instance_exists(oStage)) instance_destroy(oStage);
		if(roomTo != undefined)
			room_goto(roomTo);
		transIn = true;
		transTimer = 0;
	}
	transTimer++
}

draw_sprite(sTransition,0,_x,_y);