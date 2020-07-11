var pX = oPlayer.x
var pY = oPlayer.y
do
{
	var spawnX = random_range(pX - spawnOff,pX + spawnOff)
	var spawnY = random_range(pY - spawnOff,pY + spawnOff)
	spawnX -= spawnX % TL_SIZE + TL_SIZE / 2
	spawnY -= spawnY % TL_SIZE + TL_SIZE / 2
}
until (!tilemap_get_at_pixel(tilemap,spawnX,spawnY) and !place_meeting(spawnX,spawnY,oPlayer))
return instance_create_layer(spawnX,spawnY,"Instances",oTower)