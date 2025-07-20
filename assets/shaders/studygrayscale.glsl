float YUVval(vec4 _rgb)
{
	return dot(vec3(0.299, 0.587, 0.114), _rgb.rgb);
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords)
{
	vec4 texcol = Texel(tex, texture_coords);
	float greyval = YUVval(texcol);	
	vec3 greyCol = vec3(greyval,greyval,greyval);
	vec3 finalCol = mix(texcol.rgb,greyCol,0.40000000596046448);
    return vec4(finalCol, texcol.a);
}