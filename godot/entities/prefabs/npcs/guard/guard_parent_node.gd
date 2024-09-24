extends Node2D

@export var npc_name: String = "Guard"
@export var item_i_need: Item.Type
@export var direction_i_move_to: Guard.Direction
@onready var guard = $Guard

func _ready():
	guard.npc_name = npc_name
	guard.item_i_need = item_i_need
	guard.direction_i_move_to = direction_i_move_to
