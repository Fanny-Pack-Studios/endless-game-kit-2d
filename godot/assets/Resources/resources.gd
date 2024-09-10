@tool
extends Node2D

# Definimos una variable llamada 'objects' de tipo String con el valor predeterminado "money".
#Utilizamos la anotación @export_enum para crear una enumeración que incluye las opciones del coleccionable.
@export_enum("arbusto","calabaza","carne","dinero","hongo1","hongo2","hueso","oveja","piedra","planta","tronco") var objects:String = "dinero":
	set(value):
		objects = value
		if is_inside_tree():
			$animations.animation = objects


func _ready():
	$animations.play(objects)
	$area_collect.body_entered.connect(self._on_body_entered)

# Se ejecuta cuando una animación ha terminado.
func _on_animation_finished():
	if not Engine.is_editor_hint():
		self.queue_free()
		
# Función que se llama cuando otro cuerpo entra en el área.
func _on_body_entered(body):
	self.queue_free() # Desaparecer el objeto
