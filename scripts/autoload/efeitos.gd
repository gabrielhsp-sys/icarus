extends Node
## Autoload "Efeitos": um lugar só para os efeitos de resposta (o "juice"). Qualquer cena
## chama daqui. tremer, abrir_fov, flash_de_dano, hit_stop e numero_flutuante conferem o
## próprio liga/desliga; estouro, poeira, estilhacos e anel são peças usadas por outras
## camadas, e quem chama confere o liga/desliga dela. Nenhum efeito muda regra do jogo.

signal trauma_somado(quantidade: float)  ## a câmera escuta e treme
signal fov_extra_somado(graus: float)    ## a câmera escuta e abre o campo de visão
signal flash_de_dano_pedido              ## a vinheta escuta e pisca vermelho

const FONTE := preload("res://assets/fonts/LilitaOne-Regular.ttf")

var _malha_do_estouro: QuadMesh
var _malha_do_estilhaco: BoxMesh


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_malha_do_estouro = QuadMesh.new()
	_malha_do_estouro.size = Vector2(0.22, 0.22)
	_malha_do_estouro.material = _material_de_particula(true)
	_malha_do_estilhaco = BoxMesh.new()
	_malha_do_estilhaco.size = Vector3(0.35, 0.18, 0.3)
	_malha_do_estilhaco.material = _material_de_particula(false)


## Tremor de tela por "trauma" (0 a 1). Com REDUZIR_TREMOR_DE_TELA, bem mais fraco.
func tremer(trauma: float) -> void:
	if not Ajustes.TREMOR_DE_TELA:
		return
	if Ajustes.REDUZIR_TREMOR_DE_TELA:
		trauma *= Ajustes.FATOR_DO_TREMOR_REDUZIDO
	trauma_somado.emit(trauma)


func abrir_fov(graus: float) -> void:
	if Ajustes.FOV_NO_IMPULSO:
		fov_extra_somado.emit(graus)


func flash_de_dano() -> void:
	if Ajustes.FLASH_DE_DANO:
		flash_de_dano_pedido.emit()


## Congela o jogo por poucos quadros (quando a flecha acerta).
func hit_stop() -> void:
	if not Ajustes.HIT_STOP or Engine.time_scale < 1.0:
		return
	Engine.time_scale = Ajustes.ESCALA_DO_TEMPO_NO_HIT_STOP
	await get_tree().create_timer(Ajustes.DURACAO_DO_HIT_STOP, true, false, true).timeout
	Engine.time_scale = 1.0


## Intensidade de um clarão, já reduzida se REDUZIR_FLASHES estiver ligado.
func forca_do_flash(forca: float) -> float:
	return forca * Ajustes.FATOR_DOS_FLASHES_REDUZIDOS if Ajustes.REDUZIR_FLASHES else forca


## Estouro de partículas coloridas (inimigo atingido, item coletado, marca superada).
func estouro(posicao: Vector3, cor: Color, quantidade := 24, forca := 5.0) -> void:
	var particulas := _particulas(posicao, quantidade, 0.6)
	particulas.mesh = _malha_do_estouro
	particulas.color_ramp = _desbotar(cor)
	particulas.spread = 180.0
	particulas.initial_velocity_min = forca * 0.5
	particulas.initial_velocity_max = forca
	particulas.gravity = Vector3(0.0, -6.0, 0.0)
	particulas.scale_amount_min = 0.6
	particulas.scale_amount_max = 1.4
	_disparar(particulas)


## Poeira baixa e larga no pouso.
func poeira(posicao: Vector3, cor: Color) -> void:
	var particulas := _particulas(posicao, 10, 0.45)
	particulas.mesh = _malha_do_estouro
	particulas.color_ramp = _desbotar(cor)
	particulas.direction = Vector3(0.0, 1.0, 0.0)
	particulas.spread = 80.0
	particulas.initial_velocity_min = 1.0
	particulas.initial_velocity_max = 2.5
	particulas.gravity = Vector3(0.0, -2.0, 0.0)
	particulas.scale_amount_min = 0.5
	particulas.scale_amount_max = 1.0
	_disparar(particulas)


