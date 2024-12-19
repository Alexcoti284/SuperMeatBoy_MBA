extends Area2D

func _on_body_entered(body: Node) -> void:
	# Verifica que el objeto que colisiona es el jugador
	if body.is_in_group("Player"):
		# Extrae el número del nivel actual del nombre de la escena
		print("ha entrado")
		
		var current_level = int(get_tree().current_scene.name.replace("Lvl", "").strip_edges())
		print(get_tree().current_scene)
		print(current_level)
		var next_level = "res://Escenes/Lvl" + str(current_level + 1)  + ".tscn"	
		#var viewport_size = get_viewport().get_visible_rect().size
		# Verifica si el archivo existe antes de cambiar
		
		
		if FileAccess.file_exists(next_level):
			get_tree().change_scene_to_file(next_level)
		else:
			get_tree().change_scene_to_file("res://Escenes/Mundo1.tscn")
