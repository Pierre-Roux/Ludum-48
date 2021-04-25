extern float strength;

vec4 effect(vec4 color, Image tex, vec2 tC, vec2 pC){
	float[10] sample;
	for(int i = 0; i < 10; i++){
		sample[i] = (i - 5) / strength;
	}
	
	vec2 dir = (.5 - tC) * -1;
	float dist = sqrt(dir.x * dir.x + dir.y * dir.y);
	dir = dir/dist;
	
	vec4 c = Texel(tex, tC);
	vec4 sum = color;
	
	for(int i = 0; i < 10; i++){
		sum += Texel(tex, tC + dir * sample[i] * strength / 50);
	}
	
	sum /= 10;
	
	float t = dist * strength;
	t = clamp(t, 0, 1);
	
	return mix(c, sum, t);
}