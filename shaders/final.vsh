#version 120

// Variáveis do pipeline fixo do OpenGL legado
varying vec4 texcoord;

void main() {
    // Projeta o vértice na tela (gl_Vertex é input padrão)
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;

    // Passa a coordenada de textura para o fragment shader
    texcoord = gl_MultiTexCoord0;
}