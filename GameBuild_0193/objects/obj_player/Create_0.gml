/// @description Insert description here
// You can write your code in this editor
globalvar playerx;
globalvar playery;
globalvar moves;
moves=0;
playerx=0;
playery=0;

//Drawing
bop = false;
sprite=spr_player_idle;
xscale=1;
yscale=1;

//Movement
player_sp_build=30;
isMove=false;
movetimer=0;
pausetimer=0;
xp = 0;
yp = 0;

cooldown=0;


//Health
healthhalf=true;
healthfull=true;
hurt=false;


gamepad_set_axis_deadzone(0, 0.4);