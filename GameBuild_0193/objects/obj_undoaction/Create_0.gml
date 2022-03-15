/// @description Array
// You can write your code in this editor

//Create Array constructor
globalvar UndoNum;
UndoNum=0;
UndoArray[UndoNum]=new Undo(obj_player.x, obj_player.y, blockid.x, blockid.y, blockid, bin);//Contructor set to save coordinates and instance id
numberofundo=0;
reset=false;

//Check for object's existense in room
if(instance_exists(obj_hole))
{
	holes=true;
}
else{
	holes=false;
}