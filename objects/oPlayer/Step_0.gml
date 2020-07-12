#region Input
if (keyboard_check_pressed(vk_backspace)) game_restart()
if (keyboard_check_pressed(vk_escape)) room_goto(rMenu)

mDir = point_direction(x,y,mouse_x,mouse_y)

up = false
down = false 
left = false
right = false
	
if (!global.pause)
{
	if (keyboard_check(ord(keyRight[0]))) {right = true; lastKeyInfo = keyRight; lastKeyInput = 0}
	if (keyboard_check(ord(keyLeft[0]))) {left = true; lastKeyInfo = keyLeft; lastKeyInput = 1}
	if (keyboard_check(ord(keyUp[0]))) {up = true; lastKeyInfo = keyUp; lastKeyInput = 2}
	if (keyboard_check(ord(keyDown[0]))) {down = true; lastKeyInfo = keyDown; lastKeyInput = 3}
}
#endregion

//Check For Casting an Ability Input
if (!global.pause)
{
	for (var _j = 0; _j < ds_list_size(ability1); _j ++)
	{
		var _keyInfo = ability1[| _j];
		if (keyboard_check_pressed(ord(_keyInfo[0])))
		{
			ability1Cast = true;
			_keyInfo[1] = false;
			keyArray[_keyInfo[2]] = _keyInfo;
			ds_list_delete(ability1, _j);
		}
	}
	
	for (var _k = 0; _k < ds_list_size(ability2); _k ++)
	{
		var _keyInfo = ability2[| _k];
		if (keyboard_check_pressed(ord(_keyInfo[0])))
		{
			ability2Cast = true;
			_keyInfo[1] = false;
			keyArray[_keyInfo[2]] = _keyInfo;
			ds_list_delete(ability2, _k);
		}
	}
	
	for (var _k = 0; _k < ds_list_size(ability3); _k ++)
	{
		var _keyInfo = ability3[| _k];
		if (keyboard_check_pressed(ord(_keyInfo[0])))
		{
			ability3Cast = true;
			_keyInfo[1] = false;
			keyArray[_keyInfo[2]] = _keyInfo;
			ds_list_delete(ability3, _k);
		}
	}
}

#region Collision
moveDir = point_direction(0,0,right - left,down - up)
var moving = (right - left != 0) or (down - up != 0)
hsp = round(lengthdir_x(spd * moving,moveDir))
vsp = round(lengthdir_y(spd * moving,moveDir))

var dir = point_direction(x,y,x+hsp,y+vsp) - 180
part_type_direction(dronePart,dir-100,dir+100,random_range(-5,5),5)
if (current_time % 2 and moving) part_particles_create(dronePart,x+TL_SIZE/2,y+TL_SIZE/2,dronePartSys,1)

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

//Set Animation Sprite && Image Index
if (hsp == 0 && vsp == 0)
	sprite_index = sPlayerIdle;
else
	sprite_index = sPlayerMove;

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

//if (keyboard_check_pressed(vk_enter)) hit = true

if (hit)
{
	keyChange = true;
	hit = false
}
#endregion

#region Keyboard
//KEYBOARD INPUT CONTROL//
//Check For Running Out Of Keys
var _activeKeysCount = 0;
for (var _o = 0; _o < array_length_1d(keyArray); _o ++)
{
	var _keyInfo = keyArray[_o];
	_activeKeysCount += _keyInfo[1];
}
if (_activeKeysCount <= 4 + ds_list_size(ability1) + ds_list_size(ability2) + ds_list_size(ability3))
{
	keyChange = false;
	addAbilityKey = false;
	global.gameEnd = true;
}

