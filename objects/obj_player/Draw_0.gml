/// @description Draw Player and item

draw_self();			//Draw Player
//If we are holding an item
if (itemEquiped != noone) {
		var itemSprite = InventoryManager.itemDef[itemEquiped,enum_item_state.sprite];	//get the Sprite data of the item from Inventory Manager
		draw_sprite(itemSprite,0,x,y);//Draw the equiped Item
	}