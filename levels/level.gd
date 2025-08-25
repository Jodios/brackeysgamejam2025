class_name Level
extends Node2D

@onready var walls: Node2D = $Walls
var open_walls: Array[WallClass] = []

func _ready() -> void:
	for child in walls.get_children():
		if child is WallClass && child.wall_type == WallClass.WallType.OPENING:
			open_walls.append(child)