//read song name and difficulty
songname = oPlay.songname;
difficulty = oPlay.difficulty;

//read chart into string
var _file = file_text_open_read("assets/charts/"+songname+"/"+songname+difficulty+".json");
var _string = file_text_read_string(_file);
//_string = string_replace(_string, " ", "");

file_text_close(_file);

//parse through chart json
var _songJSON = json_parse(_string)

//shortcuts for readability
daSong = _songJSON.song;
daNotes = daSong.notes;

if(variable_struct_exists(_songJSON, "bpm")) //check if chart is from original game or from kade engine
{
	//only really bpm location changes (or at least thats what matters)
	oConductor.bpm = _songJSON.bpm;
	kadechart = false;
}
else
{
	//lmao kade is different
	oConductor.bpm = daSong.bpm;
	kadechart = true;
}

sevenkeys = false;
notescale = 0.7;
if(variable_struct_exists(daSong, "mania")) //oh shit more keys than 4
{
	switch(daSong.mania)
	{
		case 0:
			notescale = 0.7;
			sevenkeys = false;
			break;
		case 1:
			notescale = 0.55;
			sevenkeys = true;
			break;
		case 2:
			notescale = 0.55;
			sevenkeys = true;
			break;
	}
}

//song position should be 4x a beat, so we can countdown
oConductor.songPosition -= oConductor.crochet*4;
with(oConductor) event_user(0);

//show_debug_message(daSong.song);

//iniciate a note handler
notehandler = instance_create_layer(0,0,"Instances",oNoteHandler);
notehandler.daSong = daSong;
notehandler.daNotes = daNotes;

//spawning in the chart
unspawnNotes = array_create(0);

sortbyshit = function(_a, _b)
{
	return _a.strumTime - _b.strumTime;
}

for(var i = 0; i < array_length(daNotes); i++)
{
	for(var ii = 0; ii < array_length(daNotes[i].sectionNotes); ii++)
	{
		var _mustHit = daNotes[i].mustHitSection;
		show_debug_message(_mustHit);
		
		var _gottaHit = _mustHit;
		
		if(!sevenkeys)
		{
			if(daNotes[i].sectionNotes[ii, 1] > 3)
			{
				_gottaHit = !_mustHit;
				daNotes[i].sectionNotes[ii, 1] -= 4;
			}
		}
		else
		{
			if(daNotes[i].sectionNotes[ii, 1] > 6)
			{
				_gottaHit = !_mustHit;
				daNotes[i].sectionNotes[ii, 1] -= 7;
			}
		}
		
		var _prevNote = undefined
		if(array_length(unspawnNotes) > 0)
			_prevNote = unspawnNotes[array_length(unspawnNotes)-1];
		
		var daNote = instance_create_layer(0,0,"Notes",oNote);
		daNote.strumTime = daNotes[i].sectionNotes[ii, 0];
		daNote.noteData = daNotes[i].sectionNotes[ii, 1];
		daNote.sustainLength = daNotes[i].sectionNotes[ii, 2];
		//show_debug_message(daNotes[i]);
		daNote.mustPress = _gottaHit;
		daNote.prevNote = _prevNote;
		
		//positioning based on must hit
		if(!sevenkeys)
		{
			if(_gottaHit)
				daNote.x = display_get_gui_width()-16-(sprite_get_width(arrow_static)*oChartReader.notescale)*4;
			else
				daNote.x = 16;
		}
		else
		{
			if(_gottaHit)
				daNote.x = display_get_gui_width()-16-(sprite_get_width(arrow_static)*oChartReader.notescale)*7;
			else
				daNote.x = 16;
		}
		
		with(daNote) event_user(0);
		
		//sustain notes (i hated programming this even tho i pretty much copied it from the original source code however it didn't want to work >:O)
		var _daStrumTime = daNote.strumTime;
		var _susLength = daNote.sustainLength;
		_susLength = _susLength / oConductor.stepCrochet;
		array_push(unspawnNotes, daNote);
		
		if(_susLength > 0)
		{
			for(var iii = floor(_susLength); iii >= 0; iii--)
			{
				var _prevNote = undefined
				if(array_length(unspawnNotes) > 0)
					_prevNote = unspawnNotes[array_length(unspawnNotes)-1];
				else
					_prevNote = undefined;
				
				var susNote = instance_create_layer(0,0,"Notes",oNote);
				susNote.strumTime = _daStrumTime + (oConductor.stepCrochet * iii) + oConductor.stepCrochet;
				susNote.noteData = _prevNote.noteData; //daNotes[i].sectionNotes[ii, 1];
				susNote.prevNote = _prevNote;
				susNote.mustPress = _gottaHit;
				susNote.isSusNote = true;
				susNote.susActive = true;
				susNote.hpMiss = 0.05;
			
				if(sevenkeys)
				{
					if(_gottaHit)
						susNote.x = display_get_gui_width()-16-(sprite_get_width(arrow_static)*notescale)*7;
					else
						susNote.x = 16;
				}
				else
				{
					if(_gottaHit)
						susNote.x = display_get_gui_width()-16-(sprite_get_width(arrow_static)*notescale)*4;
					else
						susNote.x = 16;
				}
				
				with(susNote) event_user(0);
				array_push(unspawnNotes, susNote);
				//show_debug_message();
			}
		}
		//array_sort(unspawnNotes, sortbyshit);
	}
}
//sort array
array_sort(unspawnNotes, sortbyshit);
for(var i = 0; i < array_length(unspawnNotes); i++)
	show_debug_message(unspawnNotes[i].strumTime);


//create background
_stage = instance_create_layer(0,0,"BG",oStage);
_stage.stage = "stage";
with(_stage) event_user(0);

//create characters
_gf = instance_create_layer(480,150,"Instances",oCharacter);
_gf.character = "gf";
_gf.depth += 2;
_gf._x = _gf.x;
_gf._y = _gf.y;
with(_gf) event_user(0);
	
_bf = instance_create_layer(830,450,"Instances",oCharacter);
_bf._x = _bf.x;
_bf._y = _bf.y;
with(_bf) event_user(0);

_dad = instance_create_layer(140,100,"Instances",oCharacter);
_dad._x = _dad.x;
_dad._y = _dad.y;
//passing through the character to dad
_dad.character = daSong.player2;
if(daSong.player2 == "mom-car")
{
	_dad.character = "mom";
}
if(_dad.character == "gf")
{
	_dad.x = _gf.x;
	_dad.y = _gf.y;
	_dad._x = _gf.x;
	_dad._y = _gf.y;
	_dad.camoffsetx = 120;
}
with(_dad) event_user(0);