extends Node2D

@export var npc_name: String = "Guard"
@export var item_i_need: Item.Type
@export var amount_i_need: int = 1
@export var direction_i_move_to: Guard.Direction
@export_multiline var thank_you_line: String = "Gracias, me corro del camino"
@onready var guard = $Guard
@export_multiline var request_item_line: String = "No podes pasar hasta que me des: "


func _ready():
	guard.amount_i_need = amount_i_need
	guard.npc_name = npc_name
	guard.item_i_need = item_i_need
	guard.direction_i_move_to = direction_i_move_to
	guard.thank_you_line = thank_you_line
	guard.request_item_line = request_item_line
