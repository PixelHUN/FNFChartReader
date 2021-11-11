camx = oChartReader._gf.x;
camy = oChartReader._gf.y;
targetx = camx;
targety = camy;

zoomout = 1.2;
targetzoomout = 1;

smoothing = 0.03;

camera = view_camera[0];
camw = camera_get_view_width(camera);
camh = camera_get_view_height(camera);