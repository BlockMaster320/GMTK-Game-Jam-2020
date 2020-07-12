varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float blurSteps;
uniform vec2 texelSize;
uniform float sigma;
uniform vec2 blurVector;

float Gauss(float pos)
{
    return exp(-(pos*pos) / (2.*sigma*sigma));
}

void main()
{
    vec4 blurredCol = texture2D(gm_BaseTexture,v_vTexcoord);
    vec2 sample;
    float offsetD1,offsetL,sampleWeightD1,sampleWeightD2,sampleWeightL;    //D = discrete, L = linear
    float totalWeight = 1.;
    float kernel = 2.*blurSteps+1.;
    for (offsetD1 = 1.; offsetD1 <= blurSteps * 2.; offsetD1 += 2.)
    {
        sampleWeightD1 = Gauss(offsetD1/blurSteps);
        sampleWeightD2 = Gauss((offsetD1+.1)/blurSteps);
        sampleWeightL = sampleWeightD1 + sampleWeightD2;
        totalWeight += 2. * sampleWeightL;
        
        offsetL = ((offsetD1*sampleWeightD1) + ((offsetD1+1.)*sampleWeightD2)) / sampleWeightL;
            
        sample = v_vTexcoord + offsetL * texelSize * blurVector;
        blurredCol += texture2D(gm_BaseTexture,sample) * sampleWeightL;
        
        sample = v_vTexcoord - offsetL * texelSize * blurVector;
        blurredCol += texture2D(gm_BaseTexture,sample) * sampleWeightL;
    }
    gl_FragColor = v_vColour * blurredCol / totalWeight;
}