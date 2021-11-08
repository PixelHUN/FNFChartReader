volume += 0.1;
if(volume > 1)
	volume = 1;
	
audio_master_gain(volume);