extends Node2D

onready var friend_scene = preload("res://scenes/friend/friend.tscn")


func _on_respawn_timer_timeout():
	# Set a random respawn position
	$path/path_follow.set_offset(randi())
	
	# Respawn the friend
	var friend = friend_scene.instance()
	friend.global_position = $path/path_follow.global_position
	get_tree().root.add_child(friend)
