// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camera_point_to(_character, _zoomout = oCamera.targetzoomout){
	if(is_string(_character))
	{
		switch(_character)
		{
			case "bf":
				_character = 0;
				break;
			case "dad":
				_character = 1;
				break;
		}
	}
	
	var _disw = camera_get_view_width(oCamera.camera)/2;
	var _dish = camera_get_view_height(oCamera.camera)/2;
	
	if(_character == 0)
	{
		oCamera.targetx = oConductor._bf._x-_disw;
		oCamera.targety = oConductor._bf._y-_dish;
	}
	else
	{
		oCamera.targetx = oConductor._dad._x-_disw;
		oCamera.targety = oConductor._dad._y-_dish;
	}
	oCamera.targetzoomout = _zoomout;
}