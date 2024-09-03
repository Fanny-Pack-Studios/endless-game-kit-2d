extends VBoxContainer

@onready var master_volume_slider := %MasterVolumeSlider
@onready var music_volume_slider := %MusicVolumeSlider
@onready var sound_volume_slider := %SoundVolumeSlider
@onready var language_dropdown := %LanguageDropdown

var locales:PackedStringArray = []

func _ready() -> void:
	self.locales = TranslationServer.get_loaded_locales()
	var current_locale = TranslationServer.get_locale()
	var idx = 0
	var select_index = -1
	for locale in locales:
		var language = TranslationServer.get_locale_name(locale)
		language_dropdown.add_item(language, idx)
		if current_locale == locale:
			select_index = idx
		idx += 1
	language_dropdown.select(select_index)		
			

func _on_master_volume_toggle_toggled(button_pressed: bool) -> void:
	master_volume_slider.editable = button_pressed
	UserSettings.set_value("mastervolume_enabled", button_pressed)

func _on_language_dropdown_item_selected(index: int) -> void:
	UserSettings.set_value("game_locale", locales[index])
