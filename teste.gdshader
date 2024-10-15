shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    // Get the screen's light value at this fragment
    vec4 light = texture(SCREEN_TEXTURE, SCREEN_UV);
    // If the light intensity is low (shadow), show the fragment; else hide it
	COLOR = texture(TEXTURE, UV);
}
