if (random(spawnSpd) < sniperSpawn)
{
	spawnOff = 300
	minOff = 100
	var tower = SpawnTower()
	tower.towerType = towerTypes.sniper
}

if (random(spawnSpd) < circularSpawn)
{
	spawnOff = 80
	minOff = minOffDef
	var tower = SpawnTower()
	tower.towerType = towerTypes.circular
}

if (random(spawnSpd) < spiralSpawn)
{
	spawnOff = spawnOffDef
	minOff = minOffDef
	var tower = SpawnTower()
	tower.towerType = towerTypes.spiral
}

if (random(spawnSpd) < rotazionSpawn)
{
	spawnOff = 100
	minOff = minOffDef
	var tower = SpawnTower()
	tower.towerType = towerTypes.rotazionSpielzeug
}

spawnSpd = max(spawnSpd - 0.002,20)

global.currentScore += scoreMultiplier
global.highscore = max(global.highscore,global.currentScore)
