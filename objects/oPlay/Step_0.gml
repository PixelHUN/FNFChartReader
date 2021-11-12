if(!vsync)
{
	if(room_speed != fpscap && !lowframerate)
	{
		room_speed = fpscap;
		show_debug_message("FPS Cap changed lmao");
	}
	if(fps_real < fpscap * 0.9)
	{
		room_speed = 60;
		show_debug_message("oopsie my code is shit so low framerate");
		lowframerate = true;
	}
	else
	{
		lowframerate = false;
	}
}
else
{
	if(room_speed != 60)
		room_speed = 60;
}

if(lastvsync != vsync)
	display_reset(0, vsync);

lastvsync = vsync;