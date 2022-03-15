/// @description Insert description here
// You can write your code in this editor

if(issMove==false)
{
	if(keyboard_check_pressed(vk_left))
	{
		issMove=true;
		timer=unit;
		
	}
}
if(issMove==true)
{
	xp=-1;
	xp=xp*buildsp;
	x+=xp;
	timer-=buildsp;
	if(timer<=0)
	{
		timer=0;
		issMove=false;
	}
}