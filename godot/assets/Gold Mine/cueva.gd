extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var tiempo = $Timer
@onready var collision = $CollisionShape2D
@export var next_scene:PackedScene

## Función que se ejecuta al detectar la entrada de un cuerpo en el área.
func _on_body_entered(body):
		# Espera a que el cuerpo del personaje termine de entrar a la cueva.
		await body.open_door() 
		# Reproduce la animación de closed (se destruye la cueva)
		animated_sprite_2d.play("closed")
		# Inicia el temporizador para esperar un tiempo antes de cambiar de escena.
		tiempo.start()
		# Espera a que el temporizador se termine.
		await (tiempo.timeout)
		# Cambia a la siguiente escena.
		get_tree().change_scene_to_packed(next_scene)
