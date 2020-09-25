extends MarginContainer

func _on_restart_button_pressed():
	#get_tree().change_scene("res://scenes/main_scene/main_scene.tscn")
	print("wololoooo")
	set_visible(false)
	#get_tree().paused = false
	get_tree().reload_current_scene()
