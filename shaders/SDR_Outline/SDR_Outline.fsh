//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 sprite_size;

void main()
{
    float alpha = 0.0;
   
    //Add alpha depending on the pixels surround it
    alpha += texture2D( gm_BaseTexture, v_vTexcoord + vec2(-sprite_size.x, 0.0) ).a; //Left
    alpha += texture2D( gm_BaseTexture, v_vTexcoord + vec2(sprite_size.x , 0.0) ).a; //Right
    alpha += texture2D( gm_BaseTexture, v_vTexcoord + vec2(0.0, sprite_size.y) ).a; //Down
    alpha += texture2D( gm_BaseTexture, v_vTexcoord + vec2(0.0, -sprite_size.y) ).a; //Up
   
    //Now draw the results
    gl_FragColor = vec4(0.0,0.0,0.0, alpha);
}