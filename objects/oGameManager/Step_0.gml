if (random(100) < sniperSpawn)
{
	spawnOff = 300
	var tower = SpawnTower()
	tower.towerType = towerTypes.sniper
}

if (random(100) < circularSpawn)
{
	spawnOff = 50
	var tower = SpawnTower()
	tower.towerType = towerTypes.circular
}

if (random(100) < spiralSpawn)
{
	var tower = SpawnTower()
	tower.towerType = towerTypes.spiral
}