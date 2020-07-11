if (keyboard_check_pressed(vk_enter))
{
	switch (selected)
	{
		case SELECT.play: {room_goto_next(); exit}
		case SELECT.exitGame: {game_end(); exit}
	}
}