extends CanvasLayer

@onready var titulo_label: Label = $Panel/TituloLabel
@onready var mensagem_label: RichTextLabel = $Panel/MensagemLabel
@onready var h_box_container: HBoxContainer = $Panel/HBoxContainer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var titulo: String = "Titulo"
var mensagem: String = "Este é um diálogo."
var nomes_botoes: Array[String] = ["Ok", "Tá bom", "Blz"]
var funcs_botoes: Array[Callable] = [
	func(): print("Botão Ok Pressionado"),
	func(): print("Botão Tá bom Pressionado"),
	func(): print("Botão Blz Pressionado")
]
var mostrar_mensagem: bool = false

func _ready() -> void:
	titulo_label.text = titulo
	mensagem_label.text = mensagem
	for index in nomes_botoes.size():
		h_box_container.add_child(Button.new())
		h_box_container.get_child(index).text = nomes_botoes[index]
		h_box_container.get_child(index).size_flags_horizontal = 3
		pass
	

func _process(delta: float) -> void:
	if mostrar_mensagem and mensagem_label.visible_ratio < 1:
		mensagem_label.visible_characters += int(100 * delta)
	elif mostrar_mensagem and mensagem_label.visible_ratio == 1:
		animation_player.play("mostrar_botoes")
	for index in funcs_botoes.size():
		if h_box_container.get_child(index).button_pressed:
			funcs_botoes[index].call()
			pass
		pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "start":
		mostrar_mensagem = true
		pass
