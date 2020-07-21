 /// @description Villy Weeraway

event_inherited();

portraits[enum_portrait.angry] = spr_portrait_weeraway_angry;
portraits[enum_portrait.happy] = spr_portrait_weeraway_happy;
portraits[enum_portrait.neutral] = spr_portrait_weeraway_neutral;
portraits[enum_portrait.sad] = spr_portrait_weeraway_sad;

name = "Villy Weeraway";

if not scr_check_objective(enum_objective_type.ero_poppy0) crying = true;
else crying = false;

walk_front = spr_polka_walk_front;
walk_back = spr_polka_walk_back;
walk_left = spr_polka_walk_left;
walk_right = spr_polka_walk_right;

stand_front = spr_polka_stand_right;
stand_back = spr_polka_stand_right;
stand_left = spr_polka_stand_right;
stand_right = spr_polka_stand_right;