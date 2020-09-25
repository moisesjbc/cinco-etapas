extends MarginContainer

func _on_restart_button_pressed():
	set_visible(false)
	get_tree().change_scene("res://scenes/main_scene/main_scene.tscn")
