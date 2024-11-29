extends Node2D

@onready var video_player = $VideoStreamPlayer  # Cambia esto según la ruta a tu VideoStreamPlayer


func _input(event):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://title_screen.tscn")
	


func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://title_screen.tscn")
