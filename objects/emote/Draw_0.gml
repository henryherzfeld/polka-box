/// @description Insert description here


if sprite_draw == spr_question_mark {
	draw_sprite(sprite_draw, 0, char.x+12, char.y-12);
} else {
	draw_sprite_stretched(sprite_draw, subimg_idx, char.x+20, char.y-24, sprite_get_width(sprite_draw)/3, sprite_get_height(sprite_draw)/3);
}