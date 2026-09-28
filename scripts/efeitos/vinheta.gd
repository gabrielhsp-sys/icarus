extends CanvasLayer
## Vinheta leve (Ajustes.VINHETA) e flash vermelho nas bordas quando Ícaro leva dano
## (Ajustes.FLASH_DE_DANO; mais fraco com Ajustes.REDUZIR_FLASHES).

@onready var _material: ShaderMaterial = $Tela.material


func _ready() -> void:
	_material.set_shader_parameter("forca", Ajustes.FORCA_DA_VINHETA if Ajustes.VINHETA else 0.0)
	Efeitos.flash_de_dano_pedido.connect(_piscar_vermelho)


func _piscar_vermelho() -> void:
	var forca := Ajustes.FATOR_DOS_FLASHES_REDUZIDOS if Ajustes.REDUZIR_FLASHES else 0.85
	var flash := create_tween()
	flash.tween_method(func(v: float) -> void: _material.set_shader_parameter("dano", v), forca, 0.0, 0.45)
