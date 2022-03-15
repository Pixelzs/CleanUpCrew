/// @description Insert description here
// You can write your code in this editor
intro=true;
global.gamePause=false;

if(room!=MainMenu) && (room!=OptionsMenu) && (room!=rm_inital) && (room!=CompleteMenu)
{
	RoomName=string(room_get_name(room));
	Zonestring=string_char_at(RoomName,4);
	Levelstring=string_char_at(RoomName,6);
	ZoneNumber=int64(Zonestring);
	ZoneIndex=ZoneNumber-1;
}