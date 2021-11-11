if(!vsync)
{
	if(room_speed != fpscap && !lowframerate)
	{
		room_speed = fpscap;
		show_debug_message("FPS Cap changed lmao");
	}
	if(fps_real < fpscap * 0.8)
	{
		room_speed = 60;
		lowframerate = true;
	}
	else
	{
		lowframerate = false;
	}
}