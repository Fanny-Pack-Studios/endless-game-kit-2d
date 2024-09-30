extends HBoxContainer

@export var property:String = ""
var float_range_game_settings_option: HSlider

var initialised = false

func _ready():
	float_range_game_settings_option = $FloatRangeGameSettingsOption
	float_range_game_settings_option.value = UserSettings.get_value(property)

func _on_float_range_game_settings_option_value_changed(val):
	if !initialised:
		initialised = true
	UserSettings.set_value(property, val)
