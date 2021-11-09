songname = oPlay.songname;
difficulty = oPlay.difficulty;


var _file = file_text_open_read("assets/charts/"+songname+"/"+songname+difficulty+".json");
var _string = file_text_read_string(_file);
//_string = string_replace(_string, " ", "");

file_text_close(_file);

var _songJSON = json_parse(_string)

daSong = _songJSON.song;
daNotes = daSong.notes;

if(variable_struct_exists(_songJSON, "bpm"))
{
	oConductor.bpm = _songJSON.bpm;
	kadechart = false;
}
else
{
	oConductor.bpm = daSong.bpm;
	kadechart = true;
}
oConductor.songPosition -= oConductor.crochet*4;
with(oConductor) event_user(0);

//show_debug_message(daSong.song);

notehandler = instance_create_layer(0,0,"Instances",oNoteHandler);
notehandler.daSong = daSong;
notehandler.daNotes = daNotes;

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
		
		if(daNotes[i].sectionNotes[ii, 1] > 3)
		{
			_gottaHit = !_mustHit;
			daNotes[i].sectionNotes[ii, 1] -= 4;
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
		
		if(_gottaHit)
			daNote.x = display_get_gui_width()-16-(sprite_get_width(arrow_static)*0.7)*4;
		else
			daNote.x = 16;
		
		with(daNote) event_user(0);
		
		var _susLength = daNote.sustainLength;
		_susLength /= oConductor.stepCrochet;
		array_push(unspawnNotes, daNote);
		
		if(_susLength > 0)
		{
			for(var iii = floor(_susLength)+1; iii >= 0; iii--)
			{
				var _prevNote = undefined
				if(array_length(unspawnNotes) > 0)
					_prevNote = unspawnNotes[array_length(unspawnNotes)-1];
				else
					_prevNote = undefined;
				
				var susNote = instance_create_layer(0,0,"Notes",oNote);
				susNote.strumTime = daNotes[i].sectionNotes[ii, 0] + (oConductor.stepCrochet * iii) + oConductor.stepCrochet;
				susNote.noteData = _prevNote.noteData; //daNotes[i].sectionNotes[ii, 1];
				susNote.prevNote = _prevNote;
				susNote.mustPress = _gottaHit;
				susNote.isSusNote = true;
				susNote.susActive = true;
			
				if(_gottaHit)
					susNote.x = display_get_gui_width()-16-(sprite_get_width(arrow_static)*0.7)*4;
				else
					susNote.x = 16;
			
				with(susNote) event_user(0);
				array_push(unspawnNotes, susNote);
				//show_debug_message();
			}
		}
		//array_sort(unspawnNotes, sortbyshit);
	}
}
array_sort(unspawnNotes, sortbyshit);
for(var i = 0; i < array_length(unspawnNotes); i++)
	show_debug_message(unspawnNotes[i].strumTime);
	
_stage = instance_create_layer(0,0,"BG",oStage);
_stage.stage = "stage";
with(_stage) event_user(0);

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
_dad.character = daSong.player2;
if(daSong.player2 == "mom-car")
{
	_dad.character = "mom";
}
with(_dad) event_user(0);