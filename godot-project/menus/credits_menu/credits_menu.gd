extends Control


func _on_go_back_button_pressed():
	get_tree().change_scene("res://menus/main_menu/main_menu.tscn")


func _on_credits_body_meta_clicked(meta):
	OS.shell_open(meta)
