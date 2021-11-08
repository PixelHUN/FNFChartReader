if(canShow)
{
	draw_sprite_ext(sprite,0,x,y-timer*2,1,1,0,c_white,alpha);
	timer++;
	if(timer > room_speed/2)
	{
		alpha -= 0.1;
		if(alpha <= 0)
			instance_destroy();
	}
}