if (towerState = TOWER_STATE.active)
{
	var bulletOriginX = x + lengthdir_x(7,rotation)
	var bulletOriginY = y + lengthdir_y(7,rotation)
	part_type_speed(shootSmokePart,.6 * global.timeSpeed,2.5 * global.timeSpeed,-.05,0)
	//Spawn Bullets
	switch (towerType)
	{
		case towerTypes.circular:
		{
			if (cooldownCount >= cooldown and point_distance(x,y,oPlayer.x,oPlayer.y) < 200)
			{
				var snd = audio_play_sound(sndShoot,0,0)
				audio_sound_gain(snd,1-(point_distance(x,y,oPlayer.x,oPlayer.y)/600),0)
				for (var _i = 0; _i < bulletNumber; _i ++)
				{
					var _newBullet = instance_create_layer(x, bulletOrigin, "Instances", oBullet);
					_newBullet.movementSpeed = bulletSpeed;
					_newBullet.direction = (360 / bulletNumber) * _i;
					_newBullet.image_angle = _newBullet.direction;
					_newBullet.bulletSize = bulletSize;
				
					image_xscale = 1;
					image_yscale = 1;
					
					part_type_direction(shootSmokePart,(360 / bulletNumber) * _i,(360 / bulletNumber) * _i,2,5)
					part_particles_create(shootSmokeSys,x, bulletOrigin,shootSmokePart,5)
				}
				cooldownCount = 0;
			}
		}
		break;
		
		case towerTypes.spiral:
		{
			if (cooldownCount >= cooldown and point_distance(x,y,oPlayer.x,oPlayer.y) < 300)
			{
				var snd = audio_play_sound(sndShoot,0,0)
				audio_sound_gain(snd,1-(point_distance(x,y,oPlayer.x,oPlayer.y)/600),0)
				var _newBullet = instance_create_layer(bulletOriginX, bulletOriginY, "Instances", oBullet);
				_newBullet.movementSpeed = bulletSpeed;
				_newBullet.direction = rotation;
				_newBullet.image_angle = _newBullet.direction;
				_newBullet.bulletSize = bulletSize;
				
				part_type_direction(shootSmokePart,rotation-20,rotation+20,2,5)
				part_particles_create(shootSmokeSys,bulletOriginX,bulletOriginY,shootSmokePart,5)
			
				cooldownCount = 0;
			
				image_xscale = 1;
				image_yscale = 1;
			}
		}
		break;
		
		case towerTypes.sniper:
		{
			if (cooldownCount >= cooldown)
			{
				var snd = audio_play_sound(sndShoot,0,0)
				audio_sound_gain(snd,1-(point_distance(x,y,oPlayer.x,oPlayer.y)/600),0)
				var _newBullet = instance_create_layer(bulletOriginX, bulletOriginY, "Instances", oBullet);
				_newBullet.movementSpeed = bulletSpeed;
				_newBullet.direction = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2);
				_newBullet.image_angle = _newBullet.direction;
				_newBullet.bulletSize = bulletSize;
				
				part_type_direction(shootSmokePart,_newBullet.direction-20,_newBullet.direction+20,2,5)
				part_particles_create(shootSmokeSys,bulletOriginX,bulletOriginY,shootSmokePart,5)
			
				cooldownCount = 0;
				image_xscale = 1;
				image_yscale = 1;
			}
			image_angle = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2);
		}
		break;
	
		case towerTypes.rotazionSpielzeug:
		{
			if (cooldownCount >= cooldown and point_distance(x,y,oPlayer.x,oPlayer.y) < 200)
			{
				var snd = audio_play_sound(sndShoot,0,0)
				audio_sound_gain(snd,1-(point_distance(x,y,oPlayer.x,oPlayer.y)/600),0)
				repeat(2)
				{
					var _newBullet = instance_create_layer(bulletOriginX, bulletOriginY, "Instances", oBullet);
					_newBullet.movementSpeed = bulletSpeed;
					_newBullet.direction = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2);
					_newBullet.bulletSize = bulletSize;
					rotation = image_angle
					_newBullet.rotSpd = 10
					
					part_type_direction(shootSmokePart,_newBullet.direction-20,_newBullet.direction+20,2,5)
					part_particles_create(shootSmokeSys,bulletOriginX,bulletOriginY,shootSmokePart,5)
				}
			
				cooldownCount = 0;
				image_xscale = 1;
				image_yscale = 1;
			}
			image_angle = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2);
		}
		break;
		
		case towerTypes.shotgun:
		{
			if (cooldownCount >= cooldown and point_distance(x,y,oPlayer.x,oPlayer.y) < 100)
			{
				var snd = audio_play_sound(sndShoot,0,0)
				audio_sound_gain(snd,1-(point_distance(x,y,oPlayer.x,oPlayer.y)/600),0)
				repeat(bulletNumber)
				{
					var _newBullet = instance_create_layer(bulletOriginX, bulletOriginY, "Instances", oBullet);
					_newBullet.movementSpeed = random_range(.5,1.5);
					_newBullet.direction = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2) + random_range(-40,40);
					_newBullet.image_angle = _newBullet.direction
					_newBullet.bulletSize = bulletSize;
					
					part_type_direction(shootSmokePart,_newBullet.direction-20,_newBullet.direction+20,2,5)
					part_particles_create(shootSmokeSys,bulletOriginX,bulletOriginY,shootSmokePart,5)
				}
			
				cooldownCount = 0;
				image_xscale = 1;
				image_yscale = 1;
			}
			image_angle = point_direction(x, bulletOrigin, oPlayer.x + oPlayer.sprite_width / 2, oPlayer.y + oPlayer.sprite_height / 2);
		}
		break;
	}
	image_xscale = max(image_xscale - 0.001 * global.timeSpeed,.7)
	image_yscale = max(image_yscale - 0.001 * global.timeSpeed,.7)
	cooldownCount += 1 * global.timeSpeed;
	rotation += rotationSpeed * global.timeSpeed;
	image_angle += rotationSpeed * global.timeSpeed;
	rotation = image_angle
	lifeTime--
	if (lifeTime < 0) instance_destroy()
}
else comingTimer -= global.timeSpeed
if (comingTimer <= 0) towerState = TOWER_STATE.active