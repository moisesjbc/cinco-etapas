extends Node2D

var state_machine
var fade_out_scene = preload("res://scenes/fade_out/fade_out.tscn")

func start():
	var fade_out = fade_out_scene.instance()
	get_node("/root/main_scene").add_child(fade_out)
	fade_out.rect_size = Vector2(1024, 768)
	fade_out.set_global_position(Vector2(0, 0))
	state_machine.set_timeout(1)
	
func timeout():
	get_tree().change_scene("res://scenes/ending/ending.tscn")
