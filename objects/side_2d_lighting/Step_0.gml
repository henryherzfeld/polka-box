/// @description Insert description here

//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls, we use the diagonals instead (Optimization)
vertex_begin(vb,vf);
var _vb = vb;
with(obj_ground){
    Quad(_vb,x,y,x+sprite_width,y+sprite_height); //Negative Slope Diagonal Wall
    Quad(_vb,x+sprite_width,y,x,y+sprite_height); //Positive Slope Diagonal Wall
}
vertex_end(vb);