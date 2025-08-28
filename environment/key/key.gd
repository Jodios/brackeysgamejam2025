class_name Key
extends Node2D

@onready var area: Area2D = $Area2D

func _ready() -> void:
	area.body_entered.connect(on_body_entered)

func on_body_entered(body: Node) -> void:
	if body is Character:
		(body as Character).pickup(self)
