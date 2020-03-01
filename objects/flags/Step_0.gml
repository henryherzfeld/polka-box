/// @description Insert description here

if(find_weeraway){
	if(objective != "Find Weeraway"){
		objective = "Find Weeraway"
		event = true;
	}
}

if(find_poppy){
	if(objective != "Find out why the crops are dying"){
		objective = "Find out why the crops are dying"
		event = true;
	}
	objective = "Find out why the crops are dying"
}

if(examine_crops){
	if(objective != "0/1 clues found"){
		objective = "0/1 clues found"
		event = true;
	}
	objective = "0/1 clues found"
}

if(report_crops_to_poppy){
	if(objective != "1/1 clues found"){
		objective = "1/1 clues found"
		event = true;
	}
	objective = "1/1 clues found"	
}


if(measure_soil_moisture and room != fin){
	if(objective != "Measure the soil's moisture"){
		objective = "Measure the soil's moisture"
		event = true;
	}
	objective = "Measure the soil's moisture"
}

if(room = fin){
	if(objective != "Finish"){
		objective = "Finish"
		event = true;
	}
}

if(event){
	show_debug_message("event fired");
	send_event("Objective", objective, "na")
	progress += 1;
	show_debug_message(progress);
	event = false;
}