extends Control

func _on_play_button_pressed():
	get_tree().change_scene("res://scenes/main_scene/main_scene.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene("res://menus/credits_menu/credits_menu.tscn")
