switch(selection)
{
	case 0:
		oPlay.fpscap -= 10;
		break;
	case 1:
		oPlay.vsync = !oPlay.vsync;
		break;
	case 2:
		oPlay.downscroll = !oPlay.downscroll;
		break;
	case 3:
		if(oPlay.songspeed != 0)
			oPlay.songspeed += 0.1;
		else
			oPlay.songspeed = 1;
		break;
}