if(!instance_exists(oTransition))
{
	selection--;

	if(selection < 0)
		selection = array_length(freeplaysonglist)-1;
}