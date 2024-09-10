@tool

extends CharacterBody2D

@export_enum("BLUE","PURPLE","RED","YELLOW") var color: String:
	set(new_color):
		color=new_color
		if(is_inside_tree()):
			cargar_animacion_color()
				
				
func cargar_animacion_color():
	var animation_path = {
					"BLUE": "res://characters/npcs/goblin/animations/goblin_blue.tres",
					"PURPLE": "res://characters/npcs/goblin/animations/goblin_purple.tres",
					"RED": "res://characters/npcs/goblin/animations/goblin_red.tres",
					"YELLOW" : "res://characters/npcs/goblin/animations/goblin_yellow.tres"
					}[color]
					
	%AnimatedSprite2D.sprite_frames = load(animation_path) 
	%AnimatedSprite2D.play("idle")

func _ready():
	cargar_animacion_color()
