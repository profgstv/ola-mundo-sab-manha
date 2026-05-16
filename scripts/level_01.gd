extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.criar_dialogo(
		"Bem vindos!",
		"Utilize as setas direcionais do teclado para se movimentar no mapa. Para sair do jogo pressione Alt + F4.",
		["Ok."], 
		[func(): Global.destruir_dialogo()],
		$"."
	)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
