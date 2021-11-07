bpm = 100;
crochet = (60 / bpm) * 1000; // beats ms
stepCrochet = crochet / 4; //steps ms
songPosition = 0;
lastSongPos = 0;
offset = 0;

safeFrames = 10;
safeZoneOffset = floor((safeFrames / 60) * 1000);
timeScale = safeZoneOffset / 166;

instance_create_layer(0,0,"Instances",oChartReader);
instance_create_layer(0,0,"Instances",oInputHandler);