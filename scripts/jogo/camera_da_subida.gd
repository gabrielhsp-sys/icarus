extends Camera3D
## Câmera em perspectiva (G-014) que acompanha a subida de Ícaro e nunca desce.
## Apresentação (provisória, com liga/desliga em Ajustes): olha um pouco à frente quando Ícaro
## sobe, treme por "trauma" (Efeitos.tremer) e abre o campo de visão no impulso.
## A antecipação e o tremor mexem só em h_offset/v_offset (deslocam a imagem). A posição da
## câmera, usada para decidir a queda e gerar as plataformas, é a mesma com ou sem efeito.

@export var alvo: Node3D

var _trauma := 0.0
var _fov_extra := 0.0
var _antecipacao := 0.0
var _ruido := FastNoiseLite.new()
var _tempo := 0.0


func _ready() -> void:
	projection = Camera3D.PROJECTION_PERSPECTIVE
	fov = Ajustes.CAMPO_DE_VISAO_DA_CAMERA
	position = Vector3(0.0, Ajustes.CAMERA_ACIMA_DE_ICARO, Ajustes.DISTANCIA_DA_CAMERA)
	_ruido.frequency = Ajustes.FREQUENCIA_DO_TREMOR
	Efeitos.trauma_somado.connect(func(quanto: float) -> void: _trauma = minf(1.0, _trauma + quanto))
	Efeitos.fov_extra_somado.connect(func(graus: float) -> void: _fov_extra = maxf(_fov_extra, graus))


func _physics_process(delta: float) -> void:
	if alvo == null:
		return
	var desejada := alvo.global_position.y + Ajustes.CAMERA_ACIMA_DE_ICARO
	var olhar_a_frente := 0.0
	if Ajustes.ANTECIPACAO_DA_CAMERA and alvo is CharacterBody3D:
		olhar_a_frente = maxf(0.0, (alvo as CharacterBody3D).velocity.y) * Ajustes.ANTECIPACAO
	_antecipacao = lerpf(_antecipacao, olhar_a_frente, 1.0 - exp(-Ajustes.SUAVIDADE_DA_ANTECIPACAO * delta))
	if desejada > position.y:
		position.y = lerpf(position.y, desejada, 1.0 - exp(-Ajustes.SUAVIDADE_DA_CAMERA * delta))


func _process(delta: float) -> void:
	_tempo += delta
	_trauma = maxf(0.0, _trauma - Ajustes.QUEDA_DO_TRAUMA * delta)
	var tremor := _trauma * _trauma * Ajustes.TREMOR_MAXIMO
	h_offset = _ruido.get_noise_2d(_tempo * 60.0, 0.0) * tremor
	v_offset = _ruido.get_noise_2d(0.0, _tempo * 60.0) * tremor + _antecipacao
	_fov_extra = maxf(0.0, _fov_extra - Ajustes.QUEDA_DO_FOV_EXTRA * delta)
	var fov_da_velocidade := 0.0
	if Ajustes.FOV_NO_IMPULSO and Partida.poderes.ativo() == Poderes.Tipo.VELOCIDADE:
		fov_da_velocidade = Ajustes.FOV_EXTRA_NA_VELOCIDADE
	var fov_desejado := Ajustes.CAMPO_DE_VISAO_DA_CAMERA + maxf(_fov_extra, fov_da_velocidade)
	fov = lerpf(fov, fov_desejado, 1.0 - exp(-Ajustes.SUAVIDADE_DO_FOV * delta))


## Altura da borda de baixo da tela, no plano do jogo (z = 0), com o campo de visão normal.
func borda_de_baixo() -> float:
	return position.y - position.z * tan(deg_to_rad(Ajustes.CAMPO_DE_VISAO_DA_CAMERA / 2.0))
