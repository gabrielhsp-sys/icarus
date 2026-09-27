class_name Plataforma
extends AnimatableBody3D
## Base de todas as plataformas. A plataforma fixa usa este script sem mudança; as outras
## (móvel, instável, pula-pula) estendem este e mudam só o que precisam.
## A origem da cena fica no topo da plataforma, onde Ícaro pisa.
##
## Atravessável por baixo (padrão provisório da Programação): enquanto os pés de Ícaro
## estão abaixo do topo, a plataforma não colide com ele.

const FOLGA := 0.05

var _icaro: Icaro
var _atravessavel := false


func _physics_process(_delta: float) -> void:
	_atualizar_passagem()


## Ícaro pisou nesta plataforma e vai saltar.
func ao_ser_pisada() -> void:
	pass


## Quanto o salto sai mais forte desta plataforma (1 = normal).
func multiplicador_do_salto() -> float:
	return 1.0


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
