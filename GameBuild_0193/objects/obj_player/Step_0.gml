

//Temp Variables
var wall = false;
var xsp=0;
var ysp=0;
var controller=false;

//Check Health
if (healthhalf=false)
{
	sprite=spr_player_dead;
	TransitionStart(room,Transition_FadeOut,Transition_FadeIn);
}
else {
	//Pre-Movement
	if(isMove==false)
	{
		//Save Position
		playerx=x;
		playery=y;
		//obj_undoaction.GuardUndoArray[UndoNum]=new GuardUndo(obj_guard.instance_id, obj_guard.x, obj_guard.y, obj_guard.MoveDirectionX, obj_guard.MoveDirectionY);
		
		//Cooldown, allows for a brief pause between spaces
		if(pausetimer>=0)
		{
			isMove=false;
			movetimer=0;
			pausetimer-=player_sp_build;
		}
		else{
			//Reset Playersprite and size
			sprite=spr_player_idle;
			image_speed=0;
			if xscale < 1.00
			{
				if bop == true{
					xscale=0.80;
					yscale=0.90;
					bop = false;
				}
				
				xscale+=0.04;
				yscale+=0.04;
			}
			else{
				xscale=1;
				yscale=1;
			}
			
			//Check for controller and Keyboard input
			if gamepad_is_connected(0)
			{
				controller=true;
			}
			if(controller==true)
			{		
				xp =(gamepad_button_check(0,gp_padr)-gamepad_button_check(0,gp_padl))
				yp =(gamepad_button_check(0,gp_padd)-gamepad_button_check(0,gp_padu))
			
			}
			else if(controller==false)
			{
				xp = (keyboard_check(ord("D"))-keyboard_check(ord("A")));
				yp = (keyboard_check(ord("S"))-keyboard_check(ord("W")));
			}
		}
		
		//If any input
		if(xp!=0)or(yp!=0)
		{
			if(pausetimer<=0)
			{
				//Undo Mechanic cooldown is reset
				if(obj_undoaction.reset=true)
				{
					cooldown++;
					if(cooldown>=3)
					{
						obj_undoaction.reset=false;
					}
				}
				//Check for kickable instance
				BlockKick(xp,yp);
				//Begin Moving
				isMove=true;
				movetimer=unit;
				pausetimer=400;
				bop=true;
				
			}
		}
	}
	//Movement
	if(isMove==true)
	{
		//Direction, Left or Right but Not Up or Down
		if(xp!=0)and(yp==0)
		{
			yp=0;
			//Direction Right
			if(xp=1)
			{
				xsp=1;
				if xscale<0
				{
					xscale=1;
				}
				//Check condition then set sprite for that condition
				if(hurt!=true)
				{
					sprite=spr_player_right;
					//Streches and squeezes sprite to give movement more feel
					if movetimer < unit and movetimer > unit/2
					{
						if xscale <= 1.32 and yscale<=1.32
						{
							xscale=xscale+0.08;
							yscale=yscale+0.08;
						}
					}
					if movetimer < unit/2
					{
						if xscale-0.1 > 0.8 and yscale-0.1 > 0.8
						{
							xscale=xscale-0.1;
							yscale=yscale-0.1;
						}
					}
				}
				else{
					//If is hurt, shake the screen
					sprite=spr_player_hurt;
					with(obj_gamecontrol)
					{
						shakelength = 15;
						shake=true;
					}
				}

			}
			//Direction Left
			else if(xp=-1)
			{
				xsp=-1;
				if xscale>0
				{
					xscale=-1;
				}
				if(hurt!=true)
				{
					sprite=spr_player_right;
					if movetimer < unit and movetimer > unit/2
					{
						if xscale >= -1.32  and yscale >=-1.32
						{
							xscale=xscale-0.08;
							yscale=yscale+0.08;
						}
					}
					if movetimer < unit/2
					{
						if xscale+0.1 < -0.8 and yscale-0.1 > 0.8
						{
							xscale=xscale+0.1;
							yscale=yscale-0.1;
						}
					}
				}
				else{
					sprite=spr_player_hurt;
					with(obj_gamecontrol)
					{
						shakelength = 15;
						shake=true;
					}
				}
			}
			//Save direction and multiply with speed
			xsp=xsp*player_sp_build;
		}
		//Direction Up or Down but not Left or Right
		if(xp==0)and(yp!=0)
		{
			xp=0;
			//Direction Down
			if(yp=1)
			{		
				if(hurt!=true)
				{
					sprite=spr_player_down;
					if movetimer < unit and movetimer > unit/2
					{
						if xscale <= 1.32 and yscale<=1.32
						{
							xscale=xscale+0.08;
							yscale=yscale+0.08;
						}
					}
					if movetimer < unit/2
					{
						if xscale-0.1 > 0.8 and yscale-0.1 > 0.8
						{
							xscale=xscale-0.1;
							yscale=yscale-0.1;
						}
					}
				}
				else{
					sprite=spr_player_hurt_down;
					with(obj_gamecontrol)
					{
						shakelength = 15;
						shake=true;
					}
				}
				ysp=1;			
			}
			//Direction Up
			else if(yp=-1)
			{

				if(hurt!=true)
				{
					sprite=spr_player_up;
					if movetimer < unit and movetimer > unit/2
					{
						if xscale <= 1.32 and yscale<=1.32
						{
							xscale=xscale+0.08;
							yscale=yscale+0.08;
						}
					}
					if movetimer < unit/2
					{
						if xscale-0.1 > 0.8 and yscale-0.1 > 0.8
						{
							xscale=xscale-0.1;
							yscale=yscale-0.1;
						}
					}
				}
				else{
					sprite=spr_player_hurt_up;
					with(obj_gamecontrol)
					{
						shakelength = 15;
						shake=true;
					}
				}
				ysp=-1;
			}
			//Save Direction and multiply with speed
			ysp=ysp*player_sp_build;
		}
		
		//Check for unkickable objects, stop movement
		if(place_meeting(x+xsp,y,obj_wall01))or(place_meeting(x+xsp,y,obj_hole))
		{
			wall=true;
			xsp=0;
			pausetimer=150;
		}
		if(place_meeting(x,y+ysp,obj_wall01))or(place_meeting(x,y+ysp,obj_hole))
		{
			wall=true;
			ysp=0;
			pausetimer=150;
		}
		
		//Move Player
		x+=xsp;
		y+=ysp;
		
		
		movetimer-=player_sp_build;
		//Loop back until movetimer is less than 0
		if(movetimer<=0)
		{
			//Stop all movement
			xp=0;
			yp=0;
			//Check for damage and decrease health
			if hurt = true
			{
				if healthfull = false
				{
					healthhalf=false;
				}
				healthfull = false
				hurt=false;
			}
			//If no wall prevents movement
			if wall==false
			{
				//If new position isn't same as previous
				if(x!=playerx or y!=playery)
				{
					//Save new position and increase Array 
					playerx=x;
					playery=y;
					if(blockid.checkkick==false)
					{
						moves++;
						if(UndoNum<2)
						{
							UndoNum++;
						}
						else if(UndoNum-2)!=-1
						{
							UndoNum-=2;
						}
					}
				}
			}
			isMove=false;
			movetimer=0;
			pausetimer=100;
			kick=0;
		}
	}
	
}




