/// @description Insert description here
// You can write your code in this editor
if(PlateColourB==true)
{
	image_index=1;	
}


if(place_meeting(x,y,obj_block02_colours))
{
	var bcolour = instance_place(x,y,obj_block02_colours)
	pcanimation=true;
	pctimer=unit/2;
	if((PlateColourB==false)and(bcolour.ColourB==false))
	{
		//since a step is a loop this variable will prevent it looping this code by just adding 1 to the door variable
		if(once==false)
		{
			pcxscale=1.32;
			pcyscale=1.32;
			pcblockhit = instance_place(x,y,obj_block_control);
			bin = id;
			sprite_index=spr_pressure02_colours_full;
			obj_door01.number_to_open+=1;
			audio_play_sound(LidClose_SFX,1,0);
			with(pcblockhit)
			{
				checkkick=false;
				obj_undoaction.UndoArray[UndoNum]=new Undo(obj_player.x, obj_player.y, blockx, blocky, other.pcblockhit, bin);
				instance_deactivate_object(other.pcblockhit);
			}
		}
	}
	else if((PlateColourB==true)and(bcolour.ColourB==true))
	{
		if(once==false)
		{
			pcxscale=1.32;
			pcyscale=1.32;
			pcblockhit = instance_place(x,y,obj_block_control);
			bin = id;
			sprite_index=spr_pressure02_colours_full;
			image_index=1;
			obj_door01.number_to_open+=1;
			audio_play_sound(LidClose_SFX,1,0);
			with(pcblockhit)
			{
				checkkick=false;
				obj_undoaction.UndoArray[UndoNum]=new Undo(obj_player.x, obj_player.y, blockx, blocky, other.pcblockhit, bin);
				instance_deactivate_object(other.pcblockhit);
			}
		}
	}
}


if pcanimation
{
	if pctimer < unit/2
	{
		if pcxscale-0.1 > 0.8
		{
			pcxscale=pcxscale-0.1;
			pcyscale=pcyscale-0.1;
		}
	}
	if pctimer<=0
	{
		pcxscale=1;
		pcyscale=1;
	}
	pctimer-=30;
	
}
