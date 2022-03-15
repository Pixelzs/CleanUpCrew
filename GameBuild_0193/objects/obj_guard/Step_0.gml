/// @description Insert description here
// You can write your code in this editor
var xsp=0;
var ysp=0;

var attack;

if(timer>=unit)
{
	tick = true;
	timer = unit;
}

if(timer<=0)
{
	tick=false;
	timer=0;
	//guardid = instance_id_get(object_index)
	//show_debug_message(MoveDirectionX);
	//show_debug_message(guardid);
	//with(guardid)
	//{
	//	show_debug_message(obj_guard.MoveDirectionX);
	//	guardx = guardid.x;
	//	guardy = guardid.y;
	//	obj_undoaction.UndoArray[UndoNum]=new Undo(playerx, playery, 0, 0, guardx, guardy, 0, guardid, obj_guard.MoveDirectionX, obj_guard.MoveDirectionY);
	//}
}


//This is an enemy that moves along an axis that the designer specified in its variable definitions when in room editor. Step movement but checks for player. This also streches and squeezes when moving



if(tick = true)
{
	if(MoveDirectionX!=0)and(MoveDirectionY==0)
	{
		if(MoveDirectionX=1)
		{
			if(flip=1)
			{
				xsp=1;
				if gxscale>0
				{
					gxscale=-1;
				}
				if timer < unit and timer > unit/2
				{
					if gxscale >= -1.32 and gyscale<=1.32
					{
						gxscale=gxscale-0.08;
						gyscale=gyscale+0.08;
					}
				}
				if timer < unit/2
				{
					if gxscale+0.1 < -0.8 and gyscale-0.1 > 0.8
					{
						gxscale=gxscale+0.1;
						gyscale=gyscale-0.1;
					}
				}
				
				MoveDirectionX=2;
				flip=0;
			}
			else{
				xsp=-1;
				if gxscale<0
				{
					gxscale=1;
				}
				if timer < unit and timer > unit/2
				{
					if gxscale <= 1.32 and gyscale<=1.32
					{
						gxscale=gxscale+0.08;
						gyscale=gyscale+0.08;
					}
				}
				if timer < unit/2
				{
					if gxscale-0.1 > 0.8 and gyscale-0.1 > 0.8
					{
						gxscale=gxscale-0.1;
						gyscale=gyscale-0.1;
					}
				}
			}
		}
		if(MoveDirectionX=2)
		{
			if(flip=1)
			{
				xsp=-1;
				if gxscale<0
				{
					gxscale=1;
				}
				if timer < unit and timer > unit/2
				{
					if gxscale <= 1.32 and gyscale<=1.32
					{
						gxscale=gxscale+0.08;
						gyscale=gyscale+0.08;
					}
				}
				if timer < unit/2
				{
					if gxscale-0.1 > 0.8 and gyscale-0.1 > 0.8
					{
						gxscale=gxscale-0.1;
						gyscale=gyscale-0.1;
					}
				}
				MoveDirectionX=1;
				flip=0;
			}
			else{
				xsp=1;
				if gxscale>0
				{
					gxscale=-1;
				}
				if timer < unit and timer > unit/2
				{
					if gxscale >= -1.32 and gyscale<=1.32
					{
						gxscale=gxscale-0.08;
						gyscale=gyscale+0.08;
					}
				}
				if timer < unit/2
				{
					if gxscale+0.1 < -0.8 and gyscale-0.1 > 0.8
					{
						gxscale=gxscale+0.1;
						gyscale=gyscale-0.1;
					}
				}
				MoveDirectionX=2;
				flip=0;
			}
		}
		xsp=xsp*Speed;
		
		if(place_meeting(x+xsp,y,obj_wall01))or(place_meeting(x+xsp,y,obj_hole))
		{
			xsp=0;
			flip=1;
			timer=0;
			tick=false;
		}	
		
		x+=xsp;

	}
	else if(MoveDirectionX==0)and(MoveDirectionY!=0)
	{
		if(MoveDirectionY=1)
		{
			if(flip=1)
			{
				MoveDirectionY=2;
				ysp=1;
				flip=0;
			}
			else{
				ysp=-1;
			}
		}
		if(MoveDirectionY=2)
		{
			if(flip=1)
			{
				MoveDirectionY=1;
				ysp=-1;
				flip=0;
			}
			else{
				ysp=1;
			}
		}
		
		if timer < unit and timer > unit/2
		{
			if gxscale <= 1.32 and gyscale<=1.32
			{
				gxscale=gxscale+0.08;
				gyscale=gyscale+0.08;
			}
		}
		if timer < unit/2
		{
			if gxscale-0.1 > 0.8 and gyscale-0.1 > 0.8
			{
				gxscale=gxscale-0.1;
				gyscale=gyscale-0.1;
			}
		}
		
		ysp=ysp*Speed;
		
		if(place_meeting(x,y+ysp,obj_wall01))or(place_meeting(x,y+ysp,obj_hole))
		{
			ysp=0;
			flip=1;
			timer=0;
			tick=false;
		}

		y+=ysp;
		
	}
	timer-=Speed;
}
else if(tick=false)
{
	timer+=Speed;
	if gxscale > 0
	{
		gxscale=1;
	}
	else
	{
		gxscale=-1;
	}
	gyscale=1;
}


//If it does find a player in its current path or on them, then it'll deal damage and pushes the player out of the way.
if(place_meeting(x,y,obj_player))
{
	attack=instance_place(x,y,obj_player)
	with(attack)
	{
		if(other.MoveDirectionX!=0)and(other.MoveDirectionY==0)
		{
			if(other.MoveDirectionX==1)
			{
				if(xp=-1)
				{
					xp=1;
				}
				else if xp=1
				{
					xp=-1;
				}
				else{
					if(yp=-1)
					{
						yp=1;
					}
					else if yp=1 
					{
						yp=-1;
					}
					else{ xp=-1; }
				}
			}
			else if(other.MoveDirectionX==2)
			{
				if(xp=1)
				{
					xp=-1;
				}
				else if xp=-1
				{
					xp=1;
				}
				else{
					if(yp=-1)
					{
						yp=1;
					}
					else if yp=1 
					{
						yp=-1;
					}else{
						xp=1;
					}
				}
			}
		}
		else if(other.MoveDirectionX==0)and(other.MoveDirectionY!=0)
		{
			if(other.MoveDirectionY==1)
			{
				if(yp=-1)
				{
					yp=1;
				}
				else if yp=1
				{
					yp=-1;
				}
				else{
					if(xp=-1)
					{
						xp=1;
					}
					else if xp=1
					{
						xp=-1;
					}
					else{
						yp=-1;
					}
				}
			}
			if(other.MoveDirectionY==2)
			{
				if(yp=1)
				{
					yp=-1;
				}
				else if yp=-1
				{
					yp=1;
				}
				else{
					if(xp=-1)
					{
						xp=1;
					}
					else if xp=1
					{
						xp=-1;
					}else{	
						yp=1;
					}
				}
			}		
		}
		hurt=true;
		isMove=true;
		var lefttime=0;
		if(movetimer!=0)
		{
			lefttime=unit-movetimer;
		}
		movetimer=unit+lefttime;
		pausetimer=100;
		kick=0;
	}
}