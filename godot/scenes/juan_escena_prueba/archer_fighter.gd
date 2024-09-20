extends NPC

const COMBAT = preload("res://scenes/combat/combat.tscn")


func interact_with(player):
	await Dialogue.show_line("Prepare to fight!")
	
	var combat = COMBAT.instantiate()
	var level = get_parent()
	
	var level_parent = level.get_parent()
	level_parent.remove_child(level)
	level_parent.add_child(combat)

	combat.finished.connect(func(_outcome):
		level_parent.remove_child(combat)
		level_parent.add_child(level)
	)
