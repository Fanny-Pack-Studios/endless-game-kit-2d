class_name MultipleChoiceMiniGame extends Control

@export var multiple_choice: MultipleChoice
@onready var options_container = %OptionsContainer
@onready var question_label = %QuestionLabel

signal success
signal failure

const COMBAT_OPTION_BUTTON = preload("res://scenes/combat/combat_option_button.tscn")

func _ready():
	setup_minigame(
		multiple_choice.question,
		multiple_choice.answers,
		multiple_choice.correct_answer
	)

func setup_minigame(question, answers, correct_answer):
	question_label.text = question
	for option in options_container.get_children():
		option.queue_free()
	for answer in answers:
		var button = COMBAT_OPTION_BUTTON.instantiate()
		button.text = answer
		options_container.add_child(button, true)
		button.pressed.connect(func():
			if(answer == correct_answer):
				self.on_correct_answer()
			else:
				self.on_incorrect_answer()
		)
	
func on_correct_answer():
	success.emit()

func on_incorrect_answer():
	failure.emit()
