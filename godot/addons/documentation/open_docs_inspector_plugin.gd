extends EditorInspectorPlugin

func _can_handle(object: Object) -> bool:
	var script = _get_script(object)
	return script and\
		script is GDScript\
		and script.get_global_name()

func _parse_begin(object: Object):
	var help_icon = EditorInterface.get_editor_theme().get_icon("Help", "EditorIcons")
	var open_docs_button := Button.new()
	open_docs_button.icon = help_icon
	open_docs_button.text = "Abrir documentacion"
	open_docs_button.pressed.connect(func():
		var object_class_name: String = _get_script(object).get_global_name()
		var help_topic: String = str("class_name:", object_class_name)

		EditorInterface.get_script_editor().goto_help(help_topic)
	)
	add_custom_control(open_docs_button)

func _get_script(object: Object):
	if(object is Script):
		return object
	else:
		return object.get_script()
