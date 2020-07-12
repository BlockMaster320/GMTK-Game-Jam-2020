//Move If the Paused Isn't Activated
if (speed < movementSpeed)
	speed *= accel * global.timeSpeed;
if (rotSpd > 0)
{
	direction += rotSpd * random_range(-1,1)
	image_angle = direction
}
bulletSize = 0;

//Destroy a Bullet Otside the Room
if (x < 0 || y < 0 || x > room_width || y > room_height)
	instance_destroy(self);

//Check For Collision With Tower
if (place_meeting(x, y, oTower))
{
	var _towerCollider = instance_place(x, y, oTower);
	instance_destroy(_towerCollider);
}
