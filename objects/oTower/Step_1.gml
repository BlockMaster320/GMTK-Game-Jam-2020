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
			cooldown = 60;
			bulletNumber = 20;
		}
		break;
		case towerTypes.spiral:
		{
			bulletSpeed = 0.75;
			bulletSize = 1;
			cooldown = 5;
			rotationSpeed = 2;
		}
		break;
		case towerTypes.sniper:
		{
			sprite_index = sEnemy2
			bulletSpeed = 2;
			bulletSize = 1;
			cooldown = 60;
		}
		break;
	}
}