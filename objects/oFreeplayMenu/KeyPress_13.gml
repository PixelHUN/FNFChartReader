if(!instance_exists(oTransition))
{
	oPlay.songname = freeplaysonglist[selection];

	switch(oPlay.songname)
	{
		case "satin panties":
			oPlay.songname = "satin-panties";
			break;
	}

	oPlay.difficulty = dif;
	audio_stop_all();

	var _trans = instance_create_layer(0,0,"Instances",oTransition);
	_trans.transIn = false;
	_trans.roomTo = Room1;
}