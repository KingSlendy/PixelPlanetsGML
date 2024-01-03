function light_follow_mouse() {
	return [(mouse_x - x) / sprite_width + 0.5, (mouse_y - y) / sprite_height + 0.5];
}