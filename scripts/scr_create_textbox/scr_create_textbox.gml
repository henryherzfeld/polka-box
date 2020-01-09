///@description create_textbox
///@arg text


var tbox = instance_create_layer(0, 0, "Text", obj_textbox)

with (tbox) {
	text = argument[0];
}
return tbox;