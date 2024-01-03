event_inherited();
draw_base_planet(light_follow_mouse(),,
	[102, 176, 199, 1],
    [102, 176, 199, 1],
    [52, 65, 157, 1]
);

draw_land_mass(light_follow_mouse(),,,,,,,, 0.5);
draw_cloud_layer(light_follow_mouse());
draw_atmosphere_layer();