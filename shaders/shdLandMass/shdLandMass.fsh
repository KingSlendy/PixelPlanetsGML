varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float lightIntensity;
uniform float pixels;
uniform float rotation;
uniform vec2 light_origin;
uniform float time_speed;
uniform float land_cutoff;
float dither_size = 2.0;
float light_border_1 = 0.4;
float light_border_2 = 0.6;
uniform vec4 col1;
uniform vec4 col2;
uniform vec4 col3;
uniform vec4 col4;
float size = 10.0;
int OCTAVES = 6;
uniform float seed;
uniform float time;

float rand(vec2 coord) {
    coord = mod(coord, vec2(1.0,1.0)*floor(size+0.5));
    return fract(sin(dot(coord.xy ,vec2(12.9898,78.233))) * 15.5453 * seed);
}

float noise(vec2 coord){
    vec2 i = floor(coord);
    vec2 f = fract(coord);
            
    float a = rand(i);
    float b = rand(i + vec2(1.0, 0.0));
    float c = rand(i + vec2(0.0, 1.0));
    float d = rand(i + vec2(1.0, 1.0));
        
    vec2 cubic = f * f * (3.0 - 2.0 * f);
        
    return mix(a, b, cubic.x) + (c - a) * cubic.y * (1.0 - cubic.x) + (d - b) * cubic.x * cubic.y;
}

float fbm(vec2 coord){
    float value = 0.0;
    float scale = 0.5;
        
    for(int i = 0; i < OCTAVES ; i++){
        value += noise(coord) * scale;
        coord *= 2.0;
        scale *= 0.5;
    }
    return value;
}

vec2 spherify(vec2 uv) {
    vec2 centered= uv *2.0-1.0;
    float z = sqrt(1.0 - dot(centered.xy, centered.xy));
    vec2 sphere = centered/(z + 1.0);
    return sphere * 0.5+0.5;
}
        
vec2 rotate(vec2 coord, float angle){
    coord -= 0.5;
    coord *= mat2(vec2(cos(angle),-sin(angle)),vec2(sin(angle),cos(angle)));
    return coord + 0.5;
}

void main() {
    vec2 uv = floor(v_vTexcoord.xy*pixels)/pixels;
	
    float d_light = distance(uv , light_origin);
    // cut out a circle
    float d_circle = distance(uv, vec2(0.5));
    // stepping over 0.5 instead of 0.49999 makes some pixels a little buggy
    float a = step(d_circle, 0.49999);
            
    // give planet a tilt
    uv = rotate(uv, rotation);
            
    // map to sphere
    uv = spherify(uv);
            
    // some scrolling noise for landmasses
    vec2 base_fbm_uv = (uv)*size+vec2(time*time_speed,0.0);
            
    // use multiple fbm's at different places so we can determine what color land gets
    float fbm1 = fbm(base_fbm_uv);
    float fbm2 = fbm(base_fbm_uv - light_origin*fbm1);
    float fbm3 = fbm(base_fbm_uv - light_origin*1.5*fbm1);
    float fbm4 = fbm(base_fbm_uv - light_origin*2.0*fbm1);
            
    // lots of magic numbers here
    // you can mess with them, it changes the color distribution
    if (d_light < light_border_1) {
        fbm4 *= 0.9;
    }
    if (d_light > light_border_1) {
        fbm2 *= 1.05;
        fbm3 *= 1.05;
        fbm4 *= 1.05;
    } 
    if (d_light > light_border_2) {
        fbm2 *= 1.3;
        fbm3 *= 1.4;
        fbm4 *= 1.8;
    } 
            
    // increase contrast on d_light
    d_light = pow(d_light, 2.0)*0.1;
    vec4 col = col4;
    // assign colors based on if there is noise to the top-left of noise
    // and also based on how far noise is from light
    if (fbm4 + d_light < fbm1) {
        col = col3;
    }
    if (fbm3 + d_light < fbm1) {
        col = col2;
    }
    if (fbm2 + d_light < fbm1) {
        col = col1;
    }
            
    gl_FragColor = vec4(col.rgb, step(land_cutoff, fbm1) * a * col.a);
}