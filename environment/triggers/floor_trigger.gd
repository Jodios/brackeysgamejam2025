class_name FloorTrigger
extends Node2D

@export var target: Node2D
@export var timeout: float = 1.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var trigger_area: Area2D = $TriggerArea

func _ready():
	trigger_area.body_entered.connect(on_body_entered)
	trigger_area.body_exited.connect(on_body_exited)

func on_body_entered(body: Node) -> void:
	if body is Character:
		if target.has_method("trigger"):
			target.call("trigger")
		animation_player.play("activate")

func on_body_exited(body: Node) -> void:
	if body is Character:
		get_tree().create_timer(timeout).timeout.connect(func():
			if target.has_method("trigger"):
				target.call("trigger")
		)
		animation_player.play_backwards("activate")
