/// @description UI
//Intro
//if(intro) && ((room!=MainMenu) or (room!=OptionsMenu) or (room!=CompleteMenu))
//{
//	draw_set_color(c_black);
//	draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(),false);
//	draw_set_font(fnt_hud);
//	draw_set_color(c_white);
//	draw_set_halign(fa_center);
//	draw_set_valign(fa_middle);
//	draw_text(0,0,"A Bloody Good Start");
//	alarm[0]=10;
//}
//HUD
if (!global.gamePause) && (!instance_exists(obj_button_start)) && (!instance_exists(obj_end))
{
	draw_set_font(fnt_hud);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_sprite_ext(LeftHUD, 0, 0, 0, 0.2, 0.2, 0, -1,1);
	draw_text(150,60,ZoneName[ZoneIndex]);
	draw_text(150,130,"Level "+Levelstring);

	draw_sprite_ext(RightHUD, 0, display_get_gui_width(), 0, 0.2, 0.2, 0, -1,1);
	draw_text(1650,60,"Move");
	draw_text(1760,150,string(moves));
	

	if(obj_undoaction.numberofundo=0) and (obj_undoaction.reset=false)
	{
		draw_sprite_ext(Undo, 0, 400, display_get_gui_height(), 0.3, 0.3, 0, -1,1);
	}
	else{
		draw_sprite_ext(Undo, 1, 400, display_get_gui_height(), 0.3, 0.3, 0, -1,1);
	}
	
	if(obj_undoaction.numberofundo<=1) and (obj_undoaction.reset=false)
	{
		draw_sprite_ext(Undo, 0, 250, display_get_gui_height(), 0.3, 0.3, 0, -1,1);
	}
	else{
		draw_sprite_ext(Undo, 1, 250, display_get_gui_height(), 0.3, 0.3, 0, -1,1);
	}
	
	if(obj_undoaction.numberofundo<=2)
	{
		draw_sprite_ext(Undo, 0, 100, display_get_gui_height(), 0.3, 0.3, 0, -1,1);
	}
	else{
		draw_sprite_ext(Undo, 1, 100, display_get_gui_height(), 0.3, 0.3, 0, -1,1);
	}
	
	
	
	
}
//Pause
if (global.gamePause)
{
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	for (var i = 0; i < array_length(PauseOption); i++)
	{
		var _print = "";
		var _glow = 0;
		var _sizex = 0.3
		var _sizey = 0.3
		if (i == PauseSelect)
		{
			if(keyEnter)
			{
				_glow = 2;
				_sizex-=0.1;
				_sizey-=0.1;
			}
			else
			{
				_glow = 1;
			}
			_print = PauseOption[i];
			
		}
		else{
			_print = PauseOption[i];
			_glow=0;
		}
		
		
		draw_sprite_ext(_print, _glow, display_get_gui_width()*0.5, display_get_gui_height()*0.6-(menu_item_h*(i*1.5)), _sizex, _sizey, 0, -1, 1);

	}
}