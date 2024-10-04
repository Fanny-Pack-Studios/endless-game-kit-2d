class_name TextBubble extends Control
## Burbuja de texto en la cual se pueden mostrar mensajes.[br]
## Se puede usar BBCode para escribir texto con formato.
##
## @tutorial(BBCode en Godot): https://docs.godotengine.org/es/4.x/tutorials/ui/bbcode_in_richtextlabel.html

## El nodo de godot encargado de manejar texto.
@onready var rich_text_label: RichTextLabel = %RichTextLabel
## Animation player para dar efectos de entrada y salida a la burbuja de texto.
@onready var animation_player: AnimationPlayer = $AnimationPlayer

## Señal emitida cuando el jugador "acepta" el texto para hacerlo avanzar
## tras haberlo leído o para saltearlo.
signal line_accepted

## Señal emitida cuando la burbuja de texto se escondió por completo.
signal disappeared

func _ready():
	Inventory.closed.connect(func(_item):
		if visible:
			grab_focus()
	)

## Sobreescribimos _gui_input para ante ciertos eventos emitir la señal
## que indica que se puede avanzar el texto.
func _gui_input(event: InputEvent):
	if event.is_action_pressed("ui_accept")\
		or event.is_action_pressed("interact")\
		or event.is_action_pressed("pause"):
		get_viewport().set_input_as_handled()
		accept_line()

## Emite a señal [signal line_accepted].
func accept_line():
	line_accepted.emit()

## Se escribe el texto [param text] en la burbuja de texto.[br]
## Por defecto, el texto se escribe en color negro, pero se pueden usar
## tags de BBCode para escribirlo en otro color.
## [br]
## Ejemplo:
## [codeblock]
## text_bubble.display_text("[color=red]ERROR![/color]")
## [/codeblock]
func display_text(text) -> void:
	rich_text_label.clear()
	rich_text_label.push_color(Color.BLACK)
	rich_text_label.append_text(text)
	rich_text_label.pop()

## Hace visible a la burbuja de texto con un fundido de transparente a opaco.
## Si la burbuja de texto ya era visible, no hace nada.[br]
## Se puede esperar a que termine de aparecer la burbuja de
## la siguiente manera:
## [codeblock]
## await text_bubble.appear()
## [/codeblock]
func appear():
	## Si ya era visible, no es necesario hacer nada
	if(visible):
		return
	visible = true
	## Hacemos que se haga visible con un fundido de transparente a opaco
	animation_player.play("appear")
	## Hacemos que el nodo tome el foco para que las teclas y clicks lo afecten
	grab_focus()

## Hace invisible la burbuja de texto con un fundido a transparente.[br]
## Se puede esperar a que termine de desaparecer la burbuja de
## la siguiente manera:
## [codeblock]
## await text_bubble.disappear()
## [/codeblock]
func disappear():
	## Hacemos que se haga invisible con un fundido a transparente
	animation_player.play("disappear")
	## Esperamos a que la animacion termine
	await animation_player.animation_finished
	visible = false
	disappeared.emit()

	
