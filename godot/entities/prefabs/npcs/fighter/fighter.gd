@tool
extends NPC

@export_category("Character")
@export_multiline var line: String = "Hola!"
@export var line_when_player_won: String = "Ganaste!"
@export var line_when_player_lost: String = "Perdiste!"
@export var line_after_defeated: String = "Ugh, you defeated me!"
@export_category("Combat")
@export var in_combat_character: FighterCharacter

signal player_won(player)
signal player_lost(player)

var was_defeated = false

func interact_with(player):
	if(was_defeated):
		await Dialogue.say_line(npc_name, line_after_defeated)
	else:
		await Dialogue.say_line(npc_name, line)
		
		var outcome = await combat(in_combat_character)
		
		match outcome:
			CombatScreen.Outcome.PlayerLost:
				await Dialogue.say_line(npc_name, line_when_player_lost)
				player_lost.emit(player)
			CombatScreen.Outcome.PlayerWon:
				was_defeated = true
				await Dialogue.say_line(npc_name, line_when_player_won)
				player_won.emit(player)
