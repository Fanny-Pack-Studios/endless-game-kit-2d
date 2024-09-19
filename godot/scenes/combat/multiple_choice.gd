class_name MultipleChoice extends MiniGame

const MULTIPLE_CHOICE_SCENE =\
	preload("res://scenes/combat/multiple_choice_scene.tscn")

@export var question: String
@export var correct_answer: String
@export var answers: Array[String]


func scene() -> CanvasItem:
	var multiple_choice_minigame = MULTIPLE_CHOICE_SCENE.instantiate()
	multiple_choice_minigame.multiple_choice = self
	return multiple_choice_minigame
