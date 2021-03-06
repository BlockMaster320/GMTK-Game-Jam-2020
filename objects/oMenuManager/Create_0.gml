#macro TL_SIZE 16
#macro guiW 384
#macro guiH 216

#macro viewW 384
#macro viewH 216

enum SELECT
{
	play,
	exitGame,
	length
}
selected = SELECT.play
menuWords = ["Play","Exit"]

ini_open("save.ini")
highscore = ini_read_real("Save","Highscore",0)
prevScore_ = ini_read_real("Save","Score",0)
ini_close()

display_set_gui_size(384,216)

towerTypesMenu = ["Sniper","Curved shots","Spiral","Circular","Shotgun","Upgrade"]
towerTypesSprites = [sEnemy2,sEnemy1,sEnemyBayblade,sEnemy3,sShotgun,sUpgrade]

buttonClick = false;

audio_stop_all()
audio_play_sound(sndMenuSndtrck,0,1)
PFselected = selected
