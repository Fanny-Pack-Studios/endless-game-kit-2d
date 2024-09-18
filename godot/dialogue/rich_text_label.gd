extends RichTextLabel

const HINT = preload("res://dialogue/hint.tscn")

func _make_custom_tooltip(hint_text):
	var hint = HINT.instantiate()
	hint.text = hint_text
	return hint
