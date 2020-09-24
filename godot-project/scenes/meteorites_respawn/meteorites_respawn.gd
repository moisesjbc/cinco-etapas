extends Node2D


onready var meteorite_scene = preload("res://scenes/meteorite/meteorite.tscn")


func _on_meteors_timer_timeout():
	# Set a random respawn position
	$path/path_follow.set_offset(randi())
	
	# Respawn the meteorite
	var meteorite = meteorite_scene.instance()
	meteorite.global_position = $path/path_follow.global_position
	get_tree().root.add_child(meteorite)
