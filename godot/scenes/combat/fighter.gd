class_name Fighter extends Control

@onready var health_bar = $HealthBar
@onready var health_label = $HealthBar/HealthLabel
@onready var combat_sprite: CombatSprite = $Sprite
@export var opponent: Fighter
@onready var shaker = $Shaker
@onready var health_change_effect = $HealthChangeEffect


@export var max_health: int = 300
var current_health: int
@export var attack_power: int = 10
@export var heal_power: int = 10


func _ready():
	current_health = max_health
	health_bar.max_value = max_health
	health_bar.value = current_health
	combat_sprite.hit_landed.connect(func():
		opponent.be_hurted(attack_power)
	)


func play_attack():
	z_index += 1
	await combat_sprite.play_attack()
	z_index -= 1


func be_hurted(amount: int):
	health_change_effect.play_hurt(amount)
	shaker.shake()
	combat_sprite.play_hurt()
	current_health = move_toward(current_health, 0, amount)


func heal():
	health_change_effect.play_heal(heal_power)
	current_health = move_toward(current_health, max_health, heal_power)
	
	await combat_sprite.play_heal()


func _process(delta):
	health_bar.value = move_toward(health_bar.value, current_health, delta * 70.0)
	health_label.text = "%s/%s" % [floor(health_bar.value), max_health]
