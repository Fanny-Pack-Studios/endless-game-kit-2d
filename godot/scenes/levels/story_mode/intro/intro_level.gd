extends Node2D

@export_file("*.tscn") var next_level: String
@onready var skip_button = %SkipButton

func _ready():
	$AnimationPlayer.animation_finished.connect(func(_anim_name):
		self.go_to_next_level()
	)
	skip_button.pressed.connect(self.go_to_next_level)
	

func go_to_next_level():
	SceneChanger.change_scene_to_file(next_level)
