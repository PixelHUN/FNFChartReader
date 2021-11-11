var _col = c_white;

if(strumTime <= oConductor.songPosition+oConductor.safeZoneOffset*1.1 && isSusNote)
	depth = 1000; //this should put the strumnote behind the thing but IT SOMETIMES JUST DOESN'T >:O

if(onScreen)
	draw_sprite_ext(sprite,0,x,y,s_width/sprite_get_width(sprite),s_height/sprite_get_height(sprite),0,_col,alpha);