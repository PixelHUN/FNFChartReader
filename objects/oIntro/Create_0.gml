bpm = 102;
crochet = (60 / bpm) * 1000; // beats ms
stepCrochet = crochet / 4; //steps ms
songPosition = 0;

curDecimalBeat = 0;
nextStep = 0;
curStep = 0;
curBeat = 0;

stepHit = false;
beatHit = false;

intro = true;

music = audio_create_stream("assets/music/freakyMenu.ogg")
musinst = audio_play_sound(music,0,true);

var _fontsprite = sprite_add("assets/sprite/font.png",43,false,true,0,0);
font = font_add_sprite_ext(_fontsprite, "abcdefghijklmnopqrstuvwxyz,_0123456789-.:@~", true, -20);

swagText = "";

var _file = file_text_open_read("assets/introText.txt");
var i = 0;

while(!file_text_eof(_file))
{
	rndmText[i] = file_text_read_string(_file);
	file_text_readln(_file);
	i++;
}

randomize();
rndmTextLine = rndmText[irandom_range(0,array_length(rndmText)-1)];

rndmTextSplit = ds_queue_create();
rndmTextSplit = split(rndmTextLine, "-");

rndmTextArray[0] = ds_queue_dequeue(rndmTextSplit);
rndmTextArray[2] = ds_queue_dequeue(rndmTextSplit);
rndmTextArray[1] = ds_queue_dequeue(rndmTextSplit);

show_debug_message(rndmTextLine);
show_debug_message(rndmTextArray[0]);
show_debug_message(rndmTextArray[1]);