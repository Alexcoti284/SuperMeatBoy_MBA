extends CharacterBody2D

func _on_body_entered(body: Node) -> void:
	# Verifica que el objeto que colisiona es el jugador
	if body.is_in_group("Player2"):
		# Extrae el número del nivel actual del nombre de la escena
		var current_level = int(get_tree().current_scene.name.strip_edges())
		var next_level = "res://Escenes/Lvl" + str(current_level + 1) + ".tscn"

		# Verifica si el archivo existe antes de cambiar
		if FileAccess.file_exists(next_level):
			get_tree().change_scene_to_file(next_level)
		else:
			print("El nivel siguiente no existe: ", next_level)
