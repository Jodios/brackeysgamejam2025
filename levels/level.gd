class_name Level
extends Node2D

@onready var button: Button = $Button
@onready var walls: Node2D = $Walls
var open_walls: Array[WallClass] = []

func _ready() -> void:
	button.pressed.connect(on_button_pressed)
	for child in walls.get_children():
		if child is WallClass && child.wall_type == WallClass.WallType.OPENING:
			open_walls.append(child)

func on_button_pressed() -> void:
	for wall in open_walls:
		wall.open.emit()