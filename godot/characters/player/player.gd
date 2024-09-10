extends CharacterBody2D

## Velocidad de movimiento del personaje.
@export_range(10, 1000, 10) var SPEED = 300.0

## Referencia al nodo que contiene las animaciones del personaje.
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Reinicia la velocidad en cada frame.
	velocity = Vector2.ZERO
	
	# Verifica si se está presionando la tecla para moverse a la izquierda. (X)
	if Input.is_action_pressed("move_left"):
		velocity.x= -SPEED
		animated_sprite_2d.flip_h=true
		
	# Verifica si se está presionando la tecla para moverse hacia arriba. (Y)
	if Input.is_action_pressed("move_up"):
		velocity.y= -SPEED
		
	# Verifica si se está presionando la tecla para moverse a la derecha. (X)
	if Input.is_action_pressed("move_right"):
		velocity.x= SPEED
		animated_sprite_2d.flip_h=false
		
	# Verifica si se está presionando la tecla para moverse hacia abajo. (Y)
	if Input.is_action_pressed("move_down"):
		velocity.y= SPEED
	
	# Cambia la animación según si el jugador esta intentando mover al
	# personaje o no.
	if velocity.is_zero_approx():
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("running")
	
	# Mueve el personaje según la velocidad establecida y maneja las colisiones.
	move_and_slide()
