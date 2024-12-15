extern vec4 from;
extern vec4 to;
extern number scale;
vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords )
{
    return Texel(tex, texture_coords) * (from + (to - from) * mod(texture_coords.y / scale, 1.0)) * color;
}