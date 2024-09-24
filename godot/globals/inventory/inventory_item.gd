@tool
class_name InventoryItem extends TextureButton
## Clase del nodo que representa un objeto en el inventario.

## Cantidad que se tiene de ese objeto.
@export var amount: int = 1
## Etiqueta que mostrará la cantidad.
@onready var amount_of_items_label = %AmountOfItemsLabel
## Ícono del objeto que mostrará la imagen del mismo.
@onready var item_icon = %ItemIcon
## Tipo del objeto. Debe ser uno de los definidos en [enum Item.Type]
@export var item_type: Item.Type :
	set(new_item_type):
		## El setter custom modifica el sprite cuando elegimos el tipo de objeto.
		item_type = new_item_type
		## [code]is_inside_tree()[/code] es necesario para que no se intente
		## acceder al ícono antes de que el nodo esté en el arbol de escena.
		if(is_inside_tree()):
			_update_image()

## Se emite cuando se presiona el botón
signal item_selected(type: Item.Type)

func _process(_delta):
	# Todos los frames, actualizamos el texto que muestra la cantidad de
	# ese objeto para que diga:
	# x N
	# donde N sería la cantidad
	amount_of_items_label.text = "x %s" % amount

func _ready():
	# Al agregar el nodo al árbol, configuramos la imagen
	_update_image()

func _on_select_item_button_pressed():
	# Al apretar el botón, emitimos la señal item_selected con el tipo
	# de objeto como parámetro
	item_selected.emit(item_type)

# Actualiza el ícono según cuál es el tipo del objeto
func _update_image():
	# Pedimos la textura asociada al objeto a la clase Item
	item_icon.texture = Item.texture_for(item_type)
	# Fijamos el tamaño en 100x100 pixeles sin importar el tamaño de la imagen
	item_icon.size = Vector2(100, 100)
