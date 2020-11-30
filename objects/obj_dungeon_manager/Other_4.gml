/// @description

for(var i = 0; i < n_rooms; i++){
	if room == rooms[i] {
		in_procedural_room = true;
	}
}

if in_procedural_room {

	next_room = rooms[irandom_range(0, n_rooms-1)];

	while next_room == room {
		next_room = rooms[irandom_range(0, n_rooms-1)];
	}
}