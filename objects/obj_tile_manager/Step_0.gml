/// @description Insert description here
if(!game.pause){
	x_proj = polka.x + (sprite_get_width(polka.sprite_index)/2);
	y_proj = polka.y + (sprite_get_height(polka.sprite_index)/2);

	switch(polka.facing){
		case 0: y_proj -= cell_size + 10; break;
		case 90: x_proj += cell_size; break;
		case 180: y_proj += cell_size + 10; break;
		case 270: x_proj -= cell_size; break;
	}
}