class_name Character
extends CharacterBody2D

@export var speed: float = 100.0 # pixels per second

@onready var player_sprite: Sprite2D = $TemporaryTestPlayerSprite
@onready var interaction_area: Area2D = $InteractionArea
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var interaction_target: Node2D

func _ready() -> void:
	interaction_area.area_entered.connect(handle_area_entered)
	interaction_area.area_exited.connect(handle_area_exited)

func _process(_delta: float) -> void:
	handle_player_orientation()

func _physics_process(_delta: float) -> void:
	handle_player_movement()
	move_and_slide()

func handle_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("interact"):
		interaction_target = area.get_parent()
		animation_player.play("interact_notification")

func handle_area_exited(area: Area2D) -> void:
	if area.get_parent().has_method("interact"):
		interaction_target = null
		animation_player.play_backwards("interact_notification")

func handle_player_movement() -> void:
	if Global.pause_inputs: return
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

func handle_player_orientation() -> void:
	if velocity.x != 0:
		player_sprite.rotation = - (PI / 2) if velocity.x < 0 else (PI / 2)
	elif velocity.y != 0:
		player_sprite.rotation = 0.0 if velocity.y < 0 else PI

func pickup(node: Node2D):
	print(node)

func _input(event: InputEvent) -> void:
	if Global.pause_inputs: return
	if event.is_action_released("interact") && interaction_target != null:
		interaction_target.interact()