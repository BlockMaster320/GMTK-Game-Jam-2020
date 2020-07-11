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
ini_close()