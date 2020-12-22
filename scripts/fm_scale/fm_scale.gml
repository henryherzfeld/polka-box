var swidth,sheight,gwidth,gheight;

swidth = display_get_width();
sheight = display_get_height();

gwidth = fm_game_width();
gheight = fm_game_height();

if (fm_mobile()) { 
   xratio = swidth / gwidth;
   yratio = sheight / gheight;
   
   fm_maxscalex = min(xratio,yratio);
   
   // force minor xratio difference (portrait only)
   if (global.force_xratio) {
      if (fm_maxscalex == yratio && gwidth < gheight && room != rm_flip) {
         if (xratio - yratio <= 0.10416667) { // 50/480 100/960
            fm_maxscalex = xratio;
         }
      }
   }
   
   fm_maxscaley = fm_maxscalex;
}
