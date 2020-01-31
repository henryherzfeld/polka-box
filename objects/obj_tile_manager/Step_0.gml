/// @description Insert description here

x_proj = polka.x + (sprite_get_width(polka.sprite_index)/2);
y_proj = polka.y + (sprite_get_height(polka.sprite_index)/2);

switch(polka.facing){
	case 0: y_proj -= projection_distance + 10; break;
	case 90: x_proj += projection_distance; break;
	case 180: y_proj += projection_distance + 10; break;
	case 270: x_proj -= projection_distance; break;
}