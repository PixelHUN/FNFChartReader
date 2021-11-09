if(botplay)
{
	if(oInputHandler.left_hold)
		keyboard_key_release(oInputHandler.left);
	else if(oInputHandler.down_hold)
		keyboard_key_release(oInputHandler.down);
	else if(oInputHandler.up_hold)
		keyboard_key_release(oInputHandler.up);
	else if(oInputHandler.right_hold)
		keyboard_key_release(oInputHandler.right);
}

key_left = keyboard_check_pressed(left);
key_down = keyboard_check_pressed(down);
key_up = keyboard_check_pressed(up);
key_right = keyboard_check_pressed(right);

left_hold = keyboard_check(left);
down_hold = keyboard_check(down);
up_hold = keyboard_check(up);
right_hold = keyboard_check(right);
