if(lastScore == oConductor.songScore)
{
	if(daNote != undefined)
		noteDiff = abs(-(daNote.strumTime - oConductor.songPosition));
	else
		noteDiff = oConductor.safeZoneOffset;

	if (noteDiff > oConductor.safeZoneOffset * 0.9)
	{
		daRating = "shit";
		_score = 50;
	}
	else if (noteDiff > oConductor.safeZoneOffset * 0.75)
	{
		daRating = "bad";
		_score = 100;
	}
	else if (noteDiff > oConductor.safeZoneOffset * 0.2)
	{
		daRating = "good";
		_score = 200;
	}

	oConductor.songScore += _score;
}

switch(daRating)
{
	case "sick":
		sprite = spr.sick;
		canShow = true;
		break;
	case "good":
		sprite = spr.good;
		canShow = true;
		break;
	case "bad":
		sprite = spr.bad;
		canShow = true;
		break;
	case "shit":
		sprite = spr.shit;
		canShow = true;
		break;
}