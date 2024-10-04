@tool
extends NPC

#@export var saludo: String = "Hola, ¿que tal?"

func interact_with(player):
	# Aqui va el código de que sucede cuando el jugador interactua con el npc
	# Puedes investigar la superclase NPC para ver que funciones útiles hay
	# definidas allí. También, puedes investigar la documentación de
	# Inventory y Dialogue.
	#
	# Si no sabes por donde empezar, puedes comentar o descomentar los ejemplos
	# a continuación.
	# 
	# Ejemplo de saludo:
	await say("¡Hola buen día!")
	#
	# Ejemplo de saludo (configurable desde un export). Descomentar también
	# la línea 4 para que esto funcione:
	#await say(saludo)
	#
	# Ejemplo de intercambio:
	#await say("Te doy una calabaza por una oveja")
	#var chosen_item = await Inventory.choose_item()
	#if(chosen_item == null):
		#await say("No me diste nada")
	#elif(chosen_item == Item.Type.Oveja):
		#Inventory.remove_item(Item.Type.Oveja)
		#Inventory.add_item(Item.Type.Calabaza)
		#await say("Un placer hacer negocios")
	#else:
		#await say("¡Eso no es lo que quería!")
	#
	# Ejemplo de combate:
	#await say("¡En guardia!")
	#var outcome = await combat()
	#match outcome:
		#CombatScreen.Outcome.PlayerLost:
			#await say("¡Ja!, gané")
		#CombatScreen.Outcome.PlayerWon:
			#await say("Bien jugado.")
