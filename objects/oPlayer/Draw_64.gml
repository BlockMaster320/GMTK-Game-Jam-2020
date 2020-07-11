//Draw The Keyboard
var xx = guiW*.5
var yy = guiH*.8
var _drawX = xx;
var _drawY = yy;
for (var _i = 0; _i < array_length_1d(keyArray); _i ++)
{
	var _keyInfo = keyArray[_i];
	
	_drawX += 15;
	if (_i == 10)
	{
		_drawX = xx + 20;
		_drawY += 20;
	}
	if (_i == 19)
	{
		_drawX = xx + 30;
		_drawY += 20;
	}
	draw_text_transformed_colour(_drawX, _drawY, _keyInfo[0], 1, 1, 0, c_white, c_white, c_white, c_white, 1 - 0.5 * (!_keyInfo[1]));
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
