extends Node2D

@export var strength: float = 30.0
@export var fade: float = 30.0
@export var shaked_node: CanvasItem :
	set(new_node):
		shaked_node = new_node
		shaked_node_original_position = shaked_node.position

@export var current_vibration: float = 0.0
@onready var shaked_node_original_position = shaked_node.position

func shake():
	current_vibration = strength

func _process(delta):
	if not is_instance_valid(shaked_node):
		return
	current_vibration = move_toward(current_vibration, 0, delta * fade)
	var shake_offset = Vector2(
		randf_range(-current_vibration, current_vibration),
		randf_range(-current_vibration, current_vibration)
	)
	shaked_node.position = shaked_node_original_position + shake_offset
