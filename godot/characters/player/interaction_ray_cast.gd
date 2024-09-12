extends ShapeCast2D

@export var length: float = 80.0
@export var player: Player = get_parent()
@onready var prompt = %Prompt
@onready var interact_action_label = %InteractActionLabel
@export var default_interaction_name: String = "Interactuar"

func can_interact() -> bool:
	return is_colliding() and not Dialogue.is_dialogue_open()

func _unhandled_input(event: InputEvent):
	if can_interact() and event.is_action_pressed("interact"):
		var interactable = get_collider(0)
		interactable.interact_with(player)

func _physics_process(_delta):
	if(player.velocity.x < 0):
		target_position = Vector2.LEFT * length
	if(player.velocity.x > 0):
		target_position = Vector2.RIGHT * length
	prompt.visible = can_interact()
	if(can_interact()):
		var interactable = get_collider(0)
		if(interactable.has_method("interaction_name")):
			interact_action_label.text = get_collider(0).interaction_name()
		else:
			interact_action_label.text = default_interaction_name
