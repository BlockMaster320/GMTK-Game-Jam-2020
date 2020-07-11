//Draw The Keyboard
var originX = display_get_gui_width() / 2 - 400;
var originY = display_get_gui_height() - 250;
var _drawX = originX;
var _drawY = originY;

var _keySize = 3;
var _viewToGuiRatio = display_get_gui_width() / camera_get_view_width(view_camera[0]);
var _keySpace = sprite_get_width(sKeyboard) * _keySize * _viewToGuiRatio / 4;

for (var _i = 0; _i < array_length_1d(keyArray); _i ++)
{
	var _keyInfo = keyArray[_i];
	
	_drawX += _keySpace;
	if (_i == 10)
	{
		_drawX = originX + 100;
		_drawY += _keySpace;
	}
	if (_i == 19)
	{
		_drawX = originX + 100;
		_drawY += _keySpace;
	}
	
	if (_keyInfo[1])
	{
		draw_sprite_ext(sKeyboard, 0, _drawX, _drawY, 4, 4, 0, c_white, 1);
		draw_sprite_ext(sKeyboard, _i + 1, _drawX, _drawY, 4, 4, 0, c_black, 0.75);
	}
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
