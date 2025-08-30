class_name Level
extends Node2D

# enum for levels
enum LevelEnum {
	LEVEL_1,
	LEVEL_2,
	LEVEL_3
}

@export var level: LevelEnum = LevelEnum.LEVEL_1
var open_walls: Array[WallClass] = []

func _ready() -> void:
	Global.satisfy_conditions_changed.connect(on_satisfy_condition)
	for wall in get_tree().get_nodes_in_group("has_conditions"):
		if wall is WallClass:
			open_walls.append(wall)

func on_satisfy_condition(conditions: Array[Global.Condition]) -> void:
	for wall in open_walls:
		wall.satisfied_conditions = wall.satisfied_conditions + conditions
		if wall.check_conditions():
			wall.trigger()
