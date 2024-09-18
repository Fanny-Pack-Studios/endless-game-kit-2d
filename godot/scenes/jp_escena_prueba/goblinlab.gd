extends NPC
func interact_with(player) -> void:
	await Dialogue.show_line("Meat=Carne")
