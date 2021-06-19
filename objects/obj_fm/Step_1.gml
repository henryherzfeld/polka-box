// dpi management for GMS1

if (global.GMS2 == false) {
   dj_var_set("mouse_x", mouse_x * fm_dpi);
   dj_var_set("mouse_y", mouse_y * fm_dpi);
}

