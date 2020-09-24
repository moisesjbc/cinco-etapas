extends Node2D

onready var friend_scene = preload("res://scenes/friend/friend.tscn")


func _on_respawn_timer_timeout():
	# Set a random respawn position
	$path/path_follow.set_offset(randi())
	
	# Respawn the friend
	var friend = friend_scene.instance()
	friend.position = $path/path_follow.position
	add_child(friend)
