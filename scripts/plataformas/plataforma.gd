class_name Plataforma
extends AnimatableBody3D
## Base de todas as plataformas. A plataforma fixa usa este script sem mudança; as outras
## (móvel, instável, pula-pula) estendem este e mudam só o que precisam.
## A origem da cena fica no topo da plataforma, onde Ícaro pisa.
##
## Atravessável por baixo (padrão provisório da Programação): enquanto os pés de Ícaro
## estão abaixo do topo, a plataforma não colide com ele.

const FOLGA := 0.05

const COR_DA_POEIRA := Color(1.0, 0.97, 0.9, 0.85)

var _icaro: Icaro
var _atravessavel := false


func _ready() -> void:
	EstiloToon.aplicar(get_node_or_null("Visual"))


func _physics_process(_delta: float) -> void:
	_atualizar_passagem()


## Ícaro pisou nesta plataforma (em `onde`) e vai saltar. A resposta comum a todas (poeira
## e afundar) fica aqui; cada tipo acrescenta a sua em _quando_pisada().
func ao_ser_pisada(onde := global_position) -> void:
	if Ajustes.POEIRA_NO_POUSO:
		Efeitos.poeira(Vector3(onde.x, global_position.y, 0.3), COR_DA_POEIRA)
	if Ajustes.PLATAFORMA_AFUNDA:
		_afundar()
	_quando_pisada()


## Cada tipo de plataforma muda só isto.
func _quando_pisada() -> void:
	pass


## Quanto o salto sai mais forte desta plataforma (1 = normal).
func multiplicador_do_salto() -> float:
	return 1.0


func _afundar() -> void:
	var visual := get_node_or_null("Visual") as Node3D
	if visual == null:
		return
	var afunda := create_tween()
	afunda.tween_property(visual, "position:y", -Ajustes.QUANTO_A_PLATAFORMA_AFUNDA, 0.06)
	afunda.tween_property(visual, "position:y", 0.0, 0.22).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


func _atualizar_passagem() -> void:
	if not is_instance_valid(_icaro):
		_icaro = get_tree().get_first_node_in_group("icaro") as Icaro
		if _icaro == null:
			return
	var abaixo_do_topo := _icaro.global_position.y < global_position.y - FOLGA
	if abaixo_do_topo == _atravessavel:
		return
	_atravessavel = abaixo_do_topo
	if _atravessavel:
		_icaro.add_collision_exception_with(self)
	else:
		_icaro.remove_collision_exception_with(self)
