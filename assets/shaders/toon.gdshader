// Toon shading provisório do Icarus (G-021: low poly cartoon, cores fortes).
// A luz vira faixas em vez de degradê, e a borda do objeto ganha um brilho (rim) que o
// separa do fundo. Escrito para o projeto, sem plugin. Os valores vêm de scripts/ajustes.gd.
shader_type spatial;
render_mode cull_back, specular_disabled;

uniform vec4 cor : source_color = vec4(1.0);
uniform float faixas = 3.0;
uniform float sombra_minima = 0.5;
uniform float borda_de_luz = 0.35;
uniform vec4 brilho_extra : source_color = vec4(0.0, 0.0, 0.0, 1.0);

void fragment() {
	ALBEDO = cor.rgb;
	ROUGHNESS = 1.0;
	float rim = 1.0 - clamp(dot(NORMAL, VIEW), 0.0, 1.0);
	EMISSION = cor.rgb * step(0.62, rim) * borda_de_luz + brilho_extra.rgb;
}

void light() {
	float luz = clamp(dot(NORMAL, LIGHT), 0.0, 1.0) * ATTENUATION;
	float faixa = ceil(luz * faixas) / faixas;
	DIFFUSE_LIGHT += LIGHT_COLOR * mix(sombra_minima, 1.0, faixa) / PI;
}
