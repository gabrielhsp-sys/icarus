// Vinheta leve nas bordas da tela e o flash vermelho de dano, também nas bordas.
shader_type canvas_item;

uniform float forca = 0.35;
uniform vec4 cor_da_vinheta : source_color = vec4(0.13, 0.05, 0.16, 1.0);
uniform float dano = 0.0;
uniform vec4 cor_do_dano : source_color = vec4(1.0, 0.1, 0.1, 1.0);

void fragment() {
	vec2 centro = (UV - 0.5) * vec2(1.0, 0.7);
	float borda = length(centro) * 1.8;
	float vinheta = smoothstep(0.55, 1.15, borda) * forca;
	float vermelho = smoothstep(0.3, 1.05, borda) * clamp(dano, 0.0, 1.0);
	float alfa = max(vinheta, vermelho);
	vec3 cor = mix(cor_da_vinheta.rgb, cor_do_dano.rgb, vermelho / max(alfa, 0.0001));
	COLOR = vec4(cor, alfa);
}
