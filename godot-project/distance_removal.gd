extends Node2D

export var distance_threshold: int = 1000
onready var player = get_node("/root/main_scene/player")

func _physics_process(delta):
	if get_parent().global_position.distance_to(player.global_position) > distance_threshold:
		get_parent().queue_free()
