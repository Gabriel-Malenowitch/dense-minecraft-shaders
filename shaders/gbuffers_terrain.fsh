#version 120

#include "shaderconfig.glsl"

uniform sampler2D texture;
uniform sampler2D lightmap;
uniform sampler2D shadowtex0;

varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 glcolor;
varying vec4 shadowPos;

// Função SIMPLES para calcular sombras (sem PCF)
float getShadow() {
    #if SHADOWS == 1
    
    // Converte para coordenadas de textura
    vec3 shadowCoord = shadowPos.xyz * 0.5 + 0.5;
    
    // Verifica limites
    if (shadowCoord.x < 0.0 || shadowCoord.x > 1.0 || 
        shadowCoord.y < 0.0 || shadowCoord.y > 1.0) {
        return 1.0;
    }
    
    float shadow = 0.0;
    float currentDepth = shadowCoord.z - SHADOW_BIAS;
    
    #if SHADOW_SOFTNESS > 0
        // PCF Sampling (Suavização)
        float texelSize = 1.0 / float(shadowMapResolution);
        
        // Loop 3x3 simples
        for(int x = -1; x <= 1; x++){
            for(int y = -1; y <= 1; y++){
                float shadowDepth = texture2D(shadowtex0, shadowCoord.xy + vec2(x, y) * texelSize).r;
                
                // Se estiver na sombra retorna 0.5, senão 1.0
                shadow += (currentDepth > shadowDepth) ? 0.5 : 1.0;
            }
        }
        shadow /= 9.0;
        
    #else
        // Amostragem Simples (Rápida)
        float shadowDepth = texture2D(shadowtex0, shadowCoord.xy).r;
        shadow = (currentDepth > shadowDepth) ? 0.5 : 1.0;
    #endif
    
    return shadow;
    
    #else
    return 1.0;
    #endif
}

void main() {
    vec4 color = texture2D(texture, texcoord) * glcolor;
    color.rgb *= texture2D(lightmap, lmcoord).rgb;
    
    // Aplica sombra
    color.rgb *= getShadow();
    
    gl_FragColor = color;
}
