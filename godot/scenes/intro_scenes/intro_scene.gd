class_name IntroScene
extends CanvasItem

@export var fade_duration:float = 1.0
@export var stay_duration:float = 1.5
@export var next_scene:PackedScene
@export var interuptable:bool = true

func _ready():
	modulate.a = 0.0
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN)
	await tween.tween_property(self, "modulate:a", 1.0, fade_duration).from(0.0).finished
	_fade_out()


func _fade_out():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN)
	await tween.tween_property(self, "modulate:a", 0.0, fade_duration).set_delay(stay_duration).finished
	_change_scene()

func _change_scene():
	SceneChanger.change_scene_to_packed(next_scene)


func _input(event):
	if event.is_action_pressed("pause") or event.is_action_pressed("exit")\
		or event.is_action_pressed("ui_accept"):
			get_viewport().set_input_as_handled()
			if interuptable:
				_change_scene()
