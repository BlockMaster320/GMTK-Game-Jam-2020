#region TurretSpawn
var spawnSpdCorrect = spawnSpd / global.timeSpeed
if (random(spawnSpdCorrect) < sniperSpawn)
{
	spawnOff = 300
	minOff = 100
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.sniper
}

if (random(spawnSpdCorrect) < shotgunSpawn)
{
	spawnOff = 150
	minOff = 40
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.shotgun
}

if (random(spawnSpdCorrect) < circularSpawn)
{
	spawnOff = 80
	minOff = minOffDef
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.circular
}

if (random(spawnSpdCorrect) < spiralSpawn)
{
	spawnOff = spawnOffDef
	minOff = minOffDef
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.spiral
}

if (random(spawnSpdCorrect) < rotazionSpawn)
{
	spawnOff = 100
	minOff = minOffDef
	var tower = SpawnTower(spawnOff)
	tower.towerType = towerTypes.rotazionSpielzeug
}

spawnSpd = max(spawnSpd - 0.003,20)

global.currentScore += scoreMultiplier * (1-gameEnded)
global.highscore = max(global.highscore,global.currentScore)
global.prevScore = global.currentScore
#endregion

#region Upgrade spawn
if (point_distance(oPlayer.x,oPlayer.y,centerSpawnPointX,centerSpawnPointY) > 850) upgradeAvailable = true

if (upgradeAvailable)
{
	with (oUpgrade) instance_destroy()
	upgradeAvailable = false
	
	var upgradeSpawnOff = 200
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
				repeat(40)
				{
					var spawnX = random_range(pX + (fromPlayerOff * i) - upgradeSpawnOff,
												pX + (fromPlayerOff * i) + upgradeSpawnOff)
					var spawnY = random_range(pY + (fromPlayerOff * j) - upgradeSpawnOff,
												pY + (fromPlayerOff * j) + upgradeSpawnOff)
					spawnX -= spawnX % TL_SIZE + TL_SIZE / 2
					spawnY -= spawnY % TL_SIZE + TL_SIZE / 2
					if (tilemap_get_at_pixel(tilemap,spawnX,spawnY))
					break
				}
				while (tilemap_get_at_pixel(tilemap,spawnX,spawnY))
				{
					spawnX += TL_SIZE * i
					spawnY += TL_SIZE * j
				}
				if (spawnX > 0 and spawnX < room_width and spawnY > 0 and spawnY < room_height)
				{
					instance_create_layer(spawnX,spawnY,"Instances",oUpgrade)
				
					repeat(1)
					{
						do
						{
							var spawnX_ = random_range(spawnX - 50,spawnX + 50)
							var spawnY_ = random_range(spawnY - 50,spawnY + 50)
							spawnX_ -= spawnX_ % TL_SIZE
							spawnY_ -= spawnY_ % TL_SIZE
						}
						until (!tilemap_get_at_pixel(tilemap,spawnX_,spawnY_) and place_free(spawnX_,spawnY_))
						var tower = instance_create_layer(spawnX_,spawnY_,"Instances",oTower)
						tower.lifeTime = 9999
						tower.towerType = irandom_range(0,towerTypes.length-1)
					}
				}
			}
		}
	}
}
#endregion