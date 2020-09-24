extends KinematicBody2D

export var traveling_speed: int = 1500

func _ready():
	set_physics_process(false)

func die():
	set_physics_process(true)

func _physics_process(delta):
	move_and_collide(Vector2(1.0, 0.0).normalized() * 500 * delta)
