/// @description Insert description here
// You can write your code in this editor



if(place_meeting(x,y,obj_block01))or(place_meeting(x,y,obj_block03_timed))or(place_meeting(x,y,obj_block05_slippy))
{
	blockfell = instance_place(x,y,obj_block_control);
	bin = id;
	with(blockfell)
	{
		checkkick=false;
		filledid=layer_sprite_create("PressurePlatesAndHoles",other.x,other.y,spr_hole_filled);
		obj_undoaction.UndoArray[UndoNum]=new Undo(obj_player.x, obj_player.y, blockx, blocky, other.blockfell, bin);
		instance_deactivate_object(other.blockfell);
	}
	instance_deactivate_object(bin);
}
	
	
