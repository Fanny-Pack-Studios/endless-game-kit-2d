@tool
extends NPC

@export_multiline var intro_message: String
@export_multiline var request_meat_message: String
@export_multiline var request_mushroom_message: String
@export_multiline var thank_you_message: String
@export_multiline var reward_message: String
var received_items: Array[Item.Type] = []
var has_already_given_reward: bool = false

func interact_with(_player):
	if(has_already_given_reward):
		await say(thank_you_message)
		return

	await say(intro_message)

	await ask_for_items()

	if has_item(Item.Type.Carne) and has_item(Item.Type.Hongo):
		await reward()


func reward():
	has_already_given_reward = true
	await say(reward_message)
	Inventory.add_item(Item.Type.Dinero)


func ask_for_items():
	if(not has_item(Item.Type.Carne) and not has_item(Item.Type.Hongo)):
		await say("Necesito Meat and Mushroom, ¿puedes darme alguno?")
		var received_something = await try_to_receive([Item.Type.Carne, Item.Type.Hongo])
		if(not received_something):
			return

	if(not has_item(Item.Type.Carne)):
		await say("Todavía necesito Meat, ¿puedes darme?")
		await try_to_receive([Item.Type.Carne])
	if(not has_item(Item.Type.Hongo)):
		await say("Todavía necesito Mushroom, ¿puedes darme?")
		await try_to_receive([Item.Type.Hongo])

func try_to_receive(acceptable_items: Array[Item.Type]) -> bool:
	var chosen_item = await Inventory.choose_item()
	if(chosen_item != null and chosen_item in acceptable_items):
		await say(thank_you_message)
		Inventory.remove_item(chosen_item)
		received_items.push_back(chosen_item)
		return true
	elif(chosen_item == null):
		await say("Te espero aquí")
		return false
	else:
		await say("Esto no es lo que quería")
		return false


func has_item(item: Item.Type):
	return item in received_items


func say(line: String):
	await Dialogue.say_line(npc_name, line)
