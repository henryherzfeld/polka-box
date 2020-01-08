/// @description Use the item which we have equiped

if (itemEquiped != noone) {
	
	switch (itemEquiped) {
	    case enum_item_type.shovel:
			//Use Shovel
			instance_create_layer(x,y,"Instances",obj_soil_hole);		//Createing an instance with hole sprite assigneed
			itemEquiped = noone;	
	        break;
			
	    case enum_item_type.pitchfork:
			//Use Shovel
			instance_create_layer(x,y,"Instances",obj_soil_grass);		//Createing an instance with hole sprite assigneed
			itemEquiped = noone;										//Item is destroy after single use
	        break;
			
	    default:
	        // code here
	        break;
	}

}