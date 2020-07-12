global.timeSpeed = .005
lifetime--
if (lifetime < 0)
{
	global.timeSpeed = 1
	audio_stop_sound(slowMoSound)
	instance_destroy()
}