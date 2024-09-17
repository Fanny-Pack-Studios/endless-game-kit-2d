class_name DialogueSystem extends CanvasLayer
## DialogueSystem es una clase usada por el [url=https://docs.godotengine.org/es/4.x/tutorials/scripting/singletons_autoload.html]singleton[/url]
## Dialogue para mostrar cuadros de texto en pantalla.
##
## La forma de abrir dialogos es usando directamente el [url=https://docs.godotengine.org/es/4.x/tutorials/scripting/singletons_autoload.html]singleton[/url]
## Dialogue desde cualquier lugar del código.
## [br]
## Esta clase [b]no[/b] debería instanciarse directamente.
## [br][br]
## [b]Importante: [/b] todos los métodos que muestran texto se pueden
## utilizar con [url=https://docs.godotengine.org/es/4.x/tutorials/scripting/gdscript/gdscript_basics.html#awaiting-signals-or-coroutines][code]await[/code][/url]
## para que el código a ejecutar no avance hasta que la
## línea haya sido leída y avanzada.[br]
## [i]Ejemplo:[br]
## Queremos hacer un personaje que diga algo y luego se borre de la escena.
## Con el siguiente código no va a ejecutarse el [code]queue_free()[/code] 
## hasta que el jugador haya leído y avanzado la línea de texto "¡Me voy!".[/i]
## [codeblock]
## func escapar():
##   await Dialogue.show_line("¡Me voy!")
##   queue_free()
## [/codeblock]
## @tutorial(¿Qué es un singleton?): https://docs.godotengine.org/es/4.x/tutorials/scripting/singletons_autoload.html
## @tutorial(¿Cómo se usa await?): https://docs.godotengine.org/es/4.x/tutorials/scripting/gdscript/gdscript_basics.html#awaiting-signals-or-coroutines


## Emitida cada vez que comienza una linea de dialogo.[br]
## En diálogos de multiples líneas, se emitirá una vez por cada línea.[br]
signal line_started(line: String)

## Emitida cada vez que finaliza una linea de dialogo.[br]
## En diálogos de multiples líneas, se emitirá una vez por cada línea.
signal line_finished(line: String)

## Burbuja de texto donde se mostraran los mensajes
@onready var text_bubble: TextBubble = $TextBubble

## Muestra un dialogo con el texto [param line].[br]
## Ejemplo:
## [codeblock]
## await Dialogue.show_line("¡Hola mundo!")
## [/codeblock]
func show_line(line: String):
	# Se muestra la burbuja de texto
	text_bubble.appear()
	
	# Se escribe la linea a mostrar en la burbuja de texto
	text_bubble.display_text(line)
	
	# Se emite la señal line_started para que si otro nodo quiere hacer algo
	# cuando comienza un dialogo pueda hacerlo
	line_started.emit(line)

	# Se espera a que la linea haya sido leida por el jugador
	await text_bubble.line_accepted
	
	# Se esconde la burbuja de texto
	await text_bubble.disappear()
	
	# Se emite la señal line_started para que si otro nodo quiere hacer algo
	# cuando finaliza un diálogo pueda hacerlo
	line_finished.emit(line)

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
	# Se construye una linea de texto con el nombre del personaje y lo
	# que va a decir
	var complete_line: String =\
		"[color=blue]%s[/color]: %s" % [character_name, line]

	# Se usa show_line para mostrar la linea de texto construida
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

## Fuerza que se avance a la siguiente línea de texto (si la hay) o si
## no que se cierre la actual.[br]
## En los casos más comunes no va a ser necesario usar este método, ya que
## para la mayoría de los casos bastaría con [member Dialogue.say_line],
## [member Dialogue.show_line], [member Dialogue.say_multiple_lines] o
## [member Dialogue.say_multiple_lines].[br]
## Se puede usar [code]await[/code] para esperar a que haya desaparecido
## la burbuja de texto.
## Ejemplo:
## [codeblock]
## await Dialogue.advance()
## [/codeblock]
func advance():
	text_bubble.accept_line()

	await text_bubble.disappeared

## Dado un texto y una pista asociada a ese texto, devuelve un string con
## etiquetas de BBCode que muestran al texto pasado y un tooltip sobre el
## mismo. Al pasar el mouse por ese tooltip se muestra la pista.
func hinted_text(text: String, hint: String) -> String:
	return "[hint=%s][wave]%s[/wave][/hint]" % [hint, text]

## Retorna [code]true[/code] si existe un diálogo activo abierto,
## y [code]false[/code] en caso contrario.
func is_dialogue_open() -> bool:
	return text_bubble.visible or Inventory.is_open()
