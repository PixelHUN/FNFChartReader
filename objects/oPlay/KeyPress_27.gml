if(_paused)
{
	var _trans = instance_create_layer(0,0,"Instances",oTransition);
	_trans.transIn = false;
	_trans.roomTo = Freeplay;
	_paused = false;
}