class_name DialogueSystem extends CanvasLayer
## DialogueSystem es una clase usada por el singleton Dialogue para mostrar
## cuadros de texto en pantalla.
##
## La forma de abrir dialogos es usando directamente el singleton Dialogue
## desde cualquier lugar del código.
## [br]
## Esta clase no debería instanciarse
## directamente.
## [br][br]
## [b]Importante: [/b] todos los métodos que muestran texto se pueden
## utilizar con await para que el código a ejecutar no avance hasta que la
## línea haya sido leída y avanzada.[br]
## [i]Ejemplo:[br]
## Queremos hacer un personaje que diga algo y luego se borre de la escena.
## Con el siguiente código, no va a ejecutarse el [code]queue_free()[/code] 
## hasta que el jugador haya leído y avanzado la línea de texto "¡Me voy!".[/i]
## [codeblock]
## func escapar():
##   await Dialogue.show_line("¡Me voy!")
##   queue_free()
## [/codeblock]

## Burbuja de texto donde se mostraran los mensajes
@onready var text_bubble: TextBubble = $TextBubble

## Muestra un dialogo con el texto [param line].[br]
## Ejemplo:
## [codeblock]
## await Dialogue.show_line("¡Hola mundo!")
## [/codeblock]
func show_line(line: String):
	text_bubble.appear()
	text_bubble.display_text(line)
	await text_bubble.line_accepted
	await text_bubble.disappear()

## Muestra varios dialogos seguidos.
## Cada linea de dialogo es un elemento del array [param lines].[br]
## Ejemplo:
## [codeblock]
## await Dialogue.show_multiple_lines(["Hola"], ["¿qué tal?"])
## [/codeblock]
func show_multiple_lines(lines: Array[String]):
	for line in lines:
		await show_line(line)

## Mostrar un dialogo dicho por [param character_name]
## con el texto [param line].[br]
## Ejemplo:
## [codeblock]
## await Dialogue.say_line("Arturo", "¿Cómo dice?")
## [/codeblock]
func say_line(character_name: String, line: String):
	var complete_line: String =\
		"[color=blue]%s[/color]: %s" % [character_name, line]

	await show_line(complete_line)

## Mostrar varios dialogos seguidos dichos por [param character_name]
## Cada linea de de dialogo es un elemento del array [param lines].[br]
## Ejemplo:
## [codeblock]
## await Dialogue.say_multiple_lines("Arturo", ["¿Podría repetirmelo?", "No entiendo mucho inglés"])
## [/codeblock]
func say_multiple_lines(character_name: String, lines: Array[String]):
	for line in lines:
		await say_line(character_name, line)

## Retorna [code]true[/code] si existe un diálogo activo abierto,
## y [code]false[/code] en caso contrario.
func is_dialogue_open() -> bool:
	return text_bubble.visible
