@tool
extends NPC

@export var npc_name: String = "Robert"
@export var line: String = "Hola!"
@export var reward_item: Item.Type
@export var reward_amount: int = 1

func interact_with(player):
	await Dialogue.say_line(npc_name, line)
	
	var outcome = await combat()

	match outcome:
		CombatScreen.Outcome.PlayerWon:
			await Dialogue.say_line(npc_name, "Ganaste, toma esto como recompensa")
			for i in range(0, reward_amount):
				Inventory.add_item(reward_item)
			await Dialogue.show_line("Se recibió %d %s" % [reward_amount, Item.name_of(reward_item)])
		CombatScreen.Outcome.PlayerLost:
			await Dialogue.say_line(npc_name, "Perdiste, hablame para intentar de nuevo")
