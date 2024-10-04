extends GDTour

const TALKER_SCENE_PATH = "res://entities/prefabs/npcs/talker/talker.tscn"
const TRADER_SCENE_PATH = "res://entities/prefabs/npcs/trader/trader.tscn"
const FIGHTER_SCENE_PATH = "res://entities/prefabs/npcs/fighter/fighter.tscn"
const GUARD_SCENE_PATH = "res://entities/prefabs/npcs/guard/guard.tscn"
const FIGHTER_WITH_REWARD_SCENE_PATH = "res://entities/prefabs/npcs/fighter/fighter_with_reward.tscn"
const SIMPLEST_LEVEL_SCENE_PATH = "res://scenes/levels/example_levels/simple_level/simple_level.tscn"

func _build() -> void:
	context_set_2d()
	bubble_set_title("Agregando un NPC")
	bubble_add_text(["Buenas, vamos a aprender a agregar un personaje"])
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
	bubble_add_text([
		"Agreguemos un personaje con el cual hablar"
	])
	clear_mouse()
	highlight_filesystem_paths([TALKER_SCENE_PATH])
	highlight_scene_nodes_by_path(["."])
	bubble_add_task_instantiate_scene(
		TALKER_SCENE_PATH,
		"Talker",
		"SimpleLevel",
		"Arrastra talker.tscn al árbol de nodos de la escena como hijo de SimpleLevel")
	complete_step()

	bubble_add_text([
		"Movamos al personaje más cerca del jugador"
	])
	bubble_add_task_select_nodes_by_path(
		["SimpleLevel/Talker"],
		"Selecciona el nodo Talker que acabamos de agregar"
	)
	complete_step()
	
	

	bubble_add_text([
		"Problemos la escena"
	])
	var play_current_scene_button = EditorInterface.get_base_control().find_children(
		"", "EditorRunBar", true, false
	).front().find_children("", "HBoxContainer", true, false).front()\
	.find_children("", "Button", false, false)[3]
	highlight_controls(
		[play_current_scene_button]
	)
	complete_step()

	bubble_add_text([
		"Puedes probar agregando diferentes NPCs al nivel y corriendo el juego para interactuar con ellos"
	])
	highlight_filesystem_paths([
		TALKER_SCENE_PATH,
		TRADER_SCENE_PATH,
		GUARD_SCENE_PATH,
		FIGHTER_SCENE_PATH,
		FIGHTER_WITH_REWARD_SCENE_PATH
	], false)
	complete_step()

	bubble_add_text(["¡Bien hecho!"])
	complete_step()


	
