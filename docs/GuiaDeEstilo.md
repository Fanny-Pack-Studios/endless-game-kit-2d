## Guía de estilo

> Inspirada en [la utilizada por godot](https://docs.godotengine.or/es/4.x/tutorials/best_practices/project_organization.html#style-guide).

Para que haya coherencia entre los proyectos, recomendamos seguir estas directrices:

- Usa snake_case para los nombres de carpetas y archivos. Esto evita los problemas de sensibilidad a las mayúsculas y minúsculas que pueden surgir después de exportar un proyecto a Windows.

- Usa PascalCase para los nombres de los nodos.

- Guarda los archivos externos de imagen y sonido en la carpeta assets/ de nivel superior. Esto facilita el seguimiento de los archivos de terceros. Hay algunas excepciones a esta regla; por ejemplo, si utilizas recursos de juego de terceros para un personaje, tiene más sentido incluirlos dentro de la misma carpeta que las escenas y los scripts del personaje. Al empezar a utilizar los assets, podemos copiarlos a la carpeta que corresponda.

- De agregar plugins al proyecto, guardarlos en la carpeta addons/ de nivel superior.

