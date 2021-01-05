/// @description Insert description here

var tree_idx = curr_tree mod n_trees;

var tree_w = trees_w[tree_idx];
var tree_h = trees_h[tree_idx];

if room == second_village_planting {
	if not lock {
		if outline and polka.curr_tree == self {
			//Outline shader
			sprite_scale = shader_get_uniform(SDR_Outline, "sprite_size");
			tex = sprite_get_texture(trees[tree_idx],0);
			//Texel
			tex_h = texture_get_texel_height(tex);
			tex_w = texture_get_texel_height(tex);
	
			shader_set(SDR_Outline);
			shader_set_uniform_f(sprite_scale, tex_w, tex_h);

			draw_sprite(trees[tree_idx], 0, x-tree_w/2, y-tree_h/2);
			shader_reset();
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(trees[tree_idx], 0, x-tree_w/2, y-tree_h/2, 1, 1, 0, c_black, .9);
			gpu_set_blendmode(bm_normal);
			draw_sprite_ext(trees[tree_idx], 0, x-tree_w/2, y-tree_h/2, 1, 1, 0, c_white, .7);
	
		} else {
			draw_sprite(trees[tree_idx], 0, x-tree_w/2, y-tree_h/2);
		}
	} else {
		sprite_scale = shader_get_uniform(SDR_Outline, "sprite_size");
		tex = sprite_get_texture(trees[tree_idx],0);
		//Texel
		tex_h = texture_get_texel_height(tex);
		tex_w = texture_get_texel_height(tex);
	
		shader_set(SDR_Outline);
		shader_set_uniform_f(sprite_scale, tex_w, tex_h);
		draw_sprite(default_, 0, x-trees_w[0]/2, y-trees_h[0]/2);
		shader_reset();
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(default_, 0, x-trees_w[0]/2, y-trees_h[0]/2, 1, 1, 0, c_black, .9);
		gpu_set_blendmode(bm_normal);
		draw_sprite_ext(default_, 0, x-trees_w[0]/2, y-trees_h[0]/2, 1, 1, 0, c_white, .7);
	}
} else {
	draw_sprite(trees[tree_idx], 0, x-tree_w/2, y-tree_h/2);
}






