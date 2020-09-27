extends MarginContainer

func _on_restart_button_pressed():
	set_visible(false)
	get_tree().change_scene("res://scenes/main_scene/main_scene.tscn")


func _on_go_to_main_menu_button_pressed():
	get_tree().change_scene("res://menus/main_menu/main_menu.tscn")
