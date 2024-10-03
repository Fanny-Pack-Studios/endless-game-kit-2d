extends Control

@onready var attack_1 = %Attack1
@onready var attack_2 = %Attack2
@onready var heal = %Heal
@export var combat: CombatScreen
@onready var player = %Player

var attack_1_power: int
var attack_2_power: int
var heal_power: int

signal player_chose_option
signal player_turn_finished

enum PlayerOption {
	Attack1,
	Attack2,
	Heal
}

func setup_turn():
	calculate_random_values_for_attack_and_heal()


func enable_buttons():
	for option_button in [attack_1, attack_2, heal]:
		option_button.disabled = false


func disable_buttons():
	for option_button in [attack_1, attack_2, heal]:
		option_button.disabled = true


func option_chosen(option: PlayerOption):
	disable_buttons()
	player_chose_option.emit()

	match option:
		PlayerOption.Attack1:
			player.attack_power = attack_1_power
			await player.play_attack()
		
		PlayerOption.Attack2:
			player.attack_power = attack_2_power
			await player.play_attack()

		PlayerOption.Heal:
			player.heal_power = heal_power
			await player.heal()

	player_turn_finished.emit()


func _ready():
	attack_1.pressed.connect(func(): option_chosen(PlayerOption.Attack1))
	attack_2.pressed.connect(func(): option_chosen(PlayerOption.Attack2))
	heal.pressed.connect(func(): option_chosen(PlayerOption.Heal))


func calculate_random_values_for_attack_and_heal():
	var strong_attack: int = randi_range(51, 100)
	var weak_attack: int = randi_range(1, 50)
	var attack_powers = [strong_attack, weak_attack]
	attack_powers.shuffle()
	attack_1_power = attack_powers.front()
	attack_2_power = attack_powers.back()
	heal_power = randi_range(1, 100)
	attack_1.text = "Cut\nDamage: %s" % number_to_word(attack_1_power)
	attack_2.text = "Slash\nDamage: %s" % number_to_word(attack_2_power)
	heal.text = "Eat apple\nHeal: %s" % number_to_word(heal_power)


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
