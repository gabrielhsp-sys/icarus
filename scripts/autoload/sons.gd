extends Node
## Autoload "Sons": toca um som pelo nome. Cada nome procura um arquivo em assets/audio/
## (ex.: assets/audio/pulo.ogg). Enquanto o arquivo não existir, o som fica em silêncio,
## sem erro. Para acrescentar um som novo, ponha o nome em NOMES.
## A música de fundo (assets/audio/musica.ogg) toca em loop; sem o arquivo, silêncio.

const PASTA := "res://assets/audio/"
const NOMES := ["pulo", "plataforma_quebrando", "flecha", "asas", "poder", "dano",
	"pula_pula", "acerto", "recorde", "clique"]
const MUSICA := "musica"
const EXTENSOES := ["ogg", "wav", "mp3"]

var _sons := {}
var _musica := AudioStreamPlayer.new()


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(_musica)
	for nome in NOMES + [MUSICA]:
		for extensao in EXTENSOES:
			var caminho: String = PASTA + nome + "." + extensao
			if ResourceLoader.exists(caminho):
				_sons[nome] = load(caminho)
				break


func tocar(nome: String) -> void:
	if not nome in NOMES:
		push_warning("Som sem nome registrado em Sons.NOMES: %s" % nome)
		return
	var som: AudioStream = _sons.get(nome)
	if som == null:
		return
	var tocador := AudioStreamPlayer.new()
	tocador.stream = som
	add_child(tocador)
	tocador.finished.connect(tocador.queue_free)
	tocador.play()


## Começa a música de fundo em loop (se o arquivo existir). Chamar de novo não reinicia.
func tocar_musica() -> void:
	var musica: AudioStream = _sons.get(MUSICA)
	if not Ajustes.MUSICA or musica == null or _musica.playing:
		return
	if musica is AudioStreamOggVorbis or musica is AudioStreamMP3:
		musica.loop = true
	elif musica is AudioStreamWAV:
		musica.loop_mode = AudioStreamWAV.LOOP_FORWARD
		musica.loop_end = int(musica.get_length() * musica.mix_rate)
	_musica.stream = musica
	_musica.play()
