var xx = room_width * .15
var yy = room_height * .09
var space = 40

selected += keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)
if (selected > SELECT.length-1) selected = 0
else if (selected < 0) selected = SELECT.length-1

draw_set_font(fntGamer)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

for (var i = 0; i < array_length_1d(menuWords); i++)
{
	var rot = 0
	if (selected = i) {draw_set_color(c_red);rot = random_range(-3,3)}
	else draw_set_color(c_white)
    draw_text_transformed(xx,yy + (space * i),menuWords[i],3,3,rot)
	
	//Button Mouse Selection
	var _selectionOffset = 35;
	if (point_in_rectangle(mouse_x, mouse_y, xx - _selectionOffset, yy  + ((space - 5) * i) - 5, xx + _selectionOffset, yy + ((space - 5) * i) + 20))
	{
		selected = i;
		if (mouse_check_button_pressed(mb_left))
			buttonClick = true;
	}
}
draw_self()

xx = room_width * .65
yy = room_height * .15
draw_set_color(c_white)
draw_text_transformed(xx,yy-15,"HIGHSCORE: " + string(highscore),2,2,0)
draw_text_transformed(xx,yy+5,"SCORE: " + string(prevScore_),2,2,0)

xx = 160
yy = 80
space = 53
var spriteOff = 10
for (var i = 0; i < array_length_1d(towerTypesMenu); i++)
{
	if (i = 3) {yy += 35; xx -= i * space}
	draw_text_transformed(xx + (space * i),yy+sin(current_time/1000+i*3),towerTypesMenu[i],1,1,0)
	draw_sprite(towerTypesSprites[i],0,xx + (space * i), yy - spriteOff+sin(current_time/1000+i*3))
}

if (PFselected != selected) audio_play_sound(sndMenuClick,0,0)
PFselected = selected
draw_set_halign(fa_left)
draw_set_valign(fa_left)
draw_text_transformed(xx+295,yy-60,@"Gain score by getting
upgrade bateries and
destroying enemies
(by touching them),
but be cautious, every
time you take a hit,
you lose a key.
Play until you lose
your whole keyboard!",.5,.5,0)


