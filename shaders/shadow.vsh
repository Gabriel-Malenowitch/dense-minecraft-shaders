#version 120

// Shadow Vertex Shader
// Renderiza a cena da perspectiva do sol/lua

varying vec2 texcoord;
varying vec4 glcolor;

uniform mat4 shadowModelView;
uniform mat4 shadowProjection;

void main() {
    // Textura e cor
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).st;
    glcolor = gl_Color;
    
    // Projeta vértice usando as matrizes padrão do Optifine (Perspectiva do Sol/Lua)
    vec4 position = gl_ModelViewProjectionMatrix * gl_Vertex;
    
    // Sem distortion para melhor performance e estabilidade
    // float distortion = length(position.xy);
    // distortion = distortion * 0.9 + 0.1;
    // position.xy /= distortion;
    
    gl_Position = position;
}
