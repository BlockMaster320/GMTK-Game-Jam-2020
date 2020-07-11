if (random(100) < sniperSpawn)
{
	var pX = oPlayer.x
	var pY = oPlayer.y
	do
	{
		var spawnX = random_range(pX - spawnOff,pX + spawnOff)
		var spawnY = random_range(pY - spawnOff,pY + spawnOff)
	}
	until (!tilemap_get_at_pixel(tilemap,spawnX,spawnY))
	var tower = instance_create_layer(spawnX,spawnY,"Instances",oTower)
	tower.towerType = towerTypes.sniper
}
