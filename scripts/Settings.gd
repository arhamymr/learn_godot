extends Button



func _on_pressed():
	var settings = "res://settings.tscn"
	get_tree().change_scene_to_file(settings)
