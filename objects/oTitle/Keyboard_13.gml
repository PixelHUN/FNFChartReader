if(!enter)
{
	instance_destroy(_gf);
	audio_stop_sound(oIntro.musinst);
	instance_destroy(oIntro);
	instance_destroy();
	var _trans = instance_create_layer(0,0,"Instances",oTransition);
	_trans.transIn = false;
	_trans.roomTo = Freeplay;
}