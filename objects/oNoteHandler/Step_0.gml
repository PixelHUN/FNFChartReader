var mustPress = false;
var isSusNote = false;

with(oNote)
{
	daSong = oNoteHandler.daSong;
	if(mustPress)
		y = (oNoteHandler._disy - 0.45 * (oConductor.songPosition - strumTime) * daSong.speed);
	else
		y = (oNoteHandler._disy - 0.45 * (oConductor.songPosition - strumTime) * daSong.speed);

	if(isSusNote)
		y -= s_width / 2;
}