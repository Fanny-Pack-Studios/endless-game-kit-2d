@tool
extends EditorPlugin

const AbrirDocumentacionInspectorPlugin = preload("res://addons/abrir_documentacion/abrir_documentacion_inspector_plugin.gd")
var inspector_plugin

func _enter_tree():
	inspector_plugin = AbrirDocumentacionInspectorPlugin.new()
	add_inspector_plugin(inspector_plugin)


func _exit_tree():
	remove_inspector_plugin(inspector_plugin)
