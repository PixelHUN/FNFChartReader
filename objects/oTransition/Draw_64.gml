depth = -1000;
if(transIn)
{
	if(transTimer == 0)
		_y = 0;
	_y = lerp(0,720,transTimer/transSpeed);
	if(_y >= 720)
		instance_destroy();
	transTimer++
}
else
{
	_y = lerp(-720,0,transTimer/transSpeed);
	if(_y >= 0)
	{
		if(roomTo != undefined)
			room_goto(roomTo);
		transIn = true;
		transTimer = 0;
	}
	transTimer++
}

draw_sprite(sTransition,0,_x,_y);