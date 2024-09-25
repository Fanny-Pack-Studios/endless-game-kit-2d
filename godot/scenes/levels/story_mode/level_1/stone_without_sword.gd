extends Area2D

func interact_with(player):
	await Dialogue.show_line(
		"Arturo pensó: [i]es la piedra de la que saqué esta espada...[/i]"
	)

func interaction_name() -> String:
	return "Inspeccionar"
