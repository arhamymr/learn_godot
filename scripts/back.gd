extends Button

func _on_pressed():
	var main = "res://main.tscn"
	get_tree().change_scene_to_file(main)
