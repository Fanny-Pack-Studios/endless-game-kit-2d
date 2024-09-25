@tool
extends GDTour
const UI_TUTORIAL = preload("res://guided_tutorials/ui_tutorial.tscn")

func _build() -> void:
	UI_TUTORIAL.instantiate().build(self)
	
