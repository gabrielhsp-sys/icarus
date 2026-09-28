extends Node3D
## Linha no cenário na altura do recorde ou da partida anterior ("você chegou até aqui").
## Brilha quando Ícaro passa dela. Meta provisória; liga/desliga: Ajustes.MARCAS_DE_ALTURA.

@onready var _linha: MeshInstance3D = $Linha
@onready var _texto: Label3D = $Texto

var _material: StandardMaterial3D


func configurar(texto: String, cor: Color) -> void:
	_material = _linha.material_override.duplicate()
	_material.albedo_color = cor
	_linha.material_override = _material
	_texto.text = texto
	_texto.modulate = cor


func brilhar() -> void:
	Sons.tocar("recorde")
	for x in [-8.0, -4.0, 0.0, 4.0, 8.0]:
		Efeitos.estouro(global_position + Vector3(x, 0.0, 0.0), _material.albedo_color, 10, 3.0)
	var brilho := create_tween().set_parallel()
	brilho.tween_property(_linha, "scale:y", 4.0, 0.15)
	brilho.tween_property(_material, "albedo_color", Color.WHITE, 0.15)
	brilho.chain().tween_property(_linha, "scale:y", 1.0, 0.5)
	brilho.tween_property(_texto, "modulate:a", 0.35, 0.5)
