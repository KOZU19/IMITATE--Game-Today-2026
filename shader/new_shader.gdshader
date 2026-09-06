shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float aspect = 1.7777;
uniform vec2 mouse_pos = vec2(0.5);
uniform float mouse_range = 0.2;

void fragment() {
	vec2 uv = UV -mouse_pos;
	uv = vec2(uv.x, uv.y / aspect);
	float mask =  mouse_range-length(uv);
	mask = smoothstep(0, 0.35, mask);
	COLOR. rgb = mix (vec3(0.0),texture(SCREEN_TEXTURE, SCREEN_UV).rgb, mask);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
