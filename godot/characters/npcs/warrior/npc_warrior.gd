extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

const SPEED = 300.0



func _physics_process(delta: float) -> void:
	
	if velocity.is_zero_approx():
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("running")
	
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		velocity.x= -SPEED
		animated_sprite_2d.flip_h=true
		
	if Input.is_action_pressed("move_up"):
		velocity.y= -SPEED
		
	if Input.is_action_pressed("move_right"):
		velocity.x= SPEED
		animated_sprite_2d.flip_h=false
		
	if Input.is_action_pressed("move_down"):
		velocity.y= SPEED
	
	
	
	move_and_slide()
