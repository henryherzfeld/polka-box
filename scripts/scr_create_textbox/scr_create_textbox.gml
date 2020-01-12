///@description create_textbox
///@arg text
///@arg name
///@arg potrait
///@arg scripts

var tbox = instance_create_layer(0, 0, "Text", obj_textbox)

with (tbox) {
	text = argument[0];
	name = argument[1];
	portrait = argument[2];
	scripts = argument[3];
}
return tbox;