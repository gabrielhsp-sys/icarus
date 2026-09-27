extends Node
## Autoload "Sons": toca um som pelo nome. Cada nome procura um arquivo em assets/audio/
## (ex.: assets/audio/pulo.ogg). Enquanto o arquivo não existir, o som fica em silêncio,
## sem erro. Para acrescentar um som novo, ponha o nome em NOMES.

const PASTA := "res://assets/audio/"
const NOMES := ["pulo", "plataforma_quebrando", "flecha", "asas", "poder", "dano"]
const EXTENSOES := ["ogg", "wav", "mp3"]

var _sons := {}


func _ready() -> void:
	for nome in NOMES:
		for extensao in EXTENSOES:
			var caminho: String = PASTA + nome + "." + extensao
			if ResourceLoader.exists(caminho):
				_sons[nome] = load(caminho)
				break


func tocar(nome: String) -> void:
	var som: AudioStream = _sons.get(nome)
	if som == null:
		return
	var tocador := AudioStreamPlayer.new()
	tocador.stream = som
	add_child(tocador)
	tocador.finished.connect(tocador.queue_free)
	tocador.play()


func tem_arquivo(nome: String) -> bool:
	return _sons.has(nome)
