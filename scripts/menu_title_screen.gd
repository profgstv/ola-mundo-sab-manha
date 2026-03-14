extends Panel

@onready var start_button = $Jogar
@onready var quit_button = $Sair


# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.grab_focus()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if start_button.is_hovered():
		start_button.grab_focus()
	elif quit_button.is_hovered():
		quit_button.grab_focus()
	pass


func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_sair_pressed():
	get_tree().quit()
