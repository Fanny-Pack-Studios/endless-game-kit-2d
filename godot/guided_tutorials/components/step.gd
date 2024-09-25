@tool
extends Control

@export var title: String = "Title" :
	set(new_title):
		title = new_title
		if(is_inside_tree()):
			%Title.text = title
			
@export_multiline var description: String = "Description" :
	set(new_description):
		description = new_description
		if(is_inside_tree()):
			%Description.text = new_description


@export_group("Highlight", "highlighted_")
@export var highlighted_godot_inspector: bool = false
@export_file var highlighted_files: Array[String] = []
@export var highlighted_node_names: Array[String] = []
@export var highlighted_inspector_properties: Array[StringName] = []

@export_group("Tasks", "task_")
@export_file("*.tscn") var task_open_scene: String = ""

func _ready():
	%Title.text = title
	%Description.text = description

func build(tour: GDTour):
	tour.bubble_set_title(title)
	tour.bubble_add_text([description])
	tour.highlight_filesystem_paths(highlighted_files)
	tour.highlight_scene_nodes_by_name(highlighted_node_names)
	tour.highlight_inspector_properties(highlighted_inspector_properties)
	if(not task_open_scene.is_empty()):
		tour.bubble_add_task_open_scene(task_open_scene)
	if(highlighted_godot_inspector):
		tour.highlight_controls([EditorInterface.get_inspector()])


func add_step():
	get_parent().add_step()

func _extend_inspector_begin(inspector):
	add_method_button(inspector, "add_step")

func add_method_button(inspector, method_name):
	inspector.add_custom_control(
		CommonControls.new(inspector).method_button(method_name)
	)
