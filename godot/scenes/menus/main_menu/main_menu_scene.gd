extends Node2D

@onready var new_game_button = %NewGameButton
@export var starting_level:PackedScene
@export var settings_scene:PackedScene
@export var credits_scene:PackedScene

@onready var overlay := %FadeOverlay
@onready var settings_button := %SettingsButton
@onready var exit_button := %ExitButton
@onready var credits = %Credits

var next_scene = starting_level
var new_game = true

func _ready() -> void:
	overlay.visible = true
	settings_button.disabled = settings_scene == null

	new_game_button.pressed.connect(func(): _on_play(starting_level))
	settings_button.pressed.connect(_on_settings_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)
	credits.pressed.connect(_on_credits_button_pressed)
	overlay.on_complete_fade_out.connect(_on_fade_overlay_on_complete_fade_out)
	new_game_button.grab_focus()


func _on_settings_button_pressed() -> void:
	new_game = false
	next_scene = settings_scene
	overlay.fade_out()
	
func _on_play(level) -> void:
	next_scene = level
	overlay.fade_out()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_credits_button_pressed() -> void:
	next_scene = credits_scene
	overlay.fade_out()

func _on_fade_overlay_on_complete_fade_out() -> void:
	SceneChanger.change_scene_to_packed(next_scene)

func _input(event):
	if event.is_action_pressed("pause"):
		exit_button.grab_focus()
		get_viewport().set_input_as_handled()
