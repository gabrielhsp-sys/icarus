class_name EstiloToon
extends RefCounted
## Aplica o toon shading e o contorno a todas as malhas de um nó (e dos filhos). Lê a cor do
## material original, então funciona também com os .glb que a equipe 3D mandar. Materiais
## sem sombra (os itens de poder 2D, por exemplo) ficam como estão.
## Liga/desliga: Ajustes.TOON_E_CONTORNO.

const SHADER_TOON := preload("res://assets/shaders/toon.gdshader")
const SHADER_CONTORNO := preload("res://assets/shaders/contorno.gdshader")

static var _cache := {}


static func aplicar(raiz: Node) -> void:
	if not Ajustes.TOON_E_CONTORNO or raiz == null:
		return
	var malhas: Array = raiz.find_children("*", "MeshInstance3D", true, false)
	if raiz is MeshInstance3D:
		malhas.append(raiz)
	for malha: MeshInstance3D in malhas:
		if malha.mesh == null:
			continue
		for superficie in malha.mesh.get_surface_count():
			var original := malha.get_active_material(superficie)
			if original is StandardMaterial3D and original.shading_mode == BaseMaterial3D.SHADING_MODE_UNSHADED:
				continue
			var cor := Color.WHITE
			if original is StandardMaterial3D:
				cor = original.albedo_color
			malha.set_surface_override_material(superficie, material_da_cor(cor))


## Um material toon (com o contorno como segunda passada) por cor, compartilhado.
static func material_da_cor(cor: Color) -> ShaderMaterial:
	var chave := cor.to_html()
	if _cache.has(chave):
		return _cache[chave]
	var contorno := ShaderMaterial.new()
	contorno.shader = SHADER_CONTORNO
	contorno.set_shader_parameter("cor", Ajustes.COR_DO_CONTORNO)
	contorno.set_shader_parameter("espessura", Ajustes.ESPESSURA_DO_CONTORNO)
	var toon := ShaderMaterial.new()
	toon.shader = SHADER_TOON
	toon.set_shader_parameter("cor", cor)
	toon.set_shader_parameter("faixas", Ajustes.FAIXAS_DE_SOMBRA)
	toon.set_shader_parameter("sombra_minima", Ajustes.SOMBRA_MINIMA)
	toon.set_shader_parameter("borda_de_luz", Ajustes.BORDA_DE_LUZ)
	toon.next_pass = contorno
	_cache[chave] = toon
	return toon
