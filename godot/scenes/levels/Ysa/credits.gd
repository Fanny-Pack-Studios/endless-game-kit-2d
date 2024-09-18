extends Node2D

@export var main_menu_scene: PackedScene  # Exporta la escena del menú principal
@onready var regresar_button = $Button


func _ready() -> void:
	regresar_button.pressed.connect(_on_regresar_button_pressed)

# Función para cambiar a la escena del menú principal
func _on_regresar_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu_scene)
