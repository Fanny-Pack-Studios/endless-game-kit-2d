class_name CombatScreen extends Control

enum Turn {
	PlayerTurn,
	EnemyTurn
}
@onready var menu_turn_animation_player = $MenuTurnAnimationPlayer

var turn = Turn.PlayerTurn

func _ready():
	$ChooseAttack.player_chose_option.connect(func():
		menu_turn_animation_player.queue("hide_player_ui")
	)
	$EnemyAttackMinigame.player_chose_minigame_option.connect(func():
		menu_turn_animation_player.queue("hide_enemy_ui")
	)

func next_turn():
	match turn:
		Turn.PlayerTurn:
			$EnemyAttackMinigame.setup_minigame()
			turn = Turn.EnemyTurn
			menu_turn_animation_player.queue("show_enemy_ui")
		Turn.EnemyTurn:
			turn = Turn.PlayerTurn
			menu_turn_animation_player.queue("show_player_ui")

func heal_player(amount: int):
	pass

func hurt_enemy(amount: int):
	pass
