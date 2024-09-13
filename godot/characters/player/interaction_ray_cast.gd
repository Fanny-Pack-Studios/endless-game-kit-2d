@tool
class_name InteractionRayCast extends ShapeCast2D

@export_range(10.0, 200.0, 0.5, "suffix:px") var length: float = 80.0
@export var player: Player = get_parent()
@onready var prompt = %Prompt
@onready var interact_action_label = %InteractionLabel
@export var default_interaction_name: String = "Interactuar"
@onready var animated_sprite_2d = %AnimatedSprite2D

func can_interact() -> bool:
	return is_colliding() and not Dialogue.is_dialogue_open()

func _unhandled_input(event: InputEvent):
	if Engine.is_editor_hint(): return
	if can_interact() and event.is_action_pressed("interact"):
		var interactable = get_collider(0)
		interactable.interact_with(player)

func _physics_process(_delta):
	if(animated_sprite_2d.flip_h):
		target_position = Vector2.LEFT * length
	else:
		target_position = Vector2.RIGHT * length
	if(can_interact()):
		var interactable = get_collider(0)
		if(interactable.has_method("interaction_name")):
			interact_action_label.text = get_collider(0).interaction_name()
		else:
			interact_action_label.text = default_interaction_name

	if Engine.is_editor_hint(): return

	prompt.visible = can_interact()
