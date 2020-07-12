if (keyboard_check_pressed(vk_enter) and !keyboard_check(vk_alt))
{
	switch (selected)
	{
		case SELECT.play: {room_goto_next(); break}
		case SELECT.exitGame: {game_end(); break}
	}
}