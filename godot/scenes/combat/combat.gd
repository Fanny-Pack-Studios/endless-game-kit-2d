class_name CombatScreen extends Control


@onready var menu_turn_animation_player = %MenuTurnAnimationPlayer
@onready var choose_attack = %ChooseAttackMenu
@onready var enemy_attack_minigame = %EnemyAttackMinigameMenu
@onready var player = %Player
@onready var enemy = %Enemy

signal finished(outcome: Outcome)

enum Outcome {
	PlayerWon,
	PlayerLost
}


enum Turn {
	Player,
	Enemy
}

var turn: Turn = Turn.Player


func configure(
	in_combat_character: FighterCharacter
	):
		enemy = %Enemy
		enemy_attack_minigame = %EnemyAttackMinigameMenu
		if(not in_combat_character):
			return

		enemy.max_health = in_combat_character.hp
		enemy.attack_power = in_combat_character.attack_power
		var enemy_combat_sprite = in_combat_character.combat_sprite()
		if(enemy_combat_sprite != null):
			enemy.replace_sprite(enemy_combat_sprite)
		var minigames = in_combat_character.minigames
		if(not minigames.is_empty()):
			enemy_attack_minigame.minigames = minigames


func _ready():
	play_turns()


func play_turns():
	while player.current_health > 0 and enemy.current_health > 0:
		await play_a_turn()

	await wait_seconds(1.0)

	if enemy.current_health <= 0:
		#await Dialogue.show_line("GANASTE!!!")
		finished.emit(Outcome.PlayerWon)
	elif player.current_health <= 0:
		#await Dialogue.show_line("Perdiste! >:(")
		finished.emit(Outcome.PlayerLost)



func play_a_turn():
	match turn:
		Turn.Player:
			choose_attack.setup_turn()

			menu_turn_animation_player.queue("show_player_ui")

			await choose_attack.player_chose_option

			menu_turn_animation_player.queue("hide_player_ui")

			await choose_attack.player_turn_finished
			
			turn = Turn.Enemy
		Turn.Enemy:
			enemy_attack_minigame.setup_turn()

			menu_turn_animation_player.queue("show_enemy_ui")

			await enemy_attack_minigame.player_chose_option

			menu_turn_animation_player.queue("hide_enemy_ui")

			await enemy_attack_minigame.enemy_turn_finished
			
			turn = Turn.Player


func wait_seconds(seconds: float):
	await get_tree().create_timer(seconds).timeout
