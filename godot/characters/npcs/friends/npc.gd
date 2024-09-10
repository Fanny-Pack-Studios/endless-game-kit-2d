@tool
extends CharacterBody2D

@export var sprite_frames: SpriteFrames :
	set(new_sprite_frames):
		sprite_frames = new_sprite_frames
		if(is_inside_tree()):
			%AnimatedSprite2D.sprite_frames = sprite_frames
			%AnimatedSprite2D.play("idle")

func _ready():
	%AnimatedSprite2D.sprite_frames = sprite_frames
	%AnimatedSprite2D.play("idle")
