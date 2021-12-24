// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dopecamera(view_id, x = 0, y = 0)
{
	layer_create(-100,"Camera")
	var _dopecam = instance_create_layer(x,y,"Camera",oDopeCam);
	_dopecam.camID = view_id;
	_dopecam.vw = camera_get_view_width(view_camera[view_id]);
	_dopecam.vh = camera_get_view_height(view_camera[view_id]);
	return _dopecam;
}