@tool

extends CharacterBody2D

## Establece el conjunto de sprites animados a usar
## para este NPC (non playable character).
@export var sprite_frames: SpriteFrames :
	set(new_sprite_frames):
		sprite_frames = new_sprite_frames
		if(is_inside_tree()):
			load_animation()

func load_animation():
	%AnimatedSprite2D.sprite_frames = sprite_frames
	if(sprite_frames.has_animation("idle")):
		%AnimatedSprite2D.play("idle")

func _ready():
	load_animation()
