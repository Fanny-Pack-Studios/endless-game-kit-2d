extends GDTour

const CONFIGURING_NPCS_LEVEL_SCENE_PATH = "res://scenes/levels/example_levels/configuring_npcs_level.tscn"

func _build() -> void:
	bubble_set_title("Configurando NPCs")
	bubble_add_text(["Ahora aprenderemos como modificar el comportamiento default de los npcs"])
	complete_step()
	bubble_add_text([
		"Comencemos abriendo una escena que ya cuenta con varios personajes"
	])
	bubble_add_task_open_scene(CONFIGURING_NPCS_LEVEL_SCENE_PATH)
	highlight_filesystem_paths([CONFIGURING_NPCS_LEVEL_SCENE_PATH])
	complete_step()
	bubble_add_text([
		"Vamos a aprender a modificar los nodos a través de configurar sus propiedades en el [b]Inspector[/b]"
	])
	complete_step()
	highlight_scene_nodes_by_name(["Talker"])
	bubble_add_text(["Selecciona el nodo Talker en el arbol de escenas"])
	complete_step()
	highlight_inspector_properties([
		"npc_name",
		"line"
	], false)
	bubble_add_text([
		"En el [b]Inspector[/b] podemos ver que el personaje tiene varias propiedades",
		"- Npc Name",
		"- Line",
		"- Interaction name",
		"- etc..."
	])
	complete_step()
	bubble_add_text([
		"Modifica el Npc Name y el Line para que digan otra cosa, y prueba el juego"
	])
	highlight_inspector_properties([
		"npc_name",
		"line"
	], false)
	complete_step()
	bubble_add_text([
		"Algunos NPCs tienen propiedades más complejas",
		"Selecciona el nodo Trader"
	])
	highlight_scene_nodes_by_name(["Trader"])
	complete_step()
	highlight_inspector_properties([
		"item_i_give",
		"item_i_want"
	], false)
	bubble_add_text([
		"Cambia el tipo de item que pide y el tipo de item que vende"
	])
	complete_step()
	bubble_add_text([
		"Finalmente, no solo los NPC pueden configurarse",
		"Prueba configurar un item para que sea de otro tipo"
	])
	highlight_scene_nodes_by_name(["Item"])
	complete_step()
	bubble_add_text(["Bien hecho!"])
	complete_step()
