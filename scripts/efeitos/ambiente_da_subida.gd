extends WorldEnvironment
## Clima da subida (apresentação provisória): paleta por cenário na luz, na névoa, na
## saturação e nas partículas do fundo; o sol esquenta e fica mais forte perto do céu (o mito);
## o brilho (bloom) cresce no fim. Liga/desliga: PALETA_POR_CENARIO, LUZ_ESQUENTA_NA_SUBIDA,
## BLOOM_PERTO_DO_CEU e PARTICULAS_AMBIENTE, em Ajustes.

@export var sol: DirectionalLight3D
@export var particulas: CPUParticles3D


func _ready() -> void:
	environment = environment.duplicate()
	environment.fog_enabled = Ajustes.PALETA_POR_CENARIO
	environment.fog_density = Ajustes.DENSIDADE_DA_NEVOA
	environment.adjustment_enabled = Ajustes.PALETA_POR_CENARIO
	environment.glow_enabled = Ajustes.BLOOM_PERTO_DO_CEU
	if particulas != null:
		particulas.amount = Ajustes.QUANTIDADE_DE_PARTICULAS_AMBIENTE
		particulas.emitting = Ajustes.PARTICULAS_AMBIENTE
	atualizar(0.0)


## Chamado pela cena do jogo a cada quadro, com a maior altura alcançada.
func atualizar(altura: float) -> void:
	var fator := clampf(altura / Ajustes.ALTURA_DO_CEU, 0.0, 1.0)
	var trecho := fator * (Cenarios.NOMES.size() - 0.001)
	if Ajustes.PALETA_POR_CENARIO:
		environment.fog_light_color = misturar(Ajustes.COR_DA_NEVOA, trecho)
		environment.adjustment_saturation = misturar_numero(Ajustes.SATURACAO, trecho)
		environment.adjustment_contrast = misturar_numero(Ajustes.CONTRASTE, trecho)
	if sol != null:
		sol.light_color = misturar(Ajustes.COR_DA_LUZ, trecho) if Ajustes.PALETA_POR_CENARIO else Color.WHITE
		sol.light_energy = lerpf(Ajustes.ENERGIA_DA_LUZ_NO_CHAO, Ajustes.ENERGIA_DA_LUZ_NO_CEU, fator) \
			if Ajustes.LUZ_ESQUENTA_NA_SUBIDA else Ajustes.ENERGIA_DA_LUZ_NO_CHAO
	if Ajustes.BLOOM_PERTO_DO_CEU:
		environment.glow_intensity = Ajustes.BLOOM_NO_CEU * smoothstep(Ajustes.BLOOM_COMECA_EM, 1.0, fator)
	if particulas != null and Ajustes.PARTICULAS_AMBIENTE:
		particulas.color = misturar(Ajustes.COR_DAS_PARTICULAS, trecho)


## Cor do cenário atual; perto do fim de cada cenário, vai se misturando com a do próximo.
static func misturar(cores: Array, trecho: float) -> Color:
	var i := floori(trecho)
	var proxima := mini(i + 1, cores.size() - 1)
	return (cores[i] as Color).lerp(cores[proxima], smoothstep(0.7, 1.0, trecho - i))


static func misturar_numero(valores: Array, trecho: float) -> float:
	var i := floori(trecho)
	var proxima := mini(i + 1, valores.size() - 1)
	return lerpf(valores[i], valores[proxima], smoothstep(0.7, 1.0, trecho - i))
