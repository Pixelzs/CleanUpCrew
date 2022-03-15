/// @description Insert description here
// You can write your code in this editor

if(dooropen=number_to_open)
{
	open=true;
}
else
{
	open=false;
}

if(open==true)
{
	image_index=1;
	if once==true
	{
		audio_play_sound(Unlock_SFX,1,0);
		once=false;
		with(obj_core)
		{
			shake=true;
		}
	}
}
else{
	image_index=0;
}