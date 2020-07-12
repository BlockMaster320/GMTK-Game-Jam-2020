var spawnOffset = argument0

var pX = oPlayer.x
var pY = oPlayer.y
do
{
	var spawnX = random_range(pX - spawnOffset,pX + spawnOffset)
	var spawnY = random_range(pY - spawnOffset,pY + spawnOffset)
	spawnX -= spawnX % TL_SIZE + TL_SIZE / 2
	spawnY -= spawnY % TL_SIZE + TL_SIZE / 2
}
until (!tilemap_get_at_pixel(tilemap,spawnX,spawnY) and !place_meeting(spawnX,spawnY,oPlayer) and
		point_distance(x,y,oPlayer.x,oPlayer.y > minOff) and !place_meeting(spawnX,spawnY,oUpgrade))
return instance_create_layer(spawnX,spawnY,"Instances",oTower)