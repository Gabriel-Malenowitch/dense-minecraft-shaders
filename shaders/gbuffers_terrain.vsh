#version 120

#include "shaderconfig.glsl"

attribute vec4 mc_Entity;
attribute vec4 mc_midTexCoord;

varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 glcolor;

uniform float frameTimeCounter;
uniform vec3 cameraPosition;

void main() {
    vec4 position = gl_Vertex;
    
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).st;
    lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).st;
    glcolor = gl_Color;
    
    // Pega ID do bloco
    float blockId = mc_Entity.x;
    
    // Detecta topo do bloco
    bool isTopVertex = gl_MultiTexCoord0.t < mc_midTexCoord.t;
    
    // Calcula onda base
    float time = frameTimeCounter * WAVE_SPEED;
    float wave = sin(time + position.x + position.z);
    
    // GRAMA PEQUENA (ID 100)
    #if WAVING_GRASS == 1
    if (blockId > 99.5 && blockId < 100.5 && isTopVertex) {
        position.x += wave * GRASS_WAVE_STRENGTH;
    }
    #endif
    
    // FOLHAS DE ÁRVORE (ID 101)
    #if WAVING_LEAVES == 1
    if (blockId > 100.5 && blockId < 101.5) {
        float leafWave = sin(time * 0.7 + position.y);
        position.x += leafWave * LEAVES_WAVE_STRENGTH;
        position.z += leafWave * LEAVES_WAVE_STRENGTH * 0.5;
    }
    #endif
    
    // PLANTAS ALTAS (bambu, cana) (ID 102)
    #if WAVING_TALL_PLANTS == 1
    if (blockId > 101.5 && blockId < 102.5) {
        float height = fract(position.y);
        position.x += wave * TALL_PLANTS_WAVE_STRENGTH * height;
    }
    #endif
    
    gl_Position = gl_ModelViewProjectionMatrix * position;
}
