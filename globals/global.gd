extends Node

# For dev purposes
# TODO: SET ALL TO FALSE BEFORE SUBMISSION
const IS_DEV: bool = true
const SKIP_MAIN_MENU: bool = true

# others
var viewport_size: Vector2
var biscuits: int = 0
var pause_inputs: bool = false

enum Condition {
    SATISFIED_BISCUIT_EATER
}
signal satisfy_conditions_changed(condition: Array[Condition])

func _ready() -> void:
    viewport_size = get_viewport().get_visible_rect().size
    Signals.add_biscuit.connect(on_add_biscuit)
    Signals.lose_biscuits.connect(on_lose_biscuits)
    Dialogic.signal_event.connect(_on_dialogic_signal_event)
    Dialogic.timeline_started.connect(on_dialog_started)
    Dialogic.timeline_ended.connect(on_dialog_ended)

func _on_dialogic_signal_event(event) -> void:
    if event is Dictionary && "name" in event:
        if event["name"] == "lose_biscuits":
            Signals.lose_biscuits.emit(event["amount"])

func satisfy_conditions(conditions: Array) -> void:
    var new_conditions: Array[Condition] = []
    new_conditions.assign(conditions)
    satisfy_conditions_changed.emit(new_conditions)

func on_dialog_started() -> void:
    pause_inputs = true

func on_dialog_ended() -> void:
    pause_inputs = false

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