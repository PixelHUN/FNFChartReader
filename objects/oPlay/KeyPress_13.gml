if(instance_exists(oConductor) && oConductor.songPosition > oConductor.stepCrochet)
{
	_paused = !_paused;
}

if(_paused)
{
	audio_pause_sound(oConductor.musinst);
	audio_pause_sound(oConductor.musvoice);
}
else
{
	audio_resume_all();
}