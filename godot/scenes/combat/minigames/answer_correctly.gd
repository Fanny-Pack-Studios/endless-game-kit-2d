class_name AnswerCorrectly extends MiniGame

@export var correct_answer: String
@export var question: String

const ANSWER_CORRECTLY_SCENE = preload("res://scenes/combat/minigames/answer_correctly_scene.tscn")

func scene() -> MiniGameScene:
	var answer_correctly = ANSWER_CORRECTLY_SCENE.instantiate()
	answer_correctly.correct_answer = correct_answer
	answer_correctly.question = question
	return answer_correctly
