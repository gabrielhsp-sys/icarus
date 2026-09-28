extends Camera3D
## Câmera em perspectiva (G-014) que acompanha a subida de Ícaro e nunca desce.

@export var alvo: Node3D


func _ready() -> void:
	projection = Camera3D.PROJECTION_PERSPECTIVE
	fov = Ajustes.CAMPO_DE_VISAO_DA_CAMERA
	position = Vector3(0.0, Ajustes.CAMERA_ACIMA_DE_ICARO, Ajustes.DISTANCIA_DA_CAMERA)


func _physics_process(delta: float) -> void:
	if alvo == null:
		return
	var desejada := alvo.global_position.y + Ajustes.CAMERA_ACIMA_DE_ICARO
	if desejada > position.y:
		position.y = lerpf(position.y, desejada, 1.0 - exp(-Ajustes.SUAVIDADE_DA_CAMERA * delta))


## Altura da borda de baixo da tela, no plano do jogo (z = 0).
func borda_de_baixo() -> float:
	return position.y - position.z * tan(deg_to_rad(fov / 2.0))
