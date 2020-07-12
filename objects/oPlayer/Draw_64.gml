//Set Draw Properties
draw_set_font(fntGamer);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Set Keyboard Draw Variables
var originX = display_get_gui_width() / 2 - gdva(325, 0);
var originY = display_get_gui_height() - gdva(175, 1);
var _drawX = originX;
var _drawY = originY;

var _keySize = 3;
var _keySpace = sprite_get_width(sKeyboard) * _keySize / 1.4;

//Draw Keyboard Background
draw_set_alpha(0.5);
draw_rectangle_colour(originX - gdva(25, 0), originY - gdva(75, 1), originX + gdva(10 * _keySpace + 75, 0), originY + gdva(3 * _keySpace, 1), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

//Draw the Keys
for (var _i = 0; _i < array_length_1d(keyArray); _i ++)
{
	//Get Key Info
	var _keyInfo = keyArray[_i];
	
	//Set Key Draw Position
	_drawX += gdva(_keySpace, 0);
	if (_i == 10)
	{
		_drawX = originX + gdva(60, 0);
		_drawY += gdva(_keySpace, 1);
	}
	if (_i == 19)
	{
		_drawX = originX + gdva(85, 0);
		_drawY += gdva(_keySpace, 1);
	}
	
	//Draw the Key
	if (_keyInfo[1])
	{
		var _abilityKey = false;
		for (var _c = 0; _c < ds_list_size(ability1); _c ++)
		{
			var _abilityKeyInfo = ability1[| _c];
			show_debug_message("1: " + _keyInfo[0])
			show_debug_message("2: " + _abilityKeyInfo[0])
			if (_keyInfo[0] == _abilityKeyInfo[0])
				_abilityKey = true;
		}
		for (var _c = 0; _c < ds_list_size(ability2); _c ++)
		{
			var _abilityKeyInfo = ability2[| _c];
			show_debug_message("1: " + _keyInfo[0])
			show_debug_message("2: " + _abilityKeyInfo[0])
			if (_keyInfo[0] == _abilityKeyInfo[0])
				_abilityKey = true;
		}
		
		if (_keyInfo[0] = keyRight[0] || _keyInfo[0] = keyLeft[0] || _keyInfo[0] = keyUp[0] || _keyInfo[0] = keyDown[0] || _abilityKey)
		{
			draw_sprite_ext(sKeyboard, 1, _drawX, _drawY - gdva(50, 1) * keyboardVisibility, gdva(_keySize, 0), gdva(_keySize, 1), 0, c_white, keyboardVisibility);
			draw_sprite_ext(sKeyboard, _i + 2, _drawX, _drawY - gdva(50, 1) * keyboardVisibility, gdva(_keySize, 0), gdva(_keySize, 1), 0, c_dkgray, keyboardVisibility);
		}
		else
		{
			draw_sprite_ext(sKeyboard, 0, _drawX, _drawY - gdva(50, 1) * keyboardVisibility, gdva(_keySize, 0), gdva(_keySize, 1), 0, c_white, keyboardVisibility);
			draw_sprite_ext(sKeyboard, _i + 2, _drawX, _drawY - gdva(50, 1) * keyboardVisibility, gdva(_keySize, 0), gdva(_keySize, 1), 0, c_dkgray, keyboardVisibility);
		}
	}
	else
	{
		draw_sprite_ext(sKeyboard, 0, _drawX, _drawY + gdva(10, 1) - gdva(50, 1) * keyboardVisibility, gdva(_keySize, 0), gdva(_keySize, 1), 0, c_dkgray, keyboardVisibility);
		draw_sprite_ext(sKeyboard, _i + 2, _drawX, _drawY + gdva(10, 1) - gdva(50, 1) * keyboardVisibility, gdva(_keySize, 0), gdva(_keySize, 1), 0, c_black, keyboardVisibility);
	}
	
	//Make the Keyboard Better Visible on Hit
	if (global.pause && keyboardVisibility < 1)
		keyboardVisibility += 0.0035
	if (!global.pause && keyboardVisibility > 0.5)
		keyboardVisibility -= 0.0035;
	keyboardVisibility = clamp(keyboardVisibility, 0.5, 1);
}

//Drawa a Key Switching Text
draw_set_font(fntGamer);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (global.pause)
{
	if (keyChange)
	{
		switch (lastKeyInput)
		{
			case 0:
				var _inputToReplace = "RIGHT MOVEMENT!";
			break;
			case 1:
				var _inputToReplace = "LEFT MOVEMENT!";
			break;
			case 2:
				var _inputToReplace = "UP MOVEMENT!";
			break;
			case 3:
				var _inputToReplace = "DOWN MOVEMENT!";
			break;
		}
	
		var _viewToGuiWidthRation = display_get_gui_width() / camera_get_view_width(view_camera[0]);
		var _viewToGuiHeightRation = display_get_gui_height() / camera_get_view_height(view_camera[0]);
		draw_text_transformed_colour((x - camera_get_view_x(view_camera[0])) * _viewToGuiWidthRation + sprite_width / 2 + gdva(30, 0), (y - camera_get_view_y(view_camera[0])) * _viewToGuiHeightRation - gdva(70, 1), "SELECT NEW KEY FOR", gdva(3, 0), gdva(3, 1), 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_colour((x - camera_get_view_x(view_camera[0])) * _viewToGuiWidthRation + sprite_width / 2 + gdva(30, 0), (y - camera_get_view_y(view_camera[0])) * _viewToGuiHeightRation - gdva(42, 1), _inputToReplace, gdva(3, 0), gdva(3, 1), 0, c_red, c_red, c_red, c_red, 1);
	}
	
	if (addAbilityKey)
	{
		switch (abilityType)
		{
			case 0:
				var _abilityName = "BHUM";
			break;
			case 1:
				var _abilityName = "ASI NE?";
			break;
		}
	
		var _viewToGuiWidthRation = display_get_gui_width() / camera_get_view_width(view_camera[0]);
		var _viewToGuiHeightRation = display_get_gui_height() / camera_get_view_height(view_camera[0]);
		draw_text_transformed_colour((x - camera_get_view_x(view_camera[0])) * _viewToGuiWidthRation + sprite_width / 2 + gdva(30, 0), (y - camera_get_view_y(view_camera[0])) * _viewToGuiHeightRation - gdva(70, 1), "SELECT KEY FOR", gdva(3, 0), gdva(3, 1), 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_colour((x - camera_get_view_x(view_camera[0])) * _viewToGuiWidthRation + sprite_width / 2 + gdva(30, 0), (y - camera_get_view_y(view_camera[0])) * _viewToGuiHeightRation - gdva(42, 1), _abilityName, gdva(3, 0), gdva(3, 1), 0, c_red, c_red, c_red, c_red, 1);
	}
}
