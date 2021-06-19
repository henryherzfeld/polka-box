/// @description Insert description here

idle_movement = true;
moving = false;

spd = .5;
idle_range = 5;
idle_sleep_max = 500;
idle_sleep_min = 200;
counter = irandom_range(idle_sleep_min, idle_sleep_max);

facing = 180;

x_move = 0;
y_move = 0;

x_dest = -1;
y_dest = -1;

xx = x;
yy = y;

detection_radius = 100;
engaged = false;
engage_time = 100;
engage_count = -1;

fire_count = -1;
fire_time = 200;

knock_count = -1;
knock_time = 30;