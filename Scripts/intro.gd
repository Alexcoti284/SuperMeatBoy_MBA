extends Node2D

@onready var video_player = $VideoStreamPlayer  # Cambia esto según la ruta a tu VideoStreamPlayer


func _input(event):
	if event.is_action_pressed("titleSpace"):
		get_tree().change_scene_to_file("res://Escenes/title_screen.tscn")
	


func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://Escenes/title_screen.tscn")
