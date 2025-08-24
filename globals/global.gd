extends Node

# For dev purposes
# TODO: SET ALL TO FALSE BEFORE SUBMISSION
const IS_DEV: bool = true
const SKIP_MAIN_MENU: bool = false

# others
var viewport_size: Vector2

func _ready() -> void:
    viewport_size = get_viewport().get_visible_rect().size