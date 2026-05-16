extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite

var sprite_direction := "down"

const SPEED = 300.0

func sprite_animation(dir, mov):
	sprite_direction = dir
	sprite.play(mov + "_" + dir)

func _physics_process(_delta) -> void:
	#movimento
	var direction := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
		)
	
	velocity = direction.normalized() * SPEED

	move_and_slide()
	
	#animação
	if velocity.x > 0:
		sprite_animation("right", "run")
	elif velocity.x < 0:
		sprite_animation("left", "run")
	elif velocity.y > 0:
		sprite_animation("down", "run")
	elif velocity.y < 0:
		sprite_animation("up", "run")
	else:
		sprite_animation(sprite_direction, "idle")

func _process(_delta: float) -> void:
	set_physics_process(! Global.dialogo_esta_ativo)
	if Global.dialogo_esta_ativo:
		sprite_animation(sprite_direction, "idle")
	pass
