extends Node2D

var niveles = []  # Lista de niveles
var indice_nivel_actual = 0  # Índice del nivel actual

@onready var jugador = $Jugador  # Referencia al jugador
@onready var nivel1 = $Nivel1    # Referencia al nivel 1
@onready var nivel2 = $Nivel2    # Referencia al nivel 2
@onready var nivel3 = $Nivel3    # Referencia al nivel 3

func _ready() -> void:
	# Verificar la existencia del jugador
	if jugador:
		print("Jugador encontrado: ", jugador.name)
	else:
		print("Jugador no encontrado. Revisa la estructura de la escena.")

	# Añadir los niveles a la lista
	if nivel1 and nivel2 and nivel3:
		niveles.append(nivel1)
		niveles.append(nivel2)
		niveles.append(nivel3)
	else:
		print("Uno o más niveles no están disponibles.")

	# Posicionar al jugador en el primer nivel
	if niveles.size() > 0:
		jugador.position = niveles[indice_nivel_actual].position
		print("Posición inicial del jugador establecida en: ", jugador.position)
	else:
		print("No hay niveles en la lista. Verifica las referencias.")

func _input(event):
	if event.is_action_pressed("ui_right"):
		cambiar_nivel(1)
	elif event.is_action_pressed("ui_left"):
		cambiar_nivel(-1)
		
	if event.is_action_pressed("ui_accept"):
		match indice_nivel_actual:
			0:
				get_tree().change_scene_to_file("res://Escenes/Fons.tscn")
			1:
				get_tree().change_scene_to_file("res://Escenes/Fons.tscn")
			2:
				get_tree().change_scene_to_file("res://Escenes/Fons.tscn")

func cambiar_nivel(direccion: int) -> void:
	indice_nivel_actual += direccion
	
	# Mantener el índice dentro de los límites de la lista
	if indice_nivel_actual < 0:
		indice_nivel_actual = niveles.size() - 1
	elif indice_nivel_actual >= niveles.size():
		indice_nivel_actual = 0

	match indice_nivel_actual:
			0:
				$Label.text = "1-1 Hello World"
			1:
				$Label.text = "1-2 Upward"
			2:
				$Label.text = "1-3 The Gap"
	# Cambiar la posición del jugador al nuevo nivel
	if jugador and niveles[indice_nivel_actual]:
		jugador.position = niveles[indice_nivel_actual].position
		print("Jugador movido a: ", jugador.position)
