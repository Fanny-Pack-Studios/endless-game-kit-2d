class_name MultipleChoice extends MiniGame

const MULTIPLE_CHOICE_SCENE_PATH =\
	"res://scenes/combat/minigames/multiple_choice_scene.tscn"

@export_multiline var question: String
@export var correct_answer: String
@export var answers: Array[String]

func scene() -> CanvasItem:
	var multiple_choice_minigame = load(MULTIPLE_CHOICE_SCENE_PATH).instantiate()
	multiple_choice_minigame.multiple_choice = self
	return multiple_choice_minigame
