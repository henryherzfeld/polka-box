box=spr_textbox2;
frame=spr_portrait_frame;
portrait=spr_portrait;
namebox=spr_namebox;

box_width=sprite_get_width(box);
box_height=sprite_get_width(box);
port_width=sprite_get_width(portrait);
port_height=sprite_get_height(portrait);
namebox_width=sprite_get_width(namebox);
namebox_height=sprite_get_height(namebox);

port_x=(room_width-box_width-port_width)*0.5;
port_y=(room_height*0.98)-port_height;
box_x=port_x+port_width;
box_y=port_y;
namebox_x=port_x;
namebox_y=box_y-namebox_height;

x_buffer=12;
y_buffer=8;
text_x=box_x+x_buffer;
text_y=box_y+y_buffer;
name_text_x=namebox_x+(namebox_width/2);
name_text_y=namebox_y+(namebox_height/2);

text="WOW SCIENCE IS COOL AND GREAT AND BLAH BLAH BALLSFDLJFSDKLGNSLD";
name="Science Bot";

text_col=c_black;
name_text_col=c_black;
font=font_comic;
text_height=string_height("M");