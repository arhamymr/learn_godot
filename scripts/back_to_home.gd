extends TextureButton

func _on_pressed():
	$"../QuitConfirmDialog".popup()
