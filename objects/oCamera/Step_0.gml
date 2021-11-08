//camx = camera_get_view_x(camera);
//camy = camera_get_view_y(camera);
camx = lerp(camx, targetx, smoothing);
camy = lerp(camy, targety, smoothing);
zoomout = lerp(zoomout, targetzoomout, smoothing)

camera_set_view_pos(camera,camx,camy);
camera_set_view_size(camera,camw*zoomout,camh*zoomout);