#version 440

layout(location=0) in vec2 qt_TexCoord0;
layout(location=0) out vec4 fragColor;

layout(std140, binding=0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    // All positions and sizes have to be normalized between [0, 1].
    // The rectangles positions are their center coordinates.
    // The sizes are their half-sizes.
    vec2 rect1Pos;
    vec2 rect1Size;
    vec4 color1;

    vec2 rect2Pos;
    vec2 rect2Size;
    vec4 color2;

    float smoothness;  // 0.0 for no smoothing.
    float softness;  // 0.002 is a good value. Avoids antialiasing.
} ubuf;

float sdRect(vec2 p, vec2 size) {
    vec2 d = abs(p) - size;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

// Smooth minimum blending function
// See https://iquilezles.org/articles/smin/
float smin(float a, float b, float k, out float h) {
    h = clamp(0.5 + 0.5 * (b - a) / k, 0.0, 1.0);
    return mix(b, a, h) - k * h * (1.0 - h);
}

void main() {
    vec2 p = qt_TexCoord0;
    float d1 = sdRect(p - ubuf.rect1Pos, ubuf.rect1Size);
    float d2 = sdRect(p - ubuf.rect2Pos, ubuf.rect2Size);

    float blendFactor;
    float d = smin(d1, d2, ubuf.smoothness, blendFactor);
    float shape = 1.0 - smoothstep(-ubuf.softness, ubuf.softness, d);
    vec4 color = mix(ubuf.color2, ubuf.color1, blendFactor);

    fragColor = color * shape * ubuf.qt_Opacity;
}
