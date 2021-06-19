   /// @description Villy Poppy - dialogue part 1

event_inherited();

portraits[enum_portrait.angry] = spr_portrait_poppy_angry;
portraits[enum_portrait.happy] = spr_portrait_poppy_happy;
portraits[enum_portrait.neutral] = spr_portrait_poppy_neutral;
portraits[enum_portrait.sad] = spr_portrait_poppy_sad;
portraits[enum_portrait.chattering] = poppy_teeth_chattering_or_rattled;
portraits[enum_portrait.awkward_glance] = poppy_awkward_glance;
portraits[enum_portrait.crying] = poppy_crying;
portraits[enum_portrait.dejected] = poppy_dejected_disappointed;
portraits[enum_portrait.delighted] = poppy_delighted;
portraits[enum_portrait.disgusted] = poppy_disgusted;
portraits[enum_portrait.evil_laugh] = poppy_evil_laugh;
portraits[enum_portrait.evil_smile] = poppy_evil_smile;
portraits[enum_portrait.excited] = poppy_excited;
portraits[enum_portrait.frightened] = poppy_frightened;
portraits[enum_portrait.furious] = poppy_furious;
portraits[enum_portrait.good_mood] = poppy_good_mood;
portraits[enum_portrait.hesitant_uneasy] = poppy_hesitant_uneasy;
portraits[enum_portrait.hysterical_laugh] = poppy_loud_or_hysterical_laugh;
portraits[enum_portrait.overjoyed] = poppy_overjoyed;
portraits[enum_portrait.pleasantly_surprised] = poppy_pleasantly_surprised
portraits[enum_portrait.joy_in_misfortune] = poppy_pleasure_at_others_misfortune;
portraits[enum_portrait.revelation] = poppy_relevation;
portraits[enum_portrait.rolling_eyes] = poppy_rolls_eyes;
portraits[enum_portrait.sad_smile] = poppy_sad_smile;
portraits[enum_portrait.showing_affection] = poppy_showing_affection;
portraits[enum_portrait.skeptical] = poppy_skeptical;
portraits[enum_portrait.smug] = poppy_smug;
portraits[enum_portrait.stern] = poppy_stern;
portraits[enum_portrait.stunned] = poppy_stunned_baffled;

walk_back = spr_poppy_walk_back;
walk_front  = spr_poppy_walk_front;
walk_left = spr_poppy_walk_left;
walk_right = spr_poppy_walk_right;

stand_back = spr_poppy_stand_back;
stand_front = spr_poppy_stand_front;
stand_left = spr_poppy_stand_left;
stand_right = spr_poppy_stand_right;

name = "Villy Poppy";
portrait = spr_portrait_poppy;
textbox_audio = snd_prompt;

//post 1st minigame plant watering
watering = false;

anim_w_count = 0;

water_x = [520, 610, 905, 779];
water_y = [1167, 1280, 1148, 1239];
water_facing = [dir.right, dir.left, dir.up, dir.right];

n_coords = array_length_1d(water_x);
rand_coord = 0;
water_coords = [water_x[rand_coord], water_y[rand_coord]];

water_spd = 2;
water_time = 750;