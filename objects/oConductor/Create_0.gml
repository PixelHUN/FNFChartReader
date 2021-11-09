bpm = 100;
crochet = (room_speed / bpm) * 1000; // beats ms
stepCrochet = crochet / 4; //steps ms
songPosition = 0;
lastSongPos = 0;
offset = 0;
introCounter = 0;
curSection = 0;

songScore = 0;

musinst = 0;
musvoice = 0;

safeFrames = 10;
safeZoneOffset = floor((safeFrames / room_speed) * 1000);
timeScale = safeZoneOffset / 166;

curDecimalBeat = 0;
nextStep = 0;
curStep = 0;

lastBeat = 0;
curBeat = 0;

beatHit = false;
stepHit = false;

instance_create_layer(0,0,"Instances",oChartReader);
instance_create_layer(0,0,"Instances",oInputHandler);
instance_create_layer(0,0,"Instances",oCamera);