/// @function scr_badge_add_data
/// @description Add badge with the provided properties in the badge_def array
/// @param {enum}	type  Type of the item
/// @param {sprite} sprite_col Sprite used for the item to be shown in badges
/// @param {sprite} sprite_bw Sprite used for the item to be shown in badges
/// @param {string} name Name of the object
/// @param {string} description
/// @param {boolean} acquired
function scr_badge_add_data() {

	var type	= argument[0];
	var sprite_col  = argument[1];
	var sprite_bw  = argument[2];
	var name	= argument[3];
	var description = argument[4];
	var acquired	= argument[5];

	badge_def[type, enum_badge_state.sprite_col] = sprite_col;
	badge_def[type, enum_badge_state.sprite_bw] = sprite_bw;
	badge_def[type, enum_badge_state.name] = name;
	badge_def[type, enum_badge_state.description] = description;
	badge_def[type, enum_badge_state.acquired] = acquired;


}
