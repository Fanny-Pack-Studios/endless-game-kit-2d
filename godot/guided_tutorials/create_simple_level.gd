extends GDTour

const DUPLICATE = preload("res://guided_tutorials/duplicate.png")

func _build() -> void:
	bubble_set_title("Creando un nivel básico")
	bubble_add_text(["Buenas, vamos a aprender a crear un nuevo nivel"])
	bubble_add_task_open_scene(
		"res://scenes/lau_niveles_de_prueba/simplest_level.tscn",
		"Abre la escena simplest_level.tscn"
	)
	highlight_filesystem_paths(
		["res://scenes/lau_niveles_de_prueba/simplest_level.tscn"]
	)
	complete_step()
	bubble_add_text([
		"Esta es una escena con lo mínimo y necesario",
		"Dupliquemosla para crear nuestra propia escena"
	])
	bubble_add_texture(DUPLICATE)
	highlight_filesystem_paths(
		["res://scenes/lau_niveles_de_prueba/simplest_level.tscn"]
	)
	complete_step()
	bubble_add_text([
		"Ahora, abramos la escena nueva"
	])
	complete_step()
	bubble_add_text([
		"Para correr la escena, se puede usar el boton Run Current Scene",
		"O, también se puede apretar F6"
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
		"Agreguemos un personaje con el cual hablar",
		"Arrastra talker.tscn al arbol de nodos de la escena"
	])
	highlight_filesystem_paths([
		"res://prefabs/npcs/talker/talker.tscn"
	])
	highlight_scene_nodes_by_name(["Nivel1"])
	complete_step()
	bubble_add_text([
		"Movamos al personaje más cerca del jugador"
	])
	highlight_scene_nodes_by_name(["Talker"])
	complete_step()
	bubble_add_text([
		"Problemos la escena de nuevo"
	])
	highlight_controls(
		[play_current_scene_button]
	)
	complete_step()
	bubble_add_text(["Bien hecho!"])
	complete_step()

	
