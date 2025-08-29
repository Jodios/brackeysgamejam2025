class_name Character
extends CharacterBody2D

@export var speed: float = 100.0 # pixels per second

@onready var player_sprite: Sprite2D = $TemporaryTestPlayerSprite

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	handle_player_orientation()

func _physics_process(_delta: float) -> void:
	handle_player_movement()
	move_and_slide()

func handle_player_movement() -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

func handle_player_orientation() -> void:
	if velocity.x != 0:
		player_sprite.rotation = - (PI / 2) if velocity.x < 0 else (PI / 2)
	elif velocity.y != 0:
		player_sprite.rotation = 0.0 if velocity.y < 0 else PI

func pickup(node: Node2D):
	print(node)
