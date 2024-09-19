@tool
extends Control

@onready var health_bar = $HealthBar
@onready var health_label = $HealthBar/HealthLabel
@onready var sprite = $Sprite
@export var enemy: Node
@onready var shaker = $Shaker

var max_health: int = 300
var current_health: int = max_health
var attack_amount: int = 10
var heal_amount: int = 10

func cause_damage():
	enemy.hurt(attack_amount)

func _ready():
	sprite.play("idle")
	health_bar.max_value = max_health
	health_bar.value = current_health

func hurt(amount: int):
	shaker.shake()
	current_health = move_toward(current_health, 0, amount)

func heal(amount: int):
	current_health = move_toward(current_health, max_health, amount)

func _process(delta):
	health_bar.value = move_toward(health_bar.value, current_health, delta * 70.0)
	health_label.text = "%s/%s" % [floor(health_bar.value), max_health]
