extends GDTour

const TALKER_SCENE_PATH = "res://entities/prefabs/npcs/talker/talker.tscn"
const TRADER_SCENE_PATH = "res://entities/prefabs/npcs/trader/trader.tscn"
const FIGHTER_SCENE_PATH = "res://entities/prefabs/npcs/fighter/fighter.tscn"
const GUARD_SCENE_PATH = "res://entities/prefabs/npcs/guard/guard.tscn"
const FIGHTER_WITH_REWARD_SCENE_PATH = "res://entities/prefabs/npcs/fighter/fighter_with_reward.tscn"

func _build() -> void:
	bubble_set_title("Agregando un NPC")
	bubble_add_text(["Buenas, vamos a aprender a agregar un personaje"])
	complete_step()
	bubble_add_text([
		"Comencemos abriendo una escena en la cual vamos a agregar al personaje"
		, "Elige la que quieras"
	])
	complete_step()
	bubble_add_text([
		"Agreguemos un personaje con el cual hablar",
		"Arrastra talker.tscn al arbol de nodos de la escena"
	])
	highlight_filesystem_paths([TALKER_SCENE_PATH])
	highlight_scene_nodes_by_path(["."])
	complete_step()
	bubble_add_text([
		"Movamos al personaje más cerca del jugador"
	])
	complete_step()
	bubble_add_text([
		"Problemos la escena de nuevo"
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
		"Prueba agregando diferentes NPCs al nivel y corre el juego para interactuar con ellos"
	])
	highlight_filesystem_paths([
		TALKER_SCENE_PATH,
		TRADER_SCENE_PATH,
		GUARD_SCENE_PATH,
		FIGHTER_SCENE_PATH,
		FIGHTER_WITH_REWARD_SCENE_PATH
	], false)
	complete_step()
	bubble_add_text(["Bien hecho!"])
	complete_step()


	
