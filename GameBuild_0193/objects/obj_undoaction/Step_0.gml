///// @description Undo

//If Input is pressed
bundo=keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0,gp_face2);

//Temp variables to store ID
var _blockid=0;
var _layerName=0;
var _pressureid=0;

//If input and no cooldown or number of tries isn't 0
if bundo && numberofundo<=2 && reset=false
{
	//Begin reloading previous postition and setting them to player and to instances with the equalivent ID
	numberofundo++;
	//Reverse Index
	if (UndoNum-1)!=-1
	{
		UndoNum--;
		moves--;
	}
	else{
		UndoNum=2;
	}
	//Get player's previous coordinates and set it to coordinates
	with(obj_player)
	{
		x= obj_undoaction.UndoArray[UndoNum].x_1;
		y= obj_undoaction.UndoArray[UndoNum].y_1;
	}
	
	//Get ID 
	_blockid=UndoArray[UndoNum].instanceid;
	_layerName=layer_get_id("PressurePlatesAndHoles");
	_pressureid=UndoArray[UndoNum].binid;
	
	//If saved ID is existent in level
	if instance_exists(_blockid)
	{
		//With ID
		with(_blockid)
		{
			checkkick=false;
			btimer=0;
			bxp=0;
			byp=0;
			//Ensure the saved value isn't 0
			//Set previous coordinates to ID's coordinates
			if obj_undoaction.UndoArray[UndoNum].x_2!=0
			{
				x=other.UndoArray[UndoNum].x_2;
			}
			if obj_undoaction.UndoArray[UndoNum].y_2!=0
			{
				y=other.UndoArray[UndoNum].y_2;
			}
			//Cut Content for Timed block
			if (_blockid.timekick+1)!=6
			{
				_blockid.timekick++;
			}
		}
	}
	//Check if block was pickuped by bin(pressureplate) by checking for ID existense, if that object has a sprite and if the object it collected is equivilent to the same ID saved
	else if (instance_exists(_pressureid)) && (_pressureid.sprite_index==spr_pressure01_full) && (_pressureid.blockhit==_blockid)
	{
		//Undo bin pickup
		_pressureid.sprite_index=spr_pressure01;
		obj_door01.number_to_open-=1;
		_pressureid.once=false; 
		_pressureid.check=1;	
		
		//Set block to reactivate again
		instance_activate_object(_blockid);
		//With recently activated object, set its coordinates
		with(_blockid)
		{
			checkkick=false;
			btimer=0;
			bxp=0;
			byp=0;
			if obj_undoaction.UndoArray[UndoNum].x_2!=0
			{
				x=other.UndoArray[UndoNum].x_2;
			}
			if obj_undoaction.UndoArray[UndoNum].y_2!=0
			{
				y=other.UndoArray[UndoNum].y_2;
			}
			if (_blockid.timekick+1)!=6
			{
				_blockid.timekick++;
			}
		}
	}
	//Same as previous but for coloured blocks
	else if (instance_exists(_pressureid)) && (_pressureid.sprite_index==spr_pressure02_colours_full) && (_pressureid.pcblockhit==_blockid)
	{
		//Check which colour object is.
		if(_pressureid.PlateColourB==true)
		{
			_pressureid.sprite_index=spr_pressure02_colours;
			_pressureid.image_index=1;	
		}
		_pressureid.sprite_index=spr_pressure02_colours;
		obj_door01.number_to_open-=1;
		_pressureid.once=false; 
		_pressureid.check=1;	
			
		instance_activate_object(_blockid);
		with(_blockid)
		{
			checkkick=false;
			btimer=0;
			bxp=0;
			byp=0;
			if obj_undoaction.UndoArray[UndoNum].x_2!=0
			{
				x=other.UndoArray[UndoNum].x_2;
			}
			if obj_undoaction.UndoArray[UndoNum].y_2!=0
			{
				y=other.UndoArray[UndoNum].y_2;
			}
			if (_blockid.timekick+1)!=6
			{
				_blockid.timekick++;
			}
		}
	}
	//Difference between this and previous is hole is a sprite that is created when block colldies with object hole, this code tries to reverse that 
	else if(holes)
	{	
		if(layer_sprite_exists(_layerName,filledid))
		{
			_pressureid=UndoArray[UndoNum].binid;
			if(!instance_exists(_pressureid))
			{
				instance_activate_object(_pressureid);
				show_debug_message(string(_pressureid.blockfell));
				if (_pressureid.blockfell==_blockid)
				{
					show_debug_message("TE");
					instance_activate_object(_blockid);
					layer_sprite_destroy(filledid);
					with(_blockid)
					{
						checkkick=false;
						btimer=0;
						bxp=0;
						byp=0;
						if obj_undoaction.UndoArray[UndoNum].x_2!=0
						{
							x=other.UndoArray[UndoNum].x_2;
						}
						if obj_undoaction.UndoArray[UndoNum].y_2!=0
						{
							y=other.UndoArray[UndoNum].y_2;
						}
						if (_blockid.timekick+1)!=6
						{
							_blockid.timekick++;
						}
					}
				}
			}
		}
	}
	
	//_guardid=UndoArray[UndoNum].instanceid_2;
	//if instance_exists(_guardid)
	//{
	//	show_debug_message("LOOOOOOOOOOOOOO")
	//	with(_guardid)
	//	{
	//		x= other.UndoArray[UndoNum].x_3;
	//		y= other.UndoArray[UndoNum].y_3;
	//		MoveDirectionX= other.UndoArray[UndoNum].MoveDir_X;
	//		MoveDirectionY= other.UndoArray[UndoNum].MoveDir_Y;
	//		tick=false;
	//		timer=0;
	//		show_debug_message("OOOOOOOOOOOOOOL")
	//	}
	//}
	
} 

if numberofundo>=3
{
	reset=true;
	numberofundo+=0.1;
	if numberofundo>=10
	{
		numberofundo=0;
	}
	
}
	