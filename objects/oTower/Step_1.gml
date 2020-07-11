if (justStarted)
{
	justStarted = false
	
	switch (towerType)
	{
		case towerTypes.circular:
		{
			sprite_index = sEnemy3
			bulletSpeed = 0.5;
			bulletSize = 1;
			cooldown = 150;
			bulletNumber = 20;
		}
		break;
		case towerTypes.spiral:
		{
			sprite_index = sEnemy2
			bulletSpeed = 0.75;
			bulletSize = 1;
			cooldown = 8;
			rotationSpeed = 3;
		}
		break;
		case towerTypes.sniper:
		{
			sprite_index = sEnemy2
			bulletSpeed = 3;
			bulletSize = 1;
			cooldown = 80;
		}
		break;
	}
}