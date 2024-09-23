@tool
extends NPC

@export_category("Character")
@export var npc_name: String = "Robert"
@export var line: String = "Hola!"
@export_category("Combat")
@export var in_combat_character: FighterCharacter

func interact_with(player):
	await Dialogue.say_line(npc_name, line)
	
	var outcome = await combat(in_combat_character)
	
	match outcome:
		CombatScreen.Outcome.PlayerWon:
			Dialogue.say_line(npc_name, "Ganaste!")
		CombatScreen.Outcome.PlayerWon:
			Dialogue.say_line(npc_name, "Perdiste, hablame para intentar de nuevo")
