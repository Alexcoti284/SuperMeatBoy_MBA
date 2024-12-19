extends Node2D

@onready var pause_menu = $CanvasLayer/Pausa



var paused = false

#Called when the node enters the scene tree for the first time.
func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		pauseMenu()
		

	

func pauseMenu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false
		Engine.time_scale = 1
	else:
		pause_menu.show()
		get_tree().paused = true
		Engine.time_scale = 0
	paused = !paused

# Variable para el contador
var contador = 0

# Referencia al Label y al Timer
@onready var time_label = $time
@onready var timer = $time/updTime

func _ready():
	get_tree().paused = false
	Engine.time_scale = 1
	var current_level = int(get_tree().current_scene.name.replace("lvl", "").strip_edges())
	print(current_level)
	print(get_tree().current_scene.name)
	timer.wait_time = 1.0  # Actualización cada segundo
	timer.start()
	

func _on_updTime_timeout():
	# Incrementa el contador y actualiza el texto del Label
	contador += 1
	time_label.text = "Time: %d" % contador
