if (random(100) < sniperSpawn)
{
	spawnOff = 300
	minOff = 100
	var tower = SpawnTower()
	tower.towerType = towerTypes.sniper
}

if (random(100) < circularSpawn)
{
	spawnOff = 80
	minOff = 30
	var tower = SpawnTower()
	tower.towerType = towerTypes.circular
}

if (random(100) < spiralSpawn)
{
	spawnOff = 150
	minOff = 40
	var tower = SpawnTower()
	tower.towerType = towerTypes.spiral
}

if (random(100) < rotazionSpawn)
{
	spawnOff = 100
	minOff = 30
	var tower = SpawnTower()
	tower.towerType = towerTypes.rotazionSpielzeug
}
