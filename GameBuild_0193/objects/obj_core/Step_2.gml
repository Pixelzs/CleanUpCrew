/// @description Menu Selection
// You can write your code in this editor
var _pause;
var controller=false;
if gamepad_is_connected(0)
{
	controller=true;
}
		
if(controller==true)
{
	 _pause=gamepad_button_check_pressed(0,gp_start);
}
else{
	 _pause=keyboard_check_pressed(vk_escape);
}



if(_pause) && (!instance_exists(obj_transition)) && (!instance_exists(obj_start))
{
	global.gamePause=!global.gamePause;
	if global.gamePause
	{
		instance_deactivate_all(1);
	}
	else{
		instance_activate_all();
	}
}

if global.gamePause
{
	var controller=false;
	
	if gamepad_is_connected(0)
	{
		controller=true;
	}
	if(controller==true)
	{
						
		keyup =  gamepad_button_check(0,gp_padu);
		keydown = gamepad_button_check(0,gp_padd);
		keyEnter = gamepad_button_check_pressed(0,gp_face1);
		PauseSelect+=(keydown-keyup);
				
	}
	else if(controller==false)
	{
		keyup = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
		keydown = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
		keyEnter = keyboard_check_pressed(vk_enter);
		PauseSelect+=(keydown-keyup);
		var mouseY = device_mouse_y_to_gui(0);
		if (mouseY < menu_bottom) && (mouseY > menu_top)
		{
			PauseSelect=(menu_bottom - mouseY) div (menu_item_h*1.5);
			keyEnter=mouse_check_button_pressed(mb_left);
		}
		else{
			PauseSelect=4;
		}
	}
	
	if(PauseSelect >= array_length(PauseOption)) PauseSelect=0;
	if(PauseSelect < 0) PauseSelect = array_length(PauseOption)-1;
	
	if(keyEnter)
	{
		switch(PauseSelect)
		{
			case 0: //MainMenu
			{
				alarm[0]=10;
			}break;
			case 1: //Restart
			{
				alarm[1]=10;
			}break;
			case 2: //Resume
			{
				alarm[2]=10;
			}break;
		}	
	}
	
}

		