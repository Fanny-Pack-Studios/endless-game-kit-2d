@tool
class_name InteractionRayCast extends ShapeCast2D
## Detecta elementos cercanos con los que el jugador pueda interactuar
##
## Para ser un elemento interactuable, un nodo debe cumplir:[br]
## - Estar en la collision layer 3 ([code]interactable[/code]).[br]
## - Tener definidos los siguientes métodos: [br]
## [codeblock]
## # Lo que sucede cuando el jugador interactua con el nodo
## func interact_with(player) -> void:
##    pass # Reemplazar con lo que queremos que suceda
##
## # Define el texto a mostrar en la interfaz junto al botón de interactuar.
## # Este método es opcional, si no se define se usa "Interactuar" por defecto.
## func interaction_name() -> String:
##    return "Interactuar" # "Interactuar" puede reemplazarse por el texto que
##                         # uno quiera se vea sobre el jugador con el botón
##                         # de interactuar.
## [/codeblock]
##
## [b]TODO: Tutorial explicando como implementar un interactuable[/b]

## Distancia a la cual puede estar el nodo con el cual el jugador
## puede interactuar
@export_range(10.0, 200.0, 0.5, "suffix:px") var length: float = 80.0
## Referencia al jugador
@export var player = get_parent()
## Interfaz que muestra el botón de interactuar y la etiqueta con el texto
## que describe la interacción.
@onready var prompt: Control = %Prompt
## Etiqueta con un texto que describe el tipo de interacción
## (Interactuar, Hablar, Recoger, etc).
@onready var interact_action_label: Label = %InteractionLabel
## Nombre de interacción por defecto, se utiliza si el nodo interactuable
## no define un tipo de interacción.
@export var default_interaction_name: String = "Interactuar"

## Se puede interactuar si hay un nodo cerca colisionando con el raycast y
## además [b]no[/b] hay un diálogo abierto.
func can_interact() -> bool:
	return is_colliding() and not Dialogue.is_dialogue_open()

## Se sobreescribe [code]_unhandled_input[/code] para empezar una interacción
## (en caso de que sea posible: [method InteractionRayCast.can_interact]) si se
## dispara el evento [code]"interact"[/code].
func _unhandled_input(event: InputEvent):
	# Si estamos en el editor, no hacer nada.
	if Engine.is_editor_hint(): return
	# En caso de que se pueda interactuar y el evento recibido sea interact...
	if can_interact() and event.is_action_pressed("interact"):
		# Obtenemos el primer nodo que está colisionando con el raycast
		var interactable = get_collider(0)
		# Le enviamos el mensaje interact_with con el jugador como parámetro
		interactable.interact_with(player)

func _physics_process(_delta):
	# Si no hay player asignado, no hace nada
	if not player: return
	# El raycast mira hacia la misma dirección hacia la que mira el sprite del
	# jugador (izquierda o derecha).
	if(player.get_node("%AnimatedSprite2D").flip_h):
		target_position = Vector2.LEFT * length
	else:
		target_position = Vector2.RIGHT * length
	# En caso de que haya un nodo interactuable cerca, y ese nodo defina
	# un [code]interaction_name[/code], se escribe ese [code]interaction_name[/code]
	# en la etiqueta [member InteractionRayCast.interact_action_label].
	if(can_interact()):
		var interactable = get_collider(0)
		if(interactable.has_method("interaction_name")):
			interact_action_label.text = get_collider(0).interaction_name()
		else:
			interact_action_label.text = default_interaction_name

	# Lo que sigue a continuación de acá solo se ejecuta en el juego, [b]no[/b]
	# en el editor.
	if Engine.is_editor_hint(): return

	# Hacemos que la interfaz del botón y la etiqueta solo sea visible si
	# hay un nodo con el cual se pueda interactuar cerca.
	prompt.visible = can_interact()
