extends GDTour

const DOOR_SCENE_PATH = "res://entities/door/door.tscn"
const SIMPLEST_LEVEL_SCENE_PATH = "res://scenes/levels/example_levels/simple_level/simple_level.tscn"
const TILEMAP_EXAMPLE_LEVEL_SCENE_PATH = preload("res://scenes/levels/example_levels/tilemap_example_level/tilemap_example_level.tscn")

func _build() -> void:
	context_set_2d()
	bubble_move_and_anchor(EditorInterface.get_base_control(), Bubble.At.BOTTOM_RIGHT)
	bubble_set_title("Agregando una puerta a otro nivel")
	bubble_add_text(["En este tutorial, aprenderemos como conectar un nivel con otro usando una puerta."])
	complete_step()

	bubble_add_text([
		"Comencemos situandonos en un nivel"
	])
	highlight_filesystem_paths(
		[SIMPLEST_LEVEL_SCENE_PATH]
	)
	bubble_add_task_open_scene(
		SIMPLEST_LEVEL_SCENE_PATH, "Abre la escena simple_level.tscn"
	)
	complete_step()

	context_set_2d()
	# This is used to clear any search filter
	queue_command(func():
		EditorInterface.get_file_system_dock().navigate_to_path("res://")
	)
	bubble_add_task_instantiate_scene(
		DOOR_SCENE_PATH,
		"Door",
		"SimpleLevel",
		"Agreguemos la escena door.tscn al nivel"
	)
	highlight_scene_nodes_by_name(["SimpleLevel"])
	highlight_filesystem_paths([
		DOOR_SCENE_PATH
	])
	complete_step()


	bubble_add_text([
		"Ubiquemos el nuevo en el nivel"
	])
	bubble_add_task_select_nodes_by_path(
		["SimpleLevel/Door"],
		"Selecciona el nodo"
	)
	complete_step()

	bubble_add_text([
		"Ahora, configuremos la puerta para que lleve a un nivel"
	])
	highlight_inspector_properties(["next_scene"], true)
	bubble_add_task_set_node_property(
		"Door",
		"next_scene",
		TILEMAP_EXAMPLE_LEVEL_SCENE_PATH.resource_path,
		"Configura la puerta para que lleve al nivel [b]%s[/b]" % TILEMAP_EXAMPLE_LEVEL_SCENE_PATH.resource_path.get_file() +
			"\n\nPuedes encontrarlo en:\nscenes > levels > example_levels > tilemap_example_level.tscn"
	)
	complete_step()
	
	bubble_add_text([
		"Problemos la escena, al interactuar con la puerta debería cargarte el nuevo nivel."
	])
	var play_current_scene_button = EditorInterface.get_base_control().find_children(
		"", "EditorRunBar", true, false
	).front().find_children("", "HBoxContainer", true, false).front()\
	.find_children("", "Button", false, false)[3]
	highlight_controls(
		[play_current_scene_button]
	)
	complete_step()

	bubble_add_text(["¡Bien hecho!"])
	complete_step()


	
