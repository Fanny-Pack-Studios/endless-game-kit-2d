extends Control

@export var minigames: Array[MiniGame]
@onready var enemy_side = %EnemySide
@export var combat: CanvasItem
var minigame_scene

signal player_chose_minigame_option

func setup_minigame():
	if(minigame_scene):
		minigame_scene.queue_free()

	var minigame: MiniGame = minigames.pick_random()
	minigame_scene = minigame.scene()
	minigame_scene.failure.connect(func():
		player_chose_minigame_option.emit()
		%AnimationPlayer.play("enemy_attack")
		await %AnimationPlayer.animation_finished
		combat.next_turn()
	)
	add_child(minigame_scene)
	minigame_scene.success.connect(func():
		player_chose_minigame_option.emit()
		combat.next_turn()
	)
