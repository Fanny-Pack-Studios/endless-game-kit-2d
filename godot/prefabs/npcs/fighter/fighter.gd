@tool
extends NPC

@export var npc_name: String = "Robert"
@export var line: String = "Hola!"

func interact_with(player):
	await Dialogue.say_line(npc_name, line)
	
	var outcome = await combat()

	match outcome:
		CombatScreen.Outcome.PlayerWon:
			await Dialogue.say_line(npc_name, "Ganaste!")
		CombatScreen.Outcome.PlayerLost:
			await Dialogue.say_line(npc_name, "Perdiste, hablame para intentar de nuevo")
