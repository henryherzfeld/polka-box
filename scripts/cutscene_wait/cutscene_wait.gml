///description cutscene_wait
///@arg seconds

seconds = argument[0];

timer++;

if(timer >= argument0 * room_speed){
	timer = 0;
	scene++;
}