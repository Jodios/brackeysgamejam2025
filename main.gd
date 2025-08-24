extends Node2D

@onready var start_button = $TempStartButton
@onready var quit_button = $TempQuitButton

func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	if Global.SKIP_MAIN_MENU:
		_on_start_button_pressed()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(Scenes.Level1)

func _on_quit_button_pressed() -> void:
	get_tree().quit()