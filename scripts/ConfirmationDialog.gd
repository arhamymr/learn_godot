extends ConfirmationDialog

func _on_confirmed():
	get_tree().change_scene_to_file("res://main.tscn")
