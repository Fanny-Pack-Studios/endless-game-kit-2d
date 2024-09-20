extends CanvasItem

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label = %Label


func play_heal(amount: int):
	label.text = "+ %s" % amount
	animation_player.play("heal")


func play_hurt(amount: int):
	label.text = "- %s" % amount
	animation_player.play("hurt")
