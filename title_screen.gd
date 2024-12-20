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
	if event.is_action_pressed("titleSpace"): 
		ocultar_titulo()
		mostrar_titulo()

func ocultar_titulo() -> void:
	for child in pre.get_children():
		if child.name != "CanvasGroup" && child.name != "cortina3" && child.name != "cortina4" && child.name != "bandaNegraS" && child.name != "bandaNegraI" && child.name != "fondoRosa":
			child.visible = false  

func mostrar_titulo() -> void:
	post.visible = true
	


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenes/Mundo1.tscn");


func _on_exit_pressed() -> void:
	get_tree().quit();	
