targetX = oPlayer.x - viewW / 2
targetY = oPlayer.y - viewH / 2

if (keyboard_check_pressed(vk_enter)) global.screenShake = 10

x += random_range(-global.screenShake,global.screenShake)
y += random_range(-global.screenShake,global.screenShake)
rot += global.screenShake * .5
global.screenShake = max(global.screenShake-2,0)

x = lerp(x,targetX,spd)
y = lerp(y,targetY,spd)
rot = lerp(0,rot,spd)
x = clamp(x,0,room_width - camW)
y = clamp(y,0,room_height - camH)

camera_set_view_pos(cam,x,y)
camera_set_view_angle(cam,rot)

camW = lerp(camW,viewW,0.01)
camH = camW / 16 * 9
camera_set_view_size(cam,camW,camH)