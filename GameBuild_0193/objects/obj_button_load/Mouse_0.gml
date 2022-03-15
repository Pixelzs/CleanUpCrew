/// @description Insert description here
// You can write your code in this editor
var loaddata  = 0;
if(file_exists("savegame.ini"))
{
	ini_open("savegame.ini");
	loaddata = ini_read_real("savegame","level",room);
	room_goto(loaddata);
	ini_close();
}
