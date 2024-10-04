extends Node

var previous_scene: Node
var current_scene: Node

func _ready():
	await get_tree().process_frame
	
	current_scene = get_tree().current_scene
	if(current_scene):
		current_scene.reparent(self)


func change_scene_to(next_scene: Node) -> void:
	if(current_scene == null):
		return

	previous_scene = current_scene
	current_scene = next_scene

	if(previous_scene):
		remove_child(previous_scene)

	add_child(current_scene)


func change_scene_to_file(scene_path: String) -> void:
	var scene = load(scene_path).instantiate()
	
	change_scene_to(scene)


func change_scene_to_packed(packed_scene: PackedScene) -> void:
	var scene = packed_scene.instantiate()
	
	change_scene_to(scene)


func back_to_last_scene() -> void:
	if(previous_scene):
		change_scene_to(previous_scene)
