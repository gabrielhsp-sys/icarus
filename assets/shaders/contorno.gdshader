// Contorno por casco invertido: desenha a peça de novo, um pouco maior e só por trás, numa
// cor escura. O casco cresce a partir do centro da peça (misturado com a normal), o que
// fecha as quinas das formas low poly de faces planas.
shader_type spatial;
render_mode unshaded, cull_front, shadows_disabled;

uniform vec4 cor : source_color = vec4(0.13, 0.05, 0.16, 1.0);
uniform float espessura = 0.035;

void vertex() {
	vec3 para_fora = normalize(mix(NORMAL, normalize(VERTEX + vec3(0.0001)), 0.6));
	VERTEX += para_fora * espessura;
}

void fragment() {
	ALBEDO = cor.rgb;
}
