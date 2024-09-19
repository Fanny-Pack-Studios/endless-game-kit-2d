extends NPC
func interact_with(player) -> void:
	await Dialogue.show_line("Necesitamos un mushroom para el guiso")
