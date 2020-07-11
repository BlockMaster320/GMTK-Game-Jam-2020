//Spawn Bullets
if (cooldownCount >= cooldown)
{
	switch (towerType)
	{
		case towerTypes.circular:
		{
			for (var _i = 0; _i < bulletNumber; _i ++)
			{
				var _newBullet = instance_create_layer(x, bulletOrigin, "Instances", oBullet);
				_newBullet.movementSpeed = bulletSpeed;
				_newBullet.direction = (360 / bulletNumber) * _i;
				_newBullet.bulletSize = bulletSize;
			}
			cooldownCount = 0;
		}
		break;
		
		case towerTypes.spiral:
		{
			var _newBullet = instance_create_layer(x, bulletOrigin, "Instances", oBullet);
			_newBullet.movementSpeed = bulletSpeed;
			_newBullet.direction = rotation;
			_newBullet.bulletSize = bulletSize;
			
			cooldownCount = 0;
		}
		break;
		
		case towerTypes.sniper:
		{
			var _newBullet = instance_create_layer(x, bulletOrigin, "Instances", oBullet);
			_newBullet.movementSpeed = bulletSpeed;
			_newBullet.direction = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2);
			_newBullet.bulletSize = bulletSize;
			
			cooldownCount = 0;
		}
		break;
	}
}
cooldownCount += 1 * (!global.pause);
rotation += rotationSpeed;
