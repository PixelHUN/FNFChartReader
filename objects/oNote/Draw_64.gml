var _col = c_white;

if(strumTime <= oConductor.songPosition+oConductor.safeZoneOffset*1.1 && isSusNote)
	depth = 1000;
else if(isSusNote)
	depth = -900;
else
	depth = -1000;

draw_sprite_stretched_ext(sprite,0,x,y,s_width,s_height,_col,alpha);