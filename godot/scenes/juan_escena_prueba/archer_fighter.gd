extends NPC

func interact_with(player):
	await Dialogue.show_line("Prepare to fight!")

	var outcome = await combat()

	match outcome:
		CombatScreen.Outcome.PlayerWon:
			await Dialogue.show_line("You won!")
		CombatScreen.Outcome.PlayerLost:
			await Dialogue.show_line("You lost D:")
