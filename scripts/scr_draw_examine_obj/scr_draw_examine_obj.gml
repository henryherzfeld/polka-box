///@description scr_draw_examine_obj
///@arg0 object
function scr_draw_examine_obj() {
	var object = argument[0];

	var sprite = object.sprite_index;
	var description = object.description;

	object.draw_examine_box = true;

	var examine_box = instance_create_layer(0, 0, "Text", ui_examine_box);

	with(examine_box){
		examine_box.sprite = sprite;
		examine_box.description = description;
		examine_box.object = object;
	}


}
