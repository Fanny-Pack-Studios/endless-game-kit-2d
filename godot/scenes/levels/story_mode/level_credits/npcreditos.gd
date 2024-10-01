xtends NPC
func interact_with(player) -> void:
	var dialogue = [
	"Viva el Rey!", "Viva!!!","¡Felicidades, Majestad!",
	"Congratulations, Your Majesty!","¡Lo ha logrado!","You did it!","¡Bravo, Majestad!","Bravo, Your Majesty!","¡Increíble, lo ha conseguido!","¡Una nueva era comienza!","¡Que todos levanten sus copas en su honor!"
	 ].pick_random()
	await Dialogue.show_line(dialogue)
	
