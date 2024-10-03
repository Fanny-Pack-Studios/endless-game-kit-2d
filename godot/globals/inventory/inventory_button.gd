extends GameButton

func _ready():
	super()
	self.pressed.connect(self.toggle_inventory)	

func _input(event: InputEvent):
	if event.is_action_pressed("toggle_inventory"):
		toggle_inventory()
	if event.is_action_pressed("pause") and Inventory.is_open():
		Inventory.close()
		get_viewport().set_input_as_handled()

func toggle_inventory():
	if Inventory.is_open():
		Inventory.close()
	elif not Dialogue.is_dialogue_open():
		Inventory.open()
