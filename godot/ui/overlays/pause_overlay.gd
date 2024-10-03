extends CenterContainer

signal game_exited

@onready var resume_button := %ResumeButton
@onready var exit_button := %ExitButton
@onready var menu_container := %MenuContainer
@onready var back_to_main_menu = %BackToMainMenuButton

const MAIN_MENU_PATH =\
	"res://scenes/menus/main_menu/main_menu_scene.tscn"

func _ready() -> void:
	visible = false
	resume_button.pressed.connect(_resume)
	exit_button.pressed.connect(_exit)
	back_to_main_menu.pressed.connect(_back_to_main_menu)
	
func grab_button_focus() -> void:
	resume_button.grab_focus()
	
func _resume() -> void:
	get_tree().paused = false
	visible = false

func _exit() -> void:
	game_exited.emit()
	get_tree().quit()
	
func _pause_menu() -> void:
	get_tree().paused = true
	visible = true
	resume_button.grab_focus()

func _back_to_main_menu() -> void:
	_resume()
	SceneChanger.change_scene_to_file(MAIN_MENU_PATH)
	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_viewport().set_input_as_handled()
		if visible:
			_resume()
		else:
			_pause_menu()
