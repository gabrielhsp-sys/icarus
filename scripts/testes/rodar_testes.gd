extends SceneTree
## Roda todos os testes da lógica pura sem abrir janela:
##   flatpak run org.godotengine.Godot --headless --path . --script res://scripts/testes/rodar_testes.gd
## Sai com código 0 se tudo passar e 1 se algum teste falhar.

const PASTA := "res://scripts/testes/"


func _initialize() -> void:
	var total := 0
	var falharam := 0
	for arquivo in _arquivos_de_teste():
		var script := load(PASTA + arquivo) as GDScript
		if script == null or not script.can_instantiate():
			print("FALHOU  %s: o arquivo não carregou" % arquivo)
			total += 1
			falharam += 1
			continue
		for metodo in script.get_script_method_list():
			var nome: String = metodo["name"]
			if not nome.begins_with("teste_"):
				continue
			total += 1
			var caso: CasoDeTeste = script.new()
			caso.call(nome)
			if caso.assercoes == 0:
				caso.falhas.append("nenhuma asserção rodou (erro no teste?)")
			if caso.falhas.is_empty():
				print("ok      %s › %s" % [arquivo.get_basename(), nome])
			else:
				falharam += 1
				for falha in caso.falhas:
					print("FALHOU  %s › %s — %s" % [arquivo.get_basename(), nome, falha])
	print("\n%d testes, %d falharam" % [total, falharam])
	quit(0 if falharam == 0 and total > 0 else 1)


func _arquivos_de_teste() -> PackedStringArray:
	var lista := PackedStringArray()
	for arquivo in DirAccess.get_files_at(PASTA):
		if arquivo.begins_with("teste_") and arquivo.ends_with(".gd"):
			lista.append(arquivo)
	lista.sort()
	return lista
