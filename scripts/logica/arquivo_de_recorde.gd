class_name ArquivoDeRecorde
extends RefCounted
## Salva e lê o recorde num arquivo do computador de quem joga (user://recorde.cfg).
## Com o Godot do Flathub (Linux) fica em ~/.var/app/org.godotengine.Godot/data/godot/app_userdata/Icarus/;
## no Windows, em %APPDATA%\Godot\app_userdata\Icarus\. Apagar o arquivo zera o recorde.

const CAMINHO_PADRAO := "user://recorde.cfg"
const SECAO := "recorde"


static func salvar(recorde: Recorde, caminho := CAMINHO_PADRAO) -> Error:
	var arquivo := ConfigFile.new()
	var dados := recorde.para_dados()
	for chave in dados:
		arquivo.set_value(SECAO, chave, dados[chave])
	return arquivo.save(caminho)


static func ler(caminho := CAMINHO_PADRAO) -> Recorde:
	var arquivo := ConfigFile.new()
	if arquivo.load(caminho) != OK:
		return Recorde.new()
	var dados := {}
	for chave in ["melhor_score", "melhor_altura", "altura_anterior"]:
		dados[chave] = arquivo.get_value(SECAO, chave, 0)
	return Recorde.de_dados(dados)
