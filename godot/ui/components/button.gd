class_name GameButton extends Button

@onready var read_button = $ReadOutLoudButton
@export var text_to_voice: bool = false

func _ready():
	if(not text_to_voice):
		read_button.visible = false
		return

	var voices = DisplayServer.tts_get_voices_for_language("en")
	if(voices.is_empty()):
		read_button.visible = false
		return

	var voice_id = voices[0]

	read_button.pressed.connect(func():
		DisplayServer.tts_speak(text, voice_id)
	)
