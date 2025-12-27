// ==========================================
// CONFIGURAÇÕES DE MOVIMENTO - DENSE SHADER
// ==========================================
// Edite os valores abaixo para customizar!

// Habilitar movimentos (1 = ligado, 0 = desligado)
#define WAVING_GRASS 1
#define WAVING_LEAVES 1  
#define WAVING_TALL_PLANTS 1

// Intensidade do movimento
#define GRASS_WAVE_STRENGTH 0.08
#define LEAVES_WAVE_STRENGTH 0.04
#define TALL_PLANTS_WAVE_STRENGTH 0.10

// Velocidade do vento
#define WAVE_SPEED 1.0

// ==========================================
// CONFIGURAÇÕES DE SOMBRAS
// ==========================================

// Habilitar sombras (1 = ligado, 0 = desligado)
#define SHADOWS 1

// Resolução do shadowmap (maior = melhor qualidade, pior performance)
// Valores: 1024, 2048, 4096
const int shadowMapResolution = 1024;

// Distância das sombras em blocos
#define SHADOW_DISTANCE 64.0

// Suavidade das sombras (PCF samples)
// 0 = rápido (pixelado), 1 = suave (melhor visual)
#define SHADOW_SOFTNESS 1

// Bias para evitar shadow acne (listras nas sombras)
// Aumentado levemente para reduzir artefatos
#define SHADOW_BIAS 0.002
