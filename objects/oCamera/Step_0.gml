//camx = camera_get_view_x(camera);
//camy = camera_get_view_y(camera);
//delta time shit, so framerate doesn't change camera speed
var _dt = delta_time / 1000000;
camx = lerp(camx, targetx, smoothing * _dt);
camy = lerp(camy, targety, smoothing * _dt);
zoomout = lerp(zoomout, targetzoomout, 5 * _dt)

camera_set_view_size(camera,camw*zoomout,camh*zoomout);
var vieww = camera_get_view_width(camera);
var viewh = camera_get_view_height(camera);
camera_set_view_pos(camera,camx-vieww*0.5,camy-viewh*0.5);