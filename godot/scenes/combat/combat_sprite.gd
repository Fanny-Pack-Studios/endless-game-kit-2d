class_name CombatSprite extends CanvasItem

signal hit_landed

@onready var animation_player = $AnimationPlayer
@export var attack_animation_names: Array[String] = []
@export var heal_animation_names: Array[String] = []
@export var hurt_animation_names: Array[String] = []


func land_hit() -> void:
	hit_landed.emit()


func play_attack() -> void:
	await play_one_of(attack_animation_names)


func play_heal() -> void:
	await play_one_of(heal_animation_names)


func play_hurt() -> void:
	await play_one_of(hurt_animation_names)


func play_one_of(animation_names) -> void:
	var animation: String = animation_names.pick_random()

	if(animation):
		animation_player.play(animation)

		await animation_player.animation_finished
