if (justStarted and towerState = TOWER_STATE.active)
{
	justStarted = false
	
	image_speed = 0
	
	switch (towerType)
	{
		case towerTypes.circular:
		{
			sprite_index = sEnemy3
			bulletSpeed = 0.8;
			bulletSize = 1;
			cooldown = 250;
			bulletNumber = 15;
		}
		break;
		case towerTypes.spiral:
		{
			sprite_index = sEnemyBayblade
			bulletSpeed = 1;
			bulletSize = 1;
			cooldown = 15;
			rotationSpeed = -2;
		}
		break;
		case towerTypes.sniper:
		{
			sprite_index = sEnemy2
			bulletSpeed = 3;
			bulletSize = 1;
			cooldown = 300;
		}
		break;
		case towerTypes.rotazionSpielzeug:
		{
			sprite_index = sEnemy1
			bulletSpeed = 1.5;
			bulletSize = 1;
			cooldown = 150;
		}
		break;
		case towerTypes.shotgun:
		{
			sprite_index = sEnemy1
			bulletSize = 1;
			cooldown = 60;
			bulletNumber = 4
		}
		break;
	}
}