//checking the character
switch(character)
{
	case "gf":
		sprite = spr.gf;
		framerate = 24;
		break;
	
	case "bf":
		sprite = spr.bf;
		offsetleft = [-17, 6];
		offsetright = [33, 7];
		offsetup = [24, -12];
		offsetdown = [5, 25];
		camoffsetx = 200;
		camoffsety = 110;
		break;
	case "dad":
		sprite = spr.dad;
		offsetleft = [0, -10];
		offsetright = [20, -27];
		offsetup = [6, -30];
		offsetdown = [0, 25];
		camoffsetx = 200;
		camoffsety = -70;
		break;
	case "mom":
		sprite = spr.mom;
		offsetleft = [-20, 0];
		offsetright = [20, 0];
		offsetup = [0, 10];
		offsetdown = [0, 80];
		camoffsetx = 200;
		camoffsety = -30;
		break;
	default:
		sprite = spr.dad;
		offsetleft = [0, -10];
		offsetright = [20, -27];
		offsetup = [6, -30];
		offsetdown = [0, 25];
		camoffsetx = 200;
		camoffsety = -70;
		break;
}