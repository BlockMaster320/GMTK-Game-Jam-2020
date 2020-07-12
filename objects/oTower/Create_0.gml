//Set Tower Properties
justStarted = true;
towerType = towerTypes.spiral;
bulletOrigin = y;

//Set Tower Properties For Specific Towers
bulletSpeed = 0;	//general type variables
bulletSize = 1;
cooldown = 0;
cooldownCount = 0;
bulletNumber = 0;	//circular type variables
rotation = 0;	//sprial type variables
rotationSpeed = 0;

justStarted = true

lifeTime = oGameManager.spawnSpd * 25

enum TOWER_STATE
{
	incoming,
	active
}
towerState = TOWER_STATE.incoming
comingTimer = 120

shootSmokeSys = part_system_create()
part_system_depth(shootSmokeSys,250)
shootSmokePart = part_type_create()
part_type_sprite(shootSmokePart,sShootPart,0,0,1)
part_type_direction(shootSmokePart,0,359,0,0)
part_type_alpha2(shootSmokePart,1,0)