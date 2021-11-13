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
	else if(oInputHandler.s_hold)
		keyboard_key_release(oInputHandler.s);
	else if(oInputHandler.l_hold)
		keyboard_key_release(oInputHandler.l);
	else if(oInputHandler.space_hold)
		keyboard_key_release(vk_space);
}

key_left = keyboard_check_pressed(left);
key_down = keyboard_check_pressed(down);
key_up = keyboard_check_pressed(up);
key_right = keyboard_check_pressed(right);

left_hold = keyboard_check(left);
down_hold = keyboard_check(down);
up_hold = keyboard_check(up);
right_hold = keyboard_check(right);

key_s = keyboard_check_pressed(s);
key_l = keyboard_check_pressed(l);
key_space = keyboard_check_pressed(vk_space);

s_hold = keyboard_check(s);
l_hold = keyboard_check(l);
space_hold = keyboard_check(vk_space);