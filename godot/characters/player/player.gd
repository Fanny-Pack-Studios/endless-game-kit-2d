class_name Player extends CharacterBody2D
## Jugador. Es el personaje que será controlado por quien
## juegue nuestro videojuego.
##
## Posee lógica de movimiento en 8 direcciones.

## Velocidad de movimiento del personaje.
@export_range(10, 1000, 10) var SPEED: float = 300.0

## Referencia al nodo que contiene las animaciones del personaje.
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	# Reinicia la velocidad en cada frame.
	velocity = Vector2.ZERO
	
	# Solo podemos movernos si no hay un dialogo abierto
	if not Dialogue.is_dialogue_open():
		_calcular_velocidad()
		_mirar_en_direccion_correcta()
	
	# Cambia la animación según si el jugador esta intentando mover al
	# personaje o no.
	if velocity.is_zero_approx():
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("running")
	
	# Mueve el personaje según la velocidad establecida y maneja las colisiones.
	move_and_slide()

## Se usa internamente para calcular la velocidad a la cual se va a mover.[br]
## Lee el input del jugador para decidir hacia que dirección moverse y
## multiplica el vector dirección por [constant Player.SPEED] para obtener
## la velocidad.
func _calcular_velocidad() -> void:
	# Verifica si se está presionando la tecla para moverse a la izquierda. (X)
	if Input.is_action_pressed("move_left"):
		velocity.x= -SPEED
		
	# Verifica si se está presionando la tecla para moverse hacia arriba. (Y)
	if Input.is_action_pressed("move_up"):
		velocity.y= -SPEED
		
	# Verifica si se está presionando la tecla para moverse a la derecha. (X)
	if Input.is_action_pressed("move_right"):
		velocity.x= SPEED
		
	# Verifica si se está presionando la tecla para moverse hacia abajo. (Y)
	if Input.is_action_pressed("move_down"):
		velocity.y= SPEED

## Ajusta la propiedad [member AnimatedSprite2D.flip_h] de [member Player.animated_sprite_2d]
## para que mire en la dirección en la que se está moviendo el jugador.[br]
## También ajusta la dirección hacia la cual apunta [member Player.interaction_ray_cast]
func _mirar_en_direccion_correcta():
	if(velocity.x < 0):
		animated_sprite_2d.flip_h=true
	if(velocity.x > 0):
		animated_sprite_2d.flip_h=false
