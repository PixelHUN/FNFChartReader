_deadbf = sprite_add("assets/sprite/gameover/bfdies_strip.png",58,false,true,0,0);
_deadbfloop = sprite_add("assets/sprite/gameover/bfdead_strip.png", 10, false, true, 0, 0);

_animkey = 0;
framerate = 24;

dead = false;
gameovermusic = 0;

audio_stop_all();
instance_destroy(oNote);
instance_destroy(oCharacter);
layer_destroy(oStage.layer3);
instance_destroy(oConductor);
instance_destroy(oNoteHandler);
instance_destroy(oChartReader);
oCamera.targetx = x+220;
oCamera.targety = y+220;

bpm = 100;
crochet = (room_speed / bpm) * 1000; // beats ms
stepCrochet = crochet / 4; //steps ms
songPosition = 0;

curDecimalBeat = 0;
nextStep = 0;
curStep = 0;
curBeat = 0;

stepHit = false;
beatHit = false;

retrying = false;
alpha = -0.5;