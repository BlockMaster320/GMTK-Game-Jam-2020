var windowW = window_get_width()
var windowH = window_get_height()
if (windowW != 0 and windowH != 0)
{
	surface_resize(application_surface,window_get_width(),window_get_height())
}