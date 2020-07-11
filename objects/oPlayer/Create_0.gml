hsp = 0
vsp = 0
spd = 1
moveDir = 0
tilemap = layer_tilemap_get_id("tlWalls")
hit = false

//Set Image Index to 0
playerAnimationIndex = 0;
playerAnimationFlipper = 0;

//KEYBOARD INPUT CONTROL SETUP//
//Crate Keyboard Key Array
keyLetters = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P",	//9
			  "A", "S", "D", "F", "G", "H", "J", "K", "L", //18
			  "Z", "X", "C", "V", "B", "N", "M"];	//25
keyArray[array_length_1d(keyLetters) - 1] = 0;

for (var _i = 0; _i < array_length_1d(keyLetters); _i ++)
{
	var _keyLetter = keyLetters[_i];
	var _isActive = true;
	var _positionIndex = _i;
	
	var _keyInfo = [_keyLetter, _isActive, _positionIndex];
	keyArray[_i] = _keyInfo;
}

//Set Key Change Variables
lastKeyInfo = keyArray[14];
lastKeyInput = 0;	//0 - right; 1 - left; 2 - up; 3 - down; 4 - ability1; 5 - ability2; 6 - ability3;
keyboard_lastchar = lastKeyInfo[0];
keyChange = false;
keyboardVisibility = 0.5;

//Set Key Input Variables
keyRight = keyArray[14];
keyLeft = keyArray[12];
keyUp = keyArray[3];
keyDown = keyArray[13];
keyAbility1 = keyArray[17];
keyAbility2 = keyArray[8];
keyAbility3 = keyArray[9];

//Set Global Pause Variable
global.pause = false;
global.timeSpeed = 1;

do
{
	x = random_range(0, room_width);
	y = random_range(0, room_height);
	
	x -= x % TL_SIZE;
	y -= y % TL_SIZE;
}
until (!tilemap_get_at_pixel(tilemap, x, y));
