//Ability 1
ability1Radius += ability1Speed * global.timeSpeed;
if (ability1Radius > ability1MaxRadius * 0.9)
{
	ability1Speed -= 0.08 * global.timeSpeed;
	ability1Alpha -= 0.08 * (1 / 1.5) * global.timeSpeed;
}
	
if (ability1Alpha <= 0)
	instance_destroy(self);
	
if (collision_circle(x, y, ability1Radius, oBullet, false, true))
{
	var _bulletCollider = collision_circle(x, y, ability1Radius, oBullet, false, true);
	instance_destroy(_bulletCollider);
}
