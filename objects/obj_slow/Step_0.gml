/// @description Insert description here

var inst = instance_find(polka_pt, 0);
if inst == noone {
	inst = instance_find(polka_pt_rc, 0);
}

if inst != noone {
	if not inst.is_slow {
		if place_meeting(x, y, inst) {
			inst.alarm[1] = slow_length;
			inst.is_slow = true;
		}
	}
}