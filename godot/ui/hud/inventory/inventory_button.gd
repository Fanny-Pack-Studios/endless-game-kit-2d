extends TextureButton

func _ready():
	self.pressed.connect(self.toggle_inventory)
	


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("toggle_inventory"):
		toggle_inventory()

func toggle_inventory():
	if Inventory.is_open():
		Inventory.close()
	else:
		Inventory.open()
