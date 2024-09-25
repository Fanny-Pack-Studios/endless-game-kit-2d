extends Control

@onready var attack = %Attack
@onready var heal = %Heal
@export var combat: CombatScreen
@onready var player = %Player

signal player_chose_option
signal player_turn_finished

enum PlayerOption {
	Attack,
	Heal
}

func setup_turn():
	calculate_random_values_for_attack_and_heal()


func enable_buttons():
	for option_button in [attack, heal]:
		option_button.disabled = false


func disable_buttons():
	for option_button in [attack, heal]:
		option_button.disabled = true


func option_chosen(option: PlayerOption):
	for option_button in [attack, heal]:
		option_button.disabled = true
	player_chose_option.emit()

	match option:
		PlayerOption.Attack:
			await player.play_attack()

		PlayerOption.Heal:
			await player.heal()

	player_turn_finished.emit()


func _ready():
	attack.pressed.connect(func(): option_chosen(PlayerOption.Attack))
	heal.pressed.connect(func(): option_chosen(PlayerOption.Heal))


func calculate_random_values_for_attack_and_heal():
	player.attack_power = randi_range(1, 100)
	player.heal_power = randi_range(1, 100)
	attack.text = "Atacar con Sword\nDamage: %s" % number_to_word(player.attack_power)
	heal.text = "Comer Mushroom\nHeal: %s" % number_to_word(player.heal_power)


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
