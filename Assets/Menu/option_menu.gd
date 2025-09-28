extends Control

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Menu/menu.tscn")

@onready var sfx_slider: HSlider = $HSlider  # adjust path if needed

func _ready():
	sfx_slider.value = sfx_slider.max_value
