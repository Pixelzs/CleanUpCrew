/// @description Check and Move
// You can write your code in this editor

//Temp Variables
var xsp=0;
var ysp=0;

//Continually check if player affected instance that is a child to this parent, via a function
if(checkkick==false)
{
	bxscale=1;
	byscale=1;
	if(bxp!=0)or(byp!=0) //Begin Movement
	{
		checkkick=true;
		btimer=unit;
	}
}
//Movement
if(checkkick==true)
{
	//Check what type of block player affected
	if(slippy!=1)
	{
		if timed
		{
			if timekick!=0
			{
				//Get Direction
				if (bxp!=0)and(byp==0)
				{
					if(bxp=1)
					{
						xsp=1;
					}
					else if(bxp=-1)
					{
						
						xsp=-1;
					}
					xsp=xsp*b_buildsp;
				}
				if(bxp==0)and(byp!=0)
				{
					if(byp=1)
					{
						ysp=1;
					}
					else if(byp=-1)
					{
						ysp=-1;
					}
					ysp=ysp*b_buildsp;
				}
			}
		}
		if timed!=1
		{
			
			if (bxp!=0)and(byp==0)
			{
				if(bxp=1)
				{
					xsp=1;
				}
				else if(bxp=-1)
				{
					xsp=-1;
				}
				xsp=xsp*b_buildsp;
			}
			if(bxp==0)and(byp!=0)
			{
				if(byp=1)
				{
					ysp=1;
				}
				else if(byp=-1)
				{
					ysp=-1;
				}
				ysp=ysp*b_buildsp;
			}
		}
	}
	if(slippy=1)
	{
		xsp=bxp*b_buildsp;
		
		ysp=byp*b_buildsp;
	}
	
	//Streches and squeezes sprite to give movement more feel
	if btimer < unit and btimer > unit/2
	{
		if bxscale <= 1.32
		{
			bxscale=bxscale+0.08;
			byscale=byscale+0.08;
		}
	}
	if btimer < unit/2
	{
		if bxscale-0.1 > 0.8
		{
			bxscale=bxscale-0.1;
			byscale=byscale-0.1;
		}
	}

		
	
	//Check for wall, if there is stop movement
	if(place_meeting(x+xsp,y,obj_wall01))
	{
		xsp=0;
		if slippy
		{
			slippy = 0
		}
	}
	
	if(place_meeting(x,y+ysp,obj_wall01))
	{
		ysp=0;
		if slippy
		{
			slippy = 0
		}
	}
	//Move instance
	x+=xsp;
	y+=ysp;
	
	btimer-=b_buildsp;
	//Loop until timer is less than 0
	if(btimer<=0)
	{
		if timed && timekick!=0
		{
			timekick--;
		}
		
		if slippy!=1 or timed
		{
			btimer=0;
			checkkick=false;
			bxp=0;
			byp=0;
		}
	}	
}

//Check if variable in block02 is true
with(obj_block02_colours)
{
	if(ColourB==true)
	{
		image_index=1;//change to 2nd frame
	}
}
