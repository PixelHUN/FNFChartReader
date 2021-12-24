if(isActive)
{
	if(target != undefined)
	{
		tx = target.x;
		ty = target.y;
	}

	cx = lerp(cx, tx, smooth);
	cy = lerp(cy, ty, smooth);

	var cam = view_camera[camID];

	//camera_set_view_size(cam, vw/zoom, vh/zoom);

	var curW = camera_get_view_width(cam);
	var curH = camera_get_view_height(cam);
	
	var newW = lerp(curW, vw/zoom, smooth);
	var newH = lerp(curH, vh/zoom, smooth);
	camera_set_view_size(cam, newW, newH);
	
	//camera_set_view_pos(cam,cx,cy);
	camera_set_view_pos(cam,(cx+ox)-newW/2,(cy+oy)-newH/2);
}