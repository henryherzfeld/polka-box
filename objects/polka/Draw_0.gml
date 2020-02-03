/// @description Draw Player and item

draw_self();			//Draw Player
//If we are holding an item
if (itemEquiped != noone) {
		var itemSprite = InventoryManager.itemDef[itemEquiped,enum_item_state.sprite];	//get the Sprite data of the item from Inventory Manager
		draw_sprite(itemSprite,0,x,y);//Draw the equiped Item
	}
/*
if(interactable){
	draw_set_valign(fa_center);										//Draw the text from the bottom
	draw_set_halign(fa_center);										//Draw the text from the left
	draw_text(x+12, y-10, "E")	
}*/

if(npc != noone and !in_dialogue){
	draw_sprite(spr_speech_bubble, 0, npc.x - 14, npc.y - 26);	
}

if(chest and !in_dialogue){
	draw_sprite(spr_up_arrow, 0, chest.x + 12, chest.y - 15)
}