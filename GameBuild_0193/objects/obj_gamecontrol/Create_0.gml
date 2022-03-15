
globalvar bin;
intro=false;
global.gamePause=false;
ZoneName=["Hallways","Kitchen","Dinning","Bathroom","Bedroom"];

keyup=0;
keydown=0;

PauseOption=[MainMenu66,Restart,Resume]; 
PauseSelect=0;


menu_top = 260;
menu_bottom =700;
menu_hover=0;
menu_item_h=font_get_size(fnt_menu);

room_goto(ROOM_START);

shakelength=30;
shake = false;
view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);
shaketimer=shakelength;

fullscreen = window_get_fullscreen();


