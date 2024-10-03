@tool
extends NPC

signal received_item

@export var item_i_need: Item.Type

var has_received_item: bool = false

func interact_with(player):
	if(has_received_item):
		await Dialogue.say_line(npc_name, "Gracias!")
		return

	await Dialogue.say_line(
		npc_name,
		"No podes pasar hasta que me des un %s" % Item.name_of(item_i_need)
	)
	if(not Inventory.has(item_i_need)):
		return

	var chosen_item = await Inventory.choose_item()
	if(chosen_item == item_i_need):
		has_received_item = true
		Inventory.remove_item(chosen_item)
		
		await Dialogue.say_line(npc_name, "Gracias")
		received_item.emit()
