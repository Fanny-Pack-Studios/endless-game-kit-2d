extends Control

@onready var attack = %Attack
@onready var heal = %Heal
@export var combat: CombatScreen
@onready var player_side = %PlayerSide
@onready var enemy_side = %EnemySide

var damage_amount: int = 0
var heal_amount: int = 0

func _ready():
	var animation_player = %AnimationPlayer
	attack.pressed.connect(func():
		player_side.attack_amount = damage_amount
		var attack = ["attack", "double_attack"].pick_random()
		animation_player.play(attack)
	)
	heal.pressed.connect(func():
		player_side.heal(self.heal_amount)
	)
	calculate_random_values_for_attack_and_heal()

func calculate_random_values_for_attack_and_heal():
	damage_amount = randi_range(1, 100)
	heal_amount = randi_range(1, 100)
	attack.text = "Atacar con Sword\nDamage: %s" % number_to_word(damage_amount)
	heal.text = "Comer Mushroom\nHeal: %s" % number_to_word(heal_amount)

func number_to_word(number: int) -> String:
	var digits: Array[String] = [
		"zero", "one", "two", "three", "four", "five",
		"six", "seven", "eight", "nine"
	]
	var teens: Array[String] = [
		"eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
		"seventeen", "eighteen", "nineteen"
	]
	var tens: Array[String] = [
		"ten", "twenty", "thirty", "fourty", "fifty",
		"sixty", "seventy", "eighty", "ninety"
	]
	if(number >= 0 and number <= 9):
		return digits[number]
	elif(number == 10):
		return tens[0]
	elif(number >= 11 and number <= 19):
		return teens[number - 11]
	elif(number >= 20 and number <= 99):
		var ten_part: int = number / 10
		var unit_part: int = number % 10
		var ten_part_as_word: String = tens[ten_part - 1]
		if(unit_part == 0):
			return ten_part_as_word
		else:
			return str(ten_part_as_word, " ", number_to_word(unit_part))
	elif(number == 100):
		return "one hundred"
	else:
		push_warning("number_to_word only works for integers betwen 0 to 100,\
			returning number as a string but not as a word: ", number)
		return str(number)
