extends KinematicBody2D

onready var player = get_node("/root/main_scene/player")

export var to_right: bool = true
var velocity: Vector2

func ready():
	if to_right:
		velocity = Vector2(1.0, 0.0)
	else:
		velocity = Vector2(-1.0, 0.0)

func _physics_process(delta):
	move_and_collide(velocity * max(player.base_traveling_speed - player.traveling_speed, 0) * delta)
