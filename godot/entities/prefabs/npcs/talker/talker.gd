@tool
extends NPC

@export_multiline var line: String = "Hola!"
@export var gives_important_info: bool = true :
	set(new_value):
		gives_important_info = new_value
		if(is_inside_tree()):
			$InfoIndicator.visible = gives_important_info

func interact_with(player):
	await Dialogue.say_multiple_lines(npc_name, line.split("\n"))
