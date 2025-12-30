#version 120

// O OptiFine injeta essa textura automaticamente (o frame renderizado)
uniform sampler2D gcolor;

// Recebido do Vertex Shader
varying vec4 texcoord;

void main() {
    // Amostra a cor do pixel atual (UV mapping)
    vec3 color = texture2D(gcolor, texcoord.st).rgb;

    // Lógica do Shader: Inverter as cores (1.0 - cor)
    vec3 inverted = vec3(1.0) - color;

    // Saída final para o buffer de tela
    gl_FragColor = vec4(inverted, 1.0);
}