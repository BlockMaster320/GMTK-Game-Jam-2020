//Spawn Bullets
switch (towerType)
{
	case towerTypes.circular:
	{
		if (cooldownCount >= cooldown)
		{
			for (var _i = 0; _i < bulletNumber; _i ++)
			{
				var _newBullet = instance_create_layer(x, bulletOrigin, "Instances", oBullet);
				_newBullet.movementSpeed = bulletSpeed;
				_newBullet.direction = (360 / bulletNumber) * _i;
				_newBullet.image_angle = _newBullet.direction;
				_newBullet.bulletSize = bulletSize;
				
				image_xscale = 1;
				image_yscale = 1;
			}
			cooldownCount = 0;
		}
		image_xscale -= 0.002 * global.timeSpeed;
		image_yscale -= 0.002 * global.timeSpeed;
	}
	break;
		
	case towerTypes.spiral:
	{
		if (cooldownCount >= cooldown)
		{
			var _newBullet = instance_create_layer(x, bulletOrigin, "Instances", oBullet);
			_newBullet.movementSpeed = bulletSpeed;
			_newBullet.direction = rotation;
			_newBullet.image_angle = _newBullet.direction;
			_newBullet.bulletSize = bulletSize;
			
			cooldownCount = 0;
		}
	}
	break;
		
	case towerTypes.sniper:
	{
		if (cooldownCount >= cooldown)
		{
			var _newBullet = instance_create_layer(x, bulletOrigin, "Instances", oBullet);
			_newBullet.movementSpeed = bulletSpeed;
			_newBullet.direction = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2);
			_newBullet.image_angle = _newBullet.direction;
			_newBullet.bulletSize = bulletSize;
			
			cooldownCount = 0;
		}
		image_angle = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2);
	}
	break;
}
cooldownCount += 1 * global.timeSpeed;
rotation += rotationSpeed * global.timeSpeed;
image_angle += rotationSpeed * global.timeSpeed;