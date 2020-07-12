#region TurretSpawn
if (random(spawnSpd) < sniperSpawn)
{
	spawnOff = 300
	minOff = 100
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.sniper
}

if (random(spawnSpd) < circularSpawn)
{
	spawnOff = 80
	minOff = minOffDef
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.circular
}

if (random(spawnSpd) < spiralSpawn)
{
	spawnOff = spawnOffDef
	minOff = minOffDef
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.spiral
}

if (random(spawnSpd) < rotazionSpawn)
{
	spawnOff = 100
	minOff = minOffDef
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.rotazionSpielzeug
}

spawnSpd = max(spawnSpd - 0.002,20)

global.currentScore += scoreMultiplier
global.highscore = max(global.highscore,global.currentScore)
#endregion

#region Upgrade spawn
if (point_distance(oPlayer.x,oPlayer.y,centerSpawnPointX,centerSpawnPointY) > 850) upgradeAvailable = true

if (upgradeAvailable)
{
	with (oUpgrade) instance_destroy()
	upgradeAvailable = false
	
	var upgradeSpawnOff = 500
	var fromPlayerOff = 300
	
	var pX = oPlayer.x
	var pY = oPlayer.y
	
	centerSpawnPointX = pX
	centerSpawnPointY = pY
	
	for (var i = -1; i <= 1; i++)
	{
		for (var j = -1; j <= 1; j++)
		{
			if (i != 0 and j != 0)
			{
				do
				{
					var spawnX = random_range(pX + (fromPlayerOff * i) - upgradeSpawnOff,
												pX + (fromPlayerOff * i) + upgradeSpawnOff)
					var spawnY = random_range(pY + (fromPlayerOff * j) - upgradeSpawnOff,
												pY + (fromPlayerOff * j) + upgradeSpawnOff)
					spawnX -= spawnX % TL_SIZE
					spawnY -= spawnY % TL_SIZE
				}
				until (tilemap_get_at_pixel(tilemap,spawnX,spawnY))
				while (tilemap_get_at_pixel(tilemap,spawnX,spawnY) or spawnX > room_width)
				{
					spawnX += TL_SIZE * i
					spawnY += TL_SIZE * j
				}
				
				instance_create_layer(spawnX,spawnY,"Instances",oUpgrade)
				
				repeat(2)
				{
					do
					{
						var spawnX_ = random_range(spawnX - 200,spawnX + 200)
						var spawnY_ = random_range(spawnX - 200,spawnX + 200)
						spawnX_ -= spawnX_ % TL_SIZE
						spawnY_ -= spawnY_ % TL_SIZE
					}
					until (!tilemap_get_at_pixel(tilemap,spawnX_,spawnY_) and place_free(spawnX_,spawnY_))
					var tower = instance_create_layer(spawnX,spawnY,"Instances",oTower)
					tower.lifeTime = 9999
					tower.towerType = irandom_range(0,towerTypes.length)
				}
			}
		}
	}
}
#endregion