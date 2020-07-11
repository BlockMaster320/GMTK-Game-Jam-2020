//Set Tower Properties
towerType = towerTypes.sniper;
bulletOrigin = y - 20;

bulletSpeed = 0;	//general type variables
bulletSize = 1;
cooldown = 0;
cooldownCount = 0;
bulletNumber = 0;	//circular type variables
rotation = 0;	//sprial type variables
rotationSpeed = 0;
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
		sprite_index = sEnemy1;
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
