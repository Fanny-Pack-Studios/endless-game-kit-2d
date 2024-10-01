class_name PickAnyMinigameAtRandom extends MiniGame

const MULTIPLE_CHOICE_DIR_PATH = "res://scenes/combat/minigames"

var minigame_filepaths: Array[String]

func calculate_minigame_filepaths(base_directory):
	var dir = DirAccess.open(base_directory)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var full_name = base_directory.path_join(file_name)
			if dir.current_is_dir():
				calculate_minigame_filepaths(full_name)
			else:
				if ResourceLoader.exists(full_name, "MiniGame") and file_name.ends_with(".tres"):
					minigame_filepaths.push_back(full_name)
			file_name = dir.get_next()


func scene() -> CanvasItem:
	if(minigame_filepaths.is_empty()):
		calculate_minigame_filepaths(MULTIPLE_CHOICE_DIR_PATH)
	var minigame_filepath = minigame_filepaths.pick_random()
	var minigame: MultipleChoice = load(minigame_filepath)
	return minigame.scene()
