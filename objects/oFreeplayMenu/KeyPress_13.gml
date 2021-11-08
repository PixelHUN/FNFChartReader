oPlay.songname = freeplaysonglist[selection];

switch(oPlay.songname)
{
	case "satin panties":
		oPlay.songname = "satin-panties";
		break;
}

oPlay.difficulty = dif;
audio_stop_all();

room_goto(Room1);