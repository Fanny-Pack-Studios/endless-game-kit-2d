@tool
extends Control

const STEP = preload("res://guided_tutorials/components/Step.tscn")

func build(tour):
	for child in get_children():
		child.build(tour)
		tour.complete_step()

func add_step():
	var new_step = STEP.instantiate()
	if(get_children().size() > 0):
		var titulo = get_children().back().title
		new_step.title = titulo
	add_child(new_step, true)
	new_step.owner = self
	await get_tree().process_frame
	var selection = EditorInterface.get_selection()
	selection.clear()
	selection.add_node(new_step)

func _extend_inspector_begin(inspector):
	add_method_button(inspector, "add_step")

func add_method_button(inspector, method_name):
	inspector.add_custom_control(
		CommonControls.new(inspector).method_button(method_name)
	)
