function draw_atmosphere_layer() {
	var color1 = [173, 216, 230, 0.25];
	var color2 = [0, 127, 255, 0.35]
	var color3 = [0, 0, 128, 0.45];
	
	shader_set(shdAtmosphereLayer);
	shader_set_uniform_f(shader_get_uniform(shdAtmosphereLayer, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdAtmosphereLayer, "color"), color1[0] / 255, color1[1] / 255, color1[2] / 255, color1[3]);
	shader_set_uniform_f(shader_get_uniform(shdAtmosphereLayer, "color2"), color2[0] / 255, color2[1] / 255, color2[2] / 255, color2[3]);
	shader_set_uniform_f(shader_get_uniform(shdAtmosphereLayer, "color3"), color3[0] / 255, color3[1] / 255, color3[2] / 255, color3[3]);
	draw_self();
	shader_reset();
}

function draw_base_gas_planet(light_pos = [0.39, 0.7], cloud_cover = 0.538,
	base_color = [240, 181, 65, 1],
	outline_color = [207, 117, 43, 1],
	shadow_base_color = [171, 81, 48, 1],
	shadow_outline_color = [125, 56, 51, 1],
	stretch = 1.0, rotation_speed = 1, rotation = 0, cloud_curve = 1.3
) {
	shader_set(shdBaseGasPlanet);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "cloud_cover"), cloud_cover);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "base_color"), base_color[0] / 255, base_color[1] / 255, base_color[2] / 255, base_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "outline_color"), outline_color[0] / 255, outline_color[1] / 255, outline_color[2] / 255, outline_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "shadow_base_color"), shadow_base_color[0] / 255, shadow_base_color[1] / 255, shadow_base_color[2] / 255, shadow_base_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "shadow_outline_color"), shadow_outline_color[0] / 255, shadow_outline_color[1] / 255, shadow_outline_color[2] / 255, shadow_outline_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "stretch"), stretch);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "time_speed"), rotation_speed);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "rotation"), rotation);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "cloud_curve"), cloud_curve);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdBaseGasPlanet, "time"), time);
	draw_self();
	shader_reset();
}

function draw_base_planet(light_pos = [0.39, 0.7], light_intensity = 0.1,
	color1 = [155, 158, 184, 1],
	color2 = [71, 97, 124, 1],
	color3 = [53, 57, 85, 1],
	rotation_speed = 0.1, rotation = 0
) {
	shader_set(shdBasePlanet);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "lightIntensity"), light_intensity);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "color1"), color1[0] / 255, color1[1] / 255, color1[2] / 255, color1[3]);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "color2"), color2[0] / 255, color2[1] / 255, color2[2] / 255, color2[3]);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "color3"), color3[0] / 255, color3[1] / 255, color3[2] / 255, color3[3]);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "time_speed"), rotation_speed);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "rotation"), rotation);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdBasePlanet, "time"), time);
	draw_self();
	shader_reset();
}

function draw_cloud_layer(light_pos = [0.39, 0.7], cloud_cover = 0.546,
	base_color = [225, 242, 255, 1],
	outline_color = [192, 227, 255, 1],
	shadow_base_color = [94, 112, 165, 1],
	shadow_outline_color = [64, 73, 115, 1],
	stretch = 2.5, rotation_speed = 0.1, rotation = 0
) {
	shader_set(shdCloudLayer);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "cloud_cover"), cloud_cover);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "base_color"), base_color[0] / 255, base_color[1] / 255, base_color[2] / 255, base_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "outline_color"), outline_color[0] / 255, outline_color[1] / 255, outline_color[2] / 255, outline_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "shadow_base_color"), shadow_base_color[0] / 255, shadow_base_color[1] / 255, shadow_base_color[2] / 255, shadow_base_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "shadow_outline_color"), shadow_outline_color[0] / 255, shadow_outline_color[1] / 255, shadow_outline_color[2] / 255, shadow_outline_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "stretch"), stretch);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "time_speed"), rotation_speed);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "rotation"), rotation);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdCloudLayer, "time"), time);
	draw_self();
	shader_reset();
}

function draw_crater_layer(light_pos = [0.39, 0.7],
	color1 = [71, 97, 124, 1],
	color2 = [53, 57, 85, 1],
	rotation_speed = 0.1, rotation = 0.0
) {
	shader_set(shdCraterLayer);
	shader_set_uniform_f(shader_get_uniform(shdCraterLayer, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdCraterLayer, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdCraterLayer, "color1"), color1[0] / 255, color1[1] / 255, color1[2] / 255, color1[3]);
	shader_set_uniform_f(shader_get_uniform(shdCraterLayer, "color2"), color2[0] / 255, color2[1] / 255, color2[2] / 255, color2[3]);
	shader_set_uniform_f(shader_get_uniform(shdCraterLayer, "time_speed"), rotation_speed);
	shader_set_uniform_f(shader_get_uniform(shdCraterLayer, "rotation"), rotation);
	shader_set_uniform_f(shader_get_uniform(shdCraterLayer, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdCraterLayer, "time"), time);
	draw_self();
	shader_reset();
}

function draw_dense_gas_layer(light_pos = [0.39, 0.7], rotation_speed = 0.1) {
	shader_set(shdDenseGasLayer);
	shader_set_uniform_f(shader_get_uniform(shdDenseGasLayer, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdDenseGasLayer, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdDenseGasLayer, "time_speed"), rotation_speed);
	texture_set_stage(shader_get_sampler_index(shdDenseGasLayer, "colorscheme"), sprite_get_texture(sprShdColorScheme1, 0));
	texture_set_stage(shader_get_sampler_index(shdDenseGasLayer, "dark_colorscheme"), sprite_get_texture(sprShdColorScheme2, 0));
	shader_set_uniform_f(shader_get_uniform(shdDenseGasLayer, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdDenseGasLayer, "time"), time);
	draw_self();
	shader_reset();
}

