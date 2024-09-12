extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var tiempo = $Timer
@onready var collision = $CollisionShape2D



func _ready():
	animated_sprite_2d.play("cloused")
	pass # Replace with function body.

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.Door = true
		collision.queue_free()
		animated_sprite_2d.play("open")
		tiempo.start()
		await (tiempo.timeout)
		get_tree().change_scene_to_file("res://scenes/levels/Ysa/escena2.tscn")
		pass
