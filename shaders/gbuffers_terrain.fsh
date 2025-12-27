#version 120

uniform sampler2D texture;
uniform sampler2D lightmap;

varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 glcolor;

void main() {
    // Amostra a textura do bloco
    vec4 color = texture2D(texture, texcoord);
    
    // Aplica o tint de cor (bioma, etc)
    color *= glcolor;
    
    // Aplica iluminação
    color.rgb *= texture2D(lightmap, lmcoord).rgb;
    
    // Saída final
    gl_FragColor = color;
}
