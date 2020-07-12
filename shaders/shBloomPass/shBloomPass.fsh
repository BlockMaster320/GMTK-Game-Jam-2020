varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float bloomThresholdTop;
uniform float bloomRange;

void main()
{
    vec4 baseCol = v_vColour * texture2D(gm_BaseTexture,v_vTexcoord);
    
    //float lum = dot(baseCol.rgb, vec3(.229, .587, .114));
	float redness = max(0.,baseCol.r*2. - baseCol.g - baseCol.b);
    float weight = smoothstep(bloomThresholdTop-bloomRange, bloomThresholdTop, redness);
    baseCol.rgb = mix(vec3(0.), baseCol.rgb, weight);
    //baseCol.a = mix(0., 1., weight);
    
    gl_FragColor = baseCol;
}