class_name Icaro
extends CharacterBody3D
## Ícaro: anda para os lados com A e D, salta sozinho ao pisar numa plataforma (G-009)
## e atira flechas na direção do cursor com o clique do mouse (G-008).
## A origem da cena fica nos pés de Ícaro.

const CENA_DA_FLECHA := preload("res://scenes/flecha/flecha.tscn")
const CAMADA_DAS_PLATAFORMAS := 2

const COR_DO_DANO := Color(1.0, 0.25, 0.2)

var contato := Contato.new(Ajustes.TEMPO_INVULNERAVEL, Ajustes.TEMPO_SEM_QUIQUE_DEPOIS_DO_DANO)
var _espera_do_tiro := 0.0
var _andando := false
var _tempo := 0.0
var _mola: Tween

@onready var _visual: Node3D = $Visual
@onready var _saida_da_flecha: Marker3D = $SaidaDaFlecha
@onready var _rastro: CPUParticles3D = $Rastro
@onready var _aura: MeshInstance3D = $Aura


func _ready() -> void:
	EstiloToon.aplicar(_visual)
	_aura.material_override = _aura.material_override.duplicate()


func _physics_process(delta: float) -> void:
	_tempo += delta
	contato.avancar(delta)
	_espera_do_tiro = maxf(0.0, _espera_do_tiro - delta)

	var direcao := Input.get_axis("mover_esquerda", "mover_direita")
	velocity.x = direcao * _velocidade_lateral()
	velocity.y -= Ajustes.GRAVIDADE * delta
	velocity.z = 0.0
	# Logo depois do dano, as plataformas não seguram Ícaro: o empurrão leva ele para baixo.
	set_collision_mask_value(CAMADA_DAS_PLATAFORMAS, contato.pode_quicar())
	move_and_slide()

	if is_on_floor() and contato.pode_quicar():
		_saltar()
	position.x = clampf(position.x, -Ajustes.LIMITE_LATERAL, Ajustes.LIMITE_LATERAL)
	position.z = 0.0

	Partida.registrar_altura(position.y)
	_tocar_asas(direcao != 0.0)
	_piscar()
	_inclinar(direcao, delta)
	_mostrar_poder()

	if Input.is_action_pressed("atirar") and _espera_do_tiro == 0.0:
		_atirar()


## Um inimigo encostou (chamado pelo inimigo). G-018 e escudo (G-017).
func inimigo_encostou() -> void:
	match contato.inimigo_encostou(Partida.poderes):
		Contato.Resultado.DANO:
			Partida.perder_pontos()
			velocity.y = -Ajustes.EMPURRAO_PARA_BAIXO
			Sons.tocar("dano")
			Efeitos.tremer(Ajustes.TRAUMA_NO_DANO)
			Efeitos.flash_de_dano()
			Efeitos.numero_flutuante(global_position + Vector3(0.0, 1.8, 0.5), "-%d" % Ajustes.PONTOS_PERDIDOS, COR_DO_DANO)
		Contato.Resultado.ABSORVIDO_PELO_ESCUDO:
			Sons.tocar("poder")


## Ícaro pegou um item de poder (chamado pelo item).
func pegar_poder(tipo: Poderes.Tipo) -> void:
	Partida.poderes.ativar(tipo)
	Sons.tocar("poder")


func _velocidade_lateral() -> float:
	if Partida.poderes.ativo() == Poderes.Tipo.VELOCIDADE:
		return Ajustes.VELOCIDADE_LATERAL * Ajustes.MULTIPLICADOR_DE_VELOCIDADE
	return Ajustes.VELOCIDADE_LATERAL


func _saltar() -> void:
	var multiplicador := 1.0
	for i in get_slide_collision_count():
		var plataforma := get_slide_collision(i).get_collider() as Plataforma
		if plataforma != null:
			plataforma.ao_ser_pisada(global_position)
			multiplicador = maxf(multiplicador, plataforma.multiplicador_do_salto())
	var impulso := multiplicador
	if Partida.poderes.ativo() == Poderes.Tipo.PULO_ALTO:
		multiplicador *= Ajustes.MULTIPLICADOR_DO_PULO_ALTO
	velocity.y = Ajustes.VELOCIDADE_DO_SALTO * multiplicador
	Sons.tocar("pulo")
	_amassar_e_esticar(impulso)


