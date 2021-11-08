switch(stage)
{
	default:
		_bg = sprite_add("assets/sprite/backgrounds/stage/stageback.png",1,false,true,0,0);
		bgx = -700;
		bgy = -400;
		layer1 = layer_create(1000,"par1");
		par1 = 0.15;
		var _lay1sprite = layer_sprite_create(layer1,bgx,bgy,_bg);
		layer_sprite_xscale(_lay1sprite, scale);
		layer_sprite_yscale(_lay1sprite, scale);
		
		_ground = sprite_add("assets/sprite/backgrounds/stage/stagefront.png",1,false,true,0,0);
		groundx = -780;
		groundy = 420;
		layer2 = layer_create(999,"par2");
		par2 = 0.05;
		var _lay2sprite = layer_sprite_create(layer2,groundx,groundy,_ground);
		layer_sprite_xscale(_lay2sprite, scale);
		layer_sprite_yscale(_lay2sprite, scale);
		
		_front = sprite_add("assets/sprite/backgrounds/stage/stagecurtains.png",1,false,true,0,0);
		frontx = -820;
		fronty = -500;
		layer3 = layer_create(-50,"par3");
		par3 = -0.1;
		var _lay3sprite = layer_sprite_create(layer3,frontx,fronty,_front);
		layer_sprite_xscale(_lay3sprite, scale);
		layer_sprite_yscale(_lay3sprite, scale);
		break;
}