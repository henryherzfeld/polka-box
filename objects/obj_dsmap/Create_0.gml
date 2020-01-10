map= ds_map_create();
map[? "menu"]=["Greetings!",["ask","tell"]];
//ASK BRANCH
map[? "ask"]=["What do you want to ask me?",["a1","a2"]];
	map[? "a1"]=["Who?","The farmer.",["a1","a2"]];
	map[? "a2"]=["What?","The bunch of bananas.",["a1","a2"]];
	map[? "a3"]=["When?","A few days ago...",["a31","a32"]];
		map[? "a31"]=["Can you be more specific?","No.",["a31","a32"]];
		map[? "a32"]=["Like three days ago?","Yeah, seems right.",["a31","a32"]];
//TELL BRANCH
map[? "tell"]=["What do you want to tell me?",["t1","t2"]];
	map[? "t1"]=["Pluto isn't a planet.","Really? Wow.",["t1","t2"]];
	map[? "t2"]=["I had Cheerios for breakfast!","That's nice.",["t1","t2"]];