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
	return
	if level == LevelEnum.LEVEL_1:
		Dialogic.start(Timelines.Intro)
