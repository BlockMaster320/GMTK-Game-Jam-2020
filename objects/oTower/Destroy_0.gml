global.screenShake += 6
var px = oPlayer.x
var py = oPlayer.y
var playerDir = point_direction(px,py,x,y)
part_type_direction(shootSmokePart,playerDir-20,playerDir+20,0,0)
part_particles_create(shootSmokeSys,x,y,shootSmokePart,30)
