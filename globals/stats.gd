extends CanvasLayer

@onready var biscuits_label: Label = $BiscuitsLabel

func _ready():
	pass

func _process(_delta: float) -> void:
	biscuits_label.text = "Biscuits: " + str(Global.biscuits)