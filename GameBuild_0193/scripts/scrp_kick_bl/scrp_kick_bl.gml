//Push Script
function BlockKick(xsp, ysp){
	
	//Check block type
	var slip=false;
	var timey=false;
	var colour=false;
	
	var checkb=2;

	//Check for if this instance is next to player, this also includes its child
	
	//Direction X axis
	if(place_meeting(x+xsp, y, obj_block_control))
	{
		//Set Player sprite
		if(xp=1)
		{
			sprite=spr_player_push_right;
			xscale=1;
		}
		else if(xp=-1)
		{
			sprite=spr_player_push_right;
			xscale=-1;
		}
		//Check for block type that player found
		if(place_meeting(x+xsp,y,obj_block05_slippy))
		{
			slip=true;
		}
		if(place_meeting(x+xsp,y,obj_block03_timed))
		{
			timey=true;
		}
		if(place_meeting(x+xsp,y,obj_block02_colours))
		{
			colour=true;
		}
		//Get id of instance next to player
		blockid=instance_place(x+xsp,y,obj_block_control)
		with(blockid)
		{
			//If instance is stationed
			if(checkkick==false)
			{
				//Save its position
				blockx=blockid.x;
				blocky=blockid.y;
				obj_undoaction.UndoArray[UndoNum]=new Undo(playerx, playery, blockx, blocky, blockid, bin);//Add player's position, block's position and id and for bin's id to an constructor to an array
				if(UndoNum<2)
				{
					UndoNum++;//Increase index
				}
				else if(UndoNum-2)!=-1//If index is 0 if subtracted by 2
				{
					UndoNum-=2;//Reset Index
				}
			}
			//Give direction input to block
			bxp=obj_player.xp;
			//Set block type
			if(slip==true)
			{
				slippy=1;
				audio_play_sound(Slide_SFX,1,0);
			}
			else if(timey==true)
			{
				timed=1;
			}
			else{
				audio_play_sound(Push_SFX,1,0);
			}
		}
		xp=0;
	}
	else{
		checkb--;
	}
	//Direction Y axis
	if(place_meeting(x, y+ysp, obj_block_control))
	{
		if(yp=1)
		{	
			sprite=spr_player_push_down;
		}
		else if(yp=-1)
		{	
			sprite=spr_player_push_up;
		}
		
		if(place_meeting(x,y+ysp,obj_block05_slippy))
		{
			slip=true;
		}
		if(place_meeting(x,y+ysp,obj_block03_timed))
		{
			timey=true;
		}
		if(place_meeting(x,y+ysp,obj_block02_colours))
		{
			colour=true;
		}
		kick=1;
		blockid=instance_place(x,y+ysp,obj_block_control)
		with(blockid)
		{
			if(checkkick==false)
			{
				blockx=blockid.x;
				blocky=blockid.y;
				obj_undoaction.UndoArray[UndoNum]=new Undo(playerx, playery, blockx, blocky, blockid, bin);
				if(UndoNum<2)
				{
					UndoNum++;
				}
				else if(UndoNum-2)!=-1
				{
					UndoNum-=2;
				}
			}
			byp=obj_player.yp;
			if(slip==true)
			{
				slippy=1;
				audio_play_sound(Slide_SFX,1,0);
			}
			else if(timey==true)
			{
				timed=1;
			}
			else{
				audio_play_sound(Push_SFX,1,0);
			}
		}
		yp=0;
	}
	else{
		checkb--;
	}
	
	//fail safe if player moves multiple blocks 
	if(checkb==0)
	{
		if(blockid.checkkick==false)
		{
			obj_undoaction.UndoArray[UndoNum]=new Undo(playerx, playery, blockid.x, blockid.y, blockid, bin);
		}
	}
	
}