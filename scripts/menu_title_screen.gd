extends Panel

@onready var start_button = $Jogar
@onready var quit_button = $Sair

func _ready():
	start_button.grab_focus()
	pass

func _process(_delta):
	if start_button.is_hovered():
		start_button.grab_focus()
	elif quit_button.is_hovered():
		quit_button.grab_focus()
	pass


func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://scenes/level01.tscn")

func _on_sair_pressed():
	get_tree().quit()
