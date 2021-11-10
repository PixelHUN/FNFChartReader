draw_text(0,700,songScore);

draw_set_color(c_red);
draw_rectangle(hpbarx+1,hpbary+1,hpbarx+600,hpbary+18,false);
draw_set_color(c_lime);
draw_rectangle(hpbarx+600,hpbary+18,hpbarx+600-(600*(hp/2)),hpbary+1,false); //lazy way of hp bar color lmao
draw_set_color(c_white);

draw_sprite(spr.hpbar,0,hpbarx,hpbary);


switch(oChartReader._dad.character)
{
	case "dad":
		icon = 12;
		icon2 = 13;
		break;
	case "spooky":
		icon = 2;
		icon2 = 3;
		break;
	case "pico":
		icon = 4;
		icon2 = 5;
		break;
	case "mom":
		icon = 6;
		icon2 = 7;
		break;
	case "parents-christmas":
		icon = 17;
		icon2 = 18;
		break;
	default:
		icon = 10;
		icon2 = 11;
		break;
}


//lazy icon stuuuufff
draw_sprite_part_ext(spr.icongrid,0,spr.gridsize*(icon-(10*floor(icon/10))),spr.gridsize*floor(icon/10),spr.gridsize,spr.gridsize,hpbarx-spr.gridsize/2-48+601-(601*(hp/2)),hpbary-spr.gridsize/2,1*_zoom,1*_zoom,c_white,1);
draw_sprite_part_ext(spr.icongrid,0,0,0,spr.gridsize,spr.gridsize,hpbarx+spr.gridsize/2+48+601-(601*(hp/2)),hpbary-spr.gridsize/2,-1*_zoom,1*_zoom,c_white,1);