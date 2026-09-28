extends CasoDeTeste
## Marcas a superar durante a partida: altura do recorde, altura da partida anterior e o
## score do recorde. Cada marca avisa uma vez só, quando é superada.


func teste_marca_avisa_uma_vez_quando_superada() -> void:
	var marcas := Marcas.new({"recorde": 50.0, "anterior": 20.0})
	igual(marcas.verificar(10.0), [], "abaixo das duas, nada")
	igual(marcas.verificar(25.0), ["anterior"], "passou a anterior")
	igual(marcas.verificar(30.0), [], "a anterior não avisa de novo")
	igual(marcas.verificar(80.0), ["recorde"], "passou o recorde")


func teste_marca_zerada_nao_existe() -> void:
	var marcas := Marcas.new({"recorde": 0.0})
	igual(marcas.verificar(5.0), [], "sem recorde ainda, não há o que superar")


func teste_duas_marcas_no_mesmo_passo() -> void:
	var marcas := Marcas.new({"recorde": 50.0, "anterior": 20.0})
	var superadas := marcas.verificar(60.0)
	superadas.sort()
	igual(superadas, ["anterior", "recorde"], "um salto grande passa as duas")
