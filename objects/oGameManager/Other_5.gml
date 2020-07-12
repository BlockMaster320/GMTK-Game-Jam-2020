ini_open("save.ini")
ini_write_real("Save","Highscore",round(global.highscore))
ini_write_real("Save","Score",round(global.prevScore))
ini_close()