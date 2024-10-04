extends GDTour

const EDITING_MINIGAMES = preload("res://guided_tutorials/editing_minigames.png")
const CONFIGURING_COMBAT_LEVEL_SCENE_PATH = "res://scenes/levels/example_levels/combat_level/example_combat.tscn"

func _build() -> void:
	context_set_2d()
	bubble_set_title("Configurando un combate")
	bubble_add_text(["Vamos a configurar un oponente de un combate"])
	complete_step()
	bubble_add_text([
		"Comencemos abriendo una escena que unicamente tiene al jugador y un combatiente"
	])
	bubble_add_task_open_scene(CONFIGURING_COMBAT_LEVEL_SCENE_PATH)
	highlight_filesystem_paths([CONFIGURING_COMBAT_LEVEL_SCENE_PATH])
	complete_step()
	bubble_add_text([
		"Selecciona al nodo fighter"
	])
	highlight_scene_nodes_by_name(["Fighter"])
	complete_step()
	bubble_add_text([
		"En el [b]Inspector[/b], abre la propiedad In Combat Character"
	])
	highlight_inspector_properties(["in_combat_character"], false)
	complete_step()
	
	bubble_add_text([
		"Ahora, modifica las propiedades hp y attack_power"
	])
	highlight_inspector_properties(["hp", "attack_power"], false)
	complete_step()

	bubble_add_text([
		"Prueba configurar un nuevo combat sprite"
	])
	highlight_inspector_properties(["_combat_sprite"], false)
	complete_step()
	
	bubble_add_text([
		"Finalmente, corre el jugeo para ver la diferencia"
	])
	var play_current_scene_button = EditorInterface.get_base_control().find_children(
		"", "EditorRunBar", true, false
	).front().find_children("", "HBoxContainer", true, false).front()\
	.find_children("", "Button", false, false)[3]
	highlight_controls(
		[play_current_scene_button]
	)
	complete_step()

	bubble_add_text(["Bien hecho!"])
	complete_step()
