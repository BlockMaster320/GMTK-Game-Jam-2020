selected += keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)
if (selected > SELECT.length-1) selected = 0
else if (selected < 0) selected = SELECT.length-1

var xx = room_width * .15
var yy = room_height * .09
var space = 40

draw_set_font(fntGamer)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

for (var i = 0; i < array_length_1d(menuWords); i++)
{
	var rot = 0
	if (selected = i) {draw_set_color(c_red);rot = random_range(-3,3)}
	else draw_set_color(c_white)
    draw_text_transformed(xx,yy + (space * i),menuWords[i],3,3,rot)
}
draw_self()

var xx = room_width * .65
var yy = room_height * .15
draw_set_color(c_white)
draw_text_transformed(xx,yy,"Highscore: " + string(highscore),3,3,0)