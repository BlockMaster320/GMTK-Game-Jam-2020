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

spawnSpd = 90	//100 - default, <100 - rychlejší spawn

randomize()
tilemap = layer_tilemap_get_id("tlWalls")

ini_open("save.ini")
global.highscore = ini_read_real("Save","Highscore",0)
global.prevScore = ini_read_real("Save","Score",0)
ini_close()
global.currentScore = 0
scoreMultiplier = .0005

upgradeAvailable = true
centerSpawnPointX = 0
centerSpawnPointY = 0

#region Shader
surfPing = -1
surfPong = -1

u_blurSteps = shader_get_uniform(shBlur,"blurSteps")
u_sigma = shader_get_uniform(shBlur,"sigma")
u_texelSize = shader_get_uniform(shBlur,"texelSize")
u_blurVector = shader_get_uniform(shBlur,"blurVector")

guiW_ = display_get_gui_width()
guiH_ = display_get_gui_height()
texelW = 1 / guiW_
texelH = 1 / guiH_

blurSteps = 3
sigma = .5

surfScale = 1
PFsurfScale = surfScale

texFilter = true

//bloom
u_bloomThresholdTop = shader_get_uniform(shBloomPass,"bloomThresholdTop")
u_bloomRange = shader_get_uniform(shBloomPass,"bloomRange")

bloomThresholdTop = .5
bloomRange = .1
#endregion

soundtrack = audio_play_sound(choose(sndMenuSndtrck,sndSndtrck2),0,0)