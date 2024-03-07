extends Button

func _on_pressed():
	var hello_world_scn = "res://hello_world.tscn"
	get_tree().change_scene_to_file(hello_world_scn)
