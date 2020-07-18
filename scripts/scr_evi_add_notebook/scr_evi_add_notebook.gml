/// @function scr_add_data(type);
/// @description Add item to evidence, return true on success and false in faliure
/// Checks if a slot is empty, if empty then assign it the item, else failure
/// @arg0 {enum} type Type of the item
/// @arg1 {bool} draw evi notification

var itemType = argument0;
var indexAddedAt = 0;
var draw = argument1;



//Process the input manager
with (obj_notebook) {
	//Check if the item already exists, if not exists save it to the empty index and save the index in the variable
	if (array_find_index(evidence_slot,itemType) == -1) {
	    //Add Item into the notebook
		indexAddedAt = array_replace_value(evidence_slot,enum_evi_type.none,itemType);
		if draw { scr_nb_add_evi_animation(itemType); obj_overlay.new_evidence = obj_notebook.evi_def[itemType, enum_evi_state.sprite]; }
	}

	//If the item is added to the notebook, than increase the amount of the item in notebook
	if (indexAddedAt != -1) {
			return true;
		}
	}
return false;