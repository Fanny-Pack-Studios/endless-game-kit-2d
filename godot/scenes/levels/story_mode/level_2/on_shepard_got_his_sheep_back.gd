extends Node2D


func _on_shepard_traded_successfully():
	$AnimationPlayer.play("sheep_appear")
