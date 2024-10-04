extends MiniGameScene

var question: String
var correct_answer: String

func _ready():
	%TextLabel.text = question


func _on_line_edit_text_submitted(answer: String):
	# we call to_upper() on both in order to make this equality check
	# case unsensitive
	if(correct_answer.to_upper() == answer.to_upper()):
		completed.emit(100)
	else:
		completed.emit(0)
