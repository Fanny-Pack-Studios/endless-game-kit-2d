@tool
class_name DocumentationIndex extends Control
const DOC_ICON = preload("res://addons/documentation/DocIcon.tres")
@onready var tree: Tree = %Tree
@onready var filter = %Filter

enum {
	OPEN_DOCS,
	OPEN_SCRIPT
}

func _ready():
	tree.clear()
	read_into(tree, ["addons", "savegame", "boot", "overlays", "components"])
	var tree_items: Array = []
	
	tree.item_selected.connect(self.on_item_selected)
	tree.button_clicked.connect(self.on_button_clicked)
	filter.text_changed.connect(self.on_filter_text_changed)


func on_filter_text_changed(filter_text: String):
	var tree_item = tree.get_root()
	while tree_item:
		var item_text: String = tree_item.get_text(0)
		tree_item.visible = \
			not filter_text or\
			not item_text or\
			filter_text.to_upper() in tree_item.get_text(0).to_upper()
		tree_item = tree_item.get_next_in_tree()


func read_into(tree: Tree, excluded_folders: Array[String]):
	tree.clear()
	var SCRIPT_ICON = EditorInterface.get_editor_theme().get_icon("Script", "EditorIcons")
	var scripts: = []
	var root = tree.create_item()
	find_scripts_in("res://", scripts, excluded_folders)
	var tree_as_dict = {}
	for script in scripts:
		var child = tree.create_item(root)
		var file_path = "/".join(script.resource_path.simplify_path().lstrip("res://").split("/"))
		var script_class_name = script.get_global_name()
		child.set_text(0, script_class_name)
		child.set_icon(0, DOC_ICON)
		child.set_metadata(0, script)
		child.add_button(0, DOC_ICON, OPEN_DOCS)
		child.add_button(0, SCRIPT_ICON, OPEN_SCRIPT)


func find_scripts_in(folder: String, scripts: Array, excluded_folders: Array[String]):
	var dir = DirAccess.open(folder)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var full_path: String = str(folder, "/", file_name)
			if dir.current_is_dir() and not file_name in excluded_folders:
				find_scripts_in(full_path, scripts, excluded_folders)
			elif file_name.ends_with(".gd"):
				var script: GDScript = load(full_path)
				if(script.get_global_name()):
					scripts.push_back(script)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path %s: %s" % [folder, DirAccess.get_open_error()])


func on_item_selected() -> void:
	var tree_item = tree.get_selected()
	var script = tree_item.get_metadata(0)

	open_docs(script)


func on_button_clicked(item: TreeItem, column: int, id: int, mouse_button_index: int) -> void:
	var script = item.get_metadata(0)

	match id:
		OPEN_SCRIPT:
			open_script(script)
		OPEN_DOCS:
			open_docs(script)


func open_script(script):
	EditorInterface.edit_script(script, 0)


func open_docs(script):
	var help_topic: String = "class_name:%s" % script.get_global_name()

	EditorInterface.get_script_editor().goto_help(help_topic)
