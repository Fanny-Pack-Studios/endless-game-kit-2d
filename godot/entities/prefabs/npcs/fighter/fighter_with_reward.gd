@tool
extends NPC

@export_category("NPC")
@export var npc_name: String = "Robert"
@export_multiline var line: String = "Hola!"
@export var line_when_player_won: String = "Ganaste!"
@export var line_when_player_lost: String = "Perdiste!"
@export_category("Combat")
@export var in_combat_character: FighterCharacter
@export_category("Reward")
@export var reward_item: Item.Type
@export var reward_amount: int = 1


func interact_with(player):
	await Dialogue.say_line(npc_name, line)
	
	var outcome = await combat(in_combat_character)

	match outcome:
		CombatScreen.Outcome.PlayerWon:
			await Dialogue.say_line(npc_name, line_when_player_won)
			for i in range(0, reward_amount):
				Inventory.add_item(reward_item)
			await Dialogue.show_line("Se recibió %d %s" % [reward_amount, Item.name_of(reward_item)])
		CombatScreen.Outcome.PlayerLost:
			await Dialogue.say_line(npc_name, line_when_player_lost)
