extends Control


@onready var main = $"../../"

func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused
	
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
		



func _on_resumir_juego_pressed() -> void:
	main.pauseMenu()


func _on_volver_al_mapa_pressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://Escenes/Mundo1.tscn")


func _on_salir_juego_pressed() -> void:
	get_tree().quit()
