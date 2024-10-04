class_name PickAnyMinigameAtRandom extends MiniGame
## Elegir cualquier minijuego al azar.
##
## El objetivo de esta clase es tener una manera sencilla de configurar un 
## oponente de un combate que tenga a su disposición cualquiera de los minijuegos
## que se encuentran en una carpeta especificada.

## Carpeta que contiene los minijuegos posibles
@export var minigames_path: String = "res://scenes/combat/minigames"

## Lista de todas las rutas a minijuegos encontradas.
var minigame_filepaths: Array[String]

## Recorre la carpeta que contiene los minijuegos para encontrar todos aquellos 
## archivos que sean un minijuego.
func calculate_minigame_filepaths(base_directory: String):
	var dir = DirAccess.open(base_directory)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var full_name = base_directory.path_join(file_name).trim_suffix(".remap")
			if dir.current_is_dir():
				calculate_minigame_filepaths(full_name)
			else:
				var resource_exists = ResourceLoader.exists(full_name)
				var full_name_ends_in_tres = full_name.ends_with(".tres")
				if ResourceLoader.exists(full_name) and full_name.ends_with(".tres"):
					minigame_filepaths.push_back(full_name)
			file_name = dir.get_next()

## De todos los minijuegos posibles, obtiene alguno y crea y configura su escena.
func scene() -> MiniGameScene:
	if(minigame_filepaths.is_empty()):
		calculate_minigame_filepaths(minigames_path)
	var minigame_filepath = minigame_filepaths.pick_random()
	var minigame = load(minigame_filepath)
	if minigame is MiniGame:
		return minigame.scene()
	else:
		minigame_filepaths.erase(minigame_filepath)
		return scene()
