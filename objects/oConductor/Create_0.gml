bpm = 100;
crochet = (60 / bpm) * 1000; // beats ms
stepCrochet = crochet / 4; //steps ms
songPosition = 0;
lastSongPos = 0;
offset = 0;
introCounter = 0;

musinst = 0;
musvoice = 0;

safeFrames = 15;
safeZoneOffset = floor((safeFrames / 60) * 1000);
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

_bf = instance_create_layer(1800,600,"Instances",oCharacter);
with(_bf) event_user(0);

_dad = instance_create_layer(950,400,"Instances",oCharacter);
_dad.character = "mom";
with(_dad) event_user(0);