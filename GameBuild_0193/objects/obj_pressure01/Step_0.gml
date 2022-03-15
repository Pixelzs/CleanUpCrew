/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y,obj_block01))or(place_meeting(x,y,obj_block03_timed))or(place_meeting(x,y,obj_block05_slippy))
{
	animation=true;
	ptimer=unit/2;
	if(once==false)
	{
		pxscale=1.32;
		pyscale=1.32;
		blockhit = instance_place(x,y,obj_block_control);
		bin = id;
		with(blockhit)
		{
			checkkick=false;
			if(slippy!=1)
			{
				
				obj_undoaction.UndoArray[UndoNum]=new Undo(obj_player.x, obj_player.y, blockx, blocky, other.blockhit, bin);
				instance_deactivate_object(other.blockhit);
				other.check=0;
			}
			else{
				other.check=1;
			}	
		}
		if check!=1
		{
			audio_play_sound(LidClose_SFX,1,0);
			obj_door01.number_to_open+=1;
			once=true;
			sprite_index=spr_pressure01_full;
		}
	}
}

if animation
{
	if ptimer < unit/2
	{
		if pxscale-0.1 > 0.8
		{
			pxscale=pxscale-0.1;
			pyscale=pyscale-0.1;
		}
	}
	if ptimer<=0
	{
		pxscale=1;
		pyscale=1;
	}
	ptimer-=30;
	
}
