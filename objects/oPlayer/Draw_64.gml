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