## Pedaços caindo (plataforma instável quebrando).
func estilhacos(posicao: Vector3, cor: Color) -> void:
	var particulas := _particulas(posicao, 9, 1.1)
	particulas.mesh = _malha_do_estilhaco
	particulas.color_ramp = _desbotar(cor)
	particulas.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
	particulas.emission_box_extents = Vector3(1.3, 0.1, 0.4)
	particulas.direction = Vector3(0.0, 1.0, 0.0)
	particulas.spread = 50.0
	particulas.initial_velocity_min = 1.5
	particulas.initial_velocity_max = 4.0
	particulas.gravity = Vector3(0.0, -18.0, 0.0)
	particulas.angular_velocity_min = -360.0
	particulas.angular_velocity_max = 360.0
	_disparar(particulas)


## Anel que cresce e some (pouso, coleta, marca superada).
func anel(posicao: Vector3, cor: Color, tamanho := 1.6) -> void:
	var cena := get_tree().current_scene
	if cena == null:
		return
	var malha := MeshInstance3D.new()
	var toro := TorusMesh.new()
	toro.inner_radius = 0.42
	toro.outer_radius = 0.5
	toro.rings = 16
	toro.ring_segments = 4
	var material := StandardMaterial3D.new()
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	material.albedo_color = cor
	toro.material = material
	malha.mesh = toro
	cena.add_child(malha)
	malha.global_position = posicao
	malha.rotation.x = deg_to_rad(70.0)  # quase de frente para a câmera: aparece como elipse
	malha.scale = Vector3(0.3, 0.3, 0.3)
	var animacao := malha.create_tween().set_parallel()
	animacao.tween_property(malha, "scale", Vector3(tamanho, 1.0, tamanho), 0.35).set_ease(Tween.EASE_OUT)
	animacao.tween_property(material, "albedo_color:a", 0.0, 0.35)
	animacao.chain().tween_callback(malha.queue_free)


## Texto que sobe e some ("-50" no dano).
func numero_flutuante(posicao: Vector3, texto: String, cor: Color) -> void:
	var cena := get_tree().current_scene
	if not Ajustes.NUMERO_FLUTUANTE or cena == null:
		return
	var rotulo := Label3D.new()
	rotulo.text = texto
	rotulo.font = FONTE
	rotulo.font_size = 96
	rotulo.pixel_size = 0.006
	rotulo.modulate = cor
	rotulo.outline_modulate = Ajustes.COR_DO_CONTORNO
	rotulo.outline_size = 18
	rotulo.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	rotulo.no_depth_test = true
	cena.add_child(rotulo)
	rotulo.global_position = posicao
	var animacao := rotulo.create_tween().set_parallel()
	animacao.tween_property(rotulo, "position:y", 1.4, 0.8).as_relative().set_ease(Tween.EASE_OUT)
	animacao.tween_property(rotulo, "modulate:a", 0.0, 0.8).set_delay(0.3)
	animacao.chain().tween_callback(rotulo.queue_free)


func _particulas(posicao: Vector3, quantidade: int, vida: float) -> CPUParticles3D:
	var particulas := CPUParticles3D.new()
	particulas.one_shot = true
	particulas.explosiveness = 1.0
	particulas.amount = quantidade
	particulas.lifetime = vida
	particulas.local_coords = false
	particulas.position = posicao
	return particulas


func _disparar(particulas: CPUParticles3D) -> void:
	var cena := get_tree().current_scene
	if cena == null:
		particulas.free()
		return
	cena.add_child(particulas)
	particulas.emitting = true
	particulas.finished.connect(particulas.queue_free)


func _desbotar(cor: Color) -> Gradient:
	var degrade := Gradient.new()
	degrade.set_color(0, cor)
	degrade.set_color(1, Color(cor, 0.0))
	return degrade


func _material_de_particula(de_frente: bool) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	material.vertex_color_use_as_albedo = true
	if de_frente:
		material.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	return material
