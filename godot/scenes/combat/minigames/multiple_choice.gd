class_name MultipleChoice extends MiniGame
## Minijuego multiple choice
##
## Es un juego que se compone por un enunciado o pregunta y múltiples respuestas 
## posibles, de las cuales solamente una es correcta.

## Ruta a la escena con la UI y la lógica del multiple choice
const MULTIPLE_CHOICE_SCENE_PATH =\
	"res://scenes/combat/minigames/multiple_choice_scene.tscn"

## Enunciado o pregunta
@export_multiline var question: String

## Respuesta correcta, debe ser una de [member answers].
@export var correct_answer: String

## Respuestas posibles.
@export var answers: Array[String]

## Método que instancia la UI del multiple choice y lo inicializa con este 
## recurso, que posee los datos para armar la interfaz.
func scene() -> MiniGameScene:
	var multiple_choice_minigame = load(MULTIPLE_CHOICE_SCENE_PATH).instantiate()
	multiple_choice_minigame.multiple_choice = self
	return multiple_choice_minigame
