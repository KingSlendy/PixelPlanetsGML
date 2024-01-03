function tint_get_color_array() {
	var xpos = (x / 5000);
	var ypos = (y / 5000);
	var col_array = [
		cos(xpos + u_time),
		cos(ypos + u_time),
		0.5 + 0.5 * sin(xpos + ypos + u_time),
		0.5
	];
	
	var col_hue = ((xpos + ypos + u_time) / 100) * 255;
	var hsv_col = make_color_hsv(col_hue, 200, 200);
	var col_r = color_get_red(hsv_col);
	var col_g = color_get_green(hsv_col);
	var col_b = color_get_blue(hsv_col);
	
	if (col_r != 0) {
		col_array[0] = col_r / 255;
	} else {
		col_array[0] = 0;
	}
	
	if (col_g != 0) {
		col_array[1] = col_g / 255;
	} else {
		col_array[1] = 0;
	}
	
	if (col_b != 0) {
		col_array[2] = col_b / 255;
	} else {
		col_array[2] = 0;
	}
	
	col_array[3] =  0.5;
	return col_array;
}