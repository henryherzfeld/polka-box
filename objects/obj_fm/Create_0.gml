// config
global.GMS2 = true; // set true when using GMS2

global.desktop_scale = 99; // desktop scale limiter; try values like 0.75 or 99
global.force_xratio = true;
global.sitelock_enabled = false;

// init
fm_start();
fm_scale();

application_surface_enable(false);
device_mouse_dbclick_enable(false);
randomize();

// audio system
sound_init();
global.audio_stage = 0;

// sitelock
var valid = false;

if (global.sitelock_enabled) {
   var valid_domains = ds_list_create();
   
   ds_list_add(valid_domains,"127.0.0.1"); // localhost (recommended)
   ds_list_add(valid_domains,"example.com");
   // whitelist domains here...
   // whitelist domains here...
   // whitelist domains here...
   
   var site = url_get_domain();
   
   for (var i = 0; i < ds_list_size(valid_domains); i++) {
      if (string_count(ds_list_find_value(valid_domains,i),site) > 0) {
         valid = true;
         break;
      }
   }
   
   ds_list_destroy(valid_domains);
   
   // sitelock triggered
   if (!valid) {
      show_message("This game is hosted on an invalid domain: " + site);
   }
}
else valid = true;

// next room
if (valid) room_goto_next();

