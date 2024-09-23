extends GDTour

const EDITING_MINIGAMES = preload("res://guided_tutorials/editing_minigames.png")

func _build() -> void:
	bubble_set_title("Configurando un combate")
	bubble_add_text(["Vamos a configurar los minijuegos de un combate"])
	complete_step()
	bubble_add_text([
		"Comencemos abriendo una escena que unicamente tiene al jugador y un combatiente"
	])
	bubble_add_task_open_scene("res://scenes/configuring_combat_level.tscn")
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
		"Ahora, selecciona la subpropiedad Minigames"
	])
	highlight_inspector_properties(["minigames"], false)
	complete_step()
	bubble_add_text([
		"Puedes expandir cada uno de los MultipleChoice existentes clickeandolos",
		"Si quieres agregar más, puedes usar el boton + Add Element"
	])
	bubble_add_texture(EDITING_MINIGAMES, 1200)
	complete_step()
	bubble_add_text(["Bien hecho!"])
	complete_step()
