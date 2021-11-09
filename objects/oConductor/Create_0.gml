bpm = 100;
crochet = (room_speed / bpm) * 1000; // beats in ms
stepCrochet = crochet / 4; //steps in ms
songPosition = 0;

offset = 0; //not yet used lmao

introCounter = 0 //start countdown

songScore = 0;

//preparing music variables so it doesn't make the game crash lmao
musinst = 0;
musvoice = 0;

//safe zone stuff for timing windows
safeFrames = 10;
safeZoneOffset = floor((safeFrames / room_speed) * 1000);
timeScale = safeZoneOffset / 166;

//beat counting stuff
curDecimalBeat = 0;
nextStep = 0;
curStep = 0;
curSection = 0;

lastBeat = 0;
curBeat = 0;

beatHit = false;
stepHit = false;

instance_create_layer(0,0,"Instances",oChartReader); //Reading the chart
instance_create_layer(0,0,"Instances",oInputHandler); //Input handler for handling input <- wow really?
instance_create_layer(0,0,"Instances",oCamera); //Da Camera