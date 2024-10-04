extends GDTour

const CONFIGURING_NPCS_LEVEL_SCENE_PATH = "res://scenes/levels/example_levels/npcs_example_level/npcs_example_level.tscn"

func _build() -> void:
	context_set_2d()
	bubble_set_title("Configurando NPCs: %s" % gtr("Welcome to Godot Tour!"))
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
	bubble_add_task_select_nodes_by_path(["ExampleLevel/Talker"], "Selecciona el nodo Talker en el arbol de escenas")
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
	bubble_add_task_set_node_property("Talker", "npc_name", "Carlos", "Cambia el nombre del npc a Carlos")
	bubble_add_task_set_node_property("Talker", "line", "Buen Dia", "Cambia lo que te dice el NPC a Buen Dia")
	complete_step()

	bubble_add_text([
		"Algunos NPCs tienen propiedades más complejas",
		"Selecciona el nodo Trader"
	])
	bubble_add_task_select_nodes_by_path(["ExampleLevel/Trader"], "Selecciona el nodo Trader")
	highlight_scene_nodes_by_name(["Trader"])
	complete_step()

	spatial_editor_focus_node_by_paths(["ExampleLevel/Trader"])
	highlight_inspector_properties([
		"item_i_give",
		"item_i_want"
	], false)
	bubble_add_text([
		"Cambia el tipo de item que pide y el tipo de item que vende"
	])
	bubble_add_task_set_node_property("Trader", "item_i_want", Item.Type.Oveja, "Cambia el item que pide a Ovejas")
	bubble_add_task_set_node_property("Trader", "item_i_give", Item.Type.Tronco, "Cambia el item que da a Troncos")
	complete_step()

	bubble_add_text([
		"Finalmente, no solo los NPC pueden configurarse"
	])
	highlight_scene_nodes_by_name(["Item"])
	bubble_add_task_select_nodes_by_path(["ExampleLevel/Item"], "Selecciona el nodo Item")
	complete_step()

	highlight_inspector_properties(["type"])
	bubble_add_task_set_node_property("Item", "type", Item.Type.Hueso, "Prueba configurar el item para que sea de tipo Hueso")
	complete_step()

	bubble_add_text(["Bien hecho!"])
	complete_step()
