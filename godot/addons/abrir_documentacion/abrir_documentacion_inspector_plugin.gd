extends EditorInspectorPlugin

func _can_handle(object: Object) -> bool:
	var object_script = object.get_script()
	return object_script and\
		object_script is GDScript\
		and object_script.get_global_name()

func _parse_begin(object: Object):
	var open_docs_button := Button.new()
	open_docs_button.text = "Abrir documentacion"
	open_docs_button.pressed.connect(func():
		var object_class_name: String = object.get_script().get_global_name()
		var help_topic: String = str("class_name:", object_class_name)

		EditorInterface.get_script_editor().goto_help(help_topic)
	)
	add_custom_control(open_docs_button)
