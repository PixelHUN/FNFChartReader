animkey += 12/room_speed;

if(!danced)
{
	animkey = 0;
	danced = true;
}
if(animkey > 6 && animstate == "idle")
{
	animkey = 6;
}
if(oConductor.beatHit)
{
	danced = false;
}