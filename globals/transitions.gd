extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.size = Global.viewport_size

func fade_in(target: String) -> void:
	get_tree().paused = true
	animation_player.play("fade_in")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(target)
	animation_player.play_backwards("fade_in")
	await animation_player.animation_finished
	get_tree().paused = false