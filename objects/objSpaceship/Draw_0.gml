direction += (keyboard_check(vk_left) - keyboard_check(vk_right));
image_angle = direction;
camera_set_view_pos(cam, x - (camera_get_view_width(cam) div 2), y - (camera_get_view_height(cam) div 2));
if (keyboard_check(vk_up) || device_mouse_check_button(0,mb_left)) {
	if (spd < 20)  {
		spd += 0.25;
	}
	
	move_towards_point(x + lengthdir_x(20, direction), y + lengthdir_y(20, direction), spd);
} else if (keyboard_check(vk_down) || device_mouse_check_button(0,mb_right)) {
	if (spd > 0) {
		spd -= 0.75;
	}
	
	if (spd < 0) {
		spd = 0; speed = spd;
	}
}

u_time += 0.01;
fx_set_parameter(layer_tint, "g_TintCol", tint_get_color_array());
var intensity = (0.85 + (spd / 10));
fx_set_parameter(layer_tint, "g_Intensity", intensity);

draw_self();