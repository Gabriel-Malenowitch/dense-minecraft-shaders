#version 120

// Shadow Fragment Shader
// Escreve profundidade e cor no shadowmap

uniform sampler2D texture;
varying vec2 texcoord;
varying vec4 glcolor;

void main() {
    // Amostra textura
    vec4 color = texture2D(texture, texcoord) * glcolor;
    
    // Descarta pixels transparentes
    if (color.a < 0.1) discard;
    
    // Escreve cor para sombras coloridas (vidro, folhas, etc)
    gl_FragData[0] = color;
}
