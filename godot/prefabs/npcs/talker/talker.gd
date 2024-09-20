@tool
extends NPC

@export var npc_name: String = "Robert"
@export var line: String = "Hola!"

func interact_with(player):
	await Dialogue.say_line(npc_name, line)
