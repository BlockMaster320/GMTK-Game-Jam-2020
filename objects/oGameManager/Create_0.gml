//Set Tower Type Enum
enum towerTypes
{
	circular,
	spiral,
	sniper,
	rotazionSpielzeug
}

//Set Time Global Variables
global.pause = false;
global.timeSpeed = 1;

sniperSpawn = .03
spiralSpawn = .01
circularSpawn = .1
rotazionSpawn = .06

spawnOffDef = 150
spawnOff = spawnOffDef
minOffDef = 20
minOff = minOffDef

spawnSpd = 100	//100 - default, <100 - rychlejší spawn

randomize()
tilemap = layer_tilemap_get_id("tlWalls")

ini_open("save.ini")
global.highscore = ini_read_real("Save","Highscore",0)
ini_close()