class_name Icaro
extends CharacterBody3D
## Ícaro: anda para os lados com A e D, salta sozinho ao pisar numa plataforma (G-009)
## e atira flechas na direção do cursor com o clique do mouse (G-008).
## A origem da cena fica nos pés de Ícaro.

const CENA_DA_FLECHA := preload("res://scenes/flecha/flecha.tscn")

var contato := Contato.new(Ajustes.TEMPO_INVULNERAVEL)
var _espera_do_tiro := 0.0
var _andando := false
var _tempo := 0.0

@onready var _visual: Node3D = $Visual
@onready var _saida_da_flecha: Marker3D = $SaidaDaFlecha


func _physics_process(delta: float) -> void:
	_tempo += delta
	contato.avancar(delta)
	_espera_do_tiro = maxf(0.0, _espera_do_tiro - delta)

	var direcao := Input.get_axis("mover_esquerda", "mover_direita")
	velocity.x = direcao * _velocidade_lateral()
	velocity.y -= Ajustes.GRAVIDADE * delta
	velocity.z = 0.0
	move_and_slide()

	if is_on_floor():
		_saltar()
	position.x = clampf(position.x, -Ajustes.LIMITE_LATERAL, Ajustes.LIMITE_LATERAL)
	position.z = 0.0

	Partida.placar.registrar_altura(position.y)
	_tocar_asas(direcao != 0.0)
	_piscar()

	if Input.is_action_pressed("atirar") and _espera_do_tiro == 0.0:
		_atirar()


## Um inimigo encostou (chamado pelo inimigo). G-018 e escudo (G-017).
func inimigo_encostou() -> void:
	match contato.inimigo_encostou(Partida.poderes):
		Contato.Resultado.DANO:
			Partida.placar.perder_pontos(Ajustes.PONTOS_PERDIDOS)
			velocity.y = -Ajustes.EMPURRAO_PARA_BAIXO
			Sons.tocar("dano")
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
			plataforma.ao_ser_pisada()
			multiplicador = maxf(multiplicador, plataforma.multiplicador_do_salto())
	if Partida.poderes.ativo() == Poderes.Tipo.PULO_ALTO:
		multiplicador *= Ajustes.MULTIPLICADOR_DO_PULO_ALTO
	velocity.y = Ajustes.VELOCIDADE_DO_SALTO * multiplicador
	Sons.tocar("pulo")


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
