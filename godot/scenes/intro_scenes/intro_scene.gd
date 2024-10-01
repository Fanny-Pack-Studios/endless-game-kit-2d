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

func _process(_delta):
	if interuptable and Input.is_action_just_pressed("exit") or Input.is_action_just_pressed("ui_accept"):
		_change_scene()

func _fade_out():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN)
	await tween.tween_property(self, "modulate:a", 0.0, fade_duration).set_delay(stay_duration).finished
	_change_scene()

func _change_scene():
	SceneChanger.change_scene_to_packed(next_scene)
