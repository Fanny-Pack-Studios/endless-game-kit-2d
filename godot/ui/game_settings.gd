extends VBoxContainer

@onready var master_volume_slider := %MasterVolumeSlider
@onready var music_volume_slider := %MusicVolumeSlider
@onready var sound_volume_slider := %SoundVolumeSlider
			

func _on_master_volume_toggle_toggled(button_pressed: bool) -> void:
	master_volume_slider.editable = button_pressed
	UserSettings.set_value("mastervolume_enabled", button_pressed)
