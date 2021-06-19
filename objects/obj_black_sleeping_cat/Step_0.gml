/// @description Insert description here
// You can write your code in this editor



xx += sign_*0.25;
yy -= 0.25;
scale -= 0.0125;

if not -yy mod 100 sign_ = irandom_range(-1, 1);

if -yy > reset {
	reset = irandom_range(min_x, max_x);
	xx = 0; yy = 0;
	scale = 1;
}

