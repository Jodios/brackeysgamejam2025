class_name BiscuitEater
extends CharacterBody2D

@onready var interaction_area: Area2D = $InteractArea
@onready var audioTween
var dialogOpen = false;

func _ready() -> void:
	interaction_area.body_entered.connect(on_body_entered)

func on_body_entered(body: Node) -> void:
	if body is Character:
		dialogOpen = true;
		Dialogic.start(Timelines.Tutorial)
		switch_to_dialogue()
		Dialogic.timeline_ended.connect(switch_to_main)

# i have no idea how to grab the global vars for volume so this is bad
# also don't know how to just have these as global vars lol
# can also just static set one to -80 and the other to 0 but 
func switch_to_dialogue():
	if audioTween != null:
		audioTween.kill()
	audioTween = create_tween()
	audioTween.set_parallel(true).set_trans(audioTween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	audioTween.tween_property($"../MusicDefault", "volume_db", linear_to_db(0.1), 0.75).from(linear_to_db(1.0))
	audioTween.tween_property($"../MusicDialogue", "volume_db", linear_to_db(1.0), 0.75).from(linear_to_db(0.1))
	audioTween.play()
	
	
func switch_to_main():
	if audioTween != null:
		audioTween.kill()
	audioTween = create_tween()
	audioTween.set_parallel(true).set_trans(audioTween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	audioTween.tween_property($"../MusicDefault", "volume_db", linear_to_db(1.0), 0.75).from(linear_to_db(0.1))
	audioTween.tween_property($"../MusicDialogue", "volume_db", linear_to_db(0.1), 0.75).from(linear_to_db(1.0))
	audioTween.play()
