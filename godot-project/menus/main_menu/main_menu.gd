extends Control

func _ready():
	clean_npcs()
	if OS.get_name() == "HTML5":
		$margin_container/root_vbox_container/vbox_container/exit_button.visible = false

func _on_play_button_pressed():
	get_tree().change_scene("res://scenes/main_scene/main_scene.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene("res://menus/credits_menu/credits_menu.tscn")


func _on_exit_button_pressed():
	get_tree().quit()


func clean_npcs():
	for clear_on_reset_asset in get_tree().get_nodes_in_group("clear_on_reset"):
		clear_on_reset_asset.queue_free()
