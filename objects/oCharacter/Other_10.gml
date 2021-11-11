//checking the character
try
{
	var _file = file_text_open_read("assets/characters/"+character+".txt");
	var charText = array_create(0);
	var i = 0;
	while(!file_text_eof(_file))
	{
		charText[i] = file_text_read_string(_file);
		file_text_readln(_file);
		i++;
	}
	sprite = sprite_add("assets/sprite/characters/"+charText[0],charText[1],false,true,250,250);
	var _offsetleft = split(charText[2],",");
	offsetleft[0] = ds_queue_dequeue(_offsetleft);
	offsetleft[1] = ds_queue_dequeue(_offsetleft);
	var _offsetright = split(charText[3],",");
	offsetright[0] = ds_queue_dequeue(_offsetright);
	offsetright[1] = ds_queue_dequeue(_offsetright);
	var _offsetup = split(charText[4],",");
	offsetup[0] = ds_queue_dequeue(_offsetup);
	offsetup[1] = ds_queue_dequeue(_offsetup);
	var _offsetdown = split(charText[5],",");
	offsetdown[0] = ds_queue_dequeue(_offsetdown);
	offsetdown[1] = ds_queue_dequeue(_offsetdown);
	camoffsetx = charText[6];
	camoffsety = charText[7];
	
	if(character == "gf")
		framerate = 24;
}
catch(_e)
{
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
	show_debug_message(_e.message);
}
