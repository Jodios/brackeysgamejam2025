extends Node

# Global Script for inputs

func _input(event: InputEvent) -> void:
	if Global.IS_DEV && event.is_action_released("exit"):
		get_tree().quit()