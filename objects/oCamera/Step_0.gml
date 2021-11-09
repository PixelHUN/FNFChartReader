//camx = camera_get_view_x(camera);
//camy = camera_get_view_y(camera);
camx = lerp(camx, targetx, smoothing);
camy = lerp(camy, targety, smoothing);
zoomout = lerp(zoomout, targetzoomout, smoothing)

camera_set_view_size(camera,camw*zoomout,camh*zoomout);
var vieww = camera_get_view_width(camera);
var viewh = camera_get_view_height(camera);
camera_set_view_pos(camera,camx-vieww*0.5,camy-viewh*0.5);