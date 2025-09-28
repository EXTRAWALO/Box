# door.gd
extends Area2D

@export var next_scene: String = "res://Assets/Scenes/Levels/level_2.tscn" # path to next level scene

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"): # make sure your player is in "player" group
		show_sacrifice_message(body)

func show_sacrifice_message(player):
	var label = get_tree().current_scene.get_node("CanvasLayer/SacrificeLabel")
	label.text = "You sacrificed a part of you..."
	label.show()

	await get_tree().create_timer(2.0).timeout # wait 2 seconds

	get_tree().change_scene_to_file(next_scene)
