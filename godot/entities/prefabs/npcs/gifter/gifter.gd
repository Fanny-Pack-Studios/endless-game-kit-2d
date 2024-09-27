@tool
extends NPC

@export var npc_name: String
@export var item_i_gift: Item.Type
@export var gifts_only_once: bool = false
@export_multiline var line: String
@export_multiline var line_after_ran_out_of_gifts: String

var already_gifted: bool = false

func interact_with(player):
	if(gifts_only_once and already_gifted):
		await Dialogue.say_line(npc_name, line_after_ran_out_of_gifts)
	else:
		await Dialogue.say_line(npc_name, line)
		already_gifted = true
		Inventory.add_item(item_i_gift)
