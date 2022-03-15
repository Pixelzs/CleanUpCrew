/// @description Screenshake
// You can write your code in this editor
if(shaketimer<=0)
{
	shake=false;
	shaketimer=shakelength;
}

if(shake)
{
	shaketimer-=1;
	var range = 15;
	camera_set_view_pos(view_camera[0], view_x+random_range(-range, range), view_y+random_range(-range,range));
}else{
	camera_set_view_pos(view_camera[0], view_x, view_y);
}


