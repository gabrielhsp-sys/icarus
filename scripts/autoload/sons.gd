extends Node
## Autoload "Sons": toca um som pelo nome. Cada nome procura um arquivo em assets/audio/
## (ex.: assets/audio/pulo.ogg). Enquanto o arquivo não existir, o som fica em silêncio,
## sem erro. Para acrescentar um som novo, ponha o nome em NOMES.
## A música tema (assets/audio/musica_tema.ogg) toca em loop da tela inicial ao fim, sem
## recomeçar na troca de cena, porque o tocador vive neste autoload; sem o arquivo, silêncio.

const PASTA := "res://assets/audio/"
const NOMES := ["pulo", "plataforma_quebrando", "flecha", "asas", "poder", "dano",
	"pula_pula", "acerto", "recorde", "clique"]
const MUSICA := "musica_tema"
const EXTENSOES := ["ogg", "wav", "mp3"]

var _sons := {}
var _musica := AudioStreamPlayer.new()


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_musica.name = "Musica"
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


## Começa a música tema em loop (se o arquivo existir). Chamar de novo não reinicia.
func tocar_musica() -> void:
	var musica: AudioStream = _sons.get(MUSICA)
	if not Ajustes.MUSICA or musica == null or _musica.playing:
		return
	# Loop decidido por Gabriel em 2026-09-28: repete o arquivo inteiro, do fim ao segundo 0.
	# O silêncio final foi cortado no próprio .ogg, então o fade-out emenda direto no fade-in.
	if musica is AudioStreamOggVorbis or musica is AudioStreamMP3:
		musica.loop = true
		musica.loop_offset = 0.0
	elif musica is AudioStreamWAV:
		musica.loop_mode = AudioStreamWAV.LOOP_FORWARD
		musica.loop_end = int(musica.get_length() * musica.mix_rate)
	_musica.stream = musica
	_musica.volume_db = Ajustes.VOLUME_DA_MUSICA
	_musica.play()
