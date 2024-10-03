extends ParallaxBackground

@export var background_speed: float = 20.0
@onready var parallax_layer = $ParallaxLayer

func _process(delta):
	parallax_layer.motion_offset -= delta * Vector2.ONE * background_speed
