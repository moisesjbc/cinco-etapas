extends KinematicBody2D

export var speed: int = 200
onready var player = get_node("/root/main_scene/player")

func _physics_process(delta):
	move_and_collide(Vector2(1.0, 0.0) * max(player.base_speed - player.speed, 0) * delta)
