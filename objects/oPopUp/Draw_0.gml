if(canShow)
{
	draw_sprite_ext(sprite,0,x,y-timer*2,1,1,0,c_white,alpha);
	timer += 60/room_speed;
	depth += 1;
	if(timer > 30)
	{
		alpha -= 0.1 * 60/room_speed;
		if(alpha <= 0)
			instance_destroy();
	}
}