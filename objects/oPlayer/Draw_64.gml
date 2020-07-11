//Set Keyboard Draw Variables
var originX = display_get_gui_width() / 2 - gdva(325, 0);
var originY = display_get_gui_height() - gdva(175, 1);
var _drawX = originX;
var _drawY = originY;

var _keySize = 3;
var _keySpace = sprite_get_width(sKeyboard) * _keySize / 1.4;

//Draw Keyboard Background
draw_set_alpha(0.5);
draw_rectangle_colour(originX - 25, originY - 75, originX + 10 * _keySpace + 75, originY + 3 * _keySpace, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

//Draw the Keys
for (var _i = 0; _i < array_length_1d(keyArray); _i ++)
{
	//Get Key Info
	var _keyInfo = keyArray[_i];
	
	//Set Key Draw Position
	_drawX += _keySpace;
	if (_i == 10)
	{
		_drawX = originX + 60;
		_drawY += _keySpace;
	}
	if (_i == 19)
	{
		_drawX = originX + 85;
		_drawY += _keySpace;
	}
	
	//Draw the Key
	if (_keyInfo[1])
	{
		if (_keyInfo[0] = keyRight[0] || _keyInfo[0] = keyLeft[0] || _keyInfo[0] = keyUp[0] || _keyInfo[0] = keyDown[0] ||
			_keyInfo[0] = keyAbility1[0] || _keyInfo[0] = keyAbility2[0] || _keyInfo[0] = keyAbility3[0])
		{
			draw_sprite_ext(sKeyboard, 1, _drawX, _drawY - 50 * keyboardVisibility, _keySize, _keySize, 0, c_white, keyboardVisibility);
			draw_sprite_ext(sKeyboard, _i + 2, _drawX, _drawY - 50 * keyboardVisibility, _keySize, _keySize, 0, c_dkgray, keyboardVisibility);
		}
		else
		{
			draw_sprite_ext(sKeyboard, 0, _drawX, _drawY - 50 * keyboardVisibility, _keySize, _keySize, 0, c_white, keyboardVisibility);
			draw_sprite_ext(sKeyboard, _i + 2, _drawX, _drawY - 50 * keyboardVisibility, _keySize, _keySize, 0, c_dkgray, keyboardVisibility);
		}
	}
	else
	{
		draw_sprite_ext(sKeyboard, 0, _drawX, _drawY + 10 - 50 * keyboardVisibility, _keySize, _keySize, 0, c_dkgray, keyboardVisibility);
		draw_sprite_ext(sKeyboard, _i + 2, _drawX, _drawY + 10 - 50 * keyboardVisibility, _keySize, _keySize, 0, c_black, keyboardVisibility);
	}
	
	//Make the Keyboard Better Visible on Hit
	if (global.pause && keyboardVisibility < 1)
		keyboardVisibility += 0.0035
	if (!global.pause && keyboardVisibility > 0.5)
		keyboardVisibility -= 0.0035;
	keyboardVisibility = clamp(keyboardVisibility, 0.5, 1);
	
	show_debug_message(keyboardVisibility);
}

//Drawa a Key Switching Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (global.pause)
{
	var _viewToGuiWidthRation = display_get_gui_width() / camera_get_view_width(view_camera[0]);
	var _viewToGuiHeightRation = display_get_gui_height() / camera_get_view_height(view_camera[0]);
	draw_text_transformed_colour((x - camera_get_view_x(view_camera[0])) * _viewToGuiWidthRation + sprite_width / 2 + 30, (y - camera_get_view_y(view_camera[0])) * _viewToGuiHeightRation - 35, "SELECT NEW KEY!", 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
}
