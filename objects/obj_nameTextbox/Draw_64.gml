//Draw Box
draw_sprite(box,0,box_x+(port_x/2),(box_y+port_height+namebox_height*1.75));

//Draw Portrait Back
draw_sprite(frame,0,port_x,port_y);

//Draw Portrait
draw_sprite(portrait,0,port_x,port_y);

//Draw Portrait Frame
draw_sprite(frame,1,port_x,port_y);

//Draw Namebox
draw_sprite(namebox,0,namebox_x,namebox_y);

//-----------TEXT-----------
draw_set_font(font_comic);

//Draw Name
var c=name_text_col;
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_text_color(name_text_x, name_text_y,name,c,c,c,c,1);
draw_set_halign(fa_left); draw_set_valign(fa_top);

//Draw Text
draw_text_ext_color(box_x, box_y,text,text_height,box_width,c,c,c,c,1);