@tool
extends NPC

@export var npc_name: String = "Trader"
@export var item_i_give: Item.Type = Item.Type.Dinero
@export var amount_i_give: int = 1
@export var item_i_want: Item.Type = Item.Type.Calabaza
@export var amount_i_want: int = 1

func interact_with(_player):
	if Inventory.is_empty():
		await say("Te doy %s %s por %s %s" % [
			amount_i_give,
			Item.english_name_of(item_i_give),
			amount_i_want,
			Item.english_name_of(item_i_want)
			]
		)
		await say("Vuelve con algo para negociar")
		return

	await say("Te doy %s %s por %s %s" % [
		amount_i_give,
		Item.english_name_of(item_i_give),
		amount_i_want,
		Item.english_name_of(item_i_want)
		]
	)
	var item = await Inventory.choose_item()
	if item == null:
		await say("No me diste nada :(")
	elif(item == item_i_want):
		if(Inventory.amount_of(item_i_want) < amount_i_want):
			await say("No tienes suficientes %ss" % Item.english_name_of(item_i_want))
		else:
			for i in range(0, amount_i_want):
				Inventory.remove_item(item_i_want)
			for i in range(0, amount_i_give):
				Inventory.add_item(item_i_give)
			await say("Un placer hacer negocios.")
	else:
		await say("¡Quería %s, no %s!" % [Item.english_name_of(item_i_want), Item.english_name_of(item)])
	
func say(line: String):
	await Dialogue.say_line("[color=purple]%s[/color]" % npc_name, line)
