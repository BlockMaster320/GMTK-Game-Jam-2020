#macro viewW 256
#macro viewH 144

cam = view_camera[0]
targetX = 0
targetY = 0
rot = 0

spd = .2	//0 - 1 v lerpu

x = oPlayer.x - viewW / 2
y = oPlayer.y - viewH / 2

application_surface_draw_enable(false)

global.screenShake = 0