//Change an Input Key on Player Hit || Add new Ability Input Key
if (keyChange || addAbilityKey)
{
	//Get the Last Pressed Key
	var _newKey = string_upper(keyboard_lastchar);
	
	//Make Sure That the Key Isn't Already Taken by Ability Key
	var _abilityKey = false;
	for (var _c = 0; _c < ds_list_size(ability1); _c ++)
	{
		var _abilityKeyInfo = ability1[| _c];
		if (_newKey == _abilityKeyInfo[0])
			_abilityKey = true;
	}
	for (var _c = 0; _c < ds_list_size(ability2); _c ++)
	{
		var _abilityKeyInfo = ability2[| _c];
		if (_newKey == _abilityKeyInfo[0])
			_abilityKey = true;
	}
	for (var _c = 0; _c < ds_list_size(ability3); _c ++)
	{
		var _abilityKeyInfo = ability3[| _c];
		if (_newKey == _abilityKeyInfo[0])
			_abilityKey = true;
	}
	
	//Make Sure That the Key Isn't Already Taken by Movent Key
	if (_newKey != keyRight[0] && _newKey != keyLeft[0] && _newKey != keyUp[0] && _newKey != keyDown[0] && !_abilityKey)
	{	
		//Go Trough the Key Array, Find a Match With the Pressed Key && Change It
		var _activeKeysCount = 0;
		for (var _i = 0; _i < array_length_1d(keyArray); _i ++)
		{
			var _keyInfo = keyArray[_i];
			_activeKeysCount += _keyInfo[1];
			if (_keyInfo[0] == _newKey && _keyInfo[1] == true)
			{
				//Change Key For Movement
				if (keyChange)
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
					}
			
					global.pause = false;
					keyChange = false;
					break;
				}
				
				//Add Key For Ability
				if (addAbilityKey)
				{
					switch (abilityType)
					{
						case 0:
							ds_list_add(ability1, _keyInfo);
						break;
						case 1:
							ds_list_add(ability2, _keyInfo);
						break;
						case 2:
							ds_list_add(ability3, _keyInfo);
						break;
						
					}
					
					global.pause = false;
					addAbilityKey = false;
					break;
				}
			}
		}
		show_debug_message(_activeKeysCount);
		show_debug_message(4 + ds_list_size(ability1) + ds_list_size(ability2) + ds_list_size(ability3));
	}
}

//Cast an Ability
if (ability1Cast)
{
	var _newAbility = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Instances", oAbility);
	_newAbility.abilityType = 0;
	
	global.screenShake = 10
	ability1Cast = false;
	audio_play_sound(sndBlank,0,0)
}

if (ability2Cast)
{
	if (instance_exists(oTower))
	{
		var _nearestTower = instance_nearest(x + sprite_width / 2, y + sprite_height / 2, oTower);
		var _newBullet = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Instances", oThiccBullet);
		_newBullet.direction = point_direction(x, y, _nearestTower.x, _nearestTower .y);
		_newBullet.image_angle = _newBullet.direction;
		_newBullet.towerPosition = [_nearestTower.x, _nearestTower.y];
	
		global.screenShake = 10
		audio_play_sound(sndTowerDestroy,0,0)
		ability2Cast = false;
	}
}
if (ability3Cast)
{
	var slowMoAbility = instance_create_layer(0,0,"Instances",oSlowMotionAbility)
	slowMoAbility.slowMoSound = audio_play_sound(sndSlowMo,0,1)
	ability3Cast = false
}
/*
show_debug_message("last key: " + string(lastKeyInput));
show_debug_message("keyChange: " + string(keyChange));
show_debug_message("\nright: " + keyRight[0]);
show_debug_message("left: " + keyLeft[0]);
show_debug_message("up: " + keyUp[0]);
show_debug_message("down: " + keyDown[0]);*/
/*show_debug_message(keyAbility1);
show_debug_message(keyAbility2);
show_debug_message(keyAbility3);*/

/*if (keyboard_check_pressed(vk_enter))
{
	global.pause = true;
	keyChange = true;
}*/
#endregion

//Slow || Speed Up Time
if (global.pause)
{
	if (global.timeSpeed > 0.05)
		global.timeSpeed -= 0.02;
}
else
{
	if (global.timeSpeed < 1)
		global.timeSpeed += 0.02;
}
global.timeSpeed = clamp(global.timeSpeed, 0.05, 1);
/*show_debug_message("timeSpeed: " + string(global.timeSpeed));*/

//Change Sprite Animation Speed
image_speed = global.timeSpeed;

//Trigger KeyChange on Collision With Bullet
if (place_meeting(x, y, oBullet))
{
	audio_play_sound(sndHit,0,0)
	
	global.pause = true;
	keyChange = true;
	
	global.screenShake += 10
	
	var _bulletCollider = instance_place(x, y, oBullet);
	instance_destroy(_bulletCollider);
	
	var _newAbility = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Instances", oAbility);
	_newAbility.abilityType = 0;
}

if (place_meeting(x,y,oUpgrade))
{
	audio_play_sound(sndUpgrade,0,0)
	global.pause = true;
	addAbilityKey = true;
	abilityType = 0;
	
	abilityType = irandom_range(0,2)
	addAbilityKey = true
	
	with(oGameManager)
	{
		oGameManager.upgradeAvailable = true
		oGameManager.scoreMultiplier *= 2
	}
}

//Destroy Tower on Collision With Player
if (place_meeting(x, y, oTower))
{
	oGameManager.scoreMultiplier *= 1.2
	var _towerCollider = instance_place(x, y, oTower)
	instance_destroy(_towerCollider);
	audio_play_sound(sndSpawn,0,0)
}