function draw_gas_layer(light_pos = [0.39, 0.7], cloud_cover = 0.538,
	base_color = [59, 32, 39, 1],
	outline_color = [59, 32, 39, 1],
	shadow_base_color = [33, 24, 27, 1],
	shadow_outline_color = [33, 24, 27, 1],
	stretch = 1.0, rotation_speed = 0.1, rotation = 0, cloud_curve = 1.3
) {
	shader_set(shdGasLayer);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "cloud_cover"), cloud_cover);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "base_color"), base_color[0] / 255, base_color[1] / 255, base_color[2] / 255, base_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "outline_color"), outline_color[0] / 255, outline_color[1] / 255, outline_color[2] / 255, outline_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "shadow_base_color"), shadow_base_color[0] / 255, shadow_base_color[1] / 255, shadow_base_color[2] / 255, shadow_base_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "shadow_outline_color"), shadow_outline_color[0] / 255, shadow_outline_color[1] / 255, shadow_outline_color[2] / 255, shadow_outline_color[3]);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "stretch"), stretch);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "time_speed"), rotation_speed);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "rotation"), rotation);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "cloud_curve"), cloud_curve);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdGasLayer, "time"), time);
	draw_self();
	shader_reset();
}

function draw_lake_layer(light_pos = [0.39, 0.7],
	color1 = [79, 164, 184, 1],
	color2 = [76, 104, 133, 1],
	color3 = [58, 63, 94, 1],
	rotation_speed = 0.1, lakes = 0.6, rotation = 0
) {
	shader_set(shdLakeLayer);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "color1"), color1[0] / 255, color1[1] / 255, color1[2] / 255, color1[3]);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "color2"), color2[0] / 255, color2[1] / 255, color2[2] / 255, color2[3]);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "color3"), color3[0] / 255, color3[1] / 255, color3[2] / 255, color3[3]);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "time_speed"), rotation_speed);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "lake_cutoff"), lakes);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "rotation"), rotation);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdLakeLayer, "time"), time);
	draw_self();
	shader_reset();
}

function draw_land_mass(light_pos = [0.39, 0.7], light_intensity = 0.1,
	color1 = [200, 212, 93, 1],
	color2 = [99, 171, 63, 1],
	color3 = [47, 87, 83, 1],
	color4 = [40, 53, 64, 1],
	rotation_speed = 0.1, rotation = 0, land = 0.6
) {
	shader_set(shdLandMass);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "col1"), color1[0] / 255, color1[1] / 255, color1[2] / 255, color1[3]);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "col2"), color2[0] / 255, color2[1] / 255, color2[2] / 255, color2[3]);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "col3"), color3[0] / 255, color3[1] / 255, color3[2] / 255, color3[3]);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "col4"), color4[0] / 255, color4[1] / 255, color4[2] / 255, color4[3]);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "time_speed"), rotation_speed);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "rotation"), rotation);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "land_cutoff"), land);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdLandMass, "time"), time);
	draw_self();
	shader_reset();
}

function draw_ring_layer(light_pos = [0.39, 0.7], rotation_speed = 0.1, ring_width = 0.143, perspective = 6.0, scale_planet = 4.0) {
	shader_set(shdRingLayer);
	shader_set_uniform_f(shader_get_uniform(shdRingLayer, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdRingLayer, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdRingLayer, "time_speed"), rotation_speed);
	texture_set_stage(shader_get_sampler_index(shdRingLayer, "colorscheme"), sprite_get_texture(sprShdColorScheme1, 0));
	texture_set_stage(shader_get_sampler_index(shdRingLayer, "dark_colorscheme"), sprite_get_texture(sprShdColorScheme2, 0));
	shader_set_uniform_f(shader_get_uniform(shdRingLayer, "ring_width"), ring_width);
	shader_set_uniform_f(shader_get_uniform(shdRingLayer, "ring_perspective"), perspective);
	shader_set_uniform_f(shader_get_uniform(shdRingLayer, "scale_rel_to_planet"), scale_planet);
	shader_set_uniform_f(shader_get_uniform(shdRingLayer, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdRingLayer, "time"), time);
	draw_self();
	shader_reset();
}

function draw_rivers_layer(light_pos = [0.39, 0.7],
	color1 = [79, 164, 184, 1],
	color2 = [76, 104, 133, 1],
	color3 = [58, 63, 94, 1],
	rotation_speed = 0.1, rivers = 0.6, rotation = 0
) {
	shader_set(shdRiversLayer);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "pixels"), pixels);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "light_origin"), light_pos[0], light_pos[1]);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "color1"), color1[0] / 255, color1[1] / 255, color1[2] / 255, color1[3]);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "color2"), color2[0] / 255, color2[1] / 255, color2[2] / 255, color2[3]);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "color3"), color3[0] / 255, color3[1] / 255, color3[2] / 255, color3[3]);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "time_speed"), rotation_speed);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "river_cutoff"), rivers);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "rotation"), rotation);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "seed"), seed);
	shader_set_uniform_f(shader_get_uniform(shdRiversLayer, "time"), time);
	draw_self();
	shader_reset();
}