@tool
extends NPC

@export var npc_name: String = "Trader"
@export_category("Trading")
var already_traded: bool = false
@export var only_trades_once: bool = false
@export var item_i_give: Item.Type = Item.Type.Dinero
@export var amount_i_give: int = 1
@export var item_i_want: Item.Type = Item.Type.Calabaza
@export var amount_i_want: int = 1
@export_category("Talking")
@export_multiline var intro_line: String = ""
@export var trade_successful_line: String = "Un placer hacer negocios"
@export var already_traded_line: String = "¡Thanks a lot!"

signal traded_successfully

func interact_with(_player):
	if(already_traded and only_trades_once):
		await say(already_traded_line)
		return

	if Inventory.is_empty():
		if(intro_line):
			await say(intro_line)
		else:
			await say("Te doy %s %s por %s %s" % [
				amount_i_give,
				Item.english_name_of(item_i_give),
				amount_i_want,
				Item.english_name_of(item_i_want)
				]
			)
			await say("Vuelve con algo para negociar")

		return

	if(intro_line):
		await say(intro_line)
	else:
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
			traded_successfully.emit()
			already_traded = true
			for i in range(0, amount_i_want):
				Inventory.remove_item(item_i_want)
			for i in range(0, amount_i_give):
				Inventory.add_item(item_i_give)
			await say(trade_successful_line)
	else:
		await say("¡Quería %s, no %s!" % [Item.english_name_of(item_i_want), Item.english_name_of(item)])
	
func say(line: String):
	await Dialogue.say_line(npc_name, line)
