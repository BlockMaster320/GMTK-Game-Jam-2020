//Set Tower Type Enum
enum towerTypes
{
	circular,
	spiral,
	sniper,
	rotazionSpielzeug,
	shotgun,
	length
}

//Set Time Global Variables
global.pause = false;
global.timeSpeed = 1;

sniperSpawn = .04
spiralSpawn = .08
circularSpawn = .02
rotazionSpawn = .06
shotgunSpawn = .005

spawnOffDef = 150
spawnOff = spawnOffDef
minOffDef = 20
minOff = minOffDef

spawnSpd = 130	//100 - default, <100 - rychlejší spawn

randomize()
tilemap = layer_tilemap_get_id("tlWalls")

ini_open("save.ini")
global.highscore = ini_read_real("Save","Highscore",0)
ini_close()
global.currentScore = 0
scoreMultiplier = .0005

upgradeAvailable = true
centerSpawnPointX = 0
centerSpawnPointY = 0