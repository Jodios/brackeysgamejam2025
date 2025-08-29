class_name GameContainer
extends Node2D

var canvas_layer: CanvasLayer
var subviewport_container: SubViewportContainer
var subviewport: SubViewport

# some real tomfoolery happening here. 
# Having to make the actual game render at a different resolution
# than the UI portion of it so I need to use a different viewport for it. 
# Pretty neat thing I've never had to do before though.
func _ready():
	var level = get_child(0)
	canvas_layer = CanvasLayer.new()
	subviewport_container = SubViewportContainer.new()
	subviewport_container.stretch = true
	subviewport_container.stretch_shrink = 3
	subviewport_container.set_anchors_preset(Control.PRESET_FULL_RECT)
	canvas_layer.add_child(subviewport_container)
	subviewport = SubViewport.new()
	subviewport_container.add_child(subviewport)
	subviewport.snap_2d_transforms_to_pixel = true
	level.reparent(subviewport)
	add_child(canvas_layer)
