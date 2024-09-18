@tool
extends EditorPlugin

const OpenDocsInspectorPlugin = preload("res://addons/documentation/open_docs_inspector_plugin.gd")
const DOCUMENTATION_INDEX = preload("res://addons/documentation/index/DocumentationIndex.tscn")
var inspector_plugin
var documentation_index

func _enter_tree():
	inspector_plugin = OpenDocsInspectorPlugin.new()
	documentation_index = DOCUMENTATION_INDEX.instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_BL, documentation_index)
	add_inspector_plugin(inspector_plugin)

func _exit_tree():
	if(inspector_plugin):
		remove_inspector_plugin(inspector_plugin)
	if(documentation_index):
		remove_control_from_docks(documentation_index)
		documentation_index.queue_free()
