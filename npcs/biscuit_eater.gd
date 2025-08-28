class_name BiscuitEater
extends CharacterBody2D

@onready var interaction_area: Area2D = $InteractArea

func _ready() -> void:
	interaction_area.body_entered.connect(on_body_entered)

func on_body_entered(body: Node) -> void:
	if body is Character:
		Dialogic.start(Timelines.TestTimeline)