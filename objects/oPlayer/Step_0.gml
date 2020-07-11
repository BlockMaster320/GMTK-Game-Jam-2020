#region Input
if (keyboard_check_pressed(vk_backspace)) game_restart()
if (keyboard_check_pressed(vk_escape)) game_end()

mDir = point_direction(x,y,mouse_x,mouse_y)

if (!global.pause)
{
	up = false
	down = false 
	left = false
	right = false
	if (keyboard_check(ord(keyRight[0]))) {right = true; lastKeyInfo = keyRight; lastKeyInput = 0}
	if (keyboard_check(ord(keyLeft[0]))) {left = true; lastKeyInfo = keyLeft; lastKeyInput = 1}
	if (keyboard_check(ord(keyUp[0]))) {up = true; lastKeyInfo = keyUp; lastKeyInput = 2}
	if (keyboard_check(ord(keyDown[0]))) {down = true; lastKeyInfo = keyDown; lastKeyInput = 3}
	if (keyboard_check(ord(keyAbility1[0]))) {ability1 = true; lastKey = keyAbility1; lastKeyInput = 4}
	if (keyboard_check(ord(keyAbility2[0]))) {ability2 = true; lastKey = keyAbility2; lastKeyInput = 5}
	if (keyboard_check(ord(keyAbility3[0]))) {ability3 = true; lastKey = keyAbility3; lastKeyInput = 6}
}
#endregion

#region Collision
moveDir = point_direction(0,0,right - left,down - up)
var moving = (right - left != 0) or (down - up != 0)
hsp = round(lengthdir_x(spd * moving * global.timeSpeed ,moveDir))
vsp = round(lengthdir_y(spd * moving * global.timeSpeed,moveDir))

var bboxSide
if (hsp > 0) bboxSide = bbox_right; else bboxSide = bbox_left
if (tilemap_get_at_pixel(tilemap,bboxSide + hsp,bbox_top) != 0 or
	tilemap_get_at_pixel(tilemap,bboxSide + hsp,bbox_bottom) != 0)
{
	if (hsp > 0) x = x - (bbox_right % TL_SIZE) + TL_SIZE - 1
	else x = x - (bbox_left % TL_SIZE)
	hsp = 0
}
x += hsp

if (vsp > 0) bboxSide = bbox_bottom; else bboxSide = bbox_top
if (tilemap_get_at_pixel(tilemap,bbox_left,bboxSide + vsp) != 0 or
	tilemap_get_at_pixel(tilemap,bbox_right,bboxSide + vsp) != 0)
{
	if (vsp > 0) y = y - (bbox_bottom % TL_SIZE) + TL_SIZE - 1
	else y = y - (bbox_top % TL_SIZE)
	vsp = 0
}
y += vsp
#endregion

//Set Animation Sprite
if (hsp > 0)
{
	if (vsp > 0)
		playerAnimationIndex = 2;
	else if (vsp < 0)
		playerAnimationIndex = 14;
	else
		playerAnimationIndex = 0;
}
else if (hsp < 0)
{
	if (vsp > 0)
		playerAnimationIndex = 6;
	else if (vsp < 0)
		playerAnimationIndex = 10;
	else
		playerAnimationIndex = 8;
}
else if (vsp > 0)
	playerAnimationIndex = 4;
else if (vsp < 0)
	playerAnimationIndex = 12;

image_index = playerAnimationIndex + round(playerAnimationFlipper);
playerAnimationFlipper += image_speed * 0.1;
if (playerAnimationFlipper >= 1)
	playerAnimationFlipper = 0;

#region Hit
if (keyboard_check_pressed(vk_enter)) hit = true

if (hit)
{
	keyChange = true;
	hit = false
}
#endregion

#region Keyboard
//KEYBOARD INPUT CONTROL//
//Change an Input Key on Player Hit
if (keyChange)
{
	//Get the Last Pressed Key
	var _newKey = string_upper(keyboard_lastchar);
	
	//Make Sure That the Key Isn't Already Taken
	if (_newKey != keyRight[0] && _newKey != keyLeft[0] && _newKey != keyUp[0] && _newKey != keyDown[0] &&
		_newKey != keyAbility1[0] && _newKey != keyAbility2[0] && _newKey != keyAbility3[0])
	{	
		//Go Trough the Key Array, Find a Match With the Pressed Key && Change It
		for (var _i = 0; _i < array_length_1d(keyArray); _i ++)
		{
			var _keyInfo = keyArray[_i];
			if (_keyInfo[0] == _newKey && _keyInfo[1] == true)
			{
				lastKeyInfo[1] = false;
				keyArray[lastKeyInfo[2]] = lastKeyInfo;
			
				switch (lastKeyInput)
				{
					case 0:
						keyRight = _keyInfo;
					break;
					case 1:
						keyLeft = _keyInfo;
					break;
					case 2:
						keyUp = _keyInfo;
					break;
					case 3:
						keyDown = _keyInfo;
						break;
					case 4:
						keyAbility1 = _keyInfo;
					break;
					case 5:
						keyAbility2 = _keyInfo;
					break;
					case 6:
						keyAbility3 = _keyInfo;
					break;
				}
			
				global.pause = false;
				keyChange = false;
				break;
			}
		}
	}
}

show_debug_message("last key: " + string(lastKeyInput));
show_debug_message("keyChange: " + string(keyChange));
show_debug_message("\nright: " + keyRight[0]);
show_debug_message("left: " + keyLeft[0]);
show_debug_message("up: " + keyUp[0]);
show_debug_message("down: " + keyDown[0]);
/*show_debug_message(keyAbility1);
show_debug_message(keyAbility2);
show_debug_message(keyAbility3);*/

if (keyboard_check_pressed(vk_enter))
{
	global.pause = true;
	keyChange = true;
}
#endregion

//Slow || Speed Up Time
if (global.pause)
{
	if (global.timeSpeed > 0.05)
		global.timeSpeed -= 0.025;
}
else
{
	if (global.timeSpeed < 1)
		global.timeSpeed += 0.025;
}
global.timeSpeed = clamp(global.timeSpeed, 0.05, 1);
show_debug_message("timeSpeed: " + string(global.timeSpeed));

//Change Sprite Animation Speed
image_speed = global.timeSpeed;

//Trigger KeyChange on Collision With Bullet
if (place_meeting(x, y, oBullet))
{
	global.pause = true;
	keyChange = true;
	
	var _bulletCollider = instance_place(x, y, oBullet);
	instance_destroy(_bulletCollider);
}
