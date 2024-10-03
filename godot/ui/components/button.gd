class_name GameButton extends Button

@onready var read_button = $ReadButton
@export var text_to_voice: bool = false

func _ready():
	if(text_to_voice):
		read_button.pressed.connect(func():
			var voices = DisplayServer.tts_get_voices_for_language("en")
			var voice_id = voices[0]

			DisplayServer.tts_speak(text, voice_id)
		)
	else:
		read_button.visible = false
