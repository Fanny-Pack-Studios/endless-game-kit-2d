extends GDTour

const DUPLICATE = preload("res://guided_tutorials/duplicate.png")

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
	highlight_filesystem_paths([
		"res://prefabs/npcs/talker/talker.tscn"
	])
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
		"res://prefabs/npcs/talker/talker.tscn",
		"res://prefabs/npcs/trader/trader.tscn",
		"res://prefabs/npcs/guard/guard.tscn",
		"res://prefabs/npcs/fighter/fighter.tscn",
		"res://prefabs/npcs/fighter/fighter_with_reward.tscn"
	], false)
	complete_step()
	bubble_add_text(["Bien hecho!"])
	complete_step()


	
