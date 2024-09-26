extends Node2D

@export var stolen_sheep: Item

func _on_fighter_that_has_the_sheep_player_won(player):
	$AnimationPlayer.play("sheep_disappear")
	await $AnimationPlayer.animation_finished
	stolen_sheep.interact_with(player)
