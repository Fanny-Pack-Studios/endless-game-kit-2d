class_name MiniGameScene extends Control
## Clase abstracta de la que deben heredar las clases de las escenas de los
## minijuegos.

## Se emite cuando el juego es completado.
## [br]
## Un puntaje de 100 significa que el minijuego fue superado exitosamente.
## [br]
## Un puntaje de 0 significa que el minijuego falló.
## Se utiliza en [method EnemyAttackMiniGame.setup_turn]
## [br]
## [b]Importante: [/b] debe emitirse sí o sí, en caso contrario el combate
## nunca avanzará luego de este minijuego.
signal completed(points: int)

## Para ser usado en el momento que el minijuego se resolvió exitosamente.
func succeed():
	completed.emit(100)

## Para ser usado en el momento que el minijuego se resolvió mal.
func fail():
	completed.emit(0)
