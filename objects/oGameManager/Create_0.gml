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

sniperSpawn = .01
spiralSpawn = .03
circularSpawn = .05
rotazionSpawn = .1

spawnOff = 150
minOff = 40

randomize()
tilemap = layer_tilemap_get_id("tlWalls")