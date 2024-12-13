extends Node2D

# Variable para el contador
var contador = 0

# Referencia al Label y al Timer
@onready var time_label = $time
@onready var timer = $time/updTime

func _ready():
	# Configura el Timer
	timer.wait_time = 1.0  # Actualización cada segundo
	timer.start()

func _on_updTime_timeout():
	# Incrementa el contador y actualiza el texto del Label
	contador += 1
	time_label.text = "Time: %d" % contador
