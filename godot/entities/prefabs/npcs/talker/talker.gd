@tool
extends NPC

@export_multiline var line: String = "Hola!"

func interact_with(player):
	await Dialogue.say_multiple_lines(npc_name, line.split("\n"))
