var _col = c_white;

if(canBeHit)
	_col = c_red;
else
	_col = c_white;

draw_sprite_stretched_ext(sprite,0,x,y,s_width,s_height,_col,alpha);