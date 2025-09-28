extends Node2D

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Menu/Levels_menu.tscn")




func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Levels/level_2.tscn")
