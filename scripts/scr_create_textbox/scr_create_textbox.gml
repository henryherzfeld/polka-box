///@description create_textbox
///@arg text
///@arg name
///@arg portrait
///@arg scripts
///@arg *character
function scr_create_textbox() {

	var tbox = instance_create_layer(0, 0, "Text", obj_textbox)

	with (tbox) {
		text = argument[0];
		name = argument[1];
		portrait = argument[2];
		scripts = argument[3];
		if argument_count > 4 {
			char = argument[4]
		}
	}
	return tbox;


}
