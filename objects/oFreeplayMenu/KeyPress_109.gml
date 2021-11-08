volume -= 0.1;
if(volume < 0)
	volume = 0;
	
audio_master_gain(volume);