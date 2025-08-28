extends Node

# For dev purposes
# TODO: SET ALL TO FALSE BEFORE SUBMISSION
const IS_DEV: bool = true
const SKIP_MAIN_MENU: bool = true

# others
var viewport_size: Vector2
var biscuits: int = 0

func _ready() -> void:
    viewport_size = get_viewport().get_visible_rect().size
    Signals.add_biscuit.connect(on_add_biscuit)
    Signals.lose_biscuits.connect(on_lose_biscuits)

# This cannot be in stats itself because disabling
# process_mode you wouldn't be able to call enable 
# on it anymore. 
func disable_stats():
    Stats.visible = false
    Stats.process_mode = Node.PROCESS_MODE_DISABLED

func enable_stats():
    Stats.visible = true
    Stats.process_mode = Node.PROCESS_MODE_INHERIT

func on_add_biscuit(n: int) -> void:
    biscuits += n

func on_lose_biscuits(n: int) -> void:
    biscuits -= n