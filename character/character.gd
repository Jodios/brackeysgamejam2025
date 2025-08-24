extends CharacterBody2D

@export var speed: float = 10000.0

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	handle_player_movement(delta)
	move_and_slide()

func handle_player_movement(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed * delta