@tool
class_name NPC extends CharacterBody2D

@export var _interaction_name: String = "Hablar"

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

func interact_with(_player):
	await Dialogue.say_line(name, "Hola!")

func interaction_name() -> String:
	return _interaction_name

func combat(
	in_combat_character: FighterCharacter = null
) -> CombatScreen.Outcome:
	var combat_scene: CombatScreen = load("res://scenes/combat/combat.tscn").instantiate()
	
	combat_scene.configure(in_combat_character)
	
	SceneChanger.change_scene_to(combat_scene)

	var outcome = await combat_scene.finished

	SceneChanger.back_to_last_scene()

	return outcome


func say(line):
	await Dialogue.show_line(line)
