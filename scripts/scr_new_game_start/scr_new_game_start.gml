///@description scr_new_game_start
if(file_exists("savedgame.sav")){ file_delete("savedgame.sav") }
instance_create_layer(0, 0, "Instances", obj_intro);