class_name MiniGame extends Resource
## Clase abstracta de la que deben heredar todos los minijuegos.
## 
## Es un recurso para que se puedan guardar diferentes instancias de un tipo de 
## minijuego como archivos modificables.
## [br]
## Puedes explorar la carpeta [code]res://scenes/combat/minigames/multiple_choice/[/code] 
## para ver los minijuegos del tipo [MultipleChoice] que existen allí.
##
## @tutorial(¿Cómo agregar nuevos multiple choice?): https://drive.google.com/file/d/12lunbej31fN8SJ4bCkchyKKyZa-J9OgC/view?usp=sharing
## @tutorial(¿Qué es un recurso en Godot?): https://docs.godotengine.org/es/4.x/tutorials/scripting/resources.html

## Crea, configura y retorna la escena que representará al minijuego.
## [br]
## [img width=32]res://addons/documentation/NodeWarning.svg[/img]
## [b]Debe ser implementado por todas las subclases de esta clase.[/b]
## [img width=32]res://addons/documentation/NodeWarning.svg[/img]
## [br]
## Una implementación posible se podría ver de la siguiente manera:
## [codeblock]
## func scene() -> MiniGameScene:
##   # MINIGAME_SCENE_PATH no existe, deberías crearla
##   var mini_game = load(MINIGAME_SCENE_PATH).instantiate()
##   return mini_game
## [/codeblock]
func scene() -> MiniGameScene:
	assert(false, "Subclass responsibility")
	return Control.new()
