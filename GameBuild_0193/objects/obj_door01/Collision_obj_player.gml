/// @description Insert description here
// You can write your code in this editor


if(open==true)
{
	instance_create_layer(x,y,"PlayerAndDoorAndCore",obj_transition);
	if(sound)
	{
		sound=false;
		audio_play_sound(exitlevel_SFX,1,0);
	}
			
}