@tool
extends Sprite2D

func _process(_delta):
	visible = Engine.is_editor_hint() and owner == get_tree().edited_scene_root
