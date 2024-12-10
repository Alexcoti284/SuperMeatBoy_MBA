extends Control

# Referencias a los nodos
@onready var pre = $pre
@onready var title = $pre/CanvasGroup/Title
@onready var cortina3 = $pre/CanvasGroup/Cortina3
@onready var cortina4 = $pre/CanvasGroup/Cortina4
@onready var post = $post
@onready var flechas = $post/flechas



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	post.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("titleSpace"):  # Cambia "ui_accept" por la acción que prefieras
		ocultar_titulo()
		mostrar_titulo()

func ocultar_titulo() -> void:
	for child in pre.get_children():
		if child.name != "CanvasGroup" && child.name != "cortina3" && child.name != "cortina4" && child.name != "bandaNegraS" && child.name != "bandaNegraI" && child.name != "fondoRosa":
			child.visible = false  # Cambiar visibilidad en Godot 4

func mostrar_titulo() -> void:
	post.visible = true
	
