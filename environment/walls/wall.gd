class_name WallClass
extends Node2D

enum WallType {
	SOLID,
	OPENING,
}

@export var wall_type: WallType = WallType.SOLID
@onready var solid_wall: StaticBody2D = $SolidWall
@onready var opening_wall: StaticBody2D = $OpeningWall
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_open: bool = false

signal open

func _ready() -> void:
	# I know this can get messy but it's fine
	# for game jam
	if wall_type == WallType.OPENING:
		open.connect(on_open)
		solid_wall.process_mode = Node.PROCESS_MODE_DISABLED
		solid_wall.visible = false
		opening_wall.visible = true
	elif wall_type == WallType.SOLID:
		opening_wall.process_mode = Node.PROCESS_MODE_DISABLED
		opening_wall.visible = false
		solid_wall.visible = true

func on_open() -> void:
	is_open = !is_open
	if is_open:
		animation_player.play("open")
	else:
		animation_player.play_backwards("open")
