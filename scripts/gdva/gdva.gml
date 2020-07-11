//GUI Draw Value Adjustment
/// @description gdva(value, axis)
/// @param value
/// @param axis

var _value = argument0;
var _axis = argument1;

var _originalGuiWidth = 1536;
var _originalGuiHeight = 864;
var _targetGuiWidth = display_get_gui_width();
var _targetGuiHeight = display_get_gui_height();

if (_axis == 0)
	return _value * (_targetGuiWidth / _originalGuiWidth);
if (_axis == 1)
	return _value * (_targetGuiHeight / _originalGuiHeight);
