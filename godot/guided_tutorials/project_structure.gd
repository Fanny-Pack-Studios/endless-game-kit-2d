extends GDTour

const ADDONS = "res://addons"
const ASSETS = "res://assets"
const ENTITIES = "res://entities"
const GLOBALS = "res://globals"
const GUIDED_TUTORIALS = "res://guided_tutorials"
const SCENES = "res://scenes"
const SCRIPT_TEMPLATES = "res://script_templates"
const UI = "res://ui"



func _build() -> void:
	bubble_set_title("Estructura del proyecto")
	bubble_add_text(["Este tutorial te explicará qué compone este proyecto y cómo está organizado."])
	complete_step()
	
	bubble_set_title("Convencion de colores")
	bubble_add_text([
		"[b][color=green]Verde: contenido de los niveles[/color][/b]",
		"Estas son las carpetas que probablemente más uso les des.",
		"[b][color=orange]Naranja: sistemas del juego.[/color][/b]",
		"Puedes explorar estas carpetas para agregar nuevo contenido al juego y para aprender como funcionan los sistemas del mismo.",
		"[b][color=gray]Gris: carpetas internas del proyecto.[/color][/b]",
		"En principio, no debería ser necesario explorar o investigar los contenidos.",
	])
	complete_step()

	highlight_filesystem_paths([ADDONS])
	bubble_set_title("Addons")
	bubble_add_text([
		"Aquí se encuentran algunos addons agregados al proyecto.",
		"Eso significa que el código que se puede encontrar aquí no fue creado para el proyecto, si no que fue agregado desde la AssetLib."
	])
	complete_step()
	
	highlight_filesystem_paths([ADDONS])
	bubble_add_text([
		"Agrega algunas funcionalidades útiles (como estos tutoriales) pero no usaremos mucho este directorio."
	])
	complete_step()

	highlight_filesystem_paths([ASSETS])
	bubble_set_title("Assets")
	bubble_add_text([
		"Aquí se guardan todos los recursos audiovisuales que se utilizan para el juego. Esto incluye:",
		"- Imágenes",
		"- Audio",
		"- Fuentes",
		"- y hasta algunos más complejos como Tilesets"
	])
	complete_step()
	
	highlight_filesystem_paths([ASSETS])
	bubble_set_title("Assets")
	bubble_add_text([
		"Explora este directorio para buscar recursos que puedes agregar al juego."
	])
	complete_step()

	highlight_filesystem_paths([ENTITIES])
	bubble_set_title("Entities")
	bubble_add_text([
		"Aquí se encuentran escenas que pueden ser incluidas directamente a un nivel.",
		"Puedes directamente arrastrar cualquiera de los .tscn que encuentres aquí a una escena."
	])
	complete_step()
	
	highlight_filesystem_paths([ENTITIES.path_join("characters/player/player.tscn")])
	bubble_set_title("Entities: Player")
	bubble_add_text([
		"La escena player contiene al personaje que es controlado por el jugador."
	])
	complete_step()

	highlight_filesystem_paths([ENTITIES.path_join("prefabs/npcs")])
	bubble_set_title("Entities: Prefabs")
	bubble_add_text([
		"También, aquí encontraras muchos NPC configurables que puedes arrastrar a una escena y,\
modificando sus propiedades en el inspector de Godot, armar niveles rápidamente"
	])
	complete_step()
	
	highlight_filesystem_paths([
		GLOBALS,
		GLOBALS.path_join("dialogue"),
		GLOBALS.path_join("inventory"),
		GLOBALS.path_join("scene_changer")
		]
	)
	bubble_set_title("Globals")
	bubble_add_text([
		"Esta carpeta contiene escenas que están presentes todo el tiempo mientras\
el juego está corriendo. Lo más importante que encontrarás aquí es:",
		"Dialogue: escena que se utiliza para mostrar diálogos en pantalla",
		"Inventory: escena que maneja el inventario del jugador",
		"SceneChanger: manejador de escenas que permite cambiar entre un nivel y otro."
	])
	complete_step()
	
	highlight_filesystem_paths([GUIDED_TUTORIALS])
	bubble_set_title("Tutoriales guiados")
	bubble_add_text([
		"En esta carpeta se encuentran los guiones de tutoriales como el que estás leyendo.",
	])
	complete_step()

	highlight_filesystem_paths([
		SCENES,
		SCENES.path_join("combat"),
		SCENES.path_join("intro_scenes"),
		SCENES.path_join("levels"),
		SCENES.path_join("menus"),
	])
	bubble_set_title("Scenes")
	bubble_add_text([
		"Aquí podrás encontrar escenas 'completas', que abarcan toda la pantalla:",
		"- combat: contiene toda la lógica de combate.",
		"- intro_scenes: logos que aparecen antes de que arranque el juego.",
		"- levels: ¡los niveles propiamente dichos!",
		"- menus: pantallas de menués del juego."
	])
	complete_step()
	
	highlight_filesystem_paths([
		SCENES.path_join("levels/example_levels"),
		SCENES.path_join("levels/story_mode"),
	])
	bubble_set_title("Niveles")
	bubble_add_text([
		"Dentro de la carpeta levels se hace una distinción entre:",
		" - story_mode: El modo historia del juego, son los niveles que jugarán los jugadores del mismo.",
		" - example_levels: Aquí puedes encontrar niveles más sencillos que se pueden tomar de base para crear los tuyos."
	])
	complete_step()
	
	highlight_filesystem_paths([SCRIPT_TEMPLATES])
	bubble_set_title("Script Templates")
	bubble_add_text([
		"Carpeta interna donde se pueden guardar plantillas de script para facilitar la creación de nuevas clases."
	])
	complete_step()
	
	highlight_filesystem_paths([UI])
	bubble_set_title("UI")
	bubble_add_text([
		"Aquí hay escenas que se utilizazn en la interfaz de usuario del juego.",
		"Muchas de esas son reutilizables y pueden ser agregadas a nuevas interfaces."
	])
	complete_step()
	bubble_set_title("Estructura del Proyecto")
	bubble_add_text([
		"¡Eso es todo por ahora, en los próximos tutoriales pasarás por varias de las carpetas que describimos aquí!"
	])
	complete_step()
