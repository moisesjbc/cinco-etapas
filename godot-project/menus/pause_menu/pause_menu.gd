extends Control

func show():
	visible = true
	get_tree().paused = true
	
func hide():
	visible = false
	get_tree().paused = false
	
func _on_resume_button_pressed():
	hide()

func _on_return_to_menu_button_pressed():
	hide()
	get_tree().change_scene("res://menus/main_menu/main_menu.tscn")
