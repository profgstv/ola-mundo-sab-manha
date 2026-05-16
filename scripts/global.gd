extends Node

const INSTANCIAR_DIALOGO: PackedScene = preload("res://scenes/templates/dialogo.tscn")

var dialogo: CanvasLayer
var dialogo_esta_ativo: bool = false

func criar_dialogo(titulo: String, mensagem: String, nomes_botoes: Array[String], funcs_botoes: Array[Callable], node_atual: Node) -> void:
	dialogo = INSTANCIAR_DIALOGO.instantiate()
	dialogo.titulo = titulo
	dialogo.mensagem = mensagem
	dialogo.nomes_botoes = nomes_botoes
	dialogo.funcs_botoes = funcs_botoes
	dialogo_esta_ativo = true
	node_atual.add_child(dialogo)
	pass

func destruir_dialogo() -> void:
	dialogo_esta_ativo = false
	dialogo.queue_free()
	pass