func _atirar() -> void:
	var camera := get_viewport().get_camera_3d()
	if camera == null:
		return
	_espera_do_tiro = Ajustes.INTERVALO_ENTRE_FLECHAS
	var saida := _saida_da_flecha.global_position
	var direcao := _direcao_do_cursor(camera, saida)
	var flecha: Flecha = CENA_DA_FLECHA.instantiate()
	get_parent().add_child(flecha)
	flecha.lancar(saida, direcao)
	Sons.tocar("flecha")


## Direção da saída da flecha até o ponto do cursor no plano do jogo (z = 0).
func _direcao_do_cursor(camera: Camera3D, saida: Vector3) -> Vector3:
	var cursor := get_viewport().get_mouse_position()
	var origem := camera.project_ray_origin(cursor)
	var raio := camera.project_ray_normal(cursor)
	if is_zero_approx(raio.z):
		return Vector3.UP
	var alvo := origem + raio * (-origem.z / raio.z)
	var direcao := Vector3(alvo.x - saida.x, alvo.y - saida.y, 0.0)
	return direcao.normalized() if direcao.length() > 0.01 else Vector3.UP


func _tocar_asas(andando: bool) -> void:
	if andando and not _andando:
		Sons.tocar("asas")
	_andando = andando


func _piscar() -> void:
	_visual.visible = not contato.invulneravel() or fmod(_tempo * 10.0, 2.0) < 1.0


## Squash & stretch: amassa no pouso e estica no salto (mais no pula-pula).
func _amassar_e_esticar(impulso: float) -> void:
	if not Ajustes.SQUASH_E_STRETCH:
		return
	if _mola != null:
		_mola.kill()
	var amassado := Ajustes.AMASSAR_NO_POUSO
	var esticado := 1.0 + (Ajustes.ESTICAR_NO_SALTO - 1.0) * impulso
	_mola = create_tween()
	_mola.tween_property(_visual, "scale", _escala_com_volume(amassado), 0.05)
	_mola.tween_property(_visual, "scale", _escala_com_volume(esticado), 0.1)
	_mola.tween_property(_visual, "scale", Vector3.ONE, 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


## Estica ou amassa na vertical e compensa nos lados, para o volume parecer o mesmo.
func _escala_com_volume(vertical: float) -> Vector3:
	return Vector3(1.0 / sqrt(vertical), vertical, 1.0 / sqrt(vertical))


## Inclina e vira o corpo para o lado em que anda.
func _inclinar(direcao: float, delta: float) -> void:
	if not Ajustes.INCLINACAO_E_VIRADA:
		return
	var suave := 1.0 - exp(-10.0 * delta)
	_visual.rotation.z = lerpf(_visual.rotation.z, -direcao * Ajustes.INCLINACAO_MAXIMA, suave)
	_visual.rotation.y = lerpf(_visual.rotation.y, direcao * Ajustes.VIRADA_MAXIMA, suave)


## Rastro no poder de velocidade e aura na cor do poder ativo.
func _mostrar_poder() -> void:
	var ativo := Partida.poderes.ativo()
	_rastro.emitting = Ajustes.RASTRO_NA_VELOCIDADE and ativo == Poderes.Tipo.VELOCIDADE
	_aura.visible = Ajustes.AURA_DO_PODER and ativo != Poderes.Tipo.NENHUM
	if _aura.visible:
		var cor: Color = ItemDePoder.CORES[ativo]
		(_aura.material_override as StandardMaterial3D).albedo_color = Color(cor, 0.22 + 0.08 * sin(_tempo * 6.0))
		_aura.scale = Vector3.ONE * (1.0 + 0.06 * sin(_tempo * 6.0))
