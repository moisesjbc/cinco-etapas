extends KinematicBody2D

onready var player = get_node("/root/main_scene/player")

func _physics_process(delta):
	move_and_collide(Vector2(1.0, 0.0) * max(player.base_traveling_speed - player.traveling_speed, 0) * delta)
